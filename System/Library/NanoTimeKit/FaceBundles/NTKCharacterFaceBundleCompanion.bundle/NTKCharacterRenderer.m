@interface NTKCharacterRenderer
+ (id)rendererWithCharacter:(unint64_t)a3 loader:(id)a4;
- (BOOL)_footIsRaisedEnoughToStartAnimation;
- (BOOL)active;
- (MTLBuffer)geometryMtlBuffer;
- (NSString)prefix;
- (NTKCharacterRenderer)initWithCharacter:(unint64_t)a3 loader:(id)a4 prefix:(id)a5;
- (NTKCharacterResourceLoader)loader;
- (UIColor)clothingColor;
- (_Arms)arms;
- (_Background)background;
- (_Body)body;
- (_Foot)foot;
- (_Head)head;
- (double)desaturation;
- (double)globalOffset;
- (double)globalScale;
- (double)headMatrix;
- (double)neckBone;
- (float)_getElbowScaleForPosition:(float)a3;
- (float)characterBrightness;
- (float)characterScale;
- (float)curTimeMod15Sec;
- (float)curTimeMod1Sec;
- (float)dampenBones;
- (float)glowBrightness;
- (float)numbersAlpha;
- (float)numbersBrightness;
- (float)numbersScale;
- (int)clothingColorLoc;
- (int)curPose;
- (int)curState;
- (int)getBlinkFrameFor15sTime:(float)a3;
- (int)modelMatrixLoc;
- (void)_applyClothingColorWithEncoder:(id)a3;
- (void)_doneWaitingForFootRaise;
- (void)_drawArmFromShoulder:(NTKCharacterRenderer *)self toWrist:(SEL)a2 withBend:(float)a3 withEncoder:(id)a4;
- (void)_drawBackgroundWithEncoder:(id)a3;
- (void)_drawBodyWithEncoder:(id)a3;
- (void)_drawCharacterWithEncoder:(id)a3;
- (void)_drawHeadWithEncoder:(id)a3;
- (void)_drawHourHandWithEncoder:(id)a3;
- (void)_drawMinuteHandWithEncoder:(id)a3;
- (void)_drawTappingFootWithEncoder:(id)a3;
- (void)_idleBodyAfterAnimation;
- (void)_localeChanged;
- (void)_lowerFootAfterBodyAnimation;
- (void)_raiseFootForBodyAnimation;
- (void)_resetTimeVariable;
- (void)_setBlinkDuration:(float)a3;
- (void)_setPoseSpecs:(CharacterPoseSpecs)a3[2];
- (void)_setStateSpecs:(CharacterStateSpecs)a3[4];
- (void)_updateStateAndPose;
- (void)_updateTimeVariables;
- (void)_updateWaitingForFootRaise;
- (void)activate;
- (void)bindPipelineState:(unint64_t)a3 withEncoder:(id)a4;
- (void)cleanupToOverrideDate:(id)a3;
- (void)copyStateFrom:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)loadBackgroundTextures;
- (void)loadBodyTextures;
- (void)loadFootTextures;
- (void)loadHeadBlinkTextures;
- (void)loadHeadTextures;
- (void)loadNumbersTexture;
- (void)loadShiftTextures;
- (void)prepareToAnimateToDate:(id)a3 forOrb:(BOOL)a4;
- (void)renderWithEncoder:(id)a3;
- (void)scrubToDate:(id)a3;
- (void)setAnimationFrameInterval:(float)a3;
- (void)setArms:(id)a3;
- (void)setBackground:(id)a3;
- (void)setBody:(id)a3;
- (void)setCharacterBrightness:(float)a3;
- (void)setClothingColor:(id)a3 andDesaturation:(double)a4;
- (void)setFoot:(id)a3;
- (void)setGeometryMtlBuffer:(id)a3;
- (void)setGlobalOffset:(NTKCharacterRenderer *)self;
- (void)setGlobalScale:(NTKCharacterRenderer *)self;
- (void)setGlowBrightness:(float)a3;
- (void)setHead:(id)a3;
- (void)setNumbersAlpha:(float)a3;
- (void)setNumbersBrightness:(float)a3;
- (void)setNumbersScale:(float)a3;
- (void)setOverrideDateFraction:(float)a3;
- (void)setScrubOffset:(float)a3;
- (void)setupBodyState;
- (void)setupGeometry;
- (void)setupPipelineState;
- (void)setupTextures;
- (void)significantTimeChanged:(id)a3;
@end

@implementation NTKCharacterRenderer

+ (id)rendererWithCharacter:(unint64_t)a3 loader:(id)a4
{
  id v5 = a4;
  if (!a3)
  {
    v6 = off_1C718;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v6 = &off_1C720;
LABEL_5:
    id v7 = [objc_alloc(*v6) initWithLoader:v5];
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (int)getBlinkFrameFor15sTime:(float)a3
{
  return 0;
}

- (void)copyStateFrom:(id)a3
{
  self->_hourHandPos = *((float *)a3 + 27);
  self->_minHandPos = *((float *)a3 + 28);
  self->_applyInstantTimeWarp = *((unsigned char *)a3 + 162);
  self->_prevState = *((_DWORD *)a3 + 19);
  self->_idealState = *((_DWORD *)a3 + 20);
  self->_curState = *((_DWORD *)a3 + 21);
  self->_endState = *((_DWORD *)a3 + 22);
  self->_prevPose = *((_DWORD *)a3 + 23);
  self->_idealPose = *((_DWORD *)a3 + 24);
  self->_curPose = *((_DWORD *)a3 + 25);
  self->_endPose = *((_DWORD *)a3 + 26);
  id v5 = (NSDate *)*((id *)a3 + 3);
  overrideDate = self->_overrideDate;
  self->_overrideDate = v5;
  id v7 = a3;

  self->_overrideDateFraction = *((float *)v7 + 8);
  self->_fromHourPercent = *((double *)v7 + 5);
  self->_fromMinutePercent = *((double *)v7 + 6);
  self->_toHourPercent = *((double *)v7 + 7);
  self->_toMinutePercent = *((double *)v7 + 8);
  self->_animationFrameInterval = *((float *)v7 + 18);
  self->_animatingToNewDate = *((unsigned char *)v7 + 160);
  self->_animatingIntoOrb = *((unsigned char *)v7 + 161);
  self->_pinHandsBrightnessToMax = *((unsigned char *)v7 + 163);
  self->_sayCheese = *((unsigned char *)v7 + 164);
  self->_scrubOffset = *((float *)v7 + 43);
  self->_inTimeTravel = *((unsigned char *)v7 + 176);
  objc_storeStrong((id *)&self->_timeTravelEnterDate, *((id *)v7 + 23));
  [*((id *)v7 + 62) curHeadX];
  -[_Head setCurHeadX:](self->_head, "setCurHeadX:");
  -[_Head setInAnimation:](self->_head, "setInAnimation:", [*((id *)v7 + 62) inAnimation]);
  [*((id *)v7 + 62) bone];
  -[_Head setBone:](self->_head, "setBone:");
  [*((id *)v7 + 62) curHeadTilt];
  -[_Head setCurHeadTilt:](self->_head, "setCurHeadTilt:");
  [*((id *)v7 + 63) bone];
  -[_Body setBone:](self->_body, "setBone:");
  -[_Body setAnimationDirection:](self->_body, "setAnimationDirection:", [*((id *)v7 + 63) animationDirection]);
  -[_Body setAnimationFrame:](self->_body, "setAnimationFrame:", [*((id *)v7 + 63) animationFrame]);
  -[_Body setFrameDisplayTime60th:](self->_body, "setFrameDisplayTime60th:", [*((id *)v7 + 63) frameDisplayTime60th]);
  -[_Body setWaitingForFootRaise:](self->_body, "setWaitingForFootRaise:", [*((id *)v7 + 63) waitingForFootRaise]);
  -[_Body setState:](self->_body, "setState:", [*((id *)v7 + 63) state]);
  [*((id *)v7 + 65) curLeftBend];
  -[_Arms setCurLeftBend:](self->_arms, "setCurLeftBend:");
  [*((id *)v7 + 65) curRightBend];
  -[_Arms setCurRightBend:](self->_arms, "setCurRightBend:");
  -[_Foot setState:](self->_foot, "setState:", [*((id *)v7 + 64) state]);
  -[_Foot setAnimFrame:](self->_foot, "setAnimFrame:", [*((id *)v7 + 64) animFrame]);
  -[_Foot setFrameDisplayTime60th:](self->_foot, "setFrameDisplayTime60th:", [*((id *)v7 + 64) frameDisplayTime60th]);
}

- (void)setAnimationFrameInterval:(float)a3
{
  self->_animationFrameInterval = a3;
}

- (void)prepareToAnimateToDate:(id)a3 forOrb:(BOOL)a4
{
  BOOL v4 = a4;
  overrideDate = self->_overrideDate;
  self->_overrideDate = 0;
  id v7 = a3;

  self->_animatingToNewDate = 1;
  self->_overrideDateFraction = 0.0;
  if (v4)
  {
    self->_animatingIntoOrb = 1;
    [(NTKCharacterRenderer *)self _raiseFootForBodyAnimation];
  }
  else
  {
    self->_animatingIntoOrb = 0;
    [(NTKCharacterRenderer *)self _lowerFootAfterBodyAnimation];
  }
  *(float64x2_t *)&self->_double fromHourPercent = vcvtq_f64_f32(*(float32x2_t *)&self->_hourHandPos);
  p_double toMinutePercent = &self->_toMinutePercent;
  sub_9F34(&self->_toHourPercent, &self->_toMinutePercent, (uint64_t)v7, self->_cal);

  double fromHourPercent = self->_fromHourPercent;
  double toHourPercent = self->_toHourPercent;
  if (fromHourPercent >= 0.5 == toHourPercent < 0.5)
  {
    double fromMinutePercent = self->_fromMinutePercent;
    if (fromMinutePercent >= 0.5 == *p_toMinutePercent < 0.5)
    {
      float v12 = fromHourPercent;
      self->_double fromHourPercent = fromMinutePercent;
      self->_double fromMinutePercent = v12;
      [(_Arms *)self->_arms curLeftBend];
      int v14 = v13;
      [(_Arms *)self->_arms curRightBend];
      -[_Arms setCurLeftBend:](self->_arms, "setCurLeftBend:");
      LODWORD(v15) = v14;
      [(_Arms *)self->_arms setCurRightBend:v15];
      double toHourPercent = self->_toHourPercent;
      double fromHourPercent = self->_fromHourPercent;
    }
  }
  float v16 = toHourPercent - fromHourPercent;
  if (fabsf(v16) > 0.5)
  {
    BOOL v17 = fromHourPercent < toHourPercent;
    double v18 = 1.0;
    if (v17) {
      double v18 = -1.0;
    }
    self->_double toHourPercent = toHourPercent + v18;
  }
  double toMinutePercent = self->_toMinutePercent;
  double v20 = self->_fromMinutePercent;
  float v21 = toMinutePercent - v20;
  if (fabsf(v21) > 0.5)
  {
    BOOL v17 = v20 < toMinutePercent;
    double v22 = 1.0;
    if (v17) {
      double v22 = -1.0;
    }
    double *p_toMinutePercent = toMinutePercent + v22;
  }
}

- (void)setOverrideDateFraction:(float)a3
{
  self->_overrideDateFraction = a3;
}

- (void)cleanupToOverrideDate:(id)a3
{
  *(_WORD *)&self->_animatingToNewDate = 0;
}

- (void)setClothingColor:(id)a3 andDesaturation:(double)a4
{
  self->_desaturation = a4;
}

- (NTKCharacterRenderer)initWithCharacter:(unint64_t)a3 loader:(id)a4 prefix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)NTKCharacterRenderer;
  v10 = [(NTKCharacterRenderer *)&v38 init];
  if (v10)
  {
    uint64_t v11 = +[CLKUIMetalResourceManager sharedDevice];
    float v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    objc_storeStrong((id *)v10 + 58, a5);
    objc_storeStrong((id *)v10 + 24, a4);
    uint64_t v13 = +[UIColor redColor];
    int v14 = (void *)*((void *)v10 + 67);
    *((void *)v10 + 67) = v13;

    uint64_t v15 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    float v16 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = v15;

    BOOL v17 = (void *)*((void *)v10 + 3);
    *((void *)v10 + 3) = 0;

    uint64_t v18 = objc_opt_new();
    v19 = (void *)*((void *)v10 + 62);
    *((void *)v10 + 62) = v18;

    uint64_t v20 = objc_opt_new();
    float v21 = (void *)*((void *)v10 + 63);
    *((void *)v10 + 63) = v20;

    uint64_t v22 = objc_opt_new();
    v23 = (void *)*((void *)v10 + 65);
    *((void *)v10 + 65) = v22;

    uint64_t v24 = objc_opt_new();
    v25 = (void *)*((void *)v10 + 64);
    *((void *)v10 + 64) = v24;

    uint64_t v26 = objc_opt_new();
    v27 = (void *)*((void *)v10 + 66);
    *((void *)v10 + 66) = v26;

    [v10 setupGeometry];
    [v10 setupPipelineState];
    [v10 setupBodyState];
    *(_WORD *)(v10 + 161) = 0;
    v10[164] = 0;
    __asm { FMOV            V0.2S, #1.0 }
    *((void *)v10 + 60) = _D0;
    *((void *)v10 + 59) = 0;
    *((_DWORD *)v10 + 112) = 1065353216;
    *((_DWORD *)v10 + 109) = 1065353216;
    *((void *)v10 + 68) = 0;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v10 + 420) = _Q0;
    *((_DWORD *)v10 + 18) = 1065353216;
    v34 = +[NSNotificationCenter defaultCenter];
    [v34 addObserver:v10 selector:"significantTimeChanged:" name:UIApplicationSignificantTimeChangeNotification object:0];

    v35 = +[NSNotificationCenter defaultCenter];
    [v35 addObserver:v10 selector:"_localeChanged" name:NSCurrentLocaleDidChangeNotification object:0];

    v36 = v10;
  }

  return (NTKCharacterRenderer *)v10;
}

