@interface NTKSquallFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (BOOL)supportsPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_faceDescription;
- (id)_faceDescriptionKey;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKSquallFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  if ([v3 collectionType] == (char *)&dword_4 + 1) {
    char v5 = 0;
  }
  else {
    char v5 = NTKShowHardwareSpecificFaces() ^ 1;
  }
  LOBYTE(v6) = 1;
  if ([v3 deviceCategory] == &dword_4 && ((v4 ^ 1) & 1) == 0 && (v5 & 1) == 0)
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DAB81146-4105-445B-94AD-14033A199AC4"];
    unsigned int v6 = [v3 supportsCapability:v7] ^ 1;
  }
  return v6;
}

- (id)faceSharingName
{
  return +[NTKSquallFaceBundle localizedStringForKey:@"FACE_STYLE_SQUALL_IN_TITLE_CASE" comment:@"Squall"];
}

- (id)_complicationSlotDescriptors
{
  return &__NSDictionary0__struct;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  return 0;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return 0;
}

+ (id)_orderedComplicationSlots
{
  return &__NSArray0__struct;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  return &__NSArray0__struct;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKSquallFace;
  id v3 = [(NTKSquallFace *)&v5 _localizedNameForComplicationSlot:a3];

  return v3;
}

- (id)_customEditModes
{
  return &off_C998;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10)
  {
    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }
  return (Class)v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_super v5 = -[NTKSquallFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  unsigned int v6 = [(NTKSquallFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSquallFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKSquallFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKSquallFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKSquallFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKSquallFace;
  int v4 = objc_msgSendSuper2(&v6, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);

  return v4;
}

- (id)_faceDescriptionKey
{
  return @"FACE_STYLE_SQUALL_DESCRIPTION";
}

- (id)_faceDescription
{
  v2 = [(NTKSquallFace *)self _faceDescriptionKey];
  uint64_t v3 = +[NTKSquallFaceBundle localizedStringForKey:v2 comment:&stru_C580];

  return v3;
}

+ (id)pigmentFaceDomain
{
  return @"squall";
}

- (BOOL)supportsPigmentEditOption
{
  return 1;
}

- (BOOL)requiresPigmentEditOption
{
  return 1;
}

@end