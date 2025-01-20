@interface HKAttachmentStore
+ (id)clientInterface;
+ (id)serverInterface;
- (BOOL)_validateInputWithObject:(id)a3 contentType:(id)a4 URL:(id)a5 error:(id *)a6;
- (HKAttachmentStore)initWithHealthStore:(HKHealthStore *)healthStore;
- (HKHealthStore)healthStore;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSProgress)getDataForAttachment:(HKAttachment *)attachment completion:(void *)completion;
- (NSProgress)streamDataForAttachment:(HKAttachment *)attachment dataHandler:(void *)dataHandler;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)addAttachmentToObject:(HKObject *)object name:(NSString *)name contentType:(UTType *)contentType URL:(NSURL *)URL metadata:(NSDictionary *)metadata completion:(void *)completion;
- (void)addAttachmentWithName:(id)a3 contentType:(id)a4 URL:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 completion:(id)a10;
- (void)addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7;
- (void)attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5;
- (void)clientRemote_streamDataForAttachment:(id)a3 dataChunk:(id)a4 error:(id)a5 done:(BOOL)a6;
- (void)getAttachmentsForObject:(HKObject *)object completion:(void *)completion;
- (void)getDataChunkForAttachment:(id)a3 chunkSize:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6;
- (void)removeAttachment:(HKAttachment *)attachment fromObject:(HKObject *)object completion:(void *)completion;
- (void)removeReference:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5;
@end

@implementation HKAttachmentStore

- (HKAttachmentStore)initWithHealthStore:(HKHealthStore *)healthStore
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = healthStore;
  v18.receiver = self;
  v18.super_class = (Class)HKAttachmentStore;
  v6 = [(HKAttachmentStore *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, healthStore);
    v8 = [HKTaskServerProxyProvider alloc];
    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [(HKTaskServerProxyProvider *)v8 initWithHealthStore:v5 taskIdentifier:@"HKAttachmentStoreServerIdentifier" exportedObject:v7 taskUUID:v9];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachmentDataHandlersByIdentifier = v7->_attachmentDataHandlersByIdentifier;
    v7->_attachmentDataHandlersByIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataStreamProgressByIdentifier = v7->_dataStreamProgressByIdentifier;
    v7->_dataStreamProgressByIdentifier = v14;

    v7->_lock._os_unfair_lock_opaque = 0;
    [(HKProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:1];
    _HKInitializeLogging();
    v16 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_19C023000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Created new attachment store", buf, 0xCu);
    }
  }

  return v7;
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED11930];
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED53150];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion_ argumentIndex:0 ofReply:1];
  [v2 setClasses:v5 forSelector:sel_remote_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)exportedInterface
{
  return +[HKAttachmentStore clientInterface];
}

- (id)remoteInterface
{
  return +[HKAttachmentStore serverInterface];
}

- (void)addAttachmentToObject:(HKObject *)object name:(NSString *)name contentType:(UTType *)contentType URL:(NSURL *)URL metadata:(NSDictionary *)metadata completion:(void *)completion
{
  v14 = object;
  v15 = name;
  v16 = contentType;
  v17 = URL;
  objc_super v18 = metadata;
  v19 = completion;
  id v26 = 0;
  BOOL v20 = [(HKAttachmentStore *)self _validateInputWithObject:v14 contentType:v16 URL:v17 error:&v26];
  id v21 = v26;
  if (v20)
  {
    v22 = [(HKObject *)v14 attachmentObjectIdentifier];
    v23 = [(HKObject *)v14 attachmentSchemaIdentifier];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __84__HKAttachmentStore_addAttachmentToObject_name_contentType_URL_metadata_completion___block_invoke;
    v24[3] = &unk_1E58C4BD8;
    id v25 = v19;
    [(HKAttachmentStore *)self addAttachmentWithName:v15 contentType:v16 URL:v17 toObjectWithIdentifier:v22 schemaIdentifier:v23 attachmentMetadata:v18 referenceMetadata:0 completion:v24];
  }
  else
  {
    (*((void (**)(void *, void, id))v19 + 2))(v19, 0, v21);
  }
}

