@interface GKPlayerInternal
+ (BOOL)supportsSecureCoding;
+ (Class)classForFamiliarity:(int)a3;
+ (id)compositeNameForFirstName:(id)a3 lastName:(id)a4;
+ (id)displayNameWithOptions:(unsigned __int8)a3 alias:(id)a4 composite:(id)a5;
+ (id)secureCodedPropertyKeys;
- (BOOL)allowChallengeFriendInvites;
- (BOOL)allowMultiplayerFriendInvites;
- (BOOL)allowNearbyMultiplayer;
- (BOOL)allowReceivingFriendInvites;
- (BOOL)challengedTogether;
- (BOOL)isAnonymousPlayer;
- (BOOL)isArcadeSubscriber;
- (BOOL)isAutomatchPlayer;
- (BOOL)isDefaultContactsIntegrationConsent;
- (BOOL)isDefaultNickname;
- (BOOL)isDefaultPrivacyVisibility;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFindable;
- (BOOL)isFriend;
- (BOOL)isFriendInvitationInContacts;
- (BOOL)isGuestPlayer;
- (BOOL)isInContacts;
- (BOOL)isLoaded;
- (BOOL)isLocalPlayer;
- (BOOL)isPhotoPending;
- (BOOL)isPurpleBuddyAccount;
- (BOOL)isUnderage;
- (BOOL)isUnknownPlayer;
- (CNContact)contact;
- (GKGameInternal)lastChallengedGame;
- (GKGameInternal)lastPlayedGame;
- (GKMessageInboxEntryInternal)inboxEntry;
- (GKPlayerInternal)initWithSanitizeBeforeEncodingBlock:(id)a3;
- (GKPlayerInternalOnboarding)onboarding;
- (GKScopedIDs)scopedIDs;
- (NSArray)friends;
- (NSDate)lastChallengedDate;
- (NSDate)lastPlayedDate;
- (NSDate)serviceLastUpdatedTimestamp;
- (NSDictionary)photos;
- (NSNumber)acceptedGameInviteFromThisFriend;
- (NSNumber)automatchedTogether;
- (NSNumber)avatarType;
- (NSNumber)friendBiDirectional;
- (NSNumber)friendLevel;
- (NSNumber)friendPlayedNearby;
- (NSNumber)friendPlayedWith;
- (NSNumber)initiatedGameInviteToThisFriend;
- (NSString)accountName;
- (NSString)alias;
- (NSString)compositeName;
- (NSString)contactsAssociationID;
- (NSString)firstName;
- (NSString)guestIdentifier;
- (NSString)lastName;
- (NSString)messagesID;
- (NSString)playerID;
- (NSString)status;
- (id)conciseDescription;
- (id)debugDescription;
- (id)displayNameWithOptions:(unsigned __int8)a3;
- (id)minimalInternal;
- (id)sanitizeBeforeEncoding;
- (id)serverRepresentation;
- (int)achievementsVisibility;
- (int)contactsIntegrationConsent;
- (int)defaultFamiliarity;
- (int)friendsVisibility;
- (int)gamesPlayedVisibility;
- (int)globalFriendListAccess;
- (int)globalFriendListSharingStatus;
- (unint64_t)hash;
- (unsigned)flags;
- (unsigned)numberOfAchievementPoints;
- (unsigned)numberOfAchievements;
- (unsigned)numberOfChallenges;
- (unsigned)numberOfFriends;
- (unsigned)numberOfFriendsInCommon;
- (unsigned)numberOfGames;
- (unsigned)numberOfGamesInCommon;
- (unsigned)numberOfRequests;
- (unsigned)numberOfTurns;
- (void)encodeWithCoder:(id)a3;
- (void)sanitize;
- (void)serverRepresentation;
- (void)setAcceptedGameInviteFromThisFriend:(id)a3;
- (void)setAchievementsVisibility:(int)a3;
- (void)setAlias:(id)a3;
- (void)setAutomatchedTogether:(id)a3;
- (void)setAvatarType:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactsAssociationID:(id)a3;
- (void)setContactsIntegrationConsent:(int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFriendBiDirectional:(id)a3;
- (void)setFriendLevel:(id)a3;
- (void)setFriendPlayedNearby:(id)a3;
- (void)setFriendPlayedWith:(id)a3;
- (void)setFriendsVisibility:(int)a3;
- (void)setGamesPlayedVisibility:(int)a3;
- (void)setInboxEntry:(id)a3;
- (void)setInitiatedGameInviteToThisFriend:(id)a3;
- (void)setIsArcadeSubscriber:(BOOL)a3;
- (void)setIsInContacts:(BOOL)a3;
- (void)setMessagesID:(id)a3;
- (void)setNumberOfAchievementPoints:(unsigned int)a3;
- (void)setNumberOfAchievements:(unsigned int)a3;
- (void)setNumberOfFriends:(unsigned __int16)a3;
- (void)setNumberOfFriendsInCommon:(unsigned __int16)a3;
- (void)setNumberOfGames:(unsigned __int16)a3;
- (void)setNumberOfGamesInCommon:(unsigned __int16)a3;
- (void)setOnboarding:(id)a3;
- (void)setPhotos:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setSanitizeBeforeEncoding:(id)a3;
- (void)setScopedIDs:(id)a3;
- (void)setServiceLastUpdatedTimestamp:(id)a3;
@end

@implementation GKPlayerInternal

- (BOOL)isUnderage
{
  return 0;
}

- (BOOL)isLocalPlayer
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKPlayerInternal)initWithSanitizeBeforeEncodingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(GKPlayerInternal *)self init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id sanitizeBeforeEncoding = v5->_sanitizeBeforeEncoding;
    v5->_id sanitizeBeforeEncoding = v6;
  }
  return v5;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_17 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_17, &__block_literal_global_57);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_17;

  return v2;
}

