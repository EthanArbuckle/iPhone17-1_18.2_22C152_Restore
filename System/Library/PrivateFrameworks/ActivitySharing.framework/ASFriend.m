@interface ASFriend
+ (ASFriend)friendWithCodableFriend:(id)a3;
- (ASCompetition)competitionPendingAcceptance;
- (ASCompetition)currentCompetition;
- (ASCompetition)currentOrMostRecentCompetition;
- (ASCompetition)mostRecentlyCompletedCompetition;
- (ASContact)contact;
- (ASFriend)initWithActivitySnapshots:(id)a3 friendAchievements:(id)a4 friendWorkouts:(id)a5 contact:(id)a6 competitions:(id)a7;
- (BOOL)canSeeMyActivityData;
- (BOOL)estimatedIsStandaloneForSnapshotIndex:(id)a3;
- (BOOL)hasCompetitionHistory;
- (BOOL)hasCompetitionRequestFromMe;
- (BOOL)hasCompletedCompetition;
- (BOOL)hasCompletedFirstDayOfCurrentCompetition;
- (BOOL)hasInviteRequestFromMe;
- (BOOL)hasPendingCompetitionRequestFromMe;
- (BOOL)ignoredCompetitionRequestFromMe;
- (BOOL)inviteRequestToMeWasAccepted;
- (BOOL)isActivityDataCurrentlyVisibleToMe;
- (BOOL)isActivityDataVisibleToMeForDate:(id)a3;
- (BOOL)isAwaitingCompetitionResponseFromMe;
- (BOOL)isAwaitingInviteResponseFromMe;
- (BOOL)isCompetitionActive;
- (BOOL)isCurrentlyHidingActivityDataFromMe;
- (BOOL)isEligibleToReceiveCompetitionRequest;
- (BOOL)isFriendshipCurrentlyActive;
- (BOOL)isHidingActivityDataFromMeForDate:(id)a3;
- (BOOL)isMe;
- (BOOL)isMuted;
- (BOOL)isMyActivityDataCurrentlyHidden;
- (BOOL)needsDowngradeRequestAcknowledgment;
- (BOOL)sentInviteRequestToMe;
- (BOOL)supportsCompetitions;
- (NSArray)competitions;
- (NSArray)completedCompetitions;
- (NSDate)dateActivityDataInitiallyBecameVisibleToMe;
- (NSDate)dateForLatestDataHidden;
- (NSDate)dateForLatestDataHiddenFromMe;
- (NSDate)dateForLatestIncomingCompetitionRequest;
- (NSDate)dateForLatestOutgoingCompetitionRequest;
- (NSDate)dateForLatestOutgoingInviteRequest;
- (NSDate)dateForLatestRelationshipStart;
- (NSDate)earliestCompetitionVictoryOrPotentialVictoryDate;
- (NSDateComponents)currentDateComponents;
- (NSDictionary)friendAchievements;
- (NSDictionary)friendWorkouts;
- (NSDictionary)snapshots;
- (NSNumber)currentCacheIndex;
- (NSString)displayName;
- (NSString)fullName;
- (NSTimeZone)timeZone;
- (NSUUID)UUID;
- (_HKFitnessFriendActivitySnapshot)currentSnapshot;
- (_HKFitnessFriendActivitySnapshot)currentSnapshotWithGoalsCarriedForward;
- (_HKFitnessFriendActivitySnapshot)mostRecentSnapshot;
- (id)_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:(int64_t)a3;
- (id)codableFriendIncludingCloudKitFields:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (id)snapshotWithGoalsCarriedForwardForSnapshotIndex:(id)a3;
- (unint64_t)numberOfCompetitionWinsAgainstMe;
- (unint64_t)numberOfCompetitionWinsByMe;
- (void)setCompetitions:(id)a3;
- (void)setContact:(id)a3;
- (void)setFriendAchievements:(id)a3;
- (void)setFriendWorkouts:(id)a3;
- (void)setSnapshots:(id)a3;
@end

@implementation ASFriend

- (_HKFitnessFriendActivitySnapshot)currentSnapshotWithGoalsCarriedForward
{
  v3 = [(ASFriend *)self currentSnapshot];
  if (!v3)
  {
    v4 = [(ASFriend *)self currentCacheIndex];
    v3 = -[ASFriend _emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:](self, "_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:", [v4 integerValue]);
  }

  return (_HKFitnessFriendActivitySnapshot *)v3;
}

