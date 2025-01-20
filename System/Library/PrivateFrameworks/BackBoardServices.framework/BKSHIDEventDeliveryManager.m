@interface BKSHIDEventDeliveryManager
+ (id)sharedInstance;
- (BKSHIDEventDeliveryManager)init;
- (NSString)description;
- (id)_initForTestingWithService:(id)a3;
- (id)_initWithRemoteConnection;
- (id)_lock_stateDescription;
- (id)_lock_transactionAssertionWithReason:(id)a3;
- (id)bufferEventsMatchingPredicate:(id)a3 withReason:(id)a4;
- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3;
- (id)connectionDescriptionForDeferringRuleWithSeed:(unsigned int)a3 pid:(int)a4;
- (id)deferEventsMatchingPredicate:(id)a3 toTarget:(id)a4 withReason:(id)a5;
- (id)deliveryGraphDescription;
- (id)dispatchDiscreteEventsForReason:(id)a3 withRules:(id)a4;
- (id)dispatchKeyCommandsForReason:(id)a3 withRule:(id)a4;
- (id)registerKeyCommands:(id)a3;
- (id)requestActiveUIResponderForDeferringPredicate:(id)a3 withReason:(id)a4;
- (id)transactionAssertionWithReason:(id)a3;
- (int64_t)authenticateMessage:(id)a3;
- (void)_coreSetUpWithServiceConnection:(id)a3;
- (void)_lock_flushIfNeeded;
- (void)_lock_implicitFlush;
- (void)_reconnectAfterServerInterruption;
- (void)_syncServiceFlushState;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
- (void)selectDeferringPredicate:(id)a3 withReason:(id)a4;
@end

@implementation BKSHIDEventDeliveryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9463 != -1) {
    dispatch_once(&sharedInstance_onceToken_9463, &__block_literal_global_99);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

- (id)transactionAssertionWithReason:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  if (!v5)
  {
    v11 = NSStringFromClass(v7);
    v12 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = NSStringFromSelector(a2);
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      v26 = v13;
      __int16 v27 = 2114;
      v28 = v15;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2114;
      v32 = @"BKSHIDEventDeliveryManager.m";
      __int16 v33 = 1024;
      int v34 = 258;
      __int16 v35 = 2114;
      v36 = v12;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA152D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = NSString;
    v17 = (objc_class *)[v5 classForCoder];
    if (!v17) {
      v17 = (objc_class *)objc_opt_class();
    }
    v18 = NSStringFromClass(v17);
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = [v16 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v18, v20];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v22 = NSStringFromSelector(a2);
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138544642;
      v26 = v22;
      __int16 v27 = 2114;
      v28 = v24;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2114;
      v32 = @"BKSHIDEventDeliveryManager.m";
      __int16 v33 = 1024;
      int v34 = 258;
      __int16 v35 = 2114;
      v36 = v21;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA15410);
  }

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v9 = [(BKSHIDEventDeliveryManager *)self _lock_transactionAssertionWithReason:v5];
  os_unfair_lock_unlock(p_lock);
  os_unfair_lock_assert_not_owner(p_lock);

  return v9;
}

- (id)_lock_transactionAssertionWithReason:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  if (!v5)
  {
    v14 = NSStringFromClass(v7);
    v15 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      int v34 = v16;
      __int16 v35 = 2114;
      v36 = v18;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      v40 = @"BKSHIDEventDeliveryManager.m";
      __int16 v41 = 1024;
      int v42 = 508;
      __int16 v43 = 2114;
      v44 = v15;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA15680);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = NSString;
    v20 = (objc_class *)[v5 classForCoder];
    if (!v20) {
      v20 = (objc_class *)objc_opt_class();
    }
    v21 = NSStringFromClass(v20);
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = [v19 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v21, v23];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = NSStringFromSelector(a2);
      v26 = (objc_class *)objc_opt_class();
      __int16 v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138544642;
      int v34 = v25;
      __int16 v35 = 2114;
      v36 = v27;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      v40 = @"BKSHIDEventDeliveryManager.m";
      __int16 v41 = 1024;
      int v42 = 508;
      __int16 v43 = 2114;
      v44 = v24;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA157B8);
  }

  os_unfair_lock_assert_owner(&self->_lock);
  lock_preventFlushingReasons = self->_lock_preventFlushingReasons;
  int64_t v9 = self->_lock_preventFlushingSeed + 1;
  self->_lock_preventFlushingSeed = v9;
  v10 = [(BSMutableIntegerMap *)lock_preventFlushingReasons objectForKey:v9];

  if (v10)
  {
    v28 = [NSString stringWithFormat:@"wow! we've wrapped all the way back around!!! token=%li reason=%@ reasons=%@", v9, v5, self->_lock_preventFlushingReasons];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = NSStringFromSelector(a2);
      v30 = (objc_class *)objc_opt_class();
      __int16 v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      int v34 = v29;
      __int16 v35 = 2114;
      v36 = v31;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      v40 = @"BKSHIDEventDeliveryManager.m";
      __int16 v41 = 1024;
      int v42 = 512;
      __int16 v43 = 2114;
      v44 = v28;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA158ACLL);
  }
  [(BSMutableIntegerMap *)self->_lock_preventFlushingReasons setObject:v5 forKey:v9];
  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__BKSHIDEventDeliveryManager__lock_transactionAssertionWithReason___block_invoke;
  v32[3] = &unk_1E54415E0;
  v32[4] = self;
  v32[5] = v9;
  v12 = (void *)[v11 initWithIdentifier:@"com.apple.backboard.hid.delivery.transaction" forReason:v5 invalidationBlock:v32];
  [(NSHashTable *)self->_lock_assertions addObject:v12];

  return v12;
}

