@interface NTKCloudrakerFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_orderedComplicationSlots;
- (id)faceSharingName;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKCloudrakerFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 deviceCategory] == (char *)&dword_0 + 1
    || [v3 deviceCategory] == (char *)&dword_0 + 2;
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B437A3A0-FD60-4D9B-8A18-814E9891E245"];
  unsigned __int8 v6 = [v3 supportsCapability:v5];

  return v4 | v6 ^ 1;
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKCloudrakerFaceBundle localizedStringForKey:@"FACE_STYLE_CLOUDRAKER_IN_TITLE_CASE" comment:@"Cloudraker"];
}

- (id)_faceDescription
{
  return +[NTKCloudrakerFaceBundle localizedStringForKey:@"FACE_STYLE_CLOUDRAKER_DESCRIPTION" comment:@"Modular Max Description"];
}

+ (id)pigmentFaceDomain
{
  return @"cloudraker";
}

- (id)_customEditModes
{
  v2 = [(NTKCloudrakerFace *)self device];
  int v3 = NTKShowIndicScriptNumerals();

  if (v3) {
    return &off_8C48;
  }
  else {
    return &off_8C60;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 19)
  {
    CLKLocaleNumberSystemForFirstLanguage();
    uint64_t v8 = NTKNumeralOptionFromCLKLocaleNumberSystem();
    v9 = [(NTKCloudrakerFace *)self device];
    v7 = +[NTKNumeralEditOption optionWithNumeral:v8 forDevice:v9];
  }
  else if (a3 == 10)
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKCloudrakerFace;
    v7 = [(NTKCloudrakerFace *)&v11 _defaultOptionForCustomEditMode:10 slot:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 19)
  {
    int v3 = objc_opt_class();
  }
  else if (a3 == 10)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCloudrakerFace;
    int v3 = -[NTKCloudrakerFace _optionClassForCustomEditMode:](&v5, "_optionClassForCustomEditMode:");
  }
  else
  {
    int v3 = 0;
  }

  return (Class)v3;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKCloudrakerFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKCloudrakerFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_super v5 = -[NTKCloudrakerFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKCloudrakerFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKCloudrakerFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKCloudrakerFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (id)_complicationSlotDescriptors
{
  v10[0] = NTKComplicationSlotTopLeft;
  v2 = NTKAllSignatureCircularTypes();
  int v3 = NTKComplicationSlotDescriptor();
  v11[0] = v3;
  v10[1] = NTKComplicationSlotCenter;
  BOOL v4 = NTKAllSignatureRectangularTypes();
  objc_super v5 = NTKComplicationSlotDescriptor();
  v11[1] = v5;
  v10[2] = NTKComplicationSlotBottom;
  id v6 = NTKAllSignatureRectangularTypes();
  id v7 = NTKComplicationSlotDescriptor();
  v11[2] = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

- (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotCenter;
  v4[2] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotCenter;
  v5[2] = NTKComplicationSlotBottom;
  int v3 = +[NSArray arrayWithObjects:v5 count:3];

  return v3;
}

@end