@interface NTKPrideAnalogFace
+ (BOOL)isAvailableForDevice:(id)a3;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKPrideAnalogFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_PRIDE_ANALOG_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKPrideAnalogFace *)self _faceDescriptionKey];
  v3 = +[NTKPrideAnalogFaceBundle localizedStringForKey:v2 table:@"PrideAnalog" comment:@"Pride Analog face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKPrideAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_PRIDE_ANALOG_IN_TITLE_CASE" table:@"PrideAnalog" comment:@"Pride Analog"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSmallComplicationTypes();
  v13[0] = NTKComplicationSlotTopLeft;
  v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKComplicationSlotDescriptor();
  v14[0] = v4;
  v13[1] = NTKComplicationSlotTopRight;
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationSlotDescriptor();
  v14[1] = v6;
  v13[2] = NTKComplicationSlotBottomLeft;
  v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  v8 = NTKComplicationSlotDescriptor();
  v14[2] = v8;
  v13[3] = NTKComplicationSlotBottomRight;
  v9 = NTKComplicationTypeRankedListWithDefaultTypes();
  v10 = NTKComplicationSlotDescriptor();
  v14[3] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
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

- (id)_customEditModes
{
  return &off_25BD8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 12)
  {
    v13 = [(NTKPrideAnalogFace *)self device];
    unsigned int v14 = [v13 nrDeviceVersion];

    v9 = NTKPrideAnalogStyleEditOption;
    v10 = [(NTKPrideAnalogFace *)self device];
    if (v14 <= 0x50200) {
      goto LABEL_6;
    }
    v15 = +[NTKPrideStyleEditOption optionWithStyle:2 forDevice:v10];

    v17 = [(NTKPrideAnalogFace *)self device];
    unsigned __int8 v18 = [v15 optionExistsInDevice:v17];

    if ((v18 & 1) == 0)
    {
      v10 = [(NTKPrideAnalogFace *)self device];
      uint64_t v19 = +[NTKPrideStyleEditOption optionWithStyle:1 forDevice:v10];

      v15 = (void *)v19;
      goto LABEL_8;
    }
  }
  else
  {
    if (a3 == 15)
    {
      v7 = [(NTKPrideAnalogFace *)self device];
      v8 = (char *)[v7 deviceCategory];

      v9 = NTKPrideAnalogShapeEditOption;
      v10 = [(NTKPrideAnalogFace *)self device];
      if (v8 != (unsigned char *)&dword_0 + 1)
      {
        v11 = NTKPrideAnalogShapeEditOption;
        uint64_t v12 = 1;
LABEL_7:
        v15 = [(__objc2_class *)v11 optionWithStyle:v12 forDevice:v10];
LABEL_8:

        goto LABEL_10;
      }
LABEL_6:
      v11 = v9;
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    v15 = 0;
  }
LABEL_10:

  return v15;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  if (a3 != 15) {
    return 1;
  }
  v3 = [(NTKPrideAnalogFace *)self device];
  BOOL v4 = [v3 deviceCategory] != (char *)&dword_0 + 1;

  return v4;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  if (a4 == 12)
  {
    v8 = [(NTKPrideAnalogFace *)self _optionClassForCustomEditMode:12];
    v9 = [(NTKPrideAnalogFace *)self device];
    v10 = (char *)[(objc_class *)v8 indexOfOption:v7 forDevice:v9];

    v11 = v10 - 1;
  }
  else
  {
    uint64_t v12 = [(NTKPrideAnalogFace *)self _optionClassForCustomEditMode:a4];
    v9 = [(NTKPrideAnalogFace *)self device];
    v11 = (char *)[(objc_class *)v12 indexOfOption:v7 forDevice:v9];
  }
  return (unint64_t)v11;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 12)
  {
    v5 = -[NTKPrideAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", 12, a4);
    id v6 = [(NTKPrideAnalogFace *)self device];
    id v7 = (char *)[(objc_class *)v5 numberOfOptionsForDevice:v6] - 1;
  }
  else
  {
    v8 = -[NTKPrideAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
    id v6 = [(NTKPrideAnalogFace *)self device];
    id v7 = (char *)[(objc_class *)v8 numberOfOptionsForDevice:v6];
  }

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 12)
  {
    id v7 = -[NTKPrideAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", 12, 12, a5);
    ++a3;
  }
  else
  {
    id v7 = [(NTKPrideAnalogFace *)self _optionClassForCustomEditMode:a4];
  }
  v8 = [(NTKPrideAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15 || a3 == 12)
  {
    BOOL v4 = objc_opt_class();
  }
  else
  {
    BOOL v4 = 0;
  }
  return (Class)v4;
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
  if ([v3 nrDeviceVersion] >= 0x50201) {
    unsigned int v4 = !+[NTKPrideAnalogFace isRestrictedForDevice:v3];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 == 12)
  {
    id v6 = [@"EDIT_MODE_LABEL_STYLE" stringByAppendingString:@"_COMPANION"];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    id v6 = [@"EDIT_MODE_LABEL_DIAL" stringByAppendingString:@"_COMPANION"];
LABEL_5:
    id v7 = NTKCompanionClockFaceLocalizedString();

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 style] == (char *)&dword_0 + 1)
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
    v8.super_class = (Class)NTKPrideAnalogFace;
    uint64_t v5 = [(NTKPrideAnalogFace *)&v8 complicationSlotsHiddenByEditOption:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end