int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,Start maphelperservice", buf, 2u);
  }
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLTSP,MapHelperService,listener resume maphelperservice", v6, 2u);
  }

  return 0;
}

void sub_100004E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004E74(uint64_t a1)
{
}

void sub_100004E7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v31 = v3;
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v31 roadID]);
    [v4 setValue:v5 forKey:@"roadID"];

    v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 roadClass]);
    [v4 setValue:v6 forKey:@"roadClass"];

    v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 formOfWay]);
    [v4 setValue:v7 forKey:@"formOfWay"];

    v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 travelDirection]);
    [v4 setValue:v8 forKey:@"travelDirection"];

    v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 rampType]);
    [v4 setValue:v9 forKey:@"rampType"];

    v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 speedLimit]);
    [v4 setValue:v10 forKey:@"speedLimit"];

    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 isDrivable]);
    [v4 setValue:v11 forKey:@"isDrivable"];

    v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 isRoadPedestrianNavigable]);
    [v4 setValue:v12 forKey:@"isRoadPedestrianNavigable"];

    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 isTunnel]);
    [v4 setValue:v13 forKey:@"isTunnel"];

    v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 isBridge]);
    [v4 setValue:v14 forKey:@"isBridge"];

    v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v31 isRail]);
    [v4 setValue:v15 forKey:@"isRail"];

    v16 = [v31 startJunction];
    v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 junctionIndex]);
    [v4 setValue:v17 forKey:@"startJunction"];

    v18 = [v31 endJunction];
    v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v18 junctionIndex]);
    [v4 setValue:v19 forKey:@"stopJunction"];

    v20 = [v31 startJunction];
    v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 isOnTileBorder]);
    [v4 setValue:v21 forKey:@"startTileBorder"];

    v22 = [v31 endJunction];
    v23 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v22 isOnTileBorder]);
    [v4 setValue:v23 forKey:@"endTileBorder"];

    v24 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 bikeableSide]);
    [v4 setValue:v24 forKey:@"bikeableSide"];

    v25 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 walkableSide]);
    [v4 setValue:v25 forKey:@"walkableSide"];

    v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v31 coordinateCount]);
    [v4 setValue:v26 forKey:@"coordinateCount"];

    if ([v31 coordinateCount])
    {
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      do
      {
        v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%.7lf,%.7lf,%.2lf", *(void *)((char *)[v31 coordinates3d] + v27), *(void *)((char *)objc_msgSend(v31, "coordinates3d") + v27 + 8), *(void *)((char *)objc_msgSend(v31, "coordinates3d") + v27 + 16));
        v30 = +[NSString stringWithFormat:@"coord%d", v28];
        [v4 setValue:v29 forKey:v30];

        ++v28;
        v27 += 24;
      }
      while ((unint64_t)[v31 coordinateCount] > v28);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];

    id v3 = v31;
  }
}

void sub_100005404(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [v3 code];
    v5 = [v7 domain];
    v6 = [v7 localizedDescription];
    NSLog(@"CLTSP,CLMM,MapHelperService,GEOMapFeatureAccessRequest reported errorcode,%lld,domain,%@,description,\"%@\"", v4, v5, v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(*(void *)(a1 + 32) + 16) clearRoadTiles];
  }
}

void sub_100005764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100005794(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v28 = a1;
    id v30 = v3;
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 buildingID]);
    [v4 setValue:v5 forKey:@"buildingID"];

    v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v30 tileSetStyle]);
    [v4 setValue:v6 forKey:@"tileSetStyle"];

    id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v30 hasTerrainElevation]);
    [v4 setValue:v7 forKey:@"hasTerrainElevation"];

    uint64_t v27 = v4;
    id v29 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v4, "setValue:forKey:");
    v8 = [v30 sections];
    id v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = objc_alloc_init((Class)NSMutableDictionary);
        v12 = [v30 sections];
        v13 = [v12 objectAtIndexedSubscript:v10];

        if (v13)
        {
          [v13 maxBaseHeight];
          v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setValue:v14 forKey:@"maxBaseHeight"];

          [v13 minBaseHeight];
          uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setValue:v15 forKey:@"minBaseHeight"];

          [v13 topHeight];
          v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setValue:v16 forKey:@"topHeight"];

          [v13 terrainElevation];
          v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setValue:v17 forKey:@"terrainElevation"];

          [v13 height];
          v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setValue:v18 forKey:@"height"];

          [v13 baseHeight];
          v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v11 setValue:v19 forKey:@"baseHeight"];

          v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 coordinateCount]);
          [v11 setValue:v20 forKey:@"coordinateCount"];

          if ([v13 coordinateCount])
          {
            uint64_t v21 = 0;
            unint64_t v22 = 0;
            do
            {
              v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%.7lf,%.7lf", *(void *)((char *)[v13 coordinates] + v21), *(void *)((char *)objc_msgSend(v13, "coordinates") + v21 + 8));
              v24 = +[NSString stringWithFormat:@"coord%d", v22];
              [v11 setValue:v23 forKey:v24];

              ++v22;
              v21 += 16;
            }
            while ((unint64_t)[v13 coordinateCount] > v22);
          }
        }
        [v29 addObject:v11];

        ++v10;
        v25 = [v30 sections];
        id v26 = [v25 count];
      }
      while ((unint64_t)v26 > v10);
    }
    [*(id *)(*(void *)(*(void *)(v28 + 32) + 8) + 40) addObject:v27];

    id v3 = v30;
  }
}

