void sub_100004748(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  id v6;
  void v7[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  BOOL v12;

  v2 = (void *)os_transaction_create();
  v3 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v12 = v2 != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "transaction = %d", buf, 8u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005534;
  v7[3] = &unk_10000C3E8;
  v4 = *(void *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v9 = v2;
  v10 = v5;
  v6 = v2;
  +[Categories_Service _lookupGenreIDAndCounterpartIdentifiersInPlist:v4 withCompletionHandler:v7];
}

void sub_1000049A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004B60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v22 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v22];
  id v5 = v22;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 != 0;
  id v6 = v4;
  v7 = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v21 = v5;
    v20 = [v6 iTunesMetadata];
    v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v20 genreIdentifier]);
    v9 = [v8 stringValue];

    v10 = [*(id *)(a1 + 48) _AppStoreIDToDHIDCategoriesMap];
    id v11 = [v10 objectForKey:v9];

    v12 = [v7 counterpartIdentifiers];
    v13 = +[CTCategory parentAppBundleIdentifierForAppRecord:v7];
    if (!v11) {
      id v11 = CTCategoryIdentifierOther;
    }
    if (v13)
    {
      v25[0] = v13;
      v25[1] = v3;
      v14 = (id *)v25;
      uint64_t v15 = 2;
    }
    else
    {
      id v24 = v3;
      v14 = &v24;
      uint64_t v15 = 1;
    }
    v17 = +[NSArray arrayWithObjects:v14 count:v15];
    id v23 = v11;
    v18 = +[NSArray arrayWithObjects:&v23 count:1];
    v16 = [v18 arrayByAddingObjectsFromArray:v17];

    if (v12)
    {
      uint64_t v19 = [v16 arrayByAddingObjectsFromArray:v12];

      v16 = (void *)v19;
    }
    id v5 = v21;
    [*(id *)(a1 + 32) setObject:v16 forKey:v3];
  }
  else
  {
    v13 = 0;
    v12 = 0;
    v16 = 0;
    id v11 = 0;
  }
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "CategoriesService startup requested", v6, 2u);
  }
  uint64_t v4 = objc_opt_new();
  id v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];
  objc_opt_new();
  dispatch_main();
}

void sub_1000051FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005218(uint64_t a1)
{
  if ((+[CTUtilities isClassCLocked] & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 32) indexVersionId];
    if ([v9 length])
    {
      v2 = (id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained(v2);
      uint64_t v4 = [WeakRetained currentIndexVersionID];
      unsigned __int8 v5 = [v4 isEqualToString:v9];

      if ((v5 & 1) == 0)
      {
        id v6 = [v9 copy];
        id v7 = objc_loadWeakRetained(v2);
        [v7 setCurrentIndexVersionID:v6];

        v8 = +[NSDistributedNotificationCenter defaultCenter];
        [v8 postNotificationName:CTCategoriesDidChangeNotification object:0 userInfo:0];
      }
    }
  }
}

void sub_100005534(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2080;
    v12 = "-[Categories_Service genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:replyHandler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "<%@>::replyHandler %s = %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000057FC(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  id v3 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v2 != 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "transaction = %d", buf, 8u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000596C;
  v9[3] = &unk_10000C3E8;
  id v10 = v6;
  id v7 = *(id *)(a1 + 56);
  id v11 = v2;
  id v12 = v7;
  id v8 = v2;
  +[Categories_Service _lookupAppStoreUsing:v4 platform:v5 clientApplication:v10 withCompletionHandler:v9];
}

void sub_10000596C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2080;
    id v12 = "-[Categories_Service lookupAppStoreForBundleIDs:platform:replyHandler:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "<%@>::replyHandler %s = %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005A6C(id a1)
{
  v3[0] = @"6000";
  v3[1] = @"6001";
  v4[0] = CTCategoryIdentifierProductivity;
  v4[1] = CTCategoryIdentifierReadingAndReference;
  v3[2] = @"6002";
  v3[3] = @"6003";
  v4[2] = CTCategoryIdentifierUtilities;
  v4[3] = CTCategoryIdentifierTravel;
  v3[4] = @"6004";
  v3[5] = @"6005";
  v4[4] = CTCategoryIdentifierEntertainment;
  v4[5] = CTCategoryIdentifierSocialNetworking;
  v3[6] = @"6006";
  v3[7] = @"6007";
  v4[6] = CTCategoryIdentifierReadingAndReference;
  v4[7] = CTCategoryIdentifierProductivity;
  v3[8] = @"6008";
  v3[9] = @"6009";
  v4[8] = CTCategoryIdentifierCreativity;
  v4[9] = CTCategoryIdentifierReadingAndReference;
  v3[10] = @"6010";
  v3[11] = @"6011";
  v4[10] = CTCategoryIdentifierTravel;
  v4[11] = CTCategoryIdentifierEntertainment;
  v3[12] = @"6012";
  v3[13] = @"6013";
  v4[12] = CTCategoryIdentifierOther;
  v4[13] = CTCategoryIdentifierHealthAndFitness;
  v3[14] = @"6014";
  v3[15] = @"6015";
  v4[14] = CTCategoryIdentifierGames;
  v4[15] = CTCategoryIdentifierProductivity;
  v3[16] = @"6016";
  v3[17] = @"6017";
  v4[16] = CTCategoryIdentifierEntertainment;
  v4[17] = CTCategoryIdentifierEducation;
  v3[18] = @"6018";
  v3[19] = @"6020";
  v4[18] = CTCategoryIdentifierReadingAndReference;
  v4[19] = CTCategoryIdentifierHealthAndFitness;
  v3[20] = @"6021";
  v3[21] = @"6022";
  v4[20] = CTCategoryIdentifierReadingAndReference;
  v4[21] = CTCategoryIdentifierReadingAndReference;
  v3[22] = @"6023";
  v3[23] = @"6024";
  v4[22] = CTCategoryIdentifierShoppingAndFood;
  v4[23] = CTCategoryIdentifierShoppingAndFood;
  v3[24] = @"6025";
  v3[25] = @"6026";
  v4[24] = CTCategoryIdentifierGames;
  v4[25] = CTCategoryIdentifierProductivity;
  v3[26] = @"6027";
  v4[26] = CTCategoryIdentifierCreativity;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:27];
  v2 = (void *)qword_100010F78;
  qword_100010F78 = v1;
}

