uint64_t sub_10000275C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003198(uint64_t a1, void *a2, void *a3)
{
  id v49 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v47 = v5;
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v6 = 0;
      uint64_t v48 = a1;
      do
      {
        uint64_t v51 = v6;
        v7 = [*(id *)(a1 + 32) objectAtIndex:v6];
        v8 = [v49 mapItemsForSpatialLookupParameters:v7];
        id v9 = objc_alloc((Class)CLLocation);
        [v7 coordinate];
        double v11 = v10;
        [v7 coordinate];
        id v56 = objc_msgSend(v9, "initWithLatitude:longitude:", v11);
        [v7 coordinate];
        uint64_t v13 = v12;
        v50 = v7;
        [v7 coordinate];
        v55 = +[NSString stringWithFormat:@"[%.03f,%.03f]", v13, v14];
        ++WeakRetained[7];
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id obj = v8;
        id v57 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v57)
        {
          uint64_t v53 = *(void *)v69;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v69 != v53) {
                objc_enumerationMutation(obj);
              }
              uint64_t v59 = v16;
              v17 = *(void **)(*((void *)&v68 + 1) + 8 * v16);
              id v18 = objc_alloc((Class)CLLocation);
              [v17 centerCoordinate];
              double v20 = v19;
              [v17 centerCoordinate];
              id v58 = objc_msgSend(v18, "initWithLatitude:longitude:", v20);
              [v58 distanceFromLocation:v56];
              id v22 = [objc_alloc((Class)NSDecimalNumber) initWithDouble:v21];
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              v23 = [v17 areasOfInterest];
              id v24 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v65;
                do
                {
                  for (i = 0; i != v25; i = (char *)i + 1)
                  {
                    if (*(void *)v65 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    uint64_t v28 = *(void *)(*((void *)&v64 + 1) + 8 * i);
                    v29 = [v15 objectForKey:v28];
                    v30 = v29;
                    if (v29 && [v29 compare:v22] == (id)-1)
                    {
                      v31 = v15;
                      id v32 = v30;
                    }
                    else
                    {
                      v31 = v15;
                      id v32 = v22;
                    }
                    [v31 setObject:v32 forKey:v28];
                  }
                  id v25 = [v23 countByEnumeratingWithState:&v64 objects:v75 count:16];
                }
                while (v25);
              }

              id v33 = objc_alloc_init((Class)NSMutableArray);
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              id v34 = v15;
              id v35 = [v34 countByEnumeratingWithState:&v60 objects:v74 count:16];
              if (v35)
              {
                id v36 = v35;
                uint64_t v37 = *(void *)v61;
                do
                {
                  for (j = 0; j != v36; j = (char *)j + 1)
                  {
                    if (*(void *)v61 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    uint64_t v39 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
                    id v40 = objc_alloc((Class)FHSmartCompoundFeatureRankedValue);
                    v41 = [v34 objectForKey:v39];
                    id v42 = [v40 initWithLabelAndRank:v39 featureRank:v41];

                    [v33 addObject:v42];
                  }
                  id v36 = [v34 countByEnumeratingWithState:&v60 objects:v74 count:16];
                }
                while (v36);
              }

              v43 = (void *)WeakRetained[5];
              id v44 = [v33 copy];
              [v43 setObject:v44 forKey:v55];

              uint64_t v16 = v59 + 1;
            }
            while ((id)(v59 + 1) != v57);
            id v57 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
          }
          while (v57);
        }

        uint64_t v6 = v51 + 1;
        a1 = v48;
      }
      while (v51 + 1 < (unint64_t)[*(id *)(v48 + 32) count]);
    }
    id v5 = v47;
    if (v47)
    {
      v45 = FinHealthLogObject();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        v46 = [v47 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v73 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "error: %@", buf, 0xCu);
      }
      WeakRetained[9] = 1;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_100003CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003D00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003D10(uint64_t a1)
{
}

void sub_100003D18(uint64_t a1)
{
  TransactionFromPKPaymentTransaction();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 32) _insertOrUpdateTransactionPostDirtyState:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100004C0C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = a2;
  [v7 addStringValueForField:@"features_detailed_category.detailed_category" fieldValue:v3];
  v4 = *(void **)(a1 + 40);
  id v5 = +[NSDecimalNumber defaultDatabaseAmountMultiplier];
  uint64_t v6 = [v4 decimalNumberByMultiplyingBy:v5];
  [v7 addDecimalNumberValueForField:@"features_detailed_category.amount" fieldValue:v6];

  [v7 addIntegerValueForField:@"features_detailed_category.transaction_count" fieldValue:*(void *)(a1 + 72)];
  [v7 addStringValueForField:@"features_detailed_category.country_code" fieldValue:*(void *)(a1 + 48)];
  [v7 addDoubleValueForField:@"features_detailed_category.recurring_transaction_ratio" fieldValue:*(double *)(a1 + 80)];
  [v7 addIntegerValueForField:@"features_detailed_category.time_of_day" fieldValue:*(void *)(a1 + 88)];
  [v7 addIntegerValueForField:@"features_detailed_category.time_window" fieldValue:*(void *)(a1 + 96)];
  [v7 addDateValueForField:@"features_detailed_category.start_date" fieldValue:*(void *)(a1 + 56)];
  [v7 addDateValueForField:@"features_detailed_category.end_date" fieldValue:*(void *)(a1 + 64)];
}

void sub_100004FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005008(void *a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = FHComparisonOperatorEquals;
  [v4 addIntegerClause:FHComparisonOperatorEquals fieldName:@"features_detailed_category.time_window" expression:a1[5]];
  [v4 addIntegerClause:v3 fieldName:@"features_detailed_category.time_of_day" expression:a1[6]];
  if (a1[4]) {
    objc_msgSend(v4, "addStringClause:fieldName:expression:", v3, @"features_detailed_category.country_code");
  }
}

void sub_1000050A0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndex:0];
  id v22 = [v4 stringValue];

  id v5 = objc_alloc((Class)NSDecimalNumber);
  uint64_t v6 = [v3 objectAtIndex:1];
  id v7 = objc_msgSend(v5, "initWithInteger:", (int)objc_msgSend(v6, "intValue"));
  v8 = +[NSDecimalNumber defaultDatabaseAmountMultiplier];
  id v9 = [v7 decimalNumberByDividingBy:v8];

  double v10 = +[NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:0 scale:0 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  double v11 = [v9 decimalNumberByRoundingAccordingToBehavior:v10];
  uint64_t v12 = [v3 objectAtIndex:3];
  uint64_t v13 = [v12 stringValue];

  uint64_t v14 = [v3 objectAtIndex:2];
  uint64_t v15 = (int)[v14 intValue];

  uint64_t v16 = [v3 objectAtIndex:4];

  [v16 doubleValue];
  double v18 = v17;

  id v19 = [objc_alloc((Class)FHTransactionDetailedCategoryAggregateRecord) initWithMapsCategory:v22 amountSpent:v11 countryCode:v13 transactionCount:v15 regularTransactionRatio:v18];
  if (!a1[4])
  {
    double v20 = +[NSString stringWithFormat:@"%@, %lu, %lu", v22, a1[7], a1[8]];
    double v21 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:v20];
    if (v21)
    {
      [*(id *)(*(void *)(a1[6] + 8) + 40) removeObject:v21];
      [v19 addRecord:v21];
    }
    [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v19 forKey:v20];
    [v19 setCountryCode:0];
  }
  [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v19];
}

int64_t sub_100005328(id a1, FHTransactionDetailedCategoryAggregateRecord *a2, FHTransactionDetailedCategoryAggregateRecord *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [(FHTransactionDetailedCategoryAggregateRecord *)v4 transactionCount];
  if (v6 == [(FHTransactionDetailedCategoryAggregateRecord *)v5 transactionCount])
  {
    [(FHTransactionDetailedCategoryAggregateRecord *)v4 regularTransactionRatio];
    double v8 = v7;
    [(FHTransactionDetailedCategoryAggregateRecord *)v5 regularTransactionRatio];
    if (v8 == v9)
    {
      uint64_t v15 = [(FHTransactionDetailedCategoryAggregateRecord *)v5 amountSpent];
      uint64_t v16 = [(FHTransactionDetailedCategoryAggregateRecord *)v4 amountSpent];
      int64_t v13 = (int64_t)[v15 compare:v16];
    }
    else
    {
      [(FHTransactionDetailedCategoryAggregateRecord *)v4 regularTransactionRatio];
      double v11 = v10;
      [(FHTransactionDetailedCategoryAggregateRecord *)v5 regularTransactionRatio];
      int64_t v13 = v11 < v12;
    }
  }
  else
  {
    id v14 = [(FHTransactionDetailedCategoryAggregateRecord *)v4 transactionCount];
    int64_t v13 = v14 < [(FHTransactionDetailedCategoryAggregateRecord *)v5 transactionCount];
  }

  return v13;
}

void sub_100006210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v25 - 144));
  _Unwind_Resume(a1);
}

void sub_100006234(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 1);
    double v7 = [v3 allValues];
    LOBYTE(v6) = [v6 insertFeaturesEvents:v7];

    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
    double v8 = FinHealthLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "instance deallocated", buf, 2u);
    }
  }
  double v9 = FinHealthLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v10 = +[NSError errorWithDomain:FHErrorDomain code:10008 userInfo:0];
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "can not insert batch of event identifiers error: %@", buf, 0xCu);
  }
LABEL_10:
  double v12 = *(void **)(a1 + 32);
  double v11 = *(void **)(a1 + 40);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 96);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000064A0;
  v18[3] = &unk_100031470;
  id v19 = v11;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void **)(a1 + 64);
  id v20 = v14;
  uint64_t v21 = v15;
  id v22 = v16;
  v23 = v5;
  id v24 = v3;
  id v25 = *(id *)(a1 + 72);
  id v26 = *(id *)(a1 + 80);
  id v17 = v3;
  [v12 evaluatePointsOfInterest:v19 bypassMapService:v13 completion:v18];
}

void sub_1000064A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = *(id *)(a1 + 32);
  id v38 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v46;
    uint64_t v40 = FHSmartFeatureCompoundTypeEventTagging;
    uint64_t v39 = FHSmartFeatureCompoundTypeTripEvents;
    uint64_t v34 = FHErrorDomain;
    *(void *)&long long v4 = 136315394;
    long long v33 = v4;
    id v36 = v3;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        double v7 = objc_msgSend(v6, "identifier", v33);
        if ([*(id *)(a1 + 40) containsObject:v7])
        {
          double v8 = [*(id *)(a1 + 48) compoundFeaturesForTransaction:v7];
          uint64_t v9 = [v8 objectForKey:v40];

          double v10 = [*(id *)(a1 + 48) compoundFeaturesForTransaction:v7];
          v41 = [v10 objectForKey:v39];
        }
        else
        {
          v41 = 0;
          uint64_t v9 = 0;
        }
        id v42 = (void *)v9;
        double v11 = [*(id *)(a1 + 56) realtimeFeaturesForTransaction:v6];
        uint64_t v12 = *(void *)(a1 + 64);
        if (v12) {
          [*(id *)(v12 + 8) insertFeatures:v6 realtimeFeatures:v11];
        }
        uint64_t v13 = [v11 smartCompoundFeatures];
        id v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

        uint64_t v15 = objc_opt_new();
        uint64_t v16 = objc_opt_new();
        id v17 = [*(id *)(a1 + 72) objectForKey:v7];

        if (v17)
        {
          double v18 = [*(id *)(a1 + 72) valueForKey:v7];
          id v19 = [v18 objectForKey:v40];

          if (v19 && [v19 count]) {
            [v15 addObjectsFromArray:v19];
          }
          id v20 = [*(id *)(a1 + 72) valueForKey:v7];
          uint64_t v21 = [v20 objectForKey:v39];

          if (v21 && [v21 count]) {
            [v16 addObjectsFromArray:v21];
          }

          id v3 = v36;
        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100006AB8;
        v43[3] = &unk_100031448;
        id v44 = *(id *)(a1 + 80);
        id v22 = +[NSPredicate predicateWithBlock:v43];
        if (v42)
        {
          v23 = [v42 filteredArrayUsingPredicate:v22];
          [v15 addObjectsFromArray:v23];
        }
        if (v41)
        {
          id v24 = [v41 filteredArrayUsingPredicate:v22];
          [v16 addObjectsFromArray:v24];
        }
        if ([v15 count])
        {
          [v14 setValue:v15 forKey:v40];
          [*(id *)(a1 + 88) addObject:v7];
        }
        if ([v16 count])
        {
          [v14 setValue:v16 forKey:v39];
          [*(id *)(a1 + 88) addObject:v7];
        }
        id v25 = [v3 objectForKey:v7];

        if (v25)
        {
          id v26 = FinHealthLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            v50 = "-[FinHealthStateController _processAggregateFeaturesWithHardReset:]_block_invoke";
            __int16 v51 = 2112;
            id v52 = v3;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s: pointsOfInterestCompoundFeaturesForTransactionBatch :%@", buf, 0x16u);
          }

          v27 = [v3 valueForKey:v7];
          [v14 addEntriesFromDictionary:v27];
        }
        uint64_t v28 = +[NSDictionary dictionaryWithDictionary:v14];
        [v11 setSmartCompoundFeatures:v28];

        uint64_t v29 = *(void *)(a1 + 64);
        if (v29)
        {
          if ([*(id *)(v29 + 8) insertFeaturesCompoundRealtimeWithoutEvents:v7 realtimeFeatures:v11])goto LABEL_40; {
        }
          }
        else
        {
          v30 = FinHealthLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "instance deallocated", buf, 2u);
          }
        }
        v31 = FinHealthLogObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          id v32 = +[NSError errorWithDomain:v34 code:10008 userInfo:0];
          *(_DWORD *)buf = 138412290;
          v50 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "error: %@", buf, 0xCu);

          id v3 = v36;
        }

LABEL_40:
      }
      id v38 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v38);
  }
}

uint64_t sub_100006AB8(uint64_t a1, void *a2)
{
  id v3 = [a2 eventIdentifiers];
  long long v4 = +[NSMutableSet setWithArray:v3];

  id v5 = +[NSSet setWithArray:*(void *)(a1 + 32)];
  uint64_t v6 = [v4 intersectsSet:v5] ^ 1;

  return v6;
}

void *sub_100006B44(void *result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (result[4] == a2)
  {
    result = [*(id *)(result[5] + 8) computeAllAggregateFeatures];
    *a4 = 1;
  }
  return result;
}

void sub_100006B84(id a1)
{
  v1 = FinHealthLogObject();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Finished computing trends..", v2, 2u);
  }
}

void sub_100006DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006DC0(uint64_t a1, int a2)
{
  long long v4 = FinHealthLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v5 = @"failure";
    if (a2) {
      CFStringRef v5 = @"success";
    }
    int v12 = 138412290;
    CFStringRef v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Merge bankconnect transactions complete with status: %@", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v7 = FinHealthLogObject();
    double v8 = FinHealthLogObject();
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v8, v9);

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v10, "bankconnect:sync", "", (uint8_t *)&v12, 2u);
    }

    double v11 = FinHealthLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "END \"bankconnect:sync\"", (uint8_t *)&v12, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000804C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008110;
  v8[3] = &unk_100031550;
  uint64_t v6 = *(void **)(a1 + 32);
  CFStringRef v5 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v9 = v5;
  id v10 = v3;
  id v7 = v3;
  [v6 _deleteAllDataForPass:v7 force:v4 completion:v8];
}

void sub_100008110(void *a1, char a2, void *a3)
{
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    CFStringRef v5 = (void *)a1[4];
    id v6 = [a3 description];
    [v5 setValue:v6 forKey:a1[5]];
  }
}

uint64_t sub_100008670(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008A70(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count] == *(id *)(a1 + 48))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

    [*(id *)(a1 + 32) removeAllObjects];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void sub_100008EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008EFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = FinHealthLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    id v4 = "-[FinHealthStateController _newClientConnection]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "[%s]: connection invalidated", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setConnection:0];
}

void sub_100008FCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = FinHealthLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315138;
    id v4 = "-[FinHealthStateController _newClientConnection]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "[%s]: connection interrupted", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained setConnection:0];
}

void sub_100009178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000919C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v3 localizedDescription];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = (id)objc_opt_class();
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Error getting remote proxy object: %@, [%@]", (uint8_t *)&v8, 0x16u);
  }
}

int64_t sub_100009F2C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = messagingQueryKeyAmount;
  id v5 = a3;
  id v6 = [(NSDictionary *)a2 objectForKey:v4];
  id v7 = [(NSDictionary *)v5 objectForKey:v4];

  id v8 = [v7 compare:v6];
  return (int64_t)v8;
}

int64_t sub_10000A5E0(id a1, FHPeerPaymentForecastingSignal *a2, FHPeerPaymentForecastingSignal *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = FHPeerPaymentForecastingSignalPriority();
  id v7 = +[NSNumber numberWithUnsignedInteger:[(FHPeerPaymentForecastingSignal *)v4 forecastingType]];
  id v8 = [v6 objectForKey:v7];
  id v9 = [v8 integerValue];

  __int16 v10 = FHPeerPaymentForecastingSignalPriority();
  id v11 = +[NSNumber numberWithUnsignedInteger:[(FHPeerPaymentForecastingSignal *)v5 forecastingType]];
  int v12 = [v10 objectForKey:v11];
  id v13 = [v12 integerValue];

  if (v9 == v13)
  {
    id v14 = [(FHPeerPaymentForecastingSignal *)v5 signalDate];
    uint64_t v15 = [(FHPeerPaymentForecastingSignal *)v4 signalDate];
    int64_t v16 = (int64_t)[v14 compare:v15];
  }
  else
  {
    int64_t v16 = (uint64_t)v9 > (uint64_t)v13;
  }

  return v16;
}

int main(int argc, const char **argv, const char **envp)
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    id v3 = FinHealthLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to create temporary folder", (uint8_t *)&v11, 2u);
    }
  }
  uint64_t v4 = NSTemporaryDirectory();
  id v5 = FinHealthLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412290;
    int v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "temporary directory path: %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = dispatch_get_global_queue(25, 0);
  id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);

  dispatch_source_set_event_handler(v7, &stru_1000316B8);
  dispatch_resume(v7);
  id v8 = objc_opt_new();
  id v9 = +[NSXPCListener serviceListener];
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

void sub_10000B0C4(id a1)
{
  v1 = FinHealthLogObject();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "SIGTERM - exiting FinHealthXPCServices", v2, 2u);
  }

  exit(0);
}

void sub_10000B768(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B7AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B7BC(uint64_t a1)
{
}

void sub_10000B7C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = FinHealthLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    id v29 = [v6 count];
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received %lu transactions for %@", buf, 0x16u);
  }
  id v19 = v5;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = [v13 associatedReceiptUniqueID];
        uint64_t v15 = v14;
        if (v14)
        {
          int64_t v16 = *(void **)(*(void *)(a1 + 32) + 8);
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10000B9FC;
          v20[3] = &unk_1000316E0;
          id v17 = v14;
          uint64_t v18 = *(void *)(a1 + 32);
          id v21 = v17;
          uint64_t v22 = v18;
          [v16 transactionReceiptWithUniqueID:v17 completion:v20];
        }
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

void sub_10000B9FC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 lineItems];
  uint64_t v34 = v2;
  uint64_t v4 = [v2 summaryItems];
  if (v3)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v5 = v3;
    id v35 = [v5 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v35)
    {
      id v29 = v4;
      __int16 v30 = v3;
      uint64_t v33 = *(void *)v42;
      id obj = v5;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v8 = FinHealthLogObject();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v9 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            uint64_t v47 = v9;
            __int16 v48 = 2112;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "associatedReceiptUniqueID: %@, lineItem: %@", buf, 0x16u);
          }

          id v10 = *(void **)(*(void *)(a1 + 40) + 40);
          uint64_t v11 = [v34 receiptIdentifier];
          int v12 = [v7 identifier];
          id v13 = [v7 title];
          id v14 = [v7 subtitle];
          id v15 = [v7 quantity];
          int64_t v16 = [v7 amount];
          id v17 = [v7 currencyCode];
          objc_msgSend(v10, "insertReceiptData:identifier:title:subtitle:quantity:amount:currencyCode:adamIdentifier:", v11, v12, v13, v14, v15, v16, v17, objc_msgSend(v7, "adamIdentifier"));
        }
        id v5 = obj;
        id v35 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v35);
      uint64_t v4 = v29;
      id v3 = v30;
    }
  }
  else
  {
    id v5 = FinHealthLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No Line Items were Found", buf, 2u);
    }
  }

  if (v4)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v18 = v4;
    id v19 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v19)
    {
      id v20 = v19;
      id v31 = v3;
      uint64_t v21 = *(void *)v38;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
          long long v24 = FinHealthLogObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v25 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            uint64_t v47 = v25;
            __int16 v48 = 2112;
            id v49 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "associatedReceiptUniqueID: %@, summaryItem: %@", buf, 0x16u);
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v20);
      id v3 = v31;
    }
  }
  else
  {
    uint64_t v18 = FinHealthLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "No Summary Items were Found", buf, 2u);
    }
  }

  long long v26 = FinHealthLogObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = [v34 debugDescription];
    *(_DWORD *)buf = 138412546;
    uint64_t v47 = v27;
    __int16 v48 = 2112;
    id v49 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "associatedReceiptUniqueID: %@, receipt :%@", buf, 0x16u);
  }
}

