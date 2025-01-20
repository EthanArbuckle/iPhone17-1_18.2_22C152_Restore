@interface ETKissMessage
+ (id)_kissColor;
+ (unsigned)messageType;
- (BOOL)_hasKissesThatLeaveMark;
- (BOOL)_leaveMarkAtDelay:(double)a3;
- (BOOL)reachedSizeLimit;
- (ETKissMessage)init;
- (ETKissMessage)initWithArchiveData:(id)a3;
- (double)messageDuration;
- (id)archiveData;
- (id)messageTypeAsString;
- (void)_displayKissAtPoint:(CGPoint)a3 angle:(double)a4 leavesMark:(BOOL)a5 inScene:(id)a6;
- (void)_initAtlas;
- (void)_notifyDelegateDidStopPlaying;
- (void)_notifyDelegateWillStopPlaying;
- (void)_setKissLeavesMark:(id)a3;
- (void)addKissAtNormalizedPoint:(CGPoint)a3 angle:(double)a4 time:(double)a5 toScene:(id)a6;
- (void)displayInScene:(id)a3;
- (void)setParentMessage:(id)a3;
- (void)stopPlaying;
@end

@implementation ETKissMessage

+ (unsigned)messageType
{
  return 9;
}

+ (id)_kissColor
{
  if (_kissColor_onceToken != -1) {
    dispatch_once(&_kissColor_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_kissColor_color;

  return v2;
}

uint64_t __27__ETKissMessage__kissColor__block_invoke()
{
  _kissColor_color = [MEMORY[0x263F1C550] colorWithRed:0.87 green:0.0 blue:0.52 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

- (ETKissMessage)init
{
  v13.receiver = self;
  v13.super_class = (Class)ETKissMessage;
  v2 = [(ETMessage *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    points = v2->_points;
    v2->_points = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    angles = v2->_angles;
    v2->_angles = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    delays = v2->_delays;
    v2->_delays = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    kissMarkNodes = v2->_kissMarkNodes;
    v2->_kissMarkNodes = (NSMutableSet *)v9;

    v11 = v2;
  }

  return v2;
}

- (ETKissMessage)initWithArchiveData:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ETKissMessage;
  uint64_t v5 = [(ETMessage *)&v47 initWithArchiveData:v4];
  if (v5)
  {
    v6 = [[ETPKiss alloc] initWithData:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([(ETPKiss *)v6 hasPoints]
        && [(ETPKiss *)v7 hasAngles]
        && [(ETPKiss *)v7 hasDelays])
      {
        v8 = [(ETPKiss *)v7 points];
        unint64_t v43 = [v8 length];
        unint64_t v9 = v43 >> 2;
        id v40 = v8;
        v10 = (unsigned int *)[v40 bytes];
        v11 = [(ETPKiss *)v7 angles];
        unint64_t v12 = [v11 length];
        id v39 = v11;
        objc_super v13 = (unsigned __int16 *)[v39 bytes];
        v14 = [(ETPKiss *)v7 delays];
        unint64_t v15 = [v14 length];
        id v38 = v14;
        uint64_t v16 = [v38 bytes];
        v17 = 0;
        if (v43 >> 2 == v12 >> 1 && v9 == v15 >> 1)
        {
          v37 = v7;
          if (v43 >= 4)
          {
            v18 = (unsigned __int16 *)v16;
            if (v9 <= 1) {
              uint64_t v19 = 1;
            }
            else {
              uint64_t v19 = v43 >> 2;
            }
            __asm { FMOV            V0.2D, #-1.0 }
            float64x2_t v41 = _Q0;
            float64x2_t v42 = (float64x2_t)vdupq_n_s64(0x40DFFFC000000000uLL);
            do
            {
              unsigned int v25 = *v10++;
              v26.i64[0] = (unsigned __int16)v25;
              v26.i64[1] = vshr_n_u32((uint32x2_t)vdup_n_s32(v25), 0x10uLL).u32[1];
              *(float64x2_t *)buf = vaddq_f64(vdivq_f64(vcvtq_f64_s64(v26), v42), v41);
              points = v5->_points;
              v28 = objc_msgSend(MEMORY[0x263F08D40], "value:withObjCType:", buf, "{CGPoint=dd}", v37);
              [(NSMutableArray *)points addObject:v28];

              unsigned int v29 = *v13++;
              double v45 = (double)v29 / 1000.0;
              angles = v5->_angles;
              v31 = [MEMORY[0x263F08D40] value:&v45 withObjCType:"d"];
              [(NSMutableArray *)angles addObject:v31];

              unsigned int v32 = *v18++;
              double v44 = (double)v32 / 1000.0;
              delays = v5->_delays;
              v34 = [MEMORY[0x263F08D40] value:&v44 withObjCType:"d"];
              [(NSMutableArray *)delays addObject:v34];

              --v19;
            }
            while (v19);
          }
          v17 = v5;
          uint64_t v7 = v37;
        }

        goto LABEL_22;
      }
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23B55A000, v35, OS_LOG_TYPE_INFO, "Attempted to unarchive kiss that was missing points, angles, or delays.", buf, 2u);
        }
      }
    }
    v17 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v17 = 0;
LABEL_23:

  return v17;
}

- (id)archiveData
{
  v23 = objc_alloc_init(ETPKiss);
  uint64_t v3 = [(NSMutableArray *)self->_points count];
  id v4 = [MEMORY[0x263EFF990] data];
  [v4 setLength:4 * v3];
  id v22 = v4;
  uint64_t v5 = [v22 mutableBytes];
  v6 = [MEMORY[0x263EFF990] data];
  [v6 setLength:2 * v3];
  id v21 = v6;
  uint64_t v7 = [v21 mutableBytes];
  v8 = [MEMORY[0x263EFF990] data];
  [v8 setLength:2 * v3];
  id v20 = v8;
  uint64_t v9 = [v20 mutableBytes];
  if (v3)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    long long v24 = *MEMORY[0x263F00148];
    do
    {
      long long v27 = v24;
      unint64_t v12 = [(NSMutableArray *)self->_points objectAtIndexedSubscript:v11];
      [v12 getValue:&v27];

      float v13 = (*(double *)&v27 + 1.0) * 32767.0;
      unsigned int v14 = llroundf(v13);
      float v15 = (*((double *)&v27 + 1) + 1.0) * 32767.0;
      *(_DWORD *)(v5 + 4 * v11) = v14 | (llroundf(v15) << 16);
      double v26 = 0.0;
      uint64_t v16 = [(NSMutableArray *)self->_angles objectAtIndexedSubscript:v11];
      [v16 getValue:&v26];

      *(_WORD *)(v7 + 2 * v11) = (int)(v26 * 1000.0);
      double v25 = 0.0;
      v17 = [(NSMutableArray *)self->_delays objectAtIndexedSubscript:v11];
      [v17 getValue:&v25];

      *(_WORD *)(v10 + 2 * v11++) = llround(v25 * 1000.0);
    }
    while (v3 != v11);
  }
  [(ETPKiss *)v23 setPoints:v22];
  [(ETPKiss *)v23 setAngles:v21];
  [(ETPKiss *)v23 setDelays:v20];
  v18 = [(ETPKiss *)v23 data];

  return v18;
}

- (BOOL)_leaveMarkAtDelay:(double)a3
{
  return a3 < 0.3 && a3 > 0.0;
}

- (void)_initAtlas
{
  if (!self->_atlas)
  {
    uint64_t v3 = ETFrameworkBundle();
    ET_SKSetResourceBundle(v3);

    uint64_t v11 = 0;
    unint64_t v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v4 = (void *)getSKTextureClass_softClass_1;
    uint64_t v14 = getSKTextureClass_softClass_1;
    if (!getSKTextureClass_softClass_1)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getSKTextureClass_block_invoke_1;
      v10[3] = &unk_264DEC848;
      v10[4] = &v11;
      __getSKTextureClass_block_invoke_1((uint64_t)v10);
      id v4 = (void *)v12[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v11, 8);
    v6 = [v5 textureWithImageNamed:@"KissAtlas"];
    atlas = self->_atlas;
    self->_atlas = v6;

    v8 = [getSKUniformClass_1() uniformWithName:@"u_tex2" texture:self->_atlas];
    atlasUniform = self->_atlasUniform;
    self->_atlasUniform = v8;
  }
}

- (void)addKissAtNormalizedPoint:(CGPoint)a3 angle:(double)a4 time:(double)a5 toScene:(id)a6
{
  CGPoint v20 = a3;
  double lastKissTime = self->_lastKissTime;
  if (lastKissTime == 0.0) {
    double lastKissTime = a5;
  }
  double v18 = a5 - lastKissTime;
  double v19 = a4;
  self->_double lastKissTime = a5;
  delays = self->_delays;
  uint64_t v9 = (void *)MEMORY[0x263F08D40];
  id v10 = a6;
  uint64_t v11 = [v9 valueWithBytes:&v18 objCType:"d"];
  [(NSMutableArray *)delays addObject:v11];

  points = self->_points;
  uint64_t v13 = [MEMORY[0x263F08D40] valueWithBytes:&v20 objCType:"{CGPoint=dd}"];
  [(NSMutableArray *)points addObject:v13];

  angles = self->_angles;
  float v15 = [MEMORY[0x263F08D40] valueWithBytes:&v19 objCType:"d"];
  [(NSMutableArray *)angles addObject:v15];

  [(ETKissMessage *)self _initAtlas];
  -[ETMessage scenePointFromNormalizedPoint:inScene:](self, "scenePointFromNormalizedPoint:inScene:", v10, v20.x, v20.y);
  -[ETKissMessage _displayKissAtPoint:angle:leavesMark:inScene:](self, "_displayKissAtPoint:angle:leavesMark:inScene:", [(ETKissMessage *)self _leaveMarkAtDelay:v18], v10, v16, v17, v19);
}

- (BOOL)_hasKissesThatLeaveMark
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_delays;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v11 = 0.0;
        [v8 getValue:&v11];
        if ([(ETKissMessage *)self _leaveMarkAtDelay:v11])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)displayInScene:(id)a3
{
  id v4 = a3;
  self->_didDelegateWillStopPlaying = 0;
  self->_didDelegateDidStopPlaying = 0;
  [(ETKissMessage *)self _initAtlas];
  objc_initWeak(location, v4);
  objc_initWeak(&from, self);
  uint64_t v5 = self->_kissMarkNodes;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [(NSMutableArray *)self->_points count];
  long long v27 = v5;
  id v29 = v4;
  if (v7)
  {
    for (uint64_t i = 0; i != (char *)v7; ++i)
    {
      float64x2_t v41 = 0;
      BOOL v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_delays, "objectAtIndexedSubscript:", i, v27, v29);
      [v9 getValue:&v41];

      if (![(ETMessage *)self isRenderingOffscreen])
      {
        id v10 = [getSKActionClass_2() waitForDuration:*(double *)&v41];
        [v6 addObject:v10];
      }
      id SKActionClass_2 = getSKActionClass_2();
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __32__ETKissMessage_displayInScene___block_invoke;
      v38[3] = &unk_264DECE00;
      v38[4] = self;
      v40[1] = i;
      objc_copyWeak(&v39, &from);
      objc_copyWeak(v40, location);
      v40[2] = v41;
      long long v12 = [SKActionClass_2 runBlock:v38];
      [v6 addObject:v12];

      objc_destroyWeak(v40);
      objc_destroyWeak(&v39);
    }
  }
  if (![(ETMessage *)self isRenderingOffscreen])
  {
    BOOL v13 = [(ETKissMessage *)self _hasKissesThatLeaveMark];
    id v14 = getSKActionClass_2();
    double v15 = 0.3;
    if (v13) {
      double v15 = 1.0;
    }
    double v16 = [v14 waitForDuration:v15];
    [v6 addObject:v16];

    id v17 = getSKActionClass_2();
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __32__ETKissMessage_displayInScene___block_invoke_2;
    v35[3] = &unk_264DECE28;
    BOOL v37 = v13;
    objc_copyWeak(&v36, &from);
    uint64_t v18 = MEMORY[0x263EF83A0];
    id v19 = MEMORY[0x263EF83A0];
    CGPoint v20 = [v17 runBlock:v35 queue:v18];
    [v6 addObject:v20];

    id v21 = getSKActionClass_2();
    double v22 = 1.7;
    if (v13) {
      double v22 = 1.0;
    }
    v23 = [v21 waitForDuration:v22];
    [v6 addObject:v23];

    id v24 = getSKActionClass_2();
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __32__ETKissMessage_displayInScene___block_invoke_3;
    v31[3] = &unk_264DECE50;
    objc_copyWeak(&v33, &from);
    BOOL v34 = v13;
    id v32 = v28;
    double v25 = [v24 runBlock:v31];
    [v6 addObject:v25];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);
  }
  double v26 = [getSKActionClass_2() sequence:v6];
  [v30 runAction:v26];

  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __32__ETKissMessage_displayInScene___block_invoke(uint64_t a1)
{
  long long v16 = *MEMORY[0x263F00148];
  v2 = [*(id *)(*(void *)(a1 + 32) + 112) objectAtIndexedSubscript:*(void *)(a1 + 56)];
  [v2 getValue:&v16];

  double v15 = 0.0;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 120) objectAtIndexedSubscript:*(void *)(a1 + 56)];
  [v3 getValue:&v15];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (id *)(a1 + 48);
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained scenePointFromNormalizedPoint:v6 inScene:v16];
  double v8 = v7;
  double v10 = v9;

  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  double v12 = v15;
  uint64_t v13 = [*(id *)(a1 + 32) _leaveMarkAtDelay:*(double *)(a1 + 64)];
  id v14 = objc_loadWeakRetained(v5);
  objc_msgSend(v11, "_displayKissAtPoint:angle:leavesMark:inScene:", v13, v14, v8, v10, v12);
}

