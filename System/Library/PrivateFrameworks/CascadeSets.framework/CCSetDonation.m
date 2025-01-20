@interface CCSetDonation
+ (id)donationWithName:(id)a3 itemType:(unsigned __int16)a4 service:(id)a5 payload:(unint64_t)a6;
+ (void)_setDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 remoteDevice:(id)a6 version:(unint64_t)a7 validity:(id)a8 serviceProvider:(id)a9 queue:(id)a10 timeoutNanos:(unint64_t)delta completion:(id)a12;
+ (void)deleteSetWithItemType:(unsigned __int16)a3 descriptors:(id)a4 completion:(id)a5;
+ (void)deleteSetWithItemType:(unsigned __int16)a3 descriptors:(id)a4 serviceProvider:(id)a5 completion:(id)a6;
+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 completion:(id)a5;
+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 serviceProvider:(id)a5 completion:(id)a6;
+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 completion:(id)a6;
+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 serviceProvider:(id)a6 completion:(id)a7;
+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 version:(unint64_t)a5 validity:(id)a6 completion:(id)a7;
+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 version:(unint64_t)a5 validity:(id)a6 serviceProvider:(id)a7 completion:(id)a8;
+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8;
+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 serviceProvider:(id)a8 completion:(id)a9;
+ (void)remoteCRDTSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 fromDevice:(id)a5 descriptors:(id)a6 serviceProvider:(id)a7 completion:(id)a8;
- (BOOL)_flushItemsWithError:(id *)a3;
- (BOOL)_mergeDelta:(id)a3;
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)finishWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeSourceItemIdentifier:(id)a3 error:(id *)a4;
- (CCSetDonation)init;
- (CCSetDonation)initWithName:(id)a3 itemType:(unsigned __int16)a4 service:(id)a5 payload:(unint64_t)a6 flushThreshold:(unint64_t)a7;
- (OS_dispatch_queue)queue;
- (id)description;
- (int64_t)errorCode;
- (unint64_t)priorVersion;
- (void)cancel;
- (void)dealloc;
@end

