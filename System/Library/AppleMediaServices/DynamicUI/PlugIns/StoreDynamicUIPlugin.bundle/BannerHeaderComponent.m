@interface BannerHeaderComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)init;
- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BannerHeaderComponent

- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent *)sub_26FEC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_27908();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_279F4();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  sub_28C84(width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)init
{
}

- (void).cxx_destruct
{
  sub_157B0((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BannerHeaderComponent____lazy_storage___metrics], &qword_150CE8);

  sub_10950(*(void *)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BannerHeaderComponent_artworkFetcher]);
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BannerHeaderComponent____lazy_storage___artworkImageView];
}

@end