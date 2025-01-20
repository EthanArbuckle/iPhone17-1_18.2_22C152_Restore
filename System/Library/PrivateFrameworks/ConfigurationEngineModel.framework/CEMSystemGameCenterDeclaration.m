@interface CEMSystemGameCenterDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowGameCenter:(id)a4 withAllowMultiplayerGaming:(id)a5 withAllowAddingGameCenterFriends:(id)a6 withAllowGameCenterNearbyMultiplayer:(id)a7 withAllowGameCenterPrivateMessaging:(id)a8 withAllowGameCenterProfilePrivacyModification:(id)a9 withAllowGameCenterProfileModification:(id)a10 withAllowedGameCenterOtherPlayerTypes:(id)a11;
+ (id)buildWithIdentifier:(id)a3 withAllowGameCenter:(id)a4 withAllowMultiplayerGaming:(id)a5 withAllowAddingGameCenterFriends:(id)a6 withAllowGameCenterNearbyMultiplayer:(id)a7 withAllowGameCenterPrivateMessaging:(id)a8 withAllowGameCenterProfilePrivacyModification:(id)a9 withAllowGameCenterProfileModification:(id)a10 withAllowedGameCenterOtherPlayerTypes:(id)a11 withAllowGameCenterFriendsSharingModification:(id)a12;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowAddingGameCenterFriends;
- (NSNumber)payloadAllowGameCenter;
- (NSNumber)payloadAllowGameCenterFriendsSharingModification;
- (NSNumber)payloadAllowGameCenterNearbyMultiplayer;
- (NSNumber)payloadAllowGameCenterPrivateMessaging;
- (NSNumber)payloadAllowGameCenterProfileModification;
- (NSNumber)payloadAllowGameCenterProfilePrivacyModification;
- (NSNumber)payloadAllowMultiplayerGaming;
- (NSNumber)payloadAllowedGameCenterOtherPlayerTypes;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowAddingGameCenterFriends:(id)a3;
- (void)setPayloadAllowGameCenter:(id)a3;
- (void)setPayloadAllowGameCenterFriendsSharingModification:(id)a3;
- (void)setPayloadAllowGameCenterNearbyMultiplayer:(id)a3;
- (void)setPayloadAllowGameCenterPrivateMessaging:(id)a3;
- (void)setPayloadAllowGameCenterProfileModification:(id)a3;
- (void)setPayloadAllowGameCenterProfilePrivacyModification:(id)a3;
- (void)setPayloadAllowMultiplayerGaming:(id)a3;
- (void)setPayloadAllowedGameCenterOtherPlayerTypes:(id)a3;
@end

@implementation CEMSystemGameCenterDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.system.gamecenter";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowGameCenter";
  v6[1] = @"allowMultiplayerGaming";
  v6[2] = @"allowAddingGameCenterFriends";
  v6[3] = @"allowGameCenterNearbyMultiplayer";
  v6[4] = @"allowGameCenterPrivateMessaging";
  v6[5] = @"allowGameCenterProfilePrivacyModification";
  v6[6] = @"allowGameCenterProfileModification";
  v6[7] = @"allowedGameCenterOtherPlayerTypes";
  v6[8] = @"allowGameCenterFriendsSharingModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowGameCenter";
  v6[1] = @"allowMultiplayerGaming";
  v6[2] = @"allowAddingGameCenterFriends";
  v6[3] = @"allowGameCenterNearbyMultiplayer";
  v6[4] = @"allowGameCenterPrivateMessaging";
  v6[5] = @"allowGameCenterProfilePrivacyModification";
  v6[6] = @"allowGameCenterProfileModification";
  v6[7] = @"allowedGameCenterOtherPlayerTypes";
  v6[8] = @"allowGameCenterFriendsSharingModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowGameCenter:(id)a4 withAllowMultiplayerGaming:(id)a5 withAllowAddingGameCenterFriends:(id)a6 withAllowGameCenterNearbyMultiplayer:(id)a7 withAllowGameCenterPrivateMessaging:(id)a8 withAllowGameCenterProfilePrivacyModification:(id)a9 withAllowGameCenterProfileModification:(id)a10 withAllowedGameCenterOtherPlayerTypes:(id)a11 withAllowGameCenterFriendsSharingModification:(id)a12
{
  id v16 = a3;
  id v40 = a12;
  id v39 = a11;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = objc_opt_new();
  [v24 setDeclarationType:@"com.apple.configuration.system.gamecenter"];
  if (v16)
  {
    [v24 setDeclarationIdentifier:v16];
  }
  else
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [v24 setDeclarationIdentifier:v26];

    id v16 = 0;
  }
  v27 = (void *)MEMORY[0x263EFFA88];
  if (v23) {
    id v28 = v23;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v24 setPayloadAllowGameCenter:v28];

  if (v22) {
    id v29 = v22;
  }
  else {
    id v29 = v27;
  }
  [v24 setPayloadAllowMultiplayerGaming:v29];

  if (v21) {
    id v30 = v21;
  }
  else {
    id v30 = v27;
  }
  [v24 setPayloadAllowAddingGameCenterFriends:v30];

  if (v20) {
    id v31 = v20;
  }
  else {
    id v31 = v27;
  }
  [v24 setPayloadAllowGameCenterNearbyMultiplayer:v31];

  if (v19) {
    id v32 = v19;
  }
  else {
    id v32 = v27;
  }
  [v24 setPayloadAllowGameCenterPrivateMessaging:v32];

  if (v18) {
    id v33 = v18;
  }
  else {
    id v33 = v27;
  }
  [v24 setPayloadAllowGameCenterProfilePrivacyModification:v33];

  if (v17) {
    id v34 = v17;
  }
  else {
    id v34 = v27;
  }
  [v24 setPayloadAllowGameCenterProfileModification:v34];

  if (v39) {
    v35 = v39;
  }
  else {
    v35 = &unk_26C894958;
  }
  [v24 setPayloadAllowedGameCenterOtherPlayerTypes:v35];

  if (v40) {
    id v36 = v40;
  }
  else {
    id v36 = v27;
  }
  [v24 setPayloadAllowGameCenterFriendsSharingModification:v36];

  [v24 updateServerHash];

  return v24;
}

