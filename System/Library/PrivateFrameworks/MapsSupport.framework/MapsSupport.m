void sub_100003260(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  long long v7;
  long long v8;
  long long v9;
  long long v10;
  _OWORD v11[8];
  _OWORD v12[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = *(_OWORD *)(a1 + 152);
  v11[6] = *(_OWORD *)(a1 + 136);
  v11[7] = v7;
  v12[0] = *(_OWORD *)(a1 + 168);
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)(a1 + 180);
  v8 = *(_OWORD *)(a1 + 88);
  v11[2] = *(_OWORD *)(a1 + 72);
  v11[3] = v8;
  v9 = *(_OWORD *)(a1 + 120);
  v11[4] = *(_OWORD *)(a1 + 104);
  v11[5] = v9;
  v10 = *(_OWORD *)(a1 + 56);
  v11[0] = *(_OWORD *)(a1 + 40);
  v11[1] = v10;
  objc_msgSend(WeakRetained, "_handleShiftedCoordinate:fromClientLocation:", v11, a2, a3);
}

void sub_100003484(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateLocationIfAllowed:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "MapsSuggestionsNavdLocationManager.m";
      __int16 v7 = 1026;
      int v8 = 112;
      __int16 v9 = 2082;
      v10 = "-[MapsSuggestionsNavdLocationManager locationLeecher:receivedLocation:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_100003960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003984(uint64_t a1)
{
  [*(id *)(a1 + 32) coordinate];
  double v3 = v2;
  double v5 = v4;
  id v12 = *(id *)(*(void *)(a1 + 40) + 56);
  v6 = [v12 firstObject];
  [v6 coordinate];
  double v8 = v7;
  double v10 = v9;

  if (v8 != v3 && v10 != v5) {
    [v12 insertObject:*(void *)(a1 + 32) atIndex:0];
  }
  [*(id *)(a1 + 40) _pruneLeachedLocations];
}

void sub_100003BEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100004278(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleLeechedLocation:*(void *)(a1 + 32)];
}

void sub_1000042C8(uint64_t a1)
{
}

void sub_10000487C(id a1, NavdDoomIncident *a2, BOOL *a3)
{
}

id sub_100004B24(int a1)
{
  double v2 = objc_opt_new();
  double v3 = v2;
  if (a1)
  {
    [v2 addObject:@"gasoline"];
    if ((a1 & 0x100) == 0)
    {
LABEL_3:
      if ((a1 & 0x10000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a1 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"diesel"];
  if ((a1 & 0x10000) == 0)
  {
LABEL_4:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 addObject:@"electric"];
  if ((a1 & 0x1000000) != 0) {
LABEL_5:
  }
    [v3 addObject:@"cng"];
LABEL_6:

  return v3;
}

id sub_100004BC8(int a1)
{
  uint64_t v1 = sub_100004B24(a1);
  double v2 = [v1 componentsJoinedByString:@", "];

  return v2;
}

id sub_100004C20(void *a1)
{
  uint64_t v1 = qword_1000A2420;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1000A2420, &stru_100088D80);
  }
  double v3 = [(id)qword_1000A2418 objectForKeyedSubscript:v2];

  id v4 = [v3 longLongValue];
  return v4;
}

void sub_100004C9C(id a1)
{
  v3[0] = @"gasoline";
  v3[1] = @"diesel";
  v4[0] = &off_100090510;
  v4[1] = &off_100090528;
  v3[2] = @"electric";
  v3[3] = @"cng";
  v4[2] = &off_100090540;
  v4[3] = &off_100090558;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_1000A2418;
  qword_1000A2418 = v1;
}

void sub_100004E68(id a1)
{
  v7[0] = &off_100090510;
  v7[1] = &off_100090528;
  v8[0] = EAVehicleInfoRangeGasolineKey;
  v8[1] = EAVehicleInfoRangeDieselKey;
  v7[2] = &off_100090540;
  v7[3] = &off_100090558;
  v8[2] = EAVehicleInfoRangeElectricKey;
  v8[3] = EAVehicleInfoRangeCNGKey;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  id v2 = (void *)qword_1000A2428;
  qword_1000A2428 = v1;

  v5[0] = &off_100090510;
  v5[1] = &off_100090528;
  v6[0] = EAVehicleInfoHasLowDistanceRangeGasolineKey;
  v6[1] = EAVehicleInfoHasLowDistanceRangeDieselKey;
  v5[2] = &off_100090540;
  v5[3] = &off_100090558;
  v6[2] = EAVehicleInfoHasLowDistanceRangeElectricKey;
  v6[3] = EAVehicleInfoHasLowDistanceRangeCNGKey;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  id v4 = (void *)qword_1000A2430;
  qword_1000A2430 = v3;
}

void sub_10000566C(id a1)
{
  uint64_t v1 = (void *)qword_1000A2438;
  qword_1000A2438 = (uint64_t)&off_100090A60;
}

uint64_t sub_100005A3C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  GEOConfigGetPropertiesForKey();

  return 1;
}

void sub_100005AD8(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  if (!v3 && _GEOConfigHasValue())
  {
    id v4 = +[NSNumber numberWithInteger:GEOConfigGetInteger()];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  }
}

id sub_100005CB4()
{
  if (qword_1000A2480 != -1) {
    dispatch_once(&qword_1000A2480, &stru_100088EB8);
  }
  v0 = (void *)qword_1000A2478;

  return v0;
}

void sub_100006478(id a1)
{
  qword_1000A2448 = objc_alloc_init(MapsExternalAccessory);

  _objc_release_x1();
}

void sub_1000069D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v16 - 128));
  _Unwind_Resume(a1);
}

void sub_100006A60(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidConnect:v3];
}

void sub_100006ABC(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidUpdateVehicle:v3];
}

void sub_100006B18(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidUpdate:v3];
}

void sub_100006B74(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _accessoryDidDisconnect:v3];
}

void sub_100006F70(id a1)
{
  uint64_t v1 = objc_opt_new();
  v13 = sub_100004B24(16843009);
  v25[0] = @"com.apple.maps.FakeExternalAccessory.engine.type";
  v25[1] = @"com.apple.maps.FakeExternalAccessory.engine.low";
  v25[2] = @"com.apple.maps.FakeExternalAccessory.engine.full";
  +[NSArray arrayWithObjects:v25 count:3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      id v2 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v2);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v4 = v13;
        id v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v16;
          do
          {
            double v8 = 0;
            do
            {
              if (*(void *)v16 != v7) {
                objc_enumerationMutation(v4);
              }
              double v9 = +[NSString stringWithFormat:@"%@.%@", v3, *(void *)(*((void *)&v15 + 1) + 8 * (void)v8)];
              [v1 addObject:v9];

              double v8 = (char *)v8 + 1;
            }
            while (v6 != v8);
            id v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v6);
        }

        id v2 = (char *)v2 + 1;
      }
      while (v2 != v14);
      id v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }

  double v10 = (void *)qword_1000A2458;
  qword_1000A2458 = (uint64_t)v1;
}

id sub_1000071A4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_handleFake:");
}

void sub_100007590(id a1)
{
  qword_1000A2470 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000083A4(id a1)
{
  qword_1000A2478 = (uint64_t)os_log_create("com.apple.Maps", "CarExternalAccessory");

  _objc_release_x1();
}

void sub_100008B98(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) snapshotDataSource];
  id v2 = [v1 snapshot];

  [(id)objc_opt_class() saveToFilePath:0 storage:v2];
}

void sub_100008DF8(uint64_t a1, uint64_t a2, double a3)
{
  id v4 = -[NavdTTLCacheEntry initWithRowId:refreshTimestamp:state:cacheOperationQueue:cache:]([NavdTTLCacheEntry alloc], "initWithRowId:refreshTimestamp:state:cacheOperationQueue:cache:", a2, 0, *(void *)(*(void *)(a1 + 32) + 32), a3);
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v4];
}

id sub_1000092BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _resolvedMapItem:a3 error:a4 forPendingCacheEntry:a2 uuid:*(void *)(a1 + 40) osTransaction:*(void *)(a1 + 48) clientInfo:*(void *)(a1 + 56)];
}

void sub_100009740(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 clientInfoStates];
  [v2 callHandlers:v5 withHypothesis:v4];
}

id sub_1000097B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) _resolvedOriginWaypoint:a2 originWaypointError:a3 destinationWaypoint:a4 destinationWaypointError:a5 forKey:*(void *)(a1 + 40) pendingCacheEntry:*(void *)(a1 + 48) osTransaction:*(void *)(a1 + 56) clientInfo:*(void *)(a1 + 64)];
}

void sub_10000A1E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A2E0;
  v7[3] = &unk_100088FA8;
  id v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v5 = v3;
  id v6 = +[NSBlockOperation blockOperationWithBlock:v7];
  [*(id *)(*(void *)(a1 + 32) + 32) addOperation:v6];
}

id sub_10000A2E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolvedMapItem:*(void *)(a1 + 40) toRefreshPlannedDestination:*(void *)(a1 + 48) client:*(void *)(a1 + 56) osTransaction:*(void *)(a1 + 64)];
}

void sub_10000A5A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A6A4;
  v7[3] = &unk_100088FA8;
  id v4 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v5 = v3;
  id v6 = +[NSBlockOperation blockOperationWithBlock:v7];
  [*(id *)(*(void *)(a1 + 32) + 32) addOperation:v6];
}

id sub_10000A6A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolvedMapItem:*(void *)(a1 + 40) toOnlyPerformLocalUpdatesForPlannedDestination:*(void *)(a1 + 48) client:*(void *)(a1 + 56) osTransaction:*(void *)(a1 + 64)];
}

void sub_10000AB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000AB20(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000ABDC;
  v3[3] = &unk_100088FF8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  void v3[4] = *(void *)(a1 + 32);
  [v2 addOperationWithBlock:v3];
  objc_destroyWeak(&v4);
}

void sub_10000ABC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000ABDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138477827;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Timer fired to remove UUID %{private}@ from list of pending stops.", (uint8_t *)&v4, 0xCu);
  }

  if (WeakRetained) {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:WeakRetained];
  }
}

void sub_10000AE40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10000AF54;
  id v10 = &unk_100089048;
  int v4 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v3;
  id v13 = v4;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v5 = v3;
  id v6 = +[NSBlockOperation blockOperationWithBlock:&v7];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "addOperation:", v6, v7, v8, v9, v10, v11);
}

id sub_10000AF54(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolvedMapItem:*(void *)(a1 + 40) toStopMonitoringPlannedDestination:*(void *)(a1 + 48) clientInfo:*(void *)(a1 + 56) uuid:*(void *)(a1 + 64) osTransaction:*(void *)(a1 + 72)];
}

void sub_10000B2AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B398;
  v7[3] = &unk_100089098;
  void v7[4] = v4;
  id v8 = v3;
  uint64_t v12 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  [v5 addOperationWithBlock:v7];
}

id sub_10000B398(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resolvedMapItem:*(void *)(a1 + 40) toPostUINotification:*(void *)(a1 + 72) forDestination:*(void *)(a1 + 48) client:*(void *)(a1 + 56) osTransaction:*(void *)(a1 + 64)];
}

void sub_10000B56C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = [a3 handler];
  v5[2](v5, *(void *)(a1 + 32));

  id v6 = [*(id *)(a1 + 32) error];

  if (!v6)
  {
    uint64_t v7 = +[GEONavdAnalyticsManager sharedManager];
    id v8 = [v7 analyticsReporter];
    [v8 recordHypothesisCount:1 forClient:v9];
  }
}

void sub_10000B6E8(id a1)
{
  uint64_t v1 = [NavdLocationManager alloc];
  id v4 = +[MNHybridLocationProvider navdInstance];
  id v2 = [(NavdLocationManager *)v1 initWithLocationProvider:v4];
  id v3 = (void *)qword_1000A2488;
  qword_1000A2488 = (uint64_t)v2;
}

void sub_10000B9D0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "_q_locationRefreshActivityFired");
  [v3 setTaskCompleted];
}

id sub_10000BC34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_startLocationUpdate");
}

id sub_10000BDA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_stopLocationUpdate");
}

id sub_10000BE68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) timestamp];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = Current - v5;
    uint64_t v7 = +[GEONavdDefaults sharedInstance];
    [v7 locationReuseThreshold];
    double v9 = v8;

    if (v6 < v9)
    {
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 48);
        int v17 = 138477827;
        uint64_t v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Already cached location: %{private}@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "_q_stopLocationUpdate");
      return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v13 = *(void **)(v2 + 80);
  id v14 = [*(id *)(a1 + 40) copy];
  id v15 = objc_retainBlock(v14);
  [v13 addObject:v15];

  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Could not find a cached location. Running location manager to get some udpates.", (uint8_t *)&v17, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_q_startLocationUpdate");
}

void sub_10000C944(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_q_cancelStaleLocationTimer");
  objc_msgSend(WeakRetained, "_q_createActivityToUseStaleLocation:fireAtAbsoluteTime:", *(void *)(a1 + 32), *(double *)(a1 + 48));
}

void sub_10000D6F4(uint64_t a1, double a2, double a3)
{
  long long v22 = 0u;
  memset(v23, 0, 28);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  double v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 clientLocation];
  }
  *(double *)((char *)v16 + 4) = a2;
  *(double *)((char *)v16 + 12) = a3;
  id v7 = objc_alloc((Class)CLLocation);
  long long v29 = v21;
  long long v30 = v22;
  v31[0] = v23[0];
  *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)((char *)v23 + 12);
  long long v25 = v17;
  long long v26 = v18;
  long long v27 = v19;
  long long v28 = v20;
  *(_OWORD *)buf = v16[0];
  *(_OWORD *)&buf[16] = v16[1];
  id v8 = [v7 initWithClientLocation:buf];
  double v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138478083;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Notifying observers with shifted location: %{private}@. Original location was: %{private}@.", buf, 0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(NSObject **)(v11 + 88);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000D8D0;
  v14[3] = &unk_1000891A8;
  v14[4] = v11;
  id v15 = v8;
  id v13 = v8;
  dispatch_async(v12, v14);
}

id sub_10000D8D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_processCandidateLocation:", *(void *)(a1 + 40));
}

id sub_10000DA4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_processErrorWhenUpdatingCurrentLocation:", *(void *)(a1 + 40));
}

uint64_t start()
{
  v0 = sub_10000DC28();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "navd started.", v7, 2u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100089248);
  uint64_t v2 = objc_alloc_init(NavdController);
  id v3 = (void *)qword_1000A2498;
  qword_1000A2498 = (uint64_t)v2;

  [(id)qword_1000A2498 start];
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);

  dispatch_source_set_event_handler(v4, &stru_100089268);
  dispatch_activate(v4);
  double v5 = +[NSRunLoop currentRunLoop];
  [v5 run];

  return 0;
}

id sub_10000DC28()
{
  if (qword_1000A24A8 != -1) {
    dispatch_once(&qword_1000A24A8, &stru_100089288);
  }
  v0 = (void *)qword_1000A24A0;

  return v0;
}

void sub_10000DC80(id a1)
{
  uint64_t v1 = sub_10000DC28();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM received.", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_10000DCEC(id a1)
{
  qword_1000A24A0 = (uint64_t)os_log_create(MNLoggingSubsystem, "Navd");

  _objc_release_x1();
}

void sub_10000DF54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000E804(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E814(uint64_t a1)
{
}

void sub_10000E81C(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) nextAllowedRequestTime];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000E884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E9B4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  [v2 defaultPurgeAgeLimit];
  objc_msgSend(v2, "_purgeWithMaxAge:maxCount:", objc_msgSend(*(id *)(a1 + 32), "defaultPurgeCountLimit"), v3);
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = MapsSuggestionsNow();
  [v4 addObject:v5];

  double v6 = MapsSuggestionsNow();
  [*(id *)(a1 + 32) defaultMinTimeWhenHappy];
  objc_msgSend(v6, "dateByAddingTimeInterval:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [*(id *)(a1 + 32) _calculateNextAvailableTime];
  id v8 = [v7 laterDate:v9];
  [*(id *)(*(void *)(a1 + 32) + 40) setNextAllowedRequestTime:v8];
}

void sub_10000EAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EC70(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 code];
    if (v3 != [*(id *)(*(void *)(a1 + 40) + 24) code])
    {
      id v4 = [*(id *)(a1 + 32) domain];
      id v5 = [*(id *)(*(void *)(a1 + 40) + 24) domain];
      unsigned __int8 v6 = [v4 isEqualToString:v5];

      if ((v6 & 1) == 0)
      {
        id v7 = [*(id *)(a1 + 32) copy];
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = *(void **)(v8 + 24);
        *(void *)(v8 + 24) = v7;

        *(void *)(*(void *)(a1 + 40) + 32) = 0;
      }
    }
    uint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void **)(a1 + 32);
      int v28 = 138412290;
      long long v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Bad error: %@", (uint8_t *)&v28, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    ++*(void *)(*(void *)(a1 + 40) + 32);
    [*(id *)(a1 + 40) defaultCooldownTimeForError];
    double v13 = v12;
    [*(id *)(a1 + 40) defaultCooldownMultiplierPerError];
    id v14 = *(unint64_t **)(a1 + 40);
    double v16 = pow(v15, (double)v14[4]);
    [v14 defaultMaxCooldownTime];
    double v17 = v13 * v16;
    if (v17 >= v18)
    {
      [*(id *)(a1 + 40) defaultMaxCooldownTime];
      double v17 = v19;
    }
    long long v20 = [*(id *)(*(void *)(a1 + 40) + 40) nextAllowedRequestTime];
    long long v21 = MapsSuggestionsNow();
    long long v22 = [v21 dateByAddingTimeInterval:v17];
    v23 = [v20 laterDate:v22];
    [*(id *)(*(void *)(a1 + 40) + 40) setNextAllowedRequestTime:v23];

    GEOFindOrCreateLog();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      long long v25 = [*(id *)(*(void *)(a1 + 40) + 40) nextAllowedRequestTime];
      int v28 = 138412290;
      long long v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Bad error. Cool down until %@", (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v26 = *(void *)(a1 + 40);
    long long v27 = *(void **)(v26 + 24);
    *(void *)(v26 + 24) = 0;

    *(void *)(*(void *)(a1 + 40) + 32) = 0;
  }
}

void sub_10000EF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

void sub_10000F83C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = MapsSuggestionsDateFromString(*(void **)(a1 + 40));
      id v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        MapsSuggestionsStringFromDate(v3);
        id v5 = (char *)objc_claimAutoreleasedReturnValue();
        int v14 = 138412290;
        long double v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "DEBUG MODE: Faking an ExitTime prediction to: %@.", (uint8_t *)&v14, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      unsigned __int8 v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [WeakRetained uniqueName];
        int v14 = 138412546;
        long double v15 = v7;
        __int16 v16 = 2080;
        v17[0] = "updateExitTimeForLocation";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateExitTimeForLocation", "", (uint8_t *)&v14, 2u);
      }
    }
    else
    {
      id v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        long double v15 = (char *)objc_msgSend(@"DEBUG MODE: Would have faked an ExitTime, but not without location.", "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = +[NSError GEOErrorWithCode:-13 reason:@"DEBUG MODE: Would have faked an ExitTime, but not without location."];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

      double v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        double v13 = [WeakRetained uniqueName];
        int v14 = 138412546;
        long double v15 = v13;
        __int16 v16 = 2080;
        v17[0] = "updateExitTimeForLocation";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v14, 0x16u);
      }
      id v3 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v3))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateExitTimeForLocation", "", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446722;
      long double v15 = "NavdDoomRoutineExitTimeUpdater.m";
      __int16 v16 = 1026;
      LODWORD(v17[0]) = 63;
      WORD2(v17[0]) = 2082;
      *(void *)((char *)v17 + 6) = "-[NavdDoomRoutineExitTimeUpdater updateExitTimeForLocation:time:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

void sub_10000FC78(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 2);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000FE40;
    v9[3] = &unk_100089350;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 48);
    [v5 predictedExitTimeFromLocation:v6 date:v7 handler:v9];

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v13 = "NavdDoomRoutineExitTimeUpdater.m";
      __int16 v14 = 1026;
      int v15 = 85;
      __int16 v16 = 2082;
      double v17 = "-[NavdDoomRoutineExitTimeUpdater updateExitTimeForLocation:time:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10000FE24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000FE40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010020;
    block[3] = &unk_100089328;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v12 = v6;
    id v15 = *(id *)(a1 + 32);
    double v13 = v8;
    id v14 = v5;
    dispatch_async(v9, block);

    objc_destroyWeak(&v16);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      double v18 = "NavdDoomRoutineExitTimeUpdater.m";
      __int16 v19 = 1026;
      int v20 = 90;
      __int16 v21 = 2082;
      long long v22 = "-[NavdDoomRoutineExitTimeUpdater updateExitTimeForLocation:time:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100010020(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = *(char **)(a1 + 32);
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error from CoreRoutine: %@", (uint8_t *)&v15, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [*(id *)(a1 + 40) uniqueName];
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2080;
        v18[0] = "updateExitTimeForLocation";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
LABEL_23:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateExitTimeForLocation", "", (uint8_t *)&v15, 2u);
      }
    }
    else if (*(void *)(a1 + 48))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      uint64_t v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [*(id *)(a1 + 40) uniqueName];
        int v15 = 138412546;
        id v16 = v9;
        __int16 v17 = 2080;
        v18[0] = "updateExitTimeForLocation";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
        goto LABEL_23;
      }
    }
    else
    {
      id v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        id v16 = (char *)[@"CoreRoutine doesn't know this place" UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v11 = *(void *)(a1 + 56);
      id v12 = +[NSError GEOErrorWithCode:-13 reason:@"CoreRoutine doesn't know this place"];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

      double v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [*(id *)(a1 + 40) uniqueName];
        int v15 = 138412546;
        id v16 = v14;
        __int16 v17 = 2080;
        v18[0] = "updateExitTimeForLocation";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
        goto LABEL_23;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      id v16 = "NavdDoomRoutineExitTimeUpdater.m";
      __int16 v17 = 1026;
      LODWORD(v18[0]) = 92;
      WORD2(v18[0]) = 2082;
      *(void *)((char *)v18 + 6) = "-[NavdDoomRoutineExitTimeUpdater updateExitTimeForLocation:time:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

void sub_100010610(id a1)
{
  uint64_t v1 = [MapsSuggestionsNavdMapsAppLocationManager alloc];
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("MapsSuggestionsNavdMapsAppLocationManagerQueue", v5);
  id v3 = [(MapsSuggestionsNavdMapsAppLocationManager *)v1 initWithName:@"MapsSuggestionsNavdMapsAppLocationManager" queue:v2];
  id v4 = (void *)qword_1000A24B0;
  qword_1000A24B0 = (uint64_t)v3;
}

void sub_100010E08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _done];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdDoomMapsSuggestionsUpdater.m";
      __int16 v6 = 1026;
      int v7 = 63;
      __int16 v8 = 2082;
      id v9 = "-[NavdDoomMapsSuggestionsUpdater initWithLocationUpdater:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_1000117B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000117D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(unsigned __int8 *)(v8 + 56);
    int v10 = *(unsigned __int8 *)(v8 + 57);
    id v11 = v5;
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "_copyAllowedDestinations", buf, 2u);
    }

    if (v11)
    {
      if ([v11 count])
      {
        long long v27 = WeakRetained;
        id v28 = v6;
        id v29 = v5;
        id v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = v11;
        id v14 = [v13 countByEnumeratingWithState:&v31 objects:buf count:16];
        if (!v14) {
          goto LABEL_29;
        }
        id v15 = v14;
        uint64_t v16 = *(void *)v32;
        while (1)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v13);
            }
            double v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (v10)
            {
              [*(id *)(*((void *)&v31 + 1) + 8 * i) weight];
              if (v19 <= 0.0)
              {
                long long v22 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v35 = 138412290;
                  v36 = v18;
                  v23 = v22;
                  v24 = "Dropped for DOoM because of weight: %@";
                  goto LABEL_25;
                }
LABEL_26:

                continue;
              }
            }
            int v20 = [v18 geoMapItem];

            if (!v20)
            {
              long long v22 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_26;
              }
              *(_DWORD *)v35 = 138412290;
              v36 = v18;
              v23 = v22;
              v24 = "Dropped for DOoM because no geoMapItem: %@";
LABEL_25:
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, v24, v35, 0xCu);
              goto LABEL_26;
            }
            __int16 v21 = (char *)[v18 type];
            if (!v9)
            {
              if ((unint64_t)(v21 - 1) <= 1)
              {
LABEL_22:
                long long v22 = [v18 copy];
                [v30 addObject:v22];
                goto LABEL_26;
              }
              long long v22 = GEOFindOrCreateLog();
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_26;
              }
              *(_DWORD *)v35 = 138412290;
              v36 = v18;
              v23 = v22;
              v24 = "Dropped for DOoM because of type: %@";
              goto LABEL_25;
            }
            if (v21 != (char *)17) {
              goto LABEL_22;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v31 objects:buf count:16];
          if (!v15)
          {
LABEL_29:

            id v25 = [v30 copy];
            id v6 = v28;
            id v5 = v29;
            id WeakRetained = v27;
            goto LABEL_35;
          }
        }
      }
      id v25 = &__NSArray0__struct;
    }
    else
    {
      id v25 = 0;
    }
LABEL_35:

    uint64_t v26 = WeakRetained[4];
    WeakRetained[4] = v25;
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v38 = "NavdDoomMapsSuggestionsUpdater.m";
      __int16 v39 = 1026;
      int v40 = 245;
      __int16 v41 = 2082;
      v42 = "-[NavdDoomMapsSuggestionsUpdater _refreshEntries]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100011DB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) copy];
    int v4 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = v3;

    id v5 = (void *)*((void *)WeakRetained + 3);
    if (!v5)
    {
      id v6 = objc_alloc_init((Class)MapsSuggestionsShortcutFilter);
      id v7 = objc_alloc_init((Class)MapsSuggestionsNearbyFilter);
      uint64_t v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, 0);

      int v9 = +[MapsSuggestionsEngineBuilder forDevice];
      id v10 = objc_loadWeakRetained((id *)WeakRetained + 5);
      id v11 = [v9 withLocationUpdater:v10];
      id v12 = [v11 withoutTracker];
      id v13 = [v12 withPreFilters:v8];
      uint64_t v14 = [v13 build];
      id v15 = (void *)*((void *)WeakRetained + 3);
      *((void *)WeakRetained + 3) = v14;

      id v5 = (void *)*((void *)WeakRetained + 3);
    }
    [v5 attachSink:WeakRetained];
    [WeakRetained _refreshEntries];
    uint64_t v16 = *((void *)WeakRetained + 2);
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    GEOFindOrCreateLog();
    double v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      int v20 = "NavdDoomMapsSuggestionsUpdater.m";
      __int16 v21 = 1026;
      int v22 = 258;
      __int16 v23 = 2082;
      v24 = "-[NavdDoomMapsSuggestionsUpdater updateDestinationsForDuration:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001218C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = GEOFindOrCreateLog();
  int v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v5 = [*(id *)(a1 + 32) count];
      int v7 = 67109120;
      LODWORD(v8) = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Calling back with %u destinations", (uint8_t *)&v7, 8u);
    }

    (*(void (**)(void))(WeakRetained[6] + 16))();
    id v6 = WeakRetained[6];
    WeakRetained[6] = 0;
  }
  else
  {
    id v6 = v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      uint64_t v8 = "NavdDoomMapsSuggestionsUpdater.m";
      __int16 v9 = 1026;
      int v10 = 301;
      __int16 v11 = 2082;
      id v12 = "-[NavdDoomMapsSuggestionsUpdater _done]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

uint64_t sub_10001240C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001241C(uint64_t a1)
{
}

uint64_t sub_100012424(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];

  return _objc_release_x1();
}

void sub_1000124E4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "detachSink:");
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

void sub_1000125FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _refreshEntries];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      unsigned int v5 = "NavdDoomMapsSuggestionsUpdater.m";
      __int16 v6 = 1026;
      int v7 = 344;
      __int16 v8 = 2082;
      __int16 v9 = "-[NavdDoomMapsSuggestionsUpdater invalidateForMapsSuggestionsManager:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100012E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100013014(id a1, MapsSuggestionsEntry *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc_init(MapsSuggestionsOfflineService);
  unsigned __int8 v4 = [(MapsSuggestionsOfflineService *)v3 shouldKeepEntryWhenOffline:v2];

  return v4;
}

void sub_100013068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000131D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000133E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013418(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = *(void **)(a1 + 32);
  id v6 = v3;
  unsigned int v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 hash]);
  [v4 addObject:v5];
}

void sub_100013490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

id sub_100013CAC(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (qword_1000A24C8 != -1) {
    dispatch_once(&qword_1000A24C8, &stru_1000894C0);
  }
  id v3 = (id)qword_1000A24C0;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = (unint64_t)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15);
        if ((v8 & a1) != 0)
        {
          unint64_t v9 = v8;
          int v10 = objc_opt_new();
          __int16 v11 = v10;
          id v12 = &off_1000905E8;
          switch(v9)
          {
            case 1uLL:
              goto LABEL_13;
            case 2uLL:
              [v10 addObject:&off_100090600];
              id v12 = &off_100090618;
              goto LABEL_13;
            case 4uLL:
              id v12 = &off_100090630;
              goto LABEL_13;
            case 8uLL:
              id v12 = &off_100090648;
LABEL_13:
              [v11 addObject:v12];
              break;
            default:
              break;
          }
          [v2 addObjectsFromArray:v11];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  id v13 = [v2 copy];

  return v13;
}

void sub_100013EC8(id a1)
{
  uint64_t v1 = (void *)qword_1000A24C0;
  qword_1000A24C0 = (uint64_t)&off_100090A78;
}

void sub_100013EE0()
{
  if (qword_1000A24D0 != -1) {
    dispatch_once(&qword_1000A24D0, &stru_1000895A8);
  }
}

void sub_100013F08(id a1)
{
  byte_1000A1240 = 1;
  __GEOConfigRegisterStateCaptureFunctions(sub_100013F38, sub_100013F44);
}

_UNKNOWN **sub_100013F38()
{
  return &off_100090A90;
}

_UNKNOWN **sub_100013F44()
{
  return &off_100090AA8;
}

id sub_100013F50(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_100013F5C(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_100013F68(id a1)
{
  return &off_1000906C0;
}

id sub_100013F74()
{
  if (qword_1000A25E8 != -1) {
    dispatch_once(&qword_1000A25E8, &stru_100089628);
  }
  v0 = (void *)qword_1000A25E0;

  return v0;
}

void sub_100013FC8(id a1)
{
  qword_1000A25E0 = (uint64_t)os_log_create("com.apple.Maps", "VirtualGarage");

  _objc_release_x1();
}

unint64_t NavdScoreInTimeWindow(void *a1, double a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2 >= 0.01 && ([v3 containsKey:@"MapsSuggestionsScheduledTimeKey"] & 1) != 0)
  {
    id v5 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    uint64_t v6 = v5;
    if (!v5) {
      goto LABEL_8;
    }
    double v7 = MapsSuggestionsSecondsTo(v5);
    GEOConfigGetDouble();
    double v8 = v7 - a2;
    if (v7 - a2 <= v9)
    {
      GEOConfigGetDouble();
      double v15 = v14;
      GEOConfigGetDouble();
      double v17 = v16;
      long long v18 = [v4 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
      double v19 = v18;
      if (v18
        && (double v20 = MapsSuggestionsSecondsTo(v18),
            double v21 = MapsSuggestionsSecondsTo(v6),
            GEOConfigGetDouble(),
            double v22 = v20 - v21,
            v22 < v23))
      {
        double v24 = v22 * 0.5;
        if (v17 >= v22 * 0.5) {
          double v24 = v17;
        }
      }
      else
      {
        double v24 = v17;
        double v22 = v15;
      }
      if (v24 <= -v8)
      {
        if (v22 >= -v8)
        {
          unint64_t v10 = (unint64_t)&GEOConfigNavdRouteGeniusScore_MinScore;
          GEOConfigGetDouble();
          double v38 = v37;
          GEOConfigGetDouble();
          double v40 = v39;
          GEOConfigGetDouble();
          LODWORD(v10) = llround(v41 + -(v38 - v40) / (v22 - v24) * (v8 + v22));
        }
        else
        {
          unint64_t v10 = 0x80000000;
        }
      }
      else
      {
        GEOConfigGetDouble();
        unint64_t v10 = (int)v25;
      }

      goto LABEL_21;
    }
    unint64_t v10 = (unint64_t)&GEOConfigNavdRouteGeniusScore_MaxTimeUntilStart;
    GEOConfigGetDouble();
    if (v8 <= v11)
    {
      GEOConfigGetDouble();
      double v27 = v26;
      GEOConfigGetDouble();
      double v29 = v28;
      GEOConfigGetDouble();
      double v31 = v30;
      GEOConfigGetDouble();
      double v33 = v32;
      GEOConfigGetDouble();
      double v35 = v34;
      GEOConfigGetDouble();
      LODWORD(v10) = llround(v35 + (v27 - v29) / (v31 - v33) * (v8 - v36));
    }
    else
    {
LABEL_8:
      GEOConfigGetDouble();
      unint64_t v10 = (int)v13;
    }
LABEL_21:

    goto LABEL_22;
  }
  GEOConfigGetDouble();
  unint64_t v10 = (int)v12;
LABEL_22:

  return v10;
}

void sub_1000142B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NavdScoreLocationHistory(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v10)
  {
    int v63 = 0;
    uint64_t v11 = *(void *)v65;
    double v50 = a3;
    double v51 = a4;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v65 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        objc_msgSend(v13, "coordinate", *(void *)&v50, *(void *)&v51);
        [v13 coordinate];
        GEOCalculateDistance();
        double v15 = v14;
        double v16 = [v13 timestamp];
        [v8 timeIntervalSinceDate:v16];
        double v18 = v17;

        GEOConfigGetDouble();
        if (v18 <= v19)
        {
          GEOConfigGetDouble();
          double v20 = round(v15 * 100.0) / 100.0;
          if (v20 <= v21)
          {
            GEOConfigGetDouble();
            if (v20 >= v22)
            {
              GEOConfigGetDouble();
              double v62 = v23;
              GEOConfigGetDouble();
              double v61 = v24;
              GEOConfigGetDouble();
              double v60 = v25;
              GEOConfigGetDouble();
              double v59 = v26;
              GEOConfigGetDouble();
              double v58 = v27;
              GEOConfigGetDouble();
              double v57 = v28;
              GEOConfigGetDouble();
              double v56 = v29;
              GEOConfigGetDouble();
              double v55 = v30;
              GEOConfigGetDouble();
              double v54 = v31;
              GEOConfigGetDouble();
              double v53 = v32;
              GEOConfigGetDouble();
              double v52 = v33;
              GEOConfigGetDouble();
              double v35 = v34;
              GEOConfigGetDouble();
              double v37 = v36;
              GEOConfigGetDouble();
              double v39 = v38;
              GEOConfigGetDouble();
              double v41 = v40;
              GEOConfigGetDouble();
              double v43 = v42;
              GEOConfigGetDouble();
              double v45 = v44;
              GEOConfigGetDouble();
              double v47 = round(fmin(v37, fmax(v39, v58 - (v62 - v61) / (v60 - v59) * v57 + (v62 - v61) / (v60 - v59) * v20))+ fmin(v41, fmax(v43, v52 - (v56 - v55) / (v54 - v53) * v35 + (v56 - v55) / (v54 - v53) * v18)));
              if (v47 < v45) {
                double v47 = v45;
              }
              if (v47 <= v46) {
                double v46 = v47;
              }
              int v48 = v63;
              if (v63 >= (int)v46) {
                int v48 = (int)v46;
              }
              int v63 = v48;
            }
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v10);
  }
  else
  {
    int v63 = 0;
  }

  return v63;
}

void sub_1000146A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NavdScoreMapsSuggestionsEntry(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 weight];
  double v6 = v5;
  GEOConfigGetDouble();
  double v8 = v7;
  id v9 = v4;
  id v10 = MapsSuggestionsNow();
  [v10 timeIntervalSinceDate:v9];
  double v12 = v11;
  GEOConfigGetDouble();
  double v13 = 0.0;
  if (v12 <= v14)
  {
    double v13 = 1.0;
    if (v9)
    {
      if (v12 >= 0.0)
      {
        GEOConfigGetDouble();
        double v13 = 1.0 - v12 / v15;
      }
    }
  }

  return (int)(v6 * v8 * v13);
}

void sub_1000147E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NavdScoreGeodisicDistance(void *a1, double a2, double a3)
{
  double v33 = a2;
  double v34 = a3;
  id v3 = a1;
  id v4 = [v3 count];
  if ((uint64_t)v4 >= GEOConfigGetInteger())
  {
    double v6 = [v3 firstObject];
    [v6 timeInterval];
    double v8 = v7;

    id v9 = [v3 firstObject];
    objc_msgSend(v9, "distanceTo:", v33, v34);
    double v11 = v10;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v3;
    id v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v36;
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v12);
          }
          double v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_msgSend(v21, "timeInterval", *(void *)&v33, *(void *)&v34, (void)v35);
          double v23 = v22;
          objc_msgSend(v21, "distanceTo:", v33, v34);
          double v25 = v24 - v11;
          double v19 = v19 + (v23 - v8) * v25;
          double v18 = v18 + v23 - v8;
          double v17 = v17 + v25;
          double v15 = v15 + (v23 - v8) * (v23 - v8);
          double v16 = v16 + v23 - v8;
        }
        id v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v13);
    }
    else
    {
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      double v18 = 0.0;
      double v19 = 0.0;
    }

    GEOConfigGetDouble();
    double v27 = v26;
    GEOConfigGetDouble();
    double v29 = v28;
    GEOConfigGetDouble();
    double v31 = (v19 * (double)(uint64_t)v4 - v17 * v18) / (v15 * (double)(uint64_t)v4 - v16 * v16) / v27;
    if (v31 < v29) {
      double v31 = v29;
    }
    if (v31 <= v30) {
      double v30 = v31;
    }
    uint64_t v5 = (int)v30;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_100014A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NavdScoreOffRoute(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 valueForKeyPath:@"@sum.penalty"];
  [v2 doubleValue];
  double v4 = v3;

  GEOConfigGetDouble();
  if (v4 <= v5)
  {
    GEOConfigGetDouble();
    double v8 = v7;
    GEOConfigGetDouble();
    if (v4 >= v8) {
      double v10 = v4;
    }
    else {
      double v10 = v8;
    }
    if (v10 <= v9) {
      double v11 = v10;
    }
    else {
      double v11 = v9;
    }
    GEOConfigGetDouble();
    double v13 = v12;
    GEOConfigGetDouble();
    double v15 = v14;
    GEOConfigGetDouble();
    uint64_t v6 = (int)(v13 - (double)(int)(v11 * (v15 - v16)));
  }
  else
  {
    uint64_t v6 = 0x80000000;
  }

  return v6;
}

void sub_100014BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000150BC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 copy];
  [v3 setNonRecommendedRoutesCache:v4];
}

void sub_10001511C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v17 = WeakRetained;
  if (WeakRetained)
  {
    double v18 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    double v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446722;
      double v21 = "NavdDoomGEORoutesManager.m";
      __int16 v22 = 1026;
      int v23 = 87;
      __int16 v24 = 2082;
      double v25 = "-[NavdDoomGEORoutesManager requestRouteFrom:to:routeCache:completionHandler:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v20, 0x1Cu);
    }
  }
}

void sub_100015780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001583C(id a1)
{
  qword_1000A24D8 = objc_alloc_init(NavdLocationAuthorizationMonitor);

  _objc_release_x1();
}

