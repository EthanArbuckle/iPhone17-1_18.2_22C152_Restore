@interface HDAttachmentStoreServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (uint64_t)_isAuthorizedToReadAttachment:(uint64_t)a3 error:;
- (void)_lock_closeReaderForAttachmentIdentifier:(uint64_t)a1;
- (void)remote_addAttachmentWithName:(id)a3 contentTypeIdentifier:(id)a4 fileHandle:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 completion:(id)a10;
- (void)remote_addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7;
- (void)remote_attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5;
- (void)remote_getDataChunkForAttachment:(id)a3 chunkSize:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6;
- (void)remote_removeAllReferencesWithAttachmentIdentifier:(id)a3 objectIdentifier:(id)a4 schemaIdentifier:(id)a5 completion:(id)a6;
- (void)remote_streamDataForAttachment:(id)a3;
@end

@implementation HDAttachmentStoreServer

- (void)remote_addReferenceWithAttachment:(id)a3 toObjectWithIdentifier:(id)a4 schemaIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *, id))a7;
  v17 = [(HDStandardTaskServer *)self client];
  char v18 = [v17 hasEntitlement:*MEMORY[0x1E4F2A528]];

  if (v18)
  {
    v19 = [(HDStandardTaskServer *)self profile];
    v20 = [v19 attachmentManager];
    [(HDStandardTaskServer *)self client];
    id v21 = v15;
    v23 = id v22 = v12;
    id v37 = 0;
    char v24 = [v20 writeAuthorizationForObjectIdentifier:v13 schemaIdentifier:v14 client:v23 error:&v37];
    id v35 = v14;
    id v25 = v13;
    char v26 = v24;
    id v27 = v37;

    id v12 = v22;
    id v15 = v21;

    if (v26)
    {
      v28 = [(HDStandardTaskServer *)self profile];
      v29 = [v28 attachmentManager];
      id v36 = v27;
      v30 = v25;
      id v31 = v25;
      id v14 = v35;
      v32 = [v29 addReferenceWithAttachment:v12 toObjectWithIdentifier:v31 schemaIdentifier:v35 metadata:v15 error:&v36];
      id v33 = v36;

      v16[2](v16, v32, v33);
      id v27 = v33;
    }
    else
    {
      v30 = v25;
      v16[2](v16, 0, v27);
      id v14 = v35;
    }

    id v13 = v30;
  }
  else
  {
    v34 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Missing required entitlement");
    v16[2](v16, 0, v34);
  }
}

- (void)remote_addAttachmentWithName:(id)a3 contentTypeIdentifier:(id)a4 fileHandle:(id)a5 toObjectWithIdentifier:(id)a6 schemaIdentifier:(id)a7 attachmentMetadata:(id)a8 referenceMetadata:(id)a9 completion:(id)a10
{
  id v36 = a3;
  id v38 = a4;
  id v37 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = (void (**)(id, void, void *))a10;
  id v21 = [(HDStandardTaskServer *)self profile];
  id v22 = [v21 daemon];
  v23 = [v22 behavior];
  LODWORD(a5) = [v23 isAppleWatch];

  if (a5)
  {
    char v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 2, @"Unable to add attachments on this device");
    v20[2](v20, 0, v24);

    id v25 = v36;
  }
  else
  {
    id v35 = v18;
    char v26 = [(HDStandardTaskServer *)self profile];
    id v27 = [v26 attachmentManager];
    v28 = [(HDStandardTaskServer *)self client];
    id v40 = 0;
    char v29 = [v27 writeAuthorizationForObjectIdentifier:v16 schemaIdentifier:v17 client:v28 error:&v40];
    id v30 = v40;

    if (v29)
    {
      id v31 = [(HDStandardTaskServer *)self profile];
      v32 = [v31 attachmentManager];
      id v39 = 0;
      id v25 = v36;
      id v33 = [v32 addAttachmentWithName:v36 contentTypeIdentifier:v38 fileHandle:v37 toObjectWithIdentifier:v16 schemaIdentifier:v17 attachmentMetadata:v35 referenceMetadata:v19 error:&v39];
      id v34 = v39;

      ((void (**)(id, void *, void *))v20)[2](v20, v33, v34);
    }
    else
    {
      v20[2](v20, 0, v30);
      id v25 = v36;
    }

    id v18 = v35;
  }
}

