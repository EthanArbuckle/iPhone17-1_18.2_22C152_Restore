@interface NSProgressRegistrar
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSProgressRegistrar)initWithQueue:(id)a3 rootFileAccessNode:(id)a4;
- (void)_getRemoteProcessWithAuditToken:(id *)a3 canReadItemAtURL:(id)a4 completionHandler:(id)a5;
- (void)addPublisher:(id)a3 forID:(id)a4 acknowledgementAppBundleIDs:(id)a5 category:(id)a6 fileURL:(id)a7 initialValues:(id)a8 completionHandler:(id)a9;
- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 category:(id)a6 completionHandler:(id)a7;
- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 fileURL:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5;
- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5;
- (void)removePublisherForID:(id)a3;
- (void)removeSubscriberForID:(id)a3;
@end

@implementation NSProgressRegistrar

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  v15[8] = *MEMORY[0x1E4F143B8];
  v9 = (void *)[(NSMutableDictionary *)self->_publishersByID objectForKey:a3];
  if (v9)
  {
    v10 = v9;
    [v9 observeUserInfoValue:a4 forKey:a5];
    uint64_t v11 = [v10 category];
    if (v11)
    {
      subscribersByID = self->_subscribersByID;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke;
      v15[3] = &unk_1E51F66F0;
      v15[4] = v11;
      v15[5] = a3;
      v15[6] = a4;
      v15[7] = a5;
      [(NSMutableDictionary *)subscribersByID enumerateKeysAndObjectsUsingBlock:v15];
    }
    v13 = (void *)[v10 itemLocation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke_2;
    v14[3] = &unk_1E51F6718;
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    [v13 forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:v14];
  }
}

uint64_t __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke_2(void *a1, void *a2)
{
  return [a2 observePublisherUserInfoForID:a1[4] value:a1[5] forKey:a1[6]];
}

- (NSProgressRegistrar)initWithQueue:(id)a3 rootFileAccessNode:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NSProgressRegistrar;
  v6 = [(NSProgressRegistrar *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v7->_publishersByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_publisherTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_subscribersByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_subscriberTransactionsByID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_pendingFileSubscriberIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v7->_rootFileAccessNode = (NSFileAccessNode *)a4;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSProgressRegistrar;
  [(NSProgressRegistrar *)&v4 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7[6] = *MEMORY[0x1E4F143B8];
  [a4 setExportedObject:self];
  objc_msgSend(a4, "setExportedInterface:", +[NSProgress _registrarInterface](NSProgress, "_registrarInterface"));
  [a4 _setQueue:self->_queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_1E51F6678;
  v7[4] = self;
  v7[5] = a4;
  [a4 setInvalidationHandler:v7];
  [a4 resume];
  return 1;
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_2;
  v15[3] = &unk_1E51F6628;
  v15[4] = *(void *)(a1 + 40);
  v3 = (void *)[v2 keysOfEntriesPassingTest:v15];
  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_3;
  v14[3] = &unk_1E51F6650;
  v14[4] = *(void *)(a1 + 40);
  uint64_t v5 = (void *)[v4 keysOfEntriesPassingTest:v14];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(a1 + 32) removeSubscriberForID:*(void *)(*((void *)&v22 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v3 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v7);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t result = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) removePublisherForID:*(void *)(*((void *)&v17 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t result = [v5 countByEnumeratingWithState:&v17 objects:v16 count:16];
      uint64_t v11 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isFromConnection:*(void *)(a1 + 32)];
}

uint64_t __58__NSProgressRegistrar_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 isFromConnection:*(void *)(a1 + 32)];
}

- (void)addPublisher:(id)a3 forID:(id)a4 acknowledgementAppBundleIDs:(id)a5 category:(id)a6 fileURL:(id)a7 initialValues:(id)a8 completionHandler:(id)a9
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v16 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v17 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218755;
      v28 = self;
      __int16 v29 = 2114;
      id v30 = a4;
      __int16 v31 = 2113;
      id v32 = a7;
      __int16 v33 = 2114;
      id v34 = a6;
      _os_log_debug_impl(&dword_181795000, v17, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriberProxy %p> Add publisher ID %{public}@ for URL %{private}@ in category %{public}@", buf, 0x2Au);
    }
  }
  long long v18 = +[NSXPCConnection currentConnection];
  long long v19 = (NSProgressPublisherProxy *)[(NSMutableDictionary *)self->_publishersByID objectForKey:a4];
  if (!v19)
  {
    long long v19 = [[NSProgressPublisherProxy alloc] initWithForwarder:a3 onConnection:v18 publisherID:a4 values:a8];
    [(NSMutableDictionary *)self->_publishersByID setObject:v19 forKey:a4];

    [+[NSString stringWithFormat:@"Pub: %@ (%d cat: %@ URL: %@)", a4, [(NSXPCConnection *)v18 processIdentifier], a6, a7] UTF8String];
    long long v20 = (void *)os_transaction_create();
    [(NSMutableDictionary *)self->_publisherTransactionsByID setObject:v20 forKey:a4];
  }
  v21 = (void *)[a5 mutableCopy];
  if (a6)
  {
    subscribersByID = self->_subscribersByID;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke;
    v26[3] = &unk_1E51F66A0;
    v26[4] = a6;
    v26[5] = v19;
    v26[6] = a4;
    v26[7] = a8;
    v26[8] = v21;
    [(NSMutableDictionary *)subscribersByID enumerateKeysAndObjectsUsingBlock:v26];
    [(NSProgressPublisherProxy *)v19 setCategory:a6];
  }
  if (a7)
  {
    id v23 = [(NSFileAccessNode *)self->_rootFileAccessNode descendantForFileURL:a7];
    if (v23)
    {
      id v24 = v23;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke_2;
      v25[3] = &unk_1E51F66C8;
      v25[4] = v19;
      v25[5] = a4;
      v25[6] = a8;
      v25[7] = v21;
      [v23 forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:v25];
      [(NSProgressPublisherProxy *)v19 setItemLocation:v24];
    }
  }
  (*((void (**)(id, void *))a9 + 2))(a9, v21);
}

