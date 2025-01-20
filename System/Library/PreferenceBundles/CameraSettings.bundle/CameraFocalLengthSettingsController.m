@interface CameraFocalLengthSettingsController
+ (BOOL)canEnableCustomLenses;
+ (id)focalLengthStringForCustomLens:(int64_t)a3;
- (id)_customLensEnabled:(id)a3;
- (id)_identifierForCustomLens:(int64_t)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)_defaultCustomLens;
- (unint64_t)_checkedDefaultIndex;
- (void)_handleDidChangeCustomLensGroup:(id)a3;
- (void)_handledDidChangeDefaultCustomLensAtIndexPath:(id)a3;
- (void)_persistCurrentDefaultCustomLens;
- (void)_readCurrentDefaultCustomLens;
- (void)_reloadDefaultGroup;
- (void)_setCheckedDefaultIndex:(unint64_t)a3;
- (void)_setCustomLensEnabled:(id)a3 specifier:(id)a4;
- (void)_setDefaultCustomLens:(int64_t)a3;
- (void)_updateCheckedDefaultIndex;
- (void)prepareSpecifiersMetadata;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CameraFocalLengthSettingsController

- (void)prepareSpecifiersMetadata
{
  v3.receiver = self;
  v3.super_class = (Class)CameraFocalLengthSettingsController;
  [(CameraFocalLengthSettingsController *)&v3 prepareSpecifiersMetadata];
  [(CameraFocalLengthSettingsController *)self _readCurrentDefaultCustomLens];
  [(CameraFocalLengthSettingsController *)self _updateCheckedDefaultIndex];
}

- (id)specifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[CameraSettingsBaseController capabilities];
  v62 = self;
  unsigned int v58 = [(id)objc_opt_class() canEnableCustomLenses];
  v5 = +[PSSpecifier groupSpecifierWithID:@"customLensesGroup"];
  v6 = sub_13E54(@"FOCAL_LENGTH_HEADER");
  [v5 setName:v6];

  unint64_t v7 = (unint64_t)[v4 baseFocalLengthForWideCamera];
  double v8 = 0.0;
  if (v7 <= 3) {
    double v8 = dbl_1F770[v7];
  }
  v9 = +[CameraSettingsBaseController integerFormatter];
  v10 = +[NSNumber numberWithDouble:v8];
  uint64_t v11 = [v9 stringFromNumber:v10];

  v12 = sub_13E54(@"FOCAL_LENGTH_ROW_%@_MM_FOOTER");
  v51 = (void *)v11;
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v11);

  if ((v58 & 1) == 0)
  {
    if ([v4 isCameraButtonSupported]) {
      v14 = @"FOCAL_LENGTH_DISABLED_FOOTER_CAMERA_BUTTON";
    }
    else {
      v14 = @"FOCAL_LENGTH_DISABLED_FOOTER";
    }
    v15 = sub_13E54(v14);
    uint64_t v16 = [v13 stringByAppendingFormat:@"\n\n%@", v15];

    v13 = (void *)v16;
  }
  v50 = v13;
  [v5 setObject:v13 forKeyedSubscript:PSFooterTextGroupKey];
  v52 = v5;
  [v3 addObject:v5];
  v53 = v4;
  [v4 availableCustomLenses];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v68;
    uint64_t v55 = PSEnabledKey;
    uint64_t v56 = PSValueKey;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v68 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v22 = [v21 integerValue];
        if (v22)
        {
          id v23 = v22;
          v24 = sub_13E54(@"FOCAL_LENGTH_%@_MM");
          v25 = [(id)objc_opt_class() focalLengthStringForCustomLens:v23];
          v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v25);

          v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:v62 set:"_setCustomLensEnabled:specifier:" get:"_customLensEnabled:" detail:0 cell:6 edit:0];
          [v27 setObject:v21 forKeyedSubscript:v56];
          v28 = +[NSNumber numberWithBool:v58];
          [v27 setObject:v28 forKeyedSubscript:v55];

          [v3 addObject:v27];
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v18);
  }
  v29 = [*(id *)&v62->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] performGetter];
  if ((unint64_t)[v29 count] >= 2)
  {
    v30 = +[PSSpecifier groupSpecifierWithID:@"defaultFocalLengthGroup"];
    v31 = sub_13E54(@"FOCAL_LENGTH_DEFAULT_TITLE");
    [v30 setName:v31];

    v61 = v3;
    v57 = v30;
    [v3 addObject:v30];
    v32 = +[CameraSettingsBaseController capabilities];
    v33 = +[CameraSettingsBaseController integerFormatter];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v59 = v29;
    id v60 = v29;
    id v34 = [v60 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v64;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v64 != v36) {
            objc_enumerationMutation(v60);
          }
          unint64_t v38 = (unint64_t)[*(id *)(*((void *)&v63 + 1) + 8 * (void)j) integerValue];
          unint64_t v39 = (unint64_t)[v32 effectiveFocalLengthForCustomLens:v38];
          double v40 = 0.0;
          if (v39 <= 3) {
            double v40 = dbl_1F770[v39];
          }
          v41 = +[NSNumber numberWithDouble:v40];
          v42 = [v33 stringFromNumber:v41];

          if (v38 > 5) {
            double v43 = NAN;
          }
          else {
            double v43 = dbl_1F740[v38] / dbl_1F710[v38];
          }
          v44 = +[CAMZoomButton textForZoomFactor:1 showZoomFactorSymbol:0 useLeadingZero:round(v43 * 10.0) / 10.0];
          v45 = sub_13E54(@"FOCAL_LENGTH_DEFAULT_OPTION_%@_MM_%@_ZOOM");
          v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v45, v42, v44);

          v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:0 set:0 get:0 detail:0 cell:3 edit:0];
          v48 = [(CameraFocalLengthSettingsController *)v62 _identifierForCustomLens:v38];
          [v47 setIdentifier:v48];

          [v61 addObject:v47];
        }
        id v35 = [v60 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v35);
    }

    id v3 = v61;
    v29 = v59;
  }
  +[CameraSettingsBaseController allowMultilineTitlesForSpecifiers:v3];
  objc_storeStrong((id *)&v62->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers], v3);

  return v3;
}

