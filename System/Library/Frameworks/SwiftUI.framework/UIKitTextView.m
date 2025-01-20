@interface UIKitTextView
- (BOOL)becomeFirstResponder;
- (_TtC7SwiftUI13UIKitTextView)initWithCoder:(id)a3;
- (_TtC7SwiftUI13UIKitTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation UIKitTextView

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIKitTextView();
  id v2 = v5.receiver;
  BOOL v3 = [(UIKitTextView *)&v5 becomeFirstResponder];
  if (v3) {
    UIKitTextView.enqueueScrollIfNeeded()();
  }

  return v3;
}

- (_TtC7SwiftUI13UIKitTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_didShowObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_willHideObserver) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for UIKitTextView();
  return -[UIKitTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC7SwiftUI13UIKitTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_didShowObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI13UIKitTextView_willHideObserver) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIKitTextView();
  return [(UIKitTextView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end