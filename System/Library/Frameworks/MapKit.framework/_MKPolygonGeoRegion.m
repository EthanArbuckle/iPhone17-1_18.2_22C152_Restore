@interface _MKPolygonGeoRegion
- (BOOL)_loadWithJSONObject:(id)a3 error:(id *)a4;
- (BOOL)coordinateLiesInRegion:(CLLocationCoordinate2D)a3;
- (_MKPolygonGeoRegion)initWithJSONObject:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation _MKPolygonGeoRegion

- (_MKPolygonGeoRegion)initWithJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MKPolygonGeoRegion;
  v7 = [(_MKPolygonGeoRegion *)&v11 init];
  v8 = v7;
  if (v7 && ![(_MKPolygonGeoRegion *)v7 _loadWithJSONObject:v6 error:a4]) {
    v9 = 0;
  }
  else {
    v9 = v8;
  }

  return v9;
}

- (BOOL)coordinateLiesInRegion:(CLLocationCoordinate2D)a3
{
  return _MKPointInPolygon((uint64_t)self->_polygon, self->_vertexCount, a3.latitude, a3.longitude);
}

- (void)dealloc
{
  free(self->_polygon);
  v3.receiver = self;
  v3.super_class = (Class)_MKPolygonGeoRegion;
  [(_MKPolygonGeoRegion *)&v3 dealloc];
}

- (BOOL)_loadWithJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 objectAtIndex:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [v6 objectAtIndex:0];
      unint64_t v10 = [v9 count];
      if (v10 < 4 || self->_vertexCount >= 0x15)
      {
        if (!a4)
        {
LABEL_24:
          BOOL v24 = 0;
LABEL_25:

          goto LABEL_26;
        }
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid number of coordinates for Polygon LinearRing: %lu. Expected between %lu and %lu.", v10, 4, 20);
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v14 forKey:@"ParseError"];
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v15];
      }
      else
      {
        unint64_t v11 = v10 - 1;
        self->_vertexCount = v11;
        self->_polygon = (CLLocationCoordinate2D *)malloc_type_calloc(v11, 0x10uLL, 0x1000040451B5BE8uLL);
        if (!self->_vertexCount)
        {
          BOOL v24 = 1;
          goto LABEL_25;
        }
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        v36 = v9;
        while (1)
        {
          v14 = [v9 objectAtIndex:v13];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          id v15 = v14;
          if ([v15 count] != 2)
          {
            if (a4)
            {
              v31 = [NSString stringWithFormat:@"A coordinate array didn't contain exactly 2 elements."];
              v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v31 forKey:@"ParseError"];
              *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v32];
            }
            v14 = v15;
            goto LABEL_22;
          }
          v16 = [v15 objectAtIndex:1];
          v17 = [v15 objectAtIndex:0];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (a4)
            {
              v28 = NSString;
              v29 = @"A coordinate didn't contain exactly 2 points.";
              goto LABEL_37;
            }
LABEL_38:

            v14 = v15;
            v9 = v36;
            goto LABEL_22;
          }
          [v16 doubleValue];
          CLLocationDegrees v19 = v18;
          [v17 doubleValue];
          CLLocationCoordinate2D v37 = CLLocationCoordinate2DMake(v19, v20);
          CLLocationDegrees latitude = v37.latitude;
          CLLocationDegrees longitude = v37.longitude;
          if (!CLLocationCoordinate2DIsValid(v37))
          {
            if (a4)
            {
              v28 = NSString;
              id v35 = v15;
              v29 = @"Invalid coordinate parsed: %@.";
LABEL_37:
              v33 = objc_msgSend(v28, "stringWithFormat:", v29, v35);
              v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v33 forKey:@"ParseError"];
              *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v34];
            }
            goto LABEL_38;
          }
          v23 = &self->_polygon[v12];
          v23->CLLocationDegrees latitude = latitude;
          v23->CLLocationDegrees longitude = longitude;

          ++v13;
          ++v12;
          BOOL v24 = 1;
          v9 = v36;
          if (v13 >= self->_vertexCount) {
            goto LABEL_25;
          }
        }
        if (!a4) {
          goto LABEL_23;
        }
        id v15 = [NSString stringWithFormat:@"Expected coordinates to element to be an array."];
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:@"ParseError"];
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v30];
      }
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    if (a4)
    {
      v25 = NSString;
      v26 = @"Expected LinearRing to contain an array of coordinates.";
      goto LABEL_18;
    }
  }
  else if (a4)
  {
    v25 = NSString;
    v26 = @"Expected polygon to contain a LinearRing array, with the first element representing the exterior ring and the other elements ignored.";
LABEL_18:
    v9 = [v25 stringWithFormat:v26];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:@"ParseError"];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"Maps" code:0 userInfo:v14];
    goto LABEL_23;
  }
  BOOL v24 = 0;
LABEL_26:

  return v24;
}

@end