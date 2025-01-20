@interface GKTurnBasedParticipant
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)matchOutcomeIsValidForDoneState:(int64_t)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (id)keyPathsForValuesAffectingBasicMatchOutcomeString;
+ (id)keyPathsForValuesAffectingMatchOutcomeString;
+ (id)keyPathsForValuesAffectingStatus;
+ (id)stringForMatchOutcome:(int64_t)a3 totalParticipant:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalPlayer;
- (BOOL)isWinner;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKPlayer)invitedBy;
- (GKPlayer)player;
- (GKTurnBasedParticipant)init;
- (GKTurnBasedParticipant)initWithInternalRepresentation:(id)a3;
- (GKTurnBasedParticipantInternal)internal;
- (GKTurnBasedParticipantStatus)status;
- (NSDate)lastTurnDate;
- (NSString)matchStatusString;
- (NSString)playerID;
- (id)basicMatchOutcomeString:(int64_t)a3;
- (id)description;
- (id)matchOutcomeString:(int64_t)a3;
- (id)matchOutcomeStringForLocalPlayer:(int64_t)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)setStatus:(int64_t)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKTurnBasedParticipant

- (GKTurnBasedParticipant)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[GKInternalRepresentation internalRepresentation];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedParticipant;
  v5 = [(GKTurnBasedParticipant *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_internal, v4);
  }

  return v6;
}

- (GKTurnBasedParticipant)init
{
  return [(GKTurnBasedParticipant *)self initWithInternalRepresentation:0];
}

- (unint64_t)hash
{
  v2 = [(GKTurnBasedParticipant *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(GKTurnBasedParticipant *)self internal];
    v6 = [v4 internal];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_28);
  }
  unint64_t v3 = (void *)description_playerStatusEnumLookupDict;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKTurnBasedParticipant status](self, "status"));
  uint64_t v5 = [v3 objectForKey:v4];

  v6 = (void *)description_matchOutcomeEnumLookupDict;
  char v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[GKTurnBasedParticipant matchOutcome](self, "matchOutcome"));
  objc_super v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    if (([(GKTurnBasedParticipant *)self matchOutcome] & 0xFF0000) != 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Custom-%x", -[GKTurnBasedParticipant matchOutcome](self, "matchOutcome"));
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = @"INVALID";
    }
  }
  v9 = [(GKTurnBasedParticipant *)self internal];
  v10 = [v9 player];

  v11 = [v10 playerID];
  v23 = v8;
  if (v10 && [v10 isLocalPlayer])
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@ (local player)", v11];

    v11 = (__CFString *)v12;
  }
  if (v5) {
    v13 = (__CFString *)v5;
  }
  else {
    v13 = @"INVALID";
  }
  v22 = NSString;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  if ([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess]) {
    v16 = @" playerID:";
  }
  else {
    v16 = &stru_1F1E47DF8;
  }
  if ([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess]) {
    v17 = v11;
  }
  else {
    v17 = &stru_1F1E47DF8;
  }
  v18 = [(GKTurnBasedParticipant *)self lastTurnDate];
  v19 = [(GKTurnBasedParticipant *)self timeoutDate];
  v20 = [v22 stringWithFormat:@"<%@ %p -%@%@ status:%@ matchOutcome:%@ lastTurnDate:%@ timeoutDate:%@>", v15, self, v16, v17, v13, v23, v18, v19];

  return v20;
}

