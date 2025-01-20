@interface TPSCallForwardingStrings
+ (NSBundle)classBundle;
+ (NSString)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
@end

@implementation TPSCallForwardingStrings

+ (NSBundle)classBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

+ (NSString)localizationTableName
{
  return (NSString *)@"CallForwarding";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 classBundle];
  v6 = [a1 localizationTableName];
  v7 = [v5 localizedStringForKey:v4 value:&stru_8250 table:v6];

  return v7;
}

@end