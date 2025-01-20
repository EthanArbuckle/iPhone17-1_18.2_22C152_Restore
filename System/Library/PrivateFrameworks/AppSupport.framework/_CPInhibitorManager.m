@interface _CPInhibitorManager
+ (id)sharedInstance;
- (BOOL)isProcessRunningBoardManaged;
- (NSArray)runningBoardAttributes;
- (NSLock)inhibitorMapLock;
- (NSMutableDictionary)inhibitorMap;
- (OS_os_log)os_log;
- (RBSTarget)runningBoardTarget;
- (_CPInhibitorManager)init;
- (id)popAssertionWithIdentifier:(id)a3;
- (id)startAnInhibitor;
- (void)pushAssertion:(id)a3 withIdentifier:(id)a4;
- (void)setInhibitorMap:(id)a3;
- (void)setInhibitorMapLock:(id)a3;
- (void)setIsProcessRunningBoardManaged:(BOOL)a3;
- (void)setOs_log:(id)a3;
- (void)setRunningBoardAttributes:(id)a3;
- (void)setRunningBoardTarget:(id)a3;
- (void)startAnInhibitor;
- (void)stopInhibitorWithIdentifier:(id)a3;
@end

@implementation _CPInhibitorManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance__sharedManager;
  return v2;
}

- (_CPInhibitorManager)init
{
  v36[2] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)_CPInhibitorManager;
  v2 = [(_CPInhibitorManager *)&v26 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.appsupport", "running-board-inhibitor");
    os_log = v2->_os_log;
    v2->_os_log = (OS_os_log *)v3;

    if (RunningBoardServicesLibraryCore())
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      inhibitorMap = v2->_inhibitorMap;
      v2->_inhibitorMap = v5;

      v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      inhibitorMapLock = v2->_inhibitorMapLock;
      v2->_inhibitorMapLock = v7;

      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2050000000;
      v9 = (void *)getRBSProcessHandleClass_softClass;
      uint64_t v35 = getRBSProcessHandleClass_softClass;
      if (!getRBSProcessHandleClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        v29 = __getRBSProcessHandleClass_block_invoke;
        v30 = &unk_1E5669188;
        v31 = &v32;
        __getRBSProcessHandleClass_block_invoke((uint64_t)buf);
        v9 = (void *)v33[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v32, 8);
      v11 = [v10 currentProcess];
      if ([v11 isManaged])
      {
        v2->_isProcessRunningBoardManaged = 1;
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2050000000;
        v12 = (void *)getRBSTargetClass_softClass;
        uint64_t v35 = getRBSTargetClass_softClass;
        if (!getRBSTargetClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          v29 = __getRBSTargetClass_block_invoke;
          v30 = &unk_1E5669188;
          v31 = &v32;
          __getRBSTargetClass_block_invoke((uint64_t)buf);
          v12 = (void *)v33[3];
        }
        id v13 = v12;
        _Block_object_dispose(&v32, 8);
        uint64_t v14 = [v13 currentProcess];
        runningBoardTarget = v2->_runningBoardTarget;
        v2->_runningBoardTarget = (RBSTarget *)v14;

        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2050000000;
        v16 = (void *)getRBSDomainAttributeClass_softClass;
        uint64_t v35 = getRBSDomainAttributeClass_softClass;
        if (!getRBSDomainAttributeClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          v29 = __getRBSDomainAttributeClass_block_invoke;
          v30 = &unk_1E5669188;
          v31 = &v32;
          __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
          v16 = (void *)v33[3];
        }
        id v17 = v16;
        _Block_object_dispose(&v32, 8);
        v18 = [v17 attributeWithDomain:@"com.apple.common" name:@"FinishTaskUninterruptable"];
        v36[0] = v18;
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2050000000;
        v19 = (void *)getRBSAcquisitionCompletionAttributeClass_softClass;
        uint64_t v35 = getRBSAcquisitionCompletionAttributeClass_softClass;
        if (!getRBSAcquisitionCompletionAttributeClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v28 = 3221225472;
          v29 = __getRBSAcquisitionCompletionAttributeClass_block_invoke;
          v30 = &unk_1E5669188;
          v31 = &v32;
          __getRBSAcquisitionCompletionAttributeClass_block_invoke((uint64_t)buf);
          v19 = (void *)v33[3];
        }
        id v20 = v19;
        _Block_object_dispose(&v32, 8);
        v21 = [v20 attributeWithCompletionPolicy:1];
        v36[1] = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
        runningBoardAttributes = v2->_runningBoardAttributes;
        v2->_runningBoardAttributes = (NSArray *)v22;
      }
    }
    else
    {
      v24 = v2->_os_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FB7F000, v24, OS_LOG_TYPE_DEFAULT, "RunningBoardServices softlink unavailable", buf, 2u);
      }
    }
  }
  return v2;
}