- (_HKFitnessFriendActivitySnapshot)currentSnapshot
{
  v3 = [(ASFriend *)self currentCacheIndex];
  v4 = [(NSDictionary *)self->_snapshots objectForKeyedSubscript:v3];

  return (_HKFitnessFriendActivitySnapshot *)v4;
}

- (NSNumber)currentCacheIndex
{
  currentCacheIndex = self->_currentCacheIndex;
  if (!currentCacheIndex)
  {
    v4 = [(ASFriend *)self currentDateComponents];
    v5 = [NSNumber numberWithLongLong:_HKCacheIndexFromDateComponents()];
    v6 = self->_currentCacheIndex;
    self->_currentCacheIndex = v5;

    currentCacheIndex = self->_currentCacheIndex;
  }

  return currentCacheIndex;
}

- (NSDateComponents)currentDateComponents
{
  v2 = [(ASFriend *)self timeZone];
  if (currentDateComponents_onceToken != -1) {
    dispatch_once(&currentDateComponents_onceToken, &__block_literal_global_331);
  }
  [(id)currentDateComponents___friendTimeZoneCalendar setTimeZone:v2];
  v3 = (void *)currentDateComponents___friendTimeZoneCalendar;
  v4 = [MEMORY[0x263EFF910] date];
  v5 = [v3 components:30 fromDate:v4];

  return (NSDateComponents *)v5;
}

- (NSTimeZone)timeZone
{
  v2 = [(ASFriend *)self mostRecentSnapshot];
  v3 = [v2 timeZone];
  if (!v3)
  {
    v3 = [MEMORY[0x263EFFA18] localTimeZone];
  }

  return (NSTimeZone *)v3;
}

- (_HKFitnessFriendActivitySnapshot)mostRecentSnapshot
{
  v2 = [(NSDictionary *)self->_snapshots allValues];
  v3 = _HKMostRecentActivitySnapshotInSnapshots();

  return (_HKFitnessFriendActivitySnapshot *)v3;
}

- (void)setSnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_snapshots, a3);
  id v6 = a3;
  currentCacheIndex = self->_currentCacheIndex;
  self->_currentCacheIndex = 0;
}

- (NSString)displayName
{
  if ([(ASFriend *)self isMe])
  {
    v3 = ActivitySharingBundle();
    [v3 localizedStringForKey:@"ME" value:&stru_26D045AA8 table:@"Localizable"];
  }
  else
  {
    v3 = [(ASFriend *)self contact];
    [v3 displayName];
  v4 = };

  return (NSString *)v4;
}

- (BOOL)isMe
{
  v2 = [(ASFriend *)self contact];
  BOOL v3 = v2 == 0;

  return v3;
}

- (ASContact)contact
{
  return self->_contact;
}

- (ASFriend)initWithActivitySnapshots:(id)a3 friendAchievements:(id)a4 friendWorkouts:(id)a5 contact:(id)a6 competitions:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ASFriend;
  v17 = [(ASFriend *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_snapshots, a3);
    objc_storeStrong((id *)&v18->_friendAchievements, a4);
    objc_storeStrong((id *)&v18->_friendWorkouts, a5);
    objc_storeStrong((id *)&v18->_contact, a6);
    objc_storeStrong((id *)&v18->_competitions, a7);
  }

  return v18;
}

- (NSDictionary)snapshots
{
  return self->_snapshots;
}