- (id)bufferEventsMatchingPredicate:(id)a3 withReason:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    v22 = NSString;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v22 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v26 = NSStringFromSelector(a2);
      __int16 v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138544642;
      v59 = v26;
      __int16 v60 = 2114;
      v61 = v28;
      __int16 v62 = 2048;
      v63 = self;
      __int16 v64 = 2114;
      v65 = @"BKSHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 271;
      __int16 v68 = 2114;
      v69 = v25;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA15BD4);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v29 = NSString;
    v30 = (objc_class *)[v10 classForCoder];
    if (!v30) {
      v30 = (objc_class *)objc_opt_class();
    }
    __int16 v31 = NSStringFromClass(v30);
    v32 = (objc_class *)objc_opt_class();
    __int16 v33 = NSStringFromClass(v32);
    int v34 = [v29 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v31, v33];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = NSStringFromSelector(a2);
      v36 = (objc_class *)objc_opt_class();
      __int16 v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138544642;
      v59 = v35;
      __int16 v60 = 2114;
      v61 = v37;
      __int16 v62 = 2048;
      v63 = self;
      __int16 v64 = 2114;
      v65 = @"BKSHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 271;
      __int16 v68 = 2114;
      v69 = v34;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA15D10);
  }

  id v11 = v8;
  v12 = NSString;
  v13 = (objc_class *)objc_opt_class();
  if (!v11)
  {
    v38 = NSStringFromClass(v13);
    __int16 v39 = [v12 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v38];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(a2);
      __int16 v41 = (objc_class *)objc_opt_class();
      int v42 = NSStringFromClass(v41);
      *(_DWORD *)buf = 138544642;
      v59 = v40;
      __int16 v60 = 2114;
      v61 = v42;
      __int16 v62 = 2048;
      v63 = self;
      __int16 v64 = 2114;
      v65 = @"BKSHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 272;
      __int16 v68 = 2114;
      v69 = v39;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA15E18);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v43 = NSString;
    v44 = (objc_class *)[v11 classForCoder];
    if (!v44) {
      v44 = (objc_class *)objc_opt_class();
    }
    uint64_t v45 = NSStringFromClass(v44);
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    v48 = [v43 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v45, v47];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v49 = NSStringFromSelector(a2);
      v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      *(_DWORD *)buf = 138544642;
      v59 = v49;
      __int16 v60 = 2114;
      v61 = v51;
      __int16 v62 = 2048;
      v63 = self;
      __int16 v64 = 2114;
      v65 = @"BKSHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 272;
      __int16 v68 = 2114;
      v69 = v48;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA15F50);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v14 = NSString;
  uint64_t v15 = self->_lock_bufferingSeed + 1;
  self->_lock_bufferingSeed = v15;
  v16 = [v14 stringWithFormat:@"%li-buffer: %@", v15, v11];
  v17 = [(NSMutableDictionary *)self->_lock_bufferingPredicates objectForKey:v16];

  if (v17)
  {
    v52 = [NSString stringWithFormat:@"wow! we've got duplicate buffering keys!!! new=%@ existing=%@ : predicate=%@", v16, self->_lock_bufferingPredicates, v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v53 = NSStringFromSelector(a2);
      v54 = (objc_class *)objc_opt_class();
      v55 = NSStringFromClass(v54);
      *(_DWORD *)buf = 138544642;
      v59 = v53;
      __int16 v60 = 2114;
      v61 = v55;
      __int16 v62 = 2048;
      v63 = self;
      __int16 v64 = 2114;
      v65 = @"BKSHIDEventDeliveryManager.m";
      __int16 v66 = 1024;
      int v67 = 278;
      __int16 v68 = 2114;
      v69 = v52;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v52 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA16044);
  }
  [(NSMutableDictionary *)self->_lock_bufferingPredicates setObject:v10 forKey:v16];
  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  id v18 = objc_alloc(MEMORY[0x1E4F4F838]);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __71__BKSHIDEventDeliveryManager_bufferEventsMatchingPredicate_withReason___block_invoke;
  v56[3] = &unk_1E54415B8;
  v56[4] = self;
  id v57 = v16;
  id v19 = v16;
  v20 = (void *)[v18 initWithIdentifier:@"com.apple.backboard.hid.delivery.buffering" forReason:v19 invalidationBlock:v56];
  [(NSHashTable *)self->_lock_assertions addObject:v20];
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_assert_not_owner(&self->_lock);

  return v20;
}

- (id)deferEventsMatchingPredicate:(id)a3 toTarget:(id)a4 withReason:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  if (!v12)
  {
    __int16 v27 = NSString;
    v28 = (objc_class *)objc_opt_class();
    __int16 v29 = NSStringFromClass(v28);
    v30 = [v27 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v29];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = NSStringFromSelector(a2);
      v32 = (objc_class *)objc_opt_class();
      __int16 v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138544642;
      v80 = v31;
      __int16 v81 = 2114;
      v82 = v33;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 188;
      __int16 v89 = 2114;
      v90 = v30;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA163DCLL);
  }
  v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v34 = NSString;
    __int16 v35 = (objc_class *)[v13 classForCoder];
    if (!v35) {
      __int16 v35 = (objc_class *)objc_opt_class();
    }
    v36 = NSStringFromClass(v35);
    __int16 v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    __int16 v39 = [v34 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v36, v38];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(a2);
      __int16 v41 = (objc_class *)objc_opt_class();
      int v42 = NSStringFromClass(v41);
      *(_DWORD *)buf = 138544642;
      v80 = v40;
      __int16 v81 = 2114;
      v82 = v42;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 188;
      __int16 v89 = 2114;
      v90 = v39;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA16518);
  }

  id v14 = v10;
  if (!v14)
  {
    __int16 v43 = NSString;
    v44 = (objc_class *)objc_opt_class();
    uint64_t v45 = NSStringFromClass(v44);
    v46 = [v43 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"target", v45];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v47 = NSStringFromSelector(a2);
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      *(_DWORD *)buf = 138544642;
      v80 = v47;
      __int16 v81 = 2114;
      v82 = v49;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 189;
      __int16 v89 = 2114;
      v90 = v46;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA16630);
  }
  uint64_t v15 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = NSString;
    v51 = (objc_class *)[v15 classForCoder];
    if (!v51) {
      v51 = (objc_class *)objc_opt_class();
    }
    v52 = NSStringFromClass(v51);
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    v55 = [v50 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"target", v52, v54];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v56 = NSStringFromSelector(a2);
      id v57 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v57);
      *(_DWORD *)buf = 138544642;
      v80 = v56;
      __int16 v81 = 2114;
      v82 = v58;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 189;
      __int16 v89 = 2114;
      v90 = v55;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v55 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1676CLL);
  }

  id v16 = v11;
  v17 = NSString;
  id v18 = (objc_class *)objc_opt_class();
  if (!v16)
  {
    v59 = NSStringFromClass(v18);
    __int16 v60 = [v17 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v59];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v61 = NSStringFromSelector(a2);
      __int16 v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      *(_DWORD *)buf = 138544642;
      v80 = v61;
      __int16 v81 = 2114;
      v82 = v63;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 190;
      __int16 v89 = 2114;
      v90 = v60;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v60 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA16874);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v64 = NSString;
    v65 = (objc_class *)[v16 classForCoder];
    if (!v65) {
      v65 = (objc_class *)objc_opt_class();
    }
    __int16 v66 = NSStringFromClass(v65);
    int v67 = (objc_class *)objc_opt_class();
    __int16 v68 = NSStringFromClass(v67);
    v69 = [v64 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v66, v68];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v70 = NSStringFromSelector(a2);
      v71 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v71);
      *(_DWORD *)buf = 138544642;
      v80 = v70;
      __int16 v81 = 2114;
      v82 = v72;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 190;
      __int16 v89 = 2114;
      v90 = v69;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v69 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA169ACLL);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  unsigned int lock_deferringSeed = self->_lock_deferringSeed;
  if (lock_deferringSeed + 1 > 1) {
    uint64_t v20 = lock_deferringSeed + 1;
  }
  else {
    uint64_t v20 = 1;
  }
  self->_unsigned int lock_deferringSeed = v20;
  v21 = +[BKSHIDEventDeferringRule ruleForDeferringEventsMatchingPredicate:v13 toTarget:v15 withReason:v16 seed:v20 pid:getpid()];
  if ([(NSMutableArray *)self->_lock_deferringRules containsObject:v21])
  {
    v73 = [NSString stringWithFormat:@"wow! we've got duplicate deferring rules!!! new=%@ existing=%@", v21, self->_lock_deferringRules];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v74 = NSStringFromSelector(a2);
      v75 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v75);
      *(_DWORD *)buf = 138544642;
      v80 = v74;
      __int16 v81 = 2114;
      v82 = v76;
      __int16 v83 = 2048;
      v84 = self;
      __int16 v85 = 2114;
      v86 = @"BKSHIDEventDeliveryManager.m";
      __int16 v87 = 1024;
      int v88 = 201;
      __int16 v89 = 2114;
      v90 = v73;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v73 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA16A9CLL);
  }
  [(NSMutableArray *)self->_lock_deferringRules addObject:v21];
  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  v22 = [NSString stringWithFormat:@"%X-defer: %@", self->_lock_deferringSeed, v16];
  id v23 = objc_alloc(MEMORY[0x1E4F4F838]);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __79__BKSHIDEventDeliveryManager_deferEventsMatchingPredicate_toTarget_withReason___block_invoke;
  v77[3] = &unk_1E54415B8;
  v77[4] = self;
  id v78 = v21;
  id v24 = v21;
  v25 = (void *)[v23 initWithIdentifier:@"com.apple.backboard.hid.delivery.delivery" forReason:v22 invalidationBlock:v77];
  [(NSHashTable *)self->_lock_assertions addObject:v25];
  os_unfair_lock_unlock(&self->_lock);

  return v25;
}

