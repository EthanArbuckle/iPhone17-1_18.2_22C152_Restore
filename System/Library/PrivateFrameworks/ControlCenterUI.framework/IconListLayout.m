@interface IconListLayout
- (CGSize)iconSpacingForOrientation:(int64_t)a3;
- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3 orientation:(id)a4;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (_TtC15ControlCenterUI14IconListLayout)init;
- (id)iconGridSizeClassSizesForOrientation:(int64_t)a3;
- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3;
- (unint64_t)numberOfRowsForOrientation:(int64_t)a3;
- (void)setIconGridSizeClassSizes:(id)a3;
@end

@implementation IconListLayout

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  BOOL IsLandscape = UIInterfaceOrientationIsLandscape(a3);
  v5 = self;
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions);
  if (IsLandscape) {
    v6 = (unint64_t *)&v5->$__lazy_storage_$_iconGridSizeClassSizes[OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions];
  }
  unint64_t v7 = *v6;

  return v7;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  BOOL IsLandscape = UIInterfaceOrientationIsLandscape(a3);
  v5 = self;
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions);
  if (!IsLandscape) {
    v6 = (unint64_t *)&v5->$__lazy_storage_$_iconGridSizeClassSizes[OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions];
  }
  unint64_t v7 = *v6;

  return v7;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  double v3 = CCUILayoutEdgeInsetsForInterfaceOrientation(a3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  double v3 = self;
  id v4 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
  sub_1D7BA9DF0(v4, 1);

  return result;
}

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  double v3 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_fixedIconSpacing);
  double v4 = *(double *)&self->$__lazy_storage_$_iconGridSizeClassSizes[OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_fixedIconSpacing];
  result.height = v4;
  result.width = v3;
  return result;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  v2 = self;
  id v3 = sub_1D7BA967C();

  return (SBHIconGridSizeClassSizeMap *)v3;
}

- (void)setIconGridSizeClassSizes:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout____lazy_storage___iconGridSizeClassSizes);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout____lazy_storage___iconGridSizeClassSizes) = (Class)a3;
  id v3 = a3;
}

- (id)iconGridSizeClassSizesForOrientation:(int64_t)a3
{
  id v3 = sub_1D7BA9B0C(a3);

  return v3;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  id v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_controlCenterDomain);
  id v6 = objc_msgSend(v5, sel_allNonDefaultGridSizeClasses);

  return (SBHIconGridSizeClassSet *)v6;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5 = a4;
  id v6 = self;
  sub_1D7BA9DF0(v5, 1);

  return result;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3 orientation:(id)a4
{
  id v7 = a4;
  v8 = self;
  sub_1D7BA9DF0(v7, a5);

  return result;
}

- (_TtC15ControlCenterUI14IconListLayout)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout____lazy_storage___iconGridSizeClassSizes) = 0;
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_portraitGridDimensions);
  id v3 = self;
  uint64_t v4 = CCUICompactModuleColumns();
  uint64_t v5 = CCUICompactModuleRows();
  uint64_t *v2 = v4;
  v2[1] = v5;
  id v6 = (Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout_fixedIconSpacing);
  CCUILayoutGutter();
  void *v6 = v7;
  v6[1] = v7;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for IconListLayout();
  return [(IconListLayout *)&v9 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI14IconListLayout____lazy_storage___iconGridSizeClassSizes));
}

@end