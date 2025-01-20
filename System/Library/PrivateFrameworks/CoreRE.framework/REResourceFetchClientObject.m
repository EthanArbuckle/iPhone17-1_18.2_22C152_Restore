@interface REResourceFetchClientObject
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (HashTable<unsigned)pendingShaderGraphs;
- (NSString)redactedDescription;
- (OS_voucher)voucher;
- (REResourceClientPorts)clientPorts;
- (REResourceFetchClientObject)initWithResourceFetchManager:(void *)a3 connection:(const Connection *)a4 voucher:(id)a5;
- (id).cxx_construct;
- (int)pid;
- (int)pidversion;
- (unint64_t)peerID;
- (void)associateConnectionWithPeerID:(unint64_t)a3 clientPorts:(id)a4;
- (void)decodeShaderGraph:(id)a3 withReply:(id)a4;
- (void)invalidate;
- (void)pushLoadResourceWithAssetId:(unint64_t)a3 assetType:(id)a4 isPriorityAsset:(BOOL)a5;
- (void)receiveDirectResourceCommit:(id)a3;
- (void)receiveReferenceObject:(id)a3;
- (void)releaseResourceWithAssetId:(unint64_t)a3;
- (void)resourceAtAssetPath:(id)a3 payloadDidUpdate:(id)a4 error:(id)a5;
- (void)resourceFetchManager;
- (void)setPendingShaderGraphs:(HashTable<unsigned long)long;
- (void)setVoucher:(id)a3;
@end

@implementation REResourceFetchClientObject

- (REResourceFetchClientObject)initWithResourceFetchManager:(void *)a3 connection:(const Connection *)a4 voucher:(id)a5
{
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)REResourceFetchClientObject;
  v10 = [(REResourceFetchClientObject *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_resourceFetchManager = a3;
    v10->_peerID = 0;
    objc_storeStrong((id *)&v10->_voucher, a5);
    if (*(void *)a4)
    {
      [*(id *)a4 auditToken];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    long long v12 = v19;
    *(_OWORD *)v11->_auditToken.val = v18;
    *(_OWORD *)&v11->_auditToken.val[4] = v12;
    long long v13 = *(_OWORD *)&v11->_auditToken.val[4];
    *(_OWORD *)atoken.val = *(_OWORD *)v11->_auditToken.val;
    *(_OWORD *)&atoken.val[4] = v13;
    v11->_pid = audit_token_to_pid(&atoken);
    long long v14 = *(_OWORD *)&v11->_auditToken.val[4];
    *(_OWORD *)v16.val = *(_OWORD *)v11->_auditToken.val;
    *(_OWORD *)&v16.val[4] = v14;
    v11->_pidversion = audit_token_to_pidversion(&v16);
  }

  return v11;
}

- (void)invalidate
{
  self->_resourceFetchManager = 0;
}

- (NSString)redactedDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<pid %d (%d)>", self->_pid, self->_pidversion);
}

- (void)resourceAtAssetPath:(id)a3 payloadDidUpdate:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (re *)a5;
  v11 = v10;
  if (v8)
  {
    resourceFetchManager = self->_resourceFetchManager;
    if (resourceFetchManager)
    {
      if (v10)
      {
        long long v13 = self;
        v26 = v13;
        long long v14 = (_anonymous_namespace_ *)[v8 UTF8String];
        v15 = v11;
        LOBYTE(v24[0]) = 0;
        v24[1] = v15;
        re::ResourceFetchManager::resourcePayloadDidUpdate((uint64_t)resourceFetchManager, (id *)&v26, (const re::DynamicString *)v25, v24);

        if (*(void *)&v25[0])
        {
          if (BYTE8(v25[0])) {
            (*(void (**)(void))(**(void **)&v25[0] + 40))();
          }
          memset(v25, 0, sizeof(v25));
        }
LABEL_18:

        goto LABEL_19;
      }
      if (v9)
      {
        long long v13 = self;
        v23 = v13;
        long long v19 = (_anonymous_namespace_ *)[v8 UTF8String];
        id v20 = v9;
        LOBYTE(v21[0]) = 1;
        v21[1] = v20;
        re::ResourceFetchManager::resourcePayloadDidUpdate((uint64_t)resourceFetchManager, (id *)&v23, (const re::DynamicString *)v22, v21);

        if (*(void *)&v22[0])
        {
          if (BYTE8(v22[0])) {
            (*(void (**)(void))(**(void **)&v22[0] + 40))();
          }
          memset(v22, 0, sizeof(v22));
        }
        goto LABEL_18;
      }
      audit_token_t v16 = re::resourceSharingLogObjects(0)[1];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v17 = "Resource connection %@ received an invalid message: both payload and error are nil";
      goto LABEL_10;
    }
    long long v18 = re::resourceSharingLogObjects(v10)[1];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_error_impl(&dword_233120000, v18, OS_LOG_TYPE_ERROR, "Resource connection %@ ignored a message: service was deinited", buf, 0xCu);
    }
  }
  else
  {
    audit_token_t v16 = re::resourceSharingLogObjects(v10)[1];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      v17 = "Resource connection %@ received an invalid updated payload for a nil asset path";
LABEL_10:
      _os_log_fault_impl(&dword_233120000, v16, OS_LOG_TYPE_FAULT, v17, buf, 0xCu);
    }
  }
