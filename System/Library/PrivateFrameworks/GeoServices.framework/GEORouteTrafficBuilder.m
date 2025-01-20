@interface GEORouteTrafficBuilder
- (GEORouteTrafficBuilder)init;
- (id)trafficColors;
- (id)trafficOffsets;
- (void)_buildTrafficForRoute:(id)a3 etaRoute:(id)a4;
- (void)_buildTrafficForRoute:(id)a3 toDistance:(double)a4;
- (void)_removeDuplicateTraffic;
- (void)addTrafficFromETARoute:(id)a3;
- (void)addTrafficFromRoute:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5;
- (void)addTrafficFromRoute:(id)a3 withStepRange:(_NSRange)a4;
- (void)buildTrafficForRoute:(id)a3;
- (void)buildTrafficForRoute:(id)a3 etaRoute:(id)a4;
- (void)copyTrafficToRoute:(id)a3;
@end

@implementation GEORouteTrafficBuilder

- (GEORouteTrafficBuilder)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEORouteTrafficBuilder;
  v2 = [(GEORouteTrafficBuilder *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_trafficDistance = 0.0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    trafficColors = v3->_trafficColors;
    v3->_trafficColors = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    trafficOffsets = v3->_trafficOffsets;
    v3->_trafficOffsets = (NSMutableArray *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)buildTrafficForRoute:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 geoWaypointRoute];

  if (v4) {
    [(GEORouteTrafficBuilder *)self _buildTrafficForRoute:v5 toDistance:4294967300.0];
  }
}

- (void)buildTrafficForRoute:(id)a3 etaRoute:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [v8 geoWaypointRoute];

  if (v7) {
    [(GEORouteTrafficBuilder *)self _buildTrafficForRoute:v8 etaRoute:v6];
  }
}

