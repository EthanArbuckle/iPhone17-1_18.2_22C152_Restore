@interface SKAction
+ (BOOL)supportsSecureCoding;
+ (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
+ (SKAction)actionNamed:(NSString *)name;
+ (SKAction)actionNamed:(NSString *)name duration:(NSTimeInterval)duration;
+ (SKAction)actionNamed:(NSString *)name fromURL:(NSURL *)url;
+ (SKAction)actionNamed:(NSString *)name fromURL:(NSURL *)url duration:(NSTimeInterval)duration;
+ (SKAction)animateWithNormalTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec;
+ (SKAction)animateWithNormalTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec resize:(BOOL)resize restore:(BOOL)restore;
+ (SKAction)animateWithTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec;
+ (SKAction)animateWithTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec resize:(BOOL)resize restore:(BOOL)restore;
+ (SKAction)animateWithWarps:(NSArray *)warps times:(NSArray *)times;
+ (SKAction)animateWithWarps:(NSArray *)warps times:(NSArray *)times restore:(BOOL)restore;
+ (SKAction)applyAngularImpulse:(CGFloat)impulse duration:(NSTimeInterval)duration;
+ (SKAction)applyForce:(CGVector)force atPoint:(CGPoint)point duration:(NSTimeInterval)duration;
+ (SKAction)applyForce:(CGVector)force duration:(NSTimeInterval)duration;
+ (SKAction)applyImpulse:(CGVector)impulse atPoint:(CGPoint)point duration:(NSTimeInterval)duration;
+ (SKAction)applyImpulse:(CGVector)impulse duration:(NSTimeInterval)duration;
+ (SKAction)applyTorque:(CGFloat)torque duration:(NSTimeInterval)duration;
+ (SKAction)changeChargeBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeChargeTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeMassBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeMassTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeObstructionBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeObstructionTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeOcclusionBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeOcclusionTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changePlaybackRateBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changePlaybackRateTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeReverbBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeReverbTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeVolumeBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)changeVolumeTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)colorizeWithColor:(UIColor *)color colorBlendFactor:(CGFloat)colorBlendFactor duration:(NSTimeInterval)duration;
+ (SKAction)colorizeWithColorBlendFactor:(CGFloat)colorBlendFactor duration:(NSTimeInterval)sec;
+ (SKAction)customActionWithDuration:(NSTimeInterval)duration actionBlock:(void *)block;
+ (SKAction)fadeAlphaBy:(CGFloat)factor duration:(NSTimeInterval)duration;
+ (SKAction)fadeAlphaTo:(CGFloat)alpha duration:(NSTimeInterval)duration;
+ (SKAction)fadeInWithDuration:(NSTimeInterval)duration;
+ (SKAction)fadeOutWithDuration:(NSTimeInterval)duration;
+ (SKAction)falloffBy:(float)falloff duration:(NSTimeInterval)duration;
+ (SKAction)falloffTo:(float)falloff duration:(NSTimeInterval)duration;
+ (SKAction)followPath:(CGPathRef)path asOffset:(BOOL)offset orientToPath:(BOOL)orient duration:(NSTimeInterval)duration;
+ (SKAction)followPath:(CGPathRef)path asOffset:(BOOL)offset orientToPath:(BOOL)orient speed:(CGFloat)speed;
+ (SKAction)followPath:(CGPathRef)path duration:(NSTimeInterval)duration;
+ (SKAction)followPath:(CGPathRef)path speed:(CGFloat)speed;
+ (SKAction)group:(NSArray *)actions;
+ (SKAction)hide;
+ (SKAction)moveBy:(CGVector)delta duration:(NSTimeInterval)duration;
+ (SKAction)moveByX:(CGFloat)deltaX y:(CGFloat)deltaY duration:(NSTimeInterval)duration;
+ (SKAction)moveTo:(CGPoint)location duration:(NSTimeInterval)duration;
+ (SKAction)moveToX:(CGFloat)x duration:(NSTimeInterval)duration;
+ (SKAction)moveToY:(CGFloat)y duration:(NSTimeInterval)duration;
+ (SKAction)pause;
+ (SKAction)performSelector:(SEL)selector onTarget:(id)target;
+ (SKAction)play;
+ (SKAction)playSoundFileNamed:(NSString *)soundFile waitForCompletion:(BOOL)wait;
+ (SKAction)reachTo:(CGPoint)position rootNode:(SKNode *)root duration:(NSTimeInterval)duration;
+ (SKAction)reachTo:(CGPoint)position rootNode:(SKNode *)root velocity:(CGFloat)velocity;
+ (SKAction)reachToNode:(SKNode *)node rootNode:(SKNode *)root duration:(NSTimeInterval)sec;
+ (SKAction)reachToNode:(SKNode *)node rootNode:(SKNode *)root velocity:(CGFloat)velocity;
+ (SKAction)removeFromParent;
+ (SKAction)repeatAction:(SKAction *)action count:(NSUInteger)count;
+ (SKAction)repeatActionForever:(SKAction *)action;
+ (SKAction)resizeByWidth:(CGFloat)width height:(CGFloat)height duration:(NSTimeInterval)duration;
+ (SKAction)resizeToHeight:(CGFloat)height duration:(NSTimeInterval)duration;
+ (SKAction)resizeToWidth:(CGFloat)width duration:(NSTimeInterval)duration;
+ (SKAction)resizeToWidth:(CGFloat)width height:(CGFloat)height duration:(NSTimeInterval)duration;
+ (SKAction)rotateByAngle:(CGFloat)radians duration:(NSTimeInterval)duration;
+ (SKAction)rotateToAngle:(CGFloat)radians duration:(NSTimeInterval)duration;
+ (SKAction)rotateToAngle:(CGFloat)radians duration:(NSTimeInterval)duration shortestUnitArc:(BOOL)shortestUnitArc;
+ (SKAction)runAction:(SKAction *)action onChildWithName:(NSString *)name;
+ (SKAction)scaleBy:(CGFloat)scale duration:(NSTimeInterval)duration;
+ (SKAction)scaleTo:(CGFloat)scale duration:(NSTimeInterval)duration;
+ (SKAction)scaleToSize:(CGSize)size duration:(NSTimeInterval)duration;
+ (SKAction)scaleXBy:(CGFloat)xScale y:(CGFloat)yScale duration:(NSTimeInterval)duration;
+ (SKAction)scaleXTo:(CGFloat)scale duration:(NSTimeInterval)duration;
+ (SKAction)scaleXTo:(CGFloat)xScale y:(CGFloat)yScale duration:(NSTimeInterval)duration;
+ (SKAction)scaleYTo:(CGFloat)scale duration:(NSTimeInterval)duration;
+ (SKAction)sequence:(NSArray *)actions;
+ (SKAction)setNormalTexture:(SKTexture *)texture;
+ (SKAction)setNormalTexture:(SKTexture *)texture resize:(BOOL)resize;
+ (SKAction)setTexture:(SKTexture *)texture;
+ (SKAction)setTexture:(SKTexture *)texture resize:(BOOL)resize;
+ (SKAction)speedBy:(CGFloat)speed duration:(NSTimeInterval)duration;
+ (SKAction)speedTo:(CGFloat)speed duration:(NSTimeInterval)duration;
+ (SKAction)stereoPanBy:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)stereoPanTo:(float)v duration:(NSTimeInterval)duration;
+ (SKAction)stop;
+ (SKAction)strengthBy:(float)strength duration:(NSTimeInterval)duration;
+ (SKAction)strengthTo:(float)strength duration:(NSTimeInterval)duration;
+ (SKAction)unhide;
+ (SKAction)waitForDuration:(NSTimeInterval)duration;
+ (SKAction)waitForDuration:(NSTimeInterval)duration withRange:(NSTimeInterval)durationRange;
+ (SKAction)warpTo:(SKWarpGeometry *)warp duration:(NSTimeInterval)duration;
+ (id)findNamedActionInBundle:(id)a3;
+ (id)javaScriptActionWithDuration:(double)a3 script:(id)a4;
+ (id)moveBY:(CGVector)a3 duration:(double)a4;
+ (id)playSoundFileNamed:(id)a3;
+ (id)playSoundFileNamed:(id)a3 atPosition:(CGPoint)a4 waitForCompletion:(BOOL)a5;
+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4;
+ (void)addActionsToCachedActionTable:(id)a3;
+ (void)clearActionTableCache;
+ (void)convertAction:(id)a3 toDuration:(double)a4;
- (BOOL)finished;
- (BOOL)isEqualToAction:(id)a3;
- (CGFloat)speed;
- (NSTimeInterval)duration;
- (SKAction)init;
- (SKAction)initWithCoder:(id)a3;
- (SKAction)reversedAction;
- (SKActionTimingFunction)timingFunction;
- (SKActionTimingMode)timingMode;
- (SKCAction)caction;
- (double)ratioForTime:(double)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subactions;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCppAction:(void *)a3;
- (void)setDuration:(NSTimeInterval)duration;
- (void)setFinished:(BOOL)a3;
- (void)setSpeed:(CGFloat)speed;
- (void)setTimingFunction:(SKActionTimingFunction)timingFunction;
- (void)setTimingMode:(SKActionTimingMode)timingMode;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
- (void)wasAddedToTarget:(id)a3 atTime:(double)a4;
- (void)wasPausedWithTarget:(id)a3 atTime:(double)a4;
- (void)wasRemovedFromTarget:(id)a3 atTime:(double)a4;
- (void)willResumeWithTarget:(id)a3 atTime:(double)a4;
- (void)willStartWithTarget:(id)a3 atTime:(double)a4;
@end

