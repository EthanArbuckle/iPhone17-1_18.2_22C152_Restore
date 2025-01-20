@interface GEOMapEdgeRoadConnectionFinder
- (BOOL)_isRoadEdgeEqual:(id)a3 other:(id)a4;
- (void)_findConnectedEdges:(id)a3 incoming:(BOOL)a4;
- (void)_findConnections:(id)a3 incoming:(BOOL)a4;
@end

@implementation GEOMapEdgeRoadConnectionFinder

- (void)_findConnectedEdges:(id)a3 incoming:(BOOL)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4812000000;
  v27[3] = __Block_byref_object_copy__9;
  v27[4] = __Block_byref_object_dispose__9;
  v27[5] = "";
  memset(v28, 0, sizeof(v28));
  tile = self->super._tile;
  junction = self->super._junction;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke;
  v25[3] = &unk_1E53DB098;
  BOOL v26 = a4;
  v25[4] = v27;
  [(GEOVectorTile *)tile forEachEdgeOnJunction:junction visitor:v25];
  v9 = [(GEOVectorTile *)self->super._tile tileKey];
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *(void *)v9 << 32;
  unint64_t v12 = BYTE4(*(void *)v9) | ((((*(void *)v9 >> 40) | (*((unsigned __int16 *)v9 + 4) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned __int16 *)v9 + 4) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned char *)v9 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned char *)v9 + 10) >> 4) << 52);
  *(void *)((char *)&v29 + 1) = v11 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v9 >> 8) & 0x3F) << 40);
  LOBYTE(v29) = v10;
  *((void *)&v13 + 1) = v12;
  *(void *)&long long v13 = v11;
  v36[0] = v29;
  v36[1] = v13 >> 56;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._map);
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", WeakRetained, self->super._coordinate.latitude, self->super._coordinate.longitude, 5.0);
  v15 = (GEOMapTileFinder *)objc_claimAutoreleasedReturnValue();
  tileFinder = self->super._tileFinder;
  self->super._tileFinder = v15;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2;
  v22[3] = &unk_1E53DB0C0;
  id v17 = v6;
  id v23 = v17;
  v24 = v27;
  [(GEOMapRequest *)self->super._tileFinder setCompletionHandler:v22];
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = &v29;
  uint64_t v30 = 0x4012000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__3;
  v33 = "";
  double v34 = GEOTilePointForCoordinate(self->super._coordinate.latitude, self->super._coordinate.longitude, 20.0);
  uint64_t v35 = v18;
  v19 = self->super._tileFinder;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_5;
  v20[3] = &unk_1E53DB138;
  BOOL v21 = a4;
  v20[4] = &v29;
  v20[5] = v27;
  [(GEOMapTileFinder *)v19 findTiles:v20 excludingKey:v36];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(v27, 8);
  *(void *)&long long v29 = v28;
  std::vector<GEORoadEdge * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = v3;
    GEORoadEdgeFlip(v5);
    id v6 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = [v5 copy];
    unint64_t v8 = v6[4].u64[0];
    v9 = (uint64_t *)v6[3].i64[1];
    if ((unint64_t)v9 >= v8)
    {
      uint64_t v16 = v6[3].i64[0];
      uint64_t v17 = ((uint64_t)v9 - v16) >> 3;
      if ((unint64_t)(v17 + 1) >> 61) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v18 = v8 - v16;
      uint64_t v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
        uint64_t v19 = v17 + 1;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      v45 = v6 + 4;
      if (v20) {
        BOOL v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v6[4].i64, v20);
      }
      else {
        BOOL v21 = 0;
      }
      v28 = (uint64_t *)&v21[8 * v17];
      long long v29 = &v21[8 * v20];
      v44 = v29;
      uint64_t *v28 = v7;
      uint64_t v10 = v28 + 1;
      v43.i64[1] = (uint64_t)(v28 + 1);
      v31 = (void *)v6[3].i64[0];
      uint64_t v30 = (void *)v6[3].i64[1];
      if (v30 == v31)
      {
        int64x2_t v33 = vdupq_n_s64((unint64_t)v30);
      }
      else
      {
        do
        {
          uint64_t v32 = *--v30;
          *uint64_t v30 = 0;
          *--v28 = v32;
        }
        while (v30 != v31);
        int64x2_t v33 = v6[3];
        uint64_t v10 = (void *)v43.i64[1];
        long long v29 = v44;
      }
      v6[3].i64[0] = (uint64_t)v28;
      v6[3].i64[1] = (uint64_t)v10;
      int64x2_t v43 = v33;
      uint64_t v34 = v6[4].i64[0];
      v6[4].i64[0] = (uint64_t)v29;
      v44 = (char *)v34;
      uint64_t v42 = v33.i64[0];
      std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v42);
    }
    else
    {
      uint64_t *v9 = v7;
      uint64_t v10 = v9 + 1;
    }
    v6[3].i64[1] = (uint64_t)v10;
  }
  else
  {
    uint64_t v11 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = [v3 copy];
    unint64_t v13 = v11[4].u64[0];
    v14 = (uint64_t *)v11[3].i64[1];
    if ((unint64_t)v14 >= v13)
    {
      uint64_t v22 = v11[3].i64[0];
      uint64_t v23 = ((uint64_t)v14 - v22) >> 3;
      if ((unint64_t)(v23 + 1) >> 61) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v24 = v13 - v22;
      uint64_t v25 = v24 >> 2;
      if (v24 >> 2 <= (unint64_t)(v23 + 1)) {
        uint64_t v25 = v23 + 1;
      }
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v25;
      }
      v45 = v11 + 4;
      if (v26) {
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v11[4].i64, v26);
      }
      else {
        v27 = 0;
      }
      uint64_t v35 = (uint64_t *)&v27[8 * v23];
      v36 = &v27[8 * v26];
      v44 = v36;
      *uint64_t v35 = v12;
      v15 = v35 + 1;
      v43.i64[1] = (uint64_t)(v35 + 1);
      v38 = (void *)v11[3].i64[0];
      v37 = (void *)v11[3].i64[1];
      if (v37 == v38)
      {
        int64x2_t v40 = vdupq_n_s64((unint64_t)v37);
      }
      else
      {
        do
        {
          uint64_t v39 = *--v37;
          void *v37 = 0;
          *--uint64_t v35 = v39;
        }
        while (v37 != v38);
        int64x2_t v40 = v11[3];
        v15 = (void *)v43.i64[1];
        v36 = v44;
      }
      v11[3].i64[0] = (uint64_t)v35;
      v11[3].i64[1] = (uint64_t)v15;
      int64x2_t v43 = v40;
      uint64_t v41 = v11[4].i64[0];
      v11[4].i64[0] = (uint64_t)v36;
      v44 = (char *)v41;
      uint64_t v42 = v40.i64[0];
      std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v42);
    }
    else
    {
      uint64_t *v14 = v12;
      v15 = v14 + 1;
    }
    v11[3].i64[1] = (uint64_t)v15;
  }
}

