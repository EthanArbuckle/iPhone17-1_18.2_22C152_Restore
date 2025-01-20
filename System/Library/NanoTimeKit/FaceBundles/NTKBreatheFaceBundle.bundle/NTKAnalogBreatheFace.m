@interface NTKAnalogBreatheFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceDescription;
- (id)faceSharingName;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKAnalogBreatheFace

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallComplicationTypes();
  v3 = NTKAllUtilityLargeComplicationTypes();
  v12[0] = NTKComplicationSlotTopLeft;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v13[0] = v5;
  v12[1] = NTKComplicationSlotTopRight;
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v7 = NTKComplicationSlotDescriptor();
  v13[1] = v7;
  v12[2] = NTKComplicationSlotBottomCenter;
  v8 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9 = NTKComplicationSlotDescriptor();
  v13[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

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

- (id)_customEditModes
{
  return &off_8C68;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 12)
  {
    v5 = [(NTKAnalogBreatheFace *)self device];
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    unsigned int v7 = [v5 supportsCapability:v6];

    v8 = [(NTKAnalogBreatheFace *)self device];
    if (v7) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = +[NTKBreatheVideoStyleEditOption optionWithStyle:v9 forDevice:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  return 1;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKAnalogBreatheFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v9 = [(NTKAnalogBreatheFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKAnalogBreatheFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKAnalogBreatheFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKAnalogBreatheFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKAnalogBreatheFace *)self device];
  uint64_t v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 12)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (id)faceSharingName
{
  return +[NTKBreatheFaceBundle localizedStringForKey:@"BREATHE_FACE_NAME_IN_TITLE_CASE" table:@"Breathe" comment:@"BREATHE"];
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    v4 = objc_msgSend(@"EDIT_MODE_LABEL_DENSITY", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)faceDescription
{
  v2 = [(NTKAnalogBreatheFace *)self device];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned int v4 = [v2 supportsCapability:v3];

  if (v4)
  {
    v5 = [@"BREATHE_GALLERY_DESCRIPTION" stringByAppendingString:@"_2021"];
  }
  else
  {
    v5 = @"BREATHE_GALLERY_DESCRIPTION";
  }
  id v6 = [@"Breathe" stringByAppendingString:@"-Companion"];
  id v7 = +[NTKBreatheFaceBundle localizedStringForKey:v5 table:v6 comment:@"Breathe description"];

  return v7;
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end