- (BOOL)isFriendshipCurrentlyActive
{
  BOOL v3 = [(ASContact *)self->_contact primaryRelationship];
  v4 = [(ASContact *)self->_contact primaryRemoteRelationship];
  if ([v3 isFriendshipActive]) {
    char v5 = [v4 isFriendshipActive];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isActivityDataCurrentlyVisibleToMe
{
  v2 = [(ASContact *)self->_contact primaryRemoteRelationship];
  char v3 = [v2 isActivityDataVisible];

  return v3;
}

uint64_t __33__ASFriend_currentDateComponents__block_invoke()
{
  currentDateComponents___friendTimeZoneCalendar = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");

  return MEMORY[0x270F9A758]();
}

- (id)codableFriendIncludingCloudKitFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v49 = *MEMORY[0x263EF8340];
  char v5 = objc_alloc_init(ASCodableFriend);
  id v6 = [(ASFriend *)self contact];
  v7 = [v6 codableContactIncludingCloudKitFields:v3];
  [(ASCodableFriend *)v5 setContact:v7];

  v8 = [(ASFriend *)self snapshots];
  v9 = [v8 allValues];
  v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_1);
  v11 = (void *)[v10 mutableCopy];
  [(ASCodableFriend *)v5 setSnapshots:v11];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v12 = [(ASFriend *)self friendWorkouts];
  id v13 = [v12 allValues];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    v17 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v18 = 0;
      v19 = v17;
      do
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        id v20 = ASCodableWorkoutsFromWorkouts(*(void **)(*((void *)&v43 + 1) + 8 * v18));
        objc_super v21 = [v20 allObjects];
        v17 = [v19 arrayByAddingObjectsFromArray:v21];

        ++v18;
        v19 = v17;
      }
      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v15);
  }
  else
  {
    v17 = (void *)MEMORY[0x263EFFA68];
  }

  v22 = (void *)[v17 mutableCopy];
  [(ASCodableFriend *)v5 setWorkouts:v22];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v38 = self;
  v23 = [(ASFriend *)self friendAchievements];
  v24 = [v23 allValues];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v40;
    v28 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v29 = 0;
      v30 = v28;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v24);
        }
        v31 = ASCodableAchievementsFromAchievements(*(void **)(*((void *)&v39 + 1) + 8 * v29));
        v32 = [v31 allObjects];
        v28 = [v30 arrayByAddingObjectsFromArray:v32];

        ++v29;
        v30 = v28;
      }
      while (v26 != v29);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v26);
  }
  else
  {
    v28 = (void *)MEMORY[0x263EFFA68];
  }

  v33 = (void *)[v28 mutableCopy];
  [(ASCodableFriend *)v5 setAchievements:v33];

  v34 = [(ASFriend *)v38 competitions];
  v35 = objc_msgSend(v34, "hk_map:", &__block_literal_global_283);
  v36 = (void *)[v35 mutableCopy];
  [(ASCodableFriend *)v5 setCompetitions:v36];

  return v5;
}

uint64_t __64__ASFriend_DomainCodable__codableFriendIncludingCloudKitFields___block_invoke(uint64_t a1, void *a2)
{
  return [a2 codableSnapshot];
}

uint64_t __64__ASFriend_DomainCodable__codableFriendIncludingCloudKitFields___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 codableCompetition];
}

+ (ASFriend)friendWithCodableFriend:(id)a3
{
  id v3 = a3;
  v4 = [v3 contact];
  char v5 = +[ASContact contactWithCodableContact:v4];

  id v6 = [v3 snapshots];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __51__ASFriend_DomainCodable__friendWithCodableFriend___block_invoke;
  v28[3] = &unk_2644E8260;
  id v29 = v5;
  id v7 = v5;
  v8 = objc_msgSend(v6, "hk_map:", v28);

  v9 = ASSnapshotDictionaryByIndex((uint64_t)v8);
  v10 = (void *)MEMORY[0x263EFFA08];
  v11 = [v3 workouts];
  v12 = [v10 setWithArray:v11];
  id v13 = [v7 UUID];
  uint64_t v14 = ASWorkoutsFromCodableWorkouts(v12, v13);

  uint64_t v15 = [v14 allObjects];
  uint64_t v16 = ASWorkoutDictionaryByIndex((uint64_t)v15);

  v17 = (void *)MEMORY[0x263EFFA08];
  uint64_t v18 = [v3 achievements];
  v19 = [v17 setWithArray:v18];
  id v20 = [v7 UUID];
  objc_super v21 = ASAchievementsFromCodableAchievements(v19, v20);

  v22 = [v21 allObjects];
  v23 = ASAchievementDictionaryByIndex((uint64_t)v22);

  v24 = [v3 competitions];

  uint64_t v25 = objc_msgSend(v24, "hk_map:", &__block_literal_global_289);

  uint64_t v26 = [[ASFriend alloc] initWithActivitySnapshots:v9 friendAchievements:v23 friendWorkouts:v16 contact:v7 competitions:v25];

  return v26;
}

