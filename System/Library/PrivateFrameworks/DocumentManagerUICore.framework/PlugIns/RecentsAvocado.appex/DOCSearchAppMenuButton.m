@interface DOCSearchAppMenuButton
- (UIMenu)menu;
- (_TtC14RecentsAvocado22DOCSearchAppMenuButton)init;
- (_TtC14RecentsAvocado22DOCSearchAppMenuButton)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado22DOCSearchAppMenuButton)initWithFrame:(CGRect)a3;
- (void)setMenu:(id)a3;
@end

@implementation DOCSearchAppMenuButton

- (_TtC14RecentsAvocado22DOCSearchAppMenuButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado22DOCSearchAppMenuButton_attachedMenu) = 0;
  id v4 = a3;

  result = (_TtC14RecentsAvocado22DOCSearchAppMenuButton *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado22DOCSearchAppMenuButton)init
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado22DOCSearchAppMenuButton_attachedMenu) = 0;
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

- (_TtC14RecentsAvocado22DOCSearchAppMenuButton)initWithFrame:(CGRect)a3
{
  result = (_TtC14RecentsAvocado22DOCSearchAppMenuButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCSearchAppMenuButton_attachedMenu));
}

@end