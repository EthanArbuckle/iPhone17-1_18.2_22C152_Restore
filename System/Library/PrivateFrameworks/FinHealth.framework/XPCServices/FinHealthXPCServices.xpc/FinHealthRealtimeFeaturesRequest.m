@interface FinHealthRealtimeFeaturesRequest
- (FinHealthRealtimeFeaturesRequest)init;
- (NSArray)pastTimeRangesToRetagEvents;
- (id)_getLocalSearchResponse:(id)a3 transactionLocation:(id)a4;
- (id)_getPointsOfInterestFromMapKit:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6;
- (id)getEvents;
- (id)queryPPEvents:(id)a3 fromDate:(id)a4 toDate:(id)a5;
- (id)realtimeFeaturesForTransaction:(id)a3;
- (id)textSimilarityFeatures;
- (id)tripEventTitleNomalization:(id)a3;
- (void)evaluateEventTagging:(id)a3 bypassMapService:(BOOL)a4 completion:(id)a5;
- (void)setPastTimeRangesToRetagEvents:(id)a3;
@end

@implementation FinHealthRealtimeFeaturesRequest

- (FinHealthRealtimeFeaturesRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)FinHealthRealtimeFeaturesRequest;
  v2 = [(FinHealthRealtimeFeaturesRequest *)&v9 init];
  if (v2)
  {
    v3 = +[NSString stringWithFormat:@"%lu", ::secondsInDay];
    uint64_t v4 = +[NSDecimalNumber decimalNumberWithString:v3];
    secondsInDay = v2->_secondsInDay;
    v2->_secondsInDay = (NSDecimalNumber *)v4;

    v6 = (NSArray *)objc_alloc_init((Class)NSArray);
    pastTimeRangesToRetagEvents = v2->_pastTimeRangesToRetagEvents;
    v2->_pastTimeRangesToRetagEvents = v6;
  }
  return v2;
}

- (void)evaluateEventTagging:(id)a3 bypassMapService:(BOOL)a4 completion:(id)a5
{
  id v33 = a3;
  id v7 = a5;
  v37 = objc_opt_new();
  v32 = (void (**)(void, void))v7;
  if (!v7 || a4)
  {
    if (v7)
    {
      v26 = +[NSDictionary dictionaryWithDictionary:v37];
      (*((void (**)(id, void *))v7 + 2))(v7, v26);
    }
  }
  else
  {
    v8 = [(FinHealthRealtimeFeaturesRequest *)self getEvents];
    objc_super v9 = [v33 firstObject];
    v31 = [v9 transactionDate];

    v10 = [v33 lastObject];
    v30 = [v10 transactionDate];

    v29 = +[NSPredicate predicateWithFormat:@"NOT (SELF.%K < %@)", @"endDate", v30];
    v28 = +[NSPredicate predicateWithFormat:@"NOT (SELF.%K > %@)", @"startDate", v31];
    v59[0] = v29;
    v59[1] = v28;
    v11 = +[NSArray arrayWithObjects:v59 count:2];
    v27 = +[NSCompoundPredicate andPredicateWithSubpredicates:v11];

    v39 = [v8 filteredArrayUsingPredicate:v27];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v33;
    id v12 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v12)
    {
      uint64_t v38 = *(void *)v55;
      uint64_t v36 = FHSmartFeatureCompoundTypeEventTagging;
      uint64_t v35 = FHSmartFeatureCompoundTypeTripEvents;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v55 != v38) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v48 = 0;
          v49 = &v48;
          uint64_t v50 = 0x3032000000;
          v51 = sub_100014964;
          v52 = sub_100014974;
          id v53 = (id)objc_opt_new();
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x3032000000;
          v45 = sub_100014964;
          v46 = sub_100014974;
          id v47 = (id)objc_opt_new();
          v16 = [v14 transactionDate];
          v17 = [v14 transactionDate];
          v18 = +[NSPredicate predicateWithFormat:@"(SELF.%K <= %@) AND (%@ <= SELF.%K)", @"startDate", v16, v17, @"endDate"];

          v19 = [v39 filteredArrayUsingPredicate:v18];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10001497C;
          v41[3] = &unk_100031A48;
          v41[4] = self;
          v41[5] = &v42;
          v41[6] = &v48;
          [v19 enumerateObjectsUsingBlock:v41];

          v20 = objc_opt_new();
          if ([(id)v49[5] count])
          {
            v21 = +[NSArray arrayWithArray:v49[5]];
            [v20 setObject:v21 forKey:v36];
          }
          if ([(id)v43[5] count])
          {
            v22 = +[NSArray arrayWithArray:v43[5]];
            [v20 setObject:v22 forKey:v35];
          }
          if ([v20 count])
          {
            v23 = +[NSDictionary dictionaryWithDictionary:v20];
            v24 = [v14 identifier];
            [v37 setObject:v23 forKey:v24];
          }
          _Block_object_dispose(&v42, 8);

          _Block_object_dispose(&v48, 8);
        }
        id v12 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v12);
    }

    v25 = +[NSDictionary dictionaryWithDictionary:v37];
    ((void (**)(void, void *))v32)[2](v32, v25);
  }
}