+ (id)buildWithIdentifier:(id)a3 withAllowGameCenter:(id)a4 withAllowMultiplayerGaming:(id)a5 withAllowAddingGameCenterFriends:(id)a6 withAllowGameCenterNearbyMultiplayer:(id)a7 withAllowGameCenterPrivateMessaging:(id)a8 withAllowGameCenterProfilePrivacyModification:(id)a9 withAllowGameCenterProfileModification:(id)a10 withAllowedGameCenterOtherPlayerTypes:(id)a11
{
  return +[CEMSystemGameCenterDeclaration buildWithIdentifier:a3 withAllowGameCenter:a4 withAllowMultiplayerGaming:a5 withAllowAddingGameCenterFriends:a6 withAllowGameCenterNearbyMultiplayer:0 withAllowGameCenterPrivateMessaging:0 withAllowGameCenterProfilePrivacyModification:0 withAllowGameCenterProfileModification:0 withAllowedGameCenterOtherPlayerTypes:0 withAllowGameCenterFriendsSharingModification:MEMORY[0x263EFFA88]];
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.system.gamecenter"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemGameCenterDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v41 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGameCenter" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v41];
  id v14 = v41;
  payloadAllowGameCenter = self->_payloadAllowGameCenter;
  self->_payloadAllowGameCenter = v13;

  if (!v14)
  {
    id v40 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowMultiplayerGaming" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v40];
    id v14 = v40;
    payloadAllowMultiplayerGaming = self->_payloadAllowMultiplayerGaming;
    self->_payloadAllowMultiplayerGaming = v16;

    if (!v14)
    {
      id v39 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowAddingGameCenterFriends" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v39];
      id v14 = v39;
      payloadAllowAddingGameCenterFriends = self->_payloadAllowAddingGameCenterFriends;
      self->_payloadAllowAddingGameCenterFriends = v18;

      if (!v14)
      {
        id v38 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGameCenterNearbyMultiplayer" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v38];
        id v14 = v38;
        payloadAllowGameCenterNearbyMultiplayer = self->_payloadAllowGameCenterNearbyMultiplayer;
        self->_payloadAllowGameCenterNearbyMultiplayer = v20;

        if (!v14)
        {
          id v37 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGameCenterPrivateMessaging" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v37];
          id v14 = v37;
          payloadAllowGameCenterPrivateMessaging = self->_payloadAllowGameCenterPrivateMessaging;
          self->_payloadAllowGameCenterPrivateMessaging = v22;

          if (!v14)
          {
            id v36 = 0;
            v24 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGameCenterProfilePrivacyModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v36];
            id v14 = v36;
            payloadAllowGameCenterProfilePrivacyModification = self->_payloadAllowGameCenterProfilePrivacyModification;
            self->_payloadAllowGameCenterProfilePrivacyModification = v24;

            if (!v14)
            {
              id v35 = 0;
              v26 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGameCenterProfileModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v35];
              id v14 = v35;
              payloadAllowGameCenterProfileModification = self->_payloadAllowGameCenterProfileModification;
              self->_payloadAllowGameCenterProfileModification = v26;

              if (!v14)
              {
                id v34 = 0;
                id v28 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"allowedGameCenterOtherPlayerTypes" isRequired:0 defaultValue:&unk_26C894958 error:&v34];
                id v14 = v34;
                payloadAllowedGameCenterOtherPlayerTypes = self->_payloadAllowedGameCenterOtherPlayerTypes;
                self->_payloadAllowedGameCenterOtherPlayerTypes = v28;

                if (!v14)
                {
                  id v33 = 0;
                  id v30 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"allowGameCenterFriendsSharingModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v33];
                  id v14 = v33;
                  payloadAllowGameCenterFriendsSharingModification = self->_payloadAllowGameCenterFriendsSharingModification;
                  self->_payloadAllowGameCenterFriendsSharingModification = v30;
                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGameCenter" withValue:self->_payloadAllowGameCenter isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowMultiplayerGaming" withValue:self->_payloadAllowMultiplayerGaming isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowAddingGameCenterFriends" withValue:self->_payloadAllowAddingGameCenterFriends isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGameCenterNearbyMultiplayer" withValue:self->_payloadAllowGameCenterNearbyMultiplayer isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGameCenterPrivateMessaging" withValue:self->_payloadAllowGameCenterPrivateMessaging isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGameCenterProfilePrivacyModification" withValue:self->_payloadAllowGameCenterProfilePrivacyModification isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGameCenterProfileModification" withValue:self->_payloadAllowGameCenterProfileModification isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"allowedGameCenterOtherPlayerTypes" withValue:self->_payloadAllowedGameCenterOtherPlayerTypes isRequired:0 defaultValue:&unk_26C894958];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowGameCenterFriendsSharingModification" withValue:self->_payloadAllowGameCenterFriendsSharingModification isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CEMSystemGameCenterDeclaration;
  v4 = [(CEMDeclarationBase *)&v24 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowGameCenter copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowMultiplayerGaming copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadAllowAddingGameCenterFriends copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowGameCenterNearbyMultiplayer copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowGameCenterPrivateMessaging copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSNumber *)self->_payloadAllowGameCenterProfilePrivacyModification copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSNumber *)self->_payloadAllowGameCenterProfileModification copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadAllowedGameCenterOtherPlayerTypes copy];
  id v20 = (void *)v4[16];
  v4[16] = v19;

  uint64_t v21 = [(NSNumber *)self->_payloadAllowGameCenterFriendsSharingModification copy];
  id v22 = (void *)v4[17];
  v4[17] = v21;

  return v4;
}

- (NSNumber)payloadAllowGameCenter
{
  return self->_payloadAllowGameCenter;
}

- (void)setPayloadAllowGameCenter:(id)a3
{
}

- (NSNumber)payloadAllowMultiplayerGaming
{
  return self->_payloadAllowMultiplayerGaming;
}

- (void)setPayloadAllowMultiplayerGaming:(id)a3
{
}

- (NSNumber)payloadAllowAddingGameCenterFriends
{
  return self->_payloadAllowAddingGameCenterFriends;
}

- (void)setPayloadAllowAddingGameCenterFriends:(id)a3
{
}

- (NSNumber)payloadAllowGameCenterNearbyMultiplayer
{
  return self->_payloadAllowGameCenterNearbyMultiplayer;
}

- (void)setPayloadAllowGameCenterNearbyMultiplayer:(id)a3
{
}

- (NSNumber)payloadAllowGameCenterPrivateMessaging
{
  return self->_payloadAllowGameCenterPrivateMessaging;
}

- (void)setPayloadAllowGameCenterPrivateMessaging:(id)a3
{
}

- (NSNumber)payloadAllowGameCenterProfilePrivacyModification
{
  return self->_payloadAllowGameCenterProfilePrivacyModification;
}

- (void)setPayloadAllowGameCenterProfilePrivacyModification:(id)a3
{
}

- (NSNumber)payloadAllowGameCenterProfileModification
{
  return self->_payloadAllowGameCenterProfileModification;
}

- (void)setPayloadAllowGameCenterProfileModification:(id)a3
{
}

- (NSNumber)payloadAllowedGameCenterOtherPlayerTypes
{
  return self->_payloadAllowedGameCenterOtherPlayerTypes;
}

- (void)setPayloadAllowedGameCenterOtherPlayerTypes:(id)a3
{
}

- (NSNumber)payloadAllowGameCenterFriendsSharingModification
{
  return self->_payloadAllowGameCenterFriendsSharingModification;
}

- (void)setPayloadAllowGameCenterFriendsSharingModification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowGameCenterFriendsSharingModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowedGameCenterOtherPlayerTypes, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterProfileModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterProfilePrivacyModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterPrivateMessaging, 0);
  objc_storeStrong((id *)&self->_payloadAllowGameCenterNearbyMultiplayer, 0);
  objc_storeStrong((id *)&self->_payloadAllowAddingGameCenterFriends, 0);
  objc_storeStrong((id *)&self->_payloadAllowMultiplayerGaming, 0);

  objc_storeStrong((id *)&self->_payloadAllowGameCenter, 0);
}

@end