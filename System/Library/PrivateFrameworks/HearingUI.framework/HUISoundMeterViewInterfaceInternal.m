@interface HUISoundMeterViewInterfaceInternal
- (HUISoundMeterViewInterfaceInternal)init;
- (HUISoundMeterViewInterfaceInternal)initWithConfigurationType:(int64_t)a3;
- (id)soundMeterViewController;
- (void)updateViewsWithSlowLeq:(double)a3 fastLeq:(double)a4 thresholdLevel:(unint64_t)a5;
@end

@implementation HUISoundMeterViewInterfaceInternal

- (HUISoundMeterViewInterfaceInternal)initWithConfigurationType:(int64_t)a3
{
  return (HUISoundMeterViewInterfaceInternal *)HUISoundMeterViewInterface.init(configurationType:)(a3);
}

- (id)soundMeterViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_viewController));
}

- (void)updateViewsWithSlowLeq:(double)a3 fastLeq:(double)a4 thresholdLevel:(unint64_t)a5
{
  v5 = self;
  sub_226B94CFC();
}

- (HUISoundMeterViewInterfaceInternal)init
{
  result = (HUISoundMeterViewInterfaceInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_226B91AF4((uint64_t)self + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_soundMeterView);
  v3 = (char *)self + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_logger;
  uint64_t v4 = sub_226B96948();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end