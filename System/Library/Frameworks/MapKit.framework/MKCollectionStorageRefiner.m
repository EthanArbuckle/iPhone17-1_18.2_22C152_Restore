@interface MKCollectionStorageRefiner
- (MKCollectionStorageRefiner)initWithCollectionStorage:(id)a3;
- (MKCollectionStorageRefiner)initWithCollectionURL:(id)a3;
- (void)_sharedInitWithCollectionStorage:(id)a3;
- (void)fetchMapItems:(id)a3;
- (void)fetchMapItems:(id)a3 traits:(id)a4;
@end

@implementation MKCollectionStorageRefiner

- (MKCollectionStorageRefiner)initWithCollectionURL:(id)a3
{
  id v4 = a3;
  v5 = [[_MKURLParser alloc] initWithURL:v4];

  [(_MKURLParser *)v5 parseIncludingCustomParameters:1];
  v6 = [(_MKURLParser *)v5 collectionStorage];

  if (v6)
  {
    v10.receiver = self;
    v10.super_class = (Class)MKCollectionStorageRefiner;
    v7 = [(MKCollectionStorageRefiner *)&v10 init];
    if (v7)
    {
      v8 = [(_MKURLParser *)v5 collectionStorage];
      [(MKCollectionStorageRefiner *)v7 _sharedInitWithCollectionStorage:v8];
    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (MKCollectionStorageRefiner)initWithCollectionStorage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKCollectionStorageRefiner;
  v5 = [(MKCollectionStorageRefiner *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MKCollectionStorageRefiner *)v5 _sharedInitWithCollectionStorage:v4];
  }

  return v6;
}

- (void)_sharedInitWithCollectionStorage:(id)a3
{
  self->_lock._os_unfair_lock_opaque = 0;
  id v4 = (GEOURLCollectionStorage *)[a3 copy];
  collectionStorage = self->_collectionStorage;
  self->_collectionStorage = v4;
}

- (void)fetchMapItems:(id)a3
{
}

- (void)fetchMapItems:(id)a3 traits:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v43 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v44 = self;
  v7 = [(GEOURLCollectionStorage *)self->_collectionStorage places];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F646B8]), "initWithMUID:coordinate:", objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "muid"), -180.0, -180.0);
        v13 = [[MKMapItemIdentifier alloc] initWithGEOMapItemIdentifier:v12];
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v9);
  }

  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [MEMORY[0x1E4F1CA48] array];
  group = dispatch_group_create();
  v16 = [MEMORY[0x1E4F1CA48] array];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v17 = [(GEOURLCollectionStorage *)v44->_collectionStorage places];
  uint64_t v46 = [v17 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v46)
  {
    uint64_t v18 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v62 != v18) {
          objc_enumerationMutation(v17);
        }
        v20 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        if ([v20 hasMuid])
        {
          v21 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([MKMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", [v20 muid], objc_msgSend(v20, "providerId"), -180.0, -180.0);
          [v16 addObject:v21];
        }
        else
        {
          if (![v20 hasCoordinate]) {
            continue;
          }
          v45 = [v20 name];
          v60.latitude = 0.0;
          v60.longitude = 0.0;
          v22 = [v20 coordinate];
          [v22 lat];
          CLLocationDegrees v24 = v23;
          [v20 coordinate];
          uint64_t v25 = v18;
          v26 = v17;
          v27 = v14;
          v28 = v15;
          id v29 = v6;
          v31 = v30 = v16;
          [v31 lng];
          CLLocationCoordinate2D v60 = CLLocationCoordinate2DMake(v24, v32);

          v33 = +[MKMapService sharedService];
          v34 = [v20 address];
          v21 = [v33 ticketForPlaceRefinementRequestWithCoordinate:&v60 addressLine:v34 placeName:0 traits:v43];

          v16 = v30;
          id v6 = v29;
          v15 = v28;
          v14 = v27;
          v17 = v26;
          uint64_t v18 = v25;

          dispatch_group_enter(group);
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke;
          v55[3] = &unk_1E54B8FF0;
          v55[4] = v44;
          id v56 = v45;
          id v57 = v14;
          id v58 = v15;
          v59 = group;
          id v35 = v45;
          [(MKMapItemIdentifier *)v21 submitWithHandler:v55 networkActivity:0];
        }
      }
      uint64_t v46 = [v17 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v46);
  }

  if ([v16 count])
  {
    v36 = +[MKMapService sharedService];
    v37 = [v36 ticketForIdentifiers:v16 traits:v43];

    dispatch_group_enter(group);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_2;
    v51[3] = &unk_1E54B9018;
    v51[4] = v44;
    id v52 = v14;
    id v53 = v15;
    v54 = group;
    [v37 submitWithHandler:v51 networkActivity:0];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_3;
  block[3] = &unk_1E54B8338;
  id v49 = v14;
  id v50 = v41;
  id v48 = v15;
  id v38 = v14;
  id v39 = v41;
  id v40 = v15;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
}

void __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v5)
  {
    [*(id *)(a1 + 56) addObject:v5];
  }
  else if ([v8 count])
  {
    id v6 = [v8 firstObject];
    v7 = v6;
    if (*(void *)(a1 + 40)) {
      objc_msgSend(v6, "setName:");
    }
    [*(id *)(a1 + 48) addObject:v7];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v5) {
    [*(id *)(a1 + 48) addObject:v5];
  }
  else {
    [*(id *)(a1 + 40) addObjectsFromArray:v6];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __51__MKCollectionStorageRefiner_fetchMapItems_traits___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = (id)[*(id *)(a1 + 40) copy];
  if (v2)
  {
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v5, v4);
  }
  else
  {
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v5, 0);
  }
}

- (void).cxx_destruct
{
}

@end