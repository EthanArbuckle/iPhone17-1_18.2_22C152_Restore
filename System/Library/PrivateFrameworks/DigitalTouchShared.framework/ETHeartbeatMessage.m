@interface ETHeartbeatMessage
+ (unsigned)messageType;
- (BOOL)isBroken;
- (CGPoint)normalizedCenter;
- (ETHeartbeatMessage)initWithArchiveData:(id)a3;
- (double)heartbreakTime;
- (double)messageDuration;
- (double)rotation;
- (float)beatsPerMinute;
- (float)scale;
- (id)archiveData;
- (id)description;
- (id)messageTypeAsString;
- (int)duration;
- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4;
- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4 fastStart:(BOOL)a5;
- (void)breakHeart;
- (void)displayInScene:(id)a3;
- (void)moveHeartNodeByX:(double)a3 y:(double)a4 duration:(double)a5;
- (void)playBeatWithDuration:(double)a3;
- (void)setBeatsPerMinute:(float)a3;
- (void)setDuration:(int)a3;
- (void)setMute:(BOOL)a3;
- (void)setNormalizedCenter:(CGPoint)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(float)a3;
- (void)startHeartbeat:(id)a3;
- (void)startHeartbeat:(id)a3 fastStart:(BOOL)a4;
- (void)stopPlaying;
@end

@implementation ETHeartbeatMessage

+ (unsigned)messageType
{
  return 2;
}

- (ETHeartbeatMessage)initWithArchiveData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ETHeartbeatMessage;
  v5 = [(ETMessage *)&v14 initWithArchiveData:v4];
  if (!v5)
  {
LABEL_11:
    v7 = v5;
    goto LABEL_12;
  }
  v6 = [[ETPHeartbeat alloc] initWithData:v4];
  v7 = (ETHeartbeatMessage *)v6;
  if (v6)
  {
    [(ETPHeartbeat *)v6 beatsPerMinute];
    -[ETHeartbeatMessage setBeatsPerMinute:](v5, "setBeatsPerMinute:");
    [(ETHeartbeatMessage *)v5 setDuration:[(ETHeartbeatMessage *)v7 duration]];
    if ([(ETHeartbeatMessage *)v7 hasNormalizedCenterX]
      && [(ETHeartbeatMessage *)v7 hasNormalizedCenterY])
    {
      [(ETHeartbeatMessage *)v7 normalizedCenterX];
      CGFloat v9 = v8;
      [(ETHeartbeatMessage *)v7 normalizedCenterY];
      v5->_normalizedCenter.x = v9;
      v5->_normalizedCenter.y = v10;
    }
    if ([(ETHeartbeatMessage *)v7 hasRotation])
    {
      [(ETHeartbeatMessage *)v7 rotation];
      v5->_rotation = v11;
    }
    if ([(ETHeartbeatMessage *)v7 hasHeartbreakTime])
    {
      [(ETHeartbeatMessage *)v7 heartbreakTime];
      v5->_heartbreakTime = v12;
    }

    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (id)archiveData
{
  v3 = objc_alloc_init(ETPHeartbeat);
  *(float *)&double v4 = self->_beatsPerMinute;
  [(ETPHeartbeat *)v3 setBeatsPerMinute:v4];
  [(ETPHeartbeat *)v3 setDuration:self->_duration];
  CGFloat x = self->_normalizedCenter.x;
  *(float *)&CGFloat x = x;
  [(ETPHeartbeat *)v3 setNormalizedCenterX:x];
  CGFloat y = self->_normalizedCenter.y;
  *(float *)&CGFloat y = y;
  [(ETPHeartbeat *)v3 setNormalizedCenterY:y];
  double rotation = self->_rotation;
  *(float *)&double rotation = rotation;
  [(ETPHeartbeat *)v3 setRotation:rotation];
  double heartbreakTime = self->_heartbreakTime;
  *(float *)&double heartbreakTime = heartbreakTime;
  [(ETPHeartbeat *)v3 setHeartbreakTime:heartbreakTime];
  CGFloat v9 = [(ETPHeartbeat *)v3 data];

  return v9;
}

- (void)displayInScene:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, v4);
  [(ETHeartbeatMessage *)self _displayInScene:v4 useDuration:1];

  objc_destroyWeak(&location);
}

- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4
{
}

- (void)_displayInScene:(id)a3 useDuration:(BOOL)a4 fastStart:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v115 = a4;
  v145[5] = *MEMORY[0x263EF8340];
  id v120 = a3;
  [(ETHeartbeatMessage *)self beatsPerMinute];
  float v8 = v7;
  double v9 = 60.0 / v7;
  float v10 = v9 * 0.800000012;
  float v11 = fminf(v10, 0.75);
  *(float *)&double v9 = v9 - v11;
  float v12 = fmaxf(*(float *)&v9, 0.01);
  self->_hapticLoopPeriod = v11 + v12;
  self->_broken = 0;
  v13 = [getSKNodeClass() node];
  heartNode = self->_heartNode;
  self->_heartNode = v13;

  v15 = self->_heartNode;
  -[ETMessage scenePointFromNormalizedPoint:inScene:](self, "scenePointFromNormalizedPoint:inScene:", v120, self->_normalizedCenter.x, self->_normalizedCenter.y);
  -[SKNode setPosition:](v15, "setPosition:");
  [(SKNode *)self->_heartNode setZRotation:self->_rotation];
  [v120 size];
  double v17 = fmax(v16 / 156.0, 1.0);
  [(ETHeartbeatMessage *)self scale];
  double v18 = 0.5;
  if (v19 > 0.0)
  {
    [(ETHeartbeatMessage *)self scale];
    double v18 = v20;
  }
  [(SKNode *)self->_heartNode setScale:v17 * v18];
  ETFrameworkBundle();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x2020000000;
  v22 = (void (*)(id))getSKSetResourceBundleSymbolLoc_ptr_0;
  v137 = getSKSetResourceBundleSymbolLoc_ptr_0;
  if (!getSKSetResourceBundleSymbolLoc_ptr_0)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    uint64_t v130 = 3221225472;
    v131 = __getSKSetResourceBundleSymbolLoc_block_invoke_0;
    v132 = &unk_264DEC848;
    v133 = &v134;
    v23 = (void *)SpriteKitLibrary_0();
    v135[3] = (uint64_t)dlsym(v23, "SKSetResourceBundle");
    getSKSetResourceBundleSymbolLoc_ptr_0 = *(_UNKNOWN **)(v133[1] + 24);
    v22 = (void (*)(id))v135[3];
  }
  _Block_object_dispose(&v134, 8);
  if (!v22) {
    -[ETMessage displayInScene:]();
  }
  v22(v21);

  v119 = [getSKTextureClass() textureWithImageNamed:@"blends_heartToRndRect65"];
  v118 = objc_msgSend(getSKTextureClass(), "textureNoiseWithSmoothness:size:grayscale:", 1, 0.6, 268.0, 253.0);
  v24 = [getSKShaderClass() shaderWithFileNamed:@"heartLines"];
  linesShader = self->_linesShader;
  self->_linesShader = v24;

  v26 = [getSKUniformClass() uniformWithName:@"u_tex2" texture:v119];
  burTexUniform = self->_burTexUniform;
  self->_burTexUniform = v26;

  v28 = [getSKUniformClass() uniformWithName:@"u_tex3" texture:v118];
  noiseTexUniform = self->_noiseTexUniform;
  self->_noiseTexUniform = v28;

  id SKUniformClass = getSKUniformClass();
  *(float *)&double v31 = v8 / 60.0;
  v32 = [SKUniformClass uniformWithName:@"u_speed" float:v31];
  speedUniform = self->_speedUniform;
  self->_speedUniform = v32;

  v34 = [getSKUniformClass() uniformWithName:@"u_scale" float:0.0];
  scaleUniform = self->_scaleUniform;
  self->_scaleUniform = v34;

  v36 = [getSKUniformClass() uniformWithName:@"u_shader_time" float:0.0];
  shaderTimeUniform = self->_shaderTimeUniform;
  self->_shaderTimeUniform = v36;

  v38 = self->_noiseTexUniform;
  v145[0] = self->_burTexUniform;
  v145[1] = v38;
  v39 = self->_scaleUniform;
  v145[2] = self->_speedUniform;
  v145[3] = v39;
  v145[4] = self->_shaderTimeUniform;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v145 count:5];
  [(SKShader *)self->_linesShader setUniforms:v40];

  v41 = [getSKSpriteNodeClass() spriteNodeWithImageNamed:@"compositeHeart"];
  heartLines = self->_heartLines;
  self->_heartLines = v41;

  [(SKSpriteNode *)self->_heartLines setShader:self->_linesShader];
  v43 = [MEMORY[0x263F1C550] colorWithRed:0.9046 green:0.0 blue:0.0742 alpha:1.0];
  [(SKSpriteNode *)self->_heartLines setColor:v43];

  [(SKSpriteNode *)self->_heartLines setColorBlendFactor:1.0];
  [(SKSpriteNode *)self->_heartLines setBlendMode:5];
  [(SKSpriteNode *)self->_heartLines setScale:0.8];
  v44 = [getSKNodeClass() node];
  heartScale = self->_heartScale;
  self->_heartScale = v44;

  v46 = [getSKTextureClass() textureWithImageNamed:@"HeartbreakAtlas"];
  heartbreakAtlas = self->_heartbreakAtlas;
  self->_heartbreakAtlas = v46;

  v117 = [getSKTextureClass() textureWithImageNamed:@"warpedHeartAtlas"];
  v48 = [getSKUniformClass() uniformWithName:@"u_tex2" texture:v117];
  warpedTexAtlasUniform = self->_warpedTexAtlasUniform;
  self->_warpedTexAtlasUniform = v48;

  v50 = [getSKShaderClass() shaderWithFileNamed:@"heart"];
  heartShader = self->_heartShader;
  self->_heartShader = v50;

  v52 = self->_speedUniform;
  v144[0] = self->_warpedTexAtlasUniform;
  v144[1] = v52;
  v53 = self->_shaderTimeUniform;
  v144[2] = self->_scaleUniform;
  v144[3] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v144 count:4];
  [(SKShader *)self->_heartShader setUniforms:v54];

  v55 = [getSKSpriteNodeClass() spriteNodeWithImageNamed:@"heartAndBlur"];
  heart = self->_heart;
  self->_heart = v55;

  [(SKSpriteNode *)self->_heart setShader:self->_heartShader];
  v57 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.18 blue:0.3 alpha:1.0];
  [(SKSpriteNode *)self->_heart setColor:v57];

  [(SKSpriteNode *)self->_heart setColorBlendFactor:1.0];
  [(SKSpriteNode *)self->_heart setBlendMode:5];
  [(SKSpriteNode *)self->_heart setScale:0.75];
  [(SKNode *)self->_heartScale addChild:self->_heartLines];
  [(SKNode *)self->_heartScale addChild:self->_heart];
  [(SKNode *)self->_heartNode addChild:self->_heartScale];
  [v120 addChild:self->_heartNode];
  [(SKNode *)self->_heartNode setAlpha:0.0];
  [(SKSpriteNode *)self->_heartLines setAlpha:0.0];
  v58 = self->_heartNode;
  id SKActionClass_0 = getSKActionClass_0();
  if (v5) {
    double v60 = 0.0;
  }
  else {
    double v60 = 0.5;
  }
  v61 = [SKActionClass_0 fadeInWithDuration:v60];
  [(SKNode *)v58 runAction:v61 withKey:@"fade"];

  v62 = self->_heartLines;
  id v63 = getSKActionClass_0();
  id v64 = getSKActionClass_0();
  double v65 = 0.0;
  if (!v5) {
    double v65 = 0.3;
  }
  v66 = [v64 waitForDuration:v65];
  v143[0] = v66;
  v67 = [getSKActionClass_0() fadeInWithDuration:v60];
  v143[1] = v67;
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v143 count:2];
  v69 = [v63 sequence:v68];
  [(SKSpriteNode *)v62 runAction:v69 withKey:@"fade"];

  if (v115 && ![(ETMessage *)self isRenderingOffscreen])
  {
    if (IMOSLoggingEnabled())
    {
      v71 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23B55A000, v71, OS_LOG_TYPE_INFO, "Using duration", buf, 2u);
      }
    }
    objc_initWeak((id *)buf, self);
    if (self->_heartbreakTime == 0.0)
    {
      id v81 = getSKActionClass_0();
      v73 = [getSKActionClass_0() waitForDuration:(float)((float)self->_duration + 0.5)];
      v141[0] = v73;
      id v82 = getSKActionClass_0();
      v125[0] = MEMORY[0x263EF8330];
      v125[1] = 3221225472;
      v125[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2;
      v125[3] = &unk_264DECC38;
      v75 = &v126;
      objc_copyWeak(&v126, (id *)buf);
      uint64_t v83 = MEMORY[0x263EF83A0];
      id v84 = MEMORY[0x263EF83A0];
      v78 = [v82 runBlock:v125 queue:v83];
      v141[1] = v78;
      v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v141 count:2];
      uint64_t v80 = [v81 sequence:v79];
    }
    else
    {
      id v72 = getSKActionClass_0();
      v73 = [getSKActionClass_0() waitForDuration:self->_heartbreakTime];
      v142[0] = v73;
      id v74 = getSKActionClass_0();
      v127[0] = MEMORY[0x263EF8330];
      v127[1] = 3221225472;
      v127[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke;
      v127[3] = &unk_264DECC38;
      v75 = &v128;
      objc_copyWeak(&v128, (id *)buf);
      uint64_t v76 = MEMORY[0x263EF83A0];
      id v77 = MEMORY[0x263EF83A0];
      v78 = [v74 runBlock:v127 queue:v76];
      v142[1] = v78;
      v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:2];
      uint64_t v80 = [v72 sequence:v79];
    }
    v85 = (void *)v80;

    objc_destroyWeak(v75);
    [(SKNode *)self->_heartNode runAction:v85];

    objc_destroyWeak((id *)buf);
  }
  else if (IMOSLoggingEnabled())
  {
    v70 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23B55A000, v70, OS_LOG_TYPE_INFO, "Not using duration", buf, 2u);
    }
  }
  v114 = self->_heartNode;
  id v86 = getSKActionClass_0();
  v116 = [getSKActionClass_0() waitForDuration:v60];
  v140[0] = v116;
  id v87 = getSKActionClass_0();
  v124[0] = MEMORY[0x263EF8330];
  v124[1] = 3221225472;
  v124[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_41;
  v124[3] = &unk_264DEC6D0;
  v124[4] = self;
  v88 = [v87 runBlock:v124];
  v140[1] = v88;
  id v89 = getSKActionClass_0();
  id v90 = getSKActionClass_0();
  id v91 = getSKActionClass_0();
  v122[0] = MEMORY[0x263EF8330];
  v122[1] = 3221225472;
  v122[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2_42;
  v122[3] = &unk_264DECC60;
  v122[4] = self;
  float v123 = v11;
  v92 = [v91 runBlock:v122];
  v139[0] = v92;
  v93 = [getSKActionClass_0() waitForDuration:v11];
  v139[1] = v93;
  v94 = [getSKActionClass_0() waitForDuration:v12];
  v139[2] = v94;
  v95 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:3];
  v96 = [v90 sequence:v95];
  v97 = [v89 repeatActionForever:v96];
  v140[2] = v97;
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v140 count:3];
  v99 = [v86 sequence:v98];
  [(SKNode *)v114 runAction:v99];

  id v100 = getSKActionClass_0();
  v101 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.0 blue:0.5 alpha:1.0];
  v102 = [v100 colorizeWithColor:v101 colorBlendFactor:1.0 duration:v11 * 0.5];

  id v103 = getSKActionClass_0();
  v104 = [MEMORY[0x263F1C550] colorWithRed:0.9046 green:0.0 blue:0.3 alpha:1.0];
  v105 = [v103 colorizeWithColor:v104 colorBlendFactor:1.0 duration:v11 * 0.5];

  [v102 setTimingMode:3];
  [v105 setTimingMode:3];
  id v106 = getSKActionClass_0();
  id v107 = getSKActionClass_0();
  v138[0] = v102;
  v138[1] = v105;
  v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
  v109 = [v107 sequence:v108];
  v110 = [v106 repeatActionForever:v109];

  [(SKSpriteNode *)self->_heart runAction:v110];
  [(SKSpriteNode *)self->_heartLines runAction:v110];
  v111 = self->_heartNode;
  id v112 = getSKActionClass_0();
  v121[0] = MEMORY[0x263EF8330];
  v121[1] = 3221225472;
  v121[2] = __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_3;
  v121[3] = &unk_264DECC88;
  v121[4] = self;
  v113 = [v112 customActionWithDuration:v121 actionBlock:(float)((float)((float)10 + 0.5) + 0.6)];
  [(SKNode *)v111 runAction:v113];
}