- (void)_localeChanged
{
}

- (void)_setPoseSpecs:(CharacterPoseSpecs)a3[2]
{
  uint64_t v3 = *(void *)&a3->bodyOffsetX;
  self->_poseSpecs[0].headOffsetX = a3->headOffsetX;
  *(void *)&self->_poseSpecs[0].bodyOffsetX = v3;
  uint64_t v4 = *(void *)&a3[1].bodyOffsetX;
  self->_poseSpecs[1].headOffsetX = a3[1].headOffsetX;
  *(void *)&self->_poseSpecs[1].bodyOffsetX = v4;
}

- (void)_setStateSpecs:(CharacterStateSpecs)a3[4]
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v4 = &self->_stateSpecs[i];
    long long v5 = *(_OWORD *)&a3[i].bodyTexIdx;
    long long v6 = *(_OWORD *)&a3[i].leftShoulderX;
    *(_OWORD *)&v4->xFlipFoot = *(_OWORD *)&a3[i].xFlipFoot;
    *(_OWORD *)&v4->leftShoulderX = v6;
    *(_OWORD *)&v4->bodyTexIdx = v5;
  }
}

- (void)_setBlinkDuration:(float)a3
{
  self->_blinkDuration = a3;
}

- (void)significantTimeChanged:(id)a3
{
  id v4 = +[NSTimeZone systemTimeZone];
  [(NSCalendar *)self->_cal setTimeZone:v4];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)NTKCharacterRenderer;
  [(NTKCharacterRenderer *)&v5 dealloc];
}

- (void)activate
{
  if (!self->_active)
  {
    [(NTKCharacterRenderer *)self setupTextures];
    self->_active = 1;
  }
}

- (void)deactivate
{
  self->_active = 0;
}

- (void)setupGeometry
{
  id v9 = [(NTKCharacterRenderer *)self loader];
  uint64_t v3 = [v9 mtlBuffer];
  geometryMtlBuffer = self->_geometryMtlBuffer;
  self->_geometryMtlBuffer = v3;

  -[_Geometry setMtlBufOffset:](self->_background, "setMtlBufOffset:", [v9 bufferOffsetBackground]);
  -[_Geometry setMtlBufOffset:](self->_body, "setMtlBufOffset:", [v9 bufferOffsetBody]);
  -[_Geometry setMtlBufOffset:](self->_foot, "setMtlBufOffset:", [v9 bufferOffsetFoot]);
  -[_Arms setMtlBufArmOffset:](self->_arms, "setMtlBufArmOffset:", [v9 bufferOffsetArm]);
  -[_Arms setMtlBufHandOffset:](self->_arms, "setMtlBufHandOffset:", [v9 bufferOffsetHand]);
  -[_Geometry setMtlBufOffset:](self->_head, "setMtlBufOffset:", [v9 bufferOffsetHead]);
  LODWORD(v5) = 1058938398;
  [(_Head *)self->_head setWidth:v5];
  LODWORD(v6) = 1056224437;
  [(_Head *)self->_head setHeight:v6];
  LODWORD(v7) = 1060727145;
  [(_Body *)self->_body setWidth:v7];
  LODWORD(v8) = 1058136546;
  [(_Body *)self->_body setHeight:v8];
}

- (void)setupPipelineState
{
  id v7 = [(NTKCharacterRenderer *)self loader];
  uint64_t v3 = 0;
  pipelines = self->_pipelines;
  do
  {
    uint64_t v5 = [v7 getPipelineForProgramType:v3];
    double v6 = pipelines[v3];
    pipelines[v3] = (MTLRenderPipelineState *)v5;

    ++v3;
  }
  while (v3 != 4);
  self->_currentPipeline = 5;
}

- (void)setupBodyState
{
  *(void *)&self->_hourHandPos = 0x3E1999B03F588889;
  self->_applyInstantTimeWarp = 1;
  [(NTKCharacterRenderer *)self _updateStateAndPose];
  self->_applyInstantTimeWarp = 0;
  *(float *)&double v3 = self->_poseSpecs[self->_curPose].headOffsetX * self->_stateSpecs[self->_curState].xFlipFace;
  [(_Head *)self->_head setCurHeadX:v3];
  [(_Head *)self->_head setInAnimation:0];
  [(_Head *)self->_head setOffset:0.00000538545646];
  [(_Head *)self->_head setBone:0.0];
  [(_Head *)self->_head setCurHeadTilt:0.0];
  [(_Body *)self->_body setBone:0.0];
  id v4 = (const float *)&unk_1584C;
  float v5 = (float)(self->_stateSpecs[self->_curState].xFlipBody * 0.0) + 0.0183823529;
  *(float32x2_t *)&double v6 = vld1_dup_f32(v4);
  *(float *)&double v6 = v5;
  [(_Body *)self->_body setOffset:v6];
  [(_Body *)self->_body setAnimationDirection:0];
  [(_Body *)self->_body setAnimationFrame:0];
  [(_Body *)self->_body setFrameDisplayTime60th:0];
  [(_Body *)self->_body setWaitingForFootRaise:0];
  [(_Body *)self->_body setState:0];
  float hourElbowBend = self->_stateSpecs[self->_curState].hourElbowBend;
  *(float *)&double v8 = self->_hourHandPos;
  [(NTKCharacterRenderer *)self _getElbowScaleForPosition:v8];
  *(float *)&double v10 = hourElbowBend * v9;
  [(_Arms *)self->_arms setCurLeftBend:v10];
  float minuteElbowBend = self->_stateSpecs[self->_curState].minuteElbowBend;
  *(float *)&double v12 = self->_minHandPos;
  [(NTKCharacterRenderer *)self _getElbowScaleForPosition:v12];
  *(float *)&double v14 = minuteElbowBend * v13;
  [(_Arms *)self->_arms setCurRightBend:v14];
  [(_Foot *)self->_foot setAnimFrame:11];
  [(_Foot *)self->_foot setFrameDisplayTime60th:0];
  foot = self->_foot;

  [(_Foot *)foot setState:4];
}

- (void)loadBackgroundTextures
{
  id v3 = [(NTKCharacterResourceLoader *)self->_loader mtlTextureWithName:@"Background"];
  [(_Background *)self->_background setGlowTex:v3];
}

- (void)loadNumbersTexture
{
  id v3 = [(NTKCharacterResourceLoader *)self->_loader mtlTextureWithName:@"Numbers"];
  [(_Background *)self->_background setNumbersTex:v3];
}

- (void)loadBodyTextures
{
  id v3 = [(NTKCharacterResourceLoader *)self->_loader textureWithName:@"BodyPose1_4" prefix:self->_prefix];
  v12[0] = v3;
  id v4 = [(NTKCharacterResourceLoader *)self->_loader textureWithName:@"BodyPose2_3" prefix:self->_prefix];
  v12[1] = v4;
  float v5 = +[NSArray arrayWithObjects:v12 count:2];
  [(_Body *)self->_body setTexs:v5];

  double v6 = [(NTKCharacterResourceLoader *)self->_loader textureWithName:@"HandArm"];
  [(_Arms *)self->_arms setTexArm:v6];

  id v7 = [(NTKCharacterResourceLoader *)self->_loader textureWithName:@"HandMinute_0"];
  v11[0] = v7;
  double v8 = [(NTKCharacterResourceLoader *)self->_loader textureWithName:@"HandMinute_1"];
  v11[1] = v8;
  float v9 = +[NSArray arrayWithObjects:v11 count:2];
  [(_Arms *)self->_arms setTexHandMnut:v9];

  double v10 = [(NTKCharacterResourceLoader *)self->_loader textureWithName:@"HandHour_0"];
  [(_Arms *)self->_arms setTexHandHour:v10];
}

- (void)loadHeadTextures
{
  id v3 = +[NSMutableArray arrayWithCapacity:6];
  [(_Head *)self->_head setTexs:v3];

  for (uint64_t i = 0; i != 6; ++i)
  {
    loader = self->_loader;
    double v6 = +[NSString stringWithFormat:@"Head_%d", i];
    id v7 = [(NTKCharacterResourceLoader *)loader textureWithName:v6 prefix:self->_prefix];
    double v8 = [(_Head *)self->_head texs];
    [v8 setObject:v7 atIndexedSubscript:i];
  }
}

