@interface NSKeyedArchiver(LegacySupport)
+ (id)dnds_secureLegacyArchiver;
@end

@implementation NSKeyedArchiver(LegacySupport)

+ (id)dnds_secureLegacyArchiver
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v0 setClassName:@"BBBehaviorOverride" forClass:objc_opt_class()];
  [v0 setClassName:@"BBBehaviorOverrideEffectiveInterval" forClass:objc_opt_class()];
  return v0;
}

@end