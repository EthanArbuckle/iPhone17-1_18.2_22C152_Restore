@interface HDProviderServiceSpecification
+ (BOOL)addAuthorizationHeadersToRequest:(id)a3 error:(id *)a4;
+ (NSURL)baseSearchURL;
+ (NSURL)baseURL;
+ (NSURLSessionConfiguration)defaultSessionConfiguration;
+ (id)URLForBrandLogosWithBatchID:(id)a3 scaleKey:(id)a4 error:(id *)a5;
+ (id)URLForFeaturedBrandLogosAtScaleKey:(id)a3 error:(id *)a4;
+ (id)URLForGatewaysWithBatchID:(id)a3 error:(id *)a4;
+ (id)URLForProvidersWithBatchID:(id)a3 searchSessionID:(id)a4 error:(id *)a5;
+ (id)URLForSearchQuery:(id)a3 supportedCountryCodes:(id)a4 searchSessionID:(id)a5 error:(id *)a6;
+ (id)_URLForListOfType:(int64_t)a3 batchID:(id)a4 searchSessionID:(id)a5 error:(id *)a6;
+ (id)_baseURLForEnvironment:(int64_t)a3 useSearchHost:(BOOL)a4;
+ (id)_dictionaryFromJSONObject:(id)a3 error:(id *)a4;
+ (id)_encodedBrandLogosFromFetchedJSONObject:(id)a3 error:(id *)a4;
+ (id)_gatewaysFromProviderDictionary:(id)a3 error:(id *)a4;
+ (id)_hostForEnvironment:(int64_t)a3;
+ (id)_providerDictionaryFromJSONObject:(id)a3 matchingExternalID:(id)a4 error:(id *)a5;
+ (id)_resultsArrayFromJSONObject:(id)a3 error:(id *)a4;
+ (id)_resultsDictionaryFromJSONObject:(id)a3 error:(id *)a4;
+ (id)_searchHostForEnvironment:(int64_t)a3;
+ (id)_searchResultsFromFetchedJSONObject:(id)a3 error:(id *)a4;
+ (id)brandLogosFromFetchedJSONObject:(id)a3 error:(id *)a4;
+ (id)gatewayFromFetchedJSONObject:(id)a3 matchingExternalID:(id)a4 error:(id *)a5;
+ (id)gatewaysFromFetchedJSONObject:(id)a3 matchingExternalIDs:(id)a4 error:(id *)a5;
+ (id)languageAndRegionQueryParameter;
+ (id)searchResultsPageFromFetchedJSONObject:(id)a3 error:(id *)a4;
+ (int64_t)currentServiceEnvironment;
+ (void)initialize;
+ (void)providerAndGatewaysFromFetchedJSONObject:(id)a3 matchingProviderExternalID:(id)a4 completion:(id)a5;
@end

@implementation HDProviderServiceSpecification

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    uint64_t v4 = HDCPSDefaultEnvironment();
    v5 = +[NSUserDefaults standardUserDefaults];
    uint64_t v10 = HDCPSEnvironmentDefaultsKey;
    v6 = +[NSNumber numberWithInteger:v4];
    v11 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [v5 registerDefaults:v7];

    v8 = HDHealthRecordsPluginBundle();
    v9 = [v8 resourceURL];
    +[HKJSONValidator registerSearchPath:v9];
  }
}

+ (int64_t)currentServiceEnvironment
{
  if (!+[_HKBehavior isAppleInternalInstall]) {
    return 0;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:HDCPSEnvironmentDefaultsKey];

  return (int64_t)v3;
}

+ (NSURLSessionConfiguration)defaultSessionConfiguration
{
  v2 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  CFStringRef v6 = @"User-Agent";
  id v3 = HDHealthRecordsPrivateUserAgentString();
  v7 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 setHTTPAdditionalHeaders:v4];

  objc_msgSend(v2, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleHealthProviderService);
  objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", kHKHealthAppBundleIdentifier);
  [v2 setTimeoutIntervalForRequest:15.0];

  return (NSURLSessionConfiguration *)v2;
}

+ (BOOL)addAuthorizationHeadersToRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 URL];
  v8 = [v7 host];

  v9 = objc_msgSend(a1, "_searchHostForEnvironment:", objc_msgSend(a1, "currentServiceEnvironment"));
  if ([v8 isEqualToString:v9])
  {
    char v10 = 1;
  }
  else
  {
    v11 = +[NSDate date];
    [v11 timeIntervalSince1970];
    v13 = +[NSNumber numberWithDouble:floor(v12)];
    v14 = [v13 stringValue];

    if (v14)
    {
      v39 = v8;
      v15 = [v6 URL];
      v16 = [v15 path];

      v17 = [v6 URL];
      v18 = [v17 query];

      v35 = a4;
      v38 = v18;
      if ([v18 length])
      {
        CFStringRef v19 = @"/";
        if (v16) {
          CFStringRef v19 = v16;
        }
        uint64_t v20 = +[NSString stringWithFormat:@"%@?%@", v19, v18];

        v16 = (__CFString *)v20;
      }
      v40[0] = v16;
      v40[1] = v14;
      v21 = +[NSArray arrayWithObjects:v40 count:2];
      v22 = +[NSString pathWithComponents:v21];

      v23 = [@"51418bebe6b4f26a164cba44d744d6a24f9f0e3d21b43ef8227683dd64319a" dataUsingEncoding:4];
      v37 = v22;
      v24 = [v22 dataUsingEncoding:4];
      v25 = +[NSMutableData dataWithLength:32];
      id v26 = v23;
      v36 = v14;
      id v27 = [v26 bytes];
      id v28 = [v26 length];
      id v29 = v24;
      id v30 = [v29 bytes];
      id v31 = [v29 length];
      id v32 = v25;
      CCHmac(2u, v27, (size_t)v28, v30, (size_t)v31, [v32 mutableBytes]);
      v33 = [v32 base64EncodedStringWithOptions:0];
      char v10 = v33 != 0;
      if (v33)
      {
        [v6 setValue:v33 forHTTPHeaderField:@"X-Apple-HMAC-Signature"];
        v14 = v36;
        [v6 setValue:v36 forHTTPHeaderField:@"X-Apple-HMAC-Time"];
        v8 = v39;
      }
      else
      {
        +[NSError hk_assignError:v35 code:100 description:@"no authentication code"];
        v8 = v39;
        v14 = v36;
      }
    }
    else
    {
      +[NSError hk_assignError:a4 code:3 description:@"authorization has no time"];
      char v10 = 0;
    }
  }
  return v10;
}

