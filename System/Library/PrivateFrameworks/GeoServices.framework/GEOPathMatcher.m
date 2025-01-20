@interface GEOPathMatcher
- (BOOL)_isFailedRange:(GEOPolylineCoordinateRange)a3;
- (BOOL)_isRangeValid:(GEOPolylineCoordinateRange)a3;
- (BOOL)_verifySegmentDistanceFromRoute:(id)a3 segmentIndex:(int64_t)a4 requestedPathRange:(GEOPolylineCoordinateRange)a5;
- (BOOL)forceSync;
- (BOOL)shouldDropDivergingSegments;
- (BOOL)shouldSaveInternalInfo;
- (GEOApplicationAuditToken)auditToken;
- (GEOPathMatcher)initWithRoute:(id)a3 auditToken:(id)a4;
- (GEOPathMatcher)initWithRoute:(id)a3 auditToken:(id)a4 loggingIdentifier:(id)a5;
- (GEOPolylineCoordinateRange)_validateInputRange:(GEOPolylineCoordinateRange)a3 finishedHandler:(id)a4 callbackQueue:(id)a5;
- (double)preloadDistance;
- (id).cxx_construct;
- (id)_cachedSegments;
- (id)_matchedSegmentsInRange:(GEOPolylineCoordinateRange)a3 ofMatchedSegments:(id)a4;
- (id)_supportPointForRouteCoordinate:(PolylineCoordinate)a3 isRangeStart:(BOOL)a4;
- (id)_supportPointsForRange:(GEOPolylineCoordinateRange)a3;
- (id)_updateCacheWithNewSegments:(id)a3 range:(GEOPolylineCoordinateRange)a4;
- (id)_zilchMatchedSegmentsForRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4;
- (id)internalInfos;
- (id)matchedSegmentsFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4;
- (void)_addCoordinatesFromRoad:(id)a3 routeCoordinates:(id)a4 offsetFromStartOfPath:(double)a5 errorScale:(double)a6 offsetFromPathToCurrentPoint:(double *)a7 outCoordinates:(void *)a8;
- (void)_callbackWithMatchedSegments:(id)a3 range:(GEOPolylineCoordinateRange)a4 handler:(id)a5 callbackQueue:(id)a6;
- (void)_clearZilchSnappedPathsForRoute:(id)a3;
- (void)_decodePathForRoute:(void *)a3 supportPoints:(void *)a4 roadNetwork:(uint64_t)a5 internalInfo:(void *)a6;
- (void)_matchRouteOnQueueForRange:(GEOPolylineCoordinateRange)a3 finishedHandler:(id)a4 callbackQueue:(id)a5;
- (void)_updateSupportPointsForNoMatchRanges:(id)a3 decodeRange:(GEOPolylineCoordinateRange)a4;
- (void)_zilchMatchedSegmentsForRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 handler:(id)a5;
- (void)dealloc;
- (void)matchRouteFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 finishedHandler:(id)a5;
- (void)matchRouteFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 finishedHandler:(id)a5 callbackQueue:(id)a6;
- (void)setForceSync:(BOOL)a3;
- (void)setInternalInfos:(id)a3;
- (void)setPreloadDistance:(double)a3;
- (void)setShouldDropDivergingSegments:(BOOL)a3;
- (void)setShouldSaveInternalInfo:(BOOL)a3;
@end

@implementation GEOPathMatcher

- (id)_zilchMatchedSegmentsForRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke;
  v13[3] = &unk_1E53DD380;
  PolylineCoordinate v16 = start;
  PolylineCoordinate v17 = end;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  [v8 forEachSnappedPath:v13];
  v10 = v15;
  id v11 = v9;

  return v11;
}

void __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 mapMatchingSection];
  if ((*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4))
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24))(v4);
    unsigned int v6 = *(_DWORD *)(a1 + 56);
    if (v6 >= v5 && (v6 != v5 || *(float *)(a1 + 60) >= *((float *)&v5 + 1)))
    {
      uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32))(v4);
      unsigned int v8 = *(_DWORD *)(a1 + 48);
      if (v8 <= v7 && (v8 != v7 || *(float *)(a1 + 52) <= *((float *)&v7 + 1)))
      {
        uint64_t v79 = 0;
        v80 = &v79;
        uint64_t v81 = 0x3032000000;
        v82 = __Block_byref_object_copy__12;
        v83 = __Block_byref_object_dispose__12;
        id v84 = 0;
        uint64_t v70 = 0;
        v71 = &v70;
        uint64_t v72 = 0x4812000000;
        v73 = __Block_byref_object_copy__1;
        v74 = __Block_byref_object_dispose__2;
        v75 = "";
        v77 = 0;
        uint64_t v78 = 0;
        v76 = 0;
        uint64_t v64 = 0;
        v65 = (float *)&v64;
        uint64_t v66 = 0x3812000000;
        v67 = __Block_byref_object_copy__3;
        v68 = __Block_byref_object_dispose__4;
        v69 = "";
        uint64_t v57 = 0;
        v58 = &v57;
        uint64_t v59 = 0x3812000000;
        v60 = __Block_byref_object_copy__6;
        v61 = __Block_byref_object_dispose__7;
        v62 = "";
        unint64_t v63 = 0xBF80000000000000;
        id v9 = [v3 section];
        v10 = v9;
        if (v9)
        {
          [v9 bounds];
          double v11 = *((double *)&v54 + 1);
          double v12 = *(double *)&v54;
          double v14 = *((double *)&v55 + 1);
          double v13 = *(double *)&v56;
        }
        else
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v54 = 0u;
          double v13 = 0.0;
          double v14 = 0.0;
          double v11 = 0.0;
          double v12 = 0.0;
        }

        uint64_t v39 = MEMORY[0x1E4F143A8];
        uint64_t v40 = 3221225472;
        v41 = __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke_9;
        v42 = &unk_1E53DD358;
        long long v53 = *(_OWORD *)(a1 + 48);
        double v49 = v12;
        double v50 = v11;
        double v51 = v14;
        double v52 = v13;
        v45 = &v70;
        v46 = &v79;
        id v43 = *(id *)(a1 + 32);
        id v44 = *(id *)(a1 + 40);
        v47 = &v64;
        v48 = &v57;
        (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 40))(v4, &v39);
        if (v80[5])
        {
          double v15 = GEOCoordinate2DForMapPoint(v12 + v65[12] * v14, v11 + (float)(1.0 - v65[13]) * v13);
          double v17 = v15;
          uint64_t v18 = v16;
          v19 = v71;
          uint64_t v20 = v58[6];
          unint64_t v21 = v71[7];
          unint64_t v22 = v71[8];
          if (v21 >= v22)
          {
            uint64_t v24 = v71[6];
            uint64_t v25 = (uint64_t)(v21 - v24) >> 5;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 59) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v27 = v22 - v24;
            if (v27 >> 4 > v26) {
              unint64_t v26 = v27 >> 4;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v28 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28) {
              v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)(v71 + 8), v28);
            }
            else {
              v29 = 0;
            }
            v30 = &v29[32 * v25];
            v31 = &v29[32 * v28];
            *(double *)v30 = v17;
            *((void *)v30 + 1) = v18;
            *((void *)v30 + 2) = 0;
            *((void *)v30 + 3) = v20;
            v23 = v30 + 32;
            v33 = (char *)v19[6];
            v32 = (char *)v19[7];
            if (v32 != v33)
            {
              do
              {
                long long v34 = *((_OWORD *)v32 - 1);
                *((_OWORD *)v30 - 2) = *((_OWORD *)v32 - 2);
                *((_OWORD *)v30 - 1) = v34;
                v30 -= 32;
                v32 -= 32;
              }
              while (v32 != v33);
              v32 = (char *)v19[6];
            }
            v19[6] = (uint64_t)v30;
            v19[7] = (uint64_t)v23;
            v19[8] = (uint64_t)v31;
            if (v32) {
              operator delete(v32);
            }
          }
          else
          {
            *(double *)unint64_t v21 = v15;
            *(void *)(v21 + 8) = v16;
            v23 = (void *)(v21 + 32);
            *(void *)(v21 + 16) = 0;
            *(void *)(v21 + 24) = v20;
          }
          v19[7] = (uint64_t)v23;
          v35 = [GEOMapFeatureRoad alloc];
          v36 = -[GEOMapFeatureRoad initWithFeature:](v35, "initWithFeature:", v80[5], v39, v40, v41, v42, v43);
          v37 = [GEOMatchedPathSegment alloc];
          v38 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:](v37, "initWithRoute:road:coordinates:roadRange:", *(void *)(a1 + 32), v36, v71 + 6, 0xBF80000000000000, 0xBF80000000000000);
          [*(id *)(a1 + 40) addObject:v38];
        }
        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v70, 8);
        if (v76)
        {
          v77 = v76;
          operator delete(v76);
        }
        _Block_object_dispose(&v79, 8);
      }
    }
  }
}

- (void)_clearZilchSnappedPathsForRoute:(id)a3
{
}

uint64_t __74__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range___block_invoke_9(uint64_t a1, float *a2, void *a3, float *a4, uint64_t a5, void *a6)
{
  id v12 = a6;
  unsigned int v13 = *(_DWORD *)(a1 + 120);
  if (v13 >= *(_DWORD *)a4 && (v13 != *(_DWORD *)a4 || *(float *)(a1 + 124) >= a4[1]))
  {
    unsigned int v14 = *(_DWORD *)(a1 + 112);
    if (*(_DWORD *)a5 >= v14 && (*(_DWORD *)a5 != v14 || *(float *)(a5 + 4) >= *(float *)(a1 + 116)))
    {
      double v15 = GEOCoordinate2DForMapPoint(*(double *)(a1 + 80) + *a2 * *(double *)(a1 + 96), *(double *)(a1 + 88) + (float)(1.0 - a2[1]) * *(double *)(a1 + 104));
      double v17 = v15;
      uint64_t v18 = v16;
      v19 = *(void **)(*(void *)(a1 + 48) + 8);
      uint64_t v20 = *(void *)a4;
      unint64_t v21 = v19[7];
      unint64_t v22 = v19[8];
      if (v21 >= v22)
      {
        uint64_t v24 = v19[6];
        uint64_t v25 = (uint64_t)(v21 - v24) >> 5;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 59) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v27 = v22 - v24;
        if (v27 >> 4 > v26) {
          unint64_t v26 = v27 >> 4;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v28 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28) {
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)(v19 + 8), v28);
        }
        else {
          v29 = 0;
        }
        v30 = &v29[32 * v25];
        v31 = &v29[32 * v28];
        *(double *)v30 = v17;
        *((void *)v30 + 1) = v18;
        *((void *)v30 + 2) = 0;
        *((void *)v30 + 3) = v20;
        v23 = v30 + 32;
        v33 = (char *)v19[6];
        v32 = (char *)v19[7];
        if (v32 != v33)
        {
          do
          {
            long long v34 = *((_OWORD *)v32 - 1);
            *((_OWORD *)v30 - 2) = *((_OWORD *)v32 - 2);
            *((_OWORD *)v30 - 1) = v34;
            v30 -= 32;
            v32 -= 32;
          }
          while (v32 != v33);
          v32 = (char *)v19[6];
        }
        v19[6] = v30;
        v19[7] = v23;
        v19[8] = v31;
        if (v32) {
          operator delete(v32);
        }
      }
      else
      {
        *(double *)unint64_t v21 = v15;
        *(void *)(v21 + 8) = v16;
        v23 = (void *)(v21 + 32);
        *(void *)(v21 + 16) = 0;
        *(void *)(v21 + 24) = v20;
      }
      v19[7] = v23;
      uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
      id v36 = *(id *)(v35 + 40);
      if (v36) {
        BOOL v37 = v36 == v12;
      }
      else {
        BOOL v37 = 1;
      }
      if (!v37)
      {
        v38 = [[GEOMapFeatureRoad alloc] initWithFeature:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
        uint64_t v39 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:]([GEOMatchedPathSegment alloc], "initWithRoute:road:coordinates:roadRange:", *(void *)(a1 + 32), v38, *(void *)(*(void *)(a1 + 48) + 8) + 48, 0xBF80000000000000, 0xBF80000000000000);
        [*(id *)(a1 + 40) addObject:v39];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 48);
        uint64_t v40 = *(void **)(*(void *)(a1 + 48) + 8);
        uint64_t v41 = *(void *)a4;
        v42 = (void *)v40[7];
        unint64_t v43 = v40[8];
        if ((unint64_t)v42 >= v43)
        {
          uint64_t v45 = v40[6];
          uint64_t v46 = ((uint64_t)v42 - v45) >> 5;
          unint64_t v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 59) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v48 = v43 - v45;
          if (v48 >> 4 > v47) {
            unint64_t v47 = v48 >> 4;
          }
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v49 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v47;
          }
          if (v49) {
            double v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)(v40 + 8), v49);
          }
          else {
            double v50 = 0;
          }
          double v51 = &v50[32 * v46];
          double v52 = &v50[32 * v49];
          *(double *)double v51 = v17;
          *((void *)v51 + 1) = v18;
          *((void *)v51 + 2) = 0;
          *((void *)v51 + 3) = v41;
          id v44 = v51 + 32;
          long long v54 = (char *)v40[6];
          long long v53 = (char *)v40[7];
          if (v53 != v54)
          {
            do
            {
              long long v55 = *((_OWORD *)v53 - 1);
              *((_OWORD *)v51 - 2) = *((_OWORD *)v53 - 2);
              *((_OWORD *)v51 - 1) = v55;
              v51 -= 32;
              v53 -= 32;
            }
            while (v53 != v54);
            long long v53 = (char *)v40[6];
          }
          v40[6] = v51;
          v40[7] = v44;
          v40[8] = v52;
          if (v53) {
            operator delete(v53);
          }
        }
        else
        {
          *(double *)v42 = v17;
          v42[1] = v18;
          id v44 = v42 + 4;
          v42[2] = 0;
          v42[3] = v41;
        }
        v40[7] = v44;

        uint64_t v35 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      objc_storeStrong((id *)(v35 + 40), a6);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = *a3;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 48) = *(void *)a5;
    }
  }

  return 0;
}

- (void)_zilchMatchedSegmentsForRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 handler:(id)a5
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = a5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = [v33 sections];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  v32 = self;
  if (v10)
  {
    uint64_t v11 = *(void *)v45;
    double v12 = 0.0;
    double v13 = INFINITY;
    double v14 = INFINITY;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v9);
        }
        double v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        unsigned int v18 = [v17 startPointIndex];
        unsigned int v19 = [v17 endPointIndex];
        if (v18 <= end.index)
        {
          BOOL v20 = start.offset > 0.0 && v19 == start.index;
          BOOL v21 = v20;
          BOOL v22 = end.offset < 0.0 && v18 == end.index;
          BOOL v23 = !v22 && v19 >= start.index;
          if (v23 && !v21)
          {
            if (v17)
            {
              [v17 bounds];
              double v25 = *((double *)&v41 + 1);
              double v24 = *(double *)&v41;
            }
            else
            {
              long long v43 = 0u;
              double v25 = 0.0;
              double v24 = 0.0;
              long long v41 = 0u;
              long long v42 = 0u;
            }
            double v13 = GEOMapRectUnion(v13, v14, v12, v15, v24, v25);
            double v14 = v26;
            double v12 = v27;
            double v15 = v28;
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
    double v13 = INFINITY;
    double v14 = INFINITY;
    double v15 = 0.0;
  }

  *(double *)uint64_t v40 = v13;
  *(double *)&v40[1] = v14;
  *(double *)&v40[2] = v12;
  *(double *)&v40[3] = v15;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __82__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range_handler___block_invoke;
  v35[3] = &unk_1E53DD3A8;
  id v29 = v34;
  id v37 = v29;
  v35[4] = v32;
  id v30 = v33;
  id v36 = v30;
  PolylineCoordinate v38 = start;
  PolylineCoordinate v39 = end;
  id v31 = (id)objc_msgSend(v30, "getSnappedPathsForVisibleRect:rectsToSnap:rectsToSnapCount:observer:completionHandler:", v40, 1, v32, v35, v13, v14, v12, v15);
}

void __82__GEOPathMatcher_ZilchCompatibility___zilchMatchedSegmentsForRoute_range_handler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_zilchMatchedSegmentsForRoute:range:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (GEOPathMatcher)initWithRoute:(id)a3 auditToken:(id)a4
{
  return [(GEOPathMatcher *)self initWithRoute:a3 auditToken:a4 loggingIdentifier:@"Default"];
}

- (GEOPathMatcher)initWithRoute:(id)a3 auditToken:(id)a4 loggingIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GEOPathMatcher;
  double v12 = [(GEOPathMatcher *)&v24 init];
  double v13 = v12;
  if (v12)
  {
    BOOL v23 = v12;
    uint64_t v14 = geo_dispatch_queue_create_with_format();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_route, a3);
    objc_storeStrong((id *)&v13->_auditToken, a4);
    v13->_preloadDistance = 1600.0;
    *(_WORD *)&v13->_shouldDropDivergingSegments = 1;
    uint64_t v16 = geo_isolater_create();
    matchedSegmentsIsolater = v13->_matchedSegmentsIsolater;
    v13->_matchedSegmentsIsolater = (geo_isolater *)v16;

    uint64_t v18 = objc_msgSend(v11, "copy", v23);
    loggingIdentifier = v13->_loggingIdentifier;
    v13->_loggingIdentifier = (NSString *)v18;

    uint64_t v20 = geo_isolater_create();
    internalInfosIsolater = v13->_internalInfosIsolater;
    v13->_internalInfosIsolater = (geo_isolater *)v20;
  }
  return v13;
}

- (void)dealloc
{
  if (![(GEOComposedRoute *)self->_route usesRoutingPathPoints]
    && [(GEOComposedRoute *)self->_route usesZilch])
  {
    [(GEOPathMatcher *)self _clearZilchSnappedPathsForRoute:self->_route];
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPathMatcher;
  [(GEOPathMatcher *)&v3 dealloc];
}

- (void)matchRouteFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 finishedHandler:(id)a5
{
}

- (void)matchRouteFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 finishedHandler:(id)a5 callbackQueue:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (-[GEOPathMatcher _isRangeValid:](self, "_isRangeValid:", a3, a4))
  {
    if ([(GEOComposedRoute *)self->_route usesRoutingPathPoints])
    {
      queue = self->_queue;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_21;
      v22[3] = &unk_1E53E8210;
      v22[4] = self;
      PolylineCoordinate v25 = a3;
      PolylineCoordinate v26 = a4;
      id v24 = v10;
      BOOL v23 = v11;
      dispatch_async(queue, v22);
    }
    else if ([(GEOComposedRoute *)self->_route usesZilch])
    {
      route = self->_route;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_2;
      v27[3] = &unk_1E53E81E8;
      id v29 = v10;
      double v28 = v11;
      -[GEOPathMatcher _zilchMatchedSegmentsForRoute:range:handler:](self, "_zilchMatchedSegmentsForRoute:range:handler:", route, a3, a4, v27);
    }
    else
    {
      uint64_t v20 = GEOGetGEOPathMatcherLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        loggingIdentifier = self->_loggingIdentifier;
        *(_DWORD *)buf = 138412290;
        id v33 = loggingIdentifier;
        _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "(%@) GEOPathMatcher only supports routes using routing path points or zilch points", buf, 0xCu);
      }

      if (v10) {
        (*((void (**)(id, void))v10 + 2))(v10, 0);
      }
    }
  }
  else
  {
    double v13 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      double v15 = self->_loggingIdentifier;
      uint64_t v16 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v14);
      uint64_t v18 = GEOPolylineCoordinateAsString(*(void *)&a4, 1, 0, v17);
      *(_DWORD *)buf = 138412803;
      id v33 = v15;
      __int16 v34 = 2112;
      uint64_t v35 = v16;
      __int16 v36 = 2113;
      id v37 = v18;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEBUG, "(%@) Match requested with invalid range [%@] to [%{private}@], returning 0 segments", buf, 0x20u);
    }
    if (v10)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke;
      block[3] = &unk_1E53DDD88;
      id v31 = v10;
      dispatch_async(v11, block);
    }
  }
}