- (void)_buildTrafficForRoute:(id)a3 etaRoute:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 geoETAWaypointRoute];
  [v6 distance];
  double v10 = v9;
  [v7 length];
  v74 = v7;
  if (v10 <= floor(v11))
  {
    [v6 distance];
    double v13 = v12;
    [v7 length];
    if (vabdd_f64(v13, floor(v14)) >= 2.22044605e-16)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        [v6 distance];
        uint64_t v72 = v71;
        [v7 length];
        *(_DWORD *)buf = 136315906;
        v84 = "route.distance";
        __int16 v85 = 2048;
        uint64_t v86 = v72;
        __int16 v87 = 2080;
        v88 = "floor(etaRoute.length)";
        __int16 v89 = 2048;
        double v90 = floor(v73);
        _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s = %lf, %s = %lf", buf, 0x2Au);
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      v69 = MEMORY[0x1E4F14500];
      v70 = "Assertion failed: route.distance > floor(etaRoute.length) || fabs(route.distance - floor(etaRoute.length)) <"
            " 2.2204460492503131e-16";
LABEL_37:
      _os_log_fault_impl(&dword_188D96000, v69, OS_LOG_TYPE_FAULT, v70, buf, 2u);
      goto LABEL_27;
    }
  }
  v15 = objc_msgSend(v6, "legs", v7);
  unint64_t v16 = [v15 count];
  v17 = [v8 routeLegs];
  unint64_t v18 = [v17 count];

  if (v16 < v18)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v69 = MEMORY[0x1E4F14500];
    v70 = "Assertion failed: route.legs.count >= geoETAWaypointRoute.routeLegs.count";
    goto LABEL_37;
  }
  [v6 distance];
  double v20 = v19;
  [v7 length];
  double v22 = v20 - v21;
  [(GEORouteTrafficBuilder *)self _buildTrafficForRoute:v6 toDistance:v22];
  v23 = [v6 legs];
  uint64_t v24 = [v23 count];
  v25 = [v8 routeLegs];
  uint64_t v26 = [v25 count];

  double v27 = 0.0;
  uint64_t v28 = v24 - v26;
  if (v24 != v26)
  {
    uint64_t v29 = 0;
    do
    {
      v30 = [v6 legs];
      v31 = [v30 objectAtIndexedSubscript:v29];
      [v31 distance];
      double v27 = v27 + v32;

      ++v29;
    }
    while (v28 != v29);
  }
  v33 = [v8 routeLegs];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    unint64_t v35 = 0;
    v76 = v8;
    id v77 = v6;
    uint64_t v75 = v28;
    while (1)
    {
      v36 = [v8 routeLegs];
      v37 = [v36 objectAtIndexedSubscript:v35];

      uint64_t v38 = [v37 trafficColorsCount];
      if (v38 != [v37 trafficColorOffsetsCount]) {
        break;
      }
      if ([v37 trafficColorsCount])
      {
        unint64_t v39 = 0;
        if (v35) {
          double v40 = v27;
        }
        else {
          double v40 = v22;
        }
        do
        {
          uint64_t v41 = *(unsigned int *)([v37 trafficColors] + 4 * v39);
          LODWORD(v42) = *(_DWORD *)([v37 trafficColorOffsets] + 4 * v39);
          double v43 = v40 + (double)v42;
          trafficColors = self->_trafficColors;
          v45 = [NSNumber numberWithUnsignedInt:v41];
          [(NSMutableArray *)trafficColors addObject:v45];

          trafficOffsets = self->_trafficOffsets;
          v47 = [NSNumber numberWithDouble:v43];
          [(NSMutableArray *)trafficOffsets addObject:v47];

          ++v39;
        }
        while (v39 < [v37 trafficColorsCount]);
      }
      if (![v37 trafficColorsCount])
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v48 = [v37 trafficColorInfos];
        v49 = [v48 firstObject];
        v50 = [v49 trafficColorAndOffsets];

        uint64_t v51 = [v50 countByEnumeratingWithState:&v78 objects:v82 count:16];
        if (v51)
        {
          uint64_t v52 = v51;
          uint64_t v53 = *(void *)v79;
          if (v35) {
            double v54 = v27;
          }
          else {
            double v54 = v22;
          }
          do
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v79 != v53) {
                objc_enumerationMutation(v50);
              }
              v56 = *(void **)(*((void *)&v78 + 1) + 8 * i);
              uint64_t v57 = [v56 color];
              double v58 = v54 + (double)[v56 offset];
              v59 = self->_trafficColors;
              v60 = [NSNumber numberWithUnsignedInt:v57];
              [(NSMutableArray *)v59 addObject:v60];

              v61 = self->_trafficOffsets;
              v62 = [NSNumber numberWithDouble:v58];
              [(NSMutableArray *)v61 addObject:v62];
            }
            uint64_t v52 = [v50 countByEnumeratingWithState:&v78 objects:v82 count:16];
          }
          while (v52);
        }

        id v8 = v76;
        id v6 = v77;
        uint64_t v28 = v75;
      }
      v63 = [v6 legs];
      v64 = [v63 objectAtIndexedSubscript:v35 + v28];

      [v64 distance];
      double v66 = v65;

      double v27 = v27 + v66;
      ++v35;
      v67 = [v8 routeLegs];
      unint64_t v68 = [v67 count];

      if (v35 >= v68) {
        goto LABEL_27;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoETARouteLeg.trafficColorsCount == geoETARouteLeg.trafficColorOffsetsCount", buf, 2u);
    }
  }
LABEL_27:
}

- (void)_buildTrafficForRoute:(id)a3 toDistance:(double)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 geoWaypointRoute];
  [v6 distance];
  BOOL v9 = v8 < a4;
  double v10 = a4;
  if (v9) {
    objc_msgSend(v6, "distance", a4);
  }
  self->_trafficDistance = v10;
  [(NSMutableArray *)self->_trafficColors removeAllObjects];
  [(NSMutableArray *)self->_trafficOffsets removeAllObjects];
  double v11 = [v6 legs];
  uint64_t v12 = [v11 count];
  double v13 = [v7 routeLegs];
  uint64_t v14 = [v13 count];

  if (v12 == v14)
  {
    v15 = [v6 legs];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = 0;
      double v18 = 0.0;
      while (1)
      {
        double v19 = [v7 routeLegs];
        double v20 = [v19 objectAtIndexedSubscript:v17];

        uint64_t v21 = [v20 trafficColorsCount];
        if (v21 != [v20 trafficColorOffsetsCount])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoRouteLeg.trafficColorsCount == geoRouteLeg.trafficColorOffsetsCount", buf, 2u);
          }
          v49 = GEOGetGEORouteTrafficBuilderLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            int v50 = [v20 trafficColorsCount];
            int v51 = [v20 trafficColorOffsetsCount];
            *(_DWORD *)buf = 67109376;
            int v60 = v50;
            __int16 v61 = 1024;
            int v62 = v51;
            _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_ERROR, "GEORoute trafficColorsCount (%d) not equal to trafficColorOffsetsCount (%d). This is a server error.", buf, 0xEu);
          }

          self->_trafficDistance = (double)[v7 distanceMeters];
          goto LABEL_25;
        }
        if ([v20 trafficColorsCount]) {
          break;
        }
