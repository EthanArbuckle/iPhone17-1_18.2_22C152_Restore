@interface SCNAction
+ (BOOL)supportsSecureCoding;
+ (SCNAction)customActionWithDuration:(NSTimeInterval)seconds actionBlock:(void *)block;
+ (SCNAction)fadeInWithDuration:(NSTimeInterval)sec;
+ (SCNAction)fadeOpacityBy:(CGFloat)factor duration:(NSTimeInterval)sec;
+ (SCNAction)fadeOpacityTo:(CGFloat)opacity duration:(NSTimeInterval)sec;
+ (SCNAction)fadeOutWithDuration:(NSTimeInterval)sec;
+ (SCNAction)group:(NSArray *)actions;
+ (SCNAction)hide;
+ (SCNAction)javaScriptActionWithScript:(NSString *)script duration:(NSTimeInterval)seconds;
+ (SCNAction)moveBy:(SCNVector3)delta duration:(NSTimeInterval)duration;
+ (SCNAction)moveByX:(CGFloat)deltaX y:(CGFloat)deltaY z:(CGFloat)deltaZ duration:(NSTimeInterval)duration;
+ (SCNAction)moveTo:(SCNVector3)location duration:(NSTimeInterval)duration;
+ (SCNAction)playAudioSource:(SCNAudioSource *)source waitForCompletion:(BOOL)wait;
+ (SCNAction)removeFromParentNode;
+ (SCNAction)repeatAction:(SCNAction *)action count:(NSUInteger)count;
+ (SCNAction)repeatActionForever:(SCNAction *)action;
+ (SCNAction)rotateByAngle:(CGFloat)angle aroundAxis:(SCNVector3)axis duration:(NSTimeInterval)duration;
+ (SCNAction)rotateByX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration;
+ (SCNAction)rotateToAxisAngle:(SCNVector4)axisAngle duration:(NSTimeInterval)duration;
+ (SCNAction)rotateToX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration;
+ (SCNAction)rotateToX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration shortestUnitArc:(BOOL)shortestUnitArc;
+ (SCNAction)runBlock:(void *)block;
+ (SCNAction)runBlock:(void *)block queue:(dispatch_queue_t)queue;
+ (SCNAction)scaleBy:(CGFloat)scale duration:(NSTimeInterval)sec;
+ (SCNAction)scaleTo:(CGFloat)scale duration:(NSTimeInterval)sec;
+ (SCNAction)sequence:(NSArray *)actions;
+ (SCNAction)unhide;
+ (SCNAction)waitForDuration:(NSTimeInterval)sec;
+ (SCNAction)waitForDuration:(NSTimeInterval)sec withRange:(NSTimeInterval)durationRange;
+ (id)actionNamed:(id)a3;
+ (id)performSelector:(SEL)a3 onTarget:(id)a4;
+ (id)runAction:(id)a3 onChildNodeWithName:(id)a4;
+ (void)setEditingModeEnabled:(BOOL)a3;
- (BOOL)finished;
- (BOOL)isCustom;
- (BOOL)isRelative;
- (CGFloat)speed;
- (NSTimeInterval)duration;
- (SCNAction)init;
- (SCNAction)initWithCoder:(id)a3;
- (SCNAction)reversedAction;
- (SCNActionTimingFunction)timingFunction;
- (SCNActionTimingMode)timingMode;
- (SCNCAction)caction;
- (double)durationRange;
- (double)ratioForTime:(double)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCppAction:(void *)a3;
- (void)setDuration:(NSTimeInterval)duration;
- (void)setDurationRange:(double)a3;
- (void)setFinished:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSpeed:(CGFloat)speed;
- (void)setTimingFunction:(SCNActionTimingFunction)timingFunction;
- (void)setTimingMode:(SCNActionTimingMode)timingMode;
- (void)timeJumpWithTarget:(id)a3 timeOffset:(double)a4;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
- (void)wasAddedToTarget:(id)a3 atTime:(double)a4;
- (void)wasPausedWithTarget:(id)a3 atTime:(double)a4;
- (void)wasRemovedFromTarget:(id)a3 atTime:(double)a4;
- (void)willResumeWithTarget:(id)a3 atTime:(double)a4;
- (void)willStartWithTarget:(id)a3 atTime:(double)a4;
@end

@implementation SCNAction

+ (void)setEditingModeEnabled:(BOOL)a3
{
}

- (SCNActionTimingFunction)timingFunction
{
  return self->_caction->var2;
}

- (void)setTimingFunction:(SCNActionTimingFunction)timingFunction
{
  id var2 = self->_caction->var2;
  if (var2 != timingFunction)
  {
    if (var2)
    {
      _Block_release(var2);
      self->_caction->id var2 = 0;
    }
    if (timingFunction) {
      self->_caction->id var2 = _Block_copy(timingFunction);
    }
  }
}

- (SCNCAction)caction
{
  return self->_caction;
}

- (NSTimeInterval)duration
{
  return self->_caction->var7;
}

