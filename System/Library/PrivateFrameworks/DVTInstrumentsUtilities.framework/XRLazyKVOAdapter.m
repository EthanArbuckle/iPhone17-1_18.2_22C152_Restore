@interface XRLazyKVOAdapter
+ (id)observeKeyPath:(id)a3 object:(id)a4 observer:(id)a5 lazyUpdateBlock:(id)a6;
+ (id)observeKeyPathArray:(id)a3 object:(id)a4 observer:(id)a5 lazyUpdateBlock:(id)a6;
- (BOOL)hasContextChanged:(const void *)a3;
- (BOOL)isSuspended;
- (NSArray)runLoopModes;
- (XRLazyKVOAdapter)init;
- (XRLazyKVOAdapter)initWithLazyKVOResponder:(id)a3;
- (_XRLazyKVOBlockToken)strongBlockAdapterToken;
- (id).cxx_construct;
- (void)_callbackHandler;
- (void)dealloc;
- (void)fireCallbackContext:(const void *)a3 whenKeypaths:(id)a4 changeOnClass:(Class)a5;
- (void)observeObject:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObservationsForObject:(id)a3;
- (void)setRunLoopModes:(id)a3;
- (void)setStrongBlockAdapterToken:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation XRLazyKVOAdapter

+ (id)observeKeyPath:(id)a3 object:(id)a4 observer:(id)a5 lazyUpdateBlock:(id)a6
{
  v20[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20[0] = v10;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:v20];
  v18 = [a1 observeKeyPathArray:v17 object:(id)v16 observer:(id)v11 lazyUpdateBlock:v13];

  return v18;
}

+ (id)observeKeyPathArray:(id)a3 object:(id)a4 observer:(id)a5 lazyUpdateBlock:(id)a6
{
  v99[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [_XRLazyKVOBlockToken alloc];
  v18 = [v15 initWithObject:v16 observer:(uint64_t)v12 observerContext:(uint64_t)v13 retain:(BOOL)v17];
  id v19 = objc_alloc((Class)a1);
  v23 = [v19 initWithLazyKVOResponder:v20 lazyKVOResponderClass:v21 lazyKVOResponderClassData:v22];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  [v23 fireCallbackContext:v26 whenKeypaths:v24 changeOnClass:v11 completion:v25];
  [v23 observeObject:v27 change:v12 context:v28];
  v99[0] = *MEMORY[0x263EFF478];
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30, v99, nil count:1];
  [v23 setRunLoopModes:v33 modes:(uint64_t)v32];

  [v23 setStrongBlockAdapterToken:v36 withToken:(uint64_t)v18 withBlock:v37 withBlockQueue:v38];
  [v23 setSuspended:v39 forReason:v40 suspensionContext:v41];
  objc_initWeak(&location, v23);
  if (_DVTIURuntimeCheckForBlockCaptureOfObject((uint64_t)v14, v12))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      if ((id)objc_opt_class() == a1) {
        int v47 = 43;
      }
      else {
        int v47 = 45;
      }
      int v84 = v47;
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      id v85 = objc_claimAutoreleasedReturnValue();
      uint64_t v83 = [v85 UTF8StringWithFormat:v49, v50, v51, v52];
      Name = sel_getName(a2);
      [v12 descriptionWithLocale:v54 indent:v55];
      id v58 = objc_claimAutoreleasedReturnValue();
      uint64_t v63 = [v58 v59:v60 v61:v62];
      *(_DWORD *)buf = 67109890;
      int v92 = v84;
      __int16 v93 = 2080;
      uint64_t v94 = v83;
      __int16 v95 = 2080;
      v96 = Name;
      __int16 v97 = 2080;
      uint64_t v98 = v63;
      _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "The block provided to %c[%s %s] captures the observed object (%s) which may extend its lifetime.  Use the 'object' parameter passed to the block instead.\nSet a breakpoint in '_DVTIUInvalidBlockCaptureBreak' to debug", buf, 0x26u);
    }
    _DVTIUInvalidBlockCaptureBreak(v14, v12);
  }
  if (_DVTIURuntimeCheckForBlockCaptureOfObject((uint64_t)v14, v13))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      if ((id)objc_opt_class() == a1) {
        int v64 = 43;
      }
      else {
        int v64 = 45;
      }
      int v86 = v64;
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      id v66 = objc_claimAutoreleasedReturnValue();
      uint64_t v71 = [v66 UTF8StringWithFormat:v67, v68, v69, v70];
      v72 = sel_getName(a2);
      [v13 descriptionWithLocale:v73 indent:v74];
      id v77 = objc_claimAutoreleasedReturnValue();
      uint64_t v82 = [v77 v78:v79 v80:v81];
      *(_DWORD *)buf = 67109890;
      int v92 = v86;
      __int16 v93 = 2080;
      uint64_t v94 = v71;
      __int16 v95 = 2080;
      v96 = v72;
      __int16 v97 = 2080;
      uint64_t v98 = v82;
      _os_log_fault_impl(&dword_234574000, &_os_log_internal, OS_LOG_TYPE_FAULT, "The block provided to %c[%s %s] captures the observer (%s) which could lead to a retain cycle -- possibly via 'self' or ivar usage.  Use the 'observer' parameter passed to the block instead.\nSet a breakpoint in '_DVTIUInvalidBlockCaptureBreak' to debug", buf, 0x26u);
    }
    _DVTIUInvalidBlockCaptureBreak(v14, v13);
  }
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = sub_234594780;
  v87[3] = &unk_264BF21A0;
  id v42 = v14;
  id v88 = v42;
  objc_copyWeak(&v89, &location);
  [v18 setBlock:v43 block:v87 block:v44 block:v45];
  objc_destroyWeak(&v89);

  objc_destroyWeak(&location);

  return v23;
}

