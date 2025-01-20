@interface HKDiagnosticTestResult(Localization)
- (id)sortDateTitle;
@end

@implementation HKDiagnosticTestResult(Localization)

- (id)sortDateTitle
{
  v2 = [a1 sortDate];
  v3 = [v2 keyPath];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F29FD8]];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"DIAGNOSTIC_TEST_RESULT_SORT_DATE_TITLE_MODIFIED_DATE";
LABEL_9:
    v17 = [v5 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Clinical-Health-Records"];

    goto LABEL_10;
  }
  v8 = [a1 sortDate];
  v9 = [v8 keyPath];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F29A60]];

  if (v10)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"DIAGNOSTIC_TEST_RESULT_SORT_DATE_TITLE_ISSUE_DATE";
    goto LABEL_9;
  }
  v11 = [a1 sortDate];
  v12 = [v11 keyPath];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F29A50]];

  if (v13)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"DIAGNOSTIC_TEST_RESULT_SORT_DATE_TITLE_EFFECTIVE_END_DATE";
    goto LABEL_9;
  }
  v14 = [a1 sortDate];
  v15 = [v14 keyPath];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F29A58]];

  if (v16)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v6 = v5;
    v7 = @"DIAGNOSTIC_TEST_RESULT_SORT_DATE_TITLE_EFFECTIVE_START_DATE";
    goto LABEL_9;
  }
  v17 = 0;
LABEL_10:
  return v17;
}

@end