- (void)_lock_implicitFlush
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_needsFlush = (__CFBoolean *)*MEMORY[0x1E4F1CFD0];
  if (!self->_lock_implicitPreventFlushingAssertion
    && ![(BSMutableIntegerMap *)self->_lock_preventFlushingReasons count])
  {
    v3 = [(BKSHIDEventDeliveryManager *)self _lock_transactionAssertionWithReason:@"BKSHIDEventDeliveryManager-implicitFlush"];
    lock_implicitPreventFlushingAssertion = self->_lock_implicitPreventFlushingAssertion;
    self->_lock_implicitPreventFlushingAssertion = v3;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke;
    block[3] = &unk_1E5441710;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __67__BKSHIDEventDeliveryManager__lock_transactionAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 208) removeObjectForKey:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_flushIfNeeded");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

- (void)_lock_flushIfNeeded
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (__CFBoolean *)*MEMORY[0x1E4F1CFC8];
  if (self->_lock_needsFlush != (__CFBoolean *)*MEMORY[0x1E4F1CFC8]
    && ![(BSMutableIntegerMap *)self->_lock_preventFlushingReasons count])
  {
    self->_lock_needsFlush = v3;
    id v4 = objc_alloc_init(BKSHIDEventDeliveryRuleChangeTransaction);
    if ((BSEqualObjects() & 1) == 0)
    {
      id v5 = BKLogEventDelivery();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        lock_discreteDispatchingRoots = self->_lock_discreteDispatchingRoots;
        int v32 = 138543362;
        __int16 v33 = lock_discreteDispatchingRoots;
        _os_log_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_DEFAULT, "flushing discrete rule change: %{public}@", (uint8_t *)&v32, 0xCu);
      }

      id v7 = (NSSet *)[(NSMutableSet *)self->_lock_discreteDispatchingRoots copy];
      lock_lastSentDiscreteDispatchingRoots = self->_lock_lastSentDiscreteDispatchingRoots;
      self->_lock_lastSentDiscreteDispatchingRoots = v7;

      id v9 = [(NSMutableSet *)self->_lock_discreteDispatchingRoots allObjects];
      [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 setDiscreteDispatchingRules:v9];
    }
    if ((BSEqualObjects() & 1) == 0)
    {
      id v10 = (NSSet *)[(NSMutableSet *)self->_lock_keyCommandsDispatchingRoots copy];
      lock_lastSentKeyCommandsDispatchingRoots = self->_lock_lastSentKeyCommandsDispatchingRoots;
      self->_lock_lastSentKeyCommandsDispatchingRoots = v10;

      id v12 = [(NSMutableSet *)self->_lock_keyCommandsDispatchingRoots allObjects];
      [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 setKeyCommandDispatchingRules:v12];
    }
    if ((BSEqualObjects() & 1) == 0)
    {
      v13 = (NSArray *)[(NSMutableArray *)self->_lock_deferringRules copy];
      lock_lastSentDeferringRules = self->_lock_lastSentDeferringRules;
      self->_lock_lastSentDeferringRules = v13;

      [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 setDeferringRules:self->_lock_deferringRules];
    }
    if ((BSEqualObjects() & 1) == 0)
    {
      uint64_t v15 = (NSDictionary *)[(NSMutableDictionary *)self->_lock_keyCommandsRegistrations copy];
      lock_lastSentKeyCommandsRegistrations = self->_lock_lastSentKeyCommandsRegistrations;
      self->_lock_lastSentKeyCommandsRegistrations = v15;

      v17 = (void *)MEMORY[0x1E4F1CAD0];
      id v18 = [(NSDictionary *)self->_lock_lastSentKeyCommandsRegistrations allValues];
      id v19 = [v17 setWithArray:v18];

      if (([(NSSet *)self->_lock_lastSentSetOfKeyCommandsRegistrations isEqual:v19] & 1) == 0)
      {
        objc_storeStrong((id *)&self->_lock_lastSentSetOfKeyCommandsRegistrations, v19);
        uint64_t v20 = [v19 allObjects];
        [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 setKeyCommandsRegistrations:v20];
      }
    }
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v22 = [(NSMutableDictionary *)self->_lock_bufferingPredicates allValues];
    id v23 = [v21 setWithArray:v22];

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lock_lastSentBufferingPredicates, v23);
      id v24 = [v23 allObjects];
      [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 setBufferingPredicates:v24];
    }
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    v26 = [(NSMutableDictionary *)self->_lock_activeUIResponderPredicates allValues];
    __int16 v27 = [v25 setWithArray:v26];

    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lock_lastSentActiveUIResponderPredicates, v23);
      v28 = [v23 allObjects];
      [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 setActiveUIResponders:v28];
    }
    uint64_t v29 = [(BKSHIDEventDeliveryRuleChangeTransaction *)v4 contentsMask];
    v30 = BKLogEventDelivery();
    __int16 v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138543362;
        __int16 v33 = v4;
        _os_log_impl(&dword_18AA0B000, v31, OS_LOG_TYPE_DEFAULT, "flushing changes: %{public}@", (uint8_t *)&v32, 0xCu);
      }

      __int16 v31 = [(BSServiceConnection *)self->_serviceConnection remoteTarget];
      [v31 submitRuleChanges:v4];
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v32) = 0;
      _os_log_debug_impl(&dword_18AA0B000, v31, OS_LOG_TYPE_DEBUG, "no-op flush", (uint8_t *)&v32, 2u);
    }
  }
}

void __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke_2;
  block[3] = &unk_1E5441710;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F4F7B8];
  id v4 = a2;
  id v5 = [v3 protocolForProtocol:&unk_1ED7795B0];
  v6 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1ED779610];
  id v7 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"BKHIDEventDeliveryManager"];
  [v7 setServer:v6];
  [v7 setClient:v5];
  [v4 setInterface:v7];
  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  id v8 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v4 setServiceQuality:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke_2;
  v9[3] = &unk_1E5441590;
  id v10 = *(id *)(a1 + 32);
  [v4 setInterruptionHandler:v9];
  [v4 setInvalidationHandler:&__block_literal_global_9445];
}

void __49__BKSHIDEventDeliveryManager__lock_implicitFlush__block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  *(void *)(v2 + 216) = 0;
  id v4 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [v4 invalidate];
}