id __51__ASFriend_DomainCodable__friendWithCodableFriend___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F0A9D0];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 UUID];
  id v6 = [v2 fitnessFriendActivitySnapshotWithCodableSnapshot:v4 friendUUID:v5];

  return v6;
}

ASCompetition *__51__ASFriend_DomainCodable__friendWithCodableFriend___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[ASCompetition competitionWithCodableCompetition:a2];
}

- (NSUUID)UUID
{
  return [(ASContact *)self->_contact UUID];
}

- (id)description
{
  id v3 = [(ASContact *)self->_contact relationship];
  id v4 = [(ASContact *)self->_contact remoteRelationship];
  char v5 = NSString;
  id v6 = [(ASContact *)self->_contact displayName];
  id v7 = [(ASFriend *)self UUID];
  v8 = [v5 stringWithFormat:@"ASFriend %@ (%@), local relationship: %@, remote relationship: %@, competitions: %@", v6, v7, v3, v4, self->_competitions];

  return v8;
}

- (id)fullDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"==================================================================\n"];
  id v4 = [(ASFriend *)self displayName];
  char v5 = [(ASFriend *)self fullName];
  id v6 = [(ASFriend *)self UUID];
  id v7 = [(ASFriend *)self timeZone];
  [v3 appendFormat:@"%@ [%@] (%@) %@\n", v4, v5, v6, v7];

  [v3 appendFormat:@"==================================================================\n\n"];
  v8 = [(ASContact *)self->_contact fullDescription];
  [v3 appendFormat:@"%@\n", v8];

  v9 = [(ASContact *)self->_contact relationshipStorage];
  v10 = [v9 fullDescription];
  [v3 appendFormat:@"%@", v10];

  [v3 appendFormat:@"Competitions: %@\n", self->_competitions];
  [v3 appendFormat:@"Snapshots: %@\n", self->_snapshots];
  [v3 appendFormat:@"Achievements: %@\n", self->_friendAchievements];
  [v3 appendFormat:@"Workouts: %@\n", self->_friendWorkouts];
  objc_msgSend(v3, "appendFormat:", @"My Data Visible: %d\n", -[ASFriend canSeeMyActivityData](self, "canSeeMyActivityData"));
  objc_msgSend(v3, "appendFormat:", @"My Data Explicitly Hidden: %d\n", -[ASFriend isMyActivityDataCurrentlyHidden](self, "isMyActivityDataCurrentlyHidden"));
  objc_msgSend(v3, "appendFormat:", @"Friend Data Visible: %d\n", -[ASFriend isActivityDataCurrentlyVisibleToMe](self, "isActivityDataCurrentlyVisibleToMe"));
  objc_msgSend(v3, "appendFormat:", @"Friend Explicitly Hiding: %d\n", -[ASFriend isCurrentlyHidingActivityDataFromMe](self, "isCurrentlyHidingActivityDataFromMe"));
  v11 = (void *)[v3 copy];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = (void *)[(NSDictionary *)self->_snapshots copyWithZone:a3];
  id v7 = (void *)[(NSDictionary *)self->_friendAchievements copyWithZone:a3];
  v8 = (void *)[(NSDictionary *)self->_friendWorkouts copyWithZone:a3];
  id v9 = [(ASContact *)self->_contact copyWithZone:a3];
  v10 = (void *)[(NSArray *)self->_competitions copyWithZone:a3];
  v11 = (void *)[v5 initWithActivitySnapshots:v6 friendAchievements:v7 friendWorkouts:v8 contact:v9 competitions:v10];

  return v11;
}

- (BOOL)canSeeMyActivityData
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 isActivityDataVisible];

  return v3;
}

- (BOOL)isMyActivityDataCurrentlyHidden
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 isHidingActivityData];

  return v3;
}

- (BOOL)isCurrentlyHidingActivityDataFromMe
{
  v2 = [(ASContact *)self->_contact primaryRemoteRelationship];
  char v3 = [v2 isHidingActivityData];

  return v3;
}

- (BOOL)isActivityDataVisibleToMeForDate:(id)a3
{
  contact = self->_contact;
  id v4 = a3;
  char v5 = [(ASContact *)contact primaryRemoteRelationship];
  id v6 = [v5 relationshipSnapshotForDate:v4];

  LOBYTE(v5) = [v6 isActivityDataVisible];
  return (char)v5;
}