void __37__GKTurnBasedParticipant_description__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  v1 = [NSNumber numberWithInteger:0];
  v2 = [NSNumber numberWithInteger:1];
  unint64_t v3 = [NSNumber numberWithInteger:2];
  id v4 = [NSNumber numberWithInteger:3];
  uint64_t v5 = [NSNumber numberWithInteger:4];
  v6 = [NSNumber numberWithInteger:5];
  uint64_t v7 = objc_msgSend(v0, "dictionaryWithObjectsAndKeys:", @"Unknown", v1, @"Invited", v2, @"Declined", v3, @"Matching", v4, @"Active", v5, @"Done", v6, 0);
  objc_super v8 = (void *)description_playerStatusEnumLookupDict;
  description_playerStatusEnumLookupDict = v7;

  v21 = (void *)MEMORY[0x1E4F1C9E8];
  v22 = [NSNumber numberWithInteger:0];
  v20 = [NSNumber numberWithInteger:1];
  v9 = [NSNumber numberWithInteger:2];
  v10 = [NSNumber numberWithInteger:3];
  v11 = [NSNumber numberWithInteger:4];
  uint64_t v12 = [NSNumber numberWithInteger:5];
  v13 = [NSNumber numberWithInteger:6];
  v14 = [NSNumber numberWithInteger:7];
  v15 = [NSNumber numberWithInteger:8];
  v16 = [NSNumber numberWithInteger:9];
  v17 = [NSNumber numberWithInteger:16711680];
  objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", @"None", v22, @"Quit", v20, @"Won", v9, @"Lost", v10, @"Tied", v11, @"TimeExpired", v12, @"First", v13, @"Second", v14, @"Third",
    v15,
    @"Fourth",
    v16,
    @"CustomRange",
    v17,
  uint64_t v18 = 0);
  v19 = (void *)description_matchOutcomeEnumLookupDict;
  description_matchOutcomeEnumLookupDict = v18;
}

+ (id)keyPathsForValuesAffectingStatus
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"internal.status"];
}

- (GKTurnBasedParticipantStatus)status
{
  v2 = [(GKTurnBasedParticipant *)self internal];
  unint64_t v3 = [v2 status];

  if ([v3 isEqualToString:@"Invited"])
  {
    GKTurnBasedParticipantStatus v4 = GKTurnBasedParticipantStatusInvited;
  }
  else if ([v3 isEqualToString:@"Active"])
  {
    GKTurnBasedParticipantStatus v4 = GKTurnBasedParticipantStatusActive;
  }
  else if ([v3 isEqualToString:@"Declined"])
  {
    GKTurnBasedParticipantStatus v4 = GKTurnBasedParticipantStatusDeclined;
  }
  else if ([v3 isEqualToString:@"Inactive"])
  {
    GKTurnBasedParticipantStatus v4 = GKTurnBasedParticipantStatusDone;
  }
  else if ([v3 isEqualToString:@"Matching"])
  {
    GKTurnBasedParticipantStatus v4 = GKTurnBasedParticipantStatusMatching;
  }
  else
  {
    GKTurnBasedParticipantStatus v4 = GKTurnBasedParticipantStatusUnknown;
  }

  return v4;
}

- (void)setStatus:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      unint64_t v3 = [(GKTurnBasedParticipant *)self internal];
      GKTurnBasedParticipantStatus v4 = @"Unknown";
      break;
    case 1:
      unint64_t v3 = [(GKTurnBasedParticipant *)self internal];
      GKTurnBasedParticipantStatus v4 = @"Invited";
      break;
    case 2:
      unint64_t v3 = [(GKTurnBasedParticipant *)self internal];
      GKTurnBasedParticipantStatus v4 = @"Declined";
      break;
    case 3:
      unint64_t v3 = [(GKTurnBasedParticipant *)self internal];
      GKTurnBasedParticipantStatus v4 = @"Matching";
      break;
    case 4:
      unint64_t v3 = [(GKTurnBasedParticipant *)self internal];
      GKTurnBasedParticipantStatus v4 = @"Active";
      break;
    default:
      unint64_t v3 = [(GKTurnBasedParticipant *)self internal];
      GKTurnBasedParticipantStatus v4 = @"Inactive";
      break;
  }
  id v5 = v3;
  [v3 setStatus:v4];
}

+ (id)keyPathsForValuesAffectingBasicMatchOutcomeString
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"matchOutcome"];
}