uint64_t __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8) + 48);
}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_5(uint64_t a1, void *a2)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 tileKey];
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = *(void *)v4 << 32;
  unint64_t v7 = BYTE4(*(void *)v4) | ((((*(void *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v4 + 10) >> 4) << 52);
  *(void *)((char *)v25 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v25[0]) = v5;
  *((void *)&v8 + 1) = v7;
  *(void *)&long long v8 = v6;
  v24[0] = v25[0];
  v24[1] = v8 >> 56;
  double v9 = GEOMapRectForGEOTileKey((uint64_t)v24);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  float v12 = (*(double *)(v10 + 48) - v9) / v11;
  float v15 = (v14 - (*(double *)(v10 + 56) - v13)) / v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2_6;
  v18[3] = &unk_1E53DB110;
  id v16 = v3;
  char v23 = *(unsigned char *)(a1 + 48);
  float v21 = v12;
  float v22 = v15;
  uint64_t v17 = *(void *)(a1 + 40);
  id v19 = v16;
  uint64_t v20 = v17;
  [v16 forEachRoad:v18];
}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_2_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = geo::codec::multiSectionFeaturePoints((void *)[v3 get], 0, &v10);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_3;
  v8[3] = &unk_1E53DB0E8;
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[5] = v4;
  v8[6] = v5;
  v8[4] = v7;
  [v6 forEachEdgeInRoad:v3 visitTwice:0 visitor:v8];
}