- (void)remote_removeAllReferencesWithAttachmentIdentifier:(id)a3 objectIdentifier:(id)a4 schemaIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, id))a6;
  id v14 = [(HDStandardTaskServer *)self profile];
  id v15 = [v14 attachmentManager];
  id v16 = [(HDStandardTaskServer *)self client];
  id v24 = 0;
  char v17 = [v15 writeAuthorizationForObjectIdentifier:v11 schemaIdentifier:v12 client:v16 error:&v24];
  id v18 = v24;

  if (v17)
  {
    id v19 = [(HDStandardTaskServer *)self profile];
    v20 = [v19 attachmentManager];
    id v23 = v18;
    uint64_t v21 = [v20 removeAllReferencesWithAttachmentIdentifier:v10 objectIdentifier:v11 schemaIdentifier:v12 error:&v23];
    id v22 = v23;

    v13[2](v13, v21, v22);
    id v18 = v22;
  }
  else
  {
    v13[2](v13, 0, v18);
  }
}

- (void)remote_attachmentReferencesForObjectIdentifier:(id)a3 schemaIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = [(HDStandardTaskServer *)self profile];
  id v12 = [v11 attachmentManager];
  id v13 = [(HDStandardTaskServer *)self client];
  id v43 = 0;
  char v14 = [v12 readAuthorizationForObjectIdentifier:v8 schemaIdentifier:v9 client:v13 error:&v43];
  id v15 = v43;

  if (v14)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v42 = v15;
    if (self)
    {
      id v17 = v9;
      id v18 = [(HDStandardTaskServer *)self profile];
      id v19 = [v18 attachmentManager];
      v20 = [v19 schemaProviderForIdentifier:v17 error:&v42];

      uint64_t v21 = v42;
    }
    else
    {
      v20 = 0;
      uint64_t v21 = v15;
    }
    id v22 = v21;

    if (v20)
    {
      id v23 = [(HDStandardTaskServer *)self profile];
      id v41 = 0;
      uint64_t v24 = [v20 schemaVersionForObjectIdentifier:v8 profile:v23 error:&v41];
      id v25 = v41;

      if (v24 <= 0)
      {
        v10[2](v10, 0, v25);
        id v32 = 0;
      }
      else
      {
        id v35 = v25;
        char v26 = [(HDStandardTaskServer *)self profile];
        uint64_t v27 = [v26 attachmentManager];
        v28 = v16;
        char v29 = (void *)v27;
        uint64_t v39 = v24;
        id v40 = 0;
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __102__HDAttachmentStoreServer_remote_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke;
        v37[3] = &unk_1E62FB198;
        id v36 = v28;
        id v30 = v28;
        id v38 = v30;
        char v31 = [v29 attachmentReferencesForObjectIdentifier:v8 schemaIdentifier:v9 error:&v40 enumerationHandler:v37];
        id v32 = v40;

        if (v31)
        {
          id v33 = v30;
          id v34 = 0;
        }
        else
        {
          id v33 = 0;
          id v34 = v32;
        }
        ((void (**)(id, id, id))v10)[2](v10, v33, v34);

        id v25 = v35;
        id v16 = v36;
      }
    }
    else
    {
      v10[2](v10, 0, v22);
    }
  }
  else
  {
    v10[2](v10, 0, v15);
    id v22 = v15;
  }
}

uint64_t __102__HDAttachmentStoreServer_remote_attachmentReferencesForObjectIdentifier_schemaIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 >= [v5 schemaVersion])
  {
    id v8 = [v5 hkAttachmentReferenceWithAttachment:v6];
    [*(id *)(a1 + 32) addObject:v8];
  }
  return 1;
}

