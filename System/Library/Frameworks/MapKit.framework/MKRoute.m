@interface MKRoute
- (BOOL)hasHighways;
- (BOOL)hasTolls;
- (CLLocationDistance)distance;
- (GEOComposedRoute)_geoComposedRoute;
- (MKDirectionsTransportType)transportType;
- (MKPolyline)polyline;
- (NSArray)advisoryNotices;
- (NSArray)steps;
- (NSString)name;
- (NSTimeInterval)expectedTravelTime;
- (id)_initWithGEOComposedRoute:(id)a3;
@end

@implementation MKRoute

- (id)_initWithGEOComposedRoute:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v68.receiver = self;
  v68.super_class = (Class)MKRoute;
  v6 = [(MKRoute *)&v68 init];
  v7 = v6;
  if (v6)
  {
    p_geoComposedRoute = (id *)&v6->_geoComposedRoute;
    objc_storeStrong((id *)&v6->_geoComposedRoute, a3);
    if ([v5 elevationModel] || !GEOConfigGetBOOL())
    {
      BOOL v12 = 0;
    }
    else
    {
      v9 = [MEMORY[0x1E4F64918] modernManager];
      v10 = [v9 activeTileGroup];
      v11 = [v10 activeTileSetForTileType:92 scale:1];
      BOOL v12 = v11 != 0;
    }
    unsigned int v13 = [*p_geoComposedRoute pointCount];
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
      if (v15)
      {
        v16 = v15;
        v17 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
        if (v17)
        {
          v18 = v17;
          uint64_t v19 = 0;
          v20 = v16 + 1;
          do
          {
            [*p_geoComposedRoute pointAt:v19];
            *(v20 - 1) = v21;
            void *v20 = v22;
            v18[v19++] = v23;
            v20 += 2;
          }
          while (v14 != v19);
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __37__MKRoute__initWithGEOComposedRoute___block_invoke_2;
          v67[3] = &__block_descriptor_48_e5_v8__0l;
          v67[4] = v16;
          v67[5] = v18;
          v24 = (void (**)(void))MEMORY[0x18C139AE0](v67);
          uint64_t v25 = +[MKPolyline polylineWithCoordinates:v16 elevations:v18 count:v14 elevationCorrection:v12];
          polyline = v7->_polyline;
          v7->_polyline = (MKRoutePolyline *)v25;

          v27 = [(MKRoute *)v7 name];
          [(MKShape *)v7->_polyline setTitle:v27];

          id v55 = v5;
          -[MKRoutePolyline _setRequiresModernMap:](v7->_polyline, "_setRequiresModernMap:", [v5 transportType] != 0);
          v62 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[GEOComposedRoute stepsCount](v7->_geoComposedRoute, "stepsCount"));
          uint64_t v28 = [(GEOComposedRoute *)v7->_geoComposedRoute stepsCount];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id obj = [(GEOComposedRoute *)v7->_geoComposedRoute steps];
          uint64_t v59 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
          if (v59)
          {
            unint64_t v29 = 0;
            v54 = v24;
            uint64_t v57 = v28;
            v58 = v7;
            uint64_t v60 = 1;
            uint64_t v61 = *(void *)v64;
            while (2)
            {
              uint64_t v30 = 0;
              unint64_t v31 = v29;
              do
              {
                if (*(void *)v64 != v61) {
                  objc_enumerationMutation(obj);
                }
                v32 = *(void **)(*((void *)&v63 + 1) + 8 * v30);
                [v32 endRouteCoordinate];
                unint64_t v33 = GEOPolylineCoordinateNearestIndex();
                if (v33 < v31
                  || (unint64_t v29 = v33,
                      -[MKRoutePolyline _stepWithRange:](v7->_polyline, "_stepWithRange:", v31, v33 - v31 + 1),
                      (uint64_t v34 = objc_claimAutoreleasedReturnValue()) == 0))
                {
                  v53 = v54;
                  v54[2](v54);
LABEL_36:

                  v51 = 0;
                  id v5 = v55;
                  goto LABEL_33;
                }
                v35 = (void *)v34;
                v36 = NSString;
                v37 = _MKLocalizedStringFromThisBundle(@"Step %d of %d");
                v38 = objc_msgSend(v36, "stringWithFormat:", v37, v60 + v30, v57);
                [v35 setTitle:v38];

                v39 = [v32 geoStep];
                v40 = [v39 instructionSet];
                v41 = [v40 genericInstruction];
                v42 = [v41 maneuver];

                [v35 setSubtitle:v42];
                if ([*p_geoComposedRoute transportType] == 2) {
                  uint64_t v43 = 2;
                }
                else {
                  uint64_t v43 = 1;
                }
                v44 = [v32 geoStep];
                int v45 = [v44 hasOverrideTransportType];

                if (v45)
                {
                  v46 = [v32 geoStep];
                  if ([v46 overrideTransportType] == 2) {
                    uint64_t v43 = 2;
                  }
                  else {
                    uint64_t v43 = 1;
                  }
                }
                id v47 = [[MKRouteStep alloc] _initWithGEOComposedRouteStep:v32 instructions:v42 transportType:v43 polyline:v35];
                v7 = v58;
                if (!v47)
                {
                  v53 = v54;
                  v54[2](v54);

                  goto LABEL_36;
                }
                v48 = v47;
                [(NSArray *)v62 addObject:v47];

                ++v30;
                unint64_t v31 = v29;
              }
              while (v59 != v30);
              uint64_t v59 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
              uint64_t v60 = (v60 + v30);
              v24 = v54;
              if (v59) {
                continue;
              }
              break;
            }
          }

          steps = v7->_steps;
          v7->_steps = v62;
          v50 = v62;

          [(GEOComposedRoute *)v7->_geoComposedRoute clearPoints];
          v24[2](v24);

          id v5 = v55;
          goto LABEL_30;
        }
        free(v16);
      }
    }
    v51 = 0;
    goto LABEL_33;
  }
