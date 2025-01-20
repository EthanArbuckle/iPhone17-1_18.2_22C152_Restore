@interface GKMatchRequest
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (NSUInteger)maxPlayersAllowedForMatchOfType:(GKMatchType)matchType;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)reportableKeyPaths;
+ (id)sanitizeProperties:(id)a3;
- (BOOL)defaultNumberOfPlayersIsValid;
- (BOOL)hasFutureRecipientProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIncorrectlyInvitingPlayers;
- (BOOL)isRecipientCountValid;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKMatchRequest)init;
- (GKMatchRequest)initWithInternalRepresentation:(id)a3;
- (GKMatchRequestInternal)internal;
- (NSArray)playersToInvite;
- (NSArray)recipients;
- (NSDictionary)recipientProperties;
- (NSString)inviteMessage;
- (OS_dispatch_queue)serialQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)guestPlayers;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)validateForHosted:(BOOL)a3;
- (id)validateForHosted:(BOOL)a3 turnBased:(BOOL)a4;
- (id)validateForTurnBased;
- (id)validateNumbersOfPlayersWithMax:(unint64_t)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)ensureValidityHosted:(BOOL)a3;
- (void)expectFutureRecipientPropertiesForPlayers:(id)a3;
- (void)inviteeResponseHandler;
- (void)loadRecipientsWithCompletionHandler:(id)a3;
- (void)playersToInvite;
- (void)recipientResponseHandler;
- (void)removeLocalPlayerFromPlayersToInvite;
- (void)setInternal:(id)a3;
- (void)setInviteMessage:(NSString *)inviteMessage;
- (void)setInviteeResponseHandler:(void *)inviteeResponseHandler;
- (void)setPlayersToInvite:(NSArray *)playersToInvite;
- (void)setProperties:(id)a3;
- (void)setRecipientProperties:(id)a3;
- (void)setRecipientResponseHandler:(void *)recipientResponseHandler;
- (void)setRecipients:(NSArray *)recipients;
- (void)setSerialQueue:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4;
- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4 withSanitization:(BOOL)a5;
@end

@implementation GKMatchRequest

- (GKMatchRequest)init
{
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = +[GKLocalPlayer local];
  v5 = [v4 internal];
  v6 = [v5 playerID];
  [v3 setLocalPlayerID:v6];

  v7 = [(GKMatchRequest *)self initWithInternalRepresentation:v3];
  return v7;
}

- (GKMatchRequest)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: initWithInternalRepresentation:", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKMatchRequest;
  v7 = [(GKMatchRequest *)&v11 init];
  if (v7)
  {
    if (!v4)
    {
      id v4 = +[GKInternalRepresentation internalRepresentation];
    }
    objc_storeStrong((id *)&v7->_internal, v4);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.GameKit.matchRequest.serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKMatchRequest *)self internal];
    v7 = [v5 internal];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GKMatchRequest *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = (void *)0x1E4F29000;
  v17 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v16 = [(GKMatchRequest *)self minPlayers];
  NSUInteger v6 = [(GKMatchRequest *)self maxPlayers];
  NSUInteger v7 = [(GKMatchRequest *)self playerGroup];
  char v8 = [(GKMatchRequest *)self recipients];
  v9 = [v8 _gkMapWithBlock:&__block_literal_global_45];
  NSUInteger v10 = [(GKMatchRequest *)self defaultNumberOfPlayers];
  objc_super v11 = [(GKMatchRequest *)self inviteMessage];
  if (v11)
  {
    v12 = NSString;
    unint64_t v3 = [(GKMatchRequest *)self inviteMessage];
    v13 = [v12 stringWithFormat:@"'%@'", v3];
  }
  else
  {
    v13 = 0;
  }
  v14 = [v17 stringWithFormat:@"<%@ %p - minPlayers:%u maxPlayers:%u playerGroup:%ld recipients:%@ defaultNumberOfPlayers:%u inviteMessage:%@ playerAttributes:0x%08X>", v5, self, v16, v6, v7, v9, v10, v13, -[GKMatchRequest playerAttributes](self, "playerAttributes")];
  if (v11)
  {
  }

  return v14;
}

id __29__GKMatchRequest_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 internal];
  unint64_t v3 = [v2 conciseDescription];

  return v3;
}