void sub_100005BC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 64);
    id v5 = [v3 code];
    v6 = [v9 domain];
    id v7 = [v9 localizedDescription];
    NSLog(@"CLTSP,CLMM,GEOMapFeatureAccessRequest,tileStyle,%1d,reported errorcode,%lld,domain,%@,description,\"%@\"", v4, v5, v6, v7);
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    NSLog(@"CLTSP,CLGEOMapHelperService,fetchGEOBuildingDataAroundCoordinate,tileStyle,%1d,repliedWithCount,%d,elapsedTime,%.2lf", *(unsigned int *)(a1 + 64), [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count], (Current - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) * 1000.0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 68)) {
    [*(id *)(*(void *)(a1 + 32) + 16) clearBuildingTiles];
  }
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_baseHeight(void *a1, const char *a2, ...)
{
  return [a1 baseHeight];
}

id objc_msgSend_bikeableSide(void *a1, const char *a2, ...)
{
  return [a1 bikeableSide];
}

id objc_msgSend_buildingID(void *a1, const char *a2, ...)
{
  return [a1 buildingID];
}

id objc_msgSend_clearAllTiles(void *a1, const char *a2, ...)
{
  return [a1 clearAllTiles];
}

id objc_msgSend_clearBuildingTiles(void *a1, const char *a2, ...)
{
  return [a1 clearBuildingTiles];
}

id objc_msgSend_clearRoadTiles(void *a1, const char *a2, ...)
{
  return [a1 clearRoadTiles];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_coordinateCount(void *a1, const char *a2, ...)
{
  return [a1 coordinateCount];
}

id objc_msgSend_coordinates(void *a1, const char *a2, ...)
{
  return [a1 coordinates];
}

id objc_msgSend_coordinates3d(void *a1, const char *a2, ...)
{
  return [a1 coordinates3d];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endJunction(void *a1, const char *a2, ...)
{
  return [a1 endJunction];
}

id objc_msgSend_formOfWay(void *a1, const char *a2, ...)
{
  return [a1 formOfWay];
}

id objc_msgSend_hasTerrainElevation(void *a1, const char *a2, ...)
{
  return [a1 hasTerrainElevation];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBridge(void *a1, const char *a2, ...)
{
  return [a1 isBridge];
}

id objc_msgSend_isDrivable(void *a1, const char *a2, ...)
{
  return [a1 isDrivable];
}

id objc_msgSend_isOnTileBorder(void *a1, const char *a2, ...)
{
  return [a1 isOnTileBorder];
}

id objc_msgSend_isRail(void *a1, const char *a2, ...)
{
  return [a1 isRail];
}

id objc_msgSend_isRoadPedestrianNavigable(void *a1, const char *a2, ...)
{
  return [a1 isRoadPedestrianNavigable];
}

id objc_msgSend_isTunnel(void *a1, const char *a2, ...)
{
  return [a1 isTunnel];
}

id objc_msgSend_junctionIndex(void *a1, const char *a2, ...)
{
  return [a1 junctionIndex];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_maxBaseHeight(void *a1, const char *a2, ...)
{
  return [a1 maxBaseHeight];
}

id objc_msgSend_minBaseHeight(void *a1, const char *a2, ...)
{
  return [a1 minBaseHeight];
}

id objc_msgSend_rampType(void *a1, const char *a2, ...)
{
  return [a1 rampType];
}

id objc_msgSend_releaseOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 releaseOSTransaction];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_roadClass(void *a1, const char *a2, ...)
{
  return [a1 roadClass];
}

id objc_msgSend_roadID(void *a1, const char *a2, ...)
{
  return [a1 roadID];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_speedLimit(void *a1, const char *a2, ...)
{
  return [a1 speedLimit];
}

id objc_msgSend_startJunction(void *a1, const char *a2, ...)
{
  return [a1 startJunction];
}

id objc_msgSend_takeOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 takeOSTransaction];
}

id objc_msgSend_terrainElevation(void *a1, const char *a2, ...)
{
  return [a1 terrainElevation];
}

id objc_msgSend_tileSetStyle(void *a1, const char *a2, ...)
{
  return [a1 tileSetStyle];
}

id objc_msgSend_topHeight(void *a1, const char *a2, ...)
{
  return [a1 topHeight];
}

id objc_msgSend_travelDirection(void *a1, const char *a2, ...)
{
  return [a1 travelDirection];
}

id objc_msgSend_walkableSide(void *a1, const char *a2, ...)
{
  return [a1 walkableSide];
}