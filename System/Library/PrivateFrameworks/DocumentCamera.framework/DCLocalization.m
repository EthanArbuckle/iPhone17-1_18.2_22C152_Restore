@interface DCLocalization
+ (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5;
@end

@implementation DCLocalization

+ (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  v7 = (void *)MEMORY[0x263F086E0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:v10 value:v9 table:v8];

  return v12;
}

@end