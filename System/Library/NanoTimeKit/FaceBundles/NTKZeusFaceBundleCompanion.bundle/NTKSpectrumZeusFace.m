@interface NTKSpectrumZeusFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
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

@implementation NTKSpectrumZeusFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isZeusBlack] && objc_msgSend(v3, "deviceCategory") != (char *)&dword_0 + 1) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = NTKShowHardwareSpecificFaces() ^ 1;
  }

  return v4;
}

- (id)faceSharingName
{
  return +[NTKZeusSpectrumFaceBundle localizedStringForKey:@"FACE_STYLE_ZEUS_SPECTRUM_IN_TITLE_CASE" comment:@"name"];
}

+ (id)_complicationSlotDescriptors
{
  long long v9 = xmmword_33848;
  uint64_t v10 = 5;
  v2 = +[NSIndexSet indexSetWithIndexes:&v9 count:3];
  uint64_t v7 = NTKComplicationSlotBottom;
  id v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  int v4 = NTKComplicationSlotDescriptor();
  v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotBottom;
}

+ (id)_orderedComplicationSlots
{
  uint64_t v4 = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  return (id)NTKClockFaceLocalizedString();
}

- (id)_customEditModes
{
  return &off_3FAE0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 15)
  {
    uint64_t v4 = [(NTKSpectrumZeusFace *)self device];
    v5 = +[NTKSpectrumStyleEditOption optionWithStyle:2 forDevice:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKSpectrumZeusFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKSpectrumZeusFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSpectrumZeusFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKSpectrumZeusFace *)self device];
  long long v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKSpectrumZeusFace *)self _optionClassForCustomEditMode:a4];
  long long v9 = [(NTKSpectrumZeusFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_ZEUS_SPECTRUM_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKSpectrumZeusFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKZeusSpectrumFaceBundle localizedStringForKey:v2 comment:&stru_3D3C0];

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"spectrumZeus";
}

@end