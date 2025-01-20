@interface NTKWhistlerDigitalFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultBackgroundOption;
- (id)_defaultColorOption;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (id)pigmentOptionProvider;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKWhistlerDigitalFace

- (int64_t)timeStyle
{
  return 1;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return [a3 deviceCategory] == (char *)&dword_0 + 1;
}

- (id)faceSharingName
{
  v2 = [(NTKWhistlerDigitalFace *)self device];
  int v3 = NTKShowBlueRidgeUI();

  if (v3)
  {
    v4 = [@"FACE_NAME_IN_TITLE_CASE" stringByAppendingString:@"_KINCAID"];
  }
  else
  {
    v4 = @"FACE_NAME_IN_TITLE_CASE";
  }
  v5 = +[NTKInfographModularFaceBundle localizedStringForKey:v4 table:@"InfographModular" comment:@"Infograph Modular"];

  return v5;
}

- (id)_faceDescription
{
  v2 = [(NTKWhistlerDigitalFace *)self device];
  int v3 = NTKShowBlueRidgeUI();

  if (v3)
  {
    v4 = [@"FACE_DESCRIPTION" stringByAppendingString:@"_KINCAID"];
  }
  else
  {
    v4 = @"FACE_DESCRIPTION";
  }
  v5 = +[NTKInfographModularFaceBundle localizedStringForKey:v4 table:@"InfographModular" comment:@"description"];

  return v5;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSignatureCircularTypes();
  uint64_t v3 = NTKAllSignatureRectangularTypes();
  v4 = +[CLKDevice currentDevice];
  unsigned int v5 = [v4 isTinker];

  v22 = (void *)v3;
  if (v5)
  {
    v25[0] = NTKComplicationSlotTopLeft;
    v21 = NTKComplicationTypeRankedListWithDefaultTypes();
    v20 = NTKComplicationSlotDescriptor();
    v26[0] = v20;
    v25[1] = NTKComplicationSlotBottomLeft;
    v19 = NTKComplicationTypeRankedListWithDefaultTypes();
    v18 = NTKComplicationSlotDescriptor();
    v26[1] = v18;
    v25[2] = NTKComplicationSlotBottomCenter;
    v6 = NTKComplicationTypeRankedListWithDefaultTypes();
    v7 = NTKComplicationSlotDescriptor();
    v26[2] = v7;
    v25[3] = NTKComplicationSlotBottomRight;
    v8 = NTKComplicationTypeRankedListWithDefaultTypes();
    v9 = NTKComplicationSlotDescriptor();
    v26[3] = v9;
    v25[4] = NTKComplicationSlotCenter;
    v10 = NTKComplicationTypeRankedListWithDefaultTypes();
    v11 = NTKComplicationSlotDescriptor();
    v26[4] = v11;
    v25[5] = NTKComplicationSlotDate;
    v12 = NTKWrappedDateComplicationType();
    v13 = NTKComplicationSlotDescriptor();
    v26[5] = v13;
    v14 = v26;
    v15 = v25;
  }
  else
  {
    v23[0] = NTKComplicationSlotTopLeft;
    v21 = NTKComplicationTypeRankedListWithDefaultTypes();
    v20 = NTKComplicationSlotDescriptor();
    v24[0] = v20;
    v23[1] = NTKComplicationSlotBottomLeft;
    v19 = NTKComplicationTypeRankedListWithDefaultTypes();
    v18 = NTKComplicationSlotDescriptor();
    v24[1] = v18;
    v23[2] = NTKComplicationSlotBottomCenter;
    v6 = NTKComplicationTypeRankedListWithDefaultTypes();
    v7 = NTKComplicationSlotDescriptor();
    v24[2] = v7;
    v23[3] = NTKComplicationSlotBottomRight;
    v8 = NTKComplicationTypeRankedListWithDefaultTypes();
    v9 = NTKComplicationSlotDescriptor();
    v24[3] = v9;
    v23[4] = NTKComplicationSlotCenter;
    v10 = NTKComplicationTypeRankedListWithDefaultTypes();
    v11 = NTKComplicationSlotDescriptor();
    v24[4] = v11;
    v23[5] = NTKComplicationSlotDate;
    v12 = NTKWrappedDateComplicationType();
    v13 = NTKComplicationSlotDescriptor();
    v24[5] = v13;
    v14 = v24;
    v15 = v23;
  }
  v16 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:6];

  return v16;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isRunningGraceOrLater])
  {
    if ([v5 isEqualToString:NTKComplicationSlotCenter])
    {
      v7 = &NTKBundleComplicationNoiseAppBundleIdentifier;
      v8 = &NTKBundleComplicationNoiseBundleIdentifier;
LABEL_7:
      v9 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:*v8 appBundleIdentifier:*v7 complicationDescriptor:0];
      goto LABEL_9;
    }
    if ([v5 isEqualToString:NTKComplicationSlotBottomCenter]
      && [v6 supportsUrsa])
    {
      v7 = &NTKBundleComplicationUrsaAppBundleIdentifier;
      v8 = &NTKBundleComplicationUrsaCompassBundleIdentifier;
      goto LABEL_7;
    }
  }
  v9 = 0;
