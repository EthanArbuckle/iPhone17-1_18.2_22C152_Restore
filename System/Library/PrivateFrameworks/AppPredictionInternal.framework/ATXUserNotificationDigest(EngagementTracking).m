@interface ATXUserNotificationDigest(EngagementTracking)
- (uint64_t)computeNumDigestExpansions;
- (void)populateEngagementFromSource:()EngagementTracking;
@end

@implementation ATXUserNotificationDigest(EngagementTracking)

- (uint64_t)computeNumDigestExpansions
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [a1 uuid];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "Computing digest expansions for: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v4 = objc_opt_new();
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v6 = [v4 publisherFromStartTime:v5 + -604800.0];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke;
  v16[3] = &unk_1E68AF140;
  v16[4] = a1;
  v7 = [v6 filterWithIsIncluded:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_26;
  v15[3] = &unk_1E68AD400;
  v15[4] = a1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__ATXUserNotificationDigest_EngagementTracking__computeNumDigestExpansions__block_invoke_28;
  v14[3] = &unk_1E68AC690;
  v14[4] = &buf;
  id v8 = (id)[v7 sinkWithCompletion:v15 receiveInput:v14];

  v9 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [a1 uuid];
    uint64_t v11 = *(void *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)v17 = 138543618;
    v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Computed digest expansions for: %{public}@: %ld", v17, 0x16u);
  }
  uint64_t v12 = *(void *)(*((void *)&buf + 1) + 24);

  _Block_object_dispose(&buf, 8);
  return v12;
}

- (void)populateEngagementFromSource:()EngagementTracking
{
  id v46 = a3;
  v4 = [a1 allNotificationIds];
  double v5 = [v46 resolutionsForNotifications:v4];

  v6 = [[ATXNotificationResolutionDictionarySource alloc] initWithResolutionDictionary:v5];
  v7 = objc_opt_new();
  [a1 setDigestEngagementTrackingMetrics:v7];

  uint64_t v8 = [a1 computeNumDigestExpansions];
  v9 = [a1 digestEngagementTrackingMetrics];
  [v9 setNumDigestExpansions:v8];

  v10 = [a1 messageGroups];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [a1 messageGroups];
      v14 = [v13 objectAtIndexedSubscript:v12];

      v15 = [a1 messageGroups];
      uint64_t v16 = [v15 count];
      v17 = [a1 digestTimeline];
      [v14 populateEngagementFromSource:v6 sectionIdentifier:@"messageGroups" sectionPosition:v12 sectionSize:v16 digestTimeline:v17];

      v18 = [a1 digestEngagementTrackingMetrics];
      __int16 v19 = [v14 digestEngagementTrackingMetrics];
      [v18 addMetricsFromOtherTracker:v19];

      ++v12;
      uint64_t v20 = [a1 messageGroups];
      unint64_t v21 = [v20 count];
    }
    while (v12 < v21);
  }
  uint64_t v22 = [a1 highlightedGroups];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    unint64_t v24 = 0;
    do
    {
      v25 = [a1 highlightedGroups];
      v26 = [v25 objectAtIndexedSubscript:v24];

      v27 = [a1 highlightedGroups];
      uint64_t v28 = [v27 count];
      v29 = [a1 digestTimeline];
      [v26 populateEngagementFromSource:v6 sectionIdentifier:@"highlightedGroups" sectionPosition:v24 sectionSize:v28 digestTimeline:v29];

      v30 = [a1 digestEngagementTrackingMetrics];
      v31 = [v26 digestEngagementTrackingMetrics];
      [v30 addMetricsFromOtherTracker:v31];

      ++v24;
      v32 = [a1 highlightedGroups];
      unint64_t v33 = [v32 count];
    }
    while (v24 < v33);
  }
  v34 = [a1 rankedGroups];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    unint64_t v36 = 0;
    do
    {
      v37 = [a1 rankedGroups];
      v38 = [v37 objectAtIndexedSubscript:v36];

      v39 = [a1 rankedGroups];
      uint64_t v40 = [v39 count];
      v41 = [a1 digestTimeline];
      [v38 populateEngagementFromSource:v6 sectionIdentifier:@"otherGroups" sectionPosition:v36 sectionSize:v40 digestTimeline:v41];

      v42 = [a1 digestEngagementTrackingMetrics];
      v43 = [v38 digestEngagementTrackingMetrics];
      [v42 addMetricsFromOtherTracker:v43];

      ++v36;
      v44 = [a1 rankedGroups];
      unint64_t v45 = [v44 count];
    }
    while (v36 < v45);
  }
}

@end