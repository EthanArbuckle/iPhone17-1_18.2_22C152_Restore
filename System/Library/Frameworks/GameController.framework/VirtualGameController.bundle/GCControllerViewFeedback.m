@interface GCControllerViewFeedback
+ (id)sharedInstance;
- (GCControllerViewFeedback)init;
- (void)buttonDown;
- (void)buttonUp;
- (void)thumbstickLimit;
@end

@implementation GCControllerViewFeedback

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __42__GCControllerViewFeedback_sharedInstance__block_invoke(id a1)
{
  sharedInstance_sharedInstance = objc_alloc_init(GCControllerViewFeedback);

  _objc_release_x1();
}

- (GCControllerViewFeedback)init
{
  v8.receiver = self;
  v8.super_class = (Class)GCControllerViewFeedback;
  v2 = [(GCControllerViewFeedback *)&v8 init];
  v3 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:2];
  feedbackGeneratorHeavy = v2->_feedbackGeneratorHeavy;
  v2->_feedbackGeneratorHeavy = v3;

  v5 = (UIImpactFeedbackGenerator *)[objc_alloc((Class)UIImpactFeedbackGenerator) initWithStyle:0];
  feedbackGeneratorLight = v2->_feedbackGeneratorLight;
  v2->_feedbackGeneratorLight = v5;

  return v2;
}

- (void)buttonUp
{
}

- (void)buttonDown
{
}

- (void)thumbstickLimit
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGeneratorLight, 0);

  objc_storeStrong((id *)&self->_feedbackGeneratorHeavy, 0);
}

@end