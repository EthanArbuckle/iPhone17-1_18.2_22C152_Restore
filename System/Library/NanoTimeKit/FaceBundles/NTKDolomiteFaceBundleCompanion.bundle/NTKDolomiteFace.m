@interface NTKDolomiteFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (BOOL)isEditable;
- (BOOL)supportsPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKDolomiteFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 deviceCategory];
  char v5 = _os_feature_enabled_impl();
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
  unsigned __int8 v7 = [v3 supportsCapability:v6];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 1;
  }
  else {
    return v5 & v7 ^ 1;
  }
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKDolomiteFaceBundle localizedStringForKey:@"FACE_STYLE_DOLOMITE_IN_TITLE_CASE" comment:@"Dolomite"];
}

- (BOOL)isEditable
{
  return 1;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_DOLOMITE_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKDolomiteFace *)self _faceDescriptionKey];
  id v3 = +[NTKDolomiteFaceBundle localizedStringForKey:v2 comment:@"FACE_STYLE_DOLOMITE_DESCRIPTION"];

  return v3;
}

- (id)_customEditModes
{
  return &off_D58F80;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 19 || a3 == 15)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  char v5 = -[NTKDolomiteFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKDolomiteFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKDolomiteFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKDolomiteFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKDolomiteFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKDolomiteFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 19)
  {
    CFStringRef v7 = @"EDIT_MODE_LABEL_NUMERAL";
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    CFStringRef v7 = @"EDIT_MODE_LABEL_STYLE";
LABEL_5:
    uint64_t v8 = +[NTKDolomiteFaceBundle localizedStringForKey:v7 comment:@"Edit Mode"];
    goto LABEL_7;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKDolomiteFace;
  uint64_t v8 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 15)
  {
    CFStringRef v7 = NTKDolomiteStyleEditOption;
    goto LABEL_5;
  }
  if (a3 == 19)
  {
    CFStringRef v7 = NTKDolomiteNumeralEditOption;
LABEL_5:
    uint64_t v8 = [(NTKDolomiteFace *)self device];
    v9 = [(__objc2_class *)v7 defaultOptionForDevice:v8];

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)supportsPigmentEditOption
{
  return 1;
}

+ (id)pigmentFaceDomain
{
  return @"dolomite";
}

@end