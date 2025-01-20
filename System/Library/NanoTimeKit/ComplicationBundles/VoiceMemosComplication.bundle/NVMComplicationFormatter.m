@interface NVMComplicationFormatter
- (BOOL)supportsFamily:(int64_t)a3 forDevice:(id)a4;
- (id)_templateWithFamily:(int64_t)a3 forDevice:(id)a4;
- (id)basicAccentImageProviderWithPrefix:(id)a3;
- (id)formattedTemplateWithFamily:(int64_t)a3 forDevice:(id)a4;
- (id)fullColorImageProviderWithPrefix:(id)a3 suffix:(id)a4;
- (id)imageProviderWithPrefix:(id)a3;
- (id)imageProviderWithPrefix:(id)a3 suffix:(id)a4;
- (id)switcherTemplateWithFamily:(int64_t)a3 forDevice:(id)a4;
@end

@implementation NVMComplicationFormatter

- (BOOL)supportsFamily:(int64_t)a3 forDevice:(id)a4
{
  if (CLKComplicationFamilyCircularMedium == a3) {
    return 1;
  }
  if ((unint64_t)a3 <= 0xC) {
    return (0x1595u >> a3) & 1;
  }
  return 0;
}

- (id)formattedTemplateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  return [(NVMComplicationFormatter *)self _templateWithFamily:a3 forDevice:a4];
}

- (id)switcherTemplateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  return [(NVMComplicationFormatter *)self _templateWithFamily:a3 forDevice:a4];
}

- (id)basicAccentImageProviderWithPrefix:(id)a3
{
  v3 = +[NSString stringWithFormat:@"%@_voicememos-color", a3];
  v4 = sub_2A24(v3);
  v5 = +[CLKImageProvider imageProviderWithOnePieceImage:v4];
  [v5 setForegroundAccentImage:v4];

  return v5;
}

- (id)imageProviderWithPrefix:(id)a3 suffix:(id)a4
{
  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  if (v5) {
    v7 = v5;
  }
  else {
    v7 = &stru_4200;
  }
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = &stru_4200;
  }
  v19 = +[NSString stringWithFormat:@"%@_voicememos%@", v7, v8];
  v20 = +[NSString stringWithFormat:@"%@_voicememos-color%@", v7, v8];
  v9 = +[NSString stringWithFormat:@"%@_voicememos-background%@", v7, v8];
  v10 = +[NSString stringWithFormat:@"%@_voicememos-foreground%@", v7, v8];
  v11 = sub_2A24(v20);
  uint64_t v12 = sub_2A24(v19);
  v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = v11;
  }
  v15 = sub_2A24(v9);
  v16 = sub_2A24(v10);
  v17 = +[CLKImageProvider imageProviderWithOnePieceImage:v14 twoPieceImageBackground:v15 twoPieceImageForeground:v16];

  return v17;
}

- (id)imageProviderWithPrefix:(id)a3
{
  return [(NVMComplicationFormatter *)self imageProviderWithPrefix:a3 suffix:0];
}

- (id)fullColorImageProviderWithPrefix:(id)a3 suffix:(id)a4
{
  v4 = +[NSString stringWithFormat:@"%@_voicememos-color%@", a3, a4];
  v5 = sub_2A24(v4);
  v6 = +[CLKFullColorImageProvider providerWithFullColorImage:v5 monochromeFilterType:1 applyScalingAndCircularMasking:0];

  return v6;
}

- (id)_templateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (CLKComplicationFamilyCircularMedium != a3)
  {
    v10 = 0;
    switch(a3)
    {
      case 0:
        v7 = CLKComplicationTemplateModularSmallSimpleImage;
        CFStringRef v11 = @"modular-sm";
        goto LABEL_10;
      case 2:
        v7 = CLKComplicationTemplateUtilitarianSmallSquare;
        CFStringRef v11 = @"utility-corner";
        goto LABEL_10;
      case 4:
        v7 = CLKComplicationTemplateCircularSmallSimpleImage;
        CFStringRef v8 = @"circular-sm";
        goto LABEL_3;
      case 7:
        v7 = CLKComplicationTemplateExtraLargeSimpleImage;
        CFStringRef v11 = @"XL";
LABEL_10:
        uint64_t v9 = [(NVMComplicationFormatter *)self basicAccentImageProviderWithPrefix:v11];
        goto LABEL_11;
      case 8:
        v17 = [(NVMComplicationFormatter *)self fullColorImageProviderWithPrefix:@"graphic-corner" suffix:@"-394h"];
        v10 = +[CLKComplicationTemplateGraphicCornerCircularImage templateWithImageProvider:v17];

        CFStringRef v24 = @"NTKRichComplicationViewBackgroundColorKey";
        v13 = sub_2B08();
        v25 = v13;
        v14 = &v25;
        v15 = &v24;
        goto LABEL_18;
      case 10:
        uint64_t v12 = [(NVMComplicationFormatter *)self fullColorImageProviderWithPrefix:@"graphic-circular" suffix:@"-394h"];
        v10 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v12];

        CFStringRef v22 = @"NTKRichComplicationViewBackgroundColorKey";
        v13 = sub_2B08();
        v23 = v13;
        v14 = &v23;
        v15 = &v22;
        goto LABEL_18;
      case 12:
        v18 = [(NVMComplicationFormatter *)self fullColorImageProviderWithPrefix:@"graphic-XL" suffix:@"-394h"];
        v10 = +[CLKComplicationTemplateGraphicExtraLargeCircularImage templateWithImageProvider:v18];

        CFStringRef v20 = @"NTKRichComplicationViewBackgroundColorKey";
        v13 = sub_2B08();
        v21 = v13;
        v14 = &v21;
        v15 = &v20;
LABEL_18:
        v19 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:1];
        [v10 setMetadata:v19];

        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  v7 = CLKComplicationTemplateCircularMediumSimpleImage;
  CFStringRef v8 = @"circular-md";
LABEL_3:
  uint64_t v9 = [(NVMComplicationFormatter *)self imageProviderWithPrefix:v8];
LABEL_11:
  v13 = (void *)v9;
  v10 = [v7 templateWithImageProvider:v9];
LABEL_12:

LABEL_13:

  return v10;
}

@end