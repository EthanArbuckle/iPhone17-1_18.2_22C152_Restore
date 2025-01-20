@interface GEOMapFeatureTransitAccessPoint
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isEntrance;
- (BOOL)isExit;
- (GEOMapFeatureTransitAccessPoint)initWithFeature:(void *)a3;
- (double)radiusMeters;
- (id).cxx_construct;
- (void)dealloc;
- (void)feature;
@end

@implementation GEOMapFeatureTransitAccessPoint

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOMapFeatureTransitAccessPoint;
  [(GEOMapFeatureTransitAccessPoint *)&v2 dealloc];
}

- (BOOL)isEntrance
{
  return *((unsigned char *)self->_feature + 232) & 1;
}

- (BOOL)isExit
{
  return (*((unsigned __int8 *)self->_feature + 232) >> 1) & 1;
}

- (double)radiusMeters
{
  return *((float *)self->_feature + 59);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
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
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void)feature
{
  return self->_feature;
}

- (GEOMapFeatureTransitAccessPoint)initWithFeature:(void *)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)GEOMapFeatureTransitAccessPoint;
  v4 = [(GEOMapFeatureTransitAccessPoint *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_feature = a3;
    v6 = (std::__shared_weak_count *)*((void *)a3 + 1);
    if (v6 && (v6 = std::__shared_weak_count::lock(v6)) != 0) {
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
  }
  return v5;
}

@end