@implementation CCSetDonation

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (CCValidateNonNilField(@"item", (uint64_t)v6, a4))
  {
    v7 = (objc_class *)objc_opt_class();
    if (CCValidateIsInstanceOfExpectedClass(@"item", v6, v7, a4))
    {
      v8 = [v6 content];
      int v9 = [(id)objc_opt_class() itemType];
      int itemType = self->_itemType;

      if (v9 == itemType)
      {
        v11 = [v6 metaContent];
        int v12 = [(id)objc_opt_class() itemType];
        int v13 = self->_itemType;

        if (v12 == v13)
        {
          v14 = [v6 content];
          v15 = [v14 data];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v26 = (void *)MEMORY[0x263F087E8];
            uint64_t v51 = *MEMORY[0x263F08320];
            v18 = [NSString stringWithFormat:@"Donation %@ item has invalid content buffer: %@", self, v6];
            v52 = v18;
            v19 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
            v20 = v26;
            goto LABEL_13;
          }
          unint64_t v16 = [v15 length];
          if (v16 >= 0xC801)
          {
            v17 = (void *)MEMORY[0x263F087E8];
            uint64_t v49 = *MEMORY[0x263F08320];
            v18 = [NSString stringWithFormat:@"Donation %@ item content must be less than %lu bytes, received %lu: %@", self, 51200, v16, v6];
            v50 = v18;
            v19 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            v20 = v17;
LABEL_13:
            v27 = [v20 errorWithDomain:@"com.apple.CascadeSets.Item" code:4 userInfo:v19];
            CCSetError(a4, v27);

            goto LABEL_14;
          }
          v29 = [v6 metaContent];
          v18 = [v29 data];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 length])
          {
            unint64_t v30 = [v18 length];
            if (v30 < 0xC801)
            {
              if (self->_service)
              {
                [(NSMutableArray *)self->_contentBuffers addObject:v15];
                [(NSMutableArray *)self->_metaContentBuffers addObject:v18];
                unint64_t flushThreshold = self->_flushThreshold;
                unint64_t v38 = v30 + v16 + self->_bufferSize;
                self->_bufferSize = v38;
                BOOL v21 = v38 < flushThreshold || [(CCSetDonation *)self _flushItemsWithError:a4];
                goto LABEL_16;
              }
              name = self->_name;
              v40 = NSString;
              v41 = [v6 metaContent];
              v42 = [v41 sourceItemIdentifier];
              v43 = [v40 stringWithFormat:@"add item with sourceItemIdentifier: %@", v42];
              v44 = _donationInactiveError((uint64_t)name, (uint64_t)v43);
              CCSetError(a4, v44);

LABEL_15:
              BOOL v21 = 0;
LABEL_16:

              goto LABEL_17;
            }
            v31 = (void *)MEMORY[0x263F087E8];
            uint64_t v45 = *MEMORY[0x263F08320];
            v19 = [NSString stringWithFormat:@"Donation %@ item meta content must be less than %lu bytes, received %lu: %@", self, 51200, v30, v6];
            v46 = v19;
            v32 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            v33 = [v31 errorWithDomain:@"com.apple.CascadeSets.Item" code:4 userInfo:v32];
            CCSetError(a4, v33);
          }
          else
          {
            v34 = (void *)MEMORY[0x263F087E8];
            uint64_t v47 = *MEMORY[0x263F08320];
            v19 = [NSString stringWithFormat:@"Donation %@ item has invalid meta content buffer: %@", self, v6];
            v48 = v19;
            v35 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
            v36 = [v34 errorWithDomain:@"com.apple.CascadeSets.Item" code:4 userInfo:v35];
            CCSetError(a4, v36);
          }
LABEL_14:

          goto LABEL_15;
        }
        v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v53 = *MEMORY[0x263F08320];
        v15 = [NSString stringWithFormat:@"Donation %@ item metaContent must have itemType: %hu. Received: %@", self, self->_itemType, v6];
        v54 = v15;
        v23 = NSDictionary;
        v24 = &v54;
        v25 = &v53;
      }
      else
      {
        v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v55 = *MEMORY[0x263F08320];
        v15 = [NSString stringWithFormat:@"Donation %@ item content must have itemType: %hu. Received: %@", self, self->_itemType, v6];
        v56[0] = v15;
        v23 = NSDictionary;
        v24 = (void **)v56;
        v25 = &v55;
      }
      v18 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
      v19 = [v22 errorWithDomain:@"com.apple.CascadeSets.Set" code:1 userInfo:v18];
      CCSetError(a4, v19);
      goto LABEL_14;
    }
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 completion:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  int v12 = objc_opt_class();
  _sharedXPCClientFactory();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v12 fullSetDonationWithItemType:v8 forAccount:v11 descriptors:v10 serviceProvider:v13 completion:v9];
}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 serviceProvider:(id)a6 completion:(id)a7
{
  uint64_t v10 = a3;
  id v12 = a7;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __95__CCSetDonation_fullSetDonationWithItemType_forAccount_descriptors_serviceProvider_completion___block_invoke;
  v19[3] = &unk_26527A2C0;
  id v20 = v12;
  id v13 = v12;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = (void *)MEMORY[0x24C5B1320](v19);
  v18 = _sharedQueue();
  [a1 _setDonationWithItemType:v10 forAccount:v16 descriptors:v15 remoteDevice:0 version:0 validity:0 serviceProvider:v14 queue:v18 timeoutNanos:120000000000 completion:v17];
}