void __84__HKAttachmentStore_addAttachmentToObject_name_contentType_URL_metadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 attachment];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)removeAttachment:(HKAttachment *)attachment fromObject:(HKObject *)object completion:(void *)completion
{
  v8 = attachment;
  v9 = object;
  uint64_t v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:completion];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke;
  v17[3] = &unk_1E58C4C00;
  objc_super v18 = v8;
  v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  v13 = v9;
  v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

void __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) attachmentObjectIdentifier];
  id v6 = [*(id *)(a1 + 40) attachmentSchemaIdentifier];
  objc_msgSend(v4, "remote_removeAllReferencesWithAttachmentIdentifier:objectIdentifier:schemaIdentifier:completion:", v7, v5, v6, *(void *)(a1 + 48));
}

uint64_t __60__HKAttachmentStore_removeAttachment_fromObject_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAttachmentsForObject:(HKObject *)object completion:(void *)completion
{
  id v6 = completion;
  id v7 = object;
  v8 = [(HKObject *)v7 attachmentObjectIdentifier];
  v9 = [(HKObject *)v7 attachmentSchemaIdentifier];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HKAttachmentStore_getAttachmentsForObject_completion___block_invoke;
  v11[3] = &unk_1E58C3E80;
  id v12 = v6;
  id v10 = v6;
  [(HKAttachmentStore *)self attachmentReferencesForObjectIdentifier:v8 schemaIdentifier:v9 completion:v11];
}

void __56__HKAttachmentStore_getAttachmentsForObject_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "hk_map:", &__block_literal_global_76);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__HKAttachmentStore_getAttachmentsForObject_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 attachment];
}

- (NSProgress)getDataForAttachment:(HKAttachment *)attachment completion:(void *)completion
{
  proxyProvider = self->_proxyProvider;
  id v7 = attachment;
  v8 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:completion];
  v9 = [MEMORY[0x1E4F1CA58] data];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HKAttachmentStore_getDataForAttachment_completion___block_invoke;
  v14[3] = &unk_1E58C4C48;
  id v15 = v9;
  id v16 = v8;
  id v10 = v9;
  id v11 = v8;
  id v12 = [(HKAttachmentStore *)self streamDataForAttachment:v7 dataHandler:v14];

  return (NSProgress *)v12;
}

void __53__HKAttachmentStore_getDataForAttachment_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v10 = a2;
  id v7 = a3;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendData:");
    if (a4)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = (void *)[*(id *)(a1 + 32) copy];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (NSProgress)streamDataForAttachment:(HKAttachment *)attachment dataHandler:(void *)dataHandler
{
  id v6 = attachment;
  id v7 = dataHandler;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke;
  aBlock[3] = &unk_1E58C4C70;
  aBlock[4] = self;
  id v25 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  v9 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", -[HKAttachment size](v6, "size"));
  os_unfair_lock_lock(&self->_lock);
  id v10 = _Block_copy(v8);
  attachmentDataHandlersByIdentifier = self->_attachmentDataHandlersByIdentifier;
  id v12 = [(HKAttachment *)v6 identifier];
  [(NSMutableDictionary *)attachmentDataHandlersByIdentifier setObject:v10 forKeyedSubscript:v12];

  dataStreamProgressByIdentifier = self->_dataStreamProgressByIdentifier;
  v14 = [(HKAttachment *)v6 identifier];
  [(NSMutableDictionary *)dataStreamProgressByIdentifier setObject:v9 forKeyedSubscript:v14];

  os_unfair_lock_unlock(&self->_lock);
  proxyProvider = self->_proxyProvider;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_3;
  v22[3] = &unk_1E58C4C98;
  v23 = v6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_4;
  v19[3] = &unk_1E58BDA48;
  v19[4] = self;
  id v20 = v23;
  id v21 = v8;
  id v16 = v8;
  v17 = v23;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v22 errorHandler:v19];

  return (NSProgress *)v9;
}

