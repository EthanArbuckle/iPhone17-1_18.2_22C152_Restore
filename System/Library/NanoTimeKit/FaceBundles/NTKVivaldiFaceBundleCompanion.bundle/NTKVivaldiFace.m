@interface NTKVivaldiFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)complicationConfiguration;
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

@implementation NTKVivaldiFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_VIVALDI_IN_TITLE_CASE" comment:@"Vivaldi"];
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  LOBYTE(v5) = 1;
  if ([v3 deviceCategory] != 1 && v4)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
    int v5 = [v3 supportsCapability:v6] ^ 1;
  }
  return v5;
}

+ (id)complicationConfiguration
{
  if (qword_2691E2708 != -1) {
    dispatch_once(&qword_2691E2708, &unk_26FB3BA10);
  }
  v2 = (void *)qword_2691E2700;

  return v2;
}

- (id)_customEditModes
{
  return &unk_26FB3D718;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  int v5 = -[NTKVivaldiFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKVivaldiFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKVivaldiFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return 0;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKVivaldiFace;
  int v4 = objc_msgSendSuper2(&v6, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);

  return v4;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_VIVALDI_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKVivaldiFace *)self _faceDescriptionKey];
  id v3 = +[NTKFaceBundle localizedStringForKey:v2 comment:&stru_26FB3BC90];

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"vivaldi";
}

@end