@interface MTRDevice
+ (MTRDevice)deviceWithNodeID:(NSNumber *)nodeID controller:(MTRDeviceController *)controller;
+ (MTRDevice)deviceWithNodeID:(uint64_t)nodeID deviceController:(MTRDeviceController *)deviceController;
- (BOOL)_callDelegatesWithBlock:(id)a3;
- (BOOL)_delegateExists;
- (BOOL)_deviceHasActiveSubscription;
- (BOOL)_iterateDelegatesWithBlock:(id)a3;
- (BOOL)_lockAndCallDelegatesWithBlock:(id)a3;
- (BOOL)deviceCachePrimed;
- (MTRAsyncWorkQueue)asyncWorkQueue;
- (MTRDeviceController)deviceController;
- (MTRDeviceState)state;
- (NSDate)estimatedStartTime;
- (NSDictionary)readAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRReadParams *)params;
- (NSNumber)estimatedSubscriptionLatency;
- (NSNumber)nodeID;
- (OS_dispatch_queue)queue;
- (id)getAllAttributesReport;
- (id)initForSubclassesWithNodeID:(id)a3 controller:(id)a4;
- (id)readAttributePaths:(id)a3;
- (void)_addDelegate:(id)a3 queue:(id)a4 interestedPathsForAttributes:(id)a5 interestedPathsForEvents:(id)a6;
- (void)_delegateAdded;
- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12;
- (void)_invokeKnownCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandPayload:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 responseClass:(Class)a11 queue:(id)a12 completion:(id)a13;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addDelegate:(id)a3 queue:(id)a4 interestedPathsForAttributes:(id)a5 interestedPathsForEvents:(id)a6;
- (void)dealloc;
- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields expectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueInterval timedInvokeTimeout:(NSNumber *)timeout clientQueue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields expectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueInterval timedInvokeTimeout:(NSNumber *)timeout queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion;
- (void)invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 queue:(id)a9 completion:(id)a10;
- (void)openCommissioningWindowWithDiscriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion;
- (void)openCommissioningWindowWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion;
- (void)removeDelegate:(id)a3;
- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (void)setQueue:(id)a3;
- (void)writeAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID value:(id)value expectedValueInterval:(NSNumber *)expectedValueInterval timedWriteTimeout:(NSNumber *)timeout;
@end

@implementation MTRDevice

- (id)initForSubclassesWithNodeID:(id)a3 controller:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MTRDevice;
  v9 = [(MTRDevice *)&v16 init];
  v12 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v13 = objc_msgSend_set(MEMORY[0x263EFF9C0], v10, v11);
    delegates = v12->_delegates;
    v12->_delegates = (NSMutableSet *)v13;

    objc_storeStrong((id *)&v12->_deviceController, a4);
    objc_storeStrong((id *)&v12->_nodeID, a3);
    v12->_state = 0;
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v7 = self;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_DEFAULT, "MTRDevice dealloc: %p", buf, 0xCu);
  }

  if (sub_244CC4E58(2u))
  {
    v4 = self;
    sub_244CC4DE0(0, 2);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTRDevice;
  [(MTRDevice *)&v5 dealloc];
}

+ (MTRDevice)deviceWithNodeID:(NSNumber *)nodeID controller:(MTRDeviceController *)controller
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = nodeID;
  v6 = controller;
  uint64_t v8 = v6;
  if (v5 && v6)
  {
    v9 = objc_msgSend_deviceForNodeID_(v6, v7, (uint64_t)v5);
  }
  else
  {
    v10 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "Can't create device with nodeID: %@, controller: %@", buf, 0x16u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    v9 = 0;
  }

  return (MTRDevice *)v9;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = delegate;
  id v7 = queue;
  uint64_t v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "%@ setDelegate %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    v10 = self;
    id v11 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__addDelegate_queue_interestedPathsForAttributes_interestedPathsForEvents_(self, v9, (uint64_t)v6, v7, 0, 0, v10, v11);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_DEFAULT, "%@ addDelegate %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    v10 = self;
    id v11 = v6;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__addDelegate_queue_interestedPathsForAttributes_interestedPathsForEvents_(self, v9, (uint64_t)v6, v7, 0, 0, v10, v11);
}

