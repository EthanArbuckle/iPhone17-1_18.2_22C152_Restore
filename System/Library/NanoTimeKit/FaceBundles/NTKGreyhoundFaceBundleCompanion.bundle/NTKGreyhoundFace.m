@interface NTKGreyhoundFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultColorForDevice;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)editOptionThatHidesAllComplications;
- (id)faceSharingName;
- (id)orderedComplicationSlots;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKGreyhoundFace

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

- (id)faceSharingName
{
  return +[NTKGreyhoundFaceBundle localizedStringForKey:@"GREYHOUND_FACE_NAME_IN_TITLE_CASE" comment:@"Greyhound"];
}

- (id)_faceDescription
{
  v2 = [(NTKGreyhoundFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  unsigned int v4 = [v2 supportsCapability:v3];

  if (v4)
  {
    id v5 = [@"FACE_STYLE_GREYHOUND_DESCRIPTION" stringByAppendingString:@"_KINCAID"];
  }
  else
  {
    id v5 = @"FACE_STYLE_GREYHOUND_DESCRIPTION";
  }
  v6 = +[NTKGreyhoundFaceBundle localizedStringForKey:v5 comment:&stru_151D8];

  return v6;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v6 = +[CLKDevice currentDevice];
  unsigned int v7 = [v6 isTinker];

  v8 = 0;
  if (v7)
  {
    switch(a3)
    {
      case 10:
        v9 = [(NTKGreyhoundFace *)self device];
        uint64_t v10 = +[NTKGreyhoundColorEditOption optionWithCaliforniaColor:3004 forDevice:v9];
        goto LABEL_13;
      case 11:
        v9 = [(NTKGreyhoundFace *)self device];
        uint64_t v11 = 1;
        goto LABEL_10;
      case 13:
        v9 = [(NTKGreyhoundFace *)self device];
        uint64_t v12 = 2;
        goto LABEL_12;
      case 15:
        goto LABEL_6;
      default:
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 10:
        v8 = [(NTKGreyhoundFace *)self _defaultColorForDevice];
        break;
      case 11:
        v9 = [(NTKGreyhoundFace *)self device];
        uint64_t v11 = 0;
LABEL_10:
        uint64_t v10 = +[NTKGreyhoundDensityEditOption optionWithDensity:v11 forDevice:v9];
        goto LABEL_13;
      case 13:
        v9 = [(NTKGreyhoundFace *)self device];
        uint64_t v12 = 0;
LABEL_12:
        uint64_t v10 = +[NTKGreyhoundTypefaceEditOption optionWithTypeface:v12 forDevice:v9];
        goto LABEL_13;
      case 15:
LABEL_6:
        v9 = [(NTKGreyhoundFace *)self device];
        uint64_t v10 = +[NTKGreyhoundStyleEditOption defaultOptionForDevice:v9];
LABEL_13:
        v8 = (void *)v10;

        break;
      default:
        break;
    }
  }

  return v8;
}

- (id)_defaultColorForDevice
{
  id v3 = [(NTKGreyhoundFace *)self device];
  id v4 = [v3 collectionType];

  switch((unint64_t)v4)
  {
    case 5uLL:
    case 6uLL:
      id v5 = [(NTKGreyhoundFace *)self device];
      uint64_t v6 = +[NTKGreyhoundColorEditOption optionAtIndex:0 forDevice:v5];
      goto LABEL_9;
    case 7uLL:
      uint64_t v7 = 3007;
      goto LABEL_8;
    case 8uLL:
      uint64_t v7 = 3008;
      goto LABEL_8;
    case 9uLL:
      uint64_t v7 = 3005;
      goto LABEL_8;
    case 0xAuLL:
      uint64_t v7 = 3006;
      goto LABEL_8;
    default:
      uint64_t v7 = 3003;
LABEL_8:
      id v5 = [(NTKGreyhoundFace *)self device];
      uint64_t v6 = +[NTKGreyhoundColorEditOption optionWithCaliforniaColor:v7 forDevice:v5];
LABEL_9:
      v8 = (void *)v6;

      return v8;
  }
}

- (id)_customEditModes
{
  return &off_16058;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (unint64_t)(a3 - 10) <= 5 && ((0x2Bu >> (a3 - 10)))
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKGreyhoundFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  uint64_t v6 = [(NTKGreyhoundFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKGreyhoundFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKGreyhoundFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKGreyhoundFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKGreyhoundFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 11:
      CFStringRef v7 = @"EDIT_OPTION_LABEL_DENSITY";
      goto LABEL_7;
    case 15:
      CFStringRef v7 = @"EDIT_MODE_LABEL_STYLE";
      goto LABEL_7;
    case 13:
      CFStringRef v7 = @"EDIT_MODE_LABEL_TYPEFACE";
LABEL_7:
      uint64_t v8 = +[NTKGreyhoundFaceBundle localizedStringForKey:v7 comment:@"Edit Mode"];
      goto LABEL_9;
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___NTKGreyhoundFace;
  uint64_t v8 = objc_msgSendSuper2(&v11, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, v6);
LABEL_9:
  v9 = (void *)v8;

  return v9;
}

- (id)_complicationSlotDescriptors
{
  uint64_t v6 = NTKComplicationSlotSubdialTop;
  v2 = NTKAllSimpleTextComplicationTypes();
  uint64_t v3 = NTKComplicationSlotDescriptor();
  CFStringRef v7 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (id)orderedComplicationSlots
{
  uint64_t v4 = NTKComplicationSlotSubdialTop;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)editOptionThatHidesAllComplications
{
  v2 = [(NTKGreyhoundFace *)self device];
  uint64_t v3 = +[NTKGreyhoundDensityEditOption optionWithDensity:0 forDevice:v2];

  return v3;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"typograph";
}

@end