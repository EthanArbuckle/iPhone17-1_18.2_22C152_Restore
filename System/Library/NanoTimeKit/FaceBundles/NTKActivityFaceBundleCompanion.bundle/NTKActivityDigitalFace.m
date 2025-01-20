@interface NTKActivityDigitalFace
+ (BOOL)_customEditModeIsShowSeconds:(int64_t)a3 forDevice:(id)a4;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKActivityDigitalFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKActivityDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_ACTIVITY_DIGITAL_IN_TITLE_CASE" comment:@"Activity Digital"];
}

- (id)_faceDescription
{
  if (NTKIsWheelchairUser()) {
    CFStringRef v2 = @"FACE_STYLE_ACTIVITY_DIGITAL_ROLL_DESCRIPTION";
  }
  else {
    CFStringRef v2 = @"FACE_STYLE_ACTIVITY_DIGITAL_STAND_DESCRIPTION";
  }

  return +[NTKActivityDigitalFaceBundle localizedStringForKey:v2 comment:@"description"];
}

+ (id)_complicationSlotDescriptors
{
  CFStringRef v2 = NTKAllUtilityLargeComplicationTypes();
  v3 = NTKAllSmallComplicationTypes();
  v11[0] = NTKComplicationSlotTopLeft;
  v4 = NTKComplicationSlotDescriptor();
  v12[0] = v4;
  v11[1] = NTKComplicationSlotTopRight;
  v5 = NTKComplicationTypeRankedListWithDefaultTypes();
  v6 = NTKComplicationSlotDescriptor();
  v12[1] = v6;
  v11[2] = NTKComplicationSlotBottomCenter;
  v7 = NTKComplicationTypeRankedListWithDefaultTypes();
  v8 = NTKComplicationSlotDescriptor();
  v12[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopLeft;
  v4[1] = NTKComplicationSlotTopRight;
  v4[2] = NTKComplicationSlotBottomCenter;
  CFStringRef v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (id)_customEditModes
{
  return &off_21BD8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 11)
  {
    v7 = [(NTKActivityDigitalFace *)self device];
    uint64_t v8 = +[NTKDigitalTimeAccuracyOption optionWithAccuracy:0 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    v7 = [(NTKActivityDigitalFace *)self device];
    uint64_t v8 = +[NTKFaceColorEditOption optionWithFaceColor:7 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

+ (BOOL)_customEditModeIsShowSeconds:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 11;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 11)
  {
    v4 = +[NTKActivityDigitalFaceBundle localizedStringForKey:@"EDIT_MODE_LABEL_ACTIVITY_DIGITAL_ACCURACY" comment:@"Show Seconds"];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKActivityDigitalFace;
    v4 = objc_msgSendSuper2(&v6, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKActivityDigitalFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  objc_super v6 = [(NTKActivityDigitalFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKActivityDigitalFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKActivityDigitalFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKActivityDigitalFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKActivityDigitalFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
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

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"activityDigital";
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