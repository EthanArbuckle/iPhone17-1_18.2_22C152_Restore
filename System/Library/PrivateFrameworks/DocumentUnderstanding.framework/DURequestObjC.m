@interface DURequestObjC
- (DURequestObjC)initWithClient:(id)a3 contentType:(id)a4 strategies:(id)a5;
- (void)executeWithDocument:(id)a3 completion:(id)a4;
@end

@implementation DURequestObjC

- (void).cxx_destruct
{
}

- (void)executeWithDocument:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10 = objc_msgSend_documentForObjCDocument_(DUObjCCompatibilityUtils, v7, (uint64_t)a3, v8, v9);
  underlyingRequest = self->_underlyingRequest;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_236978AE4;
  v15[3] = &unk_264CB4540;
  id v16 = v6;
  id v12 = v6;
  objc_msgSend_executeWithDocument_completion_(underlyingRequest, v13, (uint64_t)v10, (uint64_t)v15, v14);
}

- (DURequestObjC)initWithClient:(id)a3 contentType:(id)a4 strategies:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)DURequestObjC;
  uint64_t v14 = [(DURequestObjC *)&v45 init];
  if (v14)
  {
    id v40 = v8;
    v39 = objc_msgSend_clientForObjCClient_(DUObjCCompatibilityUtils, v11, (uint64_t)v8, v12, v13);
    v38 = objc_msgSend_typeForObjCType_(DUObjCCompatibilityUtils, v15, (uint64_t)v9, v16, v17);
    id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v19 = v10;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v41, (uint64_t)v46, 16);
    if (v21)
    {
      uint64_t v25 = v21;
      uint64_t v26 = *(void *)v42;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v19);
          }
          v31 = objc_msgSend_strategyForObjCStrategy_(DUObjCCompatibilityUtils, v22, *(void *)(*((void *)&v41 + 1) + 8 * v27), v23, v24);
          if (v31) {
            objc_msgSend_addObject_(v18, v28, (uint64_t)v31, v29, v30);
          }

          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v41, (uint64_t)v46, 16);
      }
      while (v25);
    }

    v32 = [_TtC21DocumentUnderstanding9DURequest alloc];
    uint64_t v34 = objc_msgSend_initWithClient_contentType_strategies_(v32, v33, (uint64_t)v39, (uint64_t)v38, (uint64_t)v18);
    underlyingRequest = v14->_underlyingRequest;
    v14->_underlyingRequest = (_TtC21DocumentUnderstanding9DURequest *)v34;

    v36 = v14;
    id v8 = v40;
  }

  return v14;
}

@end