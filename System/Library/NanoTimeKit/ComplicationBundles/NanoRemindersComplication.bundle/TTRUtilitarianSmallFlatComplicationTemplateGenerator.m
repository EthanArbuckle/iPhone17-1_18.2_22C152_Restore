@interface TTRUtilitarianSmallFlatComplicationTemplateGenerator
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (id)templateForTimelineModelEntry:(id)a3;
@end

@implementation TTRUtilitarianSmallFlatComplicationTemplateGenerator

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
  v4 = +[TTRComplicationAsset imageForFamily:7];
  if (v4)
  {
    v5 = +[CLKImageProvider imageProviderWithOnePieceImage:v4];
    [v5 setForegroundAccentImage:v4];
  }
  else
  {
    v6 = +[REMLog ui];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_AF18(v6);
    }

    v5 = 0;
  }
  id v7 = [objc_alloc((Class)CLKComplicationTemplateUtilitarianSmallFlat) initWithTextProvider:v3 imageProvider:v5];

  return v7;
}

@end