void __63__GEOMapEdgeRoadConnectionFinder__findConnectedEdges_incoming___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v5 = [v3 vertexIndexB];
  }
  else {
    uint64_t v5 = [v3 vertexIndexA];
  }
  uint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v7 = [v4 vertexIndexA];
  }
  else {
    uint64_t v7 = [v4 vertexIndexB];
  }
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = a1 + 48;
  char v12 = 1;
  LODWORD(v8) = 897988541;
  do
  {
    float v13 = vabds_f32(*(float *)(v11 + 4 * v9), *(float *)(v10 + 8 * v6 + 4 * v9));
    if ((v12 & 1) == 0) {
      break;
    }
    char v12 = 0;
    uint64_t v9 = 1;
  }
  while (v13 < 0.000001);
  if (v13 >= 0.000001)
  {
    uint64_t v19 = 0;
    uint64_t v20 = v10 + 8 * v7;
    char v21 = 1;
    do
    {
      float v22 = vabds_f32(*(float *)(v11 + 4 * v19), *(float *)(v20 + 4 * v19));
      if ((v21 & 1) == 0) {
        break;
      }
      char v21 = 0;
      uint64_t v19 = 1;
    }
    while (v22 < 0.000001);
    if (v22 < 0.000001)
    {
      id v23 = v4;
      GEORoadEdgeFlip(v23);
      uint64_t v24 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
      uint64_t v25 = [v23 copy];
      unint64_t v26 = v24[4].u64[0];
      v27 = (uint64_t *)v24[3].i64[1];
      if ((unint64_t)v27 >= v26)
      {
        uint64_t v35 = v24[3].i64[0];
        uint64_t v36 = ((uint64_t)v27 - v35) >> 3;
        if ((unint64_t)(v36 + 1) >> 61) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v37 = v26 - v35;
        uint64_t v38 = v37 >> 2;
        if (v37 >> 2 <= (unint64_t)(v36 + 1)) {
          uint64_t v38 = v36 + 1;
        }
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v39 = v38;
        }
        v58 = v24 + 4;
        if (v39) {
          int64x2_t v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v24[4].i64, v39);
        }
        else {
          int64x2_t v40 = 0;
        }
        v48 = (uint64_t *)&v40[8 * v36];
        v49 = &v40[8 * v39];
        v57 = v49;
        uint64_t *v48 = v25;
        v28 = v48 + 1;
        v56.i64[1] = (uint64_t)(v48 + 1);
        v51 = (void *)v24[3].i64[0];
        v50 = (void *)v24[3].i64[1];
        if (v50 == v51)
        {
          int64x2_t v53 = vdupq_n_s64((unint64_t)v50);
        }
        else
        {
          do
          {
            uint64_t v52 = *--v50;
            void *v50 = 0;
            *--v48 = v52;
          }
          while (v50 != v51);
          int64x2_t v53 = v24[3];
          v28 = (void *)v56.i64[1];
          v49 = v57;
        }
        v24[3].i64[0] = (uint64_t)v48;
        v24[3].i64[1] = (uint64_t)v28;
        int64x2_t v56 = v53;
        uint64_t v54 = v24[4].i64[0];
        v24[4].i64[0] = (uint64_t)v49;
        v57 = (char *)v54;
        uint64_t v55 = v53.i64[0];
        std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v55);
      }
      else
      {
        uint64_t *v27 = v25;
        v28 = v27 + 1;
      }
      v24[3].i64[1] = (uint64_t)v28;
    }
  }
  else
  {
    double v14 = *(int64x2_t **)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = objc_msgSend(v4, "copy", v8);
    unint64_t v16 = v14[4].u64[0];
    uint64_t v17 = (uint64_t *)v14[3].i64[1];
    if ((unint64_t)v17 >= v16)
    {
      uint64_t v29 = v14[3].i64[0];
      uint64_t v30 = ((uint64_t)v17 - v29) >> 3;
      if ((unint64_t)(v30 + 1) >> 61) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v31 = v16 - v29;
      uint64_t v32 = v31 >> 2;
      if (v31 >> 2 <= (unint64_t)(v30 + 1)) {
        uint64_t v32 = v30 + 1;
      }
      if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v33 = v32;
      }
      v58 = v14 + 4;
      if (v33) {
        uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)v14[4].i64, v33);
      }
      else {
        uint64_t v34 = 0;
      }
      uint64_t v41 = (uint64_t *)&v34[8 * v30];
      uint64_t v42 = &v34[8 * v33];
      v57 = v42;
      *uint64_t v41 = v15;
      uint64_t v18 = v41 + 1;
      v56.i64[1] = (uint64_t)(v41 + 1);
      v44 = (void *)v14[3].i64[0];
      int64x2_t v43 = (void *)v14[3].i64[1];
      if (v43 == v44)
      {
        int64x2_t v46 = vdupq_n_s64((unint64_t)v43);
      }
      else
      {
        do
        {
          uint64_t v45 = *--v43;
          *int64x2_t v43 = 0;
          *--uint64_t v41 = v45;
        }
        while (v43 != v44);
        int64x2_t v46 = v14[3];
        uint64_t v18 = (void *)v56.i64[1];
        uint64_t v42 = v57;
      }
      v14[3].i64[0] = (uint64_t)v41;
      v14[3].i64[1] = (uint64_t)v18;
      int64x2_t v56 = v46;
      uint64_t v47 = v14[4].i64[0];
      v14[4].i64[0] = (uint64_t)v42;
      v57 = (char *)v47;
      uint64_t v55 = v46.i64[0];
      std::__split_buffer<GEORoadEdge * {__strong}>::~__split_buffer((uint64_t)&v55);
    }
    else
    {
      *uint64_t v17 = v15;
      uint64_t v18 = v17 + 1;
    }
    v14[3].i64[1] = (uint64_t)v18;
  }
}

