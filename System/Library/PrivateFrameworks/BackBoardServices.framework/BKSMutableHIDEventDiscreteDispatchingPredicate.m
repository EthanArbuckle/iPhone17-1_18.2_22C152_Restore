@interface BKSMutableHIDEventDiscreteDispatchingPredicate
+ (id)defaultFocusPredicate;
+ (id)defaultSystemPredicate;
+ (id)new;
- (BKSMutableHIDEventDiscreteDispatchingPredicate)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDescriptors:(id)a3;
- (void)setDisplays:(id)a3;
- (void)setSenderDescriptors:(id)a3;
@end

@implementation BKSMutableHIDEventDiscreteDispatchingPredicate

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[BKSHIDEventDiscreteDispatchingPredicate allocWithZone:a3];
  senderDescriptors = self->super._senderDescriptors;
  descriptors = self->super._descriptors;
  return [(BKSHIDEventDiscreteDispatchingPredicate *)v4 _initWithSourceDescriptors:senderDescriptors descriptors:descriptors];
}

- (void)setDescriptors:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (!v27)
  {
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"descriptors", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      v29 = v11;
      __int16 v30 = 2114;
      v31 = v13;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2114;
      v35 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
      __int16 v36 = 1024;
      int v37 = 255;
      __int16 v38 = 2114;
      v39 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA588A0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = NSString;
    v15 = (objc_class *)[v27 classForCoder];
    if (!v15) {
      v15 = (objc_class *)objc_opt_class();
    }
    v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"descriptors", v16, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      v29 = v20;
      __int16 v30 = 2114;
      v31 = v22;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2114;
      v35 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
      __int16 v36 = 1024;
      int v37 = 255;
      __int16 v38 = 2114;
      v39 = v19;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA589DCLL);
  }

  if (objc_msgSend(v27, "bs_containsObjectPassingTest:", &__block_literal_global_163))
  {
    v23 = [NSString stringWithFormat:@"descriptors contains non-BKSHIDEventDescriptor elements : %@", v27];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      v29 = v24;
      __int16 v30 = 2114;
      v31 = v26;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2114;
      v35 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
      __int16 v36 = 1024;
      int v37 = 259;
      __int16 v38 = 2114;
      v39 = v23;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA58AD0);
  }
  v5 = (NSSet *)[v27 copy];
  descriptors = self->super._descriptors;
  self->super._descriptors = v5;
}

BOOL __65__BKSMutableHIDEventDiscreteDispatchingPredicate_setDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)setSenderDescriptors:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = NSString;
      v21 = (objc_class *)[v5 classForCoder];
      if (!v21) {
        v21 = (objc_class *)objc_opt_class();
      }
      v22 = NSStringFromClass(v21);
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v20 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"senderDescriptors", v22, v24];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v26 = NSStringFromSelector(a2);
        id v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138544642;
        v35 = v26;
        __int16 v36 = 2114;
        int v37 = v28;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
        __int16 v42 = 1024;
        int v43 = 238;
        __int16 v44 = 2114;
        v45 = v25;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA58EE8);
    }

    v6 = [MEMORY[0x1E4F1CA80] set];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = [NSString stringWithFormat:@"set contains non-BKSHIDEventSenderDescriptor elements : %@", v7];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v17 = NSStringFromSelector(a2);
              v18 = (objc_class *)objc_opt_class();
              v19 = NSStringFromClass(v18);
              *(_DWORD *)buf = 138544642;
              v35 = v17;
              __int16 v36 = 2114;
              int v37 = v19;
              __int16 v38 = 2048;
              v39 = self;
              __int16 v40 = 2114;
              v41 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
              __int16 v42 = 1024;
              int v43 = 242;
              __int16 v44 = 2114;
              v45 = v16;
              _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v16 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18AA58DACLL);
          }
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
    }

    v13 = (NSSet *)[v6 copy];
    senderDescriptors = self->super._senderDescriptors;
    self->super._senderDescriptors = v13;
  }
  else
  {
    v15 = self->super._senderDescriptors;
    self->super._senderDescriptors = 0;
  }
}

- (void)setDisplays:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = NSString;
      id v7 = (objc_class *)[v19 classForCoder];
      if (!v7) {
        id v7 = (objc_class *)objc_opt_class();
      }
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      v11 = [v6 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"displays", v8, v10];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = NSStringFromSelector(a2);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        v21 = v12;
        __int16 v22 = 2114;
        v23 = v14;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2114;
        id v27 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
        __int16 v28 = 1024;
        int v29 = 222;
        __int16 v30 = 2114;
        long long v31 = v11;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA59110);
    }

    if (objc_msgSend(v19, "bs_containsObjectPassingTest:", &__block_literal_global_147_8263))
    {
      v15 = [NSString stringWithFormat:@"displays contains non-BKSHIDEventDisplay elements : %@", v19];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v16 = NSStringFromSelector(a2);
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138544642;
        v21 = v16;
        __int16 v22 = 2114;
        v23 = v18;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2114;
        id v27 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
        __int16 v28 = 1024;
        int v29 = 226;
        __int16 v30 = 2114;
        long long v31 = v15;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA59204);
    }
  }
  id v5 = objc_msgSend(v19, "bs_map:", &__block_literal_global_154);
  [(BKSMutableHIDEventDiscreteDispatchingPredicate *)self setSenderDescriptors:v5];
}

