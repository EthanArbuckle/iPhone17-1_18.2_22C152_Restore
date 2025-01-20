@interface NTKAtiumFace
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
- (id)editOptionThatHidesAllComplications;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKAtiumFace

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

+ (id)pigmentFaceDomain
{
  return @"atium";
}

- (id)_faceDescriptionKey
{
  return @"FACE_ATIUM_DESCRIPTION";
}

- (id)faceSharingName
{
  return +[NTKAtiumFaceBundle localizedStringForKey:@"FACE_ATIUM_IN_TITLE_CASE" comment:@"Atium"];
}

- (id)_faceDescription
{
  v2 = [(NTKAtiumFace *)self _faceDescriptionKey];
  id v3 = +[NTKAtiumFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (id)_customEditModes
{
  return &off_CAC0;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    v4 = [(NTKAtiumFace *)self device];
    char v5 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  char v5 = -[NTKAtiumFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKAtiumFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKAtiumFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKAtiumFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKAtiumFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKAtiumFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    v4 = objc_msgSend(@"EDIT_MODE_LABEL_DIAL", "stringByAppendingString:", @"_COMPANION", a4);
    char v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)complicationConfiguration
{
  if (qword_12208 != -1) {
    dispatch_once(&qword_12208, &stru_C4A8);
  }
  v2 = (void *)qword_12200;

  return v2;
}

- (id)editOptionThatHidesAllComplications
{
  v2 = [(NTKAtiumFace *)self device];
  uint64_t v3 = +[NTKAnalogDialShapeEditOption optionWithShape:1 forDevice:v2];

  return v3;
}

@end