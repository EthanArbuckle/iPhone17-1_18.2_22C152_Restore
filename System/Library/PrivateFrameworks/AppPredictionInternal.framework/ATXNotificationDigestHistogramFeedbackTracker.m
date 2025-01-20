@interface ATXNotificationDigestHistogramFeedbackTracker
- (ATXNotificationDigestHistogramFeedbackTracker)init;
- (ATXNotificationDigestHistogramFeedbackTracker)initWithDigestFeedbackHistogram:(id)a3 alltimeMarqueeAppearanceHistogram:(id)a4;
- (_ATXAppLaunchCategoricalHistogram)alltimeMarqueeAppearanceHistogram;
- (_ATXAppLaunchCategoricalHistogram)digestFeedbackHistogram;
- (double)alltimeMarqueeAppearancesForBundleId:(id)a3;
- (double)basicNotificationsSentForBundleId:(id)a3;
- (double)marqueeAppearancesForBundleId:(id)a3;
- (double)marqueeEngagementsForBundleId:(id)a3;
- (double)nonMarqueeAppearancesForBundleId:(id)a3;
- (double)nonMarqueeEngagementsForBundleId:(id)a3;
- (double)timeSensitiveNotificationsSentForBundleId:(id)a3;
- (id)feedbackDictionaryForBundleId:(id)a3;
- (void)decayFeedbackByFactor:(double)a3;
- (void)logBasicNotificationsSentForBundleId:(id)a3 numNotifications:(unint64_t)a4;
- (void)logMarqueeAppearanceForBundleId:(id)a3;
- (void)logMarqueeEngagementForBundleId:(id)a3;
- (void)logNonMarqueeAppearanceForBundleId:(id)a3;
- (void)logNonMarqueeEngagementForBundleId:(id)a3;
- (void)logTimeSensitiveNotificationsSentForBundleId:(id)a3 numNotifications:(unint64_t)a4;
@end

@implementation ATXNotificationDigestHistogramFeedbackTracker

- (ATXNotificationDigestHistogramFeedbackTracker)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [v3 categoricalHistogramForLaunchType:97];

  v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v6 = [v5 categoricalHistogramForLaunchType:98];

  v7 = [(ATXNotificationDigestHistogramFeedbackTracker *)self initWithDigestFeedbackHistogram:v4 alltimeMarqueeAppearanceHistogram:v6];
  return v7;
}

- (ATXNotificationDigestHistogramFeedbackTracker)initWithDigestFeedbackHistogram:(id)a3 alltimeMarqueeAppearanceHistogram:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationDigestHistogramFeedbackTracker;
  v9 = [(ATXNotificationDigestHistogramFeedbackTracker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_digestFeedbackHistogram, a3);
    objc_storeStrong((id *)&v10->_alltimeMarqueeAppearanceHistogram, a4);
  }

  return v10;
}

- (void)logMarqueeAppearanceForBundleId:(id)a3
{
  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  id v7 = [v5 now];
  [(_ATXAppLaunchCategoricalHistogram *)digestFeedbackHistogram addLaunchWithBundleId:v6 date:v7 category:@"marquee_appearance"];

  alltimeMarqueeAppearanceHistogram = self->_alltimeMarqueeAppearanceHistogram;
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  [(_ATXAppLaunchCategoricalHistogram *)alltimeMarqueeAppearanceHistogram addLaunchWithBundleId:v6 date:v9 category:@"marquee_alltimeAppearance"];
}

- (void)logMarqueeEngagementForBundleId:(id)a3
{
  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  [(_ATXAppLaunchCategoricalHistogram *)digestFeedbackHistogram addLaunchWithBundleId:v5 date:v6 category:@"marquee_engagement"];
}

- (void)logNonMarqueeAppearanceForBundleId:(id)a3
{
  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  [(_ATXAppLaunchCategoricalHistogram *)digestFeedbackHistogram addLaunchWithBundleId:v5 date:v6 category:@"nonmarquee_appearance"];
}

- (void)logNonMarqueeEngagementForBundleId:(id)a3
{
  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  [(_ATXAppLaunchCategoricalHistogram *)digestFeedbackHistogram addLaunchWithBundleId:v5 date:v6 category:@"nonmarquee_engagement"];
}

- (void)logBasicNotificationsSentForBundleId:(id)a3 numNotifications:(unint64_t)a4
{
  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v9 = [v6 now];
  *(float *)&double v8 = (float)a4;
  [(_ATXAppLaunchCategoricalHistogram *)digestFeedbackHistogram addLaunchWithBundleId:v7 date:v9 category:@"basic_notifications_sent" weight:v8];
}

- (void)logTimeSensitiveNotificationsSentForBundleId:(id)a3 numNotifications:(unint64_t)a4
{
  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v9 = [v6 now];
  *(float *)&double v8 = (float)a4;
  [(_ATXAppLaunchCategoricalHistogram *)digestFeedbackHistogram addLaunchWithBundleId:v7 date:v9 category:@"urgent_notifications_sent" weight:v8];
}

- (double)marqueeAppearancesForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:a3 category:@"marquee_appearance"];
  return result;
}

- (double)marqueeEngagementsForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:a3 category:@"marquee_engagement"];
  return result;
}

- (double)nonMarqueeAppearancesForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:a3 category:@"nonmarquee_appearance"];
  return result;
}

- (double)nonMarqueeEngagementsForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:a3 category:@"nonmarquee_engagement"];
  return result;
}

- (double)basicNotificationsSentForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:a3 category:@"basic_notifications_sent"];
  return result;
}

- (double)timeSensitiveNotificationsSentForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:a3 category:@"urgent_notifications_sent"];
  return result;
}

- (double)alltimeMarqueeAppearancesForBundleId:(id)a3
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_alltimeMarqueeAppearanceHistogram totalLaunchesForBundleId:a3 category:@"marquee_alltimeAppearance"];
  return result;
}

- (void)decayFeedbackByFactor:(double)a3
{
}

- (id)feedbackDictionaryForBundleId:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v21[0] = @"marquee_engagement";
  v21[1] = @"marquee_appearance";
  v21[2] = @"nonmarquee_engagement";
  v21[3] = @"nonmarquee_appearance";
  v21[4] = @"basic_notifications_sent";
  v21[5] = @"urgent_notifications_sent";
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 6, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_super v12 = NSNumber;
        [(_ATXAppLaunchCategoricalHistogram *)self->_digestFeedbackHistogram totalLaunchesForBundleId:v4 category:v11];
        v13 = objc_msgSend(v12, "numberWithDouble:");
        [v5 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  v14 = NSNumber;
  [(_ATXAppLaunchCategoricalHistogram *)self->_alltimeMarqueeAppearanceHistogram totalLaunchesForBundleId:v4 category:@"marquee_alltimeAppearance"];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v5 setObject:v15 forKeyedSubscript:@"marquee_alltimeAppearance"];

  return v5;
}

- (_ATXAppLaunchCategoricalHistogram)digestFeedbackHistogram
{
  return self->_digestFeedbackHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)alltimeMarqueeAppearanceHistogram
{
  return self->_alltimeMarqueeAppearanceHistogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alltimeMarqueeAppearanceHistogram, 0);
  objc_storeStrong((id *)&self->_digestFeedbackHistogram, 0);
}

@end