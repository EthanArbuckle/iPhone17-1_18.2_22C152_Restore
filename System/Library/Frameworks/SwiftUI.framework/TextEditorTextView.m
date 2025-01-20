@interface TextEditorTextView
- (BOOL)supportsTextReplacement;
- (_TtC7SwiftUI18TextEditorTextView)initWithCoder:(id)a3;
- (_TtC7SwiftUI18TextEditorTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
@end

@implementation TextEditorTextView

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  TextEditorTextView.findInteraction(_:didBegin:)((uint64_t)v6, (uint64_t)v7, (SEL *)&selRef_findInteraction_didBeginFindSession_);
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  TextEditorTextView.findInteraction(_:didBegin:)((uint64_t)v6, (uint64_t)v7, (SEL *)&selRef_findInteraction_didEndFindSession_);
}

- (BOOL)supportsTextReplacement
{
  if (*(void *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext) == 1)
    return 0;
  else {
    return *((unsigned char *)&self->super.super.super.super.super.__layeringSceneIdentity
  }
           + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext
           + 2);
}

- (_TtC7SwiftUI18TextEditorTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (char *)self + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext;
  *(_OWORD *)v11 = xmmword_18834BB90;
  v11[18] = 0;
  *((_WORD *)v11 + 8) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView____lazy_storage___helper) = 0;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[UIKitTextView initWithFrame:textContainer:](&v13, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC7SwiftUI18TextEditorTextView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext;
  *(_OWORD *)id v6 = xmmword_18834BB90;
  v6[18] = 0;
  *((_WORD *)v6 + 8) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView____lazy_storage___helper) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(UIKitTextView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  outlined consume of FindContext?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext), *(void *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI18TextEditorTextView_findContext));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7SwiftUI18TextEditorTextView____lazy_storage___helper);
}

@end