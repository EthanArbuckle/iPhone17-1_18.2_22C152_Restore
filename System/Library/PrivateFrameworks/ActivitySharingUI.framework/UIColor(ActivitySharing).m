@interface UIColor(ActivitySharing)
+ (id)as_colorForParticipant:()ActivitySharing competition:;
+ (id)as_competitionButtonGold;
+ (id)as_competitionFriendListPlatterGold;
+ (id)as_competitionGraphBackgroundGold;
+ (id)as_competitionNotificationAccentGold;
+ (id)as_competitionNotificationPlatterGold;
+ (uint64_t)as_brightCompetitionGold;
+ (uint64_t)as_darkCompetitionGold;
+ (uint64_t)as_lightCompetitionGold;
@end

@implementation UIColor(ActivitySharing)

+ (uint64_t)as_lightCompetitionGold
{
  return [MEMORY[0x263F825C8] colorWithRed:0.866666667 green:0.756862745 blue:0.450980392 alpha:1.0];
}

+ (uint64_t)as_darkCompetitionGold
{
  return [MEMORY[0x263F825C8] colorWithRed:0.62745098 green:0.564705882 blue:0.360784314 alpha:1.0];
}

+ (uint64_t)as_brightCompetitionGold
{
  return [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.878431373 blue:0.470588235 alpha:1.0];
}

+ (id)as_competitionFriendListPlatterGold
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "as_darkCompetitionGold");
  v1 = [v0 colorWithAlphaComponent:0.12];

  return v1;
}

+ (id)as_competitionNotificationPlatterGold
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  v1 = [v0 colorWithAlphaComponent:0.18];

  return v1;
}

+ (id)as_competitionNotificationAccentGold
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  v1 = [v0 colorWithAlphaComponent:0.2];

  return v1;
}

+ (id)as_competitionButtonGold
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  v1 = [v0 colorWithAlphaComponent:0.5];

  return v1;
}

+ (id)as_competitionGraphBackgroundGold
{
  v0 = objc_msgSend(MEMORY[0x263F825C8], "as_darkCompetitionGold");
  v1 = [v0 colorWithAlphaComponent:0.3];

  return v1;
}

+ (id)as_colorForParticipant:()ActivitySharing competition:
{
  if (objc_msgSend(a4, "isParticipantWinning:")) {
    objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  }
  else {
  v4 = objc_msgSend(MEMORY[0x263F825C8], "as_darkCompetitionGold");
  }
  return v4;
}

@end