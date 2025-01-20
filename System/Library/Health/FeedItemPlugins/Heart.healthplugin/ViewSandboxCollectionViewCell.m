@interface ViewSandboxCollectionViewCell
- (_TtC5Heart29ViewSandboxCollectionViewCell)initWithCoder:(id)a3;
- (_TtC5Heart29ViewSandboxCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ViewSandboxCollectionViewCell

- (_TtC5Heart29ViewSandboxCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_sandboxView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ViewSandboxCollectionViewCell();
  v8 = -[ViewSandboxCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_240BB22C0();

  return v8;
}

- (_TtC5Heart29ViewSandboxCollectionViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_sandboxView) = 0;
  id v5 = a3;

  result = (_TtC5Heart29ViewSandboxCollectionViewCell *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_240A478C0((uint64_t)self + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_sandboxView);
}

@end