@interface NTKUtilityFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (BOOL)_wantsUnadornedSnapshot;
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
@end

@implementation NTKUtilityFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_UTILITY_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKUtilityFace *)self _faceDescriptionKey];
  v3 = +[NTKUtilityFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKUtilityFaceBundle localizedStringForKey:@"UTILITY_FACE_NAME_IN_TITLE_CASE" comment:@"Utility"];
}

- (id)_customEditModes
{
  return &off_115B8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 13:
      v9 = +[NSLocale currentLocale];
      v11 = [(NTKUtilityFace *)self device];
      v12 = +[NTKUtilityFaceTypefaceEditOption defaultOptionForLocale:v9 device:v11];

LABEL_8:
      goto LABEL_10;
    case 11:
      v9 = [(NTKUtilityFace *)self device];
      uint64_t v10 = +[NTKDensityEditOption optionWithDensity:3 forDevice:v9];
      goto LABEL_7;
    case 10:
      v7 = [(NTKUtilityFace *)self device];
      uint64_t v8 = NTKDefaultFaceColorForDeviceCollection();

      v9 = [(NTKUtilityFace *)self device];
      uint64_t v10 = +[NTKFaceColorUtilitarianEditOption optionWithFaceColor:v8 forDevice:v9];
LABEL_7:
      v12 = (void *)v10;
      goto LABEL_8;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKUtilityFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKUtilityFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKUtilityFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKUtilityFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKUtilityFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKUtilityFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (BOOL)_wantsUnadornedSnapshot
{
  return 1;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 1;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 13 || a3 == 11)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 13)
  {
    if (NTKShowIndicScriptNumerals()) {
      v4 = @"EDIT_MODE_LABEL_NUMERALS";
    }
    else {
      v4 = @"EDIT_MODE_LABEL_TYPEFACE";
    }
    v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
    id v6 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKUtilityFace;
    id v6 = objc_msgSendSuper2(&v8, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v6;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallComplicationTypes();
  v13 = NTKAllUtilityLargeComplicationTypes();
  v14[0] = NTKComplicationSlotTopLeft;
  uint64_t v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKComplicationSlotDescriptor();
  v15[0] = v4;
  v14[1] = NTKComplicationSlotTopRight;
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v6 = NTKComplicationSlotDescriptor();
  v15[1] = v6;
  v14[2] = NTKComplicationSlotBottomCenter;
  id v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  objc_super v8 = NTKComplicationSlotDescriptor();
  v15[2] = v8;
  v14[3] = NTKComplicationSlotDate;
  v9 = NTKWrappedDateComplicationType();
  id v10 = NTKComplicationSlotDescriptor();
  v15[3] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v11;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
}

+ (id)_dateComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
}

+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3
{
  return 12;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotDate;
  v4[3] = NTKComplicationSlotBottomCenter;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  v5 = [(NTKUtilityFace *)self device];
  id v7 = +[NTKFaceColorUtilitarianEditOption optionWithFaceColor:8 forDevice:v5];

  [(NTKUtilityFace *)self selectOption:v7 forCustomEditMode:10 slot:0];
  id v6 = +[NTKComplication anyComplicationOfType:0];
  [(NTKUtilityFace *)self setComplication:v6 forSlot:NTKComplicationSlotTopLeft];
  [(NTKUtilityFace *)self setComplication:v6 forSlot:NTKComplicationSlotTopRight];
  [(NTKUtilityFace *)self setComplication:v6 forSlot:NTKComplicationSlotBottomCenter];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"utility";
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  int64_t v3 = 11;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return 10;
  }
}

@end