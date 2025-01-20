@interface HKDiagnosticTestResult(HealthUI)
- (id)displayItems;
- (id)localizedStatusDisplayString;
- (id)valueItem;
@end

@implementation HKDiagnosticTestResult(HealthUI)

- (id)localizedStatusDisplayString
{
  v1 = [a1 status];
  v2 = [v1 localizedPreferredName];

  return v2;
}

- (id)displayItems
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [a1 recordItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  v4 = [a1 valueItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  v5 = [a1 statusItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v5);

  v6 = (void *)[v2 copy];
  return v6;
}

- (id)valueItem
{
  id v2 = [a1 value];
  v3 = [v2 inspectableValue];
  v4 = [v3 stringValue];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [a1 value];
    v8 = [v7 inspectableValue];
    v9 = [v8 ontologyConcept];
    id v6 = [v9 localizedPreferredName];
  }
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"DETAIL_VIEW_RECORDS_VALUE_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v12 = +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:v11 detailText:v6 style:1];

  return v12;
}

@end