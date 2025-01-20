@interface GKInviteInternal
+ (id)inviteFromNearbyPlayer:(id)a3 participantID:(id)a4 deviceID:(id)a5 bundleID:(id)a6 connectionData:(id)a7;
+ (id)inviteWithBulletin:(id)a3;
+ (id)nearbyInviteIDForPlayerID:(id)a3 deviceID:(id)a4 bundleID:(id)a5;
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMessageBasedInvite;
- (BOOL)isNearby;
- (BOOL)isNearbyInvite;
- (BOOL)isSharePlayInvite;
- (GKInviteInternal)init;
- (GKPlayerInternal)player;
- (NSData)peerBlob;
- (NSData)peerNATIP;
- (NSData)peerPushToken;
- (NSData)sessionToken;
- (NSDictionary)localizableMessage;
- (NSNumber)declineReason;
- (NSNumber)transportVersionToUse;
- (NSSet)gameParticipants;
- (NSSet)lobbyParticipants;
- (NSString)bundleID;
- (NSString)deviceID;
- (NSString)inviteID;
- (NSString)message;
- (NSString)participantID;
- (NSString)peerID;
- (NSString)peerPseudonym;
- (NSString)rid;
- (NSString)sessionID;
- (id)descriptionSubstitutionMap;
- (unint64_t)hash;
- (unint64_t)matchType;
- (unint64_t)peerNATType;
- (unint64_t)playerGroup;
- (unsigned)playerAttributes;
- (unsigned)version;
- (void)setBundleID:(id)a3;
- (void)setDeclineReason:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setGameParticipants:(id)a3;
- (void)setInviteID:(id)a3;
- (void)setIsMessageBasedInvite:(BOOL)a3;
- (void)setIsNearbyInvite:(BOOL)a3;
- (void)setIsSharePlayInvite:(BOOL)a3;
- (void)setLobbyParticipants:(id)a3;
- (void)setLocalizableMessage:(id)a3;
- (void)setMatchType:(unint64_t)a3;
- (void)setMessage:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setPeerBlob:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPeerNATIP:(id)a3;
- (void)setPeerNATType:(unint64_t)a3;
- (void)setPeerPseudonym:(id)a3;
- (void)setPeerPushToken:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerAttributes:(unsigned int)a3;
- (void)setPlayerGroup:(unint64_t)a3;
- (void)setRid:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setTransportVersionToUse:(id)a3;
- (void)setVersion:(unsigned __int8)a3;
@end

@implementation GKInviteInternal