- (void)addDelegate:(id)a3 queue:(id)a4 interestedPathsForAttributes:(id)a5 interestedPathsForEvents:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = self;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_DEFAULT, "%@ addDelegate %@ with interested attribute paths %@ event paths %@", buf, 0x2Au);
  }

  if (sub_244CC4E58(2u))
  {
    id v18 = v12;
    id v19 = v13;
    uint64_t v16 = self;
    id v17 = v10;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__addDelegate_queue_interestedPathsForAttributes_interestedPathsForEvents_(self, v15, (uint64_t)v10, v11, v12, v13, v16, v17, v18, v19);
}

- (void)_addDelegate:(id)a3 queue:(id)a4 interestedPathsForAttributes:(id)a5 interestedPathsForEvents:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = (id *)a3;
  id v48 = a4;
  id v49 = a5;
  id v50 = a6;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v13 = objc_msgSend_set(MEMORY[0x263EFF9C0], v11, v12);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  __int16 v14 = self->_delegates;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v51, v59, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v52;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8 * v19);
        if (v20 && (WeakRetained = (id *)objc_loadWeakRetained((id *)(v20 + 16))) != 0)
        {
          if (WeakRetained == v10)
          {
            objc_msgSend_addObject_(v13, v16, v20);
            __int16 v22 = sub_244CC8484(0, "NotSpecified");
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v56 = self;
              __int16 v57 = 2048;
              v58 = v10;
              _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "%@ replacing delegate info for %p", buf, 0x16u);
            }

            BOOL v23 = sub_244CC4E58(2u);
            WeakRetained = v10;
            if (v23)
            {
              v45 = self;
              v46 = v10;
              sub_244CC4DE0(0, 2);
              WeakRetained = v10;
            }
          }
        }
        else
        {
          objc_msgSend_addObject_(v13, v16, v20, v45, v46, lock, v48, v49, v50);
          __int16 v24 = sub_244CC8484(0, "NotSpecified");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            if (v20) {
              id v25 = *(id **)(v20 + 8);
            }
            else {
              id v25 = 0;
            }
            *(_DWORD *)buf = 138412546;
            v56 = self;
            __int16 v57 = 2048;
            v58 = v25;
            _os_log_impl(&dword_2446BD000, v24, OS_LOG_TYPE_DEFAULT, "%@ removing delegate info for nil delegate %p", buf, 0x16u);
          }

          if (sub_244CC4E58(2u))
          {
            if (v20) {
              __int16 v26 = *(id **)(v20 + 8);
            }
            else {
              __int16 v26 = 0;
            }
            v45 = self;
            v46 = v26;
            sub_244CC4DE0(0, 2);
            WeakRetained = 0;
          }
          else
          {
            WeakRetained = 0;
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v51, v59, 16);
      uint64_t v17 = v27;
    }
    while (v27);
  }

  if (objc_msgSend_count(v13, v28, v29))
  {
    uint64_t v32 = objc_msgSend_count(self->_delegates, v30, v31);
    objc_msgSend_minusSet_(self->_delegates, v33, (uint64_t)v13);
    v34 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = objc_msgSend_count(self->_delegates, v35, v36);
      *(_DWORD *)buf = 138412546;
      v56 = self;
      __int16 v57 = 2048;
      v58 = (id *)(v37 - v32);
      _os_log_impl(&dword_2446BD000, v34, OS_LOG_TYPE_DEFAULT, "%@ addDelegate: removed %lu", buf, 0x16u);
    }

    if (sub_244CC4E58(2u))
    {
      v45 = self;
      v46 = (id *)(objc_msgSend_count(self->_delegates, v38, v39) - v32);
      sub_244CC4DE0(0, 2);
    }
  }
  v40 = sub_244C9DB30((id *)[MTRDeviceDelegateInfo alloc], v10, v48, v49, v50);
  objc_msgSend_addObject_(self->_delegates, v41, (uint64_t)v40);
  v42 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v56 = self;
    __int16 v57 = 2112;
    v58 = v40;
    _os_log_impl(&dword_2446BD000, v42, OS_LOG_TYPE_DEFAULT, "%@ added delegate info %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u))
  {
    v45 = self;
    v46 = v40;
    sub_244CC4DE0(0, 2);
  }
  objc_msgSend__delegateAdded(self, v43, v44, v45, v46);

  os_unfair_lock_unlock(lock);
}

