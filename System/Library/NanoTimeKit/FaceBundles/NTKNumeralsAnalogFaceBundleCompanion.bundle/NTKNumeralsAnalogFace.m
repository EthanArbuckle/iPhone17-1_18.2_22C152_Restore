@interface NTKNumeralsAnalogFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)_commonInit;
- (void)_handleLocaleNumberSystemChange;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
- (void)dealloc;
@end

@implementation NTKNumeralsAnalogFace

- (id)faceSharingName
{
  return +[NTKNumeralsAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_NUMERALS_IN_TITLE_CASE" comment:@"Numerals"];
}

- (void)_commonInit
{
  v4.receiver = self;
  v4.super_class = (Class)NTKNumeralsAnalogFace;
  [(NTKNumeralsAnalogFace *)&v4 _commonInit];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleLocaleNumberSystemChange" name:CLKLocaleNumberSystemChangedNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CLKLocaleNumberSystemChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKNumeralsAnalogFace;
  [(NTKNumeralsAnalogFace *)&v4 dealloc];
}

- (void)_handleLocaleNumberSystemChange
{
  id v4 = [(NTKNumeralsAnalogFace *)self selectedOptionForCustomEditMode:13 slot:0];
  if (!v4
    || ([(NTKNumeralsAnalogFace *)self _option:v4 isValidForCustomEditMode:13 slot:0] & 1) == 0)
  {
    uint64_t v3 = [(NTKNumeralsAnalogFace *)self _defaultOptionForCustomEditMode:13 slot:0];

    [(NTKNumeralsAnalogFace *)self selectOption:v3 forCustomEditMode:13 slot:0];
  }

  _objc_release_x1();
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallComplicationTypes();
  uint64_t v7 = NTKComplicationSlot1;
  uint64_t v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v4 = NTKComplicationSlotDescriptor();
  v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)_orderedComplicationSlots
{
  uint64_t v4 = NTKComplicationSlot1;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlot1;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  return (id)_NTKClockFaceLocalizedString(@"SLOT_LABEL_BOTTOM", @"Bottom", a3);
}

- (id)_customEditModes
{
  return &off_11410;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    v9 = [(NTKNumeralsAnalogFace *)self device];
    v10 = (char *)[v9 collectionType];

    if (v10 == (unsigned char *)&dword_4 + 3)
    {
      uint64_t v11 = 24;
    }
    else
    {
      v15 = [(NTKNumeralsAnalogFace *)self device];
      uint64_t v11 = NTKDefaultFaceColorForDeviceCollection();
    }
    v13 = [(NTKNumeralsAnalogFace *)self device];
    uint64_t v14 = +[NTKNumeralsAnalogFaceColorEditOption optionWithFaceColor:v11 forDevice:v13];
  }
  else
  {
    if (a3 != 13)
    {
      v12 = 0;
      goto LABEL_13;
    }
    unint64_t v7 = CLKLocaleCurrentNumberSystem();
    if (v7 > 2) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_C6A0[v7];
    }
    v13 = [(NTKNumeralsAnalogFace *)self device];
    uint64_t v14 = +[NTKNumeralsAnalogStyleEditOption optionWithStyle:v8 forDevice:v13];
  }
  v12 = (void *)v14;

LABEL_13:

  return v12;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 13)
  {
    uint64_t v4 = objc_msgSend(@"EDIT_MODE_LABEL_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKNumeralsAnalogFace;
    v5 = objc_msgSendSuper2(&v7, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKNumeralsAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKNumeralsAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKNumeralsAnalogFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKNumeralsAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKNumeralsAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKNumeralsAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5 slot:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (a5 == 10 && [v10 faceColor] == (char *)&dword_4 + 3)
  {
    v12 = [(NTKNumeralsAnalogFace *)self device];
    *a4 = +[NTKNumeralsAnalogFaceColorEditOption optionWithFaceColor:26 forDevice:v12];

    char v13 = *a4 != 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v10 faceColor];
      v15 = [(NTKNumeralsAnalogFace *)self device];
      *a4 = +[NTKNumeralsAnalogFaceColorEditOption optionWithFaceColor:v14 forDevice:v15];

      char v13 = 1;
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 13 || a3 == 10)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_NUMERALS_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKNumeralsAnalogFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKNumeralsAnalogFaceBundle localizedStringForKey:v2 comment:&stru_108A8];

  return v3;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_C6B8[a4];
  }
  id v6 = [(NTKNumeralsAnalogFace *)self device];
  id v7 = +[NTKNumeralsAnalogFaceColorEditOption optionWithFaceColor:v5 forDevice:v6];

  [(NTKNumeralsAnalogFace *)self selectOption:v7 forCustomEditMode:10 slot:0];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainNumeralsAnalog;
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end