uint64_t __44__BKSHIDEventDeliveryManager_sharedInstance__block_invoke()
{
  id v0 = [[BKSHIDEventDeliveryManager alloc] _initWithRemoteConnection];
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_initWithRemoteConnection
{
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryManager;
  uint64_t v2 = [(BKSHIDEventDeliveryManager *)&v8 init];
  if (v2)
  {
    v3 = +[BKSHIDServiceConnection clientConnectionForServiceWithName:@"BKHIDEventDeliveryManager"];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke;
    v6[3] = &unk_1E5441878;
    id v4 = v2;
    id v7 = v4;
    [v3 configureConnection:v6];
    [(BKSHIDEventDeliveryManager *)v4 _coreSetUpWithServiceConnection:v3];
    [v3 activate];
  }
  return v2;
}

- (void)_coreSetUpWithServiceConnection:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v39 = NSString;
    objc_opt_class();
    v40 = (objc_class *)objc_opt_class();
    __int16 v41 = NSStringFromClass(v40);
    int v42 = [v39 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"serviceConnection", v41];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v43 = NSStringFromSelector(a2);
      v44 = (objc_class *)objc_opt_class();
      uint64_t v45 = NSStringFromClass(v44);
      *(_DWORD *)buf = 138544642;
      id v57 = v43;
      __int16 v58 = 2114;
      v59 = v45;
      __int16 v60 = 2048;
      v61 = self;
      __int16 v62 = 2114;
      v63 = @"BKSHIDEventDeliveryManager.m";
      __int16 v64 = 1024;
      int v65 = 146;
      __int16 v66 = 2114;
      int v67 = v42;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2125CLL);
  }
  v6 = v5;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = NSString;
    v47 = (objc_class *)[v6 classForCoder];
    if (!v47) {
      v47 = (objc_class *)objc_opt_class();
    }
    v48 = NSStringFromClass(v47);
    objc_opt_class();
    v49 = (objc_class *)objc_opt_class();
    v50 = NSStringFromClass(v49);
    v51 = [v46 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"serviceConnection", v48, v50];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v52 = NSStringFromSelector(a2);
      v53 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v53);
      *(_DWORD *)buf = 138544642;
      id v57 = v52;
      __int16 v58 = 2114;
      v59 = v54;
      __int16 v60 = 2048;
      v61 = self;
      __int16 v62 = 2114;
      v63 = @"BKSHIDEventDeliveryManager.m";
      __int16 v64 = 1024;
      int v65 = 146;
      __int16 v66 = 2114;
      int v67 = v51;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2139CLL);
  }

  serviceConnection = self->_serviceConnection;
  self->_serviceConnection = (BSServiceConnection *)v6;
  id v55 = v6;

  self->_lock._os_unfair_lock_opaque = 0;
  objc_super v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  lock_assertions = self->_lock_assertions;
  self->_lock_assertions = v8;

  id v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  lock_discreteDispatchingRoots = self->_lock_discreteDispatchingRoots;
  self->_lock_discreteDispatchingRoots = v10;

  id v12 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentDiscreteDispatchingRoots = self->_lock_lastSentDiscreteDispatchingRoots;
  self->_lock_lastSentDiscreteDispatchingRoots = v12;

  id v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  lock_keyCommandsDispatchingRoots = self->_lock_keyCommandsDispatchingRoots;
  self->_lock_keyCommandsDispatchingRoots = v14;

  id v16 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentKeyCommandsDispatchingRoots = self->_lock_lastSentKeyCommandsDispatchingRoots;
  self->_lock_lastSentKeyCommandsDispatchingRoots = v16;

  id v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  lock_deferringRules = self->_lock_deferringRules;
  self->_lock_deferringRules = v18;

  uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  lock_keyCommandsRegistrations = self->_lock_keyCommandsRegistrations;
  self->_lock_keyCommandsRegistrations = v20;

  v22 = dispatch_get_global_queue(25, 0);
  id v23 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.backboard.hid.delivery-manager.implicit", 0, v22);
  implicitFlushQueue = self->_implicitFlushQueue;
  self->_implicitFlushQueue = v23;

  v25 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
  lock_preventFlushingReasons = self->_lock_preventFlushingReasons;
  self->_lock_preventFlushingReasons = v25;

  __int16 v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  lock_bufferingPredicates = self->_lock_bufferingPredicates;
  self->_lock_bufferingPredicates = v27;

  uint64_t v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentBufferingPredicates = self->_lock_lastSentBufferingPredicates;
  self->_lock_lastSentBufferingPredicates = v29;

  __int16 v31 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentActiveUIResponderPredicates = self->_lock_lastSentActiveUIResponderPredicates;
  self->_lock_lastSentActiveUIResponderPredicates = v31;

  __int16 v33 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  lock_lastSentDeferringRules = self->_lock_lastSentDeferringRules;
  self->_lock_lastSentDeferringRules = v33;

  __int16 v35 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  lock_lastSentKeyCommandsRegistrations = self->_lock_lastSentKeyCommandsRegistrations;
  self->_lock_lastSentKeyCommandsRegistrations = v35;

  __int16 v37 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentSetOfKeyCommandsRegistrations = self->_lock_lastSentSetOfKeyCommandsRegistrations;
  self->_lock_lastSentSetOfKeyCommandsRegistrations = v37;
}

void __71__BKSHIDEventDeliveryManager_bufferEventsMatchingPredicate_withReason___block_invoke(uint64_t a1, void *a2)
{
  v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 112) removeObjectForKey:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

