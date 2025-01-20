@interface CameraProRawCodecSettingsController
+ (id)_fileEstimatesFooterForValues:(id)a3 rawFileFormatBehavior:(int64_t)a4;
+ (id)_localizationKeyForFormatPreference:(int64_t)a3;
+ (id)_localizationKeyForRawEncodingFormatPreference:(int64_t)a3;
+ (id)_photoFormatPreferenceTitleForValue:(id)a3;
+ (id)_proRawFileFormatFooterForValues:(id)a3 selectedProRawFileFormatFormat:(id)a4;
+ (id)_proRawFileFormatPreferenceTitle;
+ (id)_proRawFileFormatPreferenceTitleForValue:(id)a3;
+ (id)_secondaryPhotoFormatFooterForValues:(id)a3 includeFileEstimates:(BOOL)a4 rawFileFormatBehavior:(int64_t)a5;
+ (id)photoFormatPreferenceShortTitleForValue:(id)a3;
+ (id)selectedPhotoFormat;
+ (void)setSelectedPhotoFormat:(id)a3;
- (id)_selectedProRawFileFormat;
- (id)specifiers;
- (void)_setSelectedProRawFileFormat:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CameraProRawCodecSettingsController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v44 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v46 = [(id)objc_opt_class() selectedPhotoFormat];
    v5 = +[CAMCaptureCapabilities capabilities];
    unsigned int v6 = [v5 isProRawJpegXLSupported];

    unsigned int v42 = v6;
    uint64_t v7 = v6 ^ 1;
    v8 = +[PSSpecifier groupSpecifierWithID:@"PhotoFormatGroupSpecifierID"];
    v9 = [(id)objc_opt_class() _secondaryPhotoFormatFooterForValues:&off_24E40 includeFileEstimates:v7 rawFileFormatBehavior:0];
    uint64_t v40 = PSFooterTextGroupKey;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9);

    uint64_t v39 = PSIsRadioGroupKey;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue);
    v48 = v4;
    v45 = v8;
    [v4 addObject:v8];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v10 = [&off_24E40 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v10)
    {
      id v11 = v10;
      v47 = 0;
      uint64_t v12 = *(void *)v54;
      uint64_t v13 = PSValueKey;
      uint64_t v14 = PSShortTitlesKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(&off_24E40);
          }
          uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          v17 = [(id)objc_opt_class() _photoFormatPreferenceTitleForValue:v16];
          v18 = [(id)objc_opt_class() photoFormatPreferenceShortTitleForValue:v16];
          v19 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:0 get:0 detail:0 cell:3 edit:0];
          [v19 setObject:v16 forKeyedSubscript:v13];
          [v19 setObject:v18 forKeyedSubscript:v14];
          [v48 addObject:v19];
          if ([v46 isEqualToNumber:v16])
          {
            id v20 = v19;

            v47 = v20;
          }
        }
        id v11 = [&off_24E40 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v11);
    }
    else
    {
      v47 = 0;
    }
    uint64_t v21 = PSRadioGroupCheckedSpecifierKey;
    [v45 setProperty:v47 forKey:PSRadioGroupCheckedSpecifierKey];
    v22 = [(CameraProRawCodecSettingsController *)self _selectedProRawFileFormat];
    if (v42)
    {
      uint64_t v43 = v21;
      v23 = +[PSSpecifier groupSpecifierWithID:@"ProRawFileFormatGroupSpecifierID"];
      v24 = [(id)objc_opt_class() _proRawFileFormatPreferenceTitle];
      [v23 setName:v24];

      v25 = [(id)objc_opt_class() _proRawFileFormatFooterForValues:&off_24E40 selectedProRawFileFormatFormat:v22];
      [v23 setObject:v25 forKeyedSubscript:v40];

      [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:v39];
      v41 = v23;
      [v48 addObject:v23];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v26 = [&off_24E58 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v26)
      {
        id v27 = v26;
        v28 = 0;
        uint64_t v29 = *(void *)v50;
        uint64_t v30 = PSValueKey;
        do
        {
          for (j = 0; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v50 != v29) {
              objc_enumerationMutation(&off_24E58);
            }
            uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
            v33 = [(id)objc_opt_class() _proRawFileFormatPreferenceTitleForValue:v32];
            v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:3 edit:0];
            [v34 setObject:v32 forKeyedSubscript:v30];
            [v48 addObject:v34];
            if ([v22 isEqualToNumber:v32])
            {
              id v35 = v34;

              v28 = v35;
            }
          }
          id v27 = [&off_24E58 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v27);
      }
      else
      {
        v28 = 0;
      }
      [v41 setProperty:v28 forKey:v43];
    }
    v36 = *(void **)&self->PSListController_opaque[v44];
    *(void *)&self->PSListController_opaque[v44] = v48;
    id v37 = v48;

    v3 = *(void **)&self->PSListController_opaque[v44];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CameraProRawCodecSettingsController;
  [(CameraProRawCodecSettingsController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = [(CameraProRawCodecSettingsController *)self specifierForID:@"PhotoFormatGroupSpecifierID"];
  if (v7)
  {
    v8 = [(CameraProRawCodecSettingsController *)self indexPathForSpecifier:v7];
    uint64_t v9 = (uint64_t)[v8 section];
  }
  else
  {
    uint64_t v9 = -1;
  }
  id v10 = [(CameraProRawCodecSettingsController *)self specifierForID:@"ProRawFileFormatGroupSpecifierID"];
  if (v10)
  {
    id v11 = [(CameraProRawCodecSettingsController *)self indexPathForSpecifier:v10];
    uint64_t v12 = (uint64_t)[v11 section];
  }
  else
  {
    uint64_t v12 = -1;
  }
  if ([v6 section] == (id)v9)
  {
    uint64_t v13 = [(CameraProRawCodecSettingsController *)self specifierAtIndexPath:v6];
    uint64_t v14 = [v13 propertyForKey:PSValueKey];
    [(id)objc_opt_class() setSelectedPhotoFormat:v14];
LABEL_11:

    goto LABEL_12;
  }
  if ([v6 section] == (id)v12)
  {
    uint64_t v13 = [(CameraProRawCodecSettingsController *)self specifierAtIndexPath:v6];
    uint64_t v14 = [v13 propertyForKey:PSValueKey];
    [(CameraProRawCodecSettingsController *)self _setSelectedProRawFileFormat:v14];
    goto LABEL_11;
  }
LABEL_12:
  [(CameraProRawCodecSettingsController *)self reloadSpecifiers];
}

+ (id)selectedPhotoFormat
{
  Boolean keyExistsAndHasValidFormat = 0;
  v2 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(CAMUserPreferenceSecondaryPhotoFormat, @"com.apple.camera", &keyExistsAndHasValidFormat)];
  if (!keyExistsAndHasValidFormat)
  {

    v2 = &off_24940;
  }

  return v2;
}

