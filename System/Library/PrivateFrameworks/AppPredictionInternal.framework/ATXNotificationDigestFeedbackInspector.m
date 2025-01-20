@interface ATXNotificationDigestFeedbackInspector
- (id)_formatFeedbackDataForBundleId:(id)a3 feedback:(id)a4;
- (id)_histogramKeyForLocation:(id)a3 feedback:(id)a4;
- (void)addToHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6;
- (void)clearHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4;
- (void)setHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7;
- (void)showHistogramForBundleId:(id)a3 withReply:(id)a4;
@end

@implementation ATXNotificationDigestFeedbackInspector

- (void)showHistogramForBundleId:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  id v9 = (id)objc_opt_new();
  v8 = [(ATXNotificationDigestFeedbackInspector *)self _formatFeedbackDataForBundleId:v7 feedback:v9];

  v6[2](v6, v8, 0);
}

- (void)addToHistogramForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 withReply:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  v14 = objc_opt_new();
  if ([v12 isEqualToString:@"alltimeAppearance"])
  {
    v15 = [v14 alltimeMarqueeAppearanceHistogram];
    v16 = [MEMORY[0x1E4F1C9C8] now];
    [v15 addLaunchWithBundleId:v10 date:v16 category:@"marquee_alltimeAppearance"];

    v13[2](v13, 0);
  }
  else
  {
    v17 = [(ATXNotificationDigestFeedbackInspector *)self _histogramKeyForLocation:v11 feedback:v12];
    if (v17)
    {
      v18 = [v14 digestFeedbackHistogram];
      v19 = [MEMORY[0x1E4F1C9C8] now];
      [v18 addLaunchWithBundleId:v10 date:v19 category:v17];

      v13[2](v13, 0);
    }
    else
    {
      uint64_t v22 = *MEMORY[0x1E4F28568];
      v23[0] = @"Invalid argument for location or feedback";
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXNotificationDigestFeedbackInspector" code:-1 userInfo:v20];
      ((void (**)(id, void *))v13)[2](v13, v21);
    }
  }
}

- (void)setHistogramValueForBundleId:(id)a3 location:(id)a4 feedback:(id)a5 value:(id)a6 withReply:(id)a7
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void))a7;
  v17 = objc_opt_new();
  if ([v14 isEqualToString:@"alltimeAppearance"])
  {
    v18 = [v17 alltimeMarqueeAppearanceHistogram];
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    v56[0] = v12;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    v21 = [v19 setWithArray:v20];
    [v18 removeBundleIds:v21];

    uint64_t v22 = [v17 alltimeMarqueeAppearanceHistogram];
    v23 = [MEMORY[0x1E4F1C9C8] now];
    [v15 floatValue];
    objc_msgSend(v22, "addLaunchWithBundleId:date:category:weight:", v12, v23, @"marquee_alltimeAppearance");

    v16[2](v16, 0);
  }
  else
  {
    v24 = [(ATXNotificationDigestFeedbackInspector *)self _histogramKeyForLocation:v13 feedback:v14];
    if (v24)
    {
      v42 = v16;
      v43 = v15;
      id v44 = v14;
      id v45 = v13;
      v25 = [v17 feedbackDictionaryForBundleId:v12];
      v46 = v17;
      v26 = [v17 digestFeedbackHistogram];
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      id v47 = v12;
      id v53 = v12;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      v29 = [v27 setWithArray:v28];
      [v26 removeBundleIds:v29];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v30 = v25;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v49 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (([v35 isEqualToString:v24] & 1) == 0
              && ([v35 isEqualToString:@"marquee_alltimeAppearance"] & 1) == 0)
            {
              v36 = [v46 digestFeedbackHistogram];
              v37 = [MEMORY[0x1E4F1C9C8] now];
              v38 = [v30 objectForKeyedSubscript:v35];
              [v38 floatValue];
              objc_msgSend(v36, "addLaunchWithBundleId:date:category:weight:", v47, v37, v35);
            }
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v32);
      }

      v17 = v46;
      v39 = [v46 digestFeedbackHistogram];
      v40 = [MEMORY[0x1E4F1C9C8] now];
      id v15 = v43;
      [v43 floatValue];
      id v12 = v47;
      objc_msgSend(v39, "addLaunchWithBundleId:date:category:weight:", v47, v40, v24);

      v16 = v42;
      v42[2](v42, 0);
      id v14 = v44;
      id v13 = v45;
    }
    else
    {
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v55 = @"Invalid argument for location or feedback";
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v41 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ATXNotificationDigestFeedbackInspector" code:-1 userInfo:v30];
      ((void (**)(id, void *))v16)[2](v16, v41);
    }
  }
}

- (void)clearHistogramWithShouldResetBookmarks:(BOOL)a3 reply:(id)a4
{
  v4 = (void (**)(id, void))a4;
  id v7 = (id)objc_opt_new();
  v5 = [v7 digestFeedbackHistogram];
  [v5 resetData];

  v6 = [v7 alltimeMarqueeAppearanceHistogram];
  [v6 resetData];

  v4[2](v4, 0);
}

- (id)_formatFeedbackDataForBundleId:(id)a3 feedback:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F28D90];
  v5 = [a4 feedbackDictionaryForBundleId:a3];
  v6 = [v4 dataWithJSONObject:v5 options:3 error:0];

  id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  return v7;
}

- (id)_histogramKeyForLocation:(id)a3 feedback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"notification"])
  {
    id v7 = @"basic_notifications_sent";
  }
  else if ([v5 isEqualToString:@"tsnotification"])
  {
    id v7 = @"urgent_notifications_sent";
  }
  else if ([&unk_1F27F2B20 containsObject:v5] {
         && [&unk_1F27F2B38 containsObject:v6])
  }
  {
    id v7 = [NSString stringWithFormat:@"%@_%@", v5, v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end