- (id)_identifierForCustomLens:(int64_t)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  v4 = [v3 stringValue];

  return v4;
}

+ (id)focalLengthStringForCustomLens:(int64_t)a3
{
  v4 = +[CameraSettingsBaseController capabilities];
  unint64_t v5 = (unint64_t)[v4 effectiveFocalLengthForCustomLens:a3];

  double v6 = 0.0;
  if (v5 <= 3) {
    double v6 = dbl_1F770[v5];
  }
  unint64_t v7 = +[CameraSettingsBaseController integerFormatter];
  double v8 = +[NSNumber numberWithDouble:v6];
  v9 = [v7 stringFromNumber:v8];

  return v9;
}

+ (BOOL)canEnableCustomLenses
{
  Boolean keyExistsAndHasValidFormat = 0;
  id AppIntegerValue = (id)CFPreferencesGetAppIntegerValue(CAMUserPreferencePreferredHEICPhotoResolution, @"com.apple.camera", &keyExistsAndHasValidFormat);
  id v3 = +[CameraSettingsBaseController capabilities];
  v4 = v3;
  if (!keyExistsAndHasValidFormat) {
    id AppIntegerValue = [v3 defaultPhotoResolutionForMode:0 devicePosition:0 encodingBehavior:1];
  }
  unsigned __int8 v5 = [v4 isCustomLensSupportedForPhotoResolution:AppIntegerValue];

  return v5;
}

- (void)_setCustomLensEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v6 = PSValueKey;
  id v7 = a3;
  id v12 = [a4 objectForKeyedSubscript:v6];
  unsigned int v8 = [v7 BOOLValue];

  v9 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] performGetter];
  v10 = +[NSMutableArray arrayWithArray:v9];
  uint64_t v11 = v10;
  if (v8)
  {
    [v10 addObject:v12];
    [v11 sortUsingSelector:"compare:"];
  }
  else
  {
    [v10 removeObject:v12];
  }
  CFPreferencesSetAppValue(CAMUserPreferencesSelectedCustomLensGroup, v11, @"com.apple.camera");
  CFPreferencesAppSynchronize(@"com.apple.camera");
  [(CameraFocalLengthSettingsController *)self _handleDidChangeCustomLensGroup:v11];
}

- (id)_customLensEnabled:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:PSValueKey];
  unsigned __int8 v5 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] performGetter];
  uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 containsObject:v4]);

  return v6;
}

- (void)_readCurrentDefaultCustomLens
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(CAMUserPreferencesDefaultCustomLens, @"com.apple.camera", &keyExistsAndHasValidFormat);
  v4 = +[CameraSettingsBaseController capabilities];
  unsigned __int8 v5 = v4;
  if (keyExistsAndHasValidFormat)
  {
    uint64_t v6 = [*(id *)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier] performGetter];
    id v7 = [v5 supportedCustomLensForLens:AppIntegerValue inGroup:v6];
  }
  else
  {
    id v7 = [v4 resolvedDefaultCustomLens];
  }
  [(CameraFocalLengthSettingsController *)self _setDefaultCustomLens:v7];
}