void sub_100005D14(id a1)
{
  v3[0] = @"12001";
  v3[1] = @"12002";
  v4[0] = CTCategoryIdentifierProductivity;
  v4[1] = CTCategoryIdentifierProductivity;
  v3[2] = @"12003";
  v3[3] = @"12004";
  v4[2] = CTCategoryIdentifierEducation;
  v4[3] = CTCategoryIdentifierEntertainment;
  v3[4] = @"12005";
  v3[5] = @"12006";
  v4[4] = CTCategoryIdentifierProductivity;
  v4[5] = CTCategoryIdentifierGames;
  v3[6] = @"12007";
  v3[7] = @"12008";
  v4[6] = CTCategoryIdentifierHealthAndFitness;
  v4[7] = CTCategoryIdentifierOther;
  v3[8] = @"12010";
  v3[9] = @"12011";
  v4[8] = CTCategoryIdentifierHealthAndFitness;
  v4[9] = CTCategoryIdentifierEntertainment;
  v3[10] = @"12012";
  v3[11] = @"12013";
  v4[10] = CTCategoryIdentifierReadingAndReference;
  v4[11] = CTCategoryIdentifierCreativity;
  v3[12] = @"12014";
  v3[13] = @"12015";
  v4[12] = CTCategoryIdentifierProductivity;
  v4[13] = CTCategoryIdentifierReadingAndReference;
  v3[14] = @"12016";
  v3[15] = @"12017";
  v4[14] = CTCategoryIdentifierSocialNetworking;
  v4[15] = CTCategoryIdentifierEntertainment;
  v3[16] = @"12018";
  v3[17] = @"12019";
  v4[16] = CTCategoryIdentifierTravel;
  v4[17] = CTCategoryIdentifierUtilities;
  v3[18] = @"12020";
  v3[19] = @"12021";
  v4[18] = CTCategoryIdentifierCreativity;
  v4[19] = CTCategoryIdentifierReadingAndReference;
  v3[20] = @"12022";
  v4[20] = CTCategoryIdentifierCreativity;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:21];
  v2 = (void *)qword_100010F88;
  qword_100010F88 = v1;
}

void sub_10000630C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

