@interface ICQReviewLargeFilesRecommendationProvider
- (BOOL)isFeatureFlagEnabled;
- (id)bundleID;
- (void)recommendationsForThresholds:(id)a3 afterTimestamp:(id)a4 completion:(id)a5;
@end

@implementation ICQReviewLargeFilesRecommendationProvider

- (id)bundleID
{
  return @"com.apple.DocumentsApp";
}

- (BOOL)isFeatureFlagEnabled
{
  return __os_feature_enabled_impl("CloudExperiences", "Recommendations");
}

- (void)recommendationsForThresholds:(id)a3 afterTimestamp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(ICQReviewLargeFilesRecommendationProvider *)self isFeatureFlagEnabled];
  v12 = _ICQGetLogSystem();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "We're being asked for Review Large Files recommendations with timestamp: %@, thresholds: %@", buf, 0x16u);
    }

    +[ICQUICoreSpotlightQueryHelper updateThresholdsForLargeFilesWithDictionary:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2E0C;
    v14[3] = &unk_4148;
    v14[4] = self;
    id v15 = v10;
    +[ICQUICoreSpotlightQueryHelper fetchiCloudDriveItemsUsingThresholds:v8 shouldCheckTrash:1 completion:v14];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_3304(v13);
    }

    (*((void (**)(id, void *, void))v10 + 2))(v10, &__NSArray0__struct, 0);
  }
}

@end