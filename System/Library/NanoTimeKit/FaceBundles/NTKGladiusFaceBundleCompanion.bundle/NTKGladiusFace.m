@interface NTKGladiusFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKGladiusFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 deviceCategory];
  char v5 = _os_feature_enabled_impl();
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  unsigned __int8 v7 = [v3 supportsCapability:v6];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 1;
  }
  else {
    return v5 & v7 ^ 1;
  }
}

- (id)faceSharingName
{
  return +[NTKGladiusFaceBundle localizedStringForKey:@"FACE_STYLE_GLADIUS_IN_TITLE_CASE" comment:@"Gladius"];
}

- (id)_faceDescription
{
  return +[NTKGladiusFaceBundle localizedStringForKey:@"FACE_STYLE_GLADIUS_DESCRIPTION" comment:@"description"];
}

- (id)_complicationSlotDescriptors
{
  v8[0] = NTKComplicationSlotSubdialTop;
  v2 = NTKAllSimpleTextComplicationTypes();
  id v3 = NTKComplicationSlotDescriptor();
  v9[0] = v3;
  v8[1] = NTKComplicationSlotSubdialBottom;
  v4 = NTKAllSignatureCircularTypes();
  char v5 = NTKComplicationSlotDescriptor();
  v9[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotSubdialBottom;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotSubdialTop;
  v4[1] = NTKComplicationSlotSubdialBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  uint64_t v5 = NTKComplicationSlotSubdialBottom;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"gladius";
}

- (id)_customEditModes
{
  return &off_216A0;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15 || a3 == 12)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 12)
  {
    unsigned __int8 v7 = [(NTKGladiusFace *)self device];
    uint64_t v8 = +[NTKGladiusLightEditOption optionWithLight:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    unsigned __int8 v7 = [(NTKGladiusFace *)self device];
    uint64_t v8 = +[NTKGladiusStyleEditOption optionWithStyle:0 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    v4 = +[NTKGladiusFaceBundle localizedStringForKey:@"GLADIUS_EDIT_MODE_LABEL_LIGHT" comment:@"Light"];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKGladiusFace;
    v4 = objc_msgSendSuper2(&v6, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKGladiusFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  objc_super v6 = [(NTKGladiusFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKGladiusFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKGladiusFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKGladiusFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKGladiusFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

@end