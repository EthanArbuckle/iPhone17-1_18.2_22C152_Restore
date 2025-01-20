@interface CalCalendarConstraints
+ (id)_bundle;
+ (id)_strippedConstraintsNameForStoredConstraintsName:(id)a3;
+ (id)backwardsCompatibleConstraintsPathForName:(id)a3;
+ (id)constraintsURLForName:(id)a3;
@end

@implementation CalCalendarConstraints

+ (id)constraintsURLForName:(id)a3
{
  id v4 = a3;
  v5 = [a1 _strippedConstraintsNameForStoredConstraintsName:v4];
  if (!v5
    || ([a1 _bundle],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 URLForResource:v5 withExtension:@"plist"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if ([v4 isAbsolutePath]
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 fileExistsAtPath:v4],
          v8,
          v9))
    {
      v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)backwardsCompatibleConstraintsPathForName:(id)a3
{
  uint64_t v4 = backwardsCompatibleConstraintsPathForName__onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&backwardsCompatibleConstraintsPathForName__onceToken, &__block_literal_global_28);
  }
  v6 = [a1 _strippedConstraintsNameForStoredConstraintsName:v5];

  v7 = [(id)backwardsCompatibleConstraintsPathForName__map objectForKeyedSubscript:v6];

  return v7;
}

void __68__CalCalendarConstraints_backwardsCompatibleConstraintsPathForName___block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  v2[0] = @"CalDAVCalendarConstraints";
  v2[1] = @"CalDAVCalendarConstraintsNoComments";
  v3[0] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraints.plist";
  v3[1] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraintsNoComments.plist";
  v2[2] = @"CalDAVCalendarConstraintsNoSchedule";
  v2[3] = @"CalDAVCalendarConstraintsNoScheduleNoComments";
  v3[2] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraintsNoSchedule.plist";
  v3[3] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraintsNoScheduleNoComments.plist";
  v2[4] = @"FutureLimitedCalDAVCalendarConstraints";
  v2[5] = @"FutureLimitedCalDAVCalendarConstraintsNoComments";
  v3[4] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraints.plist";
  v3[5] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraintsNoComments.plist";
  v2[6] = @"FutureLimitedCalDAVCalendarConstraintsNoSchedule";
  v2[7] = @"FutureLimitedCalDAVCalendarConstraintsNoScheduleNoComments";
  v3[6] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraintsNoSchedule.plist";
  v3[7] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraintsNoScheduleNoComments.plist";
  v2[8] = @"EAS12CalendarConstraints";
  v2[9] = @"EAS14CalendarConstraints";
  v3[8] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS12CalendarConstraints.plist";
  v3[9] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS14CalendarConstraints.plist";
  v2[10] = @"EAS16CalendarConstraints";
  v2[11] = @"EAS161CalendarConstraints";
  v3[10] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS16CalendarConstraints.plist";
  v3[11] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS161CalendarConstraints.plist";
  v2[12] = @"EAS25CalendarConstraints";
  v2[13] = @"SubCalCalendarConstraints";
  v3[12] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS25CalendarConstraints.plist";
  v3[13] = @"/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DASubCal.framework/SubCalCalendarConstraints.plist";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:14];
  v1 = (void *)backwardsCompatibleConstraintsPathForName__map;
  backwardsCompatibleConstraintsPathForName__map = v0;
}

+ (id)_strippedConstraintsNameForStoredConstraintsName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if ([v3 isAbsolutePath])
  {
    uint64_t v4 = [v3 lastPathComponent];
  }
  if ([v4 hasSuffix:@".plist"])
  {
    uint64_t v5 = [v4 stringByDeletingPathExtension];

    uint64_t v4 = (void *)v5;
  }

  return v4;
}

+ (id)_bundle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CalCalendarConstraints__bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundle_onceToken != -1) {
    dispatch_once(&_bundle_onceToken, block);
  }
  v2 = (void *)_bundle_bundle;

  return v2;
}

uint64_t __33__CalCalendarConstraints__bundle__block_invoke(uint64_t a1)
{
  _bundle_bundle = [MEMORY[0x1E4F28B50] bundleForClass:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

@end