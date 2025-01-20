@interface GEOMapFeatureTransitPoint
- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints;
- (GEOMapFeatureTransitHall)hall;
- (GEOMapFeatureTransitPoint)initWithFeature:(void *)a3;
- (GEOMapFeatureTransitStation)station;
- (GEOMapFeatureTransitStop)stop;
- (NSArray)internalSystemNames;
- (NSString)internalName;
- (double)boundingRadius;
- (float)tileKey;
- (id).cxx_construct;
- (id)description;
- (unint64_t)polygonPointsCount;
- (unint64_t)transitID;
- (void)dealloc;
- (void)feature;
- (void)updateWithGeometryFeature:(void *)a3;
@end

@implementation GEOMapFeatureTransitPoint

- (void)dealloc
{
  free(self->_polygonPoints);
  v3.receiver = self;
  v3.super_class = (Class)GEOMapFeatureTransitPoint;
  [(GEOMapFeatureTransitPoint *)&v3 dealloc];
}

- (GEOMapFeatureTransitStop)stop
{
  return 0;
}

- (GEOMapFeatureTransitHall)hall
{
  return 0;
}

- (GEOMapFeatureTransitStation)station
{
  return 0;
}

- (unint64_t)transitID
{
  return *((void *)self->_feature + 5);
}

- (NSString)internalName
{
  if (*((void *)self->_feature + 2))
  {
    v2 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSArray)internalSystemNames
{
  uint64_t v3 = *((void *)self->_feature + 29);
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3)
  {
    for (unint64_t i = 0; i != v3; ++i)
    {
      uint64_t v8 = 0;
      geo::codec::transitNodeFeatureGetSystem((void *)self->_feature, i, &v8);
      if (v8 && *(void *)(v8 + 56))
      {
        v6 = objc_msgSend(NSString, "stringWithUTF8String:");
        [v4 addObject:v6];
      }
    }
  }

  return (NSArray *)v4;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(GEOMapFeatureTransitPoint *)self internalName];
  unint64_t v5 = [(GEOMapFeatureTransitPoint *)self transitID];
  [(GEOMapFeatureTransitPoint *)self coordinate];
  uint64_t v7 = v6;
  [(GEOMapFeatureTransitPoint *)self coordinate];
  v9 = [v3 stringWithFormat:@"%@ (%llu) | %f, %f", v4, v5, v7, v8];

  v10 = [(GEOMapFeatureTransitPoint *)self internalSystemNames];
  if ([v10 count])
  {
    v11 = [v10 componentsJoinedByString:@", "];
    [v9 appendFormat:@" | %@", v11];
  }

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (double)boundingRadius
{
  return self->_boundingRadius;
}

- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints
{
  return self->_polygonPoints;
}

- (unint64_t)polygonPointsCount
{
  return self->_polygonPointsCount;
}

- (void).cxx_destruct
{
  cntrl = self->_retainedTile.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (float)tileKey
{
  LODWORD(result) = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(*(unsigned __int16 *)(*(void *)(a1 + 88) + 12) | (*(unsigned __int8 *)(*(void *)(a1 + 88) + 14) << 16)), (uint32x2_t)0xFFFFFFF0FFFFFFFELL), (int8x8_t)0xF00003FFFLL).u32[0];
  return result;
}

- (void)feature
{
  return self->_feature;
}

- (GEOMapFeatureTransitPoint)initWithFeature:(void *)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)GEOMapFeatureTransitPoint;
  v4 = [(GEOMapFeatureTransitPoint *)&v19 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_feature = a3;
    uint64_t v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    if (v6 && (uint64_t v6 = std::__shared_weak_count::lock(v6)) != 0) {
      ptr = *(VectorTile **)a3;
    }
    else {
      ptr = 0;
    }
    cntrl = (std::__shared_weak_count *)v5->_retainedTile.__cntrl_;
    v5->_retainedTile.__ptr_ = ptr;
    v5->_retainedTile.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      ptr = v5->_retainedTile.__ptr_;
    }
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    unint64_t v9 = *(void *)((char *)ptr + 4);
    unsigned int v10 = *((unsigned __int8 *)ptr + 14);
    unsigned int v11 = *((unsigned __int16 *)ptr + 6);
    *(void *)((char *)v22 + 1) = (v9 << 32) & 0xFFFFC00000000000 | ((unint64_t)((v9 >> 8) & 0x3F) << 40);
    LOBYTE(v22[0]) = v9;
    *((void *)&v12 + 1) = BYTE4(v9) | ((((v9 >> 40) | (v11 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)(v11 >> 2) << 34) | ((unint64_t)(v10 & 0xF) << 48) | ((unint64_t)(v10 >> 4) << 52);
    *(void *)&long long v12 = v9 << 32;
    uint64_t v20 = v22[0];
    uint64_t v21 = v12 >> 56;
    double v13 = GEOMapRectForGEOTileKey((uint64_t)&v20);
    v5->_coordinate.double latitude = GEOCoordinate2DForMapPoint(v13 + *((float *)a3 + 22) * v14, v15 + (float)(1.0 - *((float *)a3 + 23)) * v16);
    v5->_coordinate.double longitude = v17;
    v5->_boundingRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)GEOMapRectNull;
    v5->_boundingRect.size = ($D4775485B13497D55C4F339E01923D43)unk_18A635B88;
  }
  return v5;
}