- (void)loadHeadBlinkTextures
{
  id v3 = +[NSMutableArray arrayWithCapacity:3];
  [(_Head *)self->_head setBlinkTexs:v3];

  for (uint64_t i = 0; i != 3; ++i)
  {
    loader = self->_loader;
    double v6 = +[NSString stringWithFormat:@"HeadBlink_%d", i];
    id v7 = [(NTKCharacterResourceLoader *)loader textureWithName:v6 prefix:self->_prefix];
    double v8 = [(_Head *)self->_head blinkTexs];
    [v8 setObject:v7 atIndexedSubscript:i];
  }
}

- (void)loadFootTextures
{
  id v3 = +[NSMutableArray arrayWithCapacity:12];
  [(_Foot *)self->_foot setTexs:v3];

  for (uint64_t i = 0; i != 12; ++i)
  {
    loader = self->_loader;
    double v6 = +[NSString stringWithFormat:@"Foot_%02d", i];
    id v7 = [(NTKCharacterResourceLoader *)loader textureWithName:v6 prefix:self->_prefix];
    double v8 = [(_Foot *)self->_foot texs];
    [v8 setObject:v7 atIndexedSubscript:i];
  }
}

- (void)loadShiftTextures
{
  id v3 = +[NSMutableArray arrayWithCapacity:17];
  [(_Body *)self->_body setShiftTexs12:v3];

  id v4 = +[NSMutableArray arrayWithCapacity:10];
  [(_Body *)self->_body setShiftTexs14:v4];

  float v5 = +[NSMutableArray arrayWithCapacity:14];
  [(_Body *)self->_body setShiftTexs23:v5];

  double v6 = +[NSMutableArray arrayWithCapacity:9];
  [(_Body *)self->_body setShiftTexs13:v6];

  for (uint64_t i = 0; i != 17; ++i)
  {
    loader = self->_loader;
    float v9 = +[NSString stringWithFormat:@"Shift-1-2_%02d", i];
    double v10 = [(NTKCharacterResourceLoader *)loader textureWithName:v9 prefix:self->_prefix];
    uint64_t v11 = [(_Body *)self->_body shiftTexs12];
    [v11 setObject:v10 atIndexedSubscript:i];
  }
  for (uint64_t j = 0; j != 10; ++j)
  {
    float v13 = self->_loader;
    double v14 = +[NSString stringWithFormat:@"Shift-1-4_%02d", j];
    uint64_t v15 = [(NTKCharacterResourceLoader *)v13 textureWithName:v14 prefix:self->_prefix];
    float v16 = [(_Body *)self->_body shiftTexs14];
    [v16 setObject:v15 atIndexedSubscript:j];
  }
  for (uint64_t k = 0; k != 14; ++k)
  {
    uint64_t v18 = self->_loader;
    v19 = +[NSString stringWithFormat:@"Shift-2-3_%02d", k];
    uint64_t v20 = [(NTKCharacterResourceLoader *)v18 textureWithName:v19 prefix:self->_prefix];
    float v21 = [(_Body *)self->_body shiftTexs23];
    [v21 setObject:v20 atIndexedSubscript:k];
  }
  for (uint64_t m = 0; m != 9; ++m)
  {
    v23 = self->_loader;
    uint64_t v24 = +[NSString stringWithFormat:@"Shift-1-3_%02d", m];
    v25 = [(NTKCharacterResourceLoader *)v23 textureWithName:v24 prefix:self->_prefix];
    uint64_t v26 = [(_Body *)self->_body shiftTexs13];
    [v26 setObject:v25 atIndexedSubscript:m];
  }
}

- (void)setupTextures
{
  [(NTKCharacterRenderer *)self loadNumbersTexture];
  [(NTKCharacterRenderer *)self loadBackgroundTextures];
  [(NTKCharacterRenderer *)self loadBodyTextures];
  [(NTKCharacterRenderer *)self loadHeadTextures];
  [(NTKCharacterRenderer *)self loadFootTextures];
  [(NTKCharacterRenderer *)self loadHeadBlinkTextures];

  [(NTKCharacterRenderer *)self loadShiftTextures];
}

- (void)_updateTimeVariables
{
  double v3 = CFAbsoluteTimeGetCurrent() + 0.05;
  double overrideDateFraction = self->_overrideDateFraction;
  if (self->_animatingIntoOrb)
  {
    double overrideDateFraction = overrideDateFraction * 1.29999995;
    if (overrideDateFraction > 1.0) {
      double overrideDateFraction = 1.0;
    }
  }
  if (self->_animatingToNewDate)
  {
    float v5 = overrideDateFraction;
    float32x2_t v6 = vmla_n_f32(vmul_n_f32(vcvt_f32_f64(*(float64x2_t *)&self->_toHourPercent), v5), vcvt_f32_f64(*(float64x2_t *)&self->_fromHourPercent), 1.0 - v5);
    __asm { FMOV            V2.2S, #-1.0 }
    float32x2_t v12 = vmla_f32(v6, _D2, vrndm_f32(v6));
  }
  else
  {
    float v13 = +[NTKDate faceDate];
    overrideDate = self->_overrideDate;
    if (overrideDate)
    {
      uint64_t v15 = overrideDate;

      float v13 = v15;
    }
    float64_t v22 = 0.0;
    float64_t v23 = 0.0;
    sub_9F34(&v23, &v22, (uint64_t)v13, self->_cal);

    v16.f64[0] = v23;
    v16.f64[1] = v22;
    float32x2_t v12 = vcvt_f32_f64(v16);
  }
  *(float32x2_t *)&self->_hourHandPos = v12;
  float v17 = v3 - floor(v3);
  self->_curTimeMod1Sec = v17;
  float v18 = (v3 / 15.0 - floor(v3 / 15.0)) * 15.0;
  self->_curTimeMod15Sec = v18;
  if (!self->_overrideDate && !self->_animatingToNewDate)
  {
    float scrubOffset = self->_scrubOffset;
    if (scrubOffset != 0.0)
    {
      float v20 = modff(scrubOffset + v12.f32[0], &v24);
      if (v20 < 0.0) {
        float v20 = v20 + 1.0;
      }
      float v21 = -(floor(v20 * 12.0) - v20 * 12.0);
      self->_hourHandPos = v20;
      self->_minHandPos = v21;
    }
  }
}

- (void)_resetTimeVariable
{
  *(void *)&self->_curTimeMod1Sec = 0;
}

- (void)scrubToDate:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    if (!self->_inTimeTravel)
    {
      [(NTKCharacterRenderer *)self _raiseFootForBodyAnimation];
      self->_inTimeTravel = 1;
      id v4 = +[NTKDate faceDate];
      timeTravelEnterDate = self->_timeTravelEnterDate;
      self->_timeTravelEnterDate = v4;
    }
    [v8 timeIntervalSinceDate:self->_timeTravelEnterDate];
    double v7 = v6 / 43200.0;
    *(float *)&double v7 = v7;
  }
  else
  {
    self->_inTimeTravel = 0;
    double v7 = 0.0;
  }
  [(NTKCharacterRenderer *)self setScrubOffset:v7];
}

- (void)setScrubOffset:(float)a3
{
  self->_float scrubOffset = a3;
}

- (void)_updateStateAndPose
{
  int v3 = (self->_minHandPos >= 0.5) | (2 * (self->_hourHandPos >= 0.5));
  unsigned int bodyTexIdx = self->_stateSpecs[v3].bodyTexIdx;
  if (self->_applyInstantTimeWarp)
  {
    [(_Body *)self->_body setState:0];
    [(_Body *)self->_body setFrameDisplayTime60th:0];
    [(_Body *)self->_body setAnimationFrame:0];
    [(_Body *)self->_body setWaitingForFootRaise:0];
    self->_int curState = v3;
    self->_int curPose = bodyTexIdx;
    int curState = v3;
    int curPose = bodyTexIdx;
  }
  else
  {
    int curState = self->_curState;
    int curPose = self->_curPose;
  }
  self->_prevState = curState;
  self->_idealState = v3;
  self->_prevPose = curPose;
  self->_idealPose = bodyTexIdx;
}

- (void)bindPipelineState:(unint64_t)a3 withEncoder:(id)a4
{
  if (self->_currentPipeline != a3)
  {
    self->_currentPipeline = a3;
    [a4 setRenderPipelineState:self->_pipelines[a3]];
  }
}

- (void)_drawBackgroundWithEncoder:(id)a3
{
  id v4 = a3;
  [(NTKCharacterRenderer *)self bindPipelineState:1 withEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Geometry mtlBufOffset](self->_background, "mtlBufOffset"), 0);
  uint64_t v5 = *(void *)self->_globalOffset;
  float32x2_t v21 = *(float32x2_t *)self->_globalScale;
  uint64_t v22 = v5;
  [v4 setVertexBytes:&v21 length:16 atIndex:1];
  _D0.i32[0] = LODWORD(self->_glowBrightness);
  __asm { FCVT            H0, S0 }
  int16x4_t v11 = vdup_lane_s16(_D0, 0);
  v11.i16[3] = COERCE_UNSIGNED_INT(1.0);
  int16x4_t v20 = v11;
  [v4 setFragmentBytes:&v20 length:8 atIndex:0];
  float32x2_t v12 = [(_Background *)self->_background glowTex];
  [v4 setFragmentTexture:v12 atIndex:0];

  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
  float numbersScale = self->_numbersScale;
  float numbersAlpha = self->_numbersAlpha;
  [(NTKCharacterRenderer *)self bindPipelineState:2 withEncoder:v4];
  uint64_t v13 = *(void *)self->_globalOffset;
  float32x2_t v21 = vmul_n_f32(*(float32x2_t *)self->_globalScale, numbersScale);
  uint64_t v22 = v13;
  [v4 setVertexBytes:&v21 length:16 atIndex:1];
  v14.i32[0] = LODWORD(self->_numbersBrightness);
  v14.f32[1] = numbersAlpha;
  *(float16x4_t *)v14.f32 = vcvt_f16_f32(v14);
  int16x4_t v15 = vzip1_s16(*(int16x4_t *)v14.f32, *(int16x4_t *)v14.f32);
  v15.i16[2] = v14.i16[0];
  int16x4_t v20 = v15;
  [v4 setFragmentBytes:&v20 length:8 atIndex:0];
  float64x2_t v16 = [(_Background *)self->_background numbersTex];

  if (!v16) {
    [(NTKCharacterRenderer *)self loadNumbersTexture];
  }
  float v17 = [(_Background *)self->_background numbersTex];
  [v4 setFragmentTexture:v17 atIndex:0];

  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (void)_idleBodyAfterAnimation
{
  [(_Body *)self->_body setState:0];
  [(_Body *)self->_body setFrameDisplayTime60th:0];
  [(_Body *)self->_body setAnimationFrame:0];
  if (!self->_animatingIntoOrb && !self->_inTimeTravel)
  {
    [(NTKCharacterRenderer *)self _lowerFootAfterBodyAnimation];
  }
}

