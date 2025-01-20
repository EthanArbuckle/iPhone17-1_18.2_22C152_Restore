@interface SBDataMigratorDefaults
- (SBDataMigratorDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBDataMigratorDefaults

- (SBDataMigratorDefaults)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBDataMigratorDefaults;
  return (SBDataMigratorDefaults *)[(SBDataMigratorDefaults *)&v3 _initWithDomain:@"com.apple.springboard.datamigrator"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = +[NSString stringWithUTF8String:"lastSystemBuildVersion"];
  [(SBDataMigratorDefaults *)self _bindProperty:v3 withDefaultKey:@"lastBuildVersion" toDefaultValue:0 options:1];
}

@end