- (void)_findConnections:(id)a3 incoming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke;
  v8[3] = &unk_1E53DB1B0;
  BOOL v10 = v4;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(GEOMapEdgeRoadConnectionFinder *)self _findConnectedEdges:v8 incoming:v4];
}

void __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke(uint64_t a1, id **a2)
{
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  BOOL v4 = *a2;
  id v3 = a2[1];
  BOOL v5 = v3 == *a2;
  void v28[3] = v3 - *a2;
  if (v5)
  {
    [*(id *)(a1 + 32) complete];
  }
  else
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    do
    {
      id v6 = *v4;
      id v7 = [v6 road];
      double v8 = [v7 feature];
      id v9 = [v8 containingTile];

      uint64_t v23 = 0;
      uint64_t v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_2;
      v20[3] = &unk_1E53DB160;
      v20[4] = *(void *)(a1 + 32);
      id v10 = v6;
      id v21 = v10;
      float v22 = &v23;
      [v9 forEachEdgeInRoad:v7 visitTwice:0 visitor:v20];
      uint64_t v11 = [GEOMapEdgeRoadBuilder alloc];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
      float v13 = [(GEOMapEdgeRoadBuilder *)v11 initWithMap:WeakRetained roadFeature:v7 shouldFlip:*((unsigned __int8 *)v24 + 24)];

      if (!*(void *)(*(void *)(a1 + 32) + 72))
      {
        if (*(unsigned char *)(a1 + 48)) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = 1;
        }
        [(GEOMapEdgeBuilder *)v13 setBuildDirection:v14];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_3;
      v16[3] = &unk_1E53DB188;
      uint64_t v18 = v27;
      id v15 = *(id *)(a1 + 40);
      uint64_t v19 = v28;
      v16[4] = *(void *)(a1 + 32);
      id v17 = v15;
      [(GEOMapEdgeBuilder *)v13 buildEdge:v16];
      if (v13 && ![(GEOMapRequest *)v13 isFinished]) {
        [*(id *)(*(void *)(a1 + 32) + 56) addObject:v13];
      }

      _Block_object_dispose(&v23, 8);
      ++v4;
    }
    while (v4 != v3);
    _Block_object_dispose(v27, 8);
  }
  _Block_object_dispose(v28, 8);
}

void __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  GEORoadEdgeFlip(v3);
  if ([*(id *)(a1 + 32) _isRoadEdgeEqual:*(void *)(a1 + 40) other:v3]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __60__GEOMapEdgeRoadConnectionFinder__findConnections_incoming___block_invoke_3(uint64_t a1, uint64_t *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v5 = *a2;
  id v6 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v3 + 16))(v3, &v5);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 24))
    objc_msgSend(*(id *)(a1 + 32), "complete", v5);
}

- (BOOL)_isRoadEdgeEqual:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 road];
  double v8 = [v7 feature];
  id v9 = [v8 containingTile];
  uint64_t v10 = [v9 tileKey];
  *(void *)char v26 = *(void *)v10;
  *(_DWORD *)&v26[7] = *(_DWORD *)(v10 + 7);

  uint64_t v11 = [v6 road];
  char v12 = [v11 feature];
  float v13 = [v12 containingTile];
  uint64_t v14 = [v13 tileKey];
  *(void *)uint64_t v25 = *(void *)v14;
  *(_DWORD *)&v25[7] = *(_DWORD *)(v14 + 7);

  uint64_t v15 = [v5 junctionIndexA];
  if (v15 == [v6 junctionIndexA]
    && (uint64_t v16 = [v5 junctionIndexB], v16 == objc_msgSend(v6, "junctionIndexB"))
    && (uint64_t v17 = [v5 vertexIndexA], v17 == objc_msgSend(v6, "vertexIndexA"))
    && (uint64_t v18 = [v5 vertexIndexB], v18 == objc_msgSend(v6, "vertexIndexB")))
  {
    uint64_t v19 = [v5 road];
    uint64_t v20 = [v19 sectionOffset];
    id v21 = [v6 road];
    BOOL v23 = v20 == [v21 sectionOffset]
       && *(void *)v26 == *(void *)v25
       && *(void *)&v26[3] == *(void *)&v25[3];
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

@end