void __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = [*(id *)(*(void *)(a1 + 32) + 40) clientQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_2;
  v13[3] = &unk_1E58BF598;
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  id v14 = v7;
  char v17 = a4;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  }
  return result;
}

uint64_t __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_streamDataForAttachment:", *(void *)(a1 + 32));
}

void __57__HKAttachmentStore_streamDataForAttachment_dataHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 24);
  id v8 = a2;
  os_unfair_lock_lock(v3);
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = [*(id *)(a1 + 40) identifier];
  [v4 setObject:0 forKeyedSubscript:v5];

  id v6 = *(void **)(*(void *)(a1 + 32) + 16);
  id v7 = [*(id *)(a1 + 40) identifier];
  [v6 setObject:0 forKeyedSubscript:v7];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a7];
  proxyProvider = self->_proxyProvider;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke;
  v25[3] = &unk_1E58C4CC0;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v30 = v16;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke_2;
  v23[3] = &unk_1E58BBD88;
  id v24 = v30;
  id v18 = v30;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v25 errorHandler:v23];
}

uint64_t __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_addReferenceWithAttachment:toObjectWithIdentifier:schemaIdentifier:metadata:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

uint64_t __108__HKAttachmentStore_addReferenceWithAttachment_toObjectWithIdentifier_schemaIdentifier_metadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeReference:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke;
  v17[3] = &unk_1E58C4C00;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

void __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 attachment];
  id v5 = [v7 identifier];
  id v6 = [*(id *)(a1 + 32) objectIdentifier];
  objc_msgSend(v4, "remote_removeAllReferencesWithAttachmentIdentifier:objectIdentifier:schemaIdentifier:completion:", v5, v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __65__HKAttachmentStore_removeReference_schemaIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addAttachmentWithName:(id)a3 contentType:(id)a4 URL:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 completion:(id)a10
{
  id v36 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  proxyProvider = self->_proxyProvider;
  id v22 = a5;
  v23 = [(HKProxyProvider *)proxyProvider clientQueueObjectHandlerWithCompletion:a10];
  v49[0] = 0;
  id v24 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v22 error:v49];

  id v25 = v49[0];
  if (!v24) {
    ((void (**)(void, void, id))v23)[2](v23, 0, v25);
  }
  id v26 = self->_proxyProvider;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke;
  v40[3] = &unk_1E58C4CE8;
  id v41 = v36;
  id v42 = v16;
  v35 = v25;
  id v43 = v24;
  id v44 = v17;
  id v45 = v18;
  id v46 = v19;
  id v47 = v20;
  v48 = v23;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke_2;
  v37[3] = &unk_1E58BBC48;
  id v38 = v43;
  id v39 = v48;
  id v27 = v48;
  id v28 = v43;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  id v32 = v17;
  id v33 = v16;
  id v34 = v36;
  [(HKProxyProvider *)v26 fetchProxyWithHandler:v40 errorHandler:v37];
}

void __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 identifier];
  objc_msgSend(v5, "remote_addAttachmentWithName:contentTypeIdentifier:fileHandle:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:completion:", v3, v6, a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

void __147__HKAttachmentStore_addAttachmentWithName_contentType_URL_toObjectWithIdentifier_schemaIdentifier_attachmentMetadata_referenceMetadata_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 closeFile];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke;
  v17[3] = &unk_1E58C4C00;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_attachmentReferencesForObjectIdentifier:schemaIdentifier:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __89__HKAttachmentStore_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getDataChunkForAttachment:(id)a3 chunkSize:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a6];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke;
  v17[3] = &unk_1E58C4D10;
  id v18 = v10;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  id v19 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_getDataChunkForAttachment:chunkSize:offset:completion:", a1[4], a1[6], a1[7], a1[5]);
}

