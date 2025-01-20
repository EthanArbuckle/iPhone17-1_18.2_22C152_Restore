@interface NTKRenegadeFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKRenegadeFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B0EC13E2-AEB5-4CBE-9821-37ADCA5FB0DA"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5 ^ 1;
}

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKRenegadeFaceBundle localizedStringForKey:@"FACE_STYLE_RENEGADE_IN_TITLE_CASE" comment:@"Renegade"];
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
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
  v4[0] = NTKComplicationSlotDate;
  v4[1] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilityLargeNarrowComplicationTypes();
  v9[0] = NTKComplicationSlotDate;
  id v3 = NTKWrappedDateComplicationType();
  id v4 = NTKComplicationSlotDescriptor();
  v10[0] = v4;
  v9[1] = NTKComplicationSlotBottom;
  unsigned __int8 v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotDate])
  {
    uint64_t v5 = NTKClockFaceLocalizedString();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRenegadeFace;
    uint64_t v5 = [(NTKRenegadeFace *)&v8 _localizedNameForComplicationSlot:v4];
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_customEditModes
{
  return &off_10C48;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = [(NTKRenegadeFace *)self device];
  if (a3 == 10)
  {
    v6 = +[NTKRenegadeColorEditOption optionWithRenegadeColor:1 forDevice:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKRenegadeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKRenegadeFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKRenegadeFace *)self _optionClassForCustomEditMode:a4];
  objc_super v8 = [(NTKRenegadeFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  objc_super v8 = [(NTKRenegadeFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKRenegadeFace *)self device];
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
  return @"FACE_STYLE_RENEGADE_DETAIL_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKRenegadeFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKRenegadeFaceBundle localizedStringForKey:v2 comment:&stru_10818];

  return v3;
}

@end