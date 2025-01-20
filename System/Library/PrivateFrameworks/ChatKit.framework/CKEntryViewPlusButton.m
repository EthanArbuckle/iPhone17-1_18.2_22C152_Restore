@interface CKEntryViewPlusButton
- (BOOL)automaticallyAdjustsBackgroundCornerRadius;
- (BOOL)enabled;
- (CAFilter)backgroundCompositingFilterForDarkMode;
- (CAFilter)backgroundCompositingFilterForLightMode;
- (CKEntryViewPlusButton)initWithCoder:(id)a3;
- (CKEntryViewPlusButton)initWithFrame:(CGRect)a3;
- (UIButton)button;
- (UIColor)plusButtonBackgroundColor;
- (double)backgroundBlurRadiusDarkMode;
- (double)backgroundBlurRadiusLightMode;
- (double)backgroundBlurRasterizationPercentage;
- (double)backgroundCornerRadius;
- (double)plusSymbolOpacity;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setAutomaticallyAdjustsBackgroundCornerRadius:(BOOL)a3;
- (void)setBackgroundBlurRadiusDarkMode:(double)a3;
- (void)setBackgroundBlurRadiusLightMode:(double)a3;
- (void)setBackgroundBlurRasterizationPercentage:(double)a3;
- (void)setBackgroundCompositingFilterForDarkMode:(id)a3;
- (void)setBackgroundCompositingFilterForLightMode:(id)a3;
- (void)setBackgroundCornerRadius:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPlusButtonBackgroundColor:(id)a3;
- (void)setPlusSymbolOpacity:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKEntryViewPlusButton

- (CKEntryViewPlusButton)initWithFrame:(CGRect)a3
{
  EntryViewPlusButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CKEntryViewPlusButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F5463D0();
}

- (BOOL)enabled
{
  v2 = (BOOL *)self + OBJC_IVAR___CKEntryViewPlusButton_enabled;
  swift_beginAccess();
  return *v2;
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  sub_18F543CB0(a3);
}

- (BOOL)automaticallyAdjustsBackgroundCornerRadius
{
  return (*(unsigned char **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView))[OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius];
}

- (void)setAutomaticallyAdjustsBackgroundCornerRadius:(BOOL)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView);
  char v4 = v3[OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius];
  v3[OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387322PlusButtonClippingView_automaticallyAdjustsCornerRadius] = a3;
  if ((v4 & 1) == 0 && a3) {
    objc_msgSend(v3, sel_setNeedsLayout);
  }
}

- (double)backgroundCornerRadius
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_clippingView), sel__continuousCornerRadius);
  return result;
}

- (void)setBackgroundCornerRadius:(double)a3
{
}

- (UIColor)plusButtonBackgroundColor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_buttonView), sel_backgroundColor);

  return (UIColor *)v2;
}

- (void)setPlusButtonBackgroundColor:(id)a3
{
}

- (double)backgroundBlurRasterizationPercentage
{
  return *(double *)(*(char **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR___CKEntryViewPlusButton_blurContainerView)
                   + OBJC_IVAR____TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387327PlusButtonBlurContainerView_rasterizationPercent);
}

- (void)setBackgroundBlurRasterizationPercentage:(double)a3
{
  char v4 = self;
  sub_18F544244(a3);
}

- (double)backgroundBlurRadiusLightMode
{
  id v2 = (double *)((char *)self + OBJC_IVAR___CKEntryViewPlusButton_backgroundBlurRadiusLightMode);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundBlurRadiusLightMode:(double)a3
{
}

- (double)backgroundBlurRadiusDarkMode
{
  id v2 = (double *)((char *)self + OBJC_IVAR___CKEntryViewPlusButton_backgroundBlurRadiusDarkMode);
  swift_beginAccess();
  return *v2;
}

- (void)setBackgroundBlurRadiusDarkMode:(double)a3
{
}

- (CAFilter)backgroundCompositingFilterForLightMode
{
  return (CAFilter *)sub_18F544AF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForLightMode);
}

- (void)setBackgroundCompositingFilterForLightMode:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18F546488(a3);
}

- (CAFilter)backgroundCompositingFilterForDarkMode
{
  return (CAFilter *)sub_18F544AF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForDarkMode);
}

- (void)setBackgroundCompositingFilterForDarkMode:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18F546590(a3);
}

- (double)plusSymbolOpacity
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKEntryViewPlusButton_iconImageView), sel_alpha);
  return result;
}

- (void)setPlusSymbolOpacity:(double)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_18F544E74((uint64_t)a3);
}

- (UIButton)button
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___CKEntryViewPlusButton_buttonView));
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_18F545158();
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKEntryViewPlusButton_plusButtonDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForLightMode));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKEntryViewPlusButton_backgroundCompositingFilterForDarkMode);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)_s7ChatKit19EntryViewPlusButtonC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0kH0C_So0K6RegionCtF_0();

  return v9;
}

@end