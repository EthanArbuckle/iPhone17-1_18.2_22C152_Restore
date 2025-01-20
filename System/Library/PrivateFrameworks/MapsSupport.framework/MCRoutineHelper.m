@interface MCRoutineHelper
- (MCRoutineHelper)init;
- (void)findMUIDsForPlaceInferences:(id)a3 analytics:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)findNearbySignificantLocationsAtLocation:(id)a3 inRadius:(double)a4 numberOfVisitsBucketSize:(unsigned int)a5 completionQueue:(id)a6 finishedHandler:(id)a7;
- (void)findSignificantLocationWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)findSignificantLocationWithLocation:(id)a3 numberOfVisitsBucketSize:(unsigned int)a4 completionQueue:(id)a5 finishedHandler:(id)a6;
- (void)findWorkLocationsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
@end

@implementation MCRoutineHelper

- (MCRoutineHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)MCRoutineHelper;
  v2 = [(MCRoutineHelper *)&v6 init];
  if (v2)
  {
    v3 = (RTRoutineManager *)objc_alloc_init((Class)RTRoutineManager);
    routineManager = v2->_routineManager;
    v2->_routineManager = v3;
  }
  return v2;
}

- (void)findSignificantLocationWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  routineManager = self->_routineManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F788;
  v11[3] = &unk_10001C9E0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(RTRoutineManager *)routineManager _maps_fetchAllLocationsOfInterestWithHandler:v11];
}

- (void)findSignificantLocationWithLocation:(id)a3 numberOfVisitsBucketSize:(unsigned int)a4 completionQueue:(id)a5 finishedHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 latLng];
  id v14 = objc_alloc((Class)CLLocation);
  [v13 lat];
  double v16 = v15;
  [v13 lng];
  id v18 = [v14 initWithLatitude:v16 longitude:v17];
  [v10 horizontalAccuracy];
  double v19 = 10.0;
  if (v20 > 0.0)
  {
    [v10 horizontalAccuracy];
    double v19 = v21;
  }
  routineManager = self->_routineManager;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000F9B4;
  v25[3] = &unk_10001D8B0;
  unsigned int v28 = a4;
  id v26 = v11;
  id v27 = v12;
  id v23 = v12;
  id v24 = v11;
  [(RTRoutineManager *)routineManager fetchLocationsOfInterestWithinDistance:v18 ofLocation:v25 withHandler:v19];
}

- (void)findNearbySignificantLocationsAtLocation:(id)a3 inRadius:(double)a4 numberOfVisitsBucketSize:(unsigned int)a5 completionQueue:(id)a6 finishedHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = [a3 latLng];
  id v15 = objc_alloc((Class)CLLocation);
  [v14 lat];
  double v17 = v16;
  [v14 lng];
  id v19 = [v15 initWithLatitude:v17 longitude:v18];
  routineManager = self->_routineManager;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000FCA8;
  v23[3] = &unk_10001D8D8;
  unsigned int v26 = a5;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v21 = v13;
  id v22 = v12;
  [(RTRoutineManager *)routineManager fetchLocationsOfInterestWithinDistance:v19 ofLocation:v23 withHandler:a4];
}

- (void)findWorkLocationsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  routineManager = self->_routineManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FFB8;
  v11[3] = &unk_10001C9E0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(RTRoutineManager *)routineManager _maps_fetchLocationsOfInterestWithTypes:1 handler:v11];
}

- (void)findMUIDsForPlaceInferences:(id)a3 analytics:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v32 = a4;
  dispatch_queue_t queue = (dispatch_queue_t)a5;
  id v31 = a6;
  id v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
  id v11 = dispatch_group_create();
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v12)
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        double v17 = [v16 _loiIdentifier];
        BOOL v18 = v17 == 0;

        if (v18)
        {
          id v22 = [v16 placemark];
          id v23 = [v22 _geoMapItemHandle];
          BOOL v24 = v23 == 0;

          if (v24)
          {
            id v21 = GEOGetPOIBusynessLog();
            ++v33;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138477827;
              v66 = v16;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "PlaceInference %{private}@ has no loi identifier or map item handle, unable to resolve muid", buf, 0xCu);
            }
          }
          else
          {
            dispatch_group_enter(v11);
            id v25 = +[GEOMapService sharedService];
            unsigned int v26 = [v16 placemark];
            id v27 = [v26 _geoMapItemHandle];
            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_1000109A0;
            v47[3] = &unk_10001D950;
            v48 = v11;
            v52 = v63;
            v49 = queue;
            id v50 = v10;
            v51 = v16;
            [v25 resolveMapItemFromHandle:v27 completionHandler:v47];

            ++v34;
            id v21 = v48;
          }
        }
        else
        {
          dispatch_group_enter(v11);
          routineManager = self->_routineManager;
          double v20 = [v16 _loiIdentifier];
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = sub_1000106F0;
          v53[3] = &unk_10001D928;
          v54 = v11;
          v58 = v64;
          v55 = queue;
          id v56 = v10;
          v57 = v16;
          [(RTRoutineManager *)routineManager fetchLocationOfInterestWithIdentifier:v20 withHandler:v53];

          ++v13;
          id v21 = v54;
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v13 = 0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010C24;
  block[3] = &unk_10001D978;
  v43 = v63;
  uint64_t v44 = v13;
  uint64_t v45 = v34;
  uint64_t v46 = v33;
  id v41 = v31;
  v42 = v64;
  id v39 = v32;
  id v40 = v10;
  id v28 = v10;
  id v29 = v31;
  id v30 = v32;
  dispatch_group_notify(v11, queue, block);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLOIs, 0);

  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end