@interface GEOSnappedRoutePath
- (BOOL)hasCompletedMapMatching;
- (BOOL)hasObserver:(id)a3;
- (BOOL)isMapMatched;
- (BOOL)isMapMatching;
- (BOOL)unregisterObserver:(id)a3;
- (GEOComposedRouteSection)section;
- (GEOSnappedRoutePath)initWithRoute:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6;
- (NSArray)edges;
- (const)mapMatchingSection;
- (float)_calculateEdgeLengthFrom:(const void *)a3 to:(const void *)a4 startCoord:(const PolylineCoordinate *)a5 endCoord:(const PolylineCoordinate *)a6;
- (id).cxx_construct;
- (id)description;
- (unsigned)routeEndIndex;
- (unsigned)routeStartIndex;
- (void)_debugPrintEdge:(id)a3;
- (void)dealloc;
- (void)matchWithDecoder:(id)a3 completionHandler:(id)a4;
- (void)registerObserver:(id)a3;
@end

@implementation GEOSnappedRoutePath

- (GEOSnappedRoutePath)initWithRoute:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6
{
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOSnappedRoutePath;
  v12 = [(GEOSnappedRoutePath *)&v17 init];
  v13 = v12;
  if (v12)
  {
    CFSetCallBacks v16 = *(CFSetCallBacks *)byte_1ED51ED20;
    objc_storeWeak((id *)&v12->_route, v10);
    objc_storeWeak((id *)&v13->_section, v11);
    v13->_routeStartIndex = a5;
    v13->_routeEndIndex = a6;
    v13->_unsnappedPointCount = a6 - a5 + 1;
    uint64_t v14 = objc_msgSend(v11, "points", *(_OWORD *)&v16.version, *(_OWORD *)&v16.release, *(_OWORD *)&v16.equal);
    v13->_unsnappedPoints = (GeoCodecsVectorTilePoint3D *)(v14
                                                         + 12
                                                         * (a5 - [v11 startPointIndex]));
    v13->_observers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v16);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  CFRelease(self->_observers);
  [(GEOMapRequest *)self->_edgeSearchRequest cancel];
  v3.receiver = self;
  v3.super_class = (Class)GEOSnappedRoutePath;
  [(GEOSnappedRoutePath *)&v3 dealloc];
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"%u - %u", self->_routeStartIndex, self->_routeEndIndex);
  v4 = v3;
  if (self->_edges)
  {
    v5 = [v3 stringByAppendingString:@" Matched Edges:"];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = self->_edges;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        id v10 = v5;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) description];
          v5 = [v10 stringByAppendingFormat:@" %@", v11];

          ++v9;
          id v10 = v5;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    if ([(GEOSnappedRoutePath *)self isMapMatching])
    {
      uint64_t v12 = [v4 stringByAppendingString:@" Matching.."];
    }
    else
    {
      if ([(GEOSnappedRoutePath *)self hasCompletedMapMatching]) {
        [v4 stringByAppendingString:@" Matched, no edges"];
      }
      else {
      uint64_t v12 = [v4 stringByAppendingString:@" Not matched"];
      }
    }
    v5 = (void *)v12;
  }

  return v5;
}

- (void)_debugPrintEdge:(id)a3
{
  id v4 = a3;
  NSLog(&stru_1ED5215D0.isa, v4);
  uint64_t v5 = [v4 pointCount];
  uint64_t v6 = [v4 points];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained bounds];
    double v10 = v19;
    double v9 = v18;
    double v11 = v20;
    double v12 = v21;
  }
  else
  {
    double v12 = 0.0;
    double v11 = 0.0;
    double v10 = 0.0;
    double v9 = 0.0;
  }

  if (v5)
  {
    v13 = (float *)(v6 + 4);
    do
    {
      double v14 = v9 + *(v13 - 1) * v11;
      float v15 = *v13;
      v13 += 2;
      long double v16 = exp(((v10 + (float)(1.0 - v15) * v12) * 0.0078125 + -1048576.0) / 333772.107);
      long double v17 = atan(v16);
      printf("%f,%f\n", (double)((v17 * -2.0 + 1.57079633) * 57.2957795), v14 * 0.0078125 * 0.000171661377 + -180.0);
      --v5;
    }
    while (v5);
  }
}

- (BOOL)hasCompletedMapMatching
{
  return self->_hasCompletedMapMatching;
}

