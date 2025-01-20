@interface _UIOverlayWelcomeViewController
- (_UIOverlayWelcomeView)welcomeView;
- (void)loadView;
- (void)setWelcomeView:(id)a3;
- (void)viewDidLoad;
@end

@implementation _UIOverlayWelcomeViewController

- (void)loadView
{
  v3 = -[_UIOverlayWelcomeView initWithFrame:]([_UIOverlayWelcomeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(_UIOverlayWelcomeViewController *)self setWelcomeView:v3];

  id v4 = [(_UIOverlayWelcomeViewController *)self welcomeView];
  [(_UIOverlayWelcomeViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)_UIOverlayWelcomeViewController;
  [(_UIOverlayWelcomeViewController *)&v7 viewDidLoad];
  v3 = [(_UIOverlayWelcomeViewController *)self welcomeView];
  id v4 = [v3 dismissButton];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002AE8;
  v6[3] = &unk_100008390;
  v6[4] = self;
  v5 = +[UIAction actionWithHandler:v6];
  [v4 addAction:v5 forControlEvents:0x2000];
}

- (_UIOverlayWelcomeView)welcomeView
{
  return self->_welcomeView;
}

- (void)setWelcomeView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end