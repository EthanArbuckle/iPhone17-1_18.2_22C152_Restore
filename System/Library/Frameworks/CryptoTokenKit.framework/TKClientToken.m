@interface TKClientToken
+ (NSArray)builtinTokenIDs;
- (BOOL)_testing_noAutomaticReconnect;
- (NSString)tokenID;
- (NSXPCListenerEndpoint)SEPKeyEndpoint;
- (NSXPCListenerEndpoint)configurationEndpoint;
- (NSXPCListenerEndpoint)endpoint;
- (NSXPCListenerEndpoint)watcherEndpoint;
- (TKClientToken)initWithTokenID:(id)a3;
- (TKClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5;
- (id)_initWithTokenID:(id)a3;
- (id)sessionWithLAContext:(id)a3 error:(id *)a4;
- (void)set_testing_noAutomaticReconnect:(BOOL)a3;
@end

@implementation TKClientToken

- (TKClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = +[TKSEPClientToken handlesTokenID:v10];
  v12 = off_1E63C7B98;
  if (v11) {
    v12 = off_1E63C7BA8;
  }
  v13 = (TKClientToken *)[objc_alloc(*v12) initWithTokenID:v10 serverEndpoint:v9 targetUID:v8];

  return v13;
}

- (id)_initWithTokenID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKClientToken;
  v6 = [(TKClientToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tokenID, a3);
  }

  return v7;
}

- (TKClientToken)initWithTokenID:(id)a3
{
  return [(TKClientToken *)self initWithTokenID:a3 serverEndpoint:0 targetUID:0];
}

- (id)sessionWithLAContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [TKClientTokenSession alloc];
  id v8 = [(TKClientTokenSession *)v7 initWithToken:self LAContext:v6 parameters:MEMORY[0x1E4F1CC08] error:a4];

  return v8;
}

+ (NSArray)builtinTokenIDs
{
  v2 = +[TKSEPClientToken builtinTokenIDs];
  v3 = +[TKExtensionClientToken builtinTokenIDs];
  v4 = [v2 arrayByAddingObjectsFromArray:v3];

  return (NSArray *)v4;
}

- (NSString)tokenID
{
  return self->_tokenID;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCListenerEndpoint)configurationEndpoint
{
  return self->_configurationEndpoint;
}

- (NSXPCListenerEndpoint)watcherEndpoint
{
  return self->_watcherEndpoint;
}

- (NSXPCListenerEndpoint)SEPKeyEndpoint
{
  return self->_SEPKeyEndpoint;
}

- (BOOL)_testing_noAutomaticReconnect
{
  return self->__testing_noAutomaticReconnect;
}

- (void)set_testing_noAutomaticReconnect:(BOOL)a3
{
  self->__testing_noAutomaticReconnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SEPKeyEndpoint, 0);
  objc_storeStrong((id *)&self->_watcherEndpoint, 0);
  objc_storeStrong((id *)&self->_configurationEndpoint, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_tokenID, 0);
}

@end