- (id)startAnInhibitor
{
  if ([(_CPInhibitorManager *)self isProcessRunningBoardManaged])
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    os_log_t v3 = (void *)getRBSAssertionClass_softClass;
    uint64_t v19 = getRBSAssertionClass_softClass;
    if (!getRBSAssertionClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getRBSAssertionClass_block_invoke;
      v15[3] = &unk_1E5669188;
      v15[4] = &v16;
      __getRBSAssertionClass_block_invoke((uint64_t)v15);
      os_log_t v3 = (void *)v17[3];
    }
    v4 = v3;
    _Block_object_dispose(&v16, 8);
    id v5 = [v4 alloc];
    v6 = [(_CPInhibitorManager *)self runningBoardTarget];
    v7 = [(_CPInhibitorManager *)self runningBoardAttributes];
    v8 = (void *)[v5 initWithExplanation:@"AppSupport sqlite connection lock" target:v6 attributes:v7];

    id v14 = 0;
    LODWORD(v7) = [v8 acquireWithError:&v14];
    id v9 = v14;
    if (v7)
    {
      id v10 = [MEMORY[0x1E4F29128] UUID];
      v11 = [v10 UUIDString];

      [(_CPInhibitorManager *)self pushAssertion:v8 withIdentifier:v11];
    }
    else
    {
      v12 = [(_CPInhibitorManager *)self os_log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_CPInhibitorManager startAnInhibitor]();
      }

      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)stopInhibitorWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(_CPInhibitorManager *)self popAssertionWithIdentifier:v4];
    v6 = v5;
    if (v5)
    {
      [v5 invalidate];
    }
    else
    {
      v7 = [(_CPInhibitorManager *)self os_log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[_CPInhibitorManager stopInhibitorWithIdentifier:]();
      }
    }
  }
}

- (void)pushAssertion:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_CPInhibitorManager *)self os_log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_CPInhibitorManager pushAssertion:withIdentifier:]();
  }

  id v9 = [(_CPInhibitorManager *)self inhibitorMapLock];
  [v9 lock];

  id v10 = [(_CPInhibitorManager *)self inhibitorMap];
  [v10 setObject:v7 forKey:v6];

  v11 = [(_CPInhibitorManager *)self inhibitorMapLock];
  [v11 unlock];
}

- (id)popAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_CPInhibitorManager *)self os_log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_CPInhibitorManager popAssertionWithIdentifier:]();
  }

  id v6 = [(_CPInhibitorManager *)self inhibitorMapLock];
  [v6 lock];

  id v7 = [(_CPInhibitorManager *)self inhibitorMap];
  v8 = [v7 objectForKey:v4];

  id v9 = [(_CPInhibitorManager *)self inhibitorMap];
  [v9 removeObjectForKey:v4];

  id v10 = [(_CPInhibitorManager *)self inhibitorMapLock];
  [v10 unlock];

  return v8;
}

- (OS_os_log)os_log
{
  return self->_os_log;
}

- (void)setOs_log:(id)a3
{
}

- (NSMutableDictionary)inhibitorMap
{
  return self->_inhibitorMap;
}

- (void)setInhibitorMap:(id)a3
{
}

- (NSLock)inhibitorMapLock
{
  return self->_inhibitorMapLock;
}

- (void)setInhibitorMapLock:(id)a3
{
}

- (BOOL)isProcessRunningBoardManaged
{
  return self->_isProcessRunningBoardManaged;
}

- (void)setIsProcessRunningBoardManaged:(BOOL)a3
{
  self->_isProcessRunningBoardManaged = a3;
}

- (RBSTarget)runningBoardTarget
{
  return self->_runningBoardTarget;
}

- (void)setRunningBoardTarget:(id)a3
{
}

- (NSArray)runningBoardAttributes
{
  return self->_runningBoardAttributes;
}

- (void)setRunningBoardAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningBoardAttributes, 0);
  objc_storeStrong((id *)&self->_runningBoardTarget, 0);
  objc_storeStrong((id *)&self->_inhibitorMapLock, 0);
  objc_storeStrong((id *)&self->_inhibitorMap, 0);
  objc_storeStrong((id *)&self->_os_log, 0);
}

- (void)startAnInhibitor
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18FB7F000, v0, OS_LOG_TYPE_ERROR, "Failed to take assertion, error: %{public}@", v1, 0xCu);
}

- (void)stopInhibitorWithIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18FB7F000, v0, OS_LOG_TYPE_ERROR, "Failed to pop and invalidate assertion %@", v1, 0xCu);
}

- (void)pushAssertion:withIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18FB7F000, v0, OS_LOG_TYPE_DEBUG, "Push assertion %@", v1, 0xCu);
}

- (void)popAssertionWithIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18FB7F000, v0, OS_LOG_TYPE_DEBUG, "Pop assertion %@", v1, 0xCu);
}

@end