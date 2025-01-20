@interface _App
- (NSArray)appMarqueeGroups;
- (NSArray)groups;
- (NSArray)groupsWithComms;
- (NSArray)groupsWithCommsWithPreviewableAttachment;
- (NSArray)groupsWithCommsWithoutPreviewableAttachment;
- (NSArray)groupsWithoutComms;
- (NSArray)groupsWithoutCommsWithPreviewableAttachment;
- (NSArray)groupsWithoutCommsWithoutPreviewableAttachment;
- (NSArray)nonAppMarqueeGroups;
- (NSString)bundleId;
- (_App)initWithNotificationStacks:(id)a3 maxAppMarqueeGroups:(unint64_t)a4 digestFeedback:(id)a5;
- (double)digestRankingScore;
- (double)logisticScoreForInput:(double)a3;
- (double)setDigestRankingScore;
- (id)getGroupsFromNotificationStacks:(id)a3;
- (void)setBundleId;
- (void)setRankedGroupsFromNotificationGroups:(id)a3;
@end

@implementation _App

- (_App)initWithNotificationStacks:(id)a3 maxAppMarqueeGroups:(unint64_t)a4 digestFeedback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_App;
  v10 = [(_App *)&v15 init];
  if (v10)
  {
    uint64_t v11 = +[ATXNotificationDigestRankingConstants sharedInstance];
    c = v10->_c;
    v10->_c = (ATXNotificationDigestRankingConstants *)v11;

    v10->_maxAppMarqueeGroups = a4;
    objc_storeStrong((id *)&v10->_digestFeedback, a5);
    v13 = [(_App *)v10 getGroupsFromNotificationStacks:v8];
    [(_App *)v10 setRankedGroupsFromNotificationGroups:v13];

    [(_App *)v10 setBundleId];
    [(_App *)v10 setDigestRankingScore];
  }

  return v10;
}

- (id)getGroupsFromNotificationStacks:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40___App_getGroupsFromNotificationStacks___block_invoke;
  v5[3] = &unk_1E68B6330;
  v5[4] = self;
  v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return v3;
}

- (void)setBundleId
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  groups = self->_groups;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __19___App_setBundleId__block_invoke;
  v17[3] = &unk_1E68B6358;
  v17[4] = self;
  v5 = [(NSArray *)groups _pas_mappedArrayWithTransform:v17];
  v6 = [v3 orderedSetWithArray:v5];

  if (![v6 count])
  {
    v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      uint64_t v11 = "[%@] Missing bundleId. Proceeding to rank app without bundleId.";
      v12 = v7;
      uint32_t v13 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      uint64_t v10 = [v6 count];
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      __int16 v20 = 2048;
      uint64_t v21 = v10;
      uint64_t v11 = "[%@] Expected to find exactly one bundle ID, but found %lu. Assuming first bundleId.";
      v12 = v7;
      uint32_t v13 = 22;
LABEL_7:
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_super v15 = [v6 firstObject];
  bundleId = self->_bundleId;
  self->_bundleId = v15;
}

