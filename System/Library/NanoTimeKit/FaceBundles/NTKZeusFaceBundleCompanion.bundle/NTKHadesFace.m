@interface NTKHadesFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKHadesFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1
    || [v3 deviceCategory] == &dword_4
    || (id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"], v5 = objc_msgSend(v3, "supportsCapability:", v4), v4, !v5))
  {
    LOBYTE(v6) = 1;
  }
  else if ([v3 collectionType] == (char *)&dword_4 + 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    int v6 = NTKShowHardwareSpecificFaces() ^ 1;
  }

  return v6;
}

- (id)faceSharingName
{
  return +[NTKHadesFaceBundle localizedStringForKey:@"FACE_STYLE_HADES_IN_TITLE_CASE" comment:@"Hades"];
}

- (id)_complicationSlotDescriptors
{
  return &__NSDictionary0__struct;
}

- (id)_customEditModes
{
  return &off_3FA38;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    id v4 = [(NTKHadesFace *)self device];
    unsigned int v5 = +[NTKHadesRotationEditOption optionWithRotation:0 forDevice:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  unsigned int v5 = -[NTKHadesFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  int v6 = [(NTKHadesFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKHadesFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKHadesFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKHadesFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKHadesFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_HADES_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKHadesFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKHadesFaceBundle localizedStringForKey:v2 comment:&stru_3D3C0];

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"hades";
}

@end