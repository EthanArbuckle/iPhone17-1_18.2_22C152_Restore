@interface MSPSenderLiveStrategy
+ (BOOL)_supportsEvent:(unint64_t)a3;
+ (double)_etaRefreshIntervalForState:(id)a3;
- (BOOL)_removeAllTokensForParticipant:(id)a3;
- (BOOL)_removeToken:(id)a3;
- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4;
- (MSPSenderLiveStrategy)initWithGroupSession:(id)a3;
- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4;
- (void)_recordTokenForHandle:(id)a3;
- (void)_sendInitialRouteIfNeeded;
- (void)_setState:(id)a3;
- (void)addParticipants:(id)a3;
- (void)didFetchCapabilitiesForParticipants:(id)a3;
- (void)removeParticipants:(id)a3;
@end

@implementation MSPSenderLiveStrategy

- (MSPSenderLiveStrategy)initWithGroupSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MSPSenderLiveStrategy;
  v3 = [(MSPSenderIDSStrategy *)&v9 initWithGroupSession:a3];
  if (v3)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    participantsNeedingRoute = v3->_participantsNeedingRoute;
    v3->_participantsNeedingRoute = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tokensByHandle = v3->_tokensByHandle;
    v3->_tokensByHandle = v6;
  }
  return v3;
}

+ (double)_etaRefreshIntervalForState:(id)a3
{
  GEOConfigGetDouble();
  return result;
}

- (void)addParticipants:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSPSenderLiveStrategy;
  [(MSPSenderIDSStrategy *)&v14 addParticipants:v4];
  [(NSMutableSet *)self->_participantsNeedingRoute addObjectsFromArray:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[MSPSenderLiveStrategy _recordTokenForHandle:](self, "_recordTokenForHandle:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [(MSPSenderLiveStrategy *)self _sendInitialRouteIfNeeded];
}

- (void)_recordTokenForHandle:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)IDSCopyAddressDestinationForDestination();
  unint64_t v6 = (unint64_t)v4;
  unint64_t v7 = v5;
  if (v6 | v7)
  {
    char v8 = [(id)v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = [(NSMutableDictionary *)self->_tokensByHandle objectForKeyedSubscript:v7];
      if (!v9)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [(NSMutableDictionary *)self->_tokensByHandle setObject:v9 forKeyedSubscript:v7];
      }
      long long v10 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        long long v11 = NSString;
        long long v12 = self;
        long long v13 = [v11 stringWithFormat:@"%@<%p>", objc_opt_class(), v12];

        *(_DWORD *)buf = 138543875;
        v15 = v13;
        __int16 v16 = 2113;
        unint64_t v17 = v6;
        __int16 v18 = 2113;
        unint64_t v19 = v7;
        _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_INFO, "[%{public}@] adding token %{private}@ for %{private}@", buf, 0x20u);
      }
      [v9 addObject:v6];
    }
  }
}

- (void)removeParticipants:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MSPSenderLiveStrategy *)self removeParticipant:*(void *)(*((void *)&v9 + 1) + 8 * v8++) forReason:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)removeParticipant:(id)a3 forReason:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSPSenderLiveStrategy;
  unsigned int v7 = [(MSPSenderStrategy *)&v12 removeParticipant:v6 forReason:a4];
  if (v7) {
    [(NSMutableSet *)self->_participantsNeedingRoute removeObject:v6];
  }
  uint64_t v8 = (void *)IDSCopyAddressDestinationForDestination();
  if ([v6 isEqualToString:v8]) {
    BOOL v9 = [(MSPSenderLiveStrategy *)self _removeAllTokensForParticipant:v8];
  }
  else {
    BOOL v9 = [(MSPSenderLiveStrategy *)self _removeToken:v6];
  }
  char v10 = v7 | v9;

  return v10;
}

- (BOOL)_removeToken:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)IDSCopyAddressDestinationForDestination();
  if ([v5 length] && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    unsigned int v7 = [(NSMutableDictionary *)self->_tokensByHandle objectForKeyedSubscript:v5];
    uint64_t v8 = v7;
    if (v7 && [v7 containsObject:v4])
    {
      BOOL v9 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        char v10 = NSString;
        long long v11 = self;
        objc_super v12 = [v10 stringWithFormat:@"%@<%p>", objc_opt_class(), v11];

        *(_DWORD *)buf = 138543875;
        unint64_t v19 = v12;
        __int16 v20 = 2113;
        id v21 = v4;
        __int16 v22 = 2113;
        v23 = v5;
        _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "[%{public}@] removing token %{private}@ for %{private}@", buf, 0x20u);
      }
      [v8 removeObject:v4];
      [(NSMutableSet *)self->_participantsNeedingRoute removeObject:v4];
      if (![v8 count])
      {
        long long v13 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = NSString;
          v15 = self;
          __int16 v16 = [v14 stringWithFormat:@"%@<%p>", objc_opt_class(), v15];

          *(_DWORD *)buf = 138543619;
          unint64_t v19 = v16;
          __int16 v20 = 2113;
          id v21 = v5;
          _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "[%{public}@] clearing token storage for %{private}@", buf, 0x16u);
        }
        [(NSMutableDictionary *)self->_tokensByHandle setObject:0 forKeyedSubscript:v5];
      }
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_removeAllTokensForParticipant:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = (void *)IDSCopyAddressDestinationForDestination();
    if (v5)
    {
      BOOL v6 = [(NSMutableDictionary *)self->_tokensByHandle objectForKeyedSubscript:v5];
      if (v6)
      {
        unsigned int v7 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = NSString;
          BOOL v9 = self;
          char v10 = [v8 stringWithFormat:@"%@<%p>", objc_opt_class(), v9];

          *(_DWORD *)buf = 138543619;
          unint64_t v17 = v10;
          __int16 v18 = 2113;
          id v19 = v5;
          _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "[%{public}@] removing all tokens for %{private}@", buf, 0x16u);
        }
        [(NSMutableSet *)self->_participantsNeedingRoute minusSet:v6];
        [(NSMutableDictionary *)self->_tokensByHandle setObject:0 forKeyedSubscript:v5];
        BOOL v11 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v6 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        if (self)
        {
          objc_super v12 = NSString;
          long long v13 = self;
          uint64_t v14 = [v12 stringWithFormat:@"%@<%p>", objc_opt_class(), v13];
        }
        else
        {
          uint64_t v14 = @"<nil>";
        }
        *(_DWORD *)buf = 138543619;
        unint64_t v17 = v14;
        __int16 v18 = 2113;
        id v19 = v4;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_FAULT, "[%{public}@] unable to get handle from participant %{private}@", buf, 0x16u);
      }
    }
    BOOL v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)_setState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSPSenderLiveStrategy;
  [(MSPSenderStrategy *)&v4 _setState:a3];
  [(MSPSenderLiveStrategy *)self _sendInitialRouteIfNeeded];
}

