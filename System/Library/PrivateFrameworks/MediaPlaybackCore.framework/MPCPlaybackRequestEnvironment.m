@interface MPCPlaybackRequestEnvironment
+ (BOOL)supportsSecureCoding;
+ (MPCPlaybackRequestEnvironment)activeAccountRequestEnvironment;
+ (MPCPlaybackRequestEnvironment)requestEnvironmentWithUserIdentity:(id)a3;
+ (id)payloadValueFromJSONValue:(id)a3;
- (ICUserIdentity)userIdentity;
- (MPCPlaybackDelegationProperties)delegationProperties;
- (MPCPlaybackRequestEnvironment)init;
- (MPCPlaybackRequestEnvironment)initWithCoder:(id)a3;
- (MPCPlaybackRequestEnvironment)initWithUserIdentity:(id)a3;
- (NSString)clientIdentifier;
- (NSString)clientVersion;
- (NSString)description;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (id)_copyWithPlaybackRequestEnvironmentClass:(Class)a3;
- (id)_createMusicKitRequestContext;
- (id)_createStoreRequestContext;
- (id)mpc_jsonValue;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)rectifiedPlaybackRequestEnvironmentWithReasons:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPCPlaybackRequestEnvironment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __59__MPCPlaybackRequestEnvironment__createStoreRequestContext__block_invoke(void *a1, void *a2)
{
  id v9 = a2;
  [v9 setIdentity:*(void *)(a1[4] + 48)];
  v3 = [MEMORY[0x263F893C8] defaultIdentityStore];
  [v9 setIdentityStore:v3];

  [v9 setClientInfo:a1[5]];
  [v9 setStoreDialogResponseHandler:a1[6]];
  [v9 setAllowsExpiredBags:1];
  v4 = *(void **)(a1[4] + 24);
  if (v4)
  {
    v5 = (void *)MEMORY[0x263F893C0];
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "storeAccountID"));
    v7 = [v5 specificAccountWithDSID:v6];
    v8 = [v7 identityAllowingDelegation:1];
    [v9 setDelegatedIdentity:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_delegationProperties, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (id)_createStoreRequestContext
{
  id v3 = objc_alloc_init(MEMORY[0x263F89220]);
  [v3 setClientIdentifier:self->_clientIdentifier];
  [v3 setClientVersion:self->_clientVersion];
  [v3 setRequestingBundleIdentifier:self->_requestingBundleIdentifier];
  [v3 setRequestingBundleVersion:self->_requestingBundleVersion];
  id v4 = objc_alloc_init(MEMORY[0x263F89338]);
  [v4 setAllowsHandlingNonAuthenticationDialogs:0];
  v5 = (void *)[objc_alloc(MEMORY[0x263F89330]) initWithConfiguration:v4];
  id v6 = objc_alloc(MEMORY[0x263F89360]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__MPCPlaybackRequestEnvironment__createStoreRequestContext__block_invoke;
  v11[3] = &unk_2643C5530;
  v11[4] = self;
  id v12 = v3;
  id v13 = v5;
  id v7 = v5;
  id v8 = v3;
  id v9 = (void *)[v6 initWithBlock:v11];

  return v9;
}

+ (MPCPlaybackRequestEnvironment)requestEnvironmentWithUserIdentity:(id)a3
{
  id v3 = a3;
  id v4 = [(MPCPlaybackRequestEnvironment *)[MPCMutablePlaybackRequestEnvironment alloc] initWithUserIdentity:v3];

  return (MPCPlaybackRequestEnvironment *)v4;
}

- (id)_copyWithPlaybackRequestEnvironmentClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_clientIdentifier copy];
    id v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(NSString *)self->_clientVersion copy];
    id v8 = (void *)v4[2];
    v4[2] = v7;

    uint64_t v9 = [(MPCPlaybackDelegationProperties *)self->_delegationProperties copy];
    v10 = (void *)v4[3];
    v4[3] = v9;

    uint64_t v11 = [(NSString *)self->_requestingBundleIdentifier copy];
    id v12 = (void *)v4[4];
    v4[4] = v11;

    uint64_t v13 = [(NSString *)self->_requestingBundleVersion copy];
    v14 = (void *)v4[5];
    v4[5] = v13;

    uint64_t v15 = [(ICUserIdentity *)self->_userIdentity copy];
    v16 = (void *)v4[6];
    v4[6] = v15;
  }
  return v4;
}

