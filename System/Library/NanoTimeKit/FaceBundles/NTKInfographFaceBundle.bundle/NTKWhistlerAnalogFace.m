@interface NTKWhistlerAnalogFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultColorOption;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
@end

@implementation NTKWhistlerAnalogFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return [a3 deviceCategory] == (char *)&dword_0 + 1;
}

- (id)faceSharingName
{
  return +[NTKInfographFaceBundle localizedStringForKey:@"FACE_NAME_IN_TITLE_CASE" table:@"Infograph" comment:@"Infograph"];
}

- (id)_faceDescription
{
  v2 = [(NTKWhistlerAnalogFace *)self device];
  int v3 = NTKShowBlueRidgeUI();

  if (v3)
  {
    v4 = [@"FACE_DESCRIPTION" stringByAppendingString:@"_KINCAID"];
  }
  else
  {
    v4 = @"FACE_DESCRIPTION";
  }
  v5 = +[NTKInfographFaceBundle localizedStringForKey:v4 table:@"Infograph" comment:@"description"];

  return v5;
}

+ (id)_complicationSlotDescriptors
{
  v2 = +[NSMutableIndexSet indexSet];
  int v3 = NTKAllSignatureCircularTypes();
  [v2 addIndexes:v3];

  v4 = NTKAllSignatureCornerTypes();
  v14 = NTKAllSignatureBezelTypes();
  v19 = NTKComplicationTypeRankedListWithDefaultTypes();
  v16 = NTKComplicationTypeRankedListWithDefaultTypes();
  v18 = NTKComplicationTypeRankedListWithDefaultTypes();
  v23 = NTKComplicationTypeRankedListWithDefaultTypes();
  v22 = NTKComplicationTypeRankedListWithDefaultTypes();
  v20 = NTKComplicationTypeRankedListWithDefaultTypes();
  v17 = NTKComplicationTypeRankedListWithDefaultTypes();
  v15 = NTKComplicationTypeRankedListWithDefaultTypes();
  v24[0] = NTKComplicationSlotTopLeft;
  v21 = NTKComplicationSlotDescriptor();
  v25[0] = v21;
  v24[1] = NTKComplicationSlotTopRight;
  v5 = NTKComplicationSlotDescriptor();
  v25[1] = v5;
  v24[2] = NTKComplicationSlotBottomLeft;
  v6 = NTKComplicationSlotDescriptor();
  v25[2] = v6;
  v24[3] = NTKComplicationSlotBottomRight;
  v7 = NTKComplicationSlotDescriptor();
  v25[3] = v7;
  v24[4] = NTKComplicationSlot1;
  v8 = NTKComplicationSlotDescriptor();
  v25[4] = v8;
  v24[5] = NTKComplicationSlot2;
  v9 = NTKComplicationSlotDescriptor();
  v25[5] = v9;
  v24[6] = NTKComplicationSlot3;
  v10 = NTKComplicationSlotDescriptor();
  v25[6] = v10;
  v24[7] = NTKComplicationSlotBezel;
  v11 = NTKComplicationSlotDescriptor();
  v25[7] = v11;
  id v13 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:8];

  return v13;
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
  v4[4] = NTKComplicationSlotBezel;
  v4[5] = NTKComplicationSlot1;
  v4[6] = NTKComplicationSlot2;
  v4[7] = NTKComplicationSlot3;
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

- (id)_customEditModes
{
  return &off_CD30;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    v6 = [(NTKWhistlerAnalogFace *)self _defaultColorOption];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKWhistlerAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKWhistlerAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKWhistlerAnalogFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKWhistlerAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKWhistlerAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKWhistlerAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlot1;
  v5[1] = NTKComplicationSlot2;
  v5[2] = NTKComplicationSlot3;
  v5[3] = NTKComplicationSlotBezel;
  v5[4] = NTKComplicationSlotTopLeft;
  v5[5] = NTKComplicationSlotTopRight;
  v5[6] = NTKComplicationSlotBottomLeft;
  v5[7] = NTKComplicationSlotBottomRight;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:8];

  return v3;
}

- (id)_defaultColorOption
{
  uint64_t v3 = [(NTKWhistlerAnalogFace *)self device];
  uint64_t v4 = (char *)[v3 collectionType];

  uint64_t v5 = 7;
  if (v4 == (unsigned char *)&dword_4 + 2) {
    uint64_t v5 = 103;
  }
  if (v4 == (unsigned char *)&dword_4 + 1) {
    uint64_t v6 = 102;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = [(NTKWhistlerAnalogFace *)self device];
  v8 = +[NTKWhistlerAnalogColorEditOption optionWithFaceColor:v6 forDevice:v7];

  return v8;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlot1]
    || [v4 isEqualToString:NTKComplicationSlot2]
    || [v4 isEqualToString:NTKComplicationSlot3]
    || [v4 isEqualToString:NTKComplicationSlotBezel])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKWhistlerAnalogFace;
    uint64_t v5 = [(NTKWhistlerAnalogFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)&asc_BDC8[8 * a4];
  }
  uint64_t v6 = [(NTKWhistlerAnalogFace *)self device];
  id v8 = +[NTKWhistlerAnalogColorEditOption optionWithFaceColor:v5 forDevice:v6];

  [(NTKWhistlerAnalogFace *)self selectOption:v8 forCustomEditMode:10 slot:0];
  id v7 = +[NTKComplication anyComplicationOfType:0];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlotTopLeft];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlotTopRight];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlotBottomLeft];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlotBottomRight];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlotBezel];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlot1];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlot2];
  [(NTKWhistlerAnalogFace *)self setComplication:v7 forSlot:NTKComplicationSlot3];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainInfograph;
}

@end