void sub_10000BF7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = FinHealthLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v3 identifier];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Received transaction with identifier: %@", (uint8_t *)&v6, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000C1F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = FinHealthLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 identifier];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Received transaction with identifier: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C61C(id a1, NSString *a2, NSError *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  int v6 = FinHealthLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      id v8 = [(NSError *)v5 localizedDescription];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Received error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Transactions inserted with status: %@", (uint8_t *)&v9, 0xCu);
  }
}

uint64_t sub_10000C7F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000CB08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000DB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DB48(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) != a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_10000DEFC(uint64_t a1)
{
  id v2 = FinHealthLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connected card transactions update complete.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000E0DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F284(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10000F2A8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v63 = v7;
    long long v64 = v8;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v11 = v7;
    id v67 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
    id v62 = v9;
    if (!v67)
    {
      LOBYTE(v13) = 1;
      goto LABEL_30;
    }
    uint64_t v12 = *(void *)v74;
    uint64_t v13 = 1;
    uint64_t v65 = *(void *)v74;
    while (1)
    {
      for (i = 0; i != v67; i = (char *)i + 1)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        int64_t v16 = [WeakRetained dbMgr];
        id v17 = [v16 getTransactionInternalState:v15];

        if (!v17 && [v15 accountType] == (id)4)
        {
          uint64_t v18 = [WeakRetained dbMgr];
          unsigned __int8 v19 = [v18 insertTransactionInInternalStateDirty:v15];

          if ((v19 & 1) == 0)
          {
            id v20 = FinHealthLogObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = [v15 identifier];
              *(_DWORD *)buf = 138412290;
              v79 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to insert initial bankConnect transaction with transaction identifier: %@", buf, 0xCu);
            }
            uint64_t v13 = 0;
          }
        }
        id v22 = [v15 accountType];
        long long v23 = [WeakRetained dbMgr];
        long long v24 = v23;
        if (v22 == (id)4)
        {
          unsigned __int8 v25 = [v23 updateTransactionWholeRaw:v15];

          long long v26 = FinHealthLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v27 = [v15 identifier];
            *(_DWORD *)buf = 138412290;
            v79 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Updating bankConnect transaction %@ from FinanceKit source", buf, 0xCu);
          }
          if ((v25 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v28 = [v15 identifier];
          id v29 = [v24 getTransactionByIdentifier:v28];

          [*(id *)(a1 + 32) _parityCheckBetweenWalletSourceTransaction:v29 andFinanceSourceTransaction:v15];
          __int16 v30 = [WeakRetained dbMgr];
          unsigned __int8 v31 = [v30 updateFinanceTransactionIdentifier:v15];

          id v32 = FinHealthLogObject();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = [v15 financeTransactionIdentifier];
            [v15 identifier];
            unsigned __int8 v66 = v31;
            id v34 = WeakRetained;
            id v35 = v11;
            uint64_t v36 = a1;
            v38 = uint64_t v37 = v13;
            *(_DWORD *)buf = 138412546;
            v79 = v33;
            __int16 v80 = 2112;
            v81 = v38;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Updating financeTransactionIdentifier %@ for Card/Cash transaction %@ from FinanceKit source", buf, 0x16u);

            uint64_t v13 = v37;
            a1 = v36;
            id v11 = v35;
            id WeakRetained = v34;
            unsigned __int8 v31 = v66;

            uint64_t v12 = v65;
          }

          if ((v31 & 1) == 0)
          {
LABEL_21:
            long long v39 = FinHealthLogObject();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              long long v40 = [v15 identifier];
              *(_DWORD *)buf = 138412290;
              v79 = v40;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to update transaction with financeTransactionIdentifier: %@", buf, 0xCu);
            }
            uint64_t v13 = 0;
            continue;
          }
        }
      }
      id v67 = [v11 countByEnumeratingWithState:&v73 objects:v82 count:16];
      if (!v67)
      {
LABEL_30:
        char v68 = v13;

        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v42 = v64;
        id v43 = [v42 countByEnumeratingWithState:&v69 objects:v77 count:16];
        if (!v43) {
          goto LABEL_52;
        }
        id v44 = v43;
        uint64_t v45 = *(void *)v70;
        while (1)
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v70 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
            __int16 v48 = [WeakRetained dbMgr];
            id v49 = [v48 getTransactionByFinanceTransactionIdentifier:v47];

            if (v49)
            {
              id v50 = [v49 accountType];
              __int16 v51 = [WeakRetained dbMgr];
              id v52 = v51;
              if (v50 == (id)4)
              {
                unsigned int v53 = [v51 deleteBankConnectTransactionWithFinanceTransactionIdentifier:v47];

                v54 = FinHealthLogObject();
                v55 = v54;
                if (v53)
                {
                  if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_50;
                  }
                  *(_DWORD *)buf = 138412290;
                  v79 = v47;
                  id v56 = v55;
                  os_log_type_t v57 = OS_LOG_TYPE_DEBUG;
                  id v58 = "Deleted bank connect transaction with financeTransactionIdentifier: %@";
                }
                else
                {
                  if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_50;
                  }
                  *(_DWORD *)buf = 138412290;
                  v79 = v47;
                  id v56 = v55;
                  os_log_type_t v57 = OS_LOG_TYPE_ERROR;
                  id v58 = "Failed to delete bank connect transaction with financeTransactionIdentifier: %@";
                }
              }
              else
              {
                unsigned int v59 = [v51 removeFinanceTransactionIdentifier:v47];

                long long v60 = FinHealthLogObject();
                v55 = v60;
                if (v59)
                {
                  if (!os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_50;
                  }
                  *(_DWORD *)buf = 138412290;
                  v79 = v47;
                  id v56 = v55;
                  os_log_type_t v57 = OS_LOG_TYPE_DEBUG;
                  id v58 = "Removed financeTransactionIdentifier value of card/cash transaction with financeTransactionIdent"
                        "ifier: %@ from FinanceKit source";
                }
                else
                {
                  if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_50;
                  }
                  *(_DWORD *)buf = 138412290;
                  v79 = v47;
                  id v56 = v55;
                  os_log_type_t v57 = OS_LOG_TYPE_ERROR;
                  id v58 = "Failed to remove financeTransactionIdentifier from card/cash transaction with financeTransactionIdentifier: %@";
                }
              }
            }
            else
            {
              v55 = FinHealthLogObject();
              if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_50;
              }
              *(_DWORD *)buf = 138412290;
              v79 = v47;
              id v56 = v55;
              os_log_type_t v57 = OS_LOG_TYPE_DEBUG;
              id v58 = "Couldn't find the transaction with financeTransactionIdentifier: %@ (probably replay of very old record)";
            }
            _os_log_impl((void *)&_mh_execute_header, v56, v57, v58, buf, 0xCu);
LABEL_50:
          }
          id v44 = [v42 countByEnumeratingWithState:&v69 objects:v77 count:16];
          if (!v44)
          {
LABEL_52:

            id v7 = v63;
            id v8 = v64;
            id v9 = v62;
            if (v68)
            {
              long long v61 = FinHealthLogObject();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v79 = v62;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Saving history token: %@", buf, 0xCu);
              }

              long long v41 = [WeakRetained dbMgr];
              [v41 updateProcessingTimeForFeature:FHProcessingHistoryBankConnectTransactionsIdentifier data:v62];
              goto LABEL_56;
            }
            goto LABEL_57;
          }
        }
      }
    }
  }
  long long v41 = FinHealthLogObject();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "warning: updateTransactionsWithCompletion : Failed to save transactions because self was released", buf, 2u);
  }
LABEL_56:

LABEL_57:
}

void sub_10000FA70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      id v15 = v3;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [WeakRetained dbMgr];
          unsigned __int8 v12 = [v11 insertOrUpdateBankConnectAccount:v10];

          if ((v12 & 1) == 0)
          {
            uint64_t v13 = FinHealthLogObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v14 = [v10 accountID];
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to update account with accountID: %@", buf, 0xCu);
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v7);
      id v3 = v15;
    }
  }
  else
  {
    id v5 = FinHealthLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "warning: updateTransactionsWithCompletion : Failed to save accounts because self was released", buf, 2u);
    }
  }
}

void sub_10000FC84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = FinHealthLogObject();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v3 localizedFailureReason];
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "mergeTransactionsWithCompletion : failed with error = %@ reason = %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "mergeTransactionsWithCompletion : complete", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000FE6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000109AC(id a1)
{
  qword_100037990 = [[FinHealthDisputeDocumentProcessing alloc] _init];
  _objc_release_x1();
}

int64_t sub_1000113EC(id a1, FHSmartFeatureDisputeDocumentSuggestion *a2, FHSmartFeatureDisputeDocumentSuggestion *a3)
{
  uint64_t v4 = a2;
  id v5 = [(FHSmartFeatureDisputeDocumentSuggestion *)a3 rankScore];
  id v6 = [(FHSmartFeatureDisputeDocumentSuggestion *)v4 rankScore];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100011BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

uint64_t sub_100011C18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011C28(uint64_t a1)
{
}

void sub_100011C30(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id v5 = [v3 objectAtIndex:0];
  [v5 doubleValue];
  double v7 = v6;

  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v4 timeIntervalSinceReferenceDate];
  double v11 = v10;

  double v12 = vabdd_f64(v9, v11);
  [*(id *)(a1 + 40) timeIntervalSinceNow];
  double v14 = fabs(v13);
  if (v12 >= v14) {
    double v14 = v12;
  }
  id obj = [objc_alloc((Class)NSDecimalNumber) initWithDouble:v7 * (1.0 - v12 / v14)];
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "lessThan:")) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  }
}

void sub_100011D3C(uint64_t a1, void *a2)
{
  id v24 = a2;
  id v3 = +[NSDecimalNumber decimalNumberWithString:rankingDimensionsDefaultScore];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v24 objectForKey:NSTextCheckingStreetKey];
  double v6 = [*(id *)(a1 + 40) street];
  LODWORD(v4) = [v4 isTransactionAddressFieldPresentIn:v5 forTransactionAddressField:v6];

  if (v4)
  {
    double v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:2];
    uint64_t v8 = [v3 decimalNumberByAdding:v7];

    id v3 = (void *)v8;
  }
  double v9 = *(void **)(a1 + 32);
  double v10 = [v24 objectForKey:NSTextCheckingCityKey];
  double v11 = [*(id *)(a1 + 40) city];
  LODWORD(v9) = [v9 isTransactionAddressFieldPresentIn:v10 forTransactionAddressField:v11];

  if (v9)
  {
    double v12 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:3];
    uint64_t v13 = [v3 decimalNumberByAdding:v12];

    id v3 = (void *)v13;
  }
  double v14 = *(void **)(a1 + 32);
  id v15 = [v24 objectForKey:NSTextCheckingStateKey];
  long long v16 = [*(id *)(a1 + 40) state];
  LODWORD(v14) = [v14 isTransactionAddressFieldPresentIn:v15 forTransactionAddressField:v16];

  if (v14)
  {
    long long v17 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:4];
    uint64_t v18 = [v3 decimalNumberByAdding:v17];

    id v3 = (void *)v18;
  }
  long long v19 = *(void **)(a1 + 32);
  id v20 = [v24 objectForKey:NSTextCheckingZIPKey];
  uint64_t v21 = [*(id *)(a1 + 40) zip];
  LODWORD(v19) = [v19 isTransactionAddressFieldPresentIn:v20 forTransactionAddressField:v21];

  if (v19)
  {
    id v22 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:5];
    uint64_t v23 = [v3 decimalNumberByAdding:v22];

    id v3 = (void *)v23;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) lessThan:v3]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  }
}

void sub_100012804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001281C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001282C(uint64_t a1)
{
}

void sub_100012834(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v9 = +[NSString stringWithFormat:@"%.4f", *(void *)&a3];
  id v6 = objc_alloc((Class)FHSmartCompoundFeatureRankedValue);
  id v7 = [objc_alloc((Class)NSDecimalNumber) initWithString:v9];
  id v8 = [v6 initWithLabelAndRank:v5 featureRank:v7];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
}

void sub_100012CEC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  if (([v7 isEqual:@" "] & 1) == 0)
  {
    id v8 = *(void **)(a1 + 40);
    if (v10)
    {
      id v9 = [v10 lowercaseString];
      [v8 addObject:v9];
    }
    else
    {
      [v8 addObject:v7];
    }
  }
}

uint64_t sub_100012DA4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) containsObject:a2] ^ 1;
}

void sub_10001370C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_100013764(uint64_t a1, void *a2, double a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a2;
  id v7 = [v5 valueForKey:v6];
  id v11 = v7;
  if (v7)
  {
    [v7 doubleValue];
    if (v8 <= a3) {
      a3 = v8;
    }
  }
  id v9 = +[NSString stringWithFormat:@"%.4f", *(void *)&a3];
  id v10 = [objc_alloc((Class)NSDecimalNumber) initWithString:v9];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setValue:v10 forKey:v6];
}

void sub_100013848(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) nlEmbedding];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) nlEmbedding];
    uint64_t v8 = maxNeighborsToAddPerWord;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001393C;
    v9[3] = &unk_1000319B0;
    double v11 = a3;
    id v10 = *(id *)(a1 + 40);
    [v7 enumerateNeighborsForString:v5 maximumCount:v8 distanceType:0 usingBlock:v9];
  }
}

uint64_t sub_10001393C(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40) + a2);
}

int64_t sub_100013954(id a1, FHSmartCompoundFeatureRankedValue *a2, FHSmartCompoundFeatureRankedValue *a3)
{
  id v4 = a3;
  id v5 = [(FHSmartCompoundFeatureRankedValue *)a2 featureRank];
  id v6 = [(FHSmartCompoundFeatureRankedValue *)v4 featureRank];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10001492C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_100014964(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014974(uint64_t a1)
{
}

void sub_10001497C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 title];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [objc_alloc((Class)NSDecimalNumber) initWithInteger:300];
    uint64_t v6 = [*(id *)(a1 + 32) tripEventTitleNomalization:v3];

    id v4 = (void *)v6;
    if (!v6) {
      goto LABEL_21;
    }
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v8 = objc_alloc((Class)NSDecimalNumber);
    if (isKindOfClass) {
      uint64_t v9 = 200;
    }
    else {
      uint64_t v9 = 100;
    }
    id v5 = [v8 initWithInteger:v9];
  }
  id v10 = [objc_alloc((Class)FHSmartCompoundFeatureRankedValue) initWithLabelAndRank:v4 featureRank:v5];
  double v11 = [v3 startDate];
  [v10 setEventStartDate:v11];

  double v12 = [v3 endDate];
  [v10 setEventEndDate:v12];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = a1;
    uint64_t v13 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v14 = [v3 tripParts];
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) eventIdentifiers];
          [v13 addObjectsFromArray:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    id v20 = +[NSArray arrayWithArray:v13];
    [v10 setEventIdentifiers:v20];

    [*(id *)(*(void *)(*(void *)(v24 + 40) + 8) + 40) addObject:v10];
  }
  else
  {
    uint64_t v21 = [v3 eventIdentifier];

    if (v21)
    {
      id v22 = [v3 eventIdentifier];
      uint64_t v23 = +[NSArray arrayWithObject:v22];
      [v10 setEventIdentifiers:v23];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
  }

LABEL_21:
}

void sub_100015560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_100015584(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 objectForKey:FHSmartFeatureCompoundTypeLostSavings];
    id v5 = v4;
    if (v4 && [v4 count]) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addEntriesFromDictionary:v6];
    }

    id v3 = v6;
  }
}

void sub_10001560C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 objectForKey:FHSmartFeatureCompoundTypeRelatedMerchants];
    id v5 = v4;
    if (v4 && [v4 count]) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addEntriesFromDictionary:v6];
    }

    id v3 = v6;
  }
}

void *sub_100015694(void *result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result[4] + 8) + 40) addEntriesFromDictionary:a2];
  }
  return result;
}

void sub_1000158F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100015924(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = objc_msgSend(a2, "mapItems", 0);
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v6 = FinHealthLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      double v11 = [v5 description];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "error: %@", buf, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100015AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 placemark];
  id v5 = [v4 areasOfInterest];

  if (v5)
  {
    id v6 = [v3 placemark];
    id v7 = [v6 location];
    [v7 distanceFromLocation:*(void *)(a1 + 32)];
    double v9 = v8;

    id v10 = [objc_alloc((Class)NSDecimalNumber) initWithDouble:v9];
    double v11 = [v3 placemark];
    long long v12 = [v11 areasOfInterest];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100015C00;
    v15[3] = &unk_100031AC0;
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v13;
    id v14 = v10;
    [v12 enumerateObjectsUsingBlock:v15];
  }
}

void sub_100015C00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:v3];

  if (!v4)
  {
    id v5 = [objc_alloc((Class)FHSmartCompoundFeatureRankedValue) initWithLabelAndRank:v3 featureRank:*(void *)(a1 + 32)];
    id v6 = FinHealthLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      id v10 = "-[FinHealthRealtimeFeaturesRequest _getLocalSearchResponse:transactionLocation:]_block_invoke_2";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%s] finHealthPointOfInterest: %@", (uint8_t *)&v9, 0x16u);
    }

    id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    double v8 = [v5 featureLabel];
    [v7 setObject:v5 forKey:v8];
  }
}

void sub_10001683C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)FHTripEvent) initWithPPTripEvent:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

void sub_1000168B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)FHSuggestedEvent) initWithPPSuggestedEvent:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

uint64_t sub_100016998(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v208 = a3;
  uint64_t v5 = sub_1000188B8(&qword_1000377F0);
  __chkstk_darwin(v5 - 8);
  v207 = (char *)&v193 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100021D10();
  uint64_t v210 = *(void *)(v7 - 8);
  v211 = (char *)v7;
  uint64_t v8 = __chkstk_darwin(v7);
  v196 = (char *)&v193 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v213 = (char *)&v193 - v10;
  uint64_t v11 = sub_100021D30();
  id v12 = *(uint64_t **)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v193 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v15 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  [v15 setAccountType:0];
  id v197 = a2;
  if (a2)
  {
    id v16 = a2;
    objc_msgSend(v15, "setAccountType:", objc_msgSend(v16, "accountType"));
    if ([v15 accountType] == (id)4)
    {
      sub_100021A50();
      sub_100021D20();
      ((void (*)(char *, uint64_t))v12[1])(v14, v11);
    }
    else
    {
      uint64_t v18 = sub_100021AF0();
      v212 = &v193;
      uint64_t v19 = *(void *)(v18 - 8);
      __chkstk_darwin(v18);
      v209 = v12;
      uint64_t v21 = v11;
      id v22 = (char *)&v193 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_1000219D0();
      sub_100021AE0();
      uint64_t v23 = v22;
      uint64_t v11 = v21;
      id v12 = v209;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v18);
    }
    NSString v17 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v15 setIdentifier:v17];
  }
  sub_100021A50();
  sub_100021D20();
  uint64_t v24 = (void (*)(void, void))v12[1];
  v205 = v14;
  v206 = (void *)v11;
  v202 = v24;
  v209 = v12 + 1;
  v24(v14, v11);
  NSString v25 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v15 setFinanceTransactionIdentifier:v25];

  uint64_t v26 = sub_100021850();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v200 = v28;
  id v29 = (char *)&v193 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021A10();
  sub_100021840();
  __int16 v30 = *(void (**)(void, void))(v27 + 8);
  v203 = (uint64_t *)(v27 + 8);
  v201 = v30;
  v30(v29, v26);
  NSString v31 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v15 setCurrencyCode:v31];

  uint64_t v32 = sub_1000188B8((uint64_t *)&qword_1000377F8);
  __chkstk_darwin(v32 - 8);
  uint64_t v33 = a1;
  uint64_t v35 = v34;
  uint64_t v36 = (char *)&v193 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v33;
  sub_100021A30();
  uint64_t v38 = sub_100021AB0();
  uint64_t v39 = *(void *)(v38 - 8);
  v198 = *(uint64_t (**)(void, void, void))(v39 + 48);
  int v40 = v198(v36, 1, v38);
  v204 = (void *)v26;
  uint64_t v199 = v38;
  uint64_t v193 = v39;
  if (v40 == 1)
  {
    sub_100019CA8((uint64_t)v36, (uint64_t *)&qword_1000377F8);
    __int16 v41 = 0;
    uint64_t v42 = (uint64_t)v211;
    id v43 = v213;
    uint64_t v44 = v35;
    goto LABEL_8;
  }
  __int16 v41 = sub_100021AA0();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v36, v38);
  if ((unsigned __int16)((unsigned __int16)(v41 - 4800) >> 5) > 0x7E6u)
  {
    uint64_t v45 = 7;
    uint64_t v42 = (uint64_t)v211;
    id v43 = v213;
LABEL_17:
    uint64_t v44 = v35;
    goto LABEL_18;
  }
  uint64_t v42 = (uint64_t)v211;
  id v43 = v213;
  if ((unsigned __int16)((unsigned __int16)(v41 - 6000) >> 4) > 0xFE6u)
  {
    uint64_t v45 = 2;
    goto LABEL_17;
  }
  uint64_t v44 = v35;
  if ((unsigned __int16)(v41 - 7800) > 0xF8F7u)
  {
    uint64_t v45 = 4;
    goto LABEL_18;
  }
