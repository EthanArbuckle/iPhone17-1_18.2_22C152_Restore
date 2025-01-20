@interface ETAngerMessage
+ (unsigned)messageType;
- (CGPoint)normalizedCenter;
- (ETAngerMessage)init;
- (ETAngerMessage)initWithArchiveData:(id)a3;
- (double)duration;
- (double)messageDuration;
- (id)archiveData;
- (id)messageTypeAsString;
- (void)_updateCenterFromNormalizedPoint:(CGPoint)a3 inScene:(id)a4;
- (void)displayInScene:(id)a3;
- (void)setDuration:(double)a3;
- (void)setNormalizedCenter:(CGPoint)a3;
- (void)setNormalizedPoint:(CGPoint)a3 atRelativeTime:(double)a4 inScene:(id)a5;
- (void)stopPlaying;
@end

@implementation ETAngerMessage

+ (unsigned)messageType
{
  return 10;
}

- (ETAngerMessage)init
{
  v9.receiver = self;
  v9.super_class = (Class)ETAngerMessage;
  v2 = [(ETMessage *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    points = v2->_points;
    v2->_points = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    delays = v2->_delays;
    v2->_delays = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (ETAngerMessage)initWithArchiveData:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ETAngerMessage;
  uint64_t v5 = [(ETMessage *)&v42 initWithArchiveData:v4];
  if (v5)
  {
    v6 = [[ETPAnger alloc] initWithData:v4];
    v7 = v6;
    if (v6
      && [(ETPAnger *)v6 hasDuration]
      && [(ETPAnger *)v7 hasNormalizedCenterX]
      && [(ETPAnger *)v7 hasNormalizedCenterY])
    {
      [(ETPAnger *)v7 duration];
      v5->_duration = v8;
      [(ETPAnger *)v7 normalizedCenterX];
      CGFloat v10 = v9;
      [(ETPAnger *)v7 normalizedCenterY];
      v5->_normalizedCenter.x = v10;
      v5->_normalizedCenter.y = v11;
      if (![(ETPAnger *)v7 hasPoints])
      {
LABEL_17:
        v33 = v5;
LABEL_21:

        goto LABEL_22;
      }
      v12 = [(ETPAnger *)v7 points];
      unint64_t v13 = [v12 length];
      id v14 = v12;
      uint64_t v39 = [v14 bytes];
      v15 = [(ETPAnger *)v7 delays];
      unint64_t v16 = [v15 length];
      id v17 = v15;
      uint64_t v18 = [v17 bytes];
      if (v13 >> 2 == v16 >> 1)
      {
        v35 = v17;
        v36 = v14;
        if (v13 >= 4)
        {
          uint64_t v19 = v18;
          uint64_t v20 = 0;
          if (v13 >> 2 <= 1) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v13 >> 2;
          }
          __asm { FMOV            V0.2D, #-1.0 }
          float64x2_t v37 = _Q0;
          float64x2_t v38 = (float64x2_t)vdupq_n_s64(0x40DFFFC000000000uLL);
          do
          {
            v27.i64[0] = (unsigned __int16)*(_DWORD *)(v39 + 4 * v20);
            v27.i64[1] = vshr_n_u32((uint32x2_t)vdup_n_s32(*(_DWORD *)(v39 + 4 * v20)), 0x10uLL).u32[1];
            float64x2_t v41 = vaddq_f64(vdivq_f64(vcvtq_f64_s64(v27), v38), v37);
            if (!v20) {
              v5->_normalizedCenter = (CGPoint)v41;
            }
            points = v5->_points;
            v29 = [MEMORY[0x263F08D40] value:&v41 withObjCType:"{CGPoint=dd}"];
            [(NSMutableArray *)points addObject:v29];

            LOWORD(v30) = *(_WORD *)(v19 + 2 * v20);
            double v40 = (double)v30 / 1000.0;
            delays = v5->_delays;
            v32 = [MEMORY[0x263F08D40] value:&v40 withObjCType:"d"];
            [(NSMutableArray *)delays addObject:v32];

            ++v20;
          }
          while (v21 != v20);
        }

        goto LABEL_17;
      }
    }
    v33 = 0;
    goto LABEL_21;
  }
  v33 = 0;
LABEL_22:

  return v33;
}

- (id)archiveData
{
  uint64_t v3 = objc_alloc_init(ETPAnger);
  double duration = self->_duration;
  *(float *)&double duration = duration;
  [(ETPAnger *)v3 setDuration:duration];
  CGFloat x = self->_normalizedCenter.x;
  *(float *)&CGFloat x = x;
  [(ETPAnger *)v3 setNormalizedCenterX:x];
  CGFloat y = self->_normalizedCenter.y;
  *(float *)&CGFloat y = y;
  [(ETPAnger *)v3 setNormalizedCenterY:y];
  uint64_t v7 = [(NSMutableArray *)self->_points count];
  float v8 = [MEMORY[0x263EFF990] data];
  [v8 setLength:4 * v7];
  id v22 = v8;
  uint64_t v9 = [v22 mutableBytes];
  CGFloat v10 = [MEMORY[0x263EFF990] data];
  [v10 setLength:2 * v7];
  id v11 = v10;
  uint64_t v12 = [v11 mutableBytes];
  if (v7)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    long long v23 = *MEMORY[0x263F00148];
    do
    {
      long long v25 = v23;
      v15 = [(NSMutableArray *)self->_points objectAtIndexedSubscript:v14];
      [v15 getValue:&v25];

      float v16 = (*(double *)&v25 + 1.0) * 32767.0;
      unsigned int v17 = llroundf(v16);
      float v18 = (*((double *)&v25 + 1) + 1.0) * 32767.0;
      *(_DWORD *)(v9 + 4 * v14) = v17 | (llroundf(v18) << 16);
      double v24 = 0.0;
      uint64_t v19 = [(NSMutableArray *)self->_delays objectAtIndexedSubscript:v14];
      [v19 getValue:&v24];

      *(_WORD *)(v13 + 2 * v14++) = llround(v24 * 1000.0);
    }
    while (v7 != v14);
  }
  [(ETPAnger *)v3 setPoints:v22];
  [(ETPAnger *)v3 setDelays:v11];
  uint64_t v20 = [(ETPAnger *)v3 data];

  return v20;
}

- (void)displayInScene:(id)a3
{
  v81[2] = *MEMORY[0x263EF8340];
  id val = a3;
  ETFrameworkBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id location = 0;
  p_id location = &location;
  uint64_t v78 = 0x2020000000;
  uint64_t v5 = (void (*)(id))getSKSetResourceBundleSymbolLoc_ptr_1;
  v79 = getSKSetResourceBundleSymbolLoc_ptr_1;
  if (!getSKSetResourceBundleSymbolLoc_ptr_1)
  {
    *(void *)&long long v72 = MEMORY[0x263EF8330];
    *((void *)&v72 + 1) = 3221225472;
    v73 = __getSKSetResourceBundleSymbolLoc_block_invoke_1;
    v74 = &unk_264DEC848;
    v75 = &location;
    v6 = (void *)SpriteKitLibrary_1();
    p_location[3] = dlsym(v6, "SKSetResourceBundle");
    getSKSetResourceBundleSymbolLoc_ptr_1 = (_UNKNOWN *)*((void *)v75[1] + 3);
    uint64_t v5 = (void (*)(id))p_location[3];
  }
  _Block_object_dispose(&location, 8);
  if (!v5) {
    -[ETMessage displayInScene:]();
  }
  v5(v4);

  v58 = [getSKUniformClass_0() uniformWithName:@"u_shader_time" float:0.0];
  id location = 0;
  p_id location = &location;
  uint64_t v78 = 0x2050000000;
  id v7 = (id)getSKTextureClass_softClass_0;
  v79 = (void *)getSKTextureClass_softClass_0;
  if (!getSKTextureClass_softClass_0)
  {
    *(void *)&long long v72 = MEMORY[0x263EF8330];
    *((void *)&v72 + 1) = 3221225472;
    v73 = __getSKTextureClass_block_invoke_0;
    v74 = &unk_264DEC848;
    v75 = &location;
    __getSKTextureClass_block_invoke_0((uint64_t)&v72);
    id v7 = p_location[3];
  }
  id v8 = v7;
  _Block_object_dispose(&location, 8);
  v57 = [v8 textureWithImageNamed:@"angerAtlas"];
  v56 = [getSKUniformClass_0() uniformWithName:@"u_tex2" texture:v57];
  id location = 0;
  p_id location = &location;
  uint64_t v78 = 0x2050000000;
  id v9 = (id)getSKShaderClass_softClass_0;
  v79 = (void *)getSKShaderClass_softClass_0;
  if (!getSKShaderClass_softClass_0)
  {
    *(void *)&long long v72 = MEMORY[0x263EF8330];
    *((void *)&v72 + 1) = 3221225472;
    v73 = __getSKShaderClass_block_invoke_0;
    v74 = &unk_264DEC848;
    v75 = &location;
    __getSKShaderClass_block_invoke_0((uint64_t)&v72);
    id v9 = p_location[3];
  }
  id v10 = v9;
  _Block_object_dispose(&location, 8);
  v59 = [v10 shaderWithFileNamed:@"anger"];
  v81[0] = v56;
  v81[1] = v58;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
  [v59 setUniforms:v11];

  [val size];
  double v13 = v12;
  id location = 0;
  p_id location = &location;
  uint64_t v78 = 0x2050000000;
  id v14 = (id)getSKSpriteNodeClass_softClass_1;
  v79 = (void *)getSKSpriteNodeClass_softClass_1;
  if (!getSKSpriteNodeClass_softClass_1)
  {
    *(void *)&long long v72 = MEMORY[0x263EF8330];
    *((void *)&v72 + 1) = 3221225472;
    v73 = __getSKSpriteNodeClass_block_invoke_1;
    v74 = &unk_264DEC848;
    v75 = &location;
    __getSKSpriteNodeClass_block_invoke_1((uint64_t)&v72);
    id v14 = p_location[3];
  }
  id v15 = v14;
  _Block_object_dispose(&location, 8);
  float v16 = [MEMORY[0x263F1C550] clearColor];
  unsigned int v17 = [v16 colorSpaceConvertedColor];
  double v18 = fmin(v13, 272.0);
  objc_msgSend(v15, "spriteNodeWithColor:size:", v17, v18, v18 / 272.0 * 340.0);
  uint64_t v19 = (SKSpriteNode *)objc_claimAutoreleasedReturnValue();
  p_anger = &self->_anger;
  anger = self->_anger;
  self->_anger = v19;

  [(SKSpriteNode *)self->_anger setShader:v59];
  id v22 = self->_anger;
  long long v23 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  double v24 = [v23 colorSpaceConvertedColor];
  [(SKSpriteNode *)v22 setColor:v24];

  [(SKSpriteNode *)self->_anger setColorBlendFactor:1.0];
  [(SKSpriteNode *)self->_anger setBlendMode:1];
  -[ETAngerMessage _updateCenterFromNormalizedPoint:inScene:](self, "_updateCenterFromNormalizedPoint:inScene:", val, self->_normalizedCenter.x, self->_normalizedCenter.y);
  [val size];
  double v26 = v25 / 156.0;
  if (v26 <= 1.0) {
    double v27 = 0.5;
  }
  else {
    double v27 = v26 * 0.5;
  }
  [(SKSpriteNode *)self->_anger setScale:v27];
  [val addChild:*p_anger];
  v28 = *p_anger;
  v29 = [getSKActionClass_1() fadeInWithDuration:0.2];
  [(SKSpriteNode *)v28 runAction:v29 withKey:@"fade"];

  unint64_t v30 = *p_anger;
  v31 = [getSKActionClass_1() scaleTo:1.5 duration:0.2];
  [(SKSpriteNode *)v30 runAction:v31 withKey:@"scale"];

  uint64_t v55 = 120;
  if (self->_duration != 0.0)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, val);
    if (![(ETMessage *)self isRenderingOffscreen])
    {
      v32 = [MEMORY[0x263EFF980] array];
      uint64_t v33 = [(NSMutableArray *)self->_points count];
      if (v33 >= 1)
      {
        uint64_t v34 = 0;
        long long v60 = *MEMORY[0x263F00148];
        do
        {
          long long v72 = v60;
          v35 = -[NSMutableArray objectAtIndexedSubscript:](self->_points, "objectAtIndexedSubscript:", v34, v55);
          [v35 getValue:&v72];

          double v70 = 0.0;
          v36 = [(NSMutableArray *)self->_delays objectAtIndexedSubscript:v34];
          [v36 getValue:&v70];

          float64x2_t v37 = [getSKActionClass_1() waitForDuration:v70];
          [v32 addObject:v37];

          id SKActionClass_1 = getSKActionClass_1();
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __33__ETAngerMessage_displayInScene___block_invoke;
          v66[3] = &unk_264DECCF0;
          objc_copyWeak(&v67, &location);
          long long v69 = v72;
          objc_copyWeak(&v68, &from);
          uint64_t v39 = [SKActionClass_1 runBlock:v66];
          [v32 addObject:v39];

          objc_destroyWeak(&v68);
          objc_destroyWeak(&v67);
          ++v34;
        }
        while (v33 != v34);
      }
      double v40 = self->_anger;
      float64x2_t v41 = [getSKActionClass_1() sequence:v32];
      [(SKSpriteNode *)v40 runAction:v41];

      objc_super v42 = self->_anger;
      id v43 = getSKActionClass_1();
      v44 = [getSKActionClass_1() waitForDuration:*(double *)((char *)&self->super.super.isa + v55) + 0.2];
      v80[0] = v44;
      id v45 = getSKActionClass_1();
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __33__ETAngerMessage_displayInScene___block_invoke_2;
      v64[3] = &unk_264DECC38;
      objc_copyWeak(&v65, &location);
      uint64_t v46 = MEMORY[0x263EF83A0];
      id v47 = MEMORY[0x263EF83A0];
      v48 = [v45 runBlock:v64 queue:v46];
      v80[1] = v48;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
      v50 = [v43 sequence:v49];
      [(SKSpriteNode *)v42 runAction:v50];

      objc_destroyWeak(&v65);
    }
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v51 = self->_anger;
  id v52 = getSKActionClass_1();
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __33__ETAngerMessage_displayInScene___block_invoke_3;
  v62[3] = &unk_264DECC88;
  id v63 = v58;
  id v53 = v58;
  v54 = [v52 customActionWithDuration:v62 actionBlock:(double)10 + 0.2 + 0.2];
  [(SKSpriteNode *)v51 runAction:v54];
}

