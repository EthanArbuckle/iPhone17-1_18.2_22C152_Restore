@interface HDHealthStoreEndpoint
+ (id)endpointWithClient:(id)a3 healthDaemon:(id)a4;
- (HDDaemon)daemon;
- (HDHealthStoreEndpoint)initWithClient:(id)a3 daemon:(id)a4;
- (HDHealthStoreServer)server;
- (HDXPCClient)client;
- (HKProfileIdentifier)profileIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)connectionConfigured;
- (void)invalidate;
- (void)profileDidBecomeReady:(id)a3;
- (void)remote_serverForConfiguration:(id)a3 completion:(id)a4;
@end

@implementation HDHealthStoreEndpoint

+ (id)endpointWithClient:(id)a3 healthDaemon:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 behavior];
  self;
  char v8 = [v7 isDeviceSupported];

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthDataUnavailableError");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18) {
      id v20 = v18;
    }

    id v21 = v19;
    goto LABEL_15;
  }
  [v6 behavior];
  id v30 = 0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v5;
  self;
  v11 = [v10 process];

  uint64_t v12 = *MEMORY[0x1E4F29E48];
  if (([v11 hasEntitlement:*MEMORY[0x1E4F29E48]] & 1) != 0
    || ([v11 hasEntitlement:*MEMORY[0x1E4F2A548]] & 1) != 0)
  {
    uint64_t v13 = [v9 additionalEntitlementForConnection];
    if (!v13
      || (v14 = (void *)v13,
          [v9 additionalEntitlementForConnection],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v11 hasEntitlement:v15],
          v15,
          v14,
          (v16 & 1) != 0))
    {
      char v17 = 1;
      goto LABEL_13;
    }
    v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthDataUnavailableError");
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = [v22 code];
    v25 = [v22 description];
    objc_msgSend(v23, "hk_assignError:code:description:", &v30, v24, v25);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v30, 4, @"Missing %@ entitlement.", v12);
  }
  char v17 = 0;
LABEL_13:

  id v21 = v30;
  if (v17)
  {
    v26 = [[HDHealthStoreEndpoint alloc] initWithClient:v10 daemon:v6];
    goto LABEL_21;
  }
LABEL_15:
  v27 = v21;
  if (!v21)
  {
    v27 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 1, @"Health data is not available for this client.");
  }
  v26 = [HDHealthStoreErrorEndpoint alloc];
  id v21 = v27;
  if (v26)
  {
    v31.receiver = v26;
    v31.super_class = (Class)HDHealthStoreErrorEndpoint;
    v28 = objc_msgSendSuper2(&v31, sel_initWithClient_daemon_, v5, v6);
    v26 = (HDHealthStoreErrorEndpoint *)v28;
    if (v28) {
      objc_storeStrong(v28 + 7, v27);
    }
  }

LABEL_21:

  return v26;
}

- (HDHealthStoreEndpoint)initWithClient:(id)a3 daemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDHealthStoreEndpoint;
  id v9 = [(HDHealthStoreEndpoint *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    v11 = [v7 process];
    uint64_t v12 = NSString;
    uint64_t v13 = [v11 bundleIdentifier];
    v14 = [v12 stringWithFormat:@"connection.%@.%d", v13, objc_msgSend(v11, "processIdentifier")];

    uint64_t v15 = HKCreateSerialDispatchQueue();
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)v15;

    objc_storeWeak((id *)&v10->_daemon, v8);
    char v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    serverCompletionsAwaitingProfileReady = v10->_serverCompletionsAwaitingProfileReady;
    v10->_serverCompletionsAwaitingProfileReady = v17;
  }
  return v10;
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7D18](self, a2);
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7D20](self, a2);
}

- (void)remote_serverForConfiguration:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, uint64_t))a4;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    id v10 = [WeakRetained profileManager];
    v11 = [v7 profileIdentifier];
    uint64_t v12 = [v10 profileForIdentifier:v11];

    if (!v12)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthStoreUnavailableError");
      goto LABEL_7;
    }
    uint64_t v13 = [MEMORY[0x1E4F2B860] sharedBehavior];
    if ([v13 isiPad])
    {
      [v7 applicationSDKVersionToken];
      char v14 = dyld_version_token_at_least();

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthDataUnavailableError");
LABEL_7:
        char v16 = (void *)v15;
        v8[2](v8, 0, v15);

LABEL_41:
        goto LABEL_42;
      }
    }
    else
    {
    }
    char v17 = [[HDHealthStoreClient alloc] initWithXPCClient:self->_client configuration:v7 profile:v12 databaseAccessibilityAssertions:0];
    [v7 sourceBundleIdentifier];
    id v43 = 0;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    objc_super v20 = v19;
    if (!v18
      || ([(HDHealthStoreClient *)v19 defaultSourceBundleIdentifier],
          id v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v18 isEqualToString:v21],
          v21,
          (v22 & 1) != 0))
    {
      char v23 = 1;
      goto LABEL_23;
    }
    uint64_t v24 = [(HDXPCClient *)self->_client process];
    if ([v24 hasEntitlement:*MEMORY[0x1E4F29930]]) {
      goto LABEL_21;
    }
    uint64_t v25 = *MEMORY[0x1E4F2AA10];
    if ([v24 hasArrayEntitlement:*MEMORY[0x1E4F2AA10] containing:*MEMORY[0x1E4F296D0]])
    {
      if ([MEMORY[0x1E4F2B560] isAppleDeviceBundleIdentifier:v18]) {
        goto LABEL_21;
      }
    }
    if ([v24 hasEntitlement:*MEMORY[0x1E4F2AA18]])
    {
      v26 = [(HDXPCClient *)self->_client process];
      os_unfair_lock_t lock = [v26 applicationIdentifier];

      if (-[os_unfair_lock_s length](lock, "length") && [v18 hasPrefix:lock])
      {

        goto LABEL_21;
      }
    }
    if (([v24 hasArrayEntitlement:v25 containing:v18] & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v43, 4, @"Unauthorized use of source bundle identifier \"%@\"", v18);
      char v23 = 0;
      goto LABEL_22;
    }
