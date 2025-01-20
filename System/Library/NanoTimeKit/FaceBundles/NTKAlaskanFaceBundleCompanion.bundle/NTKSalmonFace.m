@interface NTKSalmonFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)complicationConfiguration;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (id)unsafeDailySnapshotKey;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKSalmonFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"];
    unsigned int v4 = [v3 supportsCapability:v5] ^ 1;
  }
  return v4;
}

- (id)unsafeDailySnapshotKey
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSalmonFace;
  v2 = [(NTKSalmonFace *)&v6 unsafeDailySnapshotKey];
  if ([v2 isEqualToString:NTKSensitiveSnapshotKey])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 stringByAppendingString:@".salmon"];
  }
  unsigned int v4 = v3;

  return v4;
}

- (id)faceSharingName
{
  return +[NTKSalmonFaceBundle localizedStringForKey:@"ALASKAN_SALMON_FACE_NAME_IN_TITLE_CASE" comment:@"GMT"];
}

- (id)_faceDescription
{
  return +[NTKSalmonFaceBundle localizedStringForKey:@"FACE_STYLE_SALMON_DESCRIPTION" comment:&stru_39558];
}

+ (id)complicationConfiguration
{
  if (qword_47CF8 != -1) {
    dispatch_once(&qword_47CF8, &stru_39218);
  }
  v2 = (void *)qword_47CF0;

  return v2;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    unsigned int v4 = [(NTKSalmonFace *)self device];
    id v5 = +[NTKSalmonColorEditOption optionWithColor:3000 forDevice:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_customEditModes
{
  return &off_3ACC8;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10)
  {
    unsigned int v4 = objc_opt_class();
  }
  else
  {
    unsigned int v4 = 0;
  }
  return (Class)v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKSalmonFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  objc_super v6 = [(NTKSalmonFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKSalmonFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKSalmonFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSalmonFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKSalmonFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKSalmonColorEditOption domain];
}

@end