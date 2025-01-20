@interface HWTypingIndicatorLayer
- (BOOL)hasDarkBackground;
- (CALayer)rootAnimationLayer;
- (CAStateController)stateController;
- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4;
- (HWTypingIndicatorLayer)init;
- (HWTypingIndicatorLayer)initWithCoder:(id)a3;
- (id)CAMLParser:(id)a3 resourceForURL:(id)a4;
- (id)_loadTypingIndicatorFile;
- (id)completionBlock;
- (int64_t)rootAnimationLayerUserInterfaceStyle;
- (void)_setupLayerAndStateControllerWithStateName:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setHasDarkBackground:(BOOL)a3;
- (void)setRootAnimationLayer:(id)a3;
- (void)setRootAnimationLayerUserInterfaceStyle:(int64_t)a3;
- (void)setStateController:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)startGrowAnimation;
- (void)startGrowAnimationWithCompletionBlock:(id)a3;
- (void)startShrinkAnimation;
- (void)startShrinkAnimationWithCompletionBlock:(id)a3;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
- (void)stopAnimation;
@end

@implementation HWTypingIndicatorLayer

- (HWTypingIndicatorLayer)init
{
  v7.receiver = self;
  v7.super_class = (Class)HWTypingIndicatorLayer;
  v2 = [(HWTypingIndicatorLayer *)&v7 init];
  if (v2)
  {
    id v3 = +[UIColor greenColor];
    -[HWTypingIndicatorLayer setBackgroundColor:](v2, "setBackgroundColor:", [v3 CGColor]);

    id v4 = +[UIColor blueColor];
    -[HWTypingIndicatorLayer setBorderColor:](v2, "setBorderColor:", [v4 CGColor]);

    [(HWTypingIndicatorLayer *)v2 setBorderWidth:2.0];
    [(HWTypingIndicatorLayer *)v2 setGeometryFlipped:1];
    v5 = +[UITraitCollection currentTraitCollection];
    v2->_rootAnimationLayerUserInterfaceStyle = (int64_t)[v5 userInterfaceStyle];

    [(HWTypingIndicatorLayer *)v2 _setupLayerAndStateControllerWithStateName:@"State 1"];
  }
  return v2;
}

- (void)_setupLayerAndStateControllerWithStateName:(id)a3
{
  id v4 = a3;
  v5 = [(HWTypingIndicatorLayer *)self _loadTypingIndicatorFile];
  rootAnimationLayer = self->_rootAnimationLayer;
  self->_rootAnimationLayer = v5;

  objc_super v7 = (CAStateController *)[objc_alloc((Class)CAStateController) initWithLayer:self->_rootAnimationLayer];
  stateController = self->_stateController;
  self->_stateController = v7;

  [(CAStateController *)self->_stateController setDelegate:self];
  [(CALayer *)self->_rootAnimationLayer position];
  -[CALayer setPosition:](self->_rootAnimationLayer, "setPosition:", 58.0, -76.0);
  [(HWTypingIndicatorLayer *)self addSublayer:self->_rootAnimationLayer];
  id v9 = [(CALayer *)self->_rootAnimationLayer stateWithName:v4];

  [(CAStateController *)self->_stateController setState:v9 ofLayer:self->_rootAnimationLayer];
}

- (id)_loadTypingIndicatorFile
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [objc_alloc((Class)NSDataAsset) initWithName:@"TypingIndicator" bundle:v3];
  v5 = [v4 data];
  id v6 = objc_alloc_init((Class)CAMLParser);
  [v6 setDelegate:self];
  [v6 parseData:v5];
  objc_super v7 = [v6 result];

  return v7;
}

- (void)setTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_rootAnimationLayer)
  {
    id rootAnimationLayerUserInterfaceStyle = self->_rootAnimationLayerUserInterfaceStyle;
    if (rootAnimationLayerUserInterfaceStyle == [v4 userInterfaceStyle]) {
      goto LABEL_9;
    }
    rootAnimationLayer = self->_rootAnimationLayer;
  }
  else
  {
    rootAnimationLayer = 0;
  }
  v8 = [(CAStateController *)self->_stateController stateOfLayer:rootAnimationLayer];
  uint64_t v9 = [v8 name];

  if (v9) {
    v10 = (__CFString *)v9;
  }
  else {
    v10 = @"State 1";
  }
  [(CALayer *)self->_rootAnimationLayer removeFromSuperlayer];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_C5F0;
  v12[3] = &unk_287A0;
  v12[4] = self;
  id v13 = v5;
  v14 = v10;
  v11 = v10;
  [v13 performAsCurrentTraitCollection:v12];

