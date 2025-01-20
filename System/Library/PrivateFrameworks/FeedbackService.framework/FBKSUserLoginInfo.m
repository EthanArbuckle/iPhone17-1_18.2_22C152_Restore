@interface FBKSUserLoginInfo
- (BOOL)isAppleConnectLogin;
- (BOOL)isSystemAccount;
- (FBKSCustomBehavior)behavior;
- (FBKSUserLoginInfo)initWithDictionary:(id)a3;
- (NSArray)pendingConsents;
- (NSNumber)participantID;
- (NSString)deviceToken;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)username;
- (id)description;
- (void)saveDeviceTokenLookupInformation;
- (void)setBehavior:(id)a3;
- (void)setDeviceToken:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setIsAppleConnectLogin:(BOOL)a3;
- (void)setIsSystemAccount:(BOOL)a3;
- (void)setParticipantID:(id)a3;
- (void)setPendingConsents:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation FBKSUserLoginInfo

- (FBKSUserLoginInfo)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FBKSUserLoginInfo;
  v5 = [(FBKSUserLoginInfo *)&v44 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"default_email"];
    uint64_t v7 = _FBKSNilIfNSNull(v6);
    username = v5->_username;
    v5->_username = (NSString *)v7;

    v9 = [v4 objectForKeyedSubscript:@"participant_id"];
    uint64_t v10 = _FBKSNilIfNSNull(v9);
    participantID = v5->_participantID;
    v5->_participantID = (NSNumber *)v10;

    v12 = [v4 objectForKeyedSubscript:@"first_name"];
    uint64_t v13 = _FBKSNilIfNSNull(v12);
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v13;

    v15 = [v4 objectForKeyedSubscript:@"last_name"];
    uint64_t v16 = _FBKSNilIfNSNull(v15);
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v16;

    v18 = [v4 objectForKeyedSubscript:@"token"];
    uint64_t v19 = _FBKSNilIfNSNull(v18);
    deviceToken = v5->_deviceToken;
    v5->_deviceToken = (NSString *)v19;

    v5->_isSystemAccount = 0;
    v21 = [v4 objectForKeyedSubscript:@"behavior"];
    v22 = _FBKSNilIfNSNull(v21);

    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [[FBKSCustomBehavior alloc] initWithDictionary:v22];
        behavior = v5->_behavior;
        v5->_behavior = v23;
      }
    }
    v25 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    v26 = [v4 objectForKeyedSubscript:@"pending_consents"];
    v27 = _FBKSNilIfNSNull(v26);

    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v38 = v27;
        v39 = v22;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v28 = v27;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v41 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v34 = [[FBKSPendingConsent alloc] initWithDictionary:v33];
                if ([(FBKSPendingConsent *)v34 type]) {
                  [v25 addObject:v34];
                }
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v45 count:16];
          }
          while (v30);
        }

        v27 = v38;
      }
    }
    uint64_t v35 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v25, v38, v39, (void)v40);
    pendingConsents = v5->_pendingConsents;
    v5->_pendingConsents = (NSArray *)v35;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(FBKSUserLoginInfo *)self deviceToken];
  v5 = [(FBKSUserLoginInfo *)self participantID];
  v6 = [(FBKSUserLoginInfo *)self username];
  uint64_t v7 = [(FBKSUserLoginInfo *)self givenName];
  v8 = [(FBKSUserLoginInfo *)self familyName];
  v9 = [v3 stringWithFormat:@"LoginInfo: deviceToken: %@, participantID: %@, username: %@, givenName: %@, familyName: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (void)saveDeviceTokenLookupInformation
{
  v3 = +[FBKSSharedConstants sharedUserDefaults];
  id v4 = [(FBKSUserLoginInfo *)self username];
  [v3 setObject:v4 forKey:@"LastSuccessfulLogin"];

  id v6 = +[FBKSSharedConstants sharedUserDefaults];
  v5 = [(FBKSUserLoginInfo *)self participantID];
  [v6 setObject:v5 forKey:@"LastSuccessfulID"];
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setDeviceToken:(id)a3
{
}

- (NSNumber)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (FBKSCustomBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (NSArray)pendingConsents
{
  return self->_pendingConsents;
}

- (void)setPendingConsents:(id)a3
{
}

- (BOOL)isAppleConnectLogin
{
  return self->_isAppleConnectLogin;
}

- (void)setIsAppleConnectLogin:(BOOL)a3
{
  self->_isAppleConnectLogin = a3;
}

- (BOOL)isSystemAccount
{
  return self->_isSystemAccount;
}

- (void)setIsSystemAccount:(BOOL)a3
{
  self->_isSystemAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConsents, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
}

@end