- (void)_delegateAdded
{
}

- (void)removeDelegate:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v29 = self;
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v4;
    _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_DEFAULT, "%@ removeDelegate %@", buf, 0x16u);
  }

  if (sub_244CC4E58(2u)) {
    sub_244CC4DE0(0, 2);
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = objc_msgSend_set(MEMORY[0x263EFF9C0], v6, v7);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_244C9EDD4;
  v24[3] = &unk_26519B730;
  id v9 = v8;
  id v25 = v9;
  __int16 v26 = self;
  id v10 = v4;
  id v27 = v10;
  objc_msgSend__iterateDelegatesWithBlock_(self, v11, (uint64_t)v24);
  if (objc_msgSend_count(v9, v12, v13))
  {
    uint64_t v16 = objc_msgSend_count(self->_delegates, v14, v15);
    objc_msgSend_minusSet_(self->_delegates, v17, (uint64_t)v9);
    uint64_t v18 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_msgSend_count(self->_delegates, v19, v20);
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = self;
      __int16 v30 = 2048;
      uint64_t v31 = v21 - v16;
      _os_log_impl(&dword_2446BD000, v18, OS_LOG_TYPE_DEFAULT, "%@ removeDelegate: removed %lu", buf, 0x16u);
    }

    if (sub_244CC4E58(2u))
    {
      objc_msgSend_count(self->_delegates, v22, v23);
      sub_244CC4DE0(0, 2);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidate
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeAllObjects(self->_delegates, v4, v5);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_delegateExists
{
  os_unfair_lock_assert_owner(&self->_lock);

  return objc_msgSend__iterateDelegatesWithBlock_(self, v3, 0);
}

- (BOOL)_iterateDelegatesWithBlock:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v37 = self;
  if (objc_msgSend_count(self->_delegates, v5, v6))
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v7 = self->_delegates;
    id v9 = 0;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v38, v48, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if (v15 && (id WeakRetained = objc_loadWeakRetained((id *)(v15 + 16))) != 0)
          {
            if (v4)
            {
              uint64_t v17 = (void *)MEMORY[0x245696770]();
              v4[2](v4, v15);
            }
          }
          else
          {
            if (!v9)
            {
              id v9 = objc_msgSend_set(MEMORY[0x263EFF9C0], v10, v11);
            }
            id WeakRetained = 0;
            objc_msgSend_addObject_(v9, v10, v15);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v38, v48, 16);
      }
      while (v12);
    }

    if (objc_msgSend_count(v9, v18, v19))
    {
      objc_msgSend_minusSet_(v37->_delegates, v20, (uint64_t)v9);
      __int16 v22 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_msgSend_count(v9, v23, v24);
        uint64_t v28 = objc_msgSend_count(v37->_delegates, v26, v27);
        *(_DWORD *)buf = 138412802;
        v43 = v37;
        __int16 v44 = 2048;
        uint64_t v45 = v25;
        __int16 v46 = 2048;
        uint64_t v47 = v28;
        _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_DEFAULT, "%@ _iterateDelegatesWithBlock: removed %lu remaining %lu", buf, 0x20u);
      }

      if (sub_244CC4E58(2u))
      {
        uint64_t v35 = objc_msgSend_count(v9, v20, v21);
        uint64_t v36 = objc_msgSend_count(v37->_delegates, v29, v30);
        v34 = v37;
        sub_244CC4DE0(0, 2);
      }
    }
    BOOL v31 = objc_msgSend_count(v37->_delegates, v20, v21, v34, v35, v36) != 0;
  }
  else
  {
    uint64_t v32 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43 = self;
      _os_log_impl(&dword_2446BD000, v32, OS_LOG_TYPE_INFO, "%@ no delegates to iterate", buf, 0xCu);
    }

    if (sub_244CC4E58(3u)) {
      sub_244CC4DE0(0, 3);
    }
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)_callDelegatesWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_244C9F540;
  v8[3] = &unk_26519B758;
  id v9 = v4;
  id v10 = &v11;
  id v5 = v4;
  objc_msgSend__iterateDelegatesWithBlock_(self, v6, (uint64_t)v8);
  LOBYTE(self) = v12[3] != 0;

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