uint64_t __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if (result)
  {
    [a3 addPublisher:a1[5] forID:a1[6] withValues:a1[7] isOld:0];
    uint64_t result = objc_msgSend((id)objc_msgSend(a3, "appBundleID"), "lowercaseString");
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = (void *)a1[8];
      return [v7 removeObject:v6];
    }
  }
  return result;
}

uint64_t __119__NSProgressRegistrar_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler___block_invoke_2(void *a1, void *a2)
{
  [a2 addPublisher:a1[4] forID:a1[5] withValues:a1[6] isOld:0];
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "appBundleID"), "lowercaseString");
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = (void *)a1[7];
    return [v6 removeObject:v5];
  }
  return result;
}

uint64_t __66__NSProgressRegistrar_observePublisherUserInfoForID_value_forKey___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if (result)
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    return [a3 observePublisherUserInfoForID:v6 value:v7 forKey:v8];
  }
  return result;
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  v15[8] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_publishersByID objectForKey:a3];
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 observeValues:a4 forKeys:a5];
    uint64_t v11 = [v10 category];
    if (v11)
    {
      subscribersByID = self->_subscribersByID;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke;
      v15[3] = &unk_1E51F66F0;
      v15[4] = v11;
      void v15[5] = a3;
      v15[6] = a4;
      v15[7] = a5;
      [(NSMutableDictionary *)subscribersByID enumerateKeysAndObjectsUsingBlock:v15];
    }
    uint64_t v13 = (void *)[v10 itemLocation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke_2;
    v14[3] = &unk_1E51F6718;
    v14[4] = a3;
    void v14[5] = a4;
    v14[6] = a5;
    [v13 forEachProgressSubscriberOfItemOrContainingItemPerformProcedure:v14];
  }
}

uint64_t __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", a1[4]);
  if (result)
  {
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    return [a3 observePublisherForID:v6 values:v7 forKeys:v8];
  }
  return result;
}

uint64_t __60__NSProgressRegistrar_observePublisherForID_values_forKeys___block_invoke_2(void *a1, void *a2)
{
  return [a2 observePublisherForID:a1[4] values:a1[5] forKeys:a1[6]];
}