- (void)setDuration:(NSTimeInterval)duration
{
  self->_caction->var7 = duration;
}

- (double)durationRange
{
  return self->_caction->var8;
}

- (void)setDurationRange:(double)a3
{
  self->_caction->var8 = a3;
}

- (SCNActionTimingMode)timingMode
{
  return self->_caction->var14;
}

- (void)setTimingMode:(SCNActionTimingMode)timingMode
{
  self->_caction->var14 = timingMode;
}

- (BOOL)isCustom
{
  return 0;
}

- (BOOL)isRelative
{
  return 0;
}

- (id)parameters
{
  return 0;
}

- (SCNAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAction;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNAction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNAction;
  if ([(SCNAction *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_caction->var7), @"_duration");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_caction->var14), @"_timingMode");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_caction->var5), @"_beginTime");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_caction->var6), @"_pausedTime");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_caction->var11), @"_isRunning");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_caction->var10), @"_finished");
  var13 = self->_caction->var13;
  objc_opt_class();

  SCNEncodeNamedObject(a3, (const char *)var13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSpeed:(CGFloat)speed
{
}

- (CGFloat)speed
{
  return self->_caction->var17;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x210534CB0](self, a2);

  return [(SCNAction *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v4 caction];
  caction = self->_caction;
  *(void *)(v5 + 104) = caction->var14;
  *(_OWORD *)(v5 + 120) = *(_OWORD *)&caction->var16;
  *(double *)(v5 + 136) = caction->var18;
  *(_WORD *)(v5 + 80) = 0;
  *(_OWORD *)(v5 + 56) = *(_OWORD *)&caction->var7;
  id var2 = caction->var2;
  if (var2) {
    *(void *)(v5 + 16) = _Block_copy(var2);
  }
  return v4;
}

- (SCNAction)reversedAction
{
  id v2 = [(SCNAction *)self copy];

  return (SCNAction *)v2;
}

- (void)dealloc
{
  caction = self->_caction;
  if (caction)
  {
    caction->var3 = 0;
    (*((void (**)(SCNCAction *, SEL))caction->var0 + 1))(caction, a2);
    self->_caction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNAction;
  [(SCNAction *)&v4 dealloc];
}

+ (SCNAction)moveByX:(CGFloat)deltaX y:(CGFloat)deltaY z:(CGFloat)deltaZ duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionMove moveByX:deltaX y:deltaY z:deltaZ duration:duration];
}

+ (SCNAction)moveBy:(SCNVector3)delta duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionMove moveByX:delta.x y:delta.y z:delta.z duration:duration];
}

+ (SCNAction)moveTo:(SCNVector3)location duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionMove moveToX:location.x y:location.y z:location.z duration:duration];
}

+ (SCNAction)rotateByX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateByX:xAngle y:yAngle z:zAngle duration:duration];
}

+ (SCNAction)rotateToX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateToX:xAngle y:yAngle z:zAngle duration:duration];
}

+ (SCNAction)rotateByAngle:(CGFloat)angle aroundAxis:(SCNVector3)axis duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateByAngle:aroundAxis:duration:](SCNActionRotate, "rotateByAngle:aroundAxis:duration:", angle, *(double *)&axis.x, *(double *)&axis.y, *(double *)&axis.z, duration);
}

+ (SCNAction)rotateToAxisAngle:(SCNVector4)axisAngle duration:(NSTimeInterval)duration
{
  return (SCNAction *)+[SCNActionRotate rotateToAxisAngle:duration:](SCNActionRotate, "rotateToAxisAngle:duration:", *(double *)&axisAngle.x, *(double *)&axisAngle.y, *(double *)&axisAngle.z, *(double *)&axisAngle.w, duration);
}

+ (SCNAction)rotateToX:(CGFloat)xAngle y:(CGFloat)yAngle z:(CGFloat)zAngle duration:(NSTimeInterval)duration shortestUnitArc:(BOOL)shortestUnitArc
{
  return (SCNAction *)+[SCNActionRotate rotateToX:shortestUnitArc y:xAngle z:yAngle duration:zAngle shortestUnitArc:duration];
}

+ (SCNAction)scaleBy:(CGFloat)scale duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionScale scaleBy:scale duration:sec];
}

+ (SCNAction)scaleTo:(CGFloat)scale duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionScale scaleTo:scale duration:sec];
}

+ (SCNAction)sequence:(NSArray *)actions
{
  return (SCNAction *)+[SCNActionSequence sequenceWithActions:actions];
}

+ (SCNAction)group:(NSArray *)actions
{
  return (SCNAction *)+[SCNActionGroup groupWithActions:actions];
}

+ (SCNAction)repeatAction:(SCNAction *)action count:(NSUInteger)count
{
  return (SCNAction *)+[SCNActionRepeat repeatAction:action count:count];
}

+ (SCNAction)repeatActionForever:(SCNAction *)action
{
  return (SCNAction *)+[SCNActionRepeat repeatActionForever:action];
}