void __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained breakHeart];
}

void __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopPlaying];
}

uint64_t __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startAudioPlayback];
}

uint64_t __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_2_42(uint64_t a1)
{
  return [*(id *)(a1 + 32) playBeatWithDuration:*(float *)(a1 + 40)];
}

uint64_t __60__ETHeartbeatMessage__displayInScene_useDuration_fastStart___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 184);
  [v1 floatValue];
  *(float *)&double v2 = *(float *)&v2 + 0.016667;

  return [v1 setFloatValue:v2];
}

- (void)moveHeartNodeByX:(double)a3 y:(double)a4 duration:(double)a5
{
  heartNode = self->_heartNode;
  id v6 = [getSKActionClass_0() moveByX:a3 y:a4 duration:a5];
  [(SKNode *)heartNode runAction:v6];
}

- (void)playBeatWithDuration:(double)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  BOOL v5 = [getSKActionClass_0() scaleTo:1.65 duration:a3 * 0.25];
  id v6 = [getSKActionClass_0() scaleTo:1.0 duration:a3 * 0.600000024];
  float v7 = [getSKActionClass_0() waitForDuration:a3 * 0.150000006];
  [v5 setTimingMode:3];
  [v6 setTimingMode:3];
  id SKActionClass_0 = getSKActionClass_0();
  v23[0] = v5;
  v23[1] = v7;
  v23[2] = v6;
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  float v10 = [SKActionClass_0 sequence:v9];

  [(SKNode *)self->_heartScale runAction:v10];
  id v11 = getSKActionClass_0();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke;
  v20[3] = &unk_264DECCB0;
  int v21 = 1048576000;
  *(double *)&v20[5] = a3;
  v20[4] = self;
  float v12 = [v11 customActionWithDuration:v20 actionBlock:a3 * 0.25];

  id v13 = getSKActionClass_0();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke_2;
  v18[3] = &unk_264DECCB0;
  int v19 = 1058642330;
  *(double *)&v18[5] = a3;
  v18[4] = self;
  objc_super v14 = [v13 customActionWithDuration:v18 actionBlock:a3 * 0.600000024];

  [v12 setTimingMode:2];
  [v14 setTimingMode:1];
  id v15 = getSKActionClass_0();
  v22[0] = v12;
  v22[1] = v7;
  v22[2] = v14;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  double v17 = [v15 sequence:v16];

  [(SKNode *)self->_heartNode runAction:v17];
}

