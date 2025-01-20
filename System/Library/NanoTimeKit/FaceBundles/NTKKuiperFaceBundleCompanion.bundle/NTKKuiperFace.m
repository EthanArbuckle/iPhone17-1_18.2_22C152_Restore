@interface NTKKuiperFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
+ (id)pigmentFaceDomain;
+ (int64_t)_complicationFontStyleForSlot:(id)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
@end

@implementation NTKKuiperFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 deviceCategory];
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned __int8 v6 = [v3 supportsCapability:v5];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 1;
  }
  else {
    return v6 ^ 1;
  }
}

- (id)_faceDescription
{
  v2 = [(NTKKuiperFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  unsigned int v4 = [v2 supportsCapability:v3];
  id v5 = @"FACE_STYLE_KUIPER_DESCRIPTION_COMPANION";
  if (v4) {
    id v5 = @"FACE_STYLE_KUIPER_DESCRIPTION_LIGHTHOUSE_COMPANION";
  }
  unsigned __int8 v6 = v5;

  v7 = +[NTKKuiperFaceBundle localizedStringForKey:v6 comment:@"description"];

  return v7;
}

- (id)faceSharingName
{
  return +[NTKKuiperFaceBundle localizedStringForKey:@"FACE_STYLE_KUIPER_IN_TITLE_CASE" comment:@"Kuiper"];
}

+ (id)complicationConfiguration
{
  if (qword_17278 != -1) {
    dispatch_once(&qword_17278, &stru_10740);
  }
  v2 = (void *)qword_17270;

  return v2;
}

+ (int64_t)_complicationFontStyleForSlot:(id)a3
{
  return 1;
}

- (id)_customEditModes
{
  return &off_110A0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 15)
  {
    v7 = [(NTKKuiperFace *)self device];
    uint64_t v8 = +[NTKKuiperDialEditOption optionWithKuiperDial:4 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 11)
  {
    v7 = [(NTKKuiperFace *)self device];
    uint64_t v8 = +[NTKKuiperDensityEditOption optionWithKuiperDensity:0 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKKuiperFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKKuiperFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKKuiperFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKKuiperFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKKuiperFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKKuiperFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 11 || a3 == 15)
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
  if (a3 == 11)
  {
    id v7 = @"EDIT_MODE_LABEL_KUIPER_STYLE";
LABEL_5:
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
    v9 = +[NTKKuiperFaceBundle localizedStringForKey:v8 comment:@"edit mode"];
    if (v9) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a3 == 15)
  {
    id v7 = @"EDIT_MODE_LABEL_KUIPER_DIAL";
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_8:
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKKuiperFace;
  v9 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_9:

  return v9;
}

+ (id)pigmentFaceDomain
{
  return @"kuiper";
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    id v5 = 0;
  }
  else {
    id v5 = *(id *)*(&off_10760 + a4);
  }
  id v11 = v5;
  id v6 = +[NTKPigmentEditOption pigmentNamed:v5];
  [(NTKKuiperFace *)self selectOption:v6 forCustomEditMode:10 slot:0];
  id v7 = [(NTKKuiperFace *)self device];
  uint64_t v8 = +[NTKKuiperDialEditOption optionWithKuiperDial:0 forDevice:v7];

  [(NTKKuiperFace *)self selectOption:v8 forCustomEditMode:15 slot:0];
  v9 = +[NTKKuiperTypographicSizeProvider keyForTypographicStyleFraction:0.0];
  [(NTKKuiperFace *)self setCustomData:v9 forKey:@"typographicStyleFraction"];
  id v10 = +[NTKComplication anyComplicationOfType:0];
  [(NTKKuiperFace *)self setComplication:v10 forSlot:NTKComplicationSlotTopLeft];
  [(NTKKuiperFace *)self setComplication:v10 forSlot:NTKComplicationSlotTopRight];
  [(NTKKuiperFace *)self setComplication:v10 forSlot:NTKComplicationSlotBottomLeft];
  [(NTKKuiperFace *)self setComplication:v10 forSlot:NTKComplicationSlotBottomRight];
}

@end