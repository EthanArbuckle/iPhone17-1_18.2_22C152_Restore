@interface MSReauthorizationProtocol
- (MSReauthorizationProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (id)delegate;
- (void)_coreProtocolDidFailAuthenticationError:(id)a3;
- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4;
- (void)abort;
- (void)dealloc;
- (void)requestReauthorizationForAssets:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSReauthorizationProtocol

- (void).cxx_destruct
{
}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(MSStreamsProtocol *)self personID];
    v10 = [v4 MSVerboseDescription];
    int v11 = 138543874;
    v12 = v7;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed authentication. Error: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  assetsInFlight = self->_assetsInFlight;
  self->_assetsInFlight = 0;

  v6 = [(MSReauthorizationProtocol *)self delegate];
  [v6 reauthorizationProtocol:self didReceiveAuthenticationError:v4];
}

- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v30 = objc_opt_class();
      id v31 = v30;
      v32 = [(MSStreamsProtocol *)self personID];
      v33 = [v7 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      v52 = v30;
      __int16 v53 = 2112;
      v54 = v32;
      __int16 v55 = 2114;
      v56 = v33;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reauthorization has failed. Error: %{public}@", buf, 0x20u);
    }
    assetsInFlight = self->_assetsInFlight;
    self->_assetsInFlight = 0;
    v9 = assetsInFlight;

    v10 = [(MSReauthorizationProtocol *)self delegate];
    [v10 reauthorizationProtocol:self reauthorizedAssets:0 rejectedAssets:v9 error:v7];
  }
  else
  {
    v10 = (void *)[(NSArray *)self->_assetsInFlight mutableCopy];
    int v11 = self->_assetsInFlight;
    self->_assetsInFlight = 0;

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v34 = self;
    v12 = [(MSStreamsProtocol *)self personID];
    id v35 = v6;
    __int16 v13 = [v6 objectForKey:v12];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v14 = v13;
    uint64_t v40 = [v14 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v40)
    {
      v38 = v10;
      uint64_t v39 = *(void *)v46;
      id v37 = v14;
LABEL_7:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(v14);
        }
        v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
        uint64_t v17 = [v16 MSHexData];
        if (!v17) {
          break;
        }
        v18 = (void *)v17;
        v19 = [v14 objectForKey:v16];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v20 = v10;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v42;
LABEL_13:
          uint64_t v24 = 0;
          while (1)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v41 + 1) + 8 * v24);
            v26 = [v25 fileHash];
            char v27 = [v26 isEqualToData:v18];

            if (v27) {
              break;
            }
            if (v22 == ++v24)
            {
              uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v22) {
                goto LABEL_13;
              }
              id v14 = v37;
              v10 = v38;
              goto LABEL_22;
            }
          }
          id v28 = v25;

          id v14 = v37;
          v10 = v38;
          if (!v28) {
            goto LABEL_23;
          }
          [v28 setMMCSAccessHeader:v19];
          [(NSArray *)v36 addObject:v28];
          [v20 MSRemoveOneObject:v28];
          id v20 = v28;
        }
LABEL_22:

LABEL_23:
        if (++v15 == v40)
        {
          uint64_t v40 = [v14 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v40) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    v29 = [(MSReauthorizationProtocol *)v34 delegate];
    v9 = v36;
    [v29 reauthorizationProtocol:v34 reauthorizedAssets:v36 rejectedAssets:v10 error:0];

    id v7 = 0;
    id v6 = v35;
  }
}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
  assetsInFlight = self->_assetsInFlight;
  self->_assetsInFlight = 0;
}

- (void)requestReauthorizationForAssets:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(MSStreamsProtocol *)self personID];
    *(_DWORD *)buf = 138543874;
    char v27 = v5;
    __int16 v28 = 2112;
    v29 = v7;
    __int16 v30 = 2048;
    uint64_t v31 = [v4 count];
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Reauthorizing %ld items", buf, 0x20u);
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = (NSArray *)v4;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "fileHash", (void)v21);

        if (v15)
        {
          v16 = [v14 fileHash];
          uint64_t v17 = [v16 MSHexString];
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  assetsInFlight = self->_assetsInFlight;
  self->_assetsInFlight = v9;

  [(MSStreamsProtocol *)self _refreshAuthTokenForContext:&self->_context];
  v19 = [(MSStreamsProtocol *)self reauthorizeURL];
  CFDictionaryRef v20 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSRPCReauthorizeAsync(&self->_context._super.owner, (uint64_t)v19, v20, [(MSStreamsProtocol *)self personID], v8);
}

- (void)dealloc
{
  p_context = &self->_context;

  v4.receiver = self;
  v4.super_class = (Class)MSReauthorizationProtocol;
  [(MSReauthorizationProtocol *)&v4 dealloc];
}

- (MSReauthorizationProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSReauthorizationProtocol;
  id v7 = [(MSStreamsProtocol *)&v10 initWithPersonID:v6 baseURL:a4];
  id v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    v8->_context._super.deviceInfo = [(MSStreamsProtocol *)v8 deviceInfoDict];
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish_2707;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication_2706;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate_2705;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion_2704;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MSReauthorizationProtocol;
  [(MSStreamsProtocol *)&v3 setDelegate:a3];
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)MSReauthorizationProtocol;
  v2 = [(MSStreamsProtocol *)&v4 delegate];
  return v2;
}

@end