@implementation SKAction

+ (SKAction)play
{
  return +[SKAction customActionWithDuration:&__block_literal_global_1 actionBlock:0.0];
}

void __33__SKAction_PlaybackControl__play__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v7;
    v3 = [v2 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v5 = [v2 audioFile];
      v6 = [v2 avAudioNode];
      [v6 scheduleFile:v5 atTime:0 completionHandler:0];
      [v6 play];
    }
  }
}

+ (SKAction)pause
{
  return +[SKAction customActionWithDuration:&__block_literal_global_85 actionBlock:0.0];
}

void __34__SKAction_PlaybackControl__pause__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v6;
    v3 = [v2 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v5 = [v2 avAudioNode];
      [v5 pause];
    }
  }
}

+ (SKAction)stop
{
  return +[SKAction customActionWithDuration:&__block_literal_global_87 actionBlock:0.0];
}

void __33__SKAction_PlaybackControl__stop__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v6;
    v3 = [v2 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v5 = [v2 avAudioNode];
      [v5 stop];
    }
  }
}

+ (SKAction)changePlaybackRateTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 1065353216;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SKAction_PlaybackControl__changePlaybackRateTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&v6[6] = duration;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __59__SKAction_PlaybackControl__changePlaybackRateTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        [v8 rate];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      double v11 = *(double *)(a1 + 48);
      float v12 = 1.0;
      if (v11 > 0.0)
      {
        double v13 = a3 / v11;
        if (a3 / v11 < 0.0) {
          double v13 = 0.0;
        }
        if (v13 > 1.0) {
          double v13 = 1.0;
        }
        float v12 = v13;
      }
      double v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&double v14 = v14;
      [v9 setRate:v14];
    }
  }
}

+ (SKAction)changePlaybackRateBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__SKAction_PlaybackControl__changePlaybackRateBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __59__SKAction_PlaybackControl__changePlaybackRateBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      double v10 = *(double *)(a1 + 40);
      float v11 = 1.0;
      if (v10 > 0.0)
      {
        double v12 = (a3 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        if (v12 > 1.0) {
          double v12 = 1.0;
        }
        float v11 = v12;
      }
      [v8 rate];
      *(float *)&double v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      [v9 setRate:v14];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
  }
}

+ (SKAction)changeVolumeTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SKAction_MixerControl__changeVolumeTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&void v6[6] = duration;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __50__SKAction_MixerControl__changeVolumeTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        [v8 volume];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      double v11 = *(double *)(a1 + 48);
      float v12 = 1.0;
      if (v11 > 0.0)
      {
        double v13 = a3 / v11;
        if (a3 / v11 < 0.0) {
          double v13 = 0.0;
        }
        if (v13 > 1.0) {
          double v13 = 1.0;
        }
        float v12 = v13;
      }
      double v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&double v14 = v14;
      [v9 setVolume:v14];
    }
  }
}

+ (SKAction)changeVolumeBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SKAction_MixerControl__changeVolumeBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __50__SKAction_MixerControl__changeVolumeBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      double v10 = *(double *)(a1 + 40);
      float v11 = 1.0;
      if (v10 > 0.0)
      {
        double v12 = (a3 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        if (v12 > 1.0) {
          double v12 = 1.0;
        }
        float v11 = v12;
      }
      [v8 volume];
      *(float *)&double v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      [v9 setVolume:v14];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
  }
}

+ (SKAction)stereoPanTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 1056964608;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SKAction_SKAudioNode__stereoPanTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&void v6[6] = duration;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __46__SKAction_SKAudioNode__stereoPanTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        [v8 pan];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      double v11 = *(double *)(a1 + 48);
      float v12 = 1.0;
      if (v11 > 0.0)
      {
        double v13 = a3 / v11;
        if (a3 / v11 < 0.0) {
          double v13 = 0.0;
        }
        if (v13 > 1.0) {
          double v13 = 1.0;
        }
        float v12 = v13;
      }
      double v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&double v14 = v14;
      [v9 setPan:v14];
    }
  }
}

