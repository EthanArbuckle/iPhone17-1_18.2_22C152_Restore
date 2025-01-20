@interface ODRDiagnosticsClient
- (void)allRegisteredODRAppsWithReply:(id)a3;
- (void)assetsForBundleID:(id)a3 withReply:(id)a4;
- (void)cancelMaintenanceWithReply:(id)a3;
- (void)cancelRequestWithUUID:(id)a3 withCompletion:(id)a4;
- (void)expireAssetURLSForBundleIDs:(id)a3 withReply:(id)a4;
- (void)fakeWorkWithCount:(id)a3 reply:(id)a4;
- (void)fetchManifestForAdamID:(id)a3 externalVersionID:(id)a4 variant:(id)a5 withFetchCompletion:(id)a6;
- (void)getSimulatedBandwidthWithReply:(id)a3;
- (void)getSpaceReductionWithReply:(id)a3;
- (void)loadSourceURL:(id)a3 intoDestinationURL:(id)a4 isUrgent:(BOOL)a5 isStreaming:(BOOL)a6 withRequestCompletion:(id)a7;
- (void)manifestDictionaryForBundleID:(id)a3 withReply:(id)a4;
- (void)nonPurgeableAssetsWithReply:(id)a3;
- (void)pauseRequestWithUUID:(id)a3 withCompletion:(id)a4;
- (void)performMaintenanceWithReply:(id)a3;
- (void)prefetchAndRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5;
- (void)prefetchSourceURL:(id)a3 intoDestinationURL:(id)a4 withPrefetchCompletion:(id)a5;
- (void)prefetchThenRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5;
- (void)purgeAllAssetsForApplication:(id)a3 withRequestCompletion:(id)a4;
- (void)purgeAllAssetsForApplications:(id)a3 withRequestCompletion:(id)a4;
- (void)purgeAssetWithIdentifier:(id)a3 withRequestCompletion:(id)a4;
- (void)purgeBytes:(int64_t)a3 odrOnly:(BOOL)a4 urgency:(int)a5 withReply:(id)a6;
- (void)purgeableAssetsWithReply:(id)a3;
- (void)registerManifest:(id)a3 forBundleID:(id)a4 withRequestCompletion:(id)a5;
- (void)resumeRequestWithUUID:(id)a3 withCompletion:(id)a4;
- (void)setLoggingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setSampler:(id)a3 enabled:(BOOL)a4 samplingInterval:(double)a5 reply:(id)a6;
- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4;
- (void)setSpaceReduction:(unint64_t)a3 withReply:(id)a4;
- (void)statusWithReply:(id)a3;
- (void)testPurgeBytes:(int64_t)a3 urgency:(int)a4 withReply:(id)a5;
@end

@implementation ODRDiagnosticsClient

- (void)manifestDictionaryForBundleID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100018378;
  v17 = sub_100017D78;
  id v18 = 0;
  v7 = sub_1003B9318((uint64_t)ODRApplication, v5);
  v8 = sub_1002393C4();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10039CE38;
  v10[3] = &unk_100527F18;
  id v9 = v7;
  id v11 = v9;
  v12 = &v13;
  [v8 readUsingSession:v10];

  v6[2](v6, v14[5], 0);
  _Block_object_dispose(&v13, 8);
}

- (void)allRegisteredODRAppsWithReply:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100018378;
  v10 = sub_100017D78;
  id v11 = 0;
  v4 = sub_1002393C4();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10039D124;
  v5[3] = &unk_100521960;
  v5[4] = &v6;
  [v4 readUsingSession:v5];

  v3[2](v3, v7[5], 0);
  _Block_object_dispose(&v6, 8);
}