- (BOOL)isMapMatched
{
  v2 = [(GEOSnappedRoutePath *)self edges];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isMapMatching
{
  return self->_edgeSearchRequest != 0;
}

- (float)_calculateEdgeLengthFrom:(const void *)a3 to:(const void *)a4 startCoord:(const PolylineCoordinate *)a5 endCoord:(const PolylineCoordinate *)a6
{
  float v7 = *(float *)a3;
  float v6 = *((float *)a3 + 1);
  unsigned int routeStartIndex = self->_routeStartIndex;
  unsigned int v9 = a5->index - routeStartIndex + 1;
  unsigned int v10 = a6->index - routeStartIndex;
  if (v9 <= v10)
  {
    float v13 = 0.0;
    do
    {
      double v14 = &self->_unsnappedPoints[v9];
      float var0 = v14->var0;
      float var1 = v14->var1;
      float v13 = v13
          + sqrtf((float)((float)((float)(v7 - v14->var0) * (float)(v7 - v14->var0)) + 0.0)+ (float)((float)(v6 - var1) * (float)(v6 - var1)));
      ++v9;
      float v6 = var1;
      float v7 = v14->var0;
    }
    while (v9 <= v10);
  }
  else
  {
    float var0 = *(float *)a3;
    float var1 = *((float *)a3 + 1);
    float v13 = 0.0;
  }
  return v13
       + sqrtf((float)((float)((float)(var0 - *(float *)a4) * (float)(var0 - *(float *)a4)) + 0.0)+ (float)((float)(var1 - *((float *)a4 + 1)) * (float)(var1 - *((float *)a4 + 1))));
}

- (void)matchWithDecoder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  float v7 = (void (**)(id, BOOL))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  unsigned int v9 = [WeakRetained coordinates];
  char v10 = [v9 usesZilch];

  if ((v10 & 1) == 0)
  {
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  if (!self->_hasCompletedMapMatching)
  {
    if (!self->_edgeSearchRequest)
    {
      edges = self->_edges;
      self->_edges = 0;

      float v13 = operator new(0x20uLL);
      v13[1] = 0;
      v13[2] = 0;
      void *v13 = &unk_1ED518828;
      zilch::Message::Message((zilch::Message *)(v13 + 3));
    }
    goto LABEL_5;
  }
  BOOL v11 = [(GEOSnappedRoutePath *)self isMapMatched];
LABEL_6:
  v7[2](v7, v11);
}

void __58__GEOSnappedRoutePath_matchWithDecoder_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained bounds];
    long long v6 = v62;
    long long v7 = *(_OWORD *)&v63[1];
  }
  else
  {
    long long v6 = 0uLL;
    memset(v63, 0, sizeof(v63));
    long long v62 = 0u;
    long long v7 = 0uLL;
  }
  v64[0] = v6;
  v64[1] = v7;

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(a2[10] - a2[9]) >> 4];
  uint64_t v9 = a2[9];
  uint64_t v10 = a2[10];
  uint64_t v57 = a1;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v61 = *(unsigned int *)(v11 + 60);
  uint64_t v60 = **(void **)(v11 + 72);
  if (v10 == v9)
  {
    float v13 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    float v13 = 0;
    unint64_t v14 = 1;
    v56 = v8;
    do
    {
      float v15 = (int *)(v9 + v12);
      int v16 = *v15;
      uint64_t v17 = *((void *)v15 + 1);
      uint64_t v18 = a2[3] + 72 * v17;
      uint64_t v19 = a2[6] + 48 * v17;
      if (v16) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = v18;
      }
      int v21 = zilch::PathElement::type((zilch::PathElement *)v20);
      if (!v21 && zilch::GeoPolyline::size((zilch::GeoPolyline *)(v20 + 40)) > 1)
      {
        v22 = [[GEOSnappedRouteEdge alloc] initWithRoadPath:v20 sectionRect:v64];
        if (v13)
        {
          unsigned int v23 = zilch::PathElement::controlPointIndex((zilch::PathElement *)v20);
          v24 = v13;
          uint64_t v25 = *(void *)(v57 + 32);
          uint64_t v59 = *(_DWORD *)(v25 + 60) + v23;
          uint64_t v26 = *(void *)(v25 + 72);
          v27 = (float *)(v26 + 12 * v23);
          float v28 = *v27;
          float v29 = v27[1];
          v30 = (float *)(v26 + 12 * (v23 + 1));
          float v31 = *v30;
          float v32 = v30[1];
          v33 = [(GEOSnappedRouteEdge *)v22 points];
          float v34 = v31 - v28;
          float v35 = v32 - v29;
          float v36 = 0.0;
          float v37 = (float)((float)(v34 * v34) + 0.0) + (float)(v35 * v35);
          if (v37 > 1.0e-15)
          {
            float v38 = (float)((float)((float)((float)(*v33 - v28) * v34) + 0.0) + (float)((float)(v33[1] - v29) * v35))
                / v37;
            if (v38 < 0.0) {
              float v38 = 0.0;
            }
            if (v38 <= 1.0) {
              float v36 = v38;
            }
            else {
              float v36 = 1.0;
            }
          }
          *((float *)&v59 + 1) = v36;
          *(float *)&uint64_t v58 = v28 + (float)(v34 * v36);
          *((float *)&v58 + 1) = v29 + (float)(v35 * v36);
          uint64_t v39 = v61;
          uint64_t v40 = v59;
          objc_msgSend(*(id *)(v57 + 32), "_calculateEdgeLengthFrom:to:startCoord:endCoord:", &v60, &v58, &v61, &v59, v56);
          int v42 = v41;
          id v43 = objc_loadWeakRetained((id *)(*(void *)(v57 + 32) + 8));
          LODWORD(v44) = v42;
          [(GEOSnappedRouteEdge *)v24 calculateRouteOffsetsBetweenA:v39 andB:v40 overLength:v43 onRoute:v44];

          uint64_t v61 = v59;
          uint64_t v60 = v58;
          uint64_t v8 = v56;
          float v13 = v24;
        }
        v45 = v22;

        [v8 addObject:v45];
        float v13 = v45;
      }
      uint64_t v9 = a2[9];
      if (v21) {
        BOOL v46 = 1;
      }
      else {
        BOOL v46 = v14 >= (a2[10] - v9) >> 4;
      }
      ++v14;
      v12 += 16;
    }
    while (!v46);
    uint64_t v11 = *(void *)(v57 + 32);
    if (v21) {
      BOOL v47 = 1;
    }
    else {
      BOOL v47 = v13 == 0;
    }
    if (!v47)
    {
      uint64_t v48 = v61;
      uint64_t v49 = *(unsigned int *)(v11 + 64);
      uint64_t v59 = *(void *)(*(void *)(v11 + 72) + 12 * (*(_DWORD *)(v11 + 68) - 1));
      uint64_t v58 = v49;
      [(id)v11 _calculateEdgeLengthFrom:&v60 to:&v59 startCoord:&v61 endCoord:&v58];
      int v51 = v50;
      id v52 = objc_loadWeakRetained((id *)(*(void *)(v57 + 32) + 8));
      LODWORD(v53) = v51;
      [(GEOSnappedRouteEdge *)v13 calculateRouteOffsetsBetweenA:v48 andB:v49 overLength:v52 onRoute:v53];

      objc_storeStrong((id *)(*(void *)(v57 + 32) + 24), v8);
      uint64_t v11 = *(void *)(v57 + 32);
    }
  }
  *(unsigned char *)(v11 + 56) = 1;
  uint64_t v54 = *(void *)(v57 + 32);
  v55 = *(void **)(v54 + 32);
  *(void *)(v54 + 32) = 0;

  (*(void (**)(void))(*(void *)(v57 + 40) + 16))();
}