- (void)_drawBodyWithEncoder:(id)a3
{
  id v4 = a3;
  stateSpecs = self->_stateSpecs;
  float xFlipBody = self->_stateSpecs[self->_curState].xFlipBody;
  if (![(_Body *)self->_body state])
  {
    int idealState = self->_idealState;
    int curState = self->_curState;
    if (curState == idealState)
    {
      int idealPose = self->_idealPose;
      int curPose = self->_curPose;
      if (curPose == idealPose) {
        goto LABEL_2;
      }
    }
    else
    {
      int idealPose = self->_idealPose;
      int curPose = self->_curPose;
    }
    self->_int endState = idealState;
    self->_endPose = idealPose;
    float32x2_t v21 = (unsigned __int16 *)((char *)&animSpecs
                             + 4
                             * ((8 * (stateSpecs[curState].xFlipBody < 0.0)) | (4 * curPose) | (2
                                                                                              * (stateSpecs[idealState].xFlipBody < 0.0)) | idealPose));
    int v22 = *v21;
    if (*v21)
    {
      int v23 = (__int16)v21[1];
      [(_Body *)self->_body setAnimationFrame:0];
      [(_Body *)self->_body setAnimationDirection:(char)v23];
      [(_Body *)self->_body setFrameDisplayTime60th:0];
      switch(v22)
      {
        case 1:
          [(_Body *)self->_body setState:1];
          if (v23 < 0)
          {
            body = self->_body;
            uint64_t v25 = 16;
            goto LABEL_45;
          }
          break;
        case 2:
          v66 = self->_body;
          uint64_t v67 = 2;
          goto LABEL_42;
        case 3:
          v66 = self->_body;
          uint64_t v67 = 3;
LABEL_42:
          [(_Body *)v66 setState:v67];
          break;
        case 4:
          [(_Body *)self->_body setState:4];
          if (v23 < 0)
          {
            body = self->_body;
            uint64_t v25 = 8;
LABEL_45:
            [(_Body *)body setAnimationFrame:v25];
          }
          break;
        default:
          self->_int curState = self->_endState;
          self->_int curPose = self->_endPose;
          break;
      }
      if ([(_Body *)self->_body state]) {
        [(NTKCharacterRenderer *)self _raiseFootForBodyAnimation];
      }
    }
    else
    {
      self->_int curState = idealState;
      self->_int curPose = idealPose;
    }
  }
LABEL_2:
  if (![(_Body *)self->_body state])
  {
LABEL_23:
    *(float *)&double v7 = stateSpecs[self->_curState].leftShoulderX;
    [(_Arms *)self->_arms setLeftShoulderX:v7];
    *(float *)&double v28 = stateSpecs[self->_curState].rightShoulderX;
    [(_Arms *)self->_arms setRightShoulderX:v28];
    goto LABEL_24;
  }
  [(NTKCharacterRenderer *)self _updateWaitingForFootRaise];
  if ([(_Body *)self->_body waitingForFootRaise])
  {
    loader = self->_loader;
    float v9 = [(_Body *)self->_body texs];
    double v10 = [v9 objectAtIndexedSubscript:self->_curPose];
    int16x4_t v11 = [(NTKCharacterResourceLoader *)loader getMTLTexture:v10];

    [v4 setFragmentTexture:v11 atIndex:0];
    goto LABEL_23;
  }
  int endState = self->_endState;
  self->_int curState = endState;
  self->_int curPose = self->_endPose;
  float xFlipBody = stateSpecs[endState].xFlipBody;
  float v17 = self->_body;
  if (self->_animatingIntoOrb)
  {
    [(_Body *)v17 setFrameDisplayTime60th:0];
    float v18 = self->_body;
    unsigned int v19 = 2 * [(_Body *)v18 animationDirection];
    unsigned __int8 v20 = [(_Body *)v18 animationFrame];
  }
  else
  {
    if ([(_Body *)v17 frameDisplayTime60th] < 2) {
      goto LABEL_19;
    }
    [(_Body *)self->_body setFrameDisplayTime60th:0];
    float v18 = self->_body;
    unsigned __int8 v20 = [(_Body *)v18 animationDirection];
    LOBYTE(v19) = [(_Body *)v18 animationFrame];
  }
  [(_Body *)v18 setAnimationFrame:(char)(v19 + v20)];
LABEL_19:
  [(_Body *)self->_body setFrameDisplayTime60th:(int)(float)(self->_animationFrameInterval+ (float)[(_Body *)self->_body frameDisplayTime60th])];
  if ([(_Body *)self->_body animationFrame] < 0)
  {
LABEL_22:
    [(NTKCharacterRenderer *)self _idleBodyAfterAnimation];
    goto LABEL_23;
  }
  unsigned int v26 = [(_Body *)self->_body state];
  v27 = self->_body;
  if (v26 == 1)
  {
    if ([(_Body *)v27 animationFrame] >= 17) {
      goto LABEL_22;
    }
    float xFlipBody = xFlipBody * (float)-[(_Body *)self->_body animationDirection];
    unsigned int v58 = [(_Body *)self->_body animationFrame];
    if (xFlipBody >= 0.0)
    {
      *(float *)&double v59 = shoulderX_12Anim[2 * v58];
      [(_Arms *)self->_arms setLeftShoulderX:v59];
      *(float *)&double v60 = shoulderX_12Anim[2 * [(_Body *)self->_body animationFrame] + 1];
    }
    else
    {
      *(float *)&double v59 = -shoulderX_12Anim[2 * v58 + 1];
      [(_Arms *)self->_arms setLeftShoulderX:v59];
      *(float *)&double v60 = -shoulderX_12Anim[2 * [(_Body *)self->_body animationFrame]];
    }
    [(_Arms *)self->_arms setRightShoulderX:v60];
    v68 = self->_loader;
    v69 = [(_Body *)self->_body shiftTexs12];
    goto LABEL_52;
  }
  unsigned int v53 = [(_Body *)v27 state];
  v54 = self->_body;
  if (v53 == 2)
  {
    if ([(_Body *)v54 animationFrame] >= 10)
    {
      [(_Body *)self->_body setAnimationFrame:8];
      [(_Body *)self->_body setAnimationDirection:0xFFFFFFFFLL];
    }
    float xFlipBody = xFlipBody * (float)-[(_Body *)self->_body animationDirection];
    unsigned int v55 = [(_Body *)self->_body animationFrame];
    if (xFlipBody >= 0.0)
    {
      *(float *)&double v56 = shoulderX_14Anim[2 * v55];
      [(_Arms *)self->_arms setLeftShoulderX:v56];
      *(float *)&double v57 = shoulderX_14Anim[2 * [(_Body *)self->_body animationFrame] + 1];
    }
    else
    {
      *(float *)&double v56 = -shoulderX_14Anim[2 * v55 + 1];
      [(_Arms *)self->_arms setLeftShoulderX:v56];
      *(float *)&double v57 = -shoulderX_14Anim[2 * [(_Body *)self->_body animationFrame]];
    }
    [(_Arms *)self->_arms setRightShoulderX:v57];
    v68 = self->_loader;
    v69 = [(_Body *)self->_body shiftTexs14];
LABEL_52:
    v70 = v69;
    v71 = objc_msgSend(v69, "objectAtIndexedSubscript:", -[_Body animationFrame](self->_body, "animationFrame"));
    v72 = [(NTKCharacterResourceLoader *)v68 getMTLTexture:v71];

    [v4 setFragmentTexture:v72 atIndex:0];
    goto LABEL_24;
  }
  unsigned int v61 = [(_Body *)v54 state];
  v62 = self->_body;
  if (v61 != 3)
  {
    if ([(_Body *)v62 state] != 4) {
      goto LABEL_23;
    }
    if ([(_Body *)self->_body animationFrame] >= 9) {
      goto LABEL_22;
    }
    unsigned int v73 = [(_Body *)self->_body animationFrame];
    if (xFlipBody >= 0.0)
    {
      *(float *)&double v74 = shoulderX_13Anim[2 * v73];
      [(_Arms *)self->_arms setLeftShoulderX:v74];
      *(float *)&double v75 = shoulderX_13Anim[2 * [(_Body *)self->_body animationFrame] + 1];
    }
    else
    {
      *(float *)&double v74 = -shoulderX_13Anim[2 * v73 + 1];
      [(_Arms *)self->_arms setLeftShoulderX:v74];
      *(float *)&double v75 = -shoulderX_13Anim[2 * [(_Body *)self->_body animationFrame]];
    }
    [(_Arms *)self->_arms setRightShoulderX:v75];
    v68 = self->_loader;
    v69 = [(_Body *)self->_body shiftTexs13];
    goto LABEL_52;
  }
  if ([(_Body *)v62 animationFrame] >= 14)
  {
    [(_Body *)self->_body setAnimationFrame:4];
    [(_Body *)self->_body setAnimationDirection:0xFFFFFFFFLL];
  }
  float xFlipBody = xFlipBody * (float)[(_Body *)self->_body animationDirection];
  unsigned int v63 = [(_Body *)self->_body animationFrame];
  if (xFlipBody >= 0.0)
  {
    *(float *)&double v64 = shoulderX_23Anim[2 * v63];
    [(_Arms *)self->_arms setLeftShoulderX:v64];
    *(float *)&double v65 = shoulderX_23Anim[2 * [(_Body *)self->_body animationFrame] + 1];
  }
  else
  {
    *(float *)&double v64 = -shoulderX_23Anim[2 * v63 + 1];
    [(_Arms *)self->_arms setLeftShoulderX:v64];
    *(float *)&double v65 = -shoulderX_23Anim[2 * [(_Body *)self->_body animationFrame]];
  }
  [(_Arms *)self->_arms setRightShoulderX:v65];
  v76 = self->_loader;
  v77 = [(_Body *)self->_body shiftTexs23];
  if ([(_Body *)self->_body animationFrame] == 1) {
    uint64_t v78 = 0;
  }
  else {
    uint64_t v78 = [(_Body *)self->_body animationFrame];
  }
  v79 = [v77 objectAtIndexedSubscript:v78];
  v80 = [(NTKCharacterResourceLoader *)v76 getMTLTexture:v79];

  [v4 setFragmentTexture:v80 atIndex:0];
LABEL_24:
  arms = self->_arms;
  [(_Arms *)arms leftShoulderAdjustment];
  float v31 = v30;
  [(_Arms *)arms leftShoulderX];
  *(float *)&double v33 = v31 + v32;
  [(_Arms *)arms setLeftShoulderX:v33];
  v34 = self->_arms;
  [(_Arms *)v34 rightShoulderAdjustment];
  float v36 = v35;
  [(_Arms *)v34 rightShoulderX];
  *(float *)&double v38 = v36 + v37;
  [(_Arms *)v34 setRightShoulderX:v38];
  if (![(_Body *)self->_body state])
  {
    v39 = self->_loader;
    v40 = [(_Body *)self->_body texs];
    v41 = [v40 objectAtIndexedSubscript:self->_curPose];
    v42 = [(NTKCharacterResourceLoader *)v39 getMTLTexture:v41];

    [v4 setFragmentTexture:v42 atIndex:0];
  }
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Geometry mtlBufOffset](self->_body, "mtlBufOffset"), 0);
  [(NTKCharacterRenderer *)self _applyClothingColorWithEncoder:v4];
  float32x2_t v43 = *(float32x2_t *)self->_globalOffset;
  float32x2_t v44 = *(float32x2_t *)self->_globalScale;
  float characterScale = self->_characterScale;
  simd_float4 v45 = matrix_identity_float4x4.columns[1];
  v84[0] = matrix_identity_float4x4.columns[0];
  v84[1] = v45;
  simd_float4 v46 = matrix_identity_float4x4.columns[3];
  v84[2] = matrix_identity_float4x4.columns[2];
  v84[3] = v46;
  [(_Body *)self->_body bone];
  float32x2_t v85 = vmul_n_f32(v47, characterScale);
  uint64_t v86 = 0;
  float32x2_t v87 = v44;
  [(_Body *)self->_body width];
  float v81 = (float)(xFlipBody * characterScale) * v48;
  [(_Body *)self->_body height];
  *(float *)&uint64_t v49 = v81;
  *((float *)&v49 + 1) = characterScale * v50;
  uint64_t v88 = v49;
  [(_Body *)self->_body offset];
  unsigned int v82 = v51;
  [(_Body *)self->_body offset];
  float32x2_t v89 = vmla_f32(v43, (float32x2_t)__PAIR64__(v52, v82), vmul_n_f32(v44, characterScale));
  uint64_t v90 = 0;
  [v4 setVertexBytes:v84 length:112 atIndex:1];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (void)_applyClothingColorWithEncoder:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  clothingColor = self->_clothingColor;
  id v5 = a3;
  [(UIColor *)clothingColor getHue:&v18 saturation:&v17 brightness:&v16 alpha:&v15];
  _D1 = v17;
  _D0 = v18;
  _D2 = v16;
  _D3 = 1.0 - self->_desaturation;
  __asm
  {
    FCVT            H1, D1
    FCVT            H0, D0
  }
  WORD1(_D0) = _D1;
  __asm { FCVT            H1, D2 }
  WORD2(_D0) = _D1;
  __asm { FCVT            H1, D3 }
  HIWORD(_D0) = _D1;
  uint64_t v14 = _D0;
  [v5 setFragmentBytes:&v14 length:8 atIndex:1];
}