+ (SKAction)stereoPanBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SKAction_SKAudioNode__stereoPanBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __46__SKAction_SKAudioNode__stereoPanBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      double v10 = *(double *)(a1 + 40);
      float v11 = 1.0;
      if (v10 > 0.0)
      {
        double v12 = (a3 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        if (v12 > 1.0) {
          double v12 = 1.0;
        }
        float v11 = v12;
      }
      [v8 pan];
      *(float *)&double v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      [v9 setPan:v14];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
  }
}

+ (SKAction)changeReverbTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SKAction_SKAudioNode__changeReverbTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&void v6[6] = duration;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __49__SKAction_SKAudioNode__changeReverbTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        [v8 reverbBlend];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      double v11 = *(double *)(a1 + 48);
      float v12 = 1.0;
      if (v11 > 0.0)
      {
        double v13 = a3 / v11;
        if (a3 / v11 < 0.0) {
          double v13 = 0.0;
        }
        if (v13 > 1.0) {
          double v13 = 1.0;
        }
        float v12 = v13;
      }
      double v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&double v14 = v14;
      [v9 setReverbBlend:v14];
    }
  }
}

+ (SKAction)changeReverbBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SKAction_SKAudioNode__changeReverbBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __49__SKAction_SKAudioNode__changeReverbBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      double v10 = *(double *)(a1 + 40);
      float v11 = 1.0;
      if (v10 > 0.0)
      {
        double v12 = (a3 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        if (v12 > 1.0) {
          double v12 = 1.0;
        }
        float v11 = v12;
      }
      [v8 reverbBlend];
      *(float *)&double v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      [v9 setReverbBlend:v14];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
  }
}

+ (SKAction)changeObstructionTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SKAction_SKAudioNode__changeObstructionTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&void v6[6] = duration;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __54__SKAction_SKAudioNode__changeObstructionTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        [v8 obstruction];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      double v11 = *(double *)(a1 + 48);
      float v12 = 1.0;
      if (v11 > 0.0)
      {
        double v13 = a3 / v11;
        if (a3 / v11 < 0.0) {
          double v13 = 0.0;
        }
        if (v13 > 1.0) {
          double v13 = 1.0;
        }
        float v12 = v13;
      }
      double v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&double v14 = v14;
      [v9 setObstruction:v14];
    }
  }
}

+ (SKAction)changeObstructionBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SKAction_SKAudioNode__changeObstructionBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __54__SKAction_SKAudioNode__changeObstructionBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      double v10 = *(double *)(a1 + 40);
      float v11 = 1.0;
      if (v10 > 0.0)
      {
        double v12 = (a3 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        if (v12 > 1.0) {
          double v12 = 1.0;
        }
        float v11 = v12;
      }
      [v8 obstruction];
      *(float *)&double v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      [v9 setObstruction:v14];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
  }
}

+ (SKAction)changeOcclusionTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SKAction_SKAudioNode__changeOcclusionTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  *(NSTimeInterval *)&void v6[6] = duration;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __52__SKAction_SKAudioNode__changeOcclusionTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        [v8 occlusion];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      double v11 = *(double *)(a1 + 48);
      float v12 = 1.0;
      if (v11 > 0.0)
      {
        double v13 = a3 / v11;
        if (a3 / v11 < 0.0) {
          double v13 = 0.0;
        }
        if (v13 > 1.0) {
          double v13 = 1.0;
        }
        float v12 = v13;
      }
      double v14 = (float)(v12 * *(float *)(a1 + 56))
          + *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) * (1.0 - v12);
      *(float *)&double v14 = v14;
      [v9 setOcclusion:v14];
    }
  }
}

+ (SKAction)changeOcclusionBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SKAction_SKAudioNode__changeOcclusionBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  *(NSTimeInterval *)&v6[5] = duration;
  v6[4] = v8;
  float v7 = v;
  v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __52__SKAction_SKAudioNode__changeOcclusionBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v15;
    id v6 = [v5 avAudioNode];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v8 = [v5 avAudioNode];
      int v9 = v8;
      double v10 = *(double *)(a1 + 40);
      float v11 = 1.0;
      if (v10 > 0.0)
      {
        double v12 = (a3 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / v10;
        if (v12 < 0.0) {
          double v12 = 0.0;
        }
        if (v12 > 1.0) {
          double v12 = 1.0;
        }
        float v11 = v12;
      }
      [v8 occlusion];
      *(float *)&double v14 = v13 + (float)(*(float *)(a1 + 48) * v11);
      [v9 setOcclusion:v14];
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
  }
}

- (SKCAction)caction
{
  return self->_caction;
}

+ (SKAction)warpTo:(SKWarpGeometry *)warp duration:(NSTimeInterval)duration
{
  v4 = +[SKAnimateWarp warpTo:warp duration:duration];

  return (SKAction *)v4;
}

+ (SKAction)animateWithWarps:(NSArray *)warps times:(NSArray *)times
{
  v4 = +[SKAnimateWarp animateWithWarps:warps times:times restore:0];

  return (SKAction *)v4;
}

