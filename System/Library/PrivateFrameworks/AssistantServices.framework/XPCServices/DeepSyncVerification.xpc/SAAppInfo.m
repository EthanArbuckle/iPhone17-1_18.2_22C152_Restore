@interface SAAppInfo
- (id)dsv_description;
- (id)dsv_diffAgainstApplicationProxy:(id)a3;
@end

@implementation SAAppInfo

- (id)dsv_description
{
  v2 = [(SAAppInfo *)self dictionary];
  v3 = [v2 description];

  return v3;
}

- (id)dsv_diffAgainstApplicationProxy:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [v4 shortVersionString];
  if (v6)
  {
    v7 = [(SAAppInfo *)self appIdentifyingInfo];
    v8 = [v7 version];
    unsigned __int8 v9 = [v6 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v10 = [v4 shortVersionString];
      v11 = [(SAAppInfo *)self appIdentifyingInfo];
      v12 = [v11 version];
      v13 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"version", v10, v12 validFormatSpecifiers error];
      [v5 addObject:v13];
    }
  }
  v14 = [v4 bundleVersion];
  if (v14)
  {
    v15 = [(SAAppInfo *)self appIdentifyingInfo];
    v16 = [v15 buildNumber];
    unsigned __int8 v17 = [v14 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      v18 = [v4 bundleVersion];
      v19 = [(SAAppInfo *)self appIdentifyingInfo];
      v20 = [v19 buildNumber];
      v21 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"buildNumber", v18, v20 validFormatSpecifiers error];
      [v5 addObject:v21];
    }
  }
  v22 = [v4 objectForInfoDictionaryKey:kCFBundleNameKey ofClass:objc_opt_class()];
  if (v22)
  {
    v23 = [(SAAppInfo *)self appName];
    unsigned __int8 v24 = [v22 isEqualToString:v23];

    if ((v24 & 1) == 0)
    {
      v25 = [(SAAppInfo *)self appName];
      v26 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"appName", v22, v25 validFormatSpecifiers error];
      [v5 addObject:v26];
    }
  }
  v83 = v5;
  v27 = v6;
  v28 = [v4 objectForInfoDictionaryKey:_kCFBundleDisplayNameKey ofClass:objc_opt_class()];
  if (v28)
  {
    v29 = [(SAAppInfo *)self displayAppName];
    unsigned __int8 v30 = [v28 isEqualToString:v29];

    if ((v30 & 1) == 0)
    {
      v31 = [(SAAppInfo *)self displayAppName];
      v32 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"displayAppName", v28, v31 validFormatSpecifiers error];
      [v83 addObject:v32];
    }
  }
  v33 = [v4 objectForInfoDictionaryKey:@"CFBundleSpokenName" ofClass:objc_opt_class()];
  if (v33)
  {
    v34 = [(SAAppInfo *)self spokenName];
    unsigned __int8 v35 = [v33 isEqualToString:v34];

    if ((v35 & 1) == 0)
    {
      v36 = [(SAAppInfo *)self spokenName];
      v37 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"spokenName", v33, v36 validFormatSpecifiers error];
      [v83 addObject:v37];
    }
  }
  v79 = v33;
  v82 = v14;
  v38 = [v4 objectForInfoDictionaryKey:@"CFBundleCarDisplayName" ofClass:objc_opt_class()];
  if (v38)
  {
    v39 = [(SAAppInfo *)self carPlayAlternativeDisplayName];
    unsigned __int8 v40 = [v38 isEqualToString:v39];

    if ((v40 & 1) == 0)
    {
      v41 = [(SAAppInfo *)self carPlayAlternativeDisplayName];
      v42 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"carPlayAlternativeDisplayName", v38, v41 validFormatSpecifiers error];
      [v83 addObject:v42];
    }
  }
  v43 = [v4 itemID];
  v44 = [v43 stringValue];

  v80 = v28;
  v81 = v22;
  if ([v44 isEqualToString:@"0"])
  {
    v45 = v44;
    v44 = 0;
LABEL_24:

    goto LABEL_25;
  }
  if (v44)
  {
    v46 = [(SAAppInfo *)self adamId];
    unsigned __int8 v47 = [v44 isEqualToString:v46];

    if ((v47 & 1) == 0)
    {
      v45 = [v4 itemID];
      v48 = [v45 stringValue];
      v49 = [(SAAppInfo *)self adamId];
      v50 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"adamId", v48, v49 validFormatSpecifiers error];
      [v83 addObject:v50];

      goto LABEL_24;
    }
  }
LABEL_25:
  v51 = [v4 itemName];
  if (v51)
  {
    v52 = [(SAAppInfo *)self spotlightName];
    unsigned __int8 v53 = [v51 isEqualToString:v52];

    if ((v53 & 1) == 0)
    {
      v54 = [v4 itemName];
      v55 = [(SAAppInfo *)self spotlightName];
      v56 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"spotlightName", v54, v55 validFormatSpecifiers error];
      [v83 addObject:v56];
    }
  }
  v57 = [v4 vendorName];
  if (v57)
  {
    v58 = [(SAAppInfo *)self providerName];
    unsigned __int8 v59 = [v57 isEqualToString:v58];

    if ((v59 & 1) == 0)
    {
      v60 = [v4 vendorName];
      v61 = [(SAAppInfo *)self providerName];
      v62 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"providerName", v60, v61 validFormatSpecifiers error];
      [v83 addObject:v62];
    }
  }
  unsigned int v63 = [v4 isBetaApp];
  if (v63 != [(SAAppInfo *)self betaApp])
  {
    v64 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isBetaApp]);
    v65 = +[NSNumber numberWithBool:[(SAAppInfo *)self betaApp]];
    v66 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"betaApp", v64, v65 validFormatSpecifiers error];
    [v83 addObject:v66];
  }
  v67 = [v4 entitlementValueForKey:@"com.apple.smoot.subscriptionservice" ofClass:objc_opt_class()];
  id v68 = [v67 BOOLValue];

  if (v68 != [(SAAppInfo *)self supportsUniversalSearchSubscription])
  {
    v69 = +[NSNumber numberWithBool:v68];
    v70 = +[NSNumber numberWithBool:[(SAAppInfo *)self supportsUniversalSearchSubscription]];
    v71 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"supportsUniversalSearchSubscription", v69, v70 validFormatSpecifiers error];
    [v83 addObject:v71];
  }
  v72 = +[INAppInfo appInfoWithAppProxy:v4];
  v73 = [v72 supportedIntents];
  id v74 = [v73 count];

  if ((v74 != 0) != [(SAAppInfo *)self hasSiriIntegration])
  {
    v75 = +[NSNumber numberWithBool:v74 != 0];
    v76 = +[NSNumber numberWithBool:[(SAAppInfo *)self hasSiriIntegration]];
    v77 = +[NSString stringWithValidatedFormat:@"field: %@, client value: %@, server value:%@", @"%@%@%@", 0, @"hasSiriIntegration", v75, v76 validFormatSpecifiers error];
    [v83 addObject:v77];
  }
  return v83;
}

@end