void __79__BKSHIDEventDeliveryManager_deferEventsMatchingPredicate_toTarget_withReason___block_invoke(uint64_t a1, void *a2)
{
  v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_implicitPreventFlushingAssertion, 0);
  objc_storeStrong((id *)&self->_lock_preventFlushingReasons, 0);
  objc_storeStrong((id *)&self->_implicitFlushQueue, 0);
  objc_storeStrong((id *)&self->_lock_lastSentSetOfKeyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_lastSentKeyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_keyCommandsRegistrations, 0);
  objc_storeStrong((id *)&self->_lock_lastSentActiveUIResponderPredicates, 0);
  objc_storeStrong((id *)&self->_lock_activeUIResponderPredicates, 0);
  objc_storeStrong((id *)&self->_lock_lastSentBufferingPredicates, 0);
  objc_storeStrong((id *)&self->_lock_bufferingPredicates, 0);
  objc_storeStrong((id *)&self->_lock_lastSentDeferringRules, 0);
  objc_storeStrong((id *)&self->_lock_deferringRules, 0);
  objc_storeStrong((id *)&self->_lock_lastSentKeyCommandsDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_keyCommandsDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_lastSentDiscreteDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_discreteDispatchingRoots, 0);
  objc_storeStrong((id *)&self->_lock_assertions, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __59__BKSHIDEventDeliveryManager_appendDescriptionToFormatter___block_invoke;
  id v16 = &unk_1E5441BB0;
  id v5 = v4;
  id v17 = v5;
  id v18 = self;
  [v5 appendProem:self block:&v13];
  id v6 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", self->_lock_preventFlushingReasons, @"preventFlushingReasons", 1, v13, v14, v15, v16);
  if ([(NSMutableSet *)self->_lock_discreteDispatchingRoots count]) {
    id v7 = (id)[v5 appendObject:self->_lock_discreteDispatchingRoots withName:@"discreteDispatchingRoots"];
  }
  if ([(NSMutableSet *)self->_lock_keyCommandsDispatchingRoots count]) {
    id v8 = (id)[v5 appendObject:self->_lock_keyCommandsDispatchingRoots withName:@"keyCommandsDispatchingRoots"];
  }
  if ([(NSMutableArray *)self->_lock_deferringRules count]) {
    id v9 = (id)[v5 appendObject:self->_lock_deferringRules withName:@"deferringRules"];
  }
  if ([(NSMutableDictionary *)self->_lock_keyCommandsRegistrations count]) {
    id v10 = (id)[v5 appendObject:self->_lock_keyCommandsRegistrations withName:@"keyCommandsRegistrations"];
  }
  if ([(NSMutableDictionary *)self->_lock_bufferingPredicates count]) {
    id v11 = (id)[v5 appendObject:self->_lock_bufferingPredicates withName:@"bufferingPredicates"];
  }
  if ([(NSMutableDictionary *)self->_lock_activeUIResponderPredicates count]) {
    id v12 = (id)[v5 appendObject:self->_lock_activeUIResponderPredicates withName:@"activeUIResponderPredicates"];
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __59__BKSHIDEventDeliveryManager_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_lock_stateDescription");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v2 withName:@"state"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)_lock_stateDescription
{
  if (self->_lock_needsFlush == (__CFBoolean *)*MEMORY[0x1E4F1CFC8]) {
    return @"flushed";
  }
  if (self->_lock_implicitPreventFlushingAssertion) {
    return @"pending";
  }
  if ([(BSMutableIntegerMap *)self->_lock_preventFlushingReasons count]) {
    return @"locked";
  }
  if (self->_lock_needsFlush == (__CFBoolean *)*MEMORY[0x1E4F1CFD0]) {
    return @"dirty";
  }
  return @"initial";
}

- (void)_reconnectAfterServerInterruption
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BSServiceConnection *)self->_serviceConnection activate];
  id v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentDiscreteDispatchingRoots = self->_lock_lastSentDiscreteDispatchingRoots;
  self->_lock_lastSentDiscreteDispatchingRoots = v4;

  id v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentKeyCommandsDispatchingRoots = self->_lock_lastSentKeyCommandsDispatchingRoots;
  self->_lock_lastSentKeyCommandsDispatchingRoots = v6;

  id v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  lock_lastSentDeferringRules = self->_lock_lastSentDeferringRules;
  self->_lock_lastSentDeferringRules = v8;

  id v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentBufferingPredicates = self->_lock_lastSentBufferingPredicates;
  self->_lock_lastSentBufferingPredicates = v10;

  id v12 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentActiveUIResponderPredicates = self->_lock_lastSentActiveUIResponderPredicates;
  self->_lock_lastSentActiveUIResponderPredicates = v12;

  uint64_t v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  lock_lastSentKeyCommandsRegistrations = self->_lock_lastSentKeyCommandsRegistrations;
  self->_lock_lastSentKeyCommandsRegistrations = v14;

  id v16 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  lock_lastSentSetOfKeyCommandsRegistrations = self->_lock_lastSentSetOfKeyCommandsRegistrations;
  self->_lock_lastSentSetOfKeyCommandsRegistrations = v16;

  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  os_unfair_lock_unlock(p_lock);
}

- (void)_syncServiceFlushState
{
}

- (int64_t)authenticateMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v10 = BKLogEventDelivery();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      int64_t v9 = 1;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v11 = "authenticateMessage: message is nil";
    id v12 = v10;
    uint32_t v13 = 2;
LABEL_15:
    _os_log_error_impl(&dword_18AA0B000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_8;
  }
  if ([v3 originIdentifier] != 0xC181BADB23D8497BLL)
  {
    id v10 = BKLogEventDelivery();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)buf = 138543362;
    id v19 = v4;
    id v11 = "authenticateMessage: message did not originate in backboardd: %{public}@";
    id v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_15;
  }
  unsigned int v17 = 0;
  id v16 = 0;
  id v5 = [MEMORY[0x1E4F4F808] encodeObject:v4 error:&v16];
  id v6 = v16;
  if (v5)
  {
    mach_port_t v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    id v8 = v5;
    _BKSHIDVerifyEventAuthenticationMessage(v7, [v8 bytes], objc_msgSend(v8, "length"), (int *)&v17);
    int64_t v9 = v17;
  }
  else
  {
    uint64_t v14 = BKLogEventDelivery();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v4;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_error_impl(&dword_18AA0B000, v14, OS_LOG_TYPE_ERROR, "authenticateMessage: failed to encode %{public}@: %{public}@", buf, 0x16u);
    }

    int64_t v9 = 0;
  }

LABEL_13:
  return v9;
}

- (id)dispatchKeyCommandsForReason:(id)a3 withRule:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = NSString;
  id v11 = (objc_class *)objc_opt_class();
  if (!v9)
  {
    uint64_t v22 = NSStringFromClass(v11);
    id v23 = [v10 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v22];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v24 = NSStringFromSelector(a2);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v55 = v24;
      __int16 v56 = 2114;
      id v57 = v26;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BKSHIDEventDeliveryManager.m";
      __int16 v62 = 1024;
      int v63 = 419;
      __int16 v64 = 2114;
      int v65 = v23;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA60858);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v27 = NSString;
    v28 = (objc_class *)[v9 classForCoder];
    if (!v28) {
      v28 = (objc_class *)objc_opt_class();
    }
    uint64_t v29 = NSStringFromClass(v28);
    v30 = (objc_class *)objc_opt_class();
    __int16 v31 = NSStringFromClass(v30);
    int v32 = [v27 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v29, v31];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = NSStringFromSelector(a2);
      uint64_t v34 = (objc_class *)objc_opt_class();
      __int16 v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138544642;
      id v55 = v33;
      __int16 v56 = 2114;
      id v57 = v35;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BKSHIDEventDeliveryManager.m";
      __int16 v62 = 1024;
      int v63 = 419;
      __int16 v64 = 2114;
      int v65 = v32;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA60990);
  }

  id v12 = v8;
  if (!v12)
  {
    v36 = NSString;
    __int16 v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    __int16 v39 = [v36 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"rule", v38];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v40 = NSStringFromSelector(a2);
      __int16 v41 = (objc_class *)objc_opt_class();
      int v42 = NSStringFromClass(v41);
      *(_DWORD *)buf = 138544642;
      id v55 = v40;
      __int16 v56 = 2114;
      id v57 = v42;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BKSHIDEventDeliveryManager.m";
      __int16 v62 = 1024;
      int v63 = 420;
      __int16 v64 = 2114;
      int v65 = v39;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA60AA4);
  }
  uint32_t v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v43 = NSString;
    v44 = (objc_class *)[v13 classForCoder];
    if (!v44) {
      v44 = (objc_class *)objc_opt_class();
    }
    uint64_t v45 = NSStringFromClass(v44);
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    v48 = [v43 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"rule", v45, v47];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v49 = NSStringFromSelector(a2);
      v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      *(_DWORD *)buf = 138544642;
      id v55 = v49;
      __int16 v56 = 2114;
      id v57 = v51;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2114;
      v61 = @"BKSHIDEventDeliveryManager.m";
      __int16 v62 = 1024;
      int v63 = 420;
      __int16 v64 = 2114;
      int v65 = v48;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA60BDCLL);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_keyCommandsDispatchingSeed;
  uint64_t v14 = [[BKSHIDEventKeyCommandDispatchingRoot alloc] initWithReason:v9 seed:self->_lock_keyCommandsDispatchingSeed rule:v13];
  uint64_t v15 = NSString;
  uint64_t v16 = self->_lock_keyCommandsDispatchingSeed + 1;
  self->_lock_keyCommandsDispatchingSeed = v16;
  unsigned int v17 = [v15 stringWithFormat:@"%li-dispatchKeycmds: %@", v16, v9];
  [(NSMutableSet *)self->_lock_keyCommandsDispatchingRoots addObject:v14];
  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  id v18 = objc_alloc(MEMORY[0x1E4F4F838]);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __68__BKSHIDEventDeliveryManager_dispatchKeyCommandsForReason_withRule___block_invoke;
  v52[3] = &unk_1E54415B8;
  v52[4] = self;
  v53 = v14;
  id v19 = v14;
  __int16 v20 = (void *)[v18 initWithIdentifier:@"com.apple.backboard.hid.delivery.delivery" forReason:v17 invalidationBlock:v52];
  [(NSHashTable *)self->_lock_assertions addObject:v20];
  os_unfair_lock_unlock(&self->_lock);

  return v20;
}