uint64_t __75__HKAttachmentStore_getDataChunkForAttachment_chunkSize_offset_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_validateInputWithObject:(id)a3 contentType:(id)a4 URL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    id v13 = [v12 sampleType];
    char v14 = [v13 supportsAttachments];

    if (v14)
    {
      if ([v11 isFileURL])
      {
        id v15 = (void *)MEMORY[0x1E4F442D8];
        id v16 = [v11 pathExtension];
        id v17 = [v15 typeWithFilenameExtension:v16];

        if (v17 && ([v10 conformsToType:v17] & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Content Type is not equal to URL extension type");
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          id v32 = v31;
          if (v31)
          {
            if (a6) {
              *a6 = v31;
            }
            else {
              _HKLogDroppedError(v31);
            }
          }

          char v24 = 0;
          goto LABEL_31;
        }
        id v18 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        id v19 = [v11 path];
        id v36 = 0;
        unint64_t v20 = [v18 attributesOfItemAtPath:v19 error:&v36];
        id v21 = v36;

        v35 = v21;
        if (v20)
        {
          uint64_t v22 = objc_msgSend(v20, "fileSize", v21);
          id v23 = [v12 sampleType];
          char v24 = [v23 canAttachFileOfType:v10 size:v22 error:a6];
LABEL_30:

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        id v33 = v21;
        id v23 = v33;
        if (v33)
        {
          if (a6)
          {
            id v23 = v33;
            char v24 = 0;
            *a6 = v23;
            goto LABEL_30;
          }
          _HKLogDroppedError(v33);
        }
        char v24 = 0;
        goto LABEL_30;
      }
      id v27 = (void *)MEMORY[0x1E4F28C58];
      id v28 = @"Only file URLs are supported";
    }
    else
    {
      id v27 = (void *)MEMORY[0x1E4F28C58];
      id v28 = @"The object type is not supported";
    }
    objc_msgSend(v27, "hk_error:format:", 3, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = v29;
    if (v29)
    {
      if (a6) {
        *a6 = v29;
      }
      else {
        _HKLogDroppedError(v29);
      }
    }

    char v24 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"The object type is not supported");
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v25;
  if (v25)
  {
    if (a6) {
      *a6 = v25;
    }
    else {
      _HKLogDroppedError(v25);
    }
  }

  char v24 = 0;
LABEL_33:

  return v24;
}

- (void)clientRemote_streamDataForAttachment:(id)a3 dataChunk:(id)a4 error:(id)a5 done:(BOOL)a6
{
  BOOL v6 = a6;
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  attachmentDataHandlersByIdentifier = self->_attachmentDataHandlersByIdentifier;
  char v14 = [v23 identifier];
  id v15 = [(NSMutableDictionary *)attachmentDataHandlersByIdentifier objectForKeyedSubscript:v14];

  dataStreamProgressByIdentifier = self->_dataStreamProgressByIdentifier;
  id v17 = [v23 identifier];
  id v18 = [(NSMutableDictionary *)dataStreamProgressByIdentifier objectForKeyedSubscript:v17];

  os_unfair_lock_unlock(&self->_lock);
  if ([v18 isFinished])
  {
    if (!v6) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend(v18, "setCompletedUnitCount:", objc_msgSend(v18, "totalUnitCount"));
    if (!v6)
    {
LABEL_3:
      if (!v15) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  os_unfair_lock_lock(&self->_lock);
  id v19 = self->_attachmentDataHandlersByIdentifier;
  unint64_t v20 = [v23 identifier];
  [(NSMutableDictionary *)v19 setObject:0 forKeyedSubscript:v20];

  id v21 = self->_dataStreamProgressByIdentifier;
  uint64_t v22 = [v23 identifier];
  [(NSMutableDictionary *)v21 setObject:0 forKeyedSubscript:v22];

  os_unfair_lock_unlock(p_lock);
  if (v15) {
LABEL_4:
  }
    ((void (**)(void, id, id, BOOL))v15)[2](v15, v10, v11, v6);
LABEL_5:
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_dataStreamProgressByIdentifier, 0);

  objc_storeStrong((id *)&self->_attachmentDataHandlersByIdentifier, 0);
}

@end