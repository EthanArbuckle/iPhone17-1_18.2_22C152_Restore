@interface NTKSpectrumAnalogFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)hasPrideEditOptions;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultColorOption;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)editOptionThatHidesAllComplications;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKSpectrumAnalogFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_SPECTRUM_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKSpectrumAnalogFace *)self _faceDescriptionKey];
  v3 = +[NTKSpectrumFaceBundle localizedStringForKey:v2 comment:@"Gradient face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKSpectrumFaceBundle localizedStringForKey:@"SPECTRUM_FACE_NAME_IN_TITLE_CASE" comment:@"Gradient"];
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return [a3 deviceCategory] == (char *)&dword_0 + 1;
}

+ (id)_complicationSlotDescriptors
{
  v17 = +[NSMutableIndexSet indexSet];
  v2 = NTKAllSignatureCircularTypes();
  [v17 addIndexes:v2];

  v3 = NTKAllSignatureCornerTypes();
  v4 = NTKAllUtilityLargeComplicationTypes();
  v16 = NTKComplicationTypeRankedListWithDefaultTypes();
  v15 = NTKComplicationTypeRankedListWithDefaultTypes();
  v14 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v18[0] = NTKComplicationSlotTopLeft;
  v7 = NTKComplicationSlotDescriptor();
  v19[0] = v7;
  v18[1] = NTKComplicationSlotTopRight;
  v8 = NTKComplicationSlotDescriptor();
  v19[1] = v8;
  v18[2] = NTKComplicationSlotBottomLeft;
  v9 = NTKComplicationSlotDescriptor();
  v19[2] = v9;
  v18[3] = NTKComplicationSlotBottomRight;
  v10 = NTKComplicationSlotDescriptor();
  v19[3] = v10;
  v18[4] = NTKComplicationSlotBezel;
  v11 = NTKComplicationSlotDescriptor();
  v19[4] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];

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

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBezel])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKSpectrumAnalogFace;
    uint64_t v5 = [(NTKSpectrumAnalogFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v4[4] = NTKComplicationSlotBezel;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (id)_customEditModes
{
  return &off_11228;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 10:
      v9 = [(NTKSpectrumAnalogFace *)self _defaultColorOption];
      goto LABEL_9;
    case 12:
      v7 = [(NTKSpectrumAnalogFace *)self device];
      uint64_t v8 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v7];
      goto LABEL_7;
    case 15:
      v7 = [(NTKSpectrumAnalogFace *)self device];
      uint64_t v8 = +[NTKSpectrumStyleEditOption optionWithStyle:2 forDevice:v7];
LABEL_7:
      v9 = (void *)v8;

      goto LABEL_9;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKSpectrumAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKSpectrumAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSpectrumAnalogFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKSpectrumAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKSpectrumAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKSpectrumAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 12 || a3 == 15)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotTopRight;
  v5[2] = NTKComplicationSlotBottomLeft;
  v5[3] = NTKComplicationSlotBottomRight;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:4];

  return v3;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    id v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    uint64_t v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasPrideEditOptions
{
  return 1;
}

- (id)_defaultColorOption
{
  uint64_t v3 = [(NTKSpectrumAnalogFace *)self device];
  id v4 = (char *)[v3 collectionType];

  uint64_t v5 = 6;
  if (v4 == (unsigned char *)&dword_4 + 2) {
    uint64_t v5 = 103;
  }
  if (v4 == (unsigned char *)&dword_4 + 1) {
    uint64_t v6 = 102;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = [(NTKSpectrumAnalogFace *)self device];
  uint64_t v8 = +[NTKSpectrumAnalogColorEditOption optionWithFaceColor:v6 forDevice:v7];

  return v8;
}

- (id)editOptionThatHidesAllComplications
{
  v2 = [(NTKSpectrumAnalogFace *)self device];
  uint64_t v3 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v2];

  return v3;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKSpectrumAnalogColorEditOption domain];
}

@end