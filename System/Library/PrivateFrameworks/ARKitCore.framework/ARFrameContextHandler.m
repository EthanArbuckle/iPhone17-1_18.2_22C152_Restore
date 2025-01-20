@interface ARFrameContextHandler
- (ARFrameContextHandler)init;
- (BOOL)sessionTransformUpdated;
- (NSArray)anchorsToAdd;
- (__n128)sessionTransform;
- (__n128)setSessionTransform:(__n128)a3;
- (id)createdContextByConsumingPendingChanges;
- (void)addAnchor:(id)a3;
- (void)addCollaborationData:(id)a3;
- (void)clearAddedAnchors;
- (void)clearInFlightContextsReapplyingChanges;
- (void)markFrameContextProcessed:(id)a3;
- (void)removeAnchor:(id)a3;
- (void)resetSessionTransform;
- (void)stopTrackingAnchors:(id)a3;
@end

@implementation ARFrameContextHandler

- (ARFrameContextHandler)init
{
  v14.receiver = self;
  v14.super_class = (Class)ARFrameContextHandler;
  v2 = [(ARFrameContextHandler *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    inFlightContexts = v2->_inFlightContexts;
    v2->_inFlightContexts = (NSMutableOrderedSet *)v3;

    uint64_t v5 = objc_opt_new();
    anchorsToAdd = v2->_anchorsToAdd;
    v2->_anchorsToAdd = (NSMutableOrderedSet *)v5;

    uint64_t v7 = objc_opt_new();
    anchorsToRemove = v2->_anchorsToRemove;
    v2->_anchorsToRemove = (NSMutableOrderedSet *)v7;

    uint64_t v9 = objc_opt_new();
    anchorsToStopTracking = v2->_anchorsToStopTracking;
    v2->_anchorsToStopTracking = (NSMutableOrderedSet *)v9;

    uint64_t v11 = objc_opt_new();
    collaborationDatas = v2->_collaborationDatas;
    v2->_collaborationDatas = (NSMutableSet *)v11;
  }
  return v2;
}

- (__n128)setSessionTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  result[3].n128_u8[0] = 0;
  result[4].n128_u8[0] = 1;
  return result;
}

- (void)resetSessionTransform
{
  uint64_t v2 = MEMORY[0x1E4F149A0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x1E4F149A0];
  *(_OWORD *)&self[1]._mostRecentInFlightContext = v3;
  long long v4 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)&self[1]._anchorsToRemove = *(_OWORD *)(v2 + 32);
  *(_OWORD *)&self[1]._sessionTransformReset = v4;
  self->_sessionTransformReset = 1;
  self->_sessionTransformUpdated = 1;
}

- (NSArray)anchorsToAdd
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_anchorsToAdd array];
}

- (void)addAnchor:(id)a3
{
}

- (void)clearAddedAnchors
{
}

- (void)removeAnchor:(id)a3
{
  anchorsToAdd = self->_anchorsToAdd;
  id v5 = a3;
  [(NSMutableOrderedSet *)anchorsToAdd removeObject:v5];
  [(NSMutableOrderedSet *)self->_anchorsToRemove addObject:v5];
}

- (void)stopTrackingAnchors:(id)a3
{
}

- (void)addCollaborationData:(id)a3
{
}

- (id)createdContextByConsumingPendingChanges
{
  long long v3 = objc_opt_new();
  if ([(NSMutableOrderedSet *)self->_anchorsToAdd count])
  {
    long long v4 = [(NSMutableOrderedSet *)self->_anchorsToAdd array];
    [v3 setAnchorsToAdd:v4];
  }
  else
  {
    [v3 setAnchorsToAdd:0];
  }
  if ([(NSMutableOrderedSet *)self->_anchorsToRemove count])
  {
    id v5 = [(NSMutableOrderedSet *)self->_anchorsToRemove array];
    [v3 setAnchorsToRemove:v5];
  }
  else
  {
    [v3 setAnchorsToRemove:0];
  }
  if ([(NSMutableOrderedSet *)self->_anchorsToStopTracking count])
  {
    v6 = [(NSMutableOrderedSet *)self->_anchorsToStopTracking array];
    [v3 setAnchorsToStopTracking:v6];
  }
  else
  {
    [v3 setAnchorsToStopTracking:0];
  }
  objc_msgSend(v3, "setSessionTransform:", *(double *)&self[1].super.isa, *(double *)&self[1]._mostRecentInFlightContext, *(double *)&self[1]._anchorsToRemove, *(double *)&self[1]._sessionTransformReset);
  [v3 setSessionTransformUpdated:self->_sessionTransformUpdated];
  [v3 setSessionTransformReset:self->_sessionTransformReset];
  [v3 setCollaborationData:self->_collaborationDatas];
  [(NSMutableOrderedSet *)self->_anchorsToAdd removeAllObjects];
  [(NSMutableOrderedSet *)self->_anchorsToRemove removeAllObjects];
  [(NSMutableOrderedSet *)self->_anchorsToStopTracking removeAllObjects];
  self->_sessionTransformUpdated = 0;
  self->_sessionTransformReset = 0;
  [(NSMutableSet *)self->_collaborationDatas removeAllObjects];
  [(NSMutableOrderedSet *)self->_inFlightContexts addObject:v3];
  objc_storeStrong((id *)&self->_mostRecentInFlightContext, v3);
  return v3;
}