LABEL_21:
    char v23 = 1;
LABEL_22:

LABEL_23:
    id v27 = v43;

    if (v23)
    {
      if ([(HDHealthStoreClient *)v20 _isAuthorizedToAccessProfile:v12])
      {
        p_os_unfair_lock_t lock = &self->_lock;
        os_unfair_lock_lock(&self->_lock);
        v29 = self->_server;
        if (v29)
        {
          id v30 = v29;
          os_unfair_lock_unlock(&self->_lock);
          objc_super v31 = [(HDHealthStoreServer *)v30 configuration];
          char v32 = [v31 isEqual:v7];

          if (v32)
          {
            p_os_unfair_lock_t lock = &self->_lock;
LABEL_32:
            os_unfair_lock_lock(p_lock);
            serverCompletionsAwaitingProfileReady = self->_serverCompletionsAwaitingProfileReady;
            if (serverCompletionsAwaitingProfileReady)
            {
              v40[0] = MEMORY[0x1E4F143A8];
              v40[1] = 3221225472;
              v40[2] = __66__HDHealthStoreEndpoint_remote_serverForConfiguration_completion___block_invoke;
              v40[3] = &unk_1E62F3CA8;
              v42 = v8;
              v41 = v30;
              v35 = (void *)[v40 copy];
              v36 = p_lock;
              v37 = _Block_copy(v35);
              [(NSMutableArray *)serverCompletionsAwaitingProfileReady addObject:v37];

              p_os_unfair_lock_t lock = v36;
            }
            else
            {
              ((void (**)(id, HDHealthStoreServer *, uint64_t))v8)[2](v8, v30, 0);
            }
            os_unfair_lock_unlock(p_lock);
            goto LABEL_39;
          }
          v38 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Requested server configuration does not match existing server configuration."");
          v8[2](v8, 0, (uint64_t)v38);
        }
        else
        {
          id v30 = [[HDHealthStoreServer alloc] initWithClient:v20 profile:v12 configuration:v7 connectionQueue:self->_connectionQueue];
          objc_storeStrong((id *)&self->_server, v30);
          [v12 registerProfileReadyObserver:self queue:0];
          os_unfair_lock_unlock(&self->_lock);
          if (v30)
          {
            [(HDHealthStoreServer *)v30 start];
            goto LABEL_32;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Requested server configuration is invalid."");
          id v30 = (HDHealthStoreServer *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, 0, (uint64_t)v30);
        }
LABEL_39:

        goto LABEL_40;
      }
      v33 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_healthStoreUnavailableError");
      v8[2](v8, 0, (uint64_t)v33);
    }
    else
    {
      v8[2](v8, 0, (uint64_t)v27);
    }
LABEL_40:

    goto LABEL_41;
  }
LABEL_42:
}

uint64_t __66__HDHealthStoreEndpoint_remote_serverForConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)invalidate
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  server = self->_server;
  self->_server = 0;
  id v5 = server;

  os_unfair_lock_unlock(p_lock);
  [(HDHealthStoreServer *)v5 invalidate];
  id v6 = [(HDXPCClient *)self->_client connection];

  [v6 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v7 = [WeakRetained connectionManager];
  [v7 endpointInvalidated:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_serverCompletionsAwaitingProfileReady, 0);

  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

- (HKProfileIdentifier)profileIdentifier
{
  v2 = [(HDHealthStoreServer *)self->_server profile];
  v3 = [v2 profileIdentifier];

  return (HKProfileIdentifier *)v3;
}

- (void)connectionConfigured
{
  id v3 = [(HDXPCClient *)self->_client connection];
  [v3 _setQueue:self->_connectionQueue];
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_server)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = self->_serverCompletionsAwaitingProfileReady;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  serverCompletionsAwaitingProfileReady = self->_serverCompletionsAwaitingProfileReady;
  self->_serverCompletionsAwaitingProfileReady = 0;

  os_unfair_lock_unlock(p_lock);
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);

  return (HDDaemon *)WeakRetained;
}

- (HDXPCClient)client
{
  return self->_client;
}

- (HDHealthStoreServer)server
{
  return self->_server;
}

@end