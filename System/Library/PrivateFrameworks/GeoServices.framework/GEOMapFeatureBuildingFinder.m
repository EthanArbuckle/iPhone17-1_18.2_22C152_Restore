@interface GEOMapFeatureBuildingFinder
- (id)findBuildingsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6;
- (id)findBuildingsNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 handler:(id)a6 completionHandler:(id)a7;
- (vector<GeoCodecsVectorTilePoint,)_verticesFromTile:(GEOMapFeatureBuildingFinder *)self forBuildingIndex:(SEL)a3;
@end

@implementation GEOMapFeatureBuildingFinder

- (vector<GeoCodecsVectorTilePoint,)_verticesFromTile:(GEOMapFeatureBuildingFinder *)self forBuildingIndex:(SEL)a3
{
  id v32 = a4;
  uint64_t v7 = [v32 daVinciBuildingSections];
  uint64_t v35 = [v32 daVinciBuildingVertices];
  uint64_t v8 = [v32 daVinciLineLoops];
  uint64_t v9 = [v32 daVinciBuildings] + 40 * a5;
  unsigned int v10 = *(unsigned __int16 *)(v9 + 32);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  unsigned int v11 = *(unsigned __int16 *)(v9 + 34);
  v34 = (unsigned __int16 *)(v9 + 34);
  if (*(_WORD *)(v9 + 34))
  {
    end = 0;
    unint64_t v13 = 0;
    uint64_t v36 = v7 + 20 * v10;
    p_end_cap = &retstr->__end_cap_;
    uint64_t v33 = v8;
    do
    {
      uint64_t v15 = *(unsigned int *)(v36 + 20 * v13 + 12);
      uint64_t v16 = v8 + 8 * v15;
      int v18 = *(unsigned __int16 *)(v16 + 4);
      v17 = (unsigned __int16 *)(v16 + 4);
      if (v18)
      {
        unint64_t v19 = 0;
        uint64_t v20 = v35 + 12 * *(unsigned int *)(v8 + 8 * v15);
        do
        {
          GeoCodecsVectorTilePoint v21 = *(GeoCodecsVectorTilePoint *)(v20 + 12 * v19);
          if (end >= p_end_cap->__value_)
          {
            begin = retstr->__begin_;
            uint64_t v23 = end - retstr->__begin_;
            unint64_t v24 = v23 + 1;
            if ((unint64_t)(v23 + 1) >> 61) {
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v25 = (char *)p_end_cap->__value_ - (char *)begin;
            if (v25 >> 2 > v24) {
              unint64_t v24 = v25 >> 2;
            }
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v26 = v24;
            }
            if (v26)
            {
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&retstr->__end_cap_, v26);
              begin = retstr->__begin_;
              end = retstr->__end_;
            }
            else
            {
              v27 = 0;
            }
            v28 = (GeoCodecsVectorTilePoint *)&v27[8 * v23];
            GeoCodecsVectorTilePoint *v28 = v21;
            v29 = v28 + 1;
            if (end != begin)
            {
              do
              {
                GeoCodecsVectorTilePoint v30 = end[-1];
                --end;
                v28[-1] = v30;
                --v28;
              }
              while (end != begin);
              begin = retstr->__begin_;
            }
            retstr->__begin_ = v28;
            retstr->__end_ = v29;
            retstr->__end_cap_.__value_ = (GeoCodecsVectorTilePoint *)&v27[8 * v26];
            if (begin) {
              operator delete(begin);
            }
            end = v29;
          }
          else
          {
            *end++ = v21;
          }
          retstr->__end_ = end;
          ++v19;
        }
        while (v19 < *v17);
        uint64_t v8 = v33;
        unsigned int v11 = *v34;
      }
      ++v13;
    }
    while (v13 < v11);
  }

  return result;
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 handler:(id)a6 completionHandler:(id)a7
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v13 = a6;
  id v14 = a7;
  if (a5 == 1) {
    uint64_t v15 = 73;
  }
  else {
    uint64_t v15 = 11;
  }
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v16 = +[GEOMapFeatureAccess tileSetInfoForStyle:v15 scale:0];
  v17 = [GEOMapFeatureTileFinder alloc];
  int v18 = [(GEOMapFeatureAccessFinder *)self requestParameters];
  unint64_t v19 = [(GEOMapFeatureTileFinder *)v17 initWithZoomLevel:HIDWORD(*(unint64_t *)&v16) tileSize:v16 tileScale:0 tileSetStyle:v15 requestParameters:v18];

  double v20 = GEOTilePointForCoordinate(var0, var1, 20.0);
  uint64_t v22 = v21;
  long double v23 = GEOMapPointsPerMeterAtLatitude(var0);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __95__GEOMapFeatureBuildingFinder_findBuildingsNear_radius_tileSetStyle_handler_completionHandler___block_invoke;
  v28[3] = &unk_1E53DA350;
  v28[4] = self;
  double v30 = v20;
  uint64_t v31 = v22;
  double v32 = v23 * a4;
  id v24 = v13;
  id v29 = v24;
  uint64_t v25 = (void *)MEMORY[0x18C120660](v28);
  unint64_t v26 = -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v19, "findTilesAround:radius:handler:completionHandler:", v25, v14, var0, var1, a4);

  return v26;
}