- (void)updateWithGeometryFeature:(void *)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  polygonPoints = self->_polygonPoints;
  if (polygonPoints) {
    free(polygonPoints);
  }
  uint64_t v6 = std::__shared_weak_count::lock(*((std::__shared_weak_count **)a3 + 1));
  unint64_t v7 = *(void *)(*(void *)a3 + 4);
  unsigned int v8 = *(unsigned __int8 *)(*(void *)a3 + 14);
  unsigned int v9 = *(unsigned __int16 *)(*(void *)a3 + 12);
  *(void *)((char *)v36 + 1) = (v7 << 32) & 0xFFFFC00000000000 | ((unint64_t)((v7 >> 8) & 0x3F) << 40);
  LOBYTE(v36[0]) = v7;
  *((void *)&v10 + 1) = BYTE4(v7) | ((((v7 >> 40) | (v9 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)(v9 >> 2) << 34) | ((unint64_t)(v8 & 0xF) << 48) | ((unint64_t)(v8 >> 4) << 52);
  *(void *)&long long v10 = v7 << 32;
  v35[0] = v36[0];
  v35[1] = v10 >> 56;
  double v11 = GEOMapRectForGEOTileKey((uint64_t)v35);
  double v33 = v12;
  double v34 = v11;
  double v31 = v14;
  double v32 = v13;
  v36[0] = 0;
  double v15 = geo::codec::multiSectionFeaturePoints(a3, 0, v36);
  uint64_t v16 = v36[0];
  self->_unint64_t polygonPointsCount = v36[0];
  double v17 = GEOTilePointForCoordinate(self->_coordinate.latitude, self->_coordinate.longitude, 20.0);
  double v19 = v18;
  uint64_t v20 = ($F24F406B2B787EFB06265DBA3D28CBD5 *)malloc_type_malloc(16 * v16, 0x1000040451B5BE8uLL);
  self->_polygonPoints = v20;
  unint64_t polygonPointsCount = self->_polygonPointsCount;
  if (polygonPointsCount)
  {
    p_var1 = &v20->var1;
    v23 = (float *)v15 + 1;
    double v24 = -1.79769313e308;
    double v25 = 1.79769313e308;
    double v26 = 1.79769313e308;
    double v27 = -1.79769313e308;
    do
    {
      double v28 = v34 + *(v23 - 1) * v32;
      double v29 = v33 + (float)(1.0 - *v23) * v31;
      *(p_var1 - 1) = v28;
      double *p_var1 = v29;
      long double v30 = GEOMetersBetweenMapPoints(v17, v19, v28, v29);
      if (self->_boundingRadius < v30) {
        self->_boundingRadius = v30;
      }
      double v25 = fmin(v25, v28);
      double v26 = fmin(v26, v29);
      double v24 = fmax(v24, v28);
      p_var1 += 2;
      v23 += 2;
      double v27 = fmax(v27, v29);
      --polygonPointsCount;
    }
    while (polygonPointsCount);
  }
  else
  {
    double v26 = 1.79769313e308;
    double v27 = -1.79769313e308;
    double v24 = -1.79769313e308;
    double v25 = 1.79769313e308;
  }
  self->_boundingRect.origin.double x = v25;
  self->_boundingRect.origin.double y = v26;
  self->_boundingRect.size.double width = v24 - v25;
  self->_boundingRect.size.double height = v27 - v26;
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
}

@end