LABEL_8:
  if ((unsigned __int16)(v41 - 8000) >= 0xFF38u) {
    uint64_t v45 = 5;
  }
  else {
    uint64_t v45 = 0;
  }
LABEL_18:
  long long v46 = v37;
  objc_msgSend(v15, "setCategory:", v45, v193);
  sub_1000219F0();
  Class isa = sub_100021D00().super.isa;
  __int16 v48 = *(void (**)(void, void))(v210 + 8);
  uint64_t v195 = v210 + 8;
  v194 = v48;
  v48(v43, v42);
  v213 = v15;
  [v15 setTransactionDate:isa];

  uint64_t v49 = sub_100021960();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(void *)(v50 + 64);
  __chkstk_darwin(v49);
  unint64_t v52 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
  v212 = v46;
  uint64_t v53 = sub_100021A60();
  __chkstk_darwin(v53);
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))((char *)&v193 - v52, (char *)&v193 - v52, v49);
  int v54 = (*(uint64_t (**)(char *, uint64_t))(v50 + 88))((char *)&v193 - v52, v49);
  if (&enum case for TransactionStatus.authorized(_:) && v54 == enum case for TransactionStatus.authorized(_:))
  {
    uint64_t v55 = 8;
  }
  else if (&enum case for TransactionStatus.memo(_:) && v54 == enum case for TransactionStatus.memo(_:) {
         || &enum case for TransactionStatus.pending(_:) && v54 == enum case for TransactionStatus.pending(_:))
  }
  {
    uint64_t v55 = 0;
  }
  else if (&enum case for TransactionStatus.booked(_:) && v54 == enum case for TransactionStatus.booked(_:))
  {
    uint64_t v55 = 1;
  }
  else if (&enum case for TransactionStatus.rejected(_:) && v54 == enum case for TransactionStatus.rejected(_:))
  {
    uint64_t v55 = 6;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))((char *)&v193 - v52, v49);
    uint64_t v55 = -1;
  }
  (*(void (**)(char *, uint64_t))(v50 + 8))((char *)&v193 - v52, v49);
  id v56 = v213;
  [v213 setTransactionStatus:v55];
  uint64_t v57 = sub_100021940();
  uint64_t v58 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  long long v60 = (char *)&v193 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021A00();
  uint64_t v61 = sub_1000198F0((uint64_t)v60);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v57);
  [v56 setTransactionType:v61];
  sub_100021A40();
  NSString v62 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v56 setTransactionDescription:v62];

  __chkstk_darwin(v63);
  long long v64 = (char *)&v193 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021A30();
  uint64_t v65 = v199;
  if (v198(v64, 1, v199) == 1)
  {
    sub_100019CA8((uint64_t)v64, (uint64_t *)&qword_1000377F8);
    __int16 v66 = 0;
  }
  else
  {
    __int16 v66 = sub_100021AA0();
    (*(void (**)(char *, uint64_t))(v193 + 8))(v64, v65);
  }
  id v67 = v202;
  uint64_t v68 = v200;
  [v56 setIndustryCode:v66];
  long long v69 = (void *)sub_1000219E0();
  [v56 setLocation:v69];

  long long v70 = v205;
  sub_100021A70();
  sub_100021D20();
  v67(v70, v206);
  NSString v71 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v56 setTransactionSourceIdentifier:v71];

  v209 = &v193;
  __chkstk_darwin(v72);
  long long v73 = (char *)&v193 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021A10();
  unint64_t v74 = sub_100021830();
  LODWORD(v71) = v74;
  LOWORD(v67) = v75;
  LOWORD(v68) = v76;
  unint64_t v77 = HIDWORD(v74);
  unint64_t v78 = HIWORD(v74);
  unint64_t v79 = v75 >> 16;
  unint64_t v80 = HIDWORD(v75);
  unint64_t v81 = HIWORD(v75);
  unsigned int v82 = HIWORD(v76);
  v201(v73, v204);
  int v216 = (int)v71;
  LOWORD(v217) = v77;
  WORD1(v217) = v78;
  WORD2(v217) = (_WORD)v67;
  WORD3(v217) = v79;
  WORD4(v217) = v80;
  WORD5(v217) = v81;
  WORD6(v217) = v68;
  HIWORD(v217) = v82;
  uint64_t v83 = sub_100021A90();
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v85 = *(void *)(v84 + 64);
  __chkstk_darwin(v83);
  uint64_t v86 = sub_100021A20();
  __chkstk_darwin(v86);
  v87 = (char *)&v193 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v84 + 104))(v87, enum case for CreditDebitIndicator.credit(_:), v83);
  sub_100019BF8();
  sub_100021DE0();
  sub_100021DE0();
  LODWORD(v71) = *(unsigned __int16 *)v214;
  LODWORD(v78) = v215;
  v88 = *(void (**)(void, void))(v84 + 8);
  v88(v87, v83);
  v88(v87, v83);
  if (v71 == v78) {
    sub_100021EB0();
  }
  int v89 = v216;
  id v90 = objc_allocWithZone((Class)NSDecimalNumber);
  *(_DWORD *)v214 = v89;
  *(_OWORD *)&v214[4] = v217;
  id v91 = [v90 initWithDecimal:v214];
  v92 = v213;
  [v213 setAmount:v91];

  uint64_t v93 = (uint64_t)v207;
  sub_1000219B0();
  uint64_t v94 = v210;
  uint64_t v95 = (uint64_t)v211;
  if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(v210 + 48))(v93, 1, v211) == 1)
  {
    sub_100019CA8(v93, &qword_1000377F0);
  }
  else
  {
    v96 = v196;
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 32))(v196, v93, v95);
    Class v97 = sub_100021D00().super.isa;
    [v92 setTransactionStatusChangedDate:v97];

    v194(v96, v95);
  }
  v98._countAndFlagsBits = sub_1000219C0();
  if (v98._object)
  {
    strcpy(v214, "merchant-");
    *(_WORD *)&v214[10] = 0;
    *(_DWORD *)&v214[12] = -385875968;
    sub_100021DC0(v98);
    NSString v99 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v92 setMerchantUniqueIdentifier:v99];

    NSString v100 = sub_100021D90();
    [v92 setName:v100];

    NSString v101 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v92 setDisplayName:v101];
  }
  uint64_t v102 = sub_1000188B8(&qword_100037808);
  v206 = &v193;
  uint64_t v103 = *(void *)(*(void *)(v102 - 8) + 64);
  __chkstk_darwin(v102 - 8);
  unint64_t v104 = (v103 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v105 = sub_1000188B8(&qword_100037810);
  v205 = (char *)&v193;
  __chkstk_darwin(v105 - 8);
  v207 = v106;
  v107 = (char *)&v193 - ((unint64_t)(v106 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_1000188B8(&qword_100037818);
  v204 = &v193;
  __chkstk_darwin(v108 - 8);
  v202 = v109;
  v110 = (char *)&v193 - (((unint64_t)v109 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_1000188B8(&qword_100037820);
  v203 = &v193;
  __chkstk_darwin(v111 - 8);
  uint64_t v113 = v112;
  uint64_t v210 = (uint64_t)&v193 - ((v112 + 15) & 0xFFFFFFFFFFFFFFF0);
  v211 = v107;
  v209 = (uint64_t *)v110;
  sub_100018900((uint64_t)&v193 - v104, (uint64_t)v107, (uint64_t)v110, v210, v208);
  swift_bridgeObjectRelease();
  uint64_t v114 = sub_100021810();
  uint64_t v115 = *(void *)(v114 - 8);
  uint64_t v116 = __chkstk_darwin(v114);
  v118 = (char *)&v193 - ((v117 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v116);
  uint64_t v208 = (uint64_t)&v193 - v104;
  sub_100019C44((uint64_t)&v193 - v104, (uint64_t)&v193 - v104, &qword_100037808);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v115 + 48))((char *)&v193 - v104, 1, v114) == 1)
  {
    sub_100019CA8((uint64_t)&v193 - v104, &qword_100037808);
    uint64_t v119 = v113;
    v120 = v207;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v118, (char *)&v193 - v104, v114);
    sub_100019000((uint64_t)v118, v213);
    uint64_t v121 = sub_1000217F0();
    if ((v122 & 1) == 0)
    {
      double v123 = *(double *)&v121;
      uint64_t v124 = sub_100021800();
      if ((v125 & 1) == 0)
      {
        id v126 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:v123 longitude:*(double *)&v124];
        [v213 setLocation:v126];
      }
    }
    v127 = (void *)sub_1000217E0();
    uint64_t v119 = v113;
    v120 = v207;
    if (v127)
    {
      v128 = v127;
      NSString v129 = [v127 street];
      if (!v129)
      {
        sub_100021DA0();
        NSString v129 = sub_100021D90();
        swift_bridgeObjectRelease();
      }
      v130 = v213;
      [v213 setStreet:v129];

      NSString v131 = [v128 ISOCountryCode];
      if (!v131)
      {
        sub_100021DA0();
        NSString v131 = sub_100021D90();
        swift_bridgeObjectRelease();
      }
      [v130 setCountryCode:v131];

      NSString v132 = [v128 city];
      if (!v132)
      {
        sub_100021DA0();
        NSString v132 = sub_100021D90();
        swift_bridgeObjectRelease();
      }
      [v130 setCity:v132];

      NSString v133 = [v128 state];
      if (!v133)
      {
        sub_100021DA0();
        NSString v133 = sub_100021D90();
        swift_bridgeObjectRelease();
      }
      [v130 setState:v133];

      NSString v134 = [v128 postalCode];
      if (!v134)
      {
        sub_100021DA0();
        NSString v134 = sub_100021D90();
        swift_bridgeObjectRelease();
      }
      [v130 setZip:v134];
    }
    (*(void (**)(char *, uint64_t))(v115 + 8))(v118, v114);
  }
  uint64_t v135 = sub_100021C60();
  uint64_t v136 = *(void *)(v135 - 8);
  uint64_t v137 = __chkstk_darwin(v135);
  v139 = (char *)&v193 - ((v138 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v137);
  v140 = (char *)&v193 - ((unint64_t)(v120 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019C44((uint64_t)v211, (uint64_t)v140, &qword_100037810);
  int v141 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v136 + 48))(v140, 1, v135);
  v142 = v212;
  v143 = v213;
  if (v141 == 1)
  {
    sub_100019CA8((uint64_t)v140, &qword_100037810);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v136 + 32))(v139, v140, v135);
    sub_100019448((uint64_t)v139, v143);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v139, v135);
  }
  uint64_t v144 = sub_100021BC0();
  uint64_t v145 = *(void *)(v144 - 8);
  uint64_t v146 = __chkstk_darwin(v144);
  v148 = (char *)&v193 - ((v147 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v146);
  sub_100019C44(v210, (uint64_t)&v193 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100037820);
  int v149 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v145 + 48))((char *)&v193 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0), 1, v144);
  uint64_t v150 = (uint64_t)v209;
  if (v149 == 1)
  {
    sub_100019CA8((uint64_t)&v193 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100037820);
  }
  else
  {
    v207 = (char *)&v193;
    uint64_t v200 = v145;
    v151 = *(void (**)(void, void, void))(v145 + 32);
    v201 = (void (*)(void, void))v144;
    v151(v148, (char *)&v193 - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0), v144);
    uint64_t v152 = sub_100021B30();
    if ((v152 & 0x10000) == 0) {
      [v143 setIndustryCode:(__int16)v152];
    }
    uint64_t v153 = sub_1000188B8((uint64_t *)&qword_100037828);
    uint64_t v154 = *(void *)(*(void *)(v153 - 8) + 64);
    __chkstk_darwin(v153 - 8);
    unint64_t v155 = (v154 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_100021BB0();
    uint64_t v156 = sub_100021BA0();
    v157 = *(uint64_t (**)(void, void, void))(*(void *)(v156 - 8) + 48);
    int v158 = v157((char *)&v193 - v155, 1, v156);
    uint64_t v159 = sub_100019CA8((uint64_t)&v193 - v155, (uint64_t *)&qword_100037828);
    if (v158 != 1)
    {
      __chkstk_darwin(v159);
      sub_100021BB0();
      uint64_t result = v157((char *)&v193 - v155, 1, v156);
      if (result == 1)
      {
        __break(1u);
        return result;
      }
      sub_100019D04();
      v161 = (void *)sub_100021E80();
      [v213 setLocation:v161];
    }
    sub_100021B70();
    v143 = v213;
    if (v162)
    {
      NSString v163 = sub_100021D90();
      swift_bridgeObjectRelease();
      [v143 setIndustryCategory:v163];
    }
    sub_100021B90();
    v142 = v212;
    uint64_t v150 = (uint64_t)v209;
    v164 = v201;
    uint64_t v165 = v200;
    if (!v166)
    {
      id v167 = [v143 countryCode];
      sub_100021DA0();
    }
    NSString v168 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v143 setCountryCode:v168];

    sub_100021B40();
    if (!v169)
    {
      id v170 = [v143 city];
      sub_100021DA0();
    }
    NSString v171 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v143 setCity:v171];

    sub_100021B50();
    if (!v172)
    {
      id v173 = [v143 state];
      sub_100021DA0();
    }
    NSString v174 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v143 setState:v174];

    sub_100021B20();
    if (!v175)
    {
      id v176 = [v143 zip];
      sub_100021DA0();
    }
    NSString v177 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v143 setZip:v177];

    sub_100021B60();
    if (!v178)
    {
      id v179 = [v143 rawName];
      sub_100021DA0();
    }
    NSString v180 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v143 setRawName:v180];

    sub_100021B80();
    if (!v181)
    {
      id v182 = [v143 country];
      sub_100021DA0();
    }
    NSString v183 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v143 setCountry:v183];

    (*(void (**)(char *, void))(v165 + 8))(v148, v164);
  }
  v184 = v202;
  uint64_t v185 = sub_1000219A0();
  uint64_t v186 = *(void *)(v185 - 8);
  uint64_t v187 = __chkstk_darwin(v185);
  v189 = (char *)&v193 - ((v188 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v187);
  v190 = (char *)&v193 - (((unint64_t)v184 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019C44(v150, (uint64_t)v190, &qword_100037818);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v186 + 48))(v190, 1, v185) == 1)
  {

    uint64_t v191 = sub_100021A80();
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v191 - 8) + 8))(v142, v191);
    sub_100019CA8(v210, &qword_100037820);
    sub_100019CA8(v150, &qword_100037818);
    sub_100019CA8((uint64_t)v211, &qword_100037810);
    sub_100019CA8(v208, &qword_100037808);
    sub_100019CA8((uint64_t)v190, &qword_100037818);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v186 + 32))(v189, v190, v185);
    [v143 setCategory:(__int16)sub_100021990()];

    uint64_t v192 = sub_100021A80();
    (*(void (**)(uint64_t *, uint64_t))(*(void *)(v192 - 8) + 8))(v142, v192);
    (*(void (**)(char *, uint64_t))(v186 + 8))(v189, v185);
    sub_100019CA8(v210, &qword_100037820);
    sub_100019CA8(v150, &qword_100037818);
    sub_100019CA8((uint64_t)v211, &qword_100037810);
    sub_100019CA8(v208, &qword_100037808);
  }
  return (uint64_t)v143;
}

uint64_t sub_100018724(uint64_t a1)
{
  uint64_t v2 = sub_100021960();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (&enum case for TransactionStatus.authorized(_:) && v6 == enum case for TransactionStatus.authorized(_:)) {
    return 8;
  }
  if (&enum case for TransactionStatus.memo(_:) && v6 == enum case for TransactionStatus.memo(_:)
    || &enum case for TransactionStatus.pending(_:) && v6 == enum case for TransactionStatus.pending(_:))
  {
    return 0;
  }
  if (&enum case for TransactionStatus.booked(_:) && v6 == enum case for TransactionStatus.booked(_:)) {
    return 1;
  }
  if (&enum case for TransactionStatus.rejected(_:) && v6 == enum case for TransactionStatus.rejected(_:)) {
    return 6;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return -1;
}

uint64_t sub_1000188B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100018900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_1000188B8(&qword_100037808);
  __chkstk_darwin(v10 - 8);
  uint64_t v76 = v11;
  id v12 = (char *)v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100021810();
  id v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  unint64_t v79 = v12;
  v14(v12, 1, 1, v13);
  uint64_t v15 = sub_1000188B8(&qword_100037810);
  __chkstk_darwin(v15 - 8);
  uint64_t v75 = v16;
  NSString v17 = (char *)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100021C60();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  unint64_t v78 = v17;
  v19(v17, 1, 1, v18);
  uint64_t v20 = sub_100021BC0();
  uint64_t v21 = *(void *)(v20 - 8);
  id v22 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56);
  uint64_t v69 = v20;
  uint64_t v70 = a4;
  id v67 = v22;
  uint64_t v68 = v21 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t))v22)(a4, 1, 1);
  uint64_t v23 = sub_1000188B8(&qword_100037818);
  __chkstk_darwin(v23 - 8);
  uint64_t v74 = v24;
  NSString v25 = (char *)v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1000219A0();
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
  unint64_t v77 = v25;
  v27(v25, 1, 1, v26);
  if (a5)
  {
    uint64_t v28 = *(void *)(a5 + 16);
    if (v28)
    {
      uint64_t v63 = a1;
      uint64_t v64 = a2;
      uint64_t v65 = a3;
      uint64_t v29 = sub_1000217D0();
      uint64_t v30 = *(void *)(v29 - 8);
      NSString v31 = *(void (**)(void, void, void))(v30 + 16);
      uint64_t v32 = v30 + 16;
      uint64_t v33 = a5;
      uint64_t v34 = a5 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
      uint64_t v36 = *(void *)(v30 + 64);
      uint64_t v35 = *(void *)(v30 + 72);
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v30 + 88);
      unint64_t v80 = (void (**)(char *, uint64_t))(v30 + 96);
      uint64_t v85 = (uint64_t (**)(char *, uint64_t))(v30 + 8);
      uint64_t v86 = v35;
      __int16 v66 = (void (**)(uint64_t, char *, uint64_t))(v21 + 32);
      v62[1] = v33;
      uint64_t v38 = swift_bridgeObjectRetain();
      unint64_t v81 = v37;
      uint64_t v72 = v32;
      long long v73 = v31;
      uint64_t v71 = v36;
      do
      {
        v87 = v62;
        __chkstk_darwin(v38);
        uint64_t v39 = (char *)v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
        v31(v39, v34, v29);
        int v40 = (*v37)(v39, v29);
        if (&enum case for Transaction.Insight.maps(_:) && v40 == enum case for Transaction.Insight.maps(_:))
        {
          (*v80)((char *)v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
          uint64_t v83 = sub_1000217C0();
          uint64_t v84 = v62;
          uint64_t v41 = *(void *)(v83 - 8);
          __chkstk_darwin(v83);
          id v43 = (char *)v62 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t v44 = (*(uint64_t (**)(char *, char *))(v41 + 32))(v43, v39);
          unsigned int v82 = v62;
          __chkstk_darwin(v44);
          long long v46 = (char *)v62 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_100021790();
          uint64_t v47 = (uint64_t)v78;
          sub_100019CA8((uint64_t)v78, &qword_100037810);
          uint64_t v48 = sub_100019E5C((uint64_t)v46, v47, &qword_100037810);
          unsigned int v82 = v62;
          __chkstk_darwin(v48);
          uint64_t v50 = (char *)v62 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_1000217B0();
          uint64_t v51 = (uint64_t)v79;
          sub_100019CA8((uint64_t)v79, &qword_100037808);
          uint64_t v52 = sub_100019E5C((uint64_t)v50, v51, &qword_100037808);
          __chkstk_darwin(v52);
          int v54 = (char *)v62 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_1000217A0();
          uint64_t v55 = v43;
          uint64_t v36 = v71;
          (*(void (**)(char *, uint64_t))(v41 + 8))(v55, v83);
          uint64_t v56 = (uint64_t)v77;
          sub_100019CA8((uint64_t)v77, &qword_100037818);
          uint64_t v57 = v56;
          uint64_t v37 = v81;
          uint64_t v38 = sub_100019E5C((uint64_t)v54, v57, &qword_100037818);
          NSString v31 = v73;
        }
        else if (&enum case for Transaction.Insight.bank(_:) && v40 == enum case for Transaction.Insight.bank(_:) {
               || !&enum case for Transaction.Insight.applePay(_:)
        }
               || v40 != enum case for Transaction.Insight.applePay(_:))
        {
          uint64_t v38 = (*v85)((char *)v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
        }
        else
        {
          uint64_t v58 = v70;
          sub_100019CA8(v70, &qword_100037820);
          (*v80)((char *)v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v29);
          uint64_t v59 = v69;
          (*v66)(v58, (char *)v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v69);
          uint64_t v60 = v58;
          uint64_t v37 = v81;
          uint64_t v38 = v67(v60, 0, 1, v59);
        }
        v34 += v86;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease();
      a3 = v65;
      a2 = v64;
      a1 = v63;
    }
  }
  sub_100019E5C((uint64_t)v79, a1, &qword_100037808);
  sub_100019E5C((uint64_t)v78, a2, &qword_100037810);
  return sub_100019E5C((uint64_t)v77, a3, &qword_100037818);
}

uint64_t sub_100019000(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100021810();
  v26[3] = v4;
  v26[4] = (uint64_t)&protocol witness table for MapsMerchant;
  uint64_t v5 = sub_100019D44(v26);
  uint64_t v6 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(v5, a1, v4);
  sub_100021C50();
  if (v7)
  {
    NSString v8 = sub_100021D90();
    swift_bridgeObjectRelease();
    [a2 setDisplayName:v8];
  }
  sub_100021C20();
  if (v9)
  {
    NSString v10 = sub_100021D90();
    swift_bridgeObjectRelease();
    [a2 setMerchantDetailedCategory:v10];
  }
  uint64_t v11 = sub_100019DA8((uint64_t)v26, (uint64_t)v25);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000188B8(&qword_100037838);
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v4);
    [a2 setMapsMerchantID:sub_100021C40()];
    strcpy((char *)v25, "mapsMerchant-");
    HIWORD(v25[3]) = -4864;
    uint64_t v24 = sub_100021C40();
    v27._countAndFlagsBits = sub_100021F60();
    sub_100021DC0(v27);
    swift_bridgeObjectRelease();
    NSString v14 = sub_100021D90();
    swift_bridgeObjectRelease();
    [a2 setMerchantUniqueIdentifier:v14];

    uint64_t v15 = sub_100021C30();
    if ((v15 & 0x100000000) == 0) {
      [a2 setMapsMerchantResultProviderID:v15];
    }
  }
  else
  {
    sub_100019DA8((uint64_t)v26, (uint64_t)v25);
    uint64_t v16 = sub_100021C60();
    uint64_t v17 = *(void *)(v16 - 8);
    __chkstk_darwin(v16);
    uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (swift_dynamicCast())
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      [a2 setMapsMerchantBrandID:sub_100021C40()];
      strcpy((char *)v25, "mapsBrand-");
      HIBYTE(v25[2]) = 0;
      v25[3] = -369098752;
      uint64_t v24 = sub_100021C40();
      v28._countAndFlagsBits = sub_100021F60();
      sub_100021DC0(v28);
      swift_bridgeObjectRelease();
      NSString v20 = sub_100021D90();
      swift_bridgeObjectRelease();
      [a2 setMerchantUniqueIdentifier:v20];

      uint64_t v21 = sub_100021C30();
      if ((v21 & 0x100000000) == 0) {
        [a2 setMapsMerchantBrandResultProviderID:v21];
      }
    }
  }
  return sub_100019E0C((uint64_t)v26);
}