void sub_100015940()
{
  v0 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Authorization status changed", v2, 2u);
  }

  id v1 = +[NavdLocationAuthorizationMonitor sharedMonitor];
  [v1 _reset];
}

id sub_100015AD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_reset");
}

void sub_100015FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id sub_100015FDC(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_q_getAuthorizationForLocationWithBundleIdentifier:", *(void *)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_100016014(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[CLLocationManager navdLocationBundleSource];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_q_getAuthorizationForLocationWithBundleIdentifier:", v3);
}

void sub_1000162AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016390(uint64_t a1)
{
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_1000164B8(WeakRetained, WeakRetained[11]);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      double v5 = "NavdRouteGenius.mm";
      __int16 v6 = 1026;
      int v7 = 332;
      __int16 v8 = 2082;
      double v9 = "-[NavdRouteGenius forceReroute]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10001649C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000164B8(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    if (v3 && ([v3 entry], double v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
    {
      __int16 v6 = MapsSuggestionsMostRecentLocation();
      if (qword_1000A24E8 != -1) {
        dispatch_once(&qword_1000A24E8, &stru_100089A78);
      }
      int v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v28 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
      }

      if (v6)
      {
        __int16 v8 = MapsSuggestionsNow();
        double v9 = [v6 timestamp];
        [v8 timeIntervalSinceDate:v9];
        BOOL v11 = v10 > *(double *)&qword_1000A24F0;

        if (!v11)
        {
          id v13 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v6];
          if (v13)
          {
            [v4 setRoute:0];
            [v4 loadRoute];
            id v14 = [v4 destinationWaypoint];
            BOOL v15 = v14 == 0;

            if (v15)
            {
              GEOFindOrCreateLog();
              int v20 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                double v21 = [v4 entry];
                *(_DWORD *)buf = 138412290;
                double v28 = v21;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Getting waypoint for entry : %@", buf, 0xCu);
              }
              objc_initWeak((id *)buf, a1);
              __int16 v22 = (void *)a1[3];
              int v23 = [v4 entry];
              v24[0] = _NSConcreteStackBlock;
              v24[1] = 3221225472;
              v24[2] = sub_100019ECC;
              v24[3] = &unk_1000897C0;
              objc_copyWeak(&v26, (id *)buf);
              id v25 = v4;
              [v22 requestWaypointForEntry:v23 completion:v24];

              objc_destroyWeak(&v26);
              objc_destroyWeak((id *)buf);
            }
            else
            {
              GEOFindOrCreateLog();
              double v16 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                double v17 = [v4 entry];
                double v18 = [v17 title];
                *(_DWORD *)buf = 138412290;
                double v28 = v18;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Ready to request Route : %@", buf, 0xCu);
              }
              sub_10001A478((id *)a1, v4);
            }
          }
          else
          {
            double v19 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Unable to convert currentLocation in to geoLocation", buf, 2u);
            }
          }
          goto LABEL_27;
        }
      }

      __int16 v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v12 = "We don't know where we are, so we can not get a route";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v12, buf, 2u);
      }
    }
    else
    {
      __int16 v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v12 = "We have no entry to get a route for";
        goto LABEL_14;
      }
    }
LABEL_27:
  }
}

void sub_10001692C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_100016AC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100016BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100016C0C(NSObject **a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = v5;
    __int16 v8 = *a1;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000202D8;
    v10[3] = &unk_100089AA0;
    BOOL v11 = v7;
    id v12 = v6;
    dispatch_async(v8, v10);

    double v9 = v11;
  }
  else
  {
    double v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      __int16 v15 = 1024;
      int v16 = 208;
      __int16 v17 = 2082;
      double v18 = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = NavdRouteGenius]";
      __int16 v19 = 2082;
      int v20 = "nil == (callerSelf)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
    }
  }
}

void sub_100016DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016DB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*((unsigned char *)v3 + 136))
  {
    int v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "RouteGenius already started", buf, 2u);
    }
  }
  else
  {
    id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "startLocationUpdatesForDelegate:");
    *((unsigned char *)v3 + 136) = 1;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000174DC;
    v44[3] = &unk_100089710;
    from = (id *)(a1 + 40);
    objc_copyWeak(&v45, (id *)(a1 + 40));
    id v38 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:v44 name:@"routeGeniusTooCloseToTriggerLocationFilter"];
    id v37 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089730 name:@"routeGeniusLockedOrHiddenFilter"];
    id v39 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089750 name:@"routeGeniusAllowedTypesFilter"];
    id v40 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089770];
    id v6 = +[MapsSuggestionsEngineBuilder forDevice];
    int v7 = [v6 withoutTracker];
    __int16 v8 = +[MapsSuggestionsNavdMapsAppLocationManager sharedLocationManager];
    double v9 = [v7 withLocationUpdater:v8];
    id v10 = objc_alloc_init((Class)MapsSuggestionsShortcutFilter);
    BOOL v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, 0);
    id v12 = [v9 withPreFilters:v11];
    uint64_t v13 = [v12 build];
    id v14 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v13;

    __int16 v15 = (void *)*((void *)v3 + 2);
    id v16 = objc_alloc_init((Class)MapsSuggestionsZeroWeightFilter);
    [v15 addAdditionalFilter:v16 forSink:*(void *)(a1 + 32)];

    [*((id *)v3 + 2) addAdditionalFilter:v39 forSink:*(void *)(a1 + 32)];
    [*((id *)v3 + 2) addAdditionalFilter:v40 forSink:*(void *)(a1 + 32)];
    [*((id *)v3 + 2) addAdditionalFilter:v38 forSink:*(void *)(a1 + 32)];
    [*((id *)v3 + 2) addAdditionalFilter:v37 forSink:*(void *)(a1 + 32)];
    id v17 = *(id *)(a1 + 32);
    objc_sync_enter(v17);
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 176))
    {
      double v18 = MapsSuggestionsMostRecentLocation();
      if (qword_1000A24E8 != -1) {
        dispatch_once(&qword_1000A24E8, &stru_100089A78);
      }
      __int16 v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v47 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
      }

      if (!v18) {
        goto LABEL_12;
      }
      int v20 = MapsSuggestionsNow();
      double v21 = [v18 timestamp];
      [v20 timeIntervalSinceDate:v21];
      BOOL v23 = v22 > *(double *)&qword_1000A24F0;

      if (!v23) {
        id v24 = v18;
      }
      else {
LABEL_12:
      }
        id v24 = 0;

      uint64_t v25 = *(void *)(a1 + 32);
      id v26 = *(void **)(v25 + 168);
      *(void *)(v25 + 168) = v24;

      *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
    }
    objc_sync_exit(v17);

    double v27 = MapsSuggestionsMostRecentLocation();
    if (qword_1000A24E8 != -1) {
      dispatch_once(&qword_1000A24E8, &stru_100089A78);
    }
    double v28 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
    }

    if (!v27) {
      goto LABEL_21;
    }
    double v29 = MapsSuggestionsNow();
    double v30 = [v27 timestamp];
    [v29 timeIntervalSinceDate:v30];
    BOOL v32 = v31 > *(double *)&qword_1000A24F0;

    if (!v32) {
      id v33 = v27;
    }
    else {
LABEL_21:
    }
      id v33 = 0;

    double v34 = (void *)*((void *)v3 + 3);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100017A2C;
    v41[3] = &unk_1000897C0;
    objc_copyWeak(&v43, from);
    id v42 = v33;
    id v35 = v33;
    [v34 requestWaypointForCurrentLocation:v35 completion:v41];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
  }
}

void sub_100017384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  objc_sync_exit(v23);
  objc_destroyWeak(location);

  _Unwind_Resume(a1);
}

BOOL sub_1000174DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    if (LOBYTE(v6[22].isa))
    {
      int v7 = v6[21].isa;
      if (v7) {
        goto LABEL_9;
      }
      __int16 v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "TriggerLocation is nil. It should not be.", (uint8_t *)&v18, 2u);
      }

      double v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "TriggerLocation is nil. Trying with the CurrentBestLocation now.", (uint8_t *)&v18, 2u);
      }

      int v7 = MapsSuggestionsCurrentBestLocation();
      if (v7)
      {
LABEL_9:
        id v10 = [v3 geoMapItem];
        [v10 coordinate];
        BOOL v11 = CLLocationFromGEOLocationCoordinate2D();

        [v7 distanceFromLocation:v11];
        double v13 = v12;
        GEOConfigGetDouble();
        BOOL v15 = v13 > v14;
      }
      else
      {
        id v17 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "TriggerLocation with currentBestLocation is also nil. It should not be.", (uint8_t *)&v18, 2u);
        }

        int v7 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v18) = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "TriggerLocation is still nil, even with CurrentBestLocation().", (uint8_t *)&v18, 2u);
        }
        BOOL v15 = 1;
      }
    }
    else
    {
      BOOL v15 = 1;
    }
    objc_sync_exit(v6);
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446722;
      __int16 v19 = "NavdRouteGenius.mm";
      __int16 v20 = 1026;
      int v21 = 379;
      __int16 v22 = 2082;
      BOOL v23 = "-[NavdRouteGenius start]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: locationFilterSelf went away in %{public}s", (uint8_t *)&v18, 0x1Cu);
    }

    BOOL v15 = 0;
  }

  return v15;
}

void sub_1000177F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

BOOL sub_100017864(id a1, MapsSuggestionsEntry *a2)
{
  return [(MapsSuggestionsEntry *)a2 isLockedOrHidden] ^ 1;
}

BOOL sub_100017884(id a1, MapsSuggestionsEntry *a2)
{
  uint64_t v2 = a2;
  LOBYTE(v3) = 1;
  switch((unint64_t)[(MapsSuggestionsEntry *)v2 type])
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x13uLL:
    case 0x17uLL:
    case 0x18uLL:
      break;
    case 9uLL:
      id v5 = [(MapsSuggestionsEntry *)v2 numberForKey:@"MapsSuggestionsIsNotADestinationKey"];
      unsigned int v3 = [v5 BOOLValue] ^ 1;

      break;
    case 0xBuLL:
      if ([(MapsSuggestionsEntry *)v2 isMultiPointRoute]) {
        LOBYTE(v3) = GEOConfigGetBOOL();
      }
      break;
    default:
      LOBYTE(v3) = 0;
      break;
  }

  return v3;
}

void sub_10001793C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000179BC(id a1, MapsSuggestionsEntry *a2)
{
  uint64_t v2 = a2;
  unsigned int v3 = objc_alloc_init(MapsSuggestionsOfflineService);
  unsigned __int8 v4 = [(MapsSuggestionsOfflineService *)v3 shouldKeepEntryWhenOffline:v2];

  return v4;
}

void sub_100017A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017A2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      double v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = *(char **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        BOOL v15 = v10;
        __int16 v16 = 2112;
        v17[0] = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "unable to start Route genius at location <%@> with error : %@", buf, 0x16u);
      }

      [(dispatch_queue_t *)WeakRetained stop];
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100017C8C;
      v11[3] = &unk_100089798;
      objc_copyWeak(&v13, (id *)(a1 + 40));
      id v12 = v5;
      dispatch_async(WeakRetained[9], v11);

      objc_destroyWeak(&v13);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      BOOL v15 = "NavdRouteGenius.mm";
      __int16 v16 = 1026;
      LODWORD(v17[0]) = 468;
      WORD2(v17[0]) = 2082;
      *(void *)((char *)v17 + 6) = "-[NavdRouteGenius start]_block_invoke_4";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100017C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017C8C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 13, *(id *)(a1 + 32));
    unsigned __int8 v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Ready to run oneshot Engine", buf, 2u);
    }

    objc_initWeak(&location, v3);
    uint64_t v5 = MapsSuggestionsNow();
    id v6 = v3[16];
    v3[16] = (id)v5;

    int v7 = objc_alloc_init(NavdBucketizedLocations);
    id v8 = v3[14];
    v3[14] = v7;

    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = v3[15];
    v3[15] = v9;

    [v3[8] registerAppTracker:v3];
    id v11 = v3[2];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000186F8;
    *(void *)&buf[24] = &unk_100089838;
    objc_copyWeak(&v17, &location);
    if (![v11 oneShotTopSuggestionsForSink:v3 count:5 transportType:0 callback:buf onQueue:v3[9]])
    {
      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __int16 v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Oneshot engine will not callback, stopping RouteGenius!", (uint8_t *)&v14, 2u);
      }

      [v3 stop];
    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "NavdRouteGenius.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 476;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdRouteGenius start]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100017F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100017F8C(uint64_t a1, void *a2, void *a3)
{
  id v45 = a2;
  uint64_t v5 = a3;
  uint64_t v39 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v41 = v5;
  if (WeakRetained)
  {
    if (v5)
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v41;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to load shortcuts:%@", buf, 0xCu);
      }
    }
    else
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = *(id *)(a1 + 40);
      id v44 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
      if (v44)
      {
        uint64_t v43 = *(void *)v60;
        do
        {
          double v46 = 0;
          do
          {
            if (*(void *)v60 != v43) {
              objc_enumerationMutation(obj);
            }
            id v8 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v46);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v9 = v45;
            id v10 = [v9 countByEnumeratingWithState:&v55 objects:v65 count:16];
            if (v10)
            {
              uint64_t v11 = *(void *)v56;
              while (2)
              {
                for (i = 0; i != v10; i = (char *)i + 1)
                {
                  if (*(void *)v56 != v11) {
                    objc_enumerationMutation(v9);
                  }
                  id v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                  __int16 v14 = objc_msgSend(v13, "contacts", v39, WeakRetained);
                  if (v14)
                  {
                    BOOL v15 = [v13 contacts];
                    BOOL v16 = [v15 count] == 0;

                    if (!v16)
                    {
                      if ([v8 type] == (id)1 || objc_msgSend(v8, "type") == (id)2)
                      {
                        if ([v8 type] == (id)1 && objc_msgSend(v13, "type") == (id)2
                          || [v8 type] == (id)2 && objc_msgSend(v13, "type") == (id)3)
                        {
                          id v17 = [v8 geoMapItem];
                          int v18 = [v13 geoMapItem];
                          GEOConfigGetDouble();
                          int IsEqualToMapItemForPurposeWithinDistance = GEOMapItemIsEqualToMapItemForPurposeWithinDistance();

                          if (IsEqualToMapItemForPurposeWithinDistance)
                          {
                            id v23 = objc_alloc((Class)NSMutableArray);
                            id v24 = [v13 contacts];
                            id v25 = objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

                            long long v53 = 0u;
                            long long v54 = 0u;
                            long long v51 = 0u;
                            long long v52 = 0u;
                            id v26 = [v13 contacts];
                            id v27 = [v26 countByEnumeratingWithState:&v51 objects:v64 count:16];
                            id v28 = v27;
                            if (v27)
                            {
                              uint64_t v29 = *(void *)v52;
                              do
                              {
                                double v30 = 0;
                                do
                                {
                                  if (*(void *)v52 != v29) {
                                    objc_enumerationMutation(v26);
                                  }
                                  double v31 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)v30) handleValue];
                                  [v25 addObject:v31];

                                  double v30 = (char *)v30 + 1;
                                }
                                while (v28 != v30);
                                id v28 = [v26 countByEnumeratingWithState:&v51 objects:v64 count:16];
                              }
                              while (v28);
                            }
LABEL_42:

                            [v8 setShareETAHandles:v25];
                            goto LABEL_43;
                          }
                        }
                      }
                      else if ([v13 type] != (id)2 && objc_msgSend(v13, "type") != (id)3)
                      {
                        __int16 v20 = [v8 geoMapItem];
                        int v21 = [v13 geoMapItem];
                        GEOConfigGetDouble();
                        int v22 = GEOMapItemIsEqualToMapItemForPurposeWithinDistance();

                        if (v22)
                        {
                          id v32 = objc_alloc((Class)NSMutableArray);
                          id v33 = [v13 contacts];
                          id v25 = objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v33, "count"));

                          long long v49 = 0u;
                          long long v50 = 0u;
                          long long v47 = 0u;
                          long long v48 = 0u;
                          id v26 = [v13 contacts];
                          id v34 = [v26 countByEnumeratingWithState:&v47 objects:v63 count:16];
                          if (v34)
                          {
                            uint64_t v35 = *(void *)v48;
                            do
                            {
                              for (j = 0; j != v34; j = (char *)j + 1)
                              {
                                if (*(void *)v48 != v35) {
                                  objc_enumerationMutation(v26);
                                }
                                id v37 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)j) handleValue];
                                [v25 addObject:v37];
                              }
                              id v34 = [v26 countByEnumeratingWithState:&v47 objects:v63 count:16];
                            }
                            while (v34);
                          }
                          goto LABEL_42;
                        }
                      }
                    }
                  }
                }
                id v10 = [v9 countByEnumeratingWithState:&v55 objects:v65 count:16];
                if (v10) {
                  continue;
                }
                break;
              }
            }
LABEL_43:

            double v46 = (char *)v46 + 1;
          }
          while (v46 != v44);
          id v38 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
          id v44 = v38;
        }
        while (v38);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(v39 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v68 = "NavdRouteGenius.mm";
      __int16 v69 = 1026;
      int v70 = 493;
      __int16 v71 = 2082;
      v72 = "-[NavdRouteGenius _updateEntriesWithShareETAData:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: shortcutStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000185D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000186F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Done running oneshot Engine", buf, 2u);
  }

  id v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = (void *)*((void *)WeakRetained + 9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018948;
    block[3] = &unk_100089810;
    id v12 = v11;
    objc_copyWeak(&v17, v8);
    id v15 = v6;
    id v16 = v5;
    dispatch_async(v12, block);

    objc_destroyWeak(&v17);
  }
  else
  {
    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "NavdRouteGenius.mm";
      __int16 v20 = 1026;
      int v21 = 557;
      __int16 v22 = 2082;
      id v23 = "-[NavdRouteGenius _q_start]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100018928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018948(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      unsigned int v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        id v5 = "Error occured while running oneshot Engine :%@";
        id v6 = v3;
        uint32_t v7 = 12;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v5, buf, v7);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "number of destinations = %lu", buf, 0xCu);
    }

    uint64_t v11 = *(void **)(a1 + 40);
    if (!v11 || ![v11 count])
    {
      unsigned int v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v5 = "no destinations";
        id v6 = v3;
        uint32_t v7 = 2;
        goto LABEL_19;
      }
LABEL_20:

      [WeakRetained stop];
      goto LABEL_21;
    }
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "received %ld entries", buf, 0xCu);
    }

    id v14 = *(id *)(a1 + 40);
    if (GEOConfigGetBOOL())
    {
      id v15 = dispatch_group_create();
      objc_initWeak(&location, WeakRetained);
      dispatch_group_enter(v15);
      id v16 = [WeakRetained[2] oneFavorites];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100017F8C;
      *(void *)&buf[24] = &unk_1000897E8;
      objc_copyWeak(&v22, &location);
      id v17 = v15;
      __int16 v20 = v17;
      id v21 = v14;
      [v16 loadAllShortcutsWithHandler:buf];

      dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    sub_100018DA4((uint64_t)WeakRetained, *(void **)(a1 + 40));
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "NavdRouteGenius.mm";
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = 559;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdRouteGenius _q_start]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_21:
}

void sub_100018D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100018DA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v42 = a1;
  double v41 = v3;
  if (*(unsigned char *)(a1 + 136))
  {
    if (!v3 || ![v3 count])
    {
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "No entries found, stopping RouteGenius!", buf, 2u);
      }

      [(id)v42 stop];
    }
    id v5 = MapsSuggestionsMostRecentLocation();
    if (qword_1000A24E8 != -1) {
      dispatch_once(&qword_1000A24E8, &stru_100089A78);
    }
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v60 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
    }

    uint32_t v7 = v5;
    if (!v5) {
      goto LABEL_13;
    }
    id v8 = MapsSuggestionsNow();
    id v9 = [v5 timestamp];
    [v8 timeIntervalSinceDate:v9];
    BOOL v11 = v10 > *(double *)&qword_1000A24F0;

    uint32_t v7 = v5;
    if (v11)
    {
LABEL_13:

      id v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "We don't know where we are, stopping RouteGenius!", buf, 2u);
      }

      [(id)v42 stop];
      uint32_t v7 = 0;
    }
    id v13 = [*(id *)(v42 + 96) mutableCopy];
    id v14 = v13;
    uint64_t v39 = v7;
    if (v13) {
      id v40 = v13;
    }
    else {
      id v40 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v41, "count"));
    }

    if (GEOConfigGetBOOL())
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v16 = v41;
      id v17 = [v16 countByEnumeratingWithState:&v51 objects:v58 count:16];
      int v18 = v16;
      if (v17)
      {
        uint64_t v19 = *(void *)v52;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            if ([v21 isMultiPointRoute])
            {
              long long v57 = v21;
              int v18 = +[NSArray arrayWithObjects:&v57 count:1];

              goto LABEL_33;
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v51 objects:v58 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        int v18 = v16;
      }
LABEL_33:
    }
    else
    {
      int v18 = v41;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v22 = v18;
    double v41 = v22;
    id v23 = [v22 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v48;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v22);
          }
          id v26 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
          [v26 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v27 = *(id *)(v42 + 96);
          id v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v44;
            while (2)
            {
              for (k = 0; k != v28; k = (char *)k + 1)
              {
                if (*(void *)v44 != v29) {
                  objc_enumerationMutation(v27);
                }
                double v31 = [*(id *)(*((void *)&v43 + 1) + 8 * (void)k) entry];
                BOOL v32 = v31 == v26;

                if (v32)
                {

                  GEOFindOrCreateLog();
                  id v33 = (NavdRouteGeniusRoute *)(id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_DEBUG))
                  {
                    id v34 = [v26 title];
                    *(_DWORD *)buf = 138412290;
                    long long v60 = v34;
                    _os_log_impl((void *)&_mh_execute_header, &v33->super, OS_LOG_TYPE_DEBUG, "RouteGenius already has Entry: %@", buf, 0xCu);
                  }
                  goto LABEL_51;
                }
              }
              id v28 = [v27 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          id v33 = [[NavdRouteGeniusRoute alloc] initWithEntry:v26];
          [v40 addObject:v33];
LABEL_51:

          id v22 = v41;
        }
        id v23 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v23);
    }

    id v35 = [v40 copy];
    long long v36 = *(void **)(v42 + 96);
    *(void *)(v42 + 96) = v35;

    GEOFindOrCreateLog();
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      id v38 = [*(id *)(v42 + 96) count];
      *(_DWORD *)buf = 134217984;
      long long v60 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Done processing entries : _state.Routes count: %ld", buf, 0xCu);
    }

    sub_100016C0C((NSObject **)(v42 + 72), (void *)v42, &stru_100089A08);
    id v15 = v39;
  }
  else
  {
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "RouteGenius is not active, not doing anything!", buf, 2u);
    }
  }
}

void sub_10001941C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13)
{
  id v15 = v13;

  _Unwind_Resume(a1);
}

void sub_10001962C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_100019750(WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdRouteGenius.mm";
      __int16 v6 = 1026;
      int v7 = 592;
      __int16 v8 = 2082;
      id v9 = "-[NavdRouteGenius stop]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100019734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_100019750(id *result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v12[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Stopping RouteGenius", (uint8_t *)v12, 2u);
    }

    [v1[8] unregisterAppTracker:v1];
    [v1[6] stopLocationUpdatesForDelegate:v1];
    [v1[19] cancel];
    id v3 = v1[11];
    v1[11] = 0;

    id v4 = v1[12];
    v1[12] = 0;

    id v5 = v1[15];
    v1[15] = 0;

    id v6 = v1[14];
    v1[14] = 0;

    *((unsigned char *)v1 + 136) = 0;
    id v7 = v1[18];
    v1[18] = 0;

    id v8 = v1[19];
    v1[19] = 0;

    id v9 = v1[20];
    v1[20] = 0;

    id v10 = v1[16];
    v1[16] = 0;

    *((unsigned char *)v1 + 184) = 0;
    *((unsigned char *)v1 + 137) = 0;
    id v11 = v1[2];
    v1[2] = 0;

    return (id *)[v1[4] didUpdateRouteGenius:0];
  }
  return result;
}

void sub_10001987C(NSObject **a1)
{
  if (a1)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472;
    v1[2] = sub_1000198F8;
    v1[3] = &unk_100089860;
    v1[4] = a1;
    sub_100016C0C(a1 + 9, a1, v1);
  }
}

void sub_1000198F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3[11] entry];
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating delegate with entry: %@", (uint8_t *)&v14, 0xCu);
  }

  id v6 = [v3[11] route];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = [*(id *)(*(void *)(a1 + 32) + 88) isLoadingRoute];
      CFStringRef v13 = @"NO";
      if (v12) {
        CFStringRef v13 = @"YES";
      }
      int v14 = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      CFStringRef v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Not Updating delegate as we have no route for entry: %@ routeIsLoading:%@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    id v8 = objc_alloc((Class)MapsSuggestionsRouteGeniusEntry);
    id v9 = [v3[11] route];
    id v10 = [v8 initWithEntry:v4 route:v9];
    id v11 = [v10 data];

    [v3[4] didUpdateRouteGenius:v11];
  }
}

void sub_100019AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100019C28(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[2];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019D08;
  v6[3] = &unk_100089838;
  id v4 = (id *)(a1 + 40);
  id v5 = a2;
  objc_copyWeak(&v7, v4);
  [v3 topSuggestionsForSink:v5 count:20 transportType:0 callback:v6 onQueue:*(void *)(*(void *)(a1 + 32) + 72)];

  objc_destroyWeak(&v7);
}

void sub_100019CF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100019D08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v6)
    {
      sub_100018DA4((uint64_t)WeakRetained, v5);
      goto LABEL_10;
    }
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "invalidateForMapsSuggestionsManager called with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "NavdRouteGenius.mm";
      __int16 v12 = 1026;
      int v13 = 687;
      __int16 v14 = 2082;
      id v15 = "-[NavdRouteGenius invalidateForMapsSuggestionsManager:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
LABEL_10:
}

void sub_100019EA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019ECC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001A0CC;
    v9[3] = &unk_1000898B0;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    id v10 = v6;
    id v11 = v5;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(WeakRetained[9], v9);

    objc_destroyWeak(&v13);
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v15 = "NavdRouteGenius.mm";
      __int16 v16 = 1026;
      int v17 = 722;
      __int16 v18 = 2082;
      uint64_t v19 = "-[NavdRouteGenius _q_loadRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001A0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A0CC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
    {
      GEOFindOrCreateLog();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id v4 = [*(id *)(a1 + 48) entry];
        uint64_t v5 = *(void *)(a1 + 32);
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 2112;
        v13[0] = v5;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Failed to get Waypoint for Entry %@ with error :%@", (uint8_t *)&v10, 0x16u);
      }
      sub_10001A378((uint64_t)WeakRetained, *(void **)(a1 + 48));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "setDestinationWaypoint:");
      GEOFindOrCreateLog();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [*(id *)(a1 + 48) entry];
        id v9 = [v8 title];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received Waypoint, ready to request Route : %@", (uint8_t *)&v10, 0xCu);
      }
      sub_10001A478(WeakRetained, *(void **)(a1 + 48));
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      id v11 = "NavdRouteGenius.mm";
      __int16 v12 = 1026;
      LODWORD(v13[0]) = 724;
      WORD2(v13[0]) = 2082;
      *(void *)((char *)v13 + 6) = "-[NavdRouteGenius _q_loadRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

void sub_10001A334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A378(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "dropping Route: %@", (uint8_t *)&v5, 0xCu);
    }

    sub_10001B23C(a1, v3);
    sub_10001CA84(a1);
  }
}

void sub_10001A45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A478(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!a1[13])
  {
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/RouteGenius/NavdRouteGenius.mm";
    __int16 v98 = 1024;
    int v99 = 786;
    __int16 v100 = 2082;
    v101 = "-[NavdRouteGenius _q_requestRoute:]";
    __int16 v102 = 2082;
    v103 = "nil == (_state.origin)";
    __int16 v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Origin needed to request a route";
LABEL_15:
    id v13 = v6;
    os_log_type_t v14 = OS_LOG_TYPE_FAULT;
    uint32_t v15 = 38;
    goto LABEL_16;
  }
  int v5 = [v3 destinationWaypoint];

  if (!v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/RouteGenius/NavdRouteGenius.mm";
    __int16 v98 = 1024;
    int v99 = 787;
    __int16 v100 = 2082;
    v101 = "-[NavdRouteGenius _q_requestRoute:]";
    __int16 v102 = 2082;
    v103 = "nil == ([route destinationWaypoint])";
    __int16 v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. DestinationWaypoint needed to request a route";
    goto LABEL_15;
  }
  id v6 = MapsSuggestionsMostRecentLocation();
  if (qword_1000A24E8 != -1) {
    dispatch_once(&qword_1000A24E8, &stru_100089A78);
  }
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
  }

  if (!v6) {
    goto LABEL_9;
  }
  id v8 = MapsSuggestionsNow();
  id v9 = [v6 timestamp];
  [v8 timeIntervalSinceDate:v9];
  BOOL v11 = v10 > *(double *)&qword_1000A24F0;

  if (!v11)
  {
    id v90 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v6];
    if (v90)
    {
      id v16 = a1[13];
      id v17 = v4;
      id v87 = v16;
      id v18 = objc_alloc((Class)NSMutableArray);
      *(void *)buf = v16;
      uint64_t v19 = +[NSArray arrayWithObjects:buf count:1];
      id v20 = [v18 initWithArray:v19];

      id v21 = [v17 entry];
      LODWORD(v18) = [v21 isMultiPointRoute];

      if (v18)
      {
        id v22 = objc_msgSend(v17, "entry", v87);
        id v23 = [v22 routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];

        uint64_t v24 = [v23 waypoints];
        id v25 = [v17 entry];
        unint64_t v26 = (unint64_t)[v25 uint64ForKey:@"MapsSuggestionsResumeRouteWaypointIndex"];

        if ((unint64_t)[v24 count] > v26 + 1)
        {
          id v27 = objc_msgSend(v24, "subarrayWithRange:", v26, (char *)objc_msgSend(v24, "count") + ~v26);
          [v20 addObjectsFromArray:v27];
        }
      }
      id v28 = objc_msgSend(v17, "entry", v87);
      unsigned int v29 = [v28 containsKey:@"MapsSuggestionsContactLikelyAppleIDKey"];

      if (v29)
      {
        double v30 = [v17 entry];
        double v31 = [v30 stringForKey:@"MapsSuggestionsContactLikelyAppleIDKey"];
        BOOL v32 = [v17 destinationWaypoint];
        [v32 setFindMyHandleID:v31];

        id v33 = [v17 entry];
        id v34 = [v33 dateForKey:@"MapsSuggestionsContactLocationTimestampKey"];
        [v34 timeIntervalSinceReferenceDate];
        double v36 = v35;
        id v37 = [v17 destinationWaypoint];
        id v38 = [v37 location];
        [v38 setTimestamp:v36];

        uint64_t v39 = [v17 destinationWaypoint];
        [v39 recomputeGeoWaypointTyped];
      }
      id v40 = [v17 destinationWaypoint];
      [v20 addObject:v40];

      id v89 = [v20 copy];
      id v41 = a1[5];
      if (!v41)
      {
        uint64_t v42 = +[GEORouteAttributes defaultRouteAttributesForTransportType:0];
        id v43 = a1[5];
        a1[5] = (id)v42;

        id v41 = a1[5];
      }
      long long v44 = [v41 automobileOptions];
      BOOL v45 = v44 == 0;

      if (v45)
      {
        id v46 = objc_alloc_init((Class)GEOAutomobileOptions);
        [a1[5] setAutomobileOptions:v46];
      }
      long long v47 = [a1[5] automobileOptions];
      unsigned __int8 v48 = [v47 hasUserPreferences];

      if ((v48 & 1) == 0)
      {
        id v49 = objc_alloc_init((Class)GEOUserPreferences);
        long long v50 = [a1[5] automobileOptions];
        [v50 setUserPreferences:v49];
      }
      long long v51 = +[NSFileManager defaultManager];
      long long v52 = [v51 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
      long long v53 = [v52 path];
      int AppBooleanValueWithContainer = _CFPreferencesGetAppBooleanValueWithContainer();

      long long v55 = [a1[5] automobileOptions];
      long long v56 = v55;
      if (AppBooleanValueWithContainer) {
        uint64_t v57 = 1;
      }
      else {
        uint64_t v57 = 3;
      }
      [v55 setTrafficType:v57];

      long long v58 = [a1[5] automobileOptions];
      long long v59 = [v58 userPreferences];
      [v59 setAvoidTolls:0];

      long long v60 = [a1[5] automobileOptions];
      long long v61 = [v60 userPreferences];
      [v61 setAvoidHighways:0];

      long long v62 = +[NSFileManager defaultManager];
      int v63 = [v62 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
      long long v64 = [v63 path];
      BOOL v65 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;

      if (!v65)
      {
        long long v66 = [a1[5] automobileOptions];
        long long v67 = [v66 userPreferences];
        [v67 setAvoidTolls:1];
      }
      GEOFindOrCreateLog();
      v68 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        __int16 v69 = [a1[5] automobileOptions];
        int v70 = [v69 userPreferences];
        unsigned int v71 = [v70 avoidTolls];
        CFStringRef v72 = @"NO";
        if (v71) {
          CFStringRef v72 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v72;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Avoid Tolls:%@", buf, 0xCu);
      }
      v73 = +[NSFileManager defaultManager];
      v74 = [v73 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
      v75 = [v74 path];
      BOOL v76 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;

      if (!v76)
      {
        v77 = [a1[5] automobileOptions];
        v78 = [v77 userPreferences];
        [v78 setAvoidHighways:1];
      }
      GEOFindOrCreateLog();
      v79 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        v80 = [a1[5] automobileOptions];
        v81 = [v80 userPreferences];
        unsigned int v82 = [v81 avoidHighways];
        CFStringRef v83 = @"NO";
        if (v82) {
          CFStringRef v83 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v83;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Avoid Highways:%@", buf, 0xCu);
      }
      id v84 = [objc_alloc((Class)MNRouteAttributes) initWithAttributes:a1[5] waypoints:v89];
      objc_initWeak((id *)buf, a1);
      id v85 = a1[9];
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_10001B374;
      v91[3] = &unk_100089978;
      objc_copyWeak(&v96, (id *)buf);
      id v92 = v17;
      v93 = a1;
      v86 = v89;
      v94 = v86;
      id v95 = v90;
      [v84 buildRouteAttributes:v85 result:v91];

      objc_destroyWeak(&v96);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v86 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Failed to convert CLLocation to geoLocation", buf, 2u);
      }
    }
  }
  else
  {
LABEL_9:

    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      __int16 v12 = "We don't know where we are, so we can not get a route";
      id v13 = v6;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
    }
  }
LABEL_49:
}

void sub_10001AF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_10001B23C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "removing Route: %@", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [*(id *)(a1 + 96) mutableCopy];
  [v5 removeObject:v3];
  id v6 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v5;
  id v7 = v5;

  LODWORD(v6) = *(void *)(a1 + 88) == (void)v3;
  if (v6)
  {
    *(void *)(a1 + 88) = 0;
  }
}

void sub_10001B34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B374(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 64));
  id v21 = v5;
  if (WeakRetained)
  {
    if (v5)
    {
      GEOFindOrCreateLog();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = [*(id *)(a1 + 32) entry];
        id v9 = [v8 title];
        *(_DWORD *)buf = 138412546;
        id v33 = v9;
        __int16 v34 = 2112;
        *(void *)double v35 = v21;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "failed getting attributes for %@ : %@", buf, 0x16u);
      }
      if (!v22) {
        sub_10001A378((uint64_t)WeakRetained, *(void **)(a1 + 32));
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B7F8;
    block[3] = &unk_100089798;
    id location = &v31;
    objc_copyWeak(&v31, (id *)(a1 + 64));
    id v10 = v22;
    id v30 = v10;
    dispatch_async(WeakRetained[9], block);
    GEOFindOrCreateLog();
    BOOL v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = objc_msgSend(*(id *)(a1 + 32), "entry", &v31);
      id v13 = [v12 title];
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Getting route: %@", buf, 0xCu);
    }
    os_log_type_t v14 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    _OWORD v23[2] = sub_10001B98C;
    v23[3] = &unk_100089950;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    id v24 = *(id *)(a1 + 32);
    id v25 = *(id *)(a1 + 48);
    id v17 = v10;
    uint64_t v18 = *(void *)(a1 + 40);
    id v26 = v17;
    uint64_t v27 = v18;
    [v14 requestRouteForWaypoints:v15 at:v16 attributes:v17 completion:v23];

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v33 = "NavdRouteGenius.mm";
      __int16 v34 = 1026;
      *(_DWORD *)double v35 = 807;
      *(_WORD *)&uint8_t v35[4] = 2082;
      *(void *)&v35[6] = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001B750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  _Unwind_Resume(a1);
}

