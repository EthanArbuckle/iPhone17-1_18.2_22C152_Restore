@interface NTKProteusFace
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
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKProteusFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1
    || [v3 deviceCategory] == (char *)&dword_0 + 2)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  return v4;
}

- (id)faceSharingName
{
  return +[NTKProteusFaceBundle localizedStringForKey:@"FACE_STYLE_PROTEUS_IN_TITLE_CASE" comment:@"Typograph ]["];
}

- (id)_complicationSlotDescriptors
{
  v2 = NTKAllSignatureCircularTypes();
  id v3 = NTKAllSimpleTextComplicationTypes();
  unsigned int v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9[0] = NTKComplicationSlotSubdialTop;
  id v5 = NTKComplicationSlotDescriptor();
  v10[0] = v5;
  v9[1] = NTKComplicationSlotSubdialBottom;
  v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
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
  v5[0] = NTKComplicationSlotSubdialTop;
  v5[1] = NTKComplicationSlotSubdialBottom;
  id v3 = +[NSArray arrayWithObjects:v5 count:2];

  return v3;
}

- (id)_customEditModes
{
  return &off_10C08;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = [(NTKProteusFace *)self device];
  if (a3 == 12)
  {
    uint64_t v6 = +[NTKProteusBackgroundEditOption optionWithBackgroundStyle:1 forDevice:v5];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    uint64_t v6 = +[NTKProteusStyleEditOption optionWithProteusStyle:0 forDevice:v5];
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKProteusFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  uint64_t v6 = [(NTKProteusFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKProteusFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKProteusFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKProteusFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKProteusFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15 || a3 == 12)
  {
    unsigned int v4 = objc_opt_class();
  }
  else
  {
    unsigned int v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 12)
  {
    id v7 = @"EDIT_MODE_LABEL_PROTEUS_CONTENT";
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    id v7 = @"EDIT_MODE_LABEL_PROTEUS_STYLE";
LABEL_5:
    v8 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
    v9 = +[NTKProteusFaceBundle localizedStringForKey:v8 comment:@"Typograph custom edit mode name"];

    goto LABEL_7;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKProteusFace;
  v9 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_7:

  return v9;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_PROTEUS_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKProteusFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKProteusFaceBundle localizedStringForKey:v2 comment:&stru_10688];

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"proteus";
}

@end