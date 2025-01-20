@interface NTKMargaritaFace
+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_colorSlots;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)firstStripeSlot;
+ (id)pigmentFaceDomain;
+ (unint64_t)defaultColorForStripeIndex:(int64_t)a3;
+ (unint64_t)totalStripeCount;
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (BOOL)requiresPigmentEditOption;
- (BOOL)shouldColorEditModeBeAtTop;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)faceSharingName;
- (int64_t)_dynamicEditMode;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfDynamicSections;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKMargaritaFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
    unsigned int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  return v4;
}

- (id)faceSharingName
{
  return +[NTKMargaritaFaceBundle localizedStringForKey:@"FACE_STYLE_MARGARITA_IN_TITLE_CASE" comment:@"Margarita"];
}

- (id)_complicationSlotDescriptors
{
  v14 = +[NSMutableIndexSet indexSet];
  v2 = NTKAllSignatureCircularTypes();
  [v14 addIndexes:v2];

  id v3 = NTKAllSignatureCornerTypes();
  unsigned int v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
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

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 1;
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
  return &off_122B8;
}

+ (id)_slotsForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 10)
  {
    v6 = objc_msgSend(a1, "_colorSlots", a3, a4, v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (unint64_t)totalStripeCount
{
  v2 = [a1 _colorSlots];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

+ (id)firstStripeSlot
{
  v2 = [a1 _colorSlots];
  id v3 = [v2 firstObject];

  return v3;
}

+ (id)_colorSlots
{
  return &off_122D0;
}

+ (id)_defaultSelectedSlotForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 10) {
    return @"0";
  }
  else {
    return 0;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  v7 = [(NTKMargaritaFace *)self device];
  v8 = 0;
  switch(a3)
  {
    case 10:
      uint64_t v9 = +[NTKMargaritaColorEditOption optionWithMargaritaColor:forDevice:](NTKMargaritaColorEditOption, "optionWithMargaritaColor:forDevice:", objc_msgSend((id)objc_opt_class(), "defaultColorForStripeIndex:", objc_msgSend(v6, "integerValue")), v7);
      goto LABEL_6;
    case 11:
      uint64_t v9 = +[NTKMargaritaStripeCountEditOption optionWithCount:9 forDevice:v7];
      goto LABEL_6;
    case 14:
      uint64_t v9 = +[NTKMargaritaRotationEditOption optionWithRotation:0 forDevice:v7];
      goto LABEL_6;
    case 15:
      uint64_t v9 = +[NTKMargaritaStyleEditOption optionWithMargaritaStyle:0 forDevice:v7];
LABEL_6:
      v8 = (void *)v9;
      break;
    default:
      break;
  }

  return v8;
}

+ (unint64_t)defaultColorForStripeIndex:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return 0;
  }
  else {
    return qword_C0C8[a3];
  }
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKMargaritaFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKMargaritaFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKMargaritaFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKMargaritaFace *)self device];
  uint64_t v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKMargaritaFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v9 = [(NTKMargaritaFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (unint64_t)(a3 - 10) <= 5 && ((0x33u >> (a3 - 10)))
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

+ (BOOL)_customEditModeDeterminesDynamicSections:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 11;
}

- (BOOL)shouldColorEditModeBeAtTop
{
  return 0;
}

- (int64_t)_dynamicEditMode
{
  return 10;
}

- (unint64_t)_numberOfDynamicSections
{
  v2 = [(NTKMargaritaFace *)self selectedOptionForCustomEditMode:11 slot:0];
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass()) {
    id v3 = [v2 count];
  }

  return (unint64_t)v3;
}

- (id)_localizedNameForDynamicSectionCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    id v5 = a4;
    id v6 = objc_opt_class();
    id v7 = [(NTKMargaritaFace *)self device];
    id v8 = [v6 localizedNameForCustomEditMode:10 forDevice:v7];

    id v9 = [v5 integerValue];
    uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v9);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKMargaritaFace;
    id v8 = a4;
    uint64_t v10 = [(NTKMargaritaFace *)&v14 _localizedNameForDynamicSectionCustomEditMode:a3 slot:v8];
  }
  v12 = (void *)v10;

  return v12;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 11)
  {
    id v7 = @"EDIT_MODE_LABEL_MARGARITA_DENSITY";
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    id v7 = @"EDIT_MODE_LABEL_MARGARITA_COLOR";
LABEL_5:
    id v8 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
    id v9 = +[NTKMargaritaFaceBundle localizedStringForKey:v8 comment:@"Edit Mode"];

    goto LABEL_7;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKMargaritaFace;
  id v9 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_7:

  return v9;
}

- (id)complicationSlotsHiddenByEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (![v4 style] || objc_msgSend(v4, "style") == (char *)&dword_0 + 1))
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
    v8.super_class = (Class)NTKMargaritaFace;
    uint64_t v5 = [(NTKMargaritaFace *)&v8 complicationSlotsHiddenByEditOption:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_MARGARITA_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKMargaritaFace *)self _faceDescriptionKey];
  id v3 = +[NTKMargaritaFaceBundle localizedStringForKey:v2 comment:&stru_10A08];

  return v3;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainStripes;
}

@end