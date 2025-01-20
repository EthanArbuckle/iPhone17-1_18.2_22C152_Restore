@interface DOCTokenTextField
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (NSArray)keyCommands;
- (NSString)text;
- (UIFont)font;
- (_TtC17RecentsAppPopover17DOCTokenTextField)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover17DOCTokenTextField)initWithFrame:(CGRect)a3;
- (void)deleteBackward;
- (void)directionKeyCommand;
- (void)fieldEditorDidChangeSelection:(id)a3;
- (void)selectAll:(id)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)textDidChange:(id)a3;
@end

@implementation DOCTokenTextField

- (UIFont)font
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCTokenTextField();
  v2 = [(DOCTokenTextField *)&v4 font];
  return v2;
}

- (void)setFont:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCTokenTextField();
  id v4 = a3;
  id v5 = v11.receiver;
  [(DOCTokenTextField *)&v11 setFont:v4];
  v6 = (char *)sub_1001F7EFC();
  id v7 = objc_msgSend(v5, "font", v11.receiver, v11.super_class);
  v8 = *(void **)&v6[OBJC_IVAR____TtC17RecentsAppPopoverP33_B65E719E2ECF5F907A34C601D6A9553B17DOCTokenChainView_font];
  *(void *)&v6[OBJC_IVAR____TtC17RecentsAppPopoverP33_B65E719E2ECF5F907A34C601D6A9553B17DOCTokenChainView_font] = v7;
  id v9 = v7;

  v10 = v6;
  sub_1001FA1E0(v10, (uint64_t)v10);
}

- (NSString)text
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCTokenTextField();
  id v2 = v7.receiver;
  v3 = [(DOCTokenTextField *)&v7 text];
  if (v3)
  {
    id v4 = v3;
    sub_1004BEB10();

    NSString v5 = sub_1004BEAD0();
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
  if (a3)
  {
    sub_1004BEB10();
    id v4 = self;
    NSString v5 = sub_1004BEAD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCTokenTextField();
  [(DOCTokenTextField *)&v7 setText:v5];

  sub_1001F9510();
}

- (_TtC17RecentsAppPopover17DOCTokenTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->dataSource[OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField_dataSource] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField____lazy_storage___tokenChainView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField____lazy_storage___tokenContainerContainerView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField____lazy_storage___suggestionLabel) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCTokenTextField();
  v8 = -[DOCTokenTextField initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  sub_1001F8490();

  return v8;
}

- (_TtC17RecentsAppPopover17DOCTokenTextField)initWithCoder:(id)a3
{
  return (_TtC17RecentsAppPopover17DOCTokenTextField *)sub_1001F83DC(a3);
}

- (void)selectAll:(id)a3
{
}

- (NSArray)keyCommands
{
  return (NSArray *)sub_1001F8A10(self, (uint64_t)a2, (uint64_t (*)(void))sub_1001F8A98);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1004C0260();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    objc_super v7 = self;
  }
  char v8 = sub_1001F8D04((uint64_t)a3, (uint64_t)v10);

  sub_10003A60C((uint64_t)v10);
  return v8 & 1;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3 = sub_1001F90F0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_textRectForBounds_);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3 = sub_1001F90F0(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_editingRectForBounds_);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)deleteBackward
{
  id v2 = self;
  sub_1001F9174();
}

- (void)directionKeyCommand
{
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1001FA52C();
}

- (void)fieldEditorDidChangeSelection:(id)a3
{
}

- (void).cxx_destruct
{
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField_dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField____lazy_storage___tokenChainView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField____lazy_storage___tokenContainerContainerView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover17DOCTokenTextField____lazy_storage___suggestionLabel);
}

@end