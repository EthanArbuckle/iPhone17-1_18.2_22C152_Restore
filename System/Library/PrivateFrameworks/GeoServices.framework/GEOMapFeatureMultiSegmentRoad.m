@interface GEOMapFeatureMultiSegmentRoad
- ($1AB5FA073B851C12C2339EC22442E995)coordinates3d;
- (GEOMapFeatureMultiSegmentRoad)initWithRoadSegments:(id)a3;
- (NSArray)roadSegments;
- (id)_junctionA;
- (id)_junctionB;
- (id)coordinatesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)endFeature;
- (id)feature;
- (id)startFeature;
- (uint64_t)tileKey;
- (unint64_t)roadID;
@end

@implementation GEOMapFeatureMultiSegmentRoad

- (GEOMapFeatureMultiSegmentRoad)initWithRoadSegments:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v53.receiver = self;
  v53.super_class = (Class)GEOMapFeatureMultiSegmentRoad;
  v40 = [(GEOMapFeatureLine *)&v53 init];
  if (v40)
  {
    v44 = [MEMORY[0x1E4F1CA80] set];
    v4 = [v41 firstObject];
    int v39 = [v4 isFlipped];

    if (v39)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v41, "count"));
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v6 = v41;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v50;
        unint64_t v9 = 0x1E4F28000uLL;
        v42 = v5;
        id v43 = v6;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v50 != v8) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            unint64_t v12 = [v11 roadID] & 0xFFFFFFFFFFFFFFFELL;
            v13 = [*(id *)(v9 + 3792) numberWithUnsignedLongLong:v12];
            int v14 = [v44 containsObject:v13];

            if (v14)
            {
              v15 = GEOGetGEOMapFeatureAccessLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                unint64_t v16 = v9;
                v17 = [v11 internalRoadName];
                uint64_t v18 = *(void *)[v11 coordinates3d];
                uint64_t v19 = *(void *)([v11 coordinates3d] + 8);
                uint64_t v20 = [v11 roadID];
                *(_DWORD *)buf = 138413058;
                v56 = v17;
                __int16 v57 = 2048;
                uint64_t v58 = v18;
                __int16 v59 = 2048;
                uint64_t v60 = v19;
                __int16 v61 = 2048;
                uint64_t v62 = v20;
                _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_FAULT, "Multi segment road has duplicate segments. This is likely a loop road and will cause path matching to fail. Road: %@ | %f, %f | %llu", buf, 0x2Au);

                v5 = v42;
                unint64_t v9 = v16;
                id v6 = v43;
              }
            }
            v21 = [*(id *)(v9 + 3792) numberWithUnsignedLongLong:v12];
            [v44 addObject:v21];

            [v11 flip];
            [(NSArray *)v5 insertObject:v11 atIndex:0];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v63 count:16];
        }
        while (v7);
      }

      roadSegments = v40->_roadSegments;
      v40->_roadSegments = v5;
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = v41;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v23);
            }
            v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            unint64_t v28 = [v27 roadID] & 0xFFFFFFFFFFFFFFFELL;
            v29 = [NSNumber numberWithUnsignedLongLong:v28];
            int v30 = [v44 containsObject:v29];

            if (v30)
            {
              v31 = GEOGetGEOMapFeatureAccessLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              {
                v32 = [v27 internalRoadName];
                uint64_t v33 = *(void *)[v27 coordinates3d];
                uint64_t v34 = *(void *)([v27 coordinates3d] + 8);
                uint64_t v35 = [v27 roadID];
                *(_DWORD *)buf = 138413058;
                v56 = v32;
                __int16 v57 = 2048;
                uint64_t v58 = v33;
                __int16 v59 = 2048;
                uint64_t v60 = v34;
                __int16 v61 = 2048;
                uint64_t v62 = v35;
                _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_FAULT, "Multi segment road has duplicate segments. This is likely a loop road and will cause path matching to fail. Road: %@ | %f, %f | %llu", buf, 0x2Au);
              }
            }
            v36 = [NSNumber numberWithUnsignedLongLong:v28];
            [v44 addObject:v36];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v54 count:16];
        }
        while (v24);
      }

      v37 = (NSArray *)v23;
      roadSegments = v40->_roadSegments;
      v40->_roadSegments = v37;
    }

    v40->super.super._isFlipped = v39;
  }

  return v40;
}