- (void)removePublisherForID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v13 = self;
      __int16 v14 = 2114;
      id v15 = a3;
      _os_log_debug_impl(&dword_181795000, v6, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriberProxy %p> Remove publisher ID %{public}@", buf, 0x16u);
    }
  }
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_publishersByID objectForKey:a3];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [v7 category];
    if (v9)
    {
      subscribersByID = self->_subscribersByID;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __44__NSProgressRegistrar_removePublisherForID___block_invoke;
      v11[3] = &unk_1E51F6740;
      v11[4] = v9;
      v11[5] = a3;
      [(NSMutableDictionary *)subscribersByID enumerateKeysAndObjectsUsingBlock:v11];
    }
    [v8 setItemLocation:0];
    [(NSMutableDictionary *)self->_publishersByID removeObjectForKey:a3];
    [(NSMutableDictionary *)self->_publisherTransactionsByID removeObjectForKey:a3];
  }
}

uint64_t __44__NSProgressRegistrar_removePublisherForID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(void *)(a1 + 32));
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    return [a3 removePublisherForID:v6];
  }
  return result;
}

- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 category:(id)a6 completionHandler:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v15 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v24 = 134218754;
      *(void *)&v24[4] = self;
      *(_WORD *)&v24[12] = 2048;
      *(void *)&v24[14] = a3;
      *(_WORD *)&v24[22] = 2114;
      *(void *)&v24[24] = a4;
      __int16 v25 = 2114;
      id v26 = a6;
      _os_log_debug_impl(&dword_181795000, v15, OS_LOG_TYPE_DEBUG, "<NSProgressRegistrar %p> Add subscriber %p forID: %{public}@ in category %{public}@", v24, 0x2Au);
    }
  }
  uint64_t v16 = +[NSXPCConnection currentConnection];
  long long v17 = v16;
  memset(v24, 0, sizeof(v24));
  if (v16) {
    [(NSXPCConnection *)v16 auditToken];
  }
  *(_OWORD *)buf = *(_OWORD *)v24;
  *(_OWORD *)&buf[16] = *(_OWORD *)&v24[16];
  if (sandbox_check_by_audit_token())
  {
    long long v18 = _NSOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = a6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a5;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = a4;
      _os_log_error_impl(&dword_181795000, v18, OS_LOG_TYPE_ERROR, "sandboxing denied subscription to progress on category %@ (bundle id %@, %@)", buf, 0x20u);
    }
  }
  long long v19 = (NSProgressSubscriberProxy *)[(NSMutableDictionary *)self->_subscribersByID objectForKey:a4];
  if (!v19)
  {
    long long v19 = [[NSProgressSubscriberProxy alloc] initWithForwarder:a3 onConnection:v17 subscriberID:a4 appBundleID:a5];
    [(NSProgressSubscriberProxy *)v19 setCategory:a6];
    [(NSMutableDictionary *)self->_subscribersByID setObject:v19 forKey:a4];

    [+[NSString stringWithFormat:@"Sub: %@ (%d bundle: %@ cat: %@)", a4, [(NSXPCConnection *)v17 processIdentifier], a5, a6] UTF8String];
    long long v20 = (void *)os_transaction_create();
    [(NSMutableDictionary *)self->_subscriberTransactionsByID setObject:v20 forKey:a4];
  }
  publishersByID = self->_publishersByID;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__NSProgressRegistrar_addSubscriber_forID_appBundleID_category_completionHandler___block_invoke;
  v22[3] = &unk_1E51F6768;
  v22[4] = a6;
  v22[5] = v19;
  [(NSMutableDictionary *)publishersByID enumerateKeysAndObjectsUsingBlock:v22];
  (*((void (**)(id))a7 + 2))(a7);
}

uint64_t __82__NSProgressRegistrar_addSubscriber_forID_appBundleID_category_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "category"), "isEqualToString:", *(void *)(a1 + 32));
  if (result)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [a3 publisherID];
    uint64_t v8 = [a3 values];
    return [v6 addPublisher:a3 forID:v7 withValues:v8 isOld:1];
  }
  return result;
}