void sub_10001B7F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = *(char **)(a1 + 32);
      int v7 = 138412290;
      int v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Updated routeAttributes: %@", (uint8_t *)&v7, 0xCu);
    }

    id v5 = *(id *)(a1 + 32);
    id v6 = WeakRetained[5];
    WeakRetained[5] = v5;
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "NavdRouteGenius.mm";
      __int16 v9 = 1026;
      int v10 = 815;
      __int16 v11 = 2082;
      __int16 v12 = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10001B970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B98C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (!v10 || v11 || v12 || ![v10 routesCount] && !objc_msgSend(v10, "waypointRoutesCount"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001BCB4;
      block[3] = &unk_100089810;
      objc_copyWeak(&v28, (id *)(a1 + 64));
      id v26 = *(id *)(a1 + 32);
      id v27 = v11;
      dispatch_async(WeakRetained[9], block);

      objc_destroyWeak(&v28);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BE94;
    void v17[3] = &unk_100089928;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v20 = v10;
    id v21 = v9;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 56);
    id v22 = v14;
    uint64_t v23 = v15;
    dispatch_async(WeakRetained[9], v17);

    objc_destroyWeak(&v24);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v30 = "NavdRouteGenius.mm";
      __int16 v31 = 1026;
      int v32 = 824;
      __int16 v33 = 2082;
      __int16 v34 = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001BC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BCB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = (char *)WeakRetained[13];
      id v5 = [*(id *)(a1 + 32) destinationWaypoint];
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412802;
      id v9 = v4;
      __int16 v10 = 2112;
      *(void *)id v11 = v5;
      *(_WORD *)&v11[8] = 2112;
      *(void *)&v11[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to requestRoute from %@ to %@ : %@", (uint8_t *)&v8, 0x20u);
    }
    sub_10001A378((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      id v9 = "NavdRouteGenius.mm";
      __int16 v10 = 1026;
      *(_DWORD *)id v11 = 830;
      *(_WORD *)&void v11[4] = 2082;
      *(void *)&v11[6] = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void sub_10001BE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BE94(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v37 = [objc_alloc((Class)GEORouteInitializerData) initWithWaypoints:*(void *)(a1 + 32) routeAttributes:*(void *)(a1 + 40) directionsResponse:*(void *)(a1 + 48) directionsRequest:*(void *)(a1 + 56)];
    id v4 = [v37 mainRouteInfo];
    id v5 = [v4 route];

    if (!v5)
    {
      GEOFindOrCreateLog();
      uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = (char *)WeakRetained[13];
        int v8 = [*(id *)(a1 + 64) destinationWaypoint];
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        id v43 = v7;
        __int16 v44 = 2112;
        *(void *)BOOL v45 = v8;
        *(_WORD *)&v45[8] = 2112;
        *(void *)&v45[10] = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Nil route for %@ to %@ : %@", buf, 0x20u);
      }
      sub_10001A378((uint64_t)WeakRetained, *(void **)(a1 + 64));
    }
    __int16 v10 = *(void **)(a1 + 64);
    id v11 = [v4 route];
    [v10 setRoute:v11];

    id v12 = [*(id *)(a1 + 64) entry];
    [v12 setETA:0 forKey:@"MapsSuggestionsETAKey"];

    GEOFindOrCreateLog();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [*(id *)(a1 + 64) entry];
      uint64_t v15 = [v14 title];
      *(_DWORD *)buf = 138412290;
      id v43 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "hasLoaded for route: %@", buf, 0xCu);
    }
    uint64_t v16 = [*(id *)(a1 + 48) sessionState];
    id v17 = (void *)WeakRetained[20];
    WeakRetained[20] = v16;

    if (WeakRetained[18]) {
      goto LABEL_21;
    }
    MapsSuggestionsMostRecentLocation();
    id v18 = (char *)objc_claimAutoreleasedReturnValue();
    if (qword_1000A24E8 != -1) {
      dispatch_once(&qword_1000A24E8, &stru_100089A78);
    }
    id v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
    }

    if (!v18) {
      goto LABEL_15;
    }
    id v20 = MapsSuggestionsNow();
    id v21 = [v18 timestamp];
    [v20 timeIntervalSinceDate:v21];
    BOOL v23 = v22 > *(double *)&qword_1000A24F0;

    if (!v23) {
      id v24 = v18;
    }
    else {
LABEL_15:
    }
      id v24 = 0;

    id v25 = (void *)WeakRetained[18];
    WeakRetained[18] = v24;

    if (WeakRetained[18])
    {
LABEL_21:
      id v26 = (void *)WeakRetained[3];
      id v27 = [*(id *)(a1 + 64) destinationWaypoint];
      uint64_t v28 = WeakRetained[18];
      uint64_t v29 = WeakRetained[5];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10001C560;
      v38[3] = &unk_100089900;
      objc_copyWeak(&v41, v2);
      id v30 = *(id *)(a1 + 64);
      uint64_t v31 = *(void *)(a1 + 72);
      id v39 = v30;
      uint64_t v40 = v31;
      LOBYTE(v29) = [v26 requestEtaForWaypoint:v27 at:v28 transportType:0 attributes:v29 completion:v38] == 1;

      if ((v29 & 1) == 0)
      {
        int v32 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = *(char **)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          id v43 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "ETA request not calling back, dropping route: %@", buf, 0xCu);
        }

        sub_10001A378((uint64_t)WeakRetained, *(void **)(a1 + 64));
      }

      objc_destroyWeak(&v41);
    }
    else
    {
      GEOFindOrCreateLog();
      __int16 v34 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        double v35 = [*(id *)(a1 + 64) entry];
        double v36 = [v35 title];
        *(_DWORD *)buf = 138412290;
        id v43 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "No location, dropping route: %@", buf, 0xCu);
      }
      [WeakRetained stop];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v43 = "NavdRouteGenius.mm";
      __int16 v44 = 1026;
      *(_DWORD *)BOOL v45 = 837;
      *(_WORD *)&v45[4] = 2082;
      *(void *)&v45[6] = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v37 = v4;
  }
}

void sub_10001C45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10001C560(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C764;
    block[3] = &unk_1000898D8;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    id v12 = v5;
    id v13 = v6;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = v8;
    uint64_t v15 = v9;
    dispatch_async(WeakRetained[9], block);

    objc_destroyWeak(&v16);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v18 = "NavdRouteGenius.mm";
      __int16 v19 = 1026;
      int v20 = 868;
      __int16 v21 = 2082;
      double v22 = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: etaStrongSelfForQueue went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001C748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C764(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      id v16 = "NavdRouteGenius.mm";
      __int16 v17 = 1026;
      int v18 = 870;
      __int16 v19 = 2082;
      int v20 = "-[NavdRouteGenius _q_requestRoute:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: etaStrongSelf went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }

    goto LABEL_13;
  }
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    id v6 = objc_alloc((Class)MapsSuggestionsETA);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 144);
    uint64_t v9 = MapsSuggestionsNow();
    id v5 = [v6 initWithTrafficAndETAResult:v7 transportType:0 location:v8 time:v9];

    __int16 v10 = [*(id *)(a1 + 48) entry];
    [v10 setETA:v5 forKey:@"MapsSuggestionsETAKey"];

    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [*(id *)(a1 + 48) entry];
      id v13 = [v12 ETAForKey:@"MapsSuggestionsETAKey"];
      [v13 seconds];
      int v15 = 134217984;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "new eta : %f", (uint8_t *)&v15, 0xCu);
    }
    sub_10001CA84((uint64_t)WeakRetained);
LABEL_13:

    goto LABEL_14;
  }
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(char **)(a1 + 40);
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error getting ETA: %@", (uint8_t *)&v15, 0xCu);
  }

  sub_10001A378((uint64_t)WeakRetained, *(void **)(a1 + 48));
LABEL_14:
}

void sub_10001CA10(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_10001CA84(uint64_t a1)
{
  *(_OWORD *)id location = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = [*(id *)(a1 + 96) copy];
  id v3 = (char *)[v2 countByEnumeratingWithState:location objects:&buf count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = (void *)*((void *)location[1] + i);
        uint64_t v7 = [v6 entry];
        unsigned int v8 = [v7 isLockedOrHidden];

        if (v8) {
          sub_10001B23C(a1, v6);
        }
      }
      id v3 = (char *)[v2 countByEnumeratingWithState:location objects:&buf count:16];
    }
    while (v3);
  }

  if ([*(id *)(a1 + 96) count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = *(id *)(a1 + 96);
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
          if ((objc_msgSend(v13, "hasRouteLoaded", (void)v18) & 1) == 0)
          {
            GEOFindOrCreateLog();
            int v15 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              id v16 = [v13 entry];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "No route loaded for %@", (uint8_t *)&buf, 0xCu);
            }
            return;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Route loaded, all entries have routes", (uint8_t *)&buf, 2u);
    }

    *(unsigned char *)(a1 + 137) = 1;
    objc_initWeak(location, (id)a1);
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    uint64_t v28 = sub_10001CE68;
    uint64_t v29 = &unk_100089798;
    objc_copyWeak(v31, location);
    uint64_t v30 = a1;
    dispatch_async(*(dispatch_queue_t *)(a1 + 72), &buf);
    objc_destroyWeak(v31);
    objc_destroyWeak(location);
  }
  else
  {
    __int16 v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "No entries left after route loading, stopping RouteGenius", (uint8_t *)&buf, 2u);
    }

    [(id)a1 stop];
  }
}

void sub_10001CE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001CE68(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (!WeakRetained)
  {
    v109 = 0;
    GEOFindOrCreateLog();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      *(void *)v151 = "NavdRouteGenius.mm";
      *(_WORD *)&v151[8] = 1026;
      int v152 = 965;
      __int16 v153 = 2082;
      v154 = "-[NavdRouteGenius _score]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    int v15 = v14;
LABEL_10:

    goto LABEL_11;
  }
  from = v2;
  if (![WeakRetained[12] count])
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "No routes to score.", buf, 2u);
    }

    [v4 stop];
    goto LABEL_15;
  }
  id v5 = v4;
  objc_sync_enter(v5);
  int v6 = *((unsigned __int8 *)v5 + 184);
  objc_sync_exit(v5);

  if (v6) {
    goto LABEL_4;
  }
  v109 = v4;
  if (GEOConfigGetBOOL())
  {
    uint64_t v17 = v1;
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    int v15 = v4[12];
    id v18 = [v15 countByEnumeratingWithState:&v127 objects:v144 count:16];
    if (!v18) {
      goto LABEL_25;
    }
    uint64_t v19 = *(void *)v128;
    while (1)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v128 != v19) {
          objc_enumerationMutation(v15);
        }
        long long v21 = *(void **)(*((void *)&v127 + 1) + 8 * i);
        double v22 = [v21 entry];
        unsigned int v23 = [v22 isMultiPointRoute];

        if (v23)
        {
          v97 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "We have a MPR", buf, 2u);
          }

          objc_storeStrong((id *)(*(void *)(v17 + 32) + 88), v21);
          id v98 = v5[19];
          if (!v98)
          {
            id v99 = objc_alloc((Class)MapsSuggestionsCanKicker);
            GEOConfigGetDouble();
            double v101 = v100;
            id v102 = v109[9];
            v125[0] = _NSConcreteStackBlock;
            v125[1] = 3221225472;
            v125[2] = sub_10001E1C0;
            v125[3] = &unk_1000896E8;
            objc_copyWeak(&v126, from);
            id v103 = [v99 initWithName:@"NavdRouteGeniusETACanKicker" time:v102 queue:v125 block:v101];
            id v104 = v5[19];
            v5[19] = v103;

            objc_destroyWeak(&v126);
            id v98 = v5[19];
          }
          [v98 kickCanBySameTime];
          v105 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEBUG, "Update Delegate with MPR", buf, 2u);
          }

          sub_10001987C((NSObject **)v5);
LABEL_11:

          uint64_t v4 = v109;
          goto LABEL_15;
        }
      }
      id v18 = [v15 countByEnumeratingWithState:&v127 objects:v144 count:16];
      if (!v18)
      {
LABEL_25:

        long long v24 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "No MPR", buf, 2u);
        }

        uint64_t v1 = v17;
        break;
      }
    }
  }
  v111 = v5;
  long long v25 = MapsSuggestionsNow();
  uint64_t v106 = v1;
  uint64_t v26 = *(void *)(v1 + 32);
  v110 = v25;
  uint64_t v107 = v26;
  if (v26)
  {
    id v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "///// Scoring Dump /////", buf, 2u);
    }

    uint64_t v28 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)v151 = v110;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Time : %@", buf, 0xCu);
    }

    uint64_t v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "routes : {", buf, 2u);
    }

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id obj = *(id *)(v107 + 96);
    id v115 = [obj countByEnumeratingWithState:&v139 objects:buf count:16];
    if (v115)
    {
      id v113 = *(id *)v140;
      do
      {
        for (j = 0; j != v115; j = (char *)j + 1)
        {
          if (*(id *)v140 != v113) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = [*(id *)(*((void *)&v139 + 1) + 8 * (void)j) description];
          uint64_t v31 = [v30 componentsSeparatedByString:@"\n"];

          long long v137 = 0u;
          long long v138 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          id v32 = v31;
          id v33 = [v32 countByEnumeratingWithState:&v135 objects:v149 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v136;
            do
            {
              for (k = 0; k != v33; k = (char *)k + 1)
              {
                if (*(void *)v136 != v34) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v36 = *(void *)(*((void *)&v135 + 1) + 8 * (void)k);
                id v37 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v147 = 138412290;
                  uint64_t v148 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%@", v147, 0xCu);
                }
              }
              id v33 = [v32 countByEnumeratingWithState:&v135 objects:v149 count:16];
            }
            while (v33);
          }
        }
        id v115 = [obj countByEnumeratingWithState:&v139 objects:buf count:16];
      }
      while (v115);
    }

    id v38 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v147 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "}", v147, 2u);
    }

    id v39 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v147 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "LocationHistory : {", v147, 2u);
    }

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v40 = [*(id *)(v107 + 112) locations];
    id v41 = [v40 countByEnumeratingWithState:&v131 objects:v147 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v132;
      do
      {
        for (m = 0; m != v41; m = (char *)m + 1)
        {
          if (*(void *)v132 != v42) {
            objc_enumerationMutation(v40);
          }
          __int16 v44 = *(void **)(*((void *)&v131 + 1) + 8 * (void)m);
          GEOFindOrCreateLog();
          BOOL v45 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            id v46 = [v44 description];
            *(_DWORD *)v145 = 138412290;
            v146 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%@", v145, 0xCu);
          }
        }
        id v41 = [v40 countByEnumeratingWithState:&v131 objects:v147 count:16];
      }
      while (v41);
    }

    long long v47 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v145 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "}", v145, 2u);
    }

    unsigned __int8 v48 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v145 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "///// Scoring Dump End/////", v145, 2u);
    }
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v114 = v109[12];
  id v49 = [v114 countByEnumeratingWithState:&v121 objects:v143 count:16];
  int v15 = 0;
  if (!v49) {
    goto LABEL_105;
  }
  uint64_t v118 = *(void *)v122;
  uint64_t v50 = 0x80000000;
  while (2)
  {
    id v116 = v49;
    for (n = 0; n != v116; n = (char *)n + 1)
    {
      if (*(void *)v122 != v118) {
        objc_enumerationMutation(v114);
      }
      id v52 = *(id *)(*((void *)&v121 + 1) + 8 * (void)n);
      GEOFindOrCreateLog();
      long long v53 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        long long v54 = [v52 entry];
        *(_DWORD *)long long buf = 138412290;
        *(void *)v151 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Scoring entry : %@", buf, 0xCu);
      }
      long long v55 = [v52 entry];
      int v56 = NavdScoreMapsSuggestionsEntry(v55, v110);

      uint64_t v57 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v151 = v56;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "Score after NavdScoreMapsSuggestionsEntry : %d", buf, 8u);
      }

      long long v58 = [v52 offRouteInfos];
      int v59 = NavdScoreOffRoute(v58);

      if (v59 == 0x80000000)
      {
        sub_10001A378(*(void *)(v106 + 32), v52);
LABEL_117:

        id v14 = v110;
        goto LABEL_10;
      }
      long long v60 = GEOFindOrCreateLog();
      int v61 = v59 + v56;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v151 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Score after NavdScoreOffRoute : %d", buf, 8u);
      }

      long long v62 = [v111[14] locations];
      [v111[18] coordinate];
      double v64 = v63;
      [v111[18] coordinate];
      int v66 = NavdScoreLocationHistory(v62, v110, v64, v65);

      long long v67 = GEOFindOrCreateLog();
      int v68 = v66 + v61;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v151 = v68;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Score after NavdScoreLocationHistory : %d", buf, 8u);
      }

      id v69 = [v52 destinationWaypoint];
      if ([v69 hasMapItemStorage])
      {
        int v70 = [v69 mapItemStorage];
        [v70 coordinate];
        double v72 = v71;
        double v74 = v73;
      }
      else
      {
        int v70 = [v69 latLng];
        [v70 lat];
        double v72 = v75;
        BOOL v76 = [v69 latLng];
        [v76 lng];
        double v74 = v77;
      }
      int v78 = NavdScoreGeodisicDistance(v111[15], v72, v74);

      v79 = GEOFindOrCreateLog();
      int v80 = v78 + v68;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v151 = v80;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEBUG, "Score after NavdScoreGeodisicDistance : %d", buf, 8u);
      }

      v81 = [v52 route];
      [v81 travelTimeConservativeEstimate];
      double v83 = v82;

      id v84 = [v52 entry];
      id v85 = [v84 ETAForKey:@"MapsSuggestionsETAKey"];

      if (v85)
      {
        GEOConfigGetDouble();
        double v87 = v86;
        v88 = [v85 time];
        BOOL v89 = v87 < MapsSuggestionsSecondsSince(v88);

        if (v89)
        {
          [v85 seconds];
          double v83 = v90;
        }
      }
      v91 = [v52 entry];
      int v92 = NavdScoreInTimeWindow(v91, v83);

      if (v92 == 0x80000000)
      {
        sub_10001A378(v111, v52);

        goto LABEL_117;
      }
      v93 = GEOFindOrCreateLog();
      uint64_t v94 = (v92 + v80);
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)v151 = v94;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "Score after NavdScoreInTimeWindow : %d", buf, 8u);
      }

      if ((int)v94 > (int)v50)
      {
        id v95 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 67109376;
          *(_DWORD *)v151 = v94;
          *(_WORD *)&v151[4] = 1024;
          *(_DWORD *)&v151[6] = v50;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "This score (%d) is higher then (%d)", buf, 0xEu);
        }
LABEL_102:

        id v96 = v52;
        int v15 = v96;
        uint64_t v50 = v94;
        goto LABEL_103;
      }
      if (v94 == v50 && v52 == v111[11])
      {
        id v95 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)v151 = v50;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, "The same score (%d) as the highest score. Sticking with the current one", buf, 8u);
        }
        uint64_t v94 = v50;
        goto LABEL_102;
      }
LABEL_103:
    }
    id v49 = [v114 countByEnumeratingWithState:&v121 objects:v143 count:16];
    if (v49) {
      continue;
    }
    break;
  }
LABEL_105:

  if (v15 != v111[11])
  {
    sub_10001B23C((uint64_t)v111, *(void **)(*(void *)(v106 + 32) + 88));
    objc_storeStrong(v111 + 11, v15);
  }

  uint64_t v4 = v109;
  id v5 = v111;
LABEL_4:
  id v7 = v5[19];
  if (!v7)
  {
    id v8 = objc_alloc((Class)MapsSuggestionsCanKicker);
    GEOConfigGetDouble();
    double v10 = v9;
    id v11 = v4[9];
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_10001E35C;
    v119[3] = &unk_1000896E8;
    objc_copyWeak(&v120, from);
    id v12 = [v8 initWithName:@"NavdRouteGeniusETACanKicker" time:v11 queue:v119 block:v10];
    id v13 = v5[19];
    v5[19] = v12;

    objc_destroyWeak(&v120);
    id v7 = v5[19];
  }
  [v7 kickCanBySameTime];
  sub_10001987C((NSObject **)v5);
LABEL_15:
}

void sub_10001DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10001E1C0(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_10001E2E4(WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdRouteGenius.mm";
      __int16 v6 = 1026;
      int v7 = 982;
      __int16 v8 = 2082;
      double v9 = "-[NavdRouteGenius _score]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10001E2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E2E4(NSObject **a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = sub_10001E480;
  v1[3] = &unk_100089860;
  v1[4] = a1;
  sub_100016C0C(a1 + 9, a1, v1);
}

void sub_10001E35C(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_10001E2E4(WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdRouteGenius.mm";
      __int16 v6 = 1026;
      int v7 = 1062;
      __int16 v8 = 2082;
      double v9 = "-[NavdRouteGenius _score]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10001E464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E480(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3[11] entry];

  if (v4)
  {
    if (v3[18])
    {
      id v5 = v3[3];
      __int16 v6 = [v3[11] destinationWaypoint];
      id v7 = v3[18];
      id v8 = v3[5];
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      id v13 = sub_10001E628;
      id v14 = &unk_1000899C8;
      uint64_t v15 = *(void *)(a1 + 32);
      double v9 = v3;
      id v16 = v9;
      LODWORD(v5) = [v5 requestEtaForWaypoint:v6 at:v7 transportType:0 attributes:v8 completion:&v11];

      if (!v5) {
        objc_msgSend(v9[19], "kickCanBySameTime", v11, v12, v13, v14, v15);
      }
    }
    else
    {
      double v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "There is no lastKnowLocation", buf, 2u);
      }
    }
  }
}

void sub_10001E5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10001E628(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  double v9 = (NSObject **)(v7 + 72);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001E724;
  v12[3] = &unk_1000899A0;
  id v13 = v6;
  id v14 = v5;
  uint64_t v15 = v7;
  id v10 = v5;
  id v11 = v6;
  sub_100016C0C(v9, v8, v12);
}

void sub_10001E700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10001E724(void *a1, void *a2)
{
  id v3 = a2;
  if (a1[4])
  {
    int v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      int v16 = 138412290;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error getting ETA: %@", (uint8_t *)&v16, 0xCu);
    }

    [v3[19] kickCanBySameTime];
  }
  else
  {
    id v6 = objc_alloc((Class)MapsSuggestionsETA);
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[6] + 144);
    double v9 = MapsSuggestionsNow();
    id v10 = [v6 initWithTrafficAndETAResult:v7 transportType:0 location:v8 time:v9];

    id v11 = [v3[11] entry];
    [v11 setETA:v10 forKey:@"MapsSuggestionsETAKey"];

    GEOFindOrCreateLog();
    uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v3[11] entry];
      id v14 = [v13 ETAForKey:@"MapsSuggestionsETAKey"];
      [v14 seconds];
      int v16 = 134217984;
      uint64_t v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "new eta : %f", (uint8_t *)&v16, 0xCu);
    }
    sub_10001987C((NSObject **)v3);
    [v3[19] kickCanBySameTime];
  }
}

void sub_10001E928(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10001E99C(id a1, NavdRouteGenius *a2)
{
  long long v55 = a2;
  GEOFindOrCreateLog();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v3 = [(NSArray *)v55->_state.routes count];
    *(_DWORD *)long long buf = 134217984;
    NSUInteger v66 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Getting new routes if needed for %ld entries", buf, 0xCu);
  }

  int v4 = MapsSuggestionsMostRecentLocation();
  if (qword_1000A24E8 != -1) {
    dispatch_once(&qword_1000A24E8, &stru_100089A78);
  }
  long long v53 = v4;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    NSUInteger v66 = (NSUInteger)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MapsSuggestionsMostRecentLocation() is %@", buf, 0xCu);
  }

  if (!v4) {
    goto LABEL_10;
  }
  id v6 = MapsSuggestionsNow();
  uint64_t v7 = [v4 timestamp];
  [v6 timeIntervalSinceDate:v7];
  BOOL v9 = v8 > *(double *)&qword_1000A24F0;

  if (v9)
  {
    int v4 = v53;
LABEL_10:
    long long v53 = 0;
    goto LABEL_28;
  }
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](v55->_state.routes, "count"));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v55->_state.routes;
  long long v54 = v10;
  id v11 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v75 count:16];
  if (v11)
  {
    uint64_t v13 = *(void *)v61;
    *(void *)&long long v12 = 138413314;
    long long v51 = v12;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(NavdRouteGeniusRoute **)(*((void *)&v60 + 1) + 8 * i);
        if (v15 == v55->_state.route)
        {
          uint64_t v36 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "This is the active route, we should keep it", buf, 2u);
          }

          [v54 addObject:v15];
        }
        else
        {
          int v16 = [*(id *)(*((void *)&v60 + 1) + 8 * i) entry];
          uint64_t v17 = [v16 geoMapItem];
          [v17 coordinate];
          id v18 = CLLocationFromGEOLocationCoordinate2D();
          [v53 distanceFromLocation:v18];
          uint64_t v20 = v19;

          long long v21 = [(NavdRouteGeniusRoute *)v15 entry];
          double v22 = [v21 geoMapItem];
          [v22 coordinate];
          unsigned int v23 = CLLocationFromGEOLocationCoordinate2D();
          [v53 distanceFromLocation:v23];
          double v25 = v24;
          GEOConfigGetDouble();
          BOOL v27 = v25 < v26;

          if (v27)
          {
            GEOFindOrCreateLog();
            uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v29 = [(NavdRouteGeniusRoute *)v15 entry];
              uint64_t v30 = [v29 title];
              GEOConfigGetDouble();
              uint64_t v32 = v31;
              id v33 = [(NavdRouteGeniusRoute *)v15 entry];
              uint64_t v34 = [v33 geoMapItem];
              [v34 coordinate];
              double v35 = CLLocationFromGEOLocationCoordinate2D();
              *(_DWORD *)long long buf = v51;
              NSUInteger v66 = (NSUInteger)v30;
              __int16 v67 = 2112;
              int v68 = v53;
              __int16 v69 = 2048;
              uint64_t v70 = v32;
              __int16 v71 = 2112;
              double v72 = v35;
              __int16 v73 = 2048;
              uint64_t v74 = v20;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "dropped route %@ because %@ too close(%f) %@:%f", buf, 0x34u);
            }
          }
          else
          {
            [v54 addObject:v15];
          }
        }
      }
      id v11 = [(NSArray *)obj countByEnumeratingWithState:&v60 objects:v75 count:16];
    }
    while (v11);
  }

  id v37 = (NSArray *)[v54 copy];
  routes = v55->_state.routes;
  v55->_state.routes = v37;

  int v4 = v54;
LABEL_28:

  if (![(NSArray *)v55->_state.routes count])
  {
    id v39 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "No routes, stopping route genius", buf, 2u);
    }

    sub_100019750((id *)&v55->super.isa);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v40 = v55->_state.routes;
  id v41 = [(NSArray *)v40 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v57;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(v40);
        }
        __int16 v44 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
        if (objc_msgSend(v44, "isLoadingRoute", v51))
        {
          GEOFindOrCreateLog();
          BOOL v45 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            id v46 = [v44 entry];
            long long v47 = [v46 title];
            *(_DWORD *)long long buf = 138412290;
            NSUInteger v66 = (NSUInteger)v47;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Already loading, skipping route: %@", buf, 0xCu);
          }
        }
        else
        {
          GEOFindOrCreateLog();
          unsigned __int8 v48 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            id v49 = [v44 entry];
            uint64_t v50 = [v49 title];
            *(_DWORD *)long long buf = 138412290;
            NSUInteger v66 = (NSUInteger)v50;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "not yet loading route for entry: %@", buf, 0xCu);
          }
          sub_1000164B8(v55, v44);
        }
      }
      id v41 = [(NSArray *)v40 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v41);
  }
}

void sub_10001F0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10001F394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F3C4(uint64_t a1, void *a2)
{
  NSUInteger v3 = a2;
  if (!v3[18] || (objc_msgSend(*(id *)(a1 + 32), "distanceFromLocation:"), double v5 = v4, GEOConfigGetDouble(), v5 >= v6))
  {
    objc_storeStrong(v3 + 18, *(id *)(a1 + 32));
    GEOFindOrCreateLog();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) coordinate];
      double v9 = v8;
      [*(id *)(a1 + 32) coordinate];
      *(_DWORD *)long long buf = 134218240;
      double v80 = v9;
      __int16 v81 = 2048;
      uint64_t v82 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received location update : <%.6f,%.6f>", buf, 0x16u);
    }

    [v3[14] addLocation:*(void *)(a1 + 32)];
    id v11 = v3[15];
    long long v12 = [NavdGeodesicLocation alloc];
    [*(id *)(a1 + 32) coordinate];
    double v14 = v13;
    [*(id *)(a1 + 32) coordinate];
    double v16 = v15;
    uint64_t v17 = [*(id *)(a1 + 32) timestamp];
    [v17 timeIntervalSinceDate:v3[16]];
    uint64_t v19 = -[NavdGeodesicLocation initWithLocation:timeInterval:](v12, "initWithLocation:timeInterval:", v14, v16, v18);
    [v11 addObject:v19];

    if (*((unsigned char *)v3 + 137))
    {
      id v20 = v3[11];
      if (v20)
      {
        long long v21 = [v20 entry];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          unsigned int v23 = [v3[11] entry];
          double v24 = MapsSuggestionsLocationForEntry();

          [*(id *)(a1 + 32) distanceFromLocation:v24];
          double v26 = v25;
          GEOConfigGetDouble();
          if (v26 < v27)
          {
            id v28 = objc_alloc((Class)GEORouteMatcher);
            uint64_t v29 = [v3[11] route];
            id v30 = [v28 initWithRoute:v29 auditToken:0];

            [*(id *)(a1 + 32) coordinate];
            GEOLocationCoordinate2DFromCLLocationCoordinate2D();
            id v31 = objc_msgSend(v30, "closestRouteCoordinateForLocationCoordinate:");
            uint64_t v32 = [*(id *)(*(void *)(a1 + 40) + 88) route];
            [v32 distanceToEndFromRouteCoordinate:v31];
            double v34 = v33;

            double v35 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 134217984;
              double v80 = v34;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Distance to the end along route: %f", buf, 0xCu);
            }

            GEOConfigGetDouble();
            if (v34 < v36)
            {
              GEOFindOrCreateLog();
              NSUInteger v66 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                double v67 = [v3[11] entry];
                *(_DWORD *)long long buf = 138412290;
                double v80 = v67;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "Arrived at %@", buf, 0xCu);
              }
              sub_100019750(v3);

              goto LABEL_33;
            }
          }
          [*(id *)(a1 + 32) distanceFromLocation:v24];
          double v38 = v37;
          GEOConfigGetDouble();
          double v40 = v39;
          int v41 = v38 < v39;
          uint64_t v42 = v3;
          objc_sync_enter(v42);
          if (*((unsigned __int8 *)v42 + 184) != v41)
          {
            id v43 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 67109120;
              LODWORD(v80) = v38 < v40;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Setting skipScoring to :%d", buf, 8u);
            }

            *((unsigned char *)v42 + 184) = v41;
          }
          objc_sync_exit(v42);

          __int16 v44 = [v3[11] route];
          BOOL v45 = v44 == 0;

          if (!v45)
          {
            id v46 = [*(id *)(*(void *)(a1 + 40) + 88) entry];
            unsigned __int8 v47 = [v46 isMultiPointRoute];

            if ((v47 & 1) == 0)
            {
              unsigned __int8 v48 = *(void **)(a1 + 32);
              id v49 = [v3[11] route];
              id v50 = v48;
              id v51 = v49;
              if (v51)
              {
                id v52 = v51;
                id v53 = [objc_alloc((Class)GEORouteMatcher) initWithRoute:v51 auditToken:0];
                [v50 coordinate];
                double v55 = v54;
                [v50 coordinate];
                [v53 distanceToRouteFrom:v55];
                double v57 = v56;
                GEOFindOrCreateLog();
                long long v58 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                {
                  [v50 horizontalAccuracy];
                  uint64_t v60 = v59;
                  GEOConfigGetDouble();
                  *(_DWORD *)long long buf = 134218496;
                  double v80 = v57;
                  __int16 v81 = 2048;
                  uint64_t v82 = v60;
                  __int16 v83 = 2048;
                  uint64_t v84 = v61;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Distance to route : %.6f , accuracy : %.6f, networkdefault(NavdRouteGenius_OnRouteDistance) : %.6f", buf, 0x20u);
                }

                GEOConfigGetDouble();
                double v63 = v62;
                [v50 horizontalAccuracy];
                if (v64 > 0.0)
                {
                  [v50 horizontalAccuracy];
                  double v63 = v63 + v65;
                }

                if (v57 < v63) {
                  goto LABEL_33;
                }
              }
              else
              {
              }
              int v68 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "We are off route!", buf, 2u);
              }

              id v69 = v3[11];
              uint64_t v70 = *(void *)(a1 + 32);
              __int16 v71 = MapsSuggestionsNow();
              [v69 updateRerouteInfoForLocation:v70 time:v71];

              id v72 = v42[3];
              uint64_t v74 = *(void *)(a1 + 32);
              __int16 v73 = (id *)(a1 + 32);
              v75[0] = _NSConcreteStackBlock;
              v75[1] = 3221225472;
              v75[2] = sub_10001FC00;
              v75[3] = &unk_100089A30;
              objc_copyWeak(&v78, v73 + 2);
              id v76 = *v73;
              double v77 = v42;
              [v72 requestWaypointForCurrentLocation:v74 completion:v75];

              objc_destroyWeak(&v78);
            }
          }
LABEL_33:
        }
      }
    }
  }
}

void sub_10001FAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FC00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      uint64_t v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = *(char **)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        double v16 = v11;
        __int16 v17 = 2112;
        v18[0] = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "unable to get waypoint for location <%@> with error : %@", buf, 0x16u);
      }

      [*(id *)(a1 + 40) stop];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001FE64;
      v12[3] = &unk_100089798;
      objc_copyWeak(&v14, (id *)(a1 + 48));
      id v13 = v5;
      dispatch_async(*(dispatch_queue_t *)(v8 + 72), v12);

      objc_destroyWeak(&v14);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    double v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      double v16 = "NavdRouteGenius.mm";
      __int16 v17 = 1026;
      LODWORD(v18[0]) = 1223;
      WORD2(v18[0]) = 2082;
      *(void *)((char *)v18 + 6) = "-[NavdRouteGenius didUpdateLocation:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10001FE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FE64(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  NSUInteger v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 13, *(id *)(a1 + 32));
    sub_1000164B8(v3, v3[11]);
  }
  else
  {
    GEOFindOrCreateLog();
    double v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "NavdRouteGenius.mm";
      __int16 v7 = 1026;
      int v8 = 1231;
      __int16 v9 = 2082;
      uint64_t v10 = "-[NavdRouteGenius didUpdateLocation:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerInnerStrongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_10001FF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v11 = v10;

  a9.super_class = (Class)NavdRouteGenius;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000200A0(void *a1)
{
}

void sub_100020120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

dispatch_queue_t *sub_100020238(dispatch_queue_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *a1 = 0;
  __int16 v7 = [v5 copy];
  a1[1] = v7;
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v6);
  dispatch_queue_t v9 = *a1;
  *a1 = v8;

  return a1;
}

void sub_1000202AC(id a1)
{
  GEOConfigGetDouble();
  qword_1000A24F0 = v1;
}

void sub_1000202D8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    NSUInteger v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "self went away in MSg::Queue::async()", v4, 2u);
    }
  }
}

void sub_100020384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002091C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 copy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_100020DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021138(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(id *)(a1 + 32);
    if (MapsSuggestionsIsTrue())
    {
      objc_initWeak(&location, WeakRetained);
      *(void *)block = _NSConcreteStackBlock;
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = sub_100021388;
      *(void *)&block[24] = &unk_100089C10;
      objc_copyWeak(&v11, &location);
      id v4 = v3;
      dispatch_queue_t v9 = WeakRetained;
      id v10 = v4;
      dispatch_async(WeakRetained[1], block);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)block = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Not all Runconditions YES, skipping looking for Entries", block, 2u);
      }

      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)block = 136446722;
      *(void *)&void block[4] = "NavdVehicleBluetoothConnectAction.mm";
      *(_WORD *)&block[12] = 1026;
      *(_DWORD *)&block[14] = 158;
      *(_WORD *)&block[18] = 2082;
      *(void *)&block[20] = "-[NavdVehicleBluetoothConnectAction actWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", block, 0x1Cu);
    }
  }
}

void sub_100021360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021388(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unsigned int v23 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089B10 name:@"noMapItemFilter"];
    BOOL v22 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089B30 name:@"notADestinationFilter"];
    id v21 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089B50 name:@"parkedCarFilter"];
    id v20 = +[MapsSuggestionsEngineBuilder forDevice];
    id v3 = [v20 withoutTracker];
    id v4 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
    id v5 = [v3 withLocationUpdater:v4];
    from = v2;
    v28[0] = v23;
    v28[1] = v22;
    v28[2] = v21;
    id v6 = objc_alloc_init((Class)MapsSuggestionsZeroWeightFilter);
    v28[3] = v6;
    id v7 = objc_alloc_init((Class)MapsSuggestionsNearbyFilter);
    v28[4] = v7;
    dispatch_queue_t v8 = +[NSArray arrayWithObjects:v28 count:5];
    dispatch_queue_t v9 = +[NSSet setWithArray:v8];
    id v10 = [v5 withPostFilters:v9];
    uint64_t v11 = [v10 build];
    long long v12 = (void *)WeakRetained[7];
    WeakRetained[7] = v11;

    if (WeakRetained[7])
    {
      id v13 = [objc_alloc((Class)MapsSuggestionsBlockFilter) initWithBlock:&stru_100089B70];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "addAdditionalFilter:forSink:", v13);
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Ready to run oneshot Engine", buf, 2u);
      }

      double v15 = (void *)WeakRetained[7];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100021A40;
      void v25[3] = &unk_100089BE8;
      objc_copyWeak(&v27, from);
      id v26 = *(id *)(a1 + 40);
      if (![v15 oneShotTopSuggestionsForSink:WeakRetained count:3 transportType:0 callback:v25 onQueue:*(void *)(*(void *)(a1 + 32) + 8)])
      {
        double v16 = (void *)WeakRetained[7];
        WeakRetained[7] = 0;

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }

      objc_destroyWeak(&v27);
    }
    else
    {
      double v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "unable to build Engine", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    __int16 v17 = v22;
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      id v30 = "NavdVehicleBluetoothConnectAction.mm";
      __int16 v31 = 1026;
      int v32 = 219;
      __int16 v33 = 2082;
      double v34 = "-[NavdVehicleBluetoothConnectAction _executeConnectAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: executeStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
    unsigned int v23 = v17;
  }
}

void sub_100021800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  objc_destroyWeak(v20);
  _Unwind_Resume(a1);
}

BOOL sub_100021908(id a1, MapsSuggestionsEntry *a2)
{
  id v2 = [(MapsSuggestionsEntry *)a2 geoMapItem];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL sub_100021940(id a1, MapsSuggestionsEntry *a2)
{
  id v2 = a2;
  if ([(MapsSuggestionsEntry *)v2 containsKey:@"MapsSuggestionsIsNotADestinationKey"])unsigned __int8 v3 = [(MapsSuggestionsEntry *)v2 BOOLeanForKey:@"MapsSuggestionsIsNotADestinationKey" is:0]; {
  else
  }
    unsigned __int8 v3 = 1;

  return v3;
}

void sub_10002199C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000219AC(id a1, MapsSuggestionsEntry *a2)
{
  return [(MapsSuggestionsEntry *)a2 type] != (id)7;
}

BOOL sub_1000219D0(id a1, MapsSuggestionsEntry *a2)
{
  id v2 = a2;
  unsigned __int8 v3 = objc_alloc_init(MapsSuggestionsOfflineService);
  unsigned __int8 v4 = [(MapsSuggestionsOfflineService *)v3 shouldKeepEntryWhenOffline:v2];

  return v4;
}

void sub_100021A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021A40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Done running oneshot Engine", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_queue_t v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = (void *)*((void *)WeakRetained + 1);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100021CC0;
    void v13[3] = &unk_100089BC0;
    uint64_t v11 = v10;
    objc_copyWeak(&v17, (id *)(a1 + 40));
    id v16 = *(id *)(a1 + 32);
    id v14 = v6;
    id v15 = v5;
    dispatch_async(v11, v13);

    objc_destroyWeak(&v17);
  }
  else
  {
    GEOFindOrCreateLog();
    long long v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      uint64_t v19 = "NavdVehicleBluetoothConnectAction.mm";
      __int16 v20 = 1026;
      int v21 = 265;
      __int16 v22 = 2082;
      unsigned int v23 = "-[NavdVehicleBluetoothConnectAction _executeConnectAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100021C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021CC0(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v62 = (uint64_t)WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      uint64_t v74 = "NavdVehicleBluetoothConnectAction.mm";
      __int16 v75 = 1026;
      int v76 = 268;
      __int16 v77 = 2082;
      id v78 = "-[NavdVehicleBluetoothConnectAction _executeConnectAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  unsigned __int8 v4 = (void *)WeakRetained[7];
  WeakRetained[7] = 0;

  if (!*(void *)(a1 + 32))
  {
    from = v2;
    GEOFindOrCreateLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      long long v12 = (char *)[*(id *)(a1 + 40) count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v74 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "number of destinations = %lu", buf, 0xCu);
    }

    if (![*(id *)(a1 + 40) count])
    {
      id v28 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "no destinations", buf, 2u);
      }

      uint64_t v9 = 0;
      uint64_t v8 = *(void *)(a1 + 48);
      goto LABEL_10;
    }
    uint64_t v60 = MapsSuggestionsCurrentBestLocation();
    if (!v60)
    {
      uint64_t v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "MapsSuggestionsCurrentBestLocation is nil", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_63;
    }
    id v61 = [*(id *)(a1 + 40) firstObject];
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v62 + 8));
    double v57 = MapsSuggestionsNow();
    id v13 = [v61 geoMapItem];
    uint64_t v59 = MapsSuggestionsLocationForMapItem();

    if (!v59)
    {
      id v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v71 = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Destination entry or currentLocation is nil", v71, 2u);
      }

