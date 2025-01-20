@interface VerticalTextView
- (_TtC7SwiftUI16VerticalTextView)initWithCoder:(id)a3;
- (_TtC7SwiftUI16VerticalTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation VerticalTextView

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  unint64_t v3 = [(VerticalTextView *)&v6 accessibilityTraits];

  unint64_t v4 = -1;
  if ((v3 & 0x800000000000) != 0) {
    unint64_t v4 = 0xFFFF7FFFFFFFFFFFLL;
  }
  return v4 & v3;
}

- (_TtC7SwiftUI16VerticalTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (char *)self + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_upperLimit;
  *(void *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)self + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_lowerLimit;
  *(void *)v12 = 0;
  v12[8] = 1;
  *(void *)((char *)&self->super.super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_uiDelegate) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v13 = OBJC_IVAR____TtC7SwiftUI16VerticalTextView_uiDefaultTextAttributes;
  id v14 = a4;
  v15 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);

  v18.receiver = v15;
  v18.super_class = ObjectType;
  v16 = -[UIKitTextView initWithFrame:textContainer:](&v18, sel_initWithFrame_textContainer_, v14, x, y, width, height);

  return v16;
}

- (_TtC7SwiftUI16VerticalTextView)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI16VerticalTextView *)VerticalTextView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI16VerticalTextView_uiDelegate);

  swift_bridgeObjectRelease();
}

@end