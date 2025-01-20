@interface NTKParameciumFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
- (BOOL)_faceGalleryIsRestricted;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultName;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)complicationSlotsHiddenByEditOption:(id)a3;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKParameciumFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"7BFF3E43-2495-4724-91FA-D8DDA37FD05C"];
  unsigned int v6 = [v3 supportsCapability:v5];

  if ([v3 sizeClass])
  {
    char v7 = 1;
    if ([v3 sizeClass] != (char *)&dword_0 + 1 && ((v6 ^ 1) & 1) == 0 && ((v4 ^ 1) & 1) == 0) {
      char v7 = NTKGizmoOrCompanionAreRussian();
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

+ (id)complicationConfiguration
{
  if (qword_16500 != -1) {
    dispatch_once(&qword_16500, &stru_104D8);
  }
  v2 = (void *)qword_164F8;

  return v2;
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
    v8.super_class = (Class)NTKParameciumFace;
    uint64_t v5 = [(NTKParameciumFace *)&v8 complicationSlotsHiddenByEditOption:v4];
  }
  unsigned int v6 = (void *)v5;

  return v6;
}

- (id)_defaultName
{
  return +[NTKParameciumFaceBundle localizedStringForKey:@"PARAMECIUM_FACE_NAME_IN_TITLE_CASE" comment:@"Paramecium"];
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_PARAMECIUM_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKParameciumFace *)self _faceDescriptionKey];
  id v3 = +[NTKParameciumFaceBundle localizedStringForKey:v2 comment:@"Paramecium face description"];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKParameciumFaceBundle localizedStringForKey:@"PARAMECIUM_FACE_NAME_IN_TITLE_CASE" comment:@"Paramecium"];
}

- (BOOL)_faceGalleryIsRestricted
{
  return 1;
}

- (id)_customEditModes
{
  return &off_10F10;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = [(NTKParameciumFace *)self device];
  if (a3 == 12)
  {
    uint64_t v6 = +[NTKParameciumStyleEditOption optionWithParameciumStyle:2 forDevice:v5];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    uint64_t v6 = +[NTKParameciumBackgroundEditOption optionWithParameciumBackground:0 forDevice:v5];
LABEL_5:
    char v7 = (void *)v6;
    goto LABEL_7;
  }
  char v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKParameciumFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  uint64_t v6 = [(NTKParameciumFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKParameciumFace *)self _optionClassForCustomEditMode:a4];
  objc_super v8 = [(NTKParameciumFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  objc_super v8 = [(NTKParameciumFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKParameciumFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15 || a3 == 12)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 15:
      id v7 = @"EDIT_MODE_LABEL_PARAMECIUM_STYLE";
      goto LABEL_7;
    case 14:
      id v7 = @"EDIT_MODE_LABEL_PARAMECIUM_DIAL";
      goto LABEL_7;
    case 12:
      id v7 = @"EDIT_MODE_LABEL_PARAMECIUM_CONTENT";
LABEL_7:
      objc_super v8 = [(__CFString *)v7 stringByAppendingString:@"_COMPANION"];
      v9 = +[NTKParameciumFaceBundle localizedStringForKey:v8 comment:@"Paramecium custom edit mode name"];

      goto LABEL_9;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKParameciumFace;
  v9 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_9:

  return v9;
}

@end