@interface NCCameraComplicationDataSource
+ (BOOL)_shouldUseFallbackImagesForDevice:(id)a3;
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)appIdentifier;
+ (id)localizedAppName;
- (BOOL)supportsTapAction;
- (id)_complicationImageNamed:(id)a3;
- (id)_currentTimelineEntry;
- (id)_fullColorImageProviderWithFallbackImageName:(id)a3;
- (id)_imageProviderWithFallbackImageName:(id)a3;
- (id)_templateForFamily:(int64_t)a3;
- (id)currentSwitcherTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
@end

@implementation NCCameraComplicationDataSource

+ (id)appIdentifier
{
  return @"com.apple.NanoCamera";
}

+ (id)localizedAppName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"APP_NAME" value:@"Camera Remote" table:0];

  return v3;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  v4 = (void (**)(id, id))a4;
  id v5 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoCamera.NanoCameraWidget" containerBundleIdentifier:@"com.apple.NanoCamera" kind:@"NanoCameraWidget" intent:0];
  v4[2](v4, v5);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  id v4 = a4;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B9EB8122-4210-4EFC-A48A-1EFEA037CDF0"];
  unsigned __int8 v6 = [v4 supportsCapability:v5];

  return v6;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"FAB030A8-8E57-49E3-AFE8-418FBB1F049A"];
  unsigned int v7 = [v5 supportsCapability:v6];

  if (v7) {
    BOOL v8 = CLKComplicationFamilySimpleText == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 0;
  }
  if (CLKComplicationFamilyCircularMedium == a3) {
    return 1;
  }
  if ((unint64_t)a3 <= 0xC) {
    return (0x1795u >> a3) & 1;
  }
  return 0;
}

- (BOOL)supportsTapAction
{
  return 1;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  id v7 = (id)objc_opt_new();
  [v7 setScheme:@"com.apple.NanoCamera"];
  id v6 = [v7 URL];
  v5[2](v5, v6);
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  id v3 = [(NCCameraComplicationDataSource *)self family];

  return [(NCCameraComplicationDataSource *)self _templateForFamily:v3];
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NCCameraComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
}

- (id)_currentTimelineEntry
{
  id v3 = +[NSDate date];
  id v4 = [(NCCameraComplicationDataSource *)self _templateForFamily:[(NCCameraComplicationDataSource *)self family]];
  id v5 = +[CLKComplicationTimelineEntry entryWithDate:v3 complicationTemplate:v4];

  return v5;
}

- (id)_templateForFamily:(int64_t)a3
{
  if (CLKComplicationFamilySimpleText == a3)
  {
    id v3 = 0;
  }
  else
  {
    if (CLKComplicationFamilyCircularMedium == a3)
    {
      id v6 = [(NCCameraComplicationDataSource *)self _imageProviderWithFallbackImageName:@"CircularMedium"];
      id v3 = +[CLKComplicationTemplateCircularMediumSimpleImage templateWithImageProvider:v6];
    }
    else
    {
      id v3 = 0;
    }
    switch(a3)
    {
      case 0:
        id v7 = [(NCCameraComplicationDataSource *)self _imageProviderWithFallbackImageName:@"ModularSmall"];
        BOOL v8 = CLKComplicationTemplateModularSmallSimpleImage;
        goto LABEL_11;
      case 2:
        id v7 = [(NCCameraComplicationDataSource *)self _imageProviderWithFallbackImageName:@"UtilityCorner"];
        BOOL v8 = CLKComplicationTemplateUtilitarianSmallSquare;
        goto LABEL_11;
      case 4:
        id v7 = [(NCCameraComplicationDataSource *)self _imageProviderWithFallbackImageName:@"CircularSmall"];
        BOOL v8 = CLKComplicationTemplateCircularSmallSimpleImage;
        goto LABEL_11;
      case 7:
        id v7 = [(NCCameraComplicationDataSource *)self _imageProviderWithFallbackImageName:@"ExtraLarge"];
        BOOL v8 = CLKComplicationTemplateExtraLargeSimpleImage;
LABEL_11:
        v9 = [v8 templateWithImageProvider:v7];
        goto LABEL_17;
      case 8:
        id v7 = [(NCCameraComplicationDataSource *)self _fullColorImageProviderWithFallbackImageName:@"GraphicCorner"];
        v9 = +[CLKComplicationTemplateGraphicCornerCircularImage templateWithImageProvider:v7];

        uint64_t v23 = NTKRichComplicationViewUsePlatterKey;
        v24 = &__kCFBooleanTrue;
        v10 = &v24;
        v11 = &v23;
        goto LABEL_16;
      case 9:
        v12 = [(NCCameraComplicationDataSource *)self _fullColorImageProviderWithFallbackImageName:@"CircularMedium"];
        v13 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v12];
        uint64_t v19 = NTKRichComplicationViewUsePlatterKey;
        v20 = &__kCFBooleanTrue;
        v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        [v13 setMetadata:v14];

        uint64_t v15 = +[CLKComplicationTemplateGraphicBezelCircularText templateWithCircularTemplate:v13];

        id v3 = (void *)v15;
        break;
      case 10:
        id v7 = [(NCCameraComplicationDataSource *)self _fullColorImageProviderWithFallbackImageName:@"CircularMedium"];
        v9 = +[CLKComplicationTemplateGraphicCircularImage templateWithImageProvider:v7];

        uint64_t v21 = NTKRichComplicationViewUsePlatterKey;
        v22 = &__kCFBooleanTrue;
        v10 = &v22;
        v11 = &v21;
        goto LABEL_16;
      case 12:
        id v7 = [(NCCameraComplicationDataSource *)self _fullColorImageProviderWithFallbackImageName:@"GraphicXL"];
        v9 = +[CLKComplicationTemplateGraphicExtraLargeCircularImage templateWithImageProvider:v7];

        uint64_t v17 = NTKRichComplicationViewUsePlatterKey;
        v18 = &__kCFBooleanTrue;
        v10 = &v18;
        v11 = &v17;
LABEL_16:
        id v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:1];
        [v9 setMetadata:v3];
LABEL_17:

        id v3 = v9;
        break;
      default:
        break;
    }
  }

  return v3;
}