+ (SKAction)animateWithWarps:(NSArray *)warps times:(NSArray *)times restore:(BOOL)restore
{
  id v5 = +[SKAnimateWarp animateWithWarps:warps times:times restore:restore];

  return (SKAction *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)subactions
{
  return 0;
}

- (SKActionTimingFunction)timingFunction
{
  id v2 = (void *)MEMORY[0x21052F3F0](self->_caction->var3, a2);

  return v2;
}

- (void)setTimingFunction:(SKActionTimingFunction)timingFunction
{
  uint64_t v4 = MEMORY[0x21052F3F0](timingFunction, a2);
  caction = self->_caction;
  id var3 = caction->var3;
  caction->id var3 = (id)v4;
}

- (NSTimeInterval)duration
{
  return self->_caction->var8;
}

- (void)setDuration:(NSTimeInterval)duration
{
  float v3 = duration;
  self->_caction->var8 = v3;
}

- (SKActionTimingMode)timingMode
{
  return self->_caction->var14;
}

- (void)setTimingMode:(SKActionTimingMode)timingMode
{
  self->_caction->var14 = timingMode;
}

- (void)commonInit
{
  if (-[SKAction commonInit]::_tableInit != -1) {
    dispatch_once(&-[SKAction commonInit]::_tableInit, &__block_literal_global_2);
  }
}

void __22__SKAction_commonInit__block_invoke()
{
  v0 = [SKThreadSafeMapTable alloc];
  id v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  id v2 = (void *)_actionTable;
  _actionTable = v1;
}

- (SKAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKAction;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKAction;
  if ([(SKAction *)&v6 init]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [NSNumber numberWithDouble:self->_caction->var8];
  [v6 encodeObject:v4 forKey:@"_duration"];

  id v5 = [NSNumber numberWithInteger:self->_caction->var14];
  [v6 encodeObject:v5 forKey:@"_timingMode"];
}

- (BOOL)isEqualToAction:(id)a3
{
  if (self == a3) {
    return 1;
  }
  caction = self->_caction;
  uint64_t v4 = *((void *)a3 + 1);
  return (COERCE_UNSIGNED_INT(caction->var8 - *(float *)(v4 + 56)) & 0x60000000) == 0
      && caction->var14 == *(void *)(v4 + 88);
}

- (void)setSpeed:(CGFloat)speed
{
  float v3 = speed;
  (*((void (**)(float))self->_caction->var0 + 6))(v3);
}

- (CGFloat)speed
{
  return self->_caction->var17;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKAction *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  caction = self->_caction;
  uint64_t v6 = v4[1];
  *(void *)(v6 + 88) = caction->var14;
  *(void *)(v6 + 100) = *(void *)&caction->var16;
  *(_WORD *)(v6 + 72) = 0;
  *(void *)(v6 + 56) = *(void *)&caction->var8;
  uint64_t v7 = [(SKAction *)self timingFunction];
  uint64_t v8 = v4[1];
  int v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v7;

  return v4;
}

- (SKAction)reversedAction
{
  id v2 = [(SKAction *)self copy];

  return (SKAction *)v2;
}

- (void)dealloc
{
  caction = self->_caction;
  if (caction)
  {
    self->_caction = 0;
    caction->var4 = 0;
    int v4 = caction->var1 - 1;
    caction->var1 = v4;
    if (!v4) {
      (*((void (**)(SKCAction *, SEL))caction->var0 + 1))(caction, a2);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SKAction;
  [(SKAction *)&v5 dealloc];
}

+ (SKAction)moveByX:(CGFloat)deltaX y:(CGFloat)deltaY duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveByX:deltaX y:deltaY duration:duration];
}

+ (SKAction)moveBy:(CGVector)delta duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveByX:delta.dx y:delta.dy duration:duration];
}

+ (id)moveBY:(CGVector)a3 duration:(double)a4
{
  return +[SKMove moveByX:a3.dx y:a3.dy duration:a4];
}

+ (SKAction)moveTo:(CGPoint)location duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveTo:duration:](SKMove, "moveTo:duration:", location.x, location.y, duration);
}

+ (SKAction)moveToX:(CGFloat)x duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveToX:x duration:duration];
}

+ (SKAction)moveToY:(CGFloat)y duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKMove moveToY:y duration:duration];
}

+ (SKAction)rotateByAngle:(CGFloat)radians duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKRotate rotateByAngle:radians duration:duration];
}

+ (SKAction)rotateToAngle:(CGFloat)radians duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKRotate rotateToAngle:radians duration:duration];
}

+ (SKAction)rotateToAngle:(CGFloat)radians duration:(NSTimeInterval)duration shortestUnitArc:(BOOL)shortestUnitArc
{
  return (SKAction *)+[SKRotate rotateToAngle:shortestUnitArc duration:radians shortestUnitArc:duration];
}

+ (SKAction)scaleBy:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleBy:scale duration:duration];
}

+ (SKAction)scaleXBy:(CGFloat)xScale y:(CGFloat)yScale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleXBy:xScale y:yScale duration:duration];
}

+ (SKAction)scaleTo:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleTo:scale duration:duration];
}

+ (SKAction)scaleXTo:(CGFloat)xScale y:(CGFloat)yScale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleXTo:xScale y:yScale duration:duration];
}

+ (SKAction)scaleXTo:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleXTo:scale duration:duration];
}

+ (SKAction)scaleYTo:(CGFloat)scale duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleYTo:scale duration:duration];
}

+ (SKAction)scaleToSize:(CGSize)size duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKScale scaleToSize:duration:](SKScale, "scaleToSize:duration:", size.width, size.height, duration);
}

+ (SKAction)resizeByWidth:(CGFloat)width height:(CGFloat)height duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeByWidth:width height:height duration:duration];
}

+ (SKAction)resizeToWidth:(CGFloat)width height:(CGFloat)height duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeToWidth:width height:height duration:duration];
}

+ (SKAction)resizeToWidth:(CGFloat)width duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeToWidth:width duration:duration];
}

+ (SKAction)resizeToHeight:(CGFloat)height duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKResize resizeToHeight:height duration:duration];
}

+ (SKAction)sequence:(NSArray *)actions
{
  uint64_t v3 = +[SKSequence sequenceWithActions:actions];

  return (SKAction *)v3;
}

+ (SKAction)group:(NSArray *)actions
{
  uint64_t v3 = +[SKGroup groupWithActions:actions];

  return (SKAction *)v3;
}

+ (SKAction)repeatAction:(SKAction *)action count:(NSUInteger)count
{
  int v4 = +[SKRepeat repeatAction:action count:count];

  return (SKAction *)v4;
}

+ (SKAction)repeatActionForever:(SKAction *)action
{
  uint64_t v3 = +[SKRepeat repeatActionForever:action];

  return (SKAction *)v3;
}

+ (SKAction)fadeInWithDuration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeInWithDuration:duration];
}

+ (SKAction)fadeOutWithDuration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeOutWithDuration:duration];
}

+ (SKAction)fadeAlphaBy:(CGFloat)factor duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeAlphaBy:factor duration:duration];
}

+ (SKAction)fadeAlphaTo:(CGFloat)alpha duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFade fadeAlphaTo:alpha duration:duration];
}

+ (SKAction)falloffTo:(float)falloff duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFalloff falloffTo:falloff duration:duration];
}

+ (SKAction)falloffBy:(float)falloff duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFalloff falloffBy:falloff duration:duration];
}

+ (SKAction)hide
{
  return (SKAction *)+[SKHide hide];
}

+ (SKAction)unhide
{
  return (SKAction *)+[SKHide unhide];
}

+ (SKAction)setTexture:(SKTexture *)texture
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = texture;
  v7[0] = v3;
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  objc_super v5 = +[SKAnimate animateWithTextures:v4 timePerFrame:0 resize:0 restore:0.0];

  return (SKAction *)v5;
}

+ (SKAction)setNormalTexture:(SKTexture *)texture
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = texture;
  v7[0] = v3;
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  objc_super v5 = +[SKAnimate animateWithNormalTextures:v4 timePerFrame:0 resize:0 restore:0.0];

  return (SKAction *)v5;
}

+ (SKAction)setTexture:(SKTexture *)texture resize:(BOOL)resize
{
  v8[1] = *MEMORY[0x263EF8340];
  int v4 = texture;
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v6 = +[SKAnimate animateWithTextures:v5 timePerFrame:1 resize:0 restore:0.0];

  return (SKAction *)v6;
}

