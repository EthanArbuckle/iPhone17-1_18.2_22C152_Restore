@interface MSDeleteStreamsProtocol
- (MSDeleteStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (void)_coreProtocolDidFailAuthenticationError:(id)a3;
- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4;
- (void)_resetConnectionVariables;
- (void)abort;
- (void)sendDeletionRequestForAssetCollections:(id)a3;
@end

@implementation MSDeleteStreamsProtocol

- (void).cxx_destruct
{
}

- (void)_resetConnectionVariables
{
  self->_collectionsInFlight = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  id v4 = a3;
  id v5 = [(MSStreamsProtocol *)self delegate];
  [v5 deleteProtocol:self didReceiveAuthenticationError:v4];
}

- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (NSMutableArray *)a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v39 = objc_opt_class();
      id v40 = v39;
      v41 = [(MSStreamsProtocol *)self personID];
      *(_DWORD *)buf = 138543874;
      v66 = v39;
      __int16 v67 = 2112;
      v68 = v41;
      __int16 v69 = 2114;
      v70 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Delete request has failed. Error: %{public}@", buf, 0x20u);
    }
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_collectionsInFlight, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v9 = self->_collectionsInFlight;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v59 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 addObject:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v11);
    }

    [(MSDeleteStreamsProtocol *)self _resetConnectionVariables];
    v14 = [(MSStreamsProtocol *)self delegate];
    [v14 deleteProtocol:self didFinishSuccessfulCollections:0 failedCollections:v8 error:v7];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_collectionsInFlight, "count"));
    v46 = [MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v47 = v6;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v55;
      v49 = self;
      id v48 = v15;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v55 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(NSMutableArray **)(*((void *)&v54 + 1) + 8 * j);
          v21 = [(NSMutableArray *)v20 objectForKey:@"fileHash"];
          if (v21)
          {
            v22 = [(NSMutableArray *)v20 objectForKey:@"deleteResult"];
            if (v22)
            {
              v23 = [(NSMutableArray *)self->_collectionsInFlight MSDSPAssetCollectionWithMasterFileHash:v21];
              if (v23)
              {
                [v8 addObject:v23];
                [(NSMutableArray *)self->_collectionsInFlight removeObject:v23];
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                v30 = objc_opt_class();
                id v31 = v30;
                v32 = [(MSStreamsProtocol *)self personID];
                *(_DWORD *)buf = 138543874;
                v66 = v30;
                __int16 v67 = 2112;
                v68 = v32;
                __int16 v69 = 2114;
                v70 = v21;
                _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Delete response contains unknown file hash %{public}@", buf, 0x20u);

                self = v49;
                id v15 = v48;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v27 = objc_opt_class();
              id v28 = v27;
              v29 = [(MSStreamsProtocol *)self personID];
              *(_DWORD *)buf = 138543874;
              v66 = v27;
              id v15 = v48;
              __int16 v67 = 2112;
              v68 = v29;
              __int16 v69 = 2114;
              v70 = v20;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Delete response is missing the delete result. %{public}@", buf, 0x20u);

              self = v49;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class();
            id v25 = v24;
            v26 = [(MSStreamsProtocol *)self personID];
            *(_DWORD *)buf = 138543874;
            v66 = v24;
            id v15 = v48;
            __int16 v67 = 2112;
            v68 = v26;
            __int16 v69 = 2114;
            v70 = v20;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Delete response is missing a hash: %{public}@", buf, 0x20u);

            self = v49;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v17);
    }

    v14 = v46;
    v7 = 0;
    if ([(NSMutableArray *)self->_collectionsInFlight count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v42 = objc_opt_class();
        id v43 = v42;
        v44 = [(MSStreamsProtocol *)self personID];
        collectionsInFlight = self->_collectionsInFlight;
        *(_DWORD *)buf = 138543874;
        v66 = v42;
        __int16 v67 = 2112;
        v68 = v44;
        __int16 v69 = 2114;
        v70 = collectionsInFlight;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ These asset collections did not receive a delete response: %{public}@", buf, 0x20u);
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v33 = self->_collectionsInFlight;
      uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v51 != v36) {
              objc_enumerationMutation(v33);
            }
            [v46 addObject:*(void *)(*((void *)&v50 + 1) + 8 * k)];
          }
          uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v50 objects:v62 count:16];
        }
        while (v35);
      }
    }
    [(MSDeleteStreamsProtocol *)self _resetConnectionVariables];
    v38 = [(MSStreamsProtocol *)self delegate];
    [v38 deleteProtocol:self didFinishSuccessfulCollections:v8 failedCollections:v46 error:0];

    id v6 = v47;
  }
}

- (void)sendDeletionRequestForAssetCollections:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = self;
    [(NSMutableArray *)self->_collectionsInFlight removeAllObjects];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        v13 = [MEMORY[0x1E4F1CA60] dictionary];
        v14 = [v12 masterAssetHash];
        if (v14)
        {
          [(NSMutableArray *)v5->_collectionsInFlight addObject:v12];
          [v13 setObject:v14 forKey:@"fileHash"];
          id v15 = [NSString MSMakeUUID];
          [v13 setObject:v15 forKey:@"UUID"];
LABEL_9:

          goto LABEL_11;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v26 = v16;
          __int16 v27 = 2112;
          id v28 = v12;
          id v15 = v16;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - Asset collection has no master file hash: %@", buf, 0x16u);
          goto LABEL_9;
        }
LABEL_11:
        [v6 addObject:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v17 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
      uint64_t v9 = v17;
      if (!v17)
      {
LABEL_15:

        [(MSStreamsProtocol *)v5 _refreshAuthTokenForContext:&v5->_context];
        uint64_t v18 = [(MSStreamsProtocol *)v5 deleteURL];
        CFDictionaryRef v19 = (const __CFDictionary *)MSPURLConnectionProperties();
        MSDSPCSendDeletionRequestAsync(&v5->_context._super.owner, v18, v19, (const __CFArray *)v6);

        id v4 = v20;
        break;
      }
    }
  }
}

- (void)abort
{
}

- (MSDeleteStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDeleteStreamsProtocol;
  id v7 = [(MSStreamsProtocol *)&v12 initWithPersonID:v6 baseURL:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    v8->_context._super.deviceInfo = [(MSStreamsProtocol *)v8 deviceInfoDict];
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallbacuint64_t k = _protocolDidFinish_3359;
    v8->_context.authFailedCallbacuint64_t k = _protocolDidFailAuthentication_3358;
    v8->_context.didReceiveRetryAfterCallbacuint64_t k = _protocolDidReceiveRetryAfterDate_3357;
    v8->_context.didReceiveServerSideConfigurationVersionCallbacuint64_t k = _protocolDidReceiveServerSideConfigurationVersion_3356;
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    collectionsInFlight = v8->_collectionsInFlight;
    v8->_collectionsInFlight = v9;
  }
  return v8;
}

@end