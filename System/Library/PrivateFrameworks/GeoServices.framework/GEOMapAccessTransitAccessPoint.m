@interface GEOMapAccessTransitAccessPoint
- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints;
- (GEOMapAccessTransitAccessPoint)initWithMap:(id)a3 accessPoint:(shared_ptr<geo::MapAccessPointFeature>)a4;
- (NSString)internalName;
- (double)distanceInMetersFrom:(id)a3;
- (double)groundRadius;
- (id).cxx_construct;
- (id)findAccessPoints:(id)a3 completionHandler:(id)a4;
- (id)findGeometryWithCompletionHandler:(id)a3;
- (id)findStation:(id)a3 completionHandler:(id)a4;
- (id)findStops:(id)a3 completionHandler:(id)a4;
- (int64_t)polygonPointsCount;
- (unint64_t)stationID;
- (unint64_t)transitID;
- (unsigned)accessType;
- (unsigned)entranceExitType;
@end

@implementation GEOMapAccessTransitAccessPoint

- (GEOMapAccessTransitAccessPoint)initWithMap:(id)a3 accessPoint:(shared_ptr<geo::MapAccessPointFeature>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapAccessTransitAccessPoint;
  v8 = [(GEOMapAccessTransitAccessPoint *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_map, a3);
    v11 = *(MapAccessPointFeature **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_accessPoint.__cntrl_;
    v9->_accessPoint.__ptr_ = v11;
    v9->_accessPoint.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  ptr = self->_accessPoint.__ptr_;
  double v3 = *(double *)ptr;
  double v4 = *((double *)ptr + 1);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)transitID
{
  return *(void *)(*((void *)self->_accessPoint.__ptr_ + 2) + 40);
}

- (NSString)internalName
{
  if (*(void *)(*((void *)self->_accessPoint.__ptr_ + 2) + 16))
  {
    v2 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (unint64_t)stationID
{
  return *(void *)(*((void *)self->_accessPoint.__ptr_ + 2) + 224);
}

- (double)groundRadius
{
  return *(float *)(*((void *)self->_accessPoint.__ptr_ + 2) + 236);
}

- (unsigned)entranceExitType
{
  return *(unsigned char *)(*((void *)self->_accessPoint.__ptr_ + 2) + 232);
}

- (unsigned)accessType
{
  return *(_WORD *)(*((void *)self->_accessPoint.__ptr_ + 2) + 240);
}

- (double)distanceInMetersFrom:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(GEOMapAccessTransitAccessPoint *)self coordinate];

  return GEOCalculateDistanceRadius(v5, v6, var0, var1, 6367000.0);
}

- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect
{
  double v2 = INFINITY;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = INFINITY;
  result.var1.double var1 = v4;
  result.var1.double var0 = v3;
  result.var0.double var1 = v5;
  result.var0.double var0 = v2;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints
{
  return 0;
}

- (int64_t)polygonPointsCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)findGeometryWithCompletionHandler:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3) {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }

  return 0;
}

- (id)findStops:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (id)findStation:(id)a3 completionHandler:(id)a4
{
  double v6 = (void (**)(void))a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (self->_station)
  {
    if (v6) {
      v6[2](v6);
    }
    if (v8)
    {
      v8[2](v8, 0);
      v9 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = *(void *)(*((void *)self->_accessPoint.__ptr_ + 2) + 224);
    if (v10)
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __64__GEOMapAccessTransitAccessPoint_findStation_completionHandler___block_invoke;
      v17 = &unk_1E53DABD8;
      v18 = self;
      v19 = v6;
      v11 = (void *)MEMORY[0x18C120660](&v14);
      map = self->_map;
      [(GEOMapAccessTransitAccessPoint *)self coordinate];
      v9 = -[GEOMapAccess findTransitStationWithID:near:stationHandler:completionHandler:](map, "findTransitStationWithID:near:stationHandler:completionHandler:", v10, v11, v8);

      goto LABEL_11;
    }
    if (v7)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
      v9 = 0;
      goto LABEL_11;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

void __64__GEOMapAccessTransitAccessPoint_findStation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  double v6 = (void (**)(id, GEOMapAccessTransitAccessPoint *))a3;
  id v7 = (void (**)(id, void))a4;
  if (v6) {
    v6[2](v6, self);
  }
  if (v7) {
    v7[2](v7, 0);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_station, 0);
  cntrl = self->_accessPoint.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_map, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end