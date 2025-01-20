@interface GEOLocationShiftFunctionResponse
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)originalCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)shiftedCoordinateForCoordinate:(id)a3 accuracy:(double *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidForCoordinate:(id)a3;
- (GEOLocationShiftFunctionResponse)initWithCoder:(id)a3;
- (GEOLocationShiftFunctionResponse)initWithPolyLocationShiftResponse:(id)a3 originalCoordinate:(id)a4 version:(unsigned int)a5;
- (double)radius;
- (id)contractFunctionTo:(id)a3 withRadius:(double)a4;
- (id)toServerResponse;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOLocationShiftFunctionResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOLocationShiftFunctionResponse)initWithPolyLocationShiftResponse:(id)a3 originalCoordinate:(id)a4 version:(unsigned int)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOLocationShiftFunctionResponse;
  v10 = [(GEOLocationShiftFunctionResponse *)&v24 init];
  if (v10)
  {
    if ([v9 hasCenter])
    {
      v11 = [v9 center];
      [v11 lat];
      uint64_t v13 = v12;
      v14 = [v9 center];
      [v14 lng];
      *((void *)v10 + 1) = v13;
      *((void *)v10 + 2) = v15;
    }
    else
    {
      *((double *)v10 + 1) = var0;
      *((double *)v10 + 2) = var1;
    }
    [v9 radius];
    *((void *)v10 + 12) = v16;
    *((_DWORD *)v10 + 27) = a5;
    int v17 = [v9 status];
    v10[104] = v17 == 0;
    if (!v17)
    {
      if ([v9 parametersCount] != 9)
      {
        v22 = 0;
        goto LABEL_9;
      }
      uint64_t v18 = [v9 parameters];
      *(_OWORD *)(v10 + 24) = *(_OWORD *)v18;
      long long v20 = *(_OWORD *)(v18 + 32);
      long long v19 = *(_OWORD *)(v18 + 48);
      uint64_t v21 = *(void *)(v18 + 64);
      *(_OWORD *)(v10 + 40) = *(_OWORD *)(v18 + 16);
      *((void *)v10 + 11) = v21;
      *(_OWORD *)(v10 + 72) = v19;
      *(_OWORD *)(v10 + 56) = v20;
    }
  }
  v22 = v10;
LABEL_9:

  return v22;
}

- (id)toServerResponse
{
  v3 = objc_alloc_init(GEOPolyLocationShiftResponse);
  [(GEOPolyLocationShiftResponse *)v3 setStatus:!self->_shouldUsePolyShiftFunction];
  [(GEOPolyLocationShiftResponse *)v3 setRadius:self->_radius];
  v4 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", self->_originalCoordinate.latitude, self->_originalCoordinate.longitude);
  [(GEOPolyLocationShiftResponse *)v3 setCenter:v4];

  if (self->_shouldUsePolyShiftFunction)
  {
    for (uint64_t i = 24; i != 96; i += 8)
      [(GEOPolyLocationShiftResponse *)v3 addParameters:*(double *)((char *)&self->super.isa + i)];
  }

  return v3;
}

- (id)contractFunctionTo:(id)a3 withRadius:(double)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(GEOLocationShiftFunctionResponse);
  if (v7)
  {
    [v6 coordinate];
    v7->_originalCoordinate.latitude = v8;
    v7->_originalCoordinate.longitude = v9;
    v7->_version = self->_version;
    double radius = self->_radius;
    if (radius >= a4) {
      double radius = a4;
    }
    v7->_double radius = radius;
    v7->_shouldUsePolyShiftFunction = self->_shouldUsePolyShiftFunction;
    v11 = v7;
    if (self->_shouldUsePolyShiftFunction)
    {
      *(_OWORD *)v7->_params = *(_OWORD *)self->_params;
      long long v12 = *(_OWORD *)&self->_params[2];
      long long v13 = *(_OWORD *)&self->_params[4];
      long long v14 = *(_OWORD *)&self->_params[6];
      v7->_params[8] = self->_params[8];
      *(_OWORD *)&v7->_params[6] = v14;
      *(_OWORD *)&v7->_params[4] = v13;
      *(_OWORD *)&v7->_params[2] = v12;
      v11 = v7;
    }
  }
  else
  {
    v11 = self;
  }
  uint64_t v15 = v11;

  return v15;
}

- (GEOLocationShiftFunctionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOLocationShiftFunctionResponse;
  v5 = [(GEOLocationShiftFunctionResponse *)&v19 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"OriginalCoordinateLat"];
    uint64_t v7 = v6;
    [v4 decodeDoubleForKey:@"OriginalCoordinateLng"];
    *((void *)v5 + 1) = v7;
    *((void *)v5 + 2) = v8;
    [v4 decodeDoubleForKey:@"Radius"];
    *((void *)v5 + 12) = v9;
    int v10 = [v4 containsValueForKey:@"Version"];
    if (v10) {
      int v10 = [v4 decodeInt32ForKey:@"Version"];
    }
    *((_DWORD *)v5 + 27) = v10;
    int v11 = [v4 decodeBoolForKey:@"ShouldShift"];
    v5[104] = v11;
    if (v11)
    {
      uint64_t v18 = 0;
      uint64_t v12 = [v4 decodeBytesForKey:@"Parameters" returnedLength:&v18];
      if (v18 != 72)
      {
        uint64_t v16 = 0;
        goto LABEL_8;
      }
      *(_OWORD *)(v5 + 24) = *(_OWORD *)v12;
      long long v13 = *(_OWORD *)(v12 + 16);
      long long v14 = *(_OWORD *)(v12 + 32);
      long long v15 = *(_OWORD *)(v12 + 48);
      *((void *)v5 + 11) = *(void *)(v12 + 64);
      *(_OWORD *)(v5 + 72) = v15;
      *(_OWORD *)(v5 + 56) = v14;
      *(_OWORD *)(v5 + 40) = v13;
    }
  }
  uint64_t v16 = v5;
LABEL_8:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"OriginalCoordinateLat" forKey:self->_originalCoordinate.latitude];
  [v4 encodeDouble:@"OriginalCoordinateLng" forKey:self->_originalCoordinate.longitude];
  [v4 encodeDouble:@"Radius" forKey:self->_radius];
  [v4 encodeInt32:self->_version forKey:@"Version"];
  [v4 encodeBool:self->_shouldUsePolyShiftFunction forKey:@"ShouldShift"];
  if (self->_shouldUsePolyShiftFunction) {
    [v4 encodeBytes:self->_params length:72 forKey:@"Parameters"];
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)shiftedCoordinateForCoordinate:(id)a3 accuracy:(double *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (self->_shouldUsePolyShiftFunction)
  {
    double v18 = self->_params[2] + a3.var0 * self->_params[1] + self->_params[0] * a3.var1;
    double v7 = sin((a3.var1 + -105.0) * 15.0 * 3.14159265 / 180.0);
    long double v8 = sin((var1 + -105.0) * 60.0 * 3.14159265 / 180.0) * 40.0 + v7 * 150.0;
    long double v9 = v8 + sin((var1 + -105.0) * 180.0 * 3.14159265 / 180.0) * 20.0;
    double v17 = sin((var1 + -105.0) * 360.0 * 3.14159265 / 180.0);
    double v10 = sin((var1 + -105.0) * 1080.0 * 3.14159265 / 180.0);
    double v19 = var1
        + (v18 + (v9 + v17 * 20.0 + v10 * 20.0) * 0.666666667)
        * (var0 * self->_params[3] / 1000000000.0 + self->_params[4] / 1000000.0);
    double v16 = self->_params[7] + var0 * self->_params[6] + self->_params[5] * var1;
    double v11 = sin((var0 + -35.0) * 15.0 * 3.14159265 / 180.0);
    long double v12 = sin((var0 + -35.0) * 60.0 * 3.14159265 / 180.0) * 40.0 + v11 * 160.0;
    long double v13 = v12 + sin((var0 + -35.0) * 180.0 * 3.14159265 / 180.0) * 20.0;
    double var1 = v19;
    double var0 = var0
         + (v16 + (v13 + v17 * 20.0 + v10 * 20.0) * 0.666666667)
         * (var0 * self->_params[8] / 1000000000.0 + 0.0000090539664);
  }
  double v14 = var0;
  double v15 = var1;
  result.double var1 = v15;
  result.double var0 = v14;
  return result;
}

- (BOOL)isValidForCoordinate:(id)a3
{
  return (a3.var1 - self->_originalCoordinate.longitude) * (a3.var1 - self->_originalCoordinate.longitude)
       + (a3.var0 - self->_originalCoordinate.latitude) * (a3.var0 - self->_originalCoordinate.latitude) <= self->_radius * self->_radius;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (char *)v4;
    int32x2_t v6 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabdq_f64((float64x2_t)self->_originalCoordinate, *(float64x2_t *)(v5 + 8))));
    BOOL v7 = (v6.i32[0] & v6.i32[1] & 1) != 0
      && self->_radius == *((double *)v5 + 12)
      && self->_version == *((_DWORD *)v5 + 27);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)originalCoordinate
{
  double latitude = self->_originalCoordinate.latitude;
  double longitude = self->_originalCoordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (unsigned)version
{
  return self->_version;
}

@end