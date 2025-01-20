@interface CTDeviceDataUsage
- (BOOL)addUsage:(id)a3 forBundle:(id)a4 forPeriod:(unint64_t)a5 withPreferredLanguages:(id)a6 withBlockedBundleIds:(id)a7 using:(id)a8;
- (BOOL)isProxiedTraffic:(id)a3 usingBuilder:(id)a4;
- (BOOL)isWifiAssist:(id)a3;
- (CTDeviceDataUsage)initWithPeriods:(unint64_t)a3;
- (id)bundleIdForBundleId:(id)a3 usingBuilder:(id)a4;
- (id)displayNameForBundle:(id)a3 withBuilder:(id)a4 withPreferredLanguages:(id)a5;
- (id)groupForBundleId:(id)a3 usingBuilder:(id)a4;
- (id)mappedBundleIdForBundleId:(id)a3 isGreenTea:(BOOL)a4;
- (id)validateSystemService:(id)a3 usingBuilder:(id)a4 withPreferredLanguages:(id)a5;
@end

@implementation CTDeviceDataUsage

- (CTDeviceDataUsage)initWithPeriods:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  v14.receiver = self;
  v14.super_class = (Class)CTDeviceDataUsage;
  v4 = [(CTDeviceDataUsage *)&v14 init];
  v5 = v4;
  if (v4)
  {
    [(CTDeviceDataUsage *)v4 setPeriods:v3];
    v6 = +[NSMutableDictionary dictionary];
    [(CTDeviceDataUsage *)v5 setApps:v6];

    v7 = +[NSMutableDictionary dictionary];
    [(CTDeviceDataUsage *)v5 setUninstalledApps:v7];

    v8 = +[NSMutableDictionary dictionary];
    [(CTDeviceDataUsage *)v5 setProxiedOnlyApps:v8];

    v9 = +[NSMutableDictionary dictionary];
    [(CTDeviceDataUsage *)v5 setSystemServices:v9];

    v10 = +[NSMutableArray arrayWithCapacity:[(CTDeviceDataUsage *)v5 periods]];
    for (unint64_t i = 0; i < (unint64_t)[(CTDeviceDataUsage *)v5 periods]; ++i)
    {
      id v12 = [objc_alloc((Class)CTDataUsage) initWithHome:0 roaming:0];
      [v10 addObject:v12];
    }
    [(CTDeviceDataUsage *)v5 setWifiAssist:v10];
  }
  return v5;
}

- (id)displayNameForBundle:(id)a3 withBuilder:(id)a4 withPreferredLanguages:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a4 appProperties];
  v10 = [v9 objectForKey:v7];

  if ([v8 count])
  {
    uint64_t v11 = [v10 localizedName:v8];
    id v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = v7;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = v7;
  }

  return v14;
}

- (id)mappedBundleIdForBundleId:(id)a3 isGreenTea:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4 && ([v5 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0)
  {
    id v7 = 0;
    goto LABEL_10;
  }
  id v8 = [&off_100076578 objectForKey:v6];
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    if (![v6 hasPrefix:@"com.apple.DocumentManagerUICore."])
    {
      if ([v6 hasPrefix:@"com.apple.mobileassetd.client."])
      {
        id v7 = @"com.apple.datausage.softwareupdate";
      }
      else if (([v6 hasPrefix:@"com.apple.priml."] & 1) != 0 {
             || ([v6 hasPrefix:@"com.apple.AppleMediaDiscovery.PFL"] & 1) != 0)
      }
      {
        id v7 = @"com.apple.datausage.aiml";
      }
      else if ([v6 hasPrefix:@"com.apple.corelocation."])
      {
        id v7 = @"com.apple.datausage.location";
      }
      else
      {
        if ([v6 length] == (id)32)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v12 = [&off_100076578 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v19;
            while (2)
            {
              for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(&off_100076578);
                }
                id v15 = *(id *)(*((void *)&v18 + 1) + 8 * i);
                if (!strncmp((const char *)[v15 UTF8String], (const char *)objc_msgSend(v6, "UTF8String"), 0x20uLL))
                {
                  v10 = [&off_100076578 objectForKey:v15];
                  goto LABEL_8;
                }
              }
              id v12 = [&off_100076578 countByEnumeratingWithState:&v18 objects:v22 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
        if (![v6 hasPrefix:@"com.apple."]
          || ([v6 substringFromIndex:objc_msgSend(@"com.apple.", "length")],
              v16 = objc_claimAutoreleasedReturnValue(),
              [&off_100076578 objectForKey:v16],
              id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
              v16,
              !v7))
        {
          v17 = [@"com.apple." stringByAppendingString:v6];
          id v7 = [&off_100076578 objectForKey:v17];
        }
      }
      goto LABEL_9;
    }
    v10 = +[NSString stringWithUTF8String:"com.apple.datausage.docsandsync"];
  }
LABEL_8:
  id v7 = v10;
LABEL_9:

LABEL_10:

  return v7;
}

