@interface GKSessionGlobals
- (BOOL)hasActivePID:(unsigned int)a3;
- (GKSessionGlobals)init;
- (void)lock;
- (void)registerPID:(unsigned int)a3;
- (void)unlock;
- (void)unregisterPID:(unsigned int)a3;
@end

@implementation GKSessionGlobals

- (GKSessionGlobals)init
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)GKSessionGlobals;
  v2 = [(GKSessionGlobals *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_activePIDList = 0;
    v2->_activePIDListSize = 0;
    v2->_activePIDListCount = 0;
    v6.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(void *)v6.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v6);
    pthread_mutexattr_settype(&v6, 2);
    pthread_mutex_init(&v3->_lock, &v6);
    pthread_mutexattr_destroy(&v6);
  }
  return v3;
}

- (void)registerPID:(unsigned int)a3
{
  unint64_t activePIDListCount = self->_activePIDListCount;
  if (activePIDListCount == self->_activePIDListSize)
  {
    unint64_t v6 = activePIDListCount + 5;
    activePIDList = (unsigned int *)malloc_type_realloc(self->_activePIDList, 4 * (activePIDListCount + 5), 0x100004052888210uLL);
    if (!activePIDList) {
      return;
    }
    self->_activePIDList = activePIDList;
    self->_activePIDListSize = v6;
    unint64_t activePIDListCount = self->_activePIDListCount;
  }
  else
  {
    activePIDList = self->_activePIDList;
  }
  self->_unint64_t activePIDListCount = activePIDListCount + 1;
  activePIDList[activePIDListCount] = a3;
}

- (void)unregisterPID:(unsigned int)a3
{
  unint64_t activePIDListCount = self->_activePIDListCount;
  if (!activePIDListCount) {
    goto LABEL_7;
  }
  activePIDList = self->_activePIDList;
  unint64_t v6 = self->_activePIDListCount;
  for (i = activePIDList; *i != a3; ++i)
  {
    if (!--v6) {
      return;
    }
  }
  unint64_t v8 = activePIDListCount - 1;
  self->_unint64_t activePIDListCount = v8;
  unsigned int *i = activePIDList[v8];
  if (!v8)
  {
LABEL_7:
    free(self->_activePIDList);
    self->_activePIDList = 0;
    self->_activePIDListSize = 0;
  }
}

- (BOOL)hasActivePID:(unsigned int)a3
{
  unint64_t activePIDListCount = self->_activePIDListCount;
  if (!activePIDListCount) {
    return 0;
  }
  activePIDList = self->_activePIDList;
  if (*activePIDList == a3) {
    return 1;
  }
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (activePIDListCount == v6) {
      break;
    }
    unsigned int v8 = activePIDList[v6++];
  }
  while (v8 != a3);
  return v7 < activePIDListCount;
}

- (void)lock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKGlobals[%p] lock error: %d", v2, v3, v4, v5, v6);
}

- (void)unlock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKGlobals[%p] unlock error: %d", v2, v3, v4, v5, v6);
}

@end