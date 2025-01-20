@interface HKVaccinationRecord(HealthUI)
- (id)displayItems;
- (id)localizedStatusDisplayString;
- (id)lotNumberItem;
- (id)performerItem;
@end

@implementation HKVaccinationRecord(HealthUI)

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

  v4 = [a1 performerItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  v5 = [a1 lotNumberItem];
  objc_msgSend(v2, "hk_addNonNilObject:", v5);

  v6 = (void *)[v2 copy];
  return v6;
}

- (id)performerItem
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"DETAIL_VIEW_RECORDS_PERFORMER_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v4 = [a1 performer];
  v5 = +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:v3 detailText:v4 style:1];

  return v5;
}

- (id)lotNumberItem
{
  id v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"DETAIL_VIEW_RECORDS_LOT_NUMBER_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pasadena"];
  v4 = [a1 lotNumber];
  v5 = +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:v3 detailText:v4 style:1];

  return v5;
}

@end