uint64_t sub_100019448(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100021C60();
  v26[3] = v4;
  v26[4] = (uint64_t)&protocol witness table for MapsBrand;
  uint64_t v5 = sub_100019D44(v26);
  uint64_t v6 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(v5, a1, v4);
  sub_100021C50();
  if (v7)
  {
    NSString v8 = sub_100021D90();
    swift_bridgeObjectRelease();
    [a2 setDisplayName:v8];
  }
  sub_100021C20();
  if (v9)
  {
    NSString v10 = sub_100021D90();
    swift_bridgeObjectRelease();
    [a2 setMerchantDetailedCategory:v10];
  }
  sub_100019DA8((uint64_t)v26, (uint64_t)v25);
  uint64_t v11 = sub_100021810();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  NSString v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000188B8(&qword_100037838);
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    [a2 setMapsMerchantID:sub_100021C40()];
    strcpy((char *)v25, "mapsMerchant-");
    HIWORD(v25[3]) = -4864;
    uint64_t v24 = sub_100021C40();
    v27._countAndFlagsBits = sub_100021F60();
    sub_100021DC0(v27);
    swift_bridgeObjectRelease();
    NSString v15 = sub_100021D90();
    swift_bridgeObjectRelease();
    [a2 setMerchantUniqueIdentifier:v15];

    uint64_t v16 = sub_100021C30();
    if ((v16 & 0x100000000) == 0) {
      [a2 setMapsMerchantResultProviderID:v16];
    }
  }
  else
  {
    uint64_t v17 = sub_100019DA8((uint64_t)v26, (uint64_t)v25);
    __chkstk_darwin(v17);
    uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (swift_dynamicCast())
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v19, v4);
      [a2 setMapsMerchantBrandID:sub_100021C40()];
      strcpy((char *)v25, "mapsBrand-");
      HIBYTE(v25[2]) = 0;
      v25[3] = -369098752;
      uint64_t v24 = sub_100021C40();
      v28._countAndFlagsBits = sub_100021F60();
      sub_100021DC0(v28);
      swift_bridgeObjectRelease();
      NSString v20 = sub_100021D90();
      swift_bridgeObjectRelease();
      [a2 setMerchantUniqueIdentifier:v20];

      uint64_t v21 = sub_100021C30();
      if ((v21 & 0x100000000) == 0) {
        [a2 setMapsMerchantBrandResultProviderID:v21];
      }
    }
  }
  return sub_100019E0C((uint64_t)v26);
}

uint64_t sub_100019898(unsigned __int16 a1)
{
  uint64_t v1 = 5;
  if (a1 - 8000 < 0xFFFFFF38) {
    uint64_t v1 = 0;
  }
  if (a1 - 7800 > 0xFFFFF8F7) {
    uint64_t v1 = 4;
  }
  if (a1 - 6000 > 0xFFFFFE6F) {
    uint64_t v1 = 2;
  }
  if (a1 - 4800 <= 0xFFFFFCDF) {
    return v1;
  }
  else {
    return 7;
  }
}

uint64_t sub_1000198F0(uint64_t a1)
{
  uint64_t v2 = sub_100021940();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (&enum case for TransactionType.unknown(_:) && v6 == enum case for TransactionType.unknown(_:)) {
    return 16;
  }
  if (&enum case for TransactionType.adjustment(_:) && v6 == enum case for TransactionType.adjustment(_:)) {
    return 7;
  }
  if (&enum case for TransactionType.atm(_:) && v6 == enum case for TransactionType.atm(_:)) {
    return 16;
  }
  if (&enum case for TransactionType.billPayment(_:) && v6 == enum case for TransactionType.billPayment(_:)) {
    return 10;
  }
  if (&enum case for TransactionType.check(_:) && v6 == enum case for TransactionType.check(_:)) {
    return 22;
  }
  if (&enum case for TransactionType.deposit(_:) && v6 == enum case for TransactionType.deposit(_:)
    || &enum case for TransactionType.directDeposit(_:) && v6 == enum case for TransactionType.directDeposit(_:))
  {
    return 6;
  }
  if (&enum case for TransactionType.dividend(_:) && v6 == enum case for TransactionType.dividend(_:)) {
    return 17;
  }
  if (&enum case for TransactionType.fee(_:) && v6 == enum case for TransactionType.fee(_:)) {
    return 4;
  }
  if (&enum case for TransactionType.interest(_:) && v6 == enum case for TransactionType.interest(_:)) {
    return 11;
  }
  if (&enum case for TransactionType.pointOfSale(_:) && v6 == enum case for TransactionType.pointOfSale(_:)) {
    return 0;
  }
  if (&enum case for TransactionType.transfer(_:) && v6 == enum case for TransactionType.transfer(_:)) {
    return 21;
  }
  if (&enum case for TransactionType.withdrawal(_:) && v6 == enum case for TransactionType.withdrawal(_:)) {
    return 5;
  }
  if (&enum case for TransactionType.standingOrder(_:) && v6 == enum case for TransactionType.standingOrder(_:)) {
    return 19;
  }
  if (&enum case for TransactionType.directDebit(_:) && v6 == enum case for TransactionType.directDebit(_:)) {
    return 20;
  }
  if (&enum case for TransactionType.loan(_:) && v6 == enum case for TransactionType.loan(_:)) {
    return 18;
  }
  if (!&enum case for TransactionType.refund(_:) || v6 != enum case for TransactionType.refund(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 16;
  }
  return 1;
}

unint64_t sub_100019BF8()
{
  unint64_t result = qword_100037800;
  if (!qword_100037800)
  {
    sub_100021A90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100037800);
  }
  return result;
}

uint64_t sub_100019C44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000188B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100019CA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000188B8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100019D04()
{
  unint64_t result = qword_100037830;
  if (!qword_100037830)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100037830);
  }
  return result;
}

uint64_t *sub_100019D44(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100019DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100019E0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100019E5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000188B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100019EC0()
{
  uint64_t v0 = sub_100021D60();
  sub_10001A088(v0, static Logger.core);
  sub_100019FA8(v0, (uint64_t)static Logger.core);
  return sub_100021D50();
}

uint64_t Logger.core.unsafeMutableAddressor()
{
  if (qword_100037998 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100021D60();
  return sub_100019FA8(v0, (uint64_t)static Logger.core);
}

uint64_t sub_100019FA8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.core.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_100037998 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100021D60();
  uint64_t v3 = sub_100019FA8(v2, (uint64_t)static Logger.core);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t *sub_10001A088(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001A0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[28] = a5;
  v7[29] = a6;
  v7[26] = a3;
  v7[27] = a4;
  v7[24] = a1;
  v7[25] = a2;
  NSString v10 = (uint64_t (*)(void))(*(void *)((swift_isaMask & *v6) + 0x58) + **(int **)((swift_isaMask & *v6) + 0x58));
  uint64_t v8 = (void *)swift_task_alloc();
  v7[30] = v8;
  void *v8 = v7;
  v8[1] = sub_10001A1FC;
  return v10();
}

uint64_t sub_10001A1FC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 248) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10001A2FC, 0, 0);
}

uint64_t sub_10001A2FC()
{
  uint64_t v63 = v0;
  uint64_t v1 = (void (*)(void *))v0[28];
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_10001E908(v2);
  swift_bridgeObjectRelease();
  v1(v3);
  swift_release();
  uint64_t v4 = Logger.core.unsafeMutableAddressor();
  v0[32] = v4;
  uint64_t v5 = sub_100021D60();
  v0[33] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  v0[34] = v6;
  v0[35] = *(void *)(v6 + 64);
  uint64_t v8 = swift_task_alloc();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v0[36] = v9;
  v0[37] = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v61 = v4;
  uint64_t v60 = v9;
  v9(v8, v4, v5);
  swift_bridgeObjectRetain_n();
  NSString v10 = sub_100021D40();
  os_log_type_t v11 = sub_100021E90();
  uint64_t v59 = v7;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    v62[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_10001EAA8(0, &qword_1000378A0);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100021D80();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    v0[23] = sub_10001DB3C(v13, v15, v62);
    sub_100021EC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "FinanceKitDataStore : fhAccountsDict = %s ", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v59;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v16(v8, v5);
  v0[38] = v16;
  unint64_t v17 = v0[25];
  swift_task_dealloc();
  uint64_t v18 = swift_task_alloc();
  v60(v18, v61, v5);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = sub_100021D40();
  os_log_type_t v20 = sub_100021E90();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = v0[24];
    uint64_t v21 = v0[25];
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    v62[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    if (v21)
    {
      unint64_t v24 = v17;
    }
    else
    {
      uint64_t v22 = 7104878;
      unint64_t v24 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    v0[22] = sub_10001DB3C(v22, v24, v62);
    sub_100021EC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "FinanceKitDataStore : fetching transactions since token = %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v16(v18, v5);
  swift_task_dealloc();
  if (&protocol conformance descriptor for FinanceStore.HistoryToken) {
    BOOL v25 = &protocol conformance descriptor for FinanceStore.HistoryToken == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (v25
    || &type metadata accessor for FinanceStore.HistoryToken == 0
    || &type metadata for FinanceStore.HistoryToken == 0
    || &nominal type descriptor for FinanceStore.HistoryToken == 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = swift_task_alloc();
    v60(v39, v61, v5);
    int v40 = sub_100021D40();
    os_log_type_t v41 = sub_100021EA0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "FinanceKitDataStore : Failed to load symbol FinanceStore history token", v42, 2u);
      swift_slowDealloc();
    }

    v16(v39, v5);
  }
  else
  {
    uint64_t v29 = v0[25];
    sub_1000188B8(&qword_100037848);
    uint64_t v30 = swift_task_alloc();
    v0[39] = v30;
    uint64_t v31 = sub_1000216E0();
    v0[40] = v31;
    uint64_t v32 = *(void *)(v31 - 8);
    v0[41] = v32;
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
    v33(v30, 1, 1, v31);
    if (v29)
    {
      uint64_t v34 = sub_100021CE0();
      if (v35 >> 60 != 15)
      {
        uint64_t v36 = v34;
        unint64_t v37 = v35;
        uint64_t v38 = swift_task_alloc();
        sub_100021C90();
        swift_allocObject();
        sub_100021C80();
        sub_10001EA4C(&qword_100037898, (void (*)(uint64_t))&type metadata accessor for FinanceStore.HistoryToken);
        sub_100021C70();
        sub_100019CA8(v30, &qword_100037848);
        swift_release();
        sub_10001EA94(v36, v37);
        v33(v38, 0, 1, v31);
        sub_100019E5C(v38, v30, &qword_100037848);
        swift_task_dealloc();
      }
    }
    if (&async function pointer to FinanceStore.insights(transactionID:)) {
      BOOL v43 = &FinanceStore.insights(transactionID:) == 0;
    }
    else {
      BOOL v43 = 1;
    }
    if (!v43 && &FinanceStore.internalTransactions(for:since:isMonitoring:) != 0)
    {
      uint64_t v50 = sub_100021C10();
      v0[42] = v50;
      v0[43] = *(void *)(v50 - 8);
      v0[44] = swift_task_alloc();
      v0[45] = sub_100021770();
      sub_100021710();
      sub_1000188B8(&qword_100037850);
      uint64_t v51 = swift_task_alloc();
      uint64_t v52 = sub_100021D30();
      v0[46] = v52;
      uint64_t v53 = *(void *)(v52 - 8);
      v0[47] = v53;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(v51, 1, 1, v52);
      sub_100021700();
      sub_100019CA8(v51, &qword_100037850);
      swift_release();
      swift_task_dealloc();
      sub_100021C00();
      swift_release();
      sub_1000188B8(&qword_100037858);
      v0[48] = swift_task_alloc();
      uint64_t v55 = sub_10001EA4C(&qword_100037860, (void (*)(uint64_t))&type metadata accessor for InternalTransactionAsyncSequence.Iterator);
      uint64_t v56 = (void *)swift_task_alloc();
      v0[49] = v56;
      *uint64_t v56 = v0;
      v56[1] = sub_10001ADF0;
      uint64_t v57 = v0[48];
      uint64_t v58 = v0[42];
      return dispatch thunk of AsyncIteratorProtocol.next()(v57, v58, v55);
    }
    swift_bridgeObjectRelease();
    uint64_t v45 = swift_task_alloc();
    v60(v45, v61, v5);
    long long v46 = sub_100021D40();
    os_log_type_t v47 = sub_100021EA0();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "FinanceKitDataStore : Failed to load symbol FinanceStore.shared.internalTransactions(for:since:isMonitoring:) or FinanceStore.shared.insights(transactionID:)", v48, 2u);
      swift_slowDealloc();
    }

    v16(v45, v5);
    sub_100019CA8(v30, &qword_100037848);
    swift_task_dealloc();
  }
  swift_task_dealloc();
  uint64_t v49 = (uint64_t (*)(void))v0[1];
  return v49();
}

uint64_t sub_10001ADF0()
{
  *(void *)(*(void *)v1 + 400) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10001B918;
  }
  else {
    uint64_t v2 = sub_10001AF04;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001AF04()
{
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v2 = sub_1000188B8(&qword_100037870);
  *(void *)(v0 + 408) = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = v3;
  *(void *)(v0 + 416) = v3;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v6 = *(void *)(v0 + 344);
    uint64_t v5 = *(void *)(v0 + 352);
    uint64_t v7 = *(void *)(v0 + 336);
    uint64_t v8 = *(void *)(v0 + 312);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    sub_100019CA8(v8, &qword_100037848);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
LABEL_20:
    return v9();
  }
  else
  {
    uint64_t v68 = (void *)(v0 + 136);
    os_log_type_t v10 = v0 - 104;
    *(void *)(v0 + 424) = swift_task_alloc();
    uint64_t v12 = *(void (**)(void))(v4 + 32);
    uint64_t v11 = v4 + 32;
    v12();
    *(void *)(v0 + 168) = _swiftEmptyArrayStorage;
    sub_1000188B8(&qword_100037878);
    uint64_t inited = swift_initStackObject();
    *(void *)(v0 + 432) = inited;
    *(_OWORD *)(inited + 16) = xmmword_100026BD0;
    *(void *)(inited + 32) = sub_100021740();
    *(void *)(inited + 40) = sub_100021730();
    unint64_t v14 = &qword_100037880;
    *(void *)(v0 + 440) = *(void *)(*(void *)(sub_1000188B8(&qword_100037880) - 8) + 64);
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    *(void *)(v0 + 448) = swift_task_alloc();
    uint64_t v17 = *(void *)(v0 + 400);
    *(void *)(v0 + 456) = 0;
    for (*(void *)(v0 + 464) = 0; ; unint64_t v16 = *(void *)(v0 + 464))
    {
      do
      {
        if (v16 == 2)
        {
          uint64_t v60 = (void *)(v0 + 160);
          uint64_t v65 = (void *)(v0 + 168);
          uint64_t v21 = *(void *)(v0 + 448);
          uint64_t v22 = sub_100021A80();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
          swift_bridgeObjectRelease();
          goto LABEL_13;
        }
        uint64_t v19 = *(void *)(v0 + 432);
        if (v16 >= *(void *)(v19 + 16))
        {
          __break(1u);
LABEL_30:
          swift_bridgeObjectRetain();
          uint64_t v35 = sub_100021F10();
          swift_bridgeObjectRelease();
LABEL_16:
          *(void *)(v0 + 152) = v35;
          sub_100021EC0();
          *(_WORD *)(v11 + 12) = 2048;
          *uint64_t v60 = v68[2];
          sub_100021EC0();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v15, v10, "FinanceKitDataStore : batch transactions update count = %ld deleted count = %ld", (uint8_t *)v11, 0x16u);
          swift_slowDealloc();
          goto LABEL_18;
        }
        uint64_t v20 = v19 + 8 * v16++;
        unint64_t v15 = *(NSObject **)(v20 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)(v0 + 456) = v15;
        *(void *)(v0 + 464) = v16;
      }
      while (!v15);
      *(void *)(v0 + 472) = 0;
      uint64_t v11 = swift_task_alloc();
      if (v15[2].isa) {
        break;
      }
      uint64_t v18 = sub_100021A80();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 1, 1, v18);
      sub_100019CA8(v11, &qword_100037880);
      swift_task_dealloc();
    }
    uint64_t v23 = *(void *)(v0 + 448);
    uint64_t v24 = sub_100021A80();
    *(void *)(v0 + 480) = v24;
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = v25;
    *(void *)(v0 + 488) = v25;
    Swift::String v27 = (char *)v15 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    uint64_t v29 = v25 + 16;
    Swift::String v28 = *(void (**)(uint64_t, char *, uint64_t))(v25 + 16);
    *(void *)(v0 + 496) = v28;
    *(void *)(v0 + 504) = v29 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v28(v11, v27, v24);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v11, 0, 1, v24);
    sub_100019E5C(v11, v23, &qword_100037880);
    swift_task_dealloc();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v23, 1, v24) != 1)
    {
      uint64_t v57 = *(void *)(v0 + 376);
      *(void *)(v0 + 512) = *(void *)(v26 + 64);
      *(void *)(v0 + 520) = swift_task_alloc();
      (*(void (**)(void))(v26 + 32))();
      *(void *)(v0 + 528) = sub_100021710();
      *(void *)(v0 + 536) = *(void *)(v57 + 64);
      uint64_t v58 = swift_task_alloc();
      *(void *)(v0 + 544) = v58;
      sub_100021A50();
      uint64_t v59 = (void *)swift_task_alloc();
      *(void *)(v0 + 552) = v59;
      *uint64_t v59 = v0;
      v59[1] = sub_10001BA58;
      return FinanceStore.insights(transactionID:)(v58);
    }
    uint64_t v60 = (void *)(v0 + 160);
    uint64_t v65 = (void *)(v0 + 168);
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v30 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v0 + 288);
    uint64_t v32 = *(void *)(v0 + 256);
    uint64_t v31 = *(void *)(v0 + 264);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v33 = sub_100021720();
    uint64_t v34 = sub_10001C78C(v33);
    swift_bridgeObjectRelease();
    unint64_t v14 = (uint64_t *)swift_task_alloc();
    v30(v14, v32, v31);
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_100021D40();
    os_log_type_t v10 = sub_100021E90();
    uint64_t v68 = v34;
    if (os_log_type_enabled(v15, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134218240;
      swift_beginAccess();
      if (*v65 >> 62) {
        goto LABEL_30;
      }
      uint64_t v35 = *(void *)((*v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
LABEL_18:

    (*(void (**)(uint64_t *, void))(v0 + 304))(v14, *(void *)(v0 + 264));
    swift_task_dealloc();
    sub_100021CC0();
    swift_allocObject();
    sub_100021CB0();
    uint64_t v36 = swift_task_alloc();
    sub_100021750();
    sub_10001EA4C(&qword_100037888, (void (*)(uint64_t))&type metadata accessor for FinanceStore.HistoryToken);
    uint64_t v37 = sub_100021CA0();
    if (v17)
    {
      uint64_t v40 = *(void *)(v0 + 416);
      uint64_t v39 = *(void *)(v0 + 424);
      uint64_t v41 = *(void *)(v0 + 344);
      uint64_t v63 = *(void *)(v0 + 352);
      uint64_t v42 = *(void *)(v0 + 328);
      uint64_t v61 = *(void *)(v0 + 408);
      uint64_t v62 = *(void *)(v0 + 336);
      uint64_t v43 = *(void *)(v0 + 320);
      uint64_t v66 = *(void *)(v0 + 312);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v36, v43);
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v61);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v63, v62);
      sub_100019CA8(v66, &qword_100037848);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_20;
    }
    uint64_t v45 = v37;
    unint64_t v46 = v38;
    uint64_t v47 = *(void *)(v0 + 416);
    uint64_t v67 = *(void *)(v0 + 424);
    uint64_t v64 = *(void *)(v0 + 408);
    uint64_t v48 = *(void (**)(uint64_t, void *, uint64_t, uint64_t))(v0 + 208);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 328) + 8))(v36, *(void *)(v0 + 320));
    swift_release();
    swift_task_dealloc();
    uint64_t v49 = sub_100021CF0(0);
    uint64_t v51 = v50;
    swift_beginAccess();
    uint64_t v52 = swift_bridgeObjectRetain();
    v48(v52, v68, v49, v51);
    swift_bridgeObjectRelease();
    sub_10001E9F4(v45, v46);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v67, v64);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v53 = sub_10001EA4C(&qword_100037860, (void (*)(uint64_t))&type metadata accessor for InternalTransactionAsyncSequence.Iterator);
    int v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 392) = v54;
    void *v54 = v0;
    v54[1] = sub_10001ADF0;
    uint64_t v55 = *(void *)(v0 + 384);
    uint64_t v56 = *(void *)(v0 + 336);
    return dispatch thunk of AsyncIteratorProtocol.next()(v55, v56, v53);
  }
}

