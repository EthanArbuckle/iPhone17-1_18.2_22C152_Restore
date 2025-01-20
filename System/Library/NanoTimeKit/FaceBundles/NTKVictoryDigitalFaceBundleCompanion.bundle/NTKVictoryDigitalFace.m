@interface NTKVictoryDigitalFace
+ (BOOL)isRestrictedForDevice:(id)a3;
+ (BOOL)usesCircularMedium;
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (int64_t)preferredComplicationFamilyForComplication:(id)a3 withSlot:(id)a4;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKVictoryDigitalFace

- (int64_t)timeStyle
{
  return 1;
}

- (id)faceSharingName
{
  return +[NTKVictoryDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_VICTORY_DIGITAL_IN_TITLE_CASE" comment:@"Victory Digital"];
}

- (id)_faceDescription
{
  return +[NTKVictoryDigitalFaceBundle localizedStringForKey:@"FACE_STYLE_VICTORY_DIGITAL_DESCRIPTION" comment:@"face description"];
}

+ (BOOL)isRestrictedForDevice:(id)a3
{
  return NTKShowVictoryFaces() ^ 1;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllCircularMediumComplicationTypes();
  v3 = NTKAllUtilityLargeComplicationTypes();
  v12[0] = NTKComplicationSlot1;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v13[0] = v5;
  v12[1] = NTKComplicationSlot2;
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v7 = NTKComplicationSlotDescriptor();
  v13[1] = v7;
  v12[2] = NTKComplicationSlotBottom;
  v8 = NTKComplicationTypeRankedListWithDefaultTypes();
  v9 = NTKComplicationSlotDescriptor();
  v13[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlot1;
  v4[1] = NTKComplicationSlot2;
  v4[2] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:NTKComplicationSlot1])
  {
    CFStringRef v4 = @"MIDDLE_LEFT";
  }
  else if ([v3 isEqualToString:NTKComplicationSlot2])
  {
    CFStringRef v4 = @"BOTTOM_LEFT";
  }
  else
  {
    unsigned int v5 = [v3 isEqualToString:NTKComplicationSlotBottom];
    CFStringRef v4 = @"BOTTOM";
    if (!v5) {
      CFStringRef v4 = 0;
    }
  }
  v6 = +[NSString stringWithFormat:@"SLOT_LABEL_%@", v4];
  v7 = NTKClockFaceLocalizedString();

  return v7;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", NTKComplicationSlotBottom, a4))
  {
    CFStringRef v4 = +[NTKVictoryAppLauncher complication];
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return v4;
}

- (id)_customEditModes
{
  return &off_10EE8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 13)
  {
    v7 = [(NTKVictoryDigitalFace *)self device];
    uint64_t v8 = +[NTKVictoryDigitalStyleEditOption optionWithStyle:3 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 10)
  {
    v7 = [(NTKVictoryDigitalFace *)self device];
    uint64_t v8 = +[NTKVictoryDigitalColorEditOption optionWithVictoryColor:2 forDevice:v7];
LABEL_5:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 13;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 13)
  {
    CFStringRef v4 = objc_msgSend(@"EDIT_MODE_LABEL_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    unsigned int v5 = NTKCompanionClockFaceLocalizedString();
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKVictoryDigitalFace;
    unsigned int v5 = objc_msgSendSuper2(&v7, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v5;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKVictoryDigitalFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKVictoryDigitalFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  unsigned int v5 = -[NTKVictoryDigitalFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKVictoryDigitalFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKVictoryDigitalFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKVictoryDigitalFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 10 || a3 == 13)
  {
    CFStringRef v4 = objc_opt_class();
  }
  else
  {
    CFStringRef v4 = 0;
  }
  return (Class)v4;
}

+ (BOOL)usesCircularMedium
{
  return 1;
}

- (int64_t)preferredComplicationFamilyForComplication:(id)a3 withSlot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() usesCircularMedium]
    && (([v7 isEqualToString:NTKComplicationSlot1] & 1) != 0
     || [v7 isEqualToString:NTKComplicationSlot2]))
  {
    id v8 = (id)CLKComplicationFamilyCircularMedium;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKVictoryDigitalFace;
    id v8 = [(NTKVictoryDigitalFace *)&v10 preferredComplicationFamilyForComplication:v6 withSlot:v7];
  }

  return (int64_t)v8;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return +[NTKVictoryDigitalColorEditOption domain];
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
    return 13;
  }
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end