@interface _UIFontPickerUIServiceSceneDelegate.SecureWindow
+ (BOOL)_isSecure;
- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithCoder:(id)a3;
- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithContentRect:(CGRect)a3;
- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithFrame:(CGRect)a3;
- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithWindowScene:(id)a3;
@end

@implementation _UIFontPickerUIServiceSceneDelegate.SecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(_UIFontPickerUIServiceSceneDelegate.SecureWindow *)&v5 initWithWindowScene:a3];
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[_UIFontPickerUIServiceSceneDelegate.SecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(_UIFontPickerUIServiceSceneDelegate.SecureWindow *)&v5 initWithCoder:a3];
}

- (_TtCC19FontPickerUIService35_UIFontPickerUIServiceSceneDelegate12SecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[_UIFontPickerUIServiceSceneDelegate.SecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end