+ (void)_setDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 remoteDevice:(id)a6 version:(unint64_t)a7 validity:(id)a8 serviceProvider:(id)a9 queue:(id)a10 timeoutNanos:(unint64_t)delta completion:(id)a12
{
  uint64_t v16 = a3;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v17 = a4;
  id v18 = a5;
  id v46 = a6;
  id v47 = a8;
  id v48 = a9;
  v19 = a10;
  id v20 = a12;
  BOOL v21 = v20;
  if (v20)
  {
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x2020000000;
    char v80 = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__1;
    v77[4] = __Block_byref_object_dispose__1;
    id v78 = (id)MEMORY[0x24C5B1320](v20);
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke;
    v76[3] = &unk_26527A310;
    v76[4] = v77;
    uint64_t v45 = (void *)MEMORY[0x24C5B1320](v76);
    id v22 = v18;
    v23 = v22;
    if (v17)
    {
      id v75 = 0;
      CCAddAcountInfoToDescriptors(v22, (uint64_t)v17, (uint64_t)&v75);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v25 = v75;

      if (!v24)
      {
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2;
        v72[3] = &unk_26527A338;
        id v73 = v25;
        id v74 = v45;
        id v24 = v25;
        dispatch_async(v19, v72);

        id v30 = v74;
LABEL_21:

        _Block_object_dispose(v77, 8);
        _Block_object_dispose(v79, 8);
        goto LABEL_22;
      }
    }
    else
    {
      id v24 = v22;
    }
    v27 = CCTypeIdentifierRegistryBridge();
    char v28 = [v27 isValidItemType:v16];

    if (v28)
    {
      id v68 = 0;
      v29 = +[BMResourceDescriptor encodedStringFromDescriptors:v24 error:&v68];
      id v30 = v68;
      v44 = v29;
      if (v29)
      {
        v43 = CCDonateServiceRequestDescription(a7, v47, v16, v29, v46);
        v42 = objc_msgSend(v48, "makeConnection:");
        if (v42)
        {
          v31 = __biome_log_for_category();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v43;
            _os_log_impl(&dword_249B92000, v31, OS_LOG_TYPE_DEFAULT, "Requesting new set donation %@", buf, 0xCu);
          }

          v55[0] = MEMORY[0x263EF8330];
          v55[1] = 3221225472;
          v55[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_21;
          v55[3] = &unk_26527A3B0;
          queue = v19;
          v56 = queue;
          v60 = v79;
          id v32 = v43;
          id v57 = v32;
          __int16 v61 = v16;
          id v33 = v42;
          id v58 = v33;
          id v40 = v45;
          id v59 = v40;
          [v33 beginSetDonationWithItemType:v16 remoteDevice:v46 encodedDescriptors:v44 version:a7 validity:v47 completion:v55];
          objc_initWeak((id *)buf, v33);
          dispatch_time_t when = dispatch_time(0, delta);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_28;
          block[3] = &unk_26527A3D8;
          uint64_t v53 = v79;
          objc_copyWeak(v54, (id *)buf);
          v54[1] = (id)delta;
          id v50 = v32;
          id v51 = v48;
          id v52 = v40;
          id v34 = v32;
          dispatch_after(when, queue, block);

          objc_destroyWeak(v54);
          objc_destroyWeak((id *)buf);

          v35 = (id *)&v56;
          v36 = &v57;
        }
        else
        {
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          v62[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_5;
          v62[3] = &unk_26527A338;
          v35 = &v64;
          v36 = &v63;
          v63 = v43;
          id v64 = v45;
          id v38 = v43;
          dispatch_async(v19, v62);
        }

        v37 = v42;
      }
      else
      {
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_4;
        v65[3] = &unk_26527A338;
        id v67 = v45;
        id v66 = v30;
        dispatch_async(v19, v65);

        v37 = v67;
      }
    }
    else
    {
      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_3;
      v69[3] = &unk_26527A360;
      id v70 = v45;
      __int16 v71 = v16;
      dispatch_async(v19, v69);
      id v30 = v70;
    }
    goto LABEL_21;
  }
  v26 = __biome_log_for_category();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    +[CCSetDonation _setDonationWithItemType:forAccount:descriptors:remoteDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:](v26);
  }

LABEL_22:
}