LABEL_9:
}

- (void)startGrowAnimationWithCompletionBlock:(id)a3
{
  rootAnimationLayer = self->_rootAnimationLayer;
  id v5 = a3;
  id v7 = [(CALayer *)rootAnimationLayer stateWithName:@"Thinking"];
  LODWORD(v6) = 1.0;
  [(CAStateController *)self->_stateController setState:v7 ofLayer:self->_rootAnimationLayer transitionSpeed:v6];
  [(HWTypingIndicatorLayer *)self setCompletionBlock:v5];
}

- (void)startGrowAnimation
{
}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  rootAnimationLayer = self->_rootAnimationLayer;
  id v5 = a3;
  id v7 = [(CALayer *)rootAnimationLayer stateWithName:@"State 1"];
  LODWORD(v6) = 1.0;
  [(CAStateController *)self->_stateController setState:v7 ofLayer:self->_rootAnimationLayer transitionSpeed:v6];
  [(HWTypingIndicatorLayer *)self setCompletionBlock:v5];
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  double v6 = [(HWTypingIndicatorLayer *)self completionBlock];

  if (v6)
  {
    id v7 = [(HWTypingIndicatorLayer *)self completionBlock];
    v7[2]();

    [(HWTypingIndicatorLayer *)self setCompletionBlock:0];
  }
}

- (void)startShrinkAnimation
{
}

- (void)stopAnimation
{
  id v3 = [(CALayer *)self->_rootAnimationLayer stateWithName:@"State 1"];
  [(CAStateController *)self->_stateController setState:v3 ofLayer:self->_rootAnimationLayer];
}

- (id)CAMLParser:(id)a3 resourceForURL:(id)a4
{
  return 0;
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)qword_33628;
  if (!qword_33628)
  {
    id v23 = objc_alloc((Class)NSDictionary);
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v23, "initWithObjectsAndKeys:", v22, @"LKState", v21, @"LKEventHandler", v20, @"LKStateAddAnimation", v8, @"LKStateAddElement", v9, @"LKStateElement", v10, @"LKStateRemoveAnimation", v11, @"LKStateRemoveElement", v12, @"LKStateSetValue", v13,
            @"LKStateSetProperty",
            v14,
            @"LKStateTransition",
            objc_opt_class(),
            @"LKStateTransitionElement",
            0);
    v16 = (void *)qword_33628;
    qword_33628 = (uint64_t)v15;

    id v7 = (void *)qword_33628;
  }
  id v17 = [v7 objectForKey:v6];
  if (!v17) {
    NSLog(@"%s %@ substitution: %@", "-[HWTypingIndicatorLayer CAMLParser:didFailToFindClassWithName:]", v6, 0);
  }
  v18 = (objc_class *)v17;

  return v18;
}

- (HWTypingIndicatorLayer)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)hasDarkBackground
{
  return self->hasDarkBackground;
}

- (void)setHasDarkBackground:(BOOL)a3
{
  self->hasDarkBackground = a3;
}

- (CALayer)rootAnimationLayer
{
  return self->_rootAnimationLayer;
}

- (void)setRootAnimationLayer:(id)a3
{
}

- (CAStateController)stateController
{
  return self->_stateController;
}

- (void)setStateController:(id)a3
{
}

- (int64_t)rootAnimationLayerUserInterfaceStyle
{
  return self->_rootAnimationLayerUserInterfaceStyle;
}

- (void)setRootAnimationLayerUserInterfaceStyle:(int64_t)a3
{
  self->_id rootAnimationLayerUserInterfaceStyle = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_stateController, 0);

  objc_storeStrong((id *)&self->_rootAnimationLayer, 0);
}

@end