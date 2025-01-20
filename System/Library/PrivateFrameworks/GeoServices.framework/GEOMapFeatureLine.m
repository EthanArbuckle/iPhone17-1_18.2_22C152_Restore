@interface GEOMapFeatureLine
- ($1AB5FA073B851C12C2339EC22442E995)closestCoordinateFromCoordinate:(id)a3 outDistance:(double *)a4;
- ($1AB5FA073B851C12C2339EC22442E995)coordinates3d;
- ($1AB5FA073B851C12C2339EC22442E995)firstCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)lastCoordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates;
- ($F24F406B2B787EFB06265DBA3D28CBD5)firstCoordinate2D;
- ($F24F406B2B787EFB06265DBA3D28CBD5)lastCoordinate2D;
- (GEOMapFeatureLine)init;
- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4;
- (double)closestDistance2DFromCoordinate:(id)a3;
- (double)length;
- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4;
- (id)_containingTile;
- (id)_formattedProtobufEnum:(id)a3;
- (id)coordinatesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)coordinateCount;
- (void)dealloc;
@end

@implementation GEOMapFeatureLine

- (GEOMapFeatureLine)init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureLine;
  result = [(GEOMapFeatureLine *)&v3 init];
  if (result)
  {
    result->_coordinateCount = 0x7FFFFFFFFFFFFFFFLL;
    result->_isFlipped = 0;
  }
  return result;
}

- (void)dealloc
{
  free(self->_tempCoordinates2d);
  free(self->_coordinates3d);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureLine;
  [(GEOMapFeatureLine *)&v3 dealloc];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  result = self->_tempCoordinates2d;
  if (!result)
  {
    v4 = [(GEOMapFeatureLine *)self coordinates3d];
    self->_tempCoordinates2d = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16* [(GEOMapFeatureLine *)self coordinateCount], 0x1000040451B5BE8uLL);
    if ([(GEOMapFeatureLine *)self coordinateCount])
    {
      unint64_t v5 = 0;
      do
      {
        $F24F406B2B787EFB06265DBA3D28CBD5 v6 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&v4->var0;
        ++v4;
        self->_tempCoordinates2d[v5++] = v6;
      }
      while (v5 < [(GEOMapFeatureLine *)self coordinateCount]);
    }
    return self->_tempCoordinates2d;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinates3d
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  coordinates3d = self->_coordinates3d;
  if (!coordinates3d)
  {
    unint64_t v35 = 0;
    v4 = [(GEOMapFeatureLine *)self _tilePointsForSection:0 outCount:&v35];
    unint64_t v5 = v35;
    if (v35)
    {
      uint64_t v34 = 0;
      $F24F406B2B787EFB06265DBA3D28CBD5 v6 = [(GEOMapFeatureLine *)self _elevationsForSection:0 outCount:&v34];
      unint64_t v5 = v35;
      if (v6 && v34 != v35)
      {
        v7 = GEOGetGEOMapFeatureAccessLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 67109376;
          DWORD1(buf) = v34;
          WORD4(buf) = 1024;
          *(_DWORD *)((char *)&buf + 10) = v35;
          _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Feature has elevations but elevations count (%d) does not match tile points count (%d). Ignoring elevations.", (uint8_t *)&buf, 0xEu);
        }

        $F24F406B2B787EFB06265DBA3D28CBD5 v6 = 0;
        unint64_t v5 = v35;
      }
    }
    else
    {
      $F24F406B2B787EFB06265DBA3D28CBD5 v6 = 0;
    }
    self->_coordinateCount = v5;
    self->_coordinates3d = ($1AB5FA073B851C12C2339EC22442E995 *)malloc_type_malloc(24 * v5, 0x1000040504FFAC1uLL);
    v8 = [(GEOMapFeatureLine *)self _containingTile];
    uint64_t v9 = [v8 tileKey];
    uint64_t v10 = *(void *)v9;
    uint64_t v11 = *(void *)v9 << 32;
    unint64_t v12 = BYTE4(*(void *)v9) | ((((*(void *)v9 >> 40) | (*(unsigned __int16 *)(v9 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v9 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v9 + 10) >> 4) << 52);
    *(void *)((char *)&buf + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v9 >> 8) & 0x3F) << 40);
    LOBYTE(buf) = v10;
    *((void *)&v13 + 1) = v12;
    *(void *)&long long v13 = v11;
    *((void *)&buf + 1) = v13 >> 56;
    double v14 = GEOMapRectForGEOTileKey((uint64_t)&buf);
    double v32 = v16;
    double v33 = v14;
    double v31 = v17;
    if (v35)
    {
      double v18 = v15;
      unint64_t v19 = 0;
      BOOL isFlipped = self->_isFlipped;
      p_var1 = &v4->var1;
      uint64_t v22 = -1;
      coordinates3d = self->_coordinates3d;
      do
      {
        double v23 = v33 + *(p_var1 - 1) * v31;
        long double v24 = exp(((v32 + (float)(1.0 - *p_var1) * v18) * 0.0078125 + -1048576.0) / 333772.107);
        double v25 = (atan(v24) * -2.0 + 1.57079633) * 57.2957795;
        unint64_t v26 = v35;
        unint64_t v27 = v22 + v35;
        if (!isFlipped) {
          unint64_t v27 = v19;
        }
        p_var0 = &coordinates3d[v27].var0;
        double *p_var0 = v25;
        p_var0[1] = v23 * 0.0078125 * 0.000171661377 + -180.0;
        if (v6) {
          float v29 = v6[v19];
        }
        else {
          float v29 = 0.0;
        }
        coordinates3d[v27].var2 = v29;
        ++v19;
        --v22;
        p_var1 += 2;
      }
      while (v19 < v26);
    }
    else
    {
      coordinates3d = self->_coordinates3d;
    }
  }
  return coordinates3d;
}