- (BOOL)isMuted
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 isMuteEnabled];

  return v3;
}

- (BOOL)isAwaitingInviteResponseFromMe
{
  char v3 = ASSecureCloudEnabled();
  id v4 = [(ASContact *)self->_contact primaryRelationship];
  int v5 = [v4 isAwaitingInviteResponse];
  char v6 = v3 ^ 1;
  char v7 = (v3 ^ 1) & v5;
  if ((v6 & 1) == 0 && v5)
  {
    if ([v4 cloudType] == 1)
    {
      v8 = [(ASContact *)self->_contact pendingRelationshipShareItem];
      if (v8)
      {
        id v9 = [(ASContact *)self->_contact pendingLegacyShareLocations];
        char v7 = v9 != 0;
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 1;
    }
  }

  return v7;
}

- (BOOL)sentInviteRequestToMe
{
  char v3 = ASSecureCloudEnabled();
  id v4 = [(ASContact *)self->_contact primaryRelationship];
  int v5 = [v4 hasIncomingInviteRequest];
  char v6 = v3 ^ 1;
  char v7 = (v3 ^ 1) & v5;
  if ((v6 & 1) == 0 && v5)
  {
    if ([v4 cloudType] == 1)
    {
      v8 = [(ASContact *)self->_contact pendingRelationshipShareItem];
      if (v8)
      {
        id v9 = [(ASContact *)self->_contact pendingLegacyShareLocations];
        char v7 = v9 != 0;
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 1;
    }
  }

  return v7;
}

- (BOOL)hasInviteRequestFromMe
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 hasOutgoingInviteRequest];

  return v3;
}

- (BOOL)inviteRequestToMeWasAccepted
{
  char v3 = [(ASContact *)self->_contact primaryRelationship];
  if ([v3 hasIncomingInviteRequest])
  {
    id v4 = [(ASContact *)self->_contact primaryRelationship];
    int v5 = [v4 isAwaitingInviteResponse] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSDate)dateForLatestOutgoingInviteRequest
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 dateForLatestOutgoingInviteRequest];

  return (NSDate *)v3;
}

- (NSDate)dateForLatestDataHiddenFromMe
{
  v2 = [(ASContact *)self->_contact primaryRemoteRelationship];
  char v3 = [v2 dateForLatestDataHidden];

  return (NSDate *)v3;
}

- (NSDate)dateForLatestDataHidden
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 dateForLatestDataHidden];

  return (NSDate *)v3;
}

- (NSDate)dateActivityDataInitiallyBecameVisibleToMe
{
  v2 = [(ASContact *)self->_contact primaryRemoteRelationship];
  char v3 = [v2 dateActivityDataInitiallyBecameVisible];

  return (NSDate *)v3;
}

- (BOOL)isHidingActivityDataFromMeForDate:(id)a3
{
  contact = self->_contact;
  id v4 = a3;
  int v5 = [(ASContact *)contact primaryRemoteRelationship];
  char v6 = [v5 relationshipSnapshotForDate:v4];

  LOBYTE(v5) = [v6 isHidingActivityData];
  return (char)v5;
}

- (NSDate)dateForLatestRelationshipStart
{
  char v3 = [(ASContact *)self->_contact primaryRemoteRelationship];
  id v4 = [v3 dateForLatestRelationshipStart];

  int v5 = [(ASContact *)self->_contact primaryRelationship];
  char v6 = [v5 dateForLatestRelationshipStart];

  if (objc_msgSend(v4, "hk_isAfterDate:", v6)) {
    char v7 = v4;
  }
  else {
    char v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (NSDate)dateForLatestOutgoingCompetitionRequest
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 dateForLatestOutgoingCompetitionRequest];

  return (NSDate *)v3;
}

- (NSDate)dateForLatestIncomingCompetitionRequest
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 dateForLatestIncomingCompetitionRequest];

  return (NSDate *)v3;
}

- (BOOL)isAwaitingCompetitionResponseFromMe
{
  if ([(ASFriend *)self isCompetitionActive]) {
    return 0;
  }
  id v4 = [(ASContact *)self->_contact primaryRelationship];
  if ([v4 hasIncomingCompetitionRequest])
  {
    int v5 = [(ASFriend *)self dateForLatestIncomingCompetitionRequest];
    char HasExpired = ASCompetitionRequestHasExpired(v5);

    char v3 = HasExpired ^ 1;
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasCompetitionRequestFromMe
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 hasOutgoingCompetitionRequest];

  return v3;
}

