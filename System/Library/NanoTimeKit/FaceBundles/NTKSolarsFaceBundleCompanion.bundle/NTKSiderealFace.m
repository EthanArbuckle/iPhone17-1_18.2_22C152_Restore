@interface NTKSiderealFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
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
- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
@end

@implementation NTKSiderealFace

- (int64_t)timeStyle
{
  v2 = [(NTKSiderealFace *)self selectedOptionForCustomEditMode:15 slot:0];
  int64_t v3 = [v2 style] != 0;

  return v3;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NTKSiderealFace *)self selectedOptionForCustomEditMode:a4 slot:v9];
  v13.receiver = self;
  v13.super_class = (Class)NTKSiderealFace;
  [(NTKSiderealFace *)&v13 selectOption:v8 forCustomEditMode:a4 slot:v9];

  if (a4 == 15 && (NTKEqualObjects() & 1) == 0)
  {
    id v11 = v10;
    id v12 = [v8 style];
    if (v12 != [v11 style]) {
      [(NTKSiderealFace *)self _notifyObserversFaceTimeStyleChanged];
    }
  }
}

- (id)_faceDescriptionKey
{
  v2 = [(NTKSiderealFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  if ([v2 supportsCapability:v3]) {
    v4 = @"FACE_STYLE_SOLAR_DIAL_DESCRIPTION_LIGHTHOUSE";
  }
  else {
    v4 = @"FACE_STYLE_SOLAR_DIAL_DESCRIPTION";
  }
  v5 = v4;

  return v5;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return [a3 deviceCategory] == (char *)&dword_0 + 1;
}

- (id)_faceDescription
{
  v2 = [(NTKSiderealFace *)self _faceDescriptionKey];
  id v3 = +[NTKSolarDialFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKSolarDialFaceBundle localizedStringForKey:@"FACE_STYLE_SOLAR_DIAL_IN_TITLE_CASE" comment:@"Solar Dial"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSignatureCornerTypes();
  id v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v13[0] = NTKComplicationSlotTopLeft;
  v7 = NTKComplicationSlotDescriptor();
  v14[0] = v7;
  v13[1] = NTKComplicationSlotTopRight;
  id v8 = NTKComplicationSlotDescriptor();
  v14[1] = v8;
  v13[2] = NTKComplicationSlotBottomLeft;
  id v9 = NTKComplicationSlotDescriptor();
  v14[2] = v9;
  v13[3] = NTKComplicationSlotBottomRight;
  v10 = NTKComplicationSlotDescriptor();
  v14[3] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", NTKComplicationSlotTopLeft, a4))
  {
    v4 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationNoiseBundleIdentifier appBundleIdentifier:NTKBundleComplicationNoiseAppBundleIdentifier complicationDescriptor:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomLeft;
  v4[3] = NTKComplicationSlotBottomRight;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (id)_customEditModes
{
  return &off_2DF98;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    v4 = [(NTKSiderealFace *)self device];
    v5 = +[NTKSiderealTimeStyleEditOption optionWithStyle:0 forDevice:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKSiderealFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKSiderealFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSiderealFace *)self _optionClassForCustomEditMode:a4];
  id v8 = [(NTKSiderealFace *)self device];
  id v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = [(NTKSiderealFace *)self _optionClassForCustomEditMode:a4];
  id v9 = [(NTKSiderealFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
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

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotTopRight;
  v5[2] = NTKComplicationSlotBottomLeft;
  v5[3] = NTKComplicationSlotBottomRight;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:4];

  return v3;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    v4 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKSiderealFace;
    v4 = objc_msgSendSuper2(&v6, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v4;
}

@end