LABEL_19:
}

- (void)pushLoadResourceWithAssetId:(unint64_t)a3 assetType:(id)a4 isPriorityAsset:(BOOL)a5
{
  BOOL v5 = a5;
  *(void *)&v25[5] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [MEMORY[0x263F08D68] currentConnection];
  v10 = [v9 valueForEntitlement:@"com.apple.surfboard.allow-any-custom-shader"];
  uint64_t v11 = [v10 BOOLValue];

  if (v8)
  {
    if (a3)
    {
      resourceFetchManager = self->_resourceFetchManager;
      long long v14 = self;
      uint64_t v15 = [v8 cStringUsingEncoding:4];
      uint64_t v16 = resourceFetchManager[32];
      if (v16) {
        id v17 = (id)(v16 + 8);
      }
      uint64_t v18 = [(REResourceFetchClientObject *)v14 peerID];
      if (v18)
      {
        if (!v16)
        {
LABEL_17:

          goto LABEL_18;
        }
        (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, BOOL))(*(void *)v16 + 32))(v16, a3, v15, v18, v18, v11, v5);
      }
      else
      {
        v21 = re::resourceSharingLogObjects(0)[1];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v14;
          v23 = v21;
          int v24 = 67109376;
          v25[0] = [(REResourceFetchClientObject *)v22 pid];
          LOWORD(v25[1]) = 2048;
          *(void *)((char *)&v25[1] + 2) = a3;
          _os_log_impl(&dword_233120000, v23, OS_LOG_TYPE_DEFAULT, "Client (pid %d) attempted to push-load asset %llu without registering a peerID.  Push load will not be initiated.", (uint8_t *)&v24, 0x12u);
        }
        if (!v16) {
          goto LABEL_17;
        }
      }

      goto LABEL_17;
    }
    long long v19 = re::resourceSharingLogObjects(v12)[1];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      int v24 = 138412290;
      *(void *)v25 = self;
      id v20 = "Resource connection %@ received an invalid push load request: assetId is 0";
      goto LABEL_12;
    }
  }
  else
  {
    long long v19 = re::resourceSharingLogObjects(v12)[1];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      int v24 = 138412290;
      *(void *)v25 = self;
      id v20 = "Resource connection %@ received an invalid push load request: assetType is nil";
LABEL_12:
      _os_log_fault_impl(&dword_233120000, v19, OS_LOG_TYPE_FAULT, v20, (uint8_t *)&v24, 0xCu);
    }
  }
LABEL_18:
}

- (void)releaseResourceWithAssetId:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  resourceFetchManager = self->_resourceFetchManager;
  BOOL v5 = self;
  uint64_t v6 = resourceFetchManager[32];
  if (v6) {
    id v7 = (id)(v6 + 8);
  }
  uint64_t v8 = [(REResourceFetchClientObject *)v5 peerID];
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)v6 + 40))(v6, a3, v8);
LABEL_9:
    }
  }
  else
  {
    id v9 = re::resourceSharingLogObjects(0)[1];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v5;
      uint64_t v11 = v9;
      v12[0] = 67109376;
      v12[1] = [(REResourceFetchClientObject *)v10 pid];
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      _os_log_impl(&dword_233120000, v11, OS_LOG_TYPE_DEFAULT, "Client (pid %d) attempted to release asset %llu without registering a peerID.  Release will not be initiated.", (uint8_t *)v12, 0x12u);
    }
    if (v6) {
      goto LABEL_9;
    }
  }
}

