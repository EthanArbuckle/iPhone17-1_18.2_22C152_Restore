@interface NTKMagmaFace
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

@implementation NTKMagmaFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned __int8 v4 = [v3 supportsCapability:v5];
  }
  char v6 = NTKShowVictoryFaces() & v4 ^ 1;

  return v6;
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKMagmaFaceBundle localizedStringForKey:@"FACE_STYLE_MAGMA_IN_TITLE_CASE" comment:@"Magma"];
}

+ (id)pigmentFaceDomain
{
  return @"magma";
}

- (id)_customEditModes
{
  return &off_14FD8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = [(NTKMagmaFace *)self device];
  if (a3 == 15)
  {
    char v6 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKMagmaFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  char v6 = [(NTKMagmaFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKMagmaFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKMagmaFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKMagmaFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKMagmaFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    unsigned __int8 v4 = objc_opt_class();
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    unsigned __int8 v4 = objc_msgSend(@"EDIT_MODE_LABEL_MAGMA_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    id v5 = +[NTKMagmaFaceBundle localizedStringForKey:v4 comment:@"Magma custom edit mode name"];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKMagmaFace;
    id v5 = objc_msgSendSuper2(&v7, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v5;
}

- (id)_faceDescription
{
  v2 = [(NTKMagmaFace *)self device];
  unsigned int v3 = [v2 supportsVictoryFaces];

  if (v3) {
    +[NTKMagmaFaceBundle localizedStringForKey:@"FACE_STYLE_MAGMA_DESCRIPTION_LIGHTHOUSE" tableSuffix:@"Lighthouse" comment:@"lighthouse description"];
  }
  else {
  unsigned __int8 v4 = +[NTKMagmaFaceBundle localizedStringForKey:@"FACE_STYLE_MAGMA_DESCRIPTION" comment:@"description"];
  }

  return v4;
}

@end