- (id)bundleIdForBundleId:(id)a3 usingBuilder:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned __int8 *)a4;
  id v8 = [(CTDeviceDataUsage *)self mappedBundleIdForBundleId:v6 isGreenTea:v7[32]];
  if (!v8) {
    id v8 = v6;
  }
  v9 = [v7 appProperties];
  id v10 = [v9 objectForKey:v8];

  if (!v10)
  {
    id v10 = [[CTAppProperties alloc] init:v8];
    uint64_t v11 = [v7 appProperties];
    [v11 setObject:v10 forKey:v8];

    id v12 = [v10 bundleId];
    uint64_t v13 = v12;
    if (v12 && ([v12 isEqual:v8] & 1) == 0)
    {
      id v14 = [v7 appProperties];
      [v14 setObject:v10 forKey:v13];
    }
  }
  id v15 = [v10 bundleId];
  v16 = v15;
  if (!v15) {
    id v15 = v8;
  }
  id v17 = v15;

  return v17;
}

- (BOOL)isProxiedTraffic:(id)a3 usingBuilder:(id)a4
{
  id v6 = a3;
  id v7 = (unsigned __int8 *)a4;
  uint64_t v8 = [(CTDeviceDataUsage *)self mappedBundleIdForBundleId:v6 isGreenTea:v7[32]];
  v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v6;
  }
  id v11 = v10;

  id v12 = [v7 appProperties];
  uint64_t v13 = [v12 objectForKey:v6];

  if (v13)
  {
    if ([v13 isRemoteApp])
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      id v15 = [v13 bundleId];
      if (v15) {
        unsigned int v14 = [v11 isEqual:v15] ^ 1;
      }
      else {
        LOBYTE(v14) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (BOOL)isWifiAssist:(id)a3
{
  return [a3 isEqualToString:@"com.apple.datausage.wifiassist"];
}

- (id)groupForBundleId:(id)a3 usingBuilder:(id)a4
{
  id v6 = a3;
  id v7 = (void **)a4;
  uint64_t v8 = [v7 appProperties];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    if (([v9 isInstalledApp] & 1) != 0 || objc_msgSend(v9, "isInternalApp"))
    {
      uint64_t v10 = [(CTDeviceDataUsage *)self apps];
LABEL_5:
      id v11 = (void *)v10;
      goto LABEL_9;
    }
    if ([v9 isRemoteApp])
    {
      uint64_t v10 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
      goto LABEL_5;
    }
    if ([v9 isSystemService])
    {
      uint64_t v10 = [(CTDeviceDataUsage *)self systemServices];
      goto LABEL_5;
    }
    if ([v9 isUninstalledApp])
    {
      uint64_t v10 = [(CTDeviceDataUsage *)self uninstalledApps];
      goto LABEL_5;
    }
    unsigned int v14 = *v7[3];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004C770((uint64_t)v6, v14);
    }
  }
  else
  {
    id v12 = *v7[3];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004C6F8((uint64_t)v6, v12);
    }
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (id)validateSystemService:(id)a3 usingBuilder:(id)a4 withPreferredLanguages:(id)a5
{
  id v8 = a3;
  v9 = (void **)a4;
  id v10 = a5;
  id v11 = [(CTDeviceDataUsage *)self displayNameForBundle:v8 withBuilder:v9 withPreferredLanguages:v10];
  if (((unint64_t)[v11 length] < 2
     || [v11 containsString:@"."])
    && ([v8 hasPrefix:@"com.apple.datausage."] & 1) == 0)
  {
    uint64_t v13 = *v9[3];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10004C7E8((uint64_t)v8, (uint64_t)v11, v13);
    }
    id v12 = @"com.apple.datausage.general";
  }
  else
  {
    id v12 = (__CFString *)v8;
  }

  return v12;
}

