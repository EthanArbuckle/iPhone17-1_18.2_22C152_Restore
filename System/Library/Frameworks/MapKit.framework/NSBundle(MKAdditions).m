@interface NSBundle(MKAdditions)
+ (id)_mapkitBundle;
+ (uint64_t)_mapkit_shouldShowAppleLogo;
- (id)_mapkit_localizedStringForKey:()MKAdditions value:table:;
@end

@implementation NSBundle(MKAdditions)

- (id)_mapkit_localizedStringForKey:()MKAdditions value:table:
{
  v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (objc_msgSend(v8, "_navigation_isRunningInSiri")) {
    [a1 siriUILocalizedStringForKey:v11 value:v10 table:v9];
  }
  else {
  v12 = [a1 localizedStringForKey:v11 value:v10 table:v9];
  }

  return v12;
}

+ (id)_mapkitBundle
{
  if (qword_1EB315EC8 != -1) {
    dispatch_once(&qword_1EB315EC8, &__block_literal_global_171);
  }
  v0 = (void *)qword_1EB315EC0;

  return v0;
}

+ (uint64_t)_mapkit_shouldShowAppleLogo
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  v2 = [v1 lowercaseString];

  if (([v2 isEqualToString:@"com.apple.mapkit.private.remoteui"] & 1) != 0
    || ![v2 hasPrefix:@"com.apple."])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 hasPrefix:@"com.apple.mapkittest"];
  }

  return v3;
}

@end