LABEL_48:
      double v38 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Not showing destination because we were recently there.", buf, 2u);
      }

      goto LABEL_62;
    }
    id v14 = [[_BTNotificationLocationTimestamp alloc] initWithLocation:v59 timestamp:v57];
    id v15 = (id *)(v62 + 80);
    unsigned __int8 v16 = [*(id *)(v62 + 80) containsObject:v14];
    id v17 = *(void **)(v62 + 80);
    if (v16)
    {
      id v18 = [v17 mutableCopy];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v19 = *v15;
      id v20 = [v19 countByEnumeratingWithState:&v67 objects:buf count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v68;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v68 != v21) {
              objc_enumerationMutation(v19);
            }
            unsigned int v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            double v24 = [v23 timestamp];
            double v25 = MapsSuggestionsSecondsSince(v24);

            if ([v23 isEqual:v14])
            {
              GEOConfigGetDouble();
              if (v25 < v26)
              {

                goto LABEL_48;
              }
              [v18 removeObject:v14];
              [v18 addObject:v14];
            }
            GEOConfigGetDouble();
            if (v25 > v27) {
              [v18 removeObject:v23];
            }
          }
          id v20 = [v19 countByEnumeratingWithState:&v67 objects:buf count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      objc_storeStrong(v15, v18);
    }
    else
    {
      [v17 addObject:v14];
    }
    uint64_t v31 = v62;
    [v61 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
    if ([v61 containsKey:@"MapsSuggestionsETAKey"])
    {
      int v32 = [v61 ETAForKey:@"MapsSuggestionsETAKey"];
      if (![v32 transportType])
      {
        __int16 v33 = sub_1000227A8(v62);
        unsigned int v34 = [v32 isValidForLocation:v60 requirements:v33];

        if (v34)
        {
          [v32 seconds];
          double v36 = v35;
          GEOConfigGetDouble();
          if (v36 >= v37) {
            sub_100022854(v62, v61);
          }
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_62:
LABEL_63:

          id v10 = (void *)v62;
          goto LABEL_11;
        }
      }

      uint64_t v31 = v62;
    }
    if (!*(void *)(v31 + 48))
    {
      id v39 = objc_alloc((Class)MapsSuggestionsETARequester);
      uint64_t v40 = *(void *)(v31 + 32);
      int v41 = +[MapsSuggestionsPredictor sharedPredictor];
      uint64_t v42 = sub_1000227A8(v31);
      id v43 = [v39 initWithNetworkRequester:v40 transportModePredictor:v41 requirements:v42];
      BOOL v45 = *(void **)(v31 + 48);
      __int16 v44 = (id *)(v31 + 48);
      *__int16 v44 = v43;

      [*v44 forceTransportType:0];
    }
    id v46 = objc_alloc_init((Class)GEOAutomobileOptions);
    unsigned __int8 v47 = +[NSFileManager defaultManager];
    unsigned __int8 v48 = [v47 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.Maps"];
    id v49 = [v48 path];
    BOOL v50 = _CFPreferencesGetAppBooleanValueWithContainer() == 0;

    if (v50) {
      uint64_t v51 = 3;
    }
    else {
      uint64_t v51 = 1;
    }
    [v46 setTrafficType:v51];
    [*(id *)(v62 + 48) setAutomobileOptions:v46];
    id v52 = *(id *)(v62 + 48);

    id v72 = v61;
    id v53 = +[NSArray arrayWithObjects:&v72 count:1];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100022CF8;
    v63[3] = &unk_100089B98;
    objc_copyWeak(&v66, from);
    id v65 = *(id *)(a1 + 48);
    id v54 = v61;
    id v64 = v54;
    unsigned int v55 = [v52 ETAsFromLocation:v60 toEntries:v53 completion:v63];

    if (!v55)
    {
      double v56 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v74 = (char *)v54;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Could not request an ETA for Entry %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }

    objc_destroyWeak(&v66);
    goto LABEL_62;
  }
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = *(char **)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v74 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Error occured while running oneshot Engine :%@", buf, 0xCu);
  }

LABEL_9:
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
LABEL_10:
  id v10 = (void *)v62;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);
LABEL_11:
}

void sub_100022608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

id sub_1000227A8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    id v3 = objc_alloc((Class)MapsSuggestionsETARequirements);
    GEOConfigGetDouble();
    double v5 = v4;
    GEOConfigGetDouble();
    double v7 = v6;
    GEOConfigGetDouble();
    id v9 = [v3 initWithMaxAge:v5 maxDistance:v7 minAccuracy:v8];
    id v10 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v9;

    id v2 = *(void **)(a1 + 40);
  }

  return v2;
}

void sub_100022854(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 containsKey:@"MapsSuggestionsETAKey"] & 1) == 0)
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v23 = 136446978;
      double v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/NavdVehicleBluetooth/NavdVehicleBluetoothConnectAction.mm";
      __int16 v25 = 1024;
      *(_DWORD *)double v26 = 353;
      *(_WORD *)&v26[4] = 2082;
      *(void *)&v26[6] = "-[NavdVehicleBluetoothConnectAction fireNotificationForDestination:]";
      *(_WORD *)&v26[14] = 2082;
      *(void *)&v26[16] = "! [entry containsKey:MapsSuggestionsETAKey]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination with an ETA", (uint8_t *)&v23, 0x26u);
    }
    goto LABEL_15;
  }
  if (MapsSuggestionsIsTrue())
  {
    double v4 = [v3 ETAForKey:@"MapsSuggestionsETAKey"];
    id v5 = v3;
    id v6 = v4;
    if ([v5 containsKey:@"MapsSuggestionsEntryTitleNameKey"]) {
      [v5 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
    }
    else {
    double v8 = [v5 undecoratedTitle];
    }
    [v6 seconds];
    NSStringFromMapsSuggestionsShortETA();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v8;
    if (qword_1000A2500 != -1) {
      dispatch_once(&qword_1000A2500, &stru_100089C30);
    }
    uint64_t v11 = (*(void (**)(uint64_t, id, id))(qword_1000A24F8 + 16))(qword_1000A24F8, v9, v10);

    [v5 setTitle:v11];
    long long v12 = [v6 trafficString];
    [v5 setSubtitle:v12];

    double v7 = objc_alloc_init((Class)GEOURLOptions);
    [v7 setEnableTraffic:1];
    [v7 setTransportType:0];
    [v7 setReferralIdentifier:@"com.apple.navd.bulletinboard"];
    id v13 = [v5 geoMapItem];
    id v14 = +[GEOMapItemURLExtras urlToPresentDirectionsFromCurrentLocationToMapItem:v13 withOptions:v7];

    id v15 = *(void **)(a1 + 64);
    unsigned __int8 v16 = [v5 title];
    id v17 = [v5 subtitle];
    [v15 showWithTitle:v16 message:v17 actionURL:v14];

    GEOFindOrCreateLog();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v5 title];
      id v20 = [v5 subtitle];
      uint64_t v21 = [v14 absoluteString];
      int v23 = 138412802;
      double v24 = v19;
      __int16 v25 = 2112;
      *(void *)double v26 = v20;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Sent Notification with Title: %@ and message : %@ and url: %@", (uint8_t *)&v23, 0x20u);
    }
    uint64_t v22 = *(void *)(a1 + 72);
    if (v22) {
      (*(void (**)(void))(v22 + 16))();
    }

LABEL_15:
  }
}

void sub_100022C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022CF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        long long v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error getting ETA: %@", (uint8_t *)&v11, 0xCu);
      }

      goto LABEL_13;
    }
    if (![*(id *)(a1 + 32) containsKey:@"MapsSuggestionsETAKey"])
    {
LABEL_13:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_14;
    }
    double v7 = [*(id *)(a1 + 32) ETAForKey:@"MapsSuggestionsETAKey"];
    [v7 seconds];
    double v9 = v8;
    GEOConfigGetDouble();
    if (v9 >= v10) {
      sub_100022854((uint64_t)WeakRetained, *(void **)(a1 + 32));
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      long long v12 = "NavdVehicleBluetoothConnectAction.mm";
      __int16 v13 = 1026;
      int v14 = 319;
      __int16 v15 = 2082;
      unsigned __int8 v16 = "-[NavdVehicleBluetoothConnectAction _executeConnectAction:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
  }
LABEL_14:
}

void sub_100022F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023010(id a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002321C;
  block[3] = &unk_100089C78;
  void block[4] = "NavdVehicleBluetoothConnectAction";
  if (qword_1000A2510 != -1) {
    dispatch_once(&qword_1000A2510, block);
  }
  id v1 = (id)qword_1000A2508;
  id v2 = [v1 localizedStringForKey:@"MAPS_ETA_TO_CUSTOM" value:@"%@ to %@<unlocalized>" table:0];
  id v3 = MapsSuggestionsNonNilString();

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002318C;
  v7[3] = &unk_100089C58;
  id v8 = v3;
  id v4 = v3;
  id v5 = objc_retainBlock(v7);
  id v6 = (void *)qword_1000A24F8;
  qword_1000A24F8 = (uint64_t)v5;
}

void sub_100023170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002318C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", *(void *)(a1 + 32), v5, v6);

  return v7;
}

void sub_100023208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002321C()
{
  if (!qword_1000A2508)
  {
    uint64_t v0 = +[NSBundle bundleWithIdentifier:@"com.apple.MapsSuggestions"];
    id v1 = (void *)qword_1000A2508;
    qword_1000A2508 = v0;

    if (!qword_1000A2508)
    {
      id v2 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        int v3 = 136446978;
        id v4 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDefines.h";
        __int16 v5 = 1024;
        int v6 = 324;
        __int16 v7 = 2082;
        id v8 = "NSBundle * _Nonnull _MapsSuggestionsBundle(const char * _Nonnull)_block_invoke";
        __int16 v9 = 2082;
        double v10 = "nil == s_bundleWithMapsSuggestionsIdentifier";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires bundleWithIdentifier:@\"com.apple.MapsSuggestions\"", (uint8_t *)&v3, 0x26u);
      }
    }
  }
}

void sub_100023438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,void *a23,void *a24,uint64_t a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32)
{
  _Unwind_Resume(a1);
}

void sub_100023EA8(uint64_t a1)
{
  char CanRun = NavdDoomCanRun();
  int v3 = GEOFindOrCreateLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (CanRun)
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Doom can run", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023FDC;
    block[3] = &unk_1000896E8;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v6);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Doom can not Run", buf, 2u);
    }
  }
}

void sub_100023FDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    double v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v11 = 136446722;
      *(void *)&void v11[4] = "NavdMapsSuggestionsController.mm";
      *(_WORD *)&v11[12] = 1026;
      *(_DWORD *)&v11[14] = 205;
      *(_WORD *)&unsigned char v11[18] = 2082;
      *(void *)&v11[20] = "-[NavdMapsSuggestionsController startDoomIfNotStarted]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v11, 0x1Cu);
    }
    id v8 = v10;
    goto LABEL_11;
  }
  if (!WeakRetained[4])
  {
    int v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Starting Doom", v11, 2u);
    }

    BOOL v4 = [NavdDoomHost alloc];
    id v5 = *((id *)v2 + 3);
    *(void *)int v11 = _NSConcreteStackBlock;
    *(void *)&v11[8] = 3221225472;
    *(void *)&v11[16] = sub_1000242CC;
    *(void *)&v11[24] = &unk_1000892D8;
    id v12 = v5;
    uint64_t v6 = qword_1000A2520;
    id v7 = v5;
    if (v6 != -1) {
      dispatch_once(&qword_1000A2520, v11);
    }
    id v8 = (id)qword_1000A2518;

    id v9 = [(NavdDoomHost *)v4 initFromResourceDepot:v7 sharedRegister:v8];
    double v10 = *((void *)v2 + 4);
    *((void *)v2 + 4) = v9;
LABEL_11:
  }
}

void sub_100024208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000242CC(uint64_t a1)
{
  double v36 = +[MapsSuggestionsMapsInstalledTriggeringToggle description];
  v37[0] = v36;
  id v34 = [objc_alloc((Class)MapsSuggestionsMapsInstalledTriggeringToggle) initWithName:@"mapsAppInstalled" startState:0];
  v38[0] = v34;
  double v35 = +[MapsSuggestionsBluetoothVehicleConnectionTrigger description];
  v37[1] = v35;
  id v29 = [objc_alloc((Class)MapsSuggestionsBluetoothVehicleConnectionTrigger) initFireOnConnect:0 disconnect:1 exit:1];
  v38[1] = v29;
  id v28 = +[MapsSuggestionsDestinationdTrigger description];
  v37[2] = v28;
  id v27 = objc_alloc_init((Class)MapsSuggestionsDestinationdTrigger);
  v38[2] = v27;
  double v26 = +[MapsSuggestionsFirstUnlockTrigger description];
  v37[3] = v26;
  id v25 = objc_alloc_init((Class)MapsSuggestionsFirstUnlockTrigger);
  v38[3] = v25;
  double v24 = +[MapsSuggestionsNetworkReachableTrigger description];
  v37[4] = v24;
  id v23 = objc_alloc_init((Class)MapsSuggestionsNetworkReachableTrigger);
  void v38[4] = v23;
  uint64_t v22 = +[MapsSuggestionsNoCellularDataCondition description];
  v37[5] = v22;
  id v21 = objc_alloc_init((Class)MapsSuggestionsNoCellularDataCondition);
  v38[5] = v21;
  id v20 = +[MapsSuggestionsSiri isEnabledCondition];
  id v19 = [v20 uniqueName];
  v37[6] = v19;
  id v18 = +[MapsSuggestionsSiri isEnabledCondition];
  v38[6] = v18;
  id v17 = +[MapsSuggestionsSiri isAllowedOnHomeScreenCondition];
  unsigned __int8 v16 = [v17 uniqueName];
  v37[7] = v16;
  __int16 v15 = +[MapsSuggestionsSiri isAllowedOnHomeScreenCondition];
  v38[7] = v15;
  id v30 = +[MapsSuggestionsSiri isAllowedOnLockScreenCondition];
  uint64_t v31 = [v30 uniqueName];
  v37[8] = v31;
  int v32 = +[MapsSuggestionsSiri isAllowedOnLockScreenCondition];
  v38[8] = v32;
  __int16 v33 = +[MapsSuggestionsEventKitChangedTrigger description];
  v37[9] = v33;
  id v2 = objc_alloc((Class)MapsSuggestionsEventKitChangedTrigger);
  int v3 = [*(id *)(a1 + 32) oneEventKit];
  id v4 = [v2 initWithEventKit:v3];
  v38[9] = v4;
  id v5 = +[MapsSuggestionsPreferredTransportTypeTrigger description];
  v37[10] = v5;
  id v6 = objc_alloc_init((Class)MapsSuggestionsPreferredTransportTypeTrigger);
  v38[10] = v6;
  id v7 = +[MapsSuggestionsUserDeletedSuggestionTrigger description];
  v37[11] = v7;
  id v8 = [objc_alloc((Class)MapsSuggestionsUserDeletedSuggestionTrigger) initWithName:@"userDeleteTrigger"];
  v38[11] = v8;
  id v9 = +[NavdMapsSuggestionsLBALocationAccessAllowedCondition description];
  v37[12] = v9;
  double v10 = objc_alloc_init(NavdMapsSuggestionsLBALocationAccessAllowedCondition);
  v38[12] = v10;
  int v11 = +[MapsSuggestionsTransportTypePreferenceCondition description];
  v37[13] = v11;
  id v12 = [objc_alloc((Class)MapsSuggestionsTransportTypePreferenceCondition) initWithName:@"isTransportModeSupported" requiresTransportType:0];
  v38[13] = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:14];
  int v14 = (void *)qword_1000A2518;
  qword_1000A2518 = v13;
}

void sub_1000246FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000248DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) isTrue] ^ 1;
}

void sub_100024EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100024F10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [NavdDoomScheduledWakeupTrigger alloc];
    int v3 = MapsSuggestionsNow();
    id v4 = [(NavdDoomLaunchTrigger *)v2 initWithTriggerDate:v3];

    [WeakRetained _notifyObserversWithTrigger:v4];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "NavdDoomHost.m";
      __int16 v7 = 1026;
      int v8 = 158;
      __int16 v9 = 2082;
      double v10 = "-[NavdDoomHost initFromResourceDepot:sharedRegister:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

id MapsSuggestionsNow()
{
  id v0 = (id)qword_1000A2528;
  id v1 = v0;
  if (v0)
  {
    id v2 = v0;
  }
  else
  {
    id v2 = +[NSDate date];
  }
  int v3 = v2;

  return v3;
}

id MapsSuggestionsNowWithOffset(double a1)
{
  id v2 = objc_alloc((Class)NSDate);
  int v3 = MapsSuggestionsNow();
  id v4 = [v2 initWithTimeInterval:v3 sinceDate:a1];

  return v4;
}

id sub_100025944()
{
  id v0 = +[NSTimeZone systemTimeZone];

  return v0;
}

void MapsSuggestionsSetFakeNow(void *a1)
{
  id v1 = a1;
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Overriding Now to %@", (uint8_t *)&v5, 0xCu);
  }

  id v3 = [v1 copy];
  id v4 = (void *)qword_1000A2528;
  qword_1000A2528 = (uint64_t)v3;
}

double MapsSuggestionsSecondsTo(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = MapsSuggestionsNow();
    [v1 timeIntervalSinceDate:v2];
    double v4 = v3;
  }
  else
  {
    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446978;
      int v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTime.m";
      __int16 v9 = 1024;
      int v10 = 76;
      __int16 v11 = 2082;
      id v12 = "NSTimeInterval MapsSuggestionsSecondsTo(NSDate *__strong _Nonnull)";
      __int16 v13 = 2082;
      int v14 = "nil == (timeInTheFuture)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time", (uint8_t *)&v7, 0x26u);
    }

    double v4 = 1.79769313e308;
  }

  return v4;
}

double MapsSuggestionsSecondsSince(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = MapsSuggestionsNow();
    [v2 timeIntervalSinceDate:v1];
    double v4 = v3;
  }
  else
  {
    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446978;
      int v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTime.m";
      __int16 v9 = 1024;
      int v10 = 82;
      __int16 v11 = 2082;
      id v12 = "NSTimeInterval MapsSuggestionsSecondsSince(NSDate *__strong _Nonnull)";
      __int16 v13 = 2082;
      int v14 = "nil == (timeInThePast)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time", (uint8_t *)&v7, 0x26u);
    }

    double v4 = 1.79769313e308;
  }

  return v4;
}

BOOL MapsSuggestionsIsInThePast(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136446978;
      __int16 v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTime.m";
      __int16 v10 = 1024;
      int v11 = 88;
      __int16 v12 = 2082;
      __int16 v13 = "BOOL MapsSuggestionsIsInThePast(NSDate *__strong _Nonnull)";
      __int16 v14 = 2082;
      __int16 v15 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time", (uint8_t *)&v8, 0x26u);
    }

    goto LABEL_7;
  }
  MapsSuggestionsNow();
  id v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 == v1)
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  double v3 = MapsSuggestionsNow();
  id v4 = [v1 earlierDate:v3];
  BOOL v5 = v4 == v1;

LABEL_8:
  return v5;
}

BOOL MapsSuggestionsIsInTheFuture(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136446978;
      __int16 v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTime.m";
      __int16 v10 = 1024;
      int v11 = 95;
      __int16 v12 = 2082;
      __int16 v13 = "BOOL MapsSuggestionsIsInTheFuture(NSDate *__strong _Nonnull)";
      __int16 v14 = 2082;
      __int16 v15 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time", (uint8_t *)&v8, 0x26u);
    }

    goto LABEL_7;
  }
  MapsSuggestionsNow();
  id v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2 == v1)
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  double v3 = MapsSuggestionsNow();
  id v4 = [v1 laterDate:v3];
  BOOL v5 = v4 == v1;

LABEL_8:
  return v5;
}

id MapsSuggestionsDateFromString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1000A2538 != -1) {
      dispatch_once(&qword_1000A2538, &stru_100089CC0);
    }
    id v2 = (id)qword_1000A2530;
    double v3 = [v2 dateFromString:v1];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      if (qword_1000A2548 != -1) {
        dispatch_once(&qword_1000A2548, &stru_100089CE0);
      }
      id v6 = (id)qword_1000A2540;
      int v7 = [v6 dateFromString:v1];
      int v8 = v7;
      if (v7)
      {
        id v5 = v7;
      }
      else
      {
        if (qword_1000A2558 != -1) {
          dispatch_once(&qword_1000A2558, &stru_100089D00);
        }
        id v9 = (id)qword_1000A2550;
        __int16 v10 = [v9 dateFromString:v1];
        int v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          if (qword_1000A2568 != -1) {
            dispatch_once(&qword_1000A2568, &stru_100089D20);
          }
          id v12 = [(id)qword_1000A2560 dateFromString:v1];
        }
        id v5 = v12;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id MapsSuggestionsStringFromDate(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1000A2568 != -1) {
      dispatch_once(&qword_1000A2568, &stru_100089D20);
    }
    id v2 = [(id)qword_1000A2560 stringFromDate:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_1000261B8(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_1000A2530;
  qword_1000A2530 = (uint64_t)v1;

  [(id)qword_1000A2530 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  double v3 = (void *)qword_1000A2530;
  id v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  id v5 = (void *)qword_1000A2530;
  sub_100025944();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTimeZone:v6];
}

void sub_100026268(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_1000A2540;
  qword_1000A2540 = (uint64_t)v1;

  [(id)qword_1000A2540 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  double v3 = (void *)qword_1000A2540;
  id v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  id v5 = (void *)qword_1000A2540;
  sub_100025944();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTimeZone:v6];
}

void sub_100026318(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_1000A2550;
  qword_1000A2550 = (uint64_t)v1;

  [(id)qword_1000A2550 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
  double v3 = (void *)qword_1000A2550;
  id v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  id v5 = (void *)qword_1000A2550;
  sub_100025944();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTimeZone:v6];
}

void sub_1000263C8(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_1000A2560;
  qword_1000A2560 = (uint64_t)v1;

  [(id)qword_1000A2560 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  double v3 = (void *)qword_1000A2560;
  id v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  id v5 = (void *)qword_1000A2560;
  sub_100025944();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setTimeZone:v6];
}

id sub_100026A04(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = [a3 uuid];
  id v5 = [v3 containsObject:v4];

  return v5;
}

void sub_100026C74(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026D58;
  v8[3] = &unk_100089D70;
  id v4 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = v3;
  id v5 = v3;
  id v6 = +[NSBlockOperation blockOperationWithBlock:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained addOperation:v6];
}

id sub_100026D58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findWaypointsForKey:*(void *)(a1 + 40) currentLocation:*(void *)(a1 + 48)];
}

void sub_10002714C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  __int16 v15 = sub_100027254;
  unsigned __int8 v16 = &unk_100089DC0;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(a1 + 40);
  id v17 = v6;
  uint64_t v18 = v7;
  id v19 = v5;
  id v20 = v8;
  id v9 = v5;
  id v10 = v6;
  int v11 = +[NSBlockOperation blockOperationWithBlock:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "addOperation:", v11, v13, v14, v15, v16);
}

id sub_100027254(void *a1)
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    int v7 = 138477827;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Got origin waypoint response with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = a1[4];
  id v4 = (void *)a1[5];
  if (v5) {
    return [v4 _receivedErrorWhileResolvingOriginWaypoint:v5 forKey:a1[7]];
  }
  else {
    return [v4 _receivedOriginWaypoint:a1[6] forKey:a1[7]];
  }
}

void sub_10002732C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  __int16 v15 = sub_100027434;
  unsigned __int8 v16 = &unk_100089DC0;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v17 = v6;
  uint64_t v18 = v7;
  id v19 = v5;
  id v20 = v8;
  id v9 = v5;
  id v10 = v6;
  int v11 = +[NSBlockOperation blockOperationWithBlock:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "addOperation:", v11, v13, v14, v15, v16);
}

id sub_100027434(void *a1)
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = a1[4];
    int v7 = 138477827;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Got destination waypoint response with error: %{private}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = a1[4];
  id v4 = (void *)a1[5];
  if (v5) {
    return [v4 _receivedErrorWhileResolvingDestinationWaypoint:v5 forKey:a1[7]];
  }
  else {
    return [v4 _receivedDestinationWaypoint:a1[6] forKey:a1[7]];
  }
}

void sub_1000278C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1000279D0;
  __int16 v15 = &unk_100089E10;
  id v7 = *(id *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v5;
  id v18 = v6;
  id v19 = v7;
  id v8 = v6;
  id v9 = v5;
  id v10 = +[NSBlockOperation blockOperationWithBlock:&v12];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "addOperation:", v10, v12, v13, v14, v15, v16);
}

uint64_t sub_1000279D0(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void sub_100027B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100027BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100027CE0(id a1)
{
  return &off_100090B00;
}

id sub_100027CF0(id a1)
{
  return 0;
}

id sub_100027CF8(id a1)
{
  return 0;
}

id sub_100027D00(id a1)
{
  return 0;
}

id sub_100027D08(id a1)
{
  return &__kCFBooleanFalse;
}

id sub_100027D14(id a1)
{
  return &off_1000906D8;
}

id sub_100027D20(id a1)
{
  return &off_1000906F0;
}

id sub_100027D2C(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_100027D38(id a1)
{
  return &off_100090B10;
}

id sub_100027D44(id a1)
{
  return &off_100090B20;
}

id sub_100027D50(id a1)
{
  return &off_100090B30;
}

id sub_100027D5C(id a1)
{
  return &off_100090708;
}

id sub_100027D68(id a1)
{
  return &off_100090B40;
}

id sub_100027D74(id a1)
{
  return &off_100090B50;
}

id sub_100027D80(id a1)
{
  return &off_100090B40;
}

id sub_100027D8C(id a1)
{
  return &off_100090720;
}

id sub_100027D98(id a1)
{
  return &off_100090738;
}

id sub_100027DA4(id a1)
{
  return &off_100090750;
}

id sub_100027DB0(id a1)
{
  return &off_100090768;
}

id sub_100027DBC(id a1)
{
  return &off_100090780;
}

id sub_100027DC8(id a1)
{
  return &off_100090750;
}

id sub_100027DD4(id a1)
{
  return &off_100090798;
}

id sub_100027DE0(id a1)
{
  return &off_100090B00;
}

id sub_100027DEC(id a1)
{
  return &off_100090B60;
}

id sub_100027DF8(id a1)
{
  return &off_100090B70;
}

id sub_100027E04(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_100027E10(id a1)
{
  return &off_1000907B0;
}

id sub_100027E1C(id a1)
{
  return &off_1000907C8;
}

id sub_100027E28(id a1)
{
  return &off_100090B80;
}

id sub_100027E34(id a1)
{
  return &off_100090B90;
}

id sub_100027E40(id a1)
{
  return &off_100090BA0;
}

id sub_100027E4C(id a1)
{
  return &off_100090B40;
}

id sub_100027E58(id a1)
{
  return &off_100090BB0;
}

id sub_100027E64(id a1)
{
  return &off_100090B70;
}

id sub_100027E70(id a1)
{
  return &off_100090BC0;
}

id sub_100027E7C(id a1)
{
  return &off_100090B40;
}

void sub_100029CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100029CCC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v7 && [v7 hasNonRecommendedRoutesCache])
    {
      int v11 = [v7 nonRecommendedRoutesCache];
      [WeakRetained setCachedRouteCache:v11 forOrigin:*(void *)(a1 + 32) destination:*(void *)(a1 + 40)];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446722;
      uint64_t v14 = "NavdDoomCachingGEORoutesManager.m";
      __int16 v15 = 1026;
      int v16 = 337;
      __int16 v17 = 2082;
      id v18 = "-[NavdDoomCachingGEORoutesManager requestRouteFrom:to:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

void sub_10002A054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A080(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 && !v6) {
      [WeakRetained setCachedWaypoint:v5 forEntry:*(void *)(a1 + 32)];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      int v11 = "NavdDoomCachingGEORoutesManager.m";
      __int16 v12 = 1026;
      int v13 = 360;
      __int16 v14 = 2082;
      __int16 v15 = "-[NavdDoomCachingGEORoutesManager requestWaypointForMapsSuggestionsEntry:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

id sub_10002A5AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _willStartUpdate];
}

void sub_10002A5B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateExitTime];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdDoomConductor.m";
      __int16 v6 = 1026;
      int v7 = 104;
      __int16 v8 = 2082;
      id v9 = "-[NavdDoomConductor update]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10002AB84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  __int16 v12 = sub_10002AEC8;
  int v13 = &unk_10008AB50;
  uint64_t v14 = *(void *)(a1 + 32);
  objc_copyWeak(&v15, (id *)(a1 + 64));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [WeakRetained updateExitTimeForLocation:v3 time:v4 completionHandler:&v10];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 64));
    if (v5)
    {
      __int16 v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Something went wrong with the exit time updater!", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_didUpdateExitTime:", 0, v10, v11, v12, v13, v14);
      GEOFindOrCreateLog();
      int v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = [v5 uniqueName];
        *(_DWORD *)long long buf = 138412546;
        __int16 v17 = v8;
        __int16 v18 = 2080;
        v19[0] = "STEP 1: Updating ExitTimes";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v9 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", buf, 2u);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        __int16 v17 = "NavdDoomConductor.m";
        __int16 v18 = 1026;
        LODWORD(v19[0]) = 172;
        WORD2(v19[0]) = 2082;
        *(void *)((char *)v19 + 6) = "-[NavdDoomConductor _updateExitTime]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
  objc_destroyWeak(&v15);
}

void sub_10002AE94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002AEC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AFB8;
  v10[3] = &unk_10008AB28;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v11 = v6;
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void sub_10002AFB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      [WeakRetained _didUpdateExitTime:0];
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = [*(id *)(a1 + 32) localizedDescription];
        int v15 = 138412290;
        int v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v15, 0xCu);
      }
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v7 = [v3 uniqueName];
        int v15 = 138412546;
        int v16 = v7;
        __int16 v17 = 2080;
        v18[0] = "STEP 1: Updating ExitTimes";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v15, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v15) = 0;
LABEL_19:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      id v9 = *(void **)(a1 + 40);
      if (v9)
      {
        int v10 = [*(id *)(a1 + 48) internalStorage];
        id v11 = [v10 mostRecentExitTime];
        unsigned __int8 v12 = [v9 isEqualToDate:v11];

        if ((v12 & 1) == 0)
        {
          [v3 _didInvalidateWindowForReason:2];
          [v3 _didUpdateWindowForDoom:0];
        }
      }
      [v3 _setWindowFromExitTime:*(void *)(a1 + 40)];
      [v3 _didUpdateExitTime:*(void *)(a1 + 40)];
      uint64_t v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v3 uniqueName];
        int v15 = 138412546;
        int v16 = v14;
        __int16 v17 = 2080;
        v18[0] = "STEP 1: Updating ExitTimes";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v15) = 0;
        goto LABEL_19;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      int v16 = "NavdDoomConductor.m";
      __int16 v17 = 1026;
      LODWORD(v18[0]) = 150;
      WORD2(v18[0]) = 2082;
      *(void *)((char *)v18 + 6) = "-[NavdDoomConductor _updateExitTime]_block_invoke_3";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

void sub_10002B728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002B768(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B838;
  block[3] = &unk_10008ABA0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
}

void sub_10002B838(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      [WeakRetained _didUpdateDestinations:*(void *)(a1 + 32)];
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromMapsSuggestionsEntries();
        id v5 = (char *)objc_claimAutoreleasedReturnValue();
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Got Destinations %@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Could not get Destinations", (uint8_t *)&v9, 2u);
      }

      [v3 _didUpdateDestinations:*(void *)(a1 + 32)];
      id v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [v3 uniqueName];
        int v9 = 138412546;
        id v10 = v8;
        __int16 v11 = 2080;
        v12[0] = "STEP 3: Updating Routes";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v9, 0x16u);
      }
      uint64_t v4 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v4))
      {
        LOWORD(v9) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "NavdDoomConductor.m";
      __int16 v11 = 1026;
      LODWORD(v12[0]) = 207;
      WORD2(v12[0]) = 2082;
      *(void *)((char *)v12 + 6) = "-[NavdDoomConductor updateDestinationsForWindow:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_10002C95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

void sub_10002C994(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned __int8 v12 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  _OWORD v16[2] = sub_10002CAC4;
  v16[3] = &unk_10008ABF0;
  objc_copyWeak(&v21, (id *)(a1 + 48));
  char v22 = a2;
  id v17 = v11;
  id v18 = v10;
  id v19 = v9;
  id v20 = *(id *)(a1 + 40);
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  dispatch_async(v12, v16);

  objc_destroyWeak(&v21);
}

void sub_10002CAC4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136446722;
      id v25 = "NavdDoomConductor.m";
      __int16 v26 = 1026;
      LODWORD(v27[0]) = 301;
      WORD2(v27[0]) = 2082;
      *(void *)((char *)v27 + 6) = "-[NavdDoomConductor updateRoutesForDestinations:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v24, 0x1Cu);
    }

    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 72) || *(void *)(a1 + 32))
  {
    uint64_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(char **)(a1 + 32);
      int v24 = 138412290;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error while getting Routes: %@", (uint8_t *)&v24, 0xCu);
    }

    [v3 _didUpdateRoutes:0 incidents:0];
    [v3 _didEndUpdate];
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v3 uniqueName];
      int v24 = 138412546;
      id v25 = v7;
      __int16 v26 = 2080;
      v27[0] = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v24, 0x16u);
    }
    id v8 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v8)) {
      goto LABEL_14;
    }
    LOWORD(v24) = 0;
    goto LABEL_10;
  }
  id v9 = [WeakRetained guard];
  unsigned __int8 v10 = [v9 evaluateError:*(void *)(a1 + 32)];

  if ((v10 & 1) == 0)
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = *(char **)(a1 + 32);
      int v24 = 138412290;
      id v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Guard didn't like error: %@", (uint8_t *)&v24, 0xCu);
    }

    [v3 _didUpdateRoutes:0 incidents:*(void *)(a1 + 40)];
    [v3 _didEndUpdate];
    id v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v3 uniqueName];
      int v24 = 138412546;
      id v25 = v20;
      __int16 v26 = 2080;
      v27[0] = "STEP 3: Updating Routes";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v24, 0x16u);
    }
    id v8 = GEOFindOrCreateLog();
    if (!os_signpost_enabled(v8)) {
      goto LABEL_14;
    }
    LOWORD(v24) = 0;
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 48) count])
  {
    [v3 _didUpdateRoutes:*(void *)(a1 + 48) incidents:*(void *)(a1 + 40)];
    id v11 = *(void **)(a1 + 48);
    unsigned __int8 v12 = [*(id *)(a1 + 56) firstObject];
    id v13 = [v11 objectForKeyedSubscript:v12];

    id v14 = [v13 firstObject];
    objc_msgSend(v3[4], "setNumberOfAlertableRoutes:", (char *)objc_msgSend(v3[4], "numberOfAlertableRoutes") + 1);
    id v15 = [v3 alerter];
    int v16 = [*(id *)(a1 + 56) firstObject];
    [v15 alertBrokenRouteWithRecommendedAlternate:v14 forDestination:v16];

    [v3 _didEndUpdate];
    goto LABEL_15;
  }
  id v21 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Received empty routes per destination, this is good!", (uint8_t *)&v24, 2u);
  }

  [v3 _didUpdateRoutes:*(void *)(a1 + 48) incidents:*(void *)(a1 + 40)];
  [v3 _didEndUpdate];
  char v22 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    id v23 = [v3 uniqueName];
    int v24 = 138412546;
    id v25 = v23;
    __int16 v26 = 2080;
    v27[0] = "STEP 3: Updating Routes";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v24, 0x16u);
  }
  id v8 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v24) = 0;
LABEL_10:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", (uint8_t *)&v24, 2u);
  }
LABEL_14:

LABEL_15:
}

id sub_10002D654(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

id sub_10002D7D8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

uint64_t sub_10002D964(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willStartUpdate];
  }
  return result;
}

uint64_t sub_10002DB28(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willUpdateExitTime];
  }
  return result;
}

uint64_t sub_10002DD6C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateExitTime];
  }
  return result;
}

void sub_10002DDC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained internalStorage];
    uint64_t v4 = [v3 mostRecentDoomWindow];
    [v2 updateDestinationsForWindow:v4];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "NavdDoomConductor.m";
      __int16 v7 = 1026;
      int v8 = 491;
      __int16 v9 = 2082;
      unsigned __int8 v10 = "-[NavdDoomConductor _didUpdateExitTime:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

uint64_t sub_10002E05C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didInvalidateWindow];
  }
  return result;
}

uint64_t sub_10002E224(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateWindow];
  }
  return result;
}

uint64_t sub_10002E3E8(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willUpdateDestinations];
  }
  return result;
}

uint64_t sub_10002E6A8(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateDestinations];
  }
  return result;
}

void sub_10002E6FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained internalStorage];
    uint64_t v4 = [v3 mostRecentDestinations];
    [v2 updateRoutesForDestinations:v4];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "NavdDoomConductor.m";
      __int16 v7 = 1026;
      int v8 = 534;
      __int16 v9 = 2082;
      unsigned __int8 v10 = "-[NavdDoomConductor _didUpdateDestinations:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

uint64_t sub_10002E9A0(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willUpdateRoutes];
  }
  return result;
}

uint64_t sub_10002EB84(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateRoutes];
  }
  return result;
}

uint64_t sub_10002ED30(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willFireAlert];
  }
  return result;
}

uint64_t sub_10002EEE4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didFireAlert];
  }
  return result;
}

uint64_t sub_10002F098(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didScheduleWakeup];
  }
  return result;
}

uint64_t sub_10002F290(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didEndUpdate];
  }
  return result;
}

void sub_10002FB90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002FBB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FCF8;
    block[3] = &unk_10008AC40;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    id v12 = *(id *)(a1 + 32);
    id v11 = v3;
    dispatch_async(v6, block);

    objc_destroyWeak(&v13);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = GEOErrorDomain();
    __int16 v9 = +[NSError errorWithDomain:v8 code:-8 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);
  }
}

void sub_10002FCF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _processUpdatedSyncVehicles:*(void *)(a1 + 32)];
    id v4 = [v3 copy];
    int v5 = (void *)v8[2];
    v8[2] = v4;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v3 = GEOErrorDomain();
    uint64_t v7 = +[NSError errorWithDomain:v3 code:-8 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void sub_10002FF50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addOrEditVehicle:*(void *)(a1 + 32)];
}

void sub_100030110(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  __int16 v9 = v2;
  id v3 = +[NSArray arrayWithObjects:&v9 count:1];
  id v4 = +[_TtC8MapsSync22MapsSyncQueryPredicate queryPredicateWithFormat:@"vehicleIdentifier == %@" argumentArray:v3];

  id v5 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v4 sortDescriptors:0 range:0];
  id v6 = objc_alloc_init((Class)MSVehicleRequest);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030294;
  v7[3] = &unk_10008AC90;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  [v6 fetchWithOptions:v5 completionHandler:v7];

  objc_destroyWeak(&v8);
}

void sub_100030278(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100030294(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = GEOFindOrCreateLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load load sync vehicle: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = [v5 firstObject];
    [WeakRetained _removeSyncVehicle:v8];
  }
}

void sub_1000304EC(uint64_t a1)
{
  uint64_t v2 = +[_TtC8MapsSync13MapsSyncStore sharedStore];
  uint64_t v6 = *(void *)(a1 + 32);
  id v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000305F0;
  v4[3] = &unk_10008ACB8;
  id v5 = *(id *)(a1 + 32);
  [v2 deleteWithObjects:v3 completionHandler:v4];
}

void sub_1000305F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [*(id *)(a1 + 32) identifier];
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      uint64_t v7 = "Failed to delete vehicle: %@ error: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    int v11 = 138412290;
    id v12 = v6;
    uint64_t v7 = "Successfully removed vehicle %@.";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_1000308E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addOrEditVehicle:*(void *)(a1 + 32)];
}

void sub_100030D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, id a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_100030DD0(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100030EE4;
    v7[3] = &unk_10008AD48;
    id v8 = v3;
    id v9 = a1[4];
    id v10 = v5;
    objc_copyWeak(&v11, a1 + 5);
    dispatch_async(v6, v7);
    objc_destroyWeak(&v11);
  }
}

