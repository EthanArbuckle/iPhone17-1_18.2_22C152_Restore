@interface CNProcessSharedLock
+ (CNProcessSharedLock)sharedLockWithLockFilePath:(id)a3;
+ (id)os_log;
+ (id)recursiveSharedLockWithLockFilePath:(id)a3;
+ (id)semaphoreSharedLockWithLockFilePath:(id)a3;
- (BOOL)ensureFileDescriptorIsInvalid:(id)a3;
- (BOOL)ensureFileIsLocal:(id)a3;
- (BOOL)isValidFileDescriptor;
- (BOOL)open:(id *)a3;
- (BOOL)openLockFile:(id)a3;
- (CNInhibitor)runningBoardInhibitor;
- (CNProcessSharedLock)init;
- (CNProcessSharedLock)initWithLockFilePath:(id)a3 localLock:(id)a4;
- (CNProcessSharedLock)initWithLockFilePath:(id)a3 localLock:(id)a4 fileServices:(id)a5;
- (NSString)lockFilePath;
- (NSString)name;
- (id)description;
- (id)errorUserInfo;
- (id)errorUserInfoWithDescription:(id)a3;
- (id)exceptionWithName:(id)a3 reason:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)lock;
- (void)lockRetryOnEDEADLK;
- (void)setName:(id)a3;
- (void)setRunningBoardInhibitor:(id)a3;
- (void)unlock;
@end

@implementation CNProcessSharedLock

+ (id)os_log
{
  if (os_log_cn_once_token_1_15 != -1) {
    dispatch_once(&os_log_cn_once_token_1_15, &__block_literal_global_74);
  }
  v2 = (void *)os_log_cn_once_object_1_15;

  return v2;
}

uint64_t __29__CNProcessSharedLock_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.locking", "process-shared-lock");
  uint64_t v1 = os_log_cn_once_object_1_15;
  os_log_cn_once_object_1_15 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (CNProcessSharedLock)sharedLockWithLockFilePath:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28E08];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)[objc_alloc((Class)a1) initWithLockFilePath:v5 localLock:v6];

  return (CNProcessSharedLock *)v7;
}

+ (id)recursiveSharedLockWithLockFilePath:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28FD0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)[objc_alloc((Class)a1) initWithLockFilePath:v5 localLock:v6];

  return v7;
}

+ (id)semaphoreSharedLockWithLockFilePath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(CNBinarySemaphoreLock);
  id v6 = (void *)[objc_alloc((Class)a1) initWithLockFilePath:v4 localLock:v5];

  return v6;
}

- (CNProcessSharedLock)init
{
  CNInitializerUnavailableException(self, a2, sel_initWithLockFilePath_localLock_);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CNProcessSharedLock)initWithLockFilePath:(id)a3 localLock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CNFileServices sharedInstance];
  v9 = [(CNProcessSharedLock *)self initWithLockFilePath:v7 localLock:v6 fileServices:v8];

  return v9;
}

- (CNProcessSharedLock)initWithLockFilePath:(id)a3 localLock:(id)a4 fileServices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNProcessSharedLock;
  v11 = [(CNProcessSharedLock *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    lockFilePath = v11->_lockFilePath;
    v11->_lockFilePath = (NSString *)v12;

    objc_storeStrong((id *)&v11->_localLock, a4);
    v11->_fileDescriptor = -1;
    objc_storeStrong((id *)&v11->_fileServices, a5);
    uint64_t v14 = +[CNInhibitor runningboardInhibitorWithExplanation:@"Contacts shared filesystem lock"];
    runningBoardInhibitor = v11->_runningBoardInhibitor;
    v11->_runningBoardInhibitor = (CNInhibitor *)v14;

    v16 = v11;
  }

  return v11;
}

- (void)dealloc
{
  [(CNProcessSharedLock *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CNProcessSharedLock;
  [(CNProcessSharedLock *)&v3 dealloc];
}

- (BOOL)open:(id *)a3
{
  id v4 = CNMakeErrorHelper((uint64_t)a3);
  BOOL v5 = [(CNProcessSharedLock *)self ensureFileDescriptorIsInvalid:v4]
    && [(CNProcessSharedLock *)self openLockFile:v4]
    && [(CNProcessSharedLock *)self ensureFileIsLocal:v4];

  return v5;
}

- (BOOL)ensureFileDescriptorIsInvalid:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = [(CNProcessSharedLock *)self isValidFileDescriptor];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__CNProcessSharedLock_ensureFileDescriptorIsInvalid___block_invoke;
    v7[3] = &unk_1E56A2078;
    v7[4] = self;
    v4[2](v4, v7);
  }

  return !v5;
}

id __53__CNProcessSharedLock_ensureFileDescriptorIsInvalid___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *MEMORY[0x1E4F281F8];
  objc_super v3 = [*(id *)(a1 + 32) errorUserInfoWithDescription:@"File lock already opened"];
  id v4 = [v1 errorWithDomain:v2 code:255 userInfo:v3];

  return v4;
}