+ (SCNAction)fadeInWithDuration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeInWithDuration:sec];
}

+ (SCNAction)fadeOutWithDuration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeOutWithDuration:sec];
}

+ (SCNAction)fadeOpacityBy:(CGFloat)factor duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeOpacityBy:factor duration:sec];
}

+ (SCNAction)fadeOpacityTo:(CGFloat)opacity duration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionFade fadeOpacityTo:opacity duration:sec];
}

+ (SCNAction)hide
{
  return (SCNAction *)+[SCNActionHide hide];
}

+ (SCNAction)unhide
{
  return (SCNAction *)+[SCNActionHide unhide];
}

+ (SCNAction)playAudioSource:(SCNAudioSource *)source waitForCompletion:(BOOL)wait
{
  return (SCNAction *)+[SCNActionPlaySound playAudioSource:source waitForCompletion:wait];
}

+ (SCNAction)waitForDuration:(NSTimeInterval)sec
{
  return (SCNAction *)+[SCNActionWait waitForDuration:sec];
}

+ (SCNAction)waitForDuration:(NSTimeInterval)sec withRange:(NSTimeInterval)durationRange
{
  return (SCNAction *)+[SCNActionWait waitForDuration:sec withRange:durationRange];
}

+ (SCNAction)removeFromParentNode
{
  return (SCNAction *)+[SCNActionRemove removeFromParentNode];
}

+ (id)performSelector:(SEL)a3 onTarget:(id)a4
{
  return +[SCNActionPerformSelector performSelector:a3 onTarget:a4];
}

+ (SCNAction)runBlock:(void *)block
{
  return (SCNAction *)+[SCNActionRunBlock runBlock:block queue:0];
}

+ (SCNAction)runBlock:(void *)block queue:(dispatch_queue_t)queue
{
  return (SCNAction *)+[SCNActionRunBlock runBlock:block queue:queue];
}

+ (id)runAction:(id)a3 onChildNodeWithName:(id)a4
{
  return +[SCNActionRunAction runAction:a3 onFirstChildWithName:a4];
}

+ (SCNAction)javaScriptActionWithScript:(NSString *)script duration:(NSTimeInterval)seconds
{
  return (SCNAction *)+[SCNActionJavaScript javaScriptActionWithDuration:script script:seconds];
}

+ (SCNAction)customActionWithDuration:(NSTimeInterval)seconds actionBlock:(void *)block
{
  return (SCNAction *)+[SCNActionCustom customActionWithDuration:block actionBlock:seconds];
}

+ (id)actionNamed:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return +[SCNAssetCatalog objectWithName:a3 class:v4];
}

- (void)setCppAction:(void *)a3
{
  caction = self->_caction;
  if (caction) {
    (*((void (**)(SCNCAction *, SEL))caction->var0 + 1))(caction, a2);
  }
  self->_caction = (SCNCAction *)a3;
  *((void *)a3 + 3) = self;
}

- (void)wasPausedWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var6 = a4;
}

- (void)willResumeWithTarget:(id)a3 atTime:(double)a4
{
  self->_caction->var5 = self->_caction->var5 + a4 - self->_caction->var6;
}

- (void)timeJumpWithTarget:(id)a3 timeOffset:(double)a4
{
  self->_caction->var5 = self->_caction->var5 + a4;
}

- (BOOL)finished
{
  return self->_caction->var10;
}

- (void)setFinished:(BOOL)a3
{
  self->_caction->var10 = a3;
}

- (double)ratioForTime:(double)a3
{
  SCNCAction::ratioForTime(self->_caction, a3);
  return result;
}

- (void)wasAddedToTarget:(id)a3 atTime:(double)a4
{
  caction = self->_caction;
  caction->var10 = 0;
  double var7 = caction->var7;
  double var8 = caction->var8;
  float v7 = var8;
  if ((LODWORD(v7) & 0x60000000) != 0)
  {
    double var7 = var7 - var8 * 0.5 + (double)rand() / 2147483650.0 * (var8 + var7 - (var7 - var8));
    caction = self->_caction;
    if (var7 < 0.0) {
      double var7 = 0.0;
    }
  }
  caction->var1 = var7;
}

- (void)wasRemovedFromTarget:(id)a3 atTime:(double)a4
{
  *(_WORD *)&self->_caction->var10 = 1;
}

- (void)willStartWithTarget:(id)a3 atTime:(double)a4
{
  caction = self->_caction;
  caction->var5 = a4;
  caction->var15 = 0.0;
  caction->var11 = 1;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  SCNCAction::ratioForTime(self->_caction, a4);
  if (v7.n128_f64[0] >= 1.0)
  {
    caction = self->_caction;
    v7.n128_f64[0] = a4;
    SCNCAction::didFinishWithTargetAtTime(caction, (SCNNode *)a3, v7);
  }
}

- (void)setKey:(id)a3
{
  self->_caction->var13 = (__CFString *)a3;
}

- (void)setCompletionBlock:(id)a3
{
  self->_caction->var12 = _Block_copy(a3);
}

@end