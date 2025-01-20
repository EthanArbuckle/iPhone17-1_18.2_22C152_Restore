@interface NTKPoodleFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKPoodleFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1
    || (id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D5DDA3E7-8863-48E3-95C7-3C65C5E31718"], v5 = objc_msgSend(v3, "supportsCapability:", v4), v4, !v5))
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
  return +[NTKPoodleFaceBundle localizedStringForKey:@"FACE_STYLE_POODLE_IN_TITLE_CASE" comment:@"Poodle"];
}

- (id)_complicationSlotDescriptors
{
  long long v19 = xmmword_336C0;
  uint64_t v20 = 5;
  uint64_t v2 = +[NSIndexSet indexSetWithIndexes:&v19 count:3];
  id v3 = NTKAllSignatureCornerTypes();
  v16 = NTKComplicationTypeRankedListWithDefaultTypes();
  v15 = NTKComplicationTypeRankedListWithDefaultTypes();
  v14 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v17[0] = NTKComplicationSlotTopLeft;
  unsigned int v5 = NTKComplicationSlotDescriptor();
  v18[0] = v5;
  v17[1] = NTKComplicationSlotTopRight;
  int v6 = NTKComplicationSlotDescriptor();
  v18[1] = v6;
  v17[2] = NTKComplicationSlotBottomLeft;
  v7 = NTKComplicationSlotDescriptor();
  v18[2] = v7;
  v17[3] = NTKComplicationSlotBottomRight;
  v8 = NTKComplicationSlotDescriptor();
  v18[3] = v8;
  v17[4] = NTKComplicationSlotBottom;
  v9 = NTKComplicationTypeRankedListWithDefaultTypes();
  v10 = (void *)v2;
  v11 = NTKComplicationSlotDescriptor();
  v18[4] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  return v12;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", NTKComplicationSlotTopRight, a4))
  {
    id v4 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationNoiseBundleIdentifier appBundleIdentifier:NTKBundleComplicationNoiseAppBundleIdentifier complicationDescriptor:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBottom])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKPoodleFace;
    uint64_t v5 = [(NTKPoodleFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  int v6 = (void *)v5;

  return v6;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v4[4] = NTKComplicationSlotBottom;
  uint64_t v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotTopRight;
  v5[2] = NTKComplicationSlotBottomLeft;
  v5[3] = NTKComplicationSlotBottomRight;
  v5[4] = NTKComplicationSlotBottom;
  id v3 = +[NSArray arrayWithObjects:v5 count:5];

  return v3;
}

- (id)_customEditModes
{
  return &off_3F948;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = [(NTKPoodleFace *)self device];
  if (a3 == 10)
  {
    int v6 = +[NTKPoodleColorEditOption optionWithPoodleColor:0 forDevice:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKPoodleFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  int v6 = [(NTKPoodleFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKPoodleFace *)self _optionClassForCustomEditMode:a4];
  objc_super v8 = [(NTKPoodleFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  objc_super v8 = [(NTKPoodleFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKPoodleFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10)
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
  return @"FACE_STYLE_POODLE_DESCRIPTION";
}

- (id)_faceDescription
{
  uint64_t v2 = [(NTKPoodleFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKPoodleFaceBundle localizedStringForKey:v2 comment:&stru_3D3C0];

  return v3;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKPoodleColorEditOption domain];
}

@end