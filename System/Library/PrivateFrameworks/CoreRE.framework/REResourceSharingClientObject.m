@interface REResourceSharingClientObject
- (AssetService)assetService;
- (REResourceSharingClientObject)initWithAssetService:(AssetService *)a3 resourceSharingManager:(void *)a4 peerID:(unint64_t)a5;
- (id)redactedDescription;
- (unint64_t)peerID;
- (void)fetchResourceAtAssetPath:(id)a3 withReply:(id)a4;
- (void)invalidate;
- (void)reportLoadState:(unsigned __int8)a3 forAssetId:(unint64_t)a4 assetSize:(unint64_t)a5 errorCode:(unsigned __int16)a6;
- (void)resourceSharingManager;
- (void)setSubscriptionOptions:(id)a3 forResourceAtAssetPath:(id)a4;
- (void)unsubscribeFromResourceAtAssetPath:(id)a3;
@end

@implementation REResourceSharingClientObject

- (REResourceSharingClientObject)initWithAssetService:(AssetService *)a3 resourceSharingManager:(void *)a4 peerID:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)REResourceSharingClientObject;
  result = [(REResourceSharingClientObject *)&v9 init];
  if (result)
  {
    result->_assetService = a3;
    result->_resourceSharingManager = a4;
    result->_peerID = a5;
  }
  return result;
}

- (void)invalidate
{
  self->_assetService = 0;
  self->_resourceSharingManager = 0;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<peer %llu>", self->_peerID);
}