uint64_t __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke(uint64_t a1, double a2)
{
  double v2 = a2 / (*(double *)(a1 + 40) * *(float *)(a1 + 48));
  *(float *)&double v2 = v2;
  return [*(id *)(*(void *)(a1 + 32) + 176) setFloatValue:v2];
}

uint64_t __43__ETHeartbeatMessage_playBeatWithDuration___block_invoke_2(uint64_t a1, double a2)
{
  double v2 = 1.0 - a2 / (*(double *)(a1 + 40) * *(float *)(a1 + 48));
  *(float *)&double v2 = v2;
  return [*(id *)(*(void *)(a1 + 32) + 176) setFloatValue:v2];
}

- (void)startHeartbeat:(id)a3
{
}

- (void)startHeartbeat:(id)a3 fastStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_initWeak(&location, v6);
  [(ETHeartbeatMessage *)self _displayInScene:v6 useDuration:0 fastStart:v4];

  objc_destroyWeak(&location);
}

- (void)stopPlaying
{
  v17[2] = *MEMORY[0x263EF8340];
  heartLines = self->_heartLines;
  BOOL v4 = [getSKActionClass_0() fadeOutWithDuration:0.480000019];
  [(SKSpriteNode *)heartLines runAction:v4 withKey:@"fade"];

  [(ETHeartbeatMessage *)self _stopAudioPlayback];
  BOOL v5 = [(ETMessage *)self delegate];
  [v5 messageWillStopPlaying:self];
  [(SKNode *)self->_heartNode removeAllActions];
  heartNode = self->_heartNode;
  id SKActionClass_0 = getSKActionClass_0();
  float v8 = [getSKActionClass_0() fadeOutWithDuration:0.600000024];
  v17[0] = v8;
  double v9 = [getSKActionClass_0() removeFromParent];
  v17[1] = v9;
  float v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  id v11 = [SKActionClass_0 sequence:v10];
  [(SKNode *)heartNode runAction:v11 withKey:@"fade"];

  float v12 = [(SKNode *)self->_heartNode parent];

  if (v12)
  {
    dispatch_time_t v13 = dispatch_time(0, 600000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__ETHeartbeatMessage_stopPlaying__block_invoke;
    block[3] = &unk_264DEC7B0;
    id v15 = v5;
    double v16 = self;
    dispatch_after(v13, MEMORY[0x263EF83A0], block);
  }
  else
  {
    [v5 messageDidStopPlaying:self];
  }
}

uint64_t __33__ETHeartbeatMessage_stopPlaying__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) messageDidStopPlaying:*(void *)(a1 + 40)];
}

