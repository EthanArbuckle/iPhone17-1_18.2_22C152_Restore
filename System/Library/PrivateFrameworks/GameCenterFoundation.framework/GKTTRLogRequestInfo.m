@interface GKTTRLogRequestInfo
+ (id)secureCodedPropertyKeys;
- (GKTTRLogRequestInfo)initWithPlayersAndPushTokens:(id)a3 radarID:(id)a4 requesterAlias:(id)a5;
- (NSArray)playersAndPushTokens;
- (NSString)radarID;
- (NSString)requesterAlias;
- (void)setPlayersAndPushTokens:(id)a3;
- (void)setRadarID:(id)a3;
- (void)setRequesterAlias:(id)a3;
@end

@implementation GKTTRLogRequestInfo

- (GKTTRLogRequestInfo)initWithPlayersAndPushTokens:(id)a3 radarID:(id)a4 requesterAlias:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GKTTRLogRequestInfo;
  v11 = [(GKTTRLogRequestInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(GKTTRLogRequestInfo *)v11 setPlayersAndPushTokens:v8];
    [(GKTTRLogRequestInfo *)v12 setRadarID:v9];
    [(GKTTRLogRequestInfo *)v12 setRequesterAlias:v10];
  }

  return v12;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_313 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_313, &__block_literal_global_315);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_312;

  return v2;
}

void __46__GKTTRLogRequestInfo_secureCodedPropertyKeys__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"playersAndPushTokens";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v8[0] = v2;
  v7[1] = @"radarID";
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v8[1] = v3;
  v7[2] = @"requesterAlias";
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v6 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_312;
  secureCodedPropertyKeys_sSecureCodedKeys_312 = v5;
}

- (NSArray)playersAndPushTokens
{
  return self->_playersAndPushTokens;
}

- (void)setPlayersAndPushTokens:(id)a3
{
}

- (NSString)radarID
{
  return self->_radarID;
}

- (void)setRadarID:(id)a3
{
}

- (NSString)requesterAlias
{
  return self->_requesterAlias;
}

- (void)setRequesterAlias:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterAlias, 0);
  objc_storeStrong((id *)&self->_radarID, 0);

  objc_storeStrong((id *)&self->_playersAndPushTokens, 0);
}

@end