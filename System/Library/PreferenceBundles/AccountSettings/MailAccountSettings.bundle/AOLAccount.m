@interface AOLAccount
+ (BOOL)setupIsAutomated;
+ (id)descriptionPlaceholder;
+ (id)userInfoForAccountTopLevelSpecifier;
+ (int)advancedSpecifiersOptions;
+ (void)getRemoveOptionTitles:(id *)a3 values:(id *)a4 defaultValue:(id *)a5;
@end

@implementation AOLAccount

+ (int)advancedSpecifiersOptions
{
  return 51;
}

+ (BOOL)setupIsAutomated
{
  return 1;
}

+ (id)descriptionPlaceholder
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"AOL_ACCOUNT_DESCRIPTION_PLACEHOLDER" value:&stru_B9F70 table:@"AccountPreferences"];

  return v3;
}

+ (id)userInfoForAccountTopLevelSpecifier
{
  v4 = [a1 hostname];

  if (!v4)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"AccountPreferences_AOL.m" lineNumber:32 description:@"Expected all AOL accounts to have a single hostname defined by the class"];
  }
  v5 = NSStringFromClass((Class)a1);
  v6 = +[NSDictionary dictionaryWithObjectsAndKeys:a1, @"class", v5, @"chosenType", 0];

  return v6;
}

+ (void)getRemoveOptionTitles:(id *)a3 values:(id *)a4 defaultValue:(id *)a5
{
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"REMOVE_AFTER_ONE_DAY" value:&stru_B9F70 table:@"AccountPreferences"];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"REMOVE_AFTER_ONE_WEEK" value:&stru_B9F70 table:@"AccountPreferences"];
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, v11, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = +[NSArray arrayWithObjects:@"1", @"7", 0];
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = @"7";
  }
}

@end