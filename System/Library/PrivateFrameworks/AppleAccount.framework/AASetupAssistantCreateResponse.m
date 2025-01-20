@interface AASetupAssistantCreateResponse
- (NSNumber)status;
- (NSString)HSAAction;
- (NSString)HSAData;
- (NSString)appleID;
- (NSString)personID;
- (NSString)statusMessage;
@end

@implementation AASetupAssistantCreateResponse

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

- (NSString)personID
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantDSIDKey];

  return (NSString *)v3;
}

- (NSString)appleID
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:AASetupAssistantCreateAppleIDKey];

  return (NSString *)v3;
}

- (NSString)HSAAction
{
  return self->_HSAAction;
}

- (NSString)HSAData
{
  return self->_HSAData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HSAData, 0);

  objc_storeStrong((id *)&self->_HSAAction, 0);
}

@end