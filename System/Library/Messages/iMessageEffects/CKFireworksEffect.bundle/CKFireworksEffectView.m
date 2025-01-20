@interface CKFireworksEffectView
+ (id)effectedZIndexes;
- (CGPoint)focusPoint;
- (CGRect)messageRect;
- (CKFireworksEffectView)initWithFrame:(CGRect)a3;
- (NSURL)effectFileURL;
- (UIImage)messageImage;
- (char)messageOrientation;
- (int64_t)zIndex;
- (void)applicationDidBecomeActive;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForegroundNotification;
- (void)applicationWillResignActive;
- (void)setEffectFileURL:(id)a3;
- (void)setFocusPoint:(CGPoint)a3;
- (void)setMessageImage:(id)a3;
- (void)setMessageOrientation:(char)a3;
- (void)setMessageRect:(CGRect)a3;
- (void)setZIndex:(int64_t)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation CKFireworksEffectView

- (void)startAnimation
{
  [(GameScene *)self->_scene setPaused:0];
  fireworksView = self->_fireworksView;
  [(CKFireworksEffectView *)self bounds];
  -[SKView setFrame:](fireworksView, "setFrame:");
  scene = self->_scene;

  [(GameScene *)scene runChoregraphy];
}

- (CKFireworksEffectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)CKFireworksEffectView;
  v7 = -[CKFireworksEffectView initWithFrame:](&v17, "initWithFrame:");
  if (v7)
  {
    v8 = (SKView *)objc_msgSend(objc_alloc((Class)SKView), "initWithFrame:", x, y, width, height);
    fireworksView = v7->_fireworksView;
    v7->_fireworksView = v8;

    [(SKView *)v7->_fireworksView setAllowsTransparency:1];
    [(CKFireworksEffectView *)v7 addSubview:v7->_fireworksView];
    uint64_t v10 = +[GameScene node];
    scene = v7->_scene;
    v7->_scene = (GameScene *)v10;

    [(GameScene *)v7->_scene setScaleMode:3];
    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v7 selector:"applicationWillResignActive" name:UIApplicationWillResignActiveNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"applicationDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v7 selector:"applicationWillEnterForegroundNotification" name:UIApplicationWillEnterForegroundNotification object:0];

    [(GameScene *)v7->_scene setType1FireworkEnabled:1];
    [(GameScene *)v7->_scene setType2FireworkEnabled:1];
    [(SKView *)v7->_fireworksView setPreferredFramesPerSecond:60];
    [(SKView *)v7->_fireworksView presentScene:v7->_scene];
  }
  return v7;
}

- (void)applicationWillResignActive
{
}

- (void)applicationDidBecomeActive
{
}

- (void)applicationDidEnterBackground
{
}

- (void)applicationWillEnterForegroundNotification
{
}

- (void)stopAnimation
{
}

+ (id)effectedZIndexes
{
  return +[NSIndexSet indexSetWithIndex:0];
}

- (int64_t)zIndex
{
  return self->zIndex;
}

- (void)setZIndex:(int64_t)a3
{
  self->zIndedouble x = a3;
}

- (CGPoint)focusPoint
{
  double x = self->focusPoint.x;
  double y = self->focusPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFocusPoint:(CGPoint)a3
{
  self->focusPoint = a3;
}

- (CGRect)messageRect
{
  double x = self->messageRect.origin.x;
  double y = self->messageRect.origin.y;
  double width = self->messageRect.size.width;
  double height = self->messageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMessageRect:(CGRect)a3
{
  self->messageRect = a3;
}

- (char)messageOrientation
{
  return self->messageOrientation;
}

- (void)setMessageOrientation:(char)a3
{
  self->messageOrientation = a3;
}

- (UIImage)messageImage
{
  return self->messageImage;
}

- (void)setMessageImage:(id)a3
{
}

- (NSURL)effectFileURL
{
  return self->effectFileURL;
}

- (void)setEffectFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->effectFileURL, 0);
  objc_storeStrong((id *)&self->messageImage, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_fireworksView, 0);
}

@end