@interface NTKActivityAnalogFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
+ (id)richComplicationSlotsForDevice:(id)a3;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
@end

@implementation NTKActivityAnalogFace

- (id)faceSharingName
{
  return +[NTKActivityAnalogFaceBundle localizedStringForKey:@"FACE_STYLE_ACTIVITY_ANALOG_IN_TITLE_CASE" comment:@"Activity Analog"];
}

- (id)_faceDescription
{
  if (NTKIsWheelchairUser()) {
    CFStringRef v2 = @"FACE_STYLE_ACTIVITY_ANALOG_ROLL_DESCRIPTION";
  }
  else {
    CFStringRef v2 = @"FACE_STYLE_ACTIVITY_ANALOG_STAND_DESCRIPTION";
  }

  return +[NTKActivityAnalogFaceBundle localizedStringForKey:v2 comment:@"description"];
}

+ (id)_complicationSlotDescriptors
{
  CFStringRef v2 = NTKAllSmallComplicationTypes();
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
  CFStringRef v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

+ (id)richComplicationSlotsForDevice:(id)a3
{
  v5[0] = NTKComplicationSlotTopLeft;
  v5[1] = NTKComplicationSlotTopRight;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return v3;
}

- (id)_customEditModes
{
  return &off_21AD0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    v7 = [(NTKActivityAnalogFace *)self device];
    uint64_t v8 = +[NTKFaceColorEditOption optionWithFaceColor:7 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 11)
  {
    v7 = [(NTKActivityAnalogFace *)self device];
    uint64_t v8 = +[NTKActivityAnalogDensityEditOption optionWithDensity:1 forDevice:v7];
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
  v5 = -[NTKActivityAnalogFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKActivityAnalogFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKActivityAnalogFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKActivityAnalogFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKActivityAnalogFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKActivityAnalogFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
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

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  if ((unint64_t)a4 > 7) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_19D20[a4];
  }
  id v6 = [(NTKActivityAnalogFace *)self device];
  id v7 = +[NTKFaceColorEditOption optionWithFaceColor:v5 forDevice:v6];
  id v11 = [v7 pigmentEditOption];

  [(NTKActivityAnalogFace *)self selectOption:v11 forCustomEditMode:10 slot:0];
  uint64_t v8 = +[NTKComplication anyComplicationOfType:10];
  [(NTKActivityAnalogFace *)self setComplication:v8 forSlot:NTKComplicationSlotTopLeft];
  v9 = +[NTKComplication anyComplicationOfType:18];

  [(NTKActivityAnalogFace *)self setComplication:v9 forSlot:NTKComplicationSlotTopRight];
  id v10 = +[NTKComplication anyComplicationOfType:10];

  [(NTKActivityAnalogFace *)self setComplication:v10 forSlot:NTKComplicationSlotBottomCenter];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"activityAnalog";
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  int64_t v3 = 10;
  if (a3 != 1) {
    int64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return 11;
  }
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end