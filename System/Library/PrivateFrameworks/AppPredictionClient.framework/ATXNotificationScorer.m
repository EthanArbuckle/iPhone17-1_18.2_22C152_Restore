@interface ATXNotificationScorer
- (double)getDigestScoreForNotification:(id)a3 modeId:(id)a4;
@end

@implementation ATXNotificationScorer

- (double)getDigestScoreForNotification:(id)a3 modeId:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = objc_msgSend(a3, "derivedData", 0);
  v5 = [v4 getPublicScores];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v7 = 0.0;
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 modelId];
        char v13 = [v12 isEqualToString:@"ATXModeEntityScorer"];

        if (v13)
        {
          [v11 score];
          double v7 = v14;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end