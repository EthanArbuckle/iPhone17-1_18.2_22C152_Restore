@interface GEOMapAccessTransitStation
- (id)findAccessPoints:(id)a3 completionHandler:(id)a4;
- (id)findStops:(id)a3 completionHandler:(id)a4;
@end

@implementation GEOMapAccessTransitStation

- (id)findStops:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    map = self->super._map;
    unint64_t v9 = [(GEOMapAccessTransitNodeBase *)self transitID];
    [(GEOMapAccessTransitNodeBase *)self coordinate];
    double v11 = v10;
    double v13 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__GEOMapAccessTransitStation_findStops_completionHandler___block_invoke;
    v16[3] = &unk_1E53DABB0;
    id v17 = v6;
    v14 = -[GEOMapAccess findTransitPointWithParentID:near:type:pointHandler:completionHandler:](map, "findTransitPointWithParentID:near:type:pointHandler:completionHandler:", v9, 2, v16, v7, v11, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __58__GEOMapAccessTransitStation_findStops_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    map = self->super._map;
    unint64_t v9 = [(GEOMapAccessTransitNodeBase *)self transitID];
    [(GEOMapAccessTransitNodeBase *)self coordinate];
    double v11 = v10;
    double v13 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__GEOMapAccessTransitStation_findAccessPoints_completionHandler___block_invoke;
    v16[3] = &unk_1E53DABB0;
    id v17 = v6;
    v14 = -[GEOMapAccess findTransitPointWithParentID:near:type:pointHandler:completionHandler:](map, "findTransitPointWithParentID:near:type:pointHandler:completionHandler:", v9, 1, v16, v7, v11, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __65__GEOMapAccessTransitStation_findAccessPoints_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end