- (BOOL)_lockAndCallDelegatesWithBlock:(id)a3
{
  v3 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = objc_msgSend__callDelegatesWithBlock_(v3, v6, (uint64_t)v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (NSDictionary)readAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID params:(MTRReadParams *)params
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v11 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (void)writeAttributeWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID attributeID:(NSNumber *)attributeID value:(id)value expectedValueInterval:(NSNumber *)expectedValueInterval timedWriteTimeout:(NSNumber *)timeout
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v12 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
}

- (id)readAttributePaths:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    uint64_t v9 = objc_opt_class();
    NSStringFromSelector(a2);
    uint64_t v13 = v12 = v9;
    sub_244CC4DE0(0, 1);
  }
  uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF8C0], v7, v8, v12, v13);

  return v10;
}

- (void)invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 queue:(id)a9 completion:(id)a10
{
  v26[2] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v24 = a10;
  if (!v19)
  {
    v25[0] = @"type";
    v25[1] = @"value";
    v26[0] = @"Structure";
    v26[1] = MEMORY[0x263EFFA68];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v26, v25, 2);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_queue_completion_(self, v23, (uint64_t)v16, v17, v18, v19, v20, v21, 0, v22, v24);
}

- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields expectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueInterval timedInvokeTimeout:(NSNumber *)timeout queue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v32 = endpointID;
  v33 = clusterID;
  v34 = commandID;
  id v17 = commandFields;
  id v18 = expectedValues;
  id v19 = expectedValueInterval;
  id v20 = timeout;
  id v21 = queue;
  id v22 = completion;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v17;
    uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"type");
    char isEqual = objc_msgSend_isEqual_(@"Structure", v26, (uint64_t)v25);

    if (isEqual)
    {
      objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_queue_completion_(self, v28, (uint64_t)v32, v33, v34, v23, v18, v19, v20, 0, v21, v22);
    }
    else
    {
      uint64_t v30 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        long long v40 = self;
        __int16 v41 = 2112;
        id v42 = v23;
        _os_log_impl(&dword_2446BD000, v30, OS_LOG_TYPE_ERROR, "%@ invokeCommandWithEndpointID passed a commandFields (%@) that is not a structure-typed data-value object", buf, 0x16u);
      }

      if (sub_244CC4E58(1u)) {
        sub_244CC4DE0(0, 1);
      }
      LODWORD(v35) = 47;
      *((void *)&v35 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDevice.mm";
      int v36 = 411;
      BOOL v31 = sub_244B26908((uint64_t)MTRError, &v35);
      v22[2](v22, 0, v31);
    }
  }
  else
  {
    uint64_t v29 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      long long v40 = self;
      __int16 v41 = 2112;
      id v42 = v17;
      _os_log_impl(&dword_2446BD000, v29, OS_LOG_TYPE_ERROR, "%@ invokeCommandWithEndpointID passed a commandFields (%@) that is not a data-value NSDictionary object", buf, 0x16u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
    LODWORD(v37) = 47;
    *((void *)&v37 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDevice.mm";
    int v38 = 403;
    sub_244B26908((uint64_t)MTRError, &v37);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    v22[2](v22, 0, v23);
  }
}

- (void)_invokeCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandFields:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 queue:(id)a11 completion:(id)a12
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v13 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v15;
    _os_log_impl(&dword_2446BD000, v13, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    id v16 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
}

- (void)_invokeKnownCommandWithEndpointID:(id)a3 clusterID:(id)a4 commandID:(id)a5 commandPayload:(id)a6 expectedValues:(id)a7 expectedValueInterval:(id)a8 timedInvokeTimeout:(id)a9 serverSideProcessingTimeout:(id)a10 responseClass:(Class)a11 queue:(id)a12 completion:(id)a13
{
  id v37 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  uint64_t v25 = a12;
  id v26 = a13;
  if (objc_opt_respondsToSelector())
  {
    id v34 = v22;
    id v35 = v21;
    id v43 = 0;
    id v36 = v19;
    uint64_t v28 = objc_msgSend__encodeAsDataValue_(v20, v27, (uint64_t)&v43);
    id v29 = v43;
    if (v28)
    {
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_244CA0490;
      v38[3] = &unk_265195150;
      v39[1] = a11;
      v39[0] = v26;
      uint64_t v30 = (void *)MEMORY[0x2456969D0](v38);
      objc_msgSend__invokeCommandWithEndpointID_clusterID_commandID_commandFields_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_queue_completion_(self, v31, (uint64_t)v37, v18, v19, v28, v35, v34, v23, v24, v25, v30);
      uint64_t v32 = (id *)v39;
    }
    else
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = sub_244CA0478;
      v40[3] = &unk_265194F48;
      uint64_t v32 = &v42;
      id v42 = v26;
      id v41 = v29;
      dispatch_async(v25, v40);
      uint64_t v30 = v41;
    }

    id v21 = v35;
    id v19 = v36;
    id v22 = v34;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_244CA03F0;
    block[3] = &unk_265194E00;
    id v45 = v26;
    dispatch_async(v25, block);
    id v29 = v45;
  }
}

