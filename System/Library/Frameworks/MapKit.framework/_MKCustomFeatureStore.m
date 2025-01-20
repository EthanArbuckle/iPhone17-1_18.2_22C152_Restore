@interface _MKCustomFeatureStore
- (BOOL)isClusteringEnabled;
- (GEOFeatureStyleAttributes)clusterStyleAttributes;
- (MKCustomFeatureStoreDelegate)delegate;
- (_MKCustomFeatureStore)init;
- (_MKCustomFeatureStore)initWithClustering:(BOOL)a3;
- (id)allAnnotations;
- (id)annotationsInMapRect:(id)a3;
- (id)globalAnnotations;
- (unint64_t)annotationCount;
- (unsigned)sceneID;
- (unsigned)sceneState;
- (void)_clearGlobalAnnotations;
- (void)_clearTileAnnotations;
- (void)_invalidateGlobalAnnotations;
- (void)_invalidateRect:(id)a3;
- (void)_setSceneState:(unsigned __int8)a3;
- (void)addAnnotations:(id)a3;
- (void)addObserver:(id)a3;
- (void)getClusterAnnotationTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5;
- (void)getClusterImageTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5;
- (void)hideScene;
- (void)removeAnnotations:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setClusterAnnotationText:(id)a3 locale:(id)a4;
- (void)setClusterStyleAttributes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSceneID:(unsigned __int8)a3;
- (void)showScene;
@end

@implementation _MKCustomFeatureStore

- (void)removeAnnotations:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v48 = 0;
  id v49 = 0;
  id v34 = a3;
  PartitionAnnotations(v34, &v49, &v48);
  id v4 = v49;
  id v35 = v48;
  v36 = v4;
  if ([v4 count])
  {
    v45 = 0;
    v46 = 0;
    unint64_t v47 = 0;
    std::vector<GEOPosition2d>::reserve((void **)&v45, [v4 count]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v42 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          [v9 coordinate];
          if (v11 >= -180.0
            && v11 <= 180.0
            && v10 >= -90.0
            && v10 <= 90.0
            && [(MKQuadTrie *)self->_annotationsTrie contains:v9])
          {
            v12 = [v9 feature];
            [v12 setDataSource:0];

            [v9 coordinate];
            GEOMapPointForCoordinate();
            uint64_t v15 = v13;
            uint64_t v16 = v14;
            v17 = v46;
            if ((unint64_t)v46 >= v47)
            {
              v19 = v45;
              uint64_t v20 = ((char *)v46 - (char *)v45) >> 4;
              unint64_t v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 60) {
                std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v22 = v47 - (void)v45;
              if ((uint64_t)(v47 - (void)v45) >> 3 > v21) {
                unint64_t v21 = v22 >> 3;
              }
              if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v23 = v21;
              }
              if (v23) {
                unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v23);
              }
              else {
                uint64_t v24 = 0;
              }
              v25 = (void *)(v23 + 16 * v20);
              void *v25 = v15;
              v25[1] = v16;
              v26 = (char *)v25;
              if (v17 != v19)
              {
                do
                {
                  *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
                  v26 -= 16;
                  v17 -= 2;
                }
                while (v17 != v19);
                v17 = v45;
              }
              v18 = v25 + 2;
              v45 = v26;
              unint64_t v47 = v23 + 16 * v24;
              if (v17) {
                operator delete(v17);
              }
            }
            else
            {
              void *v46 = v13;
              v17[1] = v14;
              v18 = v17 + 2;
            }
            v46 = v18;
            [(MKQuadTrie *)self->_annotationsTrie remove:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v6);
    }

    v27 = v45;
    if (v45 != v46)
    {
      GEOMapRectBoundingMapPoints();
      -[_MKCustomFeatureStore _invalidateRect:](self, "_invalidateRect:");
    }
    if (v27) {
      operator delete(v27);
    }
  }
  if ([v35 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v35;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v28);
          }
          id v32 = *(id *)(*((void *)&v37 + 1) + 8 * j);
          v33 = [v32 feature];
          [v33 setDataSource:0];

          [(NSMutableSet *)self->_globalAnnotations removeObject:v32];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v29);
    }

    [(_MKCustomFeatureStore *)self _invalidateGlobalAnnotations];
  }
}