- (void)remote_streamDataForAttachment:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__HDAttachmentStoreServer_remote_streamDataForAttachment___block_invoke;
  v29[3] = &unk_1E62F3170;
  v29[4] = self;
  id v5 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v29];
  id v6 = [v4 identifier];
  uint64_t v7 = [(HDStandardTaskServer *)self profile];
  id v28 = 0;
  id v8 = +[HDAttachmentEntity attachmentWithIdentifier:v6 profile:v7 error:&v28];
  id v9 = v28;

  if (v8)
  {
    id v27 = v9;
    char v10 = -[HDAttachmentStoreServer _isAuthorizedToReadAttachment:error:](self, v8, (uint64_t)&v27);
    id v11 = v27;

    if (v10)
    {
      id v12 = [(HDStandardTaskServer *)self profile];
      id v13 = [v12 attachmentManager];
      id v26 = v11;
      char v14 = [v13 readerForAttachment:v8 error:&v26];
      id v15 = v26;

      if (v14)
      {
        uint64_t v16 = *MEMORY[0x1E4F29710];
        id v25 = v15;
        id v17 = [v14 readDataUpToLength:v16 offset:0 error:&v25];
        id v18 = v25;

        if (v17)
        {
          uint64_t v19 = 0;
          while ([v17 length])
          {
            objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, v17, 0, 0);
            v19 += [v17 length];

            id v25 = v18;
            id v17 = [v14 readDataUpToLength:v16 offset:v19 error:&v25];
            id v15 = v25;

            id v18 = v15;
            if (!v17) {
              goto LABEL_14;
            }
          }
          [v14 close];
          objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, v17, 0, 1);

          id v15 = v18;
          goto LABEL_18;
        }
        id v15 = v18;
LABEL_14:
        _HKInitializeLogging();
        id v22 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          id v23 = v22;
          uint64_t v24 = [v4 identifier];
          *(_DWORD *)buf = 138543874;
          char v31 = self;
          __int16 v32 = 2114;
          id v33 = v24;
          __int16 v34 = 2114;
          id v35 = v15;
          _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to read file for attachment %{public}@. %{public}@", buf, 0x20u);
        }
        [v14 close];
      }
      objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, 0, v15, 1);
LABEL_18:

      id v11 = v15;
      goto LABEL_19;
    }
    objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, 0, v11, 1);
  }
  else
  {
    if (!v9)
    {
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = [v4 identifier];
      objc_msgSend(v20, "hk_error:format:", 118, @"The attachment with identifier %@ was not found.", v21);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "clientRemote_streamDataForAttachment:dataChunk:error:done:", v4, 0, v9, 1);
    id v11 = v9;
  }
LABEL_19:
}

