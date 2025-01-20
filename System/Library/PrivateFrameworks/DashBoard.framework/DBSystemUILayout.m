@interface DBSystemUILayout
- (BOOL)hasDualStatusBar;
- (BOOL)hasPhysicalControlBars;
- (CGRect)primaryContentFrame;
- (_TtC9DashBoard16DBSystemUILayout)init;
- (_TtC9DashBoard16DBSystemUILayout)initWithThemeAssetDocument:(id)a3 displayID:(id)a4 displayScale:(double)a5;
@end

@implementation DBSystemUILayout

- (_TtC9DashBoard16DBSystemUILayout)initWithThemeAssetDocument:(id)a3 displayID:(id)a4 displayScale:(double)a5
{
  uint64_t v7 = sub_22D85E4C8();
  return (_TtC9DashBoard16DBSystemUILayout *)DBSystemUILayout.init(themeAssetDocument:displayID:displayScale:)(a3, v7, v8, a5);
}

- (CGRect)primaryContentFrame
{
  uint64_t v3 = sub_22D85D068();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_22D85D088();
  sub_22D85D058();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  CGAffineTransformMakeScale(&v24, 1.0 / *(double *)((char *)&v7->super.isa + OBJC_IVAR____TtC9DashBoard16DBSystemUILayout_displayScale), 1.0 / *(double *)((char *)&v7->super.isa + OBJC_IVAR____TtC9DashBoard16DBSystemUILayout_displayScale));
  v25.origin.CGFloat x = v9;
  v25.origin.CGFloat y = v11;
  v25.size.CGFloat width = v13;
  v25.size.CGFloat height = v15;
  CGRect v26 = CGRectApplyAffineTransform(v25, &v24);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (BOOL)hasDualStatusBar
{
  v2 = self;
  char v3 = sub_22D85D078();

  return v3 & 1;
}

- (BOOL)hasPhysicalControlBars
{
  v2 = self;
  char v3 = sub_22D85D098();

  return v3 & 1;
}

- (_TtC9DashBoard16DBSystemUILayout)init
{
  CGRect result = (_TtC9DashBoard16DBSystemUILayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9DashBoard16DBSystemUILayout_systemUILayout;
  uint64_t v3 = sub_22D85D0A8();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end