uint64_t __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_3;
    v6[3] = &unk_1E53D8530;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__GEOPathMatcher_matchRouteFromStart_toEnd_finishedHandler_callbackQueue___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_matchRouteOnQueueForRange:finishedHandler:callbackQueue:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (id)matchedSegmentsFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (-[GEOPathMatcher _isRangeValid:](self, "_isRangeValid:"))
  {
    if (![(GEOComposedRoute *)self->_route usesRoutingPathPoints]
      && [(GEOComposedRoute *)self->_route usesZilch])
    {
      -[GEOPathMatcher _zilchMatchedSegmentsForRoute:range:handler:](self, "_zilchMatchedSegmentsForRoute:range:handler:", self->_route, a3, a4, 0);
      id v7 = -[GEOPathMatcher _zilchMatchedSegmentsForRoute:range:](self, "_zilchMatchedSegmentsForRoute:range:", self->_route, a3, a4);
      goto LABEL_32;
    }
    double v14 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      loggingIdentifier = self->_loggingIdentifier;
      double v17 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v15);
      GEOPolylineCoordinateAsString(*(void *)&a4, 1, 0, v18);
      unsigned int v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412803;
      *(void *)&uint8_t buf[4] = loggingIdentifier;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2113;
      id v33 = v19;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "(%@) Requesting match from [%{private}@] to [%{private}@]", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v33 = __Block_byref_object_copy__64;
    __int16 v34 = __Block_byref_object_dispose__64;
    -[GEOPathMatcher _cachedSegments]((uint64_t)self);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = -[GEOPathMatcher _matchedSegmentsInRange:ofMatchedSegments:](self, "_matchedSegmentsInRange:ofMatchedSegments:", a3, a4, *(void *)(*(void *)&buf[8] + 40));
    if ([v7 count])
    {
      uint64_t v20 = [v7 firstObject];
      if ([v20 pointCount])
      {
        uint64_t v21 = [v20 startRouteCoordinate];
        BOOL v22 = *((float *)&v21 + 1) == a3.offset || *((float *)&v21 + 1) < a3.offset;
        if (v21 == a3.index) {
          BOOL v23 = v22;
        }
        else {
          BOOL v23 = v21 < a3.index;
        }
      }
      else
      {
        BOOL v23 = 0;
      }
      id v24 = [v7 lastObject];
      if ([v24 pointCount])
      {
        uint64_t v25 = [v24 endRouteCoordinate];
        BOOL v26 = a4.offset == *((float *)&v25 + 1) || a4.offset < *((float *)&v25 + 1);
        if (a4.index == v25) {
          BOOL v27 = v26;
        }
        else {
          BOOL v27 = a4.index < v25;
        }

        if (v23 && v27)
        {
LABEL_31:
          _Block_object_dispose(buf, 8);

          goto LABEL_32;
        }
      }
      else
      {
      }
    }
    [(GEOPathMatcher *)self matchRouteFromStart:a3 toEnd:a4 finishedHandler:0];
    if (self->_forceSync)
    {
      queue = self->_queue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __49__GEOPathMatcher_matchedSegmentsFromStart_toEnd___block_invoke;
      v31[3] = &unk_1E53D8210;
      v31[4] = self;
      v31[5] = buf;
      dispatch_sync(queue, v31);
      uint64_t v29 = -[GEOPathMatcher _matchedSegmentsInRange:ofMatchedSegments:](self, "_matchedSegmentsInRange:ofMatchedSegments:", a3, a4, *(void *)(*(void *)&buf[8] + 40));

      id v7 = (void *)v29;
    }
    goto LABEL_31;
  }
  id v8 = GEOGetGEOPathMatcherLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = self->_loggingIdentifier;
    id v11 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v9);
    GEOPolylineCoordinateAsString(*(void *)&a4, 1, 0, v12);
    double v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412803;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2113;
    id v33 = v13;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "(%@) Match requested with invalid range [%{private}@] to [%{private}@], returning 0 segments", buf, 0x20u);
  }
  id v7 = 0;
LABEL_32:

  return v7;
}

- (id)_cachedSegments
{
  if (a1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = &v3;
    uint64_t v5 = 0x3032000000;
    unsigned int v6 = __Block_byref_object_copy__64;
    id v7 = __Block_byref_object_dispose__64;
    id v8 = 0;
    geo_isolate_sync();
    id v1 = (id)v4[5];
    _Block_object_dispose(&v3, 8);
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

void __49__GEOPathMatcher_matchedSegmentsFromStart_toEnd___block_invoke(uint64_t a1)
{
  uint64_t v2 = -[GEOPathMatcher _cachedSegments](*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (GEOPolylineCoordinateRange)_validateInputRange:(GEOPolylineCoordinateRange)a3 finishedHandler:(id)a4 callbackQueue:(id)a5
{
  uint64_t end = (uint64_t)a3.end;
  uint64_t start = (uint64_t)a3.start;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v57 = a4;
  id v58 = a5;
  double v9 = [(GEOComposedRoute *)self->_route coordinates];
  unint64_t v10 = [v9 pathIndexForRouteCoordinate:start];

  id v11 = [(GEOComposedRoute *)self->_route coordinates];
  unint64_t v12 = [v11 pathsCount];

  if (v10 >= v12)
  {
    double v13 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      loggingIdentifier = self->_loggingIdentifier;
      uint64_t v16 = GEOPolylineCoordinateAsString(start, 1, 0, v14);
      *(_DWORD *)buf = 138412547;
      v60 = loggingIdentifier;
      __int16 v61 = 2113;
      id v62 = v16;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "(%@) Error finding path index for start coordinate %{private}@. Matching from start of route", buf, 0x16u);
    }
    uint64_t start = 0;
  }
  double v17 = [(GEOComposedRoute *)self->_route coordinates];
  unint64_t v18 = [v17 pathIndexForRouteCoordinate:end];

  unsigned int v19 = [(GEOComposedRoute *)self->_route coordinates];
  LOBYTE(v18) = v18 < [v19 pathsCount];

  if ((v18 & 1) == 0)
  {
    uint64_t v20 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = self->_loggingIdentifier;
      BOOL v23 = GEOPolylineCoordinateAsString(end, 1, 0, v21);
      *(_DWORD *)buf = 138412547;
      v60 = v22;
      __int16 v61 = 2113;
      id v62 = v23;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_ERROR, "(%@) Error finding path index for end coordinate %{private}@. Matching to end of route", buf, 0x16u);
    }
    uint64_t end = [(GEOComposedRoute *)self->_route pointCount] - 1;
  }
  id v24 = -[GEOPathMatcher _cachedSegments]((uint64_t)self);
  if ([v24 count])
  {
    uint64_t v25 = [v24 firstObject];
    BOOL v26 = [v24 lastObject];
    uint64_t v27 = [v25 startRouteCoordinate];
    uint64_t v28 = [v26 endRouteCoordinate];
    unsigned int v29 = v28;
    if (v28 == start)
    {
      if (*((float *)&v28 + 1) < *((float *)&start + 1)) {
        goto LABEL_19;
      }
    }
    else if (v28 < start)
    {
      goto LABEL_19;
    }
    if (end == v27)
    {
      if (*((float *)&end + 1) < *((float *)&v27 + 1)) {
        goto LABEL_19;
      }
    }
    else if (end < v27)
    {
      goto LABEL_19;
    }
    if (v27 == start)
    {
      if (*((float *)&v27 + 1) > *((float *)&start + 1))
      {
LABEL_43:
        if (*((float *)&start + 1) >= *((float *)&v27 + 1))
        {
LABEL_55:
          if (*((float *)&start + 1) >= *((float *)&v27 + 1))
          {
LABEL_56:
            unint64_t v30 = v28 & 0xFFFFFFFF00000000;
            unint64_t v31 = end & 0xFFFFFFFF00000000;
            goto LABEL_20;
          }
LABEL_58:
          unint64_t v30 = start & 0xFFFFFFFF00000000;
          unint64_t v31 = v27 & 0xFFFFFFFF00000000;
          unsigned int v29 = start;
          goto LABEL_21;
        }
        goto LABEL_46;
      }
    }
    else if (v27 >= start)
    {
      goto LABEL_45;
    }
    if (end == v28)
    {
      if (*((float *)&end + 1) <= *((float *)&v28 + 1))
      {
LABEL_40:
        unsigned int v29 = 0;
        LODWORD(v27) = 0;
        unint64_t v30 = 0xBF80000000000000;
        unint64_t v31 = 0xBF80000000000000;
        goto LABEL_21;
      }
    }
    else if (end < v28)
    {
      goto LABEL_40;
    }
    if (v27 == start) {
      goto LABEL_43;
    }
LABEL_45:
    if (start >= v27) {
      goto LABEL_57;
    }
LABEL_46:
    if (v28 == end)
    {
      if (*((float *)&v28 + 1) >= *((float *)&end + 1))
      {
LABEL_54:
        if (v27 == start) {
          goto LABEL_55;
        }
LABEL_57:
        if (start >= v27) {
          goto LABEL_56;
        }
        goto LABEL_58;
      }
    }
    else if (v28 >= end)
    {
      goto LABEL_54;
    }
LABEL_19:
    unint64_t v30 = start & 0xFFFFFFFF00000000;
    unint64_t v31 = end & 0xFFFFFFFF00000000;
    unsigned int v29 = start;
LABEL_20:
    LODWORD(v27) = end;
LABEL_21:

    goto LABEL_22;
  }
  unint64_t v30 = start & 0xFFFFFFFF00000000;
  unint64_t v31 = end & 0xFFFFFFFF00000000;
  unsigned int v29 = start;
  LODWORD(v27) = end;
LABEL_22:

  if (*((float *)&v30 + 1) < 0.0) {
    goto LABEL_35;
  }
  float v32 = *((float *)&v31 + 1);
  if (*((float *)&v31 + 1) < 0.0) {
    goto LABEL_35;
  }
  if (v29 == v27)
  {
    if (*((float *)&v30 + 1) <= *((float *)&v31 + 1)) {
      goto LABEL_26;
    }
LABEL_35:
    id v37 = -[GEOPathMatcher _cachedSegments]((uint64_t)self);
    -[GEOPathMatcher _callbackWithMatchedSegments:range:handler:callbackQueue:](self, "_callbackWithMatchedSegments:range:handler:callbackQueue:", v37, start, end, v57, v58);
    unint64_t v38 = 0xBF80000000000000;
    uint64_t v34 = 0xBF80000000000000;
    goto LABEL_36;
  }
  if (v29 >= v27) {
    goto LABEL_35;
  }
LABEL_26:
  unint64_t v33 = v31 & 0xFFFFFFFF00000000 | v27;
  uint64_t v34 = v33;
  if (self->_preloadDistance <= 0.0) {
    goto LABEL_51;
  }
  id v35 = [(GEOComposedRoute *)self->_route coordinates];
  uint64_t v36 = [v35 routeCoordinateForDistance:start afterRouteCoordinate:self->_preloadDistance];

  if (v27 != v36)
  {
    uint64_t v34 = v33;
    if (v27 >= v36) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  uint64_t v34 = v33;
  if (v32 != *((float *)&v36 + 1))
  {
    uint64_t v34 = v33;
    if (v32 < *((float *)&v36 + 1)) {
LABEL_50:
    }
      uint64_t v34 = v36;
  }
LABEL_51:
  unint64_t v38 = v30 & 0xFFFFFFFF00000000 | v29;
  id v37 = GEOGetGEOPathMatcherLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    long long v42 = self->_loggingIdentifier;
    GEOPolylineCoordinateAsString(start, 1, 0, v41);
    id v56 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsString(end, 1, 0, v43);
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    [(GEOComposedRoute *)self->_route distanceBetweenRouteCoordinate:start andRouteCoordinate:end];
    double v45 = v44;
    GEOPolylineCoordinateAsString(v38, 1, 0, v44);
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    GEOPolylineCoordinateAsString(v33, 1, 0, v47);
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    [(GEOComposedRoute *)self->_route distanceBetweenRouteCoordinate:v38 andRouteCoordinate:v33];
    double v50 = v49;
    GEOPolylineCoordinateAsString(v38, 1, 0, v49);
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    long long v53 = GEOPolylineCoordinateAsString(v34, 1, 0, v52);
    [(GEOComposedRoute *)self->_route distanceBetweenRouteCoordinate:v38 andRouteCoordinate:v34];
    *(_DWORD *)buf = 138414594;
    v60 = v42;
    __int16 v61 = 2112;
    id v62 = v56;
    __int16 v63 = 2112;
    id v64 = v55;
    __int16 v65 = 2048;
    double v66 = v45;
    __int16 v67 = 2112;
    id v68 = v46;
    __int16 v69 = 2112;
    id v70 = v48;
    __int16 v71 = 2048;
    double v72 = v50;
    __int16 v73 = 2112;
    id v74 = v51;
    __int16 v75 = 2112;
    v76 = v53;
    __int16 v77 = 2048;
    uint64_t v78 = v54;
    _os_log_impl(&dword_188D96000, v37, OS_LOG_TYPE_INFO, "(%@) Requesting path decoder from [%@] to [%@], %0.1f meters\n\tUncached range: [%@] to [%@], %0.1f meters\n\tDecode range: [%@] to [%@], %0.1f meters", buf, 0x66u);
  }
LABEL_36:

  PolylineCoordinate v39 = (PolylineCoordinate)v38;
  PolylineCoordinate v40 = (PolylineCoordinate)v34;
  result.uint64_t end = v40;
  result.uint64_t start = v39;
  return result;
}

- (id)_supportPointForRouteCoordinate:(PolylineCoordinate)a3 isRangeStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(GEOCoordinateArraySupportPoint);
  [(GEOCoordinateArraySupportPoint *)v7 setRouteCoordinate:a3];
  int v8 = !v4;
  if (!a3.index) {
    int v8 = 0;
  }
  [(GEOComposedRoute *)self->_route courseAtRouteCoordinateIndex:a3.index - v8];
  -[GEOCoordinateArraySupportPoint setHeading:](v7, "setHeading:");

  return v7;
}

- (id)_supportPointsForRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end = a3.end;
  PolylineCoordinate start = a3.start;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [(GEOComposedRoute *)self->_route coordinates];
  int v8 = objc_msgSend(v7, "supportPointsWithinRange:", start, end);
  [v6 addObjectsFromArray:v8];

  if ([v6 count])
  {
    double v9 = [v6 firstObject];
    uint64_t v10 = [v9 routeCoordinate];
    uint64_t v11 = v10;
    unint64_t v12 = HIDWORD(*(unint64_t *)&start);
    float offset = start.offset;
    if (start.index == v10)
    {
      if (start.offset == *((float *)&v10 + 1))
      {

        goto LABEL_19;
      }

      if (start.offset >= *((float *)&v11 + 1))
      {
LABEL_19:
        double v15 = GEOGetGEOPathMatcherLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          loggingIdentifier = self->_loggingIdentifier;
          unint64_t v38 = [v6 firstObject];
          uint64_t v39 = [v38 routeCoordinate];
          double v41 = GEOPolylineCoordinateAsString(v39, 1, 0, v40);
          *(_DWORD *)buf = 138412546;
          v76 = loggingIdentifier;
          __int16 v77 = 2112;
          id v78 = v41;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "(%@) Using start support point on route: [%@]", buf, 0x16u);
        }
        goto LABEL_28;
      }
    }
    else
    {

      if (start.index >= v11) {
        goto LABEL_19;
      }
    }
  }
  else
  {
    unint64_t v12 = HIDWORD(*(unint64_t *)&start);
    float offset = start.offset;
  }
  float v14 = floorf(offset);
  if (offset < 0.0) {
    float v14 = *(float *)&v12;
  }
  double v15 = [(GEOPathMatcher *)self _supportPointForRouteCoordinate:start.index | ((unint64_t)LODWORD(v14) << 32) isRangeStart:1];
  [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:[v15 routeCoordinate]];
  double v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = -[GEOPathMatcher _cachedSegments]((uint64_t)self);
  double v21 = [v20 lastObject];

  if (v21
    && [v21 isPartialEnd]
    && (uint64_t v22 = [v21 endRouteCoordinate],
        vabds_f32(offset + (float)start.index, (float)v22 + *((float *)&v22 + 1)) < 0.001))
  {
    BOOL v23 = [v21 road];
    id v24 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = self->_loggingIdentifier;
      double v72 = v24;
      uint64_t v26 = [v21 range];
      GEOPolylineCoordinateRangeAsString(v26, v27, v28);
      id v74 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v73 = [v23 internalRoadName];
      uint64_t v71 = [v23 signedMuid];
      uint64_t v29 = [v23 formOfWay];
      if v29 < 0x17 && ((0x7EDDDFu >> v29))
      {
        unint64_t v31 = v25;
        unint64_t v30 = off_1E53E8230[(int)v29];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
        unint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unint64_t v31 = v25;
      }
      long long v42 = v30;
      uint64_t v43 = [v23 roadClass];
      if (v43 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v43);
        double v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v44 = off_1E53E82E8[(int)v43];
      }
      double v45 = v44;
      [v15 heading];
      *(_DWORD *)buf = 138414339;
      v76 = v31;
      __int16 v77 = 2112;
      id v78 = v74;
      __int16 v79 = 2112;
      v80 = v73;
      __int16 v81 = 2048;
      id v24 = v72;
      uint64_t v82 = v71;
      __int16 v83 = 2112;
      id v84 = v42;
      __int16 v85 = 2112;
      v86 = v45;
      __int16 v87 = 2049;
      v88 = v17;
      __int16 v89 = 2049;
      uint64_t v90 = v19;
      __int16 v91 = 2048;
      uint64_t v92 = v46;
      _os_log_impl(&dword_188D96000, v72, OS_LOG_TYPE_INFO, "(%@) Using synthetic start support point from last cached road [%@]: %@ | %lld | %@ | %@ | %{private}f, %{private}f | %0.1f°", buf, 0x5Cu);
    }
    [v15 setRoadID:[v23 signedMuid]];
  }
  else
  {
    BOOL v23 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      float v32 = self->_loggingIdentifier;
      uint64_t v33 = [v15 routeCoordinate];
      id v35 = GEOPolylineCoordinateAsString(v33, 1, 0, v34);
      [v15 heading];
      *(_DWORD *)buf = 138413315;
      v76 = v32;
      __int16 v77 = 2112;
      id v78 = v35;
      __int16 v79 = 2049;
      v80 = v17;
      __int16 v81 = 2049;
      uint64_t v82 = v19;
      __int16 v83 = 2048;
      id v84 = v36;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_INFO, "(%@) Using synthetic start support point with no muid hint: [%@] | %{private}f, %{private}f | %0.1f°", buf, 0x34u);
    }
  }

  [v6 insertObject:v15 atIndex:0];