void __32__ETKissMessage_displayInScene___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = [WeakRetained parentMessage];
    id v4 = objc_loadWeakRetained((id *)(a1 + 32));
    [v3 childMessageDidDelayWisp:v4];
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 _notifyDelegateWillStopPlaying];
}

void __32__ETKissMessage_displayInScene___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained parentMessage];
  if (v4)
  {

LABEL_3:
    int64_t v5 = 0;
    goto LABEL_13;
  }
  int v6 = *(unsigned __int8 *)(v1 + 48);

  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v21 = v1;
  double v22 = v2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = *(id *)(v1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        id SKActionClass_2 = getSKActionClass_2();
        id v14 = [getSKActionClass_2() fadeOutWithDuration:0.25];
        v29[0] = v14;
        double v15 = [getSKActionClass_2() removeFromParent];
        v29[1] = v15;
        long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
        id v17 = [SKActionClass_2 sequence:v16];
        [v12 runAction:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  int64_t v5 = 1000000000;
  uint64_t v1 = v21;
  v2 = v22;
LABEL_13:
  if (!*(unsigned char *)(v1 + 48)
    || (id v18 = objc_loadWeakRetained(v2),
        [v18 parentMessage],
        id v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    dispatch_time_t v20 = dispatch_time(0, v5);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__ETKissMessage_displayInScene___block_invoke_4;
    block[3] = &unk_264DECC38;
    objc_copyWeak(&v24, v2);
    dispatch_after(v20, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v24);
  }
}

void __32__ETKissMessage_displayInScene___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateDidStopPlaying];
}

