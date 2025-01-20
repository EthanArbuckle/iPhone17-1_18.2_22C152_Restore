@interface NTKAegirFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_orderedComplicationSlots;
- (id)editOptionsThatHideEditModes;
- (id)faceSharingName;
- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKAegirFace

- (int64_t)timeStyle
{
  return 1;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  if ([v3 supportsCapability:v4]) {
    BOOL v5 = [v3 deviceCategory] == 1;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_faceDescriptionKey
{
  v2 = [(NTKFace *)self device];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  int v4 = [v2 supportsCapability:v3];

  if (v4) {
    return @"FACE_STYLE_AEGIR_FACE_DESCRIPTION_LIGHTHOUSE";
  }
  else {
    return @"FACE_STYLE_AEGIR_FACE_DESCRIPTION";
  }
}

- (id)_faceDescription
{
  v2 = [(NTKAegirFace *)self _faceDescriptionKey];
  id v3 = +[NTKFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_AEGIR_IN_TITLE_CASE" comment:@"Ægir"];
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKAegirFace;
  if (!-[NTKFace _snapshotContext:isStaleRelativeToContext:](&v11, sel__snapshotContext_isStaleRelativeToContext_, v6, v7)&& [v6 calendarDateMatchesContext:v7]&& objc_msgSend(v6, "localeMatchesContext:", v7))
  {
    [v6 distanceInKilometersFromContext:v7];
    BOOL v9 = v8 > 500.0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

+ (id)_complicationSlotDescriptors
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  id v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v10[0] = *MEMORY[0x1E4F79F68];
  int v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  BOOL v5 = NTKComplicationSlotDescriptor();
  v11[0] = v5;
  v10[1] = *MEMORY[0x1E4F79F60];
  id v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v7 = NTKComplicationSlotDescriptor();
  v11[1] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)_complicationSlotDescriptors
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAegirFace;
  v2 = [(NTKFace *)&v4 _complicationSlotDescriptors];

  return v2;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return (id)*MEMORY[0x1E4F79F68];
}

+ (id)_orderedComplicationSlots
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F79F60];
  v5[0] = *MEMORY[0x1E4F79F68];
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

- (id)_orderedComplicationSlots
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAegirFace;
  uint64_t v2 = [(NTKFace *)&v4 _orderedComplicationSlots];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F79F68]])
  {
    objc_super v4 = @"TOP";
  }
  else
  {
    int v5 = [v3 isEqualToString:*MEMORY[0x1E4F79F60]];
    objc_super v4 = @"BOTTOM";
    if (!v5) {
      objc_super v4 = 0;
    }
  }
  id v6 = [NSString stringWithFormat:@"SLOT_LABEL_%@", v4];
  id v7 = NTKClockFaceLocalizedString();

  return v7;
}

- (id)_customEditModes
{
  uint64_t v2 = [(NTKFace *)self device];
  int v3 = NTKShowIndicScriptNumerals();

  if (v3) {
    return &unk_1F35279A8;
  }
  else {
    return &unk_1F35279C0;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  id v7 = 0;
  switch(a3)
  {
    case 12:
      double v8 = [(NTKFace *)self device];
      uint64_t v9 = +[NTKAegirVistaEditOption optionWithVista:0 forDevice:v8];
      goto LABEL_6;
    case 13:
      double v8 = [(NTKFace *)self device];
      uint64_t v9 = +[NTKAegirTypefaceEditOption optionWithTypeface:1 forDevice:v8];
      goto LABEL_6;
    case 15:
      double v8 = [(NTKFace *)self device];
      uint64_t v9 = +[NTKAegirStyleEditOption optionWithStyle:7 forDevice:v8];
      goto LABEL_6;
    case 19:
      CLKLocaleNumberSystemForFirstLanguage();
      uint64_t v10 = NTKNumeralOptionFromCLKLocaleNumberSystem();
      objc_super v11 = (void *)MEMORY[0x1E4F7A010];
      double v8 = [(NTKFace *)self device];
      uint64_t v9 = [v11 optionWithNumeral:v10 forDevice:v8];
LABEL_6:
      id v7 = (void *)v9;

      break;
    default:
      break;
  }

  return v7;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  int64_t v7 = a3 - 12;
  if (unint64_t)(a3 - 12) <= 7 && ((0x8Bu >> v7))
  {
    uint64_t v9 = [(__CFString *)off_1E6BE39F0[v7] stringByAppendingString:@"_COMPANION"];
    double v8 = +[NTKFaceBundle localizedStringForKey:v9 comment:v9];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___NTKAegirFace;
    double v8 = objc_msgSendSuper2(&v11, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, v6);
  }

  return v8;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  int v5 = -[NTKAegirFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKAegirFace *)self _optionClassForCustomEditMode:a4];
  double v8 = [(NTKFace *)self device];
  uint64_t v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  double v8 = [(NTKAegirFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (unint64_t)(a3 - 12) <= 7 && ((0x8Bu >> (a3 - 12)))
  {
    objc_super v4 = objc_opt_class();
  }
  else
  {
    objc_super v4 = 0;
  }
  return (Class)v4;
}

- (id)editOptionsThatHideEditModes
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = &unk_1F35275A0;
  uint64_t v2 = (void *)MEMORY[0x1E4F7A010];
  uint64_t v3 = [(NTKFace *)self device];
  objc_super v4 = [v2 partiallySupportedEditOptionsForDevice:v3];
  v8[0] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3
{
  if (a3 == 13)
  {
    int v5 = +[NTKFaceBundle localizedStringForKey:@"AEGIR_TIME_FONT_CANNOT_BE_CHANGED_EXPLANATION", @"Time font cannot be changed description", v3 comment];
  }
  else
  {
    int v5 = &stru_1F35252B8;
  }
  return v5;
}

@end