void __43__GKPlayerInternal_secureCodedPropertyKeys__block_invoke()
{
  v7[32] = *MEMORY[0x1E4F143B8];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v7[6] = objc_opt_class();
  v7[7] = objc_opt_class();
  v7[8] = objc_opt_class();
  v7[9] = objc_opt_class();
  v7[10] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"playerID", @"scopedIDs", @"alias", @"avatarType", @"friendLevel", @"friendBiDirectional", @"friendPlayedWith", @"friendPlayedNearby", @"acceptedGameInviteFromThisFriend", @"initiatedGameInviteToThisFriend", @"automatchedTogether", @"photos");
  v7[11] = v3;
  v6[12] = @"flags";
  v7[12] = objc_opt_class();
  v6[13] = @"numberOfFriends";
  v7[13] = objc_opt_class();
  v6[14] = @"numberOfFriendsInCommon";
  v7[14] = objc_opt_class();
  v6[15] = @"numberOfGames";
  v7[15] = objc_opt_class();
  v6[16] = @"numberOfGamesInCommon";
  v7[16] = objc_opt_class();
  v6[17] = @"numberOfAchievements";
  v7[17] = objc_opt_class();
  v6[18] = @"numberOfAchievementPoints";
  v7[18] = objc_opt_class();
  v6[19] = @"messagesID";
  v7[19] = objc_opt_class();
  v6[20] = @"onboarding";
  v7[20] = objc_opt_class();
  v6[21] = @"achievementsVisibility";
  v7[21] = objc_opt_class();
  v6[22] = @"gamesPlayedVisibility";
  v7[22] = objc_opt_class();
  v6[23] = @"friendsVisibility";
  v7[23] = objc_opt_class();
  v6[24] = @"globalFriendListAccess";
  v7[24] = objc_opt_class();
  v6[25] = @"isArcadeSubscriber";
  v7[25] = objc_opt_class();
  v6[26] = @"contactsIntegrationConsent";
  v7[26] = objc_opt_class();
  v6[27] = @"contactsAssociationID";
  v7[27] = objc_opt_class();
  v6[28] = @"inboxEntry";
  v7[28] = objc_opt_class();
  v6[29] = @"isInContacts";
  v7[29] = objc_opt_class();
  v6[30] = @"contact";
  v7[30] = objc_opt_class();
  v6[31] = @"serviceLastUpdatedTimestamp";
  v7[31] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:32];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_17;
  secureCodedPropertyKeys_sSecureCodedKeys_17 = v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKPlayerInternal *)self sanitizeBeforeEncoding];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(GKPlayerInternal *)self sanitizeBeforeEncoding];
    int v8 = v7[2]();

    if (v8) {
      [(GKPlayerInternal *)self sanitize];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)GKPlayerInternal;
  [(GKInternalRepresentation *)&v9 encodeWithCoder:v4];
}