- (void)setRankedGroupsFromNotificationGroups:(id)a3
{
  v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_245];
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_21_0);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithComms = self->_groupsWithComms;
  self->_groupsWithComms = v5;

  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_23_6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  groupsWithoutComms = self->_groupsWithoutComms;
  self->_groupsWithoutComms = v7;

  id v9 = [(NSArray *)self->_groupsWithComms _pas_filteredArrayWithTest:&__block_literal_global_25_4];
  groupsWithCommsWithPreviewableAttachment = self->_groupsWithCommsWithPreviewableAttachment;
  self->_groupsWithCommsWithPreviewableAttachment = v9;

  uint64_t v11 = [(NSArray *)self->_groupsWithComms _pas_filteredArrayWithTest:&__block_literal_global_27_2];
  groupsWithCommsWithoutPreviewableAttachment = self->_groupsWithCommsWithoutPreviewableAttachment;
  self->_groupsWithCommsWithoutPreviewableAttachment = v11;

  uint32_t v13 = [(NSArray *)self->_groupsWithoutComms _pas_filteredArrayWithTest:&__block_literal_global_29_4];
  groupsWithoutCommsWithPreviewableAttachment = self->_groupsWithoutCommsWithPreviewableAttachment;
  self->_groupsWithoutCommsWithPreviewableAttachment = v13;

  objc_super v15 = [(NSArray *)self->_groupsWithoutComms _pas_filteredArrayWithTest:&__block_literal_global_31_0];
  groupsWithoutCommsWithoutPreviewableAttachment = self->_groupsWithoutCommsWithoutPreviewableAttachment;
  self->_groupsWithoutCommsWithoutPreviewableAttachment = v15;

  v17 = objc_opt_new();
  [v17 addObjectsFromArray:self->_groupsWithCommsWithPreviewableAttachment];
  [v17 addObjectsFromArray:self->_groupsWithCommsWithoutPreviewableAttachment];
  [v17 addObjectsFromArray:self->_groupsWithoutCommsWithPreviewableAttachment];
  [v17 addObjectsFromArray:self->_groupsWithoutCommsWithoutPreviewableAttachment];
  unint64_t v18 = [v17 count];
  if (v18 >= self->_maxAppMarqueeGroups) {
    unint64_t maxAppMarqueeGroups = self->_maxAppMarqueeGroups;
  }
  else {
    unint64_t maxAppMarqueeGroups = v18;
  }
  objc_msgSend(v17, "subarrayWithRange:", 0, maxAppMarqueeGroups);
  __int16 v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  appMarqueeGroups = self->_appMarqueeGroups;
  self->_appMarqueeGroups = v20;

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46___App_setRankedGroupsFromNotificationGroups___block_invoke_8;
  v26[3] = &unk_1E68B61F8;
  v26[4] = self;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", v26);
  uint64_t v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
  self->_nonAppMarqueeGroups = v22;

  v24 = [(NSArray *)self->_appMarqueeGroups arrayByAddingObjectsFromArray:self->_nonAppMarqueeGroups];
  groups = self->_groups;
  self->_groups = v24;
}

- (double)setDigestRankingScore
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
  double v26 = v24 + v14 * v25;
  [(_App *)self logisticScoreForInput:v26];
  return result;
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

- (NSString)bundleId
{
  return self->_bundleId;
}

- (double)digestRankingScore
{
  return self->_digestRankingScore;
}

- (NSArray)appMarqueeGroups
{
  return self->_appMarqueeGroups;
}

- (NSArray)nonAppMarqueeGroups
{
  return self->_nonAppMarqueeGroups;
}

- (NSArray)groups
{
  return self->_groups;
}

- (NSArray)groupsWithComms
{
  return self->_groupsWithComms;
}

- (NSArray)groupsWithoutComms
{
  return self->_groupsWithoutComms;
}

- (NSArray)groupsWithCommsWithPreviewableAttachment
{
  return self->_groupsWithCommsWithPreviewableAttachment;
}

- (NSArray)groupsWithCommsWithoutPreviewableAttachment
{
  return self->_groupsWithCommsWithoutPreviewableAttachment;
}

- (NSArray)groupsWithoutCommsWithPreviewableAttachment
{
  return self->_groupsWithoutCommsWithPreviewableAttachment;
}

- (NSArray)groupsWithoutCommsWithoutPreviewableAttachment
{
  return self->_groupsWithoutCommsWithoutPreviewableAttachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsWithoutCommsWithoutPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithoutCommsWithPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithCommsWithoutPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithCommsWithPreviewableAttachment, 0);
  objc_storeStrong((id *)&self->_groupsWithoutComms, 0);
  objc_storeStrong((id *)&self->_groupsWithComms, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_appMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end