- (MPCPlaybackRequestEnvironment)init
{
  id v3 = [MEMORY[0x263F893C0] activeAccount];
  id v4 = [(MPCPlaybackRequestEnvironment *)self initWithUserIdentity:v3];

  return v4;
}

- (MPCPlaybackRequestEnvironment)initWithUserIdentity:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPCPlaybackRequestEnvironment;
  id v6 = [(MPCPlaybackRequestEnvironment *)&v19 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F890C0] defaultInfo];
    uint64_t v8 = [v7 clientIdentifier];
    uint64_t v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = &stru_26CBCA930;
    }
    p_clientIdentifier = (id *)&v6->_clientIdentifier;
    objc_storeStrong((id *)&v6->_clientIdentifier, v10);

    uint64_t v12 = [v7 clientVersion];
    uint64_t v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = &stru_26CBCA930;
    }
    p_clientVersion = (void **)&v6->_clientVersion;
    objc_storeStrong((id *)&v6->_clientVersion, v14);

    objc_storeStrong((id *)&v6->_userIdentity, a3);
    if ([(NSString *)v6->_clientIdentifier isEqualToString:@"AirMusic"]
      || [*p_clientIdentifier isEqualToString:@"SonicMusic"])
    {
      id v16 = *p_clientIdentifier;
      id *p_clientIdentifier = @"Music";

      v17 = *p_clientVersion;
      *p_clientVersion = @"3.1";
    }
  }

  return v6;
}

- (id)rectifiedPlaybackRequestEnvironmentWithReasons:(id *)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = +[MPCPlaybackAccountManager sharedManager];
  id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  uint64_t v7 = (void *)[(MPCPlaybackRequestEnvironment *)self mutableCopy];
  uint64_t v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 accounts];
    *(_DWORD *)buf = 138412290;
    v47 = v9;
    _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_DEFAULT, "rectifiedPlaybackRequestEnvironmentWithReasons - Account Manager accounts: %@", buf, 0xCu);
  }
  v10 = [v7 delegationProperties];

  if (v10)
  {
    uint64_t v11 = [v7 delegationProperties];
    uint64_t quot = [v11 storeAccountID];
    uint64_t v13 = quot;
    v14 = (char *)&v50 + 1;
    do
    {
      lldiv_t v15 = lldiv(quot, 10);
      uint64_t quot = v15.quot;
      if (v15.rem >= 0) {
        LOBYTE(v16) = v15.rem;
      }
      else {
        uint64_t v16 = -v15.rem;
      }
      *(v14 - 2) = v16 + 48;
      v17 = (const UInt8 *)(v14 - 2);
      --v14;
    }
    while (v15.quot);
    if (v13 < 0)
    {
      *(v14 - 2) = 45;
      v17 = (const UInt8 *)(v14 - 2);
    }
    v18 = (__CFString *)CFStringCreateWithBytes(0, v17, (char *)&v50 - (char *)v17, 0x8000100u, 0);

    objc_super v19 = [v5 accountForDSID:v18];
    v20 = v19;
    if (v19)
    {
      if ([v19 isDelegated])
      {
LABEL_16:

        goto LABEL_17;
      }
      [v7 setDelegationProperties:0];
      v21 = [v20 userIdentity];
      [v7 setUserIdentity:v21];

      v22 = @"[promoting delegated account]";
    }
    else
    {
      [v7 setDelegationProperties:0];
      v22 = @"[delegated account missing]";
    }
    [v6 addObject:v22];
    goto LABEL_16;
  }
