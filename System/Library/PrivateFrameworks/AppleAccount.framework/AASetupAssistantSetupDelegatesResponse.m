@interface AASetupAssistantSetupDelegatesResponse
- (NSDictionary)responseParameters;
- (NSNumber)status;
- (NSString)dsid;
- (NSString)statusMessage;
- (id)responseParametersForServiceIdentifier:(id)a3;
@end

@implementation AASetupAssistantSetupDelegatesResponse

- (NSNumber)status
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantCreateStatusKey];

  return (NSNumber *)v3;
}

- (NSString)statusMessage
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantCreateStatusMessageKey];

  return (NSString *)v3;
}

- (NSDictionary)responseParameters
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantResponseParametersKey];

  return (NSDictionary *)v3;
}

- (id)responseParametersForServiceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AASetupAssistantSetupDelegatesResponse *)self responseParameters];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSString)dsid
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantDSIDKey];

  return (NSString *)v3;
}

@end