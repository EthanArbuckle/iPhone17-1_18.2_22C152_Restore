@interface GKAchievementInternal
+ (BOOL)supportsSecureCoding;
+ (id)secureCodedPropertyKeys;
- (BOOL)isCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isReplayable;
- (GKAchievementInternal)initWithCoder:(id)a3;
- (GKGameInternal)gameHint;
- (GKPlayerInternal)player;
- (NSArray)friendsWhoHaveThis;
- (NSDate)lastReportedDate;
- (NSDictionary)icons;
- (NSNumber)rarityPercent;
- (NSString)achievedDescription;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSString)title;
- (NSString)unachievedDescription;
- (double)percentComplete;
- (id)descriptionSubstitutionMap;
- (id)serverRepresentation;
- (unint64_t)hash;
- (unint64_t)releaseState;
- (unsigned)attributes;
- (unsigned)maximumPoints;
- (void)encodeWithCoder:(id)a3;
- (void)setAchievedDescription:(id)a3;
- (void)setAttributes:(unsigned int)a3;
- (void)setFriendsWhoHaveThis:(id)a3;
- (void)setGameHint:(id)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIcons:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastReportedDate:(id)a3;
- (void)setMaximumPoints:(unsigned __int16)a3;
- (void)setPercentComplete:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setRarityPercent:(id)a3;
- (void)setReleaseState:(unint64_t)a3;
- (void)setReplayable:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUnachievedDescription:(id)a3;
@end

@implementation GKAchievementInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_19 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_19, &__block_literal_global_59);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_19;

  return v2;
}

void __48__GKAchievementInternal_secureCodedPropertyKeys__block_invoke()
{
  v11[14] = *MEMORY[0x1E4F143B8];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"achievedDescription", @"attributes", @"friendsWhoHaveThis");
  v11[2] = v3;
  v10[3] = @"groupIdentifier";
  v11[3] = objc_opt_class();
  v10[4] = @"icons";
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v11[4] = v7;
  v10[5] = @"identifier";
  v11[5] = objc_opt_class();
  v10[6] = @"lastReportedDate";
  v11[6] = objc_opt_class();
  v10[7] = @"percentComplete";
  v11[7] = objc_opt_class();
  v10[8] = @"player";
  v11[8] = objc_opt_class();
  v10[9] = @"rarityPercent";
  v11[9] = objc_opt_class();
  v10[10] = @"releaseState";
  v11[10] = objc_opt_class();
  v10[11] = @"title";
  v11[11] = objc_opt_class();
  v10[12] = @"unachievedDescription";
  v11[12] = objc_opt_class();
  v10[13] = @"gameHint";
  v11[13] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:14];

  v9 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_19;
  secureCodedPropertyKeys_sSecureCodedKeys_19 = v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKAchievementInternal;
  id v4 = a3;
  [(GKInternalRepresentation *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(GKAchievementInternal *)self player];
  uint64_t v6 = [v5 playerID];
  [v4 encodeObject:v6 forKey:@"playerID"];

  [v4 encodeObject:MEMORY[0x1E4F1CC38] forKey:@"hasFullPlayer"];
}

- (GKAchievementInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKAchievementInternal;
  uint64_t v5 = [(GKInternalRepresentation *)&v11 initWithCoder:v4];
  uint64_t v6 = v5;
  if (v5 && !v5->_player)
  {
    objc_super v7 = +[GKInternalRepresentation internalRepresentation];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playerID"];
    [(GKPlayerInternal *)v7 setPlayerID:v8];

    player = v6->_player;
    v6->_player = v7;
  }
  return v6;
}

- (id)serverRepresentation
{
  [(GKAchievementInternal *)self percentComplete];
  double v4 = v3;
  uint64_t v5 = [(GKAchievementInternal *)self lastReportedDate];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  float v6 = v4;
  if (v6 <= 100.0) {
    float v7 = v4;
  }
  else {
    float v7 = 100.0;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  v9 = [(GKAchievementInternal *)self identifier];
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[GKAchievementInternal isHidden](self, "isHidden"));
  objc_super v11 = [NSNumber numberWithLong:(uint64_t)v7];
  v12 = [v5 _gkServerTimestamp];
  v13 = [(GKAchievementInternal *)self groupIdentifier];
  v14 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"achievement-id", v10, @"is-hidden", v11, @"achievement-pct", v12, @"timestamp", v13, @"group-achievement-id", 0);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    float v6 = [(GKAchievementInternal *)self identifier];
    float v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      char v8 = 1;
    }
    else
    {
      v9 = [(GKAchievementInternal *)self groupIdentifier];
      v10 = [v5 groupIdentifier];
      char v8 = [v9 isEqualToString:v10];
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
  uint64_t v2 = [(GKAchievementInternal *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unsigned)attributes
{
  return self->_attributes._value;
}

- (void)setAttributes:(unsigned int)a3
{
  self->_attributes._value = a3;
}

- (unsigned)maximumPoints
{
  return self->_attributes._value;
}

- (void)setMaximumPoints:(unsigned __int16)a3
{
  *(_WORD *)&self->_attributes.var0 = a3;
}

- (BOOL)isHidden
{
  return BYTE2(self->_attributes._value) & 1;
}

- (void)setHidden:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_attributes._value = self->_attributes._value & 0xFFFEFFFF | v3;
}

- (BOOL)isReplayable
{
  return (BYTE2(self->_attributes._value) >> 1) & 1;
}

- (void)setReplayable:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_attributes._value = self->_attributes._value & 0xFFFDFFFF | v3;
}

- (BOOL)isCompleted
{
  [(GKAchievementInternal *)self percentComplete];
  return v2 >= 100.0;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1F1E7ED68;
}

- (NSString)achievedDescription
{
  return self->_achievedDescription;
}

- (void)setAchievedDescription:(id)a3
{
}

- (NSArray)friendsWhoHaveThis
{
  return self->_friendsWhoHaveThis;
}

- (void)setFriendsWhoHaveThis:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)lastReportedDate
{
  return self->_lastReportedDate;
}

- (void)setLastReportedDate:(id)a3
{
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (GKPlayerInternal)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSNumber)rarityPercent
{
  return self->_rarityPercent;
}

- (void)setRarityPercent:(id)a3
{
}

- (unint64_t)releaseState
{
  return self->_releaseState;
}

- (void)setReleaseState:(unint64_t)a3
{
  self->_releaseState = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)unachievedDescription
{
  return self->_unachievedDescription;
}

- (void)setUnachievedDescription:(id)a3
{
}

- (GKGameInternal)gameHint
{
  return self->_gameHint;
}

- (void)setGameHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameHint, 0);
  objc_storeStrong((id *)&self->_rarityPercent, 0);
  objc_storeStrong((id *)&self->_friendsWhoHaveThis, 0);
  objc_storeStrong((id *)&self->_lastReportedDate, 0);
  objc_storeStrong((id *)&self->rarityPercent, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_unachievedDescription, 0);
  objc_storeStrong((id *)&self->_achievedDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end