+ (id)reportableKeyPaths
{
  return &unk_1F1E7E9C0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = [(GKMatchRequest *)self internal];
  NSUInteger v7 = (void *)[v6 copyWithZone:a3];
  [v5 setInternal:v7];

  char v8 = [(GKMatchRequest *)self inviteeResponseHandler];
  [v5 setInviteeResponseHandler:v8];

  v9 = [(GKMatchRequest *)self recipientResponseHandler];
  [v5 setRecipientResponseHandler:v9];

  return v5;
}

- (BOOL)defaultNumberOfPlayersIsValid
{
  if (![(GKMatchRequest *)self defaultNumberOfPlayers]) {
    return 1;
  }
  unint64_t v3 = [(GKMatchRequest *)self defaultNumberOfPlayers];
  if (v3 < [(GKMatchRequest *)self minPlayers]) {
    return 0;
  }
  unint64_t v5 = [(GKMatchRequest *)self defaultNumberOfPlayers];
  return v5 <= [(GKMatchRequest *)self maxPlayers];
}

- (id)validateNumbersOfPlayersWithMax:(unint64_t)a3
{
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if ([(GKMatchRequest *)self maxPlayers] > a3)
  {
    NSUInteger v6 = (void *)MEMORY[0x1E4F28C58];
    NSUInteger v7 = objc_msgSend(NSString, "stringWithFormat:", @"The maximum number of players must be <= %lu", a3);
    char v8 = [v6 userErrorForCode:17 description:v7];
    [v5 addObject:v8];
  }
  unint64_t v9 = [(GKMatchRequest *)self maxPlayers];
  if (v9 < [(GKMatchRequest *)self minPlayers])
  {
    NSUInteger v10 = [MEMORY[0x1E4F28C58] userErrorForCode:17 description:@"The maximum number of players can't be less than the minimum number of players."];
    [v5 addObject:v10];
  }
  if ([(GKMatchRequest *)self minPlayers] <= 1)
  {
    objc_super v11 = [MEMORY[0x1E4F28C58] userErrorForCode:17 description:@"The minimum number of players must be >1"];
    [v5 addObject:v11];
  }
  if (![(GKMatchRequest *)self defaultNumberOfPlayersIsValid])
  {
    v12 = [MEMORY[0x1E4F28C58] userErrorForCode:17 description:@"The default number of players is invalid"];
    [v5 addObject:v12];
  }
  v13 = [(GKMatchRequest *)self recipients];
  unint64_t v14 = [v13 count];
  NSUInteger v15 = [(GKMatchRequest *)self maxPlayers];

  if (v14 >= v15)
  {
    NSUInteger v16 = [MEMORY[0x1E4F28C58] userErrorForCode:17 description:@"The number of recipients must be less than the maximum number of players."];
    [v5 addObject:v16];
  }

  return v5;
}

- (id)validateForHosted:(BOOL)a3 turnBased:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  NSUInteger v7 = [MEMORY[0x1E4F1CA48] array];
  BOOL v8 = [(GKMatchRequest *)self playerGroup] != 1
    || [(GKMatchRequest *)self playerAttributes] != -1;
  unint64_t v9 = [(GKMatchRequest *)self properties];
  if ([v9 count])
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_super v11 = [(GKMatchRequest *)self recipientProperties];
    BOOL v10 = [v11 count] != 0;
  }
  v12 = [(GKMatchRequest *)self queueName];
  if ([v12 length]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v10;
  }

  if (v8 & v13)
  {
    unint64_t v14 = [MEMORY[0x1E4F28C58] userErrorForCode:17 description:@"A match request can't have player group/attributes with queue name/properties."];
    [v7 addObject:v14];
  }
  NSUInteger v15 = [(GKMatchRequest *)self queueName];
  if ([v15 length]) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v10;
  }

  if (v16)
  {
    v17 = [MEMORY[0x1E4F28C58] userErrorForCode:17 description:@"A queue name must be specified if properties are configured."];
    [v7 addObject:v17];
  }
  v18 = +[GKPreferences shared];
  v19 = v18;
  if (v4)
  {
    uint64_t v20 = [v18 maxPlayersTurnBased];
  }
  else if (v5)
  {
    uint64_t v20 = [v18 maxPlayersHosted];
  }
  else
  {
    uint64_t v20 = [v18 maxPlayersP2P];
  }
  uint64_t v21 = v20;

  v22 = [(GKMatchRequest *)self validateNumbersOfPlayersWithMax:v21];
  [v7 addObjectsFromArray:v22];

  if ([v7 count])
  {
    if (!os_log_GKGeneral) {
      id v23 = GKOSLoggers();
    }
    v24 = (void *)os_log_GKMatch;
    if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG))
    {
      v27 = NSNumber;
      v28 = v24;
      v29 = [v27 numberWithBool:v5];
      v30 = [NSNumber numberWithBool:v4];
      v31 = [NSNumber numberWithBool:v8];
      v32 = [NSNumber numberWithBool:v10];
      v33 = [NSNumber numberWithBool:v13];
      int v34 = 138413570;
      v35 = v29;
      __int16 v36 = 2112;
      v37 = v30;
      __int16 v38 = 2112;
      v39 = v31;
      __int16 v40 = 2112;
      v41 = v32;
      __int16 v42 = 2112;
      v43 = v33;
      __int16 v44 = 2112;
      v45 = v7;
      _os_log_debug_impl(&dword_1C2D22000, v28, OS_LOG_TYPE_DEBUG, "Invalid match request. Hosted: %@, turnBased: %@, hasClassicParams: %@, hasRuleProperties: %@, hasRuleParams: %@.\nValidationErrors: %@", (uint8_t *)&v34, 0x3Eu);
    }
  }
  if ([v7 count])
  {
    v25 = [MEMORY[0x1E4F28C58] userErrorForCode:13 underlyingErrors:v7];
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)validateForHosted:(BOOL)a3
{
  return [(GKMatchRequest *)self validateForHosted:a3 turnBased:0];
}