LABEL_28:

  if ([v6 count])
  {
    double v47 = [v6 lastObject];
    uint64_t v48 = [v47 routeCoordinate];
    unint64_t v49 = HIDWORD(*(unint64_t *)&end);
    float v50 = end.offset;
    if (v48 == end.index)
    {
      if (*((float *)&v48 + 1) == end.offset)
      {

        goto LABEL_43;
      }
      BOOL v64 = *((float *)&v48 + 1) < end.offset;

      if (!v64)
      {
LABEL_43:
        long long v53 = GEOGetGEOPathMatcherLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          __int16 v65 = self->_loggingIdentifier;
          double v66 = [v6 lastObject];
          uint64_t v67 = [v66 routeCoordinate];
          __int16 v69 = GEOPolylineCoordinateAsString(v67, 1, 0, v68);
          *(_DWORD *)buf = 138412546;
          v76 = v65;
          __int16 v77 = 2112;
          id v78 = v69;
          _os_log_impl(&dword_188D96000, v53, OS_LOG_TYPE_INFO, "(%@) Using end support point on route: [%@]", buf, 0x16u);
        }
        goto LABEL_45;
      }
    }
    else
    {
      BOOL v51 = v48 < end.index;

      if (!v51) {
        goto LABEL_43;
      }
    }
  }
  else
  {
    unint64_t v49 = HIDWORD(*(unint64_t *)&end);
    float v50 = end.offset;
  }
  if (v50 >= 0.0)
  {
    *(_DWORD *)buf = 0;
    if (modff(v50, (float *)buf) <= 0.0)
    {
      unsigned int index = end.index;
    }
    else
    {
      LODWORD(v49) = *(_DWORD *)buf;
      unsigned int index = end.index + 1;
    }
  }
  else
  {
    unsigned int index = end.index;
  }
  long long v53 = [(GEOPathMatcher *)self _supportPointForRouteCoordinate:index | ((unint64_t)v49 << 32) isRangeStart:0];
  [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:[v53 routeCoordinate]];
  id v55 = v54;
  uint64_t v57 = v56;
  id v58 = GEOGetGEOPathMatcherLog();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    uint64_t v59 = self->_loggingIdentifier;
    uint64_t v60 = [v53 routeCoordinate];
    id v62 = GEOPolylineCoordinateAsString(v60, 1, 0, v61);
    [v53 heading];
    *(_DWORD *)buf = 138413315;
    v76 = v59;
    __int16 v77 = 2112;
    id v78 = v62;
    __int16 v79 = 2049;
    v80 = v55;
    __int16 v81 = 2049;
    uint64_t v82 = v57;
    __int16 v83 = 2048;
    id v84 = v63;
    _os_log_impl(&dword_188D96000, v58, OS_LOG_TYPE_INFO, "(%@) Using synthetic end support point: [%@] | %{private}f, %{private}f | %0.1f°", buf, 0x34u);
  }
  [v6 addObject:v53];
LABEL_45:

  -[GEOPathMatcher _updateSupportPointsForNoMatchRanges:decodeRange:](self, "_updateSupportPointsForNoMatchRanges:decodeRange:", v6, start, end);

  return v6;
}

- (void)_updateSupportPointsForNoMatchRanges:(id)a3 decodeRange:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  id v7 = a3;
  if (v7)
  {
    uint64_t v25 = self;
    int v8 = [(GEOComposedRoute *)self->_route coordinates];
    double v9 = [v8 noMatchRanges];

    for (unint64_t i = 0; ; ++i)
    {
      if (i >= [v9 count])
      {

        goto LABEL_43;
      }
      uint64_t v11 = [v9 coordinateRangeAtIndex:i];
      uint64_t v13 = v11;
      uint64_t v14 = v12;
      float v15 = *((float *)&v11 + 1);
      if (end.index == v11)
      {
        if (end.offset <= *((float *)&v11 + 1)) {
          continue;
        }
      }
      else if (end.index < v11)
      {
        continue;
      }
      if (v12 == start.index)
      {
        if (*((float *)&v12 + 1) <= start.offset) {
          continue;
        }
      }
      else if (v12 < start.index)
      {
        continue;
      }
      for (unint64_t j = 0; ; ++j)
      {
        if (j >= [v7 count]) {
          goto LABEL_25;
        }
        double v17 = [v7 objectAtIndexedSubscript:j];
        uint64_t v18 = [v17 routeCoordinate];
        if (v13 < v18 || v13 == v18 && v15 < *((float *)&v18 + 1)) {
          break;
        }
      }
      if (start.index != v13) {
        break;
      }
      PolylineCoordinate v19 = start;
      if (start.offset != v15)
      {
        PolylineCoordinate v19 = start;
        if (start.offset < v15) {
          goto LABEL_23;
        }
      }
LABEL_24:
      uint64_t v20 = [(GEOPathMatcher *)v25 _supportPointForRouteCoordinate:v19 isRangeStart:1];
      [v20 setMatchType:1];
      [v7 insertObject:v20 atIndex:j];

LABEL_25:
      while (j < [v7 count])
      {
        double v21 = [v7 objectAtIndexedSubscript:j];
        uint64_t v22 = [v21 routeCoordinate];
        if (v14 < v22
          || v14 == v22 && *((float *)&v14 + 1) < *((float *)&v22 + 1))
        {
          BOOL v23 = [(GEOPathMatcher *)v25 _supportPointForRouteCoordinate:v14 isRangeStart:0];
          [v23 setMatchType:2];
          [v7 insertObject:v23 atIndex:j];

          if (v23) {
            goto LABEL_35;
          }
          break;
        }

        ++j;
      }
      if (end.index >= v14 && (end.index != v14 || end.offset > *((float *)&v14 + 1)))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: decodeRange.end <= noMatchRange.end", v27, 2u);
        }
        id v24 = GEOGetGEOPathMatcherLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "No-match end support point should have been added in the middle of support points array.", buf, 2u);
        }
      }
      BOOL v23 = [(GEOPathMatcher *)v25 _supportPointForRouteCoordinate:end isRangeStart:0];
      [v23 setMatchType:2];
      [v7 addObject:v23];
LABEL_35:
    }
    PolylineCoordinate v19 = start;
    if (start.index >= v13) {
      goto LABEL_24;
    }
LABEL_23:
    PolylineCoordinate v19 = (PolylineCoordinate)v13;
    goto LABEL_24;
  }
LABEL_43:
}

- (void)_matchRouteOnQueueForRange:(GEOPolylineCoordinateRange)a3 finishedHandler:(id)a4 callbackQueue:(id)a5
{
  PolylineCoordinate end = a3.end;
  PolylineCoordinate start = a3.start;
  uint64_t v335 = *MEMORY[0x1E4F143B8];
  id v267 = a4;
  id v268 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v296 = self;
  if (self->_route)
  {
    uint64_t v9 = -[GEOPathMatcher _validateInputRange:finishedHandler:callbackQueue:](self, "_validateInputRange:finishedHandler:callbackQueue:", start, end, v267, v268);
    uint64_t v12 = v9;
    LODWORD(v13) = HIDWORD(v9);
    if (*((float *)&v9 + 1) >= 0.0)
    {
      uint64_t v14 = v10;
      LODWORD(v11) = HIDWORD(v10);
      if (*((float *)&v10 + 1) >= 0.0)
      {
        if (v9 == v10)
        {
          if (*((float *)&v9 + 1) > *((float *)&v10 + 1)) {
            goto LABEL_285;
          }
LABEL_10:
          -[GEOPathMatcher setInternalInfos:](v296, "setInternalInfos:", 0, v13, v11);
          uint64_t v264 = (uint64_t)end;
          uint64_t v265 = (uint64_t)start;
          if (v296->_shouldSaveInternalInfo)
          {
            uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          }
          else
          {
            uint64_t v16 = 0;
          }
          -[GEOPathMatcher _supportPointsForRange:](v296, "_supportPointsForRange:", v12, v14);
          uint64_t v307 = 0;
          v306 = 0;
          v305 = (uint64_t *)&v306;
          long long v301 = 0u;
          long long v302 = 0u;
          long long v303 = 0u;
          long long v304 = 0u;
          obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [obj countByEnumeratingWithState:&v301 objects:v327 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v302;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v302 != v18) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v20 = *(void **)(*((void *)&v301 + 1) + 8 * i);
                -[GEOComposedRoute pointAtRouteCoordinate:](v296->_route, "pointAtRouteCoordinate:", [v20 routeCoordinate]);
                uint64_t v22 = v21;
                uint64_t v24 = v23;
                uint64_t v26 = v25;
                uint64_t v27 = [v20 roadID];
                uint64_t v28 = v27;
                uint64_t v29 = v306;
                unint64_t v30 = &v306;
                unint64_t v31 = &v306;
                if (v306)
                {
                  while (1)
                  {
                    while (1)
                    {
                      unint64_t v31 = (uint64_t **)v29;
                      uint64_t v32 = v29[4];
                      if (v32 <= v27) {
                        break;
                      }
                      uint64_t v29 = *v31;
                      unint64_t v30 = v31;
                      if (!*v31) {
                        goto LABEL_26;
                      }
                    }
                    if (v32 >= v27) {
                      break;
                    }
                    uint64_t v29 = v31[1];
                    if (!v29)
                    {
                      unint64_t v30 = v31 + 1;
                      goto LABEL_26;
                    }
                  }
                  double v34 = (uint64_t *)v31;
                }
                else
                {
LABEL_26:
                  double v34 = (uint64_t *)operator new(0x40uLL);
                  v34[4] = v28;
                  v34[5] = 0;
                  v34[6] = 0;
                  v34[7] = 0;
                  *double v34 = 0;
                  v34[1] = 0;
                  v34[2] = (uint64_t)v31;
                  __CFString *v30 = v34;
                  uint64_t v33 = v34;
                  if (*v305)
                  {
                    v305 = (uint64_t *)*v305;
                    uint64_t v33 = *v30;
                  }
                  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v306, v33);
                  ++v307;
                }
                v34[5] = v22;
                v34[6] = v24;
                v34[7] = v26;
              }
              uint64_t v17 = [obj countByEnumeratingWithState:&v301 objects:v327 count:16];
            }
            while (v17);
          }
          v270 = v16;

          GEOPathMatcherRoadNetwork::GEOPathMatcherRoadNetwork((uint64_t)buf, [(GEOComposedRoute *)v296->_route transportType], v296->_auditToken, (uint64_t *)&v305);
          long long v299 = 0u;
          long long v300 = 0u;
          long long v297 = 0u;
          long long v298 = 0u;
          id v273 = obj;
          uint64_t v35 = [v273 countByEnumeratingWithState:&v297 objects:v323 count:16];
          if (!v35)
          {
            id v284 = 0;
            v275 = 0;
            goto LABEL_283;
          }
          id v284 = 0;
          v275 = 0;
          uint64_t v278 = *(void *)v298;
          uint64_t v279 = v35;
          p_failedRanges = &v296->_failedRanges;
          while (1)
          {
            uint64_t v291 = 0;
            do
            {
              if (*(void *)v298 != v278) {
                objc_enumerationMutation(v273);
              }
              uint64_t v36 = *(void **)(*((void *)&v297 + 1) + 8 * v291);
              if (!v284)
              {
                id v284 = v36;
                goto LABEL_261;
              }
              if ([v284 matchType] != 1 || objc_msgSend(v36, "matchType") == 2)
              {
                uint64_t v282 = [v284 routeCoordinate];
                uint64_t v294 = [v36 routeCoordinate];
                if (!-[GEOPathMatcher _isFailedRange:](v296, "_isFailedRange:", v282, v294))
                {
                  v272 = v36;
                  if ([v284 matchType] == 1 && objc_msgSend(v36, "matchType") == 2)
                  {
                    id v37 = GEOGetGEOPathMatcherLog();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                    {
                      loggingIdentifier = v296->_loggingIdentifier;
                      GEOPolylineCoordinateAsString(v282, 1, 0, v38);
                      id v40 = (id)objc_claimAutoreleasedReturnValue();
                      long long v42 = GEOPolylineCoordinateAsString(v294, 1, 0, v41);
                      *(_DWORD *)v316 = 138412802;
                      *(void *)&v316[4] = loggingIdentifier;
                      *(_WORD *)&v316[12] = 2112;
                      *(void *)&v316[14] = v40;
                      *(_WORD *)&v316[22] = 2112;
                      v317 = v42;
                      _os_log_impl(&dword_188D96000, v37, OS_LOG_TYPE_DEFAULT, "(%@) Path matcher skipped range: [%@] to [%@]", v316, 0x20u);
                    }
                    id v43 = -[GEOMatchedPathSegment initUnmatchedSegmentWithRoute:range:isFailedSegment:]([GEOMatchedPathSegment alloc], "initUnmatchedSegmentWithRoute:range:isFailedSegment:", v296->_route, v282, v294, 0);
                    id v313 = v43;
                    double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v313 count:1];

                    v280 = 0;
                    goto LABEL_255;
                  }
                  if (v296->_shouldSaveInternalInfo) {
                    v280 = objc_alloc_init(GEOPathMatcherInternalInfo);
                  }
                  else {
                    v280 = 0;
                  }
                  route = v296->_route;
                  v315[0] = v284;
                  v315[1] = v36;
                  uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v315 count:2];
                  [(GEOPathMatcher *)(uint64_t)v316 _decodePathForRoute:route supportPoints:v46 roadNetwork:(uint64_t)buf internalInfo:v280];

                  double v47 = [(GEOComposedRoute *)v296->_route coordinates];
                  id v48 = v325;
                  id v292 = v47;
                  id v293 = v48;
                  if (*(void **)&v316[16] == v317)
                  {
                    double v44 = 0;
                    goto LABEL_220;
                  }
                  double v49 = *(double *)v316;
                  if (*(double *)v316 < 0.0 || *(double *)v316 > 1.0)
                  {
                    v256 = GEOGetGEOPathMatcherLog();
                    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
                    {
                      v257 = v296->_loggingIdentifier;
                      *(_DWORD *)v328 = 138412546;
                      *(void *)&v328[4] = v257;
                      *(_WORD *)&v328[12] = 2048;
                      *(double *)&v328[14] = v49;
                      _os_log_impl(&dword_188D96000, v256, OS_LOG_TYPE_ERROR, "(%@) RoadNetworkPath.origin_segment_fraction (%f) is outside of the unexpected range [0, 1]. Clamping and attempting to continue...", v328, 0x16u);
                    }

                    double v258 = 0.0;
                    if (v49 >= 0.0) {
                      double v258 = v49;
                    }
                    if (v258 <= 1.0) {
                      double v49 = v258;
                    }
                    else {
                      double v49 = 1.0;
                    }
                  }
                  double v50 = *(double *)&v316[8];
                  if (*(double *)&v316[8] < 0.0 || *(double *)&v316[8] > 1.0)
                  {
                    v259 = GEOGetGEOPathMatcherLog();
                    if (os_log_type_enabled(v259, OS_LOG_TYPE_ERROR))
                    {
                      v260 = v296->_loggingIdentifier;
                      *(_DWORD *)v328 = 138412546;
                      *(void *)&v328[4] = v260;
                      *(_WORD *)&v328[12] = 2048;
                      *(double *)&v328[14] = v50;
                      _os_log_impl(&dword_188D96000, v259, OS_LOG_TYPE_ERROR, "(%@) RoadNetworkPath.destination_segment_fraction (%f) is outside of the unexpected range [0, 1]. Clamping and attempting to continue...", v328, 0x16u);
                    }

                    double v261 = 0.0;
                    if (v50 >= 0.0) {
                      double v261 = v50;
                    }
                    if (v261 <= 1.0) {
                      double v50 = v261;
                    }
                    else {
                      double v50 = 1.0;
                    }
                  }
                  uint64_t v51 = (uint64_t)v317 - *(void *)&v316[16];
                  if (v49 > v50 && (unint64_t)v51 <= 0x3F)
                  {
                    v254 = GEOGetGEOPathMatcherLog();
                    if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
                    {
                      v255 = v296->_loggingIdentifier;
                      *(_DWORD *)v328 = 138412802;
                      *(void *)&v328[4] = v255;
                      *(_WORD *)&v328[12] = 2048;
                      *(double *)&v328[14] = v49;
                      *(_WORD *)&v328[22] = 2048;
                      *(double *)&v328[24] = v50;
                      _os_log_impl(&dword_188D96000, v254, OS_LOG_TYPE_ERROR, "(%@) RoadNetworkPath.origin_segment_fraction (%f) is greater than RoadNetworkPath.destination_segment_fraction (%f) on a single segment result. This is a path-codec library error. Clamping and attempting to continue...", v328, 0x20u);
                    }

                    uint64_t v51 = (uint64_t)v317 - *(void *)&v316[16];
                    double v50 = v49;
                  }
                  if (fabs(v49 + -1.0) >= 0.01)
                  {
                    uint64_t v281 = 0;
                  }
                  else
                  {
                    double v52 = GEOGetGEOPathMatcherLog();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v54 = v296->_loggingIdentifier;
                      id v55 = GEOPolylineCoordinateAsString(v282, 1, 0, v53);
                      uint64_t v57 = GEOPolylineCoordinateAsString(v294, 1, 0, v56);
                      *(_DWORD *)v328 = 138413826;
                      *(void *)&v328[4] = v54;
                      *(_WORD *)&v328[12] = 2112;
                      *(void *)&v328[14] = v55;
                      *(_WORD *)&v328[22] = 2112;
                      *(void *)&v328[24] = v57;
                      *(_WORD *)&v328[32] = 1024;
                      *(_DWORD *)&v328[34] = 0;
                      *(_WORD *)&v328[38] = 1024;
                      *(_DWORD *)&v328[40] = (((unint64_t)v317 - *(void *)&v316[16]) >> 5) - 1;
                      *(_WORD *)&v328[44] = 2048;
                      *(void *)&v328[46] = *(void *)v316;
                      *(_WORD *)&v328[54] = 2048;
                      *(void *)&v328[56] = *(void *)&v316[8];
                      _os_log_impl(&dword_188D96000, v52, OS_LOG_TYPE_INFO, "(%@) Ignoring zero length segment returned from path-codec API: [%@] to [%@] | index: %d/%d, path fraction: %0.8f, %0.8f", v328, 0x40u);
                    }
                    double v49 = 0.0;
                    uint64_t v281 = 1;
                  }
                  uint64_t v58 = v51 >> 5;
                  uint64_t v59 = v58 - 1;
                  if (fabs(v50) < 0.01)
                  {
                    uint64_t v60 = GEOGetGEOPathMatcherLog();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                    {
                      id v62 = v296->_loggingIdentifier;
                      __int16 v63 = GEOPolylineCoordinateAsString(v282, 1, 0, v61);
                      __int16 v65 = GEOPolylineCoordinateAsString(v294, 1, 0, v64);
                      *(_DWORD *)v328 = 138413826;
                      *(void *)&v328[4] = v62;
                      *(_WORD *)&v328[12] = 2112;
                      *(void *)&v328[14] = v63;
                      *(_WORD *)&v328[22] = 2112;
                      *(void *)&v328[24] = v65;
                      *(_WORD *)&v328[32] = 1024;
                      *(_DWORD *)&v328[34] = v58 - 1;
                      *(_WORD *)&v328[38] = 1024;
                      *(_DWORD *)&v328[40] = (((unint64_t)v317 - *(void *)&v316[16]) >> 5) - 1;
                      *(_WORD *)&v328[44] = 2048;
                      *(void *)&v328[46] = *(void *)v316;
                      *(_WORD *)&v328[54] = 2048;
                      *(void *)&v328[56] = *(void *)&v316[8];
                      _os_log_impl(&dword_188D96000, v60, OS_LOG_TYPE_INFO, "(%@) Ignoring zero length segment returned from path-codec API: [%@] to [%@] | index: %d/%d, path fraction: %0.8f, %0.8f", v328, 0x40u);
                    }
                    uint64_t v59 = v58 - 2;
                    double v50 = 1.0;
                  }
                  double v66 = 0.0;
                  uint64_t v283 = v59;
                  if (v281 <= v59)
                  {
                    uint64_t v67 = 0;
                    uint64_t v68 = 32 * v281;
                    double v69 = 0.0;
                    while (1)
                    {
                      long long v70 = *(_OWORD *)(*(void *)&v316[16] + v68 + 16);
                      v312[0] = *(_OWORD *)(*(void *)&v316[16] + v68);
                      v312[1] = v70;
                      uint64_t v71 = [v293 roadForKey:v312];
                      [v71 length];
                      double v73 = v72;
                      if (!v67)
                      {
                        [v71 length];
                        double v73 = v73 - v74 * v49;
                      }
                      if (v281 - v59 == v67) {
                        break;
                      }

                      double v69 = v69 + v73;
                      --v67;
                      v68 += 32;
                    }
                    [v71 length];
                    double v76 = v75;

                    double v66 = v69 + v73 - v76 * (1.0 - v50);
                  }
                  [v292 distanceFromStartToRouteCoordinate:v282];
                  double v290 = v77;
                  [v292 distanceFromStartToRouteCoordinate:v294];
                  double v79 = v78;
                  double v311 = 0.0;
                  v271 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:((uint64_t)v317 - *(void *)&v316[16]) >> 5];
                  uint64_t v80 = v281;
                  if (v281 > v59) {
                    goto LABEL_218;
                  }
                  char v269 = 0;
                  double v285 = (v79 - v290) / v66;
                  while (2)
                  {
                    __int16 v81 = (_OWORD *)(*(void *)&v316[16] + 32 * v80);
                    long long v82 = v81[1];
                    v310[0] = *v81;
                    v310[1] = v82;
                    __int16 v83 = [v293 roadForKey:v310];
                    id v84 = v83;
                    if (!v83)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)v328 = 0;
                        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: road != nullptr", v328, 2u);
                      }
