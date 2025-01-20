@interface NearbyTransitComplicationFormatter
+ (BOOL)supportsFamily:(int64_t)a3 forDevice:(id)a4;
+ (CLKFullColorSymbolImageProvider)fullColorSymbolProvider;
+ (CLKSymbolImageProvider)symbolProvider;
+ (UIColor)tintColor;
+ (id)_templateWithFamily:(int64_t)a3;
+ (id)formattedTemplateWithFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)image;
@end

@implementation NearbyTransitComplicationFormatter

+ (id)image
{
  return +[UIImage systemImageNamed:@"tram.fill"];
}

+ (CLKSymbolImageProvider)symbolProvider
{
  v3 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:@"tram.fill"];
  v4 = [a1 tintColor];
  [v3 setTintColor:v4];

  return (CLKSymbolImageProvider *)v3;
}

+ (CLKFullColorSymbolImageProvider)fullColorSymbolProvider
{
  v3 = +[CLKFullColorSymbolImageProvider symbolImageProviderWithSystemName:@"tram.fill"];
  v4 = [a1 tintColor];
  [v3 setTintColor:v4];

  return (CLKFullColorSymbolImageProvider *)v3;
}

+ (UIColor)tintColor
{
  return +[UIColor systemBlueColor];
}

+ (BOOL)supportsFamily:(int64_t)a3 forDevice:(id)a4
{
  if (CLKComplicationFamilyCircularMedium == a3) {
    return 1;
  }
  if ((unint64_t)a3 <= 0xC) {
    return (0x1795u >> a3) & 1;
  }
  return 0;
}

+ (id)formattedTemplateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  v5 = objc_msgSend(a1, "_templateWithFamily:", a3, a4);
  v6 = [a1 tintColor];
  [v5 setTintColor:v6];

  return v5;
}

+ (id)_templateWithFamily:(int64_t)a3
{
  if (CLKComplicationFamilyCircularMedium != a3)
  {
    id v7 = 0;
    switch(a3)
    {
      case 0:
      case 4:
        v4 = (objc_class *)CLKComplicationTemplateModularSmallSimpleImage;
        goto LABEL_3;
      case 2:
        v4 = (objc_class *)CLKComplicationTemplateUtilitarianSmallSquare;
        goto LABEL_3;
      case 7:
        v4 = (objc_class *)CLKComplicationTemplateExtraLargeSimpleImage;
        goto LABEL_3;
      case 8:
        id v8 = objc_alloc((Class)CLKComplicationTemplateGraphicCornerCircularImage);
        v9 = [a1 fullColorSymbolProvider];
        id v7 = [v8 initWithImageProvider:v9];

        uint64_t v23 = NTKRichComplicationViewUsePlatterKey;
        v24 = &__kCFBooleanTrue;
        v10 = &v24;
        v11 = &v23;
        goto LABEL_12;
      case 9:
        id v12 = objc_alloc((Class)CLKComplicationTemplateGraphicCircularImage);
        v13 = [a1 fullColorSymbolProvider];
        id v7 = [v12 initWithImageProvider:v13];

        uint64_t v25 = NTKRichComplicationViewUsePlatterKey;
        v26 = &__kCFBooleanTrue;
        v10 = &v26;
        v11 = &v25;
        goto LABEL_12;
      case 10:
        id v14 = objc_alloc((Class)CLKComplicationTemplateGraphicCircularImage);
        v15 = [a1 fullColorSymbolProvider];
        id v7 = [v14 initWithImageProvider:v15];

        uint64_t v21 = NTKRichComplicationViewUsePlatterKey;
        v22 = &__kCFBooleanTrue;
        v10 = &v22;
        v11 = &v21;
        goto LABEL_12;
      case 12:
        id v16 = objc_alloc((Class)CLKComplicationTemplateGraphicExtraLargeCircularImage);
        v17 = [a1 fullColorSymbolProvider];
        id v7 = [v16 initWithImageProvider:v17];

        uint64_t v19 = NTKRichComplicationViewUsePlatterKey;
        v20 = &__kCFBooleanTrue;
        v10 = &v20;
        v11 = &v19;
LABEL_12:
        v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
        [v7 setMetadata:v6];
        goto LABEL_13;
      default:
        goto LABEL_14;
    }
  }
  v4 = (objc_class *)CLKComplicationTemplateCircularMediumSimpleImage;
LABEL_3:
  id v5 = [v4 alloc];
  v6 = [a1 symbolProvider];
  id v7 = [v5 initWithImageProvider:v6];
LABEL_13:

LABEL_14:

  return v7;
}

@end