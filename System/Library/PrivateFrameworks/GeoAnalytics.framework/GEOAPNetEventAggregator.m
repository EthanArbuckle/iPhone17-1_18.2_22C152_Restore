@interface GEOAPNetEventAggregator
+ (id)sharedAggregator;
- (void)_computeDistributionStatsOver:(id)a3 statsResultsBlock:(id)a4;
- (void)runAggregation;
- (void)runAggregationForDate:(id)a3;
@end

@implementation GEOAPNetEventAggregator

+ (id)sharedAggregator
{
  if (qword_100033D90 != -1) {
    dispatch_once(&qword_100033D90, &stru_100028750);
  }
  v2 = (void *)qword_100033D88;
  return v2;
}

- (void)_computeDistributionStatsOver:(id)a3 statsResultsBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, double, double, double, double, double, double, double, double, double))a4;
  if ([v5 count])
  {
    v7 = [v5 sortedArrayUsingComparator:&stru_100028790];
    id v8 = [v7 count];
    v9 = [v7 firstObject];
    [v9 doubleValue];
    double v39 = v10;

    v11 = [v7 lastObject];
    [v11 doubleValue];
    double v38 = v12;

    v13 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.1)];
    [v13 doubleValue];
    double v15 = v14;

    v16 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.25)];
    [v16 doubleValue];
    double v18 = v17;

    v19 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.5)];
    [v19 doubleValue];
    double v21 = v20;

    v22 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.75)];
    [v22 doubleValue];
    double v24 = v23;

    v25 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.9)];
    [v25 doubleValue];
    double v27 = v26;

    v28 = [v7 objectAtIndexedSubscript:(unint64_t)((double)(unint64_t)v8 * 0.99)];
    [v28 doubleValue];
    double v30 = v29;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v31 = v5;
    id v32 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v41;
      double v35 = 0.0;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v41 != v34) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) doubleValue];
          double v35 = v35 + v37;
        }
        id v33 = [v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v33);
    }
    else
    {
      double v35 = 0.0;
    }

    v6[2](v6, v8, v35 / (double)(unint64_t)v8, v39, v38, v15, v18, v21, v24, v27, v30);
  }
  else
  {
    v6[2](v6, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
  }
}

