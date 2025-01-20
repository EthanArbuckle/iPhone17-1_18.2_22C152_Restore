@interface TTRGraphicCircularComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (CLKComplicationTemplateGraphicCircular)complicationTemplate;
@end

@implementation TTRGraphicCircularComplicationTemplateGenerator

- (CLKComplicationTemplateGraphicCircular)complicationTemplate
{
  v2 = +[TTRComplicationAsset imageForFamily:2];
  if (!v2)
  {
    v3 = +[REMLog ui];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_B1DC(v3);
    }

    v2 = +[UIImage ttr_placeholderForInvalidImage];
  }
  v4 = +[CLKFullColorImageProvider providerWithFullColorImage:v2 monochromeFilterType:1];
  id v5 = [objc_alloc((Class)CLKComplicationTemplateGraphicCircularImage) initWithImageProvider:v4];
  uint64_t v8 = NTKRichComplicationViewUsePlatterKey;
  v9 = &__kCFBooleanTrue;
  v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v5 setMetadata:v6];

  return (CLKComplicationTemplateGraphicCircular *)v5;
}

- (CLKComplicationTemplate)lockedTemplate
{
  return 0;
}

- (CLKComplicationTemplate)privacyTemplate
{
  return 0;
}

@end