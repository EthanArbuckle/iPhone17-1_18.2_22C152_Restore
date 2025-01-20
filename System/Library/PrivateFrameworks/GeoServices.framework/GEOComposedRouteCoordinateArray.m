@interface GEOComposedRouteCoordinateArray
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)coordinateForRouteCoordinate:(PolylineCoordinate)a3;
- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnPath:(unint64_t)a3 coordinateIndex:(unint64_t)a4;
- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnRouteAt:(unint64_t)a3;
- (BOOL)usesRoutingPathPoints;
- (BOOL)usesZilch;
- (ControlPoint)zilchControlPointAt:(SEL)a3;
- (GEOComposedRouteCoordinateArray)init;
- (GEOComposedRouteCoordinateArray)initWithCoder:(id)a3;
- (GEOComposedRouteCoordinateArray)initWithPointData:(id)a3 lengthMarkers:(id)a4 usesZilch:(BOOL)a5;
- (GEOComposedRouteCoordinateArray)initWithRawRouteGeometry:(id)a3;
- (GEOPolylineCoordinateRange)routeCoordinateRangeForPathIndex:(unint64_t)a3;
- (GEOPolylineCoordinateRangeArray)noMatchRanges;
- (PolylineCoordinate)nearestSupportPointAfterRouteCoordinate:(PolylineCoordinate)a3;
- (PolylineCoordinate)nearestSupportPointBeforeRouteCoordinate:(PolylineCoordinate)a3;
- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 afterRouteCoordinate:(PolylineCoordinate)a4;
- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 afterStartOfPathIndex:(unint64_t)a4;
- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 beforeEndOfPathIndex:(unint64_t)a4;
- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 beforeRouteCoordinate:(PolylineCoordinate)a4;
- (PolylineCoordinate)routeCoordinateForDistanceAfterStart:(double)a3;
- (PolylineCoordinate)routeCoordinateForDistanceBeforeEnd:(double)a3;
- (RoutingPathLeg)routingPathDataWithinSupportPoints:(SEL)a3 supportPointsOnly:(id)a4;
- (RoutingPathLeg)routingPathFromStart:(SEL)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(PolylineCoordinate)a5 convertEndpointsToSupportPoints:(BOOL)a6;
- (RoutingPathLeg)routingPathWithSupportPointFromStart:(SEL)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(PolylineCoordinate)a5 startPathSegment:(BOOL)a6;
- (double)_length;
- (double)distanceBetweenIndex:(unint64_t)a3 andIndex:(unint64_t)a4;
- (double)distanceBetweenRouteCoordinate:(PolylineCoordinate)a3 andRouteCoordinate:(PolylineCoordinate)a4;
- (double)distanceFromStartToEndOfPathIndex:(unint64_t)a3;
- (double)distanceFromStartToIndex:(unint64_t)a3;
- (double)distanceFromStartToRouteCoordinate:(PolylineCoordinate)a3;
- (double)distanceFromStartToStartOfPathIndex:(unint64_t)a3;
- (double)distanceToEndFromIndex:(unint64_t)a3;
- (double)distanceToEndFromRouteCoordinate:(PolylineCoordinate)a3;
- (id)_supportPointsForRange:(uint64_t)a3 shouldEncompassRange:(unsigned int)a4;
- (id)compressedDataForRoutingPath:(const void *)a3;
- (id)compressedZilchDataToEndOfPathFromIndex:(unint64_t)a3;
- (id)description;
- (id)rawRouteGeometry;
- (id)routingPathDataFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(BOOL)a5;
- (id)routingPathDataWithSupportPointFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(BOOL)a5 startPathSegment:(id)a6;
- (id)supportPointAtRouteCoordinate:(PolylineCoordinate)a3;
- (id)supportPointsEncompassingRange:(GEOPolylineCoordinateRange)a3;
- (id)supportPointsForPathAtIndex:(unint64_t)a3;
- (id)supportPointsWithinRange:(GEOPolylineCoordinateRange)a3;
- (unint64_t)_localCoordinateIndexForRouteIndex:(uint64_t)a1;
- (unint64_t)_nearestSupportPointRouteCoordinateForRouteCoordinate:(uint64_t)a3 beforeCoordinate:(double)a4;
- (unint64_t)_routeCoordinateForOffset:(double)a3 fromRouteCoordinate:;
- (unint64_t)coordinateCount;
- (unint64_t)coordinateCountForPathAtIndex:(unint64_t)a3;
- (unint64_t)nearestSupportPointIndexForRouteCoordinate:(PolylineCoordinate)a3 beforeCoordinate:(BOOL)a4;
- (unint64_t)pathIndexForRouteCoordinate:(PolylineCoordinate)a3;
- (unint64_t)pathIndexForRouteIndex:(unint64_t)a3;
- (unint64_t)pathsCount;
- (unint64_t)routeIndexForLocalIndex:(unint64_t)a3 onPath:(unint64_t)a4;
- (void)_addPointToRoutingPath:(void *)a3 coordinate:(id)a4 supportPoint:(id)a5 distanceFromStart:(double)a6;
- (void)_populateRoutingPathWithCoordinate:(void *)a3 pathIndex:(unint64_t)a4 startIndex:(unint64_t)a5 endIndex:(unint64_t)a6 distanceFromStartOffset:(double)a7 supportPointsOnly:(BOOL)a8 convertEndpointsToSupportPoints:(BOOL)a9;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteCoordinateArray

- (GEOComposedRouteCoordinateArray)init
{
  result = (GEOComposedRouteCoordinateArray *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOComposedRouteCoordinateArray)initWithRawRouteGeometry:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v73 = a3;
  v90.receiver = self;
  v90.super_class = (Class)GEOComposedRouteCoordinateArray;
  v78 = [(GEOComposedRouteCoordinateArray *)&v90 init];
  if (v78)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    v5 = [v73 paths];
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    id v76 = (id)objc_claimAutoreleasedReturnValue();

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v6 = [v73 paths];
    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v86 objects:v103 count:16];
    v8 = 0;
    if (!v7) {
      goto LABEL_107;
    }
    uint64_t v75 = *(void *)v87;
    while (1)
    {
      uint64_t v77 = v7;
      uint64_t v9 = 0;
      v80 = (double *)v8;
      do
      {
        if (*(void *)v87 != v75) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v86 + 1) + 8 * v9);
        v11 = [_GEOCoordinatePath alloc];
        unint64_t coordinateCount = v78->_coordinateCount;
        id v79 = v10;
        if (v11)
        {
          v101.receiver = v11;
          v101.super_class = (Class)_GEOCoordinatePath;
          v8 = [(GEOComposedRouteCoordinateArray *)&v101 init];
          if (!v8) {
            goto LABEL_91;
          }
          if (v79)
          {
            [v79 decompressedPathData];
            unint64_t v12 = (int)v99;
            if (v99)
            {
              __p = 0;
              v95 = 0;
              v96 = 0;
              std::vector<GEOLocationCoordinate3D>::reserve(&__p, (int)v99);
              id v81 = [MEMORY[0x1E4F1CA48] array];
              v91 = 0;
              v92 = 0;
              unint64_t v93 = 0;
              std::vector<double>::reserve(&v91, v12);
              unint64_t v13 = 0;
              unint64_t v14 = 0;
              if (v12 <= 1) {
                uint64_t v15 = 1;
              }
              else {
                uint64_t v15 = v12;
              }
              double v16 = -180.0;
              double v17 = -180.0;
              do
              {
                double v18 = v17;
                double v19 = v16;
                uint64_t v20 = *(void *)(*((void *)&v99 + 1) + 8 * (int)v13 + 8);
                v21 = *(uint64_t **)(v20 + 32);
                if (!v21) {
                  v21 = &maps::path_codec::geo3::_LatLngE7_default_instance_;
                }
                +[GEOLatLngE7 fromE7Coordinate:*((unsigned int *)v21 + 6)];
                double v17 = v22;
                v23 = *(uint64_t **)(v20 + 32);
                if (!v23) {
                  v23 = &maps::path_codec::geo3::_LatLngE7_default_instance_;
                }
                +[GEOLatLngE7 fromE7Coordinate:*((unsigned int *)v23 + 7)];
                double v16 = v24;
                double v25 = (float)*(int *)(v20 + 56) * 0.01;
                v26 = v95;
                if (v95 >= v96)
                {
                  v28 = (char *)__p;
                  unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((v95 - (unsigned char *)__p) >> 3);
                  unint64_t v30 = v29 + 1;
                  if (v29 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x5555555555555556 * ((v96 - (unsigned char *)__p) >> 3) > v30) {
                    unint64_t v30 = 0x5555555555555556 * ((v96 - (unsigned char *)__p) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((v96 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                    unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v31 = v30;
                  }
                  if (v31)
                  {
                    v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v96, v31);
                    v28 = (char *)__p;
                    v26 = v95;
                  }
                  else
                  {
                    v32 = 0;
                  }
                  v33 = (double *)&v32[24 * v29];
                  double *v33 = v17;
                  v33[1] = v16;
                  v33[2] = v25;
                  v34 = v33;
                  if (v26 != v28)
                  {
                    do
                    {
                      long long v35 = *(_OWORD *)(v26 - 24);
                      *(v34 - 1) = *((double *)v26 - 1);
                      *(_OWORD *)(v34 - 3) = v35;
                      v34 -= 3;
                      v26 -= 24;
                    }
                    while (v26 != v28);
                    v28 = (char *)__p;
                  }
                  v27 = (char *)(v33 + 3);
                  __p = v34;
                  v95 = (char *)(v33 + 3);
                  v96 = &v32[24 * v31];
                  if (v28) {
                    operator delete(v28);
                  }
                }
                else
                {
                  *(double *)v95 = v17;
                  *((double *)v26 + 1) = v24;
                  v27 = v26 + 24;
                  *((double *)v26 + 2) = v25;
                }
                v95 = v27;
                if (*(_DWORD *)(v20 + 84) == 1)
                {
                  v36 = objc_alloc_init(GEOCoordinateArraySupportPoint);
                  [(GEOCoordinateArraySupportPoint *)v36 setRouteCoordinate:(v13 + coordinateCount)];
                  [(GEOCoordinateArraySupportPoint *)v36 setIndex:v13];
                  [(GEOCoordinateArraySupportPoint *)v36 setRoadID:*(void *)(v20 + 48)];
                  LODWORD(v37) = *(_DWORD *)(v20 + 60);
                  [(GEOCoordinateArraySupportPoint *)v36 setHeading:(double)v37];
                  [(GEOCoordinateArraySupportPoint *)v36 setIsUTurn:*(unsigned __int8 *)(v20 + 76)];
                  [(GEOCoordinateArraySupportPoint *)v36 setLegacyRoadClass:*(unsigned int *)(v20 + 64)];
                  [(GEOCoordinateArraySupportPoint *)v36 setLegacyFormOfWay:*(unsigned int *)(v20 + 68)];
                  if ((*(unsigned char *)(v20 + 16) & 4) != 0)
                  {
                    v38 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_uuidForHighBytes:lowBytes:", *(void *)(*(void *)(v20 + 40) + 24), *(void *)(*(void *)(v20 + 40) + 32));
                    [(GEOCoordinateArraySupportPoint *)v36 setAnchorPointID:v38];
                  }
                  [v81 addObject:v36];
                }
                if (v19 < -180.0 || v19 > 180.0 || v18 < -90.0 || v18 > 90.0)
                {
                  v43 = v92;
                  if ((unint64_t)v92 >= v93)
                  {
                    v45 = v91;
                    uint64_t v46 = ((char *)v92 - (unsigned char *)v91) >> 3;
                    unint64_t v47 = v46 + 1;
                    if ((unint64_t)(v46 + 1) >> 61) {
                      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v48 = v93 - (void)v91;
                    if ((uint64_t)(v93 - (void)v91) >> 2 > v47) {
                      unint64_t v47 = v48 >> 2;
                    }
                    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v49 = v47;
                    }
                    if (v49)
                    {
                      v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v93, v49);
                      v45 = v91;
                      v43 = v92;
                    }
                    else
                    {
                      v50 = 0;
                    }
                    v57 = &v50[8 * v46];
                    *(void *)v57 = 0;
                    v44 = v57 + 8;
                    while (v43 != v45)
                    {
                      uint64_t v58 = *--v43;
                      *((void *)v57 - 1) = v58;
                      v57 -= 8;
                    }
                    v91 = v57;
                    v92 = v44;
                    unint64_t v93 = (unint64_t)&v50[8 * v49];
                    if (v45) {
                      operator delete(v45);
                    }
                  }
                  else
                  {
                    void *v92 = 0;
                    v44 = v43 + 1;
                  }
                  v92 = v44;
                }
                else
                {
                  long double v39 = GEOCalculateDistanceRadius(v18, v19, v17, v16, 6367000.0);
                  v40 = v92;
                  double v41 = v39 + *((double *)v92 - 1);
                  if ((unint64_t)v92 >= v93)
                  {
                    v51 = v91;
                    uint64_t v52 = ((char *)v92 - (unsigned char *)v91) >> 3;
                    unint64_t v53 = v52 + 1;
                    if ((unint64_t)(v52 + 1) >> 61) {
                      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v54 = v93 - (void)v91;
                    if ((uint64_t)(v93 - (void)v91) >> 2 > v53) {
                      unint64_t v53 = v54 >> 2;
                    }
                    if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8) {
                      unint64_t v55 = 0x1FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v55 = v53;
                    }
                    if (v55)
                    {
                      v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v93, v55);
                      v51 = v91;
                      v40 = v92;
                    }
                    else
                    {
                      v56 = 0;
                    }
                    v59 = (double *)&v56[8 * v52];
                    double *v59 = v41;
                    v42 = v59 + 1;
                    while (v40 != v51)
                    {
                      uint64_t v60 = *--v40;
                      *((void *)v59-- - 1) = v60;
                    }
                    v91 = v59;
                    v92 = v42;
                    unint64_t v93 = (unint64_t)&v56[8 * v55];
                    if (v51) {
                      operator delete(v51);
                    }
                  }
                  else
                  {
                    *(double *)v92 = v41;
                    v42 = v40 + 1;
                  }
                  v92 = v42;
                  int v61 = *(_DWORD *)(v20 + 72);
                  if (v61)
                  {
                    -[_GEOCoordinatePath calibratePointLengths:startIndex:endIndex:rangeLength:]((uint64_t)v8, (uint64_t)v91, v14, v13, (float)(v61- *(_DWORD *)(*(void *)(*((void *)&v99 + 1) + 8 * (int)v14 + 8) + 72))* 0.01);
                    unint64_t v14 = v13;
                  }
                }
                ++v13;
              }
              while (v13 != v15);
              -[_GEOCoordinatePath setBasicCoordinates:](v8, (uint64_t)&__p);
              objc_storeStrong((id *)v8 + 8, v81);
              v62 = v8 + 72;
              if (*((void *)v8 + 9) == *((void *)v8 + 10))
              {
                if (v62 != (char *)&v91) {
                  std::vector<maps::path_codec::CostFunction::AngleCost>::__assign_with_size[abi:ne180100]<maps::path_codec::CostFunction::AngleCost const*,maps::path_codec::CostFunction::AngleCost const*>(v62, (char *)v91, (uint64_t)v92, ((char *)v92 - (unsigned char *)v91) >> 3);
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _pointLengths.empty()", buf, 2u);
              }
              *((void *)v8 + 12) = coordinateCount;
              v63 = v8;
              if (v91)
              {
                v92 = v91;
                operator delete(v91);
              }

              if (__p)
              {
                v95 = (char *)__p;
                operator delete(__p);
              }
LABEL_90:
              maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)&v97);

              goto LABEL_91;
            }
          }
          else
          {
            long long v99 = 0u;
            long long v100 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
          }
          v64 = GEOGetGEOComposedRouteLog();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            LOWORD(__p) = 0;
            _os_log_impl(&dword_188D96000, v64, OS_LOG_TYPE_ERROR, "Routing path has no geometry. This is most likely a server error.", (uint8_t *)&__p, 2u);
          }

          v65 = v8;
          goto LABEL_90;
        }
        v8 = 0;
