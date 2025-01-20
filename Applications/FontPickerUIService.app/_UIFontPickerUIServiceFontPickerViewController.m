@interface _UIFontPickerUIServiceFontPickerViewController
- (BOOL)_canShowWhileLocked;
- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithCoder:(id)a3;
- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithRootViewController:(id)a3;
- (void)_pickerDidCancel;
- (void)_pickerDidSelectFont:(id)a3;
- (void)applyFontPickerConfiguration:(id)a3;
- (void)applyHideNavigationBar:(BOOL)a3;
- (void)applySelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4;
- (void)applyShowsGrabber:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _UIFontPickerUIServiceFontPickerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100023BA0();
}

- (void)_pickerDidSelectFont:(id)a3
{
  v5 = self;
  v6 = (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *)a3;
  v7 = self;
  id v10 = [v5 actionForPickerDidSelectFont:v6];
  v8 = (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *)[(_UIFontPickerUIServiceFontPickerViewController *)v7 _hostedWindowScene];
  if (v8)
  {
    v9 = v8;
    [(_UIFontPickerUIServiceFontPickerViewController *)v8 sendAction:v10];

    v6 = v7;
    v7 = v9;
  }
}

- (void)_pickerDidCancel
{
  v3 = self;
  v4 = self;
  id v7 = [v3 actionForPickerDidCancel];
  v5 = (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController *)[(_UIFontPickerUIServiceFontPickerViewController *)v4 _hostedWindowScene];
  if (v5)
  {
    v6 = v5;
    [(_UIFontPickerUIServiceFontPickerViewController *)v5 sendAction:v7];

    v4 = v6;
  }
}

- (void)applyFontPickerConfiguration:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController);
  if (v3) {
    [v3 _setConfiguration:a3];
  }
}

- (void)applySelectedFontDescriptors:(id)a3 scrollToVisible:(BOOL)a4
{
  uint64_t v4 = (uint64_t)a3;
  if (a3)
  {
    sub_1000241E4();
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v6 = self;
  sub_100023E74(v4);

  swift_bridgeObjectRelease();
}

- (void)applyHideNavigationBar:(BOOL)a3
{
}

- (void)applyShowsGrabber:(BOOL)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(_UIFontPickerUIServiceFontPickerViewController *)&v9 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithRootViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(_UIFontPickerUIServiceFontPickerViewController *)&v7 initWithRootViewController:a3];
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  id v10 = [(_UIFontPickerUIServiceFontPickerViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(_UIFontPickerUIServiceFontPickerViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19FontPickerUIService46_UIFontPickerUIServiceFontPickerViewController_contentViewController));
}

@end