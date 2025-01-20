@interface IRAnalyticsUtilities
+ (id)candidateModelTypeForCandidate:(id)a3;
+ (id)candidateTypeForCandidate:(id)a3;
+ (int64_t)getRedactedBundleID:(id)a3;
@end

@implementation IRAnalyticsUtilities

+ (int64_t)getRedactedBundleID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqual:@"com.apple.Music"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqual:@"com.apple.tv"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqual:@"com.apple.music.classical"])
    {
      int64_t v5 = 3;
    }
    else if ([v4 isEqual:@"com.apple.mobilesafari"])
    {
      int64_t v5 = 4;
    }
    else if ([v4 isEqual:@"com.apple.podcasts"])
    {
      int64_t v5 = 5;
    }
    else if ([v4 hasPrefix:@"com.apple."])
    {
      int64_t v5 = 6;
    }
    else
    {
      int64_t v5 = 7;
    }
  }
  else
  {
    int64_t v5 = 8;
  }

  return v5;
}

+ (id)candidateTypeForCandidate:(id)a3
{
  id v3 = a3;
  v4 = [v3 nodes];
  unint64_t v5 = [v4 count];

  if (v5 <= 1)
  {
    v7 = [v3 nodes];
    v8 = [v7 allObjects];
    v9 = [v8 firstObject];
    v10 = [v9 avOutputDevice];

    if (v10)
    {
      v11 = [v3 nodes];
      v12 = [v11 allObjects];
      v13 = [v12 firstObject];
      v14 = [v13 avOutputDevice];
      IRAVOutputDeviceTypeToString([v14 deviceType]);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = @"Invalid";
    }
  }
  else
  {
    v6 = @"Group";
  }

  return v6;
}

+ (id)candidateModelTypeForCandidate:(id)a3
{
  id v3 = a3;
  v4 = [v3 nodes];
  unint64_t v5 = [v4 count];

  if (v5 <= 1)
  {
    v7 = [v3 nodes];
    v8 = [v7 allObjects];
    v9 = [v8 firstObject];
    v10 = [v9 avOutputDevice];

    if (v10)
    {
      v11 = [v3 nodes];
      v12 = [v11 allObjects];
      v13 = [v12 firstObject];
      v14 = [v13 avOutputDevice];
      IRAVOutputDeviceSubTypeToString([v14 deviceSubType]);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = @"Invalid";
    }
  }
  else
  {
    v6 = @"Cluster";
  }

  return v6;
}

@end