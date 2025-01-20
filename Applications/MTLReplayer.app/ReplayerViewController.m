@interface ReplayerViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)setColorPixelFormat:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setDisplayTextureEncoder:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation ReplayerViewController

- (void).cxx_destruct
{
}

- (void)setColorPixelFormat:(unint64_t)a3
{
  id v4 = [(ReplayerViewController *)self view];
  [v4 setColorPixelFormat:a3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_orientationMask;
}

- (void)setOrientation:(int64_t)a3
{
  if (+[NSThread isMainThread])
  {
    if ((unint64_t)(a3 - 1) > 3) {
      unint64_t v5 = 30;
    }
    else {
      unint64_t v5 = qword_1000080D0[a3 - 1];
    }
    self->_orientationMask = v5;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000063E0;
    v6[3] = &unk_10000C830;
    v6[4] = self;
    +[UIView performWithoutAnimation:v6];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000063D4;
    block[3] = &unk_10000C808;
    block[4] = self;
    block[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setDisplayTextureEncoder:(id)a3
{
  id v4 = a3;
  id v6 = [(ReplayerViewController *)self view];
  unint64_t v5 = [v4 device];
  [v6 setDevice:v5];

  [(Renderer *)self->_renderer setDisplayTextureEncoder:v4];
  [v6 draw];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)setDevice:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread])
  {
    [(ReplayerViewController *)self loadView];
    unint64_t v5 = [(ReplayerViewController *)self view];
    [v5 setDevice:v4];
    [v5 setColorPixelFormat:81];
    [v5 setPaused:1];
    [v5 setAutoResizeDrawable:1];
    id v6 = +[UIScreen mainScreen];
    [v6 bounds];
    [v5 setBounds:];

    v7 = [v5 layer];
    [v7 setColorspace:CGColorSpaceCreateWithName(kCGColorSpaceSRGB)];
    v8 = [[Renderer alloc] initWithMetalKitView:v5];
    renderer = self->_renderer;
    self->_renderer = v8;

    v10 = self->_renderer;
    [v5 drawableSize];
    -[Renderer mtkView:drawableSizeWillChange:](v10, "mtkView:drawableSizeWillChange:", v5);
    [v5 setDelegate:self->_renderer];
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006634;
    v11[3] = &unk_10000C7E0;
    v11[4] = self;
    id v12 = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ReplayerViewController;
  [(ReplayerViewController *)&v5 viewDidLoad];
  v3 = [(ReplayerViewController *)self view];
  id v4 = +[UIColor blackColor];
  [v3 setBackgroundColor:v4];

  self->_orientationMask = 30;
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)MTKView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(ReplayerViewController *)self setView:v3];
}

@end