- (BOOL)finishWithOptions:(unint64_t)a3 error:(id *)a4
{
  if (!self->_service)
  {
    id v12 = _donationInactiveError((uint64_t)self->_name, @"finish");
    CCSetError(a4, v12);

    return 0;
  }
  if (![(CCSetDonation *)self _flushItemsWithError:a4])
  {
    [(CCSetDonation *)self cancel];
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  __int16 v18 = 0;
  service = self->_service;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__CCSetDonation_finishWithOptions_error___block_invoke;
  v14[3] = &unk_26527A400;
  v14[4] = &v15;
  [(CCDonateService *)service endSetDonationWithOptions:a3 completion:v14];
  uint64_t v8 = self->_service;
  self->_service = 0;

  unsigned int v9 = *((unsigned __int16 *)v16 + 12);
  BOOL v10 = v9 == 7;
  if (v9 != 7)
  {
    id v11 = _donationResponseError(self->_name, @"finish", v9);
    CCSetError(a4, v11);
  }
  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)_flushItemsWithError:(id *)a3
{
  if (![(NSMutableArray *)self->_contentBuffers count]) {
    return 1;
  }
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"add %u item(s)", -[NSMutableArray count](self->_contentBuffers, "count"));
  id v6 = (void *)[(NSMutableArray *)self->_contentBuffers copy];
  v7 = (void *)[(NSMutableArray *)self->_metaContentBuffers copy];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  __int16 v18 = 0;
  service = self->_service;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __38__CCSetDonation__flushItemsWithError___block_invoke;
  v14[3] = &unk_26527A400;
  v14[4] = &v15;
  [(CCDonateService *)service addItemsWithContents:v6 metaContents:v7 completion:v14];
  [(NSMutableArray *)self->_contentBuffers removeAllObjects];
  [(NSMutableArray *)self->_metaContentBuffers removeAllObjects];
  self->_bufferSize = 0;
  unsigned int v9 = *((unsigned __int16 *)v16 + 12);
  BOOL v10 = v9 == 7;
  if (v9 != 7)
  {
    id v11 = _donationResponseError(self->_name, v5, v9);
    CCSetError(a3, v11);

    id v12 = self->_service;
    self->_service = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

uint64_t __95__CCSetDonation_fullSetDonationWithItemType_forAccount_descriptors_serviceProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)donationWithName:(id)a3 itemType:(unsigned __int16)a4 service:(id)a5 payload:(unint64_t)a6
{
  uint64_t v7 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v10 itemType:v7 service:v9 payload:a6 flushThreshold:20480];

  return v11;
}

- (CCSetDonation)initWithName:(id)a3 itemType:(unsigned __int16)a4 service:(id)a5 payload:(unint64_t)a6 flushThreshold:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  v33.receiver = self;
  v33.super_class = (Class)CCSetDonation;
  id v14 = [(CCSetDonation *)&v33 init];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  v32.receiver = v14;
  v32.super_class = (Class)CCSetDonation;
  uint64_t v16 = [(CCSetDonation *)&v32 description];
  uint64_t v17 = [v16 stringByAppendingString:v12];
  name = v15->_name;
  v15->_name = (NSString *)v17;

  objc_storeStrong((id *)&v15->_service, a5);
  v15->_int itemType = a4;
  v15->_unint64_t flushThreshold = a7;
  v15->_bufferSize = 0;
  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  contentBuffers = v15->_contentBuffers;
  v15->_contentBuffers = v19;

  BOOL v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  metaContentBuffers = v15->_metaContentBuffers;
  v15->_metaContentBuffers = v21;

  v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v24 = dispatch_queue_create("CCSetDonation.instance", v23);
  queue = v15->_queue;
  v15->_queue = (OS_dispatch_queue *)v24;

  uint64_t v26 = objc_opt_class();
  if (v26 == objc_opt_class()) {
    goto LABEL_5;
  }
  uint64_t v27 = objc_opt_class();
  if (v27 == objc_opt_class())
  {
    unint64_t v30 = a6;
    a6 = 0;
    goto LABEL_7;
  }
  uint64_t v28 = objc_opt_class();
  v29 = 0;
  if (v28 == objc_opt_class())
  {
LABEL_5:
    unint64_t v30 = 0;
LABEL_7:
    v15->_priorVersion = v30;
    v15->_errorCode = a6;
LABEL_8:
    v29 = v15;
  }

  return v29;
}

