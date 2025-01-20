@interface UIKitPickerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7SwiftUIP33_6F6D7FC252FF6BD4B4AE026DA1B1779815UIKitPickerView)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_6F6D7FC252FF6BD4B4AE026DA1B1779815UIKitPickerView)initWithFrame:(CGRect)a3;
@end

@implementation UIKitPickerView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v5 = v13.receiver;
  -[UIKitPickerView sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  double v7 = v6;
  double v9 = v8;
  if (isLinkedOnOrAfter(_:)())
  {
  }
  else
  {
    lazy protocol witness table accessor for type EnableUnifiedLayoutFeature and conformance EnableUnifiedLayoutFeature();
    char v10 = static UserDefaultKeyedFeature.isEnabled.getter();

    if ((v10 & 1) == 0) {
      double width = v7;
    }
  }
  double v11 = width;
  double v12 = v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC7SwiftUIP33_6F6D7FC252FF6BD4B4AE026DA1B1779815UIKitPickerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[UIKitPickerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUIP33_6F6D7FC252FF6BD4B4AE026DA1B1779815UIKitPickerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIKitPickerView *)&v5 initWithCoder:a3];
}

@end