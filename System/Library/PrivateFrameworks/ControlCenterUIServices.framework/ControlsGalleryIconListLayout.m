@interface ControlsGalleryIconListLayout
- (CGSize)iconSpacingForOrientation:(int64_t)a3;
- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses;
- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (_TtC23ControlCenterUIServices29ControlsGalleryIconListLayout)init;
- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3;
- (unint64_t)numberOfRowsForOrientation:(int64_t)a3;
@end

@implementation ControlsGalleryIconListLayout

- (unint64_t)numberOfColumnsForOrientation:(int64_t)a3
{
  return 4;
}

- (unint64_t)numberOfRowsForOrientation:(int64_t)a3
{
  return -1;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  MEMORY[0x270F82D00](10, a2, a3, 28.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (SBIconImageInfo)iconImageInfo
{
  double v3 = self;
  double v4 = SBHIconGridSizeClassForCCUIGridSizeClass(0);
  sub_24A7CCC74(v4);

  return result;
}

- (CGSize)iconSpacingForOrientation:(int64_t)a3
{
  double v3 = self;
  sub_24A7CCF18();
  double v5 = v4;

  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  double v3 = self;
  double v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedApplication);
  double v6 = (_TtC23ControlCenterUIServices29ControlsGalleryIconListLayout *)objc_msgSend(v5, sel_preferredContentSizeCategory);

  if (sub_24A7DCBA0())
  {
    id v7 = sub_24A7CDFD0((uint64_t)sub_24A7CCB84, 0);
  }
  else
  {

    id v7 = objc_retain(*(id *)((char *)&v4->super.isa
                           + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes));
    double v6 = v4;
  }

  return (SBHIconGridSizeClassSizeMap *)v7;
}

- (SBHIconGridSizeClassSet)supportedIconGridSizeClasses
{
  double v3 = self;
  double v4 = self;
  id v5 = objc_msgSend(v3, sel_controlCenterDomain);
  id v6 = objc_msgSend(v5, sel_allNonDefaultGridSizeClasses);

  return (SBHIconGridSizeClassSet *)v6;
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5 = a4;
  id v6 = self;
  sub_24A7CCC74(v5);

  return result;
}

- (_TtC23ControlCenterUIServices29ControlsGalleryIconListLayout)init
{
  uint64_t v3 = OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes;
  double v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_24A7CDFD0((uint64_t)nullsub_1, 0);
  id v5 = (char *)v4
     + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___displayScale;
  *(void *)id v5 = 0;
  v5[8] = 1;
  id v6 = (char *)v4
     + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___gridGeometryInfo;
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout) = 0;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ControlsGalleryIconListLayout();
  return [(ControlsGalleryIconListLayout *)&v8 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes));
  swift_unknownObjectRelease();
}

@end