- (BOOL)addUsage:(id)a3 forBundle:(id)a4 forPeriod:(unint64_t)a5 withPreferredLanguages:(id)a6 withBlockedBundleIds:(id)a7 using:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  long long v18 = (void **)a8;
  if ((unint64_t)[(CTDeviceDataUsage *)self periods] > a5)
  {
    long long v19 = [(CTDeviceDataUsage *)self bundleIdForBundleId:v15 usingBuilder:v18];
    if ([v17 containsObject:v15])
    {
      long long v20 = *v18[3];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v41 = v15;
        __int16 v42 = 2114;
        v43 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I Not adding bundleId %{public}@, mapped bundleId %{public}@ is blocked", buf, 0x16u);
      }
      BOOL v21 = 0;
      goto LABEL_28;
    }
    if ([(CTDeviceDataUsage *)self isWifiAssist:v19])
    {
      v23 = [(CTDeviceDataUsage *)self wifiAssist];
      v24 = [v23 objectAtIndexedSubscript:a5];
      [v24 addUsage:v14];

      BOOL v21 = 1;
LABEL_28:

      goto LABEL_29;
    }
    v25 = [v18 appProperties];
    v26 = [v25 objectForKey:v19];

    v38 = v26;
    if (v26 && [v26 isSystemService])
    {
      uint64_t v27 = [(CTDeviceDataUsage *)self validateSystemService:v19 usingBuilder:v18 withPreferredLanguages:v16];

      long long v19 = (void *)v27;
    }
    v39 = [(CTDeviceDataUsage *)self groupForBundleId:v19 usingBuilder:v18];
    if (!v39) {
      goto LABEL_18;
    }
    v28 = [(CTDeviceDataUsage *)self apps];
    v29 = v39;
    if (v39 != v28)
    {
      v30 = [(CTDeviceDataUsage *)self proxiedOnlyApps];
      if (v39 != v30)
      {
        unsigned __int8 v36 = [v14 isEmpty];

        if (v36)
        {
LABEL_18:
          BOOL v21 = 0;
LABEL_27:

          goto LABEL_28;
        }
LABEL_21:
        id v31 = [v39 objectForKey:v19];
        if (!v31)
        {
          id v37 = objc_alloc((Class)CTPerAppDataUsage);
          v32 = [(CTDeviceDataUsage *)self displayNameForBundle:v19 withBuilder:v18 withPreferredLanguages:v16];
          id v31 = objc_msgSend(v37, "init:withPeriods:", v32, -[CTDeviceDataUsage periods](self, "periods"));

          [v39 setObject:v31 forKey:v19];
        }
        if ([(CTDeviceDataUsage *)self isProxiedTraffic:v15 usingBuilder:v18])
        {
          v33 = [v31 used];
          v34 = [v33 objectAtIndexedSubscript:a5];
          [v34 addProxiedUsage:v14];
        }
        else
        {
          v33 = [v31 used];
          v34 = [v33 objectAtIndexedSubscript:a5];
          [v34 addNativeUsage:v14];
        }

        BOOL v21 = 1;
        goto LABEL_27;
      }

      v29 = v28;
    }

    goto LABEL_21;
  }
  v22 = *v18[3];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10004C870(buf, a5, (uint64_t)[(CTDeviceDataUsage *)self periods], v22);
  }
  BOOL v21 = 0;
LABEL_29:

  return v21;
}

@end