- (void)receiveDirectResourceCommit:(id)a3
{
  resourceFetchManager = self->_resourceFetchManager;
  id v5 = a3;
  __int16 v13 = self;
  unint64_t v14 = v13;
  uint64_t v6 = [v5 object];

  id v7 = v6;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)resourceFetchManager + 4));
  os_unfair_lock_lock((os_unfair_lock_t)resourceFetchManager + 16);
  uint64_t v8 = *((void *)resourceFetchManager + 33);
  if (v8)
  {
    uint64_t v9 = *((void *)resourceFetchManager + 11);
    if (v9)
    {
      uint64_t v10 = v9 << 6;
      uint64_t v11 = (REResourceFetchClientObject **)(*((void *)resourceFetchManager + 13) + 8);
      while (*v11 != v13)
      {
        v11 += 8;
        v10 -= 64;
        if (!v10) {
          goto LABEL_8;
        }
      }
      uint64_t v12 = re::directMeshConnectionId((void **)&v14);
      (*(void (**)(uint64_t, id, uint64_t))(*(void *)v8 + 48))(v8, v7, v12);
    }
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)resourceFetchManager + 16);
}

- (void)receiveReferenceObject:(id)a3
{
  resourceFetchManager = self->_resourceFetchManager;
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [v5 object];

  id v8 = v7;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)resourceFetchManager + 4));
  os_unfair_lock_lock((os_unfair_lock_t)resourceFetchManager + 16);
  uint64_t v9 = *((void *)resourceFetchManager + 34);
  if (*(void *)(v9 + 56))
  {
    uint64_t v10 = *((void *)resourceFetchManager + 11);
    if (v10)
    {
      uint64_t v11 = v10 << 6;
      uint64_t v12 = (REResourceFetchClientObject **)(*((void *)resourceFetchManager + 13) + 8);
      while (*v12 != v6)
      {
        v12 += 8;
        v11 -= 64;
        if (!v11) {
          goto LABEL_8;
        }
      }
      id v13 = v8;
      (*(void (**)(void, id *))(**(void **)(v9 + 56) + 16))(*(void *)(v9 + 56), &v13);
    }
  }
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)resourceFetchManager + 16);
}

- (void)associateConnectionWithPeerID:(unint64_t)a3 clientPorts:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (self->_peerID)
  {
    re::internal::assertLog((re::internal *)4, v8, "assertion failure: '%s' (%s:line %i) Tried to set peer ID on a connection twice", "_peerID == 0", "-[REResourceFetchClientObject associateConnectionWithPeerID:clientPorts:]", 1219);
    _os_crash();
    __break(1u);
  }
  uint64_t v9 = v7;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self->_resourceFetchManager + 4));
  *(void *)buf = a3;
  *(_DWORD *)&buf[8] = self->_pid;
  long long v10 = *(_OWORD *)&self->_auditToken.val[4];
  long long v28 = *(_OWORD *)self->_auditToken.val;
  long long v29 = v10;
  int v30 = 0;
  uint64_t v12 = re::PeerIDValidator::instance(v11);
  BOOL v13 = re::PeerIDValidator::validateOrAdd_impl(v12, (uint64_t)buf);
  if (v13)
  {
    unint64_t peerID = self->_peerID;
    uint64_t v15 = re::resourceSharingLogObjects((re *)v13)[1];
    if (peerID)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = a3;
        LOWORD(v28) = 2112;
        *(void *)((char *)&v28 + 2) = self;
        _os_log_fault_impl(&dword_233120000, v15, OS_LOG_TYPE_FAULT, "Attempted to associate peer ID %llu with resource connection %@ which already has a peer ID", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        LOWORD(v28) = 2048;
        *(void *)((char *)&v28 + 2) = a3;
        _os_log_impl(&dword_233120000, v15, OS_LOG_TYPE_DEFAULT, "Resource connection %@ is now associated with peer ID %llu", buf, 0x16u);
      }
      self->_unint64_t peerID = a3;
      objc_storeStrong((id *)&self->_clientPorts, a4);
    }
    uint64_t v16 = (void *)*((void *)self->_resourceFetchManager + 34);
    if (v16) {
      id v17 = v16 + 1;
    }
    uint64_t v18 = v16[10];
    if (!v18) {
      goto LABEL_15;
    }
    uint64_t v19 = 48 * v18;
    id v20 = (uint64_t *)(v16[12] + 40);
    do
    {
      int pid = self->_pid;
      long long v22 = *(_OWORD *)&self->_auditToken.val[4];
      v25[0] = *(_OWORD *)self->_auditToken.val;
      v25[1] = v22;
      unint64_t v23 = self->_peerID;
      int v26 = pid;
      *(void *)buf = v23;
      uint64_t v24 = *v20;
      v20 += 6;
      (*(void (**)(uint64_t, int *, _OWORD *, unsigned char *))(*(void *)v24 + 16))(v24, &v26, v25, buf);
      v19 -= 48;
    }
    while (v19);
    if (v16) {
LABEL_15:
    }
  }
}

