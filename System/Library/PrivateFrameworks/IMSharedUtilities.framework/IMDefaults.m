@interface IMDefaults
+ (id)sharedInstance;
- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4;
- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4 defaultValue:(BOOL)a5;
- (id)getValueFromDomain:(id)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forDomain:(id)a4 forKey:(id)a5;
- (void)setValue:(id)a3 forDomain:(id)a4 forKey:(id)a5;
@end

@implementation IMDefaults

- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4
{
  return IMGetDomainBoolForKey();
}

- (id)getValueFromDomain:(id)a3 forKey:(id)a4
{
  return (id)IMGetCachedDomainValueForKey();
}

+ (id)sharedInstance
{
  if (qword_1EB4A6560 != -1) {
    dispatch_once(&qword_1EB4A6560, &unk_1EF2BF020);
  }
  return (id)qword_1EB4A6500;
}

- (void)setValue:(id)a3 forDomain:(id)a4 forKey:(id)a5
{
}

- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4 defaultValue:(BOOL)a5
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (void)setBool:(BOOL)a3 forDomain:(id)a4 forKey:(id)a5
{
}

@end