LABEL_91:

        double v66 = 0.0;
        if (v80)
        {
          double v67 = v80[13];
          uint64_t v68 = *((void *)v80 + 10);
          if (*((void *)v80 + 9) != v68) {
            double v66 = *(double *)(v68 - 8);
          }
          if (v8)
          {
LABEL_95:
            double v66 = v67 + v66;
            *((double *)v8 + 13) = v66;
          }
        }
        else
        {
          double v67 = 0.0;
          if (v8) {
            goto LABEL_95;
          }
        }
        objc_msgSend(v76, "addObject:", v8, v66, v67);
        if (v8) {
          uint64_t v69 = *((void *)v8 + 7);
        }
        else {
          uint64_t v69 = 0;
        }
        v78->_coordinateCount += v69;

        ++v9;
        v80 = (double *)v8;
      }
      while (v9 != v77);
      v6 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v86 objects:v103 count:16];
      if (!v7)
      {
LABEL_107:

        objc_storeStrong((id *)&v78->_paths, v76);
        v78->_usesRoutingPathPoints = 1;
        *(void *)&long long v97 = 0;
        *((void *)&v97 + 1) = &v97;
        *(void *)&long long v98 = 0x3032000000;
        *((void *)&v98 + 1) = __Block_byref_object_copy__59;
        *(void *)&long long v99 = __Block_byref_object_dispose__59;
        *((void *)&v99 + 1) = 0;
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __60__GEOComposedRouteCoordinateArray_initWithRawRouteGeometry___block_invoke;
        v83[3] = &unk_1E53E6528;
        v70 = v78;
        v84 = v70;
        v85 = &v97;
        [v73 pathMatcherNoMatchRangesWithHandler:v83];
        objc_storeStrong(v70 + 4, *(id *)(*((void *)&v97 + 1) + 40));
        v71 = v70;

        _Block_object_dispose(&v97, 8);
        break;
      }
    }
  }

  return v78;
}

uint64_t __60__GEOComposedRouteCoordinateArray_initWithRawRouteGeometry___block_invoke(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = 0.0;
  if (v7)
  {
    if ([*(id *)(v7 + 8) count] <= a2)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: pathIndex < _paths.count", v26, 2u);
      }
    }
    else if (a2)
    {
      uint64_t v10 = 0;
      do
      {
        v11 = [*(id *)(v7 + 8) objectAtIndexedSubscript:v10];
        double v12 = 0.0;
        if (v11)
        {
          uint64_t v13 = v11[10];
          if (v11[9] != v13) {
            double v12 = *(double *)(v13 - 8);
          }
        }
        double v8 = v8 + v12;

        ++v10;
      }
      while (a2 != v10);
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) routeCoordinateForDistanceAfterStart:v8 + a3];
  uint64_t v15 = [*(id *)(a1 + 32) routeCoordinateForDistanceAfterStart:v8 + a4];
  double v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v16)
  {
    double v17 = objc_alloc_init(GEOPolylineCoordinateRangeArray);
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    double v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    double v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  unint64_t v20 = 0xBF80000000000000;
  float v21 = floorf(*((float *)&v14 + 1));
  uint64_t v22 = vcvtms_u32_f32(*((float *)&v14 + 1)) + v14;
  if (*((float *)&v14 + 1) >= 0.0) {
    unint64_t v20 = (unint64_t)COERCE_UNSIGNED_INT(*((float *)&v14 + 1) - v21) << 32;
  }
  else {
    uint64_t v22 = 0;
  }
  unint64_t v23 = (vcvtms_u32_f32(*((float *)&v15 + 1)) + v15) | ((unint64_t)COERCE_UNSIGNED_INT(*((float *)&v15 + 1)- floorf(*((float *)&v15 + 1))) << 32);
  if (*((float *)&v15 + 1) >= 0.0) {
    unint64_t v24 = v23;
  }
  else {
    unint64_t v24 = 0xBF80000000000000;
  }

  return objc_msgSend(v16, "addCoordinateRange:", v20 | v22, v24);
}

