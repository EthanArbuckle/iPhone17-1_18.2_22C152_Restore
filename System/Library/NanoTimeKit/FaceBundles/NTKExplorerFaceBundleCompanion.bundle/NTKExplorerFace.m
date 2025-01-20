@interface NTKExplorerFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)_wantsUnadornedSnapshot;
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

@implementation NTKExplorerFace

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_EXPLORER_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKExplorerFace *)self _faceDescriptionKey];
  v3 = +[NTKExplorerFaceBundle localizedStringForKey:v2 comment:v2];

  return v3;
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  if ([a3 isExplorer]) {
    return 0;
  }
  else {
    return NTKShowHardwareSpecificFaces() ^ 1;
  }
}

- (id)faceSharingName
{
  return +[NTKExplorerFaceBundle localizedStringForKey:@"FACE_STYLE_EXPLORER_IN_TITLE_CASE" comment:@"Explorer"];
}

- (id)_customEditModes
{
  return &off_11068;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    v7 = [(NTKExplorerFace *)self device];
    uint64_t v8 = +[NTKExplorerColorEditOption optionWithColor:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 11)
  {
    v7 = [(NTKExplorerFace *)self device];
    uint64_t v8 = +[NTKDensityEditOption optionWithDensity:3 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKExplorerFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKExplorerFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKExplorerFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKExplorerFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKExplorerFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKExplorerFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (BOOL)_wantsUnadornedSnapshot
{
  return 1;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 11 || a3 == 10)
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
  v2 = NTKAllSmallComplicationTypes();
  uint64_t v3 = NTKAllUtilityLargeComplicationTypes();
  v12[0] = NTKComplicationSlotTopLeft;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v13[0] = v5;
  v12[1] = NTKComplicationSlotTopRight;
  id v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v7 = NTKComplicationSlotDescriptor();
  v13[1] = v7;
  v12[2] = NTKComplicationSlotBottomCenter;
  uint64_t v8 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9 = NTKComplicationSlotDescriptor();
  v13[2] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomCenter;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKExplorerColorEditOption pigmentFaceDomain];
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end