- (XRLazyKVOAdapter)init
{
  v5 = (void *)MEMORY[0x263EFF940];
  v6 = [NSString stringWithUTF8String:a2];
  [v5 raiseFormat:@"Don't call %@.", v8, v6];

  return 0;
}

- (XRLazyKVOAdapter)initWithLazyKVOResponder:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)XRLazyKVOAdapter;
  v5 = [(XRLazyKVOAdapter *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_responder, v4);
    uint64_t v11 = [MEMORY[0x263F08968] objc_msgSend_strongToStrongObjectsMapTable:v7, v8, v9, v10];
    keyPathsByContextByClz = v6->_keyPathsByContextByClz;
    v6->_keyPathsByContextByClz = (NSMapTable *)v11;

    uint64_t v17 = [MEMORY[0x263F08968] objc_msgSend_strongToStrongObjectsMapTable:v13, v14, v15, v16];
    keyPathsByContextByObj = v6->_keyPathsByContextByObj;
    v6->_keyPathsByContextByObj = (NSMapTable *)v17;

    v26[0] = *MEMORY[0x263EFF478];
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    runLoopModes = v6->_runLoopModes;
    v6->_runLoopModes = (NSArray *)v21;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_responder);
    v6->_implementsWillChangeHandler = objc_opt_respondsToSelector() & 1;
  }
  return v6;
}

- (void)dealloc
{
  v6 = [MEMORY[0x263EFF9F0] performSelectorOnMainThread:a2 withObject:v2 waitUntilDone:v3];
  [v6 cancelPerformSelectorsWithTarget:self];

  sub_234594A00(self);
  v10.receiver = self;
  v10.super_class = (Class)XRLazyKVOAdapter;
  [(XRLazyKVOAdapter *)&v10 dealloc];
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    self->_suspended = a3;
    if (a3)
    {
      [MEMORY[0x263EFF9F0] performSelectorOnMainThread:a2 withObject:a3 waitUntilDone:v3];
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [v9 cancelPerformSelectorsWithTarget:self];
    }
    else if (self->_updatedContexts.__table_.__p2_.__value_)
    {
      [self callbackHandler:a2 with:a3 with:v3 with:v4];
    }
  }
}

- (void)fireCallbackContext:(const void *)a3 whenKeypaths:(id)a4 changeOnClass:(Class)a5
{
  id v8 = a4;
  id v9 = self->_keyPathsByContextByClz;
  id v18 = v8;
  uint64_t v15 = [v9 objectForKey:v10];
  if (!v15)
  {
    uint64_t v15 = objc_opt_new();
    [v9 setObject:v16 forKey:(uint64_t)v15];
  }
  [v15 setObject:v13 forIntegerKey:(uint64_t)v18];
}

