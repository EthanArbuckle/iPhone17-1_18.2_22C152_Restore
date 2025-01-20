@interface HDIDSService
- (BOOL)sendMessage:(id)a3 destination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7;
- (BOOL)unitTest_sendOnEmptyDestinationSet;
- (HDIDSService)initWithService:(id)a3;
- (HDIDSService)initWithServiceName:(id)a3;
- (HDIDSServiceDelegate)delegate;
- (IDSService)service;
- (NSString)description;
- (id)devices;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setUnitTest_sendOnEmptyDestinationSet:(BOOL)a3;
@end

@implementation HDIDSService

- (HDIDSService)initWithServiceName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F6AB90];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithService:v5];

  v7 = [(HDIDSService *)self initWithService:v6];
  return v7;
}

- (HDIDSService)initWithService:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 serviceIdentifier];
  self;
  v7 = [NSString stringWithFormat:@"idsservice_%@", v6];

  v8 = HKCreateSerialDispatchQueue();

  id v9 = v5;
  id v10 = v8;
  if (self)
  {
    v22.receiver = self;
    v22.super_class = (Class)HDIDSService;
    v11 = [(HDIDSService *)&v22 init];
    self = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_service, a3);
      [(IDSService *)self->_service addDelegate:self queue:v10];
      v12 = [v9 serviceIdentifier];
      serviceIdentifier = self->_serviceIdentifier;
      self->_serviceIdentifier = v12;

      if (![(NSString *)self->_serviceIdentifier containsString:@"com.apple.private.alloy."])
      {
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          v18 = v14;
          v19 = objc_opt_class();
          v20 = self->_serviceIdentifier;
          *(_DWORD *)buf = 138543618;
          v24 = v19;
          __int16 v25 = 2114;
          v26 = v20;
          id v21 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ WARNING: serviceName %{public}@ does not follow expected naming convention.", buf, 0x16u);
        }
      }
      v15 = [(NSString *)self->_serviceIdentifier stringByReplacingOccurrencesOfString:@"com.apple.private.alloy." withString:&stru_1F1728D60];
      shortServiceIdentifier = self->_shortServiceIdentifier;
      self->_shortServiceIdentifier = v15;

      objc_storeStrong((id *)&self->_queue, v8);
    }
  }

  return self;
}

- (BOOL)sendMessage:(id)a3 destination:(id)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  v50 = a7;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  uint64_t v53 = [a3 copy];
  id v12 = v11;
  v52 = self;
  if (self)
  {
    v13 = [MEMORY[0x1E4F1CA80] set];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v14 = -[HDIDSService devices]((uint64_t)self);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:buf count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          objc_msgSend(v12, "deviceFilterBlock", v50);
          v20 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
          int v21 = ((uint64_t (**)(void, void *))v20)[2](v20, v19);

          if (v21)
          {
            objc_super v22 = [v19 destinationID];
            [v13 addObject:v22];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:buf count:16];
      }
      while (v16);
    }

    v23 = (void *)[v13 copy];
  }
  else
  {
    v23 = 0;
  }

  unint64_t v24 = [v10 priority];
  if (v24 > 2) {
    uint64_t v25 = 200;
  }
  else {
    uint64_t v25 = qword_1BD32D8F8[v24];
  }
  id v26 = v10;
  v28 = (void *)v53;
  uint64_t v27 = a6;
  if (v52)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v26 timeoutInterval];
    if (v30 > 0.0)
    {
      v31 = NSNumber;
      [v26 timeoutInterval];
      v32 = objc_msgSend(v31, "numberWithDouble:");
      [v29 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];
    }
    v33 = objc_msgSend(v29, "copy", v50);
  }
  else
  {
    v33 = 0;
  }

  if ([v23 count] || v52->_unitTest_sendOnEmptyDestinationSet)
  {
    service = v52->_service;
    id v55 = 0;
    id v56 = 0;
    int v35 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v53, v23, v25, v33, &v56, &v55, v50);
    id v36 = v56;
    id v37 = v55;
    _HKInitializeLogging();
    v38 = *MEMORY[0x1E4F29FA8];
    v39 = *MEMORY[0x1E4F29FA8];
    if (v35)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = NSNumber;
        v41 = v38;
        v42 = objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
        *(_DWORD *)buf = 138543875;
        v62 = v52;
        __int16 v63 = 2114;
        uint64_t v64 = (uint64_t)v36;
        __int16 v65 = 2113;
        id v66 = v42;
        _os_log_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueued message %{public}@ to %{private}@ destinations", buf, 0x20u);

        v28 = (void *)v53;
      }
    }
    else
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v62 = v52;
        __int16 v63 = 2114;
        uint64_t v64 = (uint64_t)v36;
        __int16 v65 = 2114;
        id v66 = v37;
        _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@ Could not enqueue message %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v43 = v37;
      v44 = v43;
      if (v43)
      {
        if (v51) {
          void *v51 = v43;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v27 = a6;
    }
    if (v27) {
      *uint64_t v27 = v36;
    }
  }
  else
  {
    _HKInitializeLogging();
    v45 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      v47 = -[HDIDSService devices]((uint64_t)v52);
      uint64_t v48 = [v47 count];
      *(_DWORD *)buf = 138543618;
      v62 = v52;
      __int16 v63 = 2048;
      uint64_t v64 = v48;
      _os_log_impl(&dword_1BCB7D000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ Did not enqueue message: No valid destinations. Available devices: %lu", buf, 0x16u);

      v28 = (void *)v53;
    }
    LOBYTE(v35) = 1;
  }

  return v35;
}

- (id)devices
{
  if (a1)
  {
    v1 = [*(id *)(a1 + 48) devices];
    v2 = objc_msgSend(v1, "hk_map:", &__block_literal_global_150);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

HDIDSDevice *__23__HDIDSService_devices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HDIDSDevice alloc] initWithIDSDevice:v2];

  return v3;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = [[HDIDSMessageContext alloc] initWithMessageContext:v12];

  _HKInitializeLogging();
  uint64_t v16 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    v18 = [(HDIDSMessageContext *)v15 originalGUID];
    int v23 = 138543874;
    unint64_t v24 = self;
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    v28 = v18;
    _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Received message from %{public}@, originalGUID: %{public}@", (uint8_t *)&v23, 0x20u);
  }
  v19 = [(HDIDSService *)self delegate];
  v20 = [HDIDSDevice alloc];
  int v21 = [v14 deviceForFromID:v11];

  objc_super v22 = [(HDIDSDevice *)v20 initWithIDSDevice:v21];
  [v19 service:self didReceiveMessage:v13 fromDevice:v22 messageContext:v15];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  _HKInitializeLogging();
  id v13 = *MEMORY[0x1E4F29FA8];
  id v14 = *MEMORY[0x1E4F29FA8];
  if (v9)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully sent message %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138543874;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = v12;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Could not enqueue message %{public}@. Error: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v15 = [(HDIDSService *)self delegate];
  [v15 service:self didSendWithSuccess:v9 identifier:v11 error:v12];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"[%@] %@", objc_opt_class(), self->_shortServiceIdentifier];
}

- (HDIDSServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDIDSServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (BOOL)unitTest_sendOnEmptyDestinationSet
{
  return self->_unitTest_sendOnEmptyDestinationSet;
}

- (void)setUnitTest_sendOnEmptyDestinationSet:(BOOL)a3
{
  self->_unitTest_sendOnEmptyDestinationSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_shortServiceIdentifier, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end