LABEL_209:
                      if (v269)
                      {
                        *(_OWORD *)__p = 0u;
                        memset(v309, 0, sizeof(v309));
                        id v212 = v271;
                        uint64_t v213 = [v212 countByEnumeratingWithState:__p objects:v328 count:16];
                        if (v213)
                        {
                          uint64_t v214 = **(void **)&v309[0];
                          do
                          {
                            for (uint64_t j = 0; j != v213; ++j)
                            {
                              if (**(void **)&v309[0] != v214) {
                                objc_enumerationMutation(v212);
                              }
                              [*((id *)__p[1] + j) setIsDivergentSegment:1];
                            }
                            uint64_t v213 = [v212 countByEnumeratingWithState:__p objects:v328 count:16];
                          }
                          while (v213);
                        }
                      }
LABEL_218:
                      v211 = v271;
                      [v271 count];
                      double v44 = v271;
LABEL_219:

LABEL_220:
                      if ([v44 count])
                      {
                        v216 = [v44 firstObject];
                        id v217 = [v216 road];

                        v218 = GEOGetGEOPathMatcherLog();
                        if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
                        {
                          v219 = v296->_loggingIdentifier;
                          int v220 = [v44 count];
                          GEOPolylineCoordinateAsString(v282, 1, 0, v221);
                          id v222 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v294, 1, 0, v223);
                          id v295 = (id)objc_claimAutoreleasedReturnValue();
                          v224 = [v217 internalRoadName];
                          uint64_t v225 = [v217 signedMuid];
                          uint64_t v226 = [v217 formOfWay];
                          if v226 < 0x17 && ((0x7EDDDFu >> v226))
                          {
                            v227 = off_1E53E8230[(int)v226];
                          }
                          else
                          {
                            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v226);
                            v227 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          v236 = v227;
                          uint64_t v237 = [v217 roadClass];
                          if (v237 >= 0xA)
                          {
                            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v237);
                            v238 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          }
                          else
                          {
                            v238 = off_1E53E82E8[(int)v237];
                          }
                          *(_DWORD *)v328 = 138414082;
                          *(void *)&v328[4] = v219;
                          *(_WORD *)&v328[12] = 1024;
                          *(_DWORD *)&v328[14] = v220;
                          *(_WORD *)&v328[18] = 2112;
                          *(void *)&v328[20] = v222;
                          *(_WORD *)&v328[28] = 2112;
                          *(void *)&v328[30] = v295;
                          *(_WORD *)&v328[38] = 2112;
                          *(void *)&v328[40] = v224;
                          *(_WORD *)&v328[48] = 2048;
                          *(void *)&v328[50] = v225;
                          *(_WORD *)&v328[58] = 2112;
                          *(void *)&v328[60] = v236;
                          *(_WORD *)v329 = 2112;
                          *(void *)&v329[2] = v238;
                          _os_log_impl(&dword_188D96000, v218, OS_LOG_TYPE_INFO, "(%@) Path matching completed with %d road segments for range: [%@] to [%@]\nFirst road: %@ | %lld | %@ | %@", v328, 0x4Eu);
                        }
                      }
                      else
                      {
                        v229 = v296->_failedRanges.__end_;
                        value = v296->_failedRanges.__end_cap_.__value_;
                        if (v229 >= value)
                        {
                          uint64_t v231 = v229 - p_failedRanges->__begin_;
                          unint64_t v232 = v231 + 1;
                          if ((unint64_t)(v231 + 1) >> 60) {
                            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                          }
                          uint64_t v233 = (char *)value - (char *)p_failedRanges->__begin_;
                          if (v233 >> 3 > v232) {
                            unint64_t v232 = v233 >> 3;
                          }
                          if ((unint64_t)v233 >= 0x7FFFFFFFFFFFFFF0) {
                            unint64_t v234 = 0xFFFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v234 = v232;
                          }
                          if (v234) {
                            v235 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v296->_failedRanges.__end_cap_, v234);
                          }
                          else {
                            v235 = 0;
                          }
                          v239 = (uint64_t *)&v235[16 * v231];
                          uint64_t *v239 = v282;
                          v239[1] = v294;
                          begin = v296->_failedRanges.__begin_;
                          v240 = v296->_failedRanges.__end_;
                          v242 = (GEOPolylineCoordinateRange *)v239;
                          if (v240 != begin)
                          {
                            do
                            {
                              v242[-1] = v240[-1];
                              --v242;
                              --v240;
                            }
                            while (v240 != begin);
                            v240 = p_failedRanges->__begin_;
                          }
                          v230 = (GEOPolylineCoordinateRange *)(v239 + 2);
                          v296->_failedRanges.__begin_ = v242;
                          v296->_failedRanges.__end_ = (GEOPolylineCoordinateRange *)(v239 + 2);
                          v296->_failedRanges.__end_cap_.__value_ = (GEOPolylineCoordinateRange *)&v235[16 * v234];
                          if (v240) {
                            operator delete(v240);
                          }
                        }
                        else
                        {
                          v229->PolylineCoordinate start = (PolylineCoordinate)v282;
                          v229->PolylineCoordinate end = (PolylineCoordinate)v294;
                          v230 = v229 + 1;
                        }
                        v296->_failedRanges.__end_ = v230;
                        v243 = GEOGetGEOPathMatcherLog();
                        if (os_log_type_enabled(v243, OS_LOG_TYPE_ERROR))
                        {
                          v245 = v296->_loggingIdentifier;
                          GEOPolylineCoordinateAsString(v282, 1, 0, v244);
                          id v246 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v294, 1, 0, v247);
                          id v248 = (id)objc_claimAutoreleasedReturnValue();
                          GEOPolylineCoordinateAsString(v265, 1, 0, v249);
                          id v250 = (id)objc_claimAutoreleasedReturnValue();
                          v252 = GEOPolylineCoordinateAsString(v264, 1, 0, v251);
                          *(_DWORD *)v328 = 138413314;
                          *(void *)&v328[4] = v245;
                          *(_WORD *)&v328[12] = 2112;
                          *(void *)&v328[14] = v246;
                          *(_WORD *)&v328[22] = 2112;
                          *(void *)&v328[24] = v248;
                          *(_WORD *)&v328[32] = 2112;
                          *(void *)&v328[34] = v250;
                          *(_WORD *)&v328[42] = 2112;
                          *(void *)&v328[44] = v252;
                          _os_log_impl(&dword_188D96000, v243, OS_LOG_TYPE_ERROR, "(%@) Path matching failed for range: [%@] to [%@] (Requested range was [%@] to [%@])", v328, 0x34u);
                        }
                        id v217 = -[GEOMatchedPathSegment initUnmatchedSegmentWithRoute:range:isFailedSegment:]([GEOMatchedPathSegment alloc], "initUnmatchedSegmentWithRoute:range:isFailedSegment:", v296->_route, v282, v294, 1);
                        id v314 = v217;
                        [MEMORY[0x1E4F1C978] arrayWithObjects:&v314 count:1];
                        double v44 = v218 = v44;
                      }

                      std::__hash_table<std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<maps::path_codec::Coordinate>>>>::~__hash_table((uint64_t)&v322);
                      if (v320)
                      {
                        v321 = v320;
                        operator delete(v320);
                      }
                      if (v318)
                      {
                        v319 = v318;
                        operator delete(v318);
                      }
                      if (*(void *)&v316[16])
                      {
                        v317 = *(void **)&v316[16];
                        operator delete(*(void **)&v316[16]);
                      }
LABEL_255:
                      if (!v275 && v44)
                      {
                        v275 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSObject count](v44, "count"));
                      }
                      [v275 addObjectsFromArray:v44];
                      if (v280)
                      {
                        objc_storeStrong((id *)&v280->_matchedSegments, v44);
                        [v270 addObject:v280];
                      }
                      id v253 = v272;

                      id v284 = v253;
                      goto LABEL_261;
                    }
                    if ((unint64_t)[v83 coordinateCount] <= 1)
                    {
                      __int16 v85 = GEOGetGEOPathMatcherLog();
                      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                      {
                        v86 = v296->_loggingIdentifier;
                        __int16 v87 = [v84 debugDescription];
                        *(_DWORD *)v328 = 138412546;
                        *(void *)&v328[4] = v86;
                        *(_WORD *)&v328[12] = 2112;
                        *(void *)&v328[14] = v87;
                        _os_log_impl(&dword_188D96000, v85, OS_LOG_TYPE_ERROR, "(%@) Road has fewer than 2 coordinates, skipping. %@", v328, 0x16u);
                      }
                      goto LABEL_199;
                    }
                    __p[1] = 0;
                    __p[0] = 0;
                    *(void *)&v309[0] = 0;
                    unint64_t v88 = [v84 coordinateCount];
                    __int16 v89 = __p[0];
                    if (v88 > (uint64_t)(*(void *)&v309[0] - (unint64_t)__p[0]) >> 5)
                    {
                      if (v88 >> 59) {
                        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                      }
                      uint64_t v90 = __p[1];
                      __int16 v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v88);
                      uint64_t v93 = (char *)__p[1];
                      v94 = (char *)__p[0];
                      v95 = &v91[(v90 - v89) & 0xFFFFFFFFFFFFFFE0];
                      if (__p[1] != __p[0])
                      {
                        do
                        {
                          long long v96 = *((_OWORD *)v93 - 1);
                          *((_OWORD *)v95 - 2) = *((_OWORD *)v93 - 2);
                          *((_OWORD *)v95 - 1) = v96;
                          v95 -= 32;
                          v93 -= 32;
                        }
                        while (v93 != v94);
                        uint64_t v93 = v94;
                      }
                      __p[0] = v95;
                      __p[1] = &v91[(v90 - v89) & 0xFFFFFFFFFFFFFFE0];
                      *(void *)&v309[0] = &v91[32 * v92];
                      if (v93) {
                        operator delete(v93);
                      }
                    }
                    unsigned int v97 = [v84 coordinateCount] - 1;
                    if (v80 == v281 || v80 == v283)
                    {
                      double v286 = 0.0;
                      if (v80 == v281)
                      {
                        [v84 length];
                        double v286 = v49 * v100;
                      }
                      if (v80 == v283)
                      {
                        [v84 length];
                        double v102 = v50 * v101;
                      }
                      else
                      {
                        double v102 = 1.79769313e308;
                      }
                      if (v80 == v281)
                      {
                        uint64_t v103 = 0;
                        uint64_t v104 = 0;
                        double v105 = 0.0;
                        while (1)
                        {
                          if (v104 + 1 >= (unint64_t)[v84 coordinateCount])
                          {
                            uint64_t v99 = 0;
                            uint64_t v276 = 0;
                            uint64_t v123 = v104 + 1;
                            double v118 = 0.0;
                            goto LABEL_140;
                          }
                          double v106 = v102;
                          double v107 = v50;
                          double v108 = v49;
                          v109 = (double *)([v84 coordinates3d] + v103);
                          v110 = (double *)([v84 coordinates3d] + v103);
                          double v112 = *v109;
                          double v111 = v109[1];
                          double v114 = v110[3];
                          double v113 = v110[4];
                          double v115 = GEOCalculateDistanceRadius(*v109, v111, v114, v113, 6367000.0);
                          if (v105 + v115 > v286) {
                            break;
                          }
                          ++v104;
                          v103 += 24;
                          double v105 = v105 + v115;
                          double v49 = v108;
                          double v50 = v107;
                          double v102 = v106;
                        }
                        double v287 = v105 + v115 - v286;
                        double v129 = v114 + (v112 - v114) * (v287 / v115);
                        double v130 = v113 + (v111 - v113) * (v287 / v115);
                        double v277 = v287 / v115;
                        double v131 = v110[5] + (v109[2] - v110[5]) * (v287 / v115);
                        v132 = (double *)__p[1];
                        if (__p[1] >= (void *)*(void *)&v309[0])
                        {
                          int64_t v135 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                          unint64_t v136 = v135 + 1;
                          if ((unint64_t)(v135 + 1) >> 59) {
                            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                          }
                          int64_t v137 = *(void *)&v309[0] - (unint64_t)__p[0];
                          if ((uint64_t)(*(void *)&v309[0] - (unint64_t)__p[0]) >> 4 > v136) {
                            unint64_t v136 = v137 >> 4;
                          }
                          if ((unint64_t)v137 >= 0x7FFFFFFFFFFFFFE0) {
                            unint64_t v138 = 0x7FFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v138 = v136;
                          }
                          double v102 = v106;
                          if (v138) {
                            v139 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v138);
                          }
                          else {
                            v139 = 0;
                          }
                          v145 = (double *)&v139[32 * v135];
                          double *v145 = v129;
                          v145[1] = v130;
                          v145[2] = v131;
                          *((void *)v145 + 3) = v282;
                          v146 = (char *)__p[1];
                          v147 = (char *)__p[0];
                          v148 = v145;
                          double v49 = v108;
                          double v50 = v107;
                          if (__p[1] != __p[0])
                          {
                            do
                            {
                              long long v149 = *((_OWORD *)v146 - 1);
                              *((_OWORD *)v148 - 2) = *((_OWORD *)v146 - 2);
                              *((_OWORD *)v148 - 1) = v149;
                              v148 -= 4;
                              v146 -= 32;
                            }
                            while (v146 != v147);
                            v146 = v147;
                          }
                          double v118 = v287;
                          double v134 = v277;
                          v133 = v145 + 4;
                          __p[0] = v148;
                          __p[1] = v145 + 4;
                          *(void *)&v309[0] = &v139[32 * v138];
                          if (v146) {
                            operator delete(v146);
                          }
                        }
                        else
                        {
                          *(double *)__p[1] = v129;
                          v132[1] = v130;
                          v132[2] = v131;
                          v133 = v132 + 4;
                          *((void *)v132 + 3) = v282;
                          double v49 = v108;
                          double v50 = v107;
                          double v102 = v106;
                          double v118 = v287;
                          double v134 = v287 / v115;
                        }
                        uint64_t v123 = v104 + 1;
                        __p[1] = v133;
                        float v150 = v134;
                        float v151 = 1.0 - v150;
                        uint64_t v152 = vcvtms_u32_f32(v151) + v104;
                        float v153 = v151 - (float)floorf(v151);
                        if (v151 < 1.0) {
                          uint64_t v99 = v104;
                        }
                        else {
                          uint64_t v99 = v152;
                        }
                        if (v151 >= 1.0) {
                          float v151 = v153;
                        }
                        uint64_t v276 = LODWORD(v151);
                      }
                      else
                      {
                        uint64_t v116 = [v84 coordinates3d];
                        uint64_t v117 = [v84 coordinates3d];
                        double v118 = GEOCalculateDistanceRadius(*(double *)v116, *(double *)(v116 + 8), *(double *)(v117 + 24), *(double *)(v117 + 32), 6367000.0);
                        *(_OWORD *)v328 = *(_OWORD *)v116;
                        *(void *)&v328[16] = *(void *)(v116 + 16);
                        uint64_t v119 = [v292 routeCoordinateForDistanceAfterStart:v290 + v311 * v285];
                        uint64_t v120 = v119;
                        v121 = __p[1];
                        if (__p[1] >= (void *)*(void *)&v309[0])
                        {
                          int64_t v124 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                          unint64_t v125 = v124 + 1;
                          if ((unint64_t)(v124 + 1) >> 59) {
                            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                          }
                          int64_t v126 = *(void *)&v309[0] - (unint64_t)__p[0];
                          if ((uint64_t)(*(void *)&v309[0] - (unint64_t)__p[0]) >> 4 > v125) {
                            unint64_t v125 = v126 >> 4;
                          }
                          if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFE0) {
                            unint64_t v127 = 0x7FFFFFFFFFFFFFFLL;
                          }
                          else {
                            unint64_t v127 = v125;
                          }
                          if (v127) {
                            v128 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v127);
                          }
                          else {
                            v128 = 0;
                          }
                          v140 = &v128[32 * v124];
                          *(_OWORD *)v140 = *(_OWORD *)v328;
                          *((void *)v140 + 2) = *(void *)&v328[16];
                          *((void *)v140 + 3) = v120;
                          v141 = (char *)__p[1];
                          v142 = (char *)__p[0];
                          v143 = v140;
                          if (__p[1] != __p[0])
                          {
                            do
                            {
                              long long v144 = *((_OWORD *)v141 - 1);
                              *((_OWORD *)v143 - 2) = *((_OWORD *)v141 - 2);
                              *((_OWORD *)v143 - 1) = v144;
                              v143 -= 32;
                              v141 -= 32;
                            }
                            while (v141 != v142);
                            v141 = v142;
                          }
                          v122 = v140 + 32;
                          __p[0] = v143;
                          __p[1] = v140 + 32;
                          *(void *)&v309[0] = &v128[32 * v127];
                          if (v141) {
                            operator delete(v141);
                          }
                        }
                        else
                        {
                          *(_OWORD *)__p[1] = *(_OWORD *)v328;
                          v121[2] = *(void *)&v328[16];
                          v121[3] = v119;
                          v122 = v121 + 4;
                        }
                        uint64_t v99 = 0;
                        uint64_t v276 = 0;
                        __p[1] = v122;
                        double v105 = 0.0;
                        uint64_t v123 = 1;
                      }