- (id)_complicationImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = +[UIImage imageNamed:v3 inBundle:v4 withConfiguration:0];

  return v5;
}

- (id)_imageProviderWithFallbackImageName:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NCCameraComplicationDataSource *)self device];
  LODWORD(v5) = [v5 _shouldUseFallbackImagesForDevice:v6];

  if (v5)
  {
    id v7 = [v4 stringByAppendingString:@"-Color"];
    BOOL v8 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v7];
    v9 = [v4 stringByAppendingString:@"-Background"];
    v10 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v9];
    v11 = [v4 stringByAppendingString:@"-Foreground"];
    v12 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v11];
    v13 = +[CLKImageProvider imageProviderWithOnePieceImage:v8 twoPieceImageBackground:v10 twoPieceImageForeground:v12];

    v14 = [v4 stringByAppendingString:@"-Color"];
    uint64_t v15 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v14];
    [v13 setForegroundAccentImage:v15];
  }
  else
  {
    v13 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:@"camera.shutter.button.fill"];
    v16 = +[UIColor systemGrayColor];
    [v13 setTintColor:v16];

    v14 = +[UIColor systemYellowColor];
    [v13 setSecondaryTintColor:v14];
  }

  return v13;
}

- (id)_fullColorImageProviderWithFallbackImageName:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NCCameraComplicationDataSource *)self device];
  LODWORD(v5) = [v5 _shouldUseFallbackImagesForDevice:v6];

  if (v5)
  {
    id v7 = [v4 stringByAppendingString:@"-Color"];
    uint64_t v17 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v7];
    v18 = [v4 stringByAppendingString:@"-Color"];
    BOOL v8 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v18];
    v9 = [v4 stringByAppendingString:@"-Background"];
    v10 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v9];
    v11 = [v4 stringByAppendingString:@"-Foreground"];
    v12 = [(NCCameraComplicationDataSource *)self _complicationImageNamed:v11];
    v13 = +[CLKImageProvider imageProviderWithOnePieceImage:v8 twoPieceImageBackground:v10 twoPieceImageForeground:v12];
    v14 = +[CLKFullColorImageProvider providerWithFullColorImage:v17 tintedImageProvider:v13];
  }
  else
  {
    v14 = +[CLKFullColorSymbolImageProvider symbolImageProviderWithSystemName:@"camera.shutter.button.fill"];
    uint64_t v15 = +[UIColor systemGrayColor];
    [v14 setTintColor:v15];

    id v7 = +[UIColor systemYellowColor];
    [v14 setSecondaryTintColor:v7];
  }

  return v14;
}

+ (BOOL)_shouldUseFallbackImagesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"436C3C42-1855-4417-BD50-BD3D1B870E0F"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5 ^ 1;
}

@end