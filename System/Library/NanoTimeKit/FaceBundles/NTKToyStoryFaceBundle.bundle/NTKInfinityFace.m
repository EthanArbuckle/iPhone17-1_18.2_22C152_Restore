@interface NTKInfinityFace
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescription;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceSharingName;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKInfinityFace

- (int64_t)timeStyle
{
  return 1;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v9[0] = NTKComplicationSlotTopRight;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v10[0] = v5;
  v9[1] = NTKComplicationSlotBottom;
  v6 = NTKComplicationSlotDescriptor();
  v10[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return NTKComplicationSlotTopRight;
}

+ (id)_orderedComplicationSlots
{
  v4[0] = NTKComplicationSlotTopRight;
  v4[1] = NTKComplicationSlotBottom;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_customEditModes
{
  return &off_CF80;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  return 0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 12)
  {
    v4 = [(NTKInfinityFace *)self device];
    v5 = +[NTKInfinityStyleEditOption optionWithStyle:0 forDevice:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  return 1;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKInfinityFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKInfinityFace *)self device];
  id v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return (unint64_t)v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = [(NTKInfinityFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKInfinityFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKInfinityFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKInfinityFace *)self device];
  id v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return (unint64_t)v10;
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

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:NTKComplicationSlotDate])
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKInfinityFace;
    v5 = [(NTKInfinityFace *)&v10 _localizedNameForComplicationSlot:v4];
  }
  else
  {
    if ([v4 isEqualToString:NTKComplicationSlotTopRight])
    {
      CFStringRef v6 = @"TOP";
    }
    else
    {
      unsigned int v7 = [v4 isEqualToString:NTKComplicationSlotBottom];
      CFStringRef v6 = @"BOTTOM";
      if (!v7) {
        CFStringRef v6 = 0;
      }
    }
    v8 = +[NSString stringWithFormat:@"SLOT_LABEL_%@", v6];
    v5 = NTKClockFaceLocalizedString();
  }

  return v5;
}

- (id)faceSharingName
{
  return +[NTKToyStoryFaceBundle localizedStringForKey:@"TOY_BOX_FACE_NAME_IN_TITLE_CASE" table:@"ToyBox" comment:@"Toy Story"];
}

- (id)_faceDescription
{
  return +[NTKToyStoryFaceBundle localizedStringForKey:@"FACE_DESCRIPTION" table:@"ToyBox" comment:@"description"];
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    id v4 = objc_msgSend(@"EDIT_MODE_LABEL_INFINITY_CONTENT", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = [@"ToyBox" stringByAppendingString:@"-Companion"];
    CFStringRef v6 = +[NTKToyStoryFaceBundle localizedStringForKey:v4 table:v5 comment:@"Characters"];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___NTKInfinityFace;
    CFStringRef v6 = objc_msgSendSuper2(&v8, "_localizedNameOverrideForCustomEditMode:forDevice:", a3, a4);
  }

  return v6;
}

@end