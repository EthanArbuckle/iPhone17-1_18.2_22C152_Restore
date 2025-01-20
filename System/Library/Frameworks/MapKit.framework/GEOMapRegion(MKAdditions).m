@interface GEOMapRegion(MKAdditions)
+ (id)_mapkit_mapRegionEnclosingAnnotations:()MKAdditions;
+ (id)_mapkit_mapRegionForCoordinateRegion:()MKAdditions;
@end

@implementation GEOMapRegion(MKAdditions)

+ (id)_mapkit_mapRegionEnclosingAnnotations:()MKAdditions
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      v4 = [v3 objectAtIndexedSubscript:0];
      [v4 coordinate];
      double v6 = v5;
      double v8 = v7;

      id v9 = (id)[objc_alloc(MEMORY[0x1E4F64700]) initWithLatitude:v6 longitude:v8];
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v10 = v3;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
      double v12 = -180.0;
      if (v11)
      {
        uint64_t v13 = v11;
        uint64_t v14 = *(void *)v38;
        double v15 = 90.0;
        double v16 = -180.0;
        double v17 = 180.0;
        double v18 = -90.0;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v38 != v14) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * i) coordinate];
            if (v20 < v15) {
              double v15 = v20;
            }
            if (v20 > v18) {
              double v18 = v20;
            }
            if (v21 < v17) {
              double v17 = v21;
            }
            if (v21 > v16) {
              double v16 = v21;
            }
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v13);
      }
      else
      {
        double v15 = 90.0;
        double v18 = -90.0;
        double v17 = 180.0;
        double v16 = -180.0;
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v22 = v10;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
      double v24 = 180.0;
      if (v23)
      {
        uint64_t v25 = v23;
        uint64_t v26 = *(void *)v34;
        double v12 = -180.0;
        double v24 = 180.0;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v22);
            }
            objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "coordinate", (void)v33);
            if (v28 >= 0.0)
            {
              if (v28 < v24) {
                double v24 = v28;
              }
            }
            else if (v28 > v12)
            {
              double v12 = v28;
            }
          }
          uint64_t v25 = [v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v25);
      }

      double v29 = 180.0 - v24 + v12 + 180.0;
      id v9 = objc_alloc_init(MEMORY[0x1E4F64700]);
      [v9 setSouthLat:v15];
      [v9 setNorthLat:v18];
      if (v16 - v17 >= v29) {
        double v30 = v24;
      }
      else {
        double v30 = v17;
      }
      if (v16 - v17 >= v29) {
        double v31 = v12;
      }
      else {
        double v31 = v16;
      }
      objc_msgSend(v9, "setWestLng:", v30, (void)v33);
      [v9 setEastLng:v31];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)_mapkit_mapRegionForCoordinateRegion:()MKAdditions
{
  double v6 = 0;
  if (a3 >= -180.0 && a3 <= 180.0 && a2 >= -90.0 && a2 <= 90.0)
  {
    double v6 = 0;
    if (a4 >= 0.0 && a4 <= 180.0 && a5 >= 0.0 && a5 <= 360.0)
    {
      double v6 = objc_msgSend(a1, "_geo_mapRegionForGEOCoordinateRegion:");
    }
  }

  return v6;
}

@end