- (void)fetchResourceAtAssetPath:(id)a3 withReply:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (re *)a4;
  v8 = v7;
  if (v6)
  {
    assetService = self->_assetService;
    if (assetService && self->_resourceSharingManager)
    {
      id v10 = v6;
      v11 = (re *)(*((void *(**)(uint64_t *__return_ptr, AssetService *, uint64_t, void))assetService->var0
                   + 22))(&v31, assetService, [v10 UTF8String], 0);
      if ((_BYTE)v31)
      {
        if (v32 == 4)
        {
          v21 = *re::resourceSharingLogObjects(v11);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v10;
            v13 = "Resource fetch request for peer asset path '%@' is not allowed";
            v14 = v21;
            uint32_t v15 = 12;
            goto LABEL_47;
          }
        }
        else
        {
          if (v32)
          {
            int v24 = v32;
            re::DynamicString::DynamicString((re::DynamicString *)&v25, (const re::DynamicString *)v33);
            re::DynamicString::DynamicString((re::DynamicString *)v27, (const re::DynamicString *)v35);
            uint64_t v28 = v35[4];
            v29 = self;
            aBlock = _Block_copy(v8);
            resourceSharingManager = self->_resourceSharingManager;
            int v36 = v24;
            re::DynamicString::DynamicString((re::DynamicString *)&v37, (const re::DynamicString *)&v25);
            re::DynamicString::DynamicString((re::DynamicString *)v39, (const re::DynamicString *)v27);
            uint64_t v40 = v28;
            v41 = v29;
            v42 = _Block_copy(aBlock);
            uint64_t v23 = *((void *)resourceSharingManager + 7);
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3321888768;
            *(void *)&buf[16] = ___ZN2re22ResourceSharingManager19enqueueFetchRequestENS0_12FetchRequestE_block_invoke;
            v44 = &__block_descriptor_136_a8_40c48_ZTSKN2re22ResourceSharingManager12FetchRequestE_e5_v8__0l;
            v45 = resourceSharingManager;
            int v46 = v36;
            re::DynamicString::DynamicString((re::DynamicString *)&v47, (const re::DynamicString *)&v37);
            re::DynamicString::DynamicString((re::DynamicString *)v49, (const re::DynamicString *)v39);
            v49[4] = v40;
            v50 = v41;
            id v51 = _Block_copy(v42);
            re::internal::ResourceRequestQueue::enqueue(v23, buf);
            re::internal::ResourceRequestQueue::flushAsync(*((void *)resourceSharingManager + 7), (dispatch_queue_t *)resourceSharingManager + 4);

            if (v49[0])
            {
              if (v49[1]) {
                (*(void (**)(void))(*(void *)v49[0] + 40))();
              }
              memset(v49, 0, 32);
            }
            if (v47 && (v48 & 1) != 0) {
              (*(void (**)(void))(*(void *)v47 + 40))();
            }

            if (v39[0])
            {
              if (v39[1]) {
                (*(void (**)(void))(*(void *)v39[0] + 40))();
              }
              memset(v39, 0, sizeof(v39));
            }
            if (v37 && (v38 & 1) != 0) {
              (*(void (**)(void))(*(void *)v37 + 40))();
            }

            if (v27[0])
            {
              if (v27[1]) {
                (*(void (**)(void))(*(void *)v27[0] + 40))();
              }
              memset(v27, 0, sizeof(v27));
            }
            if (v25 && (v26 & 1) != 0) {
              (*(void (**)(void))(*(void *)v25 + 40))();
            }
            goto LABEL_23;
          }
          v12 = *re::resourceSharingLogObjects(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            v13 = "Invalid resource fetch request for empty asset path";
            v14 = v12;
            uint32_t v15 = 2;
LABEL_47:
            _os_log_fault_impl(&dword_233120000, v14, OS_LOG_TYPE_FAULT, v13, buf, v15);
          }
        }
      }
      else
      {
        v19 = *re::resourceSharingLogObjects(v11);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          if (v33[16]) {
            v20 = *(unsigned char **)&v34[7];
          }
          else {
            v20 = v34;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v20;
          v13 = "Failed to handle resource fetch request for '%@': %s";
          v14 = v19;
          uint32_t v15 = 22;
          goto LABEL_47;
        }
      }
      re::makeResourceSharingError((__CFString *)0x1F4, 0, buf);
      (*((void (**)(re *, void, void))v8 + 2))(v8, 0, *(void *)buf);

LABEL_23:
      re::Result<re::AssetPath,re::DetailedError>::~Result(&v31);
      goto LABEL_24;
    }
    v16 = *re::resourceSharingLogObjects(v7);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl(&dword_233120000, v16, OS_LOG_TYPE_ERROR, "Resource connection %@ ignored a fetch request for '%@': service was deinited", buf, 0x16u);
    }
    uint64_t v17 = 401;
  }
  else
  {
    v18 = *re::resourceSharingLogObjects(v7);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = self;
      _os_log_fault_impl(&dword_233120000, v18, OS_LOG_TYPE_FAULT, "Resource connection %@ received an invalid fetch request for a nil asset path", buf, 0xCu);
    }
    uint64_t v17 = 500;
  }
  re::makeResourceSharingError((__CFString *)v17, 0, buf);
  (*((void (**)(re *, void, void))v8 + 2))(v8, 0, *(void *)buf);

LABEL_24:
}

