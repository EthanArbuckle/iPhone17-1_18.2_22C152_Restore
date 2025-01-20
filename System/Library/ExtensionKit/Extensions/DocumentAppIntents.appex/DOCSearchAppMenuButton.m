@interface DOCSearchAppMenuButton
- (UIMenu)menu;
- (_TtC18DocumentAppIntents22DOCSearchAppMenuButton)init;
- (_TtC18DocumentAppIntents22DOCSearchAppMenuButton)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents22DOCSearchAppMenuButton)initWithFrame:(CGRect)a3;
- (void)setMenu:(id)a3;
@end

@implementation DOCSearchAppMenuButton

- (_TtC18DocumentAppIntents22DOCSearchAppMenuButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents22DOCSearchAppMenuButton_attachedMenu) = 0;
  id v4 = a3;

  result = (_TtC18DocumentAppIntents22DOCSearchAppMenuButton *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents22DOCSearchAppMenuButton)init
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents22DOCSearchAppMenuButton_attachedMenu) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchAppMenuButton();
  v2 = -[DOCSearchAppMenuButton initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [(DOCSearchAppMenuButton *)v2 setPointerInteractionEnabled:1];
  return v2;
}

- (UIMenu)menu
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchAppMenuButton();
  v2 = [(DOCSearchAppMenuButton *)&v4 menu];

  return v2;
}

- (void)setMenu:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchAppMenuButton();
  [(DOCSearchAppMenuButton *)&v4 setMenu:a3];
}

- (_TtC18DocumentAppIntents22DOCSearchAppMenuButton)initWithFrame:(CGRect)a3
{
  result = (_TtC18DocumentAppIntents22DOCSearchAppMenuButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCSearchAppMenuButton_attachedMenu));
}

@end