@interface _UIFontPickerUIServiceSceneDelegate
- (UIWindow)window;
- (_TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation _UIFontPickerUIServiceSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100024920(v8, v10);
}

- (_TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate_window) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(_UIFontPickerUIServiceSceneDelegate *)&v5 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate_window));
}

@end