void sub_100030EE4(id *a1)
{
  id v65 = [a1[4] firstObject];
  if (!v65)
  {
    id v1 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      id v2 = a1[5];
      *(_DWORD *)long long buf = 138412290;
      v79 = v2;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Didn't find vehicle: %@ in sync storage. Will create a new one.", buf, 0xCu);
    }

    id v65 = objc_alloc_init((Class)MSVehicle);
  }
  id v3 = objc_msgSend(a1[6], "identifier", v65);
  id v4 = [v3 copy];
  [v66 setVehicleIdentifier:v4];

  id v5 = [a1[6] iapIdentifier];
  id v6 = [v5 copy];
  [v66 setIapIdentifier:v6];

  uint64_t v7 = [a1[6] siriIntentsIdentifier];
  id v8 = [v7 copy];
  [v66 setSiriIntentsIdentifier:v8];

  id v9 = [a1[6] creationDate];
  [v66 setDateOfVehicleIngestion:v9];

  id v10 = [a1[6] lastStateUpdateDate];
  [v66 setLastStateUpdateDate:v10];

  id v11 = [a1[6] displayName];
  id v12 = [v11 copy];
  [v66 setDisplayName:v12];

  __int16 v13 = [a1[6] year];
  if ([v13 integerValue])
  {
    id v14 = [a1[6] year];
    id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 integerValue]);
    [v66 setYear:v15];
  }
  else
  {
    [v66 setYear:0];
  }

  int v16 = [a1[6] manufacturer];
  id v17 = [v16 copy];
  [v66 setManufacturer:v17];

  id v18 = [a1[6] model];
  id v19 = [v18 copy];
  [v66 setModel:v19];

  id v20 = [a1[6] colorHex];
  id v21 = [v20 copy];
  [v66 setColorHex:v21];

  char v22 = [a1[6] licensePlate];
  id v23 = [v22 copy];
  [v66 setLicensePlate:v23];

  int v24 = [a1[6] lprVehicleType];
  id v25 = [v24 copy];
  [v66 setLprVehicleType:v25];

  __int16 v26 = [a1[6] lprPowerType];
  id v27 = [v26 copy];
  [v66 setLprPowerType:v27];

  id v28 = [a1[6] headUnitBluetoothIdentifier];
  id v29 = [v28 copy];
  [v66 setHeadUnitBluetoothIdentifier:v29];

  id v30 = [a1[6] headUnitIdentifier];
  id v31 = [v30 copy];
  [v66 setHeadUnitMacAddress:v31];

  int v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a1[6] supportedConnectors]);
  [v66 setSupportedConnectors:v32];

  __int16 v33 = [a1[6] powerByConnector];

  if (v33)
  {
    id v34 = objc_opt_new();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id obj = [a1[6] powerByConnector];
    id v35 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v74;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v74 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v38 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          id v39 = [a1[6] powerByConnector];
          uint64_t v40 = [v39 objectForKeyedSubscript:v38];

          int v41 = +[NSUnitPower watts];
          uint64_t v42 = [v40 measurementByConvertingToUnit:v41];
          [v42 doubleValue];
          id v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v34 setObject:v43 forKeyedSubscript:v38];
        }
        id v35 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v35);
    }

    id v72 = 0;
    __int16 v33 = +[NSKeyedArchiver archivedDataWithRootObject:v34 requiringSecureCoding:1 error:&v72];
    id v44 = v72;
    if (v44 || !v33)
    {
      BOOL v45 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v46 = [a1[6] powerByConnector];
        *(_DWORD *)long long buf = 138412546;
        v79 = v46;
        __int16 v80 = 2112;
        id v81 = v44;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to persist poweByConnector dictionary: %@, error: %@.", buf, 0x16u);
      }
    }
  }
  [v66 setPowerByConnector:v33];
  unsigned __int8 v47 = [a1[6] preferredChargingNetworks];

  if (v47)
  {
    id v48 = objc_alloc_init((Class)VGChargingNetworksStorage);
    id v49 = [a1[6] preferredChargingNetworks];
    BOOL v50 = [v49 allObjects];
    uint64_t v51 = objc_msgSend(v50, "_geo_map:", &stru_10008ACF8);

    id v52 = [v51 mutableCopy];
    [v48 setNetworks:v52];

    objc_msgSend(v48, "setUsesPreferredNetworksForRouting:", objc_msgSend(a1[6], "usesPreferredNetworksForRouting"));
    unsigned __int8 v47 = [v48 data];
  }
  [v66 setPreferredChargingNetworks:v47];
  id v53 = [a1[6] currentVehicleState];
  if (v53)
  {
    unsigned int v54 = [a1[6] isPureElectricVehicle];

    if (v54)
    {
      unsigned int v55 = [a1[6] currentVehicleState];
      double v56 = [v55 _storage];

      double v57 = [a1[6] pairedAppInstallDeviceIdentifier];
      id v58 = [v57 copy];
      [v56 setPairedAppInstallDeviceIdentifier:v58];

      uint64_t v59 = [a1[6] pairedAppInstallSessionIdentifier];
      id v60 = [v59 copy];
      [v56 setPairedAppInstallSessionIdentifier:v60];

      id v53 = [v56 data];
    }
    else
    {
      id v53 = 0;
    }
  }
  [v66 setCurrentVehicleState:v53];
  id v61 = [a1[6] pairedAppIdentifier];
  id v62 = [v61 copy];
  [v66 setPairedAppIdentifier:v62];

  double v63 = +[_TtC8MapsSync13MapsSyncStore sharedStore];
  __int16 v77 = v66;
  id v64 = +[NSArray arrayWithObjects:&v77 count:1];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000317D4;
  v69[3] = &unk_10008AD20;
  objc_copyWeak(&v71, a1 + 7);
  id v70 = a1[5];
  [v63 saveWithObjects:v64 completionHandler:v69];

  objc_destroyWeak(&v71);
}

void sub_1000317B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

VGChargingNetworkStorage *__cdecl sub_1000317CC(id a1, VGChargingNetwork *a2)
{
  return (VGChargingNetworkStorage *)_VGChargingNetworkStorageFromVGChargingNetwork(a2);
}

void sub_1000317D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003189C;
    v7[3] = &unk_1000891A8;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void sub_10003189C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = GEOFindOrCreateLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      uint64_t v7 = "Failed to persist vehicle: %@ error: %@";
      id v8 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138412290;
    uint64_t v13 = v11;
    uint64_t v7 = "Successfully saved vehicle %@ as MSVehicle.";
    id v8 = v4;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_100031CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100031D04(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 3);
    [v5 garagePersister:v4 wantsToUpdateVehicles:v6];
  }
}

void sub_100032318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, void *a11, id *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,void *a39)
{
  objc_destroyWeak(v42);
  objc_destroyWeak(v45);

  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v46 - 128));

  _Unwind_Resume(a1);
}

void sub_100032434()
{
}

void sub_10003244C(void *a1)
{
  id v1 = a1;
  objc_sync_enter(v1);
  GEOFindOrCreateLog();
  uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = v1[8];
    int v4 = 134218240;
    uint64_t v5 = v3;
    __int16 v6 = 2048;
    uint64_t Integer = GEOConfigGetInteger();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Resetting locationbudget from %ld to %ld", (uint8_t *)&v4, 0x16u);
  }

  v1[8] = GEOConfigGetInteger();
  objc_sync_exit(v1);
}

void sub_100032554(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032588(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    GEOConfigGetDouble();
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    uint64_t v7 = (void *)WeakRetained[1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000327C0;
    v10[3] = &unk_100089BC0;
    id v8 = v7;
    objc_copyWeak(&v14, a1 + 6);
    id v13 = v3;
    id v11 = a1[4];
    id v12 = a1[5];
    dispatch_after(v6, v8, v10);

    objc_destroyWeak(&v14);
  }
  else
  {
    GEOFindOrCreateLog();
    os_log_type_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      int v16 = "NavdVehicleBluetoothNotificationHandler.mm";
      __int16 v17 = 1026;
      int v18 = 112;
      __int16 v19 = 2082;
      id v20 = "-[NavdVehicleBluetoothNotificationHandler initWithCiruitBoard:connectTriggers:connectConditions:disconnectTr"
            "iggers:disconnectConditions:networkRequester:notifier:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000327A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000327C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (MapsSuggestionsIsTrue())
    {
      id v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Car disconnected, clearing notification", v5, 2u);
      }

      [*(id *)(a1 + 40) clear];
      sub_1000328F8(WeakRetained);
    }
    else
    {
      int v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Not All RunConditions are YES, so not clearing notification", buf, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000328E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000328F8(void *a1)
{
  id obj = a1;
  objc_sync_enter(obj);
  [obj[4] stop];
  [obj[3] removeTrigger:obj[4]];
  [obj[3] removeTrigger:obj[5]];
  id v1 = obj[5];
  obj[5] = 0;

  id v2 = obj[4];
  obj[4] = 0;

  objc_sync_exit(obj);
}

void sub_10003298C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void sub_1000329A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Travelled to large distance, clearing notification", (uint8_t *)&v7, 2u);
    }

    [*(id *)(a1 + 32) clear];
    sub_1000328F8(WeakRetained);
    v3[2](v3, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    dispatch_time_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "NavdVehicleBluetoothNotificationHandler.mm";
      __int16 v9 = 1026;
      int v10 = 136;
      __int16 v11 = 2082;
      id v12 = "-[NavdVehicleBluetoothNotificationHandler initWithCiruitBoard:connectTriggers:connectConditions:disconnectTr"
            "iggers:disconnectConditions:networkRequester:notifier:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100032B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100032B54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = MapsSuggestionsCurrentBestLocation();
    if (v2)
    {
      GEOFindOrCreateLog();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        [v2 distanceFromLocation:WeakRetained[7]];
        int v11 = 134217984;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "distance to current location: %.2f", (uint8_t *)&v11, 0xCu);
      }

      double v5 = WeakRetained;
      objc_sync_enter(v5);
      if (!v5[7].isa || (objc_msgSend(v2, "distanceFromLocation:"), double v7 = v6, GEOConfigGetDouble(), v7 > v8))
      {
        objc_storeStrong((id *)&v5[7].isa, v2);
        sub_10003244C(v5);
      }
      BOOL v9 = v5[8].isa != 0;
      objc_sync_exit(v5);
    }
    else
    {
      double v5 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No current Location", (uint8_t *)&v11, 2u);
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    double v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      id v12 = "NavdVehicleBluetoothNotificationHandler.mm";
      __int16 v13 = 1026;
      int v14 = 148;
      __int16 v15 = 2082;
      int v16 = "-[NavdVehicleBluetoothNotificationHandler initWithCiruitBoard:connectTriggers:connectConditions:disconnectTr"
            "iggers:disconnectConditions:networkRequester:notifier:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
    BOOL v9 = 0;
    id v2 = v5;
  }

  return v9;
}

void sub_100032DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032DFC(uint64_t a1)
{
  id v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connect Action Complete", (uint8_t *)&v16, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    objc_sync_enter(v5);
    if ((uint64_t)v5[8] >= 1)
    {
      uint64_t v6 = MapsSuggestionsCurrentBestLocation();
      double v7 = (void *)v5[7];
      v5[7] = v6;

      --v5[8];
    }
    objc_sync_exit(v5);

    double v8 = v5;
    objc_sync_enter(v8);
    [(objc_class *)v8[4].isa stop];
    [(objc_class *)v8[3].isa removeTrigger:v8[4].isa];
    id v9 = objc_alloc((Class)MapsSuggestionsLocationChangedTrigger);
    int v10 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
    int v11 = (objc_class *)[v9 initWithLocationUpdater:v10];
    Class isa = v8[4].isa;
    v8[4].Class isa = v11;

    Class v13 = v8[4].isa;
    GEOConfigGetDouble();
    -[objc_class startWithMinimumDistance:](v13, "startWithMinimumDistance:");
    [(objc_class *)v8[3].isa addTrigger:v8[4].isa];
    int v14 = objc_alloc_init(NavdNavigationStartedTrigger);
    Class v15 = v8[5].isa;
    v8[5].Class isa = (Class)v14;

    [(objc_class *)v8[3].isa addTrigger:v8[5].isa];
    objc_sync_exit(v8);
  }
  else
  {
    GEOFindOrCreateLog();
    double v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446722;
      __int16 v17 = "NavdVehicleBluetoothNotificationHandler.mm";
      __int16 v18 = 1026;
      int v19 = 161;
      __int16 v20 = 2082;
      id v21 = "-[NavdVehicleBluetoothNotificationHandler initWithCiruitBoard:connectTriggers:connectConditions:disconnectTr"
            "iggers:disconnectConditions:networkRequester:notifier:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

void sub_100033054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000332B4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)a1[4] + 2);
    if (!v3)
    {
      uint64_t v4 = [a1[4] _dummyVehicles];
      double v5 = a1[4];
      uint64_t v6 = (void *)v5[2];
      v5[2] = v4;

      id v3 = (void *)*((void *)a1[4] + 2);
    }
    id v7 = [v3 copy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100033404;
    void v13[3] = &unk_10008AE10;
    id v8 = a1[5];
    id v14 = v7;
    id v15 = v8;
    id v9 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }
  else
  {
    int v10 = (void (**)(id, void, void *))a1[5];
    int v11 = GEOErrorDomain();
    id v12 = +[NSError errorWithDomain:v11 code:-8 userInfo:0];
    v10[2](v10, 0, v12);
  }
}

uint64_t sub_100033404(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100033814(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3 == 1)
  {
    id v40 = v5;
    id v34 = objc_alloc((Class)VGVehicleState);
    uint64_t v36 = [v40 identifier];
    uint64_t v23 = a1[4];
    id v24 = objc_alloc((Class)NSMeasurement);
    id v39 = +[NSUnitLength meters];
    id v8 = objc_msgSend(v24, "initWithDoubleValue:unit:", 75000.0);
    id v25 = objc_alloc((Class)NSMeasurement);
    uint64_t v38 = +[NSUnitLength meters];
    id v10 = [v25 initWithDoubleValue:v38 unit:500000.0];
    id v26 = objc_alloc((Class)NSMeasurement);
    double v37 = +[NSUnitEnergy kilowattHours];
    id v12 = objc_msgSend(v26, "initWithDoubleValue:unit:", 0.0);
    id v27 = objc_alloc((Class)NSMeasurement);
    [&off_100090BE0 doubleValue];
    double v29 = v28 * 100.0;
    int v16 = +[NSUnitEnergy kilowattHours];
    id v17 = [v27 initWithDoubleValue:v16 unit:v29];
    id v30 = objc_alloc((Class)NSMeasurement);
    int v19 = (void *)v36;
    __int16 v20 = +[NSUnitEnergy kilowattHours];
    id v21 = [v30 initWithDoubleValue:v20 unit:66.0];
    LOBYTE(v32) = 0;
    id v22 = [v34 initWithIdentifier:v36 dateOfUpdate:v23 origin:0 batteryPercentage:&off_100090BE0 currentEVRange:v8 maxEVRange:v10 minBatteryCapacity:v12 currentBatteryCapacity:v17 maxBatteryCapacity:v21 consumptionArguments:a1[5] chargingArguments:a1[6] isCharging:v32 activeConnector:2];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v40 = v5;
    id v33 = objc_alloc((Class)VGVehicleState);
    uint64_t v35 = [v40 identifier];
    uint64_t v6 = a1[4];
    id v7 = objc_alloc((Class)NSMeasurement);
    id v39 = +[NSUnitLength meters];
    id v8 = objc_msgSend(v7, "initWithDoubleValue:unit:", 250000.0);
    id v9 = objc_alloc((Class)NSMeasurement);
    uint64_t v38 = +[NSUnitLength meters];
    id v10 = objc_msgSend(v9, "initWithDoubleValue:unit:", 500000.0);
    id v11 = objc_alloc((Class)NSMeasurement);
    double v37 = +[NSUnitEnergy kilowattHours];
    id v12 = objc_msgSend(v11, "initWithDoubleValue:unit:", 0.0);
    id v13 = objc_alloc((Class)NSMeasurement);
    [&off_100090BD0 doubleValue];
    double v15 = v14 * 100.0;
    int v16 = +[NSUnitEnergy kilowattHours];
    id v17 = [v13 initWithDoubleValue:v16 unit:v15];
    id v18 = objc_alloc((Class)NSMeasurement);
    int v19 = (void *)v35;
    __int16 v20 = +[NSUnitEnergy kilowattHours];
    id v21 = [v18 initWithDoubleValue:v20 unit:66.0];
    LOBYTE(v32) = 0;
    id v22 = [v33 initWithIdentifier:v35 dateOfUpdate:v6 origin:0 batteryPercentage:&off_100090BD0 currentEVRange:v8 maxEVRange:v10 minBatteryCapacity:v12 currentBatteryCapacity:v17 maxBatteryCapacity:v21 consumptionArguments:a1[5] chargingArguments:a1[6] isCharging:v32 activeConnector:2];
  }
  id v31 = v22;

  [v40 _setVehicleState:v31];
  id v5 = v40;
LABEL_6:
}

void sub_100033D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033D38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100033D48(uint64_t a1)
{
}

void sub_100033D50(void *a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 16);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "identifier", (void)v10);
        unsigned int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_100034304(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 nextRefreshActivityFired];
  [v3 setTaskCompleted];
}

void sub_10003449C(void *a1)
{
  v7[0] = GEONavdStatusStartTimeKey;
  uint64_t v2 = a1[4];
  v8[0] = *(void *)(v2 + 8);
  uint64_t v3 = a1[6];
  v7[1] = GEONavdStatusCacheContentsKey;
  id v4 = [*(id *)(v2 + 16) descriptionOfAllEntries];
  v7[2] = GEONavdStatusNextRefreshTime;
  uint64_t v5 = a1[5];
  v8[1] = v4;
  v8[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
}

void sub_10003463C(uint64_t a1)
{
}

uint64_t sub_100034650(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100034660(uint64_t a1)
{
}

void sub_1000347A8(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  int v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_100034A28;
  id v22 = &unk_100089D98;
  id v23 = *(id *)(a1 + 40);
  id v4 = v2;
  id v24 = v4;
  [v3 getCurrentLocationWithHandler:&v19];
  uint64_t v5 = +[GEONavdDefaults sharedInstance];
  [v5 staleLocationUseTimerInterval];
  double v7 = v6;
  [v5 extraLocationWaitTimeInterval];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)((v7 + v8) * 1000000000.0));
  if (dispatch_group_wait(v4, v9))
  {
    long long v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Timed out while waiting for location.", buf, 2u);
    }

    [*(id *)(a1 + 40) fulfillAsFailure];
  }
  else
  {
    long long v11 = *(void **)(a1 + 32);
    long long v12 = [*(id *)(a1 + 40) location];
    [v11 _setLastLocationSafely:v12];

    long long v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      double v14 = [*(id *)(a1 + 40) location];
      [v14 coordinate];
      uint64_t v16 = v15;
      id v17 = [*(id *)(a1 + 40) location];
      [v17 coordinate];
      *(_DWORD *)long long buf = 134283777;
      uint64_t v26 = v16;
      __int16 v27 = 2049;
      uint64_t v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Received location %{private}f, %{private}f", buf, 0x16u);
    }
  }
}

void sub_100034A28(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) fulfillWithLocation:a2];
  }
  else
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Received nil for location.", v4, 2u);
    }

    [*(id *)(a1 + 32) fulfillAsFailure];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100035034(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100035044(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_finishProcessingEntriesWithOsTransaction:", *(void *)(a1 + 40));
}

id sub_1000354C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_q_ProcessEntriesBeforeTimeStamp:withLocation:osTransaction:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56));
}

id sub_1000356E0(void *a1)
{
  return [*(id *)(a1[4] + 16) startMonitoringDestination:a1[5] forClient:a1[6] uuid:a1[7] osTransaction:a1[8] handler:a1[9]];
}

id sub_1000358C0(void *a1)
{
  return [*(id *)(a1[4] + 16) requestRefreshForPlannedDestination:a1[5] client:a1[6] osTransaction:a1[7]];
}

id sub_100035A9C(void *a1)
{
  return [*(id *)(a1[4] + 16) onlyPerformLocalUpdatesForPlannedDestination:a1[5] client:a1[6] osTransaction:a1[7]];
}

id sub_100035CD4(void *a1)
{
  return [*(id *)(a1[4] + 16) stopMonitoringDestination:a1[5] forClient:a1[6] uuid:a1[7] osTransaction:a1[8]];
}

id sub_10003623C(void *a1)
{
  return [*(id *)(a1[4] + 16) didPostUINotification:a1[8] forDestination:a1[5] client:a1[6] osTransaction:a1[7]];
}

id sub_1000364D8(id a1)
{
  return &off_1000907F8;
}

id sub_1000364E8(id a1)
{
  return &off_100090BF0;
}

id sub_1000364F4(id a1)
{
  return &off_100090C00;
}

id sub_100036500(id a1)
{
  return &off_100090CC0;
}

id sub_10003650C(id a1)
{
  return &off_100090C10;
}

id sub_100036518(id a1)
{
  return &off_100090CD0;
}

id sub_100036524(id a1)
{
  return &off_100090810;
}

id sub_100036530(id a1)
{
  return &off_100090C20;
}

id sub_10003653C(id a1)
{
  return &off_100090C20;
}

id sub_100036548(id a1)
{
  return &off_100090C30;
}

id sub_100036554(id a1)
{
  return &off_100090C40;
}

id sub_100036560(id a1)
{
  return &off_100090CE0;
}

id sub_10003656C(id a1)
{
  return &off_100090810;
}

id sub_100036578(id a1)
{
  return &off_100090828;
}

id sub_100036584(id a1)
{
  return &off_100090C50;
}

id sub_100036590(id a1)
{
  return &off_100090C50;
}

id sub_10003659C(id a1)
{
  return &off_100090C50;
}

id sub_1000365A8(id a1)
{
  return &off_100090C60;
}

id sub_1000365B4(id a1)
{
  return &off_100090C70;
}

id sub_1000365C0(id a1)
{
  return &off_100090BF0;
}

id sub_1000365CC(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_1000365D8(id a1)
{
  return &off_100090840;
}

id sub_1000365E4(id a1)
{
  return &off_100090C80;
}

id sub_1000365F0(id a1)
{
  return &off_100090858;
}

id sub_1000365FC(id a1)
{
  return &off_100090CA0;
}

id sub_100036608(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_100036614(id a1)
{
  return &__kCFBooleanTrue;
}

id sub_100036620(id a1)
{
  return &off_100090888;
}

id sub_10003662C(id a1)
{
  return &off_100090C40;
}

id sub_100036638(id a1)
{
  return &off_1000908A0;
}

id sub_100036644(id a1)
{
  return &off_1000908B8;
}

id sub_100036650(id a1)
{
  return &off_1000907F8;
}

id sub_10003665C(id a1)
{
  return &off_1000908D0;
}

id sub_100036668(id a1)
{
  return &off_1000908D0;
}

id sub_100036674(id a1)
{
  return &off_1000908E8;
}

id sub_100036680(id a1)
{
  return &off_100090900;
}

id sub_10003668C(id a1)
{
  return &off_100090CB0;
}

id sub_100036698(id a1)
{
  return &off_100090918;
}

id sub_1000367D0()
{
  id v0 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    id v1 = (objc_class *)objc_opt_class();
    uint64_t v2 = NSStringFromClass(v1);
    uint64_t v3 = +[CLLocationManager navdLocationBundleSource];
    int v10 = 138478083;
    long long v11 = v2;
    __int16 v12 = 2113;
    long long v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "initializing a %{private}@ with bundle source: %{private}@", (uint8_t *)&v10, 0x16u);
  }
  id v4 = objc_alloc((Class)MNHybridLocationProvider);
  uint64_t v5 = +[CLLocationManager navdLocationBundleSource];
  double v6 = +[NSBundle bundleWithPath:v5];
  id v7 = [v4 initWithEffectiveBundle:v6];
  double v8 = (void *)qword_1000A2570;
  qword_1000A2570 = (uint64_t)v7;

  return [(id)qword_1000A2570 setMode:1];
}

void sub_100036938(uint64_t a1)
{
  if (qword_1000A2578 != -1) {
    dispatch_once(&qword_1000A2578, *(dispatch_block_t *)(a1 + 32));
  }
}

void sub_100036C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036CD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100036DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_100036E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000370EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003713C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000371B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100037200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000372C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100037388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000373FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003744C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000374C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000376B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100037B48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100037DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100037FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000382B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_100038390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_100038548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000391F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_Unwind_Exception *exception_object,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void sub_100039A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

id sub_100039A8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained connected];
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "NavdVehicleBluetoothStatus.m";
      __int16 v8 = 1026;
      int v9 = 48;
      __int16 v10 = 2082;
      long long v11 = "-[NavdVehicleBluetoothStatus initWithCircuitBoard:connectTriggers:disconnectTriggers:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    id v3 = 0;
  }

  return v3;
}

uint64_t sub_100039BA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained connected] ^ 1;
  }
  else
  {
    GEOFindOrCreateLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "NavdVehicleBluetoothStatus.m";
      __int16 v8 = 1026;
      int v9 = 53;
      __int16 v10 = 2082;
      long long v11 = "-[NavdVehicleBluetoothStatus initWithCircuitBoard:connectTriggers:disconnectTriggers:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    uint64_t v3 = 0;
  }

  return v3;
}

void sub_100039CB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    sub_100039DDC(WeakRetained, 1, v3);
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "NavdVehicleBluetoothStatus.m";
      __int16 v9 = 1026;
      int v10 = 67;
      __int16 v11 = 2082;
      __int16 v12 = "-[NavdVehicleBluetoothStatus _onConnectCircuit:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100039DDC(void *a1, char a2, void *a3)
{
  id v5 = a3;
  objc_initWeak(&location, a1);
  int v6 = (void *)a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039FF8;
  void v8[3] = &unk_10008BD70;
  objc_copyWeak(&v10, &location);
  char v11 = a2;
  id v7 = v5;
  id v9 = v7;
  [v6 asyncBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void sub_100039EB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100039ED0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    sub_100039DDC(WeakRetained, 0, v3);
  }
  else
  {
    GEOFindOrCreateLog();
    int v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "NavdVehicleBluetoothStatus.m";
      __int16 v9 = 1026;
      int v10 = 77;
      __int16 v11 = 2082;
      __int16 v12 = "-[NavdVehicleBluetoothStatus _onDisconnectCircuit:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100039FF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (unsigned __int8 *)WeakRetained;
    objc_sync_enter(v4);
    int v5 = v4[8];
    v4[8] = *(unsigned char *)(a1 + 48);
    objc_sync_exit(v4);

    unsigned int v6 = [v4 connected];
    if (v5)
    {
      if ((v6 & 1) == 0)
      {
        int v7 = (void *)*((void *)v4 + 3);
LABEL_10:
        [v7 fire];
      }
    }
    else if (v6)
    {
      int v7 = (void *)*((void *)v4 + 2);
      goto LABEL_10;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_12;
  }
  GEOFindOrCreateLog();
  __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136446722;
    int v10 = "NavdVehicleBluetoothStatus.m";
    __int16 v11 = 1026;
    int v12 = 86;
    __int16 v13 = 2082;
    double v14 = "-[NavdVehicleBluetoothStatus connected:withComplition:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
  }

LABEL_12:
}

void sub_10003A630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10003A650(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) endServicingConnection:WeakRetained];
  }

  return _objc_release_x1();
}

id sub_10003A744(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

id sub_10003A7E8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_10003A968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003AB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003AC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003AE20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10003B0F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10003B5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10003B684(id a1)
{
  return &off_100090948;
}

id sub_10003B694(id a1)
{
  return &off_100090948;
}

id sub_10003B6A0(id a1)
{
  return &off_100090948;
}

id sub_10003B6AC(id a1)
{
  return &off_100090948;
}

id sub_10003B6B8(id a1)
{
  return &off_100090948;
}

id sub_10003B6C4(id a1)
{
  return &off_100090948;
}

id sub_10003B6D0(id a1)
{
  return &off_100090948;
}

id sub_10003B6DC(id a1)
{
  return &off_100090948;
}

id sub_10003B6E8(id a1)
{
  return &__kCFBooleanFalse;
}

void sub_10003BA5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = objc_retainBlock(*(id *)(a1 + 32));
    id v4 = (void *)WeakRetained[2];
    WeakRetained[2] = v3;

    int v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v6 = (char *)WeakRetained[4];
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} starting...", (uint8_t *)&v9, 0xCu);
    }

    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __int16 v8 = (char *)WeakRetained[4];
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} started.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      int v10 = "NavdRouteGeniusServer.m";
      __int16 v11 = 1026;
      int v12 = 66;
      __int16 v13 = 2082;
      double v14 = "-[NavdRouteGeniusXPCPeer startWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

id sub_10003BDF8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _stopMonitoring];
}

void sub_10003BF78(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] forceReroute];
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "NavdRouteGeniusServer.m";
      __int16 v6 = 1026;
      int v7 = 91;
      __int16 v8 = 2082;
      int v9 = "-[NavdRouteGeniusXPCPeer forceReroute]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10003C9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location,id a29)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a29);
  _Unwind_Resume(a1);
}

void sub_10003CA4C(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    int v4 = GEOFindOrCreateLog();
    int v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        __int16 v6 = [v3 connection];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "XPC connection %@ became invalid", buf, 0xCu);
      }
      int v7 = WeakRetained[3];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003CCF0;
      block[3] = &unk_100089D70;
      __int16 v11 = a1[4];
      __int16 v8 = v3;
      int v12 = v8;
      __int16 v13 = WeakRetained;
      dispatch_sync(v7, block);
      [WeakRetained _debugPrintOverviewOfConnections];

      int v9 = v11;
    }
    else
    {
      int v9 = v4;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        uint64_t v15 = "NavdRouteGeniusServer.m";
        __int16 v16 = 1026;
        int v17 = 198;
        __int16 v18 = 2082;
        int v19 = "-[NavdRouteGeniusServer listener:shouldAcceptNewConnection:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongPeer went away in %{public}s", buf, 0x1Cu);
      }

      __int16 v8 = 0;
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      uint64_t v15 = "NavdRouteGeniusServer.m";
      __int16 v16 = 1026;
      int v17 = 197;
      __int16 v18 = 2082;
      int v19 = "-[NavdRouteGeniusServer listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    __int16 v8 = v9;
  }
}

void sub_10003CCF0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) connection];

  if (v2 == v3)
  {
    [*(id *)(*(void *)(a1 + 48) + 8) removeObject:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 48) + 8) count])
    {
      int v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Last RouteGeniusXPCPeer disappeared. Stopping RouteGenius", v5, 2u);
      }

      objc_msgSend(*(id *)(a1 + 48), "_q_stop");
    }
  }
}

void sub_10003CDB8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] addObject:*(void *)(a1 + 32)];
    objc_msgSend(v3, "_q_start");
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      __int16 v6 = "NavdRouteGeniusServer.m";
      __int16 v7 = 1026;
      int v8 = 213;
      __int16 v9 = 2082;
      int v10 = "-[NavdRouteGeniusServer listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_10003CFA4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    int v4 = WeakRetained[1];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          __int16 v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "connection", (void)v11);
          int v10 = [v9 remoteObjectProxy];
          [v10 didUpdateRouteGenius:*(void *)(a1 + 32)];
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      int v17 = "NavdRouteGeniusServer.m";
      __int16 v18 = 1026;
      int v19 = 249;
      __int16 v20 = 2082;
      id v21 = "-[NavdRouteGeniusServer didUpdateRouteGenius:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10003D7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003D7EC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error fetching subscriptions", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v13 dataTypes] & 0x400) != 0)
          {
            uint64_t v15 = [v13 region];
            unsigned int v16 = objc_msgSend(v15, "containsCoordinate:", *(double *)(a1 + 48), *(double *)(a1 + 56));

            if (v16)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
              dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

              goto LABEL_19;
            }
          }
          else
          {
            long long v14 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Subscription is not of type offline, skipping.", buf, 2u);
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_19:
    id v6 = v17;
  }
}

void sub_10003DD60(id a1)
{
  qword_1000A2580 = objc_alloc_init(NavdLocationLeecher);

  _objc_release_x1();
}

id sub_10003DF60(uint64_t a1)
{
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Starting to leech locations.", v4, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 8) startUpdatingLocation];
}

void sub_10003E06C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 25))
  {
    *(unsigned char *)(v1 + 25) = 1;
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Pausing location leeching.", v3, 2u);
    }
  }
}

void sub_10003E170(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 25))
  {
    *(unsigned char *)(v1 + 25) = 0;
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Unpausing location leeching.", v3, 2u);
    }
  }
}

id sub_10003E270(uint64_t a1)
{
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Stopping leeching locations.", v4, 2u);
  }

  id result = [*(id *)(*(void *)(a1 + 32) + 8) stopUpdatingLocation];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return result;
}

void sub_10003E360(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10003E464(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003E474(uint64_t a1)
{
}

uint64_t sub_10003E47C(uint64_t a1)
{
  [*(id *)(a1 + 32) _pruneLeachedLocations];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return _objc_release_x1();
}

id sub_10003E568(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

id sub_10003E60C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

void sub_10003E850(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138478339;
    id v8 = v3;
    __int16 v9 = 2049;
    uint64_t v10 = v5;
    __int16 v11 = 2049;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NavdLocationLeecher failed while shifting location: %{private}@. Original location was: %{private}f, %{private}f.", (uint8_t *)&v7, 0x20u);
  }
}

void sub_10003EAD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyObserversAboutError:*(void *)(a1 + 32)];
}

void sub_10003ECBC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _clearLeachedLocations];
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 _notifyObserversAboutPrecision];
}

void sub_10003EF48(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(id *)(a1 + 32);
    if (WeakRetained[2] != v4) {
      objc_storeStrong(WeakRetained + 2, v4);
    }
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11[0] = @"state";
      uint64_t v6 = MSg::jsonFor();
      v12[0] = v6;
      v11[1] = @"step";
      int v7 = MSg::jsonFor();
      v12[1] = v7;
      v11[2] = @"stopReason";
      id v8 = MSg::jsonFor();
      v12[2] = v8;
      __int16 v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
      NSStringFromMapsSuggestionsJSON();
      uint64_t v10 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      long long v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "EVAL{DOoM}=%@", buf, 0xCu);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      long long v14 = "NavdDoomEvalDumper.mm";
      __int16 v15 = 1026;
      int v16 = 45;
      __int16 v17 = 2082;
      long long v18 = "-[NavdDoomEvalDumper logCurrentState:stepName:stopReason:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10003F188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F28C(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper willStartUpdate]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 67;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper willStartUpdate]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003F3CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F4A0(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper willUpdateExitTime]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 68;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper willUpdateExitTime]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003F5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F6B4(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didUpdateExitTime]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 69;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didUpdateExitTime]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003F7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F8C8(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didInvalidateWindow]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 70;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didInvalidateWindow]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003FA08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FADC(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didUpdateWindow]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 71;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didUpdateWindow]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003FC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FCF0(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper willUpdateDestinations]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 72;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper willUpdateDestinations]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10003FE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FF04(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didUpdateDestinations]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 73;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didUpdateDestinations]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100040044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040118(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper willUpdateRoutes]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 74;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper willUpdateRoutes]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100040258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004032C(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didUpdateRoutes]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 75;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didUpdateRoutes]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10004046C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040540(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper willFireAlert]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 76;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper willFireAlert]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100040680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040754(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didFireAlert]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 77;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didFireAlert]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100040894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040968(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didScheduleWakeup]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 78;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didScheduleWakeup]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100040AA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040B7C(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NavdDoomEvalDumper didEndUpdate]_block_invoke");
    [v2 logCurrentState:v3 stepName:v4 stopReason:0];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoomEvalDumper.mm";
      __int16 v8 = 1026;
      int v9 = 79;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoomEvalDumper didEndUpdate]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100040CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041718(id a1)
{
  uint64_t v1 = MNGetProcessHandlingLog();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SystemMemoryPressureWarning", " enableTelemetry=YES ", v2, 2u);
  }
}

void sub_100041790(id a1)
{
  uint64_t v1 = MNGetProcessHandlingLog();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SystemMemoryPressureCritical", " enableTelemetry=YES ", v2, 2u);
  }
}

void sub_100041808(id a1)
{
  uint64_t v1 = MNGetProcessHandlingLog();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessMemoryPressureWarning", " enableTelemetry=YES ", v2, 2u);
  }
}

void sub_100041880(id a1)
{
  uint64_t v1 = MNGetProcessHandlingLog();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessMemoryPressureCritical", " enableTelemetry=YES ", v2, 2u);
  }
}

void sub_100041D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041D80(uint64_t a1)
{
  *(unsigned char *)(a1 + 8) = 0;
  uint64_t v1 = objc_alloc_init(NavdNotificationManager);
  [(NavdNotificationManager *)v1 clearMapsSuggestionsBulletin];
}

void sub_100041DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100041EC8(void *a1)
{
  if (!*(unsigned char *)(a1[4] + 8))
  {
    uint64_t v2 = objc_alloc_init(NavdNotificationManager);
    [(NavdNotificationManager *)v2 showMapsSuggestionsBulletinWithTitle:a1[5] message:a1[6] actionURL:a1[7]];

    *(unsigned char *)(a1[4] + 8) = 1;
  }
}

void sub_100041F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041FD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_100041D80((uint64_t)WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      uint64_t v5 = "NavdRealVehicleBluetoothNotifier.mm";
      __int16 v6 = 1026;
      int v7 = 53;
      __int16 v8 = 2082;
      int v9 = "-[NavdRealVehicleBluetoothNotifier clear]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongself went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_1000420DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042190(id a1)
{
  uint64_t v1 = [MapsSuggestionsNavdLBALocationManager alloc];
  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("MapsSuggestionsNavdLBALocationManagerQueue", v5);
  uint64_t v3 = [(MapsSuggestionsNavdLBALocationManager *)v1 initWithName:@"MapsSuggestionsNavdLBALocationManager" queue:v2];
  int v4 = (void *)qword_1000A2590;
  qword_1000A2590 = (uint64_t)v3;
}

void sub_100042360(id a1)
{
  uint64_t v1 = +[MNFilePaths navdCacheDirectoryPath];
  dispatch_queue_t v2 = (void *)qword_1000A25A0;
  qword_1000A25A0 = v1;

  unsigned __int8 v10 = 0;
  uint64_t v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:qword_1000A25A0 isDirectory:&v10];
  int v5 = v10;

  if ((v4 & 1) == 0 && !v5)
  {
    __int16 v6 = +[NSFileManager defaultManager];
    id v9 = 0;
    [v6 createDirectoryAtPath:qword_1000A25A0 withIntermediateDirectories:1 attributes:0 error:&v9];
    id v7 = v9;

    if (v7)
    {
      __int16 v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v12 = qword_1000A25A0;
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Cannot create cache dir at: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
}

void sub_1000425A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000426E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000427D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000428A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000431E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = +[NavdLocationAuthorizationMonitor sharedMonitor];
  if ([v4 isAuthorizedForLocationWithClientBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 40)])
  {

    goto LABEL_4;
  }
  unsigned __int8 v5 = [*(id *)(a1 + 32) checkDebugEntitlement];

  if (v5)
  {
LABEL_4:
    __int16 v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  [v3 _clearHypothesisAndSetErrorWithCode:-1502];
  __int16 v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    id v7 = [v3 description];
    int v8 = 138477827;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Calling update handler with hypothesis: %{private}@", (uint8_t *)&v8, 0xCu);
  }
LABEL_8:

  [*(id *)(*(void *)(a1 + 32) + 24) navdProxyReceivedHypothesis:v3 forClient:*(void *)(a1 + 40)];
}