- (void)markFrameContextProcessed:(id)a3
{
  id v5 = a3;
  if (-[ARFrameContext isEqual:](self->_mostRecentInFlightContext, "isEqual:"))
  {
    mostRecentInFlightContext = self->_mostRecentInFlightContext;
    self->_mostRecentInFlightContext = 0;
  }
  [(NSMutableOrderedSet *)self->_inFlightContexts removeObject:v5];
}

- (void)clearInFlightContextsReapplyingChanges
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  mostRecentInFlightContext = self->_mostRecentInFlightContext;
  if (mostRecentInFlightContext)
  {
    if (!self->_sessionTransformUpdated)
    {
      self->_sessionTransformReset = [(ARFrameContext *)mostRecentInFlightContext sessionTransformReset];
      self->_sessionTransformUpdated = [(ARFrameContext *)self->_mostRecentInFlightContext sessionTransformUpdated];
      [(ARFrameContext *)self->_mostRecentInFlightContext sessionTransform];
      *(_OWORD *)&self[1].super.isa = v4;
      *(_OWORD *)&self[1]._mostRecentInFlightContext = v5;
      *(_OWORD *)&self[1]._anchorsToRemove = v6;
      *(_OWORD *)&self[1]._sessionTransformReset = v7;
      mostRecentInFlightContext = self->_mostRecentInFlightContext;
    }
    self->_mostRecentInFlightContext = 0;
  }
  if ([(NSMutableOrderedSet *)self->_inFlightContexts count])
  {
    v8 = (NSMutableOrderedSet *)objc_opt_new();
    uint64_t v9 = (NSMutableOrderedSet *)objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = self->_inFlightContexts;
    uint64_t v47 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v69 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v12 = [v11 anchorsToAdd];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v76 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v65;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v65 != v15) {
                  objc_enumerationMutation(v12);
                }
                [(NSMutableOrderedSet *)v8 addObject:*(void *)(*((void *)&v64 + 1) + 8 * j)];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v76 count:16];
            }
            while (v14);
          }

          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          v17 = [v11 anchorsToRemove];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v60 objects:v75 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v61;
            do
            {
              for (uint64_t k = 0; k != v19; ++k)
              {
                if (*(void *)v61 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v60 + 1) + 8 * k);
                [(NSMutableOrderedSet *)v8 removeObject:v22];
                [(NSMutableOrderedSet *)v9 addObject:v22];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v60 objects:v75 count:16];
            }
            while (v19);
          }

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          v23 = [v11 anchorsToStopTracking];
          uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v74 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v57;
            do
            {
              for (uint64_t m = 0; m != v25; ++m)
              {
                if (*(void *)v57 != v26) {
                  objc_enumerationMutation(v23);
                }
                [(NSMutableOrderedSet *)self->_anchorsToStopTracking addObject:*(void *)(*((void *)&v56 + 1) + 8 * m)];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v74 count:16];
            }
            while (v25);
          }

          collaborationDatas = self->_collaborationDatas;
          v29 = [v11 collaborationData];
          [(NSMutableSet *)collaborationDatas unionSet:v29];
        }
        uint64_t v47 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v47);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v30 = self->_anchorsToAdd;
    uint64_t v31 = [(NSMutableOrderedSet *)v30 countByEnumeratingWithState:&v52 objects:v73 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v53;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(v30);
          }
          [(NSMutableOrderedSet *)v8 addObject:*(void *)(*((void *)&v52 + 1) + 8 * n)];
        }
        uint64_t v32 = [(NSMutableOrderedSet *)v30 countByEnumeratingWithState:&v52 objects:v73 count:16];
      }
      while (v32);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v35 = self->_anchorsToRemove;
    uint64_t v36 = [(NSMutableOrderedSet *)v35 countByEnumeratingWithState:&v48 objects:v72 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v49;
      do
      {
        for (iuint64_t i = 0; ii != v37; ++ii)
        {
          if (*(void *)v49 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v48 + 1) + 8 * ii);
          [(NSMutableOrderedSet *)v8 removeObject:v40];
          [(NSMutableOrderedSet *)v9 addObject:v40];
        }
        uint64_t v37 = [(NSMutableOrderedSet *)v35 countByEnumeratingWithState:&v48 objects:v72 count:16];
      }
      while (v37);
    }

    anchorsToAdd = self->_anchorsToAdd;
    self->_anchorsToAdd = v8;
    v42 = v8;

    anchorsToRemove = self->_anchorsToRemove;
    self->_anchorsToRemove = v9;
    v44 = v9;

    [(NSMutableOrderedSet *)self->_inFlightContexts removeAllObjects];
  }
}

- (__n128)sessionTransform
{
  return a1[5];
}

- (BOOL)sessionTransformUpdated
{
  return self->_sessionTransformUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationDatas, 0);
  objc_storeStrong((id *)&self->_anchorsToStopTracking, 0);
  objc_storeStrong((id *)&self->_anchorsToRemove, 0);
  objc_storeStrong((id *)&self->_anchorsToAdd, 0);
  objc_storeStrong((id *)&self->_mostRecentInFlightContext, 0);
  objc_storeStrong((id *)&self->_inFlightContexts, 0);
}

@end