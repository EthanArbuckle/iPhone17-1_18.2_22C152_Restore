@interface DisplayViewController
- (BOOL)_canShowWhileLocked;
- (DisplayViewController)initWithCoder:(id)a3;
- (DisplayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)displayView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setDisplayView:(id)a3;
- (void)viewDidLoad;
@end

@implementation DisplayViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100024EA4();
}

- (UIView)displayView
{
  id v2 = sub_1000252D8();

  return (UIView *)v2;
}

- (void)setDisplayView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100025344((uint64_t)v4);
}

- (DisplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10005E920();
  }
  id v5 = a4;
  sub_100027DEC();
  return result;
}

- (DisplayViewController)initWithCoder:(id)a3
{
  return (DisplayViewController *)sub_100028090(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___DisplayViewController_displayViewPointerInteraction));

  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DisplayViewController_video);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = sub_100028434((uint64_t)self, (uint64_t)a2, a5);

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_100028488();

  return v9;
}

@end