- (unint64_t)coordinateCount
{
  unint64_t result = self->_coordinateCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(GEOMapFeatureLine *)self coordinates3d];
    return self->_coordinateCount;
  }
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)firstCoordinate
{
  if ([(GEOMapFeatureLine *)self coordinateCount])
  {
    coordinates3d = self->_coordinates3d;
    double var0 = coordinates3d->var0;
    double var1 = coordinates3d->var1;
    double var2 = coordinates3d->var2;
  }
  else
  {
    double var2 = 1.79769313e308;
    double var0 = -180.0;
    double var1 = -180.0;
  }
  result.double var2 = var2;
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)firstCoordinate2D
{
  if ([(GEOMapFeatureLine *)self coordinateCount])
  {
    coordinates3d = self->_coordinates3d;
    double var0 = coordinates3d->var0;
    double var1 = coordinates3d->var1;
  }
  else
  {
    double var0 = -180.0;
    double var1 = -180.0;
  }
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)lastCoordinate
{
  if ([(GEOMapFeatureLine *)self coordinateCount])
  {
    objc_super v3 = &self->_coordinates3d[self->_coordinateCount];
    double var0 = v3[-1].var0;
    double var1 = v3[-1].var1;
    double var2 = v3[-1].var2;
  }
  else
  {
    double var2 = 1.79769313e308;
    double var0 = -180.0;
    double var1 = -180.0;
  }
  result.double var2 = var2;
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)lastCoordinate2D
{
  if ([(GEOMapFeatureLine *)self coordinateCount])
  {
    objc_super v3 = &self->_coordinates3d[self->_coordinateCount];
    double var0 = v3[-1].var0;
    double var1 = v3[-1].var1;
  }
  else
  {
    double var0 = -180.0;
    double var1 = -180.0;
  }
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- (double)length
{
  long double length = self->_length;
  if (length == 0.0)
  {
    v4 = [(GEOMapFeatureLine *)self coordinates3d];
    unint64_t coordinateCount = self->_coordinateCount;
    long double length = self->_length;
    unint64_t v6 = coordinateCount - 1;
    if (coordinateCount != 1)
    {
      p_double var1 = &v4[1].var1;
      do
      {
        long double length = GEOCalculateDistanceRadius(*(p_var1 - 4), *(p_var1 - 3), *(p_var1 - 1), *p_var1, 6367000.0) + length;
        self->_long double length = length;
        p_var1 += 3;
        --v6;
      }
      while (v6);
    }
  }
  return length;
}

- (double)closestDistance2DFromCoordinate:(id)a3
{
  double v4 = 1.79769313e308;
  -[GEOMapFeatureLine closestCoordinateFromCoordinate:outDistance:](self, "closestCoordinateFromCoordinate:outDistance:", &v4, a3.var0, a3.var1, a3.var2);
  return v4;
}

- ($1AB5FA073B851C12C2339EC22442E995)closestCoordinateFromCoordinate:(id)a3 outDistance:(double *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(GEOMapFeatureLine *)self coordinates3d];
  unint64_t v7 = [(GEOMapFeatureLine *)self coordinateCount];
  int v9 = v7;
  if (v7 >= 2 && v6)
  {
    double v11 = v6->var0;
    double v10 = v6->var1;
    double var2 = v6->var2;
    unint64_t v13 = v7 - 1;
    p_double var2 = &v6[1].var2;
    double v15 = 1.79769313e308;
    *(double *)&unint64_t v30 = -180.0;
    *(double *)&unint64_t v28 = -180.0;
    *(double *)&uint64_t v29 = 1.79769313e308;
    do
    {
      double v16 = v11;
      double v17 = v10;
      double v11 = *(p_var2 - 2);
      double v10 = *(p_var2 - 1);
      double v33 = *p_var2;
      double v18 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v16, v17, var2, v11, v10, *p_var2, v11, v8, var0, var1);
      double v20 = v19;
      uint64_t v22 = v21;
      double v23 = GEOCalculateDistanceRadius(v18, v19, var0, var1, 6367000.0);
      if (v23 < v15)
      {
        *(double *)&unint64_t v28 = v18;
        uint64_t v29 = v22;
        *(double *)&unint64_t v30 = v20;
        double v15 = v23;
      }
      p_var2 += 3;
      --v13;
      double var2 = v33;
    }
    while (v13);
    double v25 = *(double *)&v29;
    double v24 = *(double *)&v30;
    double v26 = *(double *)&v28;
    if (!a4) {
      goto LABEL_13;
    }
LABEL_12:
    *a4 = v15;
    goto LABEL_13;
  }
  unint64_t v27 = GEOGetGEOMapFeatureAccessLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109376;
    int v35 = v9;
    __int16 v36 = 2048;
    uint64_t v37 = v6;
    _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, "Error calling -[GEOMapFeatureLine closestDistance2DFromCoordinate:] because of bad geometry. Coordinate count: %d, coordinates: %p.", buf, 0x12u);
  }

  double v15 = 1.79769313e308;
  double v26 = -180.0;
  double v24 = -180.0;
  double v25 = 1.79769313e308;
  if (a4) {
    goto LABEL_12;
  }
