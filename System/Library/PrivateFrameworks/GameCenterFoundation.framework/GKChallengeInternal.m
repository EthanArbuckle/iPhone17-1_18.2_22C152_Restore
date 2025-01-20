@interface GKChallengeInternal
+ (id)internalRepresentation;
+ (id)secureCodedPropertyKeys;
- (BOOL)isEqual:(id)a3;
- (GKGameInternal)game;
- (GKPlayerInternal)issuingPlayer;
- (GKPlayerInternal)receivingPlayer;
- (NSDate)completionDate;
- (NSDate)issueDate;
- (NSOrderedSet)compatibleBundleIDs;
- (NSString)bundleID;
- (NSString)challengeID;
- (NSString)message;
- (NSString)subtitleText;
- (NSString)titleText;
- (id)descriptionSubstitutionMap;
- (id)findLocalGameBundleID;
- (id)serverRepresentationForReceivingPlayer:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setChallengeID:(id)a3;
- (void)setCompatibleBundleIDs:(id)a3;
- (void)setCompletionDate:(id)a3;
- (void)setGame:(id)a3;
- (void)setIssueDate:(id)a3;
- (void)setIssuingPlayer:(id)a3;
- (void)setMessage:(id)a3;
- (void)setReceivingPlayer:(id)a3;
- (void)setState:(int64_t)a3;
- (void)titleText;
@end

@implementation GKChallengeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_23 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_23, &__block_literal_global_63);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_23;

  return v2;
}

void __46__GKChallengeInternal_secureCodedPropertyKeys__block_invoke()
{
  v7[10] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"challengeID", @"bundleID", @"issueDate", @"completionDate", @"state", @"compatibleBundleIDs");
  v7[5] = v3;
  v6[6] = @"message";
  v7[6] = objc_opt_class();
  v6[7] = @"game";
  v7[7] = objc_opt_class();
  v6[8] = @"issuingPlayer";
  v7[8] = objc_opt_class();
  v6[9] = @"receivingPlayer";
  v7[9] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:10];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_23;
  secureCodedPropertyKeys_sSecureCodedKeys_23 = v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeInternal;
  [(GKInternalRepresentation *)&v9 encodeWithCoder:v4];
  v5 = [(GKPlayerInternal *)self->_issuingPlayer playerID];

  if (v5)
  {
    v6 = [(GKPlayerInternal *)self->_issuingPlayer playerID];
    [v4 encodeObject:v6 forKey:@"issuingPlayerID"];
  }
  v7 = [(GKPlayerInternal *)self->_receivingPlayer playerID];

  if (v7)
  {
    v8 = [(GKPlayerInternal *)self->_receivingPlayer playerID];
    [v4 encodeObject:v8 forKey:@"receivingPlayerID"];
  }
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKChallengeInternal *)self challengeID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GKChallengeInternal *)self challengeID];
    v6 = [v4 challengeID];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)internalRepresentation
{
  return 0;
}

- (id)serverRepresentationForReceivingPlayer:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithCapacity:0];
  char v7 = [(GKChallengeInternal *)self bundleID];
  [v6 setObject:v7 forKey:@"bundle-id"];

  v8 = [v5 playerID];

  [v6 setObject:v8 forKey:@"receiving-player-id"];
  objc_super v9 = [MEMORY[0x1E4F1C9C8] _gkServerTimestamp];
  [v6 setObject:v9 forKey:@"issue-timestamp"];

  v10 = [(GKChallengeInternal *)self message];

  if (v10)
  {
    v11 = [(GKChallengeInternal *)self message];
    [v6 setObject:v11 forKey:@"message"];
  }

  return v6;
}

- (id)findLocalGameBundleID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[GKApplicationWorkspace defaultWorkspace];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_compatibleBundleIDs;
  id v5 = (id)[(NSOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_super v9 = objc_msgSend(v3, "applicationProxyForBundleID:", v8, (void)v11);
        if ([v9 isInstalled] && (objc_msgSend(v9, "isRestricted") & 1) == 0)
        {
          id v5 = v8;

          goto LABEL_12;
        }
      }
      id v5 = (id)[(NSOrderedSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (unint64_t)type
{
  return 0;
}

- (NSString)titleText
{
  if (!os_log_GKGeneral) {
    id v2 = GKOSLoggers();
  }
  unint64_t v3 = (void *)os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
    -[GKChallengeInternal titleText](v3);
  }
  return 0;
}

- (NSString)subtitleText
{
  unint64_t v3 = NSString;
  id v4 = +[GCFLocalizedStrings SHORT_FROM_SUBTITLE_FORMAT];
  id v5 = [(GKChallengeInternal *)self issuingPlayer];
  uint64_t v6 = [v5 displayNameWithOptions:0];
  char v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  return (NSString *)v7;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1F1E7ED90;
}

- (NSString)challengeID
{
  return self->_challengeID;
}

- (void)setChallengeID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSDate)issueDate
{
  return self->_issueDate;
}

- (void)setIssueDate:(id)a3
{
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
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

- (NSOrderedSet)compatibleBundleIDs
{
  return self->_compatibleBundleIDs;
}

- (void)setCompatibleBundleIDs:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (GKGameInternal)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
}

- (GKPlayerInternal)issuingPlayer
{
  return self->_issuingPlayer;
}

- (void)setIssuingPlayer:(id)a3
{
}

- (GKPlayerInternal)receivingPlayer
{
  return self->_receivingPlayer;
}

- (void)setReceivingPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivingPlayer, 0);
  objc_storeStrong((id *)&self->_issuingPlayer, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_compatibleBundleIDs, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_issueDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_challengeID, 0);
}

- (void)titleText
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  unint64_t v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_ERROR, "%@ needs to implement me!", (uint8_t *)&v4, 0xCu);
}

@end