+ (void)setSelectedPhotoFormat:(id)a3
{
  id value = a3;
  CFStringRef v3 = (const __CFString *)CAMUserPreferencesDesiredPhotoResolution;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(CAMUserPreferencesDesiredPhotoResolution, @"com.apple.camera", 0);
  CFStringRef v5 = (const __CFString *)CAMUserPreferencesDesiredRAWMode;
  if (CFPreferencesGetAppIntegerValue(CAMUserPreferencesDesiredRAWMode, @"com.apple.camera", 0) == 1
    || AppIntegerValue == 3)
  {
    CFPreferencesSetAppValue(v5, 0, @"com.apple.camera");
    CFPreferencesSetAppValue(v3, 0, @"com.apple.camera");
  }
  CFPreferencesSetAppValue(CAMUserPreferenceSecondaryPhotoFormat, value, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (id)_selectedProRawFileFormat
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(CAMUserPreferenceProRawFileFormatFormat, @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CFStringRef v3 = +[NSNumber numberWithInteger:AppIntegerValue];
  }
  else
  {
    CFStringRef v3 = &off_24958;
  }

  return v3;
}

- (void)_setSelectedProRawFileFormat:(id)a3
{
  CFPreferencesSetAppValue(CAMUserPreferenceProRawFileFormatFormat, a3, @"com.apple.camera");

  CFPreferencesAppSynchronize(@"com.apple.camera");
}

+ (id)_photoFormatPreferenceTitleForValue:(id)a3
{
  CFStringRef v3 = objc_msgSend(a1, "_localizationKeyForFormatPreference:", objc_msgSend(a3, "integerValue"));
  id v4 = +[NSString stringWithFormat:@"CAM_SECONDARY_PHOTO_FORMAT_%@", v3];
  CFStringRef v5 = sub_12FA8(v4);

  return v5;
}

+ (id)photoFormatPreferenceShortTitleForValue:(id)a3
{
  CFStringRef v3 = objc_msgSend(a1, "_localizationKeyForFormatPreference:", objc_msgSend(a3, "integerValue"));
  id v4 = +[NSString stringWithFormat:@"CAM_SECONDARY_PHOTO_FORMAT_%@_SHORT", v3];
  CFStringRef v5 = sub_12FA8(v4);

  return v5;
}

+ (id)_secondaryPhotoFormatFooterForValues:(id)a3 includeFileEstimates:(BOOL)a4 rawFileFormatBehavior:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = sub_12FA8(@"CAM_SECONDARY_PHOTO_FORMAT_FOOTER");
  uint64_t v9 = +[NSMutableString stringWithString:v8];

  if (v6)
  {
    id v10 = [(id)objc_opt_class() _fileEstimatesFooterForValues:v7 rawFileFormatBehavior:a5];
    [v9 appendString:v10];
  }

  return v9;
}

