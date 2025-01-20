@interface GEOViewportFrame
- ($1AB5FA073B851C12C2339EC22442E995)maxViewTargetBounds;
- ($1AB5FA073B851C12C2339EC22442E995)minViewTargetBounds;
- (BOOL)hasViewTargetBounds;
- (GEOViewportFrame)initWithGEOPDViewportFrame:(id)a3;
- (double)altitude;
- (double)initWithAltitude:(double)a3 latitude:(double)a4 longitude:(float)a5 heading:(float)a6 pitch:(float)a7 distance:(uint64_t)a8 minViewTargetBounds:(char)a9 maxViewTargetBounds:(uint64_t)a10 hasViewTargetBounds:(uint64_t)a11;
- (double)latitude;
- (double)longitude;
- (float)distance;
- (float)heading;
- (float)pitch;
@end

@implementation GEOViewportFrame

- (double)initWithAltitude:(double)a3 latitude:(double)a4 longitude:(float)a5 heading:(float)a6 pitch:(float)a7 distance:(uint64_t)a8 minViewTargetBounds:(char)a9 maxViewTargetBounds:(uint64_t)a10 hasViewTargetBounds:(uint64_t)a11
{
  v28.receiver = a1;
  v28.super_class = (Class)GEOViewportFrame;
  result = (double *)objc_msgSendSuper2(&v28, sel_init);
  if (result)
  {
    result[3] = a2;
    result[4] = a3;
    *((float *)result + 3) = a5;
    *((float *)result + 4) = a6;
    *((float *)result + 5) = a7;
    result[5] = a4;
    *((void *)result + 6) = a15;
    *((void *)result + 7) = a16;
    *((void *)result + 8) = a17;
    *((void *)result + 9) = a18;
    *((void *)result + 10) = a19;
    *((void *)result + 11) = a20;
    *((unsigned char *)result + 8) = a9;
  }
  return result;
}

- (GEOViewportFrame)initWithGEOPDViewportFrame:(id)a3
{
  v4 = (id *)a3;
  -[GEOPDViewportFrame viewTargetBounds](v4);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOPDBoundingCube min](v5);

  -[GEOPDViewportFrame viewTargetBounds](v4);
  v7 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = -[GEOPDBoundingCube max](v7);

  [v6 latitude];
  uint64_t v38 = v9;
  [v6 longitude];
  uint64_t v37 = v10;
  [v6 altitude];
  uint64_t v36 = v11;
  [v8 latitude];
  uint64_t v35 = v12;
  [v8 longitude];
  uint64_t v14 = v13;
  [v8 altitude];
  uint64_t v16 = v15;
  v17 = -[GEOPDViewportFrame targetPoint](v4);
  [v17 altitude];
  double v19 = v18;
  v20 = -[GEOPDViewportFrame targetPoint](v4);
  [v20 latitude];
  double v22 = v21;
  v23 = -[GEOPDViewportFrame targetPoint](v4);
  [v23 longitude];
  double v25 = v24;
  if (v4)
  {
    int v26 = *((_DWORD *)v4 + 14);
    int v27 = *((_DWORD *)v4 + 15);
    int v28 = *((_DWORD *)v4 + 13);
    -[GEOPDViewportFrame _readViewTargetBounds]((uint64_t)v4);
    BOOL v29 = v4[4] != 0;
  }
  else
  {
    BOOL v29 = 0;
    int v28 = 0;
    int v26 = 0;
    int v27 = 0;
  }

  LODWORD(v30) = v26;
  LODWORD(v31) = v27;
  LODWORD(v32) = v28;
  v33 = -[GEOViewportFrame initWithAltitude:latitude:longitude:heading:pitch:distance:minViewTargetBounds:maxViewTargetBounds:hasViewTargetBounds:](self, "initWithAltitude:latitude:longitude:heading:pitch:distance:minViewTargetBounds:maxViewTargetBounds:hasViewTargetBounds:", v29, v19, v22, v25, v30, v31, v32, v38, v37, v36, v35, v14, v16);

  return v33;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (float)heading
{
  return self->_heading;
}

- (float)pitch
{
  return self->_pitch;
}

- (float)distance
{
  return self->_distance;
}

- ($1AB5FA073B851C12C2339EC22442E995)minViewTargetBounds
{
  double latitude = self->_minViewTargetBounds.latitude;
  double longitude = self->_minViewTargetBounds.longitude;
  double altitude = self->_minViewTargetBounds.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)maxViewTargetBounds
{
  double latitude = self->_maxViewTargetBounds.latitude;
  double longitude = self->_maxViewTargetBounds.longitude;
  double altitude = self->_maxViewTargetBounds.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (BOOL)hasViewTargetBounds
{
  return self->_hasViewTargetBounds;
}

@end