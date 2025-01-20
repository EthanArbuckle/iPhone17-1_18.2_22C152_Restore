@interface ListItemComponent
- (_TtC19CoreDynamicUIPlugin17ListItemComponent)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin17ListItemComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ListItemComponent

- (_TtC19CoreDynamicUIPlugin17ListItemComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin17ListItemComponent *)sub_414C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19CoreDynamicUIPlugin17ListItemComponent)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4155C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_415F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_42030((SEL *)&selRef_layoutSubviews);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19CoreDynamicUIPlugin17ListItemComponent_editMenu));
}

@end