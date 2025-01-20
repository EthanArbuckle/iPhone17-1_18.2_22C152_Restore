@interface GKTTRMultiplayerParticipant
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKTTRMultiplayerParticipant)initWithPlayerID:(id)a3 pushToken:(id)a4;
- (NSData)pushToken;
- (NSString)playerID;
- (id)serverRepresentation;
- (unint64_t)hash;
- (void)setPlayerID:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation GKTTRMultiplayerParticipant

- (GKTTRMultiplayerParticipant)initWithPlayerID:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKTTRMultiplayerParticipant;
  v8 = [(GKTTRMultiplayerParticipant *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(GKTTRMultiplayerParticipant *)v8 setPlayerID:v6];
    [(GKTTRMultiplayerParticipant *)v9 setPushToken:v7];
  }

  return v9;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_281 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_281, &__block_literal_global_283);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_280;

  return v2;
}

void __54__GKTTRMultiplayerParticipant_secureCodedPropertyKeys__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0, @"playerID");
  v4[1] = @"pushToken";
  v5[0] = v0;
  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_280;
  secureCodedPropertyKeys_sSecureCodedKeys_280 = v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 playerID];
    id v7 = [(GKTTRMultiplayerParticipant *)self playerID];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 pushToken];
      v9 = [(GKTTRMultiplayerParticipant *)self pushToken];
      char v10 = [v8 isEqualToData:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(GKTTRMultiplayerParticipant *)self playerID];
  uint64_t v4 = [v3 hash];
  id v5 = [(GKTTRMultiplayerParticipant *)self pushToken];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)serverRepresentation
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKTTRMultiplayerParticipant *)self playerID];
  if (!v3
    || (uint64_t v4 = (void *)v3,
        [(GKTTRMultiplayerParticipant *)self pushToken],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    unint64_t v6 = NSString;
    id v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    v8 = [v6 stringWithFormat:@"Invalid GKTTRMultiplayerParticipant for: %@. Call Stack: %@", self, v7];
    v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerServiceInterface.m"];
    id v10 = [v9 lastPathComponent];
    objc_super v11 = [v6 stringWithFormat:@"%@ (self.playerID != nil && self.pushToken != nil)\n[%s (%s:%d)]", v8, "-[GKTTRMultiplayerParticipant serverRepresentation]", objc_msgSend(v10, "UTF8String"), 245];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
  }
  v16[0] = @"id";
  v12 = [(GKTTRMultiplayerParticipant *)self playerID];
  v16[1] = @"push-token";
  v17[0] = v12;
  v13 = [(GKTTRMultiplayerParticipant *)self pushToken];
  v17[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v14;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

@end