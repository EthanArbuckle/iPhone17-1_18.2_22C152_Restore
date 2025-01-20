@interface FTRegionSupport
+ (id)sharedInstance;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (FTMessageDelivery)delivery;
- (NSArray)regions;
- (id)regionForID:(id)a3;
- (void)_buildMessageDeliveryIfNeeded;
- (void)dealloc;
- (void)flushRegions;
- (void)setDelivery:(id)a3;
- (void)setRegions:(id)a3;
- (void)startLoading;
@end

@implementation FTRegionSupport

+ (id)sharedInstance
{
  if (qword_1EB47C8D0 != -1) {
    dispatch_once(&qword_1EB47C8D0, &unk_1EFE07980);
  }
  v2 = (void *)qword_1EB47C888;

  return v2;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self->_delivery, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)FTRegionSupport;
  [(FTRegionSupport *)&v4 dealloc];
}

- (void)_buildMessageDeliveryIfNeeded
{
  if (!self->_delivery)
  {
    v3 = objc_alloc_init(FTMessageDelivery);
    delivery = self->_delivery;
    self->_delivery = v3;

    v6 = self->_delivery;
    objc_msgSend_setUserAgent_(v6, v5, @"com.apple.facetime-region-query");
  }
}

- (void)startLoading
{
  if ((objc_msgSend_isLoading(self, a2, v2) & 1) == 0 && (objc_msgSend_isLoaded(self, v4, v5) & 1) == 0)
  {
    objc_msgSend__buildMessageDeliveryIfNeeded(self, v6, v7);
    v8 = objc_alloc_init(FTGetRegionMetadataMessage);
    v9 = IMCurrentPreferredLanguage();
    objc_msgSend_setLanguage_(v8, v10, (uint64_t)v9);

    objc_msgSend_setTimeout_(v8, v11, v12, 600.0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1A7BF0E18;
    v15[3] = &unk_1E5D1B340;
    v15[4] = self;
    objc_msgSend_setCompletionBlock_(v8, v13, (uint64_t)v15);
    objc_msgSend_sendMessage_(self->_delivery, v14, (uint64_t)v8);
  }
}

- (void)flushRegions
{
  regions = self->_regions;
  self->_regions = 0;

  delivery = self->_delivery;

  objc_msgSend_invalidate(delivery, v4, v5);
}

- (BOOL)isLoaded
{
  return self->_regions != 0;
}

- (BOOL)isLoading
{
  return objc_msgSend_busy(self->_delivery, a2, v2);
}

- (id)regionForID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = objc_msgSend_regions(self, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = objc_msgSend_regionWithID_(*(void **)(*((void *)&v17 + 1) + 8 * i), v10, (uint64_t)v4);
        if (v14)
        {
          v15 = (void *)v14;
          goto LABEL_11;
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (NSArray)regions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegions:(id)a3
{
}

- (FTMessageDelivery)delivery
{
  return (FTMessageDelivery *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelivery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delivery, 0);

  objc_storeStrong((id *)&self->_regions, 0);
}

@end