- (void)assetsForBundleID:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v58 = (void (**)(id, void *, void))a4;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = sub_100018378;
  v93 = sub_100017D78;
  id v94 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = sub_100018378;
  v87 = sub_100017D78;
  id v88 = 0;
  v56 = v5;
  uint64_t v6 = sub_1003B9318((uint64_t)ODRApplication, v5);
  v7 = sub_1002393C4();
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10039DB34;
  v79[3] = &unk_1005295D8;
  v81 = &v89;
  id v57 = v6;
  id v80 = v57;
  v82 = &v83;
  [v7 readUsingSession:v79];

  id v8 = (id)v84[5];
  if (self)
  {
    v69 = objc_opt_new();
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v96;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v96 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          v14 = sub_1002EC3C8(v13);
          uint64_t v15 = [v69 objectForKeyedSubscript:v14];

          if (!v15) {
            uint64_t v15 = objc_opt_new();
          }
          [v15 addObject:v13];
          v16 = sub_1002EC3C8(v13);
          [v69 setObject:v15 forKeyedSubscript:v16];
        }
        id v10 = [v9 countByEnumeratingWithState:&v95 objects:v103 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v69 = 0;
  }

  v61 = +[NSMutableArray array];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obunint64_t j = (id)v90[5];
  id v63 = [obj countByEnumeratingWithState:&v75 objects:v102 count:16];
  if (v63)
  {
    uint64_t v60 = *(void *)v76;
    do
    {
      v68 = 0;
      do
      {
        if (*(void *)v76 != v60) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v68);
        v70 = +[NSMutableDictionary dictionary];
        v100[0] = @"bundleID";
        v67 = sub_100297AC0(v17);
        v101[0] = v67;
        v100[1] = @"size";
        v66 = sub_100297EDC(v17);
        v101[1] = v66;
        v100[2] = @"lastUsedDate";
        uint64_t v18 = [v17 valueForProperty:@"last_used_date"];
        v65 = (void *)v18;
        CFStringRef v19 = @"-Unknown-";
        if (v18) {
          CFStringRef v19 = (const __CFString *)v18;
        }
        v101[2] = v19;
        v100[3] = @"isOnDevice";
        v64 = +[NSNumber numberWithBool:sub_100298654(v17)];
        v101[3] = v64;
        v100[4] = @"purgeable";
        v20 = +[NSNumber numberWithBool:sub_100297E4C(v17)];
        v101[4] = v20;
        v100[5] = @"isStreamable";
        v21 = sub_100297CE4(v17);
        v101[5] = v21;
        v100[6] = @"pinCount";
        v22 = +[NSNumber numberWithLongLong:sub_100297DCC(v17)];
        v101[6] = v22;
        v100[7] = @"chunkSize";
        v23 = sub_100297AF8(v17);
        v101[7] = v23;
        v100[8] = @"md5";
        v24 = sub_100297D94(v17);
        v101[8] = v24;
        v100[9] = @"downloadPriority";
        v25 = sub_100297B68(v17);
        v101[9] = v25;
        v100[10] = @"downloadIdentifier";
        v26 = sub_100297B30(v17);
        v101[10] = v26;
        v100[11] = @"humanReadablePurgeReason";
        v27 = sub_10020DC18(v17);
        v101[11] = v27;
        v28 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:12];
        [v70 addEntriesFromDictionary:v28];

        v29 = sub_100297D1C(v17);

        if (v29)
        {
          v30 = sub_100297D1C(v17);
          v31 = [v30 absoluteString];
          [v70 setObject:v31 forKeyedSubscript:@"localURL"];
        }
        sub_100297C74(v17);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (self)
        {
          uint64_t v34 = (uint64_t)[v32 count];
          id v35 = objc_alloc_init((Class)NSMutableString);
          v36 = v35;
          if (v34 < 1)
          {
            [v35 appendFormat:@"No hashes"];
          }
          else
          {
            for (unint64_t j = 0; j != v34; ++j)
            {
              uint64_t v38 = [v33 objectAtIndex:j];
              v39 = (void *)v38;
              if (j >= v34 - 1) {
                CFStringRef v40 = @"%@";
              }
              else {
                CFStringRef v40 = @"%@, ";
              }
              objc_msgSend(v36, "appendFormat:", v40, v38);
            }
          }
        }
        else
        {
          v36 = 0;
        }

        [v70 setObject:v36 forKeyedSubscript:@"Hashes"];
        id v41 = sub_100297BA0(v17);
        v42 = +[NSNumber numberWithBool:v41];
        [v70 setObject:v42 forKeyedSubscript:@"effectivelyAlwaysPreserve"];

        v43 = +[NSNumber numberWithDouble:sub_100297BE8(v17)];
        [v70 setObject:v43 forKeyedSubscript:@"effectivePreservationPriority"];

        if (v41)
        {
          v44 = objc_opt_new();
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          v45 = sub_100297AC0(v17);
          v46 = [v69 objectForKeyedSubscript:v45];

          id v47 = [v46 countByEnumeratingWithState:&v71 objects:v99 count:16];
          if (v47)
          {
            uint64_t v48 = *(void *)v72;
            do
            {
              for (k = 0; k != v47; k = (char *)k + 1)
              {
                if (*(void *)v72 != v48) {
                  objc_enumerationMutation(v46);
                }
                v50 = *(void **)(*((void *)&v71 + 1) + 8 * (void)k);
                if (sub_1002EC400(v50))
                {
                  v51 = sub_1002EC448(v50);
                  [v44 addObject:v51];
                }
              }
              id v47 = [v46 countByEnumeratingWithState:&v71 objects:v99 count:16];
            }
            while (v47);
          }

          [v70 setObject:v44 forKeyedSubscript:@"-PreservingTags-"];
        }
        v52 = sub_100297AC0(v17);
        v53 = [v69 objectForKeyedSubscript:v52];

        v54 = sub_1003923F8(v53, &stru_10052AED8);
        [v70 setObject:v54 forKeyedSubscript:@"tags"];
        [v61 addObject:v70];

        v68 = (char *)v68 + 1;
      }
      while (v68 != v63);
      id v55 = [obj countByEnumeratingWithState:&v75 objects:v102 count:16];
      id v63 = v55;
    }
    while (v55);
  }

  v58[2](v58, v61, 0);
  _Block_object_dispose(&v83, 8);

  _Block_object_dispose(&v89, 8);
}