- (void)_setKissLeavesMark:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setLeavesMark:1];
    [(NSMutableSet *)self->_kissMarkNodes addObject:v4];
  }
}

- (void)_displayKissAtPoint:(CGPoint)a3 angle:(double)a4 leavesMark:(BOOL)a5 inScene:(id)a6
{
  BOOL v6 = a5;
  double y = a3.y;
  double x = a3.x;
  v64[2] = *MEMORY[0x263EF8340];
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastKiss);

  if (WeakRetained) {
    BOOL v13 = v6;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13
    && (id v14 = objc_loadWeakRetained((id *)&self->_lastKiss),
        char v15 = [v14 leavesMark],
        v14,
        (v15 & 1) == 0))
  {
    id v43 = objc_loadWeakRetained((id *)&self->_lastKiss);
    [(ETKissMessage *)self _setKissLeavesMark:v43];
  }
  else
  {
    long long v16 = ETFrameworkBundle();
    ET_SKSetResourceBundle(v16);

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    id v17 = (void *)getSKShaderClass_softClass_1;
    uint64_t v62 = getSKShaderClass_softClass_1;
    if (!getSKShaderClass_softClass_1)
    {
      uint64_t v54 = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      uint64_t v56 = (uint64_t)__getSKShaderClass_block_invoke_1;
      double v57 = COERCE_DOUBLE(&unk_264DEC848);
      v58 = &v59;
      __getSKShaderClass_block_invoke_1((uint64_t)&v54);
      id v17 = (void *)v60[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v59, 8);
    id v19 = [v18 shaderWithFileNamed:@"kiss"];
    dispatch_time_t v20 = [getSKUniformClass_1() uniformWithName:@"u_shader_time" float:0.0];
    v64[0] = self->_atlasUniform;
    v64[1] = v20;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
    [v19 setUniforms:v21];

    double v22 = [MEMORY[0x263F1C550] clearColor];
    v23 = +[KissNode kissNodeWithColor:size:](KissNode, "kissNodeWithColor:size:", v22, 256.0, 256.0);

    [v23 setShader:v19];
    id v24 = +[ETKissMessage _kissColor];
    [v23 setColor:v24];

    [v23 setColorBlendFactor:1.0];
    [v23 setBlendMode:1];
    objc_msgSend(v23, "setPosition:", x, y);
    [v23 setZRotation:a4 + 0.175];
    [v11 size];
    double v26 = v25 / 156.0;
    if (v26 <= 1.0) {
      double v27 = 0.35;
    }
    else {
      double v27 = v26 * 0.35;
    }
    [v23 setScale:v27];
    long long v28 = [v23 node];
    [v11 addChild:v28];

    if (v13)
    {
      [(ETKissMessage *)self _setKissLeavesMark:v23];
      id v29 = objc_loadWeakRetained((id *)&self->_lastKiss);
      [(ETKissMessage *)self _setKissLeavesMark:v29];
    }
    objc_storeWeak((id *)&self->_lastKiss, v23);
    uint64_t v54 = 0;
    uint64_t v55 = (uint64_t)&v54;
    uint64_t v56 = 0x2020000000;
    double v57 = 0.0;
    double v30 = 0.0;
    if (!v13)
    {
      BOOL v31 = [(ETMessage *)self isRenderingOffscreen];
      double v30 = 0.3;
      if (!v31) {
        double v30 = 0.0;
      }
    }
    double v57 = 1.0 - v30;
    id SKActionClass_2 = getSKActionClass_2();
    double v33 = *(double *)(v55 + 24);
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke;
    v52[3] = &unk_264DECC88;
    id v34 = v20;
    id v53 = v34;
    v35 = [SKActionClass_2 customActionWithDuration:v52 actionBlock:v33];
    [v23 runAction:v35];

    if (([v23 leavesMark] & 1) == 0)
    {
      id v36 = getSKActionClass_2();
      BOOL v37 = [getSKActionClass_2() waitForDuration:1.0];
      v63[0] = v37;
      id v38 = getSKActionClass_2();
      uint64_t v44 = MEMORY[0x263EF8330];
      uint64_t v45 = 3221225472;
      v46 = __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke_2;
      objc_super v47 = &unk_264DECE78;
      v48 = self;
      id v39 = v23;
      id v49 = v39;
      v51 = &v54;
      id v50 = v34;
      id v40 = [v38 runBlock:&v44];
      v63[1] = v40;
      float64x2_t v41 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v63, 2, v44, v45, v46, v47, v48);
      float64x2_t v42 = [v36 sequence:v41];
      [v39 runAction:v42];
    }
    _Block_object_dispose(&v54, 8);
  }
}