- (GEOComposedRouteCoordinateArray)initWithPointData:(id)a3 lengthMarkers:(id)a4 usesZilch:(BOOL)a5
{
  BOOL v5 = a5;
  v131[14] = *MEMORY[0x1E4F143B8];
  id v109 = a3;
  id v108 = a4;
  v120.receiver = self;
  v120.super_class = (Class)GEOComposedRouteCoordinateArray;
  double v8 = [(GEOComposedRouteCoordinateArray *)&v120 init];
  uint64_t v9 = v8;
  v119 = v8;
  if (v8)
  {
    v8->_usesZilch = v5;
    if (v5)
    {
      id v110 = v109;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v110, "count"));
      v116 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9->_unint64_t coordinateCount = 0;
      long long v127 = 0u;
      long long v128 = 0u;
      *(_OWORD *)v125 = 0u;
      long long v126 = 0u;
      id obj = v110;
      uint64_t v10 = [obj countByEnumeratingWithState:v125 objects:&v129 count:16];
      if (v10)
      {
        uint64_t v114 = *(void *)v126;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v126 != v114) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(id *)(*(void *)&v125[8] + 8 * v11);
            uint64_t v13 = (const void *)[v12 bytes];
            uint64_t v14 = [v12 length];
            __p = 0;
            v123 = 0;
            v124 = 0;
            std::vector<zilch::ControlPoint>::__init_with_size[abi:ne180100]<zilch::ControlPoint*,zilch::ControlPoint*>(&__p, v13, (uint64_t)v13 + (v14 & 0xFFFFFFFFFFFFFFE0), v14 >> 5);
            uint64_t v15 = objc_alloc_init(_GEOCoordinatePath);
            double v16 = v15;
            if (v15)
            {
              if (v15->_basicCoordinates.__begin_ == v15->_basicCoordinates.__end_)
              {
                p_zilchPoints = (char *)&v15->_zilchPoints;
                if (&v16->_zilchPoints != (vector<zilch::ControlPoint, std::allocator<zilch::ControlPoint>> *)&__p) {
                  std::vector<zilch::ControlPoint>::__assign_with_size[abi:ne180100]<zilch::ControlPoint*,zilch::ControlPoint*>(p_zilchPoints, (char *)__p, (uint64_t)v123, (v123 - (unsigned char *)__p) >> 5);
                }
                v16->_unint64_t count = v16->_zilchPoints.__end_ - v16->_zilchPoints.__begin_;
                if (GEOConfigGetBOOL(GeoServicesConfig_HideInvalidRouteElevation, (uint64_t)off_1E9114B58))
                {
                  begin = v16->_zilchPoints.__begin_;
                  if (v16->_zilchPoints.__end_ != begin)
                  {
                    uint64_t v19 = 0;
                    int v20 = 0;
                    unint64_t v21 = 0;
                    do
                    {
                      uint64_t v22 = (zilch::ControlPoint *)&begin[v19];
                      unint64_t v23 = (zilch::GeoCoordinates *)zilch::ControlPoint::position((zilch::ControlPoint *)&begin[v19]);
                      if (zilch::GeoCoordinates::z(v23) == 0x7FFFFFFF)
                      {
                        unint64_t v24 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v22);
                        unsigned int v25 = zilch::GeoCoordinates::x(v24);
                        v26 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v22);
                        unsigned int v27 = zilch::GeoCoordinates::y(v26);
                        v28.var0 = v25;
                        v29.var0 = v27;
                        zilch::GeoCoordinates::GeoCoordinates((uint64_t)buf, v28, v29, v20);
                        zilch::ControlPoint::setPosition((uint64_t)v22, buf);
                      }
                      else
                      {
                        unint64_t v30 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v22);
                        int v20 = zilch::GeoCoordinates::z(v30);
                      }
                      ++v21;
                      begin = v16->_zilchPoints.__begin_;
                      ++v19;
                    }
                    while (v21 < v16->_zilchPoints.__end_ - begin);
                  }
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
              {
                LOWORD(buf[0].var0.var0) = 0;
                _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _basicCoordinates.empty()", (uint8_t *)buf, 2u);
              }
              v16->_pathStartIndex = v119->_coordinateCount;
            }
            [(NSArray *)v116 addObject:v16];
            if (v16) {
              unint64_t count = v16->_count;
            }
            else {
              unint64_t count = 0;
            }
            v119->_coordinateCount += count;

            if (__p)
            {
              v123 = (char *)__p;
              operator delete(__p);
            }
            ++v11;
          }
          while (v11 != v10);
          uint64_t v32 = [obj countByEnumeratingWithState:v125 objects:&v129 count:16];
          uint64_t v10 = v32;
        }
        while (v32);
      }

      paths = v119->_paths;
      v119->_paths = v116;

      v34 = v119;
      if (v119->_coordinateCount)
      {
        long long v35 = 0;
LABEL_69:
        id v118 = v35;
        v59 = [v118 sortedArrayUsingSelector:sel_compare_];
        uint64_t v60 = [v59 objectEnumerator];
        int v61 = [v60 nextObject];
        for (unint64_t i = 0; ; ++i)
        {
          if (i >= [(NSArray *)v119->_paths count])
          {

            v34 = v119;
            goto LABEL_142;
          }
          uint64_t v63 = [(NSArray *)v119->_paths objectAtIndexedSubscript:i];
          uint64_t v64 = v63;
          unint64_t v65 = v63 ? *(void *)(v63 + 56) : 0;
          v129 = 0;
          v130 = 0;
          v131[0] = 0;
          std::vector<double>::reserve(&v129, v65);
          double v66 = -[_GEOCoordinatePath coordinateAt:]((void *)v64, 0);
          double v68 = v67;
          uint64_t v69 = v130;
          if ((unint64_t)v130 >= v131[0])
          {
            v71 = v129;
            uint64_t v72 = ((char *)v130 - (unsigned char *)v129) >> 3;
            unint64_t v73 = v72 + 1;
            if ((unint64_t)(v72 + 1) >> 61) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v74 = v131[0] - (void)v129;
            if ((uint64_t)(v131[0] - (void)v129) >> 2 > v73) {
              unint64_t v73 = v74 >> 2;
            }
            if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v75 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v75 = v73;
            }
            if (v75)
            {
              id v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v131, v75);
              v71 = v129;
              uint64_t v69 = v130;
            }
            else
            {
              id v76 = 0;
            }
            uint64_t v77 = &v76[8 * v72];
            *(void *)uint64_t v77 = 0;
            v70 = v77 + 8;
            while (v69 != v71)
            {
              uint64_t v78 = *--v69;
              *((void *)v77 - 1) = v78;
              v77 -= 8;
            }
            v129 = v77;
            v130 = v70;
            v131[0] = &v76[8 * v75];
            if (v71) {
              operator delete(v71);
            }
          }
          else
          {
            void *v130 = 0;
            v70 = v69 + 1;
          }
          v130 = v70;
          do
          {
            if ([v61 pathIndex] >= i
              && ([v61 pathIndex] != i || objc_msgSend(v61, "pointIndex")))
            {
              break;
            }
            uint64_t v79 = [v60 nextObject];

            int v61 = (void *)v79;
          }
          while (v79);
          if (v65 >= 2)
          {
            unint64_t v80 = 0;
            for (unint64_t j = 1; j != v65; ++j)
            {
              double v82 = -[_GEOCoordinatePath coordinateAt:]((void *)v64, j);
              double v84 = v83;
              long double v85 = GEOCalculateDistanceRadius(v66, v68, v82, v83, 6367000.0);
              long long v86 = v130;
              double v87 = v85 + *((double *)v130 - 1);
              if ((unint64_t)v130 >= v131[0])
              {
                long long v89 = v129;
                uint64_t v90 = ((char *)v130 - (unsigned char *)v129) >> 3;
                unint64_t v91 = v90 + 1;
                if ((unint64_t)(v90 + 1) >> 61) {
                  std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v92 = v131[0] - (void)v129;
                if ((uint64_t)(v131[0] - (void)v129) >> 2 > v91) {
                  unint64_t v91 = v92 >> 2;
                }
                if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v93 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v93 = v91;
                }
                if (v93)
                {
                  v94 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v131, v93);
                  long long v89 = v129;
                  long long v86 = v130;
                }
                else
                {
                  v94 = 0;
                }
                v95 = (double *)&v94[8 * v90];
                double *v95 = v87;
                long long v88 = v95 + 1;
                while (v86 != v89)
                {
                  uint64_t v96 = *--v86;
                  *((void *)v95-- - 1) = v96;
                }
                v129 = v95;
                v130 = v88;
                v131[0] = &v94[8 * v93];
                if (v89) {
                  operator delete(v89);
                }
              }
              else
              {
                *(double *)v130 = v87;
                long long v88 = v86 + 1;
              }
              v130 = v88;
              if (v61 && [v61 pathIndex] == i && objc_msgSend(v61, "pointIndex") == j)
              {
                [v61 length];
                -[_GEOCoordinatePath calibratePointLengths:startIndex:endIndex:rangeLength:](v64, (uint64_t)v129, v80, j, v97);
                [v61 length];
                uint64_t v98 = [v60 nextObject];

                int v61 = (void *)v98;
                unint64_t v80 = j;
              }
              double v68 = v84;
              double v66 = v82;
            }
          }
          if (v64) {
            uint64_t v99 = *(void *)(v64 + 56);
          }
          else {
            uint64_t v99 = 0;
          }
          if (((char *)v130 - (unsigned char *)v129) >> 3 != v99)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v125 = 0;
              _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: pointLengths.size() == pathCoordinates.count", v125, 2u);
            }
            uint64_t v104 = GEOGetGEOComposedRouteLog();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v125 = 0;
              _os_log_impl(&dword_188D96000, v104, OS_LOG_TYPE_ERROR, "Point lengths array size not equal to number of coordinates in path", v125, 2u);
            }
          }
          if ((void **)(v64 + 72) != &v129) {
            std::vector<maps::path_codec::CostFunction::AngleCost>::__assign_with_size[abi:ne180100]<maps::path_codec::CostFunction::AngleCost const*,maps::path_codec::CostFunction::AngleCost const*>((char *)(v64 + 72), (char *)v129, (uint64_t)v130, ((char *)v130 - (unsigned char *)v129) >> 3);
          }
          double v100 = 0.0;
          if (!i) {
            break;
          }
          uint64_t v101 = [(NSArray *)v119->_paths objectAtIndexedSubscript:i - 1];
          if (!v101) {
            goto LABEL_139;
          }
          double v102 = *(double *)(v101 + 104);
          uint64_t v103 = *(void *)(v101 + 80);
          if (*(void *)(v101 + 72) != v103) {
            double v100 = *(double *)(v103 - 8);
          }
          if (v64) {
LABEL_127:
          }
            *(double *)(v64 + 104) = v102 + v100;
LABEL_128:

          if (v129)
          {
            v130 = v129;
            operator delete(v129);
          }
        }
        uint64_t v101 = 0;
LABEL_139:
        double v102 = 0.0;
        if (v64) {
          goto LABEL_127;
        }
        goto LABEL_128;
      }
    }
    else
    {
      id v107 = v109;
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v107, "count"));
      v115 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v9->_unint64_t coordinateCount = 0;
      long long v127 = 0u;
      long long v128 = 0u;
      *(_OWORD *)v125 = 0u;
      long long v126 = 0u;
      id v111 = v107;
      uint64_t v36 = [v111 countByEnumeratingWithState:v125 objects:&v129 count:16];
      if (v36)
      {
        id obja = *(id *)v126;
        do
        {
          uint64_t v37 = 0;
          uint64_t v117 = v36;
          do
          {
            if (*(id *)v126 != obja) {
              objc_enumerationMutation(v111);
            }
            v38 = *(void **)(*(void *)&v125[8] + 8 * v37);
            unint64_t v39 = [v38 length];
            uint64_t v40 = [v38 bytes];
            unint64_t v41 = v39 >> 4;
            __p = 0;
            v123 = 0;
            v124 = 0;
            std::vector<GEOLocationCoordinate3D>::reserve(&__p, v39 >> 4);
            if (v39 >= 0x10)
            {
              uint64_t v42 = 0;
              if (v41 <= 1) {
                unint64_t v41 = 1;
              }
              v43 = v123;
              do
              {
                v44 = (uint64_t *)(v40 + 16 * v42);
                uint64_t v46 = *v44;
                uint64_t v45 = v44[1];
                if (v43 >= v124)
                {
                  unint64_t v47 = (char *)__p;
                  unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * ((v43 - (unsigned char *)__p) >> 3);
                  unint64_t v49 = v48 + 1;
                  if (v48 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x5555555555555556 * ((v124 - (unsigned char *)__p) >> 3) > v49) {
                    unint64_t v49 = 0x5555555555555556 * ((v124 - (unsigned char *)__p) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((v124 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                    unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v50 = v49;
                  }
                  if (v50)
                  {
                    v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v124, v50);
                    unint64_t v47 = (char *)__p;
                    v43 = v123;
                  }
                  else
                  {
                    v51 = 0;
                  }
                  uint64_t v52 = &v51[24 * v48];
                  *(void *)uint64_t v52 = v46;
                  *((void *)v52 + 1) = v45;
                  *((void *)v52 + 2) = 0;
                  unint64_t v53 = v52;
                  if (v43 != v47)
                  {
                    do
                    {
                      long long v54 = *(_OWORD *)(v43 - 24);
                      *((void *)v53 - 1) = *((void *)v43 - 1);
                      *(_OWORD *)(v53 - 24) = v54;
                      v53 -= 24;
                      v43 -= 24;
                    }
                    while (v43 != v47);
                    unint64_t v47 = (char *)__p;
                  }
                  v43 = v52 + 24;
                  __p = v53;
                  v123 = v52 + 24;
                  v124 = &v51[24 * v50];
                  if (v47) {
                    operator delete(v47);
                  }
                }
                else
                {
                  *(void *)v43 = v46;
                  *((void *)v43 + 1) = v45;
                  *((void *)v43 + 2) = 0;
                  v43 += 24;
                }
                v123 = v43;
                ++v42;
              }
              while (v42 != v41);
            }
            unint64_t v55 = objc_alloc_init(_GEOCoordinatePath);
            -[_GEOCoordinatePath setBasicCoordinates:](v55, (uint64_t)&__p);
            if (v55) {
              v55->_pathStartIndex = v119->_coordinateCount;
            }
            [(NSArray *)v115 addObject:v55];
            if (v55) {
              unint64_t v56 = v55->_count;
            }
            else {
              unint64_t v56 = 0;
            }
            v119->_coordinateCount += v56;

            if (__p)
            {
              v123 = (char *)__p;
              operator delete(__p);
            }
            ++v37;
          }
          while (v37 != v117);
          uint64_t v57 = [v111 countByEnumeratingWithState:v125 objects:&v129 count:16];
          uint64_t v36 = v57;
        }
        while (v57);
      }

      uint64_t v58 = v119->_paths;
      v119->_paths = v115;

      v34 = v119;
      long long v35 = v108;
      if (v119->_coordinateCount) {
        goto LABEL_69;
      }
    }
LABEL_142:
    v105 = v34;
  }

  return v119;
}

- (unint64_t)pathsCount
{
  return [(NSArray *)self->_paths count];
}

- (unint64_t)coordinateCountForPathAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_paths objectAtIndexedSubscript:a3];
  if (v3) {
    unint64_t v4 = v3[7];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnPath:(unint64_t)a3 coordinateIndex:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_paths count] <= a3)
  {
    uint64_t v8 = GEOGetGEOComposedRouteLog();
    double v9 = -180.0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = [(NSArray *)self->_paths count];
      int v20 = 67109376;
      int v21 = a3;
      __int16 v22 = 1024;
      int v23 = v14;
      _os_log_impl(&dword_188D96000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnPath:coordinateIndex:] - pathIndex (%d) is out of bounds. paths count: %d", (uint8_t *)&v20, 0xEu);
    }
    *(double *)&uint64_t v13 = 1.79769313e308;
    goto LABEL_13;
  }
  uint64_t v7 = [(NSArray *)self->_paths objectAtIndexedSubscript:a3];
  uint64_t v8 = (uint64_t)v7;
  if (!v7 || v7[7] <= a4)
  {
    uint64_t v15 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v8) {
        int v16 = *(_DWORD *)(v8 + 56);
      }
      else {
        int v16 = 0;
      }
      int v20 = 67109632;
      int v21 = a4;
      __int16 v22 = 1024;
      int v23 = a3;
      __int16 v24 = 1024;
      int v25 = v16;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnPath:coordinateIndex:] - coordinateIndex (%d) is out of bounds. path: %d, coordinates count: %d", (uint8_t *)&v20, 0x14u);
    }

    *(double *)&uint64_t v13 = 1.79769313e308;
    double v9 = -180.0;
LABEL_13:
    *(double *)&unint64_t v11 = -180.0;
    goto LABEL_14;
  }
  double v9 = -[_GEOCoordinatePath coordinateAt:](v7, a4);
  unint64_t v11 = v10;
  uint64_t v13 = v12;