- (void)_sendInitialRouteIfNeeded
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->super.super._participants count]
    && [(NSMutableSet *)self->_participantsNeedingRoute count]
    && [(GEOSharedNavState *)self->super.super._state hasRouteInfo])
  {
    v3 = (void *)[(GEOSharedNavState *)self->super.super._state copy];
    char v4 = [(id)objc_opt_class() _validateState:v3 forEvent:5];
    uint64_t v5 = MSPGetSharedTripLog();
    BOOL v6 = v5;
    if (v4)
    {
      v35 = v3;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unsigned int v7 = NSString;
        uint64_t v8 = self;
        BOOL v9 = [v7 stringWithFormat:@"%@<%p>", objc_opt_class(), v8];

        participantsNeedingRoute = self->_participantsNeedingRoute;
        id v11 = v9;
        uint64_t v12 = [(NSMutableSet *)participantsNeedingRoute count];
        long long v13 = self->_participantsNeedingRoute;

        *(_DWORD *)buf = 138543874;
        v42 = v9;
        __int16 v43 = 2048;
        uint64_t v44 = v12;
        __int16 v45 = 2112;
        uint64_t v46 = (uint64_t)v13;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Need to send route to %lu participants: %@", buf, 0x20u);
      }
      BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSMutableSet count](self->_participantsNeedingRoute, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v14 = self->_participantsNeedingRoute;
      uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v20 = [(MSPSenderIDSStrategy *)self capabilitiesByParticipant];
            id v21 = [v20 objectForKeyedSubscript:v19];
            uint64_t v22 = [v21 count];

            if (v22) {
              [v6 addObject:v19];
            }
          }
          uint64_t v16 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v16);
      }

      uint64_t v23 = [v6 count];
      v3 = v35;
      if (v23 != [(NSMutableSet *)self->_participantsNeedingRoute count])
      {
        uint64_t v24 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = NSString;
          v26 = self;
          v27 = [v25 stringWithFormat:@"%@<%p>", objc_opt_class(), v26];

          id v28 = v27;
          uint64_t v29 = [v6 count];
          uint64_t v30 = [(NSMutableSet *)self->_participantsNeedingRoute count];

          *(_DWORD *)buf = 138543874;
          v42 = v27;
          __int16 v43 = 2048;
          uint64_t v44 = v29;
          __int16 v45 = 2048;
          uint64_t v46 = v30;
          _os_log_impl(&dword_1B87E5000, v24, OS_LOG_TYPE_INFO, "[%{public}@] only %lu/%lu participants are currently reachable for route", buf, 0x20u);
        }
      }
      if ([v6 count])
      {
        [(NSMutableSet *)self->_participantsNeedingRoute minusSet:v6];
        [(MSPSenderIDSStrategy *)self _sendRouteUpdate:v35 to:v6];
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v31 = NSString;
      v32 = self;
      v33 = [v31 stringWithFormat:@"%@<%p>", objc_opt_class(), v32];

      uint64_t v34 = [(NSMutableSet *)self->_participantsNeedingRoute count];
      *(_DWORD *)buf = 138543618;
      v42 = v33;
      __int16 v43 = 2048;
      uint64_t v44 = v34;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Need to send route to %lu participants, but state doesn't have routeInfo", buf, 0x16u);
    }
  }
}

- (void)didFetchCapabilitiesForParticipants:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSPSenderLiveStrategy;
  id v4 = a3;
  [(MSPSenderIDSStrategy *)&v7 didFetchCapabilitiesForParticipants:v4];
  participantsNeedingRoute = self->_participantsNeedingRoute;
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v4, v7.receiver, v7.super_class);

  LODWORD(participantsNeedingRoute) = [(NSMutableSet *)participantsNeedingRoute intersectsSet:v6];
  if (participantsNeedingRoute) {
    [(MSPSenderLiveStrategy *)self _sendInitialRouteIfNeeded];
  }
}

+ (BOOL)_supportsEvent:(unint64_t)a3
{
  return (a3 < 7) & (0x76u >> a3);
}

- (id)_filteredParticipantsForState:(id)a3 event:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MSPSenderLiveStrategy;
  uint64_t v5 = [(MSPSenderIDSStrategy *)&v8 _filteredParticipantsForState:a3 event:a4];
  BOOL v6 = (void *)[v5 mutableCopy];

  [v6 minusSet:self->_participantsNeedingRoute];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByHandle, 0);

  objc_storeStrong((id *)&self->_participantsNeedingRoute, 0);
}

@end