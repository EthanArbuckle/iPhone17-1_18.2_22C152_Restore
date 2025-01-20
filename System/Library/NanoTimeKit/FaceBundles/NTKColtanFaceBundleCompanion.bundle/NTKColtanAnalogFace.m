@interface NTKColtanAnalogFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)supportsPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)editOptionThatHidesAllComplications;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKColtanAnalogFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 deviceCategory];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B5C93485-A89F-4ACA-8845-3F508A6620EF"];
  unsigned __int8 v6 = [v3 supportsCapability:v5];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 1;
  }
  else {
    return v6 ^ 1;
  }
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_COLTAN_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKColtanAnalogFace *)self _faceDescriptionKey];
  id v3 = +[NTKColtanFaceBundle localizedStringForKey:v2 comment:@"Coltan face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKColtanFaceBundle localizedStringForKey:@"COLTAN_FACE_NAME_IN_TITLE_CASE" comment:@"Unity Lights"];
}

+ (id)_complicationSlotDescriptors
{
  v14 = +[NSMutableIndexSet indexSet];
  v2 = NTKAllSignatureCircularTypes();
  [v14 addIndexes:v2];

  id v3 = NTKAllSignatureCornerTypes();
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  unsigned __int8 v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  v15[0] = NTKComplicationSlotTopLeft;
  v8 = NTKComplicationSlotDescriptor();
  v16[0] = v8;
  v15[1] = NTKComplicationSlotTopRight;
  v9 = NTKComplicationSlotDescriptor();
  v16[1] = v9;
  v15[2] = NTKComplicationSlotBottomLeft;
  v10 = NTKComplicationSlotDescriptor();
  v16[2] = v10;
  v15[3] = NTKComplicationSlotBottomRight;
  v11 = NTKComplicationSlotDescriptor();
  v16[3] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v12;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", NTKComplicationSlotTopLeft, a4))
  {
    v4 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationNoiseBundleIdentifier appBundleIdentifier:NTKBundleComplicationNoiseAppBundleIdentifier complicationDescriptor:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotTopRight;
  v5[2] = NTKComplicationSlotBottomLeft;
  v5[3] = NTKComplicationSlotBottomRight;
  id v3 = +[NSArray arrayWithObjects:v5 count:4];

  return v3;
}

- (id)_customEditModes
{
  return &off_10B38;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 11)
  {
    v7 = [(NTKColtanAnalogFace *)self device];
    uint64_t v8 = +[NTKColtanDensityEditOption optionWithDensity:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 12)
  {
    v7 = [(NTKColtanAnalogFace *)self device];
    uint64_t v8 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKColtanAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKColtanAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKColtanAnalogFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKColtanAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKColtanAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKColtanAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 12 || a3 == 11)
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
  if (a3 == 12)
  {
    v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    id v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)editOptionThatHidesAllComplications
{
  v2 = [(NTKColtanAnalogFace *)self device];
  uint64_t v3 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v2];

  return v3;
}

- (BOOL)supportsPigmentEditOption
{
  return 1;
}

+ (id)pigmentFaceDomain
{
  return @"coltan";
}

@end