LABEL_14:

  double v17 = v9;
  double v18 = *(double *)&v11;
  double v19 = *(double *)&v13;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnRouteAt:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_paths count])
  {
    double v9 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnRouteAt:] - no paths in coordinate array", (uint8_t *)v20, 2u);
    }

    goto LABEL_13;
  }
  if (self->_coordinateCount <= a3)
  {
    unint64_t v10 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unint64_t coordinateCount = self->_coordinateCount;
      v20[0] = 67109376;
      v20[1] = a3;
      __int16 v21 = 1024;
      int v22 = coordinateCount;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateOnRouteAt:] - index (%d) is out of bounds. coordinate count: %d", (uint8_t *)v20, 0xEu);
    }

LABEL_13:
    *(double *)&uint64_t v12 = 1.79769313e308;
    double v13 = -180.0;
    *(double *)&unint64_t v14 = -180.0;
    goto LABEL_15;
  }
  BOOL v5 = [(NSArray *)self->_paths objectAtIndexedSubscript:0];
  uint64_t v6 = 1;
  if (!v5) {
    goto LABEL_6;
  }
  while (1)
  {
    unint64_t v7 = v5[7];
    if (a3 < v7) {
      break;
    }
    while (1)
    {
      uint64_t v8 = [(NSArray *)self->_paths objectAtIndexedSubscript:v6];
      a3 -= v7;

      ++v6;
      BOOL v5 = (void *)v8;
      if (v8) {
        break;
      }
LABEL_6:
      unint64_t v7 = 0;
    }
  }
  double v13 = -[_GEOCoordinatePath coordinateAt:](v5, a3);
  unint64_t v14 = v15;
  uint64_t v12 = v16;

LABEL_15:
  double v17 = v13;
  double v18 = *(double *)&v14;
  double v19 = *(double *)&v12;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateForRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  float v5 = a3.offset - floorf(a3.offset);
  uint64_t v6 = vcvtms_u32_f32(a3.offset) + a3.index;
  if (a3.offset >= 0.0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (a3.offset >= 0.0) {
    double v8 = v5;
  }
  else {
    double v8 = -1.0;
  }
  if (a3.index >= self->_coordinateCount)
  {
    double v18 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = GEOPolylineCoordinateAsString(*(void *)&a3, 1, 0, v19);
      unint64_t coordinateCount = self->_coordinateCount;
      int v25 = 138478083;
      uint64_t v26 = v20;
      __int16 v27 = 1024;
      int v28 = coordinateCount;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray coordinateForRouteCoordinate:] - routeCoordinate (%{private}@) is out of bounds. coordinate count: %d", (uint8_t *)&v25, 0x12u);
    }
    double v14 = 1.79769313e308;
    double v10 = -180.0;
    double v12 = -180.0;
  }
  else
  {
    -[GEOComposedRouteCoordinateArray coordinateOnRouteAt:](self, "coordinateOnRouteAt:", v7, v5, -1.0);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    if (self->_coordinateCount - 1 != v7)
    {
      [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:(v7 + 1)];
      double v10 = v10 + (v15 - v10) * v8;
      double v12 = v12 + (v16 - v12) * v8;
      double v14 = v14 + (v17 - v14) * v8;
    }
  }
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

- (id)rawRouteGeometry
{
  paths = self->_paths;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEOComposedRouteCoordinateArray_rawRouteGeometry__block_invoke;
  v6[3] = &unk_1E53E6550;
  v6[4] = self;
  v3 = [(NSArray *)paths _geo_map:v6];
  unint64_t v4 = [[GEORawRouteGeometry alloc] initWithRawData:v3];

  return v4;
}

id __51__GEOComposedRouteCoordinateArray_rawRouteGeometry__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a2 + 96);
    uint64_t v3 = *(void *)(a2 + 96) + *(_DWORD *)(a2 + 56) - 1;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0xFFFFFFFFLL;
  }
  unint64_t v4 = [*(id *)(a1 + 32) routingPathDataFromStart:v2 toEnd:v3 supportPointsOnly:0];

  return v4;
}

- (unint64_t)_localCoordinateIndexForRouteIndex:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v2 = a2;
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 <= a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: routeIndex < _coordinateCount", buf, 2u);
      unint64_t v4 = *(void *)(a1 + 16);
    }
    if (v4) {
      unint64_t v2 = v4 - 1;
    }
    else {
      unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(a1 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v5);
      }
      unint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
      if (v9)
      {
        unint64_t v9 = *(void *)(v9 + 56);
        if (v2 < v9) {
          break;
        }
      }
      v2 -= v9;
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteCoordinateArray)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOComposedRouteCoordinateArray;
  id v5 = [(GEOComposedRouteCoordinateArray *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_paths"];
    paths = v5->_paths;
    v5->_paths = (NSArray *)v6;

    v5->_unint64_t coordinateCount = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = v5->_paths;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          if (v12) {
            uint64_t v12 = *(void *)(v12 + 56);
          }
          v5->_coordinateCount += v12;
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    v5->_usesZilch = objc_msgSend(v4, "decodeBoolForKey:", @"_usesZilch", (void)v17);
    v5->_usesRoutingPathPoints = [v4 decodeBoolForKey:@"_usesRoutingPathPoints"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_noMatchRanges"];
    noMatchRanges = v5->_noMatchRanges;
    v5->_noMatchRanges = (GEOPolylineCoordinateRangeArray *)v13;

    double v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_paths forKey:@"_paths"];
  [v4 encodeBool:self->_usesZilch forKey:@"_usesZilch"];
  [v4 encodeBool:self->_usesRoutingPathPoints forKey:@"_usesRoutingPathPoints"];
  [v4 encodeObject:self->_noMatchRanges forKey:@"_noMatchRanges"];
}

- (id)description
{
  id v40 = [MEMORY[0x1E4F28E78] string];
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v39 = ((int)log10((double)self->_coordinateCount) + 1);
  uint64_t v37 = self;
  while (v3 < [(NSArray *)self->_paths count])
  {
    uint64_t v5 = [(NSArray *)self->_paths objectAtIndexedSubscript:v3];
    uint64_t v6 = v5;
    if (v5) {
      uint64_t v7 = *(void *)(v5 + 56);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = "\n";
    if (!v3) {
      uint64_t v8 = "";
    }
    unint64_t v41 = v3;
    objc_msgSend(v40, "appendFormat:", @"%sPath %d (%d coordinates):\n", v8, v3, v7);
    uint64_t v9 = [*(id *)(v6 + 64) objectEnumerator];
    uint64_t v10 = [v9 nextObject];
    unint64_t v11 = 0;
    uint64_t v38 = ((int)log10((double)(unint64_t)(*(void *)(v6 + 56) + v4)) + 1);
    if (v6)
    {
LABEL_8:
      unint64_t v12 = *(void *)(v6 + 56);
      goto LABEL_9;
    }
    while (1)
    {
      unint64_t v12 = 0;
LABEL_9:
      if (v11 >= v12) {
        break;
      }
      double v13 = -[_GEOCoordinatePath coordinateAt:]((void *)v6, v11);
      double v15 = v14;
      uint64_t v17 = v16;
      if (v6) {
        uint64_t v18 = *(void *)(v6 + 56);
      }
      else {
        uint64_t v18 = 0;
      }
      long long v19 = @" | -";
      if (v11 < v18 - 1)
      {
        double v21 = -[_GEOCoordinatePath coordinateAt:]((void *)v6, v11 + 1);
        if (vabdd_f64(v13, v21) >= 0.00000000999999994 || vabdd_f64(v15, v20) >= 0.00000000999999994)
        {
          long double v22 = GEOBearingFromCoordinateToCoordinate(v13, v15, v21, v20);
          double v23 = fmod(v22, 360.0);
          if (v23 < 0.0) {
            double v23 = v23 + 360.0;
          }
          unint64_t v24 = 0x1E4F29000uLL;
          LODWORD(v24) = llround(v23);
          objc_msgSend(NSString, "stringWithFormat:", @" | %d", v24);
          long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      if (v6 && (uint64_t v25 = *(void *)(v6 + 72)) != 0)
      {
        double v26 = *(double *)(v25 + 8 * v11);
        if (v41)
        {
          objc_msgSend(NSString, "stringWithFormat:", @" (%0.1fm)", v26 + *(double *)(v6 + 104));
          __int16 v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __int16 v27 = &stru_1ED51F370;
        }
        int v28 = [NSString stringWithFormat:@" | %0.1fm%@", *(void *)&v26, v27];
      }
      else
      {
        int v28 = &stru_1ED51F370;
      }
      uint64_t v29 = [MEMORY[0x1E4F28E78] string];
      if (!v10) {
        goto LABEL_33;
      }
      while ([v10 index] < v11)
      {
        uint64_t v30 = [v9 nextObject];

        uint64_t v10 = (void *)v30;
        if (!v30) {
          goto LABEL_33;
        }
      }
      if ([v10 index] == v11)
      {
        objc_msgSend(v29, "appendFormat:", @" | %lld", objc_msgSend(v10, "roadID"));
        unint64_t v31 = [v10 anchorPointID];

        if (v31)
        {
          uint64_t v32 = [v10 anchorPointID];
          v33 = [v32 UUIDString];
          [v29 appendFormat:@" | Anchor: %@", v33];
        }
        uint64_t v34 = 42;
      }
      else
      {
LABEL_33:
        uint64_t v34 = 32;
      }
      if (v41)
      {
        objc_msgSend(NSString, "stringWithFormat:", @" (%*d)", v38, v4);
        long long v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v35 = &stru_1ED51F370;
      }
      [v40 appendFormat:@"%*d%@: %c %0.6f, %0.6f | %0.1fm%@%@%@\n", v39, v11, v35, v34, *(void *)&v13, *(void *)&v15, v17, v19, v28, v29];
      ++v4;

      ++v11;
      if (v6) {
        goto LABEL_8;
      }
    }

    unint64_t v3 = v41 + 1;
    self = v37;
  }

  return v40;
}

- (unint64_t)coordinateCount
{
  return self->_coordinateCount;
}

- (BOOL)usesRoutingPathPoints
{
  return self->_usesRoutingPathPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noMatchRanges, 0);

  objc_storeStrong((id *)&self->_paths, 0);
}

- (double)distanceFromStartToIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_coordinateCount <= a3)
  {
    double v15 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t coordinateCount = self->_coordinateCount;
      *(_DWORD *)buf = 67109376;
      int v23 = v3;
      __int16 v24 = 1024;
      int v25 = coordinateCount;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray distanceFromStartToIndex:] coordinateIndex (%d) is out of bounds (Coordinate count: %d). Clamping and attemping to continue.", buf, 0xEu);
    }

    unint64_t v3 = self->_coordinateCount - 1;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_paths;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        if (v9)
        {
          unint64_t v10 = *(void *)(v9 + 56);
          if (v3 < v10)
          {
            double v13 = *(double *)(*(void *)(v9 + 72) + 8 * v3);
            double v14 = *(double *)(v9 + 104);

            return v13 + v14;
          }
        }
        else
        {
          unint64_t v10 = 0;
        }
        v3 -= v10;
        ++v8;
      }
      while (v6 != v8);
      uint64_t v11 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v11;
    }
    while (v11);
  }

  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self);
}

- (double)_length
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v12;
    double v4 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        double v7 = 0.0;
        if (v6)
        {
          uint64_t v9 = *(void *)(v6 + 72);
          uint64_t v8 = *(void *)(v6 + 80);
          if (v9 != v8) {
            double v7 = *(double *)(v8 - 8);
          }
        }
        double v4 = v4 + v7;
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v2);
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (double)distanceToEndFromIndex:(unint64_t)a3
{
  [(GEOComposedRouteCoordinateArray *)self distanceFromStartToIndex:a3];
  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self) - v4;
}

- (double)distanceBetweenIndex:(unint64_t)a3 andIndex:(unint64_t)a4
{
  [(GEOComposedRouteCoordinateArray *)self distanceFromStartToIndex:a3];
  double v7 = v6;
  [(GEOComposedRouteCoordinateArray *)self distanceFromStartToIndex:a4];
  return vabdd_f64(v8, v7);
}