LABEL_140:
                      uint64_t v98 = 0;
                      unint64_t v154 = v123;
                      do
                      {
                        if (v154 >= [v84 coordinateCount]) {
                          break;
                        }
                        uint64_t v155 = [v84 coordinates3d];
                        uint64_t v156 = [v84 coordinates3d];
                        unint64_t v157 = v155 + 24 * v154;
                        v158 = (float64x2_t *)(v157 - 24);
                        v159 = (float64x2_t *)(v156 + 24 * v154);
                        double v160 = GEOCalculateDistanceRadius(*(double *)(v157 - 24), *(double *)(v157 - 16), v159->f64[0], v159->f64[1], 6367000.0);
                        double v105 = v105 + v160;
                        double v161 = v154 == v123 ? v118 : v160;
                        double v162 = v161 + v311;
                        double v311 = v162;
                        if (v105 > v102)
                        {
                          double v167 = (v105 - v102) / v160;
                          unsigned int v97 = v154 - 1;
                          float v168 = v167;
                          float v169 = 1.0 - v168;
                          if ((float)(1.0 - v168) >= 1.0)
                          {
                            v97 += vcvtms_u32_f32(v169);
                            float v169 = v169 - (float)floorf(v169);
                          }
                          float64x2_t v170 = vmlaq_n_f64(*v159, vsubq_f64(*v158, *v159), v167);
                          double v171 = v159[1].f64[0] + (v158[1].f64[0] - v159[1].f64[0]) * v167;
                          v172 = (double *)__p[1];
                          if (__p[1] >= (void *)*(void *)&v309[0])
                          {
                            float64x2_t v288 = v170;
                            int64_t v173 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                            unint64_t v174 = v173 + 1;
                            if ((unint64_t)(v173 + 1) >> 59) {
                              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                            }
                            int64_t v175 = *(void *)&v309[0] - (unint64_t)__p[0];
                            if ((uint64_t)(*(void *)&v309[0] - (unint64_t)__p[0]) >> 4 > v174) {
                              unint64_t v174 = v175 >> 4;
                            }
                            if ((unint64_t)v175 >= 0x7FFFFFFFFFFFFFE0) {
                              unint64_t v176 = 0x7FFFFFFFFFFFFFFLL;
                            }
                            else {
                              unint64_t v176 = v174;
                            }
                            if (v176) {
                              v177 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v176);
                            }
                            else {
                              v177 = 0;
                            }
                            v183 = (double *)&v177[32 * v173];
                            *(float64x2_t *)v183 = v288;
                            v183[2] = v171;
                            *((void *)v183 + 3) = v294;
                            v184 = (char *)__p[1];
                            v185 = (char *)__p[0];
                            v186 = v183;
                            if (__p[1] != __p[0])
                            {
                              do
                              {
                                long long v187 = *((_OWORD *)v184 - 1);
                                *((_OWORD *)v186 - 2) = *((_OWORD *)v184 - 2);
                                *((_OWORD *)v186 - 1) = v187;
                                v186 -= 4;
                                v184 -= 32;
                              }
                              while (v184 != v185);
                              v184 = v185;
                            }
                            v166 = v183 + 4;
                            __p[0] = v186;
                            __p[1] = v183 + 4;
                            *(void *)&v309[0] = &v177[32 * v176];
                            if (v184) {
                              operator delete(v184);
                            }
                          }
                          else
                          {
                            *(float64x2_t *)__p[1] = v170;
                            v172[2] = v171;
                            v166 = v172 + 4;
                            *((void *)v172 + 3) = v294;
                          }
                          uint64_t v98 = LODWORD(v169);
                        }
                        else
                        {
                          *(float64x2_t *)v328 = *v159;
                          *(float64_t *)&v328[16] = v159[1].f64[0];
                          uint64_t v163 = [v292 routeCoordinateForDistanceAfterStart:v290 + v162 * v285];
                          uint64_t v164 = v163;
                          v165 = __p[1];
                          if (__p[1] >= (void *)*(void *)&v309[0])
                          {
                            int64_t v178 = ((char *)__p[1] - (char *)__p[0]) >> 5;
                            unint64_t v179 = v178 + 1;
                            if ((unint64_t)(v178 + 1) >> 59) {
                              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                            }
                            int64_t v180 = *(void *)&v309[0] - (unint64_t)__p[0];
                            if ((uint64_t)(*(void *)&v309[0] - (unint64_t)__p[0]) >> 4 > v179) {
                              unint64_t v179 = v180 >> 4;
                            }
                            if ((unint64_t)v180 >= 0x7FFFFFFFFFFFFFE0) {
                              unint64_t v181 = 0x7FFFFFFFFFFFFFFLL;
                            }
                            else {
                              unint64_t v181 = v179;
                            }
                            if (v181) {
                              v182 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)v309, v181);
                            }
                            else {
                              v182 = 0;
                            }
                            v188 = &v182[32 * v178];
                            *(_OWORD *)v188 = *(_OWORD *)v328;
                            *((void *)v188 + 2) = *(void *)&v328[16];
                            *((void *)v188 + 3) = v164;
                            v189 = (char *)__p[1];
                            v190 = (char *)__p[0];
                            v191 = v188;
                            if (__p[1] != __p[0])
                            {
                              do
                              {
                                long long v192 = *((_OWORD *)v189 - 1);
                                *((_OWORD *)v191 - 2) = *((_OWORD *)v189 - 2);
                                *((_OWORD *)v191 - 1) = v192;
                                v191 -= 32;
                                v189 -= 32;
                              }
                              while (v189 != v190);
                              v189 = v190;
                            }
                            v166 = v188 + 32;
                            __p[0] = v191;
                            __p[1] = v188 + 32;
                            *(void *)&v309[0] = &v182[32 * v181];
                            if (v189) {
                              operator delete(v189);
                            }
                          }
                          else
                          {
                            *(_OWORD *)__p[1] = *(_OWORD *)v328;
                            v165[2] = *(void *)&v328[16];
                            v165[3] = v163;
                            v166 = v165 + 4;
                          }
                        }
                        __p[1] = v166;
                        ++v154;
                      }
                      while (v105 <= v102);
                    }
                    else
                    {
                      [(GEOPathMatcher *)v296 _addCoordinatesFromRoad:v84 routeCoordinates:v292 offsetFromStartOfPath:&v311 errorScale:__p offsetFromPathToCurrentPoint:v290 outCoordinates:v285];
                      uint64_t v98 = 0;
                      uint64_t v99 = 0;
                      uint64_t v276 = 0;
                    }
                    v193 = __p[0];
                    if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x21)
                    {
                      unsigned int v194 = *((_DWORD *)__p[0] + 6);
                      float v195 = *((float *)__p[0] + 7);
                      unsigned int v196 = *((_DWORD *)__p[1] - 2);
                      float v197 = *((float *)__p[1] - 1);
                      if (v194 > v196 || (v194 == v196 ? (BOOL v198 = v195 < v197) : (BOOL v198 = 1), !v198))
                      {
                        v199 = GEOGetGEOPathMatcherLog();
                        if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v289 = v99;
                          v200 = v296->_loggingIdentifier;
                          unint64_t v201 = (unint64_t)v317;
                          uint64_t v202 = *(void *)&v316[16];
                          uint64_t v203 = [v84 roadID];
                          uint64_t v205 = *(void *)__p[0];
                          uint64_t v204 = *((void *)__p[0] + 1);
                          *(_DWORD *)v328 = 138415106;
                          *(void *)&v328[4] = v200;
                          *(_WORD *)&v328[12] = 1024;
                          *(_DWORD *)&v328[14] = v194;
                          *(_WORD *)&v328[18] = 2048;
                          *(double *)&v328[20] = v195;
                          *(_WORD *)&v328[28] = 1024;
                          *(_DWORD *)&v328[30] = v196;
                          *(_WORD *)&v328[34] = 2048;
                          *(double *)&v328[36] = v197;
                          *(_WORD *)&v328[44] = 1024;
                          *(_DWORD *)&v328[46] = v80;
                          *(_WORD *)&v328[50] = 1024;
                          *(_DWORD *)&v328[52] = ((v201 - v202) >> 5) - 1;
                          *(_WORD *)&v328[56] = 2048;
                          *(void *)&v328[58] = v203;
                          *(_WORD *)&v328[66] = 2048;
                          *(void *)v329 = *(void *)v316;
                          *(_WORD *)&v329[8] = 2048;
                          uint64_t v330 = *(void *)&v316[8];
                          __int16 v331 = 2048;
                          uint64_t v332 = v205;
                          __int16 v333 = 2048;
                          uint64_t v334 = v204;
                          _os_log_impl(&dword_188D96000, v199, OS_LOG_TYPE_DEFAULT, "(%@) Attempting to create a zero length segment. This most likely means that the Routing provided a route that is not close to the road network: [%u, %0.8f] to [%u, %0.8f] | index: %d/%d, roadID: %llu, path fraction: %0.8f, %0.8f | %f, %f", v328, 0x6Au);
                          uint64_t v99 = v289;
                        }
                      }
                      v206 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:]([GEOMatchedPathSegment alloc], "initWithRoute:road:coordinates:roadRange:", v296->_route, v84, __p, v99 | (v276 << 32), v97 | (unint64_t)(v98 << 32));
                      if (!-[GEOPathMatcher _verifySegmentDistanceFromRoute:segmentIndex:requestedPathRange:](v296, "_verifySegmentDistanceFromRoute:segmentIndex:requestedPathRange:", v206, v80, v282, v294))
                      {
                        if (v296->_shouldDropDivergingSegments)
                        {
                          v207 = GEOGetGEOPathMatcherLog();
                          if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                          {
                            v208 = v296->_loggingIdentifier;
                            *(_DWORD *)v328 = 138412290;
                            *(void *)&v328[4] = v208;
                            _os_log_impl(&dword_188D96000, v207, OS_LOG_TYPE_ERROR, "(%@) Ignoring successful decoding result because matched segments are too far from route.", v328, 0xCu);
                          }

                          int v209 = 0;
LABEL_204:

                          v193 = __p[0];
                          if (!__p[0])
                          {
LABEL_198:

                            if (!v209)
                            {
                              double v44 = 0;
                              v211 = v271;
                              goto LABEL_219;
                            }
LABEL_199:
                            if (v80++ == v283) {
                              goto LABEL_209;
                            }
                            continue;
                          }
LABEL_197:
                          __p[1] = v193;
                          operator delete(v193);
                          goto LABEL_198;
                        }
                        char v269 = 1;
                      }
                      [v271 addObject:v206];
                      int v209 = 1;
                      goto LABEL_204;
                    }
                    break;
                  }
                  int v209 = 1;
                  if (!__p[0]) {
                    goto LABEL_198;
                  }
                  goto LABEL_197;
                }
              }
LABEL_261:
              ++v291;
            }
            while (v291 != v279);
            uint64_t v262 = [v273 countByEnumeratingWithState:&v297 objects:v323 count:16];
            uint64_t v279 = v262;
            if (!v262)
            {
LABEL_283:

              [(GEOPathMatcher *)v296 setInternalInfos:v270];
              v263 = -[GEOPathMatcher _updateCacheWithNewSegments:range:](v296, "_updateCacheWithNewSegments:range:", v275, v265, v264);
              -[GEOPathMatcher _callbackWithMatchedSegments:range:handler:callbackQueue:](v296, "_callbackWithMatchedSegments:range:handler:callbackQueue:", v263, v265, v264, v267, v268);

              *(void *)buf = &unk_1ED512208;
              std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)v326, v326[1]);

              std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)&v305, v306);
              float v15 = v270;
              goto LABEL_284;
            }
          }
        }
        if (v9 < v10) {
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    float v15 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "(%@) No route: nothing to match", buf, 0xCu);
    }
LABEL_284:
  }
LABEL_285:
}

- (void)_callbackWithMatchedSegments:(id)a3 range:(GEOPolylineCoordinateRange)a4 handler:(id)a5 callbackQueue:(id)a6
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  id v11 = a3;
  id v12 = a5;
  double v13 = a6;
  uint64_t v14 = v13;
  if (v12)
  {
    if (!v13)
    {
      uint64_t v14 = MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
    }
    uint64_t v16 = -[GEOPathMatcher _matchedSegmentsInRange:ofMatchedSegments:](self, "_matchedSegmentsInRange:ofMatchedSegments:", start, end, v11);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__GEOPathMatcher__callbackWithMatchedSegments_range_handler_callbackQueue___block_invoke;
    v18[3] = &unk_1E53D8530;
    id v19 = v16;
    id v20 = v12;
    id v17 = v16;
    dispatch_async(v14, v18);
  }
}

uint64_t __75__GEOPathMatcher__callbackWithMatchedSegments_range_handler_callbackQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_updateCacheWithNewSegments:(id)a3 range:(GEOPolylineCoordinateRange)a4
{
  PolylineCoordinate start = a4.start;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = -[GEOPathMatcher _cachedSegments]((uint64_t)self);
  if (![v6 count]) {
    goto LABEL_12;
  }
  if (![v7 count]) {
    goto LABEL_14;
  }
  uint64_t v10 = [v6 firstObject];
  uint64_t v11 = [v10 startRouteCoordinate];
  id v12 = [v6 lastObject];
  uint64_t v13 = [v12 endRouteCoordinate];

  uint64_t v14 = [v7 firstObject];
  uint64_t v15 = [v14 startRouteCoordinate];
  uint64_t v16 = [v7 lastObject];
  uint64_t v17 = [v16 endRouteCoordinate];

  if (v15 != v11)
  {
    if (v15 >= v11) {
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  LODWORD(v8) = HIDWORD(v11);
  LODWORD(v9) = HIDWORD(v15);
  if (*((float *)&v15 + 1) <= *((float *)&v11 + 1))
  {
LABEL_7:
    if (v13 == v17)
    {
      LODWORD(v8) = HIDWORD(v17);
      LODWORD(v9) = HIDWORD(v13);
      if (*((float *)&v13 + 1) > *((float *)&v17 + 1)) {
        goto LABEL_14;
      }
    }
    else if (v13 >= v17)
    {
      goto LABEL_14;
    }
    uint64_t v18 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      loggingIdentifier = self->_loggingIdentifier;
      uint64_t v21 = GEOPolylineCoordinateRangeAsString(v15, v17, v19);
      uint64_t v23 = GEOPolylineCoordinateRangeAsString(v11, v13, v22);
      *(_DWORD *)buf = 138412803;
      uint64_t v57 = loggingIdentifier;
      __int16 v58 = 2113;
      uint64_t v59 = v21;
      __int16 v60 = 2113;
      double v61 = v23;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "(%@) Attempting to update cache with a range that has already been cached. Ignoring new segments. Old cache range: %{private}@. New segments range: %{private}@", buf, 0x20u);
    }
LABEL_12:
    id v24 = v7;
    goto LABEL_36;
  }
LABEL_14:
  double v49 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", v7, v8, v9);
  double v47 = [v6 firstObject];
  id v48 = [v7 lastObject];
  if (v48)
  {
    uint64_t v25 = [v48 endRouteCoordinate];
    uint64_t v26 = [v47 startRouteCoordinate];
    if (vabds_f32((float)v25 + *((float *)&v25 + 1), (float)v26 + *((float *)&v26 + 1)) >= 0.001) {
      [v49 removeAllObjects];
    }
  }
  if ([v7 count])
  {
    route = self->_route;
    uint64_t v28 = [v6 firstObject];
    uint64_t v29 = [v28 startRouteCoordinate];
    unint64_t v30 = [v6 lastObject];
    -[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](route, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v29, [v30 endRouteCoordinate]);
    double v32 = v31;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v33 = [v49 reverseObjectEnumerator];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v34)
    {
      double v35 = 150.0 - v32;
      uint64_t v36 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          double v38 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v39 = [v38 road];
          [v39 length];
          double v41 = v40;

          uint64_t v42 = [v38 endRouteCoordinate];
          double v35 = v35 - v41;
          BOOL v43 = start.offset < *((float *)&v42 + 1);
          if (start.offset == *((float *)&v42 + 1)) {
            BOOL v43 = 0;
          }
          if (start.index == v42) {
            BOOL v44 = v43;
          }
          else {
            BOOL v44 = start.index < v42;
          }
          if (!v44 && v35 < 0.0)
          {
            uint64_t v45 = [v49 indexOfObject:v38];

            if (v45 != 0x7FFFFFFFFFFFFFFFLL) {
              objc_msgSend(v49, "removeObjectsInRange:", 0, v45 + 1);
            }
            goto LABEL_35;
          }
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v34) {
          continue;
        }
        break;
      }
    }
  }
LABEL_35:
  [v49 addObjectsFromArray:v6];
  id v50 = v49;
  geo_isolate_sync();
  id v24 = v50;

LABEL_36:

  return v24;
}

void __52__GEOPathMatcher__updateCacheWithNewSegments_range___block_invoke(uint64_t a1)
{
}