void sub_100043AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100043AE8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

void sub_100043AF4(uint64_t a1)
{
  dispatch_queue_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "InvalidationHandler called.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned __int8 v5 = *(NSObject **)(v4 + 32);
  int v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  unsigned __int8 v10 = sub_100043C58;
  __int16 v11 = &unk_1000891A8;
  uint64_t v12 = v4;
  id v13 = WeakRetained;
  id v6 = WeakRetained;
  dispatch_sync(v5, &v8);
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "InvalidationHandler called (peer removed).", buf, 2u);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "shouldPostDarwinNotificationForNextUpdate:", 1, v8, v9, v10, v11, v12);
}

id sub_100043C58(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

void sub_10004428C(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Arrival airport offline area is not in a supported market", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    [*(id *)(a1[4] + 16) spendNow];
    id v3 = MapsSuggestionsLocalizedTitleFormatForAirportArrivalNotification();
    unsigned __int8 v5 = MapsSuggestionsLocalizedMessageForAirportArrivalNotification();
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      uint64_t v9 = v3;
      __int16 v10 = 2112;
      __int16 v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Now telling mapspushd to display notification with the following data:\nTitle: %@\nMessage: %@", (uint8_t *)&v8, 0x16u);
    }

    id v7 = objc_alloc_init(NavdNotificationManager);
    [(NavdNotificationManager *)v7 showAirportArrivalBulletinWithTitle:v3 message:v5 mapRegion:a1[6] regionName:a1[5]];
  }
}

uint64_t NavdDoomCanRun()
{
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    __int16 v12 = 0;
    id v7 = "NavdDoomCanRun is explicitly NO (via NavdDoomRoutesEnabledKey).";
    int v8 = (uint8_t *)&v12;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, v8, 2u);
    goto LABEL_15;
  }
  id v0 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:0 error:0];
  uint64_t v1 = [v0 applicationState];
  unsigned __int8 v2 = [v1 isInstalled];

  if ((v2 & 1) == 0)
  {
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    __int16 v11 = 0;
    id v7 = "NavdDoomCanRun is implicitly NO (via isInstalled).";
    int v8 = (uint8_t *)&v11;
    goto LABEL_14;
  }
  id v3 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  unsigned __int8 v4 = [v3 hasLocationAccess];

  if ((v4 & 1) == 0)
  {
    id v6 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    __int16 v10 = 0;
    id v7 = "NavdDoomCanRun is implicitly NO (via NavdMapsHasLocationAccess).";
    int v8 = (uint8_t *)&v10;
    goto LABEL_14;
  }
  if (NavdDoomCanRequestDirections()) {
    return 1;
  }
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = 0;
    id v7 = "NavdDoomCanRun is implicitly NO.";
    int v8 = (uint8_t *)&v9;
    goto LABEL_14;
  }
LABEL_15:

  return 0;
}

uint64_t NavdDoomCanRequestDirections()
{
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    *(_WORD *)__int16 v15 = 0;
    __int16 v11 = "NavdDoomCanRun is explicitly NO (via NavdDoomRoutesEnabledKey).";
    goto LABEL_16;
  }
  id v0 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:0 error:0];
  uint64_t v1 = [v0 applicationState];
  unsigned __int8 v2 = [v1 isInstalled];

  if ((v2 & 1) == 0)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    *(_WORD *)__int16 v15 = 0;
    __int16 v11 = "NavdDoomCanRun is implicitly NO (via isInstalled).";
    goto LABEL_16;
  }
  id v3 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  unsigned __int8 v4 = [v3 hasLocationAccess];

  if (v4)
  {
    if ((GEOConfigGetBOOL() & 1) == 0)
    {
      int v8 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)__int16 v15 = 0;
      __int16 v9 = "NavdDoomCanRequestDirections is explicitly NO (via NavdDoomRoutesEnabledKey).";
      goto LABEL_19;
    }
    unsigned __int8 v5 = +[GEOCountryConfiguration sharedConfiguration];
    unsigned __int8 v6 = [v5 currentCountrySupportsCommute];

    if ((v6 & 1) == 0)
    {
      int v8 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)__int16 v15 = 0;
      __int16 v9 = "NavdDoomCanRequestDirections is explicitly NO (via GEOCountryConfiguration).";
      goto LABEL_19;
    }
    unint64_t v7 = GEOGetUserTransportTypePreference();
    if (v7 <= 4 && ((1 << v7) & 0x16) != 0)
    {
      int v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int16 v15 = 0;
        __int16 v9 = "NavdDoomCanRequestDirections is implicitly NO (via GEOTransportTypePreference).";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v9, v15, 2u);
        goto LABEL_20;
      }
    }
    else
    {
      if (qword_1000A25B8 != -1) {
        dispatch_once(&qword_1000A25B8, &stru_10008C2E8);
      }
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int16 v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "_mapsNotifactionsEnabled", v15, 2u);
      }

      if (qword_1000A25B0)
      {
        int v8 = [(id)qword_1000A25B0 notificationSettings];
        if ([v8 authorizationStatus] == (id)2
          && ([v8 alertSetting] != (id)1
           || [v8 notificationCenterSetting] == (id)2
           || [v8 lockScreenSetting] == (id)2))
        {
          uint64_t v12 = 1;
          goto LABEL_21;
        }
      }
      else
      {
        int v8 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)__int16 v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "navd unable to access notification center for Maps app settings", v15, 2u);
        }
      }

      int v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int16 v15 = 0;
        __int16 v9 = "NavdDoomCanRequestDirections is implicitly NO (via NotificationCenter).";
        goto LABEL_19;
      }
    }
    goto LABEL_20;
  }
  __int16 v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v15 = 0;
    __int16 v11 = "NavdDoomCanRun is implicitly NO (via NavdMapsHasLocationAccess).";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v11, v15, 2u);
  }
LABEL_17:

  int v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v15 = 0;
    __int16 v9 = "NavdDoomCanRequestDirections is explicitly NO (via primary kill-switch).";
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v12 = 0;
LABEL_21:

  return v12;
}

void sub_100044AE8(id a1)
{
  qword_1000A25B0 = (uint64_t)[objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Maps"];

  _objc_release_x1();
}

id sub_100044BC8(uint64_t a1)
{
  CFStringRef v4 = @"value";
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  unsigned __int8 v5 = v1;
  unsigned __int8 v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_100044DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100044E9C(void *a1, uint64_t a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:v7];

  [v8 setPriority:2];
  [v8 setRequiresExternalPower:0];
  [v8 setRequiresNetworkConnectivity:a2];
  if (a2)
  {
    [v8 setRequiresInexpensiveNetworkConnectivity:0];
    [v8 setNetworkDownloadSize:GEOConfigGetInteger()];
    [v8 setNetworkUploadSize:0];
  }
  [v8 setShouldWakeDevice:1];
  [v8 setScheduleAfter:a3];
  [v8 setTrySchedulingBefore:a3 + a4];

  return v8;
}

void sub_100045034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000450BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1000451F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_100045DC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) coordinate];
      uint64_t v14 = v13;
      [*(id *)(a1 + 32) coordinate];
      *(_DWORD *)long long buf = 134218498;
      uint64_t v20 = v14;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to Request Waypoint for location <%.6f,%.6f> with error:%@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    __int16 v9 = *(void **)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(unsigned int *)(a1 + 72);
    __int16 v11 = [*(id *)(a1 + 56) automobileOptions];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    _OWORD v16[2] = sub_100045FB0;
    v16[3] = &unk_10008C330;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 64);
    [v9 ETAFromWaypoint:v5 toWaypoint:v8 transportType:v10 automobileOptions:v11 completion:v16];
  }
}

void sub_100045FB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) coordinate];
      uint64_t v10 = v9;
      [*(id *)(a1 + 32) coordinate];
      int v12 = 134218498;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to Request ETA for location <%.6f,%.6f> with error:%@", (uint8_t *)&v12, 0x20u);
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

void sub_1000464F0(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) hasBeenFulfilled]
    && ![*(id *)(*(void *)(a1 + 32) + 56) failed])
  {
    id v3 = *(id **)(a1 + 32);
    CFStringRef v4 = [v3[7] location];
    [v3 _updateWithLocation:v4];

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = 0;
  }
  else
  {
    unsigned __int8 v2 = *(void **)(a1 + 32);
    [v2 _setState:0];
  }
}

void sub_100046CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_100046D1C(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFStringRef v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (*(unsigned char *)(a1 + 56)) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = (uint64_t)[v5 localUpdatesOnly];
      }
      [v5 _recievedUpdatedHypothesis:v7 updateRefreshTimeStamp:v6];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    objc_sync_exit(v5);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_100046DF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100047668(uint64_t a1, uint64_t a2, void *a3)
{
  id result = [a3 localUpdatesOnly];
  if (result) {
    ++*(void *)(*(void *)(a1 + 32) + 48);
  }
  return result;
}

id sub_100047830(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetValues];
}

id sub_100047E70(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetValues];
  id result = [*(id *)(a1 + 40) type];
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

void sub_100047F50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _resetValues];
    v2[2] = 2;
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdDoomPowerLogger.m";
      __int16 v6 = 1026;
      int v7 = 133;
      __int16 v8 = 2082;
      uint64_t v9 = "-[NavdDoomPowerLogger triggerFired:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100048108(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 32) = 1;
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdDoomPowerLogger.m";
      __int16 v6 = 1026;
      int v7 = 149;
      __int16 v8 = 2082;
      uint64_t v9 = "-[NavdDoomPowerLogger didFireAlert]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

id sub_100048284(uint64_t a1)
{
  uint64_t v2 = MapsSuggestionsNow();
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  [*(id *)(a1 + 32) _flushToPowerLog];
  id v5 = *(void **)(a1 + 32);

  return [v5 _resetValues];
}

void sub_1000483E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048DC4(id a1)
{
  qword_1000A25C0 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Maps.commute"];

  _objc_release_x1();
}

void sub_1000490F8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10004910C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = +[NavdLocationLeecher sharedLeecher];
    uint64_t v3 = [v2 lastLeechedLocation];
    [WeakRetained _updateLocationIfAllowed:v3];

    int v4 = +[NavdLocationLeecher sharedLeecher];
    [v4 addObserver:WeakRetained];

    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Starting visit monitoring", (uint8_t *)&v7, 2u);
    }

    [WeakRetained[1] startMonitoringSignificantLocationChanges];
    [WeakRetained[1] startMonitoringVisits];
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "MapsSuggestionsNavdLocationManager.m";
      __int16 v9 = 1026;
      int v10 = 66;
      __int16 v11 = 2082;
      int v12 = "-[MapsSuggestionsNavdLocationManager onStartImplementation]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_10004938C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000493A0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = +[NavdLocationLeecher sharedLeecher];
    [v2 removeObserver:WeakRetained];

    [WeakRetained[1] stopMonitoringSignificantLocationChanges];
    [WeakRetained[1] stopMonitoringVisits];
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v4) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Stopped visit monitoring", (uint8_t *)&v4, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "MapsSuggestionsNavdLocationManager.m";
      __int16 v6 = 1026;
      int v7 = 83;
      __int16 v8 = 2082;
      __int16 v9 = "-[MapsSuggestionsNavdLocationManager onStopImplementation]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100049854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100049868(uint64_t a1)
{
  if (MapsSuggestionsIsValidVisit())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v3 = WeakRetained;
      -[NSObject considerMyAllowanceAsLimited:](WeakRetained, "considerMyAllowanceAsLimited:", [*(id *)(a1 + 40) _hasMapsCoarseLocationEnabled]);
      [v3 considerMyNewVisit:*(void *)(a1 + 32)];
    }
    else
    {
      GEOFindOrCreateLog();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        int v7 = "MapsSuggestionsNavdLocationManager.m";
        __int16 v8 = 1026;
        int v9 = 157;
        __int16 v10 = 2082;
        __int16 v11 = "-[MapsSuggestionsNavdLocationManager locationManager:didVisit:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
      }

      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = *(char **)(a1 + 32);
      int v6 = 138412290;
      int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Dropping invalid visit: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

id sub_100049B58()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_1000A25D0;
  uint64_t v7 = qword_1000A25D0;
  if (!qword_1000A25D0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004A078;
    v3[3] = &unk_10008C418;
    void v3[4] = &v4;
    sub_10004A078((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100049C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10004A078(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000A25D8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10004A1CC;
    void v4[4] = &unk_100089C78;
    v4[5] = v4;
    long long v5 = off_10008C438;
    uint64_t v6 = 0;
    qword_1000A25D8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000A25D8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MSPMapsPushDaemonRemoteProxy");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1000A25D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10004A1CC()
{
  uint64_t result = _sl_dlopen();
  qword_1000A25D8 = result;
  return result;
}

void sub_10004A968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, uint64_t a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_10004AAAC(id a1, MapsSuggestionsEntry *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = objc_alloc_init(MapsSuggestionsOfflineService);
  unsigned __int8 v4 = [(MapsSuggestionsOfflineService *)v3 shouldKeepEntryWhenOffline:v2];

  return v4;
}

void sub_10004AB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10004AB1C(id a1, MapsSuggestionsEntry *a2)
{
  return [(MapsSuggestionsEntry *)a2 type] == (id)15;
}

void sub_10004ADCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10004AE50(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v5 = MapsSuggestionsCurrentBestLocation();

    if (v5)
    {
      [WeakRetained[10] stop];
      id v6 = WeakRetained[10];
      WeakRetained[10] = 0;

      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Received a location, starting streamers", (uint8_t *)&v11, 2u);
      }

      startEventKitStreamer();
      startWalletStreamer();
      v3[2](v3, 0);
    }
    else
    {
      int v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Got called with a location but somehow MapsSuggestionsCurrentBestLocation() is still nil. Restarting location updates.", (uint8_t *)&v11, 2u);
      }

      id v10 = WeakRetained[10];
      GEOConfigGetDouble();
      objc_msgSend(v10, "restartWithUpdateTime:");
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      int v12 = "NavdVenueAnnouncer.mm";
      __int16 v13 = 1026;
      int v14 = 337;
      __int16 v15 = 2082;
      __int16 v16 = "-[NavdVenueAnnouncer _startStreamersWithNotificationName:resourceDepot:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void sub_10004B094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _processEntries:*(void *)(a1 + 32)];
  }
  else
  {
    GEOFindOrCreateLog();
    unsigned __int8 v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      id v6 = "NavdVenueAnnouncer.mm";
      __int16 v7 = 1026;
      int v8 = 396;
      __int16 v9 = 2082;
      id v10 = "-[NavdVenueAnnouncer engineRunner:stoppedWithEntries:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void sub_10004B318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004BD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_10004C118(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [*(id *)(a1 + 32) departingAirportCode];
      int v8 = 138412290;
      __int16 v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Left Airport:%@, cleaning up", (uint8_t *)&v8, 0xCu);
    }
    [WeakRetained cleanupAirportArrival];
    v3[2](v3, 0);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      __int16 v9 = "NavdVenueAnnouncer.mm";
      __int16 v10 = 1026;
      int v11 = 545;
      __int16 v12 = 2082;
      __int16 v13 = "-[NavdVenueAnnouncer _startTrackingLeavingTheAirport:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

void sub_10004C2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10004C904(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v4) = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Offline notification sent, cleaning up", (uint8_t *)&v4, 2u);
    }

    [WeakRetained cleanupAirportArrival];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      int v5 = "NavdVenueAnnouncer.mm";
      __int16 v6 = 1026;
      int v7 = 571;
      __int16 v8 = 2082;
      __int16 v9 = "-[NavdVenueAnnouncer _setupOfflineDownloadNotificationCircuitForEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_10004CA58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004CE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  _Unwind_Resume(a1);
}

void sub_10004CF44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __int16 v6 = [*(id *)(a1 + 32) arrivingAirportCode];
      int v9 = 138412290;
      __int16 v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Arrived at Airport:%@", (uint8_t *)&v9, 0xCu);
    }
    int v7 = (void *)WeakRetained[14];
    WeakRetained[14] = 0;

    [WeakRetained _setupOfflineDownloadNotificationCircuitForEntry:*(void *)(a1 + 32)];
    [WeakRetained _startTrackingLeavingTheAirport:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 72) fire];
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      __int16 v10 = "NavdVenueAnnouncer.mm";
      __int16 v11 = 1026;
      int v12 = 613;
      __int16 v13 = 2082;
      int v14 = "-[NavdVenueAnnouncer _trackArrivalAirportForEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_10004D108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D13C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = [*(id *)(a1 + 32) arrivingAirportCode];
      int v6 = 138412290;
      int v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Arrival at %@ timed out", (uint8_t *)&v6, 0xCu);
    }
    [WeakRetained cleanupAirportArrival];
  }
  else
  {
    GEOFindOrCreateLog();
    int v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdVenueAnnouncer.mm";
      __int16 v8 = 1026;
      int v9 = 628;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdVenueAnnouncer _trackArrivalAirportForEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_10004D2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10004D4B0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v6 || ![v5 count])
    {
      __int16 v8 = [v6 description];
      [WeakRetained _logStateForStep:@"no Terminal found" stopReason:v8];
    }
    else
    {
      __int16 v10 = [v5 firstObject];
      [a1[4] setGeoMapItem:v10];

      [a1[5] _fireNotificationIfAtEntry:a1[4]];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      int v12 = "NavdVenueAnnouncer.mm";
      __int16 v13 = 1026;
      int v14 = 655;
      __int16 v15 = 2082;
      __int16 v16 = "-[NavdVenueAnnouncer _treatAirportEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void sub_10004D644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 40));

  _Unwind_Resume(a1);
}

void sub_10004D798(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6 || ![v5 count])
    {
      __int16 v8 = [v6 description];
      [WeakRetained _logStateForStep:@"no Airport found" stopReason:v8];

      [WeakRetained _fireNotificationIfAtEntry:*(void *)(a1 + 32)];
    }
    else
    {
      __int16 v10 = [v5 firstObject];
      int v11 = [v10 _venueInfo];
      int v12 = [v11 venueIdentifier];

      if (!v12)
      {
        [WeakRetained _logStateForStep:@"Airport is not avenue, using Terminal", 0 stopReason];
        [WeakRetained _fireNotificationIfAtEntry:*(void *)(a1 + 32)];
      }
      __int16 v13 = [v5 firstObject];
      int v14 = [v13 _browseCategories];
      id v15 = [v14 count];

      if (!v15)
      {
        [WeakRetained _logStateForStep:@"Airport has no Browse info, using Terminal", 0 stopReason];
        [WeakRetained _fireNotificationIfAtEntry:*(void *)(a1 + 32)];
      }
      uint64_t v16 = [v5 firstObject];
      [*(id *)(a1 + 32) setGeoMapItem:v16];

      [WeakRetained _treatAirportEntry:*(void *)(a1 + 32)];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446722;
      id v18 = "NavdVenueAnnouncer.mm";
      __int16 v19 = 1026;
      int v20 = 670;
      __int16 v21 = 2082;
      uint64_t v22 = "-[NavdVenueAnnouncer _treatTerminalEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v17, 0x1Cu);
    }
  }
}

void sub_10004D9EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004DB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v16 - 40));

  _Unwind_Resume(a1);
}

void sub_10004DB4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6 || ![v5 count])
    {
      __int16 v8 = [v6 description];
      [WeakRetained _logStateForStep:@"no Airport found" stopReason:v8];

      uint64_t v9 = *(void *)(a1 + 32);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10004DDC8;
      void v12[3] = &unk_10008C498;
      objc_copyWeak(&v14, (id *)(a1 + 40));
      id v13 = *(id *)(a1 + 32);
      [WeakRetained _terminalMapItemForEntry:v9 completion:v12];

      objc_destroyWeak(&v14);
    }
    else
    {
      int v11 = [v5 firstObject];
      [*(id *)(a1 + 32) setGeoMapItem:v11];

      [WeakRetained _treatAirportEntry:*(void *)(a1 + 32)];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      uint64_t v16 = "NavdVenueAnnouncer.mm";
      __int16 v17 = 1026;
      int v18 = 694;
      __int16 v19 = 2082;
      int v20 = "-[NavdVenueAnnouncer _treatGateEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_10004DD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004DDC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6 || ![v5 count])
    {
      __int16 v8 = [v6 description];
      [WeakRetained _logStateForStep:@"no Terminal found" stopReason:v8];

      [WeakRetained _fireNotificationIfAtEntry:*(void *)(a1 + 32)];
    }
    else
    {
      __int16 v10 = [v5 firstObject];
      [*(id *)(a1 + 32) setGeoMapItem:v10];

      [WeakRetained _treatTerminalEntry:*(void *)(a1 + 32)];
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      int v12 = "NavdVenueAnnouncer.mm";
      __int16 v13 = 1026;
      int v14 = 698;
      __int16 v15 = 2082;
      uint64_t v16 = "-[NavdVenueAnnouncer _treatGateEntry:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void sub_10004DF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004E188(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || [v5 count] != (id)1)
  {
    __int16 v8 = (char *)[objc_alloc((Class)NSString) initWithFormat:@"Could not get Airport code in %u mapItems, error: %@", objc_msgSend(v5, "count"), v6];
    __int16 v10 = +[NSError GEOErrorWithCode:-8 reason:v8];
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      __int16 v8 = (char *)WeakRetained;
      uint64_t v9 = WeakRetained[3];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004E480;
      block[3] = &unk_10008C4C0;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      dispatch_async(v9, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      GEOFindOrCreateLog();
      int v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        int v18 = "NavdVenueAnnouncer.mm";
        __int16 v19 = 1026;
        int v20 = 732;
        __int16 v21 = 2082;
        uint64_t v22 = "-[NavdVenueAnnouncer _airportMapItemForEntry:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      __int16 v8 = 0;
    }
  }
}

void sub_10004E440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E480(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) firstObject];
    int v4 = MapsSuggestionsMapItemConvertIfNeeded();

    if (MapsSuggestionsMapItemIsAirport())
    {
      if ((MapsSuggestionsMapItemIsVenue() & 1) == 0)
      {
        GEOFindOrCreateLog();
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          id v6 = [v4 name];
          *(_DWORD *)long long buf = 138412290;
          id v15 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Airport '%@' is not a Venue, but that's ok", buf, 0xCu);
        }
      }
      uint64_t v7 = *(void *)(a1 + 40);
      __int16 v13 = v4;
      __int16 v8 = +[NSArray arrayWithObjects:&v13 count:1];
      (*(void (**)(uint64_t, NSObject *, void))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSString);
      __int16 v10 = [v4 name];
      __int16 v8 = [v9 initWithFormat:@"Airport '%@' is not actually an Airport", v10];

      int v11 = +[NSError GEOErrorWithCode:-11 reason:v8];
      int v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = (char *)v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      id v15 = "NavdVenueAnnouncer.mm";
      __int16 v16 = 1026;
      int v17 = 734;
      __int16 v18 = 2082;
      __int16 v19 = "-[NavdVenueAnnouncer _airportMapItemForEntry:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
    int v4 = v8;
  }
}

void sub_10004E768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004E9D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || [v5 count] != (id)1)
  {
    __int16 v8 = (char *)[objc_alloc((Class)NSString) initWithFormat:@"Could not get Terminal in %u mapItems, error: %@", objc_msgSend(v5, "count"), v6];
    __int16 v10 = +[NSError GEOErrorWithCode:-8 reason:v8];
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      __int16 v8 = (char *)WeakRetained;
      id v9 = WeakRetained[3];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004ECCC;
      block[3] = &unk_10008C4C0;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      id v14 = v5;
      id v15 = *(id *)(a1 + 32);
      dispatch_async(v9, block);

      objc_destroyWeak(&v16);
    }
    else
    {
      GEOFindOrCreateLog();
      int v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        __int16 v18 = "NavdVenueAnnouncer.mm";
        __int16 v19 = 1026;
        int v20 = 773;
        __int16 v21 = 2082;
        uint64_t v22 = "-[NavdVenueAnnouncer _terminalMapItemForEntry:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }

      __int16 v8 = 0;
    }
  }
}

void sub_10004EC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004ECCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) firstObject];
    int v4 = MapsSuggestionsMapItemConvertIfNeeded();

    if MapsSuggestionsMapItemIsTerminal() && (MapsSuggestionsMapItemIsVenue())
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = v4;
      id v6 = +[NSArray arrayWithObjects:&v11 count:1];
      (*(void (**)(uint64_t, NSObject *, void))(v5 + 16))(v5, v6, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSString);
      __int16 v8 = [v4 name];
      id v6 = [v7 initWithFormat:@"Terminal '%@' is not actually an Terminal or venue", v8];

      id v9 = +[NSError GEOErrorWithCode:-11 reason:v6];
      __int16 v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        __int16 v13 = (char *)v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      __int16 v13 = "NavdVenueAnnouncer.mm";
      __int16 v14 = 1026;
      int v15 = 775;
      __int16 v16 = 2082;
      int v17 = "-[NavdVenueAnnouncer _terminalMapItemForEntry:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: innerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
    int v4 = v6;
  }
}

void sub_10004EF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004FDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000501F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000502BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050518(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_1000514B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  objc_destroyWeak(v25);

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v26 - 208));

  _Unwind_Resume(a1);
}

void sub_100051610(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained[9];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000517C8;
    v9[3] = &unk_100089AF0;
    objc_copyWeak(&v11, v4);
    id v10 = v3;
    dispatch_async(v7, v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      __int16 v13 = "NavdDoom.mm";
      __int16 v14 = 1026;
      int v15 = 132;
      __int16 v16 = 2082;
      int v17 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000517B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000517C8(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    _OWORD v16[2] = sub_100051C20;
    v16[3] = &unk_10008C510;
    objc_copyWeak(&v18, v2);
    id v17 = *(id *)(a1 + 32);
    int v4 = v16;
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = [WeakRetained uniqueName];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "_updateExitTimeWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_updateExitTimeWithHandler", "", buf, 2u);
    }

    __int16 v8 = MapsSuggestionsCurrentBestLocation();
    objc_initWeak(&location, WeakRetained);
    id v9 = GEOConfigGetString();
    id v10 = WeakRetained[9];
    *(void *)long long buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    if (v9)
    {
      *(void *)&uint8_t buf[16] = sub_100055308;
      *(void *)&buf[24] = &unk_10008C610;
      id v11 = v24;
      objc_copyWeak(v24, &location);
      id v21 = v8;
      __int16 v23 = v4;
      uint64_t v22 = v9;
      id v12 = v8;
      dispatch_async(v10, buf);

      __int16 v13 = (id *)&v23;
    }
    else
    {
      *(void *)&uint8_t buf[16] = sub_1000557F4;
      *(void *)&buf[24] = &unk_10008C4C0;
      id v11 = (id *)&v23;
      objc_copyWeak((id *)&v23, &location);
      id v21 = v8;
      __int16 v13 = (id *)&v22;
      uint64_t v22 = v4;
      id v15 = v8;
      dispatch_async(v10, buf);
    }

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      *(void *)&uint8_t buf[4] = "NavdDoom.mm";
      *(_WORD *)&unsigned char buf[12] = 1026;
      *(_DWORD *)&buf[14] = 134;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:vis"
                            "itMonitor:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100051BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_100051C20(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = WeakRetained + 10;
    if (!v6 || v7)
    {
      id v12 = *v10;
      id *v10 = 0;

      __int16 v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "No exit time available. ActionCircuit not acting. Returning.", (uint8_t *)&v16, 2u);
      }

      sub_100051E90((uint64_t)v9, @"updateExitTimesAction", @"No exit time available");
      if (v7)
      {
        __int16 v14 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v16 = 138412290;
          id v17 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v16, 0xCu);
        }
      }
    }
    else
    {
      objc_storeStrong(v10, a2);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15) {
      (*(void (**)(uint64_t, char *))(v15 + 16))(v15, v7);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136446722;
      id v17 = "NavdDoom.mm";
      __int16 v18 = 1026;
      int v19 = 136;
      __int16 v20 = 2082;
      id v21 = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:visitMonitor:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf3 went away in %{public}s", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

void sub_100051E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100051E90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 88);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100057F60;
  v10[3] = &unk_10008C688;
  void v10[4] = a1;
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [v7 callBlock:v10];
}

void sub_100051F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100051F88(id a1)
{
  id v1 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "DOoM XPC timer fired: MSg.xpcActivity.timer", v2, 2u);
  }
}

id sub_100052004(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)MapsSuggestionsDarwinNotificationTrigger) initWithNotificationName:"DoomTestTriggerNotification" triggerName:@"NavdDoom.DebugTest.DarwinNotification"];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:v3];
  [v5 addObject:*(void *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 56) onEnterTrigger];
  [v5 addObject:v6];

  [v5 addObject:v4];
  id v7 = [v5 copy];

  return v7;
}

void sub_1000520D0(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_100052108(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:v3];
  id v5 = [*(id *)(a1 + 56) isInVisitCondition];
  [v4 addObject:v5];

  id v6 = [v4 copy];

  return v6;
}

void sub_100052198(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1000521C4()
{
  id v0 = +[MapsSuggestionsBlockFilter filterWithBlock:&stru_10008C598];

  return v0;
}

BOOL sub_100052200(id a1, MapsSuggestionsEntry *a2)
{
  uint64_t v2 = a2;
  id v3 = objc_alloc_init(MapsSuggestionsOfflineService);
  unsigned __int8 v4 = [(MapsSuggestionsOfflineService *)v3 shouldKeepEntryWhenOffline:v2];

  return v4;
}

void sub_100052254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100052270(uint64_t a1)
{
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    GEOFindOrCreateLog();
    uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [WeakRetained uniqueName];
      *(_DWORD *)id v49 = 138412546;
      *(void *)&v49[4] = v3;
      *(_WORD *)&v49[12] = 2080;
      *(void *)&v49[14] = "STEP 1: Updating ExitTimes";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", v49, 0x16u);
    }
    unsigned __int8 v4 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)id v49 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", v49, 2u);
    }

    objc_msgSend(WeakRetained[17], "setNumberOfUpdatesToExitTime:", (char *)objc_msgSend(WeakRetained[17], "numberOfUpdatesToExitTime") + 1);
    id v5 = WeakRetained[11];
    *(void *)id v49 = _NSConcreteStackBlock;
    *(void *)&v49[8] = 3221225472;
    *(void *)&v49[16] = sub_100056638;
    *(void *)&v49[24] = &unk_10008C660;
    BOOL v50 = WeakRetained;
    [v5 callBlock:v49];
    if (WeakRetained[10])
    {
      id v6 = [WeakRetained[17] mostRecentDoomWindow];
      id v7 = v6;
      if (v6)
      {
        id v8 = [v6 endDate];
        BOOL v9 = MapsSuggestionsIsInThePast(v8);

        if (v9)
        {
          sub_100053C08((uint64_t)WeakRetained, 1);
          sub_100053C9C((uint64_t)WeakRetained, 0);
        }
      }
      id v10 = MapsSuggestionsCurrentBestLocation();
      if (v10)
      {
        id v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)id v49 = 138412290;
          *(void *)&v49[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Our current location is %@", v49, 0xCu);
        }

        id v12 = WeakRetained[10];
        if (v12)
        {
          __int16 v13 = [WeakRetained internalStorage];
          __int16 v14 = [v13 mostRecentExitTime];
          unsigned __int8 v15 = [v12 isEqualToDate:v14];

          if ((v15 & 1) == 0)
          {
            sub_100053C08((uint64_t)WeakRetained, 2);
            sub_100053C9C((uint64_t)WeakRetained, 0);
          }
        }
        id v16 = objc_alloc((Class)NSDateInterval);
        id v17 = WeakRetained[10];
        GEOConfigGetDouble();
        int v19 = [v17 dateByAddingTimeInterval:-v18];
        __int16 v20 = WeakRetained[10];
        GEOConfigGetDouble();
        id v21 = objc_msgSend(v20, "dateByAddingTimeInterval:");
        uint64_t v22 = [v16 initWithStartDate:v19 endDate:v21];

        sub_100053C08((uint64_t)WeakRetained, 2);
        sub_100053C9C((uint64_t)WeakRetained, v22);
        id v23 = [v22 copy];
        [WeakRetained[17] setMostRecentDoomWindow:v23];

        GEOFindOrCreateLog();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          id v25 = [WeakRetained internalStorage];
          uint64_t v26 = [v25 mostRecentDoomWindow];
          *(_DWORD *)id v49 = 138412290;
          *(void *)&v49[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Updating DOoM window: %@", v49, 0xCu);
        }
        __int16 v27 = [WeakRetained internalStorage];
        uint64_t v28 = [v27 mostRecentDoomWindow];
        double v29 = sub_100053D64(v28);
        sub_100053E78((uint64_t)WeakRetained, v29);

        sub_100053B40((uint64_t)WeakRetained, WeakRetained[10]);
        GEOFindOrCreateLog();
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          id v31 = [WeakRetained uniqueName];
          *(_DWORD *)id v49 = 138412546;
          *(void *)&v49[4] = v31;
          *(_WORD *)&v49[12] = 2080;
          *(void *)&v49[14] = "STEP 1: Updating ExitTimes";
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", v49, 0x16u);
        }
        uint64_t v32 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)id v49 = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", v49, 2u);
        }

        id v33 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "STEP 2: Updating Destinations", v49, 2u);
        }

        objc_msgSend(WeakRetained[17], "setNumberOfUpdatesToDestinations:", (char *)objc_msgSend(WeakRetained[17], "numberOfUpdatesToDestinations") + 1);
        id v34 = WeakRetained[11];
        *(void *)id v49 = _NSConcreteStackBlock;
        *(void *)&v49[8] = 3221225472;
        *(void *)&v49[16] = sub_1000569F8;
        *(void *)&v49[24] = &unk_10008C660;
        BOOL v50 = WeakRetained;
        [v34 callBlock:v49];
        if (v7)
        {
          uint64_t v35 = MapsSuggestionsNow();
          unsigned __int8 v36 = [v7 containsDate:v35];

          if (v36)
          {
            uint64_t v37 = 1;
LABEL_49:

            goto LABEL_50;
          }
        }
        GEOFindOrCreateLog();
        int v41 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v42 = MapsSuggestionsNow();
          *(_DWORD *)id v49 = 138412546;
          *(void *)&v49[4] = v42;
          *(_WORD *)&v49[12] = 2112;
          *(void *)&v49[14] = v7;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "We are not currently in a window (%@ not in %@).", v49, 0x16u);
        }
        id v43 = sub_100053D64(v7);
        sub_100053E78((uint64_t)WeakRetained, v43);

        sub_1000542D8(WeakRetained, 0);
        id v44 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "STEP 2: Updating Destinations FAIL", v49, 2u);
        }
      }
      else
      {
        BOOL v45 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Got no location to work with. Keeping window we have.", v49, 2u);
        }

        sub_100053B40((uint64_t)WeakRetained, 0);
        GEOFindOrCreateLog();
        uint64_t v46 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          unsigned __int8 v47 = [WeakRetained uniqueName];
          *(_DWORD *)id v49 = 138412546;
          *(void *)&v49[4] = v47;
          *(_WORD *)&v49[12] = 2080;
          *(void *)&v49[14] = "STEP 1: Updating ExitTimes";
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", v49, 0x16u);
        }
        uint64_t v22 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v22))
        {
          *(_WORD *)id v49 = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", v49, 2u);
        }
      }
      uint64_t v37 = 0;
      goto LABEL_49;
    }
    uint64_t v38 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Got no exitTime to work with", v49, 2u);
    }

    sub_100053B40((uint64_t)WeakRetained, 0);
    GEOFindOrCreateLog();
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      id v40 = [WeakRetained uniqueName];
      *(_DWORD *)id v49 = 138412546;
      *(void *)&v49[4] = v40;
      *(_WORD *)&v49[12] = 2080;
      *(void *)&v49[14] = "STEP 1: Updating ExitTimes";
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", v49, 0x16u);
    }
    id v7 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)id v49 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 1: Updating ExitTimes", "", v49, 2u);
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v49 = 136446722;
      *(void *)&v49[4] = "NavdDoom.mm";
      *(_WORD *)&v49[12] = 1026;
      *(_DWORD *)&v49[14] = 196;
      *(_WORD *)&v49[18] = 2082;
      *(void *)&v49[20] = "-[NavdDoom initFromResourceDepot:triggers:conditions:storage:routesUpdater:guard:alerter:vis"
                            "itMonitor:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", v49, 0x1Cu);
    }
  }
  uint64_t v37 = 0;
LABEL_50:

  return v37;
}

void sub_100052CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100052E5C(id a1, MapsSuggestionsEntry *a2)
{
  unint64_t v2 = (unint64_t)[(MapsSuggestionsEntry *)a2 type];
  return (v2 > 0x18) | (0x80016u >> v2) & 1;
}

void *sub_100052F68(void *result)
{
  uint64_t v1 = result[4];
  if (v1)
  {
    unint64_t v2 = MapsSuggestionsNow();
    id v3 = [v2 copy];
    [*(id *)(v1 + 136) setMostRecentStart:v3];

    unsigned __int8 v4 = *(void **)(v1 + 88);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100056548;
    v5[3] = &unk_10008C660;
    void v5[4] = v1;
    return [v4 callBlock:v5];
  }
  return result;
}

void sub_100053018(_Unwind_Exception *exception_object)
{
}

void sub_100053110(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[10])
    {
      id v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        unsigned __int8 v4 = *(char **)(v2 + 80);
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ExitTime updated to %@. _updateExitTimeActionCircuit kicked off. A Trigger fired and all Conditions passed.", (uint8_t *)&v7, 0xCu);
      }

      sub_100051E90(v2, @"actionCircuitDidAct", 0);
      [*(id *)(v2 + 32) fire];
    }
    else
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "actionCircuitDidAct but _currentExitTime is still nil", (uint8_t *)&v7, 2u);
      }

      sub_100051E90(v2, @"actionCircuitDidAct", @"actionCircuitDidAct but exit time is still nil");
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      id v8 = "NavdDoom.mm";
      __int16 v9 = 1026;
      int v10 = 295;
      __int16 v11 = 2082;
      id v12 = "-[NavdDoom actionCircuitDidAct:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

void sub_100053304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100053418(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [a1[4] copy];
    unsigned __int8 v4 = (void *)WeakRetained[16];
    WeakRetained[16] = v3;

    sub_100051E90((uint64_t)WeakRetained, a1[5], 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoom.mm";
      __int16 v8 = 1026;
      int v9 = 317;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoom actionCircuit:step:jsonDict:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100053540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100053604(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_100051E90((uint64_t)WeakRetained, @"engineRunnerStartedBecauseOfTrigger", 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdDoom.mm";
      __int16 v6 = 1026;
      int v7 = 331;
      __int16 v8 = 2082;
      int v9 = "-[NavdDoom engineRunner:startedBecauseOfTrigger:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_100053718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000537DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    sub_100051E90((uint64_t)WeakRetained, @"engineRunnerReceivedEntries", 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      id v5 = "NavdDoom.mm";
      __int16 v6 = 1026;
      int v7 = 342;
      __int16 v8 = 2082;
      int v9 = "-[NavdDoom engineRunner:receivedEntries:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

void sub_1000538F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000539FC(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [a1[4] copy];
    int v4 = (void *)WeakRetained[15];
    WeakRetained[15] = v3;

    sub_100051E90((uint64_t)WeakRetained, a1[5], 0);
  }
  else
  {
    GEOFindOrCreateLog();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      int v7 = "NavdDoom.mm";
      __int16 v8 = 1026;
      int v9 = 354;
      __int16 v10 = 2082;
      __int16 v11 = "-[NavdDoom engineRunner:step:jsonDict:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_100053B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100053B40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 copy];
  [*(id *)(a1 + 136) setMostRecentExitTime:v4];

  id v5 = *(void **)(a1 + 88);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056728;
  v6[3] = &unk_10008C660;
  void v6[4] = a1;
  [v5 callBlock:v6];
}

void sub_100053BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100053C08(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 136) completeWindowBecause:a2];
  id v3 = *(void **)(a1 + 88);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100056818;
  v5[3] = &unk_10008C660;
  void v5[4] = a1;
  [v3 callBlock:v5];
  return [*(id *)(a1 + 136) clear];
}

void sub_100053C9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 copy];
  [*(id *)(a1 + 136) setMostRecentDoomWindow:v4];

  id v5 = *(void **)(a1 + 88);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056908;
  v6[3] = &unk_10008C660;
  void v6[4] = a1;
  [v5 callBlock:v6];
}

