@interface MKGeoJSONDecoder
+ (id)_decodeGeometry:(id)a3 error:(id *)a4;
+ (id)_decodeGeometryCollection:(id)a3 error:(id *)a4;
- (MKGeoJSONDecoder)init;
- (NSArray)geoJSONObjectsWithData:(NSData *)data error:(NSError *)errorPtr;
- (id)_decodeFeatureCollection:(id)a3 error:(id *)a4;
@end

@implementation MKGeoJSONDecoder

- (MKGeoJSONDecoder)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKGeoJSONDecoder;
  v2 = [(MKGeoJSONDecoder *)&v5 init];
  if (v2)
  {
    v3 = +[MKUsageCounter sharedCounter];
    [v3 count:6];
  }
  return v2;
}

- (NSArray)geoJSONObjectsWithData:(NSData *)data error:(NSError *)errorPtr
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:data options:0 error:errorPtr];
  if (!v6) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (errorPtr)
    {
      v12 = @"Root object is not a dictionary";
LABEL_11:
      _errorWithReason(v12);
      v11 = 0;
      *errorPtr = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v7 = [v6 objectForKeyedSubscript:@"type"];

  if (!v7)
  {
    if (errorPtr)
    {
      v12 = @"Root object is missing 'type' key";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  v8 = [v6 objectForKeyedSubscript:@"type"];
  uint64_t v9 = _geoJSONObjectType((uint64_t)v8);

  switch(v9)
  {
    case 0:
      if (!errorPtr) {
        goto LABEL_14;
      }
      v12 = @"Root object has invalid value for 'type' key";
      goto LABEL_11;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      uint64_t v10 = +[MKGeoJSONDecoder _decodeGeometry:v6 error:errorPtr];
      goto LABEL_6;
    case 8:
      id v14 = [[MKGeoJSONFeature alloc] _initWithGeoJSONObject:v6 error:errorPtr];
      v15 = v14;
      if (v14)
      {
        v16[0] = v14;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      }
      else
      {
        v11 = 0;
      }

      break;
    case 9:
      uint64_t v10 = [(MKGeoJSONDecoder *)self _decodeFeatureCollection:v6 error:errorPtr];
LABEL_6:
      v11 = (void *)v10;
      break;
    default:
      goto LABEL_14;
  }
LABEL_15:

  return (NSArray *)v11;
}

+ (id)_decodeGeometry:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 objectForKeyedSubscript:@"type"];
    v7 = (void *)_geoJSONGeometryType((uint64_t)v6);

    switch((unint64_t)v7)
    {
      case 0uLL:
        if (!a4) {
          goto LABEL_8;
        }
        v8 = @"Invalid geometry type";
        goto LABEL_7;
      case 1uLL:
        id v9 = [[MKPointAnnotation alloc] _initWithGeoJSONObject:v5 error:a4];
        uint64_t v10 = v9;
        if (!v9) {
          goto LABEL_22;
        }
        v24[0] = v9;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = (id *)v24;
        goto LABEL_21;
      case 2uLL:
        id v13 = [[MKMultiPoint alloc] _initWithGeoJSONObject:v5 error:a4];
        uint64_t v10 = v13;
        if (!v13) {
          goto LABEL_22;
        }
        id v23 = v13;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v23;
        goto LABEL_21;
      case 3uLL:
        id v14 = [[MKPolyline alloc] _initWithGeoJSONObject:v5 error:a4];
        uint64_t v10 = v14;
        if (!v14) {
          goto LABEL_22;
        }
        id v22 = v14;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v22;
        goto LABEL_21;
      case 4uLL:
        id v15 = [[MKMultiPolyline alloc] _initWithGeoJSONObject:v5 error:a4];
        uint64_t v10 = v15;
        if (!v15) {
          goto LABEL_22;
        }
        id v21 = v15;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v21;
        goto LABEL_21;
      case 5uLL:
        id v16 = [[MKPolygon alloc] _initWithGeoJSONObject:v5 error:a4];
        uint64_t v10 = v16;
        if (!v16) {
          goto LABEL_22;
        }
        id v20 = v16;
        v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v20;
        goto LABEL_21;
      case 6uLL:
        id v17 = [[MKMultiPolygon alloc] _initWithGeoJSONObject:v5 error:a4];
        uint64_t v10 = v17;
        if (v17)
        {
          id v19 = v17;
          v11 = (void *)MEMORY[0x1E4F1C978];
          v12 = &v19;
LABEL_21:
          v7 = [v11 arrayWithObjects:v12 count:1];
        }
        else
        {
LABEL_22:
          v7 = 0;
        }

        break;
      case 7uLL:
        v7 = +[MKGeoJSONDecoder _decodeGeometryCollection:v5 error:a4];
        break;
      default:
        break;
    }
  }
  else if (a4)
  {
    v8 = @"geometry object must be a dictionary";
LABEL_7:
    _errorWithReason(v8);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v7 = 0;
  }

  return v7;
}

+ (id)_decodeGeometryCollection:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:@"geometries"];
  if (!v6)
  {
    if (a4)
    {
      id v17 = @"GeometryCollection object is missing 'geometries' value";
LABEL_20:
      _errorWithReason(v17);
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_21:
    id v16 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v17 = @"GeometryCollection's 'geometries' value must be an array";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [a1 _decodeGeometry:*(void *)(*((void *)&v20 + 1) + 8 * i) error:a4];
        if (!v13)
        {

          id v16 = 0;
          goto LABEL_23;
        }
        id v14 = v13;
        if ((unint64_t)[v13 count] >= 2)
        {
          id v15 = MKGetMKGeoJSONSerializationLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v19 = 0;
            _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_INFO, "To maximize interoperability, implementations should avoid nested geometry collections.", v19, 2u);
          }
        }
        [v7 addObjectsFromArray:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = v7;
LABEL_23:

LABEL_24:

  return v16;
}

- (id)_decodeFeatureCollection:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 objectForKeyedSubscript:@"features"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [MKGeoJSONFeature alloc];
          uint64_t v14 = -[MKGeoJSONFeature _initWithGeoJSONObject:error:](v13, "_initWithGeoJSONObject:error:", v12, a4, (void)v19);
          if (!v14)
          {

            id v16 = 0;
            goto LABEL_15;
          }
          id v15 = (void *)v14;
          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v16 = v6;
LABEL_15:
  }
  else if (a4)
  {
    if (v5) {
      id v17 = @"FeatureCollection object has invalid 'features' value";
    }
    else {
      id v17 = @"FeatureCollection object is missing 'features' value";
    }
    _errorWithReason(v17);
    id v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end