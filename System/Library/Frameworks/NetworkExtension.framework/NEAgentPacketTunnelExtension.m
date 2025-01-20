@interface NEAgentPacketTunnelExtension
- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5;
- (void)handleExtensionStartedWithCompletionHandler:(id)a3;
- (void)setAppUUIDMap:(id)a3;
@end

@implementation NEAgentPacketTunnelExtension

- (void)setAppUUIDMap:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self sessionContext];
  [v5 setAppUUIDMap:v4];
}

- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self && self->_interfaceType == 3 && !self->_isUserEthernetInterfaceCreated)
  {
    id v11 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 ethernetAddress];
      v13 = createEthernetAddressFromString(v12);

      v14 = [NEVirtualInterfaceParameters alloc];
      int64_t interfaceType = self->_interfaceType;
      v16 = [v11 MTU];
      v17 = [(NEVirtualInterfaceParameters *)v14 initWithType:interfaceType maxPendingPackets:64 ethernetAddress:v13 mtu:v16];

      v18 = [(NEAgentExtension *)self managerObjectFactory];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke;
      v25[3] = &unk_1E5993798;
      v25[4] = self;
      id v19 = v10;
      id v26 = v19;
      v20 = [v18 managerObjectWithErrorHandler:v25];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_9;
      v21[3] = &unk_1E5991600;
      v21[4] = self;
      id v24 = v19;
      id v22 = v8;
      id v23 = v11;
      [v20 createVirtualInterfaceWithParameters:v17 completionHandler:v21];
    }
    else
    {
      v27.receiver = self;
      v27.super_class = (Class)NEAgentPacketTunnelExtension;
      [(NEAgentTunnelExtension *)&v27 extension:v8 didSetTunnelConfiguration:v11 completionHandler:v10];
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)NEAgentPacketTunnelExtension;
    [(NEAgentTunnelExtension *)&v28 extension:v8 didSetTunnelConfiguration:v9 completionHandler:v10];
  }
}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@: Got an error on the XPC connection while waiting for a virtual interface: %@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_9(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E5992468;
  id v5 = a1[4];
  id v8 = v3;
  id v9 = v5;
  id v12 = a1[7];
  id v10 = a1[5];
  id v11 = a1[6];
  id v6 = v3;
  dispatch_async(v4, block);
}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      *(unsigned char *)(v2 + 128) = 1;
      id v3 = *(void **)(a1 + 40);
    }
    else
    {
      id v3 = 0;
    }
    id v4 = [v3 sessionContext];
    [v4 setupVirtualInterface:*(void *)(a1 + 32)];

    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v11.receiver = *(id *)(a1 + 40);
    v11.super_class = (Class)NEAgentPacketTunnelExtension;
    objc_msgSendSuper2(&v11, sel_extension_didSetTunnelConfiguration_completionHandler_, v5, v6, v7);
  }
  else
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@: Failed to create a user ethernet virtual interface", buf, 0xCu);
    }

    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEAgentExtension *)self sessionContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59915D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchVirtualInterfaceTypeWithCompletionHandler:v7];
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    uint64_t v20 = a2;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@: Fetched virtual interface type %ld", buf, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    *(void *)(v5 + 136) = a2;
  }
  if (a2 == 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) managerObjectFactory];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_1;
    v15[3] = &unk_1E5993798;
    uint64_t v7 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v7;
    id v8 = [v6 managerObjectWithErrorHandler:v15];

    id v9 = [[NEVirtualInterfaceParameters alloc] initWithType:a2 maxPendingPackets:64 ethernetAddress:0 mtu:0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E59915B0;
    uint64_t v10 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    uint64_t v14 = a2;
    id v13 = v10;
    [v8 createVirtualInterfaceWithParameters:v9 completionHandler:v12];
  }
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@: Got an error on the XPC connection while waiting for a virtual interface: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5991588;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  uint64_t v12 = *(void *)(a1 + 48);
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) sessionContext];
    [v2 setupVirtualInterface:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 56);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "%@: Failed to obtain a virtual interface of type %ld, aborting", (uint8_t *)&v6, 0x16u);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end