+ (id)URLForSearchQuery:(id)a3 supportedCountryCodes:(id)a4 searchSessionID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (((unint64_t)[v10 pageOffset] & 0x8000000000000000) != 0)
  {
    +[NSError hk_assignError:a6 code:100 description:@"Service given invalid search parameters"];
LABEL_15:
    v44 = 0;
    goto LABEL_16;
  }
  if (![v11 count])
  {
    +[NSError hk_assignError:a6 code:3 format:@"URL can only be constructed if there's at least one supported country code"];
    goto LABEL_15;
  }
  v13 = [a1 baseSearchURL];
  v14 = +[NSURLComponents componentsWithURL:v13 resolvingAgainstBaseURL:0];

  v15 = [v14 path];
  v16 = [v15 stringByAppendingPathComponent:@"search"];
  [v14 setPath:v16];

  id v17 = [&__NSArray0__struct mutableCopy];
  v18 = [v10 searchString];
  id v19 = [v18 length];

  if (v19)
  {
    uint64_t v20 = [v10 searchString];
    v21 = +[NSURLQueryItem queryItemWithName:@"query" value:v20];
    [v17 addObject:v21];
  }
  v22 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:1];
  v46 = v22;
  v23 = +[NSArray arrayWithObjects:&v46 count:1];
  v24 = [v11 sortedArrayUsingDescriptors:v23];
  v25 = [v24 componentsJoinedByString:@","];

  id v26 = +[NSURLQueryItem queryItemWithName:@"cc" value:v25];
  [v17 addObject:v26];

  if ([v12 length])
  {
    id v27 = +[NSURLQueryItem queryItemWithName:@"chrsid" value:v12];
    [v17 addObject:v27];
  }
  uint64_t v28 = [v10 latitude];
  if (v28)
  {
    id v29 = (void *)v28;
    id v30 = [v10 longitude];

    if (v30)
    {
      id v31 = [v10 latitude];
      [v31 doubleValue];
      uint64_t v33 = v32;

      v34 = [v10 longitude];
      [v34 doubleValue];
      uint64_t v36 = v35;

      v37 = +[NSString stringWithFormat:@"%.1f,%.1f", v33, v36];
      v38 = +[NSURLQueryItem queryItemWithName:@"geo" value:v37];
      [v17 addObject:v38];
    }
  }
  if ([v10 options])
  {
    v39 = +[NSURLQueryItem queryItemWithName:@"feature" value:HKClinicalGatewayFeatureNameClinicalSharing];
    [v17 addObject:v39];
  }
  v40 = [a1 languageAndRegionQueryParameter];
  v41 = +[NSURLQueryItem queryItemWithName:@"loc" value:v40];
  [v17 addObject:v41];

  v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v10 pageOffset]);
  v43 = +[NSURLQueryItem queryItemWithName:@"from" value:v42];
  [v17 addObject:v43];

  [v14 setQueryItems:v17];
  v44 = [v14 URL];

LABEL_16:

  return v44;
}

+ (id)URLForBrandLogosWithBatchID:(id)a3 scaleKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 _URLForListOfType:0 batchID:a3 searchSessionID:0 error:a5];
  id v10 = +[NSURLComponents componentsWithURL:v9 resolvingAgainstBaseURL:0];
  id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"size" value:v8];

  id v15 = v11;
  id v12 = +[NSArray arrayWithObjects:&v15 count:1];
  [v10 setQueryItems:v12];

  v13 = [v10 URL];

  return v13;
}

+ (id)URLForFeaturedBrandLogosAtScaleKey:(id)a3 error:(id *)a4
{
  return [a1 URLForBrandLogosWithBatchID:@"featured" scaleKey:a3 error:a4];
}

+ (id)URLForProvidersWithBatchID:(id)a3 searchSessionID:(id)a4 error:(id *)a5
{
  return [a1 _URLForListOfType:2 batchID:a3 searchSessionID:a4 error:a5];
}

+ (id)URLForGatewaysWithBatchID:(id)a3 error:(id *)a4
{
  return [a1 _URLForListOfType:1 batchID:a3 searchSessionID:0 error:a4];
}

+ (id)_URLForListOfType:(int64_t)a3 batchID:(id)a4 searchSessionID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (![v10 length])
  {
    +[NSError hk_assignError:a6 code:100 description:@"Service: invalid provider batch_id"];
    v16 = 0;
    goto LABEL_20;
  }
  id v12 = +[NSUserDefaults standardUserDefaults];
  v13 = v12;
  if (a3 != 1
    || ([v12 stringForKey:HDHealthRecordsGatewayListURL],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v17 = [a1 baseURL];
    v18 = +[NSURLComponents componentsWithURL:v17 resolvingAgainstBaseURL:0];

    if (a3 == 2)
    {
      id v19 = [v18 path];
      uint64_t v20 = v19;
      CFStringRef v21 = @"provider_list";
    }
    else if (a3 == 1)
    {
      id v19 = [v18 path];
      uint64_t v20 = v19;
      CFStringRef v21 = @"gateway_list";
    }
    else
    {
      if (a3)
      {
LABEL_13:
        v23 = [v18 path];
        v24 = [v23 stringByAppendingPathComponent:v10];
        [v18 setPath:v24];

        if ([v11 length])
        {
          v25 = +[NSURLQueryItem queryItemWithName:@"chrsid" value:v11];
          id v26 = [v18 queryItems];

          if (v26)
          {
            id v27 = [v18 queryItems];
            uint64_t v28 = [v27 arrayByAddingObject:v25];
            [v18 setQueryItems:v28];
          }
          else
          {
            id v30 = v25;
            id v27 = +[NSArray arrayWithObjects:&v30 count:1];
            [v18 setQueryItems:v27];
          }
        }
        v16 = [v18 URL];

        goto LABEL_19;
      }
      id v19 = [v18 path];
      uint64_t v20 = v19;
      CFStringRef v21 = @"brand_logos";
    }
    v22 = [v19 stringByAppendingPathComponent:v21];
    [v18 setPath:v22];

    goto LABEL_13;
  }
  id v15 = (void *)v14;
  v16 = +[NSURL URLWithString:v14];

LABEL_19:
LABEL_20:

  return v16;
}

