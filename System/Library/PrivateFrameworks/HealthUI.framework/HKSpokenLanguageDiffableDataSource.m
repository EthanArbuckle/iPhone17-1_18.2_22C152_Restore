@interface HKSpokenLanguageDiffableDataSource
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
@end

@implementation HKSpokenLanguageDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(UITableViewDiffableDataSource *)self snapshot];
  v6 = [v5 sectionIdentifiers];
  v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 unsignedIntegerValue];

  switch(v8)
  {
    case 0:
      v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v10 = v9;
      v11 = @"preferred_regional_lannguages";
      goto LABEL_7;
    case 1:
      v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v10 = v9;
      v11 = @"all_spoken_languages";
      goto LABEL_7;
    case 2:
      v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v10 = v9;
      v11 = @"search_results";
LABEL_7:
      v12 = [v9 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

      goto LABEL_9;
  }
  v12 = 0;
LABEL_9:
  return v12;
}

@end