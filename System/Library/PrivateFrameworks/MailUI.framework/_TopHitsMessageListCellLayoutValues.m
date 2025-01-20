@interface _TopHitsMessageListCellLayoutValues
- (BOOL)useSelectedColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4;
- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3;
@end

@implementation _TopHitsMessageListCellLayoutValues

- (int64_t)linesOfSummaryForCompactHeight:(BOOL)a3
{
  return 1;
}

- (BOOL)useSelectedColorForConfigurationState:(id)a3 backgroundConfiguration:(id)a4
{
  id v4 = a3;
  char v5 = [v4 isSelected];
  char v6 = [v4 isFocused];
  char v7 = [v4 isFocusSystemActive];

  if (v6) {
    return v5;
  }
  else {
    return v5 & (v7 ^ 1);
  }
}

@end