- (void)setSubscriptionOptions:(id)a3 forResourceAtAssetPath:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    assetService = self->_assetService;
    if (assetService && self->_resourceSharingManager)
    {
      id v10 = v7;
      v11 = (re *)(*((void *(**)(uint64_t *__return_ptr, AssetService *, uint64_t, void))assetService->var0
                   + 22))(&v24, assetService, [v10 UTF8String], 0);
      if ((_BYTE)v24)
      {
        uint64_t v20 = 0;
        uint64_t v21 = 0;
        uint64_t v18 = v25[1];
        uint64_t v19 = 0;
        re::DynamicString::setCapacity(&v18, 0);
        re::AssetPath::fullAssetPath((re::DynamicString *)v25, (re::DynamicString *)&v18);
        v22 = self;
        id v23 = v6;
        resourceSharingManager = self->_resourceSharingManager;
        re::DynamicString::DynamicString((re::DynamicString *)&v28, (const re::DynamicString *)&v18);
        v30 = v22;
        id v31 = v23;
        uint64_t v13 = *((void *)resourceSharingManager + 7);
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3321888768;
        *(void *)&buf[16] = ___ZN2re22ResourceSharingManager24enqueueSetOptionsRequestENS0_17SetOptionsRequestE_block_invoke;
        v33 = &__block_descriptor_88_a8_40c52_ZTSN2re22ResourceSharingManager17SetOptionsRequestE_e5_v8__0l;
        v34 = resourceSharingManager;
        re::DynamicString::DynamicString((re::DynamicString *)&v35, (const re::DynamicString *)&v28);
        uint64_t v37 = v30;
        id v38 = v31;
        re::internal::ResourceRequestQueue::enqueue(v13, buf);
        re::internal::ResourceRequestQueue::flushAsync(*((void *)resourceSharingManager + 7), (dispatch_queue_t *)resourceSharingManager + 4);

        if (v35 && (v36 & 1) != 0) {
          (*(void (**)(void))(*(void *)v35 + 40))();
        }

        if (v28 && (v29 & 1) != 0) {
          (*(void (**)(void))(*(void *)v28 + 40))();
        }

        if (v18 && (v19 & 1) != 0) {
          (*(void (**)(void))(*(void *)v18 + 40))();
        }
      }
      else
      {
        v16 = *re::resourceSharingLogObjects(v11);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          if (v26) {
            uint64_t v17 = *(unsigned char **)&v27[7];
          }
          else {
            uint64_t v17 = v27;
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v17;
          _os_log_fault_impl(&dword_233120000, v16, OS_LOG_TYPE_FAULT, "Failed to handle resource set-options request for '%@': %s", buf, 0x16u);
        }
      }
      re::Result<re::AssetPath,re::DetailedError>::~Result(&v24);
    }
    else
    {
      v14 = *re::resourceSharingLogObjects((re *)v7);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_error_impl(&dword_233120000, v14, OS_LOG_TYPE_ERROR, "Resource connection %@ ignored an set-options request for '%@': service was deinited", buf, 0x16u);
      }
    }
  }
  else
  {
    uint32_t v15 = *re::resourceSharingLogObjects(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = self;
      _os_log_fault_impl(&dword_233120000, v15, OS_LOG_TYPE_FAULT, "Resource connection %@ received an invalid set-options request for a nil asset path", buf, 0xCu);
    }
  }
}

- (void)unsubscribeFromResourceAtAssetPath:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    assetService = self->_assetService;
    if (assetService && self->_resourceSharingManager)
    {
      id v7 = v4;
      v8 = (re *)(*((void *(**)(uint8_t *__return_ptr, AssetService *, uint64_t, void))assetService->var0
                  + 22))(buf, assetService, [v7 UTF8String], 0);
      if (buf[0])
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v15 = *(void *)&v26[2];
        uint64_t v16 = 0;
        re::DynamicString::setCapacity(&v15, 0);
        re::AssetPath::fullAssetPath((re::DynamicString *)((char *)&v24 + 4), (re::DynamicString *)&v15);
        uint64_t v19 = self;
        resourceSharingManager = self->_resourceSharingManager;
        re::DynamicString::DynamicString((re::DynamicString *)&v20, (const re::DynamicString *)&v15);
        v22 = v19;
        uint64_t v10 = *((void *)resourceSharingManager + 7);
        *(void *)char v29 = MEMORY[0x263EF8330];
        *(void *)&v29[8] = 3321888768;
        *(void *)&v29[16] = ___ZN2re22ResourceSharingManager25enqueueUnsubscribeRequestENS0_18UnsubscribeRequestE_block_invoke;
        v30 = &__block_descriptor_80_a8_40c54_ZTSKN2re22ResourceSharingManager18UnsubscribeRequestE_e5_v8__0l;
        id v31 = resourceSharingManager;
        re::DynamicString::DynamicString((re::DynamicString *)&v32, (const re::DynamicString *)&v20);
        v34 = v22;
        re::internal::ResourceRequestQueue::enqueue(v10, v29);
        re::internal::ResourceRequestQueue::flushAsync(*((void *)resourceSharingManager + 7), (dispatch_queue_t *)resourceSharingManager + 4);

        if (v32 && (v33 & 1) != 0) {
          (*(void (**)(void))(*(void *)v32 + 40))();
        }

        if (v20 && (v21 & 1) != 0) {
          (*(void (**)(void))(*(void *)v20 + 40))();
        }

        if (v15 && (v16 & 1) != 0) {
          (*(void (**)(void))(*(void *)v15 + 40))();
        }
      }
      else
      {
        uint64_t v13 = *re::resourceSharingLogObjects(v8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          if (v27) {
            v14 = *(unsigned char **)&v28[7];
          }
          else {
            v14 = v28;
          }
          *(_DWORD *)char v29 = 138412546;
          *(void *)&v29[4] = v7;
          *(_WORD *)&v29[12] = 2080;
          *(void *)&v29[14] = v14;
          _os_log_fault_impl(&dword_233120000, v13, OS_LOG_TYPE_FAULT, "Failed to handle resource unsubscribe request for '%@': %s", v29, 0x16u);
        }
      }
      re::Result<re::AssetPath,re::DetailedError>::~Result(buf);
    }
    else
    {
      v11 = *re::resourceSharingLogObjects((re *)v4);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = self;
        __int16 v25 = 2112;
        *(void *)char v26 = v5;
        _os_log_error_impl(&dword_233120000, v11, OS_LOG_TYPE_ERROR, "Resource connection %@ ignored an unsubscribe request for '%@': service was deinited", buf, 0x16u);
      }
    }
  }
  else
  {
    v12 = *re::resourceSharingLogObjects(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = self;
      _os_log_fault_impl(&dword_233120000, v12, OS_LOG_TYPE_FAULT, "Resource connection %@ received an invalid unsubscribe request for a nil asset path", buf, 0xCu);
    }
  }
}

