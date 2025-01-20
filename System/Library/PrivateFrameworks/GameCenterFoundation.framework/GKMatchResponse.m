@interface GKMatchResponse
+ (id)secureCodedPropertyKeys;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isNetworkError;
- (BOOL)isTimeout;
- (BOOL)transitionToState:(int64_t)a3;
- (GKDispatchGroup)matchingGroup;
- (GKMatchRequestInternal)matchRequest;
- (NSArray)matches;
- (NSArray)relayPushes;
- (NSData)cdxTicket;
- (NSData)sessionToken;
- (NSDictionary)serverRequest;
- (NSNumber)transportVersionToUse;
- (NSString)matchID;
- (NSString)rid;
- (NSString)selfPseudonym;
- (int)_incrementSequence;
- (int)sequence;
- (int64_t)state;
- (void)setCdxTicket:(id)a3;
- (void)setMatchID:(id)a3;
- (void)setMatchRequest:(id)a3;
- (void)setMatches:(id)a3;
- (void)setMatchingGroup:(id)a3;
- (void)setRelayPushes:(id)a3;
- (void)setRid:(id)a3;
- (void)setSelfPseudonym:(id)a3;
- (void)setServerRequest:(id)a3;
- (void)setSessionToken:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTransportVersionToUse:(id)a3;
@end

@implementation GKMatchResponse

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_433 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_433, &__block_literal_global_435);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_432;

  return v2;
}

void __42__GKMatchResponse_secureCodedPropertyKeys__block_invoke()
{
  v6[9] = *MEMORY[0x1E4F143B8];
  v5[0] = @"rid";
  v6[0] = objc_opt_class();
  v5[1] = @"matchID";
  v6[1] = objc_opt_class();
  v5[2] = @"matches";
  v0 = +[GKServiceInterface plistClasses];
  v6[2] = v0;
  v5[3] = @"sessionToken";
  v6[3] = objc_opt_class();
  v5[4] = @"relayPushes";
  v1 = +[GKServiceInterface plistClasses];
  v6[4] = v1;
  v5[5] = @"cdxTicket";
  v6[5] = objc_opt_class();
  v5[6] = @"selfPseudonym";
  v6[6] = objc_opt_class();
  v5[7] = @"serverRequest";
  v2 = +[GKServiceInterface plistClasses];
  v6[7] = v2;
  v5[8] = @"transportVersionToUse";
  v6[8] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:9];
  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_432;
  secureCodedPropertyKeys_sSecureCodedKeys_432 = v3;
}

- (int)_incrementSequence
{
  return GKAtomicIncrement32Barrier(&self->_sequence);
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_state > 3;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_state == 5;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isTimeout
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_state == 6;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isNetworkError
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_state == 7;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)transitionToState:(int64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  switch(a3)
  {
    case 1:
      if (!v4->_state) {
        goto LABEL_3;
      }
      goto LABEL_5;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      if (v4->_state >= 4) {
        goto LABEL_5;
      }
LABEL_3:
      v4->_state = a3;
      [(GKMatchResponse *)v4 _incrementSequence];
      BOOL v5 = 1;
      break;
    default:
LABEL_5:
      BOOL v5 = 0;
      break;
  }
  objc_sync_exit(v4);

  return v5;
}

- (NSString)rid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRid:(id)a3
{
}

- (NSArray)matches
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMatches:(id)a3
{
}

- (NSString)matchID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMatchID:(id)a3
{
}

- (NSData)sessionToken
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionToken:(id)a3
{
}

- (NSArray)relayPushes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRelayPushes:(id)a3
{
}

- (NSData)cdxTicket
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCdxTicket:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDictionary)serverRequest
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setServerRequest:(id)a3
{
}

- (GKMatchRequestInternal)matchRequest
{
  return (GKMatchRequestInternal *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMatchRequest:(id)a3
{
}

- (GKDispatchGroup)matchingGroup
{
  return self->_matchingGroup;
}

- (void)setMatchingGroup:(id)a3
{
  self->_matchingGroup = (GKDispatchGroup *)a3;
}

- (int)sequence
{
  return self->_sequence;
}

- (NSString)selfPseudonym
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSelfPseudonym:(id)a3
{
}

- (NSNumber)transportVersionToUse
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTransportVersionToUse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportVersionToUse, 0);
  objc_storeStrong((id *)&self->_selfPseudonym, 0);
  objc_storeStrong((id *)&self->_matchRequest, 0);
  objc_storeStrong((id *)&self->_serverRequest, 0);
  objc_storeStrong((id *)&self->_cdxTicket, 0);
  objc_storeStrong((id *)&self->_relayPushes, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
  objc_storeStrong((id *)&self->_matches, 0);

  objc_storeStrong((id *)&self->_rid, 0);
}

@end