- (id)tripEventTitleNomalization:(id)a3
{
  id v3 = a3;
  id v4 = [v3 title];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [v3 tripParts];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v11 tripMode] == (id)2)
        {
          id v12 = [v11 mainLocation];
          uint64_t v13 = [v12 locality];

          id v8 = (id)v13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);

    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v14 = +[NSRegularExpression regularExpressionWithPattern:@"Trip to (.*?)(,.*?)? \\- (.*?) to (.*?)$" options:0 error:0];
  v15 = objc_msgSend(v14, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v16 = v15;
  if (v15)
  {
    id v17 = [v15 rangeAtIndex:1];
    v19 = objc_msgSend(v4, "substringWithRange:", v17, v18);
    v20 = +[NSCharacterSet whitespaceCharacterSet];
    v21 = [v19 stringByTrimmingCharactersInSet:v20];
    id v22 = [v21 length];

    if (v22) {
      id v8 = v19;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  if (v8)
  {
LABEL_20:
    id v23 = objc_alloc_init((Class)NSDateIntervalFormatter);
    [v23 setDateTemplate:tripEventsDateTemplate];
    [v23 setBoundaryStyle:2];
    v24 = [v3 startDate];
    v25 = [v3 endDate];
    v26 = [v23 stringFromDate:v24 toDate:v25];
    v27 = +[NSString stringWithFormat:@"%@ %@", v8, v26];

    id v4 = v27;
    id v8 = v4;
  }

  return v8;
}

- (id)realtimeFeaturesForTransaction:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  id v6 = [v4 timeZone];
  [v5 setTimeZone:v6];

  id v7 = [v4 transactionDate];
  id v8 = [v5 components:636 fromDate:v7];

  unint64_t v9 = (unint64_t)[v8 hour];
  [v8 setHour:0];
  [v8 setMinute:0];
  [v8 setSecond:0];
  id v10 = objc_alloc_init((Class)FHRealtimeFeaturesResponse);
  v11 = [v5 dateFromComponents:v8];
  [v11 timeIntervalSinceReferenceDate];
  [v10 setTransactionDateAtZerothHour:(unint64_t)v12];

  uint64_t v13 = [v4 timeZone];
  if (v13
    && (v14 = (void *)v13,
        [v4 timeZone],
        v15 = objc_claimAutoreleasedReturnValue(),
        id v16 = [v15 secondsFromGMT],
        v15,
        v14,
        v16))
  {
    uint64_t v17 = 2;
    uint64_t v18 = 3;
    uint64_t v19 = 4;
    if ((v9 & 0xFFFFFFFFFFFFFFFCLL) != 0x10) {
      uint64_t v19 = 5;
    }
    if ((v9 & 0xFFFFFFFFFFFFFFFCLL) != 0xC) {
      uint64_t v18 = v19;
    }
    if (v9 - 6 >= 6) {
      uint64_t v17 = v18;
    }
    char v43 = 0;
    if (v9 >= 6) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = 1;
    }
  }
  else
  {
    uint64_t v20 = 0;
    char v43 = 1;
  }
  [v10 setTimeOfDay:v20];
  v21 = [v4 country];
  if (v21)
  {
    id v22 = [v4 country];
    objc_msgSend(v10, "setIsInternationalSpend:", objc_msgSend(v22, "isEqualToString:", @"USA") ^ 1);
  }
  else
  {
    [v10 setIsInternationalSpend:0];
  }

  objc_msgSend(v10, "setIsTapToPay:", objc_msgSend(v4, "transactionSource") == (id)1);
  objc_msgSend(v10, "setMerchantCategory:", objc_msgSend(v4, "category"));
  id v23 = [v4 country];
  [v10 setCountry:v23];

  v24 = [v4 displayName];
  [v10 setMerchantDisplayName:v24];

  objc_msgSend(v10, "setMapsMerchantID:", objc_msgSend(v4, "mapsMerchantID"));
  objc_msgSend(v10, "setMapsMerchantBrandID:", objc_msgSend(v4, "mapsMerchantBrandID"));
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = sub_100014964;
  v51 = sub_100014974;
  id v52 = (id)objc_opt_new();
  v25 = objc_alloc_init(FinHealthLostSavingsTag);
  v26 = [v4 displayName];
  uint64_t v27 = [(FinHealthLostSavingsTag *)v25 cashbackPercentForMerchant:v26];

  if (v27 >= 1)
  {
    v41 = self;
    unint64_t v42 = v9;
    v28 = v5;
    long long v29 = [v4 amount];
    long long v30 = +[NSString stringWithFormat:@"%@", v29];
    long long v31 = +[NSDecimalNumber decimalNumberWithString:v30];

    id v32 = [v4 transactionSource];
    id v33 = [v4 displayName];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100015584;
    v46[3] = &unk_100031A70;
    v46[4] = &v47;
    [(FinHealthLostSavingsTag *)v25 lostSavingsTagComputationForTransaction:v31 transactionSource:v32 cashbackPercent:v27 merchantName:v33 completion:v46];

    v5 = v28;
    self = v41;
    unint64_t v9 = v42;
  }
  v34 = [(FinHealthRealtimeFeaturesRequest *)self textSimilarityFeatures];
  uint64_t v35 = [v4 displayName];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10001560C;
  v45[3] = &unk_100031A70;
  v45[4] = &v47;
  [v34 neighborsForText:v35 completion:v45];

  uint64_t v36 = [v4 displayName];
  v37 = [v4 merchantDetailedCategory];
  if (v43)
  {
    uint64_t v38 = 0;
  }
  else
  {
    uint64_t v38 = +[NSNumber numberWithInteger:v9];
  }
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100015694;
  v44[3] = &unk_100031A70;
  v44[4] = &v47;
  [v34 semanticTagsForMerchant:v36 detailedCategory:v37 dateHour:v38 completion:v44];
  if ((v43 & 1) == 0) {

  }
  if ([(id)v48[5] count])
  {
    v39 = +[NSDictionary dictionaryWithDictionary:v48[5]];
    [v10 setSmartCompoundFeatures:v39];
  }
  [v10 setRepeatingPatternClass:2];

  _Block_object_dispose(&v47, 8);
  return v10;
}

