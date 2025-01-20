@interface DOCLoadingViewController
- (_TtC33com_apple_DocumentManager_Service24DOCLoadingViewController)initWithCoder:(id)a3;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation DOCLoadingViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10018DFD8(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCLoadingViewController();
  id v4 = v5.receiver;
  [(DOCLoadingViewController *)&v5 viewDidDisappear:v3];
  sub_10018DD10();
  sub_1004CD0D0();

  swift_release();
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCLoadingViewController();
  id v4 = a3;
  id v5 = v9.receiver;
  [(DOCBrowserContainedViewController *)&v9 effectiveAppearanceDidChange:v4];
  id v6 = objc_msgSend(v5, "viewIfLoaded", v9.receiver, v9.super_class);
  if (v6)
  {
    v7 = v6;
    id v8 = [v4 backgroundColor];
    [v7 setBackgroundColor:v8];

    id v4 = v7;
    id v5 = v8;
  }
}

- (_TtC33com_apple_DocumentManager_Service24DOCLoadingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_Service24DOCLoadingViewController____lazy_storage___task) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCLoadingViewController();
  return [(DOCBrowserContainedViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end