+ (id)stringForMatchOutcome:(int64_t)a3 totalParticipant:(int64_t)a4
{
  int v5 = a3;
  v6 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_NONE];
  switch(v5 & 0xFF00FFFF)
  {
    case 0u:
      uint64_t v7 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_NONE];
      goto LABEL_12;
    case 1u:
      uint64_t v7 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_QUIT];
      goto LABEL_12;
    case 2u:
      uint64_t v7 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_WON];
      goto LABEL_12;
    case 3u:
      uint64_t v7 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_LOST];
      goto LABEL_12;
    case 4u:
      uint64_t v7 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_TIED];
      goto LABEL_12;
    case 5u:
      uint64_t v7 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_TIME_EXP];
LABEL_12:
      uint64_t v10 = v7;

      goto LABEL_18;
    case 6u:
      v11 = NSString;
      uint64_t v12 = +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_FIRST];
      goto LABEL_17;
    case 7u:
      v11 = NSString;
      uint64_t v12 = +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_SECOND];
      goto LABEL_17;
    case 8u:
      v11 = NSString;
      uint64_t v12 = +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_THIRD];
      goto LABEL_17;
    case 9u:
      v11 = NSString;
      uint64_t v12 = +[GCFLocalizedStringsDict TURN_BASED_OUTCOME_FOURTH];
LABEL_17:
      v13 = (void *)v12;
      uint64_t v10 = objc_msgSend(v11, "stringWithFormat:", v12, a4);

LABEL_18:
      v6 = (void *)v10;
      break;
    default:
      objc_super v8 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v9 = GKOSLoggers();
        objc_super v8 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[GKTurnBasedParticipant stringForMatchOutcome:totalParticipant:]();
      }
      break;
  }

  return v6;
}

+ (id)keyPathsForValuesAffectingMatchOutcomeString
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"status", @"matchOutcome", 0);
}

- (NSString)matchStatusString
{
  switch([(GKTurnBasedParticipant *)self status])
  {
    case GKTurnBasedParticipantStatusUnknown:
      v2 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_UNKNOWN];
      break;
    case GKTurnBasedParticipantStatusInvited:
      v2 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_INVITED];
      break;
    case GKTurnBasedParticipantStatusDeclined:
      v2 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_DECLINED];
      break;
    case GKTurnBasedParticipantStatusMatching:
      v2 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_MATCHING];
      break;
    case GKTurnBasedParticipantStatusActive:
      v2 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_ACTIVE];
      break;
    case GKTurnBasedParticipantStatusDone:
      v2 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_DONE];
      break;
    default:
      v2 = @"invalid status";
      break;
  }

  return (NSString *)v2;
}

- (id)basicMatchOutcomeString:(int64_t)a3
{
  GKTurnBasedMatchOutcome v4 = [(GKTurnBasedParticipant *)self matchOutcome];

  return +[GKTurnBasedParticipant stringForMatchOutcome:v4 totalParticipant:a3];
}

- (id)matchOutcomeStringForLocalPlayer:(int64_t)a3
{
  switch([(GKTurnBasedParticipant *)self matchOutcome] & 0xFF00FFFF)
  {
    case 1:
      int v5 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_QUIT];
      break;
    case 2:
      int v5 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_WON];
      break;
    case 3:
      int v5 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_LOST];
      break;
    case 4:
      int v5 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_YOU_TIED];
      break;
    default:
      int v5 = [(GKTurnBasedParticipant *)self matchOutcomeString:a3];
      break;
  }

  return v5;
}

- (id)matchOutcomeString:(int64_t)a3
{
  int v5 = +[GCFLocalizedStrings TURN_BASED_OUTCOME_NONE];
  if ([(GKTurnBasedParticipant *)self status] == GKTurnBasedParticipantStatusDone)
  {
    uint64_t v6 = [(GKTurnBasedParticipant *)self basicMatchOutcomeString:a3];
LABEL_5:
    uint64_t v7 = (void *)v6;

    int v5 = v7;
    goto LABEL_6;
  }
  if ([(GKTurnBasedParticipant *)self status] == GKTurnBasedParticipantStatusDeclined)
  {
    uint64_t v6 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_DECLINED];
    goto LABEL_5;
  }
  if ([(GKTurnBasedParticipant *)self matchOutcome])
  {
    id v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v10 = GKOSLoggers();
      id v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(GKTurnBasedParticipant *)v9 matchOutcomeString:a3];
    }
    v11 = NSString;
    uint64_t v12 = +[GCFLocalizedStrings TURN_BASED_PARTICIPANT_STATUS_OUTCOME_FORMAT];
    v13 = [(GKTurnBasedParticipant *)self matchStatusString];
    v14 = [(GKTurnBasedParticipant *)self basicMatchOutcomeString:a3];
    uint64_t v15 = objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);

    int v5 = (void *)v15;
  }