- (id)_getLocalSearchResponse:(id)a3 transactionLocation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100014964;
  id v33 = sub_100014974;
  id v34 = (id)objc_opt_new();
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100014964;
  uint64_t v27 = sub_100014974;
  id v28 = (id)objc_opt_new();
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100015924;
  v20[3] = &unk_100031A98;
  id v22 = &v23;
  id v8 = v7;
  v21 = v8;
  [v5 startWithCompletionHandler:v20];
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v9 = (void *)v24[5];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100015AB8;
  uint64_t v17 = &unk_100031AE8;
  id v10 = v6;
  id v18 = v10;
  uint64_t v19 = &v29;
  [v9 enumerateObjectsUsingBlock:&v14];
  v11 = objc_msgSend((id)v30[5], "allValues", v14, v15, v16, v17);
  double v12 = +[NSArray arrayWithArray:v11];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

- (id)_getPointsOfInterestFromMapKit:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6
{
  id v6 = 0;
  if (a3 != 0.0 && a4 != 0.0)
  {
    id v10 = objc_opt_new();
    id v11 = [objc_alloc((Class)CLLocation) initWithLatitude:a3 longitude:a4];
    CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(a3, a4);
    id v13 = objc_alloc_init((Class)MKLocalSearchRequest);
    v14 = +[NSString stringWithFormat:@"%f, %f", *(void *)&a3, *(void *)&a4];
    [v13 setNaturalLanguageQuery:v14];

    MKCoordinateRegion v51 = MKCoordinateRegionMakeWithDistance(v12, 1000.0, 1000.0);
    objc_msgSend(v13, "setRegion:", v51.center.latitude, v51.center.longitude, v51.span.latitudeDelta, v51.span.longitudeDelta);
    v41 = v13;
    id v15 = [objc_alloc((Class)MKLocalSearch) initWithRequest:v13];
    id v39 = objc_msgSend(objc_alloc((Class)MKLocalPointsOfInterestRequest), "initWithCenterCoordinate:radius:", v12.latitude, v12.longitude, 1000.0);
    id v16 = [objc_alloc((Class)MKLocalSearch) initWithPointsOfInterestRequest:v39];
    uint64_t v17 = FinHealthLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = "-[FinHealthRealtimeFeaturesRequest _getPointsOfInterestFromMapKit:longitude:horizontalAccuracy:verticalAccuracy:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "FHSmartCompoundFeatureRankedValue local + poi search start %s", buf, 0xCu);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v40 = v15;
    id v18 = [(FinHealthRealtimeFeaturesRequest *)self _getLocalSearchResponse:v15 transactionLocation:v11];
    uint64_t v38 = v16;
    unint64_t v42 = v11;
    uint64_t v19 = [(FinHealthRealtimeFeaturesRequest *)self _getLocalSearchResponse:v16 transactionLocation:v11];
    uint64_t v20 = [v18 arrayByAddingObjectsFromArray:v19];

    id v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v26 = [v25 featureLabel];
          uint64_t v27 = [v10 objectForKey:v26];

          if (v27)
          {
            id v28 = [v25 featureRank];
            uint64_t v29 = [v27 featureRank];
            id v30 = [v28 compare:v29];

            uint64_t v31 = [v27 featureRank];
            if (v30 == (id)-1)
            {
              uint64_t v32 = [v25 featureRank];

              id v33 = [v25 featureLabel];
              [v10 setValue:v25 forKey:v33];

              uint64_t v31 = (void *)v32;
            }
          }
          else
          {
            uint64_t v31 = [v25 featureLabel];
            [v10 setValue:v25 forKey:v31];
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v22);
    }

    id v34 = FinHealthLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v49 = "-[FinHealthRealtimeFeaturesRequest _getPointsOfInterestFromMapKit:longitude:horizontalAccuracy:verticalAccuracy:]";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "FHSmartCompoundFeatureRankedValue local + poi search end %s", buf, 0xCu);
    }

    id v35 = objc_alloc((Class)NSDictionary);
    uint64_t v36 = [v10 allValues];
    id v6 = objc_msgSend(v35, "initWithObjectsAndKeys:", v36, FHSmartFeatureCompoundTypePointsOfInterest, 0);
  }
  return v6;
}

