@interface WDSexualActivityListDataProvider
- (id)sampleTypes;
- (id)textForObject:(id)a3;
@end

@implementation WDSexualActivityListDataProvider

- (id)sampleTypes
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F0A598] categoryTypeForIdentifier:*MEMORY[0x263F093F0]];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)textForObject:(id)a3
{
  v3 = [a3 metadata];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09AD8]];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
    v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    v7 = v6;
    if (v5) {
      v8 = @"PROTECTION_USED";
    }
    else {
      v8 = @"PROTECTION_NOT_USED";
    }
    v9 = [v6 localizedStringForKey:v8 value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
  }
  else
  {
    v9 = HKLocalizedNoDataString();
  }

  return v9;
}

@end