+ (id)_dictionaryFromJSONObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (v6)
  {
    id v7 = v5;
  }
  else
  {
    +[NSError hk_assignError:a4 code:607 description:@"JSONObject not a dictionary"];
    id v7 = 0;
  }

  return v7;
}

+ (id)_resultsArrayFromJSONObject:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a1, "_dictionaryFromJSONObject:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v5, "hk_safeArrayForKeyPath:error:", @"results", a4);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_resultsDictionaryFromJSONObject:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a1, "_dictionaryFromJSONObject:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v5, "hk_safeDictionaryForKeyPath:error:", @"results", a4);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_providerDictionaryFromJSONObject:(id)a3 matchingExternalID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = +[HDProviderServiceSpecification _resultsArrayFromJSONObject:a3 error:a5];
  if (v8)
  {
    v9 = HDHealthRecordsPluginBundle();
    unsigned int v10 = +[HKJSONValidator validateJSONObject:v8 withSchemaNamed:@"ProviderListSchema" bundle:v9 error:a5];

    if (v10)
    {
      CFStringRef v21 = a5;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v8;
      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v17 = [v16 objectForKeyedSubscript:@"providerID"];
            unsigned __int8 v18 = [v17 isEqualToString:v7];

            if (v18)
            {
              id v19 = v16;

              goto LABEL_13;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      +[NSError hk_assignError:v21 code:607 description:@"The expected provider is missing from the service's response."];
    }
  }
  id v19 = 0;
LABEL_13:

  return v19;
}

+ (id)searchResultsPageFromFetchedJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = HDHealthRecordsPluginBundle();
  id v22 = 0;
  unsigned __int8 v8 = +[HKJSONValidator validateJSONObject:v6 withSchemaNamed:@"ProviderSearchResultPageSchema" bundle:v7 error:&v22];
  id v9 = v22;

  if (v8)
  {
    id v10 = [a1 _searchResultsFromFetchedJSONObject:v6 error:a4];
    if (v10)
    {
      id v11 = [a1 _dictionaryFromJSONObject:v6 error:a4];
      id v12 = v11;
      if (v11)
      {
        id v13 = [v11 objectForKeyedSubscript:@"from"];
        id v14 = [v13 integerValue];

        id v15 = [v12 objectForKeyedSubscript:@"_nextFrom"];
        id v16 = [v15 integerValue];

        id v17 = [v12 objectForKeyedSubscript:@"_size"];
        id v18 = [v17 integerValue];

        id v19 = [objc_alloc((Class)HKClinicalProviderSearchResultsPage) initWithSearchResults:v10 from:v14 nextFrom:v16 size:v18];
      }
      else
      {
        id v19 = 0;
      }

      goto LABEL_12;
    }
  }
  else
  {
    id v20 = v9;
    id v10 = v20;
    if (v20)
    {
      if (a4)
      {
        id v10 = v20;
        id v19 = 0;
        *a4 = v10;
        goto LABEL_12;
      }
      _HKLogDroppedError();
    }
  }
  id v19 = 0;
