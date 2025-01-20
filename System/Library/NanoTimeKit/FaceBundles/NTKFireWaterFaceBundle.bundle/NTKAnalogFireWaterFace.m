@interface NTKAnalogFireWaterFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)editOptionThatHidesAllComplications;
- (id)faceDescription;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKAnalogFireWaterFace

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallComplicationTypes();
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

- (id)_customEditModes
{
  v2 = [(NTKAnalogFireWaterFace *)self device];
  id v3 = [v2 deviceCategory];

  if ((unint64_t)v3 <= 4) {
    return &off_8AA8;
  }
  else {
    return &off_8A90;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    v9 = [(NTKAnalogFireWaterFace *)self device];
    uint64_t v10 = +[NTKFireWaterColorEditOption optionWithColor:0 forDevice:v9];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    v7 = [(NTKAnalogFireWaterFace *)self device];
    BOOL v8 = [v7 deviceCategory] != (char *)&dword_0 + 1;

    v9 = [(NTKAnalogFireWaterFace *)self device];
    uint64_t v10 = +[NTKAnalogDialShapeEditOption optionWithShape:v8 forDevice:v9];
LABEL_5:
    v11 = (void *)v10;

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  if (a3 == 10) {
    return 1;
  }
  if (a3 != 15) {
    return 0;
  }
  id v3 = [(NTKAnalogFireWaterFace *)self device];
  BOOL v4 = [v3 deviceCategory] != (char *)&dword_0 + 1;

  return v4;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  BOOL v8 = [(NTKAnalogFireWaterFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKAnalogFireWaterFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKAnalogFireWaterFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKAnalogFireWaterFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKAnalogFireWaterFace *)self _optionClassForCustomEditMode:a4];
  BOOL v8 = [(NTKAnalogFireWaterFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 15)
  {
    BOOL v4 = objc_opt_class();
  }
  else
  {
    BOOL v4 = 0;
  }
  return (Class)v4;
}

- (id)faceSharingName
{
  return +[NTKFireWaterFaceBundle localizedStringForKey:@"FIRE_WATER_IN_TITLE_CASE" table:@"FireWater" comment:@"Fire and Water"];
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    BOOL v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)editOptionThatHidesAllComplications
{
  uint64_t v3 = [(NTKAnalogFireWaterFace *)self device];
  BOOL v4 = (char *)[v3 deviceCategory];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v5 = 0;
  }
  else
  {
    id v6 = [(NTKAnalogFireWaterFace *)self device];
    v5 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v6];
  }

  return v5;
}

- (id)faceDescription
{
  return +[NTKFireWaterFaceBundle localizedStringForKey:@"FIRE_WATER_DESCRIPTION" table:@"FireWater" comment:@"Fire and Water description"];
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end