@interface NTKSecretariatFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (id)_customEditModes;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKSecretariatFace

+ (BOOL)isRestrictedForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 deviceCategory] == (char *)&dword_0 + 1
    || [v3 deviceCategory] == &dword_4
    || (id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"], v5 = objc_msgSend(v3, "supportsCapability:", v4), v4, !v5))
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
  return +[NTKSecretariatFaceBundle localizedStringForKey:@"SECRETARIAT_FACE_NAME" comment:@"Secretariat"];
}

- (id)_faceDescription
{
  return +[NTKSecretariatFaceBundle localizedStringForKey:@"SECRETARIAT_FACE_DESCRIPTION" comment:@"description"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllSignatureCircularTypes();
  id v3 = NTKComplicationTypeRankedListWithDefaultTypes();
  id v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9[0] = NTKComplicationSlotTopLeft;
  unsigned int v5 = NTKComplicationSlotDescriptor();
  v10[0] = v5;
  v9[1] = NTKComplicationSlotTopRight;
  int v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopLeft;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  return objc_msgSend(a1, "_orderedComplicationSlots", a3);
}

+ (id)pigmentFaceDomain
{
  return @"secretariat";
}

- (id)_customEditModes
{
  return &off_3F990;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKSecretariatFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  int v6 = [(NTKSecretariatFace *)self device];
  id v7 = [v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = [(NTKSecretariatFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKSecretariatFace *)self device];
  id v10 = [v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKSecretariatFace *)self _optionClassForCustomEditMode:a4];
  id v8 = [(NTKSecretariatFace *)self device];
  v9 = [v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

@end