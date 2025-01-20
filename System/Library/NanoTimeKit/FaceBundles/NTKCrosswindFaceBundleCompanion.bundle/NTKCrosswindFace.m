@interface NTKCrosswindFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
+ (id)pigmentFaceDomain;
- (id)_customEditModes;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKCrosswindFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl() && [v3 deviceCategory] != (char *)&dword_0 + 1)
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
    unsigned int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (id)pigmentFaceDomain
{
  return @"crosswind";
}

- (id)faceSharingName
{
  return +[NTKCrosswindFaceBundle localizedStringForKey:@"CROSSWIND_FACE_NAME_IN_TITLE_CASE" comment:@"Palette"];
}

+ (id)complicationConfiguration
{
  if (qword_16ED8 != -1) {
    dispatch_once(&qword_16ED8, &stru_104B8);
  }
  v2 = (void *)qword_16ED0;

  return v2;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", NTKComplicationSlotBottomLeft, a4)
    && (!os_variant_has_internal_diagnostics() || _os_feature_enabled_impl()))
  {
    unsigned int v4 = +[NSLocale currentLocale];
    id v5 = [v4 countryCode];

    if ([v5 isEqualToString:@"US"])
    {
      id v6 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
      v7 = NTKCarbonaraWidgetIntent();
      id v8 = [v6 initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.HomeEnergyUI.EnergyForecastComplication" intent:v7];

      v9 = +[NTKWidgetComplication complicationWithDescriptor:v8];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_faceDescriptionKey
{
  return +[NTKCrosswindFaceBundle localizedStringForKey:@"CROSSWIND_FACE_STYLE_DESCRIPTION" comment:@"Palette Face Description"];
}

- (id)_customEditModes
{
  return &off_10988;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKCrosswindFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKCrosswindFace *)self device];
  id v7 = [v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKCrosswindFace *)self _optionClassForCustomEditMode:a4];
  id v8 = [(NTKCrosswindFace *)self device];
  v9 = [v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = [(NTKCrosswindFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKCrosswindFace *)self device];
  id v10 = [v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

@end