- (void)decodeShaderGraph:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self->_resourceFetchManager + 4));
  uint64_t v8 = _Block_copy(*((const void **)self->_resourceFetchManager + 37));
  if (v8)
  {
    long long v10 = v8;
    uint64_t v11 = (void *)MEMORY[0x263F08D68];
    uint64_t v12 = *((void *)self->_resourceFetchManager + 5);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke;
    v16[3] = &unk_264BE2380;
    id v17 = v6;
    uint64_t v18 = self;
    id v19 = v8;
    id v20 = v7;
    id v13 = v7;
    id v14 = v6;
    id v15 = v10;
    [v11 _handoffCurrentReplyToQueue:v12 block:v16];
  }
  else
  {
    re::internal::assertLog((re::internal *)4, v9, "assertion failure: '%s' (%s:line %i) ", "shaderGraphLoader", "-[REResourceFetchClientObject decodeShaderGraph:withReply:]", 1253);
    _os_crash();
    __break(1u);
  }
}

void __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke_2;
  v4[3] = &unk_264BE2358;
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  (*(void (**)(void *__return_ptr, uint64_t, id *, void *))(v2 + 16))(v6, v2, &v5, v4);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __59__REResourceFetchClientObject_decodeShaderGraph_withReply___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    [v7 pendingShaderGraphs];
    BOOL v8 = (void)v21 == 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    BOOL v8 = 1;
  }
  unint64_t v9 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (a2 ^ (a2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (a2 ^ (a2 >> 30))) >> 27));
  unint64_t v10 = v9 ^ (v9 >> 31);
  if (v8)
  {
    LODWORD(v11) = 0;
  }
  else
  {
    unint64_t v11 = v10 % DWORD2(v22);
    uint64_t v12 = *(unsigned int *)(*((void *)&v21 + 1) + 4 * v11);
    if (v12 != 0x7FFFFFFF)
    {
      if (*(void *)(v22 + 32 * v12 + 16) == a2) {
        goto LABEL_15;
      }
      while (1)
      {
        uint64_t v12 = *(_DWORD *)(v22 + 32 * v12 + 8) & 0x7FFFFFFF;
        if (v12 == 0x7FFFFFFF) {
          break;
        }
        if (*(void *)(v22 + 32 * v12 + 16) == a2) {
          goto LABEL_15;
        }
      }
    }
  }
  uint64_t v13 = DWORD1(v23);
  if (DWORD1(v23) == 0x7FFFFFFF)
  {
    uint64_t v13 = v23;
    int v14 = v23;
    if (v23 == DWORD2(v22))
    {
      re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::setCapacity((uint64_t)&v21, 2 * HIDWORD(v22));
      int v14 = v23;
      LODWORD(v11) = v10 % DWORD2(v22);
    }
    LODWORD(v23) = v14 + 1;
    uint64_t v15 = v22;
    int v16 = *(_DWORD *)(v22 + 32 * v13 + 8);
  }
  else
  {
    uint64_t v15 = v22;
    int v16 = *(_DWORD *)(v22 + 32 * DWORD1(v23) + 8);
    DWORD1(v23) = v16 & 0x7FFFFFFF;
  }
  *(_DWORD *)(v15 + 32 * v13 + 8) = v16 | 0x80000000;
  uint64_t v17 = v11;
  uint64_t v18 = *((void *)&v21 + 1);
  *(_DWORD *)(v22 + 32 * v13 + 8) = *(_DWORD *)(v22 + 32 * v13 + 8) & 0x80000000 | *(_DWORD *)(*((void *)&v21 + 1)
                                                                                             + 4 * v11);
  *(void *)(v22 + 32 * v13) = v10;
  *(void *)(v22 + 32 * v13 + 16) = a2;
  uint64_t v19 = *a3;
  *(void *)(v22 + 32 * v13 + 24) = *a3;
  if (v19)
  {
    id v20 = (id)(v19 + 8);
    uint64_t v18 = *((void *)&v21 + 1);
  }
  *(_DWORD *)(v18 + 4 * v17) = v13;
  ++HIDWORD(v22);
  ++DWORD2(v23);