- (id)textSimilarityFeatures
{
  textSimilarityFeatures = self->_textSimilarityFeatures;
  if (!textSimilarityFeatures)
  {
    id v4 = objc_alloc_init(FinHealthTextSimilarityFeatures);
    id v5 = self->_textSimilarityFeatures;
    self->_textSimilarityFeatures = v4;

    textSimilarityFeatures = self->_textSimilarityFeatures;
  }
  return textSimilarityFeatures;
}

- (id)getEvents
{
  events = self->_events;
  if (!events)
  {
    id v4 = objc_alloc_init((Class)PPEventStore);
    id v5 = objc_opt_new();
    id v6 = +[NSDate now];
    double v7 = secondsInOneYear;
    id v8 = [v6 dateByAddingTimeInterval:-secondsInOneYear];

    uint64_t v9 = numOfPassesToQueryEvents;
    if (numOfPassesToQueryEvents)
    {
      uint64_t v10 = 0;
      double v11 = v7 / (double)numOfPassesToQueryEvents;
      do
      {
        CLLocationCoordinate2D v12 = [v8 dateByAddingTimeInterval:v11 * (double)(int)v10];
        id v13 = [v8 dateByAddingTimeInterval:v11 * (double)(int)++v10];
        v14 = [(FinHealthRealtimeFeaturesRequest *)self queryPPEvents:v4 fromDate:v12 toDate:v13];
        [v5 addObjectsFromArray:v14];
      }
      while (v9 != v10);
    }
    uint64_t v31 = v8;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = self->_pastTimeRangesToRetagEvents;
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v21 = [v20 firstObject];
          id v22 = [v20 lastObject];
          uint64_t v23 = [(FinHealthRealtimeFeaturesRequest *)self queryPPEvents:v4 fromDate:v21 toDate:v22];
          [v5 addObjectsFromArray:v23];
        }
        id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v17);
    }

    v24 = FinHealthLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      pastTimeRangesToRetagEvents = self->_pastTimeRangesToRetagEvents;
      id v26 = [v5 count];
      *(_DWORD *)buf = 138412802;
      v37 = pastTimeRangesToRetagEvents;
      __int16 v38 = 2048;
      id v39 = v26;
      __int16 v40 = 2112;
      v41 = v5;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Past time ranges to query:%@ Total events count: %lu Total fetched events %@", buf, 0x20u);
    }

    uint64_t v27 = +[NSSet setWithArray:v5];
    id v28 = [v27 allObjects];
    uint64_t v29 = self->_events;
    self->_events = v28;

    events = self->_events;
  }
  return events;
}