- (void)_doneWaitingForFootRaise
{
  [(_Body *)self->_body setWaitingForFootRaise:0];
  [(_Foot *)self->_foot setState:4];
  [(_Foot *)self->_foot setAnimFrame:11];
  foot = self->_foot;

  [(_Foot *)foot setFrameDisplayTime60th:0];
}

- (BOOL)_footIsRaisedEnoughToStartAnimation
{
  return [(_Foot *)self->_foot animFrame] > 9;
}

- (void)_updateWaitingForFootRaise
{
  if ([(_Body *)self->_body waitingForFootRaise]
    && [(NTKCharacterRenderer *)self _footIsRaisedEnoughToStartAnimation])
  {
    [(NTKCharacterRenderer *)self _doneWaitingForFootRaise];
  }
}

- (void)_raiseFootForBodyAnimation
{
  if ([(NTKCharacterRenderer *)self _footIsRaisedEnoughToStartAnimation])
  {
    [(NTKCharacterRenderer *)self _doneWaitingForFootRaise];
  }
  else
  {
    [(_Foot *)self->_foot setState:3];
    [(_Foot *)self->_foot setAnimFrame:(char)([(_Foot *)self->_foot animFrame] + 1)];
    [(_Foot *)self->_foot setFrameDisplayTime60th:0];
    body = self->_body;
    [(_Body *)body setWaitingForFootRaise:1];
  }
}

- (void)_lowerFootAfterBodyAnimation
{
  [(_Foot *)self->_foot setState:2];
  [(_Foot *)self->_foot setAnimFrame:10];
  foot = self->_foot;

  [(_Foot *)foot setFrameDisplayTime60th:0];
}

- (void)_drawTappingFootWithEncoder:(id)a3
{
  id v4 = a3;
  if ([(_Foot *)self->_foot state] == 4 && [(_Body *)self->_body state]) {
    goto LABEL_52;
  }
  if (![(_Foot *)self->_foot state])
  {
    float curTimeMod1Sec = self->_curTimeMod1Sec;
    if (curTimeMod1Sec < 0.23333)
    {
      foot = self->_foot;
      uint64_t v7 = 0;
LABEL_48:
      [(_Foot *)foot setAnimFrame:v7];
      goto LABEL_49;
    }
    if (curTimeMod1Sec < 0.26667)
    {
      foot = self->_foot;
LABEL_16:
      uint64_t v7 = 1;
      goto LABEL_48;
    }
    if (curTimeMod1Sec >= 0.3)
    {
      if (curTimeMod1Sec < 0.33333) {
        goto LABEL_31;
      }
      if (curTimeMod1Sec < 0.36667) {
        goto LABEL_33;
      }
      if (curTimeMod1Sec < 0.4) {
        goto LABEL_35;
      }
      if (curTimeMod1Sec < 0.43333) {
        goto LABEL_37;
      }
      if (curTimeMod1Sec < 0.46667) {
        goto LABEL_39;
      }
      if (curTimeMod1Sec < 0.5) {
        goto LABEL_41;
      }
      if (curTimeMod1Sec < 0.53333) {
        goto LABEL_43;
      }
      if (curTimeMod1Sec < 0.56667) {
        goto LABEL_45;
      }
      if (curTimeMod1Sec < 0.66667)
      {
        foot = self->_foot;
        uint64_t v7 = 11;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.7)
      {
LABEL_45:
        foot = self->_foot;
        uint64_t v7 = 10;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.73333)
      {
LABEL_43:
        foot = self->_foot;
        uint64_t v7 = 9;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.76667)
      {
LABEL_41:
        foot = self->_foot;
        uint64_t v7 = 8;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.8)
      {
LABEL_39:
        foot = self->_foot;
        uint64_t v7 = 7;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.83333)
      {
LABEL_37:
        foot = self->_foot;
        uint64_t v7 = 6;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.86667)
      {
LABEL_35:
        foot = self->_foot;
        uint64_t v7 = 5;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.9)
      {
LABEL_33:
        foot = self->_foot;
        uint64_t v7 = 4;
        goto LABEL_48;
      }
      if (curTimeMod1Sec < 0.93333)
      {
LABEL_31:
        foot = self->_foot;
        uint64_t v7 = 3;
        goto LABEL_48;
      }
      foot = self->_foot;
      if (curTimeMod1Sec >= 0.96667) {
        goto LABEL_16;
      }
    }
    else
    {
      foot = self->_foot;
    }
    uint64_t v7 = 2;
    goto LABEL_48;
  }
  if ([(_Foot *)self->_foot state] == 1)
  {
    if (self->_curTimeMod1Sec < 0.23333)
    {
      [(_Foot *)self->_foot setFrameDisplayTime60th:0];
      [(_Foot *)self->_foot setAnimFrame:0];
      [(_Foot *)self->_foot setState:0];
    }
    goto LABEL_49;
  }
  if ([(_Foot *)self->_foot state] == 3)
  {
    if (self->_animatingIntoOrb || [(_Foot *)self->_foot frameDisplayTime60th] >= 2)
    {
      [(_Foot *)self->_foot setAnimFrame:(char)([(_Foot *)self->_foot animFrame] + 1)];
      [(_Foot *)self->_foot setFrameDisplayTime60th:0];
      if ([(_Foot *)self->_foot animFrame] >= 11) {
        [(NTKCharacterRenderer *)self _doneWaitingForFootRaise];
      }
    }
LABEL_29:
    [(_Foot *)self->_foot setFrameDisplayTime60th:(int)(float)(self->_animationFrameInterval+ (float)[(_Foot *)self->_foot frameDisplayTime60th])];
    goto LABEL_49;
  }
  if ([(_Foot *)self->_foot state] == 4)
  {
    if (self->_animatingIntoOrb || self->_inTimeTravel) {
      goto LABEL_49;
    }
    if ([(_Foot *)self->_foot frameDisplayTime60th] >= 4)
    {
      [(_Foot *)self->_foot setFrameDisplayTime60th:0];
      [(_Foot *)self->_foot setState:2];
      [(_Foot *)self->_foot setAnimFrame:10];
    }
    goto LABEL_29;
  }
  if ([(_Foot *)self->_foot state] == 2)
  {
    if ([(_Foot *)self->_foot frameDisplayTime60th] >= 2)
    {
      [(_Foot *)self->_foot setFrameDisplayTime60th:0];
      [(_Foot *)self->_foot setAnimFrame:(char)([(_Foot *)self->_foot animFrame] - 1)];
      if (![(_Foot *)self->_foot animFrame]) {
        [(_Foot *)self->_foot setState:1];
      }
    }
    goto LABEL_29;
  }
LABEL_49:
  if (self->_sayCheese)
  {
    [(_Foot *)self->_foot setAnimFrame:11];
    [(_Foot *)self->_foot setFrameDisplayTime60th:0];
    [(_Foot *)self->_foot setState:4];
  }
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Geometry mtlBufOffset](self->_foot, "mtlBufOffset"), 0);
  float32x2_t v22 = *(float32x2_t *)self->_globalScale;
  float v20 = COERCE_FLOAT(*(void *)self->_globalOffset);
  LODWORD(v8) = HIDWORD(*(void *)self->_globalOffset);
  float characterScale = self->_characterScale;
  float xFlipFoot = self->_stateSpecs[self->_curState].xFlipFoot;
  loader = self->_loader;
  int16x4_t v11 = [(_Foot *)self->_foot texs];
  float32x2_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", -[_Foot animFrame](self->_foot, "animFrame"));
  uint64_t v13 = [(NTKCharacterResourceLoader *)loader getMTLTexture:v12];

  [v4 setFragmentTexture:v13 atIndex:0];
  simd_float4 v14 = matrix_identity_float4x4.columns[1];
  v23[0] = matrix_identity_float4x4.columns[0];
  v23[1] = v14;
  simd_float4 v15 = matrix_identity_float4x4.columns[3];
  v23[2] = matrix_identity_float4x4.columns[2];
  v23[3] = v15;
  [(_Body *)self->_body bone];
  float32x2_t v24 = vmul_n_f32(v16, characterScale);
  uint64_t v25 = 0;
  v16.f32[0] = characterScale * xFlipFoot;
  v16.f32[1] = characterScale;
  float32x2_t v26 = v22;
  float32x2_t v27 = vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_f32(v16), (float64x2_t)xmmword_158B0), (float64x2_t)xmmword_158C0));
  [(_Body *)self->_body offset];
  *(float *)&uint64_t v18 = v20
                 + (float)((float)(characterScale * v22.f32[0])
                         * (float)(v17
                                 + (float)((float)(xFlipFoot * self->_poseSpecs[self->_curPose].footOffsetX) * 0.97)));
  float v19 = v8 + vmuls_lane_f32(characterScale, v22, 1) * -0.650735294 * 0.980000019;
  *((float *)&v18 + 1) = v19;
  uint64_t v28 = v18;
  uint64_t v29 = 0;
  [v4 setVertexBytes:v23 length:112 atIndex:1];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];