uint64_t __41__CCSetDonation_finishWithOptions_error___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __38__CCSetDonation__flushItemsWithError___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)dealloc
{
  [(CCSetDonation *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CCSetDonation;
  [(CCSetDonation *)&v3 dealloc];
}

- (void)cancel
{
  service = self->_service;
  if (service)
  {
    [(CCDonateService *)service abortSetDonation];
    v4 = self->_service;
    self->_service = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metaContentBuffers, 0);
  objc_storeStrong((id *)&self->_contentBuffers, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (BOOL)finish:(id *)a3
{
  return [(CCSetDonation *)self finishWithOptions:0 error:a3];
}

- (CCSetDonation)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_opt_class();
  _sharedXPCClientFactory();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v9 fullSetDonationWithItemType:v6 forAccount:0 descriptors:v8 serviceProvider:v10 completion:v7];
}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 version:(unint64_t)a5 validity:(id)a6 completion:(id)a7
{
  uint64_t v10 = a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = objc_opt_class();
  _sharedXPCClientFactory();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v14 incrementalSetDonationWithItemType:v10 forAccount:0 descriptors:v13 version:a5 validity:v12 serviceProvider:v15 completion:v11];
}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  uint64_t v12 = a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = objc_opt_class();
  _sharedXPCClientFactory();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v17 incrementalSetDonationWithItemType:v12 forAccount:v16 descriptors:v15 version:a6 validity:v14 serviceProvider:v18 completion:v13];
}

+ (void)fullSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 serviceProvider:(id)a5 completion:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  [(id)objc_opt_class() fullSetDonationWithItemType:v8 forAccount:0 descriptors:v11 serviceProvider:v10 completion:v9];
}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 descriptors:(id)a4 version:(unint64_t)a5 validity:(id)a6 serviceProvider:(id)a7 completion:(id)a8
{
  uint64_t v12 = a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  [(id)objc_opt_class() incrementalSetDonationWithItemType:v12 forAccount:0 descriptors:v16 version:a5 validity:v15 serviceProvider:v14 completion:v13];
}

+ (void)incrementalSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 descriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 serviceProvider:(id)a8 completion:(id)a9
{
  uint64_t v14 = a3;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  _sharedQueue();
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setDonationWithItemType:v14 forAccount:v20 descriptors:v19 remoteDevice:0 version:a6 validity:v18 serviceProvider:v17 queue:v21 timeoutNanos:120000000000 completion:v16];
}

+ (void)deleteSetWithItemType:(unsigned __int16)a3 descriptors:(id)a4 completion:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  id v9 = a4;
  _sharedXPCClientFactory();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [a1 deleteSetWithItemType:v6 descriptors:v9 serviceProvider:v10 completion:v8];
}

+ (void)deleteSetWithItemType:(unsigned __int16)a3 descriptors:(id)a4 serviceProvider:(id)a5 completion:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__CCSetDonation_deleteSetWithItemType_descriptors_serviceProvider_completion___block_invoke;
  v12[3] = &unk_26527A2E8;
  id v13 = v10;
  id v11 = v10;
  [a1 fullSetDonationWithItemType:v8 descriptors:a4 serviceProvider:a5 completion:v12];
}

void __78__CCSetDonation_deleteSetWithItemType_descriptors_serviceProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v11 = 0;
    [v5 finishWithOptions:1 error:&v11];
    id v8 = v11;
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8)
    {
      if (v9)
      {
        id v10 = *(void (**)(void))(v9 + 16);
LABEL_9:
        v10();
      }
    }
    else if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