LABEL_12:
        if (![v20 trafficColorsCount])
        {
          uint64_t v52 = v7;
          id v53 = v6;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          unint64_t v35 = [v20 trafficColorInfos];
          v36 = [v35 firstObject];
          v37 = [v36 trafficColorAndOffsets];

          uint64_t v38 = [v37 countByEnumeratingWithState:&v54 objects:v58 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v55 != v40) {
                  objc_enumerationMutation(v37);
                }
                unint64_t v42 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                uint64_t v43 = [v42 color];
                double v44 = (double)[v42 offset];
                if (v44 >= a4)
                {

                  id v7 = v52;
                  id v6 = v53;
                  goto LABEL_25;
                }
                trafficColors = self->_trafficColors;
                v46 = [NSNumber numberWithUnsignedInt:v43];
                [(NSMutableArray *)trafficColors addObject:v46];

                trafficOffsets = self->_trafficOffsets;
                v48 = [NSNumber numberWithDouble:v44];
                [(NSMutableArray *)trafficOffsets addObject:v48];
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v58 count:16];
              if (v39) {
                continue;
              }
              break;
            }
          }

          id v7 = v52;
          id v6 = v53;
        }
        v30 = [v6 legs];
        v31 = [v30 objectAtIndexedSubscript:v17];

        [v31 distance];
        double v18 = v18 + v32;

        ++v17;
        v33 = [v6 legs];
        unint64_t v34 = [v33 count];

        if (v17 >= v34) {
          goto LABEL_26;
        }
      }
      uint64_t v22 = 0;
      while (1)
      {
        uint64_t v23 = *(unsigned int *)([v20 trafficColors] + 4 * v22);
        LODWORD(v24) = *(_DWORD *)([v20 trafficColorOffsets] + 4 * v22);
        double v25 = v18 + (double)v24;
        if (v25 >= a4) {
          break;
        }
        uint64_t v26 = self->_trafficColors;
        double v27 = [NSNumber numberWithUnsignedInt:v23];
        [(NSMutableArray *)v26 addObject:v27];

        uint64_t v28 = self->_trafficOffsets;
        uint64_t v29 = [NSNumber numberWithDouble:v25];
        [(NSMutableArray *)v28 addObject:v29];

        if (++v22 >= (unint64_t)[v20 trafficColorsCount]) {
          goto LABEL_12;
        }
      }
LABEL_25:
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: route.legs.count == geoWaypointRoute.routeLegs.count", buf, 2u);
    }
    self->_trafficDistance = (double)[v7 distanceMeters];
  }
LABEL_26:
}

- (void)addTrafficFromRoute:(id)a3 withStepRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  if ([v11 routeType]) {
    double v7 = self->_trafficDistance + 0.0;
  }
  else {
    double v7 = 0.0;
  }
  [v11 distanceFromStepIndex:0 toStepIndex:location];
  double v9 = v7 + v8;
  [v11 distanceFromStepIndex:0 toStepIndex:location + length];
  [(GEORouteTrafficBuilder *)self addTrafficFromRoute:v11 from:v9 to:(v7 + v10)];
}

- (void)addTrafficFromRoute:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5
{
  id v29 = a3;
  uint64_t v8 = [v29 trafficColorOffsets];
  unint64_t v9 = [v29 trafficColorOffsetsCount];
  uint64_t v10 = [v29 trafficColors];
  unint64_t v11 = [v29 trafficColorsCount];
  unint64_t v12 = 0;
  if (v9 >= v11) {
    unint64_t v13 = v11;
  }
  else {
    unint64_t v13 = v9;
  }
  if (v13)
  {
    while (*(_DWORD *)(v8 + 4 * v12) < a4)
    {
      if (v13 == ++v12)
      {
        unint64_t v12 = v13;
        goto LABEL_15;
      }
    }
  }
  if (v12 < v13)
  {
    unint64_t v14 = v12;
    while (*(_DWORD *)(v8 + 4 * v14) < a5)
    {
      if (v13 == ++v14) {
        goto LABEL_14;
      }
    }
    unint64_t v13 = v14;
    if (!v12) {
      goto LABEL_18;
    }
LABEL_15:
    if (v12 - 1 < v11)
    {
      trafficColors = self->_trafficColors;
      uint64_t v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v10 + 4 * (v12 - 1))];
      [(NSMutableArray *)trafficColors addObject:v16];

      trafficOffsets = self->_trafficOffsets;
      double v18 = [NSNumber numberWithDouble:self->_trafficDistance];
      [(NSMutableArray *)trafficOffsets addObject:v18];
    }
    goto LABEL_18;
  }
  unint64_t v13 = v12;