uint64_t sub_100006354(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006364(uint64_t a1)
{
}

void sub_10000636C(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = qword_100010F70;
  if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = (void *)a1[4];
    *(_DWORD *)buf = 138478083;
    v52 = v11;
    __int16 v53 = 2112;
    id v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_lookupAppStoreUsing:%{private}@ == %@", buf, 0x16u);
  }
  id v12 = [v7 allValues];
  id v13 = [v12 count];

  if (v13)
  {
    v41 = v9;
    int v42 = a4;
    v45 = a1;
    id v43 = v8;
    id v44 = v7;
    id v14 = [v7 allValues];
    uint64_t v15 = [v14 firstObject];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v47;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v22 = [v21 genreIDs];
          if ([v22 count])
          {
            id v23 = +[Categories_Service _AppStoreIDToDHIDCategoriesMap];
            id v24 = [v22 firstObject];
            v25 = [v23 objectForKey:v24];

            if (!v25)
            {
              v26 = +[Categories_Service _macAppStoreIDToDHIDCategoriesMap];
              v27 = [v22 firstObject];
              v25 = [v26 objectForKey:v27];
            }
            v28 = (void *)qword_100010F70;
            if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
            {
              v29 = v28;
              v30 = [v21 bundleID];
              v31 = [v22 firstObject];
              *(_DWORD *)buf = 138478339;
              v52 = v30;
              __int16 v53 = 2112;
              id v54 = v31;
              __int16 v55 = 2112;
              v56 = v25;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "itunes.apple.com AppStore category: %{private}@ = %@ -> %@", buf, 0x20u);
            }
            if (v25)
            {
              v32 = (void *)v45[5];
              v50[0] = v25;
              v33 = [v21 bundleID];
              v50[1] = v33;
              v34 = +[NSArray arrayWithObjects:v50 count:2];
              v35 = [v21 bundleID];
              [v32 setObject:v34 forKey:v35];
            }
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v46 objects:v57 count:16];
      }
      while (v18);
    }

    id v8 = v43;
    id v7 = v44;
    a1 = v45;
    a4 = v42;
    int v9 = v41;
  }
  if (a4)
  {
    uint64_t v36 = [v8 objectForKey:@"CTStorePlatformiOS"];
    uint64_t v37 = *(void *)(a1[7] + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    v39 = qword_100010F70;
    if (os_log_type_enabled((os_log_t)qword_100010F70, OS_LOG_TYPE_INFO))
    {
      v40 = *(void **)(*(void *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v52 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Done _lookupAppStoreUsing: error = %@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_1000067AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v7 allKeys];
  int v9 = +[NSSet setWithArray:v8];
  [v5 minusSet:v9];

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  __int16 v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (v10)
  {
    v11();

    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) allObjects];
    id v13 = [v12 componentsJoinedByString:@","];

    id v14 = *(void **)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000695C;
    v17[3] = &unk_10000C538;
    long long v16 = *(_OWORD *)(a1 + 40);
    id v15 = (id)v16;
    long long v20 = v16;
    id v18 = *(id *)(a1 + 32);
    id v19 = v13;
    id v7 = v13;
    [v14 lookupAppWithBundleIDs:v7 deviceFamily:1 completionHandler:v17];

    id v6 = (id)v20;
  }
  else
  {
    v11();
  }
}

void sub_10000695C(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v7 allKeys];
  int v9 = +[NSSet setWithArray:v8];
  [v5 minusSet:v9];

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  __int16 v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  if (v10)
  {
    v11();

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006AAC;
    v14[3] = &unk_10000C510;
    id v15 = *(id *)(a1 + 48);
    [v12 lookupAppWithBundleIDs:v13 deviceFamily:8 completionHandler:v14];
    id v7 = v15;
  }
  else
  {
    v11();
  }
}

uint64_t sub_100006AAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000072C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000072EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007364(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138477827;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not resolve app from search result record: %{private}@", buf, 0xCu);
}

void sub_1000073B0(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138477827;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Successfully resolved search result: %{private}@", buf, 0xCu);
}

void sub_1000073FC(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138477827;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Corrupt result record: %{private}@", buf, 0xCu);
}

void sub_100007448()
{
  sub_1000072E0();
  sub_1000072C4((void *)&_mh_execute_header, &_os_log_default, v0, "Corrupt search results: %{private}@", v1, v2, v3, v4, v5);
}

void sub_1000074B8()
{
  sub_1000072E0();
  sub_1000072C4((void *)&_mh_execute_header, &_os_log_default, v0, "Corrupt search record: %{private}@", v1, v2, v3, v4, v5);
}

void sub_100007528()
{
  sub_1000072E0();
  sub_1000072C4((void *)&_mh_execute_header, &_os_log_default, v0, "Genre ID must be a NSString. Search result record: %@", v1, v2, v3, v4, v5);
}

void sub_100007598()
{
  sub_1000072E0();
  sub_1000072C4((void *)&_mh_execute_header, &_os_log_default, v0, "Genre IDs must be a NSArray. Search result record: %@", v1, v2, v3, v4, v5);
}

void sub_100007608()
{
  sub_1000072E0();
  sub_1000072C4((void *)&_mh_execute_header, &_os_log_default, v0, "Bundle ID must be a NSString. Search result record: %@", v1, v2, v3, v4, v5);
}

void sub_100007860()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error getting reachability flags", v0, 2u);
}

void sub_100007990(id a1)
{
  qword_100010F98 = objc_opt_new();
  _objc_release_x1();
}

