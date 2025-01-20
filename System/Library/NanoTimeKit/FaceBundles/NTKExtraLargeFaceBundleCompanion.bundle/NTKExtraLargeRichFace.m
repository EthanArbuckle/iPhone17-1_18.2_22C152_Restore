@interface NTKExtraLargeRichFace
+ (id)_complicationSlotDescriptors;
+ (id)_richComplicationSlotsForDevice:(id)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultBackgroundOption;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)pigmentOptionProvider;
@end

@implementation NTKExtraLargeRichFace

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllGraphicExtraLargeComplicationTypes();
  v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKMultiFamilyComplicationSlotDescriptor();

  uint64_t v7 = NTKComplicationSlotCenter;
  v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  uint64_t v5 = NTKComplicationSlotCenter;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)pigmentOptionProvider
{
  pigmentEditOptionProvider = self->_pigmentEditOptionProvider;
  if (!pigmentEditOptionProvider)
  {
    v4 = [(id)objc_opt_class() pigmentFaceDomain];
    uint64_t v5 = [(NTKExtraLargeRichFace *)self device];
    int v6 = NTKShowGossamerUI();

    if (v6)
    {
      uint64_t v7 = [v4 stringByAppendingString:@"-Gossamer"];

      v4 = (void *)v7;
    }
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = (NTKPigmentEditOptionProvider *)[objc_alloc((Class)NTKPigmentEditOptionProvider) initWithDomain:v4 bundle:v8];
    v10 = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = v9;

    pigmentEditOptionProvider = self->_pigmentEditOptionProvider;
  }

  return pigmentEditOptionProvider;
}

- (id)_customEditModes
{
  v3 = [(NTKExtraLargeRichFace *)self device];
  int v4 = NTKShowGossamerUI();

  if (v4)
  {
    uint64_t v5 = [(NTKExtraLargeRichFace *)self device];
    int v6 = NTKShowIndicScriptNumerals();

    if (v6) {
      uint64_t v7 = &off_10AA8;
    }
    else {
      uint64_t v7 = &off_10AC0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKExtraLargeRichFace;
    uint64_t v7 = [(NTKExtraLargeFace *)&v9 _customEditModes];
  }

  return v7;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 19:
      CLKLocaleNumberSystemForFirstLanguage();
      uint64_t v8 = NTKNumeralOptionFromCLKLocaleNumberSystem();
      objc_super v9 = [(NTKExtraLargeRichFace *)self device];
      v10 = +[NTKNumeralEditOption optionWithNumeral:v8 forDevice:v9];

      goto LABEL_9;
    case 17:
      uint64_t v7 = [(NTKExtraLargeRichFace *)self _defaultBackgroundOption];
      goto LABEL_7;
    case 10:
      v12.receiver = self;
      v12.super_class = (Class)NTKExtraLargeRichFace;
      uint64_t v7 = [(NTKExtraLargeFace *)&v12 _defaultOptionForCustomEditMode:10 slot:v6];
LABEL_7:
      v10 = (void *)v7;
      goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)_defaultBackgroundOption
{
  v2 = [(NTKExtraLargeRichFace *)self device];
  v3 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:0 forDevice:v2];

  return v3;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 19 || a3 == 17)
  {
    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }
  return (Class)v4;
}

- (void).cxx_destruct
{
}

@end