void __58__GEOSnappedRoutePath_matchWithDecoder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOSnappedRoutePath");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(v5 + 60);
    int v6 = *(_DWORD *)(v5 + 64);
    v10[0] = 67109632;
    v10[1] = v7;
    __int16 v11 = 1024;
    int v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = [v3 code];
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Snapping failed (%u - %u): %ld!", (uint8_t *)v10, 0x18u);
  }

  if ([v3 code] != 1) {
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (const)mapMatchingSection
{
  return self->_mapMatchingSection.__ptr_.__value_;
}

- (BOOL)unregisterObserver:(id)a3
{
  id v4 = a3;
  CFSetRemoveValue(self->_observers, v4);
  LOBYTE(self) = CFSetGetCount(self->_observers) > 0;

  return (char)self;
}

- (void)registerObserver:(id)a3
{
}

- (BOOL)hasObserver:(id)a3
{
  return CFSetGetCountOfValue(self->_observers, a3) > 0;
}

- (NSArray)edges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (GEOComposedRouteSection)section
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);

  return (GEOComposedRouteSection *)WeakRetained;
}

- (unsigned)routeStartIndex
{
  return self->_routeStartIndex;
}

- (unsigned)routeEndIndex
{
  return self->_routeEndIndex;
}

- (void).cxx_destruct
{
  value = self->_mapMatchingSection.__ptr_.__value_;
  self->_mapMatchingSection.__ptr_.__value_ = 0;
  if (value) {
    (*((void (**)(RouteMapMatchingSection *, SEL))value->var0 + 1))(value, a2);
  }
  objc_storeStrong((id *)&self->_edgeSearchRequest, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_destroyWeak((id *)&self->_section);

  objc_destroyWeak((id *)&self->_route);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end