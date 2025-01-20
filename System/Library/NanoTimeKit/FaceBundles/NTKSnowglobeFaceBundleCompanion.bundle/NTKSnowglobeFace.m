@interface NTKSnowglobeFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKSnowglobeFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKFaceBundle localizedStringForKey:@"FACE_STYLE_SNOWGLOBE_IN_TITLE_CASE" comment:@"Playtime"];
}

- (id)_faceDescription
{
  v2 = [(NTKFace *)self device];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  int v4 = [v2 supportsCapability:v3];
  v5 = @"FACE_STYLE_SNOWGLOBE_DESCRIPTION";
  if (v4) {
    v5 = @"FACE_STYLE_SNOWGLOBE_DESCRIPTION_LIGHTHOUSE";
  }
  v6 = v5;

  v7 = +[NTKFaceBundle localizedStringForKey:v6 comment:@"Description"];

  return v7;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == 1)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
    int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  return v4;
}

+ (id)pigmentFaceDomain
{
  return @"snowglobe";
}

- (id)_customEditModes
{
  return &unk_1F352BFA8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = [(NTKFace *)self device];
  if (a3 == 15)
  {
    v6 = +[NTKSnowglobeBackgroundEditOption optionWithSnowglobeBackground:0 forDevice:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKSnowglobeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKSnowglobeFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKSnowglobeFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    int v4 = objc_msgSend(@"EDIT_MODE_LABEL_SNOWGLOBE_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = +[NTKFaceBundle localizedStringForKey:v4 comment:@"Snowglobe custom edit mode name"];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKSnowglobeFace;
    v5 = objc_msgSendSuper2(&v7, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
  }

  return v5;
}

@end