uint64_t sub_10001B918()
{
  *(void *)(v0 + 144) = *(void *)(v0 + 400);
  sub_1000188B8(&qword_100037868);
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001B9B0, 0, 0);
}

uint64_t sub_10001B9B0()
{
  uint64_t v1 = v0[39];
  (*(void (**)(void, void))(v0[43] + 8))(v0[44], v0[42]);
  sub_100019CA8(v1, &qword_100037848);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_10001BA58(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = (void *)*v2;
  v4[70] = a1;
  v4[71] = v1;
  swift_task_dealloc();
  uint64_t v5 = v3[68];
  if (v1)
  {
    uint64_t v6 = v4[46];
    uint64_t v7 = v4[47];
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_10001C64C;
  }
  else
  {
    uint64_t v9 = v4[46];
    uint64_t v10 = v4[47];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v4[72] = v11;
    v4[73] = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v11(v5, v9);
    swift_release();
    swift_task_dealloc();
    uint64_t v8 = sub_10001BC38;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_10001BC38()
{
  unint64_t v77 = (void *)(v0 + 168);
  uint64_t v76 = *(void **)(v0 + 584);
  uint64_t v1 = *(uint64_t **)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 520);
  uint64_t v3 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v0 + 496);
  uint64_t v4 = *(void *)(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v6 = *(void *)(v0 + 248);
  uint64_t v7 = (uint64_t *)swift_task_alloc();
  v3(v7, v2, v4);
  uint64_t v8 = swift_task_alloc();
  sub_100021A70();
  uint64_t v9 = sub_100021D20();
  uint64_t v11 = v10;
  ((void (*)(uint64_t, uint64_t))v1)(v8, v5);
  if (*(void *)(v6 + 16) && (unint64_t v12 = sub_10001E194(v9, v11), (v13 & 1) != 0))
  {
    unint64_t v14 = *(void **)(*(void *)(*(void *)(v0 + 248) + 56) + 8 * v12);
    id v15 = v14;
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v16 = v0 + 168;
  uint64_t v17 = (void *)(v0 + 88);
  uint64_t v18 = *(void *)(v0 + 560);
  swift_bridgeObjectRelease();
  sub_10001EAA8(0, &qword_100037890);
  LOBYTE(v19) = sub_100016998(v7, v14, v18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_beginAccess();
  sub_100021DF0();
  if (*(void *)((*(void *)(v0 + 168) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 168) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
LABEL_34:
    sub_100021E20();
  uint64_t v20 = *(void *)(v0 + 520);
  uint64_t v22 = *(void *)(v0 + 480);
  uint64_t v21 = *(void *)(v0 + 488);
  sub_100021E30();
  sub_100021E10();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  swift_task_dealloc();
  uint64_t v23 = *(void *)(v0 + 568);
  unint64_t v24 = *(void *)(v0 + 472) + 1;
  *(void *)(v0 + 472) = v24;
  uint64_t v25 = *(NSObject **)(v0 + 456);
  uint64_t v26 = swift_task_alloc();
  Class isa = v25[2].isa;
  if ((Class)v24 == isa)
  {
    uint64_t v28 = sub_100021A80();
    uint64_t v29 = *(void *)(v28 - 8);
    uint64_t v16 = *(void *)(v29 + 56);
    uint64_t v17 = (void *)(v29 + 56);
    uint64_t v19 = &qword_100037880;
    while (2)
    {
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v16)(v26, 1, 1, v28);
      sub_100019CA8(v26, &qword_100037880);
      swift_task_dealloc();
      unint64_t v30 = *(void *)(v0 + 464);
      do
      {
        if (v30 == 2)
        {
          ((void (*)(void, uint64_t, uint64_t, uint64_t))v16)(*(void *)(v0 + 448), 1, 1, v28);
          swift_bridgeObjectRelease();
          goto LABEL_18;
        }
        uint64_t v31 = *(void *)(v0 + 432);
        if (v30 >= *(void *)(v31 + 16))
        {
          __break(1u);
          goto LABEL_34;
        }
        uint64_t v1 = (uint64_t *)(v30 + 1);
        uint64_t v25 = *(NSObject **)(v31 + 8 * v30 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)(v0 + 456) = v25;
        *(void *)(v0 + 464) = v1;
        unint64_t v30 = (unint64_t)v1;
      }
      while (!v25);
      *(void *)(v0 + 472) = 0;
      uint64_t v26 = swift_task_alloc();
      Class isa = v25[2].isa;
      if (!isa) {
        continue;
      }
      break;
    }
    unint64_t v24 = 0;
  }
  if (v24 >= (unint64_t)isa)
  {
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v32 = *(void *)(v0 + 448);
  uint64_t v33 = sub_100021A80();
  *(void *)(v0 + 480) = v33;
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = v34;
  *(void *)(v0 + 488) = v34;
  unint64_t v36 = (unint64_t)v25
      + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))
      + *(void *)(v34 + 72) * v24;
  uint64_t v38 = v34 + 16;
  uint64_t v37 = *(void (**)(uint64_t, unint64_t, uint64_t))(v34 + 16);
  *(void *)(v0 + 496) = v37;
  *(void *)(v0 + 504) = v38 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v37(v26, v36, v33);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v26, 0, 1, v33);
  sub_100019E5C(v26, v32, &qword_100037880);
  swift_task_dealloc();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v32, 1, v33) == 1)
  {
    swift_bridgeObjectRelease();
LABEL_18:
    long long v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
    uint64_t v40 = *(void *)(v0 + 256);
    uint64_t v39 = *(void *)(v0 + 264);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v41 = sub_100021720();
    uint64_t v42 = sub_10001C78C(v41);
    swift_bridgeObjectRelease();
    uint64_t v26 = swift_task_alloc();
    v73(v26, v40, v39);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_100021D40();
    LOBYTE(v19) = sub_100021E90();
    uint64_t v76 = v42;
    if (!os_log_type_enabled(v25, (os_log_type_t)v19))
    {
      swift_bridgeObjectRelease();
LABEL_23:

      (*(void (**)(uint64_t, void))(v0 + 304))(v26, *(void *)(v0 + 264));
      swift_task_dealloc();
      sub_100021CC0();
      swift_allocObject();
      sub_100021CB0();
      uint64_t v44 = swift_task_alloc();
      sub_100021750();
      sub_10001EA4C(&qword_100037888, (void (*)(uint64_t))&type metadata accessor for FinanceStore.HistoryToken);
      uint64_t v45 = sub_100021CA0();
      if (v23)
      {
        uint64_t v48 = *(void *)(v0 + 416);
        uint64_t v47 = *(void *)(v0 + 424);
        uint64_t v49 = *(void *)(v0 + 344);
        uint64_t v50 = *(void *)(v0 + 328);
        uint64_t v69 = *(void *)(v0 + 408);
        uint64_t v70 = *(void *)(v0 + 336);
        uint64_t v51 = *(void *)(v0 + 320);
        uint64_t v71 = *(void *)(v0 + 352);
        uint64_t v74 = *(void *)(v0 + 312);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v44, v51);
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v69);
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v71, v70);
        sub_100019CA8(v74, &qword_100037848);
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v52 = *(uint64_t (**)(void))(v0 + 8);
        return v52();
      }
      else
      {
        uint64_t v54 = v45;
        unint64_t v55 = v46;
        uint64_t v56 = *(void *)(v0 + 416);
        uint64_t v72 = *(void *)(v0 + 408);
        uint64_t v75 = *(void *)(v0 + 424);
        uint64_t v57 = *(void (**)(uint64_t, void *, uint64_t, uint64_t))(v0 + 208);
        (*(void (**)(uint64_t, void))(*(void *)(v0 + 328) + 8))(v44, *(void *)(v0 + 320));
        swift_release();
        swift_task_dealloc();
        uint64_t v58 = sub_100021CF0(0);
        uint64_t v60 = v59;
        swift_beginAccess();
        uint64_t v61 = swift_bridgeObjectRetain();
        v57(v61, v76, v58, v60);
        swift_bridgeObjectRelease();
        sub_10001E9F4(v54, v55);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v75, v72);
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        uint64_t v62 = sub_10001EA4C(&qword_100037860, (void (*)(uint64_t))&type metadata accessor for InternalTransactionAsyncSequence.Iterator);
        uint64_t v63 = (void *)swift_task_alloc();
        *(void *)(v0 + 392) = v63;
        *uint64_t v63 = v0;
        v63[1] = sub_10001ADF0;
        uint64_t v64 = *(void *)(v0 + 384);
        uint64_t v65 = *(void *)(v0 + 336);
        return dispatch thunk of AsyncIteratorProtocol.next()(v64, v65, v62);
      }
    }
    uint64_t v1 = (uint64_t *)(v0 + 152);
    uint64_t v17 = (void *)(v0 + 160);
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134218240;
    swift_beginAccess();
    if (!(*v77 >> 62))
    {
      uint64_t v43 = *(void *)((*v77 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_21:
      uint64_t *v1 = v43;
      sub_100021EC0();
      *(_WORD *)(v16 + 12) = 2048;
      void *v17 = v76[2];
      sub_100021EC0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, (os_log_type_t)v19, "FinanceKitDataStore : batch transactions update count = %ld deleted count = %ld", (uint8_t *)v16, 0x16u);
      swift_slowDealloc();
      goto LABEL_23;
    }
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_100021F10();
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v66 = *(void *)(v0 + 376);
  *(void *)(v0 + 512) = *(void *)(v35 + 64);
  *(void *)(v0 + 520) = swift_task_alloc();
  (*(void (**)(void))(v35 + 32))();
  *(void *)(v0 + 528) = sub_100021710();
  *(void *)(v0 + 536) = *(void *)(v66 + 64);
  uint64_t v67 = swift_task_alloc();
  *(void *)(v0 + 544) = v67;
  sub_100021A50();
  uint64_t v68 = (void *)swift_task_alloc();
  *(void *)(v0 + 552) = v68;
  *uint64_t v68 = v0;
  v68[1] = sub_10001BA58;
  return FinanceStore.insights(transactionID:)(v67);
}

uint64_t sub_10001C64C()
{
  uint64_t v2 = v0[52];
  uint64_t v1 = v0[53];
  uint64_t v3 = v0[51];
  uint64_t v4 = v0[43];
  uint64_t v5 = v0[44];
  uint64_t v6 = v0[42];
  uint64_t v7 = v0[39];
  (*(void (**)(void, void))(v0[61] + 8))(v0[65], v0[60]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  sub_100019CA8(v7, &qword_100037848);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

void *sub_10001C78C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10001E2F0(0, v1, 0);
    uint64_t v3 = *(void *)(sub_100021D30() - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    do
    {
      uint64_t v6 = sub_100021D20();
      uint64_t v8 = v7;
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      if (v10 >= v9 >> 1) {
        sub_10001E2F0(v9 > 1, v10 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v10 + 1;
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage[2 * v10];
      *((void *)v11 + 4) = v6;
      *((void *)v11 + 5) = v8;
      v4 += v5;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10001CA6C(uint64_t a1, void *aBlock, const void *a3, const void *a4, void *a5)
{
  v5[2] = a5;
  unint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = _Block_copy(a3);
  v5[3] = _Block_copy(a4);
  if (a1)
  {
    a1 = sub_100021DA0();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v5[4] = v13;
  uint64_t v14 = swift_allocObject();
  v5[5] = v14;
  *(void *)(v14 + 16) = v10;
  uint64_t v15 = swift_allocObject();
  v5[6] = v15;
  *(void *)(v15 + 16) = v11;
  a5;
  uint64_t v16 = (void *)swift_task_alloc();
  v5[7] = v16;
  void *v16 = v5;
  v16[1] = sub_10001CBE4;
  return sub_10001A0EC(a1, v13, (uint64_t)sub_10001FFC0, v14, (uint64_t)sub_10001FFC8, v15);
}

uint64_t sub_10001CBE4()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_100021CD0();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(void, void))(v7 + 16))(*(void *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  unint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

void sub_10001CDC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10001EAA8(0, &qword_100037890);
  Class isa = sub_100021E00().super.isa;
  Class v7 = sub_100021E00().super.isa;
  id v8 = sub_100021D90();
  (*(void (**)(uint64_t, Class, Class, id))(a5 + 16))(a5, isa, v7, v8);
}

void sub_10001CE90(uint64_t a1, uint64_t a2)
{
  sub_10001EAA8(0, &qword_1000378A0);
  Class isa = sub_100021E00().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

uint64_t sub_10001CF0C()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000378B0 + dword_1000378B0);
  int64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10001CFAC;
  return v3();
}

uint64_t sub_10001CFAC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unint64_t sub_10001D0A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000188B8(&qword_100037950);
  uint64_t v2 = (void *)sub_100021F40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    Class v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10001E194(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001D32C(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000378B0 + dword_1000378B0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10001D3D4;
  return v4();
}

uint64_t sub_10001D3D4()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  sub_10001EAA8(0, &qword_1000378A0);
  Class isa = sub_100021D70().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id sub_10001D548()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id sub_10001D57C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FinanceKitDataStore();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001D5F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FinanceKitDataStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001D624(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10002003C;
  return v6();
}

uint64_t sub_10001D6F0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10002003C;
  return v7();
}

uint64_t sub_10001D7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100021E70();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100021E60();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100019CA8(a1, &qword_1000378E0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100021E40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10001D968(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10001DA44;
  return v6(a1);
}

uint64_t sub_10001DA44()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001DB3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001DC10(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001FFD0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001FFD0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100019E0C((uint64_t)v12);
  return v7;
}

uint64_t sub_10001DC10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100021ED0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001DDCC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100021EF0();
  if (!v8)
  {
    sub_100021F00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100021F50();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10001DDCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001DE64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001E044(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001E044(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001DE64(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10001DFDC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100021EE0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100021F00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100021DD0();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_100021F50();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100021F00();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001DFDC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000188B8(&qword_100037958);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001E044(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000188B8(&qword_100037958);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100021F50();
  __break(1u);
  return result;
}

unint64_t sub_10001E194(uint64_t a1, uint64_t a2)
{
  sub_100021F90();
  sub_100021DB0();
  Swift::Int v4 = sub_100021FA0();
  return sub_10001E20C(a1, a2, v4);
}

unint64_t sub_10001E20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100021F70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100021F70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10001E2F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001E310(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001E310(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000188B8(&qword_100037960);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100021F50();
  __break(1u);
  return result;
}

uint64_t sub_10001E47C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000188B8(&qword_100037950);
  char v38 = a2;
  uint64_t v6 = sub_100021F30();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v36;
        if ((v38 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v37 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v30 = v29;
    }
    sub_100021F90();
    sub_100021DB0();
    uint64_t result = sub_100021FA0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v17 == v32;
        if (v17 == v32) {
          unint64_t v17 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *uint64_t v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_10001E76C()
{
  id v1 = v0;
  sub_1000188B8(&qword_100037950);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100021F20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_10001E908(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000188B8(&qword_100037968);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_10001EAE4(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100020030();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10001E9F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10001EA4C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001EA94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001E9F4(a1, a2);
  }
  return a1;
}

uint64_t sub_10001EAA8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void *sub_10001EAE4(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    unint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10001ECE0()
{
  return _swift_task_switch(sub_10001ECFC, 0, 0);
}

uint64_t sub_10001ECFC()
{
  uint64_t v1 = Logger.core.unsafeMutableAddressor();
  v0[4] = v1;
  uint64_t v2 = sub_100021D60();
  v0[5] = v2;
  uint64_t v3 = *(void **)(v2 - 8);
  v0[6] = v3[8];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void (*)(uint64_t, uint64_t, uint64_t))v3[2];
  v0[7] = v5;
  v0[8] = (unint64_t)(v3 + 2) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v4, v1, v2);
  uint64_t v6 = sub_100021D40();
  os_log_type_t v7 = sub_100021E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "FinanceKitDataStore : fetching accounts", v8, 2u);
    swift_slowDealloc();
  }

  unint64_t v9 = (void (*)(uint64_t, uint64_t))v3[1];
  v0[9] = v9;
  v0[10] = (unint64_t)(v3 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v4, v2);
  swift_task_dealloc();
  if (&async function pointer to FinanceStore.internalAccounts(with:sortDescriptors:limit:offset:)) {
    BOOL v10 = &FinanceStore.internalAccounts(with:sortDescriptors:limit:offset:) == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v15 = swift_task_alloc();
    v5(v15, v1, v2);
    unint64_t v16 = sub_100021D40();
    os_log_type_t v17 = sub_100021EA0();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "FinanceKitDataStore : Failed to load symbol FinanceStore.shared.internalAccounts(with:sortDescriptors:limit:offset:)", v18, 2u);
      swift_slowDealloc();
    }

    v9(v15, v2);
    swift_task_dealloc();
    unint64_t v19 = sub_10001D0A8((uint64_t)&_swiftEmptyArrayStorage);
    unint64_t v20 = (uint64_t (*)(unint64_t))v0[1];
    return v20(v19);
  }
  else
  {
    uint64_t v11 = sub_100021AD0();
    v0[11] = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    v0[12] = v12;
    v0[13] = *(void *)(v12 + 64);
    uint64_t v13 = swift_task_alloc();
    v0[14] = v13;
    sub_100021770();
    v0[15] = sub_100021710();
    int64_t v14 = (void *)swift_task_alloc();
    v0[16] = v14;
    *int64_t v14 = v0;
    v14[1] = sub_10001F0A0;
    return FinanceStore.internalAccounts(with:sortDescriptors:limit:offset:)(v13, 0, &_swiftEmptyArrayStorage, 0, 1, 0, 1);
  }
}

uint64_t sub_10001F0A0()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001F780;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_10001F1BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001F1BC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = (void *)(v0 + 32);
  uint64_t v3 = v1[10];
  uint64_t v4 = v1[7];
  uint64_t v5 = v1[8];
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))v1[3];
  uint64_t v7 = v1[1];
  uint64_t v8 = swift_task_alloc();
  v6(v8, v2, v7);
  uint64_t v9 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, v3, v4);
  uint64_t v58 = v8;
  BOOL v10 = sub_100021D40();
  os_log_type_t v11 = sub_100021E90();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = *(void *)(v50 + 96);
    uint64_t v56 = *(void *)(v50 + 88);
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    uint64_t v14 = *(void *)(sub_100021AC0() + 16);
    swift_bridgeObjectRelease();
    uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v49(v9, v56);
    swift_task_dealloc();
    *(void *)(v50 + 24) = v14;
    sub_100021EC0();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "FinanceKitDataStore : fetched accounts count = %ld", v13, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    uint64_t v49 = *(void (**)(uint64_t, uint64_t))(*(void *)(v50 + 96) + 8);
    v49(v9, *(void *)(v50 + 88));

    swift_task_dealloc();
  }
  (*(void (**)(uint64_t, void))(v50 + 72))(v58, *(void *)(v50 + 40));
  swift_task_dealloc();
  uint64_t v15 = sub_100021AC0();
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16)
  {
LABEL_19:
    uint64_t v45 = *(void *)(v50 + 112);
    uint64_t v46 = *(void *)(v50 + 88);
    swift_bridgeObjectRelease();
    v49(v45, v46);
    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(void *))(v50 + 8);
    return v47(_swiftEmptyDictionarySingleton);
  }
  uint64_t v17 = v15;
  sub_10001EAA8(0, &qword_1000378A0);
  uint64_t v18 = sub_100021930();
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = v17 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
  uint64_t v54 = (void (**)(uint64_t, unint64_t, uint64_t))(v19 + 16);
  uint64_t v52 = (void (**)(uint64_t, uint64_t))(v19 + 8);
  uint64_t v51 = *(void *)(v19 + 72);
  uint64_t v53 = v18;
  while (1)
  {
    uint64_t v57 = v16;
    uint64_t v23 = swift_task_alloc();
    int64_t v24 = *v54;
    unint64_t v55 = v20;
    (*v54)(v23, v20, v18);
    uint64_t v25 = sub_100021D30();
    uint64_t v26 = *(void *)(v25 - 8);
    uint64_t v27 = swift_task_alloc();
    sub_100021910();
    uint64_t v28 = sub_100021D20();
    uint64_t v30 = v29;
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v25);
    uint64_t v31 = swift_task_alloc();
    v24(v31, v23, v18);
    uint64_t v32 = sub_100020040(v31);
    swift_task_dealloc();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v35 = sub_10001E194(v28, v30);
    uint64_t v36 = _swiftEmptyDictionarySingleton[2];
    BOOL v37 = (v34 & 1) == 0;
    char v38 = (void *)(v36 + v37);
    if (__OFADD__(v36, v37))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v38);
    }
    char v39 = v34;
    if (_swiftEmptyDictionarySingleton[3] < (uint64_t)v38) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v34) {
        goto LABEL_6;
      }
    }
    else
    {
      char v38 = sub_10001E76C();
      if (v39)
      {
LABEL_6:
        uint64_t v21 = _swiftEmptyDictionarySingleton[7];
        uint64_t v22 = *(void **)(v21 + 8 * v35);
        *(void *)(v21 + 8 * v35) = v32;

        goto LABEL_7;
      }
    }