- (unint64_t)roadID
{
  BOOL isFlipped = self->super.super._isFlipped;
  roadSegments = self->_roadSegments;
  if (isFlipped) {
    [(NSArray *)roadSegments lastObject];
  }
  else {
  v4 = [(NSArray *)roadSegments firstObject];
  }
  unint64_t v5 = [v4 roadID];

  return v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinates3d
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  coordinates3d = self->super.super._coordinates3d;
  if (!coordinates3d)
  {
    __p = 0;
    v54 = 0;
    v55 = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = self->_roadSegments;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v4)
    {
      uint64_t v45 = *(void *)v50;
      do
      {
        uint64_t v5 = 0;
        uint64_t v46 = v4;
        do
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v49 + 1) + 8 * v5);
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          uint64_t v56 = [v6 tileKey];
          uint64_t v57 = v7;
          double v8 = GEOMapRectForGEOTileKey((uint64_t)&v56);
          double v10 = v9;
          double v12 = v11;
          double v14 = v13;
          uint64_t v47 = 0;
          unint64_t v48 = 0;
          v15 = [v6 feature];
          unint64_t v16 = GEOMultiSectionFeaturePointsWithElevation(v15, 0, &v47, &v48);

          unint64_t v17 = v48;
          if (v48)
          {
            unint64_t v18 = 0;
            do
            {
              double v20 = GEOCoordinate2DForMapPoint(v8 + *(float *)&v16[v18] * v12, v10 + (float)(1.0 - *((float *)&v16[v18] + 1)) * v14);
              double v21 = v19;
              if (v47) {
                float v22 = *(float *)(v47 + 4 * v18);
              }
              else {
                float v22 = 0.0;
              }
              double v23 = v22;
              uint64_t v24 = (double *)__p;
              uint64_t v25 = (double *)v54;
              if (v18
                || __p == v54
                || vabdd_f64(*((double *)v54 - 3), v20) >= 0.00000000999999994
                || vabdd_f64(*((double *)v54 - 2), v19) >= 0.00000000999999994
                || vabdd_f64(*((double *)v54 - 1), v23) >= 0.00000000999999994)
              {
                if (v54 >= v55)
                {
                  unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v54 - (unsigned char *)__p) >> 3);
                  unint64_t v28 = v27 + 1;
                  if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x5555555555555556 * ((v55 - (unsigned char *)__p) >> 3) > v28) {
                    unint64_t v28 = 0x5555555555555556 * ((v55 - (unsigned char *)__p) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((v55 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                    unint64_t v29 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v29 = v28;
                  }
                  if (v29)
                  {
                    int v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v55, v29);
                    uint64_t v24 = (double *)__p;
                    uint64_t v25 = (double *)v54;
                  }
                  else
                  {
                    int v30 = 0;
                  }
                  v31 = &v30[24 * v27];
                  *(double *)v31 = v20;
                  *((double *)v31 + 1) = v21;
                  *((double *)v31 + 2) = v23;
                  v32 = (double *)v31;
                  if (v25 != v24)
                  {
                    do
                    {
                      long long v33 = *(_OWORD *)(v25 - 3);
                      *(v32 - 1) = *(v25 - 1);
                      *(_OWORD *)(v32 - 3) = v33;
                      v32 -= 3;
                      v25 -= 3;
                    }
                    while (v25 != v24);
                    uint64_t v24 = (double *)__p;
                  }
                  v26 = v31 + 24;
                  __p = v32;
                  v54 = v31 + 24;
                  v55 = &v30[24 * v29];
                  if (v24) {
                    operator delete(v24);
                  }
                }
                else
                {
                  *(double *)v54 = v20;
                  v25[1] = v19;
                  v26 = (char *)(v25 + 3);
                  v25[2] = v23;
                }
                v54 = v26;
                unint64_t v17 = v48;
              }
              ++v18;
            }
            while (v18 < v17);
          }
          ++v5;
        }
        while (v5 != v46);
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v4);
    }

    uint64_t v34 = __p;
    if (self->super.super._isFlipped && __p != v54)
    {
      uint64_t v35 = v54 - 24;
      if (v54 - 24 > __p)
      {
        v36 = (char *)__p + 24;
        do
        {
          uint64_t v37 = *((void *)v36 - 1);
          long long v38 = *(_OWORD *)(v36 - 24);
          uint64_t v39 = *((void *)v35 + 2);
          *(_OWORD *)(v36 - 24) = *(_OWORD *)v35;
          *((void *)v36 - 1) = v39;
          *(_OWORD *)uint64_t v35 = v38;
          *((void *)v35 + 2) = v37;
          v35 -= 24;
          BOOL v40 = v36 >= v35;
          v36 += 24;
        }
        while (!v40);
        uint64_t v34 = __p;
      }
    }
    size_t v41 = v54 - v34;
    self->super.super._coordinateCount = 0xAAAAAAAAAAAAAAABLL * ((v54 - v34) >> 3);
    v42 = ($1AB5FA073B851C12C2339EC22442E995 *)malloc_type_malloc(v41, 0xFD87710uLL);
    self->super.super._coordinates3d = v42;
    memcpy(v42, __p, v41);
    coordinates3d = self->super.super._coordinates3d;
    if (__p)
    {
      v54 = (char *)__p;
      operator delete(__p);
    }
  }
  return coordinates3d;
}