LABEL_6:

  return v5;
}

- (BOOL)isWinner
{
  return (([(GKTurnBasedParticipant *)self matchOutcome] - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (NSDate)lastTurnDate
{
  v2 = [(GKTurnBasedParticipant *)self internal];
  unint64_t v3 = [v2 lastTurnDate];

  [v3 timeIntervalSince1970];
  if (v4 == 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = v3;
  }

  return (NSDate *)v5;
}

+ (BOOL)matchOutcomeIsValidForDoneState:(int64_t)a3
{
  unsigned int v4 = (a3 & 0xFF00FFFF) - 1;
  if (v4 >= 9)
  {
    id v5 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v6 = GKOSLoggers();
      id v5 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[GKTurnBasedParticipant matchOutcomeIsValidForDoneState:](v5, a3);
    }
  }
  return v4 < 9;
}

- (GKPlayer)invitedBy
{
  v2 = [(GKTurnBasedParticipant *)self internal];
  unint64_t v3 = [v2 invitedBy];

  if (v3)
  {
    unsigned int v4 = +[GKPlayer canonicalizedPlayerForInternal:v3];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return (GKPlayer *)v4;
}

- (GKPlayer)player
{
  v2 = [(GKTurnBasedParticipant *)self internal];
  unint64_t v3 = [v2 player];

  if (v3)
  {
    unsigned int v4 = +[GKPlayer canonicalizedPlayerForInternal:v3];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return (GKPlayer *)v4;
}

- (NSString)playerID
{
  v2 = [(GKTurnBasedParticipant *)self player];
  unint64_t v3 = [v2 internal];
  unsigned int v4 = [v3 playerID];

  return (NSString *)v4;
}

- (BOOL)isLocalPlayer
{
  v2 = [(GKTurnBasedParticipant *)self internal];
  unint64_t v3 = [v2 player];
  char v4 = [v3 isLocalPlayer];

  return v4;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKTurnBasedParticipant;
  char v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedParticipant;
  id v5 = -[GKTurnBasedParticipant methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_super v8 = [(GKTurnBasedParticipant *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedParticipant;
  if (-[GKTurnBasedParticipant respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKTurnBasedParticipant *)self forwardingTargetForSelector:a3];
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
    return +[GKTurnBasedParticipantInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKTurnBasedParticipant *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKTurnBasedParticipant *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKTurnBasedParticipantInternal)internal
{
  return (GKTurnBasedParticipantInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

+ (void)stringForMatchOutcome:totalParticipant:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "GKTurnBasedMatch stringForMatchOutcome: a TURN_BASED_OUTCOME_NONE will be returned because an invalid outcome was encountered: %@", v1, 0xCu);
}

- (void)matchOutcomeString:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  id v6 = [a2 basicMatchOutcomeString:a3];
  OUTLINED_FUNCTION_0();
  __int16 v8 = 2112;
  objc_super v9 = a2;
  _os_log_debug_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_DEBUG, "encountered matchOutcome %@ in a non done match: %@", v7, 0x16u);
}

+ (void)matchOutcomeIsValidForDoneState:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = NSNumber;
  id v4 = a1;
  int v5 = [v3 numberWithInteger:a2];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v4, OS_LOG_TYPE_DEBUG, "GKTurnBasedMatch matchOutcomeIsValidForDoneState: match outcome will be marked not valid as invalid outcome was encountered: %@", v6, 0xCu);
}

@end