@interface GEOMapAccessTransitHall
- (id)findStation:(id)a3 completionHandler:(id)a4;
- (id)findStops:(id)a3 completionHandler:(id)a4;
- (unint64_t)stationID;
@end

@implementation GEOMapAccessTransitHall

- (unint64_t)stationID
{
  v2 = *(unint64_t **)(*((void *)self->super._node.__ptr_ + 5) + 256);
  if (v2) {
    return *v2;
  }
  else {
    return 0;
  }
}

- (id)findStation:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(void))a3;
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
      goto LABEL_12;
    }
  }
  else
  {
    v10 = *(uint64_t **)(*((void *)self->super._node.__ptr_ + 5) + 256);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        v17 = __57__GEOMapAccessTransitHall_findStation_completionHandler___block_invoke;
        v18 = &unk_1E53DABD8;
        v19 = self;
        v20 = v6;
        v12 = (void *)MEMORY[0x18C120660](&v15);
        map = self->super._map;
        [(GEOMapAccessTransitNodeBase *)self coordinate];
        v9 = -[GEOMapAccess findTransitStationWithID:near:stationHandler:completionHandler:](map, "findTransitStationWithID:near:stationHandler:completionHandler:", v11, v12, v8);

        goto LABEL_12;
      }
    }
    if (v7)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
      v9 = 0;
      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

void __57__GEOMapAccessTransitHall_findStation_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

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
    v16[2] = __55__GEOMapAccessTransitHall_findStops_completionHandler___block_invoke;
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

uint64_t __55__GEOMapAccessTransitHall_findStops_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end