- (void)expireAssetURLSForBundleIDs:(id)a3 withReply:(id)a4
{
  id v9 = (void (**)(id, void))a4;
  id v5 = a3;
  uint64_t v6 = sub_10024E080();
  int v7 = sub_10024E920((uint64_t)v6, v5);

  if (v7)
  {
    v9[2](v9, 0);
  }
  else
  {
    id v8 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:900 userInfo:0];
    ((void (**)(id, void *))v9)[2](v9, v8);
  }
}

- (void)fakeWorkWithCount:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(void))a4;
  int v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = [v5 intValue];
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Creating [%d] fake work items.", (uint8_t *)v8, 8u);
  }

  v6[2](v6);
}

- (void)statusWithReply:(id)a3
{
  uint64_t v13 = (void (**)(id, id, void))a3;
  v3 = sub_10024E080();
  v4 = sub_100250E30((uint64_t)v3);

  [(id)qword_1005B10D0 lock];
  if ([(id)qword_1005B10C8 count])
  {
    [v4 appendString:@"\n\nSamplers :\n"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(id)qword_1005B10C8 allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v10 = [(id)qword_1005B10C8 objectForKey:v9];
          uint64_t v11 = [v10 currentStatsString];
          [v4 appendFormat:@"\t%@ : %@", v9, v11];
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [v4 appendString:@"\n"];
  }
  [(id)qword_1005B10D0 unlock];
  id v12 = [v4 copy];
  v13[2](v13, v12, 0);
}

- (void)performMaintenanceWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v3 = sub_1001F5C30();
  sub_1001F5E50((uint64_t)v3);

  v4[2](v4, 0);
}

- (void)cancelMaintenanceWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v3 = sub_1001F5C30();
  sub_1001F5D40(v3);

  v4[2](v4, 0);
}

- (void)setLoggingEnabled:(BOOL)a3 reply:(id)a4
{
  NSErrorUserInfoKey v7 = NSDebugDescriptionErrorKey;
  CFStringRef v8 = @"No longer supported - logging is always on.";
  v4 = (void (**)(id, void, void *))a4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v6 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:108 userInfo:v5];
  v4[2](v4, 0, v6);
}