LABEL_12:

  return v19;
}

+ (id)_searchResultsFromFetchedJSONObject:(id)a3 error:(id *)a4
{
  id v42 = 0;
  id v5 = [a1 _resultsArrayFromJSONObject:a3 error:&v42];
  id v6 = v42;
  id v7 = v6;
  if (v5)
  {
    id v27 = v6;
    id v29 = +[NSMutableArray array];
    unsigned __int8 v8 = +[NSUserDefaults standardUserDefaults];
    id v9 = [v8 stringArrayForKey:HDCPSWhitelistedProvidersDefaultsKey];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v28 = v5;
    id obj = v5;
    id v33 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v33)
    {
      id v31 = v9;
      uint64_t v32 = *(void *)v39;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v12 = [v11 objectForKeyedSubscript:@"providerID"];
          if (!v9 || [v9 containsObject:v12])
          {
            v37 = [v11 objectForKeyedSubscript:@"providerBatchID"];
            id v13 = [v11 objectForKeyedSubscript:@"title"];
            uint64_t v36 = [v11 objectForKeyedSubscript:@"subtitle"];
            uint64_t v35 = [v11 objectForKeyedSubscript:@"location"];
            uint64_t v14 = [v11 objectForKeyedSubscript:@"brandID"];
            id v15 = [v11 objectForKeyedSubscript:@"brandBatchID"];
            id v16 = [v11 objectForKeyedSubscript:@"country"];
            id v17 = [v11 objectForKeyedSubscript:@"minCompatibleApiVersion"];
            id v18 = [v17 integerValue];
            v34 = (void *)v14;
            if (v13)
            {
              id v19 = v18;
              id v20 = 0;
              if (v14 && v15) {
                id v20 = [objc_alloc((Class)HKClinicalBrand) initWithExternalID:v14 batchID:v15];
              }
              CFStringRef v21 = [v11 objectForKeyedSubscript:@"supported"];
              id v22 = [v21 BOOLValue];

              id v23 = [objc_alloc((Class)HKClinicalProviderSearchResult) initWithExternalID:v12 batchID:v37 title:v13 subtitle:v36 location:v35 supported:v22 countryCode:v16 brand:v20 minCompatibleAPIVersion:v19];
              if (v23) {
                [v29 addObject:v23];
              }

              id v9 = v31;
            }
            else
            {
              _HKInitializeLogging();
              long long v24 = (void *)HKLogHealthRecords;
              id v9 = v31;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
                sub_AB12C(v43, v24, (uint64_t)v11, &v44);
              }
            }
          }
        }
        id v33 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v33);
    }

    id v7 = v27;
    id v5 = v28;
  }
  else
  {
    id v25 = v6;
    id v9 = v25;
    if (v25)
    {
      if (a4)
      {
        id v9 = v25;
        id v29 = 0;
        *a4 = v9;
        goto LABEL_27;
      }
      _HKLogDroppedError();
    }
    id v29 = 0;
  }
LABEL_27:

  return v29;
}