- (BOOL)hasPendingCompetitionRequestFromMe
{
  if (![(ASFriend *)self isCompetitionActive])
  {
    int v3 = [(ASFriend *)self hasCompetitionRequestFromMe];
    if (!v3) {
      return v3;
    }
    if (![(ASFriend *)self ignoredCompetitionRequestFromMe]) {
      goto LABEL_6;
    }
    id v4 = [(ASContact *)self->_contact primaryRemoteRelationship];
    int v5 = [v4 dateForLatestIgnoredCompetitionRequest];
    char v6 = [(ASFriend *)self dateForLatestOutgoingCompetitionRequest];
    char v7 = objc_msgSend(v5, "hk_isAfterDate:", v6);

    if ((v7 & 1) == 0)
    {
LABEL_6:
      v8 = [(ASFriend *)self dateForLatestOutgoingCompetitionRequest];
      char HasExpired = ASCompetitionRequestHasExpired(v8);

      LOBYTE(v3) = HasExpired ^ 1;
      return v3;
    }
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)ignoredCompetitionRequestFromMe
{
  int v3 = [(ASContact *)self->_contact primaryRemoteRelationship];
  if ([v3 hasIgnoredCompetitionRequest])
  {
    id v4 = [(ASFriend *)self dateForLatestOutgoingCompetitionRequest];
    int v5 = [v3 dateForLatestIgnoredCompetitionRequest];
    char v6 = objc_msgSend(v5, "hk_isAfterDate:", v4);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isCompetitionActive
{
  int v3 = [(ASContact *)self->_contact primaryRelationship];
  id v4 = [(ASContact *)self->_contact primaryRemoteRelationship];
  BOOL v5 = ([v3 isCompetitionActive] & 1) != 0
    || [v3 hasCompletedCompetition] && (objc_msgSend(v4, "isCompetitionActive") & 1) != 0;

  return v5;
}

- (NSArray)completedCompetitions
{
  competitions = self->_competitions;
  if (!competitions) {
    competitions = (NSArray *)MEMORY[0x263EFFA68];
  }
  id v4 = competitions;
  if ([(NSArray *)v4 count])
  {
    BOOL v5 = [(ASFriend *)self isCompetitionActive];
    BOOL v6 = [(ASFriend *)self hasCompletedCompetition];
    if (v5 || !v6)
    {
      uint64_t v7 = -[NSArray subarrayWithRange:](v4, "subarrayWithRange:", 0, [(NSArray *)v4 count] - 1);

      id v4 = (NSArray *)v7;
    }
  }
  v8 = [(NSArray *)v4 hk_filter:&__block_literal_global_15];

  v10 = ASCompetitionsSortedByEndDate(v8, v9);

  return (NSArray *)v10;
}

BOOL __33__ASFriend_completedCompetitions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stage] == 2;
}

- (ASCompetition)mostRecentlyCompletedCompetition
{
  v2 = [(ASFriend *)self completedCompetitions];
  int v3 = [v2 lastObject];

  return (ASCompetition *)v3;
}

- (ASCompetition)currentOrMostRecentCompetition
{
  if ([(ASFriend *)self isCompetitionActive]) {
    [(ASFriend *)self currentCompetition];
  }
  else {
  int v3 = [(ASFriend *)self mostRecentlyCompletedCompetition];
  }

  return (ASCompetition *)v3;
}

- (ASCompetition)currentCompetition
{
  if ([(ASFriend *)self isCompetitionActive])
  {
    int v3 = [(NSArray *)self->_competitions lastObject];
  }
  else
  {
    int v3 = 0;
  }

  return (ASCompetition *)v3;
}

- (ASCompetition)competitionPendingAcceptance
{
  if ([(ASFriend *)self hasPendingCompetitionRequestFromMe]
    || [(ASFriend *)self isAwaitingCompetitionResponseFromMe])
  {
    int v3 = [(NSArray *)self->_competitions lastObject];
  }
  else
  {
    int v3 = 0;
  }

  return (ASCompetition *)v3;
}

- (BOOL)hasCompletedCompetition
{
  v2 = [(ASContact *)self->_contact primaryRelationship];
  char v3 = [v2 hasCompletedCompetition];

  return v3;
}

- (BOOL)hasCompletedFirstDayOfCurrentCompetition
{
  int v3 = [(ASFriend *)self isCompetitionActive];
  if (v3)
  {
    id v4 = [(ASFriend *)self currentCompetition];
    uint64_t v5 = [v4 stage];

    if (v5 == 1)
    {
      BOOL v6 = [(ASFriend *)self currentCompetition];
      char v7 = [v6 isFirstDayOfCompetition];

      LOBYTE(v3) = v7 ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isEligibleToReceiveCompetitionRequest
{
  if ([(ASFriend *)self isCompetitionActive]
    || [(ASFriend *)self isAwaitingCompetitionResponseFromMe])
  {
    return 0;
  }
  else
  {
    return ![(ASFriend *)self hasPendingCompetitionRequestFromMe];
  }
}

- (BOOL)hasCompetitionHistory
{
  v2 = [(ASFriend *)self completedCompetitions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (unint64_t)numberOfCompetitionWinsAgainstMe
{
  v2 = [(ASFriend *)self completedCompetitions];
  unint64_t v3 = ASCompetitionWinCountForParticipant(v2, 1);

  return v3;
}

- (unint64_t)numberOfCompetitionWinsByMe
{
  v2 = [(ASFriend *)self completedCompetitions];
  unint64_t v3 = ASCompetitionWinCountForParticipant(v2, 0);

  return v3;
}

- (NSDate)earliestCompetitionVictoryOrPotentialVictoryDate
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v3 = [MEMORY[0x263EFF910] distantFuture];
  if ([(ASFriend *)self isCompetitionActive])
  {
    id v4 = [(ASFriend *)self currentCompetition];
  }
  else
  {
    uint64_t v5 = [(ASFriend *)self competitionPendingAcceptance];

    if (!v5) {
      goto LABEL_6;
    }
    id v4 = [(ASFriend *)self competitionPendingAcceptance];
  }
  BOOL v6 = v4;
  uint64_t v7 = [v4 endDate];

  unint64_t v3 = (void *)v7;
LABEL_6:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(ASFriend *)self completedCompetitions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 isParticipantWinning:0])
        {
          uint64_t v14 = [v13 endDate];
          int v15 = objc_msgSend(v14, "hk_isBeforeDate:", v3);

          if (v15)
          {
            uint64_t v16 = [v13 endDate];

            unint64_t v3 = (void *)v16;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return (NSDate *)v3;
}

- (id)_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:(int64_t)a3
{
  id v4 = [(ASFriend *)self mostRecentSnapshot];
  if (v4)
  {
    uint64_t v5 = _HKStartDateForSnapshotIndex();
    BOOL v6 = _HKEndDateForSnapshotIndex();
    uint64_t v7 = (void *)MEMORY[0x263F0A9D0];
    v8 = [v4 sourceUUID];
    uint64_t v9 = [v7 _fitnessFriendActivitySnapshotWithSnapshotIndex:a3 startDate:v5 endDate:v6 sourceUUID:v8];

    [v4 mmg];
    objc_msgSend(v9, "setMmg:");
    [v4 energyBurnedGoal];
    objc_msgSend(v9, "setEnergyBurnedGoal:");
    [v4 briskMinutesGoal];
    objc_msgSend(v9, "setBriskMinutesGoal:");
    [v4 activeHoursGoal];
    objc_msgSend(v9, "setActiveHoursGoal:");
    objc_msgSend(v9, "setAmm:", objc_msgSend(v4, "amm"));
    [v9 setHasCarriedForwardGoals:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)snapshotWithGoalsCarriedForwardForSnapshotIndex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASFriend *)self snapshots];
  BOOL v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    BOOL v6 = -[ASFriend _emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:](self, "_emptySnapshotWithGoalsCarriedForwardForSnapshotIndex:", [v4 integerValue]);
  }

  return v6;
}

- (BOOL)estimatedIsStandaloneForSnapshotIndex:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_snapshots objectForKeyedSubscript:v4];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = [v5 activitySummary];
    char v8 = [v7 _isStandalonePhoneSummary];
  }
  else
  {
    uint64_t v9 = [(NSDictionary *)self->_snapshots allKeys];
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_326];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v10;
    uint64_t v11 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v30;
      while (2)
      {
        uint64_t v15 = 0;
        unint64_t v16 = v13;
        do
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v7);
          }
          v17 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
          uint64_t v18 = [v17 longLongValue];
          uint64_t v19 = [v4 longLongValue];
          unint64_t v13 = v17;
          if (v18 >= v19)
          {

            if (v16 && v13)
            {
              uint64_t v23 = [v4 longLongValue];
              uint64_t v24 = v23 - [(id)v16 longLongValue];
              if (v24 >= [(id)v13 longLongValue] - v23) {
                unint64_t v22 = v13;
              }
              else {
                unint64_t v22 = v16;
              }
              long long v20 = (void *)v13;
              BOOL v6 = 0;
            }
            else
            {
              if (v16) {
                unint64_t v22 = v16;
              }
              else {
                unint64_t v22 = v13;
              }
              BOOL v6 = 0;
              if (!(v16 | v13)) {
                goto LABEL_27;
              }
              long long v20 = (void *)v13;
            }
            goto LABEL_25;
          }

          ++v15;
          unint64_t v16 = v13;
        }
        while (v12 != v15);
        uint64_t v12 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }

      long long v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = v13;
      unint64_t v16 = v13;
      BOOL v6 = 0;
      if (!v13) {
        goto LABEL_29;
      }