- (id)validateForTurnBased
{
  return [(GKMatchRequest *)self validateForHosted:0 turnBased:1];
}

- (void)ensureValidityHosted:(BOOL)a3
{
  BOOL v3 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  NSUInteger v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: ensureValidityHosted", v13, 2u);
  }
  NSUInteger v7 = +[GKPreferences shared];
  BOOL v8 = v7;
  if (v3) {
    unint64_t v9 = [v7 maxPlayersHosted];
  }
  else {
    unint64_t v9 = [v7 maxPlayersP2P];
  }
  NSUInteger v10 = v9;
  if ([(GKMatchRequest *)self maxPlayers] <= v9) {
    NSUInteger v10 = [(GKMatchRequest *)self maxPlayers];
  }
  [(GKMatchRequest *)self setMaxPlayers:v10];
  if ([(GKMatchRequest *)self minPlayers]) {
    NSUInteger v11 = [(GKMatchRequest *)self minPlayers];
  }
  else {
    NSUInteger v11 = 1;
  }
  [(GKMatchRequest *)self setMinPlayers:v11];
  if ([(GKMatchRequest *)self defaultNumberOfPlayersIsValid]) {
    NSUInteger v12 = [(GKMatchRequest *)self defaultNumberOfPlayers];
  }
  else {
    NSUInteger v12 = [(GKMatchRequest *)self maxPlayers];
  }
  [(GKMatchRequest *)self setDefaultNumberOfPlayers:v12];
}

- (void)removeLocalPlayerFromPlayersToInvite
{
  if (!os_log_GKGeneral) {
    id v3 = GKOSLoggers();
  }
  BOOL v4 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v16 = 0;
    _os_log_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_INFO, "GKMatchmaker: removeLocalPlayerFromPlayersToInvite", v16, 2u);
  }
  id v5 = +[GKLocalPlayer localPlayer];
  NSUInteger v6 = [(GKMatchRequest *)self internal];
  NSUInteger v7 = [v6 recipientPlayerIDs];
  BOOL v8 = [v5 internal];
  unint64_t v9 = [v8 playerID];
  int v10 = [v7 containsObject:v9];

  if (v10)
  {
    NSUInteger v11 = (void *)MEMORY[0x1E4F1CA48];
    NSUInteger v12 = [(GKMatchRequest *)self internal];
    uint64_t v13 = [v12 recipientPlayerIDs];
    unint64_t v14 = [v11 arrayWithArray:v13];

    [v14 removeObject:v5];
    NSUInteger v15 = [(GKMatchRequest *)self internal];
    [v15 setRecipientPlayerIDs:v14];
  }
}

