@interface DropletShapeView
- (_TtC9DropletUI16DropletShapeView)initWithCoder:(id)a3;
- (_TtC9DropletUI16DropletShapeView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation DropletShapeView

- (_TtC9DropletUI16DropletShapeView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI16DropletShapeView *)sub_24D1396A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI16DropletShapeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D139DE0();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
  if (v2)
  {
    id v3 = self;
    objc_msgSend(v2, sel_invalidate);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for DropletShapeView();
    [(DropletShapeView *)&v4 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference;
  sub_24D12C00C(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void *)v3 + 4), *((void *)v3 + 5), *((void *)v3 + 6), *((void *)v3 + 7), *((void *)v3 + 8), *((void *)v3 + 9), v3[80]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView));
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24D139CB0();
}

@end