uint64_t __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return [*(id *)(a1 + 32) setFloatValue:a2];
}

uint64_t __62__ETKissMessage__displayKissAtPoint_angle_leavesMark_inScene___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isRenderingOffscreen];
  uint64_t result = [*(id *)(a1 + 40) leavesMark];
  if (v2)
  {
    if (result && *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 1.0)
    {
      id v4 = *(void **)(a1 + 48);
      [v4 floatValue];
      double v6 = 1.0 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + v5;
      *(float *)&double v6 = v6;
      return [v4 setFloatValue:v6];
    }
  }
  else if ((result & 1) == 0)
  {
    id v7 = *(void **)(a1 + 40);
    return [v7 removeFromParent];
  }
  return result;
}

- (void)_notifyDelegateDidStopPlaying
{
  if (!self->_didDelegateDidStopPlaying)
  {
    self->_didDelegateDidStopPlaying = 1;
    id v3 = [(ETMessage *)self delegate];
    [v3 messageDidStopPlaying:self];
  }
}

- (void)_notifyDelegateWillStopPlaying
{
  if (!self->_didDelegateWillStopPlaying)
  {
    self->_didDelegateWillStopPlaying = 1;
    id v3 = [(ETMessage *)self delegate];
    [v3 messageWillStopPlaying:self];
  }
}