- (uint64_t)tileKey
{
  v1 = [*(id *)(a1 + 104) firstObject];
  uint64_t v2 = [v1 tileKey];

  return v2;
}

- (id)feature
{
  uint64_t v2 = [(NSArray *)self->_roadSegments firstObject];
  v3 = [v2 feature];

  return v3;
}

- (id)startFeature
{
  BOOL isFlipped = self->super.super._isFlipped;
  roadSegments = self->_roadSegments;
  if (isFlipped) {
    [(NSArray *)roadSegments lastObject];
  }
  else {
  uint64_t v4 = [(NSArray *)roadSegments firstObject];
  }
  uint64_t v5 = [v4 feature];

  return v5;
}

- (id)endFeature
{
  BOOL isFlipped = self->super.super._isFlipped;
  roadSegments = self->_roadSegments;
  if (isFlipped) {
    [(NSArray *)roadSegments firstObject];
  }
  else {
  uint64_t v4 = [(NSArray *)roadSegments lastObject];
  }
  uint64_t v5 = [v4 feature];

  return v5;
}

- (id)_junctionA
{
  if (!self->super._checkedJunctionA)
  {
    v3 = [(NSArray *)self->_roadSegments firstObject];
    uint64_t v4 = [v3 feature];
    uint64_t v5 = +[GEOMapFeatureJunction junctionForRoadFeature:v4 startJunction:1];
    junctionA = self->super._junctionA;
    self->super._junctionA = v5;

    self->super._checkedJunctionA = 1;
  }
  uint64_t v7 = self->super._junctionA;

  return v7;
}