+ (NSUInteger)maxPlayersAllowedForMatchOfType:(GKMatchType)matchType
{
  BOOL v4 = +[GKPreferences shared];
  id v5 = v4;
  switch(matchType)
  {
    case GKMatchTypeTurnBased:
      uint64_t v6 = [v4 maxPlayersTurnBased];
      goto LABEL_7;
    case GKMatchTypeHosted:
      uint64_t v6 = [v4 maxPlayersHosted];
      goto LABEL_7;
    case GKMatchTypePeerToPeer:
      uint64_t v6 = [v4 maxPlayersP2P];
LABEL_7:
      NSUInteger v7 = v6;
      goto LABEL_9;
  }
  NSUInteger v7 = 0;
LABEL_9:
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    +[GKMatchRequest maxPlayersAllowedForMatchOfType:]();
  }

  return v7;
}

- (BOOL)isRecipientCountValid
{
  v2 = self;
  id v3 = [(GKMatchRequest *)self recipients];
  unint64_t v4 = [v3 count] + 1;
  LOBYTE(v2) = v4 <= [(GKMatchRequest *)v2 maxPlayers];

  return (char)v2;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKMatchRequest;
  unint64_t v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  NSUInteger v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKMatchRequest;
  id v5 = -[GKMatchRequest methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(GKMatchRequest *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKMatchRequest;
  if (-[GKMatchRequest respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKMatchRequest *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  if (class_respondsToSelector((Class)a1, a3)) {
    return 1;
  }
  int v5 = GKApplicationLinkedOnOrAfter(393216, 0);
  BOOL result = 0;
  if (v5)
  {
    return +[GKMatchRequestInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)guestPlayers
{
  v2 = [(GKMatchRequest *)self recipients];
  id v3 = [v2 _gkGuestPlayersFromPlayers];

  return v3;
}

- (NSArray)recipients
{
  v2 = [(GKMatchRequest *)self internal];
  id v3 = [v2 recipients];
  unint64_t v4 = [v3 _gkPlayersFromInternals];

  [v4 _gkValidatePlayersForReturnFromAPI];

  return (NSArray *)v4;
}

- (void)setRecipients:(NSArray *)recipients
{
  v20[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = recipients;
  if (GKApplicationLinkedOnOrAfter(0x80000, 657920))
  {
    uint64_t v5 = [(NSArray *)v4 count];
    id v6 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    uint64_t v7 = [v6 count];

    if (v5 != v7)
    {
      objc_super v8 = NSString;
      objc_super v9 = [NSString stringWithFormat:@"All recipients must be unique %@", v4];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m"];
      id v11 = [v10 lastPathComponent];
      NSUInteger v12 = [v8 stringWithFormat:@"%@ ([recipients count] == [[NSMutableSet setWithArray:recipients] count])\n[%s (%s:%d)]", v9, "-[GKMatchRequest setRecipients:]", objc_msgSend(v11, "UTF8String"), 294];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
    }
  }
  uint64_t v13 = [(NSArray *)v4 _gkInternalsFromPlayers];
  unint64_t v14 = [(GKMatchRequest *)self internal];
  [v14 setRecipients:v13];

  NSUInteger v15 = [(NSArray *)v4 _gkPlayersIDsFromPlayers];
  BOOL v16 = [(GKMatchRequest *)self internal];
  [v16 setRecipientPlayerIDs:v15];

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v19 = @"request";
  v20[0] = self;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v17 postNotificationName:@"GKSetMatchRequestRecipientsNotification" object:0 userInfo:v18];
}

- (NSString)inviteMessage
{
  id v3 = +[GKPreferences shared];
  int v4 = [v3 shouldAllowCustomCommunication];

  if (v4)
  {
    uint64_t v5 = [(GKMatchRequest *)self internal];
    id v6 = [v5 inviteMessage];
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setInviteMessage:(NSString *)inviteMessage
{
  uint64_t v7 = inviteMessage;
  int v4 = +[GKPreferences shared];
  int v5 = [v4 shouldAllowCustomCommunication];

  if (v5)
  {
    id v6 = [(GKMatchRequest *)self internal];
    [v6 setInviteMessage:v7];
  }
}

- (NSArray)playersToInvite
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (GKApplicationLinkedOnOrAfter(917504, 659456))
  {
    if (!os_log_GKGeneral) {
      id v3 = GKOSLoggers();
    }
    int v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      -[GKMatchRequest playersToInvite](v4);
    }
    v8[0] = @"playerID is no longer available";
    int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = [(GKMatchRequest *)self internal];
    int v5 = [v6 recipientPlayerIDs];
  }

  return (NSArray *)v5;
}

- (void)setPlayersToInvite:(NSArray *)playersToInvite
{
  uint64_t v13 = playersToInvite;
  if (GKApplicationLinkedOnOrAfter(0x80000, 657920))
  {
    uint64_t v4 = [(NSArray *)v13 count];
    int v5 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
    uint64_t v6 = [v5 count];

    if (v4 != v6)
    {
      uint64_t v7 = NSString;
      objc_super v8 = [NSString stringWithFormat:@"All playersToInvite must be unique %@", v13];
      objc_super v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m"];
      id v10 = [v9 lastPathComponent];
      id v11 = [v7 stringWithFormat:@"%@ ([playersToInvite count] == [[NSMutableSet setWithArray:playersToInvite] count])\n[%s (%s:%d)]", v8, "-[GKMatchRequest setPlayersToInvite:]", objc_msgSend(v10, "UTF8String"), 340];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v11 format];
    }
  }
  NSUInteger v12 = [(GKMatchRequest *)self internal];
  [v12 setRecipientPlayerIDs:v13];
}

+ (id)sanitizeProperties:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_13:
    id v8 = 0;
    goto LABEL_14;
  }
  if (([MEMORY[0x1E4F28D90] isValidJSONObject:v3] & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v9 = GKOSLoggers();
    }
    id v10 = (void *)os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      +[GKMatchRequest sanitizeProperties:](v10);
    }
    goto LABEL_13;
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:@"gc"];

  if (v4)
  {
    if (!os_log_GKGeneral) {
      id v5 = GKOSLoggers();
    }
    uint64_t v6 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
      +[GKMatchRequest sanitizeProperties:](v6);
    }
    uint64_t v7 = (void *)[v3 mutableCopy];
    [v7 removeObjectForKey:@"gc"];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
  }
  else
  {
    id v8 = v3;
  }
LABEL_14:

  return v8;
}

- (void)setProperties:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() sanitizeProperties:v4];

  id v5 = [(GKMatchRequest *)self internal];
  [v5 setProperties:v6];
}