- (void)openCommissioningWindowWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v9 = queue;
  MTRDeviceOpenCommissioningWindowHandler v10 = completion;
  uint64_t v11 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl(&dword_2446BD000, v11, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v15 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244CA07D0;
  block[3] = &unk_265194E00;
  id v17 = v10;
  id v14 = v10;
  dispatch_async(v9, block);
}

- (void)openCommissioningWindowWithDiscriminator:(NSNumber *)discriminator duration:(NSNumber *)duration queue:(dispatch_queue_t)queue completion:(MTRDeviceOpenCommissioningWindowHandler)completion
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v8 = queue;
  MTRDeviceOpenCommissioningWindowHandler v9 = completion;
  MTRDeviceOpenCommissioningWindowHandler v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    id v14 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244CA0A4C;
  block[3] = &unk_265194E00;
  id v16 = v9;
  id v13 = v9;
  dispatch_async(v8, block);
}

- (void)downloadLogOfType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v8 = a5;
  id v9 = a6;
  MTRDeviceOpenCommissioningWindowHandler v10 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl(&dword_2446BD000, v10, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    id v14 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244CA0CC8;
  block[3] = &unk_265194E00;
  id v16 = v9;
  id v13 = v9;
  dispatch_async(v8, block);
}

- (NSNumber)estimatedSubscriptionLatency
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (id)getAllAttributesReport
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (BOOL)deviceCachePrimed
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_2446BD000, v3, OS_LOG_TYPE_ERROR, "%@ or some ancestor must implement %@", buf, 0x16u);
  }
  if (sub_244CC4E58(1u))
  {
    objc_opt_class();
    uint64_t v7 = NSStringFromSelector(a2);
    sub_244CC4DE0(0, 1);
  }
  return 0;
}

- (MTRDeviceState)state
{
  return self->_state;
}

- (NSDate)estimatedStartTime
{
  return self->_estimatedStartTime;
}

- (MTRDeviceController)deviceController
{
  return self->_deviceController;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MTRAsyncWorkQueue)asyncWorkQueue
{
  return self->_asyncWorkQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncWorkQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_estimatedStartTime, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);

  objc_storeStrong((id *)&self->_delegates, 0);
}

- (BOOL)_deviceHasActiveSubscription
{
  return 0;
}

+ (MTRDevice)deviceWithNodeID:(uint64_t)nodeID deviceController:(MTRDeviceController *)deviceController
{
  uint64_t v6 = deviceController;
  uint64_t v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v7, nodeID);
  __int16 v10 = objc_msgSend_deviceWithNodeID_controller_(a1, v9, (uint64_t)v8, v6);

  return (MTRDevice *)v10;
}

- (void)invokeCommandWithEndpointID:(NSNumber *)endpointID clusterID:(NSNumber *)clusterID commandID:(NSNumber *)commandID commandFields:(id)commandFields expectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueInterval timedInvokeTimeout:(NSNumber *)timeout clientQueue:(dispatch_queue_t)queue completion:(MTRDeviceResponseHandler)completion
{
}

@end