- (void)setSampler:(id)a3 enabled:(BOOL)a4 samplingInterval:(double)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v18 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a6;
  [(id)qword_1005B10D0 lock];
  if ([v18 isEqualToString:@"memory"])
  {
    id v10 = (void *)qword_1005B10C8;
    if (v8)
    {
      if (!qword_1005B10C8)
      {
        id v11 = objc_alloc_init((Class)NSMutableDictionary);
        id v12 = (void *)qword_1005B10C8;
        qword_1005B10C8 = (uint64_t)v11;

        id v10 = (void *)qword_1005B10C8;
      }
      uint64_t v13 = [v10 objectForKey:@"memory"];
      long long v14 = v13;
      if (v13)
      {
        sub_10034A450(v13);
        [(id)qword_1005B10C8 removeObjectForKey:@"memory"];
      }
      long long v15 = sub_10034A254([ODRMemorySampler alloc], a5);

      [(id)qword_1005B10C8 setObject:v15 forKey:@"memory"];
      sub_10034A2D8(v15);
      long long v16 = +[NSString stringWithFormat:@"Sampler '%@' enabled with %f sampling interval.", v18, *(void *)&a5];
      v9[2](v9, v16, 0);
    }
    else
    {
      long long v17 = [(id)qword_1005B10C8 objectForKey:@"memory"];
      long long v15 = v17;
      if (v17)
      {
        sub_10034A450(v17);
        long long v16 = +[NSString stringWithFormat:@"Sampler '%@' disabled.", v18];
        v9[2](v9, v16, 0);
      }
      else
      {
        long long v16 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:113 userInfo:0];
        ((void (**)(id, void *, void *))v9)[2](v9, @"Sampler not found", v16);
      }
    }
  }
  else
  {
    long long v15 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:112 userInfo:0];
    ((void (**)(id, void *, void *))v9)[2](v9, @"Unknown sampler", v15);
  }

  [(id)qword_1005B10D0 unlock];
}

- (void)loadSourceURL:(id)a3 intoDestinationURL:(id)a4 isUrgent:(BOOL)a5 isStreaming:(BOOL)a6 withRequestCompletion:(id)a7
{
  id v8 = a7;
  id v9 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:3000 userInfo:0];
  (*((void (**)(id, id))a7 + 2))(v8, v9);
}

- (void)cancelRequestWithUUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:3000 userInfo:0];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)pauseRequestWithUUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:3000 userInfo:0];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)resumeRequestWithUUID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:3000 userInfo:0];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)fetchManifestForAdamID:(id)a3 externalVersionID:(id)a4 variant:(id)a5 withFetchCompletion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = sub_1003B9478([ODRMutableApplication alloc], @"com.apple.AppStore");
  sub_1003BBC48((uint64_t)v13, v9);
  sub_1003BBDEC((uint64_t)v13, v10);
  sub_1003BBBA4((uint64_t)v13, v11);
  long long v14 = sub_10027D7D8([ODRManifestRequestTask alloc], v13);
  objc_initWeak(&location, v14);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10039E80C;
  v16[3] = &unk_1005229D0;
  objc_copyWeak(&v18, &location);
  id v15 = v12;
  id v17 = v15;
  [v14 setCompletionBlock:v16];
  sub_10026F10C((uint64_t)ODRTaskQueue, v14, -1);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)registerManifest:(id)a3 forBundleID:(id)a4 withRequestCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1003B9318((uint64_t)ODRApplication, v8);
  if (v10)
  {
    id v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = [v7 length];
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Diagnostics] Importing %{iec-bytes}lu manifest for %{public}@", buf, 0x16u);
    }

    id v12 = sub_10035FE84([ODRApplicationImportTask alloc], v10);
    long long v14 = sub_1002AEA04([ODRManifest alloc], (uint64_t)v7, v8, 0);
    if (v12) {
      objc_setProperty_atomic(v12, v13, v14, 48);
    }
    objc_initWeak((id *)buf, v12);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10039EB60;
    v15[3] = &unk_1005229D0;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v9;
    [v12 setCompletionBlock:v15];
    sub_10026F10C((uint64_t)ODRTaskQueue, v12, -1);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (void)purgeableAssetsWithReply:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100018378;
  id v12 = sub_100017D78;
  id v13 = 0;
  v4 = sub_1002393C4();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10039ED7C;
  v7[3] = &unk_100521960;
  v7[4] = &v8;
  [v4 readUsingSession:v7];

  id v5 = (void *)v9[5];
  if (v5)
  {
    id v6 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"\nAsset Packs : %lu asset packs are purgeable.\n\n", [v5 count]);
    v3[2](v3, v6, 0);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:900 userInfo:0];
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
  }

  _Block_object_dispose(&v8, 8);
}