- (id)conciseDescription
{
  v3 = NSString;
  id v4 = [(GKPlayerInternal *)self playerID];
  uint64_t v5 = [(GKPlayerInternal *)self alias];
  v6 = [(GKPlayerInternal *)self friendLevel];
  v7 = [v3 stringWithFormat:@"playerID:%@ alias:%@ FL%@", v4, v5, v6];

  return v7;
}

- (id)serverRepresentation
{
  uint64_t v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v3 = GKOSLoggers();
    uint64_t v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[GKPlayerInternal serverRepresentation](v2);
  }
  return (id)MEMORY[0x1E4F1CC08];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (GKPlayerInternal *)v4;
    if (self == v5)
    {
      char v8 = 1;
    }
    else
    {
      v6 = [(GKPlayerInternal *)self playerID];
      v7 = [(GKPlayerInternal *)v5 playerID];
      char v8 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = [(GKPlayerInternal *)self playerID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)minimalInternal
{
  unint64_t v3 = [(id)objc_opt_class() internalRepresentation];
  id v4 = [(GKPlayerInternal *)self playerID];
  [v3 setPlayerID:v4];

  uint64_t v5 = [(GKPlayerInternal *)self scopedIDs];
  [v3 setScopedIDs:v5];

  v6 = [(GKPlayerInternal *)self alias];
  [v3 setAlias:v6];

  v7 = [(GKPlayerInternal *)self firstName];
  [v3 setFirstName:v7];

  char v8 = [(GKPlayerInternal *)self lastName];
  [v3 setLastName:v8];

  objc_super v9 = [(GKPlayerInternal *)self friendLevel];
  [v3 setFriendLevel:v9];

  v10 = [(GKPlayerInternal *)self friendBiDirectional];
  [v3 setFriendBiDirectional:v10];

  v11 = [(GKPlayerInternal *)self friendPlayedWith];
  [v3 setFriendPlayedWith:v11];

  v12 = [(GKPlayerInternal *)self friendPlayedNearby];
  [v3 setFriendPlayedNearby:v12];

  v13 = [(GKPlayerInternal *)self acceptedGameInviteFromThisFriend];
  [v3 setAcceptedGameInviteFromThisFriend:v13];

  v14 = [(GKPlayerInternal *)self initiatedGameInviteToThisFriend];
  [v3 setInitiatedGameInviteToThisFriend:v14];

  v15 = [(GKPlayerInternal *)self automatchedTogether];
  [v3 setAutomatchedTogether:v15];

  v16 = [(GKPlayerInternal *)self compositeName];
  [v3 setCompositeName:v16];

  objc_msgSend(v3, "setAchievementsVisibility:", -[GKPlayerInternal achievementsVisibility](self, "achievementsVisibility"));
  objc_msgSend(v3, "setFriendsVisibility:", -[GKPlayerInternal friendsVisibility](self, "friendsVisibility"));
  objc_msgSend(v3, "setGamesPlayedVisibility:", -[GKPlayerInternal gamesPlayedVisibility](self, "gamesPlayedVisibility"));
  objc_msgSend(v3, "setGlobalFriendListAccess:", -[GKPlayerInternal globalFriendListAccess](self, "globalFriendListAccess"));
  objc_msgSend(v3, "setIsArcadeSubscriber:", -[GKPlayerInternal isArcadeSubscriber](self, "isArcadeSubscriber"));

  return v3;
}

+ (id)compositeNameForFirstName:(id)a3 lastName:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F1BA40];
    id v6 = a4;
    id v7 = a3;
    id v8 = objc_alloc_init(v5);
    [v8 setContactType:0];
    [v8 setGivenName:v7];

    [v8 setFamilyName:v6];
    objc_super v9 = [MEMORY[0x1E4F1B910] stringFromContact:v8 style:0];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (id)displayNameWithOptions:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = [(GKPlayerInternal *)self alias];
  if ((isKindOfClass & 1) == 0)
  {
    id v7 = objc_opt_class();
    id v8 = [(GKPlayerInternal *)self compositeName];
    uint64_t v9 = [v7 displayNameWithOptions:v3 alias:v6 composite:v8];

    id v6 = (void *)v9;
  }

  return v6;
}

