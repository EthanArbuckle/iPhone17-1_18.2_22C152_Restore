@interface REResourceFetchServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (REResourceFetchServer)initWithResourceFetchManager:(void *)a3;
- (void)invalidate;
- (void)resourceFetchManager;
@end

@implementation REResourceFetchServer

- (REResourceFetchServer)initWithResourceFetchManager:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REResourceFetchServer;
  result = [(REResourceFetchServer *)&v5 init];
  if (result) {
    result->_resourceFetchManager = a3;
  }
  return result;
}

- (void)invalidate
{
  self->_resourceFetchManager = 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    resourceFetchManager = self->_resourceFetchManager;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = resourceFetchManager;
    _os_log_impl(&dword_233120000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%p listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection", buf, 0xCu);
  }
  v10 = (char *)self->_resourceFetchManager;
  if (v10)
  {
    id v40 = v7;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v10 + 4));
    v11 = (re *)[v40 processIdentifier];
    int v12 = (int)v11;
    v13 = re::resourceSharingLogObjects(v11)[1];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl(&dword_233120000, v13, OS_LOG_TYPE_DEFAULT, "Accepting new resource connection from client pid %d", buf, 8u);
    }
    id v14 = (id)voucher_copy();

    if (v14)
    {
      v16 = re::resourceSharingLogObjects(v15)[1];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v12;
        _os_log_impl(&dword_233120000, v16, OS_LOG_TYPE_DEFAULT, "Successfully harvested transport voucher on resource fetch connection for pid %d", buf, 8u);
      }
      id v45 = v14;
      os_unfair_lock_lock((os_unfair_lock_t)v10 + 48);
      re::ObjCObject::operator=((id *)v10 + 25, &v45);
      os_unfair_lock_unlock((os_unfair_lock_t)v10 + 48);
    }
    v17 = [[REResourceFetchClientObject alloc] initWithResourceFetchManager:v10 connection:&v40 voucher:v14];
    *(void *)buf = v17;
    re::xpc::Connection::setExportedObject(&v40, (const re::ObjCObject *)buf);

    re::ResourceFetchManager::xpcInterface(buf);
    re::xpc::Connection::setExportedInterface(&v40, (uint64_t *)buf);

    re::ResourceSharingManager::xpcInterface(buf);
    re::xpc::Connection::setRemoteObjectInterface(&v40, (uint64_t *)buf);

    re::xpc::Connection::setQueue(&v40, (const re::dispatch::Queue *)(v10 + 32));
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = ___ZN2re20ResourceFetchManager13addConnectionENS_3xpc10ConnectionE_block_invoke;
    v43[3] = &unk_264BE2330;
    v18 = v17;
    v44 = v18;
    [v40 setInterruptionHandler:v43];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = ___ZN2re20ResourceFetchManager13addConnectionENS_3xpc10ConnectionE_block_invoke_66;
    v41[3] = &unk_264BE2330;
    v19 = v18;
    v42 = v19;
    [v40 setInvalidationHandler:v41];
    os_unfair_lock_lock((os_unfair_lock_t)v10 + 16);
    *(void *)buf = v40;
    v20 = v19;
    *(void *)&buf[8] = v20;
    int v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v50 = 0x7FFFFFFFLL;
    unint64_t v22 = *((void *)v10 + 10);
    unint64_t v23 = *((void *)v10 + 11);
    if (v23 >= v22)
    {
      unint64_t v24 = v23 + 1;
      if (v22 < v23 + 1)
      {
        if (*((void *)v10 + 9))
        {
          uint64_t v25 = 2 * v22;
          BOOL v26 = v22 == 0;
          unint64_t v27 = 8;
          if (!v26) {
            unint64_t v27 = v25;
          }
          if (v27 <= v24) {
            unint64_t v28 = v24;
          }
          else {
            unint64_t v28 = v27;
          }
          re::DynamicArray<re::ResourceFetchManager::Connection>::setCapacity((void *)v10 + 9, v28);
        }
        else
        {
          re::DynamicArray<re::ResourceFetchManager::Connection>::setCapacity((void *)v10 + 9, v24);
          ++*((_DWORD *)v10 + 24);
        }
      }
      unint64_t v23 = *((void *)v10 + 11);
    }
    unint64_t v32 = *((void *)v10 + 13) + (v23 << 6);
    long long v33 = *(_OWORD *)buf;
    *(_OWORD *)buf = 0u;
    *(_OWORD *)unint64_t v32 = v33;
    *(void *)(v32 + 24) = 0;
    *(_OWORD *)(v32 + 32) = 0u;
    *(_DWORD *)(v32 + 48) = 0;
    *(_DWORD *)(v32 + 56) = 0;
    *(void *)(v32 + 16) = v47;
    *(void *)&long long v47 = 0;
    uint64_t v34 = *(void *)(v32 + 24);
    *(void *)(v32 + 24) = *((void *)&v47 + 1);
    *((void *)&v47 + 1) = v34;
    uint64_t v35 = *(void *)(v32 + 32);
    *(void *)(v32 + 32) = v48;
    *(void *)&long long v48 = v35;
    LODWORD(v35) = *(_DWORD *)(v32 + 40);
    *(_DWORD *)(v32 + 40) = DWORD2(v48);
    DWORD2(v48) = v35;
    LODWORD(v35) = *(_DWORD *)(v32 + 44);
    *(_DWORD *)(v32 + 44) = HIDWORD(v48);
    HIDWORD(v48) = v35;
    LODWORD(v35) = *(_DWORD *)(v32 + 48);
    *(_DWORD *)(v32 + 48) = v49;
    int v49 = v35;
    *(_DWORD *)(v32 + 52) = v50;
    LODWORD(v50) = 0x7FFFFFFF;
    ++*((void *)v10 + 11);
    ++*((_DWORD *)v10 + 24);
    re::HashTable<re::DynamicString,re::DynamicArray<re::ResourceFetchManager::Request *>,re::Hash<re::DynamicString>,re::EqualTo<re::DynamicString>,true,false>::deinit((uint64_t *)&v47);

    os_unfair_lock_unlock((os_unfair_lock_t)v10 + 16);
    uint64_t v36 = *((void *)v10 + 33);
    if (v36)
    {
      v37 = v20;
      *(void *)buf = v37;
      uint64_t v38 = re::directMeshConnectionId((void **)buf);
      (*(void (**)(uint64_t, uint64_t))(*(void *)v36 + 32))(v36, v38);
    }
    objc_msgSend(v40, "resume", v40);
  }
  else
  {
    v29 = re::resourceSharingLogObjects((re *)v8)[1];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      int v31 = [v7 processIdentifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v31;
      _os_log_error_impl(&dword_233120000, v30, OS_LOG_TYPE_ERROR, "Rejecting attempted resource connection from client pid %d: service was deinited", buf, 8u);
    }
  }

  return v10 != 0;
}

- (void)resourceFetchManager
{
  return self->_resourceFetchManager;
}

@end