- (NSDictionary)recipientProperties
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__15;
  id v11 = __Block_byref_object_dispose__15;
  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [(GKMatchRequest *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__GKMatchRequest_recipientProperties__block_invoke;
  v6[3] = &unk_1E6471180;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  if ([(id)v8[5] count])
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8[5]];
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __37__GKMatchRequest_recipientProperties__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "internal", 0);
  id v3 = [v2 recipientProperties];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        uint64_t v9 = [*(id *)(a1 + 32) internal];
        id v10 = [v9 recipientProperties];
        id v11 = [v10 objectForKeyedSubscript:v8];

        if (v11)
        {
          id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v13 = [[GKPlayer alloc] initWithInternalRepresentation:v8];
          [v12 setObject:v11 forKey:v13];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)setRecipientProperties:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  uint64_t v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v4;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "setRecipientProperties: %@", buf, 0xCu);
  }
  if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v13 isLocalPlayer])
          {
            id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"GKLocalPlayer can't have recipient properties" userInfo:0];
            objc_exception_throw(v20);
          }
          long long v14 = objc_opt_class();
          long long v15 = [v8 objectForKeyedSubscript:v13];
          long long v16 = [v14 sanitizeProperties:v15];

          if (v16)
          {
            long long v17 = [v13 internal];
            [v7 setObject:v16 forKey:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  v18 = [(GKMatchRequest *)self serialQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __41__GKMatchRequest_setRecipientProperties___block_invoke;
  v21[3] = &unk_1E646EC80;
  v21[4] = self;
  id v22 = v7;
  id v19 = v7;
  dispatch_sync(v18, v21);
}

void __41__GKMatchRequest_setRecipientProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) count];
  if (v2)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = 0;
  }
  id v3 = [*(id *)(a1 + 32) internal];
  [v3 setRecipientProperties:v4];

  if (v2)
  {
  }
}

