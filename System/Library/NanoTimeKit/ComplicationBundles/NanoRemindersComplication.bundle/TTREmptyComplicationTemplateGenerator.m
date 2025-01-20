@interface TTREmptyComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTREmptyComplicationTemplateGenerator

- (CLKComplicationTemplate)lockedTemplate
{
  return 0;
}

- (CLKComplicationTemplate)privacyTemplate
{
  return 0;
}

- (id)templateForTimelineModelEntry:(id)a3
{
  v3 = +[CLKSimpleTextProvider textProviderWithText:&stru_10780];
  id v4 = [objc_alloc((Class)CLKComplicationTemplateModularSmallSimpleText) initWithTextProvider:v3];

  return v4;
}

@end