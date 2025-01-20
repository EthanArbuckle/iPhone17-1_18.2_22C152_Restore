@interface BKSHIDEventDiscreteDispatchingRoot
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDiscreteDispatchingRoot)initWithReason:(id)a3 seed:(unsigned int)a4 rules:(id)a5;
- (id)decodePayload:(id)a3;
@end

@implementation BKSHIDEventDiscreteDispatchingRoot

- (BKSHIDEventDiscreteDispatchingRoot)initWithReason:(id)a3 seed:(unsigned int)a4 rules:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v37 = NSString;
    objc_opt_class();
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    v40 = [v37 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"rules", v39];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v41 = NSStringFromSelector(a2);
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138544642;
      v60 = v41;
      __int16 v61 = 2114;
      v62 = v43;
      __int16 v63 = 2048;
      v64 = self;
      __int16 v65 = 2114;
      v66 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
      __int16 v67 = 1024;
      int v68 = 162;
      __int16 v69 = 2114;
      v70 = v40;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA350ECLL);
  }
  v11 = v10;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = NSString;
    v45 = (objc_class *)[v11 classForCoder];
    if (!v45) {
      v45 = (objc_class *)objc_opt_class();
    }
    v46 = NSStringFromClass(v45);
    objc_opt_class();
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    v49 = [v44 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"rules", v46, v48];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v50 = NSStringFromSelector(a2);
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      *(_DWORD *)buf = 138544642;
      v60 = v50;
      __int16 v61 = 2114;
      v62 = v52;
      __int16 v63 = 2048;
      v64 = self;
      __int16 v65 = 2114;
      v66 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
      __int16 v67 = 1024;
      int v68 = 162;
      __int16 v69 = 2114;
      v70 = v49;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3522CLL);
  }

  objc_opt_class();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(id *)(*((void *)&v54 + 1) + 8 * v16);
        if (!v17)
        {
          v21 = NSString;
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          v24 = [v21 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"obj", v23];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v25 = NSStringFromSelector(a2);
            v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            *(_DWORD *)buf = 138544642;
            v60 = v25;
            __int16 v61 = 2114;
            v62 = v27;
            __int16 v63 = 2048;
            v64 = self;
            __int16 v65 = 2114;
            v66 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
            __int16 v67 = 1024;
            int v68 = 165;
            __int16 v69 = 2114;
            v70 = v24;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v24 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA34E90);
        }
        v18 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v28 = NSString;
          v29 = (objc_class *)[v18 classForCoder];
          if (!v29) {
            v29 = (objc_class *)objc_opt_class();
          }
          v30 = NSStringFromClass(v29);
          v31 = (objc_class *)objc_opt_class();
          v32 = NSStringFromClass(v31);
          v33 = [v28 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"obj", v30, v32];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v34 = NSStringFromSelector(a2);
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            *(_DWORD *)buf = 138544642;
            v60 = v34;
            __int16 v61 = 2114;
            v62 = v36;
            __int16 v63 = 2048;
            v64 = self;
            __int16 v65 = 2114;
            v66 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
            __int16 v67 = 1024;
            int v68 = 165;
            __int16 v69 = 2114;
            v70 = v33;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          [v33 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA34FD0);
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v14);
  }

  v53.receiver = self;
  v53.super_class = (Class)BKSHIDEventDiscreteDispatchingRoot;
  v19 = [(BKSHIDEventDeliveryRuleWrapper *)&v53 initWithReason:v9 seed:v6 payload:v12];

  return v19;
}

- (id)decodePayload:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 error];

  if (v4)
  {
    v5 = BKLogEventDelivery();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      uint64_t v6 = 0;
      goto LABEL_4;
    }
    id v16 = [v3 error];
    *(_DWORD *)buf = 138543362;
    id v32 = v16;
    id v17 = "WTAF sticky error %{public}@";
LABEL_31:
    _os_log_error_impl(&dword_18AA0B000, v5, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    goto LABEL_3;
  }
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v12 = [v3 decodeObjectOfClasses:v11 forKey:@"payload"];

  if (!v12)
  {
    v5 = BKLogEventDelivery();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    id v16 = [v3 error];
    *(_DWORD *)buf = 138543362;
    id v32 = v16;
    id v17 = "payload is missing %{public}@";
    goto LABEL_31;
  }
  uint64_t v13 = objc_opt_class();
  id v14 = v12;
  if (v13)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v18 = v15;

  if (!v18)
  {
    v5 = BKLogEventDelivery();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 138543362;
    id v32 = (id)objc_opt_class();
    id v16 = v32;
    id v17 = "payload is wrong class (got %{public}@)";
    goto LABEL_31;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = v18;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = BKLogEventDelivery();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            id v32 = v24;
            id v25 = v24;
            _os_log_error_impl(&dword_18AA0B000, v23, OS_LOG_TYPE_ERROR, "payload contains wrong class (got %{public}@)", buf, 0xCu);
          }
          goto LABEL_3;
        }
      }
      uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = v5;
LABEL_4:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end