+ (SKAction)setNormalTexture:(SKTexture *)texture resize:(BOOL)resize
{
  v8[1] = *MEMORY[0x263EF8340];
  int v4 = texture;
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v6 = +[SKAnimate animateWithNormalTextures:v5 timePerFrame:1 resize:0 restore:0.0];

  return (SKAction *)v6;
}

+ (SKAction)animateWithTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec
{
  int v4 = +[SKAnimate animateWithTextures:textures timePerFrame:0 resize:0 restore:sec];

  return (SKAction *)v4;
}

+ (SKAction)animateWithNormalTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec
{
  int v4 = +[SKAnimate animateWithNormalTextures:textures timePerFrame:0 resize:0 restore:sec];

  return (SKAction *)v4;
}

+ (SKAction)animateWithTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec resize:(BOOL)resize restore:(BOOL)restore
{
  uint64_t v6 = +[SKAnimate animateWithTextures:textures timePerFrame:resize resize:restore restore:sec];

  return (SKAction *)v6;
}

+ (SKAction)animateWithNormalTextures:(NSArray *)textures timePerFrame:(NSTimeInterval)sec resize:(BOOL)resize restore:(BOOL)restore
{
  uint64_t v6 = +[SKAnimate animateWithNormalTextures:textures timePerFrame:resize resize:restore restore:sec];

  return (SKAction *)v6;
}

+ (id)playSoundFileNamed:(id)a3
{
  uint64_t v3 = +[SKPlaySound playSoundFileNamed:atPosition:waitForCompletion:](SKPlaySound, "playSoundFileNamed:atPosition:waitForCompletion:", a3, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  return v3;
}

+ (SKAction)playSoundFileNamed:(NSString *)soundFile waitForCompletion:(BOOL)wait
{
  int v4 = +[SKPlaySound playSoundFileNamed:atPosition:waitForCompletion:](SKPlaySound, "playSoundFileNamed:atPosition:waitForCompletion:", soundFile, wait, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  return (SKAction *)v4;
}

+ (id)playSoundFileNamed:(id)a3 atPosition:(CGPoint)a4 waitForCompletion:(BOOL)a5
{
  objc_super v5 = +[SKPlaySound playSoundFileNamed:atPosition:waitForCompletion:](SKPlaySound, "playSoundFileNamed:atPosition:waitForCompletion:", a3, a5, a4.x, a4.y);

  return v5;
}

+ (SKAction)colorizeWithColor:(UIColor *)color colorBlendFactor:(CGFloat)colorBlendFactor duration:(NSTimeInterval)duration
{
  objc_super v5 = +[SKColorize colorizeWithColor:color colorBlendFactor:colorBlendFactor duration:duration];

  return (SKAction *)v5;
}

+ (SKAction)colorizeWithColorBlendFactor:(CGFloat)colorBlendFactor duration:(NSTimeInterval)sec
{
  return (SKAction *)+[SKColorize colorizeWithColorBlendFactor:colorBlendFactor duration:sec];
}

+ (SKAction)followPath:(CGPathRef)path duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFollowPath followPath:path duration:duration];
}

+ (SKAction)followPath:(CGPathRef)path asOffset:(BOOL)offset orientToPath:(BOOL)orient duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKFollowPath followPath:path asOffset:offset orientToPath:orient duration:duration];
}

+ (SKAction)followPath:(CGPathRef)path speed:(CGFloat)speed
{
  return (SKAction *)+[SKFollowPath followPath:path speed:speed];
}

+ (SKAction)followPath:(CGPathRef)path asOffset:(BOOL)offset orientToPath:(BOOL)orient speed:(CGFloat)speed
{
  return (SKAction *)+[SKFollowPath followPath:path asOffset:offset orientToPath:orient speed:speed];
}

+ (SKAction)speedBy:(CGFloat)speed duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKSpeed speedBy:speed duration:duration];
}

+ (SKAction)speedTo:(CGFloat)speed duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKSpeed speedTo:speed duration:duration];
}

+ (SKAction)strengthTo:(float)strength duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKStrength strengthTo:strength duration:duration];
}

+ (SKAction)strengthBy:(float)strength duration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKStrength strengthBy:strength duration:duration];
}

+ (SKAction)reachTo:(CGPoint)position rootNode:(SKNode *)root duration:(NSTimeInterval)duration
{
  objc_super v5 = +[SKReach reachTo:rootNode:duration:](SKReach, "reachTo:rootNode:duration:", root, position.x, position.y, duration);

  return (SKAction *)v5;
}

+ (SKAction)reachTo:(CGPoint)position rootNode:(SKNode *)root velocity:(CGFloat)velocity
{
  objc_super v5 = +[SKReach reachTo:rootNode:velocity:](SKReach, "reachTo:rootNode:velocity:", root, position.x, position.y, velocity);

  return (SKAction *)v5;
}

+ (SKAction)reachToNode:(SKNode *)node rootNode:(SKNode *)root duration:(NSTimeInterval)sec
{
  uint64_t v6 = node;
  uint64_t v7 = root;
  [(SKNode *)v6 position];
  uint64_t v8 = +[SKAction reachTo:rootNode:duration:](SKAction, "reachTo:rootNode:duration:", v7);

  return (SKAction *)v8;
}

+ (SKAction)reachToNode:(SKNode *)node rootNode:(SKNode *)root velocity:(CGFloat)velocity
{
  uint64_t v6 = node;
  uint64_t v7 = root;
  [(SKNode *)v6 position];
  uint64_t v8 = +[SKAction reachTo:rootNode:velocity:](SKAction, "reachTo:rootNode:velocity:", v7);

  return (SKAction *)v8;
}

+ (SKAction)waitForDuration:(NSTimeInterval)duration
{
  return (SKAction *)+[SKWait waitForDuration:duration];
}

+ (SKAction)waitForDuration:(NSTimeInterval)duration withRange:(NSTimeInterval)durationRange
{
  return (SKAction *)+[SKWait waitForDuration:duration withRange:durationRange];
}

+ (SKAction)removeFromParent
{
  return (SKAction *)+[SKRemove removeFromParent];
}

+ (SKAction)performSelector:(SEL)selector onTarget:(id)target
{
  int v4 = +[SKPerformSelector perfromSelector:selector onTarget:target];

  return (SKAction *)v4;
}

+ (SKAction)runAction:(SKAction *)action onChildWithName:(NSString *)name
{
  int v4 = +[SKRunAction runAction:action onFirstChildWithName:name];

  return (SKAction *)v4;
}

+ (id)javaScriptActionWithDuration:(double)a3 script:(id)a4
{
  int v4 = +[SKJavaScriptAction javaScriptActionWithDuration:a4 script:a3];

  return v4;
}