- (void)reportLoadState:(unsigned __int8)a3 forAssetId:(unint64_t)a4 assetSize:(unint64_t)a5 errorCode:(unsigned __int16)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_assetService && self->_resourceSharingManager)
  {
    uint64_t v8 = a6;
    uint64_t v10 = a3;
    v11 = *re::resourceSharingLogObjects((re *)self);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = a5;
      _os_log_impl(&dword_233120000, v11, OS_LOG_TYPE_DEFAULT, "Received load state:%u for asset:%llu of size:%zu", buf, 0x1Cu);
    }
    resourceSharingManager = (dispatch_queue_t *)self->_resourceSharingManager;
    unint64_t peerID = self->_peerID;
    unint64_t v18 = a5;
    *(void *)buf = a4;
    dispatch_assert_queue_V2(resourceSharingManager[5]);
    if ((v10 - 4) >= 0xFEu)
    {
      dispatch_queue_t v14 = resourceSharingManager[10];
      if (v14)
      {
        uint64_t v15 = (uint64_t)&resourceSharingManager[12][9];
        uint64_t v16 = 168 * (void)v14;
        do
        {
          if ([*(id *)(v15 - 64) peerID] == peerID)
          {
            re::HashTable<unsigned long long,unsigned long,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::remove(v15, *(unint64_t *)buf);
            re::HashTable<unsigned long long,unsigned long,re::Hash<unsigned long long>,re::EqualTo<unsigned long long>,true,false>::addOrReplace<unsigned long &>(v15 + 48, (uint64_t *)buf, &v18);
          }
          v15 += 168;
          v16 -= 168;
        }
        while (v16);
      }
    }
    (*((void (**)(AssetService *, unint64_t, unint64_t, uint64_t, unint64_t, uint64_t))self->_assetService->var0
     + 49))(self->_assetService, a4, self->_peerID, v10, a5, v8);
  }
  else
  {
    uint64_t v17 = *re::resourceSharingLogObjects((re *)self);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a4;
      _os_log_error_impl(&dword_233120000, v17, OS_LOG_TYPE_ERROR, "Resource connection %@ ignored an unsubscribe request for '%llu': service was deinited", buf, 0x16u);
    }
  }
}

- (AssetService)assetService
{
  return self->_assetService;
}

- (void)resourceSharingManager
{
  return self->_resourceSharingManager;
}

- (unint64_t)peerID
{
  return self->_peerID;
}

@end