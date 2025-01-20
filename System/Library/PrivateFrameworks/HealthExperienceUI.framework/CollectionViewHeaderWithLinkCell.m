@interface CollectionViewHeaderWithLinkCell
- (_TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell)initWithFrame:(CGRect)a3;
- (void)linkWasTapped;
@end

@implementation CollectionViewHeaderWithLinkCell

- (void)linkWasTapped
{
  v2 = *(void (**)(void))((char *)&self->super.super.super.super.super.super.super.isa
                        + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink);
  if (v2)
  {
    v3 = self;
    sub_1AD21485C((uint64_t)v2);
    id v4 = [(UIView *)v3 viewController];
    v2();
    sub_1AD1E4514((uint64_t)v2);
  }
}

- (_TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink);
  v9 = (objc_class *)type metadata accessor for CollectionViewHeaderWithLinkCell();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[CollectionViewHeaderCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink);
  v6 = (objc_class *)type metadata accessor for CollectionViewHeaderWithLinkCell();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(CollectionViewHeaderCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD1E4514(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI32CollectionViewHeaderWithLinkCell_didTapLink));
}

@end