- (void)_getRemoteProcessWithAuditToken:(id *)a3 canReadItemAtURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v9 = *MEMORY[0x1E4F14100];
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  long long v10 = *(_OWORD *)&a3->var0[4];
  long long v39 = *(_OWORD *)a3->var0;
  long long v40 = v10;
  int v11 = sandbox_check_by_audit_token();
  int v12 = objc_msgSend((id)objc_msgSend(a4, "lastPathComponent"), "isEqualToString:", @"f13c05f5-944f-4466-bc09-c73815293ab8");
  unsigned int v13 = v12;
  if (v11) {
    int v14 = 1;
  }
  else {
    int v14 = v12;
  }
  if (v14 != 1)
  {
    *((unsigned char *)v29 + 24) = 1;
LABEL_25:
    if (*((unsigned char *)v29 + 24)) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v13;
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v26);
    goto LABEL_29;
  }
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = &v39;
  long long v40 = 0x2020000000uLL;
  *((void *)&v40 + 1) = [a4 fileSystemRepresentation];
  uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 24);
  if (v15)
  {
    long long v16 = *(_OWORD *)&a3->var0[4];
    long long v37 = *(_OWORD *)a3->var0;
    long long v38 = v16;
    uint64_t v27 = v15;
    BOOL v17 = sandbox_check_by_audit_token() == 0;
    *((unsigned char *)v29 + 24) = v17;
    if (v17) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v29 + 24))
  {
    goto LABEL_16;
  }
  for (i = objc_msgSend(a4, "URLByDeletingLastPathComponent", v27);
        i;
        i = (void *)[i URLByDeletingLastPathComponent])
  {
    if ([i checkResourceIsReachableAndReturnError:0])
    {
      uint64_t v19 = [i fileSystemRepresentation];
      *(void *)(*((void *)&v39 + 1) + 24) = v19;
      if (v19)
      {
        long long v20 = *(_OWORD *)&a3->var0[4];
        long long v37 = *(_OWORD *)a3->var0;
        long long v38 = v20;
        uint64_t v27 = v19;
        *((unsigned char *)v29 + 24) = sandbox_check_by_audit_token() == 0;
      }
      break;
    }
  }
LABEL_16:
  if (*((unsigned char *)v29 + 24)) {
    int v21 = v13;
  }
  else {
    int v21 = 1;
  }
  if (v21 != 1)
  {
    _Block_object_dispose(&v39, 8);
    goto LABEL_25;
  }
  id v22 = [(NSFileAccessNode *)self->_rootFileAccessNode descendantForFileURL:a4];
  id v23 = (void *)[v22 itemProvider];
  id v24 = v23;
  if (v23)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    long long v25 = *(_OWORD *)&a3->var0[4];
    long long v33 = *(_OWORD *)a3->var0;
    v32[2] = __90__NSProgressRegistrar__getRemoteProcessWithAuditToken_canReadItemAtURL_completionHandler___block_invoke;
    v32[3] = &unk_1E51F6790;
    v32[5] = &v39;
    v32[6] = &v28;
    long long v34 = v25;
    int v35 = v9;
    v32[4] = a5;
    char v36 = v13;
    [v23 providePhysicalURLForURL:a4 completionHandler:v32];
  }
  objc_msgSend(v22, "removeSelfIfUseless", v27);
  _Block_object_dispose(&v39, 8);
  if (!v24) {
    goto LABEL_25;
  }
LABEL_29:
  _Block_object_dispose(&v28, 8);
}

uint64_t __90__NSProgressRegistrar__getRemoteProcessWithAuditToken_canReadItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 fileSystemRepresentation];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sandbox_check_by_audit_token() == 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(a1 + 92) != 0;
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

