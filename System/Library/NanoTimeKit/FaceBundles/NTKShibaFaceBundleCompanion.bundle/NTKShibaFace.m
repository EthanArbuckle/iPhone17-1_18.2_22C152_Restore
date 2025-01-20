@interface NTKShibaFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
@end

@implementation NTKShibaFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
    unsigned __int8 v4 = [v3 supportsCapability:v5];
  }
  char v6 = NTKShowVictoryFaces() & v4 ^ 1;

  return v6;
}

- (int64_t)timeStyle
{
  v2 = [(NTKShibaFace *)self selectedOptionForCustomEditMode:15 slot:0];
  int64_t v3 = [v2 style] == 0;

  return v3;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NTKShibaFace *)self selectedOptionForCustomEditMode:a4 slot:v9];
  v12.receiver = self;
  v12.super_class = (Class)NTKShibaFace;
  [(NTKShibaFace *)&v12 selectOption:v8 forCustomEditMode:a4 slot:v9];

  if (a4 == 15 && (NTKEqualObjects() & 1) == 0)
  {
    id v11 = v10;
    if (![v8 style] || !objc_msgSend(v11, "style")) {
      [(NTKShibaFace *)self _notifyObserversFaceTimeStyleChanged];
    }
  }
}

- (id)faceSharingName
{
  return +[NTKShibaFaceBundle localizedStringForKey:@"FACE_STYLE_SHIBA_IN_TITLE_CASE" comment:@"Shiba"];
}

- (id)_faceDescription
{
  v2 = [(NTKShibaFace *)self device];
  unsigned int v3 = [v2 supportsVictoryFaces];

  if (v3) {
    +[NTKShibaFaceBundle localizedStringForKey:@"FACE_STYLE_SHIBA_DESCRIPTION_KINCAID" tableSuffix:@"Kincaid" comment:&stru_C3E8];
  }
  else {
  unsigned __int8 v4 = +[NTKShibaFaceBundle localizedStringForKey:@"FACE_STYLE_SHIBA_DESCRIPTION" comment:&stru_C3E8];
  }

  return v4;
}

- (id)_customEditModes
{
  return &off_CA30;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 15)
  {
    v7 = [(NTKShibaFace *)self device];
    uint64_t v8 = +[NTKShibaStyleEditOption optionWithStyle:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    v7 = [(NTKShibaFace *)self device];
    uint64_t v8 = +[NTKShibaColorEditOption optionWithColor:3000 forDevice:v7];
LABEL_5:
    id v9 = (void *)v8;

    goto LABEL_7;
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKShibaFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKShibaFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKShibaFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKShibaFace *)self device];
  id v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKShibaFace *)self _optionClassForCustomEditMode:a4];
  id v9 = [(NTKShibaFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 15)
  {
    unsigned __int8 v4 = objc_opt_class();
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  return (Class)v4;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSignatureCircularTypes();
  uint64_t v3 = NTKAllSignatureRectangularTypes();
  unsigned __int8 v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v12[0] = NTKComplicationSlotTop;
  id v7 = NTKComplicationSlotDescriptor();
  v13[0] = v7;
  v12[1] = NTKComplicationSlotCenter;
  uint64_t v8 = NTKComplicationSlotDescriptor();
  v13[1] = v8;
  v12[2] = NTKComplicationSlotBottom;
  id v9 = NTKComplicationSlotDescriptor();
  v13[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTop;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTop;
  v4[1] = NTKComplicationSlotCenter;
  v4[2] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTop;
  v5[1] = NTKComplicationSlotCenter;
  v5[2] = NTKComplicationSlotBottom;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:3];

  return v3;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainVictoryCompact;
}

@end