@interface NTKExtraLargeFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)_complication:(id)a3 appearsInDailySnapshotForSlot:(id)a4;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
@end

@implementation NTKExtraLargeFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKExtraLargeFaceBundle localizedStringForKey:@"EXTRA_LARGE_FACE_NAME_IN_TITLE_CASE" comment:@"X-Large"];
}

- (id)_faceDescription
{
  return +[NTKExtraLargeFaceBundle localizedStringForKey:@"EXTRA_LARGE_FACE_DESCRIPTION" comment:@"description"];
}

+ (id)_complicationSlotDescriptors
{
  v2 = +[CLKDevice currentDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"63DBFE2B-B226-4EF1-AFBB-43E4CCE6A43E"];
  if ([v2 supportsCapability:v3])
  {
    v4 = +[CLKDevice currentDevice];
    v5 = (char *)[v4 deviceCategory];

    if (v5 != (unsigned char *)&dword_0 + 1)
    {
      v6 = NTKAllGraphicExtraLargeComplicationTypes();
      v7 = NTKComplicationTypeRankedListWithDefaultTypes();
      uint64_t v8 = NTKMultiFamilyComplicationSlotDescriptor();
      goto LABEL_6;
    }
  }
  else
  {
  }
  v6 = NTKAllExtraLargeComplicationTypes();
  v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  uint64_t v8 = NTKComplicationSlotDescriptor();
LABEL_6:
  v9 = (void *)v8;

  uint64_t v12 = NTKComplicationSlotCenter;
  v13 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  return v10;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  uint64_t v5 = NTKComplicationSlotCenter;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotCenter;
}

+ (id)_orderedComplicationSlots
{
  uint64_t v4 = NTKComplicationSlotCenter;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  return (id)_NTKClockFaceLocalizedString(@"SLOT_LABEL_CENTER", @"Middle", a3);
}

- (id)_customEditModes
{
  return &off_10A60;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = [(NTKExtraLargeFace *)self device];
  uint64_t v6 = NTKDefaultFaceColorForDeviceCollection();

  v7 = [(NTKExtraLargeFace *)self device];
  uint64_t v8 = +[NTKFaceColorModularEditOption optionWithFaceColor:v6 forDevice:v7];

  return v8;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  uint64_t v5 = -[NTKExtraLargeFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  uint64_t v6 = [(NTKExtraLargeFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKExtraLargeFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKExtraLargeFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKExtraLargeFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKExtraLargeFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKExtraLargeFace;
  if ([(NTKExtraLargeFace *)&v10 _snapshotContext:v6 isStaleRelativeToContext:v7])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    unsigned int v8 = [v6 enhanceTextLegibilityEnabledMatchesContext:v7] ^ 1;
  }

  return v8;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 17)
  {
    uint64_t v4 = objc_opt_class();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)_complication:(id)a3 appearsInDailySnapshotForSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 complicationType])
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKExtraLargeFace;
    BOOL v8 = [(NTKExtraLargeFace *)&v10 _complication:v6 appearsInDailySnapshotForSlot:v7];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_CF78[a4];
  }
  id v6 = [(NTKExtraLargeFace *)self device];
  id v8 = +[NTKFaceColorModularEditOption optionWithFaceColor:v5 forDevice:v6];

  id v7 = [v8 pigmentEditOption];
  [(NTKExtraLargeFace *)self selectOption:v7 forCustomEditMode:10 slot:0];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return NTKColorPaletteDomainExtraLarge;
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return 10;
  }
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end