@interface NTKBigNumeralsDigitalFace
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (BOOL)hasPrideEditOptions;
- (BOOL)requiresPigmentEditOption;
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

@implementation NTKBigNumeralsDigitalFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKBigNumeralsDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_BIG_NUMERALS_DIGITAL_IN_TITLE_CASE" comment:@"Numerals Duo"];
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_BIG_NUMERALS_DIGITAL_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKBigNumeralsDigitalFace *)self _faceDescriptionKey];
  v3 = +[NTKBigNumeralsDigitalFaceBundle localizedStringForKey:v2 comment:@"Numerals Duo Description"];

  return v3;
}

- (id)_customEditModes
{
  return &off_D598;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    v11 = [(NTKBigNumeralsDigitalFace *)self device];
    v12 = (char *)[v11 collectionType];

    if (v12 == (unsigned char *)&dword_4 + 1)
    {
      v7 = [(NTKBigNumeralsDigitalFace *)self device];
      uint64_t v13 = 102;
    }
    else
    {
      v14 = [(NTKBigNumeralsDigitalFace *)self device];
      v15 = (char *)[v14 collectionType];

      v7 = [(NTKBigNumeralsDigitalFace *)self device];
      if (v15 != (unsigned char *)&dword_4 + 2)
      {
        uint64_t v10 = +[NTKBigNumeralsDigitalColorEditOption optionWithColor:3005 forDevice:v7];
        goto LABEL_13;
      }
      uint64_t v13 = 103;
    }
    uint64_t v10 = +[NTKBigNumeralsDigitalColorEditOption optionWithFaceColor:v13 forDevice:v7];
LABEL_13:
    v9 = (void *)v10;
    goto LABEL_14;
  }
  if (a3 == 15)
  {
    v7 = [(NTKBigNumeralsDigitalFace *)self device];
    uint64_t v10 = +[NTKBigNumeralsDigitalStyleEditOption optionWithStyle:0 forDevice:v7];
    goto LABEL_13;
  }
  if (a3 != 13)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v7 = +[NSLocale currentLocale];
  v8 = [(NTKBigNumeralsDigitalFace *)self device];
  v9 = +[NTKBigNumeralsDigitalTypefaceEditOption defaultOptionForLocale:v7 device:v8];

LABEL_14:
LABEL_15:

  return v9;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKBigNumeralsDigitalFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKBigNumeralsDigitalFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKBigNumeralsDigitalFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKBigNumeralsDigitalFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKBigNumeralsDigitalFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKBigNumeralsDigitalFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 13 || a3 == 15)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  if (a3 == 13)
  {
    if (_os_feature_enabled_impl()
      && (id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"10262875-CE7F-4736-BEE0-2233E4EAA468"], v8 = objc_msgSend(v6, "supportsCapability:", v7), v7, (v8 & 1) != 0))
    {
      v9 = @"EDIT_MODE_LABEL_NUMERALS";
    }
    else
    {
      v9 = @"EDIT_MODE_LABEL_SYMBOLS_LEGACY";
    }
    v11 = [(__CFString *)v9 stringByAppendingString:@"_COMPANION"];
    id v10 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___NTKBigNumeralsDigitalFace;
    id v10 = objc_msgSendSuper2(&v13, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
  }

  return v10;
}

- (BOOL)hasPrideEditOptions
{
  return 1;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKBigNumeralsDigitalColorEditOption domain];
}

@end