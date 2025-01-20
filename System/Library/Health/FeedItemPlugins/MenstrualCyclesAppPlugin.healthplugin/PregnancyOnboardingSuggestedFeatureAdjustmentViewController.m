@interface PregnancyOnboardingSuggestedFeatureAdjustmentViewController
- (_TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)hxui_secondaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation PregnancyOnboardingSuggestedFeatureAdjustmentViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_24125F578();
}

- (void)hxui_primaryFooterButtonTapped
{
}

- (void)hxui_secondaryFooterButtonTapped
{
}

- (void)hxui_cancelButtonTapped
{
  v2 = self;
  sub_24125FAF0();
}

- (_TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  long long v3 = *(_OWORD *)((char *)&self->super.super.super._childModalViewControllers
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[6] = *(_OWORD *)((char *)&self->super.super.super._nibBundle
                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[7] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._dimmingView
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[8] = *(_OWORD *)((char *)&self->super.super.super._previousRootViewController
                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[9] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._tab
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[2] = *(_OWORD *)((char *)&self->super.super.super._view
                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[3] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super._title
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[4] = *(_OWORD *)((char *)&self->super.super.super._navigationItem
                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[5] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController_configuration);
  v8[1] = v7;
  sub_2412616F4((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin59PregnancyOnboardingSuggestedFeatureAdjustmentViewController____lazy_storage___hostingController));
}

@end