+ (id)_fileEstimatesFooterForValues:(id)a3 rawFileFormatBehavior:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableString) initWithString:@"\n\n"];
  CFStringRef v8 = &stru_20A70;
  if (a4 == 1) {
    CFStringRef v8 = @"_JPEG_XL_LOSSLESS";
  }
  if (a4 == 2) {
    CFStringRef v8 = @"_JPEG_XL_LOSSY";
  }
  CFStringRef v22 = v8;
  uint64_t v9 = sub_12FA8(@"CAM_SECONDARY_PHOTO_FORMAT_FOOTER_FILE_SIZES_TITLE");
  [v7 appendFormat:@"%@", v9];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = (char *)[*(id *)(*((void *)&v23 + 1) + 8 * (void)v14) integerValue];
        uint64_t v16 = [a1 _localizationKeyForFormatPreference:v15];
        if ((unint64_t)v15 < 3)
        {
          +[NSString stringWithFormat:@"CAM_SECONDARY_PHOTO_FORMAT_FOOTER_%@", v16, v21];
          v17 = LABEL_14:;
          goto LABEL_15;
        }
        if ((unint64_t)(v15 - 3) < 2)
        {
          +[NSString stringWithFormat:@"CAM_SECONDARY_PHOTO_FORMAT_FOOTER_%@%@", v16, v22];
          goto LABEL_14;
        }
        v17 = 0;
LABEL_15:
        v18 = sub_12FA8(v17);
        [v7 appendFormat:@"\n%@", v18];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v19 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      id v12 = v19;
    }
    while (v19);
  }

  return v7;
}

+ (id)_localizationKeyForFormatPreference:(int64_t)a3
{
  if (a3 == 4) {
    return @"RAW48";
  }
  if (a3 == 3) {
    return @"RAW12";
  }
  if (a3 != 2) {
    return &stru_20A70;
  }
  if (+[PFMediaCapabilities newFormatsConfiguration] == (char *)&dword_0 + 1)return @"JPEG48"; {
  return @"HEIF48";
  }
}

+ (id)_proRawFileFormatPreferenceTitleForValue:(id)a3
{
  uint64_t v3 = objc_msgSend(a1, "_localizationKeyForRawEncodingFormatPreference:", objc_msgSend(a3, "integerValue"));
  uint64_t v4 = +[NSString stringWithFormat:@"CAM_PRO_RAW_ENCODING_%@", v3];
  CFStringRef v5 = sub_12FA8(v4);

  return v5;
}

+ (id)_localizationKeyForRawEncodingFormatPreference:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return *(&off_20938 + a3);
  }
}

+ (id)_proRawFileFormatPreferenceTitle
{
  return sub_12FA8(@"CAM_PRO_RAW_ENCODING_TITLE");
}

+ (id)_proRawFileFormatFooterForValues:(id)a3 selectedProRawFileFormatFormat:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = sub_12FA8(@"CAM_PRO_RAW_ENCODING_FOOTER");
  CFStringRef v8 = +[NSMutableString stringWithString:v7];

  uint64_t v9 = objc_opt_class();
  id v10 = [v5 integerValue];

  id v11 = [v9 _fileEstimatesFooterForValues:v6 rawFileFormatBehavior:v10];

  [v8 appendString:v11];

  return v8;
}

@end