+ (id)inviteWithBulletin:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = GKOSLoggers();
  }
  v5 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_INFO, "GKMultiplayer Internal: inviteWithBulletin:", buf, 2u);
  }
  v6 = objc_alloc_init(GKInviteInternal);
  v7 = [v3 sessionToken];
  v8 = [v7 base64EncodedStringWithOptions:0];
  [(GKInviteInternal *)v6 setInviteID:v8];

  v9 = [v3 message];
  [(GKInviteInternal *)v6 setMessage:v9];

  v10 = [v3 originatorPlayer];
  [(GKInviteInternal *)v6 setPlayer:v10];

  v11 = [v3 sessionToken];
  [(GKInviteInternal *)v6 setSessionToken:v11];

  v12 = [v3 inviteVersion];
  -[GKInviteInternal setVersion:](v6, "setVersion:", [v12 unsignedCharValue]);

  v13 = [v3 originatorPlayerID];
  [(GKInviteInternal *)v6 setPeerID:v13];

  v14 = [v3 peerPushToken];
  [(GKInviteInternal *)v6 setPeerPushToken:v14];

  v15 = [v3 peerNatType];
  -[GKInviteInternal setPeerNATType:](v6, "setPeerNATType:", [v15 integerValue]);

  v16 = [v3 peerNatIP];
  [(GKInviteInternal *)v6 setPeerNATIP:v16];

  v17 = [v3 peerBlob];
  [(GKInviteInternal *)v6 setPeerBlob:v17];

  -[GKInviteInternal setIsMessageBasedInvite:](v6, "setIsMessageBasedInvite:", [v3 isMessageBasedInvite]);
  -[GKInviteInternal setIsNearbyInvite:](v6, "setIsNearbyInvite:", [v3 isNearbyInvite]);
  -[GKInviteInternal setIsSharePlayInvite:](v6, "setIsSharePlayInvite:", [v3 isSharePlayInvite]);
  v18 = [v3 declineReason];
  [(GKInviteInternal *)v6 setDeclineReason:v18];

  v19 = [v3 transportVersionToUse];
  [(GKInviteInternal *)v6 setTransportVersionToUse:v19];

  v20 = [v3 sessionID];
  [(GKInviteInternal *)v6 setSessionID:v20];

  v21 = [v3 peerPseudonym];
  [(GKInviteInternal *)v6 setPeerPseudonym:v21];

  if ([v3 serverHosted]) {
    [(GKInviteInternal *)v6 setMatchType:1];
  }
  v22 = [v3 clientDictionary];
  v23 = [v22 objectForKey:@"g"];
  v24 = v23;
  if (v23) {
    uint64_t v25 = [v23 unsignedIntegerValue];
  }
  else {
    uint64_t v25 = 1;
  }
  [(GKInviteInternal *)v6 setPlayerGroup:v25];
  v26 = [v22 objectForKeyedSubscript:@"gp"];

  if (v26)
  {
    v27 = +[GKTransportParticipant participantsFrom:v22 withKey:@"gp"];
    [(GKInviteInternal *)v6 setGameParticipants:v27];
  }
  v28 = [v22 objectForKeyedSubscript:@"lp"];

  if (v28)
  {
    v29 = +[GKTransportParticipant participantsFrom:v22 withKey:@"lp"];
    [(GKInviteInternal *)v6 setLobbyParticipants:v29];
  }
  v30 = [v22 objectForKey:@"a"];
  v31 = v30;
  if (v30) {
    -[GKInviteInternal setPlayerAttributes:](v6, "setPlayerAttributes:", [v30 unsignedIntValue]);
  }
  if (!os_log_GKGeneral) {
    id v32 = GKOSLoggers();
  }
  v33 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1C2D22000, v33, OS_LOG_TYPE_INFO, "inviteWithBulletin: Invite has been set up", v35, 2u);
  }

  return v6;
}

+ (id)inviteFromNearbyPlayer:(id)a3 participantID:(id)a4 deviceID:(id)a5 bundleID:(id)a6 connectionData:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(GKInviteInternal);
  [(GKInviteInternal *)v16 setPlayer:v15];
  [(GKInviteInternal *)v16 setParticipantID:v14];

  [(GKInviteInternal *)v16 setDeviceID:v13];
  [(GKInviteInternal *)v16 setBundleID:v12];
  [(GKInviteInternal *)v16 setPeerBlob:v11];

  v17 = [v15 playerID];
  [(GKInviteInternal *)v16 setPeerID:v17];

  [(GKInviteInternal *)v16 setMatchType:0];
  v18 = [v15 playerID];

  v19 = +[GKInviteInternal nearbyInviteIDForPlayerID:v18 deviceID:v13 bundleID:v12];

  [(GKInviteInternal *)v16 setInviteID:v19];

  return v16;
}

+ (id)nearbyInviteIDForPlayerID:(id)a3 deviceID:(id)a4 bundleID:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@-%@-%@", a3, a4, a5];
}

- (GKInviteInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKInviteInternal;
  result = [(GKInviteInternal *)&v3 init];
  if (result)
  {
    result->_matchType = 0;
    result->_playerGroup = 1;
    result->_playerAttributes = -1;
  }
  return result;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_224 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_224, &__block_literal_global_226);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_223;

  return v2;
}

