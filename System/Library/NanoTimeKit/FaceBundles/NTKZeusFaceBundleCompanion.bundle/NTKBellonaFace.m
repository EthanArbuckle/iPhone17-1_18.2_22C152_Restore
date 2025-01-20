@interface NTKBellonaFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_dateComplicationSlotForDevice:(id)a3;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKBellonaFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] != (char *)&dword_0 + 1
    && _os_feature_enabled_impl()
    && (id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"], v5 = objc_msgSend(v3, "supportsCapability:", v4), v4, v5))
  {
    if ([v3 collectionType] == (char *)&dword_4 + 1) {
      LOBYTE(v6) = 0;
    }
    else {
      int v6 = NTKShowHardwareSpecificFaces() ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)faceSharingName
{
  return +[NTKBellonaFaceBundle localizedStringForKey:@"BELLONA_FACE_NAME" comment:@"Bellona"];
}

- (id)_faceDescription
{
  return +[NTKBellonaFaceBundle localizedStringForKey:@"BELLONA_FACE_DESCRIPTION" comment:@"description"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSignatureCircularTypes();
  id v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9[0] = NTKComplicationSlotBottomCenter;
  id v4 = NTKComplicationSlotDescriptor();
  v9[1] = NTKComplicationSlotDate;
  v10[0] = v4;
  unsigned int v5 = NTKWrappedDateComplicationType();
  int v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    id v6 = objc_msgSend(objc_alloc((Class)NTKPigmentEditOption), "initWithOptionName:collectionName:", @"beton", @"zeus.fall2024", v4);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotBottomCenter;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotBottomCenter;
  v4[1] = NTKComplicationSlotDate;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  return objc_msgSend(a1, "_orderedComplicationSlots", a3);
}

+ (unint64_t)_dateComplicationSlotSupportedStylesForDevice:(id)a3
{
  return 4;
}

+ (id)_dateComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotDate;
}

+ (id)pigmentFaceDomain
{
  return @"bellona";
}

- (id)_customEditModes
{
  return &off_3FB40;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKBellonaFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKBellonaFace *)self device];
  id v7 = [v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = [(NTKBellonaFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKBellonaFace *)self device];
  id v10 = [v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKBellonaFace *)self _optionClassForCustomEditMode:a4];
  id v8 = [(NTKBellonaFace *)self device];
  v9 = [v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

@end