void __68__BKSHIDEventDeliveryManager_dispatchKeyCommandsForReason_withRule___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

- (id)dispatchDiscreteEventsForReason:(id)a3 withRules:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = NSString;
  id v11 = (objc_class *)objc_opt_class();
  if (!v9)
  {
    uint64_t v45 = NSStringFromClass(v11);
    v46 = [v10 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v45];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v47 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      *(_DWORD *)buf = 138544642;
      __int16 v83 = v47;
      __int16 v84 = 2114;
      __int16 v85 = v49;
      __int16 v86 = 2048;
      __int16 v87 = self;
      __int16 v88 = 2114;
      __int16 v89 = @"BKSHIDEventDeliveryManager.m";
      __int16 v90 = 1024;
      int v91 = 380;
      __int16 v92 = 2114;
      v93 = v46;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA612F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v50 = NSString;
    v51 = (objc_class *)[v9 classForCoder];
    if (!v51) {
      v51 = (objc_class *)objc_opt_class();
    }
    v52 = NSStringFromClass(v51);
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    id v55 = [v50 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v52, v54];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      __int16 v56 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      id v57 = (objc_class *)objc_opt_class();
      __int16 v58 = NSStringFromClass(v57);
      *(_DWORD *)buf = 138544642;
      __int16 v83 = v56;
      __int16 v84 = 2114;
      __int16 v85 = v58;
      __int16 v86 = 2048;
      __int16 v87 = self;
      __int16 v88 = 2114;
      __int16 v89 = @"BKSHIDEventDeliveryManager.m";
      __int16 v90 = 1024;
      int v91 = 380;
      __int16 v92 = 2114;
      v93 = v55;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v55 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61430);
  }

  id v12 = v8;
  if (!v12)
  {
    v59 = NSString;
    __int16 v60 = (objc_class *)objc_opt_class();
    v61 = NSStringFromClass(v60);
    __int16 v62 = [v59 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"ruleSet", v61];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      int v63 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      __int16 v64 = (objc_class *)objc_opt_class();
      int v65 = NSStringFromClass(v64);
      *(_DWORD *)buf = 138544642;
      __int16 v83 = v63;
      __int16 v84 = 2114;
      __int16 v85 = v65;
      __int16 v86 = 2048;
      __int16 v87 = self;
      __int16 v88 = 2114;
      __int16 v89 = @"BKSHIDEventDeliveryManager.m";
      __int16 v90 = 1024;
      int v91 = 381;
      __int16 v92 = 2114;
      v93 = v62;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v62 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61544);
  }
  uint32_t v13 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v66 = NSString;
    int v67 = (objc_class *)[v13 classForCoder];
    if (!v67) {
      int v67 = (objc_class *)objc_opt_class();
    }
    uint64_t v68 = NSStringFromClass(v67);
    v69 = (objc_class *)objc_opt_class();
    uint64_t v70 = NSStringFromClass(v69);
    v71 = [v66 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"ruleSet", v68, v70];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v72 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
      v73 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v73);
      *(_DWORD *)buf = 138544642;
      __int16 v83 = v72;
      __int16 v84 = 2114;
      __int16 v85 = v74;
      __int16 v86 = 2048;
      __int16 v87 = self;
      __int16 v88 = 2114;
      __int16 v89 = @"BKSHIDEventDeliveryManager.m";
      __int16 v90 = 1024;
      int v91 = 381;
      __int16 v92 = 2114;
      v93 = v71;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v71 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6167CLL);
  }

  uint64_t v14 = (void *)[v13 copy];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v77 objects:v81 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v78 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v77 + 1) + 8 * i);
        if (!v20)
        {
          uint64_t v29 = NSString;
          v30 = (objc_class *)objc_opt_class();
          __int16 v31 = NSStringFromClass(v30);
          int v32 = [v29 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"rule", v31];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            __int16 v33 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
            uint64_t v34 = (objc_class *)objc_opt_class();
            __int16 v35 = NSStringFromClass(v34);
            *(_DWORD *)buf = 138544642;
            __int16 v83 = v33;
            __int16 v84 = 2114;
            __int16 v85 = v35;
            __int16 v86 = 2048;
            __int16 v87 = self;
            __int16 v88 = 2114;
            __int16 v89 = @"BKSHIDEventDeliveryManager.m";
            __int16 v90 = 1024;
            int v91 = 384;
            __int16 v92 = 2114;
            v93 = v32;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v32 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA610B4);
        }
        id v21 = v20;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v36 = NSString;
          __int16 v37 = (objc_class *)[v21 classForCoder];
          if (!v37) {
            __int16 v37 = (objc_class *)objc_opt_class();
          }
          v38 = NSStringFromClass(v37);
          __int16 v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          __int16 v41 = [v36 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"rule", v38, v40];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            int v42 = (BKSHIDEventDiscreteDispatchingRoot *)objc_claimAutoreleasedReturnValue();
            __int16 v43 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v43);
            *(_DWORD *)buf = 138544642;
            __int16 v83 = v42;
            __int16 v84 = 2114;
            __int16 v85 = v44;
            __int16 v86 = 2048;
            __int16 v87 = self;
            __int16 v88 = 2114;
            __int16 v89 = @"BKSHIDEventDeliveryManager.m";
            __int16 v90 = 1024;
            int v91 = 384;
            __int16 v92 = 2114;
            v93 = v41;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v41 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA611F0);
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v77 objects:v81 count:16];
    }
    while (v17);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  ++self->_lock_discreteDispatchingSeed;
  uint64_t v22 = [[BKSHIDEventDiscreteDispatchingRoot alloc] initWithReason:v9 seed:self->_lock_discreteDispatchingSeed rules:v15];
  id v23 = BKLogEventDelivery();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v83 = v22;
    _os_log_impl(&dword_18AA0B000, v23, OS_LOG_TYPE_DEFAULT, "adding root: %{public}@", buf, 0xCu);
  }

  [(NSMutableSet *)self->_lock_discreteDispatchingRoots addObject:v22];
  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  id v24 = objc_alloc(MEMORY[0x1E4F4F838]);
  v25 = [NSString stringWithFormat:@"%@-%u", v9, -[BKSHIDEventDeliveryRuleWrapper seed](v22, "seed")];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __72__BKSHIDEventDeliveryManager_dispatchDiscreteEventsForReason_withRules___block_invoke;
  v75[3] = &unk_1E54415B8;
  v75[4] = self;
  v76 = v22;
  v26 = v22;
  __int16 v27 = (void *)[v24 initWithIdentifier:@"com.apple.backboard.hid.delivery.delivery" forReason:v25 invalidationBlock:v75];

  [(NSHashTable *)self->_lock_assertions addObject:v27];
  os_unfair_lock_unlock(&self->_lock);

  return v27;
}