LABEL_52:
}

- (void)_drawHeadWithEncoder:(id)a3
{
  id v4 = a3;
  stateSpecs = self->_stateSpecs;
  float xFlipFace = self->_stateSpecs[self->_curState].xFlipFace;
  if (xFlipFace >= 0.0) {
    float v7 = 60.0 - (float)(self->_minHandPos * 60.0);
  }
  else {
    float v7 = self->_minHandPos * 60.0;
  }
  if (![(_Head *)self->_head inAnimation] && xFlipFace != stateSpecs[self->_prevState].xFlipFace) {
    [(_Head *)self->_head setInAnimation:1];
  }
  if (self->_applyInstantTimeWarp) {
    [(_Head *)self->_head setInAnimation:0];
  }
  if (![(_Head *)self->_head inAnimation])
  {
LABEL_28:
    uint64_t v9 = 0;
    goto LABEL_29;
  }
  [(_Head *)self->_head setInAnimation:(int)(float)(self->_animationFrameInterval + (float)[(_Head *)self->_head inAnimation])];
  unsigned int v8 = [(_Head *)self->_head inAnimation];
  if ((int)v8 > 9)
  {
    if (v8 < 0xC)
    {
      uint64_t v9 = 5;
      goto LABEL_29;
    }
    if (v8 < 0xE)
    {
      uint64_t v9 = 4;
      goto LABEL_29;
    }
    if (v8 < 0x10)
    {
      uint64_t v9 = 3;
      goto LABEL_29;
    }
    if (v8 < 0x12)
    {
      uint64_t v9 = 2;
      goto LABEL_29;
    }
    if (v8 < 0x14) {
      goto LABEL_12;
    }
    [(_Head *)self->_head setInAnimation:0];
    goto LABEL_28;
  }
  float xFlipFace = -xFlipFace;
  if ((int)v8 < 4)
  {
LABEL_12:
    uint64_t v9 = 1;
    goto LABEL_29;
  }
  uint64_t v10 = 3;
  if (v8 >= 8) {
    uint64_t v10 = 4;
  }
  if (v8 >= 6) {
    uint64_t v9 = v10;
  }
  else {
    uint64_t v9 = 2;
  }
LABEL_29:
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
  [(NTKCharacterRenderer *)self _applyClothingColorWithEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Geometry mtlBufOffset](self->_head, "mtlBufOffset"), 0);
  double v11 = 0.0;
  if (v7 >= 5.0 && v7 < 20.0)
  {
    double v11 = (v7 + -12.5) / 7.5 * 0.6 + 0.0;
    *(float *)&double v11 = v11;
  }
  double hourHandPos = self->_hourHandPos;
  if (hourHandPos <= 0.833333333 || (float v14 = 0.0, self->_minHandPos > 0.75))
  {
    if (hourHandPos >= 0.166666667)
    {
      float v14 = *(float *)&v11;
    }
    else if (self->_minHandPos >= 0.25)
    {
      float v14 = 0.0;
    }
    else
    {
      float v14 = *(float *)&v11;
    }
  }
  if (self->_applyInstantTimeWarp)
  {
    *(float *)&double v11 = self->_poseSpecs[self->_curPose].headOffsetX * stateSpecs[self->_curState].xFlipFace;
  }
  else
  {
    float v15 = self->_animationFrameInterval * flt_157F8[!self->_animatingIntoOrb];
    float headOffsetX = self->_poseSpecs[self->_curPose].headOffsetX;
    float v17 = stateSpecs[self->_curState].xFlipFace;
    [(_Head *)self->_head curHeadX];
    float v19 = -(float)(v18 - (float)(headOffsetX * v17));
    [(_Head *)self->_head curHeadX];
    *(float *)&double v11 = *(float *)&v11 + (float)(v15 * v19);
  }
  [(_Head *)self->_head setCurHeadX:v11];
  if (!self->_applyInstantTimeWarp)
  {
    double v21 = self->_animationFrameInterval * 0.07;
    [(_Head *)self->_head curHeadTilt];
    double v23 = (float)(v14 - v22);
    [(_Head *)self->_head curHeadTilt];
    double v20 = v24 + v21 * v23;
    float v14 = v20;
  }
  *(float *)&double v20 = v14;
  [(_Head *)self->_head setCurHeadTilt:v20];
  [(_Head *)self->_head curHeadTilt];
  float v25 = 0.0;
  if (v26 > 0.0)
  {
    [(_Head *)self->_head curHeadTilt];
    float v25 = v27 * -0.00320512821 * 30.0;
  }
  float v59 = v25;
  [(_Head *)self->_head curHeadTilt];
  float v29 = v28;
  [(_Head *)self->_head curHeadTilt];
  __float2 v31 = __sincosf_stret(xFlipFace * v30);
  *(float *)&unint64_t v32 = -v31.__sinval;
  HIDWORD(v32) = LODWORD(v31.__cosval);
  *(_OWORD *)&self[1].super.isa = __PAIR64__(LODWORD(v31.__sinval), LODWORD(v31.__cosval));
  *(_OWORD *)&self[1]._cal = v32;
  *(_OWORD *)&self[1]._double overrideDateFraction = xmmword_158D0;
  *(_OWORD *)&self[1]._double fromMinutePercent = xmmword_158E0;
  float32x2_t v33 = *(float32x2_t *)self->_globalOffset;
  float32x2_t v34 = *(float32x2_t *)self->_globalScale;
  float characterScale = self->_characterScale;
  if (self->_sayCheese
    || [(_Head *)self->_head inAnimation]
    || self->_curTimeMod15Sec > self->_blinkDuration)
  {
    loader = self->_loader;
    float v36 = [(_Head *)self->_head texs];
    float v37 = v36;
    uint64_t v38 = v9;
  }
  else
  {
    signed int v53 = -[NTKCharacterRenderer getBlinkFrameFor15sTime:](self, "getBlinkFrameFor15sTime:");
    loader = self->_loader;
    float v36 = [(_Head *)self->_head blinkTexs];
    float v37 = v36;
    uint64_t v38 = v53;
  }
  v39 = [v36 objectAtIndexedSubscript:v38];
  v40 = [(NTKCharacterResourceLoader *)loader getMTLTexture:v39];

  [v4 setFragmentTexture:v40 atIndex:0];
  float v41 = (float)(xFlipFace * v29) * -0.3;
  long long v42 = *(_OWORD *)&self[1]._cal;
  v61[0] = *(_OWORD *)&self[1].super.isa;
  v61[1] = v42;
  long long v43 = *(_OWORD *)&self[1]._fromMinutePercent;
  v61[2] = *(_OWORD *)&self[1]._overrideDateFraction;
  v61[3] = v43;
  [(_Head *)self->_head bone];
  unsigned int v56 = v44;
  [(_Head *)self->_head bone];
  float32x2_t v62 = vmul_n_f32((float32x2_t)__PAIR64__(v45, v56), characterScale);
  uint64_t v63 = 0;
  uint64_t v64 = *(void *)self->_globalScale;
  [(_Head *)self->_head width];
  float v57 = (float)(xFlipFace * characterScale) * v46;
  [(_Head *)self->_head height];
  *(float *)&uint64_t v47 = v57;
  *((float *)&v47 + 1) = characterScale * v48;
  uint64_t v65 = v47;
  [(_Body *)self->_body offset];
  *(float *)&unsigned int v58 = v49 + v41;
  [(_Head *)self->_head curHeadX];
  __int32 v55 = v50;
  __int32 v54 = *(void *)self->_neckBone;
  [(_Head *)self->_head offset];
  v51.i32[0] = v54;
  v51.i32[1] = *(_DWORD *)&self->_neckBone[4];
  v52.i32[0] = v55;
  float32x2_t v66 = vmla_f32(v33, vadd_f32((float32x2_t)__PAIR64__(LODWORD(v59), v58), vmla_f32(v52, (float32x2_t)vdup_n_s32(0x3D4CCCCDu), v51)), vmul_n_f32(v34, characterScale));
  uint64_t v67 = 0;
  [v4 setVertexBytes:v61 length:112 atIndex:1];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (void)_drawArmFromShoulder:(NTKCharacterRenderer *)self toWrist:(SEL)a2 withBend:(float)a3 withEncoder:(id)a4
{
  float v6 = v5;
  float32x2_t v7 = v4;
  float32x2_t v29 = *(float32x2_t *)&a3;
  id v9 = a4;
  [(_Body *)self->_body offset];
  float32x2_t v11 = vadd_f32(v10, v29);
  __int32 v31 = v11.i32[0];
  v11.i32[0] = vsub_f32(v7, v11).u32[0];
  LODWORD(v12) = vsub_f32(v7, v29).i32[1];
  float v27 = v11.f32[0];
  float v13 = atan2f(v11.f32[0], v12);
  __float2 v14 = __sincosf_stret(v13);
  uint64_t v15 = 0;
  *(float *)&unint64_t v16 = v14.__cosval;
  *((float *)&v16 + 1) = -v14.__sinval;
  v43[0] = v16;
  v43[1] = (unint64_t)v14;
  v43[2] = xmmword_158D0;
  v43[3] = xmmword_158E0;
  long long v33 = 0u;
  float32x4_t v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  do
  {
    *(long long *)((char *)&v33 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_158F0, COERCE_FLOAT(v43[v15])), (float32x4_t)xmmword_15900, *(float32x2_t *)&v43[v15], 1), (float32x4_t)xmmword_158D0, (float32x4_t)v43[v15], 2), (float32x4_t)xmmword_158E0, (float32x4_t)v43[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  float v17 = sqrtf((float)(v12 * v12) + (float)(v27 * v27));
  unint64_t v18 = __PAIR64__(v29.u32[1], v31);
  long long v30 = v33;
  float32x2_t v32 = (float32x2_t)v18;
  long long v26 = v36;
  long long v28 = v35;
  float v19 = v17 / 0.00735294118;
  float32x4_t v25 = vmulq_n_f32(v34, v19);
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v9];
  objc_msgSend(v9, "setVertexBufferOffset:atIndex:", -[_Arms mtlBufArmOffset](self->_arms, "mtlBufArmOffset"), 0);
  loader = self->_loader;
  double v21 = [(_Arms *)self->_arms texArm];
  float v22 = [(NTKCharacterResourceLoader *)loader getMTLTexture:v21];

  [v9 setFragmentTexture:v22 atIndex:0];
  v23.i32[0] = LODWORD(self->_characterScale);
  long long v33 = v30;
  float32x4_t v34 = v25;
  long long v35 = v28;
  long long v36 = v26;
  uint64_t v37 = COERCE_UNSIGNED_INT(*(float *)v23.i32 * v6);
  uint64_t v38 = 0;
  float32x2_t v24 = *(float32x2_t *)self->_globalOffset;
  float32x2_t v39 = *(float32x2_t *)self->_globalScale;
  int32x2_t v40 = vdup_lane_s32(v23, 0);
  float32x2_t v41 = vmla_f32(v24, v32, vmul_n_f32(v39, *(float *)v23.i32));
  uint64_t v42 = 0;
  [v9 setVertexBytes:&v33 length:112 atIndex:1];
  [v9 drawPrimitives:4 vertexStart:0 vertexCount:26];
}

