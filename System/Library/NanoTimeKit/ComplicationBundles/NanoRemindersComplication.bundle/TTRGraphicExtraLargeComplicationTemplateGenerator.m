@interface TTRGraphicExtraLargeComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRGraphicExtraLargeComplicationTemplateGenerator

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
  v3 = +[TTRComplicationAsset imageForFamily:4];
  if (!v3)
  {
    v4 = +[REMLog ui];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_B0CC(v4);
    }

    v3 = +[UIImage ttr_placeholderForInvalidImage];
  }
  v5 = +[CLKFullColorImageProvider providerWithFullColorImage:v3 monochromeFilterType:1];
  id v6 = [objc_alloc((Class)CLKComplicationTemplateGraphicExtraLargeCircularImage) initWithImageProvider:v5];
  uint64_t v9 = NTKRichComplicationViewUsePlatterKey;
  v10 = &__kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v6 setMetadata:v7];

  return v6;
}

@end