+ (id)displayNameWithOptions:(unsigned __int8)a3 alias:(id)a4 composite:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (!v10 && (a3 & 1) == 0) {
    v12 = v8;
  }
  else {
    v12 = v7;
  }
  id v13 = v12;

  return v13;
}

+ (Class)classForFamiliarity:(int)a3
{
  uint64_t v3 = objc_opt_class();

  return (Class)v3;
}

- (int)defaultFamiliarity
{
  return 0;
}

- (BOOL)isLoaded
{
  NSUInteger v3 = [(NSString *)self->_playerID length];
  if (v3) {
    LOBYTE(v3) = [(NSString *)self->_alias length] != 0;
  }
  return v3;
}

- (BOOL)isFriend
{
  return 0;
}

- (BOOL)isAutomatchPlayer
{
  return 0;
}

- (BOOL)isUnknownPlayer
{
  return 0;
}

- (BOOL)isAnonymousPlayer
{
  return 0;
}

- (BOOL)isGuestPlayer
{
  return 0;
}

- (unsigned)flags
{
  return self->_flags._value;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags._value = a3;
}

- (void)setMessagesID:(id)a3
{
  if (self->_messagesID != a3)
  {
    id v4 = [a3 lowercaseString];
    messagesID = self->_messagesID;
    self->_messagesID = v4;
    MEMORY[0x1F41817F8](v4, messagesID);
  }
}

- (NSString)firstName
{
  return 0;
}

- (void)setContact:(id)a3
{
}

- (NSString)lastName
{
  return 0;
}

- (NSString)compositeName
{
  return 0;
}

- (NSString)status
{
  return 0;
}

- (NSDate)lastPlayedDate
{
  return 0;
}

- (GKGameInternal)lastPlayedGame
{
  return 0;
}

- (BOOL)challengedTogether
{
  return 0;
}

- (NSDate)lastChallengedDate
{
  return 0;
}

- (GKGameInternal)lastChallengedGame
{
  return 0;
}

- (BOOL)allowReceivingFriendInvites
{
  return 0;
}

- (NSString)accountName
{
  return 0;
}

- (NSArray)friends
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isPurpleBuddyAccount
{
  return 0;
}

- (BOOL)isDefaultNickname
{
  return 0;
}

- (BOOL)isDefaultPrivacyVisibility
{
  return 0;
}

- (BOOL)isDefaultContactsIntegrationConsent
{
  return 0;
}

- (int)globalFriendListSharingStatus
{
  return -1;
}

- (BOOL)isArcadeSubscriber
{
  return self->_isArcadeSubscriber;
}

- (void)setIsArcadeSubscriber:(BOOL)a3
{
  self->_isArcadeSubscriber = a3;
}

- (BOOL)isFindable
{
  return 0;
}

- (BOOL)isPhotoPending
{
  return 0;
}

- (BOOL)allowNearbyMultiplayer
{
  return 1;
}

- (unsigned)numberOfRequests
{
  return 0;
}

- (unsigned)numberOfTurns
{
  return 0;
}

- (unsigned)numberOfChallenges
{
  return 0;
}

- (BOOL)allowChallengeFriendInvites
{
  return 0;
}

- (BOOL)allowMultiplayerFriendInvites
{
  return 0;
}

- (BOOL)isFriendInvitationInContacts
{
  if ([(GKPlayerInternal *)self isInContacts]) {
    return 1;
  }
  id v4 = [(GKPlayerInternal *)self contact];
  BOOL v3 = v4 != 0;

  return v3;
}

