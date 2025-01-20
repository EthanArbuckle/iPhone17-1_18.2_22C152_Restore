@interface NTKPrideDigitalFace
+ (BOOL)isAvailableForDevice:(id)a3;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (unint64_t)enabledState;
+ (void)setEnabledState:(unint64_t)a3;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKPrideDigitalFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_PRIDE_DIGITAL_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKPrideDigitalFace *)self _faceDescriptionKey];
  v3 = +[NTKPrideDigitalFaceBundle localizedStringForKey:v2 table:@"PrideDigital" comment:@"Pride Digital face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKPrideDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_PRIDE_DIGITAL_IN_TITLE_CASE" table:@"PrideDigital" comment:@"Pride Digital"];
}

+ (unint64_t)enabledState
{
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t result = CFPreferencesGetAppIntegerValue(@"PrideFaceEnabledState", NTKFacePreferencesDomain, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  return result;
}

+ (void)setEnabledState:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];
  CFStringRef v3 = (const __CFString *)NTKFacePreferencesDomain;
  CFPreferencesSetAppValue(@"PrideFaceEnabledState", v4, NTKFacePreferencesDomain);
  CFPreferencesAppSynchronize(v3);
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if (NTKFaceStyleIsAvailable()) {
    char v4 = NTKGizmoOrCompanionAreRussian();
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (BOOL)isAvailableForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 nrDeviceVersion] >= 0x40301) {
    unsigned int v4 = !+[NTKPrideDigitalFace isRestrictedForDevice:v3];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  id v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v9[0] = NTKComplicationSlotTopRight;
  unsigned int v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v10[0] = v5;
  v9[1] = NTKComplicationSlotBottom;
  v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopRight;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_customEditModes
{
  return &off_25B00;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 != 15)
  {
    v8 = 0;
    goto LABEL_8;
  }
  v5 = [(NTKPrideDigitalFace *)self device];
  unsigned int v6 = [v5 nrDeviceVersion];

  v7 = [(NTKPrideDigitalFace *)self device];
  if (v6 > 0x50200)
  {
    v8 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v7];

    v9 = [(NTKPrideDigitalFace *)self device];
    unsigned __int8 v10 = [v8 optionExistsInDevice:v9];

    if (v10) {
      goto LABEL_8;
    }
    v7 = [(NTKPrideDigitalFace *)self device];
    uint64_t v11 = +[NTKPrideStyleEditOption optionWithStyle:1 forDevice:v7];

    v8 = (void *)v11;
  }
  else
  {
    v8 = +[NTKPrideStyleEditOption optionWithStyle:0 forDevice:v7];
  }

LABEL_8:

  return v8;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  id v3 = [(NTKPrideDigitalFace *)self device];
  unsigned __int8 v4 = [v3 isRunningGloryFOrLater];

  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKPrideDigitalFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  unsigned int v6 = [(NTKPrideDigitalFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKPrideDigitalFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKPrideDigitalFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKPrideDigitalFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKPrideDigitalFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    unsigned __int8 v4 = objc_opt_class();
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  return (Class)v4;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotDate])
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKPrideDigitalFace;
    v5 = [(NTKPrideDigitalFace *)&v10 _localizedNameForComplicationSlot:v4];
  }
  else
  {
    if ([v4 isEqualToString:NTKComplicationSlotTopRight])
    {
      CFStringRef v6 = @"TOP";
    }
    else
    {
      unsigned int v7 = [v4 isEqualToString:NTKComplicationSlotBottom];
      CFStringRef v6 = @"BOTTOM";
      if (!v7) {
        CFStringRef v6 = 0;
      }
    }
    v8 = +[NSString stringWithFormat:@"SLOT_LABEL_%@", v6];
    v5 = NTKClockFaceLocalizedString();
  }

  return v5;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    id v4 = objc_msgSend(@"EDIT_MODE_LABEL_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end