- (BOOL)hasFutureRecipientProperties
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(GKMatchRequest *)self serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__GKMatchRequest_hasFutureRecipientProperties__block_invoke;
  v5[3] = &unk_1E6471180;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __46__GKMatchRequest_hasFutureRecipientProperties__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "internal", 0);
  id v3 = [v2 recipientProperties];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v9 = [*(id *)(a1 + 32) internal];
        uint64_t v10 = [v9 recipientProperties];
        uint64_t v11 = [v10 objectForKeyedSubscript:v8];
        id v12 = [v11 objectForKeyedSubscript:@"gc"];
        int v13 = [v12 isEqualToString:@"<future>"];

        if (v13)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)expectFutureRecipientPropertiesForPlayers:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    -[GKMatchRequest expectFutureRecipientPropertiesForPlayers:]();
  }
  uint64_t v6 = [(GKMatchRequest *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __60__GKMatchRequest_expectFutureRecipientPropertiesForPlayers___block_invoke;
  v8[3] = &unk_1E646EC80;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __60__GKMatchRequest_expectFutureRecipientPropertiesForPlayers___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * v5);
        id v7 = *(void **)(a1 + 40);
        long long v14 = @"gc";
        long long v15 = @"<future>";
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
        [v7 updateRecipientProperties:v8 forPlayer:v6 withSanitization:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v3);
  }
}

- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_DEBUG)) {
    -[GKMatchRequest updateRecipientProperties:forPlayer:]();
  }
  id v9 = [(GKMatchRequest *)self serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__GKMatchRequest_updateRecipientProperties_forPlayer___block_invoke;
  block[3] = &unk_1E646F558;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

uint64_t __54__GKMatchRequest_updateRecipientProperties_forPlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecipientProperties:*(void *)(a1 + 40) forPlayer:*(void *)(a1 + 48) withSanitization:1];
}

- (void)updateRecipientProperties:(id)a3 forPlayer:(id)a4 withSanitization:(BOOL)a5
{
  id v37 = a3;
  id v8 = a4;
  id v9 = dispatch_get_current_queue();
  id v10 = [(GKMatchRequest *)self serialQueue];

  unint64_t v11 = 0x1E4F29000;
  unint64_t v12 = 0x1E4F1C000;
  if (v9 != v10)
  {
    id v13 = NSString;
    BOOL v36 = a5;
    label = dispatch_queue_get_label(v9);
    long long v15 = [(GKMatchRequest *)self serialQueue];
    long long v16 = dispatch_queue_get_label(v15);
    uint64_t v17 = [MEMORY[0x1E4F29060] callStackSymbols];
    v18 = [v13 stringWithFormat:@"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKMatchRequest updateRecipientProperties:forPlayer:withSanitization:]", label, v16, v17];
    uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m"];
    id v20 = [v19 lastPathComponent];
    uint64_t v21 = [v13 stringWithFormat:@"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v18, "-[GKMatchRequest updateRecipientProperties:forPlayer:withSanitization:]", objc_msgSend(v20, "UTF8String"), 446];

    a5 = v36;
    unint64_t v12 = 0x1E4F1C000uLL;

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v21 format];
    unint64_t v11 = 0x1E4F29000uLL;
  }

  if ([v8 isLocalPlayer])
  {
    id v22 = *(void **)(v11 + 24);
    long long v23 = [v22 stringWithFormat:@"GKLocalPlayer can't have recipient properties"];
    long long v24 = [*(id *)(v11 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKMatchRequest.m"];
    id v25 = [v24 lastPathComponent];
    long long v26 = [v22 stringWithFormat:@"%@ (!player.isLocalPlayer)\n[%s (%s:%d)]", v23, "-[GKMatchRequest updateRecipientProperties:forPlayer:withSanitization:]", objc_msgSend(v25, "UTF8String"), 447];

    [*(id *)(v12 + 2560) raise:@"GameKit Exception", @"%@", v26 format];
  }
  v27 = (void *)MEMORY[0x1E4F1CA60];
  v28 = [(GKMatchRequest *)self internal];
  id v29 = [v28 recipientProperties];
  uint64_t v30 = [v27 dictionaryWithDictionary:v29];

  if (a5)
  {
    id v31 = [(id)objc_opt_class() sanitizeProperties:v37];
  }
  else
  {
    id v31 = v37;
  }
  v32 = v31;
  if ([v31 count]) {
    [v30 setObject:v32 forKeyedSubscript:v8];
  }
  else {
    [v30 removeObjectForKey:v8];
  }
  uint64_t v33 = [v30 count];
  if (v33)
  {
    int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v30];
  }
  else
  {
    int v34 = 0;
  }
  v35 = [(GKMatchRequest *)self internal];
  [v35 setRecipientProperties:v34];

  if (v33) {
}
  }

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKMatchRequest *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKMatchRequest *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (void)loadRecipientsWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, "GKMatchmaker: loadRecipientsWithCompletionHandler", buf, 2u);
  }
  id v7 = [(GKMatchRequest *)self recipients];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [(GKMatchRequest *)self recipients];
    id v10 = [v9 _gkNonGuestPlayersFromPlayers];
    unint64_t v11 = [v10 _gkPlayersIDsFromPlayers];
  }
  else
  {
    id v9 = [(GKMatchRequest *)self internal];
    unint64_t v11 = [v9 recipientPlayerIDs];
  }

  if (!os_log_GKGeneral) {
    id v12 = GKOSLoggers();
  }
  id v13 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v24 = v11;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_INFO, "Load recipients -- invitees:%@", buf, 0xCu);
  }
  id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKMatchRequest.m", 486, "-[GKMatchRequest loadRecipientsWithCompletionHandler:]");
  long long v15 = +[GKDispatchGroup dispatchGroupWithName:v14];

  if ([v11 count])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E646D928;
    id v21 = v11;
    id v22 = v15;
    [v22 perform:v20];
  }
  if (v4)
  {
    long long v16 = dispatch_get_global_queue(0, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_3;
    v17[3] = &unk_1E646DC30;
    id v19 = v4;
    id v18 = v15;
    [v18 notifyOnQueue:v16 block:v17];
  }
}