- (void)addAnnotations:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v48 = 0;
  id v49 = 0;
  id v34 = a3;
  PartitionAnnotations(v34, &v49, &v48);
  id v4 = v49;
  id v35 = v48;
  v36 = v4;
  if ([v4 count])
  {
    v45 = 0;
    v46 = 0;
    unint64_t v47 = 0;
    std::vector<GEOPosition2d>::reserve((void **)&v45, [v34 count]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v42 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          [v9 coordinate];
          if (v11 >= -180.0
            && v11 <= 180.0
            && v10 >= -90.0
            && v10 <= 90.0
            && ![(MKQuadTrie *)self->_annotationsTrie contains:v9])
          {
            v12 = [v9 feature];
            [v12 setDataSource:self];

            [v9 coordinate];
            GEOMapPointForCoordinate();
            uint64_t v15 = v13;
            uint64_t v16 = v14;
            v17 = v46;
            if ((unint64_t)v46 >= v47)
            {
              v19 = v45;
              uint64_t v20 = ((char *)v46 - (char *)v45) >> 4;
              unint64_t v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 60) {
                std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v22 = v47 - (void)v45;
              if ((uint64_t)(v47 - (void)v45) >> 3 > v21) {
                unint64_t v21 = v22 >> 3;
              }
              if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v23 = v21;
              }
              if (v23) {
                unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v23);
              }
              else {
                uint64_t v24 = 0;
              }
              v25 = (void *)(v23 + 16 * v20);
              void *v25 = v15;
              v25[1] = v16;
              v26 = (char *)v25;
              if (v17 != v19)
              {
                do
                {
                  *((_OWORD *)v26 - 1) = *((_OWORD *)v17 - 1);
                  v26 -= 16;
                  v17 -= 2;
                }
                while (v17 != v19);
                v17 = v45;
              }
              v18 = v25 + 2;
              v45 = v26;
              unint64_t v47 = v23 + 16 * v24;
              if (v17) {
                operator delete(v17);
              }
            }
            else
            {
              void *v46 = v13;
              v17[1] = v14;
              v18 = v17 + 2;
            }
            v46 = v18;
            [(MKQuadTrie *)self->_annotationsTrie insert:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v6);
    }

    v27 = v45;
    if (v45 != v46)
    {
      GEOMapRectBoundingMapPoints();
      -[_MKCustomFeatureStore _invalidateRect:](self, "_invalidateRect:");
    }
    if (v27) {
      operator delete(v27);
    }
  }
  if ([v35 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v35;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v28);
          }
          id v32 = *(id *)(*((void *)&v37 + 1) + 8 * j);
          v33 = [v32 feature];
          [v33 setDataSource:self];

          [(NSMutableSet *)self->_globalAnnotations addObject:v32];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v29);
    }

    [(_MKCustomFeatureStore *)self _invalidateGlobalAnnotations];
  }
}

- (void)_invalidateRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "dataSource:featuresDidChangeForRect:", self, v6, v5, var0, var1, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unsigned)sceneState
{
  return self->_sceneState;
}

- (unsigned)sceneID
{
  return self->_sceneID;
}

- (BOOL)isClusteringEnabled
{
  return self->_isClusteringEnabled;
}

- (id)allAnnotations
{
  v3 = [(MKQuadTrie *)self->_annotationsTrie allItems];
  id v4 = [(NSMutableSet *)self->_globalAnnotations allObjects];
  double v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)annotationsInMapRect:(id)a3
{
  v3 = -[MKQuadTrie itemsInMapRect:](self->_annotationsTrie, "itemsInMapRect:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  id v4 = [v3 allObjects];

  return v4;
}

- (void)setClusterStyleAttributes:(id)a3
{
}

- (GEOFeatureStyleAttributes)clusterStyleAttributes
{
  return self->_clusterStyleAttributes;
}

- (void)setDelegate:(id)a3
{
}

- (_MKCustomFeatureStore)initWithClustering:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_MKCustomFeatureStore;
  id v4 = [(_MKCustomFeatureStore *)&v11 init];
  double v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_sceneID = 256;
    v4->_isClusteringEnabled = a3;
    double v6 = -[MKQuadTrie initWithInitialRegion:minimumSize:maximumItems:]([MKQuadTrie alloc], "initWithInitialRegion:minimumSize:maximumItems:", 100, 0.0, 0.0, 268435456.0, 268435456.0, 1024.0, 1024.0);
    annotationsTrie = v5->_annotationsTrie;
    v5->_annotationsTrie = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    globalAnnotations = v5->_globalAnnotations;
    v5->_globalAnnotations = v8;
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
    id v4 = v8;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)setClusterAnnotationText:(id)a3 locale:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = (NSString *)[v11 copy];
  annotationText = self->_annotationText;
  self->_annotationText = v7;

  uint64_t v9 = (NSString *)[v6 copy];
  annotationLocale = self->_annotationLocale;
  self->_annotationLocale = v9;
}