void __33__ETAngerMessage_displayInScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCenterFromNormalizedPoint:inScene:", v2, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __33__ETAngerMessage_displayInScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopPlaying];
}

uint64_t __33__ETAngerMessage_displayInScene___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 floatValue];
  double v3 = v2 + 0.01666;
  *(float *)&double v3 = v3;

  return [v1 setFloatValue:v3];
}

- (void)_updateCenterFromNormalizedPoint:(CGPoint)a3 inScene:(id)a4
{
  anger = self->_anger;
  -[ETMessage scenePointFromNormalizedPoint:inScene:](self, "scenePointFromNormalizedPoint:inScene:", a4, a3.x, a3.y);

  -[SKSpriteNode setPosition:](anger, "setPosition:");
}

- (void)stopPlaying
{
  v28[2] = *MEMORY[0x263EF8340];
  double v3 = [(ETMessage *)self delegate];
  [v3 messageWillStopPlaying:self];
  [(SKSpriteNode *)self->_anger removeAllActions];
  anger = self->_anger;
  id SKActionClass_1 = getSKActionClass_1();
  v6 = [getSKActionClass_1() fadeOutWithDuration:0.2];
  v28[0] = v6;
  id v7 = [getSKActionClass_1() removeFromParent];
  v28[1] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  id v9 = [SKActionClass_1 sequence:v8];
  [(SKSpriteNode *)anger runAction:v9 withKey:@"fade"];

  id v10 = self->_anger;
  id v11 = [getSKActionClass_1() scaleTo:0.0 duration:0.2];
  [(SKSpriteNode *)v10 runAction:v11 withKey:@"scale"];

  objc_initWeak(&location, self->_anger);
  double v12 = self->_anger;
  id v13 = getSKActionClass_1();
  id v14 = [getSKActionClass_1() waitForDuration:0.2];
  v27[0] = v14;
  id v15 = getSKActionClass_1();
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __29__ETAngerMessage_stopPlaying__block_invoke;
  v24[3] = &unk_264DECC38;
  objc_copyWeak(&v25, &location);
  float v16 = [v15 runBlock:v24];
  v27[1] = v16;
  unsigned int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  double v18 = [v13 sequence:v17];
  [(SKSpriteNode *)v12 runAction:v18];

  uint64_t v19 = [(SKSpriteNode *)self->_anger parent];
  LODWORD(v14) = v19 == 0;

  if (v14)
  {
    [v3 messageDidStopPlaying:self];
  }
  else
  {
    dispatch_time_t v20 = dispatch_time(0, 1000000000);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __29__ETAngerMessage_stopPlaying__block_invoke_2;
    v21[3] = &unk_264DEC7B0;
    id v22 = v3;
    long long v23 = self;
    dispatch_after(v20, MEMORY[0x263EF83A0], v21);
  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __29__ETAngerMessage_stopPlaying__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeFromParent];
}

