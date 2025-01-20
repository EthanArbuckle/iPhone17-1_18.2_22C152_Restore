@interface ImageCollectionViewCell
- (_TtC18HealthExperienceUI23ImageCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23ImageCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ImageCollectionViewCell

- (_TtC18HealthExperienceUI23ImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI23ImageCollectionViewCell *)ImageCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI23ImageCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI23ImageCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23ImageCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23ImageCollectionViewCell_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI23ImageCollectionViewCell_heightConstraint);
}

@end