- (id)_matchedSegmentsInRange:(GEOPolylineCoordinateRange)a3 ofMatchedSegments:(id)a4
{
  PolylineCoordinate end = a3.end;
  uint64_t start = (uint64_t)a3.start;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (!v5)
  {
    uint64_t v36 = 0;
    id v7 = 0;
    goto LABEL_34;
  }
  uint64_t v36 = 0;
  id v7 = 0;
  uint64_t v8 = *(void *)v39;
  float offset = end.offset;
  *(void *)&long long v6 = 138412803;
  long long v32 = v6;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v39 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      uint64_t v12 = objc_msgSend(v11, "endRouteCoordinate", v32);
      if (v12 != start)
      {
        if (v12 < start) {
          continue;
        }
LABEL_10:
        uint64_t v14 = objc_msgSend(v11, "startRouteCoordinate", v13);
        if (end.index == v14)
        {
          if (offset <= *((float *)&v14 + 1)) {
            goto LABEL_34;
          }
        }
        else if (end.index < v14)
        {
          goto LABEL_34;
        }
        if (!v7)
        {
          id v7 = [MEMORY[0x1E4F1CA48] array];
        }
        id v15 = v11;
        uint64_t v16 = [v15 startRouteCoordinate];
        uint64_t v17 = [v15 endRouteCoordinate];
        if (end.index == v16)
        {
          uint64_t v18 = v15;
          if (offset <= *((float *)&v16 + 1))
          {
LABEL_22:
            if (v18) {
              goto LABEL_23;
            }
LABEL_26:
            id v20 = GEOGetGEOPathMatcherLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              uint64_t v34 = v7;
              uint64_t v21 = v5;
              uint64_t v22 = (uint64_t)end;
              loggingIdentifier = self->_loggingIdentifier;
              uint64_t v24 = [v15 range];
              GEOPolylineCoordinateRangeAsString(v24, v25, v26);
              id v27 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v29 = GEOPolylineCoordinateRangeAsString(start, v22, v28);
              *(_DWORD *)buf = v32;
              BOOL v43 = loggingIdentifier;
              __int16 v44 = 2113;
              id v45 = v27;
              __int16 v46 = 2113;
              double v47 = v29;
              _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_FAULT, "(%@) Trimmed segments within range returned nil segment. Segment range: %{private}@. Target range: %{private}@", buf, 0x20u);

              PolylineCoordinate end = (PolylineCoordinate)v22;
              uint64_t v5 = v21;
              id v7 = v34;
            }
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v18 = v15;
          if (end.index < v16) {
            goto LABEL_22;
          }
        }
        if (v17 == start)
        {
          uint64_t v18 = v15;
          if (*((float *)&v17 + 1) <= *((float *)&start + 1)) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v18 = v15;
          if (v17 < start) {
            goto LABEL_22;
          }
        }
        uint64_t v19 = objc_msgSend(v15, "trimmedSegmentWithinRange:", start, end);

        uint64_t v18 = (void *)v19;
        if (!v19) {
          goto LABEL_26;
        }
LABEL_23:
        [v7 addObject:v18];
LABEL_29:
        id v30 = v15;

        uint64_t v36 = v30;
        continue;
      }
      LODWORD(v13) = HIDWORD(v12);
      if (*((float *)&v12 + 1) > *((float *)&start + 1)) {
        goto LABEL_10;
      }
    }
    uint64_t v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16, v13);
  }
  while (v5);
LABEL_34:

  return v7;
}

- (BOOL)_isFailedRange:(GEOPolylineCoordinateRange)a3
{
  begin = (uint64_t *)self->_failedRanges.__begin_;
  PolylineCoordinate end = self->_failedRanges.__end_;
  if (begin == (uint64_t *)end) {
    return 0;
  }
  uint64_t v5 = (uint64_t)a3.end;
  uint64_t start = (uint64_t)a3.start;
  do
  {
    BOOL result = GEOPolylineCoordinateRangeEqual(*begin, begin[1], start, v5);
    if (result) {
      break;
    }
    begin += 2;
  }
  while (begin != (uint64_t *)end);
  return result;
}

- (BOOL)_isRangeValid:(GEOPolylineCoordinateRange)a3
{
  float offset = a3.start.offset;
  if (a3.start.offset < 0.0) {
    return 0;
  }
  unsigned int index = a3.end.index;
  float v5 = a3.end.offset;
  if (a3.end.offset < 0.0) {
    return 0;
  }
  unsigned int v6 = a3.start.index;
  if (a3.start.index == a3.end.index)
  {
    if (a3.start.offset > a3.end.offset) {
      return 0;
    }
  }
  else if (a3.start.index >= a3.end.index)
  {
    return 0;
  }
  if ([(GEOComposedRoute *)self->_route pointCount] - 1 > a3.start.index) {
    return vabds_f32((float)v6 + offset, (float)index + v5) >= 0.001;
  }
  return 0;
}