- (float)_getElbowScaleForPosition:(float)a3
{
  float v3 = (float)(a3 * -4.0) + 1.25;
  if (a3 >= 0.5) {
    float v3 = (float)(a3 * 4.0) + -2.7;
  }
  if (v3 > 1.0) {
    float v3 = 1.0;
  }
  if (v3 < 0.0)
  {
    BOOL v4 = a3 < 0.5;
    float v5 = 0.0;
    if (v4) {
      float v6 = 0.0;
    }
    else {
      float v6 = v3;
    }
    if (v4) {
      float v5 = v3;
    }
    if (self->_stateSpecs[self->_curState].hourArmOnLeftShoulder) {
      return v5;
    }
    else {
      return v6;
    }
  }
  return v3;
}

- (void)_drawHourHandWithEncoder:(id)a3
{
  id v4 = a3;
  float characterScale = self->_characterScale;
  float hourHandPos = self->_hourHandPos;
  __float2 v6 = __sincosf_stret(hourHandPos * -6.2832);
  uint64_t v7 = 0;
  *(float *)&unint64_t v8 = -v6.__sinval;
  HIDWORD(v8) = LODWORD(v6.__cosval);
  v68[0] = __PAIR64__(LODWORD(v6.__sinval), LODWORD(v6.__cosval));
  v68[1] = v8;
  v68[2] = xmmword_158D0;
  v68[3] = xmmword_158E0;
  float32x4_t v58 = 0u;
  float32x4_t v59 = 0u;
  float32x4_t v60 = 0u;
  int8x16_t v61 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v58 + v7 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_15910, COERCE_FLOAT(v68[v7])), (float32x4_t)xmmword_15920, *(float32x2_t *)&v68[v7], 1), (float32x4_t)xmmword_158D0, (float32x4_t)v68[v7], 2), (float32x4_t)xmmword_158E0, (float32x4_t)v68[v7], 3);
    ++v7;
  }
  while (v7 != 4);
  float v9 = characterScale * 43.1176471;
  *(float32x2_t *)v10.f32 = vadd_f32(*(float32x2_t *)v61.i8, vadd_f32(*(float32x2_t *)v60.f32, vmla_f32(vmul_n_f32(*(float32x2_t *)v59.f32, v9), 0, *(float32x2_t *)v58.f32)));
  v10.i64[1] = vextq_s8(v61, v61, 8uLL).u64[0];
  float32x4_t v54 = v59;
  float32x4_t v55 = v58;
  int8x16_t v52 = (int8x16_t)v10;
  float32x4_t v53 = v60;
  *(void *)&double v51 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(v58, (float32x4_t)0), (float32x4_t)vdupq_n_s32(0x427C7878u), v59), (float32x4_t)0, v60), (float32x4_t)0, v10).u64[0];
  [(NTKCharacterRenderer *)self _getElbowScaleForPosition:COERCE_DOUBLE((unint64_t)LODWORD(hourHandPos))];
  float v12 = v11;
  float v13 = flt_15818[!self->_animatingIntoOrb];
  stateSpecs = self->_stateSpecs;
  arms = self->_arms;
  if (self->_stateSpecs[self->_curState].hourArmOnLeftShoulder)
  {
    [(_Arms *)arms leftShoulderX];
    double v48 = v16;
    if (self->_applyInstantTimeWarp)
    {
      *(float *)&double v16 = v12 * stateSpecs[self->_curState].hourElbowBend;
    }
    else
    {
      float v18 = v13 * self->_animationFrameInterval;
      float hourElbowBend = stateSpecs[self->_curState].hourElbowBend;
      [(_Arms *)self->_arms curLeftBend];
      float v21 = -(float)(v20 - (float)(hourElbowBend * v12));
      [(_Arms *)self->_arms curLeftBend];
      *(float *)&double v16 = *(float *)&v16 + (float)(v18 * v21);
    }
    -[_Arms setCurLeftBend:](self->_arms, "setCurLeftBend:", v16, *(void *)&v48);
    [(_Arms *)self->_arms curLeftBend];
  }
  else
  {
    [(_Arms *)arms rightShoulderX];
    double v49 = v17;
    if (self->_applyInstantTimeWarp)
    {
      *(float *)&double v17 = v12 * stateSpecs[self->_curState].hourElbowBend;
    }
    else
    {
      float v24 = v13 * self->_animationFrameInterval;
      float v25 = stateSpecs[self->_curState].hourElbowBend;
      [(_Arms *)self->_arms curRightBend];
      float v27 = -(float)(v26 - (float)(v25 * v12));
      [(_Arms *)self->_arms curRightBend];
      *(float *)&double v17 = *(float *)&v17 + (float)(v24 * v27);
    }
    -[_Arms setCurRightBend:](self->_arms, "setCurRightBend:", v17, *(void *)&v49);
    [(_Arms *)self->_arms curRightBend];
  }
  LODWORD(v23) = v22;
  double v28 = *(double *)self->_neckBone;
  __asm { FMOV            V1.2S, #0.75 }
  float32x2_t v34 = vmul_f32(*(float32x2_t *)&v28, _D1);
  _D1.i32[0] = v50;
  LODWORD(v28) = vadd_f32(_D1, *(float32x2_t *)&v28).u32[0];
  HIDWORD(v28) = v34.i32[1];
  [(NTKCharacterRenderer *)self _drawArmFromShoulder:v4 toWrist:v28 withBend:v51 withEncoder:v23];
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Arms mtlBufHandOffset](self->_arms, "mtlBufHandOffset"), 0);
  if (self->_pinHandsBrightnessToMax)
  {
    v58.i64[0] = 0x3C003C003C003C00;
    [v4 setFragmentBytes:&v58 length:8 atIndex:0];
  }
  loader = self->_loader;
  long long v36 = [(_Arms *)self->_arms texHandHour];
  uint64_t v37 = [(NTKCharacterResourceLoader *)loader getMTLTexture:v36];

  [v4 setFragmentTexture:v37 atIndex:0];
  float32x4_t v58 = v55;
  float32x4_t v59 = v54;
  float32x4_t v60 = v53;
  int8x16_t v61 = v52;
  float v56 = COERCE_FLOAT(*(void *)self->_neckBone);
  double v38 = COERCE_FLOAT(HIDWORD(*(void *)self->_neckBone)) * 34.0;
  float v39 = self->_hourHandPos;
  float v40 = v39 * -2.0 * 3.14159265;
  double v41 = sinf(v40);
  float v42 = (float)(v39 * -2.0) * 3.14159265;
  *(float *)&unsigned int v43 = v56 * 68.0 * cosf(v42) + v38 * v41;
  uint64_t v62 = v43;
  uint64_t v63 = 0;
  *(float *)&uint64_t v44 = characterScale * stateSpecs[self->_idealState].xFlipHourHand;
  *((float *)&v44 + 1) = characterScale;
  uint64_t v45 = *(void *)self->_globalOffset;
  uint64_t v64 = *(void *)self->_globalScale;
  uint64_t v65 = v44;
  uint64_t v66 = v45;
  uint64_t v67 = 0;
  [v4 setVertexBytes:&v58 length:112 atIndex:1];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
  if (self->_pinHandsBrightnessToMax)
  {
    _D0.i32[0] = LODWORD(self->_characterBrightness);
    __asm { FCVT            H0, S0 }
    int16x4_t v47 = vdup_lane_s16(_D0, 0);
    v47.i16[3] = COERCE_UNSIGNED_INT(1.0);
    *(int16x4_t *)&v68[0] = v47;
    [v4 setFragmentBytes:v68 length:8 atIndex:0];
  }
}

