@interface NTKZeusAnalogFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)fixedComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationMigrationPaths;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKZeusAnalogFace

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
    return 13;
  }
}

- (id)_complicationMigrationPaths
{
  v4[0] = @"upper";
  v4[1] = @"lower";
  v5[0] = NTKComplicationSlotTop;
  v5[1] = NTKComplicationSlotBottom;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  if ([a3 collectionType] == (char *)&dword_4 + 1) {
    return 0;
  }
  else {
    return NTKShowHardwareSpecificFaces() ^ 1;
  }
}

- (id)faceSharingName
{
  return +[NTKZeusAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_ZEUS_ANALOG_IN_TITLE_CASE" comment:@"name"];
}

+ (id)_complicationSlotDescriptors
{
  long long v11 = xmmword_337A8;
  uint64_t v12 = 5;
  v2 = +[NSIndexSet indexSetWithIndexes:&v11 count:3];
  int64_t v3 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 11, NTKComplicationSlotTop);
  v4 = NTKComplicationSlotDescriptor();
  v9[1] = NTKComplicationSlotBottom;
  v10[0] = v4;
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)fixedComplicationSlotsForDevice:(id)a3
{
  return +[NSSet setWithObject:NTKComplicationSlotTop];
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotBottom;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTop;
  v4[1] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  return (id)NTKClockFaceLocalizedString();
}

- (id)_customEditModes
{
  return &off_3FA80;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = [(NTKZeusAnalogFace *)self device];
  switch(a3)
  {
    case 10:
      uint64_t v6 = +[NTKZeusColorEditOption optionWithColor:7 forDevice:v5];
      goto LABEL_7;
    case 11:
      uint64_t v6 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:v5];
      goto LABEL_7;
    case 13:
      uint64_t v6 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:v5];
LABEL_7:
      v7 = (void *)v6;
      goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11)
  {
    v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKZeusAnalogFace;
    v5 = objc_msgSendSuper2(&v7, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKZeusAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  uint64_t v6 = [(NTKZeusAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKZeusAnalogFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKZeusAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKZeusAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKZeusAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
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

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_ZEUS_ANALOG_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKZeusAnalogFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKZeusAnalogFaceBundle localizedStringForKey:v2 comment:&stru_3D3C0];

  return v3;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKZeusColorEditOption domain];
}

@end