- (void)_persistCurrentDefaultCustomLens
{
  int64_t v2 = [(CameraFocalLengthSettingsController *)self _defaultCustomLens];
  CFPreferencesSetAppValue(CAMUserPreferencesDefaultCustomLens, +[NSNumber numberWithInteger:v2], @"com.apple.camera");

  CFPreferencesAppSynchronize(@"com.apple.camera");
}

- (void)_updateCheckedDefaultIndex
{
  id v5 = [(CameraFocalLengthSettingsController *)self _identifierForCustomLens:[(CameraFocalLengthSettingsController *)self _defaultCustomLens]];
  id v3 = -[CameraFocalLengthSettingsController specifierForID:](self, "specifierForID:");
  if (v3) {
    uint64_t v4 = (uint64_t)[(CameraFocalLengthSettingsController *)self indexOfSpecifier:v3];
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(CameraFocalLengthSettingsController *)self _setCheckedDefaultIndex:v4];
}

- (void)_handleDidChangeCustomLensGroup:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CameraFocalLengthSettingsController *)self _defaultCustomLens];
  id v7 = +[CameraSettingsBaseController capabilities];
  id v6 = [v7 supportedCustomLensForLens:v5 inGroup:v4];

  if ((id)v5 != v6)
  {
    [(CameraFocalLengthSettingsController *)self _setDefaultCustomLens:v6];
    [(CameraFocalLengthSettingsController *)self _persistCurrentDefaultCustomLens];
  }
  [(CameraFocalLengthSettingsController *)self _updateCheckedDefaultIndex];
  [(CameraSettingsBaseController *)self reloadSpecifiers];
}

- (void)_handledDidChangeDefaultCustomLensAtIndexPath:(id)a3
{
  id v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSViewController__specifier];
  id v5 = a3;
  id v8 = [v4 performGetter];
  id v6 = [v5 row];

  if (v6 < [v8 count])
  {
    id v7 = [v8 objectAtIndexedSubscript:v6];
    -[CameraFocalLengthSettingsController _setDefaultCustomLens:](self, "_setDefaultCustomLens:", [v7 integerValue]);
    [(CameraFocalLengthSettingsController *)self _persistCurrentDefaultCustomLens];
    [(CameraFocalLengthSettingsController *)self _updateCheckedDefaultIndex];
    [(CameraFocalLengthSettingsController *)self _reloadDefaultGroup];
  }
}

- (void)_reloadDefaultGroup
{
  id v4 = [(CameraFocalLengthSettingsController *)self specifierForID:@"defaultFocalLengthGroup"];
  id v3 = -[CameraFocalLengthSettingsController indexOfSpecifier:](self, "indexOfSpecifier:");
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(CameraFocalLengthSettingsController *)self reloadSpecifierAtIndex:v3 animated:1];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(CameraFocalLengthSettingsController *)self specifierForID:@"defaultFocalLengthGroup"];
  id v8 = [(CameraFocalLengthSettingsController *)self indexOfSpecifier:v7];
  if ([(CameraFocalLengthSettingsController *)self indexForIndexPath:v6] > v8)
  {
    [v9 deselectRowAtIndexPath:v6 animated:1];
    [(CameraFocalLengthSettingsController *)self _handledDidChangeDefaultCustomLensAtIndexPath:v6];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CameraFocalLengthSettingsController;
  id v6 = a4;
  id v7 = [(CameraFocalLengthSettingsController *)&v12 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = [(CameraFocalLengthSettingsController *)self specifierForID:@"defaultFocalLengthGroup", v12.receiver, v12.super_class];
  id v9 = [(CameraFocalLengthSettingsController *)self indexOfSpecifier:v8];
  id v10 = [(CameraFocalLengthSettingsController *)self indexForIndexPath:v6];

  if (v10 > v9) {
    objc_msgSend(v7, "setChecked:", v10 == (id)-[CameraFocalLengthSettingsController _checkedDefaultIndex](self, "_checkedDefaultIndex"));
  }

  return v7;
}

- (int64_t)_defaultCustomLens
{
  return *(void *)(&self->super + 1);
}

- (void)_setDefaultCustomLens:(int64_t)a3
{
  *(void *)(&self->super + 1) = a3;
}

- (unint64_t)_checkedDefaultIndex
{
  return *(int64_t *)((char *)&self->__defaultCustomLens + 1);
}

- (void)_setCheckedDefaultIndex:(unint64_t)a3
{
  *(int64_t *)((char *)&self->__defaultCustomLens + 1) = a3;
}

@end