- (void)stopPlaying
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v2 = self->_kissMarkNodes;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id SKActionClass_2 = getSKActionClass_2();
        uint64_t v8 = [getSKActionClass_2() fadeOutWithDuration:0.25];
        v21[0] = v8;
        uint64_t v9 = [getSKActionClass_2() removeFromParent];
        v21[1] = v9;
        uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
        id v11 = [SKActionClass_2 sequence:v10];
        [v6 runAction:v11];
      }
      uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v3);
  }

  [(NSMutableSet *)self->_kissMarkNodes removeAllObjects];
  [(ETKissMessage *)self _notifyDelegateWillStopPlaying];
  objc_initWeak(&location, self);
  if ([(ETMessage *)self missedDuringPlayback])
  {
    [(ETKissMessage *)self _notifyDelegateDidStopPlaying];
  }
  else
  {
    dispatch_time_t v12 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__ETKissMessage_stopPlaying__block_invoke;
    block[3] = &unk_264DECC38;
    objc_copyWeak(&v15, &location);
    dispatch_after(v12, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);
}

void __28__ETKissMessage_stopPlaying__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateDidStopPlaying];
}

- (id)messageTypeAsString
{
  return @"Kiss";
}

- (double)messageDuration
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v2 = self->_delays;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v11 = 0.0;
        [v8 getValue:&v11];
        double v6 = v6 + v11;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
    double v9 = v6 + 1.0 + 0.25;
  }
  else
  {
    double v9 = 1.25;
  }

  return v9;
}

- (BOOL)reachedSizeLimit
{
  return (unint64_t)[(NSMutableArray *)self->_points count] > 0x63;
}

- (void)setParentMessage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ETKissMessage;
  [(ETMessage *)&v4 setParentMessage:a3];
  [(ETMessage *)self setDelayWisp:1];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastKiss);
  objc_storeStrong((id *)&self->_kissMarkNodes, 0);
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_angles, 0);
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_atlasUniform, 0);

  objc_storeStrong((id *)&self->_atlas, 0);
}

@end