void sub_100053D44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100053D64(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_4;
  }
  id v3 = [v1 endDate];
  BOOL v4 = MapsSuggestionsIsInTheFuture(v3);

  if (!v4) {
    goto LABEL_4;
  }
  id v5 = MapsSuggestionsNow();
  unsigned int v6 = [v2 containsDate:v5];

  if (!v6)
  {
    __int16 v10 = [v2 startDate];
    GEOConfigGetDouble();
    __int16 v8 = [v10 dateByAddingTimeInterval:-v11];
  }
  else
  {
LABEL_4:
    GEOConfigGetDouble();
    __int16 v8 = MapsSuggestionsNowWithOffset(v7);
  }

  return v8;
}

void sub_100053E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100053E78(uint64_t a1, void *a2)
{
  id v3 = a2;
  GEOFindOrCreateLog();
  BOOL v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = MapsSuggestionsStringFromDate(v3);
    *(_DWORD *)double v18 = 138412290;
    *(void *)&v18[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_scheduleRunAt:%@", v18, 0xCu);
  }
  GEOConfigGetDouble();
  double v7 = MapsSuggestionsNowWithOffset(v6);
  id v8 = [v3 laterDate:v7];
  int v9 = v8;
  if (!v8)
  {
    __int16 v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)double v18 = 136446978;
      *(void *)&v18[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      *(_WORD *)&v18[12] = 1024;
      *(_DWORD *)&v18[14] = 615;
      *(_WORD *)&v18[18] = 2082;
      *(void *)&v18[20] = "-[NavdDoom sleepUntilTime:]";
      *(_WORD *)&v18[28] = 2082;
      *(void *)&v18[30] = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. No date received", v18, 0x26u);
    }
    goto LABEL_10;
  }
  if (MapsSuggestionsIsInThePast(v8))
  {
    GEOFindOrCreateLog();
    __int16 v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = MapsSuggestionsStringFromDate(v9);
      *(_DWORD *)double v18 = 138412290;
      *(void *)&v18[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Schedule time is in the past, ignoring: %@", v18, 0xCu);
    }
LABEL_10:

    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v18 = 138412290;
      *(void *)&v18[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not set scheduled wakeup to %@", v18, 0xCu);
    }

    goto LABEL_16;
  }
  GEOConfigGetDouble();
  [*(id *)(a1 + 48) scheduleWithTimeInterval:MapsSuggestionsSecondsTo(v9) leeway:v13];
  GEOFindOrCreateLog();
  __int16 v14 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v15 = MapsSuggestionsStringFromDate(v9);
    *(_DWORD *)double v18 = 138412290;
    *(void *)&v18[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Scheduled refresh activity block for %@", v18, 0xCu);
  }
  id v16 = v3;
  [*(id *)(a1 + 136) setNextWakeup:v16];
  id v17 = *(void **)(a1 + 88);
  *(void *)double v18 = _NSConcreteStackBlock;
  *(void *)&v18[8] = 3221225472;
  *(void *)&v18[16] = sub_100057D80;
  *(void *)&v18[24] = &unk_10008C660;
  *(void *)&v18[32] = a1;
  [v17 callBlock:v18];

LABEL_16:
}

void sub_10005424C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000542D8(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    BOOL v4 = a1[9];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100056AE8;
    v5[3] = &unk_100089810;
    objc_copyWeak(&v8, &location);
    id v6 = v3;
    double v7 = a1;
    dispatch_async(v4, v5);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void sub_1000543B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 copy];
  [*(id *)(a1 + 136) setMostRecentRoutesPerDestination:v7];

  [*(id *)(a1 + 136) updateWithIncidents:v6];
  id v8 = *(void **)(a1 + 88);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100057C90;
  v9[3] = &unk_10008C660;
  void v9[4] = a1;
  [v8 callBlock:v9];
}

void sub_100054478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005449C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 136) nextWakeup];
  BOOL v3 = MapsSuggestionsIsInTheFuture(v2);

  if (!v3)
  {
    GEOConfigGetDouble();
    id v5 = MapsSuggestionsNowWithOffset(v4);
    sub_100053E78(a1, v5);
  }
  id v6 = *(void **)(a1 + 88);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057E70;
  void v8[3] = &unk_10008C660;
  void v8[4] = a1;
  return [v6 callBlock:v8];
}

void sub_10005456C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100054588(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  double v13 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v14 = WeakRetained[9];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000547C4;
    block[3] = &unk_10008C5C0;
    objc_copyWeak(&v24, (id *)(a1 + 48));
    char v25 = a2;
    id v19 = v11;
    id v20 = v10;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v21 = v15;
    uint64_t v22 = v16;
    id v23 = v9;
    dispatch_async(v14, block);

    objc_destroyWeak(&v24);
  }
  else
  {
    GEOFindOrCreateLog();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      __int16 v27 = "NavdDoom.mm";
      __int16 v28 = 1026;
      int v29 = 506;
      __int16 v30 = 2082;
      id v31 = "-[NavdDoom updateRoutesForDestinations:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000547A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000547C4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    if (!*(unsigned char *)(a1 + 80) || *(void *)(a1 + 32))
    {
      double v4 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v5 = *(char **)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        id v48 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error while getting Routes: %@", buf, 0xCu);
      }

      sub_1000543B0(v3, 0, 0);
      sub_10005449C(v3);
      GEOFindOrCreateLog();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [(id)v3 uniqueName];
        *(_DWORD *)long long buf = 138412546;
        id v48 = v7;
        __int16 v49 = 2080;
        v50[0] = "STEP 3: Updating Routes";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
      }
LABEL_41:

      goto LABEL_14;
    }
    if (([WeakRetained[12] evaluateError:0] & 1) == 0)
    {
      id v33 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v34 = *(char **)(a1 + 32);
        *(_DWORD *)long long buf = 138412290;
        id v48 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Guard didn't like error: %@", buf, 0xCu);
      }

      sub_1000543B0(v3, 0, *(void **)(a1 + 40));
      sub_10005449C(v3);
      GEOFindOrCreateLog();
      uint64_t v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        unsigned __int8 v36 = [(id)v3 uniqueName];
        *(_DWORD *)long long buf = 138412546;
        id v48 = v36;
        __int16 v49 = 2080;
        v50[0] = "STEP 3: Updating Routes";
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
      }
      goto LABEL_41;
    }
    if (GEOConfigGetBOOL())
    {
      uint64_t v46 = *(void **)(v3 + 104);
      id v10 = objc_alloc_init((Class)GEOWaypointRoute);
      id v11 = objc_alloc_init((Class)GEOOutOfMapsAlertsInfo);
      [v10 setOutOfMapsAlertsInfo:v11];

      id v12 = objc_alloc_init((Class)GEOAlertNonRecommendedRouteText);
      double v13 = [v10 outOfMapsAlertsInfo];
      [v13 setAlertNonRecommendedRouteText:v12];

      id v14 = objc_alloc_init((Class)GEOPlaceFormattedString);
      id v15 = [v10 outOfMapsAlertsInfo];
      uint64_t v16 = [v15 alertNonRecommendedRouteText];
      [v16 setBody:v14];

      id v17 = objc_alloc_init((Class)GEOPlaceFormattedString);
      double v18 = [v10 outOfMapsAlertsInfo];
      id v19 = [v18 alertNonRecommendedRouteText];
      [v19 setTitle:v17];

      id v20 = objc_alloc_init((Class)GEOFormattedString);
      [v20 addFormatString:@"Take I-480 S home"];
      id v21 = objc_alloc_init((Class)GEOFormattedString);
      [v21 addFormatString:@"Road closure on I-780 W."];
      uint64_t v22 = [v10 outOfMapsAlertsInfo];
      id v23 = [v22 alertNonRecommendedRouteText];
      id v24 = [v23 body];
      [v24 setCustom:v21];

      char v25 = [v10 outOfMapsAlertsInfo];
      uint64_t v26 = [v25 alertNonRecommendedRouteText];
      __int16 v27 = [v26 title];
      [v27 setCustom:v20];

      __int16 v28 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        id v48 = @"Take I-480 S home";
        __int16 v49 = 2112;
        v50[0] = @"Road closure on I-780 W.";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "About to fire a test notification with \ntitle:%@\nsubtitle:%@", buf, 0x16u);
      }

      int v29 = [*(id *)(a1 + 48) firstObject];
      [v46 alertBrokenRouteWithRecommendedAlternate:v10 forDestination:v29];

      sub_1000543B0(v3, 0, 0);
      sub_10005449C(v3);
      __int16 v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Fired the test notification", buf, 2u);
      }

      GEOFindOrCreateLog();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [*(id *)(a1 + 56) uniqueName];
        *(_DWORD *)long long buf = 138412546;
        id v48 = v32;
        __int16 v49 = 2080;
        v50[0] = "STEP 3: Updating Routes";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
      }
      goto LABEL_41;
    }
    if (![*(id *)(a1 + 64) count])
    {
      id v43 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Received empty routes per destination, this is good!", buf, 2u);
      }

      sub_1000543B0(v3, *(void **)(a1 + 64), *(void **)(a1 + 40));
      sub_10005449C(v3);
      GEOFindOrCreateLog();
      id v44 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        BOOL v45 = [(id)v3 uniqueName];
        *(_DWORD *)long long buf = 138412546;
        id v48 = v45;
        __int16 v49 = 2080;
        v50[0] = "STEP 3: Updating Routes";
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
      }
      goto LABEL_41;
    }
    sub_1000543B0(v3, *(void **)(a1 + 64), *(void **)(a1 + 40));
    uint64_t v37 = *(void **)(a1 + 64);
    uint64_t v38 = [*(id *)(a1 + 48) firstObject];
    id v39 = [v37 objectForKeyedSubscript:v38];

    id v40 = [v39 firstObject];
    objc_msgSend(*(id *)(v3 + 136), "setNumberOfAlertableRoutes:", (char *)objc_msgSend(*(id *)(v3 + 136), "numberOfAlertableRoutes") + 1);
    int v41 = *(void **)(v3 + 104);
    uint64_t v42 = [*(id *)(a1 + 48) firstObject];
    [v41 alertBrokenRouteWithRecommendedAlternate:v40 forDestination:v42];

    sub_10005449C(v3);
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      id v48 = "NavdDoom.mm";
      __int16 v49 = 1026;
      LODWORD(v50[0]) = 508;
      WORD2(v50[0]) = 2082;
      *(void *)((char *)v50 + 6) = "-[NavdDoom updateRoutesForDestinations:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
LABEL_14:
}

void sub_1000551A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055308(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = MapsSuggestionsDateFromString(*(void **)(a1 + 40));
      GEOFindOrCreateLog();
      double v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        MapsSuggestionsStringFromDate(v3);
        id v5 = (char *)objc_claimAutoreleasedReturnValue();
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "DEBUG MODE: Faking an ExitTime prediction to: %@.", (uint8_t *)&v14, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      GEOFindOrCreateLog();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [WeakRetained uniqueName];
        int v14 = 138412546;
        id v15 = v7;
        __int16 v16 = 2080;
        v17[0] = "_updateExitTimeWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v14, 0x16u);
      }
      id v8 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v8))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateExitTimeWithHandler", "", (uint8_t *)&v14, 2u);
      }
    }
    else
    {
      GEOFindOrCreateLog();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        id v15 = (char *)objc_msgSend(@"DEBUG MODE: Would have faked an ExitTime, but not without location.", "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = +[NSError GEOErrorWithCode:-13 reason:@"DEBUG MODE: Would have faked an ExitTime, but not without location."];
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);

      GEOFindOrCreateLog();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        double v13 = [WeakRetained uniqueName];
        int v14 = 138412546;
        id v15 = v13;
        __int16 v16 = 2080;
        v17[0] = "_updateExitTimeWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v3 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v3))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateExitTimeWithHandler", "", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446722;
      id v15 = "NavdDoom.mm";
      __int16 v16 = 1026;
      LODWORD(v17[0]) = 646;
      WORD2(v17[0]) = 2082;
      *(void *)((char *)v17 + 6) = "-[NavdDoom _q_updateExitTimeWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v14, 0x1Cu);
    }
  }
}

void sub_100055764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000557F4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained[8] oneRoutine];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = MapsSuggestionsNow();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100055A04;
    v9[3] = &unk_10008C510;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 40);
    [v5 predictedExitTimeFromLocation:v6 date:v7 handler:v9];

    objc_destroyWeak(&v11);
  }
  else
  {
    GEOFindOrCreateLog();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      double v13 = "NavdDoom.mm";
      __int16 v14 = 1026;
      int v15 = 668;
      __int16 v16 = 2082;
      id v17 = "-[NavdDoom _q_updateExitTimeWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000559C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055A04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[9];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055C08;
    block[3] = &unk_10008C638;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    id v12 = v6;
    id v15 = *(id *)(a1 + 32);
    double v13 = v8;
    id v14 = v5;
    dispatch_async(v9, block);

    objc_destroyWeak(&v16);
  }
  else
  {
    GEOFindOrCreateLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      double v18 = "NavdDoom.mm";
      __int16 v19 = 1026;
      int v20 = 673;
      __int16 v21 = 2082;
      uint64_t v22 = "-[NavdDoom _q_updateExitTimeWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_100055BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055C08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      uint64_t v3 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        double v4 = *(char **)(a1 + 32);
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error from CoreRoutine: %@", (uint8_t *)&v15, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      GEOFindOrCreateLog();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [*(id *)(a1 + 40) uniqueName];
        int v15 = 138412546;
        id v16 = v6;
        __int16 v17 = 2080;
        v18[0] = "_updateExitTimeWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", (uint8_t *)&v15, 0x16u);
      }
      id v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
LABEL_23:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateExitTimeWithHandler", "", (uint8_t *)&v15, 2u);
      }
    }
    else if (*(void *)(a1 + 48))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      GEOFindOrCreateLog();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [*(id *)(a1 + 40) uniqueName];
        int v15 = 138412546;
        id v16 = v9;
        __int16 v17 = 2080;
        v18[0] = "_updateExitTimeWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
      }
      id v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
        goto LABEL_23;
      }
    }
    else
    {
      GEOFindOrCreateLog();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315138;
        id v16 = (char *)[@"CoreRoutine doesn't know this place" UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v11 = *(void *)(a1 + 56);
      id v12 = +[NSError GEOErrorWithCode:-13 reason:@"CoreRoutine doesn't know this place"];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

      GEOFindOrCreateLog();
      double v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [*(id *)(a1 + 40) uniqueName];
        int v15 = 138412546;
        id v16 = v14;
        __int16 v17 = 2080;
        v18[0] = "_updateExitTimeWithHandler";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", (uint8_t *)&v15, 0x16u);
      }
      id v7 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
        goto LABEL_23;
      }
    }
  }
  else
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      id v16 = "NavdDoom.mm";
      __int16 v17 = 1026;
      LODWORD(v18[0]) = 675;
      WORD2(v18[0]) = 2082;
      *(void *)((char *)v18 + 6) = "-[NavdDoom _q_updateExitTimeWithHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf2 went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
    }
  }
}

void sub_10005610C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100056288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000563F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005652C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100056548(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000565E4;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_1000565E4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willStartUpdate];
  }
  return result;
}

void sub_100056638(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000566D4;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_1000566D4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willUpdateExitTime];
  }
  return result;
}

void sub_100056728(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000567C4;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_1000567C4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateExitTime];
  }
  return result;
}

void sub_100056818(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000568B4;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_1000568B4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didInvalidateWindow];
  }
  return result;
}

void sub_100056908(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000569A4;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_1000569A4(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateWindow];
  }
  return result;
}

void sub_1000569F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056A94;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100056A94(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willUpdateDestinations];
  }
  return result;
}

void sub_100056AE8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      *(void *)&uint8_t buf[4] = "NavdDoom.mm";
      *(_WORD *)&unsigned char buf[12] = 1026;
      *(_DWORD *)&buf[14] = 778;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdDoom _didUpdateDestinations:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
    id v6 = v7;
    goto LABEL_54;
  }
  id v3 = [*(id *)(a1 + 32) copy];
  [WeakRetained[17] setMostRecentDestinations:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 88);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100057AB0;
  v53[3] = &unk_10008C660;
  v53[4] = v4;
  [v5 callBlock:v53];
  if (NavdDoomCanRequestDirections())
  {
    id v6 = [WeakRetained internalStorage];
    id v7 = [v6 mostRecentDestinations];
    if (WeakRetained[12])
    {
      if (WeakRetained[14])
      {
        if (WeakRetained[13])
        {
          GEOFindOrCreateLog();
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            id v9 = [WeakRetained uniqueName];
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v9;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "STEP 3: Updating Routes";
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
          }
          id v10 = GEOFindOrCreateLog();
          if (os_signpost_enabled(v10))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
          }

          objc_msgSend(WeakRetained[17], "setNumberOfUpdatesToRoutes:", (char *)objc_msgSend(WeakRetained[17], "numberOfUpdatesToRoutes") + 1);
          id v11 = WeakRetained[11];
          *(void *)long long buf = _NSConcreteStackBlock;
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = sub_100057BA0;
          *(void *)&buf[24] = &unk_10008C660;
          *(void *)&unsigned char buf[32] = WeakRetained;
          [v11 callBlock:buf];
          id v12 = [WeakRetained internalStorage];
          double v13 = [v12 mostRecentDestinations];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            uint64_t v37 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Got no destinations to work with.", buf, 2u);
            }

            sub_1000543B0((uint64_t)WeakRetained, 0, 0);
            sub_10005449C((uint64_t)WeakRetained);
            GEOFindOrCreateLog();
            uint64_t v38 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              id v39 = [WeakRetained uniqueName];
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v39;
              *(_WORD *)&unsigned char buf[12] = 2080;
              *(void *)&buf[14] = "STEP 3: Updating Routes";
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
            }
            __int16 v21 = GEOFindOrCreateLog();
            if (!os_signpost_enabled(v21)) {
              goto LABEL_53;
            }
            *(_WORD *)long long buf = 0;
          }
          else
          {
            id v15 = [v7 copy];
            id v16 = [WeakRetained internalStorage];
            [v16 setMostRecentDestinations:v15];

            if ([v7 count])
            {
              __int16 v17 = [WeakRetained internalStorage];
              double v18 = [v17 mostRecentDoomWindow];
              __int16 v19 = MapsSuggestionsNow();
              unsigned __int8 v20 = [v18 containsDate:v19];

              if (v20)
              {
                __int16 v21 = MapsSuggestionsCurrentBestLocation();
                if (v21)
                {
                  objc_initWeak(&location, WeakRetained);
                  *(void *)long long buf = _NSConcreteStackBlock;
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&uint8_t buf[16] = sub_100054588;
                  *(void *)&buf[24] = &unk_10008C5E8;
                  objc_copyWeak(v61, &location);
                  *(void *)&unsigned char buf[32] = v7;
                  id v60 = WeakRetained;
                  uint64_t v22 = objc_retainBlock(buf);
                  [v21 coordinate];
                  double v24 = v23;
                  [v21 coordinate];
                  id v26 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithGEOCoordinate:", v24, v25);
                  id v27 = WeakRetained[17];
                  __int16 v28 = [v27 mostRecentDestinations];
                  objc_msgSend(v27, "setNumberOfDirectionRequests:", (char *)objc_msgSend(v28, "count") + (void)objc_msgSend(v27, "numberOfDirectionRequests"));

                  id v29 = WeakRetained[14];
                  __int16 v30 = [WeakRetained[17] mostRecentDestinations];
                  LOBYTE(v29) = [v29 updateRoutesForDestinations:v30 withOrigin:v26 completionHandler:v22];

                  [WeakRetained[12] didRequestRoute];
                  id v31 = [WeakRetained[12] nextAllowedRequestTime];
                  sub_100053E78((uint64_t)WeakRetained, v31);

                  if ((v29 & 1) == 0)
                  {
                    sub_1000543B0((uint64_t)WeakRetained, 0, 0);
                    sub_10005449C((uint64_t)WeakRetained);
                    GEOFindOrCreateLog();
                    uint64_t v32 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      id v33 = [WeakRetained uniqueName];
                      *(_DWORD *)unsigned int v55 = 138412546;
                      double v56 = v33;
                      __int16 v57 = 2080;
                      id v58 = "STEP 3: Updating Routes";
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", v55, 0x16u);
                    }
                    id v34 = GEOFindOrCreateLog();
                    if (os_signpost_enabled(v34))
                    {
                      *(_WORD *)unsigned int v55 = 0;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", v55, 2u);
                    }
                  }
                  objc_destroyWeak(v61);
                  objc_destroyWeak(&location);
                }
                else
                {
                  __int16 v49 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Cannot get Routes without Location", buf, 2u);
                  }

                  sub_1000543B0((uint64_t)WeakRetained, 0, 0);
                  sub_10005449C((uint64_t)WeakRetained);
                  GEOFindOrCreateLog();
                  BOOL v50 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v51 = [WeakRetained uniqueName];
                    *(_DWORD *)long long buf = 138412546;
                    *(void *)&uint8_t buf[4] = v51;
                    *(_WORD *)&unsigned char buf[12] = 2080;
                    *(void *)&buf[14] = "STEP 3: Updating Routes";
                    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
                  }
                  id v52 = GEOFindOrCreateLog();
                  if (os_signpost_enabled(v52))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
                  }

                  __int16 v21 = 0;
                }
                goto LABEL_53;
              }
              GEOFindOrCreateLog();
              id v43 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                MapsSuggestionsNow();
                id v44 = (id)objc_claimAutoreleasedReturnValue();
                BOOL v45 = [WeakRetained internalStorage];
                uint64_t v46 = [v45 mostRecentDoomWindow];
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = v44;
                *(_WORD *)&unsigned char buf[12] = 2112;
                *(void *)&buf[14] = v46;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "We are not currently in a window (%@ not in %@).", buf, 0x16u);
              }
              sub_1000543B0((uint64_t)WeakRetained, 0, 0);
              sub_10005449C((uint64_t)WeakRetained);
              GEOFindOrCreateLog();
              unsigned __int8 v47 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              {
                id v48 = [WeakRetained uniqueName];
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = v48;
                *(_WORD *)&unsigned char buf[12] = 2080;
                *(void *)&buf[14] = "STEP 3: Updating Routes";
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
              }
              __int16 v21 = GEOFindOrCreateLog();
              if (!os_signpost_enabled(v21)) {
                goto LABEL_53;
              }
              *(_WORD *)long long buf = 0;
            }
            else
            {
              id v40 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "There are currently no predicted destinations.", buf, 2u);
              }

              sub_1000543B0((uint64_t)WeakRetained, 0, 0);
              sub_10005449C((uint64_t)WeakRetained);
              GEOFindOrCreateLog();
              int v41 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v42 = [WeakRetained uniqueName];
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = v42;
                *(_WORD *)&unsigned char buf[12] = 2080;
                *(void *)&buf[14] = "STEP 3: Updating Routes";
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
              }
              __int16 v21 = GEOFindOrCreateLog();
              if (!os_signpost_enabled(v21)) {
                goto LABEL_53;
              }
              *(_WORD *)long long buf = 0;
            }
          }
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "STEP 3: Updating Routes", "", buf, 2u);
LABEL_53:

LABEL_54:
          goto LABEL_55;
        }
        __int16 v21 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          goto LABEL_53;
        }
        *(_DWORD *)long long buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 456;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "-[NavdDoom updateRoutesForDestinations:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (_alerter)";
        unsigned __int8 v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an alerter to be set";
      }
      else
      {
        __int16 v21 = GEOFindOrCreateLog();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          goto LABEL_53;
        }
        *(_DWORD *)long long buf = 136446978;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = 455;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "-[NavdDoom updateRoutesForDestinations:]";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == (_routesUpdater)";
        unsigned __int8 v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a routes updater to be set";
      }
    }
    else
    {
      __int16 v21 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_53;
      }
      *(_DWORD *)long long buf = 136446978;
      *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoom.mm";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 454;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[NavdDoom updateRoutesForDestinations:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (_guard)";
      unsigned __int8 v36 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a guard to be set.";
    }
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v36, buf, 0x26u);
    goto LABEL_53;
  }
  uint64_t v35 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "We are not allowed to get DirectionRequests, so no STEP 3.", buf, 2u);
  }

  sub_1000543B0((uint64_t)WeakRetained, 0, 0);
  sub_10005449C((uint64_t)WeakRetained);
LABEL_55:
}

void sub_1000578D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a16);

  _Unwind_Resume(a1);
}

void sub_100057AB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057B4C;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100057B4C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateDestinations];
  }
  return result;
}

void sub_100057BA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057C3C;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100057C3C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 willUpdateRoutes];
  }
  return result;
}

void sub_100057C90(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057D2C;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100057D2C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didUpdateRoutes];
  }
  return result;
}

void sub_100057D80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057E1C;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100057E1C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didScheduleWakeup];
  }
  return result;
}

void sub_100057E70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057F0C;
  block[3] = &unk_1000892D8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100057F0C(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)[v3 didEndUpdate];
  }
  return result;
}

void sub_100057F60(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 72);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100058030;
  void v7[3] = &unk_10008C260;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_100058030(void *a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = (void *)a1[4];
    v6[0] = @"engineRunnnerAndActionCircuitState";
    id v3 = MSg::jsonFor();
    v6[1] = @"internalStorage";
    v7[0] = v3;
    uint64_t v4 = MSg::jsonFor();
    v7[1] = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
    [v2 logCurrentState:v5 stepName:a1[6] stopReason:a1[7]];
  }
}

void sub_10005812C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000582E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000584F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000585B4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  objc_sync_exit(v2);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = v3;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      id v5 = (char *)[v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_1000586DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005879C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_1000587B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v6 = v3;
    if (objc_opt_respondsToSelector())
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [v6 routesUpdater:WeakRetained didRequestRouteWithError:0];
    }
  }

  return _objc_release_x2();
}

void sub_100058F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location,char a43)
{
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100058FC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100058FD4(uint64_t a1)
{
}

void sub_100058FDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (v6)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v49 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Request to resolve waypoint from entry failed: %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v9 = v6;
    long long v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
LABEL_5:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    goto LABEL_7;
  }
  if (!v5)
  {
    unsigned __int8 v36 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Request to resolve waypoint from entry failed (no waypoint)", buf, 2u);
    }

    uint64_t v37 = +[NSError GEOErrorWithCode:-10 reason:@"Missing destination waypoint"];
    uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v10 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;
    goto LABEL_5;
  }
LABEL_7:
  [*(id *)(a1 + 32) coordinate];
  [*(id *)(a1 + 32) coordinate];
  long long v11 = [v5 latLng];
  [v11 lat];
  id v12 = [v5 latLng];
  [v12 lng];
  GEOCalculateDistanceHighPrecision();
  double v14 = v13;

  GEOConfigGetDouble();
  if (v14 < v15)
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      GEOConfigGetDouble();
      *(_DWORD *)long long buf = 134217984;
      __int16 v49 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Distance between origin and destination is less than %f meters!", buf, 0xCu);
    }

    uint64_t v18 = +[NSError GEOErrorWithCode:-10 reason:@"Invalid origin/destination passed"];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    unsigned __int8 v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  BOOL v21 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  double v23 = GEOFindOrCreateLog();
  double v24 = v23;
  if (v21)
  {
    if (WeakRetained)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v33 = [WeakRetained uniqueName];
        *(_DWORD *)long long buf = 138412546;
        __int16 v49 = v33;
        __int16 v50 = 2080;
        v51[0] = "updateRoutes";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
      }
      id v34 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v34))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateRoutes", "", buf, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
    else
    {
      id v39 = v23;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136446722;
        __int16 v49 = "NavdDoomGEORoutesUpdater.m";
        __int16 v50 = 1026;
        LODWORD(v51[0]) = 156;
        WORD2(v51[0]) = 2082;
        *(void *)((char *)v51 + 6) = "-[NavdDoomGEORoutesUpdater updateRoutesForDestinations:withOrigin:completionHandl"
                                       "er:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
      }
    }
  }
  else if (WeakRetained)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      double v25 = [WeakRetained uniqueName];
      *(_DWORD *)long long buf = 138412546;
      __int16 v49 = v25;
      __int16 v50 = 2080;
      v51[0] = "updateRoutes: actual Route request";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v26 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateRoutes: actual Route request", "", buf, 2u);
    }

    id v27 = *(void **)(*(void *)(a1 + 48) + 8);
    uint64_t v28 = *(void *)(a1 + 32);
    id v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472;
    uint64_t v42 = sub_10005971C;
    uint64_t v43 = &unk_10008C6D8;
    objc_copyWeak(&v47, (id *)(a1 + 80));
    long long v46 = *(_OWORD *)(a1 + 64);
    id v44 = *(id *)(a1 + 40);
    long long v45 = *(_OWORD *)(a1 + 48);
    if (([v27 requestRouteFrom:v28 to:v5 completionHandler:&v40] & 1) == 0)
    {
      id v29 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Request for route failed", buf, 2u);
      }

      uint64_t v30 = +[NSError GEOErrorWithCode:-13, @"Route request failed", v40, v41, v42, v43 reason];
      uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }

    objc_destroyWeak(&v47);
  }
  else
  {
    uint64_t v35 = v23;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136446722;
      __int16 v49 = "NavdDoomGEORoutesUpdater.m";
      __int16 v50 = 1026;
      LODWORD(v51[0]) = 163;
      WORD2(v51[0]) = 2082;
      *(void *)((char *)v51 + 6) = "-[NavdDoomGEORoutesUpdater updateRoutesForDestinations:withOrigin:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void sub_1000596F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10005971C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = a3;
  id v9 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  long long v11 = GEOFindOrCreateLog();
  id v12 = v11;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      double v13 = [WeakRetained uniqueName];
      *(_DWORD *)long long buf = 138412546;
      id v39 = v13;
      __int16 v40 = 2080;
      *(void *)uint64_t v41 = "updateRoutes: actual Route request";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);
    }
    double v14 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateRoutes: actual Route request", "", buf, 2u);
    }

    if (v8)
    {
      double v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Request to get route failed: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if (![v7 routesCount])
      {
        id v29 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Request to get route returned no routes", buf, 2u);
        }
        goto LABEL_33;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        id v32 = v9;
        [*(id *)(a1 + 40) notifyObserversOfRouteRequest];
        id v16 = objc_alloc_init((Class)NSMutableArray);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        __int16 v17 = [v7 waypointRoutes];
        id v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v34;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([v22 type] != 4) {
                [v16 addObject:v22];
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v19);
        }

        if ([v16 count])
        {
          id v23 = [v16 copy];
          [WeakRetained[7] setObject:v23 forKeyedSubscript:*(void *)(a1 + 48)];

          id v24 = WeakRetained[8];
          double v25 = [WeakRetained _incidentsFromDirectionsResponse:v7 destination:*(void *)(a1 + 48)];
          [v24 unionSet:v25];
        }
        else
        {
          uint64_t v30 = +[NSError GEOErrorWithCode:-8 reason:@"No recommended routes found"];
          uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
          double v25 = *(void **)(v31 + 40);
          *(void *)(v31 + 40) = v30;
        }
        id v9 = v32;

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        goto LABEL_36;
      }
    }
    id v27 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = [WeakRetained uniqueName];
      *(_DWORD *)long long buf = 138412546;
      id v39 = v28;
      __int16 v40 = 2080;
      *(void *)uint64_t v41 = "updateRoutes";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    id v29 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateRoutes", "", buf, 2u);
    }
LABEL_33:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_36;
  }
  id v26 = v11;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136446722;
    id v39 = "NavdDoomGEORoutesUpdater.m";
    __int16 v40 = 1026;
    *(_DWORD *)uint64_t v41 = 167;
    *(_WORD *)&void v41[4] = 2082;
    *(void *)&v41[6] = "-[NavdDoomGEORoutesUpdater updateRoutesForDestinations:withOrigin:completionHandler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", buf, 0x1Cu);
  }

LABEL_36:
}

