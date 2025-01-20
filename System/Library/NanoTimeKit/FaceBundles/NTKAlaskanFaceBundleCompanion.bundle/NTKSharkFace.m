@interface NTKSharkFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
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

@implementation NTKSharkFace

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
  v6.super_class = (Class)NTKSharkFace;
  v2 = [(NTKSharkFace *)&v6 unsafeDailySnapshotKey];
  if ([v2 isEqualToString:NTKSensitiveSnapshotKey])
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 stringByAppendingString:@".shark"];
  }
  unsigned int v4 = v3;

  return v4;
}

- (id)faceSharingName
{
  return +[NTKSharkFaceBundle localizedStringForKey:@"ALASKAN_SHARK_FACE_NAME_IN_TITLE_CASE" comment:@"Tachymeter"];
}

- (id)_faceDescription
{
  return +[NTKAlaskanFaceBundle localizedStringForKey:@"FACE_STYLE_SHARK_DESCRIPTION" comment:&stru_39558];
}

+ (id)complicationConfiguration
{
  if (qword_47A00 != -1) {
    dispatch_once(&qword_47A00, &stru_389E8);
  }
  v2 = (void *)qword_479F8;

  return v2;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    if ([(NTKSharkFace *)self deviceSupportsPigmentEditOption])
    {
      v7 = [(NTKSharkFace *)self pigmentOptionProvider];
      [v7 defaultColorOptionForSlot:v6];
    }
    else
    {
      v7 = [(NTKSharkFace *)self device];
      +[NTKAlaskanColorEditOption optionWithColor:3003 forDevice:v7];
    uint64_t v8 = };
  }
  else
  {
    if (a3 != 11)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v7 = [(NTKSharkFace *)self device];
    uint64_t v8 = +[NTKSharkTimescaleEditOption optionWithTimescale:1 forDevice:v7];
  }
  v9 = (void *)v8;

LABEL_10:

  return v9;
}

- (id)_customEditModes
{
  return &off_3AC68;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 11 || a3 == 10)
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
  id v5 = -[NTKSharkFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKSharkFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKSharkFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKSharkFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSharkFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKSharkFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11)
  {
    unsigned int v4 = +[NTKSharkFaceBundle localizedStringForKey:@"EDIT_MODE_LABEL_SHARK_TIMESCALE" comment:@"TIMESCALE"];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKSharkFace;
    unsigned int v4 = objc_msgSendSuper2(&v6, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v4;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainChronographPro;
}

@end