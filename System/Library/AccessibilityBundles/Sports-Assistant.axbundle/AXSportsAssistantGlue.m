@interface AXSportsAssistantGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSportsAssistantGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
  }
}

void __54__AXSportsAssistantGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_276 withPreValidationHandler:&__block_literal_global_390 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_399];
}

uint64_t __54__AXSportsAssistantGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"ACSportsMatchupScheduleTeamView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsMatchupScheduleLineScoreView" hasInstanceVariable:@"_firstScoreLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsMatchupScheduleLineScoreView" hasInstanceVariable:@"_secondScoreLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsMatchupScheduleLineScoreView" hasInstanceVariable:@"_periodNameLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsEntityGroupStandingTitleView" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsAthleteView" hasInstanceVariable:@"_statGroupViews" withType:"NSMutableArray"];
  [v2 validateClass:@"ACSportsMatchupView" hasInstanceVariable:@"_scoreboardView" withType:"ACSportsScoreboardView"];
  [v2 validateClass:@"ACSportsMatchupView" hasInstanceVariable:@"_scoreboardView" withType:"ACSportsScoreboardView"];
  [v2 validateClass:@"ACSportsScoreboardView" hasInstanceVariable:@"_venueNameLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsPeriodicScoreboardView" hasInstanceVariable:@"_firstTeamNameLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsPeriodicScoreboardView" hasInstanceVariable:@"_secondTeamNameLabel" withType:"UILabel"];
  [v2 validateClass:@"ACSportsPeriodicScoreboardView" hasInstanceVariable:@"_lineScoreViews" withType:"NSMutableArray"];
  [v2 validateClass:@"ACSportsMatchupLineScoreView" hasInstanceVariable:@"_periodNameLabel" withType:"UILabel"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsTeamAthleteView", @"entity", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsAthlete", @"position", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsAthlete", @"injured", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsTeam", @"wins", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsTeam", @"losses", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsListView", @"domainObjectViews", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsMatchupScheduleView", @"league", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsLeague", @"sport", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ACSportsScoreboardView", @"matchup", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsMatchup", @"homeEntity", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SASportsEntity", @"league", "@", 0);

  return 1;
}

uint64_t __54__AXSportsAssistantGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Assistant Sports AX Bundle"];
  [v2 setOverrideProcessName:@"Assistant Sports"];

  return MEMORY[0x270F0A270]();
}

void __54__AXSportsAssistantGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"ACSportsMatchupScheduleTeamViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsMatchupLineScoreViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsPeriodicScoreboardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsBaseballScoreboardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsSoccerScoreboardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsAttributionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsEntityStandingsListViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsAthleteStatGroupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsTeamStandingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsTeamHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsTeamAthleteViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsTeamsListViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsListViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsEntityGroupStandingTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsMatchupViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsAthleteStandingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsPlaySummaryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ACSportsSiriUIContentLabelAccessibility" canInteractWithTargetClass:1];
}

@end