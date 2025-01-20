@interface DUStructuredEntityResponseObjC
- (DUDebugInfoObjC)responseDebugInfo;
- (DUStructuredEntityResponseObjC)init;
- (NSArray)structuredEntities;
- (void)setResponseDebugInfo:(id)a3;
- (void)setStructuredEntities:(id)a3;
@end

@implementation DUStructuredEntityResponseObjC

- (void).cxx_destruct
{
}

- (void)setResponseDebugInfo:(id)a3
{
  objc_msgSend_debugInfoForObjCDebugInfo_(DUObjCCompatibilityUtils, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseDebugInfo_(self->_underlying, v6, (uint64_t)v9, v7, v8);
}

- (DUDebugInfoObjC)responseDebugInfo
{
  v5 = objc_msgSend_responseDebugInfo(self->_underlying, a2, v2, v3, v4);
  id v9 = objc_msgSend_objcDebugInfoForDebugInfo_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);

  return (DUDebugInfoObjC *)v9;
}

- (void)setStructuredEntities:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v6);
        }
        v15 = objc_msgSend_structuredEntityForObjCStructuredEntity_(DUObjCCompatibilityUtils, v9, *(void *)(*((void *)&v22 + 1) + 8 * v14), v10, v11, (void)v22);
        objc_msgSend_addObject_(v5, v16, (uint64_t)v15, v17, v18);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v12);
  }

  objc_msgSend_setStructuredEntities_(self->_underlying, v19, (uint64_t)v5, v20, v21);
}

- (NSArray)structuredEntities
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = objc_msgSend_structuredEntities(self->_underlying, v4, v5, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = objc_msgSend_objCStructuredEntityForStructuredEntity_(DUObjCCompatibilityUtils, v11, *(void *)(*((void *)&v22 + 1) + 8 * i), v12, v13);
        objc_msgSend_addObject_(v3, v18, (uint64_t)v17, v19, v20);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }

  return (NSArray *)v3;
}

- (DUStructuredEntityResponseObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUStructuredEntityResponseObjC;
  uint64_t v2 = [(DUStructuredEntityResponseObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding26DUStructuredEntityResponse);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end