- (void)_drawMinuteHandWithEncoder:(id)a3
{
  id v4 = a3;
  float characterScale = self->_characterScale;
  float minHandPos = self->_minHandPos;
  float v6 = minHandPos * -6.28318531;
  __float2 v7 = __sincosf_stret(v6);
  uint64_t v8 = 0;
  *(float *)&unint64_t v9 = -v7.__sinval;
  HIDWORD(v9) = LODWORD(v7.__cosval);
  v68[0] = __PAIR64__(LODWORD(v7.__sinval), LODWORD(v7.__cosval));
  v68[1] = v9;
  v68[2] = xmmword_158D0;
  v68[3] = xmmword_158E0;
  float32x4_t v58 = 0u;
  float32x4_t v59 = 0u;
  float32x4_t v60 = 0u;
  int8x16_t v61 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v58 + v8 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_15910, COERCE_FLOAT(v68[v8])), (float32x4_t)xmmword_15920, *(float32x2_t *)&v68[v8], 1), (float32x4_t)xmmword_158D0, (float32x4_t)v68[v8], 2), (float32x4_t)xmmword_158E0, (float32x4_t)v68[v8], 3);
    ++v8;
  }
  while (v8 != 4);
  float v10 = characterScale * 63.1176471;
  *(float32x2_t *)v11.f32 = vadd_f32(*(float32x2_t *)v61.i8, vadd_f32(*(float32x2_t *)v60.f32, vmla_f32(vmul_n_f32(*(float32x2_t *)v59.f32, v10), 0, *(float32x2_t *)v58.f32)));
  v11.i64[1] = vextq_s8(v61, v61, 8uLL).u64[0];
  float32x4_t v54 = v59;
  float32x4_t v55 = v58;
  int8x16_t v52 = (int8x16_t)v11;
  float32x4_t v53 = v60;
  float32x2_t v12 = (float32x2_t)vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(v58, (float32x4_t)0), (float32x4_t)vdupq_n_s32(0x422C7878u), v59), (float32x4_t)0, v60), (float32x4_t)0, v11).u64[0];
  double v13 = COERCE_DOUBLE(vadd_f32(v12, v12));
  [(NTKCharacterRenderer *)self _getElbowScaleForPosition:COERCE_DOUBLE((unint64_t)LODWORD(minHandPos))];
  float v15 = v14;
  float v16 = flt_15818[!self->_animatingIntoOrb];
  stateSpecs = self->_stateSpecs;
  arms = self->_arms;
  if (self->_stateSpecs[self->_curState].hourArmOnLeftShoulder)
  {
    [(_Arms *)arms rightShoulderX];
    double v49 = v19;
    if (self->_applyInstantTimeWarp)
    {
      *(float *)&double v19 = v15 * stateSpecs[self->_curState].minuteElbowBend;
    }
    else
    {
      float v21 = v16 * self->_animationFrameInterval;
      float minuteElbowBend = stateSpecs[self->_curState].minuteElbowBend;
      [(_Arms *)self->_arms curRightBend];
      float v24 = -(float)(v23 - (float)(minuteElbowBend * v15));
      [(_Arms *)self->_arms curRightBend];
      *(float *)&double v19 = *(float *)&v19 + (float)(v21 * v24);
    }
    -[_Arms setCurRightBend:](self->_arms, "setCurRightBend:", v19, *(void *)&v49);
    [(_Arms *)self->_arms curRightBend];
  }
  else
  {
    [(_Arms *)arms leftShoulderX];
    double v50 = v20;
    if (self->_applyInstantTimeWarp)
    {
      *(float *)&double v20 = v15 * stateSpecs[self->_curState].minuteElbowBend;
    }
    else
    {
      float v27 = v16 * self->_animationFrameInterval;
      float v28 = stateSpecs[self->_curState].minuteElbowBend;
      [(_Arms *)self->_arms curLeftBend];
      float v30 = -(float)(v29 - (float)(v28 * v15));
      [(_Arms *)self->_arms curLeftBend];
      *(float *)&double v20 = *(float *)&v20 + (float)(v27 * v30);
    }
    -[_Arms setCurLeftBend:](self->_arms, "setCurLeftBend:", v20, *(void *)&v50);
    [(_Arms *)self->_arms curLeftBend];
  }
  LODWORD(v26) = v25;
  double v31 = *(double *)self->_neckBone;
  __asm { FMOV            V1.2S, #0.75 }
  float32x2_t v37 = vmul_f32(*(float32x2_t *)&v31, _D1);
  _D1.i32[0] = v51;
  LODWORD(v31) = vadd_f32(_D1, *(float32x2_t *)&v31).u32[0];
  HIDWORD(v31) = v37.i32[1];
  [(NTKCharacterRenderer *)self _drawArmFromShoulder:v4 toWrist:v31 withBend:v13 withEncoder:v26];
  [(NTKCharacterRenderer *)self bindPipelineState:3 withEncoder:v4];
  objc_msgSend(v4, "setVertexBufferOffset:atIndex:", -[_Arms mtlBufHandOffset](self->_arms, "mtlBufHandOffset"), 0);
  if (self->_pinHandsBrightnessToMax)
  {
    v58.i64[0] = 0x3C003C003C003C00;
    [v4 setFragmentBytes:&v58 length:8 atIndex:0];
  }
  loader = self->_loader;
  float v39 = [(_Arms *)self->_arms texHandMnut];
  float v40 = [v39 objectAtIndexedSubscript:stateSpecs[self->_idealState].minuteTexIdx];
  double v41 = [(NTKCharacterResourceLoader *)loader getMTLTexture:v40];

  [v4 setFragmentTexture:v41 atIndex:0];
  float32x4_t v58 = v55;
  float32x4_t v59 = v54;
  float32x4_t v60 = v53;
  int8x16_t v61 = v52;
  float v56 = COERCE_FLOAT(*(void *)self->_neckBone);
  double v42 = COERCE_FLOAT(HIDWORD(*(void *)self->_neckBone)) * 34.0;
  __double2 v43 = __sincos_stret(self->_minHandPos * -2.0 * 3.14159265);
  *(float *)&unsigned int v44 = v56 * 68.0 * v43.__cosval + v42 * v43.__sinval;
  uint64_t v62 = v44;
  uint64_t v63 = 0;
  *(float *)&uint64_t v45 = characterScale * stateSpecs[self->_idealState].xFlipMinuteHand;
  *((float *)&v45 + 1) = characterScale;
  uint64_t v46 = *(void *)self->_globalOffset;
  uint64_t v64 = *(void *)self->_globalScale;
  uint64_t v65 = v45;
  uint64_t v66 = v46;
  uint64_t v67 = 0;
  [v4 setVertexBytes:&v58 length:112 atIndex:1];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
  if (self->_pinHandsBrightnessToMax)
  {
    _D0.i32[0] = LODWORD(self->_characterBrightness);
    __asm { FCVT            H0, S0 }
    int16x4_t v48 = vdup_lane_s16(_D0, 0);
    v48.i16[3] = COERCE_UNSIGNED_INT(1.0);
    *(int16x4_t *)&v68[0] = v48;
    [v4 setFragmentBytes:v68 length:8 atIndex:0];
  }
}

- (void)renderWithEncoder:(id)a3
{
  id v12 = a3;
  [(NTKCharacterRenderer *)self activate];
  self->_currentPipeline = 5;
  [v12 setVertexBuffer:self->_geometryMtlBuffer offset:0 atIndex:0];
  if (self->_overrideDate || self->_animatingIntoOrb && self->_overrideDateFraction > 0.95)
  {
    self->_sayCheese = 1;
    self->_applyInstantTimeWarp = 1;
    [(NTKCharacterRenderer *)self _resetTimeVariable];
  }
  else
  {
    [(NTKCharacterRenderer *)self _updateTimeVariables];
  }
  [(NTKCharacterRenderer *)self _updateStateAndPose];
  float curTimeMod1Sec = self->_curTimeMod1Sec;
  if (self->_animatingToNewDate)
  {
    float overrideDateFraction = self->_overrideDateFraction;
    if (self->_animatingIntoOrb) {
      float overrideDateFraction = 1.0 - overrideDateFraction;
    }
    self->_dampenBones = overrideDateFraction;
    if (overrideDateFraction < 0.0)
    {
      self->_dampenBones = 0.0;
      float overrideDateFraction = 0.0;
    }
  }
  else
  {
    self->_dampenBones = 1.0;
    float overrideDateFraction = 1.0;
  }
  float v11 = overrideDateFraction;
  v6.f32[0] = curTimeMod1Sec + 0.25;
  v6.f32[1] = curTimeMod1Sec;
  float32x2_t v7 = vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v6), (float64x2_t)xmmword_15930));
  float v9 = v7.f32[0];
  float v10 = cosf(v7.f32[1]);
  v8.f32[0] = cosf(v9);
  v8.f32[1] = v10;
  *(float32x2_t *)self->_neckBone = vmul_n_f32(vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v8), (float64x2_t)xmmword_15940)), v11);
  -[_Body setBone:](self->_body, "setBone:");
  [(_Head *)self->_head setBone:COERCE_DOUBLE(vmul_f32(*(float32x2_t *)self->_neckBone, (float32x2_t)vdup_n_s32(0x3F59999Au)))];
  [(NTKCharacterRenderer *)self _drawBackgroundWithEncoder:v12];
  [(NTKCharacterRenderer *)self _drawCharacterWithEncoder:v12];
  self->_applyInstantTimeWarp = 0;
  self->_sayCheese = 0;
}

- (void)_drawCharacterWithEncoder:(id)a3
{
  id v4 = a3;
  _D0.i32[0] = LODWORD(self->_characterBrightness);
  __asm { FCVT            H0, S0 }
  int16x4_t v9 = vdup_lane_s16(_D0, 0);
  v9.i16[3] = COERCE_UNSIGNED_INT(1.0);
  int16x4_t v12 = v9;
  [v4 setFragmentBytes:&v12 length:8 atIndex:0];
  [(NTKCharacterRenderer *)self _drawBodyWithEncoder:v4];
  [(NTKCharacterRenderer *)self _drawTappingFootWithEncoder:v4];
  [(NTKCharacterRenderer *)self _drawHourHandWithEncoder:v4];
  float minHandPos = self->_minHandPos;
  if (minHandPos > 0.25 && minHandPos < 0.75)
  {
    [(NTKCharacterRenderer *)self _drawMinuteHandWithEncoder:v4];
    [(NTKCharacterRenderer *)self _drawHeadWithEncoder:v4];
  }
  else
  {
    [(NTKCharacterRenderer *)self _drawHeadWithEncoder:v4];
    [(NTKCharacterRenderer *)self _drawMinuteHandWithEncoder:v4];
  }
}

- (int)curState
{
  return self->_curState;
}

- (int)curPose
{
  return self->_curPose;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (BOOL)active
{
  return self->_active;
}

- (NTKCharacterResourceLoader)loader
{
  return self->_loader;
}

- (float)characterBrightness
{
  return self->_characterBrightness;
}

- (void)setCharacterBrightness:(float)a3
{
  self->_characterBrightness = a3;
}

- (float)glowBrightness
{
  return self->_glowBrightness;
}

- (void)setGlowBrightness:(float)a3
{
  self->_glowBrightness = a3;
}

- (float)numbersBrightness
{
  return self->_numbersBrightness;
}

- (void)setNumbersBrightness:(float)a3
{
  self->_numbersBrightness = a3;
}

- (float)numbersScale
{
  return self->_numbersScale;
}

- (void)setNumbersScale:(float)a3
{
  self->_float numbersScale = a3;
}

- (float)numbersAlpha
{
  return self->_numbersAlpha;
}

- (void)setNumbersAlpha:(float)a3
{
  self->_float numbersAlpha = a3;
}

- (double)globalOffset
{
  return *(double *)(a1 + 472);
}

- (void)setGlobalOffset:(NTKCharacterRenderer *)self
{
  *(void *)self->_globalOffset = v2;
}

- (double)globalScale
{
  return *(double *)(a1 + 480);
}

- (void)setGlobalScale:(NTKCharacterRenderer *)self
{
  *(void *)self->_globalScale = v2;
}

- (MTLBuffer)geometryMtlBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 488, 1);
}

- (void)setGeometryMtlBuffer:(id)a3
{
}

- (_Head)head
{
  return (_Head *)objc_getProperty(self, a2, 496, 1);
}

- (void)setHead:(id)a3
{
}

- (_Body)body
{
  return (_Body *)objc_getProperty(self, a2, 504, 1);
}

- (void)setBody:(id)a3
{
}

- (_Foot)foot
{
  return (_Foot *)objc_getProperty(self, a2, 512, 1);
}

- (void)setFoot:(id)a3
{
}

- (_Arms)arms
{
  return (_Arms *)objc_getProperty(self, a2, 520, 1);
}

- (void)setArms:(id)a3
{
}

- (_Background)background
{
  return (_Background *)objc_getProperty(self, a2, 528, 1);
}

- (void)setBackground:(id)a3
{
}

- (UIColor)clothingColor
{
  return (UIColor *)objc_getProperty(self, a2, 536, 1);
}

- (double)desaturation
{
  return self->_desaturation;
}

- (int)modelMatrixLoc
{
  return self->_modelMatrixLoc;
}

- (int)clothingColorLoc
{
  return self->_clothingColorLoc;
}

- (float)characterScale
{
  return self->_characterScale;
}

- (double)headMatrix
{
  objc_copyStruct(&v2, (const void *)(a1 + 560), 64, 1, 0);
  return *(double *)&v2;
}

- (double)neckBone
{
  return *(double *)(a1 + 552);
}

- (float)dampenBones
{
  return self->_dampenBones;
}

- (float)curTimeMod1Sec
{
  return self->_curTimeMod1Sec;
}

- (float)curTimeMod15Sec
{
  return self->_curTimeMod15Sec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clothingColor, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_arms, 0);
  objc_storeStrong((id *)&self->_foot, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_geometryMtlBuffer, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_timeTravelEnterDate, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_pipelines[i + 3], 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_cal, 0);

  objc_storeStrong((id *)&self->_mtlDevice, 0);
}

@end