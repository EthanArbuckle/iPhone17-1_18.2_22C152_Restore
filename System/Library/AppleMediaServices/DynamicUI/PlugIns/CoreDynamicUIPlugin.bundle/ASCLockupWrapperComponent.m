@interface ASCLockupWrapperComponent
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent)init;
- (_TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent)initWithFrame:(CGRect)a3;
- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)prepareForReuse;
@end

@implementation ASCLockupWrapperComponent

- (_TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent *)sub_15C3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1762C((SEL *)&selRef_prepareForReuse);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_15DE4();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_15E50();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5 = self;
  sub_15F0C();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_EF88((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent_postInstallAction], &qword_BAAD0);
  sub_18234(*(void *)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent_actionRunner]);
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin25ASCLockupWrapperComponent_lockupView];
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_178F4();
}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = sub_17DAC();

  swift_unknownObjectRelease();

  return v7;
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  return 0;
}

@end