@interface NTKVictoryAnalogFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)editOptionThatHidesAllComplications;
- (id)faceSharingName;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKVictoryAnalogFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return NTKShowVictoryFaces() ^ 1;
}

- (id)faceSharingName
{
  return +[NTKVictoryAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_VICTORY_ANALOG_IN_TITLE_CASE" comment:@"Victory Analog"];
}

- (id)_faceDescription
{
  return +[NTKVictoryAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_VICTORY_ANALOG_DESCRIPTION" comment:@"description"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSmallComplicationTypes();
  v3 = NTKAllUtilityLargeComplicationTypes();
  v12[0] = NTKComplicationSlotTopLeft;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v13[0] = v5;
  v12[1] = NTKComplicationSlotTopRight;
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v7 = NTKComplicationSlotDescriptor();
  v13[1] = v7;
  v12[2] = NTKComplicationSlotBottomCenter;
  v8 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9 = NTKComplicationSlotDescriptor();
  v13[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomCenter;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", NTKComplicationSlotBottomCenter, a4))
  {
    v4 = +[NTKVictoryAppLauncher complication];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_customEditModes
{
  return &off_CBF8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 11)
  {
    v7 = [(NTKVictoryAnalogFace *)self device];
    uint64_t v8 = +[NTKVictoryAnalogStyleEditOption optionWithStyle:3 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    v7 = [(NTKVictoryAnalogFace *)self device];
    uint64_t v8 = +[NTKVictoryAnalogColorEditOption optionWithVictoryColor:2 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 11;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKVictoryAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKVictoryAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKVictoryAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKVictoryAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKVictoryAnalogFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKVictoryAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 11)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)editOptionThatHidesAllComplications
{
  v2 = [(NTKVictoryAnalogFace *)self device];
  uint64_t v3 = +[NTKVictoryAnalogStyleEditOption optionWithStyle:4 forDevice:v2];

  return v3;
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  int64_t v3 = 10;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return 11;
  }
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKVictoryAnalogColorEditOption domain];
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end