LABEL_15:
  re::HashTable<unsigned long long,re::SharedPtr<re::RealityFile>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::deinit((uint64_t *)&v21);
  objc_sync_exit(v6);
}

- (void)resourceFetchManager
{
  return self->_resourceFetchManager;
}

- (unint64_t)peerID
{
  return self->_peerID;
}

- (REResourceClientPorts)clientPorts
{
  return self->_clientPorts;
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (int)pidversion
{
  return self->_pidversion;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)self[2].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (HashTable<unsigned)pendingShaderGraphs
{
  p_m_touchedEntries = &self[1].m_touchedEntries;
  uint64_t v4 = *(void *)&self[1].m_touchedEntries;
  retstr->m_touchedEntries = 0;
  *(_OWORD *)&retstr->m_allocator = 0u;
  *(_OWORD *)&retstr->m_entries.withoutHash = 0u;
  *(void *)&retstr->m_freeList = 0x7FFFFFFFLL;
  if (v4)
  {
    if (HIDWORD(self[2].m_buckets) <= 3) {
      signed int m_buckets_high = 3;
    }
    else {
      signed int m_buckets_high = HIDWORD(self[2].m_buckets);
    }
    re::HashTable<re::StringID,unsigned int,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::init((uint64_t)retstr, v4, m_buckets_high);
    re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::copy((uint64_t)retstr, (uint64_t)p_m_touchedEntries);
  }
  return self;
}

- (void)setPendingShaderGraphs:(HashTable<unsigned long)long
{
  p_pendingShaderGraphs = &self->_pendingShaderGraphs;
  if (&self->_pendingShaderGraphs != a3)
  {
    m_allocator = a3->m_allocator;
    if (p_pendingShaderGraphs->m_allocator)
    {
      if (m_allocator)
      {
        re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::copy((uint64_t)&self->_pendingShaderGraphs, (uint64_t)a3);
        ++self->_pendingShaderGraphs.m_version;
      }
      else
      {
        BOOL v8 = &self->_pendingShaderGraphs;
        re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::clear((uint64_t)v8);
      }
    }
    else if (m_allocator)
    {
      if (a3->m_count <= 3) {
        unsigned int m_count = 3;
      }
      else {
        unsigned int m_count = a3->m_count;
      }
      re::HashTable<re::StringID,unsigned int,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::init((uint64_t)&self->_pendingShaderGraphs, (uint64_t)m_allocator, m_count);
      re::HashTable<unsigned long long,re::SharedPtr<re::SharedObject>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::copy((uint64_t)p_pendingShaderGraphs, (uint64_t)a3);
    }
  }
}

- (void).cxx_destruct
{
  re::HashTable<unsigned long long,re::SharedPtr<re::RealityFile>,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::deinit((uint64_t *)&self->_pendingShaderGraphs);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_clientPorts, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 28) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(void *)((char *)self + 116) = 0x7FFFFFFFLL;
  return self;
}

@end