- (void)nonPurgeableAssetsWithReply:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100018378;
  id v12 = sub_100017D78;
  id v13 = 0;
  v4 = sub_1002393C4();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10039EF64;
  v7[3] = &unk_100521960;
  v7[4] = &v8;
  [v4 readUsingSession:v7];

  id v5 = (void *)v9[5];
  if (v5)
  {
    id v6 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"\nAsset Packs : %lu asset packs are not purgeable.\n\n", [v5 count]);
    v3[2](v3, v6, 0);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:900 userInfo:0];
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
  }

  _Block_object_dispose(&v8, 8);
}

- (void)purgeBytes:(int64_t)a3 odrOnly:(BOOL)a4 urgency:(int)a5 withReply:(id)a6
{
  BOOL v7 = a4;
  id v11 = (void (**)(id, id *, void))a6;
  sub_10024E080();
  id v9 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = sub_10024E5D4(v9, a3, v7, a5);

  v11[2](v11, v10, 0);
}

- (void)testPurgeBytes:(int64_t)a3 urgency:(int)a4 withReply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v12 = 0;
  BOOL v7 = (void (**)(id, id, void))a5;
  uint64_t v8 = sub_10024E080();
  id v9 = sub_1002501D0(v8, v5, a3, &v12);

  id v10 = objc_alloc_init((Class)NSMutableString);
  id v11 = [v9 count];
  objc_msgSend(v10, "appendFormat:", @"\nAsset Packs Purge Test : %lu asset packs to purge for urgency %d (requested bytes : %lld; actual bytes : %lld).\n\n",
    v11,
    v5,
    a3,
    v12);
  v7[2](v7, v10, 0);
}

- (void)purgeAllAssetsForApplication:(id)a3 withRequestCompletion:(id)a4
{
  id v7 = a3;
  uint64_t v5 = (void (**)(id, void))a4;
  id v6 = sub_10024E080();
  sub_1002508B8((uint64_t)v6, v7, 2);

  v5[2](v5, 0);
}

- (void)purgeAllAssetsForApplications:(id)a3 withRequestCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        uint64_t v12 = sub_10024E080();
        sub_1002508B8((uint64_t)v12, v11, 2);

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  v6[2](v6, 0);
}

- (void)purgeAssetWithIdentifier:(id)a3 withRequestCompletion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void))a4;
  id v6 = sub_10024E080();
  sub_100250AFC((uint64_t)v6, v7, 2);

  v5[2](v5, 0);
}

- (void)getSimulatedBandwidthWithReply:(id)a3
{
  id v5 = a3;
  id v4 = sub_1002E0568();
  (*((void (**)(id, id, void))a3 + 2))(v5, v4, 0);
}

- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, id, void))a4;
  sub_1002E04E4((uint64_t)ODRSimulatedDownloadsManager, a3);
  id v5 = sub_1002E0568();
  v6[2](v6, v5, 0);
}

- (void)getSpaceReductionWithReply:(id)a3
{
  uint64_t v3 = qword_1005B10C0;
  id v4 = a3;
  if (v3) {
    uint64_t v5 = *(void *)(v3 + 8);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v4;
  (*((void (**)(id, uint64_t, void))v4 + 2))(v4, v5, 0);
}

- (void)setSpaceReduction:(unint64_t)a3 withReply:(id)a4
{
  id v7 = (void (**)(id, unint64_t, void))a4;
  if (a3) {
    uint64_t v5 = sub_1003167F0([ODRSpaceReduction alloc], a3);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (void *)qword_1005B10C0;
  qword_1005B10C0 = (uint64_t)v5;

  v7[2](v7, a3, 0);
}

- (void)prefetchAndRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5
{
}

- (void)prefetchSourceURL:(id)a3 intoDestinationURL:(id)a4 withPrefetchCompletion:(id)a5
{
}

- (void)prefetchThenRequestSourceURL:(id)a3 intoDestinationURL:(id)a4 withCompletion:(id)a5
{
}

@end