LABEL_14:
  if (v12) {
    goto LABEL_15;
  }
LABEL_18:
  unint64_t v19 = v13 - v12;
  if (v13 > v12)
  {
    double v20 = (unsigned int *)(v10 + 4 * v12);
    uint64_t v21 = (unsigned int *)(v8 + 4 * v12);
    do
    {
      unsigned int v22 = *v21++;
      double v23 = self->_trafficDistance + (double)v22 - (double)a4;
      unint64_t v24 = self->_trafficColors;
      unsigned int v25 = *v20++;
      uint64_t v26 = [NSNumber numberWithUnsignedInt:v25];
      [(NSMutableArray *)v24 addObject:v26];

      double v27 = self->_trafficOffsets;
      uint64_t v28 = [NSNumber numberWithDouble:v23];
      [(NSMutableArray *)v27 addObject:v28];

      --v19;
    }
    while (v19);
  }
  self->_trafficDistance = self->_trafficDistance + (double)(a5 - a4);
}

- (void)addTrafficFromETARoute:(id)a3
{
  id v16 = a3;
  uint64_t v4 = (unsigned int *)[v16 trafficColorOffsets];
  id v5 = (unsigned int *)[v16 trafficColors];
  unint64_t v6 = [v16 trafficColorOffsetsCount];
  unint64_t v7 = [v16 trafficColorsCount];
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  for (; v8; --v8)
  {
    unsigned int v9 = *v4++;
    double v10 = self->_trafficDistance + (double)v9;
    trafficColors = self->_trafficColors;
    unsigned int v12 = *v5++;
    unint64_t v13 = [NSNumber numberWithUnsignedInt:v12];
    [(NSMutableArray *)trafficColors addObject:v13];

    trafficOffsets = self->_trafficOffsets;
    v15 = [NSNumber numberWithDouble:v10];
    [(NSMutableArray *)trafficOffsets addObject:v15];
  }
}

- (void)_removeDuplicateTraffic
{
  unint64_t v3 = [(NSMutableArray *)self->_trafficOffsets count];
  if (v3 >= 2)
  {
    unint64_t v4 = v3;
    id v12 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v5 = 0;
    for (uint64_t i = 1; i != v4; ++i)
    {
      unint64_t v7 = [(NSMutableArray *)self->_trafficColors objectAtIndexedSubscript:i];
      int v8 = [v7 unsignedIntegerValue];

      unsigned int v9 = [(NSMutableArray *)self->_trafficColors objectAtIndexedSubscript:v5];
      int v10 = [v9 unsignedIntegerValue];

      uint64_t v11 = i;
      if (v8 == v10)
      {
        [v12 addIndex:i];
        uint64_t v11 = v5;
      }
      uint64_t v5 = v11;
    }
    [(NSMutableArray *)self->_trafficColors removeObjectsAtIndexes:v12];
    [(NSMutableArray *)self->_trafficOffsets removeObjectsAtIndexes:v12];
  }
}

- (void)copyTrafficToRoute:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_trafficOffsets count])
  {
    [(GEORouteTrafficBuilder *)self _removeDuplicateTraffic];
    [v4 clearTrafficColors];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = self->_trafficColors;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addTrafficColor:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v9++), "unsignedIntegerValue"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    [v4 clearTrafficColorOffsets];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v10 = self->_trafficOffsets;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v4, "addTrafficColorOffset:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "unsignedIntegerValue", (void)v15));
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    [v4 clearTrafficColorOffsets];
    [v4 clearTrafficColors];
  }
}

- (id)trafficColors
{
  [(GEORouteTrafficBuilder *)self _removeDuplicateTraffic];
  unint64_t v3 = (void *)[(NSMutableArray *)self->_trafficColors copy];

  return v3;
}

- (id)trafficOffsets
{
  [(GEORouteTrafficBuilder *)self _removeDuplicateTraffic];
  unint64_t v3 = (void *)[(NSMutableArray *)self->_trafficOffsets copy];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficOffsets, 0);

  objc_storeStrong((id *)&self->_trafficColors, 0);
}

@end