- (void)observeObject:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    [self->_keyPathsByContextByObj objectForKey:v4 forKey:(uint64_t)v7];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      id v9 = objc_opt_new();
      [self->_keyPathsByContextByObj setObject:v10 forKey:(uint64_t)v9];
      Superclass = (objc_class *)objc_opt_class();
      uint64_t v16 = 0;
      while (Superclass && !v16)
      {
        uint64_t v16 = [self->_keyPathsByContextByClz objectForKey:v12 forClass:Superclass context:v13];
        Superclass = class_getSuperclass(Superclass);
      }
      if (self->_implementsWillChangeHandler) {
        uint64_t v17 = 13;
      }
      else {
        uint64_t v17 = 5;
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = sub_234594F6C;
      v21[3] = &unk_264BF21C8;
      id v22 = v7;
      v23 = self;
      uint64_t v25 = v17;
      id v8 = v9;
      id v24 = v8;
      [v16 enumerateObjectsAndIntegerKeys:v18 usingBlock:v19 withContext:v20];
    }
  }
}

- (void)removeObservationsForObject:(id)a3
{
}

- (BOOL)hasContextChanged:(const void *)a3
{
  uint64_t v4 = a3;
  return sub_2345956E4(&self->_presentedContexts.__table_.__bucket_list_.__ptr_.__value_, &v4) != 0;
}

- (void)_callbackHandler
{
  p_responder = &self->_responder;
  id obj = objc_loadWeakRetained((id *)&self->_responder);
  objc_sync_enter(obj);
  while (self->_updatedContexts.__table_.__p2_.__value_)
  {
    self->_presentedContexts.__table_.__p3_.__value_ = self->_updatedContexts.__table_.__p3_.__value_;
    sub_2345957D0(&self->_presentedContexts.__table_.__bucket_list_.__ptr_.__value_, (void *)self->_updatedContexts.__table_.__p1_.__value_.__next_, 0);
    sub_234595A28(&self->_updatedContexts.__table_.__bucket_list_.__ptr_.__value_);
    id WeakRetained = objc_loadWeakRetained((id *)p_responder);
    [WeakRetained handleLazyKVOUpdate:v5 withObject:self withKeyPath:v6 withIndex:v7];

    sub_234595A28(&self->_presentedContexts.__table_.__bucket_list_.__ptr_.__value_);
  }
  objc_sync_exit(obj);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = v12;
  uint64_t v38 = a6;
  if (self->_implementsWillChangeHandler
    && [v12 objectForKeyedSubscript:v13 withObject:v14 withObject:v15],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v17 v18:v19 v20:v21],
        v17,
        v22))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
    [WeakRetained prepareForLazyKVOUpdate:self keyPath:v11 context:v10];
  }
  else if (self->_runLoopModes)
  {
    id v25 = objc_loadWeakRetained((id *)&self->_responder);
    objc_sync_enter(v25);
    if (!self->_updatedContexts.__table_.__p2_.__value_ && !self->_suspended)
    {
      v30 = [MEMORY[0x263EFF9F0] performSelectorOnMainThread:v26 withObject:v27 waitUntilDone:v28];
      [v30 performSelector:sel__callbackHandler withObject:self withObject:self->_runLoopModes];
    }
    v32 = [self->_keyPathsByContextByObj objectForKey:v26 forContext:v11];

    if (v32) {
      sub_234595A90((uint64_t)&self->_updatedContexts, &v38, &v38);
    }
    objc_sync_exit(v25);
  }
  else
  {
    v33 = [self->_keyPathsByContextByObj objectForKey:v13 forContext:v11 withKey:v14 withKey:v15];

    if (v33) {
      sub_234595A90((uint64_t)&self->_updatedContexts, &v38, &v38);
    }
    [self callbackHandler:v34 v35:v35 v36:v36 v37:v37];
  }
}

- (NSArray)runLoopModes
{
  return self->_runLoopModes;
}

- (void)setRunLoopModes:(id)a3
{
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (_XRLazyKVOBlockToken)strongBlockAdapterToken
{
  return self->_strongBlockAdapterToken;
}

- (void)setStrongBlockAdapterToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongBlockAdapterToken, 0);
  objc_storeStrong((id *)&self->_runLoopModes, 0);
  objc_destroyWeak((id *)&self->_responder);
  sub_234595CE4((uint64_t)&self->_presentedContexts);
  sub_234595CE4((uint64_t)&self->_updatedContexts);
  objc_storeStrong((id *)&self->_keyPathsByContextByObj, 0);

  objc_storeStrong((id *)&self->_keyPathsByContextByClz, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  return self;
}

@end