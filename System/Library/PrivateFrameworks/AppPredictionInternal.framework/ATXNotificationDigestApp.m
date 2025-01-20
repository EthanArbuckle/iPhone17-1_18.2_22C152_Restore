@interface ATXNotificationDigestApp
- (ATXNotificationDigestApp)initWithBundleId:(id)a3 digestFeedback:(id)a4 digestConstants:(id)a5;
- (BOOL)hasBeenChosenForMarquee;
- (BOOL)hasImage;
- (BOOL)isEligibleForAutomaticMarquee;
- (NSArray)orderedGroups;
- (NSArray)unorderedGroups;
- (NSString)bundleId;
- (double)appScore;
- (double)logisticScoreForInput:(double)a3;
- (void)addGroup:(id)a3;
- (void)populateScoresFromBundleId;
- (void)refreshGroupOrder;
- (void)setHasBeenChosenForMarquee:(BOOL)a3;
@end

@implementation ATXNotificationDigestApp

- (ATXNotificationDigestApp)initWithBundleId:(id)a3 digestFeedback:(id)a4 digestConstants:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXNotificationDigestApp;
  v12 = [(ATXNotificationDigestApp *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleId, a3);
    objc_storeStrong((id *)&v13->_digestFeedback, a4);
    objc_storeStrong((id *)&v13->_c, a5);
    uint64_t v14 = objc_opt_new();
    rawGroups = v13->_rawGroups;
    v13->_rawGroups = (NSMutableArray *)v14;

    [(ATXNotificationDigestApp *)v13 populateScoresFromBundleId];
  }

  return v13;
}

- (NSArray)unorderedGroups
{
  return (NSArray *)self->_rawGroups;
}

- (NSArray)orderedGroups
{
  orderedGroups = self->_orderedGroups;
  if (!orderedGroups
    || (uint64_t v4 = [(NSArray *)orderedGroups count], v4 != [(NSMutableArray *)self->_rawGroups count]))
  {
    [(ATXNotificationDigestApp *)self refreshGroupOrder];
  }
  v5 = self->_orderedGroups;
  return v5;
}

- (BOOL)hasImage
{
  v3 = [(ATXNotificationDigestApp *)self orderedGroups];
  uint64_t v4 = [v3 firstObject];
  if (v4)
  {
    v5 = [(ATXNotificationDigestApp *)self orderedGroups];
    v6 = [v5 firstObject];
    char v7 = [v6 hasPreviewableAttachment];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  [(ATXNotificationDigestApp *)self appScore];
  objc_msgSend(v4, "setPriority:");
  [(NSMutableArray *)self->_rawGroups addObject:v4];
}

- (void)populateScoresFromBundleId
{
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback marqueeAppearancesForBundleId:self->_bundleId];
  double v4 = v3;
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback marqueeEngagementsForBundleId:self->_bundleId];
  double v6 = v5;
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback nonMarqueeAppearancesForBundleId:self->_bundleId];
  double v8 = v7;
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback nonMarqueeEngagementsForBundleId:self->_bundleId];
  double v10 = v9;
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback basicNotificationsSentForBundleId:self->_bundleId];
  double v12 = v11;
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback timeSensitiveNotificationsSentForBundleId:self->_bundleId];
  double v14 = v13;
  [(ATXNotificationDigestRankingConstants *)self->_c weightForMarqueeAppearance];
  double v16 = v15;
  [(ATXNotificationDigestRankingConstants *)self->_c weightForMarqueeEngagement];
  double v18 = v6 * v17 + v4 * v16;
  [(ATXNotificationDigestRankingConstants *)self->_c weightForNonMarqueeAppearance];
  double v20 = v18 + v8 * v19;
  [(ATXNotificationDigestRankingConstants *)self->_c weightForNonMarqueeEngagement];
  double v22 = v20 + v10 * v21;
  [(ATXNotificationDigestRankingConstants *)self->_c weightForBasicNotificationsSent];
  double v24 = v22 + v12 * v23;
  [(ATXNotificationDigestRankingConstants *)self->_c weightForTimeSensitiveNotificationsSent];
  [(ATXNotificationDigestApp *)self logisticScoreForInput:v24 + v14 * v25];
  self->_appScore = v26;
  [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback alltimeMarqueeAppearancesForBundleId:self->_bundleId];
  double v28 = v27;
  [(ATXNotificationDigestRankingConstants *)self->_c minMarqueeAppearancesPerApp];
  self->_isEligibleForAutomaticMarquee = v28 < v29;
}

- (double)logisticScoreForInput:(double)a3
{
  double v4 = fmin(a3, 25.0);
  if (v4 >= -25.0) {
    double v5 = v4;
  }
  else {
    double v5 = -25.0;
  }
  [(ATXNotificationDigestRankingConstants *)self->_c logisticCenterXVal];
  double v7 = v5 - v6;
  [(ATXNotificationDigestRankingConstants *)self->_c logisticGrowthRate];
  return 1.0 / (exp(-(v8 * v7)) + 1.0) + 0.002;
}

- (void)refreshGroupOrder
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  rawGroups = self->_rawGroups;
  if (rawGroups)
  {
    [(NSMutableArray *)rawGroups sortedArrayUsingComparator:&__block_literal_global_243];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        if ([v9 hasPreviewableAttachment]) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v10 = v9;

      if (!v10) {
        goto LABEL_13;
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__ATXNotificationDigestApp_refreshGroupOrder__block_invoke_2;
      v18[3] = &unk_1E68B61F8;
      id v19 = v10;
      double v11 = (NSArray *)v10;
      double v12 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v18);
      double v24 = v11;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      double v14 = [v13 arrayByAddingObjectsFromArray:v12];
      orderedGroups = self->_orderedGroups;
      self->_orderedGroups = v14;
    }
    else
    {
LABEL_10:

LABEL_13:
      double v16 = (NSArray *)v4;
      double v11 = self->_orderedGroups;
      self->_orderedGroups = v16;
    }
  }
  else
  {
    double v17 = self->_orderedGroups;
    self->_orderedGroups = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __45__ATXNotificationDigestApp_refreshGroupOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  [a3 appSpecifiedScore];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 appSpecifiedScore];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

BOOL __45__ATXNotificationDigestApp_refreshGroupOrder__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (BOOL)isEligibleForAutomaticMarquee
{
  return self->_isEligibleForAutomaticMarquee;
}

- (double)appScore
{
  return self->_appScore;
}

- (BOOL)hasBeenChosenForMarquee
{
  return self->_hasBeenChosenForMarquee;
}

- (void)setHasBeenChosenForMarquee:(BOOL)a3
{
  self->_hasBeenChosenForMarquee = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_orderedGroups, 0);
  objc_storeStrong((id *)&self->_rawGroups, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end