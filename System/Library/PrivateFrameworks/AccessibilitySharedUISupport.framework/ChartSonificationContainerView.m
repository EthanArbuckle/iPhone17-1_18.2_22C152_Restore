@interface ChartSonificationContainerView
- (AXChartDescriptor)accessibilityChartDescriptor;
- (BOOL)isAccessibilityElement;
- (NSAttributedString)accessibilityAttributedLabel;
- (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView)initWithCoder:(id)a3;
- (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView)initWithFrame:(CGRect)a3;
- (void)_accessibilityDidChangeSonificationPlaybackPosition:(double)a3;
- (void)_accessibilitySonificationPlaybackStatusChanged:(unint64_t)a3;
- (void)updatePlayhead:(double)a3;
@end

@implementation ChartSonificationContainerView

- (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_displayLink) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_state) = 0;
  id v4 = a3;

  result = (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *)sub_228E3E4B0();
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityDidChangeSonificationPlaybackPosition:(double)a3
{
  id v4 = self;
  sub_228D88204(a3);
}

- (void)_accessibilitySonificationPlaybackStatusChanged:(unint64_t)a3
{
  id v4 = self;
  sub_228D87FE0((id)a3);
}

- (void)updatePlayhead:(double)a3
{
  id v4 = self;
  sub_228D88204(a3);
}

- (NSAttributedString)accessibilityAttributedLabel
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_chartDescriptor), sel_attributedTitle);
  return (NSAttributedString *)v2;
}

- (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC28AccessibilitySharedUISupport30ChartSonificationContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_chartDescriptor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_playheadTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_numberFormatter));
  swift_release();
}

- (AXChartDescriptor)accessibilityChartDescriptor
{
  return (AXChartDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC28AccessibilitySharedUISupport30ChartSonificationContainerView_chartDescriptor));
}

@end