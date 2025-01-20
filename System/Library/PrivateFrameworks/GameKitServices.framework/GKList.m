@interface GKList
- (BOOL)hasID:(unsigned int)a3;
- (GKList)init;
- (GKList)initWithSize:(unint64_t)a3;
- (id)allMatchingObjectsFromTable:(id)a3;
- (unint64_t)count;
- (void)addID:(unsigned int)a3;
- (void)addIDsFromList:(id)a3;
- (void)copyItemsInto:(id)a3;
- (void)dealloc;
- (void)lock;
- (void)print;
- (void)removeAllIDs;
- (void)removeID:(unsigned int)a3;
- (void)unlock;
@end

@implementation GKList

- (GKList)init
{
  return [(GKList *)self initWithSize:20];
}

- (GKList)initWithSize:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)GKList;
  v4 = [(GKList *)&v8 init];
  if (v4)
  {
    if (a3) {
      size_t v5 = a3;
    }
    else {
      size_t v5 = 20;
    }
    v4->_count = 0;
    v4->_size = v5;
    v6 = (unsigned int *)malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
    v4->_items = v6;
    if (v6)
    {
      v9.__sig = 0xAAAAAAAAAAAAAAAALL;
      *(void *)v9.__opaque = 0xAAAAAAAAAAAAAAAALL;
      pthread_mutexattr_init(&v9);
      pthread_mutexattr_settype(&v9, 2);
      pthread_mutex_init(&v4->_lock, &v9);
      pthread_mutexattr_destroy(&v9);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKList initWithSize:]();
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  free(self->_items);
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)GKList;
  [(GKList *)&v3 dealloc];
}

- (BOOL)hasID:(unsigned int)a3
{
  [(GKList *)self lock];
  unint64_t count = self->_count;
  if (count)
  {
    items = self->_items;
    if (*items == a3)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = 1;
      do
      {
        unint64_t v9 = v8;
        if (count == v8) {
          break;
        }
        unsigned int v10 = items[v8++];
      }
      while (v10 != a3);
      BOOL v7 = v9 < count;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  [(GKList *)self unlock];
  return v7;
}

- (void)addID:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(GKList *)self lock];
  unint64_t count = self->_count;
  if (count)
  {
    items = self->_items;
    unint64_t v7 = self->_count;
    do
    {
      int v8 = *items++;
      if (v8 == a3) {
        goto LABEL_10;
      }
    }
    while (--v7);
  }
  if (count != self->_size)
  {
    unsigned int v10 = self->_items;
    goto LABEL_9;
  }
  unint64_t v9 = count + 20;
  unsigned int v10 = (unsigned int *)malloc_type_realloc(self->_items, 4 * (count + 20), 0x100004052888210uLL);
  if (v10)
  {
    self->_items = v10;
    self->_size = v9;
    unint64_t count = self->_count;
LABEL_9:
    self->_unint64_t count = count + 1;
    v10[count] = a3;
LABEL_10:
    [(GKList *)self unlock];
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      int v13 = *__error();
      int v14 = 136316418;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      v17 = "-[GKList addID:]";
      __int16 v18 = 1024;
      int v19 = 281;
      __int16 v20 = 2048;
      v21 = self;
      __int16 v22 = 1024;
      unsigned int v23 = a3;
      __int16 v24 = 1024;
      int v25 = v13;
      _os_log_error_impl(&dword_221563000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKList[%p] addID:[%d] realloc error %d", (uint8_t *)&v14, 0x32u);
    }
  }
  [(GKList *)self unlock];
}

- (void)copyItemsInto:(id)a3
{
  [(GKList *)self lock];
  if (self->_count)
  {
    unint64_t v5 = 0;
    do
      [a3 addID:self->_items[v5++]];
    while (v5 < self->_count);
  }
  [(GKList *)self unlock];
}

- (void)addIDsFromList:(id)a3
{
}

- (void)removeID:(unsigned int)a3
{
  [(GKList *)self lock];
  unint64_t count = self->_count;
  if (count)
  {
    unint64_t v6 = 0;
    items = self->_items;
    do
    {
      if (items[v6] == a3)
      {
        self->_unint64_t count = --count;
        if (v6 < count) {
          items[v6] = items[count];
        }
      }
      ++v6;
    }
    while (v6 < count);
  }
  [(GKList *)self unlock];
}

- (void)removeAllIDs
{
  [(GKList *)self lock];
  self->_unint64_t count = 0;
  [(GKList *)self unlock];
}

- (id)allMatchingObjectsFromTable:(id)a3
{
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
  if (v5 && self->_count)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [a3 objectForKey:self->_items[v6]];
      if (v7) {
        [v5 addObject:v7];
      }
      ++v6;
    }
    while (v6 < self->_count);
  }
  return v5;
}

- (void)lock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKList[%p] lock error: %d", v2, v3, v4, v5, v6);
}

- (void)unlock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKList[%p] unlock error: %d", v2, v3, v4, v5, v6);
}

- (void)print
{
  [(GKList *)self lock];
  uint64_t v3 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "GKList[%p] (%lu/%lu): {\n", self, self->_count, self->_size);
  if (self->_count)
  {
    unint64_t v4 = 0;
    do
      fprintf(*v3, "\t%d\n", self->_items[v4++]);
    while (v4 < self->_count);
  }
  fwrite("}\n", 2uLL, 1uLL, *v3);
  [(GKList *)self unlock];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)initWithSize:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221563000, v0, v1, " [%s] %s:%d GKList init malloc error %d", v2, v3, v4, v5, v6);
}

@end