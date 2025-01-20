@interface CHLocalization
+ (NSBundle)classBundle;
+ (NSString)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
@end

@implementation CHLocalization

+ (NSBundle)classBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (NSBundle *)[v2 bundleForClass:v3];
}

+ (NSString)localizationTableName
{
  return (NSString *)@"CallHistory";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 classBundle];
  v6 = [a1 localizationTableName];
  v7 = [v5 localizedStringForKey:v4 value:&stru_1F129F488 table:v6];

  return v7;
}

@end