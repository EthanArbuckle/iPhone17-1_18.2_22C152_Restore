@interface NSXPCConnection(BSServiceConnection)
- (id)externalMessageSessionController;
@end

@implementation NSXPCConnection(BSServiceConnection)

- (id)externalMessageSessionController
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(a1, "BSServiceConnectionTransport");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"transport", v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v23 = v10;
      __int16 v24 = 2114;
      v25 = v12;
      __int16 v26 = 2048;
      v27 = a1;
      __int16 v28 = 2114;
      v29 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v30 = 1024;
      int v31 = 57;
      __int16 v32 = 2114;
      v33 = v9;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77F6DCLL);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = NSString;
    v14 = (objc_class *)[v4 classForCoder];
    if (!v14) {
      v14 = (objc_class *)objc_opt_class();
    }
    v15 = NSStringFromClass(v14);
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v13 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"transport", v15, v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v23 = v19;
      __int16 v24 = 2114;
      v25 = v21;
      __int16 v26 = 2048;
      v27 = a1;
      __int16 v28 = 2114;
      v29 = @"BSServiceConnection+NSXPCConnection.m";
      __int16 v30 = 1024;
      int v31 = 57;
      __int16 v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C77F820);
  }

  return v4;
}

@end