LABEL_11:
}

+ (void)remoteCRDTSetDonationWithItemType:(unsigned __int16)a3 forAccount:(id)a4 fromDevice:(id)a5 descriptors:(id)a6 serviceProvider:(id)a7 completion:(id)a8
{
  uint64_t v12 = a3;
  id v14 = a8;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __112__CCSetDonation_remoteCRDTSetDonationWithItemType_forAccount_fromDevice_descriptors_serviceProvider_completion___block_invoke;
  v23[3] = &unk_26527A2C0;
  id v24 = v14;
  id v15 = v14;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = (void *)MEMORY[0x24C5B1320](v23);
  id v21 = v16;
  if (!v16)
  {
    id v21 = _sharedXPCClientFactory();
  }
  id v22 = _sharedQueue();
  [a1 _setDonationWithItemType:v12 forAccount:v19 descriptors:v17 remoteDevice:v18 version:0 validity:0 serviceProvider:v21 queue:v22 timeoutNanos:120000000000 completion:v20];

  if (!v16) {
}
  }

uint64_t __112__CCSetDonation_remoteCRDTSetDonationWithItemType_forAccount_fromDevice_descriptors_serviceProvider_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v4 = NSString;
  id v5 = CCTypeIdentifierRegistryBridge();
  id v6 = [v5 descriptionForTypeIdentifier:*(unsigned __int16 *)(a1 + 40)];
  uint64_t v7 = [v4 stringWithFormat:@"Invalid itemType: %@", v6, v10];
  v11[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v9 = [v3 errorWithDomain:@"com.apple.CascadeSets.Set" code:1 userInfo:v8];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v9);
}

