@interface BKEventGraphDescriptionAccumulator
- (BKEventGraphDescriptionAccumulator)init;
- (_BKGraphStructureNode)_nodeWithSupernode:(void *)a1 format:(const __CFString *)a2 args:(va_list)a3;
- (id)pushSection;
- (void)_recursiveAppendNode:(void *)a3 toDescription:;
- (void)appendNode:(uint64_t)a3;
- (void)appendSubnode:(uint64_t)a3;
- (void)popSection:(uint64_t)a1;
@end

@implementation BKEventGraphDescriptionAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_current, 0);

  objc_storeStrong((id *)&self->_topLevel, 0);
}

- (BKEventGraphDescriptionAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKEventGraphDescriptionAccumulator;
  v2 = [(BKEventGraphDescriptionAccumulator *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_BKGraphStructureNode);
    topLevel = v2->_topLevel;
    v2->_topLevel = v3;

    objc_storeStrong((id *)&v2->_current, v2->_topLevel);
  }
  return v2;
}

- (_BKGraphStructureNode)_nodeWithSupernode:(void *)a1 format:(const __CFString *)a2 args:(va_list)a3
{
  objc_super v6 = a1;
  v7 = (__CFString *)CFStringCreateWithFormatAndArguments(0, 0, a2, a3);
  v8 = objc_alloc_init(_BKGraphStructureNode);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_supernode, a1);
  }
  if (v6) {
    v10 = (void *)v6[2];
  }
  else {
    v10 = 0;
  }
  [v10 addObject:v9];
  if (v9) {
    objc_setProperty_nonatomic_copy(v9, v11, v7, 24);
  }
  CFRelease(v7);

  return v9;
}

- (void)appendNode:(uint64_t)a3
{
  if (a1)
  {
    uint64_t v11 = *(void *)(a1 + 16);
    if (!v11 || (id v12 = *(id *)(v11 + 8)) == 0) {
      id v12 = *(id *)(a1 + 8);
    }
    uint64_t v13 = -[BKEventGraphDescriptionAccumulator _nodeWithSupernode:format:args:](v12, a2, &a9);
    v14 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v13;
  }
}

- (void)appendSubnode:(uint64_t)a3
{
  if (a1)
  {
    id v11 = *(id *)(a1 + 16);
    uint64_t v12 = -[BKEventGraphDescriptionAccumulator _nodeWithSupernode:format:args:](v11, a2, &a9);
    uint64_t v13 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v12;
  }
}

- (id)pushSection
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)popSection:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    id v23 = v4;
    id v5 = v4;
    if (!v5)
    {
      v7 = NSString;
      objc_opt_class();
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"node", v9];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromSelector(sel_popSection_);
        uint64_t v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138544642;
        v25 = v11;
        __int16 v26 = 2114;
        v27 = v13;
        __int16 v28 = 2048;
        uint64_t v29 = a1;
        __int16 v30 = 2114;
        v31 = @"BKEventGraphTranscript.m";
        __int16 v32 = 1024;
        int v33 = 97;
        __int16 v34 = 2114;
        v35 = v10;
        _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CFDFD8BCLL);
    }
    objc_super v6 = v5;
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = NSString;
      v15 = (objc_class *)[v6 classForCoder];
      if (!v15) {
        v15 = (objc_class *)objc_opt_class();
      }
      v16 = NSStringFromClass(v15);
      objc_opt_class();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"node", v16, v18];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v20 = NSStringFromSelector(sel_popSection_);
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138544642;
        v25 = v20;
        __int16 v26 = 2114;
        v27 = v22;
        __int16 v28 = 2048;
        uint64_t v29 = a1;
        __int16 v30 = 2114;
        v31 = @"BKEventGraphTranscript.m";
        __int16 v32 = 1024;
        int v33 = 97;
        __int16 v34 = 2114;
        v35 = v19;
        _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CFDFD9FCLL);
    }

    objc_storeStrong((id *)(a1 + 16), a2);
    id v4 = v23;
  }
}

- (void)_recursiveAppendNode:(void *)a3 toDescription:
{
  id v5 = a2;
  objc_super v6 = a3;
  if (a1)
  {
    if (v5)
    {
      id v7 = v5[3];
      v14 = v7;
      if (v7) {
        -[BKGraphDescription appendNode:](v6, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
      }
      id v15 = v5[2];
    }
    else
    {
      v14 = 0;
      id v15 = 0;
    }
    id v16 = v15;
    uint64_t v17 = [v16 count];
    if (v17 >= 1)
    {
      uint64_t v18 = v17;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __73__BKEventGraphDescriptionAccumulator__recursiveAppendNode_toDescription___block_invoke;
      v19[3] = &unk_1E6871848;
      id v20 = v16;
      uint64_t v21 = a1;
      v22 = v6;
      -[BKGraphDescription appendSubnodesWithCount:block:]((uint64_t)v22, v18, v19);
    }
  }
}

void __73__BKEventGraphDescriptionAccumulator__recursiveAppendNode_toDescription___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        -[BKEventGraphDescriptionAccumulator _recursiveAppendNode:toDescription:](*(void *)(a1 + 40), *(void *)(*((void *)&v7 + 1) + 8 * v6++), *(void *)(a1 + 48));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end