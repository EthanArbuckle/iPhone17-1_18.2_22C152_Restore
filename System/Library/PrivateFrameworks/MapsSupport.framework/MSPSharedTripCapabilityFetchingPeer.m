@interface MSPSharedTripCapabilityFetchingPeer
- (NSOrderedSet)requestedHandles;
- (id)_requestedHandles;
- (id)removeRequestedHandles:(id)a3;
- (void)updateRequestedHandles:(id)a3 added:(id *)a4 removed:(id *)a5;
@end

@implementation MSPSharedTripCapabilityFetchingPeer

- (id)_requestedHandles
{
  requestedHandles = self->_requestedHandles;
  if (!requestedHandles)
  {
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v5 = self->_requestedHandles;
    self->_requestedHandles = v4;

    requestedHandles = self->_requestedHandles;
  }

  return requestedHandles;
}

- (NSOrderedSet)requestedHandles
{
  v2 = [(MSPSharedTripCapabilityFetchingPeer *)self _requestedHandles];
  v3 = (void *)[v2 copy];

  return (NSOrderedSet *)v3;
}

- (void)updateRequestedHandles:(id)a3 added:(id *)a4 removed:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count] || self->_requestedHandles)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v8];
    [v9 minusOrderedSet:self->_requestedHandles];
    if (a4) {
      *a4 = (id)[v9 copy];
    }
    v10 = [(NSMutableOrderedSet *)self->_requestedHandles set];
    v11 = (void *)[v10 mutableCopy];

    v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    [v11 minusSet:v12];

    if (a5) {
      *a5 = (id)[v11 copy];
    }
    v13 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138478339;
      id v17 = v8;
      __int16 v18 = 2113;
      v19 = v9;
      __int16 v20 = 2113;
      v21 = v11;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEBUG, "[Peer] Updated contacts: %{private}@\n\tAdded: %{private}@\n\tRemoved: %{private}@", (uint8_t *)&v16, 0x20u);
    }

    v14 = [(MSPSharedTripCapabilityFetchingPeer *)self _requestedHandles];
    [v14 removeAllObjects];

    v15 = [(MSPSharedTripCapabilityFetchingPeer *)self _requestedHandles];
    [v15 addObjectsFromArray:v8];
  }
}

- (id)removeRequestedHandles:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count] || self->_requestedHandles)
  {
    v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    v6 = [(NSMutableOrderedSet *)self->_requestedHandles set];
    v7 = (NSMutableOrderedSet *)[v6 mutableCopy];

    [(NSMutableOrderedSet *)v7 intersectSet:v5];
    [(NSMutableOrderedSet *)self->_requestedHandles minusSet:v7];
    id v8 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138477827;
      v14 = v7;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEBUG, "[Peer] Removing requested contacts %{private}@", (uint8_t *)&v13, 0xCu);
    }

    if ([(NSMutableOrderedSet *)self->_requestedHandles count])
    {
      v9 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        requestedHandles = self->_requestedHandles;
        int v13 = 138477827;
        v14 = requestedHandles;
        _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_DEBUG, "[Peer] Still waiting for %{private}@", (uint8_t *)&v13, 0xCu);
      }
    }
    v11 = (void *)[(NSMutableOrderedSet *)v7 copy];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end