void __95__GEOMapFeatureBuildingFinder_findBuildingsNear_radius_tileSetStyle_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(unsigned __int8 *)(v4 + 10);
  uint64_t v6 = *(unsigned __int16 *)(v4 + 8);
  uint64_t v7 = *(void *)v4;
  uint64_t v8 = *(void *)v4 << 32;
  int8x8_t v9 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v6 & 0xFFFFFFFFFF00FFFFLL | (v5 << 16)) >> 2), (int32x2_t)(v5 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  unint64_t v10 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (v6 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v9.u32[0] << 34) | ((unint64_t)v9.u32[1] << 48) | (v5 << 48) & 0xF0000000000000;
  *(void *)((char *)&__p + 1) = v8 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(__p) = v7;
  *((void *)&v11 + 1) = v10;
  *(void *)&long long v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_boundingCircleWithCenter:radius:inTile:", (void)__p, (unint64_t)(v11 >> 56), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  unint64_t v12 = 0;
  v22[0] = v13;
  v22[1] = v14;
  v22[2] = v15;
  while (v12 < [v3 totalBuildingFootprintsCount])
  {
    $7E3FC3C8846FD6918BD0D88F3AA609C8 v16 = GEOBuildingFootprintFeatureAtIndex(v3, v12);
    v17 = [v16 feature];
    if ([*(id *)(a1 + 32) _boundingCircle:v22 intersectsFeature:v17])
    {
      int v18 = [[GEOMapFeatureBuilding alloc] initWithFeature:v16];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    ++v12;
  }
  for (unint64_t i = 0; i < [v3 daVinciBuildingCount]; ++i)
  {
    double v20 = *(void **)(a1 + 32);
    if (v20)
    {
      [v20 _verticesFromTile:v3 forBuildingIndex:i];
      double v20 = *(void **)(a1 + 32);
    }
    else
    {
      long long __p = 0uLL;
      uint64_t v24 = 0;
    }
    if (objc_msgSend(v20, "_boundingCircle:intersectsPoints:pointCount:", v22))
    {
      uint64_t v21 = [[GEOMapFeatureBuilding alloc] initWithDaVinciTile:v3 buildingIndex:i];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    if ((void)__p)
    {
      *((void *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
  }
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  uint64_t v6 = -[GEOMapFeatureBuildingFinder findBuildingsNear:radius:tileSetStyle:handler:completionHandler:](self, "findBuildingsNear:radius:tileSetStyle:handler:completionHandler:", 0, a5, a6, a3.var0, a3.var1, a4);

  return v6;
}

@end