void __43__GKInviteInternal_secureCodedPropertyKeys__block_invoke()
{
  v13[27] = *MEMORY[0x1E4F143B8];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  objc_super v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"inviteID", @"sessionToken", @"player", @"participantID", @"deviceID", @"bundleID", @"message", @"localizableMessage");
  v13[7] = v3;
  v12[8] = @"matchType";
  v13[8] = objc_opt_class();
  v12[9] = @"playerGroup";
  v13[9] = objc_opt_class();
  v12[10] = @"playerAttributes";
  v13[10] = objc_opt_class();
  v12[11] = @"peerID";
  v13[11] = objc_opt_class();
  v12[12] = @"peerPushToken";
  v13[12] = objc_opt_class();
  v12[13] = @"peerNATType";
  v13[13] = objc_opt_class();
  v12[14] = @"peerNATIP";
  v13[14] = objc_opt_class();
  v12[15] = @"peerBlob";
  v13[15] = objc_opt_class();
  v12[16] = @"rid";
  v13[16] = objc_opt_class();
  v12[17] = @"version";
  v13[17] = objc_opt_class();
  v12[18] = @"isMessageBasedInvite";
  v13[18] = objc_opt_class();
  v12[19] = @"isNearbyInvite";
  v13[19] = objc_opt_class();
  v12[20] = @"isSharePlayInvite";
  v13[20] = objc_opt_class();
  v12[21] = @"declineReason";
  v13[21] = objc_opt_class();
  v12[22] = @"transportVersionToUse";
  v13[22] = objc_opt_class();
  v12[23] = @"sessionID";
  v13[23] = objc_opt_class();
  v12[24] = @"peerPseudonym";
  v13[24] = objc_opt_class();
  v12[25] = @"gameParticipants";
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v13[25] = v6;
  v12[26] = @"lobbyParticipants";
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v13[26] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:27];

  id v11 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_223;
  secureCodedPropertyKeys_sSecureCodedKeys_223 = v10;
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKInviteInternal *)self inviteID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKInviteInternal *)self inviteID];
    v7 = [v5 inviteID];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isNearby
{
  return self->_deviceID != 0;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1F1E7EE08;
}

- (NSString)inviteID
{
  return self->_inviteID;
}

- (void)setInviteID:(id)a3
{
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(unint64_t)a3
{
  self->_matchType = a3;
}

- (unint64_t)playerGroup
{
  return self->_playerGroup;
}

- (void)setPlayerGroup:(unint64_t)a3
{
  self->_playerGroup = a3;
}

- (unsigned)playerAttributes
{
  return self->_playerAttributes;
}

- (void)setPlayerAttributes:(unsigned int)a3
{
  self->_playerAttributes = a3;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSData)peerPushToken
{
  return self->_peerPushToken;
}

- (void)setPeerPushToken:(id)a3
{
}

- (unint64_t)peerNATType
{
  return self->_peerNATType;
}

- (void)setPeerNATType:(unint64_t)a3
{
  self->_peerNATType = a3;
}

- (NSData)peerNATIP
{
  return self->_peerNATIP;
}

- (void)setPeerNATIP:(id)a3
{
}

- (NSData)peerBlob
{
  return self->_peerBlob;
}

- (void)setPeerBlob:(id)a3
{
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)peerPseudonym
{
  return self->_peerPseudonym;
}

- (void)setPeerPseudonym:(id)a3
{
}

- (NSString)rid
{
  return self->_rid;
}

- (void)setRid:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned __int8)a3
{
  self->_version = a3;
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isMessageBasedInvite
{
  return self->_isMessageBasedInvite;
}

- (void)setIsMessageBasedInvite:(BOOL)a3
{
  self->_isMessageBasedInvite = a3;
}

- (BOOL)isNearbyInvite
{
  return self->_isNearbyInvite;
}

- (void)setIsNearbyInvite:(BOOL)a3
{
  self->_isNearbyInvite = a3;
}

- (BOOL)isSharePlayInvite
{
  return self->_isSharePlayInvite;
}

- (void)setIsSharePlayInvite:(BOOL)a3
{
  self->_isSharePlayInvite = a3;
}

- (NSNumber)declineReason
{
  return self->_declineReason;
}

- (void)setDeclineReason:(id)a3
{
  self->_declineReason = (NSNumber *)a3;
}

- (NSSet)gameParticipants
{
  return self->_gameParticipants;
}

- (void)setGameParticipants:(id)a3
{
}

- (NSSet)lobbyParticipants
{
  return self->_lobbyParticipants;
}

- (void)setLobbyParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lobbyParticipants, 0);
  objc_storeStrong((id *)&self->_gameParticipants, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_rid, 0);
  objc_storeStrong((id *)&self->_peerPseudonym, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_peerBlob, 0);
  objc_storeStrong((id *)&self->_peerNATIP, 0);
  objc_storeStrong((id *)&self->_peerPushToken, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);

  objc_storeStrong((id *)&self->_inviteID, 0);
}

@end