- (void)breakHeart
{
  v35[2] = *MEMORY[0x263EF8340];
  if (!self->_broken)
  {
    self->_broken = 1;
    if (self->_heartbreakTime == 0.0)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(ETMessage *)self timeCreated];
      self->_double heartbreakTime = Current - v4;
    }
    [(SKSpriteNode *)self->_heart removeAllActions];
    [(SKNode *)self->_heartNode removeAllActions];
    [(SKSpriteNode *)self->_heartLines removeAllActions];
    [(SKNode *)self->_heartScale removeAllActions];
    LODWORD(v5) = 1023969327;
    [(SKUniform *)self->_shaderTimeUniform setFloatValue:v5];
    LODWORD(v6) = 1.0;
    [(SKUniform *)self->_scaleUniform setFloatValue:v6];
    [(SKUniform *)self->_warpedTexAtlasUniform setTextureValue:self->_heartbreakAtlas];
    heartLines = self->_heartLines;
    float v8 = [getSKActionClass_0() fadeOutWithDuration:0.2];
    [(SKSpriteNode *)heartLines runAction:v8];

    heart = self->_heart;
    id SKActionClass_0 = getSKActionClass_0();
    id v11 = [MEMORY[0x263F1C550] colorWithRed:0.5 green:0.0 blue:0.1 alpha:1.0];
    float v12 = [SKActionClass_0 colorizeWithColor:v11 colorBlendFactor:1.0 duration:1.0];
    [(SKSpriteNode *)heart runAction:v12];

    dispatch_time_t v13 = self->_shaderTimeUniform;
    heartNode = self->_heartNode;
    id v15 = getSKActionClass_0();
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __32__ETHeartbeatMessage_breakHeart__block_invoke;
    v33[3] = &unk_264DECC88;
    double v16 = v13;
    v34 = v16;
    double v17 = [v15 customActionWithDuration:v33 actionBlock:1.0];
    [(SKNode *)heartNode runAction:v17];

    objc_initWeak(&location, self);
    double v18 = self->_heartNode;
    id v19 = getSKActionClass_0();
    float v20 = [getSKActionClass_0() waitForDuration:1.0];
    v35[0] = v20;
    id v21 = getSKActionClass_0();
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __32__ETHeartbeatMessage_breakHeart__block_invoke_2;
    v30 = &unk_264DECC38;
    objc_copyWeak(&v31, &location);
    uint64_t v22 = MEMORY[0x263EF83A0];
    id v23 = MEMORY[0x263EF83A0];
    v24 = [v21 runBlock:&v27 queue:v22];
    v35[1] = v24;
    v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v35, 2, v27, v28, v29, v30);
    v26 = [v19 sequence:v25];
    [(SKNode *)v18 runAction:v26];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