+ (SKAction)customActionWithDuration:(NSTimeInterval)duration actionBlock:(void *)block
{
  int v4 = +[SKCustomAction customActionWithDuration:block actionBlock:duration];

  return (SKAction *)v4;
}

+ (SKAction)actionNamed:(NSString *)name
{
  int v4 = name;
  objc_super v5 = [(id)_actionTable objectForKey:v4];
  if (!v5)
  {
    objc_super v5 = [a1 findNamedActionInBundle:v4];
  }

  return (SKAction *)v5;
}

+ (SKAction)actionNamed:(NSString *)name duration:(NSTimeInterval)duration
{
  uint64_t v6 = [a1 actionNamed:name];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void *)[v6 copy];

    [a1 convertAction:v8 toDuration:duration];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (SKAction *)v8;
}

+ (SKAction)actionNamed:(NSString *)name fromURL:(NSURL *)url
{
  v23[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = name;
  uint64_t v7 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v8 = [(NSURL *)url path];
  int v9 = [v7 dataWithContentsOfFile:v8];

  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  float v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
  [v10 addObjectsFromArray:v11];

  id v22 = 0;
  double v12 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v9 error:&v22];
  id v13 = v22;
  [v12 setRequiresSecureCoding:0];
  uint64_t v14 = *MEMORY[0x263F081D0];
  id v21 = v13;
  id v15 = [v12 decodeTopLevelObjectOfClasses:v10 forKey:v14 error:&v21];
  id v16 = v21;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v15 objectForKeyedSubscript:@"actions"];
    v18 = [v17 objectForKeyedSubscript:v6];
    if (v18)
    {
      [a1 addActionsToCachedActionTable:v17];
LABEL_8:

      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v15;
    v18 = [v17 actionForName:v6];
    if (v18)
    {
      v19 = [v17 actionTableDictionary];
      [a1 addActionsToCachedActionTable:v19];
    }
    goto LABEL_8;
  }
  v18 = 0;
LABEL_10:

  return (SKAction *)v18;
}

+ (SKAction)actionNamed:(NSString *)name fromURL:(NSURL *)url duration:(NSTimeInterval)duration
{
  uint64_t v7 = [a1 actionNamed:name fromURL:url];
  if (v7) {
    [a1 convertAction:v7 toDuration:duration];
  }

  return (SKAction *)v7;
}

+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 enumeratorAtPath:v6];
  id v10 = 0;
LABEL_2:

  float v11 = v10;
  while (1)
  {
    id v10 = [v9 nextObject];

    if (!v10) {
      break;
    }
    double v12 = [v10 pathExtension];
    uint64_t v13 = [v12 caseInsensitiveCompare:v5];

    float v11 = v10;
    if (!v13)
    {
      uint64_t v8 = [v6 stringByAppendingPathComponent:v10];
      [v7 addObject:v8];
      goto LABEL_2;
    }
  }
  uint64_t v14 = (void *)MEMORY[0x263EFF9C0];
  id v15 = SKGetResourceBundle();
  id v16 = [v15 pathsForResourcesOfType:@"sks" inDirectory:0];
  id v17 = [v14 setWithArray:v16];

  v18 = [MEMORY[0x263EFFA08] setWithArray:v7];
  [v17 unionSet:v18];

  v19 = [v17 allObjects];

  return v19;
}

+ (id)findNamedActionInBundle:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v51 = a3;
  uint64_t v3 = SKGetResourceBundle();
  int v4 = [v3 bundlePath];
  id v5 = [a1 recursivePathsForResourcesOfType:@"sks" inDirectory:v4];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (!v6) {
    goto LABEL_50;
  }
  uint64_t v58 = *(void *)v62;
  uint64_t v52 = *MEMORY[0x263F081D0];
  do
  {
    uint64_t v59 = v6;
    for (uint64_t i = 0; i != v59; ++i)
    {
      if (*(void *)v62 != v58) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v61 + 1) + 8 * i);
      int v9 = [NSDictionary dictionaryWithContentsOfFile:v8];
      id v10 = [v9 objectForKeyedSubscript:@"$objects"];
      float v11 = v10;
      if (v10 && (unint64_t)[v10 count] >= 2)
      {
        double v12 = [v11 objectAtIndexedSubscript:1];
        uint64_t v13 = [v12 objectForKeyedSubscript:@"$class"];
        uint64_t v14 = (void *)v13;
        v57 = v12;
        if (!v13) {
          goto LABEL_21;
        }
        unint64_t v15 = *(unsigned int *)(v13 + 16);
        if ([v11 count] <= v15) {
          goto LABEL_21;
        }
        id v16 = [v11 objectAtIndexedSubscript:v15];
        id v17 = [v16 objectForKeyedSubscript:@"$classname"];
        char v18 = [v17 isEqualToString:@"NSDictionary"];

        if (v18)
        {
          v19 = [v57 objectForKeyedSubscript:@"NS.keys"];
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v54 = v19;
          uint64_t v20 = [v54 countByEnumeratingWithState:&v65 objects:v71 count:16];
          if (v20)
          {
            uint64_t v55 = *(void *)v66;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v66 != v55) {
                  objc_enumerationMutation(v54);
                }
                unint64_t v22 = *(unsigned int *)(*(void *)(*((void *)&v65 + 1) + 8 * j) + 16);
                unint64_t v23 = [v11 count];
                BOOL v24 = v23 > v22;
                if (v23 > v22)
                {
                  v25 = [v11 objectAtIndexedSubscript:v22];
                  char v26 = [v25 isEqualToString:@"actions"];

                  if ((v26 & 1) == 0) {
                    continue;
                  }
                }
                char v27 = 0;
                goto LABEL_35;
              }
              uint64_t v20 = [v54 countByEnumeratingWithState:&v65 objects:v71 count:16];
              BOOL v24 = 0;
              char v27 = 1;
              if (v20) {
                continue;
              }
              break;
            }
          }
          else
          {
            BOOL v24 = 0;
            char v27 = 1;
          }
LABEL_35:

          if ((v27 & 1) == 0)
          {

            if (v24) {
              goto LABEL_37;
            }
            goto LABEL_23;
          }
        }
        else
        {
LABEL_21:
        }
      }

LABEL_23:
      v28 = [v9 objectForKeyedSubscript:@"$objects"];
      v29 = v28;
      if (!v28 || (unint64_t)[v28 count] < 2) {
        goto LABEL_30;
      }
      v30 = [v29 objectAtIndexedSubscript:1];
      uint64_t v31 = [v30 objectForKeyedSubscript:@"$class"];
      v32 = (void *)v31;
      if (!v31) {
        goto LABEL_29;
      }
      unint64_t v33 = *(unsigned int *)(v31 + 16);
      if ([v29 count] <= v33
        || ([v29 objectAtIndexedSubscript:v33],
            v34 = objc_claimAutoreleasedReturnValue(),
            [v34 objectForKeyedSubscript:@"$classname"],
            v35 = objc_claimAutoreleasedReturnValue(),
            int v36 = [v35 isEqualToString:@"SKActionTable"],
            v35,
            v34,
            !v36))
      {
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }

LABEL_37:
      v37 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v8];
      id v38 = objc_alloc(MEMORY[0x263F08928]);
      id v60 = 0;
      v39 = (void *)[v38 initForReadingFromData:v37 error:&v60];
      id v40 = v60;
      [v39 setRequiresSecureCoding:0];
      [v39 setDelegate:a1];
      v41 = (void *)MEMORY[0x263EFFA08];
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      v69[2] = objc_opt_class();
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:3];
      v43 = [v41 setWithArray:v42];
      v44 = [v39 decodeObjectOfClasses:v43 forKey:v52];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v45 = [v44 objectForKeyedSubscript:@"actions"];
        uint64_t v46 = [v45 objectForKeyedSubscript:v51];
        if (v46)
        {
          [a1 addActionsToCachedActionTable:v45];
LABEL_43:
          char v48 = 0;
          id v50 = (id)v46;
LABEL_45:

          goto LABEL_47;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v45 = v44;
        uint64_t v46 = [v45 actionForName:v51];
        if (v46)
        {
          v47 = [v45 actionTableDictionary];
          [a1 addActionsToCachedActionTable:v47];

          goto LABEL_43;
        }
LABEL_44:
        char v48 = 1;
        goto LABEL_45;
      }
      char v48 = 1;
LABEL_47:

      if ((v48 & 1) == 0)
      {

        goto LABEL_51;
      }
LABEL_31:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  }
  while (v6);
LABEL_50:
  id v50 = 0;
LABEL_51:

  return v50;
}

+ (void)addActionsToCachedActionTable:(id)a3
{
}

uint64_t __53__SKAction_SKActions__addActionsToCachedActionTable___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [(id)_actionTable setObject:a3 forKey:a2];
}

+ (void)convertAction:(id)a3 toDuration:(double)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v31 = a3;
  [v31 duration];
  double v6 = v5;
  long long v30 = 0u;
  memset(v29, 0, sizeof(v29));
  std::deque<SKAction * {__strong}>::push_back(v29, &v31);
  while (*((void *)&v30 + 1))
  {
    id v7 = objc_retain(*(id *)(*(void *)(*((void *)&v29[0] + 1)
                                       + (((unint64_t)(*((void *)&v30 + 1) + v30 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * ((*((void *)&v30 + 1) + v30 - 1) & 0x1FF)));
    std::deque<SKAction * {__strong}>::pop_back(v29);
    [v7 duration];
    if (v8 > v6)
    {
      [v7 duration];
      double v6 = v9;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [v7 subactions];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          id v28 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          std::deque<SKAction * {__strong}>::push_back(v29, &v28);
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }
  }
  if (v6 != 0.0)
  {
    std::deque<SKAction * {__strong}>::push_back(v29, &v31);
    while (*((void *)&v30 + 1))
    {
      id v14 = objc_retain(*(id *)(*(void *)(*((void *)&v29[0] + 1)
                                          + (((unint64_t)(*((void *)&v30 + 1) + v30 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * ((*((void *)&v30 + 1) + v30 - 1) & 0x1FF)));
      std::deque<SKAction * {__strong}>::pop_back(v29);
      [v14 duration];
      [v14 setDuration:v15 / v6 * a4];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = objc_msgSend(v14, "subactions", 0);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v21;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v21 != v18) {
              objc_enumerationMutation(v16);
            }
            id v28 = *(id *)(*((void *)&v20 + 1) + 8 * j);
            std::deque<SKAction * {__strong}>::push_back(v29, &v28);
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v32 count:16];
        }
        while (v17);
      }
    }
  }
  std::deque<SKAction * {__strong}>::~deque[abi:ne180100](v29);
}

+ (void)clearActionTableCache
{
  if (_actionTable) {
    [(id)_actionTable removeAllObjects];
  }
}

+ (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v5 = a5;
  if ((unint64_t)[v5 count] < 2)
  {
    id v7 = 0;
  }
  else
  {
    double v6 = [v5 objectAtIndex:1];
    id v7 = NSClassFromString(v6);
  }

  return (Class)v7;
}

- (void)setCppAction:(void *)a3
{
  ++*((_DWORD *)a3 + 2);
  caction = self->_caction;
  if (caction)
  {
    int v6 = caction->var1 - 1;
    caction->var1 = v6;
    if (!v6) {
      (*((void (**)(SKCAction *, SEL))caction->var0 + 1))(caction, a2);
    }
  }
  self->_caction = (SKCAction *)a3;
  *((void *)a3 + 3) = self;
}

- (void)wasPausedWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var7 = a4;
}

- (void)willResumeWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var6 = self->_caction->var6 + a4 - self->_caction->var7;
}

- (BOOL)finished
{
  return self->_caction->var11;
}

- (void)setFinished:(BOOL)a3
{
  self->_caction->var11 = a3;
}

- (double)ratioForTime:(double)a3
{
  SKCAction::ratioForTime(self->_caction, a3);
  return v3;
}

- (void)wasAddedToTarget:(id)a3 atTime:(double)a4
{
  caction = self->_caction;
  caction->var11 = 0;
  float var8 = caction->var8;
  float var9 = caction->var9;
  if ((LODWORD(var9) & 0x60000000) != 0)
  {
    float v8 = (float)(var8 - (float)(var9 * 0.5))
       + (float)((float)((float)rand() * 4.6566e-10)
               * (float)((float)((float)(var9 * 0.5) + var8) - (float)(var8 - (float)(var9 * 0.5))));
    if (v8 < 0.0) {
      float v8 = 0.0;
    }
    self->_caction->var2 = v8;
  }
  else
  {
    caction->var2 = var8;
  }
}

- (void)wasRemovedFromTarget:(id)a3 atTime:(double)a4
{
  *(_WORD *)&self->_caction->var11 = 1;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  caction = self->_caction;
  caction->var6 = a4;
  caction->var15 = 0.0;
  *(_WORD *)&caction->var11 = 256;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v10 = a3;
  SKCAction::ratioForTime(self->_caction, a4);
  if (v6 >= 1.0)
  {
    caction = self->_caction;
    float v8 = (SKCNode *)[v10 _backingNode];
    v9.n128_f64[0] = a4;
    SKCAction::didFinishWithTargetAtTime(caction, v8, v9);
  }
}

+ (SKAction)changeChargeTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  void v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SKAction_NodeWithPhysicsBody__changeChargeTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  float v7 = v;
  *(NSTimeInterval *)&void v6[6] = duration;
  int v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __57__SKAction_NodeWithPhysicsBody__changeChargeTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v14 = v5;
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0.0)
  {
    float v6 = *(float *)(a1 + 56);
    float v7 = [v5 physicsBody];
    [v7 charge];
    *(float *)&double v8 = v6 - v8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = LODWORD(v8);

    id v5 = v14;
  }
  int v9 = [v5 physicsBody];
  float v10 = *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v11 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v12 = *(double *)(a1 + 48);
  [v9 charge];
  [v9 setCharge:v13 + (a3 - v11) * v10 / v12];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)changeChargeBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SKAction_NodeWithPhysicsBody__changeChargeBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  float v7 = v;
  v6[4] = v8;
  *(NSTimeInterval *)&v6[5] = duration;
  int v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __57__SKAction_NodeWithPhysicsBody__changeChargeBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = [a2 physicsBody];
  float v6 = *(float *)(a1 + 48);
  double v7 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v8 = *(double *)(a1 + 40);
  [v5 charge];
  [v5 setCharge:v9 + (a3 - v7) * v6 / v8];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)changeMassTo:(float)v duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  void v10[3] = 0;
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  int v9 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SKAction_NodeWithPhysicsBody__changeMassTo_duration___block_invoke;
  v6[3] = &unk_263FE9DB8;
  v6[4] = v10;
  v6[5] = v8;
  float v7 = v;
  *(NSTimeInterval *)&void v6[6] = duration;
  int v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

  return (SKAction *)v4;
}

