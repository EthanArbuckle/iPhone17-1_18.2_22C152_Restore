@interface AppLockupComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)init;
- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AppLockupComponent

- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin18AppLockupComponent *)sub_159D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_16010();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_16360(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_165E4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_16750((uint64_t)a3);
}

- (_TtC20StoreDynamicUIPlugin18AppLockupComponent)init
{
}

- (void).cxx_destruct
{
  sub_10950(*(void *)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin18AppLockupComponent_artworkFetcher]);
  sub_10950(*(void *)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin18AppLockupComponent_footerArtworkFetcher]);

  sub_18AD4((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin18AppLockupComponent_metrics]);
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin18AppLockupComponent_separator];
}

@end