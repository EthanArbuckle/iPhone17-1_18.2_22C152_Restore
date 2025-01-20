@interface NTKTimelapseFace
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationMigrationPaths;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)faceDescription;
- (id)faceSharingName;
- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKTimelapseFace

- (int64_t)timeStyle
{
  return 1;
}

+ (id)_complicationSlotDescriptors
{
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v10[0] = NTKComplicationSlotTopRight;
  v4 = NTKComplicationTypeRankedListWithDefaultTypes();
  v5 = NTKComplicationSlotDescriptor();
  v11[0] = v5;
  v10[1] = NTKComplicationSlotBottom;
  v6 = NTKComplicationTypeRankedListWithDefaultTypes();
  v7 = NTKComplicationSlotDescriptor();
  v11[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
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

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:NTKComplicationSlotTopRight])
  {
    CFStringRef v4 = @"TOP";
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

- (id)_customEditModes
{
  return &off_10BA8;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  CFStringRef v4 = [(NTKTimelapseFace *)self device];
  unsigned int v5 = +[NTKTimelapseThemeEditOption optionWithTimelapseTheme:0 forDevice:v4];

  return v5;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    CFStringRef v4 = objc_msgSend(@"EDIT_MODE_LABEL_TIMELAPSE_CONTENT", "stringByAppendingString:", @"_COMPANION", a4);
    unsigned int v5 = [@"Timelapse" stringByAppendingString:@"-Companion"];
    v6 = +[NTKTimelapseFaceBundle localizedStringForKey:v4 table:v5 comment:@"Location"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)faceSharingName
{
  return +[NTKTimelapseFaceBundle localizedStringForKey:@"TIMELAPSE_IN_TITLE_CASE" table:@"Timelapse" comment:@"Timelapse"];
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  CFStringRef v4 = [(NTKTimelapseFace *)self device];
  id v5 = +[NTKTimelapseThemeEditOption numberOfOptionsForDevice:v4];

  return (unint64_t)v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v6 = [(NTKTimelapseFace *)self device];
  v7 = +[NTKTimelapseThemeEditOption optionAtIndex:a3 forDevice:v6];

  return v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v6 = a3;
  v7 = [(NTKTimelapseFace *)self device];
  id v8 = +[NTKTimelapseThemeEditOption indexOfOption:v6 forDevice:v7];

  return (unint64_t)v8;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKTimelapseFace;
  if (-[NTKTimelapseFace _snapshotContext:isStaleRelativeToContext:](&v10, "_snapshotContext:isStaleRelativeToContext:", v6, v7)|| ![v6 calendarDateMatchesContext:v7])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    unsigned int v8 = [v6 localeMatchesContext:v7] ^ 1;
  }

  return v8;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 12)
  {
    CFStringRef v4 = objc_opt_class();
  }
  else
  {
    CFStringRef v4 = 0;
  }
  return (Class)v4;
}

- (id)faceDescription
{
  return +[NTKTimelapseFaceBundle localizedStringForKey:@"TIMELAPSE_DESCRIPTION" table:@"Timelapse" comment:@"Timelapse description"];
}

- (int64_t)_editModeForOldEncodingIndex:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return 12;
  }
}

- (id)_complicationMigrationPaths
{
  v4[0] = @"top-right-above";
  v4[1] = @"bottom-right-long";
  v5[0] = NTKComplicationSlotTopRight;
  v5[1] = NTKComplicationSlotBottom;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

@end