- (id)_junctionB
{
  if (!self->super._checkedJunctionB)
  {
    v3 = [(NSArray *)self->_roadSegments lastObject];
    uint64_t v4 = [v3 feature];
    uint64_t v5 = +[GEOMapFeatureJunction junctionForRoadFeature:v4 startJunction:0];
    junctionB = self->super._junctionB;
    self->super._junctionB = v5;

    self->super._checkedJunctionB = 1;
  }
  uint64_t v7 = self->super._junctionB;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMapFeatureMultiSegmentRoad;
  uint64_t v4 = [(GEOMapFeatureRoad *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 13, self->_roadSegments);
  return v4;
}

- (id)debugDescription
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(GEOMapFeatureRoad *)self description];
  [v29 addObject:v3];

  uint64_t v4 = [(GEOMapFeatureRoad *)self formOfWay];
  if v4 < 0x17 && ((0x7EDDDFu >> v4))
  {
    uint64_t v5 = off_1E53EBBA8[(int)v4];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_super v6 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v5];
  [v29 addObject:v6];

  uint64_t v7 = [(GEOMapFeatureRoad *)self walkableSide];
  if (v7 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v8 = off_1E53EBC60[(int)v7];
  }
  double v9 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v8];
  [v29 addObject:v9];

  uint64_t v10 = [(GEOMapFeatureRoad *)self bikeableSide];
  if (v10 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v11 = off_1E53EBC80[(int)v10];
  }
  double v12 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v11];
  [v29 addObject:v12];

  uint64_t v13 = [(GEOMapFeatureRoad *)self bikeLaneSide];
  if (v13 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
    double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v14 = off_1E53EBCA0[(int)v13];
  }
  v15 = [(GEOMapFeatureLine *)self _formattedProtobufEnum:v14];
  [v29 addObject:v15];

  unint64_t v16 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v17 = [v29 componentsJoinedByString:@" | "];
  unint64_t v18 = [v16 stringWithString:v17];

  [v18 appendString:@"\n\tAll tiles:"];
  roadSegments = self->_roadSegments;
  if (self->super.super._isFlipped) {
    [(NSArray *)roadSegments reverseObjectEnumerator];
  }
  else {
    [(NSArray *)roadSegments objectEnumerator];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v20);
        }
        *(void *)&long long v34 = [*(id *)(*((void *)&v30 + 1) + 8 * i) tileKey];
        *((void *)&v34 + 1) = v24;
        uint64_t v25 = v34 & 0x7F;
        if (v25 == 12)
        {
          *((void *)&v26 + 1) = *(unsigned __int16 *)((char *)&v34 + 9) | ((unint64_t)BYTE11(v34) << 16);
          *(void *)&long long v26 = *(void *)((char *)&v34 + 1);
          objc_msgSend(NSString, "stringWithFormat:", @"%llu_%d_type_%d", (unint64_t)(v26 >> 6), BYTE1(v34) & 0x3F, ((*(unsigned __int16 *)((char *)&v34 + 9) | (BYTE11(v34) << 16)) >> 6) & 0x3FFF);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d_provider_%d_type_%d", ((*(void *)((char *)&v34 + 1) >> 46) | (*(_DWORD *)((char *)&v34 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)((char *)&v34 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v34 + 13) | (HIBYTE(v34) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)((char *)&v34 + 1) >> 40) & 0x3FLL, v25, *(unsigned __int16 *)((char *)&v34 + 13) >> 2);
        unint64_t v27 = };
        [v18 appendFormat:@"\n\t\t%@", v27];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v21);
  }

  return v18;
}

- (id)coordinatesDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  roadSegments = self->_roadSegments;
  if (self->super.super._isFlipped) {
    [(NSArray *)roadSegments reverseObjectEnumerator];
  }
  else {
    [(NSArray *)roadSegments objectEnumerator];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v19 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v8 = objc_msgSend(NSString, "stringWithFormat:", @"Coordinates: %d", objc_msgSend(v7, "coordinateCount"));
        [v3 addObject:v8];

        for (unint64_t j = 0; j < [v7 coordinateCount]; ++j)
        {
          uint64_t v10 = j;
          if (self->super.super._isFlipped) {
            uint64_t v10 = [v7 coordinateCount] + ~j;
          }
          uint64_t v11 = [v7 coordinates3d];
          double v12 = [NSString stringWithFormat:@"[%2d] %0.6f, %0.6f | %0.2fm", j, *(void *)(v11 + 24 * v10), *(void *)(v11 + 24 * v10 + 8), *(void *)(v11 + 24 * v10 + 16)];
          [v3 addObject:v12];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  uint64_t v13 = NSString;
  unint64_t v14 = [(GEOMapFeatureLine *)self coordinateCount];
  v15 = [v3 componentsJoinedByString:@"\n"];
  unint64_t v16 = [v13 stringWithFormat:@"Total coordinates: %d\n%@", v14, v15];

  return v16;
}

- (NSArray)roadSegments
{
  return self->_roadSegments;
}

- (void).cxx_destruct
{
}

@end