- (NSString)guestIdentifier
{
  return 0;
}

- (id)debugDescription
{
  uint64_t v3 = [(GKPlayerInternal *)self playerID];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"nil";
  }
  id v6 = v5;

  uint64_t v7 = [(GKPlayerInternal *)self alias];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"nil";
  }
  BOOL v10 = v9;

  uint64_t v11 = [(GKPlayerInternal *)self accountName];
  v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = @"nil";
  }
  v14 = v13;

  v15 = NSString;
  uint64_t v16 = objc_opt_class();
  v17 = [NSNumber numberWithInt:self->_achievementsVisibility];
  v18 = [(GKPlayerInternal *)self scopedIDs];
  v19 = [v15 stringWithFormat:@"%@(%p)(playerID:%@, alias:%@, accountName: %@, _achievementsVisibility:%@, scopedIDs: %@)", v16, self, v6, v10, v14, v17, v18];

  return v19;
}

- (void)sanitize
{
  [(GKPlayerInternal *)self setAccountName:0];
  [(GKPlayerInternal *)self setFriends:MEMORY[0x1E4F1CBF0]];
  [(GKPlayerInternal *)self setFirstName:0];
  [(GKPlayerInternal *)self setLastName:0];
  [(GKPlayerInternal *)self setCompositeName:0];
  [(GKPlayerInternal *)self setLastPlayedGame:0];
  [(GKPlayerInternal *)self setStatus:0];
  [(GKPlayerInternal *)self setLastPlayedDate:0];
  [(GKPlayerInternal *)self setContact:0];
  [(GKPlayerInternal *)self setContactsAssociationID:0];
  [(GKPlayerInternal *)self setContactsIntegrationConsent:2];
  [(GKPlayerInternal *)self setChallengedTogether:0];
  [(GKPlayerInternal *)self setLastChallengedDate:0];
  [(GKPlayerInternal *)self setLastChallengedGame:0];
  [(GKPlayerInternal *)self setAllowReceivingFriendInvites:0];
  [(GKPlayerInternal *)self setAllowChallengeFriendInvites:0];

  [(GKPlayerInternal *)self setAllowMultiplayerFriendInvites:0];
}

- (NSString)playerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPlayerID:(id)a3
{
}

- (GKScopedIDs)scopedIDs
{
  return (GKScopedIDs *)objc_getProperty(self, a2, 16, 1);
}

- (void)setScopedIDs:(id)a3
{
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (NSNumber)avatarType
{
  return self->_avatarType;
}

- (void)setAvatarType:(id)a3
{
}

- (NSDictionary)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
}

- (unsigned)numberOfFriends
{
  return self->_numberOfFriends;
}

- (void)setNumberOfFriends:(unsigned __int16)a3
{
  self->_numberOfFriends = a3;
}

- (unsigned)numberOfFriendsInCommon
{
  return self->_numberOfFriendsInCommon;
}

- (void)setNumberOfFriendsInCommon:(unsigned __int16)a3
{
  self->_numberOfFriendsInCommon = a3;
}

- (unsigned)numberOfGames
{
  return self->_numberOfGames;
}

- (void)setNumberOfGames:(unsigned __int16)a3
{
  self->_numberOfGames = a3;
}

- (unsigned)numberOfGamesInCommon
{
  return self->_numberOfGamesInCommon;
}

- (void)setNumberOfGamesInCommon:(unsigned __int16)a3
{
  self->_numberOfGamesInCommon = a3;
}

- (unsigned)numberOfAchievements
{
  return self->_numberOfAchievements;
}

- (void)setNumberOfAchievements:(unsigned int)a3
{
  self->_numberOfAchievements = a3;
}

- (unsigned)numberOfAchievementPoints
{
  return self->_numberOfAchievementPoints;
}

- (void)setNumberOfAchievementPoints:(unsigned int)a3
{
  self->_numberOfAchievementPoints = a3;
}

- (NSString)messagesID
{
  return self->_messagesID;
}

- (NSNumber)friendLevel
{
  return self->_friendLevel;
}

- (void)setFriendLevel:(id)a3
{
}

