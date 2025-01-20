@interface GKAuthenticateCredential
+ (id)secureCodedPropertyKeys;
- (GKAuthenticateCredential)init;
- (NSString)accountName;
- (NSString)authenticationToken;
- (NSString)playerID;
- (void)setAccountName:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setPlayerID:(id)a3;
@end

@implementation GKAuthenticateCredential

- (GKAuthenticateCredential)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKAuthenticateCredential;
  return [(GKAuthenticateCredential *)&v3 init];
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_277 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_277, &__block_literal_global_279);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_276;

  return v2;
}

void __51__GKAuthenticateCredential_secureCodedPropertyKeys__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v0 setObject:objc_opt_class() forKey:@"authenticationToken"];
  [v0 setObject:objc_opt_class() forKey:@"accountName"];
  [v0 setObject:objc_opt_class() forKey:@"playerID"];
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_276;
  secureCodedPropertyKeys_sSecureCodedKeys_276 = (uint64_t)v0;
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);

  objc_storeStrong((id *)&self->_authenticationToken, 0);
}

@end