@interface IMTextMessagePartChatItem(TextEffects)
- (BOOL)isRecentForTextEffectCoordinationWithinTimeInterval:()TextEffects;
- (double)ageForTextEffectCoordination;
@end

@implementation IMTextMessagePartChatItem(TextEffects)

- (double)ageForTextEffectCoordination
{
  v2 = [a1 time];
  v3 = [a1 message];
  v4 = [v3 messageSummaryInfo];

  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6D690]];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;

        v2 = v6;
      }
    }
  }
  v7 = [MEMORY[0x1E4F1C9C8] now];
  [v7 timeIntervalSinceDate:v2];
  double v9 = v8;

  return v9;
}

- (BOOL)isRecentForTextEffectCoordinationWithinTimeInterval:()TextEffects
{
  [a1 ageForTextEffectCoordination];
  return v3 > 1.0 && v3 < a2;
}

@end