void __55__SKAction_NodeWithPhysicsBody__changeMassTo_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v18 = v5;
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0.0)
  {
    float v6 = *(float *)(a1 + 56);
    float v7 = [v5 physicsBody];
    [v7 mass];
    *(float *)&double v8 = v6 - v8;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = LODWORD(v8);

    id v5 = v18;
  }
  int v9 = [v5 physicsBody];
  [v9 mass];
  double v11 = v10;
  float v12 = *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v13 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v14 = *(double *)(a1 + 48);

  double v15 = [v18 physicsBody];
  id v16 = v15;
  float v17 = v11 + (a3 - v13) * v12 / v14;
  if (v17 < 0.00001) {
    float v17 = 0.00001;
  }
  [v15 setMass:v17];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)changeMassBy:(float)v duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SKAction_NodeWithPhysicsBody__changeMassBy_duration___block_invoke;
  v6[3] = &unk_263FE9DE0;
  float v7 = v;
  v6[4] = v8;
  *(NSTimeInterval *)&v6[5] = duration;
  int v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __55__SKAction_NodeWithPhysicsBody__changeMassBy_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v14 = a2;
  id v5 = [v14 physicsBody];
  [v5 mass];
  double v7 = v6;
  float v8 = *(float *)(a1 + 48);
  double v9 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v10 = *(double *)(a1 + 40);

  double v11 = [v14 physicsBody];
  float v12 = v11;
  float v13 = v7 + (a3 - v9) * v8 / v10;
  if (v13 < 0.00001) {
    float v13 = 0.00001;
  }
  [v11 setMass:v13];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)applyForce:(CGVector)force duration:(NSTimeInterval)duration
{
  return +[SKAction applyImpulse:force.dx * duration duration:force.dy * duration];
}

+ (SKAction)applyForce:(CGVector)force atPoint:(CGPoint)point duration:(NSTimeInterval)duration
{
  return +[SKAction applyImpulse:atPoint:duration:](SKAction, "applyImpulse:atPoint:duration:", force.dx * duration, force.dy * duration, point.x, point.y);
}

+ (SKAction)applyTorque:(CGFloat)torque duration:(NSTimeInterval)duration
{
  return +[SKAction applyAngularImpulse:duration:](SKAction, "applyAngularImpulse:duration:", torque * duration);
}

+ (SKAction)applyImpulse:(CGVector)impulse duration:(NSTimeInterval)duration
{
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  void v8[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SKAction_NodeWithPhysicsBody__applyImpulse_duration___block_invoke;
  v6[3] = &unk_263FEA600;
  v6[4] = v8;
  *(NSTimeInterval *)&v6[5] = duration;
  CGVector v7 = impulse;
  int v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v8, 8);

  return (SKAction *)v4;
}

void __55__SKAction_NodeWithPhysicsBody__applyImpulse_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v6 = *(double *)(a1 + 40);
  CGVector v7 = [a2 physicsBody];
  float v8 = (a3 - v5) / v6;
  objc_msgSend(v7, "applyImpulse:", *(double *)(a1 + 48) * v8, *(double *)(a1 + 56) * v8);

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)applyImpulse:(CGVector)impulse atPoint:(CGPoint)point duration:(NSTimeInterval)duration
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  void v10[3] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __63__SKAction_NodeWithPhysicsBody__applyImpulse_atPoint_duration___block_invoke;
  v7[3] = &unk_263FEA628;
  v7[4] = v10;
  *(NSTimeInterval *)&v7[5] = duration;
  CGVector v8 = impulse;
  CGPoint v9 = point;
  double v5 = +[SKAction customActionWithDuration:v7 actionBlock:duration];
  _Block_object_dispose(v10, 8);

  return (SKAction *)v5;
}

void __63__SKAction_NodeWithPhysicsBody__applyImpulse_atPoint_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v6 = *(double *)(a1 + 40);
  CGVector v7 = [a2 physicsBody];
  float v8 = (a3 - v5) / v6;
  objc_msgSend(v7, "applyImpulse:atPoint:", *(double *)(a1 + 48) * v8, *(double *)(a1 + 56) * v8, *(double *)(a1 + 64), *(double *)(a1 + 72));

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

+ (SKAction)applyAngularImpulse:(CGFloat)impulse duration:(NSTimeInterval)duration
{
  v7[0] = 0;
  v7[1] = v7;
  void v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__SKAction_NodeWithPhysicsBody__applyAngularImpulse_duration___block_invoke;
  v6[3] = &unk_263FEA650;
  v6[4] = v7;
  *(NSTimeInterval *)&v6[5] = duration;
  *(CGFloat *)&void v6[6] = impulse;
  int v4 = +[SKAction customActionWithDuration:v6 actionBlock:duration];
  _Block_object_dispose(v7, 8);

  return (SKAction *)v4;
}

void __62__SKAction_NodeWithPhysicsBody__applyAngularImpulse_duration___block_invoke(uint64_t a1, void *a2, double a3)
{
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v6 = *(double *)(a1 + 40);
  CGVector v7 = [a2 physicsBody];
  float v8 = (a3 - v5) / v6;
  [v7 applyAngularImpulse:*(double *)(a1 + 48) * v8];

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
}

@end