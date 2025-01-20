@interface CSUserIdentityClassifier
+ (id)pickTopScoringProfileIdFromScores:(id)a3;
+ (id)stringFromClassificationCategory:(unint64_t)a3;
+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 lowScoreThreshold:(int64_t)a5 highScoreThreshold:(int64_t)a6 confidentThreshold:(int64_t)a7 scoreDiffThreshold:(int64_t)a8;
+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 withAsset:(id)a5 withPhId:(unint64_t)a6;
@end

@implementation CSUserIdentityClassifier

+ (id)stringFromClassificationCategory:(unint64_t)a3
{
  int v3 = a3;
  if (a3 < 5) {
    return *(&off_10024E528 + a3);
  }
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    v7 = "+[CSUserIdentityClassifier stringFromClassificationCategory:]";
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s ERR: Incorrect category %{public}d passed", (uint8_t *)&v6, 0x12u);
  }
  return @"Unknown";
}

+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 withAsset:(id)a5 withPhId:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 multiUserLowScoreThresholdForPhId:a6];
  id v13 = [v9 multiUserHighScoreThresholdForPhId:a6];
  id v14 = [v9 multiUserConfidentScoreThresholdForPhId:a6];
  id v15 = [v9 multiUserDeltaScoreThresholdForPhId:a6];

  unint64_t v16 = +[CSUserIdentityClassifier classifyUserIdentityFor:v11 withScores:v10 lowScoreThreshold:v12 highScoreThreshold:v13 confidentThreshold:v14 scoreDiffThreshold:v15];
  return v16;
}

+ (unint64_t)classifyUserIdentityFor:(id)a3 withScores:(id)a4 lowScoreThreshold:(int64_t)a5 highScoreThreshold:(int64_t)a6 confidentThreshold:(int64_t)a7 scoreDiffThreshold:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = v14;
  if (v13
    && v14
    && ([v14 objectForKeyedSubscript:v13],
        unint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    v17 = [v15 objectForKeyedSubscript:v13];
    v18 = [v17 integerValue];

    if ([v15 count] == (id)1)
    {
      uint64_t v19 = 4;
      uint64_t v20 = 3;
      if ((uint64_t)v18 <= a6) {
        uint64_t v20 = 1;
      }
      if ((uint64_t)v18 < a7) {
        uint64_t v19 = v20;
      }
      if ((uint64_t)v18 > a5) {
        unint64_t v21 = v19;
      }
      else {
        unint64_t v21 = 0;
      }
    }
    else
    {
      id v24 = [v15 mutableCopy];
      [v24 removeObjectForKey:v13];
      v27 = +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:v24];
      v25 = objc_msgSend(v15, "objectForKeyedSubscript:");
      v26 = [v25 integerValue];

      if ((uint64_t)v18 <= a5)
      {
        unint64_t v21 = 0;
      }
      else if (v18 - v26 <= a8)
      {
        unint64_t v21 = 2;
      }
      else if ((uint64_t)v18 >= a7)
      {
        unint64_t v21 = 4;
      }
      else if ((uint64_t)v18 <= a6)
      {
        unint64_t v21 = 1;
      }
      else
      {
        unint64_t v21 = 3;
      }
    }
  }
  else
  {
    v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "+[CSUserIdentityClassifier classifyUserIdentityFor:withScores:lowScoreThreshold:highScoreThreshold:confident"
            "Threshold:scoreDiffThreshold:]";
      __int16 v30 = 2114;
      id v31 = v13;
      __int16 v32 = 2114;
      v33 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s ERR: invalid arguments passed %{public}@ %{public}@", buf, 0x20u);
    }
    unint64_t v21 = 0;
  }

  return v21;
}

+ (id)pickTopScoringProfileIdFromScores:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v17;
  uint64_t v8 = -1000;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      id v11 = [v3 objectForKeyedSubscript:v10];
      id v12 = [v11 integerValue];

      if ((uint64_t)v12 > v8)
      {
        id v13 = v10;

        uint64_t v8 = (uint64_t)v12;
        int v6 = v13;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  }
  while (v5);
  if (!v6)
  {
LABEL_11:
    id v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v21 = "+[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:]";
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s ERR: topScoringUser is nil from %{public}@", buf, 0x16u);
    }
    int v6 = 0;
  }

  return v6;
}

@end