+ (void)providerAndGatewaysFromFetchedJSONObject:(id)a3 matchingProviderExternalID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v33 = 0;
  id v9 = [a1 _providerDictionaryFromJSONObject:a3 matchingExternalID:a4 error:&v33];
  id v31 = v33;
  if (v9)
  {
    id v10 = [v9 objectForKeyedSubscript:@"urls"];
    id v11 = [v9 objectForKeyedSubscript:@"brand"];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 objectForKeyedSubscript:@"brandID"];
      uint64_t v14 = [v12 objectForKeyedSubscript:@"brandBatchID"];
      id v15 = [objc_alloc((Class)HKClinicalBrand) initWithExternalID:v13 batchID:v14];
    }
    else
    {
      id v15 = 0;
    }
    id v32 = 0;
    id v16 = [a1 _gatewaysFromProviderDictionary:v9 error:&v32];
    id v17 = v32;
    if (v17)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AB218();
      }
      (*((void (**)(id, void, void, id))v8 + 2))(v8, 0, 0, v17);
      id v18 = v10;
    }
    else
    {
      uint64_t v28 = objc_msgSend(v16, "hk_map:", &stru_111FE8);
      id v26 = objc_alloc((Class)HKClinicalProvider);
      id v25 = [v9 objectForKeyedSubscript:@"providerID"];
      long long v24 = [v9 objectForKeyedSubscript:@"title"];
      [v9 objectForKeyedSubscript:@"subtitle"];
      id v30 = v15;
      id v19 = v27 = v12;
      [v9 objectForKeyedSubscript:@"location"];
      id v20 = v29 = v16;
      id v18 = v10;
      CFStringRef v21 = [v10 objectForKeyedSubscript:@"info"];
      id v22 = +[NSURL hk_safeURLWithString:v21];
      id v23 = [v26 initWithExternalID:v25 title:v24 subtitle:v19 location:v20 informationURL:v22 brand:v30 gateways:v28];

      id v16 = v29;
      id v12 = v27;
      id v15 = v30;

      (*((void (**)(id, id, void *, void))v8 + 2))(v8, v23, v29, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AB1B0();
    }
    (*((void (**)(id, void, void, id))v8 + 2))(v8, 0, 0, v31);
  }
}

+ (id)_gatewaysFromProviderDictionary:(id)a3 error:(id *)a4
{
  uint64_t v4 = objc_msgSend(a3, "objectForKeyedSubscript:", @"gateways", a4);
  id v5 = objc_msgSend(v4, "hk_map:", &stru_112028);

  return v5;
}

+ (id)gatewayFromFetchedJSONObject:(id)a3 matchingExternalID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v15 = v8;
  id v9 = a3;
  id v10 = +[NSArray arrayWithObjects:&v15 count:1];
  id v11 = objc_msgSend(a1, "gatewaysFromFetchedJSONObject:matchingExternalIDs:error:", v9, v10, a5, v15);

  if (v11)
  {
    id v12 = [v11 lastObject];
    if (!v12)
    {
      +[NSError hk_assignError:a5 code:605 description:@"Failed to find the requested gateway within the given response."];
      _HKInitializeLogging();
      id v13 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_AB280((uint64_t)a1, v13);
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)gatewaysFromFetchedJSONObject:(id)a3 matchingExternalIDs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v42 = 0;
  id v35 = a1;
  id v9 = [a1 _resultsArrayFromJSONObject:a3 error:&v42];
  id v10 = v42;
  id v11 = v10;
  if (v9)
  {
    id v36 = objc_alloc_init((Class)NSMutableArray);
    id v34 = v8;
    if (v8)
    {
      id v12 = [objc_alloc((Class)NSSet) initWithArray:v8];
      id v13 = [objc_alloc((Class)NSMutableSet) initWithArray:v8];
    }
    else
    {
      id v13 = 0;
      id v12 = 0;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v33 = v9;
    id v15 = v9;
    id v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          id v37 = 0;
          unsigned __int8 v21 = +[HDClinicalGateway validateContent:v20 error:&v37];
          id v22 = v37;
          if (v21)
          {
            id v23 = [[HDClinicalGateway alloc] initWithContent:v20];
            id v24 = [(HDClinicalGateway *)v23 externalID];
            if (!v12 || [v12 containsObject:v24])
            {
              [v36 addObject:v23];
              [v13 removeObject:v24];
            }
          }
          else
          {
            _HKInitializeLogging();
            id v25 = (void *)HKLogHealthRecords;
            if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_20;
            }
            id v23 = v25;
            id v26 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            uint64_t v44 = v26;
            __int16 v45 = 2114;
            id v46 = v22;
            id v24 = v26;
            _os_log_impl(&dword_0, &v23->super.super, OS_LOG_TYPE_DEFAULT, "%{public}@ gateways from fetched JSON: encountered invalid gateway, skipping: %{public}@", buf, 0x16u);
          }

LABEL_20:
        }
        id v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v17);
    }

    if ([v13 count])
    {
      _HKInitializeLogging();
      id v27 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = v27;
        id v29 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        uint64_t v44 = v29;
        id v30 = v29;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ gateways from fetched JSON: failed to find all requested gateways in gateway batch response", buf, 0xCu);
      }
    }

    id v9 = v33;
    id v8 = v34;
  }
  else
  {
    id v14 = v10;
    if (v14)
    {
      if (a5) {
        *a5 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    id v31 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AB2F8(v31, (uint64_t)v35, (uint64_t)v14);
    }
    id v36 = 0;
  }

  return v36;
}

