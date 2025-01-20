@interface NTKColorAnalogFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_monogramComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)_wantsUnadornedSnapshot;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_defaultOptionForMissingCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
@end

@implementation NTKColorAnalogFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_COLOR_ANALOG_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKColorAnalogFace *)self _faceDescriptionKey];
  v3 = +[NTKColorAnalogFaceBundle localizedStringForKey:v2 comment:@"Color Analog Face Description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKColorAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_COLOR_ANALOG_IN_TITLE_CASE" comment:@"Color"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSmallComplicationTypes();
  v15[0] = NTKComplicationSlotTopLeft;
  v14 = NTKComplicationTypeRankedListWithDefaultTypes();
  v13 = NTKComplicationSlotDescriptor();
  v16[0] = v13;
  v15[1] = NTKComplicationSlotTopRight;
  v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKComplicationSlotDescriptor();
  v16[1] = v4;
  v15[2] = NTKComplicationSlotBottomLeft;
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationSlotDescriptor();
  v16[2] = v6;
  v15[3] = NTKComplicationSlotBottomRight;
  v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  v8 = NTKComplicationSlotDescriptor();
  v16[3] = v8;
  v15[4] = NTKComplicationSlotMonogram;
  v9 = +[NSIndexSet indexSetWithIndex:14];
  v10 = NTKComplicationSlotDescriptor();
  v16[4] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  return v11;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

+ (id)_monogramComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotMonogram;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotMonogram;
  v4[3] = NTKComplicationSlotBottomLeft;
  v4[4] = NTKComplicationSlotBottomRight;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (id)_customEditModes
{
  return &off_110D8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    v5 = [(NTKColorAnalogFace *)self device];
    uint64_t v6 = NTKDefaultFaceColorForDeviceCollection();

    v7 = [(NTKColorAnalogFace *)self device];
    +[NTKFaceColorEditOption optionWithFaceColor:v6 forDevice:v7];
  }
  else
  {
    v7 = [(NTKColorAnalogFace *)self device];
    +[NTKColorAnalogStyleEditOption optionWithStyle:1 forDevice:v7];
  v8 = };

  return v8;
}

- (id)_defaultOptionForMissingCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    v4 = [(NTKColorAnalogFace *)self device];
    v5 = +[NTKColorAnalogStyleEditOption optionWithStyle:0 forDevice:v4];
  }
  else
  {
    v5 = [(NTKColorAnalogFace *)self _defaultOptionForCustomEditMode:a3 slot:a4];
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10) {
    v4 = (__objc2_class *)NTKFaceColorEditOption;
  }
  else {
    v4 = NTKColorAnalogStyleEditOption;
  }
  v5 = [(NTKColorAnalogFace *)self device];
  id v6 = [(__objc2_class *)v4 numberOfOptionsForDevice:v5];

  return (unint64_t)v6;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10) {
    id v6 = (__objc2_class *)NTKFaceColorEditOption;
  }
  else {
    id v6 = NTKColorAnalogStyleEditOption;
  }
  v7 = [(NTKColorAnalogFace *)self device];
  v8 = [(__objc2_class *)v6 optionAtIndex:a3 forDevice:v7];

  return v8;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10) {
    v7 = (__objc2_class *)NTKFaceColorEditOption;
  }
  else {
    v7 = NTKColorAnalogStyleEditOption;
  }
  id v8 = a3;
  v9 = [(NTKColorAnalogFace *)self device];
  id v10 = [(__objc2_class *)v7 indexOfOption:v8 forDevice:v9];

  return (unint64_t)v10;
}

- (BOOL)_wantsUnadornedSnapshot
{
  return 1;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKColorAnalogFace;
    v5 = objc_msgSendSuper2(&v7, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v5;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 15)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 style] == (char *)&dword_0 + 2)
  {
    v9[0] = NTKComplicationSlotTopLeft;
    v9[1] = NTKComplicationSlotTopRight;
    v9[2] = NTKComplicationSlotBottomLeft;
    v9[3] = NTKComplicationSlotBottomRight;
    uint64_t v5 = +[NSArray arrayWithObjects:v9 count:4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKColorAnalogFace;
    uint64_t v5 = [(NTKColorAnalogFace *)&v8 complicationSlotsHiddenByEditOption:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_D820[a4];
  }
  id v6 = [(NTKColorAnalogFace *)self device];
  id v13 = +[NTKFaceColorEditOption optionWithFaceColor:v5 forDevice:v6];

  objc_super v7 = [v13 pigmentEditOption];
  [(NTKColorAnalogFace *)self selectOption:v7 forCustomEditMode:10 slot:0];

  objc_super v8 = [(NTKColorAnalogFace *)self device];
  v9 = +[NTKColorAnalogStyleEditOption optionWithStyle:1 forDevice:v8];

  [(NTKColorAnalogFace *)self selectOption:v9 forCustomEditMode:15 slot:0];
  id v10 = +[NTKComplication anyComplicationOfType:7];
  [(NTKColorAnalogFace *)self setComplication:v10 forSlot:NTKComplicationSlotTopRight];
  v11 = +[NTKComplication anyComplicationOfType:17];

  [(NTKColorAnalogFace *)self setComplication:v11 forSlot:NTKComplicationSlotBottomLeft];
  v12 = +[NTKComplication anyComplicationOfType:10];

  [(NTKColorAnalogFace *)self setComplication:v12 forSlot:NTKComplicationSlotBottomRight];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"colorAnalog";
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return 10;
  }
}

@end