@interface GEOMapAccessTransitNodeBase
- ($140BDABED96B4E653C9F0DB440664A5C)boundingRect;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints;
- (GEOMapAccessTransitNodeBase)initWithMap:(id)a3 node:(shared_ptr<geo::MapNodeTransit>)a4;
- (NSString)description;
- (NSString)internalName;
- (double)boundingRadius;
- (double)distanceInMetersFrom:(id)a3;
- (id).cxx_construct;
- (id)findAccessPoints:(id)a3 completionHandler:(id)a4;
- (id)findGeometryWithCompletionHandler:(id)a3;
- (int64_t)polygonPointsCount;
- (unint64_t)transitID;
- (void)dealloc;
@end

@implementation GEOMapAccessTransitNodeBase

- (GEOMapAccessTransitNodeBase)initWithMap:(id)a3 node:(shared_ptr<geo::MapNodeTransit>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapAccessTransitNodeBase;
  v8 = [(GEOMapAccessTransitNodeBase *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_map, a3);
    v11 = *(MapNodeTransit **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_node.__cntrl_;
    v9->_node.__ptr_ = v11;
    v9->_node.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v9->_polygonPointsCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_boundingRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)GEOMapRectNull;
    v9->_boundingRect.size = ($D4775485B13497D55C4F339E01923D43)unk_18A635B88;
  }

  return v9;
}

- (void)dealloc
{
  polygonPoints = self->_polygonPoints;
  if (polygonPoints) {
    free(polygonPoints);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOMapAccessTransitNodeBase;
  [(GEOMapAccessTransitNodeBase *)&v4 dealloc];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  ptr = self->_node.__ptr_;
  double v3 = *((double *)ptr + 1);
  double v4 = *((double *)ptr + 2);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (unint64_t)transitID
{
  return *(void *)(*((void *)self->_node.__ptr_ + 5) + 40);
}

- (NSString)internalName
{
  if (*(void *)(*((void *)self->_node.__ptr_ + 5) + 16))
  {
    v2 = objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)description
{
  v2 = NSString;
  (*(void (**)(void **__return_ptr))(*(void *)self->_node.__ptr_ + 32))(__p);
  if (v7 >= 0) {
    double v3 = __p;
  }
  else {
    double v3 = (void **)__p[0];
  }
  double v4 = [v2 stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }

  return (NSString *)v4;
}

- (id)findGeometryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_polygonPointsCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_polygonPointsCount = 0;
      v6 = [GEOMapTransitGeometryFinder alloc];
      map = self->_map;
      unint64_t v8 = [(GEOMapAccessTransitNodeBase *)self transitID];
      [(GEOMapAccessTransitNodeBase *)self coordinate];
      v9 = -[GEOMapTransitGeometryFinder initWithMap:transitID:coordinate:](v6, "initWithMap:transitID:coordinate:", map, v8);
      [(GEOMapRequest *)v9 setCompletionHandler:v5];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__GEOMapAccessTransitNodeBase_findGeometryWithCompletionHandler___block_invoke;
      v13[3] = &unk_1E53DAB88;
      v13[4] = self;
      [(GEOMapTransitGeometryFinder *)v9 findTransitGeometryWithHandler:v13];
      if ([(GEOMapRequest *)v9 isFinished]) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      v11 = v10;
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __65__GEOMapAccessTransitNodeBase_findGeometryWithCompletionHandler___block_invoke(uint64_t a1, const void *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v7 = a3;
  uint64_t v10 = *(double **)(a1 + 32);
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = a6;
  v10[8] = a7;
  *(void *)(*(void *)(a1 + 32) + 80) = a3;
  size_t v11 = 16 * a3;
  *(void *)(*(void *)(a1 + 32) + 72) = malloc_type_malloc(16 * a3, 0x7F2FC9B5uLL);
  memcpy(*(void **)(*(void *)(a1 + 32) + 72), a2, v11);
  [*(id *)(a1 + 32) coordinate];
  double v14 = GEOTilePointForCoordinate(v12, v13, 20.0);
  if (v7)
  {
    v16 = (double *)(*(void *)(*(void *)(a1 + 32) + 72) + 8);
    double v17 = -1.0;
    double v18 = 0.0;
    double v19 = -1.0;
    do
    {
      double v20 = *(v16 - 1);
      if (v18 < (v20 - v14) * (v20 - v14) + (*v16 - v15) * (*v16 - v15))
      {
        double v19 = *(v16 - 1);
        double v17 = *v16;
        double v18 = (v20 - v14) * (v20 - v14) + (*v16 - v15) * (*v16 - v15);
      }
      v16 += 2;
      --v7;
    }
    while (v7);
  }
  else
  {
    double v19 = -1.0;
    double v17 = -1.0;
  }
  if (v19 <= 268435456.0 && v19 >= 0.0 && v17 >= 0.0 && v17 <= 268435456.0) {
    *(long double *)(*(void *)(a1 + 32) + 32) = GEOMetersBetweenMapPoints(v14, v15, v19, v17);
  }
}

- (double)distanceInMetersFrom:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(GEOMapAccessTransitNodeBase *)self coordinate];

  return GEOCalculateDistanceRadius(v5, v6, var0, var1, 6367000.0);
}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  return 0;
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
  result.var1.double var1 = height;
  result.var1.double var0 = width;
  result.var0.double var1 = y;
  result.var0.double var0 = x;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)polygonPoints
{
  return self->_polygonPoints;
}

- (int64_t)polygonPointsCount
{
  return self->_polygonPointsCount;
}

- (void).cxx_destruct
{
  cntrl = self->_node.__cntrl_;
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