uint64_t __29__ETAngerMessage_stopPlaying__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) messageDidStopPlaying:*(void *)(a1 + 40)];
}

- (void)setNormalizedPoint:(CGPoint)a3 atRelativeTime:(double)a4 inScene:(id)a5
{
  CGPoint v13 = a3;
  double v12 = a4;
  delays = self->_delays;
  id v7 = (void *)MEMORY[0x263F08D40];
  id v8 = a5;
  id v9 = [v7 valueWithBytes:&v12 objCType:"d"];
  [(NSMutableArray *)delays addObject:v9];

  points = self->_points;
  id v11 = [MEMORY[0x263F08D40] valueWithBytes:&v13 objCType:"{CGPoint=dd}"];
  [(NSMutableArray *)points addObject:v11];

  -[ETAngerMessage _updateCenterFromNormalizedPoint:inScene:](self, "_updateCenterFromNormalizedPoint:inScene:", v8, v13.x, v13.y);
}

- (id)messageTypeAsString
{
  return @"Anger";
}

- (double)messageDuration
{
  return self->_duration + 0.2 + 0.2;
}

- (CGPoint)normalizedCenter
{
  double x = self->_normalizedCenter.x;
  double y = self->_normalizedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNormalizedCenter:(CGPoint)a3
{
  self->_normalizedCenter = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_points, 0);

  objc_storeStrong((id *)&self->_anger, 0);
}

@end