- (void)addSubscriber:(id)a3 forID:(id)a4 appBundleID:(id)a5 fileURL:(id)a6 completionHandler:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218755;
      id v22 = self;
      __int16 v23 = 2048;
      id v24 = a3;
      __int16 v25 = 2114;
      id v26 = a4;
      __int16 v27 = 2113;
      id v28 = a6;
      _os_log_debug_impl(&dword_181795000, v15, OS_LOG_TYPE_DEBUG, "<NSProgressRegistrar %p> Add subscriber %p forID: %{public}@ for URL %{private}@", buf, 0x2Au);
    }
  }
  long long v16 = +[NSXPCConnection currentConnection];
  if (a6)
  {
    BOOL v17 = v16;
    [(NSMutableSet *)self->_pendingFileSubscriberIDs addObject:a4];
    [+[NSString stringWithFormat:@"Sub: %@ (%d bundle: %@ URL: %@)", a4, [(NSXPCConnection *)v17 processIdentifier], a5, a6] UTF8String];
    uint64_t v18 = os_transaction_create();
    if (v17) {
      [(NSXPCConnection *)v17 auditToken];
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke;
    v19[3] = &unk_1E51F6808;
    v19[4] = self;
    v19[5] = a4;
    v19[6] = v18;
    v19[7] = a6;
    v19[8] = a5;
    v19[9] = a3;
    v19[10] = v17;
    v19[11] = a7;
    [(NSProgressRegistrar *)self _getRemoteProcessWithAuditToken:v20 canReadItemAtURL:a6 completionHandler:v19];
  }
  else
  {
    (*((void (**)(id))a7 + 2))(a7);
  }
}

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
    if (a2)
    {
      objc_super v4 = (NSProgressSubscriberProxy *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
      if (!v4)
      {
        objc_super v4 = [[NSProgressSubscriberProxy alloc] initWithForwarder:*(void *)(a1 + 72) onConnection:*(void *)(a1 + 80) subscriberID:*(void *)(a1 + 40) appBundleID:*(void *)(a1 + 64)];
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v4 forKey:*(void *)(a1 + 40)];

        [*(id *)(*(void *)(a1 + 32) + 40) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
      }
      uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) descendantForFileURL:*(void *)(a1 + 56)];
      if ([v5 itemProvider])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3052000000;
        uint64_t v18 = __Block_byref_object_copy_;
        uint64_t v19 = __Block_byref_object_dispose_;
        uint64_t v20 = 0;
        uint64_t v6 = dispatch_semaphore_create(0);
        uint64_t v7 = (void *)[v5 itemProvider];
        uint64_t v8 = *(void *)(a1 + 56);
        v16[5] = MEMORY[0x1E4F143A8];
        v16[6] = 3221225472;
        v16[7] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_146;
        v16[8] = &unk_1E51F67B8;
        v16[10] = v6;
        v16[11] = buf;
        v16[9] = v8;
        objc_msgSend(v7, "provideLogicalURLForURL:completionHandler:");
        dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
        dispatch_release(v6);
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "descendantForFileURL:");

          if ((void *)v9 != v5)
          {
            [v5 removeSelfIfUseless];
            uint64_t v5 = (void *)v9;
          }
        }
        _Block_object_dispose(buf, 8);
      }
      if (v5)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_2;
        v16[3] = &unk_1E51F67E0;
        v16[4] = v4;
        [v5 forEachProgressPublisherOfItemOrContainedItemPerformProcedure:v16];
        [(NSProgressSubscriberProxy *)v4 setItemLocation:v5];
      }
      return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
    }
    else
    {
      int v12 = _NSOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 64);
        uint64_t v15 = *(void (**)(uint64_t, uint64_t))(a1 + 40);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v18 = v15;
        _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "sandboxing denied subscription to progress on URL %@ (bundle id %@, %@)", buf, 0x20u);
      }

      return (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16))();
    }
  }
  else
  {

    int v11 = *(uint64_t (**)(void))(*(void *)(a1 + 88) + 16);
    return v11();
  }
}

intptr_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_146(void *a1, void *a2)
{
  if ([a2 logicalURL] != a1[4]) {
    *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a2 logicalURL];
  }
  objc_super v4 = a1[5];

  return dispatch_semaphore_signal(v4);
}

uint64_t __81__NSProgressRegistrar_addSubscriber_forID_appBundleID_fileURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 publisherID];
  uint64_t v5 = [a2 values];

  return [v3 addPublisher:a2 forID:v4 withValues:v5 isOld:1];
}

- (void)removeSubscriberForID:(id)a3
{
  v10[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_subscribersByID objectForKey:a3];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 appBundleID];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = (void *)[v6 itemLocation];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __45__NSProgressRegistrar_removeSubscriberForID___block_invoke;
      v10[3] = &unk_1E51F67E0;
      v10[4] = v8;
      [v9 forEachProgressPublisherOfItemOrContainedItemPerformProcedure:v10];
    }
    [v6 setItemLocation:0];
    [(NSMutableDictionary *)self->_subscribersByID removeObjectForKey:a3];
    [(NSMutableDictionary *)self->_subscriberTransactionsByID removeObjectForKey:a3];
  }
  [(NSMutableSet *)self->_pendingFileSubscriberIDs removeObject:a3];
}

uint64_t __45__NSProgressRegistrar_removeSubscriberForID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 appWithBundleID:*(void *)(a1 + 32) didAcknowledgeWithSuccess:0];
}

@end