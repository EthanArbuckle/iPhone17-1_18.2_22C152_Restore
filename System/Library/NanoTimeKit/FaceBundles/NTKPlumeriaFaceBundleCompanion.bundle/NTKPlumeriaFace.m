@interface NTKPlumeriaFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
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

@implementation NTKPlumeriaFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  char v4 = NTKGizmoOrCompanionAreRussian();
  v5 = (char *)[v3 deviceCategory];
  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A9FBE0A3-C444-47D3-81E1-C183E34E74B2"];
  unsigned __int8 v7 = [v3 supportsCapability:v6];

  char v8 = _os_feature_enabled_impl();
  if (v5 == (unsigned char *)&dword_0 + 1) {
    char v9 = 1;
  }
  else {
    char v9 = v4;
  }
  return v9 | v8 & v7 ^ 1;
}

- (id)faceSharingName
{
  return +[NTKPlumeriaFaceBundle localizedStringForKey:@"FACE_PLUMERIA_IN_TITLE_CASE" comment:@"Plumeria"];
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_PLUMERIA_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKPlumeriaFace *)self _faceDescriptionKey];
  id v3 = +[NTKPlumeriaFaceBundle localizedStringForKey:v2 comment:@"FACE_STYLE_PLUMERIA_DESCRIPTION"];

  return v3;
}

- (int64_t)timeStyle
{
  return 1;
}

+ (id)pigmentFaceDomain
{
  return @"plumeria";
}

- (id)_customEditModes
{
  return &off_CE98;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return 0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKPlumeriaFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKPlumeriaFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKPlumeriaFace *)self _optionClassForCustomEditMode:a4];
  char v8 = [(NTKPlumeriaFace *)self device];
  char v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  char v8 = [(NTKPlumeriaFace *)self _optionClassForCustomEditMode:a4];
  char v9 = [(NTKPlumeriaFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  return 0;
}

@end