- (NSNumber)friendBiDirectional
{
  return self->_friendBiDirectional;
}

- (void)setFriendBiDirectional:(id)a3
{
}

- (NSNumber)friendPlayedWith
{
  return self->_friendPlayedWith;
}

- (void)setFriendPlayedWith:(id)a3
{
}

- (NSNumber)friendPlayedNearby
{
  return self->_friendPlayedNearby;
}

- (void)setFriendPlayedNearby:(id)a3
{
}

- (NSNumber)acceptedGameInviteFromThisFriend
{
  return self->_acceptedGameInviteFromThisFriend;
}

- (void)setAcceptedGameInviteFromThisFriend:(id)a3
{
}

- (NSNumber)initiatedGameInviteToThisFriend
{
  return self->_initiatedGameInviteToThisFriend;
}

- (void)setInitiatedGameInviteToThisFriend:(id)a3
{
}

- (NSNumber)automatchedTogether
{
  return self->_automatchedTogether;
}

- (void)setAutomatchedTogether:(id)a3
{
}

- (int)achievementsVisibility
{
  return self->_achievementsVisibility;
}

- (void)setAchievementsVisibility:(int)a3
{
  self->_achievementsVisibility = a3;
}

- (int)gamesPlayedVisibility
{
  return self->_gamesPlayedVisibility;
}

- (void)setGamesPlayedVisibility:(int)a3
{
  self->_gamesPlayedVisibility = a3;
}

- (int)friendsVisibility
{
  return self->_friendsVisibility;
}

- (void)setFriendsVisibility:(int)a3
{
  self->_friendsVisibility = a3;
}

- (int)globalFriendListAccess
{
  return self->_globalFriendListAccess;
}

- (BOOL)isInContacts
{
  return self->_isInContacts;
}

- (void)setIsInContacts:(BOOL)a3
{
  self->_isInContacts = a3;
}

- (GKPlayerInternalOnboarding)onboarding
{
  return (GKPlayerInternalOnboarding *)objc_getProperty(self, a2, 240, 1);
}

- (void)setOnboarding:(id)a3
{
}

- (int)contactsIntegrationConsent
{
  return self->_contactsIntegrationConsent;
}

- (void)setContactsIntegrationConsent:(int)a3
{
  self->_contactsIntegrationConsent = a3;
}

- (NSString)contactsAssociationID
{
  return self->_contactsAssociationID;
}

- (void)setContactsAssociationID:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSDate)serviceLastUpdatedTimestamp
{
  return self->_serviceLastUpdatedTimestamp;
}

- (void)setServiceLastUpdatedTimestamp:(id)a3
{
}

- (GKMessageInboxEntryInternal)inboxEntry
{
  return self->_inboxEntry;
}

- (void)setInboxEntry:(id)a3
{
}

- (id)sanitizeBeforeEncoding
{
  return self->_sanitizeBeforeEncoding;
}

- (void)setSanitizeBeforeEncoding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sanitizeBeforeEncoding, 0);
  objc_storeStrong((id *)&self->_inboxEntry, 0);
  objc_storeStrong((id *)&self->_onboarding, 0);
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_serviceLastUpdatedTimestamp, 0);
  objc_storeStrong((id *)&self->_automatchedTogether, 0);
  objc_storeStrong((id *)&self->_initiatedGameInviteToThisFriend, 0);
  objc_storeStrong((id *)&self->_acceptedGameInviteFromThisFriend, 0);
  objc_storeStrong((id *)&self->_friendPlayedNearby, 0);
  objc_storeStrong((id *)&self->_friendPlayedWith, 0);
  objc_storeStrong((id *)&self->_friendBiDirectional, 0);
  objc_storeStrong((id *)&self->_friendLevel, 0);
  objc_storeStrong((id *)&self->_messagesID, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_avatarType, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactsAssociationID, 0);
  objc_storeStrong((id *)&self->_scopedIDs, 0);

  objc_storeStrong((id *)&self->_playerID, 0);
}

- (void)serverRepresentation
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "serverRepresentation doesn't do what we think it should do", v1, 2u);
}

@end