LABEL_25:
      uint64_t v25 = [(NSDictionary *)self->_snapshots objectForKeyedSubscript:v22];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = [v25 activitySummary];
        char v8 = [v27 _isStandalonePhoneSummary];

        goto LABEL_30;
      }
      unint64_t v21 = v16;
    }
    else
    {

LABEL_27:
      long long v20 = 0;
      unint64_t v21 = 0;
    }
LABEL_29:
    uint64_t v26 = objc_msgSend(MEMORY[0x263F0A980], "sharedBehavior", v22);
    char v8 = [v26 isStandalonePhoneFitnessMode];
    unint64_t v16 = v21;
LABEL_30:
  }
  return v8;
}

uint64_t __50__ASFriend_estimatedIsStandaloneForSnapshotIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 longLongValue];
  if (v6 >= [v5 longLongValue])
  {
    uint64_t v8 = [v4 longLongValue];
    uint64_t v7 = v8 > [v5 longLongValue];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (BOOL)supportsCompetitions
{
  v2 = [(ASContact *)self->_contact primaryRemoteRelationship];
  char v3 = [v2 supportsCompetitions];

  return v3;
}

- (BOOL)needsDowngradeRequestAcknowledgment
{
  if ([(ASContact *)self->_contact cloudType] != 1) {
    return 0;
  }
  char v3 = [(ASContact *)self->_contact relationshipStorage];
  id v4 = [v3 legacyRemoteRelationship];
  char v5 = [v4 secureCloudDowngradeNeedsAcknowledgement];

  return v5;
}

- (NSString)fullName
{
  if ([(ASFriend *)self isMe])
  {
    char v3 = ActivitySharingBundle();
    uint64_t v4 = [v3 localizedStringForKey:@"ME" value:&stru_26D045AA8 table:@"Localizable"];
  }
  else
  {
    char v5 = [(ASFriend *)self contact];
    uint64_t v6 = [v5 fullName];

    uint64_t v7 = [(ASFriend *)self contact];
    char v3 = v7;
    if (v6) {
      [v7 fullName];
    }
    else {
    uint64_t v4 = [v7 displayName];
    }
  }
  uint64_t v8 = (void *)v4;

  return (NSString *)v8;
}

- (void)setContact:(id)a3
{
}

- (NSArray)competitions
{
  return self->_competitions;
}

- (void)setCompetitions:(id)a3
{
}

- (NSDictionary)friendAchievements
{
  return self->_friendAchievements;
}

- (void)setFriendAchievements:(id)a3
{
}

- (NSDictionary)friendWorkouts
{
  return self->_friendWorkouts;
}

- (void)setFriendWorkouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendWorkouts, 0);
  objc_storeStrong((id *)&self->_friendAchievements, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_competitions, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_currentCacheIndex, 0);
}

@end