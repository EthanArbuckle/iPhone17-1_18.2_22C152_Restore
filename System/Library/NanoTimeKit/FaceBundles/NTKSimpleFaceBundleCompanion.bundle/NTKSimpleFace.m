@interface NTKSimpleFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (BOOL)_wantsUnadornedSnapshot;
- (BOOL)complicationExistenceInvalidatesSnapshot;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKSimpleFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_SIMPLE_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKSimpleFace *)self _faceDescriptionKey];
  v3 = +[NTKSimpleFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

- (id)faceSharingName
{
  return +[NTKSimpleFaceBundle localizedStringForKey:@"SIMPLE_FACE_NAME_IN_TITLE_CASE" comment:@"Simple"];
}

- (id)_customEditModes
{
  return &off_CAD8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 11)
  {
    v9 = [(NTKSimpleFace *)self device];
    uint64_t v10 = +[NTKDensityEditOption optionWithDensity:3 forDevice:v9];
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    v7 = [(NTKSimpleFace *)self device];
    uint64_t v8 = NTKDefaultFaceColorForDeviceCollection();

    v9 = [(NTKSimpleFace *)self device];
    uint64_t v10 = +[NTKFaceColorUtilitarianEditOption optionWithFaceColor:v8 forDevice:v9];
LABEL_5:
    v11 = (void *)v10;

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKSimpleFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKSimpleFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSimpleFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKSimpleFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKSimpleFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKSimpleFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (BOOL)_wantsUnadornedSnapshot
{
  return 1;
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 1;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 11)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallComplicationTypes();
  v15[0] = NTKComplicationSlotTopLeft;
  v14 = NTKComplicationTypeRankedListWithDefaultTypes();
  v13 = NTKComplicationSlotDescriptor();
  v16[0] = v13;
  v15[1] = NTKComplicationSlotTopRight;
  uint64_t v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v4 = NTKComplicationSlotDescriptor();
  v16[1] = v4;
  v15[2] = NTKComplicationSlotBottomLeft;
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v6 = NTKComplicationSlotDescriptor();
  v16[2] = v6;
  v15[3] = NTKComplicationSlotBottomRight;
  id v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  uint64_t v8 = NTKComplicationSlotDescriptor();
  v16[3] = v8;
  v15[4] = NTKComplicationSlotDate;
  v9 = NTKWrappedDateComplicationType();
  id v10 = NTKComplicationSlotDescriptor();
  v16[4] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  return v11;
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
  return 4;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotDate;
  v4[3] = NTKComplicationSlotBottomLeft;
  v4[4] = NTKComplicationSlotBottomRight;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"simple";
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end