LABEL_15:
    _swiftEmptyDictionarySingleton[(v35 >> 6) + 8] |= 1 << v35;
    uint64_t v41 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v35);
    uint64_t *v41 = v28;
    v41[1] = v30;
    *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v35) = v32;
    uint64_t v42 = _swiftEmptyDictionarySingleton[2];
    BOOL v43 = __OFADD__(v42, 1);
    uint64_t v44 = v42 + 1;
    if (v43) {
      goto LABEL_26;
    }
    _swiftEmptyDictionarySingleton[2] = v44;
    swift_bridgeObjectRetain();
LABEL_7:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v18 = v53;
    (*v52)(v23, v53);
    swift_task_dealloc();
    unint64_t v20 = v55 + v51;
    uint64_t v16 = v57 - 1;
    if (v57 == 1) {
      goto LABEL_19;
    }
  }
  sub_10001E47C((uint64_t)v38, isUniquelyReferenced_nonNull_native);
  char v38 = (void *)sub_10001E194(v28, v30);
  if ((v39 & 1) == (v40 & 1))
  {
    unint64_t v35 = (unint64_t)v38;
    if (v39) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
  char v38 = &type metadata for String;
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v38);
}

uint64_t sub_10001F780()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 32);
  swift_release();
  swift_task_dealloc();
  uint64_t v4 = swift_task_alloc();
  v1(v4, v3, v2);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100021D40();
  os_log_type_t v6 = sub_100021EA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v9;
    sub_100021EC0();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to retrive accounts : %@", v7, 0xCu);
    sub_1000188B8(&qword_100037948);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(uint64_t, void))(v0 + 72))(v4, *(void *)(v0 + 40));
  swift_task_dealloc();
  unint64_t v10 = sub_10001D0A8((uint64_t)&_swiftEmptyArrayStorage);
  swift_errorRelease();
  os_log_type_t v11 = *(uint64_t (**)(unint64_t))(v0 + 8);
  return v11(v10);
}

uint64_t type metadata accessor for FinanceKitDataStore()
{
  return self;
}

uint64_t sub_10001F9BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F9FC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10001FAA8;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_1000378E8 + dword_1000378E8);
  return v4(v2);
}

uint64_t sub_10001FAA8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001FBA0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10002003C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000378F8 + dword_1000378F8);
  return v6(v2, v3, v4);
}

uint64_t sub_10001FC64(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10002003C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100037908 + dword_100037908);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10001FD30()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001FD68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10001FAA8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100037918 + dword_100037918);
  return v6(a1, v4);
}

uint64_t sub_10001FE20()
{
  _Block_release(*(const void **)(v0 + 24));
  _Block_release(*(const void **)(v0 + 32));
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001FE78()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (const void *)v0[4];
  uint64_t v5 = (const void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_10002003C;
  uint64_t v8 = (uint64_t (*)(uint64_t, void *, const void *, const void *, void *))((char *)&dword_100037928
                                                                                   + dword_100037928);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_10001FF48()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001FF88()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001FFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10001CDC4(a1, a2, a3, a4, *(void *)(v4 + 16));
}

void sub_10001FFC8(uint64_t a1)
{
  sub_10001CE90(a1, *(void *)(v1 + 16));
}

uint64_t sub_10001FFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100020030()
{
  return swift_release();
}

uint64_t sub_100020040(uint64_t a1)
{
  sub_1000188B8(&qword_1000377F0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v144 = (char *)&v139 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100021D30();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v139 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  sub_100021910();
  sub_100021D20();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  NSString v8 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v7 setAccountID:v8];

  id v149 = v7;
  [v7 setSourceType:1];
  uint64_t v9 = sub_100021780();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v148 = a1;
  uint64_t v13 = sub_100021880();
  __chkstk_darwin(v13);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)&v139 - v12, (char *)&v139 - v12, v9);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))((char *)&v139 - v12, v9);
  if (&enum case for AccountType.asset(_:) && v14 == enum case for AccountType.asset(_:))
  {
    uint64_t v15 = 0;
  }
  else if (&enum case for AccountType.liability(_:) && v14 == enum case for AccountType.liability(_:))
  {
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))((char *)&v139 - v12, v9);
    uint64_t v15 = -1;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))((char *)&v139 - v12, v9);
  [v149 setAccountCategory:v15];
  uint64_t v16 = sub_100021950();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  __chkstk_darwin(v16);
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = sub_100021870();
  __chkstk_darwin(v20);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)&v139 - v19, (char *)&v139 - v19, v16);
  int v21 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))((char *)&v139 - v19, v16);
  if (&enum case for AccountOriginType.bankConnect(_:) && v21 == enum case for AccountOriginType.bankConnect(_:))
  {
    uint64_t v22 = 4;
  }
  else if (&enum case for AccountOriginType.appleCard(_:) && v21 == enum case for AccountOriginType.appleCard(_:))
  {
    uint64_t v22 = 2;
  }
  else if (&enum case for AccountOriginType.appleCash(_:) && v21 == enum case for AccountOriginType.appleCash(_:))
  {
    uint64_t v22 = 1;
  }
  else if (&enum case for AccountOriginType.appleSavings(_:) && v21 == enum case for AccountOriginType.appleSavings(_:))
  {
    uint64_t v22 = 3;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))((char *)&v139 - v19, v16);
    uint64_t v22 = 0;
  }
  (*(void (**)(char *, uint64_t))(v17 + 8))((char *)&v139 - v19, v16);
  id v23 = v149;
  [v149 setAccountType:v22];
  sub_1000218E0();
  NSString v24 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v23 setAccountDescription:v24];

  uint64_t v25 = sub_1000188B8(&qword_100037970);
  uint64_t v26 = *(void *)(*(void *)(v25 - 8) + 64);
  __chkstk_darwin(v25 - 8);
  unint64_t v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1000218A0();
  uint64_t v28 = sub_100021820();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  int v31 = v30((char *)&v139 - v27, 1, v28);
  uint64_t v32 = sub_100019CA8((uint64_t)&v139 - v27, &qword_100037970);
  if (v31 == 1)
  {
    uint64_t v33 = -1;
  }
  else
  {
    __chkstk_darwin(v32);
    sub_1000218A0();
    uint64_t result = v30((char *)&v139 - v27, 1, v28);
    if (result == 1)
    {
      __break(1u);
      goto LABEL_56;
    }
    __chkstk_darwin(result);
    uint64_t v36 = (char *)&v139 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v36, (char *)&v139 - v27, v28);
    int v37 = (*(uint64_t (**)(char *, uint64_t))(v29 + 88))(v36, v28);
    if (&enum case for AccountStatus.open(_:) && v37 == enum case for AccountStatus.open(_:))
    {
      uint64_t v33 = 0;
    }
    else if (&enum case for AccountStatus.closed(_:) && v37 == enum case for AccountStatus.closed(_:))
    {
      uint64_t v33 = 1;
    }
    else if (&enum case for AccountStatus.pending(_:) && v37 == enum case for AccountStatus.pending(_:))
    {
      uint64_t v33 = 2;
    }
    else if (&enum case for AccountStatus.locked(_:) && v37 == enum case for AccountStatus.locked(_:))
    {
      uint64_t v33 = 3;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v28);
      uint64_t v33 = -1;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))((char *)&v139 - v27, v28);
  }
  id v38 = v149;
  [v149 setAccountStatus:v33];
  sub_100021920();
  NSString v39 = sub_100021D90();
  swift_bridgeObjectRelease();
  [v38 setCurrency:v39];

  uint64_t v40 = sub_1000188B8(&qword_100037978);
  uint64_t v41 = *(void *)(*(void *)(v40 - 8) + 64);
  __chkstk_darwin(v40 - 8);
  unint64_t v42 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_100021890();
  uint64_t v43 = sub_100021850();
  uint64_t v145 = *(void *)(v43 - 8);
  uint64_t v146 = v43;
  uint64_t v147 = *(uint64_t **)(v145 + 48);
  int v44 = ((uint64_t (*)(char *, uint64_t))v147)((char *)&v139 - v42, 1);
  uint64_t v45 = sub_100019CA8((uint64_t)&v139 - v42, &qword_100037978);
  id v46 = 0;
  if (v44 == 1) {
    goto LABEL_41;
  }
  v143 = &v139;
  __chkstk_darwin(v45);
  uint64_t v47 = (char *)&v139 - v42;
  sub_100021890();
  uint64_t v48 = v146;
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v147)((char *)&v139 - v42, 1, v146);
  if (result == 1)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  unint64_t v49 = sub_100021830();
  int v50 = v49;
  __int16 v52 = v51;
  __int16 v54 = v53;
  unint64_t v55 = HIDWORD(v49);
  unint64_t v56 = HIWORD(v49);
  unint64_t v57 = v51 >> 16;
  unint64_t v141 = HIDWORD(v51);
  unint64_t v142 = HIWORD(v51);
  uint64_t v58 = *(void (**)(char *, uint64_t))(v145 + 8);
  LODWORD(v140) = HIWORD(v53);
  v58(v47, v48);
  id v59 = objc_allocWithZone((Class)NSDecimalNumber);
  int v150 = v50;
  __int16 v151 = v55;
  __int16 v152 = v56;
  __int16 v153 = v52;
  __int16 v154 = v57;
  __int16 v155 = v141;
  __int16 v156 = v142;
  __int16 v157 = v54;
  __int16 v158 = v140;
  id v46 = [v59 initWithDecimal:&v150];
LABEL_41:
  [v149 setCreditLimit:v46];

  uint64_t v60 = v144;
  sub_1000218D0();
  uint64_t v61 = sub_100021D10();
  uint64_t v62 = *(void *)(v61 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v60, 1, v61) != 1)
  {
    Class isa = sub_100021D00().super.isa;
    (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v61);
  }
  [v149 setNextPaymentDate:isa];

  __chkstk_darwin(v64);
  unint64_t v65 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1000218F0();
  uint64_t v66 = v146;
  uint64_t v67 = v147;
  int v68 = ((uint64_t (*)(char *, uint64_t, uint64_t))v147)((char *)&v139 - v65, 1, v146);
  uint64_t v69 = sub_100019CA8((uint64_t)&v139 - v65, &qword_100037978);
  if (v68 == 1)
  {
    id v70 = 0;
    goto LABEL_47;
  }
  uint64_t v144 = (char *)&v139;
  __chkstk_darwin(v69);
  sub_1000218F0();
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v67)((char *)&v139 - v65, 1, v66);
  if (result == 1)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  unint64_t v71 = sub_100021830();
  int v72 = v71;
  __int16 v74 = v73;
  __int16 v76 = v75;
  unint64_t v77 = HIDWORD(v71);
  unint64_t v78 = HIWORD(v71);
  unint64_t v140 = v73 >> 16;
  unint64_t v142 = HIDWORD(v73);
  v143 = (uint64_t *)HIWORD(v73);
  unint64_t v79 = *(void (**)(char *, uint64_t))(v145 + 8);
  LODWORD(v141) = HIWORD(v75);
  v79((char *)&v139 - v65, v66);
  id v80 = objc_allocWithZone((Class)NSDecimalNumber);
  int v150 = v72;
  __int16 v151 = v77;
  __int16 v152 = v78;
  __int16 v153 = v74;
  __int16 v154 = v140;
  __int16 v155 = v142;
  __int16 v156 = (__int16)v143;
  __int16 v157 = v76;
  __int16 v158 = v141;
  id v70 = [v80 initWithDecimal:&v150];
  uint64_t v67 = v147;
