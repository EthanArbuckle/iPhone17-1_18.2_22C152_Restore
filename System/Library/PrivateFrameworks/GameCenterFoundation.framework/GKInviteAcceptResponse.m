@interface GKInviteAcceptResponse
+ (id)secureCodedPropertyKeys;
- (NSDictionary)responsePlist;
- (NSNumber)transportVersionToUse;
- (NSString)matchID;
- (NSString)selfPseudonym;
- (NSString)sessionID;
- (void)setMatchID:(id)a3;
- (void)setResponsePlist:(id)a3;
- (void)setSelfPseudonym:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setTransportVersionToUse:(id)a3;
@end

@implementation GKInviteAcceptResponse

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_416 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_416, &__block_literal_global_418);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_415;

  return v2;
}

void __49__GKInviteAcceptResponse_secureCodedPropertyKeys__block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v3[0] = @"responsePlist";
  v0 = +[GKServiceInterface plistClasses];
  v4[0] = v0;
  v3[1] = @"sessionID";
  v4[1] = objc_opt_class();
  v3[2] = @"matchID";
  v4[2] = objc_opt_class();
  v3[3] = @"selfPseudonym";
  v4[3] = objc_opt_class();
  v3[4] = @"transportVersionToUse";
  v4[4] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_415;
  secureCodedPropertyKeys_sSecureCodedKeys_415 = v1;
}

- (NSDictionary)responsePlist
{
  return self->_responsePlist;
}

- (void)setResponsePlist:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
}

- (NSString)selfPseudonym
{
  return self->_selfPseudonym;
}

- (void)setSelfPseudonym:(id)a3
{
}

- (NSNumber)transportVersionToUse
{
  return self->_transportVersionToUse;
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_selfPseudonym, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_responsePlist, 0);
}

@end