id __62__BKSMutableHIDEventDiscreteDispatchingPredicate_setDisplays___block_invoke_151(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  [(BKSMutableHIDEventSenderDescriptor *)v3 setAssociatedDisplay:v2];

  v4 = (void *)[(BKSMutableHIDEventSenderDescriptor *)v3 copy];
  return v4;
}

BOOL __62__BKSMutableHIDEventDiscreteDispatchingPredicate_setDisplays___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BKSMutableHIDEventDiscreteDispatchingPredicate)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    uint64_t v9 = [NSString stringWithFormat:@"BKSMutableHIDEventDiscreteDispatchingPredicate cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138544642;
      v14 = v10;
      __int16 v15 = 2114;
      v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
      __int16 v21 = 1024;
      int v22 = 216;
      __int16 v23 = 2114;
      __int16 v24 = v9;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA59468);
  }
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  v6 = [MEMORY[0x1E4F1CAD0] set];
  id v7 = [(BKSHIDEventDiscreteDispatchingPredicate *)self _initWithSourceDescriptors:v5 descriptors:v6];

  return v7;
}

+ (id)defaultFocusPredicate
{
  if (defaultFocusPredicate_onceToken != -1) {
    dispatch_once(&defaultFocusPredicate_onceToken, &__block_literal_global_173);
  }
  id v2 = (void *)[(id)defaultFocusPredicate___defaultFocusPredicate mutableCopy];
  return v2;
}

void __71__BKSMutableHIDEventDiscreteDispatchingPredicate_defaultFocusPredicate__block_invoke()
{
  id v22 = [MEMORY[0x1E4F1CA80] set];
  v0 = +[BKSHIDEventDescriptor descriptorWithEventType:11];
  [v22 addObject:v0];

  v1 = +[BKSHIDEventDescriptor descriptorWithEventType:6];
  [v22 addObject:v1];

  id v2 = +[BKSHIDEventDescriptor descriptorWithEventType:17];
  [v22 addObject:v2];

  v3 = +[BKSHIDEventDescriptor descriptorWithEventType:35];
  [v22 addObject:v3];

  uint64_t v4 = +[BKSHIDEventDescriptor descriptorWithEventType:30];
  [v22 addObject:v4];

  id v5 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:7 usage:0];
  [v22 addObject:v5];

  v6 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:548];
  [v22 addObject:v6];

  id v7 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:516];
  [v22 addObject:v7];

  uint64_t v8 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:521];
  [v22 addObject:v8];

  uint64_t v9 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:178];
  [v22 addObject:v9];

  uint64_t v10 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:184];
  [v22 addObject:v10];

  v11 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:430];
  [v22 addObject:v11];

  uint64_t v12 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:669];
  [v22 addObject:v12];

  int v13 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:255 usage:3];
  [v22 addObject:v13];

  v14 = +[BKSHIDEventUsagePairDescriptor descriptorForHIDEventType:1 page:65280 usage:59];
  [v22 addObject:v14];

  __int16 v15 = +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:3];
  [v22 addObject:v15];

  v16 = +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:0];
  [v22 addObject:v16];

  __int16 v17 = +[BKSHIDEventDescriptor descriptorWithEventType:39];
  [v22 addObject:v17];

  v18 = [BKSHIDEventDiscreteDispatchingPredicate alloc];
  __int16 v19 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v20 = [(BKSHIDEventDiscreteDispatchingPredicate *)v18 _initWithSourceDescriptors:v19 descriptors:v22];
  __int16 v21 = (void *)defaultFocusPredicate___defaultFocusPredicate;
  defaultFocusPredicate___defaultFocusPredicate = v20;
}

+ (id)defaultSystemPredicate
{
  if (defaultSystemPredicate_onceToken != -1) {
    dispatch_once(&defaultSystemPredicate_onceToken, &__block_literal_global_169);
  }
  id v2 = (void *)[(id)defaultSystemPredicate___defaultSystemPredicate mutableCopy];
  return v2;
}