- (double)distanceFromStartToRouteCoordinate:(PolylineCoordinate)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3.offset < 0.0)
  {
    __int16 v24 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = GEOPolylineCoordinateAsFullString(*(void *)&a3);
      *(_DWORD *)buf = 138477827;
      uint64_t v32 = v25;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:] routeCoordinate (%{private}@) is invalid. Returning 0.", buf, 0xCu);
    }
    return 0.0;
  }
  unint64_t coordinateCount = self->_coordinateCount;
  double v6 = 0.0;
  if (coordinateCount < 2) {
    return v6;
  }
  if (a3.offset >= 0.0) {
    unint64_t v7 = (vcvtms_u32_f32(a3.offset) + a3.index) | ((unint64_t)COERCE_UNSIGNED_INT(a3.offset - floorf(a3.offset)) << 32);
  }
  else {
    unint64_t v7 = 0xBF80000000000000;
  }
  unsigned int v8 = coordinateCount - 1;
  if (v7 != v8)
  {
    if (v7 < v8) {
      goto LABEL_8;
    }
LABEL_26:
    unint64_t v9 = v8;
    double v21 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long double v22 = GEOPolylineCoordinateAsFullString(v7);
      GEOPolylineCoordinateAsFullString(v9);
      *(_DWORD *)buf = 138478083;
      uint64_t v32 = v22;
      uint64_t v34 = v33 = 2112;
      int v23 = (void *)v34;
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "-[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:] routeCoordinate (%{private}@) is out of bounds (Last valid coordinate: %@). Clamping and attemping to continue.", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (*((float *)&v7 + 1) > 0.0) {
    goto LABEL_26;
  }
LABEL_8:
  unint64_t v9 = v7;
LABEL_9:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v10 = self->_paths;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    float v12 = *((float *)&v9 + 1);
    unint64_t v9 = v9;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v14);
        if (v15)
        {
          unint64_t v16 = *(void *)(v15 + 56);
          if (v9 < v16)
          {
            uint64_t v18 = *(void *)(v15 + 72);
            double v19 = *(double *)(v18 + 8 * v9);
            double v6 = v19 + *(double *)(v15 + 104);
            if (v9 < v16 - 1) {
              double v6 = v6 + (*(double *)(v18 + 8 * v9 + 8) - v19) * v12;
            }

            return v6;
          }
        }
        else
        {
          unint64_t v16 = 0;
        }
        v9 -= v16;
        ++v14;
      }
      while (v11 != v14);
      uint64_t v17 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v11 = v17;
      if (v17) {
        continue;
      }
      break;
    }
  }

  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self);
}

- (double)distanceToEndFromRouteCoordinate:(PolylineCoordinate)a3
{
  [(GEOComposedRouteCoordinateArray *)self distanceFromStartToRouteCoordinate:a3];
  return -[GEOComposedRouteCoordinateArray _length]((uint64_t)self) - v4;
}

- (double)distanceBetweenRouteCoordinate:(PolylineCoordinate)a3 andRouteCoordinate:(PolylineCoordinate)a4
{
  [(GEOComposedRouteCoordinateArray *)self distanceFromStartToRouteCoordinate:a3];
  double v7 = v6;
  [(GEOComposedRouteCoordinateArray *)self distanceFromStartToRouteCoordinate:a4];
  return v8 - v7;
}

- (double)distanceFromStartToStartOfPathIndex:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_paths count] <= a3)
  {
    unint64_t v10 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "-[GEOComposedRouteCoordinateArray distanceFromStartToStartOfPathIndex:] pathIndex (%d) is greater than number of paths. This is an error from the caller. Returning 0.", (uint8_t *)v12, 8u);
    }

    return 0.0;
  }
  if (!a3) {
    return 0.0;
  }
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    double v7 = [(NSArray *)self->_paths objectAtIndexedSubscript:v5];
    double v8 = 0.0;
    if (v7)
    {
      uint64_t v9 = v7[10];
      if (v7[9] != v9) {
        double v8 = *(double *)(v9 - 8);
      }
    }
    double v6 = v6 + v8;

    ++v5;
  }
  while (a3 != v5);
  return v6;
}

- (double)distanceFromStartToEndOfPathIndex:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_paths count] <= a3)
  {
    float v12 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13[0] = 67109120;
      v13[1] = a3;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_FAULT, "-[GEOComposedRouteCoordinateArray distanceFromStartToEndOfPathIndex:] pathIndex (%d) is greater than number of paths. This is an error from the caller. Returning 0.", (uint8_t *)v13, 8u);
    }

    return 0.0;
  }
  else
  {
    [(GEOComposedRouteCoordinateArray *)self distanceFromStartToStartOfPathIndex:a3];
    double v6 = v5;
    double v7 = [(NSArray *)self->_paths objectAtIndexedSubscript:a3];
    double v8 = 0.0;
    if (v7)
    {
      uint64_t v9 = v7[10];
      if (v7[9] != v9) {
        double v8 = *(double *)(v9 - 8);
      }
    }
    double v10 = v6 + v8;
  }
  return v10;
}

- (PolylineCoordinate)routeCoordinateForDistanceAfterStart:(double)a3
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, 0, a3);
}

- (unint64_t)_routeCoordinateForOffset:(double)a3 fromRouteCoordinate:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    unint64_t v27 = 0;
    LODWORD(v3) = 0;
    return v3 | v27;
  }
  unint64_t v3 = a2;
  if (a3 != 0.0)
  {
    [a1 distanceFromStartToRouteCoordinate:a2];
    double v7 = v6 + a3;
    if (v6 + a3 <= 0.0)
    {
      unint64_t v3 = 0;
    }
    else
    {
      if (v7 < -[GEOComposedRouteCoordinateArray _length]((uint64_t)a1))
      {
        unint64_t v8 = [a1 pathIndexForRouteIndex:v3];
        if (v8 < [a1[1] count])
        {
          if (a3 <= 0.0)
          {
            if (a3 < 0.0)
            {
              while (v8 < [a1[1] count])
              {
                uint64_t v14 = [a1[1] objectAtIndexedSubscript:v8];
                double v15 = v14 ? v14[13] : 0.0;

                if (v7 >= v15) {
                  break;
                }
                --v8;
              }
            }
          }
          else
          {
            for (; v8 < [a1[1] count]; ++v8)
            {
              uint64_t v9 = [a1[1] objectAtIndexedSubscript:v8];
              if (v9)
              {
                uint64_t v10 = *(void *)(v9 + 80);
                if (*(void *)(v9 + 72) == v10) {
                  double v11 = 0.0;
                }
                else {
                  double v11 = *(double *)(v10 - 8);
                }
                double v12 = v11 + *(double *)(v9 + 104);
              }
              else
              {
                double v12 = 0.0;
              }
              double v13 = v12 - v7;

              if (v13 > -0.01) {
                break;
              }
            }
          }
          if (v8 >= [a1[1] count])
          {
            unint64_t v16 = GEOGetGEOComposedRouteLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              uint64_t v17 = GEOPolylineCoordinateAsFullString(v3);
              int v29 = 134218499;
              unint64_t v30 = v8;
              __int16 v31 = 2113;
              uint64_t v32 = v17;
              __int16 v33 = 2048;
              double v34 = a3;
              _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_FAULT, "The resolved path index: %lu for route coordinate: %{private}@ and distance offset: %lf is out of bounds.", (uint8_t *)&v29, 0x20u);
            }
            --v8;
          }
          uint64_t v18 = [a1[1] objectAtIndexedSubscript:v8];
          double v19 = (void *)v18;
          if (v18)
          {
            double v7 = v7 - *(double *)(v18 + 104);
            uint64_t v20 = *(void *)(v18 + 72);
            unint64_t v21 = *(void *)(v18 + 56) - 1;
            if (v21 < 2)
            {
              uint64_t v22 = 0;
              goto LABEL_39;
            }
          }
          else
          {
            uint64_t v20 = 0;
            unint64_t v21 = -1;
          }
          uint64_t v22 = 0;
          do
          {
            if (v7 < *(double *)(v20 + 8 * ((v22 + v21) >> 1))) {
              unint64_t v21 = (v22 + v21) >> 1;
            }
            else {
              uint64_t v22 = (v22 + v21) >> 1;
            }
          }
          while (v22 + 1 < v21);
LABEL_39:
          double v23 = *(double *)(v20 + 8 * v22);
          double v24 = *(double *)(v20 + 8 * v21);
          int v25 = [a1 routeIndexForLocalIndex:v22 onPath:v8];
          if (v22 == v21 || vabdd_f64(v23, v24) < 1.0e-12)
          {
            float v26 = 0.0;
          }
          else
          {
            float v26 = (v7 - v23) / (v24 - v23);
            if (v26 >= 1.0)
            {
              v25 += vcvtms_u32_f32(v26);
              float v26 = v26 - (float)floorf(v26);
            }
            if (v26 < 0.0)
            {
              unint64_t v3 = 0xBF80000000000000;
              goto LABEL_43;
            }
          }
          unint64_t v3 = (v25 + vcvtms_u32_f32(v26)) | ((unint64_t)COERCE_UNSIGNED_INT(v26 - floorf(v26)) << 32);
LABEL_43:

          goto LABEL_44;
        }
      }
      unint64_t v3 = [a1 coordinateCount] - 1;
    }
  }
LABEL_44:
  unint64_t v27 = v3 & 0xFFFFFFFF00000000;
  return v3 | v27;
}

- (PolylineCoordinate)routeCoordinateForDistanceBeforeEnd:(double)a3
{
  double v4 = -a3;
  unint64_t v5 = [(GEOComposedRouteCoordinateArray *)self coordinateCount] - 1;

  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, v5, v4);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 afterRouteCoordinate:(PolylineCoordinate)a4
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, *(void *)&a4, a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 beforeRouteCoordinate:(PolylineCoordinate)a4
{
  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray _routeCoordinateForOffset:fromRouteCoordinate:]((id *)&self->super.isa, *(void *)&a4, -a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 afterStartOfPathIndex:(unint64_t)a4
{
  uint64_t v6 = [(GEOComposedRouteCoordinateArray *)self routeCoordinateRangeForPathIndex:a4];
  if (*((float *)&v6 + 1) < 0.0 || v8 < 0.0) {
    return (PolylineCoordinate)0xBF80000000000000;
  }
  if (v6 != v7)
  {
    if (v6 < v7) {
      goto LABEL_5;
    }
    return (PolylineCoordinate)0xBF80000000000000;
  }
  if (*((float *)&v6 + 1) > v8) {
    return (PolylineCoordinate)0xBF80000000000000;
  }
LABEL_5:

  return (PolylineCoordinate)-[GEOComposedRouteCoordinateArray routeCoordinateForDistance:afterRouteCoordinate:](self, "routeCoordinateForDistance:afterRouteCoordinate:", a3);
}

- (PolylineCoordinate)routeCoordinateForDistance:(double)a3 beforeEndOfPathIndex:(unint64_t)a4
{
  uint64_t v6 = [(GEOComposedRouteCoordinateArray *)self routeCoordinateRangeForPathIndex:a4];
  if (*((float *)&v6 + 1) < 0.0 || *((float *)&v7 + 1) < 0.0) {
    return (PolylineCoordinate)0xBF80000000000000;
  }
  if (v6 != v7)
  {
    if (v6 < v7) {
      goto LABEL_5;
    }
    return (PolylineCoordinate)0xBF80000000000000;
  }
  if (*((float *)&v6 + 1) > *((float *)&v7 + 1)) {
    return (PolylineCoordinate)0xBF80000000000000;
  }
LABEL_5:

  return (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)self routeCoordinateForDistance:v7 beforeRouteCoordinate:a3];
}

- (GEOPolylineCoordinateRange)routeCoordinateRangeForPathIndex:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_paths count] <= a3)
  {
    uint64_t v10 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "-[GEOComposedRouteCoordinateArray routeCoordinateRangeForPathIndex:] pathIndex (%d) is greater than number of paths. This is an error from the caller. Returning 0.", (uint8_t *)v11, 8u);
    }

    unint64_t v6 = 0xBF80000000000000;
    unint64_t v7 = 0xBF80000000000000;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_paths objectAtIndexedSubscript:a3];
    if (v5)
    {
      unint64_t v6 = *(void *)(v5 + 96);
      unint64_t v7 = *(void *)(v5 + 96) + *(_DWORD *)(v5 + 56) - 1;
    }
    else
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0xFFFFFFFFLL;
    }
  }
  PolylineCoordinate v8 = (PolylineCoordinate)v6;
  PolylineCoordinate v9 = (PolylineCoordinate)v7;
  result.end = v9;
  result.start = v8;
  return result;
}