- (void)runAggregationForDate:(id)a3
{
  id v4 = a3;
  id v5 = sub_100006F34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v71 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "run aggregation for date '%@'", buf, 0xCu);
  }

  v6 = +[GEOAnalyticsDataService sharedService];
  id v7 = [v6 networkEventFileDescriptorForRepresentativeDate:v4];

  if ((v7 & 0x80000000) != 0)
  {
    id v8 = sub_100006F34();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "no data to aggregate", buf, 2u);
    }
  }
  else
  {
    id v8 = [objc_alloc((Class)GEONetworkEventFile) initForReadWithFileDescriptor:v7];
    if (v8)
    {
      id v44 = v4;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100006F88;
      v66[3] = &unk_1000287B8;
      id v9 = objc_alloc_init((Class)NSMutableDictionary);
      id v67 = v9;
      long long v43 = v8;
      [v8 unsafe_readNetworkEventDataWithVisitorBlock:v66];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      double v10 = v9;
      id v47 = [v10 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v47)
      {
        uint64_t v45 = *(void *)v63;
        v46 = v10;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v63 != v45) {
              objc_enumerationMutation(v10);
            }
            uint64_t v48 = v11;
            double v12 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v62 + 1) + 8 * v11)];
            id v50 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v13 = v12;
            id v51 = [v13 countByEnumeratingWithState:&v58 objects:v68 count:16];
            if (v51)
            {
              uint64_t v49 = *(void *)v59;
              do
              {
                for (i = 0; i != v51; i = (char *)i + 1)
                {
                  if (*(void *)v59 != v49) {
                    objc_enumerationMutation(v13);
                  }
                  double v15 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * i)];
                  id v16 = objc_alloc_init((Class)GEONetEventDimensionalGrouping);
                  double v17 = [v15 objectForKeyedSubscript:@"y"];
                  objc_msgSend(v16, "setYear:", objc_msgSend(v17, "intValue"));

                  double v18 = [v15 objectForKeyedSubscript:@"m"];
                  objc_msgSend(v16, "setMonth:", objc_msgSend(v18, "intValue"));

                  v19 = [v15 objectForKeyedSubscript:@"d"];
                  objc_msgSend(v16, "setDay:", objc_msgSend(v19, "intValue"));

                  double v20 = [v15 objectForKeyedSubscript:@"c"];
                  objc_msgSend(v16, "setUsedCellular:", objc_msgSend(v20, "BOOLValue"));

                  double v21 = [v15 objectForKeyedSubscript:@"n"];
                  objc_msgSend(v16, "setNetworkService:", objc_msgSend(v21, "intValue"));

                  v22 = [v15 objectForKeyedSubscript:@"raid"];
                  [v16 setRequestingAppId:v22];

                  double v23 = [v15 objectForKeyedSubscript:@"aid"];
                  [v16 setAppId:v23];

                  double v24 = [v15 objectForKeyedSubscript:@"ip"];
                  [v16 setSvcIp:v24];

                  v25 = [v15 objectForKeyedSubscript:@"ed"];
                  [v16 setErrorDomain:v25];

                  double v26 = [v15 objectForKeyedSubscript:@"me"];
                  [v16 setManifestEnv:v26];

                  double v27 = [v15 objectForKeyedSubscript:@"cc"];
                  [v16 setCountryCode:v27];

                  v28 = [v15 objectForKeyedSubscript:@"cr"];
                  objc_msgSend(v16, "setReusedConnection:", objc_msgSend(v28, "BOOLValue"));

                  double v29 = [v15 objectForKeyedSubscript:@"ubu"];
                  objc_msgSend(v16, "setIsBackground:", objc_msgSend(v29, "BOOLValue"));

                  double v30 = [v15 objectForKeyedSubscript:@"p"];
                  id v31 = v30;
                  if (v30) {
                    objc_msgSend(v16, "setPlaceType:", objc_msgSend(v30, "intValue"));
                  }
                  id v32 = [v15 objectForKeyedSubscript:@"ec"];

                  if (v32) {
                    objc_msgSend(v16, "setErrorCode:", (int)objc_msgSend(v32, "intValue"));
                  }
                  id v33 = [v15 objectForKeyedSubscript:@"tsi"];

                  if (v33) {
                    objc_msgSend(v16, "setTileSetId:", objc_msgSend(v33, "intValue"));
                  }
                  uint64_t v34 = [v15 objectForKeyedSubscript:@"tss"];

                  if (v34) {
                    objc_msgSend(v16, "setTileSetStyle:", objc_msgSend(v34, "intValue"));
                  }
                  double v35 = [v15 objectForKeyedSubscript:@"hc"];

                  if (v35) {
                    objc_msgSend(v16, "setHttpResponseCode:", objc_msgSend(v35, "intValue"));
                  }
                  v36 = [v15 objectForKeyedSubscript:@"dsid"];

                  if (v36) {
                    objc_msgSend(v16, "setDataSetId:", objc_msgSend(v36, "unsignedIntValue"));
                  }
                  double v37 = [v15 objectForKeyedSubscript:@"L"];
                  objc_msgSend(v16, "setEventCount:", objc_msgSend(v37, "count"));
                  v56[0] = _NSConcreteStackBlock;
                  v56[1] = 3221225472;
                  v56[2] = sub_100007C08;
                  v56[3] = &unk_1000287E0;
                  id v38 = v16;
                  id v57 = v38;
                  [(GEOAPNetEventAggregator *)self _computeDistributionStatsOver:v37 statsResultsBlock:v56];
                  double v39 = [v15 objectForKeyedSubscript:@"tx"];
                  v54[0] = _NSConcreteStackBlock;
                  v54[1] = 3221225472;
                  v54[2] = sub_100007DD0;
                  v54[3] = &unk_1000287E0;
                  id v40 = v38;
                  id v55 = v40;
                  [(GEOAPNetEventAggregator *)self _computeDistributionStatsOver:v39 statsResultsBlock:v54];
                  long long v41 = [v15 objectForKeyedSubscript:@"rx"];
                  v52[0] = _NSConcreteStackBlock;
                  v52[1] = 3221225472;
                  v52[2] = sub_100007F98;
                  v52[3] = &unk_1000287E0;
                  id v53 = v40;
                  id v42 = v40;
                  [(GEOAPNetEventAggregator *)self _computeDistributionStatsOver:v41 statsResultsBlock:v52];
                  [v50 addObject:v42];
                }
                id v51 = [v13 countByEnumeratingWithState:&v58 objects:v68 count:16];
              }
              while (v51);
            }

            +[GEOAPPortal captureNetEventSummaryWithGroups:v50 additionalStates:0 providedDropRate:0 completionQueue:0 completionBlock:0];
            uint64_t v11 = v48 + 1;
            double v10 = v46;
          }
          while ((id)(v48 + 1) != v47);
          id v47 = [v46 countByEnumeratingWithState:&v62 objects:v69 count:16];
        }
        while (v47);
      }

      id v8 = v43;
      id v4 = v44;
    }
    else
    {
      double v10 = sub_100006F34();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "unable to initialize data", buf, 2u);
      }
    }
  }
}

- (void)runAggregation
{
  v3 = sub_100006F34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "starting aggregation", buf, 2u);
  }

  id v4 = +[GEOReferenceTimeManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008278;
  v6[3] = &unk_100028808;
  v6[4] = self;
  [v4 referenceTimeResult:v6];

  id v5 = sub_100006F34();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "finished aggregation", buf, 2u);
  }
}

@end