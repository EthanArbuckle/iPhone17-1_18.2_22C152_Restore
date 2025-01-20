@interface BKSHIDEventDeliveryChainObserver
- (BKSHIDEventDeferringEnvironment)deferringEnvironment;
- (BKSHIDEventDeliveryChainObserver)init;
- (BKSHIDEventDeliveryChainObserver)initWithDisplay:(id)a3 environment:(id)a4;
- (BKSHIDEventDisplay)display;
- (id)addChainObserver:(id)a3;
@end

@implementation BKSHIDEventDeliveryChainObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringEnvironment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (BKSHIDEventDeferringEnvironment)deferringEnvironment
{
  return self->_deferringEnvironment;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (id)addChainObserver:(id)a3
{
  id v4 = a3;
  v5 = +[BKSHIDEventObserver sharedInstance];
  v6 = [v5 addObservingClient:v4 forChainObserver:self];

  return v6;
}

- (BKSHIDEventDeliveryChainObserver)initWithDisplay:(id)a3 environment:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)BKSHIDEventDeliveryChainObserver;
  v10 = [(BKSHIDEventDeliveryChainObserver *)&v48 init];
  if (v10)
  {
    id v11 = v8;
    if (!v11)
    {
      v16 = NSString;
      objc_opt_class();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = [v16 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v18];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v20 = NSStringFromSelector(a2);
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138544642;
        v50 = v20;
        __int16 v51 = 2114;
        v52 = v22;
        __int16 v53 = 2048;
        v54 = v10;
        __int16 v55 = 2114;
        v56 = @"BKSHIDEventDeliveryChainObserver.m";
        __int16 v57 = 1024;
        int v58 = 31;
        __int16 v59 = 2114;
        v60 = v19;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA2B544);
    }
    v12 = v11;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = NSString;
      v24 = (objc_class *)[v12 classForCoder];
      if (!v24) {
        v24 = (objc_class *)objc_opt_class();
      }
      v25 = NSStringFromClass(v24);
      objc_opt_class();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = [v23 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v25, v27];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v29 = NSStringFromSelector(a2);
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        *(_DWORD *)buf = 138544642;
        v50 = v29;
        __int16 v51 = 2114;
        v52 = v31;
        __int16 v53 = 2048;
        v54 = v10;
        __int16 v55 = 2114;
        v56 = @"BKSHIDEventDeliveryChainObserver.m";
        __int16 v57 = 1024;
        int v58 = 31;
        __int16 v59 = 2114;
        v60 = v28;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA2B684);
    }

    id v13 = v9;
    if (!v13)
    {
      v32 = NSString;
      objc_opt_class();
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      v35 = [v32 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"deferringEnvironment", v34];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v36 = NSStringFromSelector(a2);
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138544642;
        v50 = v36;
        __int16 v51 = 2114;
        v52 = v38;
        __int16 v53 = 2048;
        v54 = v10;
        __int16 v55 = 2114;
        v56 = @"BKSHIDEventDeliveryChainObserver.m";
        __int16 v57 = 1024;
        int v58 = 32;
        __int16 v59 = 2114;
        v60 = v35;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA2B7A0);
    }
    v14 = v13;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v39 = NSString;
      v40 = (objc_class *)[v14 classForCoder];
      if (!v40) {
        v40 = (objc_class *)objc_opt_class();
      }
      v41 = NSStringFromClass(v40);
      objc_opt_class();
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      v44 = [v39 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"deferringEnvironment", v41, v43];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v45 = NSStringFromSelector(a2);
        v46 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v46);
        *(_DWORD *)buf = 138544642;
        v50 = v45;
        __int16 v51 = 2114;
        v52 = v47;
        __int16 v53 = 2048;
        v54 = v10;
        __int16 v55 = 2114;
        v56 = @"BKSHIDEventDeliveryChainObserver.m";
        __int16 v57 = 1024;
        int v58 = 32;
        __int16 v59 = 2114;
        v60 = v44;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v44 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA2B8E0);
    }

    objc_storeStrong((id *)&v10->_display, a3);
    objc_storeStrong((id *)&v10->_deferringEnvironment, a4);
  }

  return v10;
}

- (BKSHIDEventDeliveryChainObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKSHIDEventDeliveryChainObserver;
  v2 = [(BKSHIDEventDeliveryChainObserver *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[BKSHIDEventDisplay nullDisplay];
    display = v2->_display;
    v2->_display = (BKSHIDEventDisplay *)v3;

    uint64_t v5 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
    deferringEnvironment = v2->_deferringEnvironment;
    v2->_deferringEnvironment = (BKSHIDEventDeferringEnvironment *)v5;
  }
  return v2;
}

@end