- (unint64_t)routeIndexForLocalIndex:(unint64_t)a3 onPath:(unint64_t)a4
{
  if ([(NSArray *)self->_paths count] <= a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = [(NSArray *)self->_paths objectAtIndexedSubscript:a4];
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = v7[7];

  if (v8 <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      double v11 = [(NSArray *)self->_paths objectAtIndexedSubscript:v9];
      if (v11) {
        uint64_t v12 = v11[7];
      }
      else {
        uint64_t v12 = 0;
      }
      v10 += v12;

      ++v9;
    }
    while (a4 != v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10 + a3;
}

- (unint64_t)pathIndexForRouteIndex:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_coordinateCount <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = self->_paths;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      unint64_t v9 = v5 + v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        if (v10)
        {
          unint64_t v10 = *(void *)(v10 + 56);
          if (v3 < v10)
          {
            unint64_t v9 = v6 + v8;
            goto LABEL_15;
          }
        }
        v3 -= v10;
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      unint64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)pathIndexForRouteCoordinate:(PolylineCoordinate)a3
{
  *(float *)&double v3 = a3.offset;
  uint64_t v4 = vcvtms_u32_f32(a3.offset) + a3.index;
  if (a3.offset >= 0.0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  return -[GEOComposedRouteCoordinateArray pathIndexForRouteIndex:](self, "pathIndexForRouteIndex:", v5, v3);
}

- (id)supportPointAtRouteCoordinate:(PolylineCoordinate)a3
{
  if (a3.offset < 0.0
    || (float v3 = floorf(a3.offset), vabds_f32(a3.offset, v3) >= 0.001)
    || (float v5 = a3.offset - v3,
        uint64_t v6 = vcvtms_u32_f32(a3.offset) + a3.index,
        unint64_t v7 = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:v6 | ((unint64_t)COERCE_UNSIGNED_INT(a3.offset - v3) << 32)], v7 >= [(NSArray *)self->_paths count]))
  {
    unint64_t v16 = 0;
  }
  else
  {
    uint64_t v8 = [(GEOComposedRouteCoordinateArray *)self supportPointsForPathAtIndex:v7];
    unint64_t v9 = objc_alloc_init(GEOCoordinateArraySupportPoint);
    unint64_t v10 = vcvtas_u32_f32(v5 + (float)v6);
    if (v5 >= 0.0) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v12 = [(NSArray *)self->_paths objectAtIndexedSubscript:v7];
    long long v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = *(void *)(v12 + 96);
    }
    else {
      uint64_t v14 = 0;
    }
    [(GEOCoordinateArraySupportPoint *)v9 setIndex:v11 - v14];

    unint64_t v15 = objc_msgSend(v8, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v8, "count"), 256, &__block_literal_global_110);
    if (v15 >= [v8 count])
    {
      unint64_t v16 = 0;
    }
    else
    {
      unint64_t v16 = [v8 objectAtIndexedSubscript:v15];
    }
  }

  return v16;
}

uint64_t __79__GEOComposedRouteCoordinateArray_PathMatching__supportPointAtRouteCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "index"));
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "index"));
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

- (id)supportPointsForPathAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_paths count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [(NSArray *)self->_paths objectAtIndexedSubscript:a3];
    id v6 = v5[8];
  }

  return v6;
}

- (id)supportPointsEncompassingRange:(GEOPolylineCoordinateRange)a3
{
  return [(GEOComposedRouteCoordinateArray *)self _supportPointsForRange:*(void *)&a3.end shouldEncompassRange:1u];
}

- (id)_supportPointsForRange:(uint64_t)a3 shouldEncompassRange:(unsigned int)a4
{
  id v4 = a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v7 = [a1 pathIndexForRouteCoordinate:a2];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = GEOPolylineCoordinateRangeAsString(a2, a3, v9);
        *(_DWORD *)buf = 138478083;
        float v26 = v10;
        __int16 v27 = 1024;
        int v28 = [v4 coordinateCount];
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Could not get support points for %{private}@ because startIndex out of range. Coordinate count: %d", buf, 0x12u);
      }
LABEL_9:

      id v4 = 0;
      goto LABEL_28;
    }
    unint64_t v11 = v7;
    uint64_t v12 = [v4 pathIndexForRouteCoordinate:a3];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = GEOPolylineCoordinateRangeAsString(a2, a3, v13);
        *(_DWORD *)buf = 138478083;
        float v26 = v14;
        __int16 v27 = 1024;
        int v28 = [v4 coordinateCount];
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Could not get support points for %{private}@ because endIndex is out of range. Coordinate count: %d", buf, 0x12u);
      }
      goto LABEL_9;
    }
    unint64_t v15 = v12;
    double v23 = [MEMORY[0x1E4F1CA48] array];
    if (v11 <= v15)
    {
      uint64_t v16 = 0;
      do
      {
        uint64_t v17 = [v4 supportPointsForPathAtIndex:v11 + v16];
        if ([v17 count])
        {
          unint64_t v18 = v16 ? 0 : [v4 nearestSupportPointIndexForRouteCoordinate:a2 beforeCoordinate:a4];
          unint64_t v19 = v11 - v15 + v16
              ? [v17 count] - 1
              : [v4 nearestSupportPointIndexForRouteCoordinate:a3 beforeCoordinate:a4 ^ 1];
          if (v18 < [v17 count] && v19 < objc_msgSend(v17, "count") && v19 >= v18)
          {
            uint64_t v20 = objc_msgSend(v17, "subarrayWithRange:", v18, v19 - v18 + 1);
            [v23 addObjectsFromArray:v20];
          }
        }

        ++v16;
      }
      while (v11 + v16 <= v15);
    }
    if ([v23 count]) {
      unint64_t v21 = v23;
    }
    else {
      unint64_t v21 = 0;
    }
    id v4 = v21;
  }
LABEL_28:

  return v4;
}

- (id)supportPointsWithinRange:(GEOPolylineCoordinateRange)a3
{
  return [(GEOComposedRouteCoordinateArray *)self _supportPointsForRange:*(void *)&a3.end shouldEncompassRange:0];
}

- (unint64_t)nearestSupportPointIndexForRouteCoordinate:(PolylineCoordinate)a3 beforeCoordinate:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  float v6 = a3.offset - floorf(a3.offset);
  unint64_t v7 = vcvtms_u32_f32(a3.offset) + a3.index;
  if (a3.offset >= 0.0) {
    float v8 = v6;
  }
  else {
    float v8 = -1.0;
  }
  if (a3.offset >= 0.0) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = 0;
  }
  unint64_t v10 = v9 | ((unint64_t)LODWORD(v8) << 32);
  if ([(GEOComposedRouteCoordinateArray *)self coordinateCount] - 1 < v9)
  {
    unint64_t v11 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v13 = GEOPolylineCoordinateAsString(v10, 1, 0, v12);
      int v27 = 138478083;
      int v28 = v13;
      __int16 v29 = 1024;
      int v30 = [(GEOComposedRouteCoordinateArray *)self coordinateCount];
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "nearestSupportPointIndexForRouteCoordinate: routeCoordinate %{private}@ is out of range. Coordinates count: %d", (uint8_t *)&v27, 0x12u);
    }
LABEL_27:
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_30;
  }
  unint64_t v14 = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:v10];
  unint64_t v11 = [(GEOComposedRouteCoordinateArray *)self supportPointsForPathAtIndex:v14];
  if (![v11 count])
  {
    int v25 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 67109120;
      LODWORD(v28) = v14;
      _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_ERROR, "nearestSupportPointIndexForRouteCoordinate: found no support points for path index: %d", (uint8_t *)&v27, 8u);
    }

    goto LABEL_27;
  }
  unint64_t v15 = [(GEOComposedRouteCoordinateArray *)self routeIndexForLocalIndex:0 onPath:v14];
  uint64_t v16 = objc_alloc_init(GEOCoordinateArraySupportPoint);
  unint64_t v17 = v9 - v15;
  unint64_t v18 = v17;
  if (!a4)
  {
    unint64_t v19 = [(GEOComposedRouteCoordinateArray *)self coordinateCount];
    unint64_t v18 = v17 + vcvtps_u32_f32(v8);
    if (v18 >= v19) {
      unint64_t v18 = [(GEOComposedRouteCoordinateArray *)self coordinateCount];
    }
  }
  [(GEOCoordinateArraySupportPoint *)v16 setIndex:v18];
  unint64_t v20 = -[NSObject indexOfObject:inSortedRange:options:usingComparator:](v11, "indexOfObject:inSortedRange:options:usingComparator:", v16, 0, [v11 count], 1024, &__block_literal_global_176);
  if (v20 >= [v11 count])
  {
    unint64_t v20 = [v11 count] - 1;
  }
  else
  {
    unint64_t v21 = [v11 objectAtIndexedSubscript:v20];
    if (v17 != [v21 index] && a4)
    {
      unint64_t v22 = [v21 index];
      if (v20 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v20;
      }
      unint64_t v24 = v23 - 1;
      if (v22 > v17) {
        unint64_t v20 = v24;
      }
      else {
        unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
LABEL_30:

  return v20;
}

uint64_t __109__GEOComposedRouteCoordinateArray_PathMatching__nearestSupportPointIndexForRouteCoordinate_beforeCoordinate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  float v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "index"));
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "index"));
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

- (PolylineCoordinate)nearestSupportPointBeforeRouteCoordinate:(PolylineCoordinate)a3
{
  return (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)(id *)&self->super.isa _nearestSupportPointRouteCoordinateForRouteCoordinate:1 beforeCoordinate:v3];
}

- (unint64_t)_nearestSupportPointRouteCoordinateForRouteCoordinate:(uint64_t)a3 beforeCoordinate:(double)a4
{
  if (!a1) {
    return 0;
  }
  LODWORD(a4) = HIDWORD(a2);
  if (*((float *)&a2 + 1) >= 0.0) {
    unint64_t v5 = (vcvtms_u32_f32(*((float *)&a2 + 1)) + a2) | ((unint64_t)COERCE_UNSIGNED_INT(*((float *)&a2 + 1)- floorf(*((float *)&a2 + 1))) << 32);
  }
  else {
    unint64_t v5 = 0xBF80000000000000;
  }
  unint64_t v6 = objc_msgSend(a1, "nearestSupportPointIndexForRouteCoordinate:beforeCoordinate:", v5, a3, a4);
  unint64_t v7 = [a1 pathIndexForRouteCoordinate:v5];
  if (v7 >= [a1[1] count]) {
    return 0xBF80000000000000;
  }
  uint64_t v8 = [a1 supportPointsForPathAtIndex:v7];
  if (v6 >= [v8 count])
  {
    uint64_t v10 = 0xBF80000000000000;
  }
  else
  {
    unint64_t v9 = [v8 objectAtIndexedSubscript:v6];
    uint64_t v10 = [v9 routeCoordinate];
  }
  return v10;
}

- (PolylineCoordinate)nearestSupportPointAfterRouteCoordinate:(PolylineCoordinate)a3
{
  return (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)(id *)&self->super.isa _nearestSupportPointRouteCoordinateForRouteCoordinate:0 beforeCoordinate:v3];
}

- (GEOPolylineCoordinateRangeArray)noMatchRanges
{
  return self->_noMatchRanges;
}

- (BOOL)usesZilch
{
  return self->_usesZilch;
}

- (id)compressedZilchDataToEndOfPathFromIndex:(unint64_t)a3
{
  if (self->_coordinateCount)
  {
    unint64_t v5 = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteIndex:"pathIndexForRouteIndex:"];
    unint64_t v6 = -[GEOComposedRouteCoordinateArray _localCoordinateIndexForRouteIndex:]((uint64_t)self, a3);
    unint64_t v7 = [(NSArray *)self->_paths objectAtIndexedSubscript:v5];
    if (v7) {
      uint64_t v8 = v7[4];
    }
    else {
      uint64_t v8 = 0;
    }

    unint64_t v9 = v6 + 1;
    uint64_t v10 = (zilch::ControlPoint *)(v8 + 32 * v6);
    do
    {
      unint64_t v11 = v9 - 1;
      if (!zilch::ControlPoint::dummy(v10)) {
        break;
      }
      uint64_t v10 = (zilch::ControlPoint *)((char *)v10 - 32);
      --v9;
    }
    while (v9);
    double v12 = +[GEOPointUtility compressedZilchDataFromPoints:v8 fromPointIndex:v11 pointCount:[(GEOComposedRouteCoordinateArray *)self coordinateCountForPathAtIndex:v5]];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (ControlPoint)zilchControlPointAt:(SEL)a3
{
  unint64_t v7 = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteIndex:"pathIndexForRouteIndex:"];
  unint64_t v8 = -[GEOComposedRouteCoordinateArray _localCoordinateIndexForRouteIndex:]((uint64_t)self, a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v9 = v8, v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    return (ControlPoint *)zilch::ControlPoint::null((zilch::ControlPoint *)retstr);
  }
  else
  {
    uint64_t v10 = [(NSArray *)self->_paths objectAtIndexedSubscript:v7];
    if (v10) {
      uint64_t v11 = v10[4];
    }
    else {
      uint64_t v11 = 0;
    }
    double v12 = (_OWORD *)(v11 + 32 * v9);
    long long v13 = v12[1];
    *(_OWORD *)&retstr->var0 = *v12;
    *(_OWORD *)&retstr->var2.var0 = v13;
  }
  return result;
}