void __72__BKSHIDEventDeliveryManager_dispatchDiscreteEventsForReason_withRules___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

- (id)connectionDescriptionForDeferringRuleIdentity:(id)a3
{
  serviceConnection = self->_serviceConnection;
  id v4 = a3;
  id v5 = [(BSServiceConnection *)serviceConnection remoteTarget];
  id v6 = [v5 connectionDescriptionForDeferringRuleIdentity:v4];

  return v6;
}

- (id)connectionDescriptionForDeferringRuleWithSeed:(unsigned int)a3 pid:(int)a4
{
  id v5 = [[_BKSHIDEventDeferringRuleIdentity alloc] initWithSeed:*(void *)&a3 pid:*(void *)&a4];
  id v6 = [(BKSHIDEventDeliveryManager *)self connectionDescriptionForDeferringRuleIdentity:v5];

  return v6;
}

- (id)deliveryGraphDescription
{
  id v2 = [(BSServiceConnection *)self->_serviceConnection remoteTarget];
  id v3 = [v2 deliveryGraphDescription];

  return v3;
}

- (void)selectDeferringPredicate:(id)a3 withReason:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    id v15 = NSString;
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v18 = [v15 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v19 = NSStringFromSelector(a2);
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      v51 = v19;
      __int16 v52 = 2114;
      v53 = v21;
      __int16 v54 = 2048;
      id v55 = self;
      __int16 v56 = 2114;
      id v57 = @"BKSHIDEventDeliveryManager.m";
      __int16 v58 = 1024;
      int v59 = 351;
      __int16 v60 = 2114;
      v61 = v18;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61A7CLL);
  }
  id v49 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v22 = NSString;
    id v23 = (objc_class *)[v49 classForCoder];
    if (!v23) {
      id v23 = (objc_class *)objc_opt_class();
    }
    id v24 = NSStringFromClass(v23);
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    __int16 v27 = [v22 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v24, v26];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      uint64_t v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      v51 = v28;
      __int16 v52 = 2114;
      v53 = v30;
      __int16 v54 = 2048;
      id v55 = self;
      __int16 v56 = 2114;
      id v57 = @"BKSHIDEventDeliveryManager.m";
      __int16 v58 = 1024;
      int v59 = 351;
      __int16 v60 = 2114;
      v61 = v27;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61BB8);
  }

  id v10 = v8;
  id v11 = NSString;
  id v12 = (objc_class *)objc_opt_class();
  if (!v10)
  {
    __int16 v31 = NSStringFromClass(v12);
    int v32 = [v11 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v31];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = NSStringFromSelector(a2);
      uint64_t v34 = (objc_class *)objc_opt_class();
      __int16 v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138544642;
      v51 = v33;
      __int16 v52 = 2114;
      v53 = v35;
      __int16 v54 = 2048;
      id v55 = self;
      __int16 v56 = 2114;
      id v57 = @"BKSHIDEventDeliveryManager.m";
      __int16 v58 = 1024;
      int v59 = 352;
      __int16 v60 = 2114;
      v61 = v32;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61CC0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = NSString;
    __int16 v37 = (objc_class *)[v10 classForCoder];
    if (!v37) {
      __int16 v37 = (objc_class *)objc_opt_class();
    }
    v38 = NSStringFromClass(v37);
    __int16 v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    __int16 v41 = [v36 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v38, v40];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v42 = NSStringFromSelector(a2);
      __int16 v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      *(_DWORD *)buf = 138544642;
      v51 = v42;
      __int16 v52 = 2114;
      v53 = v44;
      __int16 v54 = 2048;
      id v55 = self;
      __int16 v56 = 2114;
      id v57 = @"BKSHIDEventDeliveryManager.m";
      __int16 v58 = 1024;
      int v59 = 352;
      __int16 v60 = 2114;
      v61 = v41;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61DF8);
  }

  uint32_t v13 = [v49 token];

  if (!v13)
  {
    uint64_t v45 = [NSString stringWithFormat:@"predicate must have a valid token"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v46 = NSStringFromSelector(a2);
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      *(_DWORD *)buf = 138544642;
      v51 = v46;
      __int16 v52 = 2114;
      v53 = v48;
      __int16 v54 = 2048;
      id v55 = self;
      __int16 v56 = 2114;
      id v57 = @"BKSHIDEventDeliveryManager.m";
      __int16 v58 = 1024;
      int v59 = 353;
      __int16 v60 = 2114;
      v61 = v45;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA61EE0);
  }
  uint64_t v14 = [(BSServiceConnection *)self->_serviceConnection remoteTarget];
  [v14 selectDeferringTargetForPredicate:v49];
}

- (id)requestActiveUIResponderForDeferringPredicate:(id)a3 withReason:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    id v23 = NSString;
    id v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = [v23 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v25];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      __int16 v64 = v27;
      __int16 v65 = 2114;
      uint64_t v66 = v29;
      __int16 v67 = 2048;
      uint64_t v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = @"BKSHIDEventDeliveryManager.m";
      __int16 v71 = 1024;
      int v72 = 318;
      __int16 v73 = 2114;
      v74 = v26;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62218);
  }
  id v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = NSString;
    __int16 v31 = (objc_class *)[v10 classForCoder];
    if (!v31) {
      __int16 v31 = (objc_class *)objc_opt_class();
    }
    int v32 = NSStringFromClass(v31);
    __int16 v33 = (objc_class *)objc_opt_class();
    uint64_t v34 = NSStringFromClass(v33);
    __int16 v35 = [v30 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v32, v34];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v36 = NSStringFromSelector(a2);
      __int16 v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138544642;
      __int16 v64 = v36;
      __int16 v65 = 2114;
      uint64_t v66 = v38;
      __int16 v67 = 2048;
      uint64_t v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = @"BKSHIDEventDeliveryManager.m";
      __int16 v71 = 1024;
      int v72 = 318;
      __int16 v73 = 2114;
      v74 = v35;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62354);
  }

  id v11 = v8;
  id v12 = NSString;
  uint32_t v13 = (objc_class *)objc_opt_class();
  if (!v11)
  {
    __int16 v39 = NSStringFromClass(v13);
    v40 = [v12 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v39];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v41 = NSStringFromSelector(a2);
      int v42 = (objc_class *)objc_opt_class();
      __int16 v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138544642;
      __int16 v64 = v41;
      __int16 v65 = 2114;
      uint64_t v66 = v43;
      __int16 v67 = 2048;
      uint64_t v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = @"BKSHIDEventDeliveryManager.m";
      __int16 v71 = 1024;
      int v72 = 319;
      __int16 v73 = 2114;
      v74 = v40;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6245CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = NSString;
    uint64_t v45 = (objc_class *)[v11 classForCoder];
    if (!v45) {
      uint64_t v45 = (objc_class *)objc_opt_class();
    }
    v46 = NSStringFromClass(v45);
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    id v49 = [v44 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v46, v48];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v50 = NSStringFromSelector(a2);
      v51 = (objc_class *)objc_opt_class();
      __int16 v52 = NSStringFromClass(v51);
      *(_DWORD *)buf = 138544642;
      __int16 v64 = v50;
      __int16 v65 = 2114;
      uint64_t v66 = v52;
      __int16 v67 = 2048;
      uint64_t v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = @"BKSHIDEventDeliveryManager.m";
      __int16 v71 = 1024;
      int v72 = 319;
      __int16 v73 = 2114;
      v74 = v49;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62594);
  }

  uint64_t v14 = [v10 token];

  if (!v14)
  {
    v53 = [NSString stringWithFormat:@"predicate must have a valid token"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v54 = NSStringFromSelector(a2);
      id v55 = (objc_class *)objc_opt_class();
      __int16 v56 = NSStringFromClass(v55);
      *(_DWORD *)buf = 138544642;
      __int16 v64 = v54;
      __int16 v65 = 2114;
      uint64_t v66 = v56;
      __int16 v67 = 2048;
      uint64_t v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = @"BKSHIDEventDeliveryManager.m";
      __int16 v71 = 1024;
      int v72 = 320;
      __int16 v73 = 2114;
      v74 = v53;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v53 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6267CLL);
  }
  os_unfair_lock_lock(&self->_lock);
  id v15 = NSString;
  uint64_t v16 = self->_lock_bufferingSeed + 1;
  self->_lock_bufferingSeed = v16;
  uint64_t v17 = [v15 stringWithFormat:@"%li-activeUIResponder: %@", v16, v11];
  uint64_t v18 = [(NSMutableDictionary *)self->_lock_bufferingPredicates objectForKey:v17];

  if (v18)
  {
    id v57 = [NSString stringWithFormat:@"wow! we've got duplicate activeUIResponder keys!!! new=%@ existing=%@ : predicate=%@", v17, self->_lock_activeUIResponderPredicates, v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v58 = NSStringFromSelector(a2);
      int v59 = (objc_class *)objc_opt_class();
      __int16 v60 = NSStringFromClass(v59);
      *(_DWORD *)buf = 138544642;
      __int16 v64 = v58;
      __int16 v65 = 2114;
      uint64_t v66 = v60;
      __int16 v67 = 2048;
      uint64_t v68 = self;
      __int16 v69 = 2114;
      uint64_t v70 = @"BKSHIDEventDeliveryManager.m";
      __int16 v71 = 1024;
      int v72 = 325;
      __int16 v73 = 2114;
      v74 = v57;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v57 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62770);
  }
  [(NSMutableDictionary *)self->_lock_activeUIResponderPredicates setObject:v10 forKey:v17];
  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  id v19 = objc_alloc(MEMORY[0x1E4F4F838]);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __87__BKSHIDEventDeliveryManager_requestActiveUIResponderForDeferringPredicate_withReason___block_invoke;
  v61[3] = &unk_1E54415B8;
  v61[4] = self;
  id v62 = v17;
  id v20 = v17;
  id v21 = (void *)[v19 initWithIdentifier:@"com.apple.backboard.hid.delivery.activeUIResponder" forReason:v20 invalidationBlock:v61];
  [(NSHashTable *)self->_lock_assertions addObject:v21];
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_assert_not_owner(&self->_lock);

  return v21;
}

