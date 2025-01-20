@interface AALoginDelegatesResponse
- (NSDictionary)responseParameters;
- (NSNumber)status;
- (NSString)altDSID;
- (NSString)dsid;
- (NSString)statusMessage;
- (id)augmentedResponseParametersForServiceIdentifier:(id)a3 withAppleID:(id)a4 password:(id)a5 DSID:(id)a6 altDSID:(id)a7;
- (id)responseParametersForServiceIdentifier:(id)a3;
@end

@implementation AALoginDelegatesResponse

- (NSNumber)status
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"status"];

  return (NSNumber *)v3;
}

- (NSString)statusMessage
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"status-message"];

  return (NSString *)v3;
}

- (NSDictionary)responseParameters
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"delegates"];

  return (NSDictionary *)v3;
}

- (id)responseParametersForServiceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AALoginDelegatesResponse *)self responseParameters];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSString)dsid
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"dsid"];

  return (NSString *)v3;
}

- (NSString)altDSID
{
  v2 = [(AALoginDelegatesResponse *)self responseParameters];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.mobileme"];
  id v4 = [v3 objectForKeyedSubscript:@"service-data"];
  v5 = [v4 objectForKeyedSubscript:@"appleAccountInfo"];
  v6 = [v5 objectForKeyedSubscript:@"aDsID"];

  return (NSString *)v6;
}

- (id)augmentedResponseParametersForServiceIdentifier:(id)a3 withAppleID:(id)a4 password:(id)a5 DSID:(id)a6 altDSID:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(AALoginDelegatesResponse *)self responseParametersForServiceIdentifier:a3];
  v17 = [v16 objectForKeyedSubscript:@"service-data"];
  id v18 = (id)[v17 mutableCopy];

  if (!v18) {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v19 = [v16 objectForKeyedSubscript:@"status"];

  if (v19)
  {
    v20 = [v16 objectForKeyedSubscript:@"status"];
    [v18 setObject:v20 forKeyedSubscript:@"status"];
  }
  v21 = [v16 objectForKeyedSubscript:@"status-message"];

  if (v21)
  {
    v22 = [v16 objectForKeyedSubscript:@"status-message"];
    [v18 setObject:v22 forKeyedSubscript:@"status-message"];
  }
  if (v12) {
    [v18 setObject:v12 forKeyedSubscript:@"appleIDEnteredByUser"];
  }
  if (v13) {
    [v18 setObject:v13 forKeyedSubscript:@"password"];
  }
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:@"dsid"];
  }
  if (v15) {
    [v18 setObject:v15 forKeyedSubscript:@"altDSID"];
  }
  v23 = (void *)[v18 copy];

  return v23;
}

@end