void sub_100007E0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) mutableCopy];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100008024;
  v28[3] = &unk_10000C5C0;
  id v10 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v29 = v5;
  uint64_t v30 = v9;
  id v11 = v8;
  id v31 = v11;
  id v12 = v7;
  id v32 = v12;
  id v13 = v5;
  [v10 enumerateKeysAndObjectsUsingBlock:v28];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000081E0;
  v24[3] = &unk_10000C5E8;
  uint64_t v14 = *(void *)(a1 + 48);
  id v25 = v12;
  uint64_t v26 = v14;
  id v15 = v11;
  id v27 = v15;
  id v16 = v12;
  [v13 enumerateKeysAndObjectsUsingBlock:v24];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100008380;
  v21[3] = &unk_10000C610;
  uint64_t v17 = *(void *)(a1 + 48);
  id v22 = v15;
  uint64_t v23 = v17;
  id v18 = v15;
  [v6 enumerateKeysAndObjectsUsingBlock:v21];
  uint64_t v19 = *(void *)(a1 + 56);
  id v20 = [v16 copy];
  (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v20, v6);
}

void sub_100008024(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = v7;
  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v14 = [(id)objc_opt_class() resultByBundleID];
          id v15 = [v13 bundleID];
          [v14 setObject:v13 forKey:v15];

          id v16 = *(void **)(a1 + 48);
          uint64_t v17 = [v13 bundleID];
          [v16 removeObject:v17];
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    id v18 = [v8 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    id v18 = [v6 copy];
  }
  uint64_t v19 = v18;
  [*(id *)(a1 + 56) setObject:v18 forKeyedSubscript:v5];
}

void sub_1000081E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

  if (!v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v12);
          uint64_t v14 = objc_msgSend((id)objc_opt_class(), "resultByBundleID", (void)v18);
          id v15 = [v13 bundleID];
          [v14 setObject:v13 forKey:v15];

          id v16 = *(void **)(a1 + 48);
          uint64_t v17 = [v13 bundleID];
          [v16 removeObject:v17];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
  }
}

void sub_100008380(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:CTErrorKeyHTTPResponse];

  if ([v7 statusCode] == (id)502 || objc_msgSend(v7, "statusCode") == (id)503)
  {
    uint64_t v17 = v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "iTunes server is overloaded. Caching empty results for: %{public}@", buf, 0xCu);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 32);
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
          id v15 = [[CTAppStoreSearchResult alloc] initWithBundleID:v14 platform:v5];
          id v16 = [(id)objc_opt_class() resultByBundleID];
          [v16 setObject:v15 forKey:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    id v7 = v17;
  }
}

void sub_100008B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 256), 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008BBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008BCC(uint64_t a1)
{
}

void sub_100008BD4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v20 = 138477827;
    uint64_t v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "STORELOOKUP END: %{private}@", (uint8_t *)&v20, 0xCu);
  }
  id v11 = v8;
  if ([v11 statusCode] == (id)200)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = v7;
    uint64_t v14 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
LABEL_8:

    goto LABEL_9;
  }
  id v15 = *(NSObject **)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) + 8);
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    if (v9) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  sub_10000901C(a1, v15);
  if (!v9)
  {
LABEL_7:
    uint64_t v14 = objc_opt_new();
    [v14 setObject:v11 forKey:CTErrorKeyHTTPResponse];
    [v14 setObject:v7 forKey:CTErrorKeyHTTPResponseData];
    id v16 = objc_alloc((Class)NSError);
    id v17 = [v16 initWithDomain:CTErrorDomain code:-2001 userInfo:v14];
    uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    goto LABEL_8;
  }
LABEL_9:
  if (!--*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    [*(id *)(a1 + 40) handleSearchResultsWithTaskData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) platform:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) error:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

void sub_10000901C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "STORELOOKUP LOOKUP FAILED: %{private}@", (uint8_t *)&v3, 0xCu);
}

void sub_100009098(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_lookupAppStoreUsing: NETWORK UNREACHABLE : %@", (uint8_t *)&v2, 0xCu);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__AppStoreIDToDHIDCategoriesMap(void *a1, const char *a2, ...)
{
  return [a1 _AppStoreIDToDHIDCategoriesMap];
}

id objc_msgSend__macAppStoreIDToDHIDCategoriesMap(void *a1, const char *a2, ...)
{
  return [a1 _macAppStoreIDToDHIDCategoriesMap];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterpartIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 counterpartIdentifiers];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentIndexVersionID(void *a1, const char *a2, ...)
{
  return [a1 currentIndexVersionID];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_genreIDs(void *a1, const char *a2, ...)
{
  return [a1 genreIDs];
}

id objc_msgSend_genreIdentifier(void *a1, const char *a2, ...)
{
  return [a1 genreIdentifier];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_indexVersionId(void *a1, const char *a2, ...)
{
  return [a1 indexVersionId];
}

id objc_msgSend_isClassCLocked(void *a1, const char *a2, ...)
{
  return [a1 isClassCLocked];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_networkReachable(void *a1, const char *a2, ...)
{
  return [a1 networkReachable];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_resultByBundleID(void *a1, const char *a2, ...)
{
  return [a1 resultByBundleID];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}