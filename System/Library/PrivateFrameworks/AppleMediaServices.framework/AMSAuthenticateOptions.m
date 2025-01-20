@interface AMSAuthenticateOptions
+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 home:(id)a4;
+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 homeIdentifier:(id)a4;
+ (id)amsd_multiUserAuthenticateOptionsWithAppProvidedData:(id)a3;
@end

@implementation AMSAuthenticateOptions

+ (id)amsd_multiUserAuthenticateOptionsWithAppProvidedData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAuthenticationType:1];
  [v5 setAppProvidedContext:@"mu"];
  [v5 setAppProvidedData:v4];

  return v5;
}

+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 identifier];
  v9 = objc_msgSend(a1, "amsd_createAppProvidedDataWithMultiUserAction:homeIdentifier:", v7, v8);

  LODWORD(v7) = [v6 isCurrentUserOwner];
  if (v7) {
    CFStringRef v10 = @"owner";
  }
  else {
    CFStringRef v10 = @"participant";
  }
  [v9 setObject:v10 forKeyedSubscript:@"role"];
  return v9;
}

+ (id)amsd_createAppProvidedDataWithMultiUserAction:(id)a3 homeIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObject:v6 forKeyedSubscript:@"action"];

  [v7 setObject:@"home" forKeyedSubscript:@"context"];
  v8 = [v5 UUIDString];

  objc_msgSend(v7, "ams_setNullableObject:forKey:", v8, @"homeId");
  return v7;
}

@end