- (void)_decodePathForRoute:(void *)a3 supportPoints:(void *)a4 roadNetwork:(uint64_t)a5 internalInfo:(void *)a6
{
  id v10 = a3;
  id v246 = a4;
  double v247 = a6;
  if (!a2)
  {
    *(void *)(a1 + 128) = 0;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    goto LABEL_278;
  }
  uint64_t v11 = [v10 coordinates];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 routingPathDataWithinSupportPoints:v246 supportPointsOnly:0];
  }
  else
  {
    long long v278 = 0u;
    long long v279 = 0u;
    memset(v277, 0, sizeof(v277));
  }

  id v255 = v10;
  if (v247)
  {
    double v13 = [v246 firstObject];
    uint64_t v14 = [v13 routeCoordinate];
    id v15 = [v246 lastObject];
    uint64_t v16 = [v15 routeCoordinate];
    v247[3] = v14;
    v247[4] = v16;

    uint64_t v17 = +[PathCodec dataForRoutingPathLeg:]((uint64_t)PathCodec, (google::protobuf::MessageLite *)v277);
    uint64_t v18 = [v17 base64EncodedStringWithOptions:0];
    uint64_t v19 = (void *)v247[1];
    v247[1] = v18;
  }
  __int16 v276 = 0;
  int v275 = 0;
  uint64_t v262 = a5;
  double v263 = 25.0;
  uint64_t v264 = 5000;
  long long __y = xmmword_18A62B120;
  long long v266 = xmmword_18A62B130;
  double v267 = 0.0;
  uint64_t v268 = 20000000;
  uint64_t v269 = 0x3FF199999999999ALL;
  uint64_t v270 = 0x3E800002710;
  uint64_t v271 = 0xA00002710;
  long long v272 = xmmword_18A62B140;
  uint64_t v273 = 0x3FE6147AE147AE14;
  __int16 v274 = 0;
  double v261 = &unk_1ED512198;
  uint64_t Integer = GEOConfigGetInteger(GeoServicesConfig_PathCodecLogLevel, (uint64_t)off_1E9114318);
  char v21 = Integer;
  if ((Integer & 0x8000000000000000) == 0)
  {
    std::mutex::lock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
    maps::path_codec::Logger::m_logger = (uint64_t)&v261;
    maps::path_codec::Logger::m_log_level = v21;
    std::mutex::unlock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
  }
  std::chrono::steady_clock::now();
  if (*((void *)&v278 + 1)) {
    uint64_t v22 = (uint64_t *)(*((void *)&v278 + 1) + 8);
  }
  else {
    uint64_t v22 = 0;
  }
  int v23 = v278;
  if (!v278)
  {
    v280 = 0;
    uint64_t v281 = 0;
    uint64_t v282 = 0;
    uint64_t v33 = a1;
    goto LABEL_268;
  }
  unint64_t v24 = 0;
  uint64_t v260 = v262;
  uint64_t v25 = 8 * (int)v278;
  do
  {
    unint64_t v26 = v24;
    uint64_t v27 = *v22++;
    int v28 = *(_DWORD *)(v27 + 84);
    if (v28 == 1) {
      ++v24;
    }
    v25 -= 8;
  }
  while (v25);
  v280 = 0;
  uint64_t v281 = 0;
  uint64_t v282 = 0;
  uint64_t v307 = &v280;
  LOBYTE(v308) = 0;
  if (v24)
  {
    if (v24 >= 0x38E38E38E38E38FLL) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v29 = (maps::path_codec *)operator new(72 * v24);
    uint64_t v30 = 0;
    double v31 = (maps::path_codec *)((char *)v29 + 72 * v24);
    v280 = v29;
    uint64_t v282 = v31;
    do
    {
      long long v32 = (char *)v29 + v30;
      *(_OWORD *)(v32 + 8) = 0uLL;
      *(_OWORD *)(v32 + 24) = 0uLL;
      *(_OWORD *)(v32 + 40) = 0uLL;
      *(void *)long long v32 = -1;
      *((_DWORD *)v32 + 2) = 0x7FFFFFFF;
      *((void *)v32 + 2) = 0;
      *((void *)v32 + 3) = 0;
      *((void *)v32 + 4) = 0;
      *((_DWORD *)v32 + 10) = 0x7FFFFFFF;
      v30 += 72;
      *((void *)v32 + 7) = 0;
      *((void *)v32 + 8) = 0;
    }
    while (72 * v26 + 72 * (v28 == 1) != v30);
    uint64_t v281 = (maps::path_codec *)((char *)v29 + 72 * v24);
  }
  else
  {
    uint64_t v29 = 0;
    double v31 = 0;
  }
  if (v23 < 1) {
    goto LABEL_267;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  unint64_t v245 = v24 - 1;
  double v249 = *(void ***)(MEMORY[0x1E4FBA418] + 24);
  id v250 = (void **)*MEMORY[0x1E4FBA418];
  int32x2_t v37 = vdup_n_s32(0x168u);
  double v38 = 1.0;
  char v253 = 1;
  while (1)
  {
    uint64_t v254 = v34;
    uint64_t v259 = *(void *)(*((void *)&v278 + 1) + 8 * v34 + 8);
    if (*(_DWORD *)(v259 + 84) == 1) {
      break;
    }
LABEL_263:
    uint64_t v34 = v254 + 1;
    if (v254 + 1 >= v23) {
      goto LABEL_266;
    }
  }
  if ((v253 & 1) != 0 || (*(void *)(v259 + 48) != v35 ? (BOOL v39 = v36 == v245) : (BOOL v39 = 1), v39)) {
    int v40 = 1;
  }
  else {
    int v40 = (*(unsigned __int8 *)(v259 + 16) >> 2) & 1;
  }
  __src = 0;
  unint64_t v295 = 0;
  __dst = 0;
  LODWORD(v296) = 0x7FFFFFFF;
  char v297 = 0;
  long long v298 = 0uLL;
  long long v41 = *(uint64_t **)(v259 + 32);
  if (!v41) {
    long long v41 = &maps::path_codec::geo3::_LatLngE7_default_instance_;
  }
  uint64_t v291 = (void *)maps::path_codec::Coordinate::from_lat_lon(v29, (double)*((int *)v41 + 6) / 10000000.0, (double)*((int *)v41 + 7) / 10000000.0);
  LODWORD(v292) = v42;
  int v43 = *(_DWORD *)(v259 + 16);
  if ((v43 & 0x10) != 0) {
    LODWORD(v292) = *(_DWORD *)(v259 + 56);
  }
  if ((v43 & 0x100) != 0)
  {
    unsigned int v44 = *(_DWORD *)(v259 + 72);
    if (v44 >= 0x7FFFFFFF) {
      unsigned int v44 = 0x7FFFFFFF;
    }
    LODWORD(v296) = v44;
  }
  BYTE4(v296) = *(unsigned char *)(v259 + 76);
  if ((v43 & 0x400) != 0)
  {
    unsigned int v45 = *(_DWORD *)(v259 + 80);
    if (v45 >= 4) {
      LOBYTE(v45) = 0;
    }
  }
  else
  {
    LOBYTE(v45) = 0;
  }
  BYTE5(v296) = v45;
  if ((v43 & 4) != 0)
  {
    uint64_t v46 = *(void *)(v259 + 40);
    char v297 = 1;
    long long v298 = *(_OWORD *)(v46 + 24);
  }
  if ((v36 || !(_BYTE)v274) && ((**(void (***)(__n128 *__return_ptr))v260)(&v288), v290))
  {
    (*(void (**)(maps::path_codec ***__return_ptr))(*(void *)v260 + 32))(&v307);
    int v47 = v310;
    if (v312 < 0) {
      operator delete(__p);
    }
    if (v308)
    {
      v309 = v308;
      operator delete(v308);
    }
    if (v47)
    {
      double v48 = 0.5;
      if (v40)
      {
        (*(void (**)(__n128 *__return_ptr))(*(void *)v260 + 32))(&v299);
        maps::path_codec::snap_point((maps::path_codec *)&v291, &v299.n128_i64[1], (uint64_t)&v304, v49, v50, v51);
        uint64_t v52 = v299.n128_i64[1];
        double v53 = 0.0;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v300.n128_u64[0] - v299.n128_u64[1]) >> 2) >= 2
          && v299.n128_u64[1] + 12 != v300.n128_u64[0])
        {
          double v54 = 0.0;
          double v55 = 1.79769313e308;
          double v56 = 0.0;
          do
          {
            maps::path_codec::great_circle_distance_in_m((maps::path_codec *)v52, (const maps::path_codec::Coordinate *)(v52 + 12), (const maps::path_codec::Coordinate *)1, v53);
            double v58 = v57;
            maps::path_codec::great_circle_distance_in_m((maps::path_codec *)v52, (const maps::path_codec::Coordinate *)&v304, (const maps::path_codec::Coordinate *)1, v57);
            double v60 = v59;
            maps::path_codec::great_circle_distance_in_m((maps::path_codec *)&v304, (const maps::path_codec::Coordinate *)(v52 + 12), (const maps::path_codec::Coordinate *)1, v59);
            double v53 = fmax(v60 + v61 - v58, 0.0);
            if (v53 < v55)
            {
              double v55 = v53;
              double v56 = v54 + v60;
            }
            double v54 = v54 + v58;
            uint64_t v62 = v52 + 24;
            v52 += 12;
          }
          while (v62 != v300.n128_u64[0]);
          double v53 = 0.0;
          if (v54 != 0.0)
          {
            double v53 = v56 / v54;
            double v38 = 1.0;
            if (v56 / v54 > 1.0) {
              double v53 = 1.0;
            }
          }
        }
        double v48 = fmax(v53, 0.0);
        if (maps::path_codec::Logger::m_log_level <= 1u)
        {
          std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
          __int16 v63 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Support point start/end of path (", 33);
          __int16 v65 = maps::path_codec::operator<<(v63, (uint64_t)&v291, v64);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v65, (uint64_t)") fraction: ", 12);
          std::ostream::operator<<();
          std::string::basic_string[abi:ne180100]<0>(&v285, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
          std::stringbuf::str();
          maps::path_codec::Logger::log_debug((uint64_t)&v285, 236, (uint64_t)&v283);
          if (v284 < 0) {
            operator delete(v283);
          }
          if (SHIBYTE(v287) < 0) {
            operator delete(v285);
          }
          uint64_t v307 = (maps::path_codec **)v250;
          *(maps::path_codec ***)((char *)&v307 + (void)*(v250 - 3)) = (maps::path_codec **)v249;
          v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
          if (v314 < 0) {
            operator delete(v313);
          }
          std::streambuf::~streambuf();
          std::ostream::~ostream();
          MEMORY[0x18C11F4F0](v315);
        }
        if (v303 < 0) {
          operator delete(v302);
        }
        if (v299.n128_u64[1])
        {
          v300.n128_u64[0] = v299.n128_u64[1];
          operator delete((void *)v299.n128_u64[1]);
        }
      }
      double v66 = (double *)__src;
      if ((unint64_t)__src >= v295)
      {
        uint64_t v184 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)__src - (unsigned char *)__dst) >> 3);
        unint64_t v185 = v184 + 1;
        if ((unint64_t)(v184 + 1) > 0x492492492492492) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (void)__dst) >> 3) > v185) {
          unint64_t v185 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (void)__dst) >> 3);
        }
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v295 - (void)__dst) >> 3)) >= 0x249249249249249) {
          unint64_t v186 = 0x492492492492492;
        }
        else {
          unint64_t v186 = v185;
        }
        long long v187 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>((uint64_t)&v295, v186);
        v189 = &v187[56 * v184];
        __n128 v190 = v289;
        *(__n128 *)v189 = v288;
        *((__n128 *)v189 + 1) = v190;
        *((double *)v189 + 4) = v48;
        *((void *)v189 + 5) = 0;
        *((_DWORD *)v189 + 12) = 0;
        v191 = (char *)__src;
        long long v192 = (char *)__dst;
        v193 = v189;
        if (__src != __dst)
        {
          do
          {
            long long v194 = *(_OWORD *)(v191 - 56);
            long long v195 = *(_OWORD *)(v191 - 40);
            long long v196 = *(_OWORD *)(v191 - 24);
            *((_DWORD *)v193 - 2) = *((_DWORD *)v191 - 2);
            *(_OWORD *)(v193 - 24) = v196;
            *(_OWORD *)(v193 - 40) = v195;
            *(_OWORD *)(v193 - 56) = v194;
            v193 -= 56;
            v191 -= 56;
          }
          while (v191 != v192);
          v191 = (char *)__dst;
        }
        uint64_t v68 = (double *)(v189 + 56);
        __dst = v193;
        __src = v189 + 56;
        unint64_t v295 = (unint64_t)&v187[56 * v188];
        if (v191) {
          operator delete(v191);
        }
      }
      else
      {
        __n128 v67 = v289;
        *(__n128 *)__src = v288;
        *((__n128 *)v66 + 1) = v67;
        v66[4] = v48;
        v66[5] = 0.0;
        *((_DWORD *)v66 + 12) = 0;
        uint64_t v68 = v66 + 7;
      }
      uint64_t v251 = (uint64_t)v291;
      int v170 = (int)v292;
      double v258 = __dst;
      unint64_t v167 = v295;
      __dst = 0;
      __src = 0;
      unint64_t v295 = 0;
      int v171 = (int)v296;
      __int16 v168 = WORD2(v296);
      char v169 = v297;
      long long v252 = v298;
    }
    else
    {
      long long v252 = 0u;
      if (maps::path_codec::Logger::m_log_level <= 1u)
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Road ID ", 8);
        v183 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v183, (uint64_t)" is no longer navigable.", 24);
        std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
        std::stringbuf::str();
        maps::path_codec::Logger::log_debug((uint64_t)&v299, 220, (uint64_t)&v304);
        if (SHIBYTE(v306) < 0) {
          operator delete(v304);
        }
        if (v300.n128_i8[7] < 0) {
          operator delete((void *)v299.n128_u64[0]);
        }
        uint64_t v307 = (maps::path_codec **)v250;
        *(maps::path_codec ***)((char *)&v307 + (void)*(v250 - 3)) = (maps::path_codec **)v249;
        v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
        if (v314 < 0) {
          operator delete(v313);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x18C11F4F0](v315);
      }
      double v258 = 0;
      uint64_t v68 = 0;
      unint64_t v167 = 0;
      __int16 v168 = 0;
      char v169 = 0;
      uint64_t v251 = -1;
      int v170 = 0x7FFFFFFF;
      int v171 = 0x7FFFFFFF;
    }
  }
  else
  {
    uint64_t v69 = v259;
    if (maps::path_codec::Logger::m_log_level <= 1u)
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Road ID ", 8);
      long long v70 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v70, (uint64_t)" not found or origin segment, fallback to map-matching.", 55);
      std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
      std::stringbuf::str();
      maps::path_codec::Logger::log_debug((uint64_t)&v299, 246, (uint64_t)&v288);
      if (v289.n128_i8[7] < 0) {
        operator delete((void *)v288.n128_u64[0]);
      }
      if (v300.n128_i8[7] < 0) {
        operator delete((void *)v299.n128_u64[0]);
      }
      uint64_t v307 = (maps::path_codec **)v250;
      *(maps::path_codec ***)((char *)&v307 + (void)*(v250 - 3)) = (maps::path_codec **)v249;
      v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
      if (v314 < 0) {
        operator delete(v313);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x18C11F4F0](v315);
    }
    double v285 = 0;
    double v286 = 0;
    uint64_t v287 = 0;
    (*(void (**)(uint64_t, void **, void, void **))(*(void *)v260 + 24))(v260, &v291, v264, &v285);
    if (maps::path_codec::Logger::m_log_level <= 1u)
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Found ", 6);
      uint64_t v71 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v71, (uint64_t)" nearest candidates", 19);
      std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
      std::stringbuf::str();
      maps::path_codec::Logger::log_debug((uint64_t)&v299, 249, (uint64_t)&v288);
      if (v289.n128_i8[7] < 0) {
        operator delete((void *)v288.n128_u64[0]);
      }
      if (v300.n128_i8[7] < 0) {
        operator delete((void *)v299.n128_u64[0]);
      }
      uint64_t v307 = (maps::path_codec **)v250;
      *(maps::path_codec ***)((char *)&v307 + (void)*(v250 - 3)) = (maps::path_codec **)v249;
      v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
      if (v314 < 0) {
        operator delete(v313);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x18C11F4F0](v315);
    }
    double v72 = (__n128 *)v285;
    long long v252 = 0u;
    v257 = v286;
    if (v285 == v286) {
      goto LABEL_217;
    }
    uint64_t v256 = v36;
    do
    {
      if (v36) {
        BOOL v73 = 1;
      }
      else {
        BOOL v73 = *(void *)(v69 + 48) == 0;
      }
      char v74 = !v73;
      (*(void (**)(maps::path_codec ***__return_ptr))(*(void *)v260 + 32))(&v307);
      maps::path_codec::snap_point((maps::path_codec *)&v291, (uint64_t *)&v308, (uint64_t)&v304, v75, v76, v77);
      long long v82 = v309;
      __int16 v83 = v308;
      if (0xAAAAAAAAAAAAAAABLL * ((v309 - v308) >> 2) < 2 || (maps::path_codec *)((char *)v308 + 12) == v309)
      {
        double v85 = 0.0;
      }
      else
      {
        double v86 = 0.0;
        double v87 = 1.79769313e308;
        double v88 = 0.0;
        do
        {
          __int16 v89 = (char *)v83 + 12;
          maps::path_codec::great_circle_distance_in_m(v83, (maps::path_codec *)((char *)v83 + 12), (const maps::path_codec::Coordinate *)1, v79);
          double v91 = v90;
          maps::path_codec::great_circle_distance_in_m(v83, (const maps::path_codec::Coordinate *)&v304, (const maps::path_codec::Coordinate *)1, v90);
          double v93 = v92;
          maps::path_codec::great_circle_distance_in_m((maps::path_codec *)&v304, (maps::path_codec *)((char *)v83 + 12), (const maps::path_codec::Coordinate *)1, v92);
          double v79 = fmax(v93 + v94 - v91, 0.0);
          if (v79 < v87)
          {
            double v87 = v79;
            double v88 = v86 + v93;
          }
          double v86 = v86 + v91;
          v95 = (maps::path_codec *)((char *)v83 + 24);
          __int16 v83 = (maps::path_codec *)((char *)v83 + 12);
        }
        while (v95 != v309);
        long long v82 = (maps::path_codec *)(v89 + 12);
        double v79 = v88 / v86;
        double v80 = 1.0;
        double v38 = 1.0;
        if (v88 / v86 > 1.0) {
          double v79 = 1.0;
        }
        if (v86 == 0.0) {
          double v85 = 0.0;
        }
        else {
          double v85 = v79;
        }
      }
      int v96 = v305;
      unint64_t v97 = v306;
      unsigned int v98 = *(__int16 *)(v69 + 60)
          - 360 * (((11651 * *(__int16 *)(v69 + 60)) >> 22) + ((11651 * *(__int16 *)(v69 + 60)) >> 31));
      unsigned int v100 = *(_DWORD *)(v69 + 64);
      int v99 = *(_DWORD *)(v69 + 68);
      unint64_t v101 = -2 - 0x5555555555555555 * ((v82 - v308) >> 2);
      if (v101 >= v306) {
        unint64_t v101 = v306;
      }
      unsigned int v102 = maps::path_codec::compute_bearing((maps::path_codec *)((char *)v308 + 12 * v101), (maps::path_codec *)((char *)v308 + 12 * v101 + 12), v78, v79, v80, v81);
      __int16 v107 = v102 - v98;
      int v108 = (__int16)(v102 - v98);
      int v109 = v102 - v98 - 360;
      if (v108 > 180) {
        __int16 v107 = v102 - v98 - 360;
      }
      if (v107 < -179) {
        v107 += 360;
      }
      if (v107 >= 0) {
        LOWORD(v110) = v107;
      }
      else {
        int v110 = -v107;
      }
      unsigned int v111 = v102;
      if ((unsigned __int16)v110 >= 0x5Au) {
        unsigned int v111 = (unsigned __int16)(v102 + 180) % 0x168u;
      }
      if (v97)
      {
        uint64_t v112 = v97 - 1;
        if (-2 - 0x5555555555555555 * ((v309 - v308) >> 2) < v97 - 1) {
          uint64_t v112 = -2 - 0x5555555555555555 * ((v309 - v308) >> 2);
        }
        unsigned int v102 = maps::path_codec::compute_bearing((maps::path_codec *)((char *)v308 + 12 * v112), (maps::path_codec *)((char *)v308 + 12 * v112 + 12), v103, v104, v105, v106);
        int v108 = v102 - v98;
        int v109 = v102 - v98 - 360;
      }
      id v10 = v255;
      if ((__int16)v108 <= 180) {
        LOWORD(v113) = v108;
      }
      else {
        LOWORD(v113) = v109;
      }
      if ((__int16)v113 < -179) {
        LOWORD(v113) = v113 + 360;
      }
      if ((v113 & 0x8000u) != 0) {
        int v113 = -(__int16)v113;
      }
      if ((unsigned __int16)v113 >= 0x5Au)
      {
        unsigned int v102 = (unsigned __int16)(v102 + 180) % 0x168u;
        int v108 = v102 - v98;
        int v109 = v102 - v98 - 360;
      }
      double v114 = fmax(v85, 0.0);
      BOOL v115 = (unsigned __int16)v113 > 0x59u;
      v116.i32[0] = v108;
      v116.i32[1] = v111 - v98;
      v117.i32[0] = v109;
      v117.i32[1] = v111 - v98 - 360;
      int32x2_t v118 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_s32(vshr_n_s32(vshl_n_s32(v116, 0x10uLL), 0x10uLL), (int32x2_t)0xB4000000B4), v117, (int8x8_t)v116);
      int32x2_t v119 = vabs_s32(vshr_n_s32(vshl_n_s32((int32x2_t)vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xB2000000B2, vshr_n_s32(vshl_n_s32(v118, 0x10uLL), 0x10uLL)), (int8x8_t)vadd_s32(v118, v37), (int8x8_t)v118), 0x10uLL), 0x10uLL));
      if (vcgt_u32((uint32x2_t)vand_s8((int8x8_t)vdup_lane_s32(v119, 1), (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)vand_s8((int8x8_t)v119, (int8x8_t)0xFFFF0000FFFFLL)).u8[0])LOWORD(v111) = v102; {
      __n128 v120 = *v72;
      }
      __n128 v121 = v72[1];
      if ((unsigned __int16)v111 == (unsigned __int16)v102) {
        BOOL v122 = v115;
      }
      else {
        BOOL v122 = (unsigned __int16)v110 > 0x59u;
      }
      __n128 v288 = *v72;
      __n128 v289 = v121;
      if (v122)
      {
        (*(void (**)(__n128 *__return_ptr, __n128))(*(void *)v260 + 8))(&v299, v120);
        double v114 = v38 - v114;
        __n128 v288 = v299;
        __n128 v289 = v300;
      }
      (*(void (**)(__n128 *__return_ptr))(*(void *)v260 + 32))(&v299);
      int v123 = v301;
      if (v303 < 0) {
        operator delete(v302);
      }
      if (v299.n128_u64[1])
      {
        v300.n128_u64[0] = v299.n128_u64[1];
        operator delete((void *)v299.n128_u64[1]);
      }
      if (v123)
      {
        if (v100 | v99) {
          char v124 = v74;
        }
        else {
          char v124 = 1;
        }
        double v125 = 0.0;
        double v126 = 0.0;
        if ((v124 & 1) == 0)
        {
          unsigned int v127 = v100 - (unsigned __int16)v307;
          if (v100 <= (unsigned __int16)v307) {
            unsigned int v127 = (unsigned __int16)v307 - v100;
          }
          if (v99 == WORD1(v307)) {
            double v126 = 0.0;
          }
          else {
            double v126 = v38;
          }
          double v125 = (double)v127;
        }
        uint64_t v69 = v259;
        double name_diff_score = maps::path_codec::get_name_diff_score((char *)(*(void *)(v259 + 24) & 0xFFFFFFFFFFFFFFFELL), (char *)&__p);
        LOWORD(v129) = v111 - v98;
        if ((__int16)(v111 - v98) > 180) {
          LOWORD(v129) = v111 - v98 - 360;
        }
        if ((__int16)v129 < -179) {
          LOWORD(v129) = v129 + 360;
        }
        if ((v129 & 0x8000u) != 0) {
          int v129 = -(__int16)v129;
        }
        unsigned int v130 = (unsigned __int16)v129;
        double v131 = pow((double)v96 / 100.0, *(long double *)&__y);
        long double v132 = pow((double)v130, *((long double *)&__y + 1));
        double v133 = v131 + v132 + v125 * *(double *)&v266 + v126 * *((double *)&v266 + 1) + name_diff_score * v267;
      }
      else
      {
        double v133 = 1.79769313e308;
        uint64_t v69 = v259;
      }
      __n128 v299 = v288;
      __n128 v300 = v289;
      uint64_t v36 = v256;
      if (v312 < 0) {
        operator delete(__p);
      }
      if (v308)
      {
        v309 = v308;
        operator delete(v308);
      }
      double v134 = (double *)__src;
      if ((unint64_t)__src >= v295)
      {
        uint64_t v136 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)__src - (unsigned char *)__dst) >> 3);
        unint64_t v137 = v136 + 1;
        if ((unint64_t)(v136 + 1) > 0x492492492492492) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (void)__dst) >> 3) > v137) {
          unint64_t v137 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v295 - (void)__dst) >> 3);
        }
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v295 - (void)__dst) >> 3)) >= 0x249249249249249) {
          unint64_t v138 = 0x492492492492492;
        }
        else {
          unint64_t v138 = v137;
        }
        if (v138) {
          v139 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey>>>((uint64_t)&v295, v138);
        }
        else {
          v139 = 0;
        }
        v140 = &v139[56 * v136];
        *((__n128 *)v140 + 1) = v300;
        *(__n128 *)v140 = v299;
        *((double *)v140 + 4) = v114;
        *((double *)v140 + 5) = v133;
        *((_DWORD *)v140 + 12) = v96;
        v141 = (char *)__src;
        v142 = (char *)__dst;
        v143 = v140;
        if (__src != __dst)
        {
          do
          {
            long long v144 = *(_OWORD *)(v141 - 56);
            long long v145 = *(_OWORD *)(v141 - 40);
            long long v146 = *(_OWORD *)(v141 - 24);
            *((_DWORD *)v143 - 2) = *((_DWORD *)v141 - 2);
            *(_OWORD *)(v143 - 24) = v146;
            *(_OWORD *)(v143 - 40) = v145;
            *(_OWORD *)(v143 - 56) = v144;
            v143 -= 56;
            v141 -= 56;
          }
          while (v141 != v142);
          v141 = (char *)__dst;
        }
        int64_t v135 = v140 + 56;
        __dst = v143;
        __src = v140 + 56;
        unint64_t v295 = (unint64_t)&v139[56 * v138];
        if (v141) {
          operator delete(v141);
        }
      }
      else
      {
        *(__n128 *)__src = v299;
        *((__n128 *)v134 + 1) = v300;
        v134[4] = v114;
        v134[5] = v133;
        *((_DWORD *)v134 + 12) = v96;
        int64_t v135 = v134 + 7;
      }
      __src = v135;
      v72 += 2;
    }
    while (v72 != v257);
    unint64_t v147 = 126 - 2 * __clz(0x6DB6DB6DB6DB6DB7 * (((unsigned char *)v135 - (unsigned char *)__dst) >> 3));
    uint64_t v148 = v135 == __dst ? 0 : v147;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,maps::path_codec::SnappedRoadSegment<GEOPathMatcherRoadKey> *,false>((unint64_t)__dst, (unint64_t)v135, v148, 1);
    long long v149 = (double *)__dst;
    uint64_t v68 = (double *)__src;
    if (__dst == __src)
    {
      uint64_t v68 = (double *)__dst;
    }
    else
    {
      float v150 = (uint64_t *)__dst;
      while (1)
      {
        float v151 = v150 + 7;
        if (v150 + 7 == __src) {
          break;
        }
        uint64_t v153 = *v150;
        uint64_t v154 = v150[1];
        uint64_t v152 = v150 + 8;
        if (v153) {
          uint64_t v152 = v151;
        }
        else {
          uint64_t v153 = v154;
        }
        uint64_t v155 = *v152;
        float v150 = v151;
        if (v153 == v155)
        {
          uint64_t v156 = (double *)(v151 + 7);
          unint64_t v157 = v151 - 7;
          while (v156 != v68)
          {
            uint64_t v158 = *v157;
            if (*v157)
            {
              v159 = v156;
            }
            else
            {
              uint64_t v158 = v157[1];
              v159 = v156 + 1;
            }
            if (v158 != *(void *)v159)
            {
              long long v160 = *(_OWORD *)v156;
              long long v161 = *((_OWORD *)v156 + 1);
              long long v162 = *((_OWORD *)v156 + 2);
              *((_DWORD *)v157 + 26) = *((_DWORD *)v156 + 12);
              *(_OWORD *)(v157 + 11) = v162;
              *(_OWORD *)(v157 + 9) = v161;
              *(_OWORD *)(v157 + 7) = v160;
              v157 += 7;
            }
            v156 += 7;
          }
          uint64_t v163 = v157 + 7;
          uint64_t v164 = (char *)((char *)v68 - (char *)(v157 + 7));
          if (v164)
          {
            int64_t v165 = (char *)v68 - &v164[(void)v163];
            if (v68 != (double *)&v164[(void)v163])
            {
              memmove(v163, &v164[(void)v163], v165 - 4);
              long long v149 = (double *)__dst;
            }
            uint64_t v68 = (double *)((char *)v163 + v165);
            __src = (char *)v163 + v165;
          }
          break;
        }
      }
    }
    double v166 = v149[5];
    if (v166 == 1.79769313e308)
    {
LABEL_217:
      double v258 = 0;
      uint64_t v68 = 0;
      unint64_t v167 = 0;
      __int16 v168 = 0;
      char v169 = 0;
      uint64_t v251 = -1;
      int v170 = 0x7FFFFFFF;
      int v171 = 0x7FFFFFFF;
    }
    else
    {
      if (v149 != v68)
      {
        if (v166 > v166 + v263)
        {
LABEL_232:
          uint64_t v68 = v149;
        }
        else
        {
          unsigned int v172 = maps::path_codec::Logger::m_log_level;
          int64_t v173 = v149 + 7;
          while (1)
          {
            if (v172 <= 1)
            {
              std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Candidate segment for geoid ", 28);
              unint64_t v174 = (void *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v174, (uint64_t)"(index=", 7);
              int64_t v175 = (void *)std::ostream::operator<<();
              unint64_t v176 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v175, (uint64_t)") (", 3);
              int64_t v178 = maps::path_codec::operator<<(v176, (uint64_t)&v291, v177);
              unint64_t v179 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v178, (uint64_t)"): ", 3);
              int64_t v180 = operator<<(v179, (void *)v173 - 7);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v180, (uint64_t)", fraction: ", 12);
              unint64_t v181 = (void *)std::ostream::operator<<();
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v181, (uint64_t)", score: ", 9);
              std::ostream::operator<<();
              std::string::basic_string[abi:ne180100]<0>(&v299, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/include/path-codec/SupportPointSnapper.h");
              std::stringbuf::str();
              maps::path_codec::Logger::log_debug((uint64_t)&v299, 289, (uint64_t)&v288);
              if (v289.n128_i8[7] < 0) {
                operator delete((void *)v288.n128_u64[0]);
              }
              if (v300.n128_i8[7] < 0) {
                operator delete((void *)v299.n128_u64[0]);
              }
              uint64_t v307 = (maps::path_codec **)v250;
              *(maps::path_codec ***)((char *)&v307 + (void)*(v250 - 3)) = (maps::path_codec **)v249;
              v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
              if (v314 < 0) {
                operator delete(v313);
              }
              std::streambuf::~streambuf();
              std::ostream::~ostream();
              MEMORY[0x18C11F4F0](v315);
              unsigned int v172 = maps::path_codec::Logger::m_log_level;
              uint64_t v68 = (double *)__src;
            }
            if (v173 == v68) {
              break;
            }
            double v182 = v173[5];
            v173 += 7;
            if (v182 > v166 + v263)
            {
              long long v149 = v173 - 7;
              goto LABEL_232;
            }
          }
        }
      }
      uint64_t v251 = (uint64_t)v291;
      int v170 = (int)v292;
      double v258 = __dst;
      unint64_t v167 = v295;
      __dst = 0;
      __src = 0;
      unint64_t v295 = 0;
      int v171 = (int)v296;
      __int16 v168 = WORD2(v296);
      char v169 = v297;
      long long v252 = v298;
    }
    if (v285)
    {
      double v286 = (__n128 *)v285;
      operator delete(v285);
    }
  }
  id v197 = v10;
  if (__dst)
  {
    __src = __dst;
    operator delete(__dst);
  }
  BOOL v198 = v280;
  uint64_t v199 = v36;
  v200 = (char *)v280 + 72 * v36;
  *(void *)v200 = v251;
  *((_DWORD *)v200 + 2) = v170;
  uint64_t v203 = (void *)*((void *)v200 + 2);
  uint64_t v202 = v200 + 16;
  unint64_t v201 = v203;
  if (v203)
  {
    *((void *)v198 + 9 * v199 + 3) = v201;
    operator delete(v201);
    *uint64_t v202 = 0;
    v202[1] = 0;
    v202[2] = 0;
  }
  *uint64_t v202 = v258;
  uint64_t v204 = (char *)v198 + 72 * v199;
  *((void *)v204 + 3) = v68;
  *((void *)v204 + 4) = v167;
  *((_DWORD *)v204 + 10) = v171;
  *((_WORD *)v204 + 22) = v168;
  v204[48] = v169;
  *(_OWORD *)(v204 + 56) = v252;
  uint64_t v29 = v280;
  if (*((void *)v280 + 9 * v199 + 2) != *((void *)v280 + 9 * v199 + 3))
  {
    uint64_t v36 = v199 + 1;
    uint64_t v35 = *(void *)(v259 + 48);
    v253 &= v35 == 0;
    int v23 = v278;
    id v10 = v197;
    goto LABEL_263;
  }
  id v10 = v197;
LABEL_266:
  double v31 = v281;