void __72__BKSMutableHIDEventDiscreteDispatchingPredicate_defaultSystemPredicate__block_invoke()
{
  id v76 = [MEMORY[0x1E4F1CA80] set];
  v0 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:11 usage:45];
  [v76 addObject:v0];

  v1 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:11 usage:46];
  [v76 addObject:v1];

  id v2 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:11 usage:35];
  [v76 addObject:v2];

  v3 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:11 usage:33];
  [v76 addObject:v3];

  uint64_t v4 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65287 usage:1];
  [v76 addObject:v4];

  id v5 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65281 usage:33];
  [v76 addObject:v5];

  v6 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65281 usage:32];
  [v76 addObject:v6];

  id v7 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65281 usage:16];
  [v76 addObject:v7];

  uint64_t v8 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65281 usage:64];
  [v76 addObject:v8];

  uint64_t v9 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65281 usage:65];
  [v76 addObject:v9];

  uint64_t v10 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:133 usage:75];
  [v76 addObject:v10];

  v11 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:134];
  [v76 addObject:v11];

  uint64_t v12 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:132];
  [v76 addObject:v12];

  int v13 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:133];
  [v76 addObject:v13];

  v14 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:137];
  [v76 addObject:v14];

  __int16 v15 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:141];
  [v76 addObject:v15];

  v16 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:136];
  [v76 addObject:v16];

  __int16 v17 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:139];
  [v76 addObject:v17];

  v18 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:138];
  [v76 addObject:v18];

  __int16 v19 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:140];
  [v76 addObject:v19];

  uint64_t v20 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:1 usage:155];
  [v76 addObject:v20];

  __int16 v21 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:610];
  [v76 addObject:v21];

  id v22 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:604];
  [v76 addObject:v22];

  __int16 v23 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:547];
  [v76 addObject:v23];

  __int16 v24 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:603];
  [v76 addObject:v24];

  uint64_t v25 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:545];
  [v76 addObject:v25];

  __int16 v26 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:433];
  [v76 addObject:v26];

  id v27 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:414];
  [v76 addObject:v27];

  __int16 v28 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:134];
  [v76 addObject:v28];

  int v29 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:96];
  [v76 addObject:v29];

  __int16 v30 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:111];
  [v76 addObject:v30];

  long long v31 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:112];
  [v76 addObject:v31];

  uint64_t v32 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:121];
  [v76 addObject:v32];

  v33 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:122];
  [v76 addObject:v33];

  __int16 v34 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:179];
  [v76 addObject:v34];

  v35 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:64];
  [v76 addObject:v35];

  __int16 v36 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:67];
  [v76 addObject:v36];

  int v37 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:68];
  [v76 addObject:v37];

  __int16 v38 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:65];
  [v76 addObject:v38];

  v39 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:69];
  [v76 addObject:v39];

  __int16 v40 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:66];
  [v76 addObject:v40];

  v41 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:4];
  [v76 addObject:v41];

  __int16 v42 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:226];
  [v76 addObject:v42];

  int v43 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:177];
  [v76 addObject:v43];

  __int16 v44 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:176];
  [v76 addObject:v44];

  v45 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:205];
  [v76 addObject:v45];

  uint64_t v46 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:48];
  [v76 addObject:v46];

  v47 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:185];
  [v76 addObject:v47];

  v48 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:188];
  [v76 addObject:v48];

  v49 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:180];
  [v76 addObject:v49];

  v50 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:181];
  [v76 addObject:v50];

  v51 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:182];
  [v76 addObject:v51];

  v52 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:199];
  [v76 addObject:v52];

  v53 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:198];
  [v76 addObject:v53];

  v54 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:128];
  [v76 addObject:v54];

  v55 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:101];
  [v76 addObject:v55];

  v56 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:183];
  [v76 addObject:v56];

  v57 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:203];
  [v76 addObject:v57];

  v58 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:202];
  [v76 addObject:v58];

  v59 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:190];
  [v76 addObject:v59];

  v60 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:207];
  [v76 addObject:v60];

  v61 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:234];
  [v76 addObject:v61];

  v62 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:12 usage:233];
  [v76 addObject:v62];

  v63 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65289 usage:1];
  [v76 addObject:v63];

  v64 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65289 usage:2];
  [v76 addObject:v64];

  v65 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65289 usage:3];
  [v76 addObject:v65];

  v66 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65289 usage:4];
  [v76 addObject:v66];

  v67 = +[BKSHIDEventKeyboardDescriptor descriptorWithPage:65289 usage:32];
  [v76 addObject:v67];

  v68 = +[BKSHIDEventDescriptor descriptorWithEventType:32];
  [v76 addObject:v68];

  v69 = +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:2];
  [v76 addObject:v69];

  v70 = +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:1];
  [v76 addObject:v70];

  v71 = +[BKSHIDEventDescriptor descriptorWithEventType:14];
  [v76 addObject:v71];

  v72 = [BKSHIDEventDiscreteDispatchingPredicate alloc];
  v73 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v74 = [(BKSHIDEventDiscreteDispatchingPredicate *)v72 _initWithSourceDescriptors:v73 descriptors:v76];
  v75 = (void *)defaultSystemPredicate___defaultSystemPredicate;
  defaultSystemPredicate___defaultSystemPredicate = v74;
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventDiscreteDispatchingPredicate);
}

@end