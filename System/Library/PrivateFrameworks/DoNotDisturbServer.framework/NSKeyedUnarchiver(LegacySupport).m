@interface NSKeyedUnarchiver(LegacySupport)
+ (id)dnds_secureLegacyUnarchiverForReadingFromData:()LegacySupport error:;
@end

@implementation NSKeyedUnarchiver(LegacySupport)

+ (id)dnds_secureLegacyUnarchiverForReadingFromData:()LegacySupport error:
{
  v5 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:a4];

  [v7 setClass:objc_opt_class() forClassName:@"BBBehaviorOverride"];
  [v7 setClass:objc_opt_class() forClassName:@"BBBehaviorOverrideEffectiveInterval"];
  return v7;
}

@end