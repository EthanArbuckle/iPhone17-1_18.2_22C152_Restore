@interface SGChatLengthEstimator
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (NSString)path;
- (SGChatLengthEstimator)initWithPath:(id)a3;
- (id)initInMemory;
- (unint64_t)count;
- (unint64_t)estimateMessagesInChat:(id)a3;
- (void)dealloc;
- (void)recordMessageInChat:(id)a3;
@end

@implementation SGChatLengthEstimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_backingData, 0);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)estimateMessagesInChat:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGChatLengthEstimator.m", 147, @"Invalid parameter not satisfying: %@", @"domainIdentifier" object file lineNumber description];

    uint64_t v15 = 0;
    uint64_t v16 = 0;
    id v5 = 0;
  }
  SGMurmurhashString(v5, 3203338804, &v15);
  pthread_mutex_lock(&sharedInstanceLock);
  uint64_t v7 = 0;
  unsigned __int8 v8 = -1;
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = *((_DWORD *)&v15 + v7) & 0x3FFF;
    if (v11 <= 0x3FFD)
    {
      unsigned int v12 = self->_sketch[v11];
      if (v8 >= v12) {
        unsigned __int8 v8 = v12;
      }
    }
    char v9 = 0;
    uint64_t v7 = 1;
  }
  while ((v10 & 1) != 0);
  pthread_mutex_unlock(&sharedInstanceLock);

  return v8;
}

- (void)recordMessageInChat:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGChatLengthEstimator.m", 128, @"Invalid parameter not satisfying: %@", @"domainIdentifier" object file lineNumber description];

    uint64_t v19 = 0;
    uint64_t v20 = 0;
    id v5 = 0;
  }
  SGMurmurhashString(v5, 3203338804, &v19);
  pthread_mutex_lock(&sharedInstanceLock);
  countPtr = self->_countPtr;
  unsigned __int16 v8 = *countPtr + 1;
  unsigned __int16 *countPtr = v8;
  if (v8 >= 0x1389u)
  {
    char v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "Chat length estimator reached max size. Clearing.", buf, 2u);
    }

    bzero(self->_countPtr, 0x4000uLL);
  }
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v13 = *((_DWORD *)&v19 + v10) & 0x3FFF;
    if (v13 <= 0x3FFD)
    {
      sketch = self->_sketch;
      __int16 v15 = sketch[v13];
      if (((v15 + 1) & 0x100) != 0) {
        char v16 = -1;
      }
      else {
        char v16 = v15 + 1;
      }
      sketch[v13] = v16;
    }
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  pthread_mutex_unlock(&sharedInstanceLock);
}

- (unint64_t)count
{
  pthread_mutex_lock(&sharedInstanceLock);
  unint64_t v3 = *self->_countPtr;
  pthread_mutex_unlock(&sharedInstanceLock);
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  if ((self->_fd & 0x80000000) == 0)
  {
    msync(self->_countPtr, 0x4000uLL, 1);
    munmap(self->_countPtr, 0x4000uLL);
    close(self->_fd);
    self->_fd = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SGChatLengthEstimator;
  [(SGChatLengthEstimator *)&v3 dealloc];
}

- (id)initInMemory
{
  v8.receiver = self;
  v8.super_class = (Class)SGChatLengthEstimator;
  v2 = [(SGChatLengthEstimator *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_fd = -1;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0x4000];
    backingData = v3->_backingData;
    v3->_backingData = (NSMutableData *)v4;

    uint64_t v6 = [(NSMutableData *)v3->_backingData mutableBytes];
    v3->_countPtr = (unsigned __int16 *)v6;
    v3->_sketch = (char *)(v6 + 2);
    pthread_mutex_init(&v3->_lock, 0);
  }
  return v3;
}

- (SGChatLengthEstimator)initWithPath:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGChatLengthEstimator;
  id v5 = [(SGChatLengthEstimator *)&v21 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 copy];
  path = v5->_path;
  v5->_path = (NSString *)v6;

  id v8 = v4;
  int v9 = open_dprotected_np((const char *)[v8 UTF8String], 514, 3, 0, 384);
  v5->_fd = v9;
  if (v9 < 0)
  {
    char v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = __error();
      char v16 = strerror(*v15);
      int v17 = *__error();
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2080;
      v25 = v16;
      __int16 v26 = 1024;
      int v27 = v17;
      _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "Could not open chat length estimator at %@: %s (errno %i)", buf, 0x1Cu);
    }

    char v11 = 0;
  }
  else
  {
    ftruncate(v9, 0x4000);
    uint64_t v10 = (char *)mmap(0, 0x4000uLL, 3, 1, v5->_fd, 0);
    v5->_countPtr = (unsigned __int16 *)v10;
    if (v10 != (char *)-1)
    {
      v5->_sketch = v10 + 2;
      pthread_mutex_init(&v5->_lock, 0);
LABEL_5:
      char v11 = v5;
      goto LABEL_12;
    }
    uint64_t v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = __error();
      uint64_t v19 = strerror(*v18);
      int v20 = *__error();
      *(_DWORD *)buf = 138412802;
      id v23 = v8;
      __int16 v24 = 2080;
      v25 = v19;
      __int16 v26 = 1024;
      int v27 = v20;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "Could not mmap chat length estimator file at %@: %s (errno %i)", buf, 0x1Cu);
    }

    close(v5->_fd);
    char v11 = 0;
    v5->_fd = -1;
  }
LABEL_12:

  return v11;
}

+ (void)setSharedInstance:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&sharedInstanceLock);
  id v4 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v3;

  pthread_mutex_unlock(&sharedInstanceLock);
}

+ (id)sharedInstance
{
  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (SGChatLengthEstimator *)(id)sharedInstance;
  if (!v2)
  {
    id v3 = [SGChatLengthEstimator alloc];
    id v4 = +[SGPaths suggestionsDirectoryFile:@"chatLengthEstimator.cmsketch"];
    id v5 = [(SGChatLengthEstimator *)v3 initWithPath:v4];
    uint64_t v6 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v5;

    v2 = v5;
  }
  pthread_mutex_unlock(&sharedInstanceLock);
  return v2;
}

@end