uint64_t __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_5(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v2 = *(void *)(a1 + 40);
  objc_super v3 = [NSString stringWithFormat:@"Failed to establish connection to donate service for set donation %@", *(void *)(a1 + 32), *MEMORY[0x263F08320]];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v1 errorWithDomain:@"com.apple.CascadeSets.Donate" code:6 userInfo:v4];
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v5);
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_21(uint64_t a1, __int16 a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_22;
  v6[3] = &unk_26527A388;
  __int16 v12 = a2;
  uint64_t v10 = *(void *)(a1 + 64);
  id v5 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  __int16 v13 = *(_WORD *)(a1 + 72);
  id v8 = *(id *)(a1 + 48);
  uint64_t v11 = a3;
  id v9 = *(id *)(a1 + 56);
  dispatch_async(v5, v6);
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_22(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = CCDonateServiceResponseDescription(*(unsigned __int16 *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      v23 = v2;
      _os_log_impl(&dword_249B92000, v5, OS_LOG_TYPE_DEFAULT, "Service responded to request for new donation %@ with %@", buf, 0x16u);
    }

    int v7 = *(unsigned __int16 *)(a1 + 72);
    if ((v7 - 1) >= 3)
    {
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = CCDonateErrorCodeFromServiceResponse(v7);
      uint64_t v18 = *MEMORY[0x263F08320];
      __int16 v13 = [NSString stringWithFormat:@"Failed to open set donation %@ - %@", *(void *)(a1 + 32), v2];
      id v19 = v13;
      id v14 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v4 = [v11 errorWithDomain:@"com.apple.CascadeSets.Donate" code:v12 userInfo:v14];
    }
    else
    {
      id v8 = [(__objc2_class *)*off_26527A420[(__int16)(v7 - 1)] donationWithName:*(void *)(a1 + 32) itemType:*(unsigned __int16 *)(a1 + 74) service:*(void *)(a1 + 40) payload:*(void *)(a1 + 64)];
      v4 = v8;
      if (v8)
      {
        id v9 = [v8 queue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_26;
        block[3] = &unk_26527A338;
        id v10 = *(id *)(a1 + 48);
        id v16 = v4;
        id v17 = v10;
        v4 = v4;
        dispatch_async(v9, block);

        goto LABEL_11;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_22_cold_1((uint64_t)v2, a1, v4);
  }
LABEL_11:
}

uint64_t __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_28(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v4 = [NSString stringWithFormat:@"Client timed out waiting %lf seconds for donate service to accept a new donation %@", (double)*(unint64_t *)(a1 + 72) / 1000000000.0, *(void *)(a1 + 32)];
    id v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_28_cold_1((uint64_t)v4, v5);
    }

    [*(id *)(a1 + 40) terminateConnection:WeakRetained];
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = v4;
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = [v7 errorWithDomain:@"com.apple.CascadeSets.Donate" code:5 userInfo:v8];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v9);
  }
}

- (id)description
{
  return self->_name;
}

- (BOOL)removeSourceItemIdentifier:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (objc_class *)objc_opt_class();
  if (CCValidateIsInstanceOfExpectedClass(@"sourceItemIdentifier", v6, v7, a4))
  {
    id v8 = (void *)[v6 copy];
    if ([v8 length])
    {
      id v9 = [NSString stringWithFormat:@"remove sourceItemIdentifier: %@", v8];
      service = self->_service;
      if (service)
      {
        uint64_t v21 = 0;
        __int16 v22 = &v21;
        uint64_t v23 = 0x2020000000;
        __int16 v24 = 0;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __50__CCSetDonation_removeSourceItemIdentifier_error___block_invoke;
        v20[3] = &unk_26527A400;
        v20[4] = &v21;
        [(CCDonateService *)service removeSourceItemIdentifier:v8 completion:v20];
        unsigned int v11 = *((unsigned __int16 *)v22 + 12);
        BOOL v12 = v11 == 7;
        if (v11 != 7)
        {
          __int16 v13 = _donationResponseError(self->_name, v9, v11);
          CCSetError(a4, v13);

          id v14 = self->_service;
          self->_service = 0;
        }
        _Block_object_dispose(&v21, 8);
        goto LABEL_11;
      }
      uint64_t v18 = _donationInactiveError((uint64_t)self->_name, (uint64_t)v9);
      CCSetError(a4, v18);
    }
    else
    {
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08320];
      id v9 = [NSString stringWithFormat:@"Donation %@ sourceItemIdentifier is invalid: \"%@\"", self, v8];
      v26[0] = v9;
      id v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v17 = [v15 errorWithDomain:@"com.apple.CascadeSets.Item" code:7 userInfo:v16];
      CCSetError(a4, v17);
    }
    BOOL v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

uint64_t __50__CCSetDonation_removeSourceItemIdentifier_error___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)_mergeDelta:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  __int16 v11 = 0;
  service = self->_service;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __29__CCSetDonation__mergeDelta___block_invoke;
  v7[3] = &unk_26527A400;
  v7[4] = &v8;
  [(CCDonateService *)service mergeDelta:v4 completion:v7];
  LOBYTE(self) = *((unsigned __int16 *)v9 + 12) == 7;
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

uint64_t __29__CCSetDonation__mergeDelta___block_invoke(uint64_t result, __int16 a2)
{
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)priorVersion
{
  return self->_priorVersion;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (void)_setDonationWithItemType:(os_log_t)log forAccount:descriptors:remoteDevice:version:validity:serviceProvider:queue:timeoutNanos:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "completion parameter is nil.", v1, 2u);
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_22_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_249B92000, log, OS_LOG_TYPE_DEBUG, "Ignoring service response (%@) for timed out request %@", (uint8_t *)&v4, 0x16u);
}

void __141__CCSetDonation__setDonationWithItemType_forAccount_descriptors_remoteDevice_version_validity_serviceProvider_queue_timeoutNanos_completion___block_invoke_2_28_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "%@ - invalidating connection", (uint8_t *)&v2, 0xCu);
}

@end