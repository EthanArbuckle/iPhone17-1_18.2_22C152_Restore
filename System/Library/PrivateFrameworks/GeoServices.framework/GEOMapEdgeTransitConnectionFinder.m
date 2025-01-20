@interface GEOMapEdgeTransitConnectionFinder
- (void)_findConnectedEdges:(id)a3 incoming:(BOOL)a4;
- (void)_findConnections:(id)a3 incoming:(BOOL)a4;
@end

@implementation GEOMapEdgeTransitConnectionFinder

- (void)_findConnectedEdges:(id)a3 incoming:(BOOL)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x4812000000;
  v37[3] = __Block_byref_object_copy__58;
  v37[4] = __Block_byref_object_dispose__58;
  v37[5] = "";
  v39 = 0;
  int64x2_t v38 = 0uLL;
  junction = self->super._junction;
  unint64_t v8 = 2 * junction->var0;
  if (v8)
  {
    v42 = (uint64_t (*)())&v39;
    v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<geo::TransitEdgePiece>>(v8);
    uint64_t v11 = v38.i64[1];
    uint64_t v12 = v38.i64[0];
    if (v38.i64[1] == v38.i64[0])
    {
      int64x2_t v16 = vdupq_n_s64(v38.u64[1]);
      v13 = v9;
    }
    else
    {
      v13 = v9;
      do
      {
        uint64_t v14 = *(void *)(v11 - 32);
        v11 -= 32;
        *(void *)uint64_t v11 = 0;
        *((void *)v13 - 4) = v14;
        v13 -= 32;
        *((void *)v13 + 1) = *(void *)(v11 + 8);
        uint64_t v15 = *(void *)(v11 + 16);
        *(void *)(v11 + 16) = 0;
        *((void *)v13 + 2) = v15;
        LODWORD(v15) = *(_DWORD *)(v11 + 24);
        v13[28] = *(unsigned char *)(v11 + 28);
        *((_DWORD *)v13 + 6) = v15;
      }
      while (v11 != v12);
      int64x2_t v16 = v38;
    }
    v38.i64[0] = (uint64_t)v13;
    v38.i64[1] = (uint64_t)v9;
    *(int64x2_t *)&v40[8] = v16;
    v17 = v39;
    v39 = (__n128 (*)(__n128 *, __n128 *))&v9[32 * v10];
    v41 = v17;
    *(void *)v40 = v16.i64[0];
    std::__split_buffer<geo::TransitEdgePiece>::~__split_buffer((uint64_t)v40);
    junction = self->super._junction;
  }
  tile = self->super._tile;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke;
  v35[3] = &unk_1E53E64B0;
  BOOL v36 = a4;
  v35[4] = self;
  v35[5] = v37;
  [(GEOVectorTile *)tile forEachTransitLinkOnJunction:junction visitor:v35];
  v19 = [(GEOVectorTile *)self->super._tile tileKey];
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *(void *)v19 << 32;
  unint64_t v22 = BYTE4(*(void *)v19) | ((((*(void *)v19 >> 40) | (*((unsigned __int16 *)v19 + 4) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned __int16 *)v19 + 4) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned char *)v19 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*((unsigned char *)v19 + 10) >> 4) << 52);
  *(void *)&v40[1] = v21 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v19 >> 8) & 0x3F) << 40);
  v40[0] = v20;
  *((void *)&v23 + 1) = v22;
  *(void *)&long long v23 = v21;
  v46[0] = *(void *)v40;
  v46[1] = v23 >> 56;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._map);
  +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", WeakRetained, self->super._coordinate.latitude, self->super._coordinate.longitude, 5.0);
  v25 = (GEOMapTileFinder *)objc_claimAutoreleasedReturnValue();
  tileFinder = self->super._tileFinder;
  self->super._tileFinder = v25;

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3;
  v32[3] = &unk_1E53DB0C0;
  id v27 = v6;
  id v33 = v27;
  v34 = v37;
  [(GEOMapRequest *)self->super._tileFinder setCompletionHandler:v32];
  *(void *)v40 = 0;
  *(void *)&v40[8] = v40;
  *(void *)&v40[16] = 0x4012000000;
  v41 = __Block_byref_object_copy__3_0;
  v42 = __Block_byref_object_dispose__4_0;
  v43 = "";
  double v44 = GEOTilePointForCoordinate(self->super._coordinate.latitude, self->super._coordinate.longitude, 20.0);
  uint64_t v45 = v28;
  v29 = self->super._tileFinder;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_6;
  v30[3] = &unk_1E53E64D8;
  BOOL v31 = a4;
  v30[4] = self;
  v30[5] = v40;
  v30[6] = v37;
  [(GEOMapTileFinder *)v29 findTiles:v30 excludingKey:v46];
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v37, 8);
  *(void *)v40 = &v38;
  std::vector<geo::TransitEdgePiece>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
}

void __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_5;
  }
  if ([v3 fromJunction] == *(void *)(*(void *)(a1 + 32) + 72))
  {
    BOOL v5 = 1;
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v5 = 0;
  }
  else {
LABEL_5:
  }
    BOOL v5 = [v4 toJunction] == *(void *)(*(void *)(a1 + 32) + 72);
LABEL_7:
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2;
  v6[3] = &unk_1E53E6488;
  BOOL v7 = v5;
  v6[4] = *(void *)(a1 + 40);
  geo::TransitEdgePiece::findPiecesForLink(v4, v6);
}