void __58__HDAttachmentStoreServer_remote_streamDataForAttachment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to get HKAttachmentStore remote object proxy: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (uint64_t)_isAuthorizedToReadAttachment:(uint64_t)a3 error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v26 = v5;
  if (a1)
  {
    id v6 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    __int16 v8 = [a1 profile];
    id v9 = [v8 attachmentManager];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __63__HDAttachmentStoreServer__isAuthorizedToReadAttachment_error___block_invoke;
    v33[3] = &unk_1E62FB1C0;
    id v10 = v7;
    id v34 = v10;
    int v11 = [v9 attachmentReferencesForAttachment:v6 error:a3 enumerationHandler:v33];

    if (v11)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = v10;
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v25 = v10;
        uint64_t v28 = a3;
        uint64_t v14 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v17 = objc_msgSend(a1, "profile", v25, v26);
            id v18 = [v17 attachmentManager];
            uint64_t v19 = [v16 objectIdentifier];
            v20 = [v16 schemaIdentifier];
            uint64_t v21 = [a1 client];
            char v22 = [v18 readAuthorizationForObjectIdentifier:v19 schemaIdentifier:v20 client:v21 error:v28];

            if (v22)
            {
              uint64_t v23 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        uint64_t v23 = 0;
LABEL_14:
        id v10 = v25;
      }
      else
      {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

- (void)remote_getDataChunkForAttachment:(id)a3 chunkSize:(unint64_t)a4 offset:(unint64_t)a5 completion:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = (void (**)(id, void, id))a6;
  os_unfair_lock_lock(&self->_lock);
  openReadersByAttachment = self->_openReadersByAttachment;
  uint64_t v13 = [v10 identifier];
  uint64_t v14 = [(NSMutableDictionary *)openReadersByAttachment objectForKeyedSubscript:v13];

  os_unfair_lock_unlock(&self->_lock);
  if (v14)
  {
    id v15 = 0;
    goto LABEL_16;
  }
  unint64_t v36 = a5;
  unint64_t v37 = a4;
  id v40 = 0;
  id v38 = v10;
  uint64_t v16 = [v38 identifier];
  id v17 = [(HDStandardTaskServer *)self profile];
  *(void *)buf = 0;
  id v18 = +[HDAttachmentEntity attachmentWithIdentifier:v16 profile:v17 error:buf];
  id v19 = *(id *)buf;

  if (!v18)
  {
    if (v19)
    {
      id v25 = v19;
      uint64_t v23 = v38;
    }
    else
    {
      id v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = v38;
      id v27 = [v38 identifier];
      uint64_t v28 = objc_msgSend(v26, "hk_error:format:", 118, @"The attachment with identifier %@ was not found.", v27);

      id v25 = v28;
      if (!v25)
      {
        id v19 = 0;
        goto LABEL_13;
      }
    }
    id v19 = v25;
    id v40 = v19;

LABEL_13:
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  if (!-[HDAttachmentStoreServer _isAuthorizedToReadAttachment:error:](self, v18, (uint64_t)&v40))
  {
    uint64_t v14 = 0;
    goto LABEL_10;
  }
  v20 = [(HDStandardTaskServer *)self profile];
  uint64_t v21 = [v20 attachmentManager];
  uint64_t v14 = [v21 readerForAttachment:v18 error:&v40];

  if (!v14)
  {
LABEL_10:
    uint64_t v23 = v38;
    goto LABEL_14;
  }
  os_unfair_lock_lock(&self->_lock);
  char v22 = self->_openReadersByAttachment;
  uint64_t v23 = v38;
  uint64_t v24 = [v38 identifier];
  [(NSMutableDictionary *)v22 setObject:v14 forKeyedSubscript:v24];

  os_unfair_lock_unlock(&self->_lock);
LABEL_14:

  id v15 = v40;
  if (!v14)
  {
    v11[2](v11, 0, v15);
    goto LABEL_24;
  }
  a5 = v36;
  a4 = v37;
LABEL_16:
  long long v29 = v15;
  id v39 = v15;
  long long v30 = [v14 readDataUpToLength:a4 offset:a5 error:&v39];
  id v15 = v39;

  if (v30)
  {
    ((void (**)(id, void *, id))v11)[2](v11, v30, 0);
    if (![v30 length] || objc_msgSend(v30, "length") < a4)
    {
      long long v31 = [v10 identifier];
      -[HDAttachmentStoreServer _lock_closeReaderForAttachmentIdentifier:]((uint64_t)self, v31);
    }
  }
  else
  {
    long long v32 = [v10 identifier];
    -[HDAttachmentStoreServer _lock_closeReaderForAttachmentIdentifier:]((uint64_t)self, v32);

    _HKInitializeLogging();
    id v33 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      id v34 = v33;
      id v35 = [v10 identifier];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      __int16 v42 = 2114;
      id v43 = v35;
      __int16 v44 = 2114;
      id v45 = v15;
      _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to read file for attachment %{public}@. %{public}@", buf, 0x20u);
    }
    v11[2](v11, 0, v15);
  }

LABEL_24:
}

- (void)_lock_closeReaderForAttachmentIdentifier:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 48);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v4];
    [v5 close];
    [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

uint64_t __63__HDAttachmentStoreServer__isAuthorizedToReadAttachment_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F29720];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AC18] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AC18] clientInterface];
}

- (void).cxx_destruct
{
}

@end