+ (id)brandLogosFromFetchedJSONObject:(id)a3 error:(id *)a4
{
  id v30 = 0;
  uint64_t v4 = [a1 _encodedBrandLogosFromFetchedJSONObject:a3 error:&v30];
  id v23 = v30;
  id v25 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:@"brandID"];
        id v12 = [v10 objectForKeyedSubscript:@"base64ImageData"];
        if (v12)
        {
          id v13 = objc_alloc((Class)NSData);
          id v14 = objc_msgSend(v12, "hk_base64PaddedString");
          id v15 = [v13 initWithBase64EncodedString:v14 options:1];

          if (v15)
          {
            [v25 setObject:v15 forKeyedSubscript:v11];
          }
          else
          {
            _HKInitializeLogging();
            id v19 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = v19;
              unsigned __int8 v21 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543618;
              id v32 = a1;
              __int16 v33 = 2112;
              id v34 = v21;
              _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to decode image data for brand: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          id v16 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            id v17 = v16;
            uint64_t v18 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543618;
            id v32 = a1;
            __int16 v33 = 2112;
            id v34 = v18;
            _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@ no image data for brand: %@", buf, 0x16u);
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v7);
  }

  return v25;
}

+ (id)_encodedBrandLogosFromFetchedJSONObject:(id)a3 error:(id *)a4
{
  id v5 = +[HDProviderServiceSpecification _resultsArrayFromJSONObject:error:](HDProviderServiceSpecification, "_resultsArrayFromJSONObject:error:", a3);
  if (v5
    && (HDHealthRecordsPluginBundle(),
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = +[HKJSONValidator validateJSONObject:v5 withSchemaNamed:@"BrandLogoListSchema" bundle:v6 error:a4], v6, v7))
  {
    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (NSURL)baseURL
{
  id v3 = [a1 currentServiceEnvironment];

  return (NSURL *)[a1 _baseURLForEnvironment:v3 useSearchHost:0];
}

+ (NSURL)baseSearchURL
{
  id v3 = [a1 currentServiceEnvironment];

  return (NSURL *)[a1 _baseURLForEnvironment:v3 useSearchHost:1];
}

+ (id)_baseURLForEnvironment:(int64_t)a3 useSearchHost:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init((Class)NSURLComponents);
  [v7 setScheme:@"https"];
  if (v4) {
    [a1 _searchHostForEnvironment:a3];
  }
  else {
  id v8 = [a1 _hostForEnvironment:a3];
  }
  [v7 setHost:v8];

  id v9 = +[NSString stringWithFormat:@"/v%ld", HKProviderServiceMaximumCompatibleAPIVersion()];
  id v10 = [v9 stringByAppendingString:@"/providers/"];
  [v7 setPath:v10];

  id v11 = [v7 URL];

  return v11;
}

+ (id)_hostForEnvironment:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return 0;
  }
  else {
    return off_112048[a3];
  }
}

+ (id)_searchHostForEnvironment:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return 0;
  }
  else {
    return off_1120B8[a3];
  }
}

+ (id)languageAndRegionQueryParameter
{
  v2 = +[NSLocale autoupdatingCurrentLocale];
  id v3 = [v2 languageCode];
  uint64_t v4 = [v2 countryCode];
  id v5 = (void *)v4;
  id v6 = @"XX";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = +[NSString stringWithFormat:@"%@_%@", v3, v7];

  return v8;
}

@end