LABEL_47:
  [v149 setMinimumPaymentAmount:v70];

  __chkstk_darwin(v81);
  sub_100021900();
  int v82 = ((uint64_t (*)(char *, uint64_t, uint64_t))v67)((char *)&v139 - v65, 1, v66);
  uint64_t v83 = sub_100019CA8((uint64_t)&v139 - v65, &qword_100037978);
  if (v82 != 1)
  {
    uint64_t v147 = &v139;
    __chkstk_darwin(v83);
    uint64_t v85 = (char *)&v139 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_100021900();
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v67)(v85, 1, v66);
    if (result != 1)
    {
      unint64_t v86 = sub_100021830();
      int v87 = v86;
      __int16 v89 = v88;
      __int16 v91 = v90;
      unint64_t v92 = HIDWORD(v86);
      unint64_t v93 = HIWORD(v86);
      unint64_t v94 = v88 >> 16;
      unint64_t v95 = HIDWORD(v88);
      uint64_t v144 = (char *)HIWORD(v88);
      unsigned int v96 = HIWORD(v90);
      (*(void (**)(char *, uint64_t))(v145 + 8))(v85, v66);
      id v97 = objc_allocWithZone((Class)NSDecimalNumber);
      int v150 = v87;
      __int16 v151 = v92;
      __int16 v152 = v93;
      __int16 v153 = v89;
      __int16 v154 = v94;
      __int16 v155 = v95;
      __int16 v156 = (__int16)v144;
      __int16 v157 = v91;
      __int16 v158 = v96;
      id v84 = [v97 initWithDecimal:&v150];
      goto LABEL_51;
    }
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  id v84 = 0;
LABEL_51:
  [v149 setOverduePaymentAmount:v84];

  uint64_t v98 = sub_1000188B8(&qword_100037980);
  uint64_t v147 = &v139;
  uint64_t v99 = *(void *)(*(void *)(v98 - 8) + 64);
  __chkstk_darwin(v98 - 8);
  unint64_t v100 = (v99 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_1000218B0();
  uint64_t v101 = sub_100021B10();
  uint64_t v102 = *(void *)(v101 - 8);
  uint64_t v103 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v102 + 48);
  int v104 = v103((char *)&v139 - v100, 1, v101);
  uint64_t v105 = sub_100019CA8((uint64_t)&v139 - v100, &qword_100037980);
  id v106 = 0;
  if (v104 == 1)
  {
LABEL_54:
    id v127 = v149;
    [v149 setAccountBalance:v106];

    sub_1000218C0();
    NSString v128 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v127 setInstitutionName:v128];

    uint64_t v129 = sub_100021BF0();
    uint64_t v130 = *(void *)(v129 - 8);
    uint64_t v131 = *(void *)(v130 + 64);
    __chkstk_darwin(v129);
    unint64_t v132 = (v131 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_100021860();
    sub_100021BD0();
    NSString v133 = *(void (**)(char *, uint64_t))(v130 + 8);
    v133((char *)&v139 - v132, v129);
    NSString v134 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v127 setInstitutionID:v134];

    __chkstk_darwin(v135);
    uint64_t v136 = v148;
    sub_100021860();
    sub_100021BE0();
    v133((char *)&v139 - v132, v129);
    NSString v137 = sub_100021D90();
    swift_bridgeObjectRelease();
    [v127 setUniqueAccountID:v137];

    uint64_t v138 = sub_100021930();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v138 - 8) + 8))(v136, v138);
    return (uint64_t)v127;
  }
  uint64_t v147 = &v139;
  __chkstk_darwin(v105);
  v107 = (char *)&v139 - v100;
  sub_1000218B0();
  uint64_t result = v103((char *)&v139 - v100, 1, v101);
  if (result != 1)
  {
    uint64_t v108 = sub_100021980();
    uint64_t v144 = (char *)&v139;
    uint64_t v109 = *(void *)(v108 - 8);
    __chkstk_darwin(v108);
    uint64_t v111 = (char *)&v139 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_100021B00();
    uint64_t v112 = (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v107, v101);
    v143 = &v139;
    uint64_t v113 = v145;
    __chkstk_darwin(v112);
    uint64_t v115 = (char *)&v139 - ((v114 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_100021970();
    (*(void (**)(char *, uint64_t))(v109 + 8))(v111, v108);
    unint64_t v116 = sub_100021830();
    int v117 = v116;
    __int16 v119 = v118;
    LOWORD(v108) = v120;
    unint64_t v121 = HIDWORD(v116);
    unint64_t v122 = HIWORD(v116);
    unint64_t v123 = v118 >> 16;
    unint64_t v124 = HIDWORD(v118);
    unint64_t v142 = HIWORD(v118);
    unsigned int v125 = HIWORD(v120);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v115, v146);
    id v126 = objc_allocWithZone((Class)NSDecimalNumber);
    int v150 = v117;
    __int16 v151 = v121;
    __int16 v152 = v122;
    __int16 v153 = v119;
    __int16 v154 = v123;
    __int16 v155 = v124;
    __int16 v156 = v142;
    __int16 v157 = v108;
    __int16 v158 = v125;
    id v106 = [v126 initWithDecimal:&v150];
    goto LABEL_54;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_1000212AC(uint64_t a1)
{
  uint64_t v2 = sub_100021780();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (&enum case for AccountType.asset(_:) && v6 == enum case for AccountType.asset(_:)) {
    return 0;
  }
  if (&enum case for AccountType.liability(_:) && v6 == enum case for AccountType.liability(_:)) {
    return 1;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return -1;
}

uint64_t sub_1000213E8(uint64_t a1)
{
  uint64_t v2 = sub_100021950();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (&enum case for AccountOriginType.bankConnect(_:) && v6 == enum case for AccountOriginType.bankConnect(_:)) {
    return 4;
  }
  if (&enum case for AccountOriginType.appleCard(_:) && v6 == enum case for AccountOriginType.appleCard(_:)) {
    return 2;
  }
  if (&enum case for AccountOriginType.appleCash(_:) && v6 == enum case for AccountOriginType.appleCash(_:)) {
    return 1;
  }
  if (&enum case for AccountOriginType.appleSavings(_:) && v6 == enum case for AccountOriginType.appleSavings(_:)) {
    return 3;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0;
}

uint64_t sub_100021564(uint64_t a1)
{
  uint64_t v2 = sub_100021820();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (&enum case for AccountStatus.open(_:) && v6 == enum case for AccountStatus.open(_:)) {
    return 0;
  }
  if (&enum case for AccountStatus.closed(_:) && v6 == enum case for AccountStatus.closed(_:)) {
    return 1;
  }
  if (&enum case for AccountStatus.pending(_:) && v6 == enum case for AccountStatus.pending(_:)) {
    return 2;
  }
  if (&enum case for AccountStatus.locked(_:) && v6 == enum case for AccountStatus.locked(_:)) {
    return 3;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return -1;
}

uint64_t sub_1000216E0()
{
  return type metadata accessor for FinanceStore.HistoryToken();
}

uint64_t sub_100021700()
{
  return FinanceStore.internalTransactions(for:since:isMonitoring:)();
}

uint64_t sub_100021710()
{
  return static FinanceStore.shared.getter();
}

uint64_t sub_100021720()
{
  return FinanceStore.Changes.deleted.getter();
}

uint64_t sub_100021730()
{
  return FinanceStore.Changes.updated.getter();
}

uint64_t sub_100021740()
{
  return FinanceStore.Changes.inserted.getter();
}

uint64_t sub_100021750()
{
  return FinanceStore.Changes.newToken.getter();
}

uint64_t sub_100021770()
{
  return type metadata accessor for FinanceStore();
}

uint64_t sub_100021780()
{
  return type metadata accessor for AccountType();
}

uint64_t sub_100021790()
{
  return MapsInsight.brand.getter();
}

uint64_t sub_1000217A0()
{
  return MapsInsight.category.getter();
}

uint64_t sub_1000217B0()
{
  return MapsInsight.merchant.getter();
}

uint64_t sub_1000217C0()
{
  return type metadata accessor for MapsInsight();
}

uint64_t sub_1000217D0()
{
  return type metadata accessor for Transaction.Insight();
}

uint64_t sub_1000217E0()
{
  return MapsMerchant.postalAddress.getter();
}

uint64_t sub_1000217F0()
{
  return MapsMerchant.locationLatitude.getter();
}

uint64_t sub_100021800()
{
  return MapsMerchant.locationLongitude.getter();
}

uint64_t sub_100021810()
{
  return type metadata accessor for MapsMerchant();
}

uint64_t sub_100021820()
{
  return type metadata accessor for AccountStatus();
}

uint64_t sub_100021830()
{
  return CurrencyAmount.amount.getter();
}

uint64_t sub_100021840()
{
  return CurrencyAmount.currency.getter();
}

uint64_t sub_100021850()
{
  return type metadata accessor for CurrencyAmount();
}

uint64_t sub_100021860()
{
  return InternalAccount.fullyQualifiedAccountIdentifier.getter();
}

uint64_t sub_100021870()
{
  return InternalAccount.originType.getter();
}

uint64_t sub_100021880()
{
  return InternalAccount.accountType.getter();
}

uint64_t sub_100021890()
{
  return InternalAccount.creditLimit.getter();
}

uint64_t sub_1000218A0()
{
  return InternalAccount.accountStatus.getter();
}

uint64_t sub_1000218B0()
{
  return InternalAccount.accountBalance.getter();
}

uint64_t sub_1000218C0()
{
  return InternalAccount.institutionName.getter();
}

uint64_t sub_1000218D0()
{
  return InternalAccount.nextPaymentDate.getter();
}

uint64_t sub_1000218E0()
{
  return InternalAccount.accountDescription.getter();
}

uint64_t sub_1000218F0()
{
  return InternalAccount.minimumPaymentAmount.getter();
}

uint64_t sub_100021900()
{
  return InternalAccount.overduePaymentAmount.getter();
}

uint64_t sub_100021910()
{
  return InternalAccount.id.getter();
}

uint64_t sub_100021920()
{
  return InternalAccount.currency.getter();
}

uint64_t sub_100021930()
{
  return type metadata accessor for InternalAccount();
}

uint64_t sub_100021940()
{
  return type metadata accessor for TransactionType();
}

uint64_t sub_100021950()
{
  return type metadata accessor for AccountOriginType();
}

uint64_t sub_100021960()
{
  return type metadata accessor for TransactionStatus();
}

uint64_t sub_100021970()
{
  return BalanceCalculation.amount.getter();
}

uint64_t sub_100021980()
{
  return type metadata accessor for BalanceCalculation();
}

uint64_t sub_100021990()
{
  return MapsWalletCategory.rawValue.getter();
}

uint64_t sub_1000219A0()
{
  return type metadata accessor for MapsWalletCategory();
}

uint64_t sub_1000219B0()
{
  return InternalTransaction.postedDate.getter();
}

uint64_t sub_1000219C0()
{
  return InternalTransaction.merchantName.getter();
}

uint64_t sub_1000219D0()
{
  return InternalTransaction.transactionID.getter();
}

uint64_t sub_1000219E0()
{
  return InternalTransaction.displayLocation.getter();
}

uint64_t sub_1000219F0()
{
  return InternalTransaction.transactionDate.getter();
}

uint64_t sub_100021A00()
{
  return InternalTransaction.transactionType.getter();
}

uint64_t sub_100021A10()
{
  return InternalTransaction.transactionAmount.getter();
}

uint64_t sub_100021A20()
{
  return InternalTransaction.creditDebitIndicator.getter();
}

uint64_t sub_100021A30()
{
  return InternalTransaction.merchantCategoryCode.getter();
}

uint64_t sub_100021A40()
{
  return InternalTransaction.transactionDescription.getter();
}

uint64_t sub_100021A50()
{
  return InternalTransaction.id.getter();
}

uint64_t sub_100021A60()
{
  return InternalTransaction.status.getter();
}

uint64_t sub_100021A70()
{
  return InternalTransaction.accountID.getter();
}

uint64_t sub_100021A80()
{
  return type metadata accessor for InternalTransaction();
}

uint64_t sub_100021A90()
{
  return type metadata accessor for CreditDebitIndicator();
}

uint64_t sub_100021AA0()
{
  return MerchantCategoryCode.rawValue.getter();
}

uint64_t sub_100021AB0()
{
  return type metadata accessor for MerchantCategoryCode();
}

uint64_t sub_100021AC0()
{
  return InternalAccountResult.accounts.getter();
}

uint64_t sub_100021AD0()
{
  return type metadata accessor for InternalAccountResult();
}

uint64_t sub_100021AE0()
{
  return TransactionIdentifier.value.getter();
}

uint64_t sub_100021AF0()
{
  return type metadata accessor for TransactionIdentifier();
}

uint64_t sub_100021B00()
{
  return InternalAccountBalance.balanceCalculation.getter();
}

uint64_t sub_100021B10()
{
  return type metadata accessor for InternalAccountBalance();
}

uint64_t sub_100021B20()
{
  return ApplePayTransactionInsight.merchantZip.getter();
}

uint64_t sub_100021B30()
{
  return ApplePayTransactionInsight.industryCode.getter();
}

uint64_t sub_100021B40()
{
  return ApplePayTransactionInsight.merchantCity.getter();
}

uint64_t sub_100021B50()
{
  return ApplePayTransactionInsight.merchantState.getter();
}

uint64_t sub_100021B60()
{
  return ApplePayTransactionInsight.merchantRawName.getter();
}

uint64_t sub_100021B70()
{
  return ApplePayTransactionInsight.industryCategory.getter();
}

uint64_t sub_100021B80()
{
  return ApplePayTransactionInsight.merchantRawCountry.getter();
}

uint64_t sub_100021B90()
{
  return ApplePayTransactionInsight.merchantCountryCode.getter();
}

uint64_t sub_100021BA0()
{
  return type metadata accessor for ApplePayTransactionInsight.Location();
}

uint64_t sub_100021BB0()
{
  return ApplePayTransactionInsight.location.getter();
}

uint64_t sub_100021BC0()
{
  return type metadata accessor for ApplePayTransactionInsight();
}

uint64_t sub_100021BD0()
{
  return FullyQualifiedAccountIdentifier.institutionID.getter();
}

uint64_t sub_100021BE0()
{
  return FullyQualifiedAccountIdentifier.accountID.getter();
}

uint64_t sub_100021BF0()
{
  return type metadata accessor for FullyQualifiedAccountIdentifier();
}

uint64_t sub_100021C00()
{
  return InternalTransactionAsyncSequence.makeAsyncIterator()();
}

uint64_t sub_100021C10()
{
  return type metadata accessor for InternalTransactionAsyncSequence.Iterator();
}

uint64_t sub_100021C20()
{
  return dispatch thunk of MapsItem.mapsCategoryIdentifier.getter();
}

uint64_t sub_100021C30()
{
  return dispatch thunk of MapsItem.resultProviderIdentifier.getter();
}

uint64_t sub_100021C40()
{
  return dispatch thunk of MapsItem.muid.getter();
}

uint64_t sub_100021C50()
{
  return dispatch thunk of MapsItem.name.getter();
}

uint64_t sub_100021C60()
{
  return type metadata accessor for MapsBrand();
}

uint64_t sub_100021C70()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100021C80()
{
  return JSONDecoder.init()();
}

uint64_t sub_100021C90()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100021CA0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100021CB0()
{
  return JSONEncoder.init()();
}

uint64_t sub_100021CC0()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100021CD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100021CE0()
{
  return Data.init(base64Encoded:options:)();
}

uint64_t sub_100021CF0(NSDataBase64EncodingOptions options)
{
  return Data.base64EncodedString(options:)(options)._countAndFlagsBits;
}

NSDate sub_100021D00()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100021D10()
{
  return type metadata accessor for Date();
}

uint64_t sub_100021D20()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100021D30()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100021D40()
{
  return Logger.logObject.getter();
}

uint64_t sub_100021D50()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100021D60()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100021D70()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100021D80()
{
  return Dictionary.description.getter();
}

NSString sub_100021D90()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100021DA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100021DB0()
{
  return String.hash(into:)();
}

void sub_100021DC0(Swift::String a1)
{
}

Swift::Int sub_100021DD0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100021DE0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_100021DF0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100021E00()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100021E10()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100021E20()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100021E30()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100021E40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100021E60()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100021E70()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100021E80()
{
  return CLLocation.init(_:)();
}

uint64_t sub_100021E90()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100021EA0()
{
  return static os_log_type_t.error.getter();
}

void sub_100021EB0()
{
}

uint64_t sub_100021EC0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100021ED0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100021EE0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100021EF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100021F00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100021F10()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100021F20()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100021F30()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100021F40()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100021F50()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100021F60()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100021F70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100021F90()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100021FA0()
{
  return Hasher._finalize()();
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return _CFStringTransform(string, range, transform, reverse);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t FHAmountSmartFeaturesArray()
{
  return _FHAmountSmartFeaturesArray();
}

uint64_t FHApplicationFromProcessName()
{
  return _FHApplicationFromProcessName();
}

uint64_t FHApplicationToTagsMapping()
{
  return _FHApplicationToTagsMapping();
}

uint64_t FHApplications()
{
  return _FHApplications();
}

uint64_t FHCleanSuperMerchants()
{
  return _FHCleanSuperMerchants();
}

uint64_t FHDataDirectory()
{
  return _FHDataDirectory();
}

uint64_t FHDateTimeSmartFeaturesArray()
{
  return _FHDateTimeSmartFeaturesArray();
}

uint64_t FHEqualObjects()
{
  return _FHEqualObjects();
}

uint64_t FHEqualStrings()
{
  return _FHEqualStrings();
}

uint64_t FHMerchantSmartFeaturesArray()
{
  return _FHMerchantSmartFeaturesArray();
}

uint64_t FHMerchantsUnaffectedBySource()
{
  return _FHMerchantsUnaffectedBySource();
}

uint64_t FHPeerPaymentForecastingSignalPriority()
{
  return _FHPeerPaymentForecastingSignalPriority();
}

uint64_t FHTransactionAccountTypeToString()
{
  return _FHTransactionAccountTypeToString();
}

uint64_t FinHealthLogObject()
{
  return _FinHealthLogObject();
}

uint64_t GetProcessingDate()
{
  return _GetProcessingDate();
}

uint64_t GetTimeOfDay()
{
  return _GetTimeOfDay();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TimeWindowToSeconds()
{
  return _TimeWindowToSeconds();
}

uint64_t TransactionFromPKPaymentTransaction()
{
  return _TransactionFromPKPaymentTransaction();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uint64_t getCleanMerchantName()
{
  return _getCleanMerchantName();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend__checkEventDeletion(void *a1, const char *a2, ...)
{
  return _[a1 _checkEventDeletion];
}

id objc_msgSend__clientConnection(void *a1, const char *a2, ...)
{
  return _[a1 _clientConnection];
}

id objc_msgSend__createDBManagerAndAssociatedProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDBManagerAndAssociatedProperties:");
}

id objc_msgSend__deleteAllDataForPass_force_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteAllDataForPass:force:completion:");
}

id objc_msgSend__evaluatePointsOfInterestWithCache_bypassMapService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_evaluatePointsOfInterestWithCache:bypassMapService:completion:");
}

id objc_msgSend__excludeRecurringFromEventTaggingCandidates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_excludeRecurringFromEventTaggingCandidates:");
}

id objc_msgSend__getLocalSearchResponse_transactionLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getLocalSearchResponse:transactionLocation:");
}

id objc_msgSend__getRecurringChangeOverTimePeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getRecurringChangeOverTimePeriod:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__insertOrUpdateTransactionPostDirtyState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertOrUpdateTransactionPostDirtyState:");
}

id objc_msgSend__newClientConnection(void *a1, const char *a2, ...)
{
  return _[a1 _newClientConnection];
}

id objc_msgSend__parityCheckBetweenWalletSourceTransaction_andFinanceSourceTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parityCheckBetweenWalletSourceTransaction:andFinanceSourceTransaction:");
}

id objc_msgSend__processAggregateFeaturesWithHardReset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAggregateFeaturesWithHardReset:");
}

id objc_msgSend__processFHTransactions_deferFeatureComputation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processFHTransactions:deferFeatureComputation:completion:");
}

id objc_msgSend__processTransactionsFromWallet_deferFeatureComputation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processTransactionsFromWallet:deferFeatureComputation:");
}

id objc_msgSend__remoteObjectProxyWithErrorHandler(void *a1, const char *a2, ...)
{
  return _[a1 _remoteObjectProxyWithErrorHandler];
}

id objc_msgSend__sendTransactionFeaturesForApplication_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendTransactionFeaturesForApplication:withCompletion:");
}

id objc_msgSend__sendTransactionFeaturesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendTransactionFeaturesWithCompletion:");
}

id objc_msgSend__stringValueOfEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringValueOfEntitlement:");
}

id objc_msgSend__tagFlightTransactionsWithTripEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tagFlightTransactionsWithTripEvents:");
}

id objc_msgSend__tokenize_shouldLemmatize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tokenize:shouldLemmatize:");
}

id objc_msgSend__transactionWithTransactionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionWithTransactionID:completion:");
}

id objc_msgSend__updateCacheWithSpatialPlaceLookupParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCacheWithSpatialPlaceLookupParameters:");
}

id objc_msgSend_abs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abs:");
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_adamIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 adamIdentifier];
}

id objc_msgSend_addDateValueForField_fieldValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDateValueForField:fieldValue:");
}

id objc_msgSend_addDecimalNumberValueForField_fieldValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDecimalNumberValueForField:fieldValue:");
}

id objc_msgSend_addDoubleValueForField_fieldValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDoubleValueForField:fieldValue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addIntegerClause_fieldName_expression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntegerClause:fieldName:expression:");
}

id objc_msgSend_addIntegerValueForField_fieldValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIntegerValueForField:fieldValue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecord:");
}

id objc_msgSend_addStringClause_fieldName_expression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStringClause:fieldName:expression:");
}

id objc_msgSend_addStringValueForField_fieldValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStringValueForField:fieldValue:");
}

id objc_msgSend_addressComponents(void *a1, const char *a2, ...)
{
  return _[a1 addressComponents];
}

id objc_msgSend_aggregateFeatures(void *a1, const char *a2, ...)
{
  return _[a1 aggregateFeatures];
}

id objc_msgSend_aggregateFeaturesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateFeaturesWithHandler:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_amount(void *a1, const char *a2, ...)
{
  return _[a1 amount];
}

id objc_msgSend_amountSpent(void *a1, const char *a2, ...)
{
  return _[a1 amountSpent];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_applyCategoryHeuristics_detailedCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyCategoryHeuristics:detailedCategory:");
}

id objc_msgSend_applyTimingHeuristics_detailedCategory_dateHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTimingHeuristics:detailedCategory:dateHour:");
}

id objc_msgSend_areasOfInterest(void *a1, const char *a2, ...)
{
  return _[a1 areasOfInterest];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associatedReceiptUniqueID(void *a1, const char *a2, ...)
{
  return _[a1 associatedReceiptUniqueID];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_availableTagSchemesForUnit_language_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableTagSchemesForUnit:language:");
}

id objc_msgSend_boundaryRegex(void *a1, const char *a2, ...)
{
  return _[a1 boundaryRegex];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cashbackPercentForMerchant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cashbackPercentForMerchant:");
}

id objc_msgSend_categoriesExpansionDict(void *a1, const char *a2, ...)
{
  return _[a1 categoriesExpansionDict];
}

id objc_msgSend_categoriesLocalizationDict(void *a1, const char *a2, ...)
{
  return _[a1 categoriesLocalizationDict];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_centerCoordinate(void *a1, const char *a2, ...)
{
  return _[a1 centerCoordinate];
}

id objc_msgSend_characterRecognitionData(void *a1, const char *a2, ...)
{
  return _[a1 characterRecognitionData];
}

id objc_msgSend_characterRecognitionProperties(void *a1, const char *a2, ...)
{
  return _[a1 characterRecognitionProperties];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return _[a1 city];
}

id objc_msgSend_clearCardProcessingHistory(void *a1, const char *a2, ...)
{
  return _[a1 clearCardProcessingHistory];
}

id objc_msgSend_clearData(void *a1, const char *a2, ...)
{
  return _[a1 clearData];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compoundFeatureKey(void *a1, const char *a2, ...)
{
  return _[a1 compoundFeatureKey];
}

id objc_msgSend_compoundFeatures(void *a1, const char *a2, ...)
{
  return _[a1 compoundFeatures];
}

id objc_msgSend_compoundFeaturesForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compoundFeaturesForTransaction:");
}

id objc_msgSend_computeAllAggregateFeatures(void *a1, const char *a2, ...)
{
  return _[a1 computeAllAggregateFeatures];
}

id objc_msgSend_computeAmountAggregateFeatures(void *a1, const char *a2, ...)
{
  return _[a1 computeAmountAggregateFeatures];
}

id objc_msgSend_computeAndPersistDetailedCategoryRecords_withRecurringCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeAndPersistDetailedCategoryRecords:withRecurringCounts:");
}

id objc_msgSend_computeAndPersistDisputeFeaturesForPendingTransactions(void *a1, const char *a2, ...)
{
  return _[a1 computeAndPersistDisputeFeaturesForPendingTransactions];
}

id objc_msgSend_computeDatetimeAggregateFeatures(void *a1, const char *a2, ...)
{
  return _[a1 computeDatetimeAggregateFeatures];
}

id objc_msgSend_computeMerchantAggregateFeatures(void *a1, const char *a2, ...)
{
  return _[a1 computeMerchantAggregateFeatures];
}

id objc_msgSend_computePaymentFeatures(void *a1, const char *a2, ...)
{
  return _[a1 computePaymentFeatures];
}

id objc_msgSend_computeRecurringClassesWithMerchantCounts_peerPaymentCounts_merchantDetailedCategoryCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeRecurringClassesWithMerchantCounts:peerPaymentCounts:merchantDetailedCategoryCounts:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyValueOfEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyValueOfEntitlement:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countMerchantDetailedCategoryRecordsWithDictionary_fHTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countMerchantDetailedCategoryRecordsWithDictionary:fHTransaction:");
}

id objc_msgSend_countRecurringMerchantDetailedCategoryRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countRecurringMerchantDetailedCategoryRecords:");
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return _[a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_currencyCode(void *a1, const char *a2, ...)
{
  return _[a1 currencyCode];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_customObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customObjectForKey:");
}

id objc_msgSend_dataDetectorWithTypes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataDetectorWithTypes:error:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dbMgr(void *a1, const char *a2, ...)
{
  return _[a1 dbMgr];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decimalNumberByAdding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberByAdding:");
}

id objc_msgSend_decimalNumberByDividingBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberByDividingBy:");
}

id objc_msgSend_decimalNumberByMultiplyingBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberByMultiplyingBy:");
}

id objc_msgSend_decimalNumberByRoundingAccordingToBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberByRoundingAccordingToBehavior:");
}

id objc_msgSend_decimalNumberHandlerWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:");
}

id objc_msgSend_decimalNumberWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberWithString:");
}

id objc_msgSend_decomposedStringWithCompatibilityMapping(void *a1, const char *a2, ...)
{
  return _[a1 decomposedStringWithCompatibilityMapping];
}

id objc_msgSend_defaultBackgroundTraits(void *a1, const char *a2, ...)
{
  return _[a1 defaultBackgroundTraits];
}