void __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E646DC78;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  +[GKPlayer loadPlayersForLegacyIdentifiers:v4 withCompletionHandler:v6];
}

void __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setResult:v8];
  [*(id *)(a1 + 32) setError:v6];

  if ([v8 count]
    && !+[GKMatchmaker canPlayMultiplayerGameWithPlayers:v8])
  {
    [*(id *)(a1 + 32) setResult:MEMORY[0x1E4F1CBF0]];
    id v7 = [MEMORY[0x1E4F28C58] userErrorForCode:10 userInfo:0];
    [*(id *)(a1 + 32) setError:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__GKMatchRequest_loadRecipientsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) result];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (BOOL)isIncorrectlyInvitingPlayers
{
  id v3 = [(GKMatchRequest *)self internal];
  id v4 = [v3 recipientPlayerIDs];
  if ([v4 count])
  {
  }
  else
  {
    id v5 = [(GKMatchRequest *)self recipients];
    uint64_t v6 = [v5 count];

    if (!v6) {
      return 0;
    }
  }

  return [(GKMatchRequest *)self isConfiguredForAutomatchOnly];
}

- (GKMatchRequestInternal)internal
{
  return (GKMatchRequestInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (void)inviteeResponseHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInviteeResponseHandler:(void *)inviteeResponseHandler
{
}

- (void)recipientResponseHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setRecipientResponseHandler:(void *)recipientResponseHandler
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_recipientResponseHandler, 0);
  objc_storeStrong(&self->_inviteeResponseHandler, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

+ (void)maxPlayersAllowedForMatchOfType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_7_1(&dword_1C2D22000, v0, v1, "The maximum players allowed is: %lu for match type: %lu", v2, v3);
}

- (void)playersToInvite
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = 136446722;
  uint64_t v2 = "-[GKMatchRequest playersToInvite]";
  __int16 v3 = 2114;
  id v4 = @"14.0";
  __int16 v5 = 2114;
  uint64_t v6 = @"11.0";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

+ (void)sanitizeProperties:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "<Warning>: The provided match properties contain the 'gc' key, which is reserved and has been removed.", v1, 2u);
}

+ (void)sanitizeProperties:(void *)a1 .cold.2(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v1 = a1;
  uint64_t v2 = +[GKMatchRequestInternal secureCodedPropertyKeys];
  __int16 v3 = [v2 objectForKeyedSubscript:@"properties"];
  id v4 = [v3 allObjects];
  __int16 v5 = [v4 componentsJoinedByString:@", "];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_ERROR, "<Warning>: The provided match properties contain unsupported types (supported: %{public}@).", v6, 0xCu);
}

- (void)expectFutureRecipientPropertiesForPlayers:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "expectFutureRecipientPropertiesForPlayers: %@", v1, 0xCu);
}

- (void)updateRecipientProperties:forPlayer:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_1C2D22000, v0, v1, "updateRecipientProperties: %@ for player: %@");
}

@end