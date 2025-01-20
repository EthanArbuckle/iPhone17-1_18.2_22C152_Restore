@interface UIKitIconPreferringButton
- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation UIKitIconPreferringButton

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v9;
  }
  else
  {
    uint64_t v8 = 0;
  }
  v10 = self;
  if (![(UIKitIconPreferringButton *)v10 changesSelectionAsPrimaryAction])
  {
LABEL_7:
    if (a3) {
      v12 = (void *)MEMORY[0x18C115780](v8, a3);
    }
    else {
      v12 = 0;
    }
    v13.receiver = v10;
    v13.super_class = ObjectType;
    [(UIKitIconPreferringButton *)&v13 setTitle:v12 forState:a4];

    swift_bridgeObjectRelease();
    return;
  }
  id v11 = [(UIKitIconPreferringButton *)v10 titleForState:a4];
  if (v11)
  {

    goto LABEL_7;
  }

  swift_bridgeObjectRelease();
}

- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[UIKitButtonBase initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUIP33_64A26C7A8406856A733B1A7B593971F725UIKitIconPreferringButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIKitButtonBase *)&v5 initWithCoder:a3];
}

@end