id objc_msgSend_defaultDatabaseAmountMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 defaultDatabaseAmountMultiplier];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deleteAllData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllData:");
}

id objc_msgSend_deleteAllDataForPasses_force_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllDataForPasses:force:completion:");
}

id objc_msgSend_deleteAllDetailedCategoryRecords(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllDetailedCategoryRecords];
}

id objc_msgSend_deleteAllFeatureRecordsForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllFeatureRecordsForTransaction:");
}

id objc_msgSend_deleteAllRecordsFromTransactionFeatures(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllRecordsFromTransactionFeatures];
}

id objc_msgSend_deleteAllRecordsInAccountInfoForTransactionSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllRecordsInAccountInfoForTransactionSource:");
}

id objc_msgSend_deleteAllRecordsInPeerPaymentFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllRecordsInPeerPaymentFeatures:");
}

id objc_msgSend_deleteAllRecordsInTransactionFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllRecordsInTransactionFeatures:");
}

id objc_msgSend_deleteAllRecordsInTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllRecordsInTransactions:");
}

id objc_msgSend_deleteBankConnectTransactionWithFinanceTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteBankConnectTransactionWithFinanceTransactionIdentifier:");
}

id objc_msgSend_deleteDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDatabase:");
}

id objc_msgSend_deleteTaggedEventsInTimeRange_startDate_comparatorOfEndDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteTaggedEventsInTimeRange:startDate:comparatorOfEndDate:endDate:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_entitlementsChecker(void *a1, const char *a2, ...)
{
  return _[a1 entitlementsChecker];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateNeighborsForString_maximumCount_distanceType_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateNeighborsForString:maximumCount:distanceType:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateTagsInRange_unit_scheme_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateTagsInRange:unit:scheme:options:usingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateEventTagging_bypassMapService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateEventTagging:bypassMapService:completion:");
}

id objc_msgSend_evaluatePointsOfInterest_bypassMapService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluatePointsOfInterest:bypassMapService:completion:");
}

id objc_msgSend_eventIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 eventIdentifier];
}

id objc_msgSend_eventIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 eventIdentifiers];
}

id objc_msgSend_eventWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithIdentifier:");
}

id objc_msgSend_featureLabel(void *a1, const char *a2, ...)
{
  return _[a1 featureLabel];
}

id objc_msgSend_featureRank(void *a1, const char *a2, ...)
{
  return _[a1 featureRank];
}

id objc_msgSend_featuresForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresForTransaction:");
}

id objc_msgSend_featuresWithAmountSums_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featuresWithAmountSums:startDate:endDate:");
}

id objc_msgSend_fetchAccountsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAccountsWithCompletionHandler:");
}

id objc_msgSend_fetchAssetsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithOptions:");
}

id objc_msgSend_fetchReceiptPhotosFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchReceiptPhotosFromDate:");
}

id objc_msgSend_fhAllAccess(void *a1, const char *a2, ...)
{
  return _[a1 fhAllAccess];
}

id objc_msgSend_fhProperties(void *a1, const char *a2, ...)
{
  return _[a1 fhProperties];
}

id objc_msgSend_fieldsInOrder(void *a1, const char *a2, ...)
{
  return _[a1 fieldsInOrder];
}

id objc_msgSend_filterTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterTransactions:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_financeTransactionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 financeTransactionIdentifier];
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_forecastingType(void *a1, const char *a2, ...)
{
  return _[a1 forecastingType];
}

id objc_msgSend_generateRankingScore_forTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateRankingScore:forTransaction:");
}

id objc_msgSend_getAllPaymentTransactions(void *a1, const char *a2, ...)
{
  return _[a1 getAllPaymentTransactions];
}

id objc_msgSend_getAllPredictedPeerPaymentsAfterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllPredictedPeerPaymentsAfterDate:");
}

id objc_msgSend_getCompundFeaturesOverTimRangeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCompundFeaturesOverTimRangeFrom:to:");
}

id objc_msgSend_getCurrentCashBalance(void *a1, const char *a2, ...)
{
  return _[a1 getCurrentCashBalance];
}

id objc_msgSend_getDetailedCategoryAggregateRecordsWithCountryCode_timeWindow_timeOfDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDetailedCategoryAggregateRecordsWithCountryCode:timeWindow:timeOfDay:");
}

id objc_msgSend_getDisputeDocumentSuggestionsForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDisputeDocumentSuggestionsForTransaction:");
}

id objc_msgSend_getEvents(void *a1, const char *a2, ...)
{
  return _[a1 getEvents];
}

id objc_msgSend_getExpectedWeeklySpend(void *a1, const char *a2, ...)
{
  return _[a1 getExpectedWeeklySpend];
}

id objc_msgSend_getFHAmountSmartFeatureByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFHAmountSmartFeatureByType:");
}

id objc_msgSend_getFHDateTimeSmartFeatureByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFHDateTimeSmartFeatureByType:");
}

id objc_msgSend_getFHMerchantSmartFeatureByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFHMerchantSmartFeatureByType:");
}

id objc_msgSend_getFilteredPeerPaymentForecastingSignals(void *a1, const char *a2, ...)
{
  return _[a1 getFilteredPeerPaymentForecastingSignals];
}

id objc_msgSend_getLostSavingsOverTime_from_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLostSavingsOverTime:from:to:");
}

id objc_msgSend_getLostSavingsValueFromCompoundFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLostSavingsValueFromCompoundFeatures:");
}

id objc_msgSend_getMerchantForTransactionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getMerchantForTransactionId:");
}

id objc_msgSend_getRecurringChangeForMessagingOverTimePeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRecurringChangeForMessagingOverTimePeriod:");
}

id objc_msgSend_getRecurringTransactionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 getRecurringTransactionIdentifiers];
}

id objc_msgSend_getRecurringTransactionIdentifiersByClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRecurringTransactionIdentifiersByClass:");
}

id objc_msgSend_getTaggedPastCalendarEvents(void *a1, const char *a2, ...)
{
  return _[a1 getTaggedPastCalendarEvents];
}

id objc_msgSend_getTransactionByFinanceTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionByFinanceTransactionIdentifier:");
}

id objc_msgSend_getTransactionByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionByIdentifier:");
}

id objc_msgSend_getTransactionIdsInTimeRangeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionIdsInTimeRangeFrom:to:");
}

id objc_msgSend_getTransactionInternalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionInternalState:");
}

id objc_msgSend_getTransactionSmartFeaturesForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionSmartFeaturesForApplication:");
}

id objc_msgSend_getTransactionsByDetailedCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionsByDetailedCategory:");
}

id objc_msgSend_getTransactionsByInternalState_internalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionsByInternalState:internalState:");
}

id objc_msgSend_getTransactionsByInternalState_internalState_offSet_addCompoundFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTransactionsByInternalState:internalState:offSet:addCompoundFeatures:");
}

id objc_msgSend_getTransactionsSmartFeatures(void *a1, const char *a2, ...)
{
  return _[a1 getTransactionsSmartFeatures];
}

id objc_msgSend_getTranscript(void *a1, const char *a2, ...)
{
  return _[a1 getTranscript];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_init_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:");
}

id objc_msgSend_initWithBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBuilder:");
}

id objc_msgSend_initWithCategoriesToInclude_categoriesToExclude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategoriesToInclude:categoriesToExclude:");
}

id objc_msgSend_initWithCenterCoordinate_radius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCenterCoordinate:radius:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithCoordinate_radius_poiCategoryFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoordinate:radius:poiCategoryFilter:");
}

id objc_msgSend_initWithDatabaseManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseManager:");
}

id objc_msgSend_initWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDouble:");
}

id objc_msgSend_initWithEKOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEKOptions:");
}

id objc_msgSend_initWithEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:");
}

id objc_msgSend_initWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInteger:");
}

id objc_msgSend_initWithLabelAndRank_featureRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLabelAndRank:featureRank:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithMapsCategory_amountSpent_countryCode_transactionCount_regularTransactionRatio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMapsCategory:amountSpent:countryCode:transactionCount:regularTransactionRatio:");
}

id objc_msgSend_initWithMerchantCounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMerchantCounts:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithPPSuggestedEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPPSuggestedEvent:");
}

id objc_msgSend_initWithPPTripEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPPTripEvent:");
}

id objc_msgSend_initWithPointsOfInterestRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPointsOfInterestRequest:");
}

id objc_msgSend_initWithRankedValue_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRankedValue:type:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTagSchemes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTagSchemes:");
}

id objc_msgSend_initWithTransactionAggregateRecords_timeWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransactionAggregateRecords:timeWindow:");
}

id objc_msgSend_insertDetailedCategoryAggregateFeature_amountSpent_transactionCount_countryCode_recurringTransactionRatio_timeOfDay_timeWindow_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertDetailedCategoryAggregateFeature:amountSpent:transactionCount:countryCode:recurringTransactionRatio:timeOfDay:timeWindow:startDate:endDate:");
}

id objc_msgSend_insertFeatures_realtimeFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertFeatures:realtimeFeatures:");
}

id objc_msgSend_insertFeaturesCompoundRealtime_realtimeFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertFeaturesCompoundRealtime:realtimeFeatures:");
}

id objc_msgSend_insertFeaturesCompoundRealtimeWithoutEvents_realtimeFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertFeaturesCompoundRealtimeWithoutEvents:realtimeFeatures:");
}

id objc_msgSend_insertFeaturesEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertFeaturesEvents:");
}

id objc_msgSend_insertInstrumentationRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertInstrumentationRecord:");
}

id objc_msgSend_insertOrUpdate_upsert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrUpdate:upsert:");
}

id objc_msgSend_insertOrUpdateBankConnectAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrUpdateBankConnectAccount:");
}

id objc_msgSend_insertOrUpdateTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrUpdateTransaction:");
}

id objc_msgSend_insertOrUpdateTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrUpdateTransactions:");
}

id objc_msgSend_insertReceiptData_identifier_title_subtitle_quantity_amount_currencyCode_adamIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertReceiptData:identifier:title:subtitle:quantity:amount:currencyCode:adamIdentifier:");
}

id objc_msgSend_insertTransactionInInternalStateDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertTransactionInInternalStateDirty:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_invalidateTransactionByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateTransactionByIdentifier:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isTransactionAddressFieldPresentIn_forTransactionAddressField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransactionAddressFieldPresentIn:forTransactionAddressField:");
}

id objc_msgSend_iterScoredEventsWithQuery_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iterScoredEventsWithQuery:error:block:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lessThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lessThan:");
}

id objc_msgSend_lineItems(void *a1, const char *a2, ...)
{
  return _[a1 lineItems];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _[a1 locality];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _[a1 localizedFailureReason];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_lostSavingsOverTimeForMerchant_timePeriod_currentDate_stateController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lostSavingsOverTimeForMerchant:timePeriod:currentDate:stateController:");
}

id objc_msgSend_lostSavingsTagComputationForTransaction_transactionSource_cashbackPercent_merchantName_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lostSavingsTagComputationForTransaction:transactionSource:cashbackPercent:merchantName:completion:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainLocation(void *a1, const char *a2, ...)
{
  return _[a1 mainLocation];
}

id objc_msgSend_mapItems(void *a1, const char *a2, ...)
{
  return _[a1 mapItems];
}

id objc_msgSend_mapItemsForSpatialLookupParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapItemsForSpatialLookupParameters:");
}

id objc_msgSend_mapsMerchantBrandID(void *a1, const char *a2, ...)
{
  return _[a1 mapsMerchantBrandID];
}

id objc_msgSend_mapsMerchantID(void *a1, const char *a2, ...)
{
  return _[a1 mapsMerchantID];
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesInString:options:range:");
}

id objc_msgSend_maxParametersCountForSpatialPlaceLookup(void *a1, const char *a2, ...)
{
  return _[a1 maxParametersCountForSpatialPlaceLookup];
}

id objc_msgSend_merchantDetailedCategory(void *a1, const char *a2, ...)
{
  return _[a1 merchantDetailedCategory];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return _[a1 modelName];
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return _[a1 modelVersion];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_neighborsForText_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "neighborsForText:completion:");
}

id objc_msgSend_nlEmbedding(void *a1, const char *a2, ...)
{
  return _[a1 nlEmbedding];
}

id objc_msgSend_nlTagger(void *a1, const char *a2, ...)
{
  return _[a1 nlTagger];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_one(void *a1, const char *a2, ...)
{
  return _[a1 one];
}

id objc_msgSend_pathForResource_ofType_inDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:inDirectory:");
}

id objc_msgSend_paymentService(void *a1, const char *a2, ...)
{
  return _[a1 paymentService];
}

id objc_msgSend_peerPaymentCounterpartHandle(void *a1, const char *a2, ...)
{
  return _[a1 peerPaymentCounterpartHandle];
}

id objc_msgSend_peerPaymentType(void *a1, const char *a2, ...)
{
  return _[a1 peerPaymentType];
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _[a1 placemark];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predictAndPersistCashCardRecurringTransactions(void *a1, const char *a2, ...)
{
  return _[a1 predictAndPersistCashCardRecurringTransactions];
}

id objc_msgSend_processAggregateFeatures(void *a1, const char *a2, ...)
{
  return _[a1 processAggregateFeatures];
}

id objc_msgSend_processDisputeDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDisputeDocument:");
}

id objc_msgSend_processingDataForFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processingDataForFeature:");
}

id objc_msgSend_processingTimeForFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processingTimeForFeature:");
}

id objc_msgSend_publishEventsToBiome(void *a1, const char *a2, ...)
{
  return _[a1 publishEventsToBiome];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return _[a1 quantity];
}

id objc_msgSend_queryDataWithBlock_logicalOperator_selectFields_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryDataWithBlock:logicalOperator:selectFields:usingBlock:");
}

id objc_msgSend_queryPPEvents_fromDate_toDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryPPEvents:fromDate:toDate:");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rankScore(void *a1, const char *a2, ...)
{
  return _[a1 rankScore];
}

id objc_msgSend_realtimeFeaturesForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "realtimeFeaturesForTransaction:");
}

id objc_msgSend_receiptIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 receiptIdentifier];
}

id objc_msgSend_recordPeerPaymentForecastingSuggestionStatus_counterpartHandle_amount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordPeerPaymentForecastingSuggestionStatus:counterpartHandle:amount:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_regularTransactionRatio(void *a1, const char *a2, ...)
{
  return _[a1 regularTransactionRatio];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllEntriesFromTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllEntriesFromTable:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFinanceTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFinanceTransactionIdentifier:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resetTotalRecordsProcessed(void *a1, const char *a2, ...)
{
  return _[a1 resetTotalRecordsProcessed];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveInsightsWithStartDate_endDate_insightTypeItems_trendWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveInsightsWithStartDate:endDate:insightTypeItems:trendWindow:");
}

id objc_msgSend_retrieveSpendInsightsWithStartDate_endDate_insightTypeItems_trendWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveSpendInsightsWithStartDate:endDate:insightTypeItems:trendWindow:");
}

id objc_msgSend_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safelySetObject:forKey:");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _[a1 secondsFromGMT];
}

id objc_msgSend_semanticTagsForMerchant_detailedCategory_dateHour_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "semanticTagsForMerchant:detailedCategory:dateHour:completion:");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setBoundaryStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoundaryStyle:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setCountry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountry:");
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryCode:");
}

id objc_msgSend_setDateTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateTemplate:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEventEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventEndDate:");
}

id objc_msgSend_setEventIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventIdentifiers:");
}

id objc_msgSend_setEventStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventStartDate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFetchPropertySets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchPropertySets:");
}

id objc_msgSend_setFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromDate:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setInternalPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalPredicate:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsInternationalSpend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInternationalSpend:");
}

id objc_msgSend_setIsTapToPay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTapToPay:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setMapsMerchantBrandID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapsMerchantBrandID:");
}

id objc_msgSend_setMapsMerchantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapsMerchantID:");
}

id objc_msgSend_setMerchantCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMerchantCategory:");
}

id objc_msgSend_setMerchantDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMerchantDisplayName:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setNaturalLanguageQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNaturalLanguageQuery:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setOrAddToDecimalValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrAddToDecimalValue:forKey:");
}

id objc_msgSend_setPastTimeRangesToRetagEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPastTimeRangesToRetagEvents:");
}

id objc_msgSend_setRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegion:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRepeatingPatternClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeatingPatternClass:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSmartCompoundFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSmartCompoundFeatures:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setTimeOfDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeOfDay:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToDate:");
}

id objc_msgSend_setTransactionDateAtZerothHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionDateAtZerothHour:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_shouldCallGetAllTransactions(void *a1, const char *a2, ...)
{
  return _[a1 shouldCallGetAllTransactions];
}

id objc_msgSend_signalDate(void *a1, const char *a2, ...)
{
  return _[a1 signalDate];
}

id objc_msgSend_smartCompoundFeatures(void *a1, const char *a2, ...)
{
  return _[a1 smartCompoundFeatures];
}

id objc_msgSend_sortDisputeDocumentSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDisputeDocumentSuggestions:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_specialCharsRegex(void *a1, const char *a2, ...)
{
  return _[a1 specialCharsRegex];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithCompletionHandler:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_streamTransactionsSince_transactionHandler_accountHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamTransactionsSince:transactionHandler:accountHandler:completionHandler:");
}

id objc_msgSend_streamTransactionsWithLimit_internalState_onTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamTransactionsWithLimit:internalState:onTransaction:");
}

id objc_msgSend_street(void *a1, const char *a2, ...)
{
  return _[a1 street];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate_toDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:toDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_submitWithHandler_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithHandler:queue:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_suggestAutoReload(void *a1, const char *a2, ...)
{
  return _[a1 suggestAutoReload];
}

id objc_msgSend_summaryItems(void *a1, const char *a2, ...)
{
  return _[a1 summaryItems];
}

id objc_msgSend_syncBankConnectTransactionsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncBankConnectTransactionsWithCompletion:");
}

id objc_msgSend_textSimilarityFeatures(void *a1, const char *a2, ...)
{
  return _[a1 textSimilarityFeatures];
}

id objc_msgSend_ticketForSpatialPlaceLookupParameters_traits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ticketForSpatialPlaceLookupParameters:traits:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _[a1 timeZone];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return _[a1 transactionCount];
}

id objc_msgSend_transactionDate(void *a1, const char *a2, ...)
{
  return _[a1 transactionDate];
}

id objc_msgSend_transactionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 transactionIdentifier];
}

id objc_msgSend_transactionReceiptWithUniqueID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionReceiptWithUniqueID:completion:");
}

id objc_msgSend_transactionSource(void *a1, const char *a2, ...)
{
  return _[a1 transactionSource];
}

id objc_msgSend_transactionStatus(void *a1, const char *a2, ...)
{
  return _[a1 transactionStatus];
}

id objc_msgSend_transactionStatusChangedDate(void *a1, const char *a2, ...)
{
  return _[a1 transactionStatusChangedDate];
}

id objc_msgSend_transactionType(void *a1, const char *a2, ...)
{
  return _[a1 transactionType];
}

id objc_msgSend_transactionWithTransactionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionWithTransactionID:completion:");
}

id objc_msgSend_transactionWithTransactionIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionWithTransactionIdentifier:completion:");
}

id objc_msgSend_trendsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trendsWithCompletion:");
}

id objc_msgSend_tripEventTitleNomalization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tripEventTitleNomalization:");
}

id objc_msgSend_tripMode(void *a1, const char *a2, ...)
{
  return _[a1 tripMode];
}

id objc_msgSend_tripParts(void *a1, const char *a2, ...)
{
  return _[a1 tripParts];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_updateDeleteFlagInTransactionFeatures_forID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeleteFlagInTransactionFeatures:forID:");
}

id objc_msgSend_updateFinanceTransactionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFinanceTransactionIdentifier:");
}

id objc_msgSend_updateGetAllStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGetAllStatus:");
}

id objc_msgSend_updatePeerPaymentAccountBalance_amount_currencyCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePeerPaymentAccountBalance:amount:currencyCode:");
}

id objc_msgSend_updateProcessingTimeForFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProcessingTimeForFeature:");
}

id objc_msgSend_updateProcessingTimeForFeature_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProcessingTimeForFeature:data:");
}

id objc_msgSend_updateTransactionInternalStateByIdentifier_newInternalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTransactionInternalStateByIdentifier:newInternalState:");
}

id objc_msgSend_updateTransactionWholeRaw_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTransactionWholeRaw:");
}

id objc_msgSend_updateTransactionsInternalStateToState_oldInternalState_newInternalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTransactionsInternalStateToState:oldInternalState:newInternalState:");
}

id objc_msgSend_updateTransactionsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTransactionsWithCompletion:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_wordEmbeddingForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wordEmbeddingForLanguage:");
}

id objc_msgSend_zero(void *a1, const char *a2, ...)
{
  return _[a1 zero];
}

id objc_msgSend_zip(void *a1, const char *a2, ...)
{
  return _[a1 zip];
}