LABEL_9:

  return v9;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotCenter;
}

+ (id)_dateComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
}

+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3
{
  return 8;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotDate;
  v4[2] = NTKComplicationSlotCenter;
  v4[3] = NTKComplicationSlotBottomLeft;
  v4[4] = NTKComplicationSlotBottomCenter;
  v4[5] = NTKComplicationSlotBottomRight;
  v2 = +[NSArray arrayWithObjects:v4 count:6];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotBottomLeft;
  v5[2] = NTKComplicationSlotBottomCenter;
  v5[3] = NTKComplicationSlotBottomRight;
  v5[4] = NTKComplicationSlotCenter;
  uint64_t v3 = +[NSArray arrayWithObjects:v5 count:5];

  return v3;
}

- (id)_customEditModes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(NTKWhistlerDigitalFace *)self device];
  int v5 = NTKShowGossamerUI();

  if (v5) {
    [v3 addObject:&off_12540];
  }
  id v6 = [(NTKWhistlerDigitalFace *)self device];
  int v7 = NTKShowIndicScriptNumerals();

  if (v7) {
    [v3 addObject:&off_12558];
  }
  [v3 addObject:&off_12570];

  return v3;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 19:
      CLKLocaleNumberSystemForFirstLanguage();
      uint64_t v8 = NTKNumeralOptionFromCLKLocaleNumberSystem();
      v9 = [(NTKWhistlerDigitalFace *)self device];
      v10 = +[NTKNumeralEditOption optionWithNumeral:v8 forDevice:v9];

      goto LABEL_9;
    case 17:
      uint64_t v7 = [(NTKWhistlerDigitalFace *)self _defaultBackgroundOption];
      goto LABEL_7;
    case 10:
      uint64_t v7 = [(NTKWhistlerDigitalFace *)self _defaultColorOption];
LABEL_7:
      v10 = (void *)v7;
      goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  int v5 = -[NTKWhistlerDigitalFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKWhistlerDigitalFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKWhistlerDigitalFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKWhistlerDigitalFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKWhistlerDigitalFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKWhistlerDigitalFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 19 || a3 == 17)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)_defaultColorOption
{
  uint64_t v3 = [(NTKWhistlerDigitalFace *)self device];
  uint64_t v4 = NTKDefaultFaceColorForDeviceCollection();

  int v5 = [(NTKWhistlerDigitalFace *)self device];
  id v6 = +[NTKFaceColorMonochromeEditOption optionWithFaceColor:v4 forDevice:v5];

  return v6;
}

- (id)_defaultBackgroundOption
{
  v2 = [(NTKWhistlerDigitalFace *)self device];
  uint64_t v3 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:0 forDevice:v2];

  return v3;
}

- (id)pigmentOptionProvider
{
  uint64_t v3 = [(NTKWhistlerDigitalFace *)self device];
  int v4 = NTKShowGossamerUI();

  if (self->_isGossamerPigmentEditOptionProvider != v4)
  {
    pigmentEditOptionProvider = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = 0;
  }
  id v6 = self->_pigmentEditOptionProvider;
  if (!v6)
  {
    self->_isGossamerPigmentEditOptionProvider = v4;
    id v7 = [(id)objc_opt_class() pigmentFaceDomain];
    uint64_t v8 = v7;
    if (self->_isGossamerPigmentEditOptionProvider)
    {
      uint64_t v9 = [v7 stringByAppendingString:@"-Gossamer"];

      uint64_t v8 = (void *)v9;
    }
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = (NTKPigmentEditOptionProvider *)[objc_alloc((Class)NTKPigmentEditOptionProvider) initWithDomain:v8 bundle:v10];
    v12 = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = v11;

    id v6 = self->_pigmentEditOptionProvider;
  }

  return v6;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotBottomCenter]
    || [v4 isEqualToString:NTKComplicationSlotDate])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKWhistlerDigitalFace;
    uint64_t v5 = [(NTKWhistlerDigitalFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainInfographModular;
}

- (void).cxx_destruct
{
}

@end