- (RoutingPathLeg)routingPathFromStart:(SEL)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(PolylineCoordinate)a5 convertEndpointsToSupportPoints:(BOOL)a6
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)retstr, 0);
  GEOPolylineCoordinateRange result = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:a4];
  unint64_t v14 = result;
  if (result != (RoutingPathLeg *)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v15 = [(GEOComposedRouteCoordinateArray *)self coordinateCountForPathAtIndex:result];
    if (v14 != (RoutingPathLeg *)[(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:a5])a5 = (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)self routeIndexForLocalIndex:v15 - 1 onPath:v14]; {
    if (!v7)
    }
    {
      a4.index = [(GEOComposedRouteCoordinateArray *)self nearestSupportPointBeforeRouteCoordinate:a4];
      a5.index = [(GEOComposedRouteCoordinateArray *)self nearestSupportPointAfterRouteCoordinate:a5];
    }
    return (RoutingPathLeg *)[(GEOComposedRouteCoordinateArray *)self _populateRoutingPathWithCoordinate:retstr pathIndex:v14 startIndex:a4.index endIndex:a5.index distanceFromStartOffset:v8 supportPointsOnly:v7 convertEndpointsToSupportPoints:0.0];
  }
  return result;
}

- (RoutingPathLeg)routingPathWithSupportPointFromStart:(SEL)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(PolylineCoordinate)a5 startPathSegment:(BOOL)a6
{
  uint64_t v7 = a6;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v90 = a7;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)retstr, 0);
  float v12 = a4.offset - floorf(a4.offset);
  unsigned int v13 = vcvtms_u32_f32(a4.offset) + a4.index;
  if (a4.offset >= 0.0) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a4.offset >= 0.0) {
    float v15 = v12;
  }
  else {
    float v15 = -1.0;
  }
  unint64_t v16 = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:v14 | ((unint64_t)LODWORD(v15) << 32)];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v16 != [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:a5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "start and end coordinate span a path boundary. Caller should make sure start and end coordinate are within the same path. Trimming and attempting to continue.", buf, 2u);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: pathIndex == [self pathIndexForRouteCoordinate:end]", buf, 2u);
      }
    }
    unint64_t v17 = [(GEOComposedRouteCoordinateArray *)self pathIndexForRouteCoordinate:a5];
    unint64_t v18 = v16;
    PolylineCoordinate v19 = a5;
    unint64_t v89 = v18;
    if (v18 != v17) {
      PolylineCoordinate v19 = (PolylineCoordinate)[(GEOComposedRouteCoordinateArray *)self routeIndexForLocalIndex:[(GEOComposedRouteCoordinateArray *)self coordinateCountForPathAtIndex:v18]- 1 onPath:v18];
    }
    unint64_t v20 = (v14 + 1);
    PolylineCoordinate v21 = [(GEOComposedRouteCoordinateArray *)self nearestSupportPointAfterRouteCoordinate:v20];
    *(float *)&double v22 = v21.offset;
    if (v21.offset < 0.0)
    {
      uint64_t v23 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v25 = GEOPolylineCoordinateAsString(v14 | ((unint64_t)LODWORD(v15) << 32), 1, 0, v24);
        *(_DWORD *)buf = 138477827;
        *(void *)unint64_t v93 = v25;
        _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "start coordinate [%{private}@] is at the end of the route. Returning empty path.", buf, 0xCu);
      }
      goto LABEL_66;
    }
    PolylineCoordinate v26 = v21;
    unsigned int v88 = -[GEOComposedRouteCoordinateArray nearestSupportPointAfterRouteCoordinate:](self, "nearestSupportPointAfterRouteCoordinate:", v19, v22);
    unint64_t v87 = v14 | ((unint64_t)LODWORD(v15) << 32);
    uint64_t v27 = [(GEOComposedRouteCoordinateArray *)self supportPointAtRouteCoordinate:v87];
    int v28 = (void *)v27;
    unint64_t v29 = vcvtas_u32_f32(v15 + (float)v14);
    if (v15 >= 0.0) {
      uint64_t index = v29;
    }
    else {
      uint64_t index = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v27)
    {
      double v31 = 0.0;
LABEL_61:
      [(GEOComposedRouteCoordinateArray *)self _populateRoutingPathWithCoordinate:retstr pathIndex:v89 startIndex:index endIndex:v88 distanceFromStartOffset:v7 supportPointsOnly:0 convertEndpointsToSupportPoints:v31];
      if (retstr->var4.var1 <= 1)
      {
        unint64_t v80 = GEOGetGEOComposedRouteLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
        {
          GEOPolylineCoordinateRangeAsString(*(void *)&a4, *(void *)&a5, v81);
          id v82 = (id)objc_claimAutoreleasedReturnValue();
          double v83 = [(GEOComposedRouteCoordinateArray *)self supportPointsForPathAtIndex:v89];
          int v84 = [v83 count];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)unint64_t v93 = v89;
          *(_WORD *)&v93[4] = 1024;
          *(_DWORD *)&v93[6] = index;
          __int16 v94 = 1024;
          unsigned int v95 = v88;
          __int16 v96 = 2112;
          id v97 = v82;
          __int16 v98 = 1024;
          int v99 = v84;
          _os_log_impl(&dword_188D96000, v80, OS_LOG_TYPE_FAULT, "Routing path leg with fewer than 2 points. pathIndex:%d startIndex:%d endIndex:%d originalRange:[%@] supportPoints:%d", buf, 0x24u);
        }
      }

      goto LABEL_66;
    }
    [(GEOComposedRouteCoordinateArray *)self coordinateForRouteCoordinate:v87];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    [(GEOComposedRouteCoordinateArray *)self coordinateForRouteCoordinate:(v14 + 1)];
    long double v40 = GEOBearingFromCoordinateToCoordinate(v33, v35, v38, v39);
    double v41 = fmod(v40, 360.0);
    if (v41 >= 0.0) {
      double v42 = v41;
    }
    else {
      double v42 = v41 + 360.0;
    }
    p_var4 = (google::protobuf::internal::ArenaImpl **)&retstr->var4;
    var3 = retstr->var4.var3;
    unsigned int v86 = v7;
    if (var3)
    {
      int var1 = retstr->var4.var1;
      int v45 = *(_DWORD *)var3;
      if (var1 < *(_DWORD *)var3)
      {
        retstr->var4.int var1 = var1 + 1;
        uint64_t v46 = (char *)*((void *)var3 + var1 + 1);
        goto LABEL_32;
      }
      if (v45 != retstr->var4.var2)
      {
LABEL_31:
        *(_DWORD *)var3 = v45 + 1;
        uint64_t v46 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(*p_var4);
        unint64_t v47 = retstr->var4.var3;
        uint64_t v48 = retstr->var4.var1;
        retstr->var4.int var1 = v48 + 1;
        *((void *)v47 + v48 + 1) = v46;
LABEL_32:
        int v49 = *((_DWORD *)v46 + 4);
        *((_DWORD *)v46 + 21) = 1;
        *((_DWORD *)v46 + 4) = v49 | 0x802;
        unint64_t v50 = (char *)*((void *)v46 + 4);
        if (!v50)
        {
          uint64_t v51 = *((void *)v46 + 1);
          uint64_t v52 = (google::protobuf::internal::ArenaImpl *)(v51 & 0xFFFFFFFFFFFFFFFELL);
          if (v51) {
            uint64_t v52 = *(google::protobuf::internal::ArenaImpl **)v52;
          }
          unint64_t v50 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v52);
          *((void *)v46 + 4) = v50;
        }
        int v53 = +[GEOLatLngE7 toE7Coordinate:v33];
        *((_DWORD *)v50 + 4) |= 1u;
        *((_DWORD *)v50 + 6) = v53;
        int v54 = +[GEOLatLngE7 toE7Coordinate:v35];
        *((_DWORD *)v50 + 4) |= 2u;
        *((_DWORD *)v50 + 7) = v54;
        int v55 = *((_DWORD *)v46 + 4);
        *((_DWORD *)v46 + 14) = (int)(v37 * 100.0);
        *((_DWORD *)v46 + 15) = vcvtad_u64_f64(v42);
        *((_DWORD *)v46 + 4) = v55 | 0x130;
        *((_DWORD *)v46 + 18) = 0;
        PolylineCoordinate v56 = v26;
        if (v90)
        {
          uint64_t v57 = [v90 startRouteCoordinate];
          if (v14 > v57 || v14 == v57 && v15 >= *((float *)&v57 + 1))
          {
            uint64_t v58 = [v90 endRouteCoordinate];
            if (v14 < v58 || v14 == v58 && v15 <= *((float *)&v58 + 1))
            {
              v59 = [v90 road];
              uint64_t v60 = [v59 signedMuid];
              *((_DWORD *)v46 + 4) |= 8u;
              *((void *)v46 + 6) = v60;
              int v61 = [v59 formOfWay];
              *((_DWORD *)v46 + 4) |= 0x80u;
              *((_DWORD *)v46 + 17) = v61;
              int v62 = [v59 roadClass];
              *((_DWORD *)v46 + 4) |= 0x40u;
              *((_DWORD *)v46 + 16) = v62;
            }
          }
        }
        uint64_t index = v26.index;
        if ((v86 & 1) != 0 || v26.index <= v20)
        {
LABEL_60:
          [(GEOComposedRouteCoordinateArray *)self distanceBetweenRouteCoordinate:v87 andRouteCoordinate:v56];
          int v28 = 0;
          uint64_t v7 = v86;
          goto LABEL_61;
        }
        while (1)
        {
          uint64_t v63 = retstr->var4.var3;
          if (!v63) {
            break;
          }
          int v64 = retstr->var4.var1;
          int var2 = *(_DWORD *)v63;
          if (v64 >= *(_DWORD *)v63)
          {
            if (var2 == retstr->var4.var2)
            {
LABEL_51:
              if (v64 <= var2)
              {
                google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)p_var4, var2 - v64 + 1);
                uint64_t v63 = retstr->var4.var3;
              }
              int var2 = *(_DWORD *)v63;
            }
            *(_DWORD *)uint64_t v63 = var2 + 1;
            double v66 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(*p_var4);
            double v67 = retstr->var4.var3;
            uint64_t v68 = retstr->var4.var1;
            retstr->var4.int var1 = v68 + 1;
            *((void *)v67 + v68 + 1) = v66;
            goto LABEL_55;
          }
          retstr->var4.int var1 = v64 + 1;
          double v66 = (char *)*((void *)v63 + v64 + 1);
LABEL_55:
          *((_DWORD *)v66 + 4) |= 0x800u;
          *((_DWORD *)v66 + 21) = 2;
          [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:v20];
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;
          *((_DWORD *)v66 + 4) |= 2u;
          unint64_t v75 = (char *)*((void *)v66 + 4);
          if (!v75)
          {
            uint64_t v76 = *((void *)v66 + 1);
            uint64_t v77 = (google::protobuf::internal::ArenaImpl *)(v76 & 0xFFFFFFFFFFFFFFFELL);
            if (v76) {
              uint64_t v77 = *(google::protobuf::internal::ArenaImpl **)v77;
            }
            unint64_t v75 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v77);
            *((void *)v66 + 4) = v75;
          }
          int v78 = +[GEOLatLngE7 toE7Coordinate:v70];
          *((_DWORD *)v75 + 4) |= 1u;
          *((_DWORD *)v75 + 6) = v78;
          int v79 = +[GEOLatLngE7 toE7Coordinate:v72];
          *((_DWORD *)v75 + 4) |= 2u;
          *((_DWORD *)v75 + 7) = v79;
          *((_DWORD *)v66 + 4) |= 0x10u;
          *((_DWORD *)v66 + 14) = (int)(v74 * 100.0);
          ++v20;
          PolylineCoordinate v56 = v26;
          if (v26.index == v20) {
            goto LABEL_60;
          }
        }
        int v64 = retstr->var4.var1;
        int var2 = retstr->var4.var2;
        goto LABEL_51;
      }
    }
    else
    {
      int var1 = retstr->var4.var1;
      int v45 = retstr->var4.var2;
    }
    if (var1 <= v45)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)p_var4, v45 - var1 + 1);
      var3 = retstr->var4.var3;
    }
    int v45 = *(_DWORD *)var3;
    goto LABEL_31;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "start coordinate is not within range of route", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: pathIndex != NSNotFound", buf, 2u);
  }