- (BOOL)openLockFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  self->_int fileDescriptor = [(CNFileServices *)self->_fileServices open:[(NSString *)self->_lockFilePath fileSystemRepresentation] :514 :384];
  BOOL v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    lockFilePath = self->_lockFilePath;
    int fileDescriptor = self->_fileDescriptor;
    *(_DWORD *)buf = 134218498;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    uint64_t v14 = lockFilePath;
    __int16 v15 = 1024;
    int v16 = fileDescriptor;
    _os_log_debug_impl(&dword_19091D000, v5, OS_LOG_TYPE_DEBUG, "%p: lockFilePath: %@, file descriptor: %d", buf, 0x1Cu);
  }

  int v6 = self->_fileDescriptor;
  if (v6 < 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__CNProcessSharedLock_openLockFile___block_invoke;
    v10[3] = &unk_1E56A2078;
    v10[4] = self;
    v4[2](v4, v10);
    self->_int fileDescriptor = -1;
  }

  return v6 >= 0;
}

id __36__CNProcessSharedLock_openLockFile___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) errnoValue];
  objc_super v3 = [*(id *)(a1 + 32) errorUserInfo];
  id v4 = +[CNFoundationError errorWithErrno:v2 userInfo:v3];

  return v4;
}

- (BOOL)ensureFileIsLocal:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if ([(CNFileServices *)self->_fileServices fstatfs:self->_fileDescriptor :v11] < 0)
  {
    BOOL v5 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    int v6 = __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke;
  }
  else
  {
    if ((BYTE1(v12) & 0x10) != 0)
    {
      BOOL v7 = 1;
      goto LABEL_7;
    }
    BOOL v5 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    int v6 = __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke_2;
  }
  v5[2] = v6;
  v5[3] = &unk_1E56A2078;
  v5[4] = self;
  v4[2](v4);
  close(self->_fileDescriptor);
  BOOL v7 = 0;
  self->_int fileDescriptor = -1;
LABEL_7:

  return v7;
}

id __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) errnoValue];
  objc_super v3 = [*(id *)(a1 + 32) errorUserInfo];
  id v4 = +[CNFoundationError errorWithErrno:v2 userInfo:v3];

  return v4;
}

id __41__CNProcessSharedLock_ensureFileIsLocal___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *MEMORY[0x1E4F281F8];
  objc_super v3 = [*(id *)(a1 + 32) errorUserInfoWithDescription:@"Not a local file"];
  id v4 = [v1 errorWithDomain:v2 code:258 userInfo:v3];

  return v4;
}

- (void)invalidate
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_19091D000, v1, OS_LOG_TYPE_DEBUG, "%p: closing fd: %d", v2, 0x12u);
}

- (void)lock
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_19091D000, v0, v1, "%p: Locked locks", v2, v3, v4, v5, v6);
}

- (void)unlock
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_19091D000, v0, v1, "%p: Trying to unlock file lock", v2, v3, v4, v5, v6);
}

- (void)lockRetryOnEDEADLK
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_2_4(&dword_19091D000, a2, a3, "Couldn't lock process shared lock %p: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (BOOL)isValidFileDescriptor
{
  return self->_fileDescriptor >= 0;
}

- (id)exceptionWithName:(id)a3 reason:(id)a4
{
  fileServices = self->_fileServices;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(CNFileServices *)fileServices errnoValue];
  id v10 = [(CNProcessSharedLock *)self errorUserInfo];
  v11 = +[CNFoundationError errorWithErrno:v9 userInfo:v10];

  long long v12 = [NSString stringWithFormat:@"%@: %@", v7, self];

  long long v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x1E4F28A50], 0);
  long long v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:v8 reason:v12 userInfo:v13];

  return v14;
}

- (id)errorUserInfo
{
  return [(CNProcessSharedLock *)self errorUserInfoWithDescription:0];
}

- (id)errorUserInfoWithDescription:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint8_t v6 = [v4 dictionary];
  [v6 setObject:self->_name forKeyedSubscript:@"CNLockName"];
  id v7 = [NSNumber numberWithInt:self->_fileDescriptor];
  [v6 setObject:v7 forKeyedSubscript:@"CNFileDescriptor"];

  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  [v6 setObject:self->_lockFilePath forKeyedSubscript:*MEMORY[0x1E4F28328]];

  return v6;
}

- (id)description
{
  uint64_t v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"name", self->_name, @"lockFilePath", self->_lockFilePath, @"localLock", self->_localLock, 0);
  id v5 = (id)[v3 appendName:@"fileDescriptor" intValue:self->_fileDescriptor];
  uint8_t v6 = [v3 build];

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)lockFilePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CNInhibitor)runningBoardInhibitor
{
  return (CNInhibitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRunningBoardInhibitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningBoardInhibitor, 0);
  objc_storeStrong((id *)&self->_fileServices, 0);
  objc_storeStrong((id *)&self->_localLock, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_lockFilePath, 0);
}

@end