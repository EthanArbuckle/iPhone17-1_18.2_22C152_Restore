@interface UIVibrancyEffect(NCWidgetDeprecated)
+ (id)notificationCenterVibrancyEffect;
+ (id)widgetPrimaryVibrancyEffect;
+ (id)widgetSecondaryVibrancyEffect;
@end

@implementation UIVibrancyEffect(NCWidgetDeprecated)

+ (id)widgetPrimaryVibrancyEffect
{
  v0 = [MEMORY[0x263F54000] _visualStylingProviderForStyleSetNamed:@"platterClientStyle" inBundle:0];
  v1 = [v0 _visualStylingForStyle:0];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)widgetSecondaryVibrancyEffect
{
  v0 = [MEMORY[0x263F54000] _visualStylingProviderForStyleSetNamed:@"platterClientStyle" inBundle:0];
  v1 = [v0 _visualStylingForStyle:1];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)notificationCenterVibrancyEffect
{
  v0 = (void *)MEMORY[0x263F1CB58];
  v1 = [MEMORY[0x263F1C480] effectWithStyle:2];
  v2 = [v0 effectForBlurEffect:v1];

  return v2;
}

@end