LABEL_66:

  return result;
}

- (RoutingPathLeg)routingPathDataWithinSupportPoints:(SEL)a3 supportPointsOnly:(id)a4
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  maps::path_codec::geo3::RoutingPathLeg::RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)retstr, 0);
  if ((unint64_t)[v8 count] < 2) {
    goto LABEL_16;
  }
  unint64_t v9 = [v8 firstObject];
  -[GEOComposedRouteCoordinateArray distanceFromStartToRouteCoordinate:](self, "distanceFromStartToRouteCoordinate:", [v9 routeCoordinate]);
  double v11 = v10;

  float v12 = [v8 objectEnumerator];
  unsigned int v13 = [v12 nextObject];
  id v14 = [v8 firstObject];
  uint64_t v15 = [v14 routeCoordinate];
  unint64_t v16 = [v8 lastObject];
  unint64_t v17 = +[GEOPolylineCoordinateIterator iteratorWithRange:](GEOPolylineCoordinateIterator, "iteratorWithRange:", v15, [v16 routeCoordinate]);

  while (1)
  {

    if (![v17 isCurrentValid]) {
      break;
    }
    uint64_t v18 = [v17 current];
    [(GEOComposedRouteCoordinateArray *)self coordinateForRouteCoordinate:v18];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    uint64_t v25 = [v17 current];
    uint64_t v26 = [v13 routeCoordinate];
    if (vabds_f32((float)v25 + *((float *)&v25 + 1), (float)v26 + *((float *)&v26 + 1)) >= 0.001)
    {
      id v14 = 0;
      if (v5)
      {
LABEL_8:
        if (!v14) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v14 = v13;
      uint64_t v27 = [v12 nextObject];

      unsigned int v13 = (void *)v27;
      if (v5) {
        goto LABEL_8;
      }
    }
    [(GEOComposedRouteCoordinateArray *)self distanceFromStartToRouteCoordinate:v18];
    -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", retstr, v14, v20, v22, v24, v28 - v11);
LABEL_10:
    [v17 advance];
  }
  if (retstr->var4.var1 <= 1)
  {
    unint64_t v29 = GEOGetGEOComposedRouteLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      int v30 = [v8 count];
      double v31 = [v8 firstObject];
      uint64_t v32 = [v31 routeCoordinate];
      double v33 = [v8 lastObject];
      uint64_t v34 = [v33 routeCoordinate];
      double v36 = GEOPolylineCoordinateRangeAsString(v32, v34, v35);
      v38[0] = 67109378;
      v38[1] = v30;
      __int16 v39 = 2112;
      long double v40 = v36;
      _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_FAULT, "Routing path leg with fewer than 2 points. Support points: %d, range: %@", (uint8_t *)v38, 0x12u);
    }
  }

LABEL_16:
  return result;
}

- (id)compressedDataForRoutingPath:(const void *)a3
{
  +[PathCodec compress:(maps::path_codec::geo3::RoutingPathLeg *)v5];
  double v3 = +[PathCodec dataForRoutingPathLeg:]((uint64_t)PathCodec, (google::protobuf::MessageLite *)v5);
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v5);

  return v3;
}

- (id)routingPathDataFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(BOOL)a5
{
  [(GEOComposedRouteCoordinateArray *)self routingPathFromStart:a3 toEnd:a4 supportPointsOnly:a5 convertEndpointsToSupportPoints:0];
  unint64_t v6 = [(GEOComposedRouteCoordinateArray *)self compressedDataForRoutingPath:v8];
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v8);

  return v6;
}

- (id)routingPathDataWithSupportPointFromStart:(PolylineCoordinate)a3 toEnd:(PolylineCoordinate)a4 supportPointsOnly:(BOOL)a5 startPathSegment:(id)a6
{
  [(GEOComposedRouteCoordinateArray *)self routingPathWithSupportPointFromStart:a3 toEnd:a4 supportPointsOnly:a5 startPathSegment:a6];
  uint64_t v7 = [(GEOComposedRouteCoordinateArray *)self compressedDataForRoutingPath:v9];
  maps::path_codec::geo3::RoutingPathLeg::~RoutingPathLeg((maps::path_codec::geo3::RoutingPathLeg *)v9);

  return v7;
}

- (void)_populateRoutingPathWithCoordinate:(void *)a3 pathIndex:(unint64_t)a4 startIndex:(unint64_t)a5 endIndex:(unint64_t)a6 distanceFromStartOffset:(double)a7 supportPointsOnly:(BOOL)a8 convertEndpointsToSupportPoints:(BOOL)a9
{
  BOOL v9 = a9;
  id v38 = [(GEOComposedRouteCoordinateArray *)self supportPointsForPathAtIndex:a4];
  if ([v38 count])
  {
    unint64_t v16 = [v38 objectEnumerator];
    unint64_t v17 = [v16 nextObject];
    if (a5 <= a6)
    {
      unint64_t v37 = a5 + 1;
      unint64_t v18 = a5;
      while (v17)
      {
        while (v18 > objc_msgSend(v17, "routeCoordinate", v37))
        {
          uint64_t v19 = [v16 nextObject];

          unint64_t v17 = (void *)v19;
          if (!v19) {
            goto LABEL_11;
          }
        }
        if (v18 != [v17 routeCoordinate]) {
          break;
        }
        [(GEOComposedRouteCoordinateArray *)self distanceBetweenIndex:a5 andIndex:v18];
        [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:v18];
        -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", a3, v17);
        if (a8)
        {
          uint64_t v20 = [v16 nextObject];

          unint64_t v17 = (void *)v20;
LABEL_26:
          if (!v17) {
            goto LABEL_30;
          }
          unint64_t v18 = [v17 routeCoordinate];
          goto LABEL_29;
        }
LABEL_28:
        ++v18;
LABEL_29:
        if (v18 > a6) {
          goto LABEL_30;
        }
      }
LABEL_11:
      if (!v9 || v18 != a5 && v18 != a6)
      {
        if (a8) {
          goto LABEL_26;
        }
        [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:v18];
        -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", a3, 0);
        goto LABEL_28;
      }
      -[GEOComposedRouteCoordinateArray distanceBetweenIndex:andIndex:](self, "distanceBetweenIndex:andIndex:", a5, v18, v37);
      double v22 = v21;
      [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:v18];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      unint64_t v29 = objc_alloc_init(GEOCoordinateArraySupportPoint);
      if (v18 == a5)
      {
        if ([(GEOComposedRouteCoordinateArray *)self coordinateCount] - 1 <= a5) {
          goto LABEL_25;
        }
        [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:v37];
        long double v32 = GEOBearingFromCoordinateToCoordinate(v24, v26, v30, v31);
        double v33 = fmod(v32, 360.0);
        if (v33 < 0.0) {
          double v33 = v33 + 360.0;
        }
      }
      else
      {
        if (!v18) {
          goto LABEL_25;
        }
        [(GEOComposedRouteCoordinateArray *)self coordinateOnRouteAt:v18 - 1];
        long double v36 = GEOBearingFromCoordinateToCoordinate(v34, v35, v24, v26);
        double v33 = fmod(v36, 360.0);
        if (v33 < 0.0) {
          double v33 = v33 + 360.0;
        }
      }
      [(GEOCoordinateArraySupportPoint *)v29 setHeading:v33];
LABEL_25:
      -[GEOComposedRouteCoordinateArray _addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:](self, "_addPointToRoutingPath:coordinate:supportPoint:distanceFromStart:", a3, v29, v24, v26, v28, v22 + a7);

      if (a8) {
        goto LABEL_26;
      }
      goto LABEL_28;
    }
LABEL_30:
  }
}

- (void)_addPointToRoutingPath:(void *)a3 coordinate:(id)a4 supportPoint:(id)a5 distanceFromStart:(double)a6
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a5;
  float v12 = (int *)*((void *)a3 + 5);
  if (!v12)
  {
    int v13 = *((_DWORD *)a3 + 8);
    int v14 = *((_DWORD *)a3 + 9);
LABEL_6:
    if (v13 <= v14)
    {
      google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 24), v14 - v13 + 1);
      float v12 = (int *)*((void *)a3 + 5);
    }
    int v14 = *v12;
    goto LABEL_9;
  }
  int v13 = *((_DWORD *)a3 + 8);
  int v14 = *v12;
  if (v13 < *v12)
  {
    *((_DWORD *)a3 + 8) = v13 + 1;
    uint64_t v15 = *(char **)&v12[2 * v13 + 2];
    goto LABEL_10;
  }
  if (v14 == *((_DWORD *)a3 + 9)) {
    goto LABEL_6;
  }
LABEL_9:
  *float v12 = v14 + 1;
  uint64_t v15 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::RoutingPathPoint>(*((google::protobuf::internal::ArenaImpl **)a3
                                                                                              + 3));
  uint64_t v16 = *((void *)a3 + 5);
  uint64_t v17 = *((int *)a3 + 8);
  *((_DWORD *)a3 + 8) = v17 + 1;
  *(void *)(v16 + 8 * v17 + 8) = v15;
LABEL_10:
  *((_DWORD *)v15 + 4) |= 2u;
  unint64_t v18 = (char *)*((void *)v15 + 4);
  if (!v18)
  {
    uint64_t v19 = *((void *)v15 + 1);
    uint64_t v20 = (google::protobuf::internal::ArenaImpl *)(v19 & 0xFFFFFFFFFFFFFFFELL);
    if (v19) {
      uint64_t v20 = *(google::protobuf::internal::ArenaImpl **)v20;
    }
    unint64_t v18 = google::protobuf::Arena::CreateMaybeMessage<maps::path_codec::geo3::LatLngE7>(v20);
    *((void *)v15 + 4) = v18;
  }
  int v21 = +[GEOLatLngE7 toE7Coordinate:var0];
  *((_DWORD *)v18 + 4) |= 1u;
  *((_DWORD *)v18 + 6) = v21;
  int v22 = +[GEOLatLngE7 toE7Coordinate:var1];
  *((_DWORD *)v18 + 4) |= 2u;
  *((_DWORD *)v18 + 7) = v22;
  int v23 = *((_DWORD *)v15 + 4);
  *((_DWORD *)v15 + 14) = (int)(var2 * 100.0);
  *((_DWORD *)v15 + 4) = v23 | 0x810;
  if (v11)
  {
    *((_DWORD *)v15 + 21) = 1;
    [v11 heading];
    *((_DWORD *)v15 + 4) |= 0x20u;
    *((_DWORD *)v15 + 15) = v24;
    char v25 = [v11 isUTurn];
    int v26 = *((_DWORD *)v15 + 4);
    v15[76] = v25;
    *((_DWORD *)v15 + 4) = v26 | 0x300;
    *((_DWORD *)v15 + 18) = (a6 * 100.0);
    if ([v11 roadID])
    {
      uint64_t v27 = [v11 roadID];
      *((_DWORD *)v15 + 4) |= 8u;
      *((void *)v15 + 6) = v27;
    }
    if ([v11 legacyRoadClass] != 9)
    {
      int v28 = [v11 legacyRoadClass];
      *((_DWORD *)v15 + 4) |= 0x40u;
      *((_DWORD *)v15 + 16) = v28;
    }
    if ([v11 legacyFormOfWay])
    {
      int v29 = [v11 legacyFormOfWay];
      *((_DWORD *)v15 + 4) |= 0x80u;
      *((_DWORD *)v15 + 17) = v29;
    }
    double v30 = [v11 anchorPointID];

    if (v30)
    {
      double v31 = objc_msgSend(v11, "anchorPointID", 0, 0);
      objc_msgSend(v31, "_geo_getHighBytes:lowBytes:", &v34, &v33);

      operator new();
    }
  }
  else
  {
    *((_DWORD *)v15 + 21) = 2;
  }

  return v15;
}

@end