uint64_t __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 40))
  {
    if (!*(unsigned char *)(a2 + 28)) {
      return result;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return result;
  }
  v2 = *(uint64_t **)(*(void *)(result + 32) + 8);
  id v3 = v2 + 6;
  unint64_t v4 = v2[7];
  if (v4 >= v2[8])
  {
    result = std::vector<geo::TransitEdgePiece>::__push_back_slow_path<geo::TransitEdgePiece const&>(v3, a2);
  }
  else
  {
    std::vector<geo::TransitEdgePiece>::__construct_one_at_end[abi:ne180100]<geo::TransitEdgePiece const&>((uint64_t)v3, a2);
    result = v4 + 32;
  }
  v2[7] = result;
  return result;
}

uint64_t __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8) + 48);
}

void __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_6(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 tileKey];
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *(void *)v3 << 32;
  unint64_t v6 = BYTE4(*(void *)v3) | ((((*(void *)v3 >> 40) | (*(unsigned __int16 *)(v3 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v3 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v3 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v3 + 10) >> 4) << 52);
  *(void *)((char *)v32 + 1) = v5 & 0xFFFFC00000000000 | ((unint64_t)((*(void *)v3 >> 8) & 0x3F) << 40);
  LOBYTE(v32[0]) = v4;
  *((void *)&v7 + 1) = v6;
  *(void *)&long long v7 = v5;
  v31[0] = v32[0];
  v31[1] = v7 >> 56;
  double v8 = GEOMapRectForGEOTileKey((uint64_t)v31);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  *(float *)&double v8 = (*(double *)(v9 + 48) - v8) / v10;
  *(float *)&double v11 = (v12 - (*(double *)(v9 + 56) - v11)) / v12;
  v32[0] = __PAIR64__(LODWORD(v11), LODWORD(v8));
  v13 = *(uint64_t **)([v2 transitVertices] + 32);
  uint64_t v14 = *(void *)([v2 transitVertices] + 8);
  uint64_t v15 = *v13;
  uint64_t v16 = [v2 transitPointsOnRoad];
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  uint64_t v19 = v14 + 8 * v15;
  v26 = v29;
  while (v18 < objc_msgSend(v2, "junctionsCount", v26))
  {
    uint64_t v20 = [v2 junctions] + v17;
    uint64_t v21 = *(unsigned int *)(v20 + 4);
    unint64_t v22 = [v2 lines];
    long long v23 = [v22 objectAtIndex:*(unsigned int *)(v16 + 16 * v21 + 4)];

    uint64_t v24 = [v23 sectionOffset];
    if (*(void *)(v19
                   + 8
                   * (v13[2 * v24 + 2 * *(unsigned int *)(v16 + 16 * v21 + 8)] + *(unsigned int *)(v16 + 16 * v21 + 12))) == v32[0])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v29[0] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2_7;
      v29[1] = &unk_1E53E64B0;
      char v30 = *(unsigned char *)(a1 + 56);
      uint64_t v25 = *(void *)(a1 + 48);
      v29[2] = *(void *)(a1 + 32);
      v29[3] = v25;
      [v2 forEachTransitLinkOnJunction:v20 visitor:v28];
    }

    ++v18;
    v17 += 32;
  }
}

void __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_2_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_5;
  }
  if ([v3 fromJunction] == *(void *)(*(void *)(a1 + 32) + 72))
  {
    BOOL v5 = 1;
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v5 = 0;
  }
  else {
LABEL_5:
  }
    BOOL v5 = [v4 toJunction] == *(void *)(*(void *)(a1 + 32) + 72);
LABEL_7:
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3_8;
  v6[3] = &unk_1E53E6488;
  BOOL v7 = v5;
  v6[4] = *(void *)(a1 + 40);
  geo::TransitEdgePiece::findPiecesForLink(v4, v6);
}

uint64_t __66__GEOMapEdgeTransitConnectionFinder__findConnectedEdges_incoming___block_invoke_3_8(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 40))
  {
    if (!*(unsigned char *)(a2 + 28)) {
      return result;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return result;
  }
  id v2 = *(uint64_t **)(*(void *)(result + 32) + 8);
  id v3 = v2 + 6;
  unint64_t v4 = v2[7];
  if (v4 >= v2[8])
  {
    result = std::vector<geo::TransitEdgePiece>::__push_back_slow_path<geo::TransitEdgePiece const&>(v3, a2);
  }
  else
  {
    std::vector<geo::TransitEdgePiece>::__construct_one_at_end[abi:ne180100]<geo::TransitEdgePiece const&>((uint64_t)v3, a2);
    result = v4 + 32;
  }
  v2[7] = result;
  return result;
}

- (void)_findConnections:(id)a3 incoming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke;
  v8[3] = &unk_1E53E6500;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(GEOMapEdgeTransitConnectionFinder *)self _findConnectedEdges:v8 incoming:v4];
}

void __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke(uint64_t a1, uint64_t *a2)
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  BOOL v5 = v4 == *a2;
  v14[3] = (v4 - *a2) >> 5;
  if (v5)
  {
    [*(id *)(a1 + 32) complete];
  }
  else
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    do
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke_2;
      v9[3] = &unk_1E53DB188;
      double v11 = v13;
      id v7 = *(id *)(a1 + 40);
      double v12 = v14;
      v9[4] = *(void *)(a1 + 32);
      id v10 = v7;
      double v8 = [WeakRetained buildMapEdgeTransitFrom:v3 edgeHandler:v9];

      if (v8) {
        [*(id *)(*(void *)(a1 + 32) + 56) addObject:v8];
      }

      v3 += 32;
    }
    while (v3 != v4);
    _Block_object_dispose(v13, 8);
  }
  _Block_object_dispose(v14, 8);
}

void __63__GEOMapEdgeTransitConnectionFinder__findConnections_incoming___block_invoke_2(uint64_t a1, uint64_t *a2)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (std::__shared_weak_count *)a2[1];
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

@end