LABEL_17:
  v23 = [MEMORY[0x263F893C8] defaultIdentityStore];
  v24 = [v7 userIdentity];
  v25 = [v23 DSIDForUserIdentity:v24 outError:0];
  uint64_t v26 = [v25 longLongValue];

  v27 = (char *)&v50 + 1;
  uint64_t v28 = v26;
  do
  {
    lldiv_t v29 = lldiv(v28, 10);
    uint64_t v28 = v29.quot;
    if (v29.rem >= 0) {
      LOBYTE(v30) = v29.rem;
    }
    else {
      uint64_t v30 = -v29.rem;
    }
    *(v27 - 2) = v30 + 48;
    v31 = (const UInt8 *)(v27 - 2);
    --v27;
  }
  while (v29.quot);
  if (v26 < 0)
  {
    *(v27 - 2) = 45;
    v31 = (const UInt8 *)(v27 - 2);
  }
  v32 = (__CFString *)CFStringCreateWithBytes(0, v31, (char *)&v50 - (char *)v31, 0x8000100u, 0);
  v33 = [v5 accountForDSID:v32];
  v34 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v32;
    __int16 v48 = 2112;
    v49 = v33;
    _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "rectifiedPlaybackRequestEnvironmentWithReasons - Base account for DSID %@: %@", buf, 0x16u);
  }

  if (v33)
  {
    if ([v33 isDelegated])
    {
      v35 = [(MPCPlaybackDelegationProperties *)[MPCMutablePlaybackDelegationProperties alloc] initWithStoreAccountID:v26 deviceGUID:@"unknown-guid"];
      [v7 setDelegationProperties:v35];

      v36 = [MEMORY[0x263F893C0] activeAccount];
      [v7 setUserIdentity:v36];

      [v6 addObject:@"[base account is delegated]"];
    }
  }
  else
  {
    v37 = [MEMORY[0x263F893C0] activeAccount];
    [v7 setUserIdentity:v37];

    v38 = [MEMORY[0x263F893C8] defaultIdentityStore];
    v39 = [v7 userIdentity];
    id v45 = 0;
    v40 = [v38 DSIDForUserIdentity:v39 outError:&v45];
    id v41 = v45;

    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v40;
      _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_DEFAULT, "rectifiedPlaybackRequestEnvironmentWithReasons - Base account missing & replaced by activeAccount with DSID %@", buf, 0xCu);
    }

    [v6 addObject:@"[base account missing]"];
  }
  if ([v6 count])
  {
    if (a3) {
      *a3 = v6;
    }
    v43 = (void *)[v7 copy];
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (NSString)description
{
  id v3 = [(MPCPlaybackRequestEnvironment *)self delegationProperties];
  id v4 = v3;
  id v5 = NSString;
  if (v3)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeAccountID"));
    uint64_t v7 = ICCreateLoggableValueForDSID();
    uint64_t v8 = [v4 deviceName];
    uint64_t v9 = [(MPCPlaybackRequestEnvironment *)self userIdentity];
    v10 = [v5 stringWithFormat:@"<MPCPlaybackRequestEnvironment: %p [DelegateAccount: <%@> %@] underlyingUserIdentity=%@>", self, v7, v8, v9];
  }
  else
  {
    id v6 = [(MPCPlaybackRequestEnvironment *)self userIdentity];
    v10 = [v5 stringWithFormat:@"<MPCPlaybackRequestEnvironment: %p identity=%@>", self, v6];
  }

  return (NSString *)v10;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MPCPlaybackDelegationProperties)delegationProperties
{
  return self->_delegationProperties;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

+ (MPCPlaybackRequestEnvironment)activeAccountRequestEnvironment
{
  id v3 = [MEMORY[0x263F893C0] activeAccount];
  id v4 = [a1 requestEnvironmentWithUserIdentity:v3];

  return (MPCPlaybackRequestEnvironment *)v4;
}

- (MPCPlaybackRequestEnvironment)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPCPlaybackRequestEnvironment;
  id v5 = [(MPCPlaybackRequestEnvironment *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    uint64_t v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_26CBCA930;
    }
    objc_storeStrong((id *)&v5->_clientIdentifier, v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientVersion"];
    v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    else {
      uint64_t v11 = &stru_26CBCA930;
    }
    objc_storeStrong((id *)&v5->_clientVersion, v11);

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"delegationProperties"];
    delegationProperties = v5->_delegationProperties;
    v5->_delegationProperties = (MPCPlaybackDelegationProperties *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingBundleIdentifier"];
    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
    v5->_requestingBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestingBundleVersion"];
    requestingBundleVersion = v5->_requestingBundleVersion;
    v5->_requestingBundleVersion = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentity"];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v18;

    if (!v5->_userIdentity)
    {
      uint64_t v20 = [MEMORY[0x263F893C0] activeAccount];
      v21 = v5->_userIdentity;
      v5->_userIdentity = (ICUserIdentity *)v20;
    }
  }

  return v5;
}

- (id)mpc_jsonValue
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = +[MPCPlaybackAccountManager sharedManager];
  id v5 = [(MPCPlaybackRequestEnvironment *)self userIdentity];
  uint64_t v6 = [v4 accountForUserIdentity:v5];
  uint64_t v7 = [v6 hashedDSID];
  [v3 setObject:v7 forKeyedSubscript:@"user"];

  uint64_t v8 = [(MPCPlaybackRequestEnvironment *)self clientIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"clientID"];

  uint64_t v9 = [(MPCPlaybackRequestEnvironment *)self clientVersion];
  [v3 setObject:v9 forKeyedSubscript:@"clientVersion"];

  v10 = [(MPCPlaybackRequestEnvironment *)self requestingBundleIdentifier];
  [v3 setObject:v10 forKeyedSubscript:@"requestingID"];

  uint64_t v11 = [(MPCPlaybackRequestEnvironment *)self requestingBundleVersion];
  [v3 setObject:v11 forKeyedSubscript:@"requestingVersion"];

  uint64_t v12 = [(MPCPlaybackRequestEnvironment *)self delegationProperties];
  uint64_t v13 = objc_msgSend(v12, "mpc_jsonValue");
  [v3 setObject:v13 forKeyedSubscript:@"delegation"];

  return v3;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"user"];
  id v5 = +[MPCPlaybackAccountManager sharedManager];
  uint64_t v6 = [v5 accountForHashedDSID:v4];
  uint64_t v7 = [v6 userIdentity];

  uint64_t v8 = [(MPCPlaybackRequestEnvironment *)[MPCMutablePlaybackRequestEnvironment alloc] initWithUserIdentity:v7];
  uint64_t v9 = [v3 objectForKeyedSubscript:@"clientID"];
  [(MPCMutablePlaybackRequestEnvironment *)v8 setClientIdentifier:v9];

  v10 = [v3 objectForKeyedSubscript:@"clientVersion"];
  [(MPCMutablePlaybackRequestEnvironment *)v8 setClientVersion:v10];

  uint64_t v11 = [v3 objectForKeyedSubscript:@"requestingID"];
  [(MPCMutablePlaybackRequestEnvironment *)v8 setRequestingBundleIdentifier:v11];

  uint64_t v12 = [v3 objectForKeyedSubscript:@"requestingVersion"];
  [(MPCMutablePlaybackRequestEnvironment *)v8 setRequestingBundleVersion:v12];

  uint64_t v13 = [v3 objectForKeyedSubscript:@"delegation"];

  uint64_t v14 = +[MPCPlaybackDelegationProperties payloadValueFromJSONValue:v13];
  [(MPCMutablePlaybackRequestEnvironment *)v8 setDelegationProperties:v14];

  return v8;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (id)_createMusicKitRequestContext
{
  id v3 = (void *)MEMORY[0x263F890C0];
  id v4 = ICBundleIdentifierForSystemApplicationType();
  id v5 = [v3 clientInfoForMusicKitRequestWithClientIdentifier:@"com.apple.Music" clientVersion:@"1" bundleIdentifier:v4];

  id v6 = objc_alloc_init(MEMORY[0x263F89338]);
  [v6 setAllowsHandlingNonAuthenticationDialogs:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F89330]) initWithConfiguration:v6];
  id v8 = objc_alloc(MEMORY[0x263F891C0]);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__MPCPlaybackRequestEnvironment__createMusicKitRequestContext__block_invoke;
  v13[3] = &unk_2643C5558;
  id v14 = v5;
  lldiv_t v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v5;
  uint64_t v11 = (void *)[v8 initWithBlock:v13];

  return v11;
}

void __62__MPCPlaybackRequestEnvironment__createMusicKitRequestContext__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v5 = a2;
  [v5 setClientInfo:v3];
  [v5 setIdentity:*(void *)(a1[5] + 48)];
  id v4 = [MEMORY[0x263F893C8] defaultIdentityStore];
  [v5 setIdentityStore:v4];

  [v5 setStoreDialogResponseHandler:a1[6]];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(MPCPlaybackRequestEnvironment *)self _copyWithPlaybackRequestEnvironmentClass:v4];
}

- (void)encodeWithCoder:(id)a3
{
  clientIdentifier = self->_clientIdentifier;
  id v5 = a3;
  [v5 encodeObject:clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_clientVersion forKey:@"clientVersion"];
  [v5 encodeObject:self->_delegationProperties forKey:@"delegationProperties"];
  [v5 encodeObject:self->_requestingBundleIdentifier forKey:@"requestingBundleIdentifier"];
  [v5 encodeObject:self->_requestingBundleVersion forKey:@"requestingBundleVersion"];
  [v5 encodeObject:self->_userIdentity forKey:@"userIdentity"];
}

@end