LABEL_13:
  result.double var2 = v25;
  result.double var1 = v24;
  result.double var0 = v26;
  return result;
}

- (id)coordinatesDescription
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOMapFeatureLine coordinateCount](self, "coordinateCount"));
  if ([(GEOMapFeatureLine *)self coordinateCount])
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = [(GEOMapFeatureLine *)self coordinates3d];
      unint64_t v7 = [NSString stringWithFormat:@"[%2d] %0.6f, %0.6f | %0.2fm", v5, *(void *)&v6[v4].var0, *(void *)&v6[v4].var1, *(void *)&v6[v4].var2];
      [v3 addObject:v7];

      ++v5;
      ++v4;
    }
    while (v5 < [(GEOMapFeatureLine *)self coordinateCount]);
  }
  double v8 = NSString;
  unint64_t v9 = [(GEOMapFeatureLine *)self coordinateCount];
  double v10 = [v3 componentsJoinedByString:@"\n"];
  double v11 = [v8 stringWithFormat:@"Coordinates: %d\n%@", v9, v10];

  return v11;
}

- (id)_containingTile
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Must be implemented by subclasses.", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v3, 2u);
  }
  return 0;
}

- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Must be implemented by subclasses.", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v5, 2u);
  }
  return 0;
}

- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Must be implemented by subclasses.", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", v5, 2u);
  }
  return 0;
}

- (id)_formattedProtobufEnum:(id)a3
{
  objc_super v3 = [a3 capitalizedString];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1ED51F370];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (!self->_tempCoordinates2d) {
    goto LABEL_5;
  }
  unint64_t coordinateCount = self->_coordinateCount;
  if (!coordinateCount) {
    goto LABEL_5;
  }
  size_t v6 = 16 * coordinateCount;
  unint64_t v7 = malloc_type_malloc(16 * coordinateCount, 0x66F83386uLL);
  *(void *)(v4 + 8) = v7;
  if (v7)
  {
    memcpy(v7, self->_tempCoordinates2d, v6);
LABEL_5:
    if (self->_coordinates3d)
    {
      unint64_t v8 = self->_coordinateCount;
      if (v8)
      {
        size_t v9 = 24 * v8;
        double v10 = malloc_type_malloc(24 * v8, 0x1842897FuLL);
        *(void *)(v4 + 16) = v10;
        memcpy(v10, self->_coordinates3d, v9);
      }
    }
    *(void *)(v4 + 24) = self->_coordinateCount;
    *(double *)(v4 + 32) = self->_length;
    *(unsigned char *)(v4 + 40) = self->_isFlipped;
    id v11 = (id)v4;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)unint64_t v13 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: copy->_tempCoordinates2d != ((void *)0)", v13, 2u);
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

@end