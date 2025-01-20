@interface BLSHInternalTapToRadarIgnorer
+ (BOOL)hasIgnoredDesignations;
+ (BOOL)shouldIgnoreDesignation:(unint64_t)a3;
+ (id)_defaults;
+ (id)_ignoredDesignations;
+ (void)ignoreRadarDesignation:(unint64_t)a3;
+ (void)resetIgnoredDesignations;
@end

@implementation BLSHInternalTapToRadarIgnorer

+ (id)_defaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  }
  v5 = v4;

  return v5;
}

+ (id)_ignoredDesignations
{
  v2 = [a1 _defaults];
  v3 = [v2 arrayForKey:@"IgnoredTapToRadarDesignations"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v4;

  return v5;
}

+ (void)ignoreRadarDesignation:(unint64_t)a3
{
  id v9 = [a1 _ignoredDesignations];
  id v5 = [MEMORY[0x263EFF9C0] setWithArray:v9];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 addObject:v6];

  v7 = [a1 _defaults];
  v8 = [v5 allObjects];
  [v7 setObject:v8 forKey:@"IgnoredTapToRadarDesignations"];
}

+ (BOOL)shouldIgnoreDesignation:(unint64_t)a3
{
  id v4 = [a1 _ignoredDesignations];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  if ([v4 containsObject:v5]) {
    char v6 = 1;
  }
  else {
    char v6 = [v4 containsObject:&unk_26D191600];
  }

  return v6;
}

+ (BOOL)hasIgnoredDesignations
{
  v2 = [a1 _ignoredDesignations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (void)resetIgnoredDesignations
{
  id v2 = [a1 _defaults];
  [v2 removeObjectForKey:@"IgnoredTapToRadarDesignations"];
}

@end