- (void)setSceneID:(unsigned __int8)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_sceneID != a3)
  {
    self->_sceneID = a3;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_observers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "dataSource:didChangeSceneID:", self, self->_sceneID, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (_MKCustomFeatureStore)init
{
  return [(_MKCustomFeatureStore *)self initWithClustering:0];
}

- (void)showScene
{
}

- (void)hideScene
{
}

- (void)setAnnotations:(id)a3
{
  id v23 = 0;
  id v24 = 0;
  id v22 = a3;
  PartitionAnnotations(v22, &v24, &v23);
  id v4 = v24;
  id v5 = v23;
  if ([v4 count])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [(MKQuadTrie *)self->_annotationsTrie allItems];
    long long v8 = [v6 setWithArray:v7];

    long long v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    long long v10 = [MEMORY[0x1E4F1CA80] setWithSet:v9];
    [v10 minusSet:v8];
    long long v11 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    [v11 minusSet:v9];
    if ([v11 count])
    {
      uint64_t v12 = [v11 count];
      if (v12 == [v8 count])
      {
        [(_MKCustomFeatureStore *)self _clearTileAnnotations];
      }
      else
      {
        uint64_t v13 = [v11 allObjects];
        [(_MKCustomFeatureStore *)self removeAnnotations:v13];
      }
    }
    if ([v10 count])
    {
      long long v14 = [v10 allObjects];
      [(_MKCustomFeatureStore *)self addAnnotations:v14];
    }
  }
  else
  {
    [(_MKCustomFeatureStore *)self _clearTileAnnotations];
  }
  if ([v5 count])
  {
    long long v15 = self->_globalAnnotations;
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithSet:v16];
    [v17 minusSet:v15];
    v18 = [MEMORY[0x1E4F1CA80] setWithSet:v15];
    [v18 minusSet:v16];
    if ([v18 count])
    {
      uint64_t v19 = [v18 count];
      if (v19 == [(NSMutableSet *)v15 count])
      {
        [(_MKCustomFeatureStore *)self _clearGlobalAnnotations];
      }
      else
      {
        uint64_t v20 = [v18 allObjects];
        [(_MKCustomFeatureStore *)self removeAnnotations:v20];
      }
    }
    if ([v17 count])
    {
      unint64_t v21 = [v17 allObjects];
      [(_MKCustomFeatureStore *)self addAnnotations:v21];
    }
  }
  else
  {
    [(_MKCustomFeatureStore *)self _clearGlobalAnnotations];
  }
}

- (void)_clearTileAnnotations
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x4812000000;
  long long v8 = __Block_byref_object_copy__24;
  long long v9 = __Block_byref_object_dispose__24;
  long long v10 = "";
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  __p = 0;
  annotationsTrie = self->_annotationsTrie;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___MKCustomFeatureStore__clearTileAnnotations__block_invoke;
  v4[3] = &unk_1E54BEDE8;
  v4[4] = &v5;
  [(MKQuadTrie *)annotationsTrie clearAllItemsPerforming:v4];
  if (v6[6] != v6[7])
  {
    GEOMapRectBoundingMapPoints();
    -[_MKCustomFeatureStore _invalidateRect:](self, "_invalidateRect:");
  }
  _Block_object_dispose(&v5, 8);
  if (__p)
  {
    uint64_t v12 = __p;
    operator delete(__p);
  }
}

- (void)_clearGlobalAnnotations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_globalAnnotations count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = self->_globalAnnotations;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "feature", (void)v8);
          [v7 setDataSource:0];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }

    [(NSMutableSet *)self->_globalAnnotations removeAllObjects];
    [(_MKCustomFeatureStore *)self _invalidateGlobalAnnotations];
  }
}

- (unint64_t)annotationCount
{
  unint64_t v3 = [(MKQuadTrie *)self->_annotationsTrie count];
  return [(NSMutableSet *)self->_globalAnnotations count] + v3;
}

- (void)_invalidateGlobalAnnotations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "globalFeaturesDidChangeForDataSource:", self, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_setSceneState:(unsigned __int8)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_sceneState != a3)
  {
    self->_sceneState = a3;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = self->_observers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "dataSource:didChangeSceneState:", self, self->_sceneState, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)removeObserver:(id)a3
{
}

- (id)globalAnnotations
{
  return (id)[(NSMutableSet *)self->_globalAnnotations allObjects];
}

- (void)getClusterImageTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v9 setLocale:v7];

  [v9 setNumberStyle:1];
  long long v8 = [NSNumber numberWithUnsignedInteger:a3];
  *a4 = [v9 stringFromNumber:v8];
}

- (void)getClusterAnnotationTextForClusterFeatureCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  id v9 = self->_annotationText;
  long long v10 = self->_annotationLocale;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v14 = v10;
  long long v15 = v9;
  [WeakRetained customFeatureStore:self annotationTextForClusterFeatureCount:a3 text:&v15 locale:&v14];
  uint64_t v12 = v15;

  uint64_t v13 = v14;
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = v13;
  }
}

- (MKCustomFeatureStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKCustomFeatureStoreDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationLocale, 0);
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_clusterStyleAttributes, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_globalAnnotations, 0);

  objc_storeStrong((id *)&self->_annotationsTrie, 0);
}

@end