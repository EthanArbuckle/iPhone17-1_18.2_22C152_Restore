@interface GKInviteInitiateResponse
+ (id)secureCodedPropertyKeys;
- (NSArray)gameParticipantsInfo;
- (NSArray)lobbyParticipantsInfo;
- (NSData)selfPushToken;
- (NSData)sessionToken;
- (NSDictionary)invitedUserIDs;
- (NSDictionary)playerTokenMap;
- (NSNumber)approachUsed;
- (NSNumber)transportVersionToUse;
- (NSString)selfPseudonym;
- (NSString)sessionID;
- (NSURL)cloudKitShareURL;
- (void)setApproachUsed:(id)a3;
- (void)setCloudKitShareURL:(id)a3;
- (void)setGameParticipantsInfo:(id)a3;
- (void)setInvitedUserIDs:(id)a3;
- (void)setLobbyParticipantsInfo:(id)a3;
- (void)setPlayerTokenMap:(id)a3;
- (void)setSelfPseudonym:(id)a3;
- (void)setSelfPushToken:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setTransportVersionToUse:(id)a3;
@end

@implementation GKInviteInitiateResponse

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_349 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_349, &__block_literal_global_351);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_348;

  return v2;
}

void __51__GKInviteInitiateResponse_secureCodedPropertyKeys__block_invoke()
{
  v7[11] = *MEMORY[0x1E4F143B8];
  v6[0] = @"invitedUserIDs";
  v0 = +[GKServiceInterface plistClasses];
  v7[0] = v0;
  v6[1] = @"approachUsed";
  v7[1] = objc_opt_class();
  v6[2] = @"cloudKitShareURL";
  v7[2] = objc_opt_class();
  v6[3] = @"sessionToken";
  v7[3] = objc_opt_class();
  v6[4] = @"playerTokenMap";
  v1 = +[GKServiceInterface plistClasses];
  v7[4] = v1;
  v6[5] = @"sessionID";
  v7[5] = objc_opt_class();
  v6[6] = @"selfPseudonym";
  v7[6] = objc_opt_class();
  v6[7] = @"selfPushToken";
  v7[7] = objc_opt_class();
  v6[8] = @"transportVersionToUse";
  v7[8] = objc_opt_class();
  v6[9] = @"gameParticipantsInfo";
  v2 = +[GKServiceInterface plistClasses];
  v7[9] = v2;
  v6[10] = @"lobbyParticipantsInfo";
  v3 = +[GKServiceInterface plistClasses];
  v7[10] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:11];
  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_348;
  secureCodedPropertyKeys_sSecureCodedKeys_348 = v4;
}

- (NSDictionary)invitedUserIDs
{
  return self->_invitedUserIDs;
}

- (void)setInvitedUserIDs:(id)a3
{
}

- (NSNumber)approachUsed
{
  return self->_approachUsed;
}

- (void)setApproachUsed:(id)a3
{
}

- (NSURL)cloudKitShareURL
{
  return self->_cloudKitShareURL;
}

- (void)setCloudKitShareURL:(id)a3
{
}

- (NSData)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (NSDictionary)playerTokenMap
{
  return self->_playerTokenMap;
}

- (void)setPlayerTokenMap:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)selfPseudonym
{
  return self->_selfPseudonym;
}

- (void)setSelfPseudonym:(id)a3
{
}

- (NSData)selfPushToken
{
  return self->_selfPushToken;
}

- (void)setSelfPushToken:(id)a3
{
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (NSArray)gameParticipantsInfo
{
  return self->_gameParticipantsInfo;
}

- (void)setGameParticipantsInfo:(id)a3
{
}

- (NSArray)lobbyParticipantsInfo
{
  return self->_lobbyParticipantsInfo;
}

- (void)setLobbyParticipantsInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lobbyParticipantsInfo, 0);
  objc_storeStrong((id *)&self->_gameParticipantsInfo, 0);
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_selfPushToken, 0);
  objc_storeStrong((id *)&self->_selfPseudonym, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_playerTokenMap, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_cloudKitShareURL, 0);
  objc_storeStrong((id *)&self->_approachUsed, 0);

  objc_storeStrong((id *)&self->_invitedUserIDs, 0);
}

@end