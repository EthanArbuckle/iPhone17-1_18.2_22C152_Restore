@interface SearchUIScoreSummaryCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axRecordStringWithLeftTeamName:(id)a3 score:(id)a4 rightTeamName:(id)a5 score:(id)a6;
- (id)accessibilityLabel;
@end

@implementation SearchUIScoreSummaryCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIScoreSummaryCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIScoreSummaryCardSectionView" isKindOfClass:@"SearchUICardSectionView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICardSectionView", @"section", "@", 0);
  [v3 validateProtocol:@"SFScoreboardCardSection" hasRequiredInstanceMethod:@"team1"];
  [v3 validateProtocol:@"SFScoreboardCardSection" hasRequiredInstanceMethod:@"team2"];
  [v3 validateProtocol:@"SFScoreboardCardSection" hasRequiredInstanceMethod:@"subtitle"];
  [v3 validateProtocol:@"SFScoreboardCardSection" hasRequiredInstanceMethod:@"accessibilityDescription"];
  [v3 validateClass:@"SFSportsTeam"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFSportsTeam", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFSportsTeam", @"record", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUIScoreSummaryCardSectionViewAccessibility *)self safeValueForKey:@"section"];
  v14 = [v3 safeStringForKey:@"accessibilityDescription"];
  v4 = [v3 safeStringForKey:@"subtitle"];
  v5 = [v3 safeValueForKey:@"team1"];
  v6 = [v3 safeValueForKey:@"team2"];
  v7 = [v5 safeStringForKey:@"name"];
  v8 = [v6 safeStringForKey:@"name"];
  v9 = [v5 safeStringForKey:@"record"];
  v10 = [v6 safeStringForKey:@"record"];
  v11 = 0;
  if (v10 && v9)
  {
    v11 = [(SearchUIScoreSummaryCardSectionViewAccessibility *)self _axRecordStringWithLeftTeamName:v7 score:v9 rightTeamName:v8 score:v10];
  }
  __AXStringForVariables();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_axRecordStringWithLeftTeamName:(id)a3 score:(id)a4 rightTeamName:(id)a5 score:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [a4 componentsSeparatedByString:@"-"];
  id v13 = [v11 componentsSeparatedByString:@"-"];

  if ([v12 count] == 3 && objc_msgSend(v13, "count") == 3)
  {
    v14 = NSString;
    v15 = accessibilityLocalizedString(@"score.wins");
    v16 = [v12 objectAtIndexedSubscript:0];
    uint64_t v17 = objc_msgSend(v14, "localizedStringWithFormat:", v15, objc_msgSend(v16, "integerValue"));

    v18 = NSString;
    v19 = accessibilityLocalizedString(@"score.draws");
    v20 = [v12 objectAtIndexedSubscript:1];
    uint64_t v21 = objc_msgSend(v18, "localizedStringWithFormat:", v19, objc_msgSend(v20, "integerValue"));

    v22 = NSString;
    v23 = accessibilityLocalizedString(@"score.losses");
    v24 = [v12 objectAtIndexedSubscript:2];
    uint64_t v60 = objc_msgSend(v22, "localizedStringWithFormat:", v23, objc_msgSend(v24, "integerValue"));

    v62 = (void *)v21;
    v63 = (void *)v17;
    v25 = [NSString stringWithFormat:@"%@, %@, %@", v17, v21, v60];
    v26 = NSString;
    v27 = accessibilityLocalizedString(@"score.wins");
    v28 = [v13 objectAtIndexedSubscript:0];
    v29 = objc_msgSend(v26, "localizedStringWithFormat:", v27, objc_msgSend(v28, "integerValue"));

    v30 = NSString;
    v31 = accessibilityLocalizedString(@"score.draws");
    [v13 objectAtIndexedSubscript:1];
    v33 = id v32 = v9;
    v34 = objc_msgSend(v30, "localizedStringWithFormat:", v31, objc_msgSend(v33, "integerValue"));

    v35 = NSString;
    v36 = accessibilityLocalizedString(@"score.losses");
    v37 = [v13 objectAtIndexedSubscript:2];
    v38 = objc_msgSend(v35, "localizedStringWithFormat:", v36, objc_msgSend(v37, "integerValue"));

    v59 = [NSString stringWithFormat:@"%@, %@, %@", v29, v34, v38];
    v39 = __AXStringForVariables();

    v40 = (void *)v60;
    id v9 = v32;
LABEL_7:

    goto LABEL_9;
  }
  if ([v12 count] == 2 && objc_msgSend(v13, "count") == 2)
  {
    id v61 = v9;
    v41 = NSString;
    v42 = accessibilityLocalizedString(@"score.wins");
    v43 = [v12 objectAtIndexedSubscript:0];
    uint64_t v44 = objc_msgSend(v41, "localizedStringWithFormat:", v42, objc_msgSend(v43, "integerValue"));

    v45 = NSString;
    v46 = accessibilityLocalizedString(@"score.losses");
    v47 = [v12 objectAtIndexedSubscript:1];
    uint64_t v48 = objc_msgSend(v45, "localizedStringWithFormat:", v46, objc_msgSend(v47, "integerValue"));

    v62 = (void *)v48;
    v63 = (void *)v44;
    uint64_t v49 = [NSString stringWithFormat:@"%@, %@", v44, v48];
    v50 = NSString;
    v51 = accessibilityLocalizedString(@"score.wins");
    v52 = [v13 objectAtIndexedSubscript:0];
    v25 = objc_msgSend(v50, "localizedStringWithFormat:", v51, objc_msgSend(v52, "integerValue"));

    v53 = NSString;
    v54 = accessibilityLocalizedString(@"score.losses");
    v55 = [v13 objectAtIndexedSubscript:1];
    uint64_t v58 = [v55 integerValue];
    v56 = v53;
    id v9 = v61;
    v29 = objc_msgSend(v56, "localizedStringWithFormat:", v54, v58);

    v40 = (void *)v49;
    v34 = [NSString stringWithFormat:@"%@, %@", v25, v29];
    v39 = __AXStringForVariables();
    goto LABEL_7;
  }
  v39 = 0;
LABEL_9:

  return v39;
}

@end