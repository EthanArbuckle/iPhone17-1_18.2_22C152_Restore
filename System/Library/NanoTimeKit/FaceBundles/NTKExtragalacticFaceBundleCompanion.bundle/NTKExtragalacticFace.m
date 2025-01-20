@interface NTKExtragalacticFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)pigmentFaceDomain;
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

@implementation NTKExtragalacticFace

- (int64_t)timeStyle
{
  return 1;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 deviceCategory];
  char v5 = _os_feature_enabled_impl();
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B8E1457C-60C6-4CBE-AE96-F0AA874D3100"];
  char v7 = [v3 supportsCapability:v6];

  if (v4 == 1) {
    return 1;
  }
  else {
    return v5 & v7 ^ 1;
  }
}

- (id)_faceDescriptionKey
{
  return @"EXTRAGALACTIC_FACE_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKExtragalacticFace *)self _faceDescriptionKey];
  id v3 = +[NTKFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKFaceBundle localizedStringForKey:@"EXTRAGALACTIC_GALLERY_TITLE" comment:@"Extragalactic"];
}

- (id)_customEditModes
{
  return &unk_26FB0C290;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  char v5 = -[NTKExtragalacticFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 17)
  {
    uint64_t v4 = (void *)MEMORY[0x263F579E0];
    char v5 = [(NTKFace *)self device];
    v6 = [v4 optionWithBackgroundStyle:1 forDevice:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKExtragalacticFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKExtragalacticFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 17)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)supportsPigmentEditOption
{
  return 1;
}

+ (id)pigmentFaceDomain
{
  return @"extragalactic";
}

@end