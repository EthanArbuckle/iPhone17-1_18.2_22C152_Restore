@interface TTRExtraLargeComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRExtraLargeComplicationTemplateGenerator

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
  v3 = +[TTRComplicationAsset imageForFamily:1];
  if (!v3)
  {
    v4 = +[REMLog ui];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_B198(v4);
    }

    v3 = +[UIImage ttr_placeholderForInvalidImage];
  }
  v5 = +[CLKImageProvider imageProviderWithOnePieceImage:v3];
  [v5 setForegroundAccentImage:v3];
  id v6 = [objc_alloc((Class)CLKComplicationTemplateExtraLargeSimpleImage) initWithImageProvider:v5];

  return v6;
}

@end