LABEL_30:
  v51 = v7;
LABEL_33:

  return v51;
}

void __37__MKRoute__initWithGEOComposedRoute___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  v2 = *(void **)(a1 + 40);

  free(v2);
}

- (MKDirectionsTransportType)transportType
{
  if ([(GEOComposedRoute *)self->_geoComposedRoute transportType] == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSString)name
{
  return (NSString *)[(GEOComposedRoute *)self->_geoComposedRoute name];
}

- (BOOL)hasTolls
{
  return [(GEOComposedRoute *)self->_geoComposedRoute avoidsTolls] ^ 1;
}

- (BOOL)hasHighways
{
  return [(GEOComposedRoute *)self->_geoComposedRoute avoidsHighways] ^ 1;
}

- (NSArray)advisoryNotices
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = [(GEOComposedRoute *)self->_geoComposedRoute advisories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v10 = [v9 advisoryItems];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          BOOL v12 = objc_msgSend(v9, "advisoryItems", 0);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) subtitleString];
                __26__MKRoute_advisoryNotices__block_invoke(v17, v3);
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }
        }
        else
        {
          BOOL v12 = [v9 titleString];
          __26__MKRoute_advisoryNotices__block_invoke(v12, v3);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

void __26__MKRoute_advisoryNotices__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1 stringWithDefaultOptions];
  if (v4)
  {
    [v3 addObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: evaluatedString != ((void *)0)", v5, 2u);
  }
}

- (CLLocationDistance)distance
{
  [(GEOComposedRoute *)self->_geoComposedRoute distance];
  return result;
}

- (NSTimeInterval)expectedTravelTime
{
  return (double)[(GEOComposedRoute *)self->_geoComposedRoute expectedTime];
}

- (MKPolyline)polyline
{
  return &self->_polyline->super;
}

- (NSArray)steps
{
  return self->_steps;
}

- (GEOComposedRoute)_geoComposedRoute
{
  return self->_geoComposedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_polyline, 0);

  objc_storeStrong((id *)&self->_geoComposedRoute, 0);
}

@end