void __87__BKSHIDEventDeliveryManager_requestActiveUIResponderForDeferringPredicate_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 136) removeObjectForKey:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

- (id)registerKeyCommands:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v15 = NSString;
    uint64_t v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    uint64_t v18 = [v15 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"registration", v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v19 = NSStringFromSelector(a2);
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      v38 = v19;
      __int16 v39 = 2114;
      v40 = v21;
      __int16 v41 = 2048;
      int v42 = self;
      __int16 v43 = 2114;
      v44 = @"BKSHIDEventDeliveryManager.m";
      __int16 v45 = 1024;
      int v46 = 226;
      __int16 v47 = 2114;
      v48 = v18;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62ADCLL);
  }
  id v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v22 = NSString;
    id v23 = (objc_class *)[v6 classForCoder];
    if (!v23) {
      id v23 = (objc_class *)objc_opt_class();
    }
    id v24 = NSStringFromClass(v23);
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    __int16 v27 = [v22 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"registration", v24, v26];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      uint64_t v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      v38 = v28;
      __int16 v39 = 2114;
      v40 = v30;
      __int16 v41 = 2048;
      int v42 = self;
      __int16 v43 = 2114;
      v44 = @"BKSHIDEventDeliveryManager.m";
      __int16 v45 = 1024;
      int v46 = 226;
      __int16 v47 = 2114;
      v48 = v27;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62C18);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = NSString;
  uint64_t v8 = self->_lock_keyCommandsRegistrationSeed + 1;
  self->_lock_keyCommandsRegistrationSeed = v8;
  id v9 = objc_msgSend(v7, "stringWithFormat:", @"%li-keycmds", v8);
  id v10 = [(NSMutableDictionary *)self->_lock_keyCommandsRegistrations objectForKey:v9];

  if (v10)
  {
    __int16 v31 = [NSString stringWithFormat:@"wow! we've got duplicate registration keys!!! new=%@ existing=%@ : registration=%@", v9, self->_lock_keyCommandsRegistrations, v6];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v32 = NSStringFromSelector(a2);
      __int16 v33 = (objc_class *)objc_opt_class();
      uint64_t v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138544642;
      v38 = v32;
      __int16 v39 = 2114;
      v40 = v34;
      __int16 v41 = 2048;
      int v42 = self;
      __int16 v43 = 2114;
      v44 = @"BKSHIDEventDeliveryManager.m";
      __int16 v45 = 1024;
      int v46 = 232;
      __int16 v47 = 2114;
      v48 = v31;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62D0CLL);
  }
  [(NSMutableDictionary *)self->_lock_keyCommandsRegistrations setObject:v6 forKey:v9];
  [(BKSHIDEventDeliveryManager *)self _lock_implicitFlush];
  id v11 = objc_alloc(MEMORY[0x1E4F4F838]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __50__BKSHIDEventDeliveryManager_registerKeyCommands___block_invoke;
  v35[3] = &unk_1E54415B8;
  v35[4] = self;
  id v36 = v9;
  id v12 = v9;
  uint32_t v13 = (void *)[v11 initWithIdentifier:@"com.apple.backboard.hid.delivery.delivery" forReason:v12 invalidationBlock:v35];
  [(NSHashTable *)self->_lock_assertions addObject:v13];
  os_unfair_lock_unlock(&self->_lock);

  return v13;
}

void __50__BKSHIDEventDeliveryManager_registerKeyCommands___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (const os_unfair_lock *)(*(void *)(a1 + 32) + 20);
  id v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v4];

  [*(id *)(*(void *)(a1 + 32) + 160) removeObjectForKey:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_lock_implicitFlush");
  id v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  os_unfair_lock_unlock(v5);
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_forTesting)
  {
    id v4 = [NSString stringWithFormat:@"-dealloc is not allowed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      id v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = @"BKSHIDEventDeliveryManager.m";
      __int16 v17 = 1024;
      int v18 = 172;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA62F08);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryManager;
  [(BKSHIDEventDeliveryManager *)&v8 dealloc];
}

uint64_t __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconnectAfterServerInterruption];
}

void __55__BKSHIDEventDeliveryManager__initWithRemoteConnection__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BKLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "delivery manager invalidated - backboardd must have unloaded, exiting…", v4, 2u);
  }

  exit(0);
}

- (id)_initForTestingWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryManager;
  id v5 = [(BKSHIDEventDeliveryManager *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(BKSHIDEventDeliveryManager *)v5 _coreSetUpWithServiceConnection:v4];
    v6->_forTesting = 1;
  }

  return v6;
}

- (BKSHIDEventDeliveryManager)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeliveryManager"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventDeliveryManager.m";
    __int16 v17 = 1024;
    int v18 = 99;
    __int16 v19 = 2114;
    id v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeliveryManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end