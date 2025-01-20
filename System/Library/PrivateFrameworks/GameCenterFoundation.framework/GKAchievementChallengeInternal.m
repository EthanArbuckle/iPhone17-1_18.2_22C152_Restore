@interface GKAchievementChallengeInternal
+ (id)internalRepresentation;
+ (id)secureCodedPropertyKeys;
- (GKAchievementInternal)achievement;
- (id)serverRepresentationForReceivingPlayer:(id)a3;
- (id)titleText;
- (unint64_t)type;
- (void)setAchievement:(id)a3;
@end

@implementation GKAchievementChallengeInternal

+ (id)internalRepresentation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)secureCodedPropertyKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GKAchievementChallengeInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_215 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_215, block);
  }
  id v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_214;

  return v2;
}

void __57__GKAchievementChallengeInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___GKAchievementChallengeInternal;
  v1 = objc_msgSendSuper2(&v4, sel_secureCodedPropertyKeys);
  id v2 = (void *)[v1 mutableCopy];

  [v2 setObject:objc_opt_class() forKey:@"achievement"];
  v3 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_214;
  secureCodedPropertyKeys_sSecureCodedKeys_214 = (uint64_t)v2;
}

- (id)serverRepresentationForReceivingPlayer:(id)a3
{
  objc_super v4 = self;
  v16[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)GKAchievementChallengeInternal;
  v5 = [(GKChallengeInternal *)&v14 serverRepresentationForReceivingPlayer:a3];
  v6 = (void *)[v5 mutableCopy];

  [v6 setObject:&unk_1F1E7ECD8 forKey:@"challenge-type"];
  v15[0] = @"achievement-id";
  v7 = [v4 achievement];
  v8 = [v7 identifier];
  v15[1] = @"timestamp";
  v16[0] = v8;
  v9 = [v4 achievement];
  v10 = [v9 lastReportedDate];
  if (v10)
  {
    objc_super v4 = [v4 achievement];
    v3 = [v4 lastReportedDate];
    [v3 _gkServerTimestamp];
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] _gkServerTimestamp];
  v11 = };
  v16[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  if (v10)
  {

    v11 = v4;
  }

  [v6 setObject:v12 forKey:@"achievement"];

  return v6;
}

- (unint64_t)type
{
  return 2;
}

- (id)titleText
{
  v3 = NSString;
  objc_super v4 = +[GCFLocalizedStrings SHORT_CHALLENGE_ACHIEVEMENT_TITLE_FORMAT];
  v5 = [(GKAchievementChallengeInternal *)self achievement];
  v6 = [v5 title];
  v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);

  return v7;
}

- (GKAchievementInternal)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
}

- (void).cxx_destruct
{
}

@end