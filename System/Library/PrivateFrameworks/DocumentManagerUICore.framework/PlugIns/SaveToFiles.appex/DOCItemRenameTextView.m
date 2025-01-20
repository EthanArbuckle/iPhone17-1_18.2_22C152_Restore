@interface DOCItemRenameTextView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)supportsImagePaste;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (NSArray)keyCommands;
- (NSString)text;
- (UIButton)accessibilityClearButton;
- (UIColor)backgroundColor;
- (UITextViewDelegate)delegate;
- (_TtC11SaveToFiles21DOCItemRenameTextView)initWithCoder:(id)a3;
- (_TtC11SaveToFiles21DOCItemRenameTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)clearText;
- (void)didMoveToSuperview;
- (void)editExtension:(id)a3;
- (void)endEdtingCell;
- (void)installClearButton;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setText:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)undoClearTextWithPreviousText:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation DOCItemRenameTextView

- (_TtC11SaveToFiles21DOCItemRenameTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BF8F0();
}

- (UIColor)backgroundColor
{
  return (UIColor *)sub_1000BF3DC(self, (uint64_t)a2, (SEL *)&selRef_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(DOCItemRenameTextView *)&v4 setBackgroundColor:a3];
}

- (void)layoutSubviews
{
  v2 = self;
  DOCItemRenameTextView.layoutSubviews()();
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  DOCItemRenameTextView.willMove(toSuperview:)(v9);
}

- (void)editExtension:(id)a3
{
  if (a3)
  {
    objc_super v4 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1000BD664();

  sub_10003BA70((uint64_t)v6);
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(DOCItemRenameTextView *)&v3 didMoveToSuperview];
  if (v2[OBJC_IVAR____TtC11SaveToFiles21DOCItemRenameTextView_backgroundStyle] == 1) {
    sub_1000BCC64();
  }
  if (v2[OBJC_IVAR____TtC11SaveToFiles21DOCItemRenameTextView_showsClearButton] == 1) {
    sub_1000BD954();
  }
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  char v8 = DOCItemRenameTextView.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_10003BA70((uint64_t)v10);
  return v8 & 1;
}

- (void)installClearButton
{
  v2 = self;
  sub_1000BD954();
}

- (void)endEdtingCell
{
  v2 = self;
  sub_1000BC3A0(1);
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = DOCItemRenameTextView.keyCommands.getter();

  if (v3)
  {
    sub_100036804(0, (unint64_t *)&unk_10062F4D0);
    v4.super.isa = sub_1004D14F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  uint64_t v7 = sub_1004D1240();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  id v12 = [v10 markedTextRange];

  if (!v12 && (v7 == 10 && v9 == 0xE100000000000000 || (sub_1004D2FA0() & 1) != 0))
  {
    sub_1000BC3A0(1);
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  swift_bridgeObjectRelease();
  return v13;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  DOCItemRenameTextView.textViewDidChange(_:)((UITextView)v4);
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  sub_100036804(0, (unint64_t *)&qword_10062E900);
  UIMenuElementSize v7 = sub_1004D1510();
  id v8 = a3;
  uint64_t v9 = self;
  Class v10 = sub_1000BFC48(v7);

  swift_bridgeObjectRelease();
  return v10;
}

- (void)clearText
{
  v2 = self;
  sub_1000BE5A8();
}

- (void)undoClearTextWithPreviousText:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1004D1240();
  id v5 = self;
  id v6 = [(DOCItemRenameTextView *)v5 undoManager];
  if (v6)
  {
    UIMenuElementSize v7 = v6;
    [v6 registerUndoWithTarget:v5 selector:"clearText" object:0];
  }
  swift_bridgeObjectRetain();
  NSString v8 = sub_1004D1200();
  swift_bridgeObjectRelease();
  v9.receiver = v5;
  v9.super_class = ObjectType;
  [(DOCItemRenameTextView *)&v9 setText:v8];

  swift_bridgeObjectRelease();
}

- (UIButton)accessibilityClearButton
{
  v2 = self;
  id v3 = sub_1000BD594();

  return (UIButton *)v3;
}

- (_TtC11SaveToFiles21DOCItemRenameTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC11SaveToFiles21DOCItemRenameTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles21DOCItemRenameTextView_itemRenameDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles21DOCItemRenameTextView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles21DOCItemRenameTextView_contentSizeObserver));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles21DOCItemRenameTextView____lazy_storage___clearButton);
}

- (UITextViewDelegate)delegate
{
  return (UITextViewDelegate *)sub_1000BF3DC(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  id v3 = [(DOCItemRenameTextView *)&v7 text];
  if (v3)
  {
    id v4 = v3;
    sub_1004D1240();

    NSString v5 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setText:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1004D1240();
    id v6 = self;
    a3 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(DOCItemRenameTextView *)&v8 setText:a3];
}

@end