LABEL_267:
  uint64_t v33 = a1;
  if (0x8E38E38E38E38E39 * ((v31 - v29) >> 3) < 2)
  {
LABEL_268:
    if (maps::path_codec::Logger::m_log_level <= 4u)
    {
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Got less than 2 support points or not all necessary support points could be snapped.", 84);
      std::string::basic_string[abi:ne180100]<0>(&v291, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
      std::stringbuf::str();
      maps::path_codec::Logger::log_error((uint64_t)&v291, 48, (uint64_t)&v299);
      if (v300.n128_i8[7] < 0) {
        operator delete((void *)v299.n128_u64[0]);
      }
      if (SHIBYTE(__dst) < 0) {
        operator delete(v291);
      }
      uint64_t v307 = (maps::path_codec **)*MEMORY[0x1E4FBA418];
      *(maps::path_codec ***)((char *)&v307 + (void)*(v307 - 3)) = *(maps::path_codec ***)(MEMORY[0x1E4FBA418] + 24);
      v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
      if (v314 < 0) {
        operator delete(v313);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x18C11F4F0](v315);
      uint64_t v33 = a1;
    }
    *(void *)(v33 + 112) = 0;
    *(_OWORD *)(v33 + 80) = 0u;
    *(_OWORD *)(v33 + 96) = 0u;
    *(_OWORD *)(v33 + 48) = 0u;
    *(_OWORD *)(v33 + 64) = 0u;
    *(_OWORD *)(v33 + 16) = 0u;
    *(_OWORD *)(v33 + 32) = 0u;
    *(_OWORD *)uint64_t v33 = 0u;
    *(_DWORD *)(v33 + 120) = 1065353216;
    *(unsigned char *)(v33 + 128) = 0;
    goto LABEL_277;
  }
  if (v29 != v31)
  {
    uint64_t v205 = v29;
    while (*((void *)v205 + 2) != *((void *)v205 + 3))
    {
      uint64_t v205 = (maps::path_codec *)((char *)v205 + 72);
      if (v205 == v31) {
        goto LABEL_283;
      }
    }
    goto LABEL_268;
  }
LABEL_283:
  if (maps::path_codec::Logger::m_log_level <= 1u)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Decoding path with ", 19);
    v206 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v206, (uint64_t)" support points.", 16);
    std::string::basic_string[abi:ne180100]<0>(&v291, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
    std::stringbuf::str();
    maps::path_codec::Logger::log_debug((uint64_t)&v291, 53, (uint64_t)&v299);
    if (v300.n128_i8[7] < 0) {
      operator delete((void *)v299.n128_u64[0]);
    }
    if (SHIBYTE(__dst) < 0) {
      operator delete(v291);
    }
    uint64_t v307 = (maps::path_codec **)*MEMORY[0x1E4FBA418];
    *(maps::path_codec ***)((char *)&v307 + (void)*(v307 - 3)) = *(maps::path_codec ***)(MEMORY[0x1E4FBA418] + 24);
    v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
    if (v314 < 0) {
      operator delete(v313);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x18C11F4F0](v315);
    uint64_t v29 = v280;
    double v31 = v281;
  }
  v207 = (__n128 *)*((void *)v29 + 2);
  __n128 v208 = v207[1];
  __n128 v299 = *v207;
  __n128 v300 = v208;
  if (v29 == v31)
  {
LABEL_297:
    (*(void (**)(void **__return_ptr))(*(void *)v262 + 32))(&v291);
    if (BYTE4(v295))
    {
      if (!maps::path_codec::Logger::m_log_level)
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Computing origin/destination fractions.", 39);
        std::string::basic_string[abi:ne180100]<0>(&v288, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
        std::stringbuf::str();
        maps::path_codec::Logger::log_trace((uint64_t)&v288, 110, (uint64_t)&v304);
        if (SHIBYTE(v306) < 0) {
          operator delete(v304);
        }
        if (v289.n128_i8[7] < 0) {
          operator delete((void *)v288.n128_u64[0]);
        }
        uint64_t v307 = (maps::path_codec **)*MEMORY[0x1E4FBA418];
        *(maps::path_codec ***)((char *)&v307 + (void)*(v307 - 3)) = *(maps::path_codec ***)(MEMORY[0x1E4FBA418] + 24);
        v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
        if (v314 < 0) {
          operator delete(v313);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x18C11F4F0](v315);
      }
      double v212 = maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_segment_fraction(v262, (uint64_t)&v299, v280);
      BOOL v213 = v212 <= maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_segment_fraction(v262, (uint64_t)&v299, (maps::path_codec *)((char *)v281 - 72));
    }
    else
    {
      BOOL v213 = 0;
    }
    if (SBYTE7(v298) < 0) {
      operator delete(v296);
    }
    if (v292)
    {
      __dst = v292;
      operator delete(v292);
    }
    if (!v213) {
      goto LABEL_336;
    }
    *(void *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_DWORD *)(a1 + 120) = 1065353216;
    *(unsigned char *)(a1 + 128) = 0;
    uint64_t v214 = v280;
    v215 = (_OWORD *)*((void *)v280 + 2);
    v216 = operator new(0x20uLL);
    long long v217 = v215[1];
    _OWORD *v216 = *v215;
    v216[1] = v217;
    *(void *)(a1 + 24) = v216 + 2;
    *(void *)(a1 + 32) = v216 + 2;
    *(void *)(a1 + 16) = v216;
    v218 = operator new(1uLL);
    unsigned char *v218 = *((unsigned char *)v214 + 45);
    *(void *)(a1 + 48) = v218 + 1;
    *(void *)(a1 + 56) = v218 + 1;
    *(void *)(a1 + 40) = v218;
    v219 = v281;
    uint64_t v220 = a1;
    if (v214 != v281)
    {
      double v221 = 0;
      id v222 = 0;
      double v223 = 0;
      do
      {
        v224 = (long long *)((char *)v214 + 48);
        if (*((unsigned char *)v214 + 48))
        {
          double v225 = maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_segment_fraction(v262, (uint64_t)v216, v214);
          double v226 = v225;
          if (v223 >= v222)
          {
            unint64_t v228 = 0xAAAAAAAAAAAAAAABLL * ((v223 - v221) >> 4) + 1;
            if (v228 > 0x555555555555555) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * ((v222 - v221) >> 4) > v228) {
              unint64_t v228 = 0x5555555555555556 * ((v222 - v221) >> 4);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v222 - v221) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
              unint64_t v229 = 0x555555555555555;
            }
            else {
              unint64_t v229 = v228;
            }
            v230 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(v229);
            unint64_t v232 = &v230[16 * ((v223 - v221) >> 4)];
            *(void *)unint64_t v232 = 0;
            *((double *)v232 + 1) = v226;
            long long v233 = *v224;
            *((void *)v232 + 4) = *((void *)v214 + 8);
            *((_OWORD *)v232 + 1) = v233;
            v232[40] = 0;
            if (v223 == v221)
            {
              v235 = &v230[16 * ((v223 - v221) >> 4)];
            }
            else
            {
              unint64_t v234 = &v230[16 * ((v223 - v221) >> 4)];
              do
              {
                v235 = v234 - 48;
                long long v236 = *((_OWORD *)v223 - 3);
                long long v237 = *((_OWORD *)v223 - 1);
                *((_OWORD *)v234 - 2) = *((_OWORD *)v223 - 2);
                *((_OWORD *)v234 - 1) = v237;
                *((_OWORD *)v234 - 3) = v236;
                v223 -= 48;
                v234 -= 48;
              }
              while (v223 != v221);
            }
            id v222 = &v230[48 * v231];
            double v223 = v232 + 48;
            *(void *)(a1 + 64) = v235;
            *(void *)(a1 + 72) = v232 + 48;
            *(void *)(a1 + 80) = v222;
            if (v221) {
              operator delete(v221);
            }
            double v221 = v235;
          }
          else
          {
            *(void *)double v223 = 0;
            *((double *)v223 + 1) = v225;
            long long v227 = *v224;
            *((void *)v223 + 4) = *((void *)v214 + 8);
            *((_OWORD *)v223 + 1) = v227;
            v223[40] = 0;
            v223 += 48;
          }
          uint64_t v220 = a1;
          *(void *)(a1 + 72) = v223;
        }
        else
        {
          uint64_t v220 = a1;
        }
        uint64_t v214 = (maps::path_codec *)((char *)v214 + 72);
      }
      while (v214 != v219);
    }
    id v10 = v255;
    maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::compute_terminal_fractions(&v262, v220, (uint64_t)&v280);
  }
  else
  {
    while (1)
    {
      int v209 = (uint64_t *)*((void *)v29 + 2);
      uint64_t v210 = *v209;
      if (*v209)
      {
        v211 = &v299;
      }
      else
      {
        uint64_t v210 = v209[1];
        v211 = (__n128 *)&v299.n128_i8[8];
      }
      if (v210 != v211->n128_u64[0]) {
        break;
      }
      uint64_t v29 = (maps::path_codec *)((char *)v29 + 72);
      if (v29 == v31) {
        goto LABEL_297;
      }
    }
LABEL_336:
    uint64_t v220 = a1;
    maps::path_codec::PathDecoder<GEOPathMatcherRoadKey>::decode_multi_segment_path(a1, (uint64_t)&v262, (uint64_t *)&v280);
  }
  v238 = (uint64_t *)*((void *)&v279 + 1);
  if (!*((void *)&v279 + 1)) {
    v238 = &maps::path_codec::geo3::_RoutingPathLeg_MetaData_default_instance_;
  }
  int v239 = *((_DWORD *)v238 + 6);
  if (v239 == 2) {
    char v240 = 2;
  }
  else {
    char v240 = v239 == 1;
  }
  *(unsigned char *)(v220 + 128) = v240;
  std::chrono::steady_clock::now();
  if (maps::path_codec::Logger::m_log_level <= 1u)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v307);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v307, (uint64_t)"Decoded path with ", 18);
    v241 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v241, (uint64_t)" segments (origin_fraction: ", 28);
    v242 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v242, (uint64_t)", destination_fraction: ", 24);
    v243 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v243, (uint64_t)") in ", 5);
    double v244 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v244, (uint64_t)" ms.", 4);
    std::string::basic_string[abi:ne180100]<0>(&v291, "/Library/Caches/com.apple.xbs/Sources/GeoServices/libpathcodec/path-codec/src/path-codec/PathDecoder.cpp");
    std::stringbuf::str();
    maps::path_codec::Logger::log_debug((uint64_t)&v291, 67, (uint64_t)&v299);
    if (v300.n128_i8[7] < 0) {
      operator delete((void *)v299.n128_u64[0]);
    }
    if (SHIBYTE(__dst) < 0) {
      operator delete(v291);
    }
    uint64_t v307 = (maps::path_codec **)*MEMORY[0x1E4FBA418];
    *(maps::path_codec ***)((char *)&v307 + (void)*(v307 - 3)) = *(maps::path_codec ***)(MEMORY[0x1E4FBA418] + 24);
    v308 = (maps::path_codec *)(MEMORY[0x1E4FBA470] + 16);
    if (v314 < 0) {
      operator delete(v313);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x18C11F4F0](v315);
  }
LABEL_277:
  uint64_t v307 = &v280;
  std::vector<maps::path_codec::SnappedSupportPoint<GEOPathMatcherRoadKey>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v307);
  std::mutex::lock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
  maps::path_codec::Logger::m_logger = 0;
  std::mutex::unlock(&maps::path_codec::Logger::get_mutex(void)::MUTEX);
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v277);
LABEL_278:
}

void __33__GEOPathMatcher__cachedSegments__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_addCoordinatesFromRoad:(id)a3 routeCoordinates:(id)a4 offsetFromStartOfPath:(double)a5 errorScale:(double)a6 offsetFromPathToCurrentPoint:(double *)a7 outCoordinates:(void *)a8
{
  id v51 = a3;
  id v13 = a4;
  uint64_t v14 = [v51 coordinates3d];
  long long v54 = *(_OWORD *)v14;
  uint64_t v55 = *(void *)(v14 + 16);
  uint64_t v15 = [v13 routeCoordinateForDistanceAfterStart:a5 + *a7 * a6];
  uint64_t v16 = v15;
  unint64_t v17 = *((void *)a8 + 2);
  unint64_t v18 = *((void *)a8 + 1);
  if (v18 >= v17)
  {
    uint64_t v20 = (uint64_t)(v18 - *(void *)a8) >> 5;
    unint64_t v21 = v20 + 1;
    if ((unint64_t)(v20 + 1) >> 59) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v22 = v17 - *(void *)a8;
    if (v22 >> 4 > v21) {
      unint64_t v21 = v22 >> 4;
    }
    if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v23 = v21;
    }
    if (v23) {
      unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)a8 + 16, v23);
    }
    else {
      unint64_t v24 = 0;
    }
    uint64_t v25 = &v24[32 * v20];
    unint64_t v26 = &v24[32 * v23];
    *(_OWORD *)uint64_t v25 = v54;
    *((void *)v25 + 2) = v55;
    *((void *)v25 + 3) = v16;
    uint64_t v19 = v25 + 32;
    int v28 = *(char **)a8;
    uint64_t v27 = (char *)*((void *)a8 + 1);
    if (v27 != *(char **)a8)
    {
      do
      {
        long long v29 = *((_OWORD *)v27 - 1);
        *((_OWORD *)v25 - 2) = *((_OWORD *)v27 - 2);
        *((_OWORD *)v25 - 1) = v29;
        v25 -= 32;
        v27 -= 32;
      }
      while (v27 != v28);
      uint64_t v27 = *(char **)a8;
    }
    *(void *)a8 = v25;
    *((void *)a8 + 1) = v19;
    *((void *)a8 + 2) = v26;
    if (v27) {
      operator delete(v27);
    }
  }
  else
  {
    *(_OWORD *)unint64_t v18 = v54;
    *(void *)(v18 + 16) = v55;
    *(void *)(v18 + 24) = v15;
    uint64_t v19 = (char *)(v18 + 32);
  }
  *((void *)a8 + 1) = v19;
  for (unint64_t i = 1; i < [v51 coordinateCount]; ++i)
  {
    uint64_t v31 = [v51 coordinates3d];
    uint64_t v32 = [v51 coordinates3d];
    unint64_t v33 = v31 + 24 * i;
    unint64_t v34 = v32 + 24 * i;
    double v35 = GEOCalculateDistanceRadius(*(double *)(v33 - 24), *(double *)(v33 - 16), *(double *)v34, *(double *)(v34 + 8), 6367000.0)+ *a7;
    *a7 = v35;
    long long v52 = *(_OWORD *)v34;
    uint64_t v53 = *(void *)(v34 + 16);
    uint64_t v36 = [v13 routeCoordinateForDistanceAfterStart:a5 + v35 * a6];
    uint64_t v37 = v36;
    unint64_t v38 = *((void *)a8 + 1);
    unint64_t v39 = *((void *)a8 + 2);
    if (v38 >= v39)
    {
      uint64_t v41 = (uint64_t)(v38 - *(void *)a8) >> 5;
      unint64_t v42 = v41 + 1;
      if ((unint64_t)(v41 + 1) >> 59) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v43 = v39 - *(void *)a8;
      if (v43 >> 4 > v42) {
        unint64_t v42 = v43 >> 4;
      }
      if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v44 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v44 = v42;
      }
      if (v44) {
        unsigned int v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)a8 + 16, v44);
      }
      else {
        unsigned int v45 = 0;
      }
      uint64_t v46 = &v45[32 * v41];
      *(_OWORD *)uint64_t v46 = v52;
      *((void *)v46 + 2) = v53;
      *((void *)v46 + 3) = v37;
      double v48 = *(char **)a8;
      int v47 = (char *)*((void *)a8 + 1);
      unint64_t v49 = v46;
      if (v47 != *(char **)a8)
      {
        do
        {
          long long v50 = *((_OWORD *)v47 - 1);
          *((_OWORD *)v49 - 2) = *((_OWORD *)v47 - 2);
          *((_OWORD *)v49 - 1) = v50;
          v49 -= 32;
          v47 -= 32;
        }
        while (v47 != v48);
        int v47 = *(char **)a8;
      }
      int v40 = v46 + 32;
      *(void *)a8 = v49;
      *((void *)a8 + 1) = v46 + 32;
      *((void *)a8 + 2) = &v45[32 * v44];
      if (v47) {
        operator delete(v47);
      }
    }
    else
    {
      *(_OWORD *)unint64_t v38 = v52;
      *(void *)(v38 + 16) = v53;
      *(void *)(v38 + 24) = v36;
      int v40 = (char *)(v38 + 32);
    }
    *((void *)a8 + 1) = v40;
  }
}

- (BOOL)_verifySegmentDistanceFromRoute:(id)a3 segmentIndex:(int64_t)a4 requestedPathRange:(GEOPolylineCoordinateRange)a5
{
  uint64_t end = (uint64_t)a5.end;
  uint64_t start = (uint64_t)a5.start;
  int v7 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((unint64_t)[v9 pointCount] >= 2
    && ([v9 startLocationCoordinate],
        double v11 = v10,
        double v13 = v12,
        -[GEOComposedRoute pointAtRouteCoordinate:](self->_route, "pointAtRouteCoordinate:", [v9 startRouteCoordinate]), double v16 = GEOCalculateDistanceRadius(v11, v13, v14, v15, 6367000.0), v16 > 25.0))
  {
    unint64_t v18 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      loggingIdentifier = self->_loggingIdentifier;
      unint64_t v21 = GEOPolylineCoordinateRangeAsString(start, end, v19);
      int v23 = 138413058;
      unint64_t v24 = loggingIdentifier;
      __int16 v25 = 1024;
      int v26 = v7;
      __int16 v27 = 2048;
      double v28 = v16;
      __int16 v29 = 2112;
      uint64_t v30 = v21;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "(%@) Matched segment (%d) is a significant distance (%0.1f meters) from the route. This likely means the path matcher snapped to the wrong road. Path range: [%@]", (uint8_t *)&v23, 0x26u);
    }
    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)shouldSaveInternalInfo
{
  return self->_shouldSaveInternalInfo;
}

- (void)setShouldSaveInternalInfo:(BOOL)a3
{
  self->_shouldSaveInternalInfo = a3;
}

- (id)internalInfos
{
  uint64_t v4 = 0;
  float v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__64;
  uint64_t v8 = __Block_byref_object_dispose__64;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __31__GEOPathMatcher_internalInfos__block_invoke(uint64_t a1)
{
}

- (void)setInternalInfos:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync();
}

void __35__GEOPathMatcher_setInternalInfos___block_invoke(uint64_t a1)
{
}

- (double)preloadDistance
{
  return self->_preloadDistance;
}

- (void)setPreloadDistance:(double)a3
{
  self->_preloadDistance = a3;
}

- (BOOL)shouldDropDivergingSegments
{
  return self->_shouldDropDivergingSegments;
}

- (void)setShouldDropDivergingSegments:(BOOL)a3
{
  self->_shouldDropDivergingSegments = a3;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void)setForceSync:(BOOL)a3
{
  self->_forceSync = a3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInfosIsolater, 0);
  objc_storeStrong((id *)&self->_internalInfos, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  begin = self->_failedRanges.__begin_;
  if (begin)
  {
    self->_failedRanges.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_matchedSegmentsIsolater, 0);
  objc_storeStrong((id *)&self->_matchedSegments, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end