void sub_100059C90(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v6 = [WeakRetained[7] copy];
      id v7 = [v3[8] copy];
      (*(void (**)(uint64_t, uint64_t, id, id, void))(v4 + 16))(v4, v5, v6, v7, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    }
    id v8 = v3[7];
    v3[7] = 0;
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446722;
      long long v11 = "NavdDoomGEORoutesUpdater.m";
      __int16 v12 = 1026;
      int v13 = 229;
      __int16 v14 = 2082;
      double v15 = "-[NavdDoomGEORoutesUpdater updateRoutesForDestinations:withOrigin:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CLLocationFromGEOLocationCoordinate2D()
{
  return _CLLocationFromGEOLocationCoordinate2D();
}

uint64_t GEOCalculateDistance()
{
  return _GEOCalculateDistance();
}

uint64_t GEOCalculateDistanceHighPrecision()
{
  return _GEOCalculateDistanceHighPrecision();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

uint64_t GEOConfigGetDouble()
{
  return _GEOConfigGetDouble();
}

uint64_t GEOConfigGetInteger()
{
  return _GEOConfigGetInteger();
}

uint64_t GEOConfigGetPropertiesForKey()
{
  return _GEOConfigGetPropertiesForKey();
}

uint64_t GEOConfigGetString()
{
  return _GEOConfigGetString();
}

uint64_t GEOErrorDomain()
{
  return _GEOErrorDomain();
}

uint64_t GEOFindOrCreateLog()
{
  return _GEOFindOrCreateLog();
}

uint64_t GEOGetUserTransportTypePreference()
{
  return _GEOGetUserTransportTypePreference();
}

uint64_t GEOLocationCoordinate2DFromCLLocationCoordinate2D()
{
  return _GEOLocationCoordinate2DFromCLLocationCoordinate2D();
}

uint64_t GEOMapItemIsEqualToMapItemForPurposeWithinDistance()
{
  return _GEOMapItemIsEqualToMapItemForPurposeWithinDistance();
}

uint64_t GEOMapRectMakeWithRadialDistance()
{
  return _GEOMapRectMakeWithRadialDistance();
}

uint64_t MNGetProcessHandlingLog()
{
  return _MNGetProcessHandlingLog();
}

uint64_t MapsSuggestionsAlmostSameLocation()
{
  return _MapsSuggestionsAlmostSameLocation();
}

uint64_t MapsSuggestionsCurrentBestLocation()
{
  return _MapsSuggestionsCurrentBestLocation();
}

uint64_t MapsSuggestionsIsValidVisit()
{
  return _MapsSuggestionsIsValidVisit();
}

uint64_t MapsSuggestionsLocalizedMessageForAirportArrivalNotification()
{
  return _MapsSuggestionsLocalizedMessageForAirportArrivalNotification();
}

uint64_t MapsSuggestionsLocalizedSubtitleForVenueWelcomeNotification()
{
  return _MapsSuggestionsLocalizedSubtitleForVenueWelcomeNotification();
}

uint64_t MapsSuggestionsLocalizedTitleFormatForAirportArrivalNotification()
{
  return _MapsSuggestionsLocalizedTitleFormatForAirportArrivalNotification();
}

uint64_t MapsSuggestionsLocalizedTitleFormatForVenueWelcomeNotification()
{
  return _MapsSuggestionsLocalizedTitleFormatForVenueWelcomeNotification();
}

uint64_t MapsSuggestionsLocationForEntry()
{
  return _MapsSuggestionsLocationForEntry();
}

uint64_t MapsSuggestionsLocationForMapItem()
{
  return _MapsSuggestionsLocationForMapItem();
}

uint64_t MapsSuggestionsMapItemConvertIfNeeded()
{
  return _MapsSuggestionsMapItemConvertIfNeeded();
}

uint64_t MapsSuggestionsMapItemIsAirport()
{
  return _MapsSuggestionsMapItemIsAirport();
}

uint64_t MapsSuggestionsMapItemIsGate()
{
  return _MapsSuggestionsMapItemIsGate();
}

uint64_t MapsSuggestionsMapItemIsTerminal()
{
  return _MapsSuggestionsMapItemIsTerminal();
}

uint64_t MapsSuggestionsMapItemIsVenue()
{
  return _MapsSuggestionsMapItemIsVenue();
}

uint64_t MapsSuggestionsMostRecentLocation()
{
  return _MapsSuggestionsMostRecentLocation();
}

uint64_t MapsSuggestionsNonNilString()
{
  return _MapsSuggestionsNonNilString();
}

uint64_t MapsSuggestionsSearchAirport()
{
  return _MapsSuggestionsSearchAirport();
}

uint64_t MapsSuggestionsSearchTerminal()
{
  return _MapsSuggestionsSearchTerminal();
}

uint64_t MapsSuggestionsSetMostRecentLocation()
{
  return _MapsSuggestionsSetMostRecentLocation();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromMapsSuggestionsEntries()
{
  return _NSStringFromMapsSuggestionsEntries();
}

uint64_t NSStringFromMapsSuggestionsEntryType()
{
  return _NSStringFromMapsSuggestionsEntryType();
}

uint64_t NSStringFromMapsSuggestionsJSON()
{
  return _NSStringFromMapsSuggestionsJSON();
}

uint64_t NSStringFromMapsSuggestionsShortETA()
{
  return _NSStringFromMapsSuggestionsShortETA();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return _PLShouldLogRegisteredEvent();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return __CFPreferencesCopyAppValueWithContainer();
}

uint64_t _CFPreferencesGetAppBooleanValueWithContainer()
{
  return __CFPreferencesGetAppBooleanValueWithContainer();
}

uint64_t _GEOConfigHasValue()
{
  return __GEOConfigHasValue();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MapsSuggestionsIsTrue()
{
  return MapsSuggestionsIsTrue();
}

uint64_t MSg::jsonFor(MSg *this, CLLocation *a2)
{
  return MSg::jsonFor(this, a2);
}

uint64_t MSg::jsonFor()
{
  return MSg::jsonFor();
}

{
  return MSg::jsonFor();
}

{
  return MSg::jsonFor();
}

{
  return MSg::jsonFor();
}

uint64_t MSg::jsonFor(MSg *this, NSDateInterval *a2)
{
  return MSg::jsonFor(this, a2);
}

uint64_t MSg::jsonFor(MSg *this, NSDate *a2)
{
  return MSg::jsonFor(this, a2);
}

uint64_t MSg::jsonFor(MSg *this, BOOL a2)
{
  return MSg::jsonFor(this, a2);
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

long double exp(long double __x)
{
  return _exp(__x);
}

void free(void *a1)
{
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_copy_description()
{
  return _os_transaction_copy_description();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

uint64_t startEventKitStreamer()
{
  return _startEventKitStreamer();
}

uint64_t startHostingVirtualGarageServiceWithPersister()
{
  return _startHostingVirtualGarageServiceWithPersister();
}

uint64_t startWalletStreamer()
{
  return _startWalletStreamer();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__browseCategories(void *a1, const char *a2, ...)
{
  return [a1 _browseCategories];
}

id objc_msgSend__calculateNextAvailableTime(void *a1, const char *a2, ...)
{
  return [a1 _calculateNextAvailableTime];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__clearLeachedLocations(void *a1, const char *a2, ...)
{
  return [a1 _clearLeachedLocations];
}

id objc_msgSend__clearLoadedValues(void *a1, const char *a2, ...)
{
  return [a1 _clearLoadedValues];
}

id objc_msgSend__clearNavTracesDirectory(void *a1, const char *a2, ...)
{
  return [a1 _clearNavTracesDirectory];
}

id objc_msgSend__debugPrintOverviewOfConnections(void *a1, const char *a2, ...)
{
  return [a1 _debugPrintOverviewOfConnections];
}

id objc_msgSend__didEndUpdate(void *a1, const char *a2, ...)
{
  return [a1 _didEndUpdate];
}

id objc_msgSend__disconnectFromVehicle(void *a1, const char *a2, ...)
{
  return [a1 _disconnectFromVehicle];
}

id objc_msgSend__done(void *a1, const char *a2, ...)
{
  return [a1 _done];
}

id objc_msgSend__dummyVehicles(void *a1, const char *a2, ...)
{
  return [a1 _dummyVehicles];
}

id objc_msgSend__flushToPowerLog(void *a1, const char *a2, ...)
{
  return [a1 _flushToPowerLog];
}

id objc_msgSend__getLastLocationSafely(void *a1, const char *a2, ...)
{
  return [a1 _getLastLocationSafely];
}

id objc_msgSend__hasMapsCoarseLocationEnabled(void *a1, const char *a2, ...)
{
  return [a1 _hasMapsCoarseLocationEnabled];
}

id objc_msgSend__isCurrentStateEqualLastPostedState(void *a1, const char *a2, ...)
{
  return [a1 _isCurrentStateEqualLastPostedState];
}

id objc_msgSend__isFinishedResolvingWaypoints(void *a1, const char *a2, ...)
{
  return [a1 _isFinishedResolvingWaypoints];
}

id objc_msgSend__loadFromBackingStore(void *a1, const char *a2, ...)
{
  return [a1 _loadFromBackingStore];
}

id objc_msgSend__loadFromCache(void *a1, const char *a2, ...)
{
  return [a1 _loadFromCache];
}

id objc_msgSend__migrate(void *a1, const char *a2, ...)
{
  return [a1 _migrate];
}

id objc_msgSend__muid(void *a1, const char *a2, ...)
{
  return [a1 _muid];
}

id objc_msgSend__notifyObserversAboutPrecision(void *a1, const char *a2, ...)
{
  return [a1 _notifyObserversAboutPrecision];
}

id objc_msgSend__postNotificationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _postNotificationIfNeeded];
}

id objc_msgSend__pruneLeachedLocations(void *a1, const char *a2, ...)
{
  return [a1 _pruneLeachedLocations];
}

id objc_msgSend__refreshEntries(void *a1, const char *a2, ...)
{
  return [a1 _refreshEntries];
}

id objc_msgSend__reset(void *a1, const char *a2, ...)
{
  return [a1 _reset];
}

id objc_msgSend__resetValues(void *a1, const char *a2, ...)
{
  return [a1 _resetValues];
}

id objc_msgSend__routeAttributes(void *a1, const char *a2, ...)
{
  return [a1 _routeAttributes];
}

id objc_msgSend__saveEntry(void *a1, const char *a2, ...)
{
  return [a1 _saveEntry];
}

id objc_msgSend__startListenForDebugTestNotifications(void *a1, const char *a2, ...)
{
  return [a1 _startListenForDebugTestNotifications];
}

id objc_msgSend__startListeningToMemoryPressureEvents(void *a1, const char *a2, ...)
{
  return [a1 _startListeningToMemoryPressureEvents];
}

id objc_msgSend__startMapsSuggestionsControllerIfUnlocked(void *a1, const char *a2, ...)
{
  return [a1 _startMapsSuggestionsControllerIfUnlocked];
}

id objc_msgSend__stopListenForDebugTestNotifications(void *a1, const char *a2, ...)
{
  return [a1 _stopListenForDebugTestNotifications];
}

id objc_msgSend__stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoring];
}

id objc_msgSend__stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringSignificantLocationChanges];
}

id objc_msgSend__storage(void *a1, const char *a2, ...)
{
  return [a1 _storage];
}

id objc_msgSend__traits(void *a1, const char *a2, ...)
{
  return [a1 _traits];
}

id objc_msgSend__turnOffCoreRoutineMonitoringOn3DTouchDevices(void *a1, const char *a2, ...)
{
  return [a1 _turnOffCoreRoutineMonitoringOn3DTouchDevices];
}

id objc_msgSend__updateExitTime(void *a1, const char *a2, ...)
{
  return [a1 _updateExitTime];
}

id objc_msgSend__venueInfo(void *a1, const char *a2, ...)
{
  return [a1 _venueInfo];
}

id objc_msgSend__willUpdateDestinations(void *a1, const char *a2, ...)
{
  return [a1 _willUpdateDestinations];
}

id objc_msgSend__willUpdateExitTime(void *a1, const char *a2, ...)
{
  return [a1 _willUpdateExitTime];
}

id objc_msgSend__willUpdateRoutes(void *a1, const char *a2, ...)
{
  return [a1 _willUpdateRoutes];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessory(void *a1, const char *a2, ...)
{
  return [a1 accessory];
}

id objc_msgSend_accuracyAuthorization(void *a1, const char *a2, ...)
{
  return [a1 accuracyAuthorization];
}

id objc_msgSend_activatable(void *a1, const char *a2, ...)
{
  return [a1 activatable];
}

id objc_msgSend_alertNonRecommendedRouteText(void *a1, const char *a2, ...)
{
  return [a1 alertNonRecommendedRouteText];
}

id objc_msgSend_alertSetting(void *a1, const char *a2, ...)
{
  return [a1 alertSetting];
}

id objc_msgSend_alerter(void *a1, const char *a2, ...)
{
  return [a1 alerter];
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

id objc_msgSend_analyticsReporter(void *a1, const char *a2, ...)
{
  return [a1 analyticsReporter];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_archiveDestination(void *a1, const char *a2, ...)
{
  return [a1 archiveDestination];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrivalDate(void *a1, const char *a2, ...)
{
  return [a1 arrivalDate];
}

id objc_msgSend_arrivingAirportCode(void *a1, const char *a2, ...)
{
  return [a1 arrivingAirportCode];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_automobileOptions(void *a1, const char *a2, ...)
{
  return [a1 automobileOptions];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_avoidHighways(void *a1, const char *a2, ...)
{
  return [a1 avoidHighways];
}

id objc_msgSend_avoidTolls(void *a1, const char *a2, ...)
{
  return [a1 avoidTolls];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_cachePath(void *a1, const char *a2, ...)
{
  return [a1 cachePath];
}

id objc_msgSend_cachedIncidents(void *a1, const char *a2, ...)
{
  return [a1 cachedIncidents];
}

id objc_msgSend_canBePersistedToDisk(void *a1, const char *a2, ...)
{
  return [a1 canBePersistedToDisk];
}

id objc_msgSend_canRequestRoute(void *a1, const char *a2, ...)
{
  return [a1 canRequestRoute];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return [a1 capitalizedString];
}

id objc_msgSend_carConnectCondition(void *a1, const char *a2, ...)
{
  return [a1 carConnectCondition];
}

id objc_msgSend_carConnectTrigger(void *a1, const char *a2, ...)
{
  return [a1 carConnectTrigger];
}

id objc_msgSend_carDisconnectCondition(void *a1, const char *a2, ...)
{
  return [a1 carDisconnectCondition];
}

id objc_msgSend_carDisconnectTrigger(void *a1, const char *a2, ...)
{
  return [a1 carDisconnectTrigger];
}

id objc_msgSend_centerLat(void *a1, const char *a2, ...)
{
  return [a1 centerLat];
}

id objc_msgSend_centerLng(void *a1, const char *a2, ...)
{
  return [a1 centerLng];
}

id objc_msgSend_checkDebugEntitlement(void *a1, const char *a2, ...)
{
  return [a1 checkDebugEntitlement];
}

id objc_msgSend_checkRegularEntitlement(void *a1, const char *a2, ...)
{
  return [a1 checkRegularEntitlement];
}

id objc_msgSend_cleanupAirportArrival(void *a1, const char *a2, ...)
{
  return [a1 cleanupAirportArrival];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_clearAirportArrivalBulletin(void *a1, const char *a2, ...)
{
  return [a1 clearAirportArrivalBulletin];
}

id objc_msgSend_clearMapsSuggestionsBulletin(void *a1, const char *a2, ...)
{
  return [a1 clearMapsSuggestionsBulletin];
}

id objc_msgSend_clearVenueBulletin(void *a1, const char *a2, ...)
{
  return [a1 clearVenueBulletin];
}

id objc_msgSend_clientInfoStates(void *a1, const char *a2, ...)
{
  return [a1 clientInfoStates];
}

id objc_msgSend_clientLocation(void *a1, const char *a2, ...)
{
  return [a1 clientLocation];
}

id objc_msgSend_coarseModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 coarseModeEnabled];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorHex(void *a1, const char *a2, ...)
{
  return [a1 colorHex];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return [a1 connectionID];
}

id objc_msgSend_conservativeDepartureDate(void *a1, const char *a2, ...)
{
  return [a1 conservativeDepartureDate];
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return [a1 contacts];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return [a1 course];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentCountrySupportsCommute(void *a1, const char *a2, ...)
{
  return [a1 currentCountrySupportsCommute];
}

id objc_msgSend_currentHypothesis(void *a1, const char *a2, ...)
{
  return [a1 currentHypothesis];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_currentVehicleState(void *a1, const char *a2, ...)
{
  return [a1 currentVehicleState];
}

id objc_msgSend_custom(void *a1, const char *a2, ...)
{
  return [a1 custom];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataTypes(void *a1, const char *a2, ...)
{
  return [a1 dataTypes];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultCooldownMultiplierPerError(void *a1, const char *a2, ...)
{
  return [a1 defaultCooldownMultiplierPerError];
}

id objc_msgSend_defaultCooldownTimeForError(void *a1, const char *a2, ...)
{
  return [a1 defaultCooldownTimeForError];
}

id objc_msgSend_defaultDoomWindowMaxSecondsAfterExitTime(void *a1, const char *a2, ...)
{
  return [a1 defaultDoomWindowMaxSecondsAfterExitTime];
}

id objc_msgSend_defaultDoomWindowMaxSecondsBeforeExitTime(void *a1, const char *a2, ...)
{
  return [a1 defaultDoomWindowMaxSecondsBeforeExitTime];
}

id objc_msgSend_defaultExpirationOffset(void *a1, const char *a2, ...)
{
  return [a1 defaultExpirationOffset];
}

id objc_msgSend_defaultFileURL(void *a1, const char *a2, ...)
{
  return [a1 defaultFileURL];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMaxCooldownTime(void *a1, const char *a2, ...)
{
  return [a1 defaultMaxCooldownTime];
}

id objc_msgSend_defaultMinTimeWhenHappy(void *a1, const char *a2, ...)
{
  return [a1 defaultMinTimeWhenHappy];
}

id objc_msgSend_defaultPath(void *a1, const char *a2, ...)
{
  return [a1 defaultPath];
}

id objc_msgSend_defaultPurgeAgeLimit(void *a1, const char *a2, ...)
{
  return [a1 defaultPurgeAgeLimit];
}

id objc_msgSend_defaultPurgeCountLimit(void *a1, const char *a2, ...)
{
  return [a1 defaultPurgeCountLimit];
}

id objc_msgSend_defaultTimeToRunDestinationsUpdater(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeToRunDestinationsUpdater];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_defaultWakeupTimeBeforeWindow(void *a1, const char *a2, ...)
{
  return [a1 defaultWakeupTimeBeforeWindow];
}

id objc_msgSend_defaultWakeupTimeWithinWindow(void *a1, const char *a2, ...)
{
  return [a1 defaultWakeupTimeWithinWindow];
}

id objc_msgSend_defaultWakeupWithoutWindow(void *a1, const char *a2, ...)
{
  return [a1 defaultWakeupWithoutWindow];
}

id objc_msgSend_departingAirportCode(void *a1, const char *a2, ...)
{
  return [a1 departingAirportCode];
}

id objc_msgSend_deregisterBackgroundTasks(void *a1, const char *a2, ...)
{
  return [a1 deregisterBackgroundTasks];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionOfAllEntries(void *a1, const char *a2, ...)
{
  return [a1 descriptionOfAllEntries];
}

id objc_msgSend_desiredAccuracy(void *a1, const char *a2, ...)
{
  return [a1 desiredAccuracy];
}

id objc_msgSend_destinationID(void *a1, const char *a2, ...)
{
  return [a1 destinationID];
}

id objc_msgSend_destinationLocation(void *a1, const char *a2, ...)
{
  return [a1 destinationLocation];
}

id objc_msgSend_destinationWaypoint(void *a1, const char *a2, ...)
{
  return [a1 destinationWaypoint];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didRequestRoute(void *a1, const char *a2, ...)
{
  return [a1 didRequestRoute];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eastLng(void *a1, const char *a2, ...)
{
  return [a1 eastLng];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return [a1 endTransaction];
}

id objc_msgSend_engineStateCNG(void *a1, const char *a2, ...)
{
  return [a1 engineStateCNG];
}

id objc_msgSend_engineStateDiesel(void *a1, const char *a2, ...)
{
  return [a1 engineStateDiesel];
}

id objc_msgSend_engineStateElectric(void *a1, const char *a2, ...)
{
  return [a1 engineStateElectric];
}

id objc_msgSend_engineStateGasoline(void *a1, const char *a2, ...)
{
  return [a1 engineStateGasoline];
}

id objc_msgSend_engineStates(void *a1, const char *a2, ...)
{
  return [a1 engineStates];
}

id objc_msgSend_engineType(void *a1, const char *a2, ...)
{
  return [a1 engineType];
}

id objc_msgSend_engineTypes(void *a1, const char *a2, ...)
{
  return [a1 engineTypes];
}

id objc_msgSend_entry(void *a1, const char *a2, ...)
{
  return [a1 entry];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_estimatedSeconds(void *a1, const char *a2, ...)
{
  return [a1 estimatedSeconds];
}

id objc_msgSend_estimatedTravelTime(void *a1, const char *a2, ...)
{
  return [a1 estimatedTravelTime];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return [a1 expiryDate];
}

id objc_msgSend_extraLocationWaitTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 extraLocationWaitTimeInterval];
}

id objc_msgSend_failed(void *a1, const char *a2, ...)
{
  return [a1 failed];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return [a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forDevice(void *a1, const char *a2, ...)
{
  return [a1 forDevice];
}

id objc_msgSend_forceReroute(void *a1, const char *a2, ...)
{
  return [a1 forceReroute];
}

id objc_msgSend_fulfillAsFailure(void *a1, const char *a2, ...)
{
  return [a1 fulfillAsFailure];
}

id objc_msgSend_geoFenceMapRegion(void *a1, const char *a2, ...)
{
  return [a1 geoFenceMapRegion];
}

id objc_msgSend_geoMapItem(void *a1, const char *a2, ...)
{
  return [a1 geoMapItem];
}

id objc_msgSend_getVehicleInfoData(void *a1, const char *a2, ...)
{
  return [a1 getVehicleInfoData];
}

id objc_msgSend_guard(void *a1, const char *a2, ...)
{
  return [a1 guard];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_handleValue(void *a1, const char *a2, ...)
{
  return [a1 handleValue];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_handlerCount(void *a1, const char *a2, ...)
{
  return [a1 handlerCount];
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hardwareIdentifier];
}

id objc_msgSend_hasBeenFulfilled(void *a1, const char *a2, ...)
{
  return [a1 hasBeenFulfilled];
}

id objc_msgSend_hasBudgetLeft(void *a1, const char *a2, ...)
{
  return [a1 hasBudgetLeft];
}

id objc_msgSend_hasEastLng(void *a1, const char *a2, ...)
{
  return [a1 hasEastLng];
}

id objc_msgSend_hasHome(void *a1, const char *a2, ...)
{
  return [a1 hasHome];
}

id objc_msgSend_hasLocationAccess(void *a1, const char *a2, ...)
{
  return [a1 hasLocationAccess];
}

id objc_msgSend_hasMapItemStorage(void *a1, const char *a2, ...)
{
  return [a1 hasMapItemStorage];
}

id objc_msgSend_hasMapsLocationAccess(void *a1, const char *a2, ...)
{
  return [a1 hasMapsLocationAccess];
}

id objc_msgSend_hasNonRecommendedRoutesCache(void *a1, const char *a2, ...)
{
  return [a1 hasNonRecommendedRoutesCache];
}

id objc_msgSend_hasNorthLat(void *a1, const char *a2, ...)
{
  return [a1 hasNorthLat];
}

id objc_msgSend_hasRouteLoaded(void *a1, const char *a2, ...)
{
  return [a1 hasRouteLoaded];
}

id objc_msgSend_hasSouthLat(void *a1, const char *a2, ...)
{
  return [a1 hasSouthLat];
}

id objc_msgSend_hasUserPreferences(void *a1, const char *a2, ...)
{
  return [a1 hasUserPreferences];
}

id objc_msgSend_hasWestLng(void *a1, const char *a2, ...)
{
  return [a1 hasWestLng];
}

id objc_msgSend_hasWork(void *a1, const char *a2, ...)
{
  return [a1 hasWork];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headUnitBluetoothIdentifier(void *a1, const char *a2, ...)
{
  return [a1 headUnitBluetoothIdentifier];
}

id objc_msgSend_headUnitIdentifier(void *a1, const char *a2, ...)
{
  return [a1 headUnitIdentifier];
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return [a1 hide];
}

id objc_msgSend_home(void *a1, const char *a2, ...)
{
  return [a1 home];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_iapIdentifier(void *a1, const char *a2, ...)
{
  return [a1 iapIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inUseAssertionForNavd(void *a1, const char *a2, ...)
{
  return [a1 inUseAssertionForNavd];
}

id objc_msgSend_incidentId(void *a1, const char *a2, ...)
{
  return [a1 incidentId];
}

id objc_msgSend_incidentsOnRoutes(void *a1, const char *a2, ...)
{
  return [a1 incidentsOnRoutes];
}

id objc_msgSend_incidentsOnRoutesCount(void *a1, const char *a2, ...)
{
  return [a1 incidentsOnRoutesCount];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_innerQueue(void *a1, const char *a2, ...)
{
  return [a1 innerQueue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalStorage(void *a1, const char *a2, ...)
{
  return [a1 internalStorage];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAllowedOnHomeScreenCondition(void *a1, const char *a2, ...)
{
  return [a1 isAllowedOnHomeScreenCondition];
}

id objc_msgSend_isAllowedOnLockScreenCondition(void *a1, const char *a2, ...)
{
  return [a1 isAllowedOnLockScreenCondition];
}

id objc_msgSend_isCalendarClientInfo(void *a1, const char *a2, ...)
{
  return [a1 isCalendarClientInfo];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isEnabledCondition(void *a1, const char *a2, ...)
{
  return [a1 isEnabledCondition];
}

id objc_msgSend_isInVisitCondition(void *a1, const char *a2, ...)
{
  return [a1 isInVisitCondition];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isLoadingRoute(void *a1, const char *a2, ...)
{
  return [a1 isLoadingRoute];
}

id objc_msgSend_isLockedOrHidden(void *a1, const char *a2, ...)
{
  return [a1 isLockedOrHidden];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isMatchShifted(void *a1, const char *a2, ...)
{
  return [a1 isMatchShifted];
}

id objc_msgSend_isMultiPointRoute(void *a1, const char *a2, ...)
{
  return [a1 isMultiPointRoute];
}

id objc_msgSend_isNavdClientInfo(void *a1, const char *a2, ...)
{
  return [a1 isNavdClientInfo];
}

id objc_msgSend_isNavigatingOrPredictingDestination(void *a1, const char *a2, ...)
{
  return [a1 isNavigatingOrPredictingDestination];
}

id objc_msgSend_isNavigatingWithETA(void *a1, const char *a2, ...)
{
  return [a1 isNavigatingWithETA];
}

id objc_msgSend_isPureElectricVehicle(void *a1, const char *a2, ...)
{
  return [a1 isPureElectricVehicle];
}

id objc_msgSend_isTrue(void *a1, const char *a2, ...)
{
  return [a1 isTrue];
}

id objc_msgSend_kickCanBySameTime(void *a1, const char *a2, ...)
{
  return [a1 kickCanBySameTime];
}

id objc_msgSend_kilowattHours(void *a1, const char *a2, ...)
{
  return [a1 kilowattHours];
}

id objc_msgSend_lastLeechedLocation(void *a1, const char *a2, ...)
{
  return [a1 lastLeechedLocation];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPostedState(void *a1, const char *a2, ...)
{
  return [a1 lastPostedState];
}

id objc_msgSend_lastStateUpdateDate(void *a1, const char *a2, ...)
{
  return [a1 lastStateUpdateDate];
}

id objc_msgSend_lat(void *a1, const char *a2, ...)
{
  return [a1 lat];
}

id objc_msgSend_latLng(void *a1, const char *a2, ...)
{
  return [a1 latLng];
}

id objc_msgSend_leechedLocations(void *a1, const char *a2, ...)
{
  return [a1 leechedLocations];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_licensePlate(void *a1, const char *a2, ...)
{
  return [a1 licensePlate];
}

id objc_msgSend_lng(void *a1, const char *a2, ...)
{
  return [a1 lng];
}

id objc_msgSend_loadCacheFromFile(void *a1, const char *a2, ...)
{
  return [a1 loadCacheFromFile];
}

id objc_msgSend_loadRoute(void *a1, const char *a2, ...)
{
  return [a1 loadRoute];
}

id objc_msgSend_localUpdatesOnly(void *a1, const char *a2, ...)
{
  return [a1 localUpdatesOnly];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationFreshnessThreshold(void *a1, const char *a2, ...)
{
  return [a1 locationFreshnessThreshold];
}

id objc_msgSend_locationManager(void *a1, const char *a2, ...)
{
  return [a1 locationManager];
}

id objc_msgSend_locationReuseThreshold(void *a1, const char *a2, ...)
{
  return [a1 locationReuseThreshold];
}

id objc_msgSend_locationUpdateTimerInterval(void *a1, const char *a2, ...)
{
  return [a1 locationUpdateTimerInterval];
}

id objc_msgSend_locationUpdatesDesiredAccuracyForDriving(void *a1, const char *a2, ...)
{
  return [a1 locationUpdatesDesiredAccuracyForDriving];
}

id objc_msgSend_locationUpdatesDesiredAccuracyForTransit(void *a1, const char *a2, ...)
{
  return [a1 locationUpdatesDesiredAccuracyForTransit];
}

id objc_msgSend_locationUpdatesDesiredAccuracyForWalking(void *a1, const char *a2, ...)
{
  return [a1 locationUpdatesDesiredAccuracyForWalking];
}

id objc_msgSend_locationUpdatesDesiredAccuracyWhileStationaryForDriving(void *a1, const char *a2, ...)
{
  return [a1 locationUpdatesDesiredAccuracyWhileStationaryForDriving];
}

id objc_msgSend_locationUpdatesDesiredAccuracyWhileStationaryForTransit(void *a1, const char *a2, ...)
{
  return [a1 locationUpdatesDesiredAccuracyWhileStationaryForTransit];
}

id objc_msgSend_locationUpdatesDesiredAccuracyWhileStationaryForWalking(void *a1, const char *a2, ...)
{
  return [a1 locationUpdatesDesiredAccuracyWhileStationaryForWalking];
}

id objc_msgSend_locations(void *a1, const char *a2, ...)
{
  return [a1 locations];
}

id objc_msgSend_lockScreenSetting(void *a1, const char *a2, ...)
{
  return [a1 lockScreenSetting];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowRangeWarning(void *a1, const char *a2, ...)
{
  return [a1 lowRangeWarning];
}

id objc_msgSend_lprPowerType(void *a1, const char *a2, ...)
{
  return [a1 lprPowerType];
}

id objc_msgSend_lprVehicleType(void *a1, const char *a2, ...)
{
  return [a1 lprVehicleType];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return [a1 macAddress];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainRouteInfo(void *a1, const char *a2, ...)
{
  return [a1 mainRouteInfo];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_manufacturer(void *a1, const char *a2, ...)
{
  return [a1 manufacturer];
}

id objc_msgSend_mapItemStorage(void *a1, const char *a2, ...)
{
  return [a1 mapItemStorage];
}

id objc_msgSend_matchInfo(void *a1, const char *a2, ...)
{
  return [a1 matchInfo];
}

id objc_msgSend_maximumNumberOfLeechedLocations(void *a1, const char *a2, ...)
{
  return [a1 maximumNumberOfLeechedLocations];
}

id objc_msgSend_maximumNumberOfProcessingLoopRepeats(void *a1, const char *a2, ...)
{
  return [a1 maximumNumberOfProcessingLoopRepeats];
}

id objc_msgSend_maximumRefreshIntervalLeeway(void *a1, const char *a2, ...)
{
  return [a1 maximumRefreshIntervalLeeway];
}

id objc_msgSend_maximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds(void *a1, const char *a2, ...)
{
  return [a1 maximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_meters(void *a1, const char *a2, ...)
{
  return [a1 meters];
}

id objc_msgSend_minimumDistanceToCompareAgainstLocationAccuracy(void *a1, const char *a2, ...)
{
  return [a1 minimumDistanceToCompareAgainstLocationAccuracy];
}

id objc_msgSend_minimumDistanceToConsiderLeechedLocationInMeters(void *a1, const char *a2, ...)
{
  return [a1 minimumDistanceToConsiderLeechedLocationInMeters];
}

id objc_msgSend_minimumDistanceToGetLocationUpdatesInMeters(void *a1, const char *a2, ...)
{
  return [a1 minimumDistanceToGetLocationUpdatesInMeters];
}

id objc_msgSend_minimumExpirationOffset(void *a1, const char *a2, ...)
{
  return [a1 minimumExpirationOffset];
}

id objc_msgSend_minimumTimeIntervalToConsiderLeechedLocationInSeconds(void *a1, const char *a2, ...)
{
  return [a1 minimumTimeIntervalToConsiderLeechedLocationInSeconds];
}

id objc_msgSend_minimumTimerTimeStampFudge(void *a1, const char *a2, ...)
{
  return [a1 minimumTimerTimeStampFudge];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_mostRecentAlert(void *a1, const char *a2, ...)
{
  return [a1 mostRecentAlert];
}

id objc_msgSend_mostRecentDestinations(void *a1, const char *a2, ...)
{
  return [a1 mostRecentDestinations];
}

id objc_msgSend_mostRecentDoomWindow(void *a1, const char *a2, ...)
{
  return [a1 mostRecentDoomWindow];
}

id objc_msgSend_mostRecentExitTime(void *a1, const char *a2, ...)
{
  return [a1 mostRecentExitTime];
}

id objc_msgSend_mostRecentLocation(void *a1, const char *a2, ...)
{
  return [a1 mostRecentLocation];
}

id objc_msgSend_mostRecentModification(void *a1, const char *a2, ...)
{
  return [a1 mostRecentModification];
}

id objc_msgSend_mostRecentRoutesPerDestination(void *a1, const char *a2, ...)
{
  return [a1 mostRecentRoutesPerDestination];
}

id objc_msgSend_mostRecentStart(void *a1, const char *a2, ...)
{
  return [a1 mostRecentStart];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_names(void *a1, const char *a2, ...)
{
  return [a1 names];
}

id objc_msgSend_navTracesDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 navTracesDirectoryPath];
}

id objc_msgSend_navdCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 navdCacheDirectoryPath];
}

id objc_msgSend_navdInstance(void *a1, const char *a2, ...)
{
  return [a1 navdInstance];
}

id objc_msgSend_navdLocationBundleSource(void *a1, const char *a2, ...)
{
  return [a1 navdLocationBundleSource];
}

id objc_msgSend_navdManager(void *a1, const char *a2, ...)
{
  return [a1 navdManager];
}

id objc_msgSend_nextAllowedRequestTime(void *a1, const char *a2, ...)
{
  return [a1 nextAllowedRequestTime];
}

id objc_msgSend_nextRefreshActivityFired(void *a1, const char *a2, ...)
{
  return [a1 nextRefreshActivityFired];
}

id objc_msgSend_nextRefreshTimeStamp(void *a1, const char *a2, ...)
{
  return [a1 nextRefreshTimeStamp];
}

id objc_msgSend_nextWakeup(void *a1, const char *a2, ...)
{
  return [a1 nextWakeup];
}

id objc_msgSend_nonRecommendedRoutesCache(void *a1, const char *a2, ...)
{
  return [a1 nonRecommendedRoutesCache];
}

id objc_msgSend_northLat(void *a1, const char *a2, ...)
{
  return [a1 northLat];
}

id objc_msgSend_notificationCenterSetting(void *a1, const char *a2, ...)
{
  return [a1 notificationCenterSetting];
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return [a1 notificationSettings];
}

id objc_msgSend_notifyObserversOfRouteRequest(void *a1, const char *a2, ...)
{
  return [a1 notifyObserversOfRouteRequest];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfAlertableRoutes(void *a1, const char *a2, ...)
{
  return [a1 numberOfAlertableRoutes];
}

id objc_msgSend_numberOfDirectionRequests(void *a1, const char *a2, ...)
{
  return [a1 numberOfDirectionRequests];
}

id objc_msgSend_numberOfUpdatesToDestinations(void *a1, const char *a2, ...)
{
  return [a1 numberOfUpdatesToDestinations];
}

id objc_msgSend_numberOfUpdatesToExitTime(void *a1, const char *a2, ...)
{
  return [a1 numberOfUpdatesToExitTime];
}

id objc_msgSend_numberOfUpdatesToRoutes(void *a1, const char *a2, ...)
{
  return [a1 numberOfUpdatesToRoutes];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offRouteInfos(void *a1, const char *a2, ...)
{
  return [a1 offRouteInfos];
}

id objc_msgSend_onEnterTrigger(void *a1, const char *a2, ...)
{
  return [a1 onEnterTrigger];
}

id objc_msgSend_oneAppGuardian(void *a1, const char *a2, ...)
{
  return [a1 oneAppGuardian];
}

id objc_msgSend_oneEventKit(void *a1, const char *a2, ...)
{
  return [a1 oneEventKit];
}

id objc_msgSend_oneFavorites(void *a1, const char *a2, ...)
{
  return [a1 oneFavorites];
}

id objc_msgSend_oneNetworkRequester(void *a1, const char *a2, ...)
{
  return [a1 oneNetworkRequester];
}

id objc_msgSend_oneRoutine(void *a1, const char *a2, ...)
{
  return [a1 oneRoutine];
}

id objc_msgSend_outOfMapsAlertsInfo(void *a1, const char *a2, ...)
{
  return [a1 outOfMapsAlertsInfo];
}

id objc_msgSend_pairedAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pairedAppIdentifier];
}

id objc_msgSend_pairedAppInstallDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pairedAppInstallDeviceIdentifier];
}

id objc_msgSend_pairedAppInstallSessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pairedAppInstallSessionIdentifier];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_penalty(void *a1, const char *a2, ...)
{
  return [a1 penalty];
}

id objc_msgSend_pendingStopTimeToLive(void *a1, const char *a2, ...)
{
  return [a1 pendingStopTimeToLive];
}

id objc_msgSend_pointOfInterestHandoffEnabled(void *a1, const char *a2, ...)
{
  return [a1 pointOfInterestHandoffEnabled];
}

id objc_msgSend_powerByConnector(void *a1, const char *a2, ...)
{
  return [a1 powerByConnector];
}

id objc_msgSend_powerTypes(void *a1, const char *a2, ...)
{
  return [a1 powerTypes];
}

id objc_msgSend_preferredChargingNetworks(void *a1, const char *a2, ...)
{
  return [a1 preferredChargingNetworks];
}

id objc_msgSend_prepareForUse(void *a1, const char *a2, ...)
{
  return [a1 prepareForUse];
}

id objc_msgSend_pruneExpiredItems(void *a1, const char *a2, ...)
{
  return [a1 pruneExpiredItems];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_reasonForEnd(void *a1, const char *a2, ...)
{
  return [a1 reasonForEnd];
}

id objc_msgSend_recomputeGeoWaypointTyped(void *a1, const char *a2, ...)
{
  return [a1 recomputeGeoWaypointTyped];
}

id objc_msgSend_refreshEquationHighestFrequency(void *a1, const char *a2, ...)
{
  return [a1 refreshEquationHighestFrequency];
}

id objc_msgSend_refreshEquationLowestFrequency(void *a1, const char *a2, ...)
{
  return [a1 refreshEquationLowestFrequency];
}

id objc_msgSend_refreshEquationLowestFrequencyTransit(void *a1, const char *a2, ...)
{
  return [a1 refreshEquationLowestFrequencyTransit];
}

id objc_msgSend_refreshTimeIntervalBackoffBase(void *a1, const char *a2, ...)
{
  return [a1 refreshTimeIntervalBackoffBase];
}

id objc_msgSend_refreshTimeIntervalBackoffMax(void *a1, const char *a2, ...)
{
  return [a1 refreshTimeIntervalBackoffMax];
}

id objc_msgSend_refreshTimeIntervalToUseIfError(void *a1, const char *a2, ...)
{
  return [a1 refreshTimeIntervalToUseIfError];
}

id objc_msgSend_refreshTimestamp(void *a1, const char *a2, ...)
{
  return [a1 refreshTimestamp];
}

id objc_msgSend_region(void *a1, const char *a2, ...)
{
  return [a1 region];
}

id objc_msgSend_registerBackgroundTasks(void *a1, const char *a2, ...)
{
  return [a1 registerBackgroundTasks];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeStaleArchivedDestinations(void *a1, const char *a2, ...)
{
  return [a1 removeStaleArchivedDestinations];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_responseAlertSecondary(void *a1, const char *a2, ...)
{
  return [a1 responseAlertSecondary];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return [a1 route];
}

id objc_msgSend_routeCacheExpirationInterval(void *a1, const char *a2, ...)
{
  return [a1 routeCacheExpirationInterval];
}

id objc_msgSend_routesCount(void *a1, const char *a2, ...)
{
  return [a1 routesCount];
}

id objc_msgSend_rowId(void *a1, const char *a2, ...)
{
  return [a1 rowId];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runASAP(void *a1, const char *a2, ...)
{
  return [a1 runASAP];
}

id objc_msgSend_saveCacheToFile(void *a1, const char *a2, ...)
{
  return [a1 saveCacheToFile];
}

id objc_msgSend_scheduleNextRun(void *a1, const char *a2, ...)
{
  return [a1 scheduleNextRun];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return [a1 seconds];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return [a1 sessionState];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLeecher(void *a1, const char *a2, ...)
{
  return [a1 sharedLeecher];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedPredictor(void *a1, const char *a2, ...)
{
  return [a1 sharedPredictor];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_sharedUpdater(void *a1, const char *a2, ...)
{
  return [a1 sharedUpdater];
}

id objc_msgSend_shouldSuppress(void *a1, const char *a2, ...)
{
  return [a1 shouldSuppress];
}

id objc_msgSend_siriIntentsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 siriIntentsIdentifier];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_snapshotDataSource(void *a1, const char *a2, ...)
{
  return [a1 snapshotDataSource];
}

id objc_msgSend_southLat(void *a1, const char *a2, ...)
{
  return [a1 southLat];
}

id objc_msgSend_spendNow(void *a1, const char *a2, ...)
{
  return [a1 spendNow];
}

id objc_msgSend_staleLocationUseTimerInterval(void *a1, const char *a2, ...)
{
  return [a1 staleLocationUseTimerInterval];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startDoomIfNotStarted(void *a1, const char *a2, ...)
{
  return [a1 startDoomIfNotStarted];
}

id objc_msgSend_startLeeching(void *a1, const char *a2, ...)
{
  return [a1 startLeeching];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_startMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringSignificantLocationChanges];
}

id objc_msgSend_startMonitoringVisits(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringVisits];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopMonitoringSignificantLocationChanges(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringSignificantLocationChanges];
}

id objc_msgSend_stopMonitoringVisits(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringVisits];
}

id objc_msgSend_stopUpdating(void *a1, const char *a2, ...)
{
  return [a1 stopUpdating];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_suggestedDepartureDate(void *a1, const char *a2, ...)
{
  return [a1 suggestedDepartureDate];
}

id objc_msgSend_supportedConnectors(void *a1, const char *a2, ...)
{
  return [a1 supportedConnectors];
}

id objc_msgSend_supportsCarPlay(void *a1, const char *a2, ...)
{
  return [a1 supportsCarPlay];
}

id objc_msgSend_supportsForceTouch(void *a1, const char *a2, ...)
{
  return [a1 supportsForceTouch];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeInterval(void *a1, const char *a2, ...)
{
  return [a1 timeInterval];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traceName(void *a1, const char *a2, ...)
{
  return [a1 traceName];
}

id objc_msgSend_trafficString(void *a1, const char *a2, ...)
{
  return [a1 trafficString];
}

id objc_msgSend_transportType(void *a1, const char *a2, ...)
{
  return [a1 transportType];
}

id objc_msgSend_travelTimeConservativeEstimate(void *a1, const char *a2, ...)
{
  return [a1 travelTimeConservativeEstimate];
}

id objc_msgSend_traversalTimes(void *a1, const char *a2, ...)
{
  return [a1 traversalTimes];
}

id objc_msgSend_triggerDate(void *a1, const char *a2, ...)
{
  return [a1 triggerDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_undecoratedTitle(void *a1, const char *a2, ...)
{
  return [a1 undecoratedTitle];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_uniqueName(void *a1, const char *a2, ...)
{
  return [a1 uniqueName];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateTimeout(void *a1, const char *a2, ...)
{
  return [a1 updateTimeout];
}

id objc_msgSend_useConservativeDepartureForRefreshTimer(void *a1, const char *a2, ...)
{
  return [a1 useConservativeDepartureForRefreshTimer];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userPreferences(void *a1, const char *a2, ...)
{
  return [a1 userPreferences];
}

id objc_msgSend_usesPreferredNetworksForRouting(void *a1, const char *a2, ...)
{
  return [a1 usesPreferredNetworksForRouting];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_valueRefreshTimeStamp(void *a1, const char *a2, ...)
{
  return [a1 valueRefreshTimeStamp];
}

id objc_msgSend_vehicleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 vehicleIdentifier];
}

id objc_msgSend_vehicleInfoInitialData(void *a1, const char *a2, ...)
{
  return [a1 vehicleInfoInitialData];
}

id objc_msgSend_vehicleTypes(void *a1, const char *a2, ...)
{
  return [a1 vehicleTypes];
}

id objc_msgSend_venueID(void *a1, const char *a2, ...)
{
  return [a1 venueID];
}

id objc_msgSend_venueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 venueIdentifier];
}

id objc_msgSend_watts(void *a1, const char *a2, ...)
{
  return [a1 watts];
}

id objc_msgSend_waypointExpirationInterval(void *a1, const char *a2, ...)
{
  return [a1 waypointExpirationInterval];
}

id objc_msgSend_waypointRoutes(void *a1, const char *a2, ...)
{
  return [a1 waypointRoutes];
}

id objc_msgSend_waypointRoutesCount(void *a1, const char *a2, ...)
{
  return [a1 waypointRoutesCount];
}

id objc_msgSend_waypoints(void *a1, const char *a2, ...)
{
  return [a1 waypoints];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return [a1 weight];
}

id objc_msgSend_westLng(void *a1, const char *a2, ...)
{
  return [a1 westLng];
}

id objc_msgSend_withoutTracker(void *a1, const char *a2, ...)
{
  return [a1 withoutTracker];
}

id objc_msgSend_work(void *a1, const char *a2, ...)
{
  return [a1 work];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}