uint64_t __32__ETHeartbeatMessage_breakHeart__block_invoke(uint64_t a1, double a2)
{
  double v2 = fmax(a2, 0.033333);
  *(float *)&double v2 = v2;
  return [*(id *)(a1 + 32) setFloatValue:v2];
}

void __32__ETHeartbeatMessage_breakHeart__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopPlaying];
}

- (id)messageTypeAsString
{
  return @"Heartbeat";
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@:%p bpm:%3.0f duration:%d>", v5, self, self->_beatsPerMinute, self->_duration];

  return v6;
}

- (void)setMute:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ETHeartbeatMessage;
  -[ETMessage setMute:](&v5, sel_setMute_);
  if (v3) {
    [(ETHeartbeatMessage *)self _stopAudioPlayback];
  }
  else {
    [(ETHeartbeatMessage *)self _startAudioPlayback];
  }
}

- (double)messageDuration
{
  return (float)((float)((float)self->_duration + 0.5) + 0.6);
}

- (float)beatsPerMinute
{
  return self->_beatsPerMinute;
}

- (void)setBeatsPerMinute:(float)a3
{
  self->_beatsPerMinute = a3;
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  self->_duration = a3;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
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

- (double)rotation
{
  return self->_rotation;
}

- (void)setRotation:(double)a3
{
  self->_double rotation = a3;
}

- (BOOL)isBroken
{
  return self->_broken;
}

- (double)heartbreakTime
{
  return self->_heartbreakTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbreakAtlas, 0);
  objc_storeStrong((id *)&self->_heartScale, 0);
  objc_storeStrong((id *)&self->_shaderTimeUniform, 0);
  objc_storeStrong((id *)&self->_scaleUniform, 0);
  objc_storeStrong((id *)&self->_noiseTexUniform, 0);
  objc_storeStrong((id *)&self->_burTexUniform, 0);
  objc_storeStrong((id *)&self->_warpedTexAtlasUniform, 0);
  objc_storeStrong((id *)&self->_speedUniform, 0);
  objc_storeStrong((id *)&self->_heartShader, 0);
  objc_storeStrong((id *)&self->_linesShader, 0);
  objc_storeStrong((id *)&self->_heartWisp, 0);
  objc_storeStrong((id *)&self->_heart, 0);
  objc_storeStrong((id *)&self->_heartLines, 0);

  objc_storeStrong((id *)&self->_heartNode, 0);
}

@end