@interface TTRCircularSmallComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRCircularSmallComplicationTemplateGenerator

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
  v3 = +[TTRComplicationAsset imageForFamily:0];
  if (!v3)
  {
    v4 = +[REMLog ui];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_AF5C(v4);
    }

    v3 = +[UIImage ttr_placeholderForInvalidImage];
  }
  v5 = +[CLKImageProvider imageProviderWithOnePieceImage:v3];
  id v6 = [objc_alloc((Class)CLKComplicationTemplateCircularSmallSimpleImage) initWithImageProvider:v5];

  return v6;
}

@end