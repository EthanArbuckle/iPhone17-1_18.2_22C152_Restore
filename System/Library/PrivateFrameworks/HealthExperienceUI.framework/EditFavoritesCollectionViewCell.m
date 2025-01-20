@interface EditFavoritesCollectionViewCell
- (BOOL)axItemIsFavorited;
- (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation EditFavoritesCollectionViewCell

- (BOOL)axItemIsFavorited
{
  v2 = self;
  char v3 = sub_1AD269134();

  return v3 & 1;
}

- (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell *)sub_1AD26929C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI31EditFavoritesCollectionViewCell *)sub_1AD26946C(a3);
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell_item, (unint64_t *)&qword_1EB73E880, (unint64_t *)&qword_1EB73E870);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell_textStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___font));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___imageForUnpinnedState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___imageForPinnedState));
  char v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31EditFavoritesCollectionViewCell____lazy_storage___accessoryImageView);
}

@end