- (id)queryPPEvents:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  double v11 = objc_opt_new();
  [v11 setFromDate:v8];
  [v11 setToDate:v9];
  id v30 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001683C;
  v28[3] = &unk_100031B10;
  id v12 = (id)v10;
  id v29 = v12;
  LOBYTE(v10) = [v7 iterScoredEventsWithQuery:v11 error:&v30 block:v28];
  id v13 = v30;
  if ((v10 & 1) == 0)
  {
    v14 = FinHealthLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Trip event error:%@", buf, 0xCu);
    }
  }
  id v15 = objc_opt_new();
  [v15 setFromDate:v8];
  [v15 setToDate:v9];

  id v27 = 0;
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_1000168B4;
  uint64_t v25 = &unk_100031B10;
  id v16 = v12;
  id v26 = v16;
  unsigned __int8 v17 = [v7 iterScoredEventsWithQuery:v15 error:&v27 block:&v22];
  id v18 = v27;
  if ((v17 & 1) == 0)
  {
    uint64_t v19 = FinHealthLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Suggested event error:%@", buf, 0xCu);
    }
  }
  uint64_t v20 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v16, v22, v23, v24, v25);

  return v20;
}

- (NSArray)pastTimeRangesToRetagEvents
{
  return self->_pastTimeRangesToRetagEvents;
}

- (void)setPastTimeRangesToRetagEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pastTimeRangesToRetagEvents, 0);
  objc_storeStrong((id *)&self->_textSimilarityFeatures, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_secondsInDay, 0);
}

@end