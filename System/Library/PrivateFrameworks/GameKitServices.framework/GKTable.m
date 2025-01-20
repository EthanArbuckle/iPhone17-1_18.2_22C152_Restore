@interface GKTable
- (GKTable)init;
- (GKTable)initWithSize:(unint64_t)a3;
- (id)allObjects;
- (id)objectForKey:(unsigned int)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)lock;
- (void)makeObjectsPerformSelector:(SEL)a3;
- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4;
- (void)print;
- (void)removeAllObjects;
- (void)removeObjectForKey:(unsigned int)a3;
- (void)setObject:(id)a3 forKey:(unsigned int)a4;
- (void)touchObject:(id)a3;
- (void)touchObjectForKey:(unsigned int)a3;
- (void)unlock;
@end

@implementation GKTable

- (GKTable)init
{
  return [(GKTable *)self initWithSize:20];
}

- (GKTable)initWithSize:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)GKTable;
  v4 = [(GKTable *)&v8 init];
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
    v6 = (_gktableitem *)malloc_type_calloc(v5, 0x20uLL, 0x10800406DC01D99uLL);
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
          -[GKTable initWithSize:]();
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  [(GKTable *)self removeAllObjects];
  free(self->_items);
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)GKTable;
  [(GKTable *)&v3 dealloc];
}

- (id)objectForKey:(unsigned int)a3
{
  [(GKTable *)self lock];
  unint64_t count = self->_count;
  if (count)
  {
    uint64_t v6 = 0;
    while (self->_items[v6].var0 != a3)
    {
      ++v6;
      if (!--count) {
        goto LABEL_5;
      }
    }
    double v8 = micro();
    pthread_mutexattr_t v9 = &self->_items[v6];
    v9->var3 = v8;
    id v7 = v9->var1;
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }
  [(GKTable *)self unlock];
  return v7;
}

- (id)allObjects
{
  [(GKTable *)self lock];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_count];
  if (v3 && self->_count)
  {
    unint64_t v4 = 0;
    uint64_t v5 = 8;
    do
    {
      [v3 addObject:*(void *)((char *)&self->_items->var0 + v5)];
      ++v4;
      v5 += 32;
    }
    while (v4 < self->_count);
  }
  [(GKTable *)self unlock];
  return v3;
}

- (void)setObject:(id)a3 forKey:(unsigned int)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  [(GKTable *)self lock];
  unint64_t count = self->_count;
  if (!count)
  {
    LODWORD(v10) = 0;
LABEL_7:
    if (count == self->_size)
    {
      unint64_t v11 = count + 20;
      items = (_gktableitem *)malloc_type_realloc(self->_items, 32 * (count + 20), 0x10800406DC01D99uLL);
      if (!items)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            int v22 = *__error();
            int v23 = 136316674;
            uint64_t v24 = v20;
            __int16 v25 = 2080;
            v26 = "-[GKTable setObject:forKey:]";
            __int16 v27 = 1024;
            int v28 = 482;
            __int16 v29 = 2048;
            v30 = self;
            __int16 v31 = 2112;
            id v32 = a3;
            __int16 v33 = 1024;
            unsigned int v34 = a4;
            __int16 v35 = 1024;
            LODWORD(v36) = v22;
            _os_log_error_impl(&dword_221563000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKTable[%p] setObject:[%@]forKey:[%d] realloc error %d", (uint8_t *)&v23, 0x3Cu);
          }
        }
        goto LABEL_20;
      }
      self->_items = items;
      self->_size = v11;
      unint64_t count = self->_count;
    }
    else
    {
      items = self->_items;
    }
    items[count].var0 = a4;
    *(int64x2_t *)&self->_items[self->_count].var2 = vdupq_lane_s64(COERCE__INT64(micro()), 0);
    id v13 = a3;
    unint64_t v14 = self->_count;
    self->_items[v14].var1 = v13;
    self->_unint64_t count = v14 + 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316674;
        uint64_t v24 = v15;
        __int16 v25 = 2080;
        v26 = "-[GKTable setObject:forKey:]";
        __int16 v27 = 1024;
        int v28 = 493;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = a3;
        __int16 v33 = 1024;
        unsigned int v34 = a4;
        __int16 v35 = 1024;
        LODWORD(v36) = v10;
        _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKTable[%p] setObject:[%@] forKey:[%d] @%d", (uint8_t *)&v23, 0x3Cu);
      }
    }
    goto LABEL_20;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 8;
  while (*(_DWORD *)((char *)self->_items + v9 - 8) != a4)
  {
    ++v8;
    v9 += 32;
    if (count == v8)
    {
      unint64_t v10 = self->_count;
      goto LABEL_7;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)((char *)&self->_items->var0 + v9);
      int v23 = 136316930;
      uint64_t v24 = v17;
      __int16 v25 = 2080;
      v26 = "-[GKTable setObject:forKey:]";
      __int16 v27 = 1024;
      int v28 = 466;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = a3;
      __int16 v33 = 1024;
      unsigned int v34 = a4;
      __int16 v35 = 2112;
      uint64_t v36 = v19;
      __int16 v37 = 1024;
      int v38 = v8;
      _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKTable[%p] setObject:[%@] forKey:[%d] replacing [%@] @%d", (uint8_t *)&v23, 0x46u);
    }
  }
  if ([*(id *)((char *)&self->_items->var0 + v9) conformsToProtocol:&unk_26D3A79C0]) {
    [*(id *)((char *)&self->_items->var0 + v9) cleanupForGKTable:self];
  }

  *(int64x2_t *)((char *)&self->_items->var1 + v9) = vdupq_lane_s64(COERCE__INT64(micro()), 0);
  *(void *)((char *)&self->_items->var0 + v9) = a3;
LABEL_20:
  [(GKTable *)self unlock];
}

- (void)touchObject:(id)a3
{
  [(GKTable *)self lock];
  if (self->_count)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      if ([self->_items[v5].var1 isEqual:a3]) {
        *(int64x2_t *)&self->_items[v5].var2 = vdupq_lane_s64(COERCE__INT64(micro()), 0);
      }
      ++v6;
      ++v5;
    }
    while (v6 < self->_count);
  }
  [(GKTable *)self unlock];
}

- (void)touchObjectForKey:(unsigned int)a3
{
  [(GKTable *)self lock];
  unint64_t count = self->_count;
  if (count)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    items = self->_items;
    do
    {
      if (items[v6].var0 == a3)
      {
        *(double *)&uint64_t v9 = micro();
        items = self->_items;
        unint64_t count = self->_count;
        *(int64x2_t *)&items[v6].var2 = vdupq_lane_s64(v9, 0);
      }
      ++v7;
      ++v6;
    }
    while (v7 < count);
  }
  [(GKTable *)self unlock];
}

- (void)removeObjectForKey:(unsigned int)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(GKTable *)self lock];
  unint64_t count = self->_count;
  if (count)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = (os_log_t *)MEMORY[0x263F21098];
    *(void *)&long long v5 = 136316674;
    long long v17 = v5;
    do
    {
      if (self->_items[v7].var0 == a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          unint64_t v11 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            id var1 = self->_items[v7].var1;
            *(_DWORD *)buf = v17;
            uint64_t v19 = v10;
            __int16 v20 = 2080;
            v21 = "-[GKTable removeObjectForKey:]";
            __int16 v22 = 1024;
            int v23 = 524;
            __int16 v24 = 2048;
            __int16 v25 = self;
            __int16 v26 = 2112;
            id v27 = var1;
            __int16 v28 = 1024;
            unsigned int v29 = a3;
            __int16 v30 = 1024;
            int v31 = v8;
            _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKTable[%p] removeObject:[%@] forKey:[%d] @%d", buf, 0x3Cu);
          }
        }
        if (objc_msgSend(self->_items[v7].var1, "conformsToProtocol:", &unk_26D3A79C0, v17)) {
          [self->_items[v7].var1 cleanupForGKTable:self];
        }

        unint64_t count = self->_count - 1;
        self->_unint64_t count = count;
        if (v8 < count)
        {
          items = self->_items;
          unint64_t v14 = &items[v7];
          uint64_t v15 = &items[count];
          long long v16 = *(_OWORD *)&v15->var2;
          *(_OWORD *)&v14->var0 = *(_OWORD *)&v15->var0;
          *(_OWORD *)&v14->var2 = v16;
          unint64_t count = self->_count;
        }
      }
      ++v8;
      ++v7;
    }
    while (v8 < count);
  }
  [(GKTable *)self unlock];
}

- (void)removeAllObjects
{
  [(GKTable *)self lock];
  if (self->_count)
  {
    unint64_t v3 = 0;
    uint64_t v4 = 8;
    do
    {
      if ([*(id *)((char *)&self->_items->var0 + v4) conformsToProtocol:&unk_26D3A79C0]) {
        [*(id *)((char *)&self->_items->var0 + v4) cleanupForGKTable:self];
      }

      ++v3;
      v4 += 32;
    }
    while (v3 < self->_count);
  }
  self->_unint64_t count = 0;
  [(GKTable *)self unlock];
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  [(GKTable *)self lock];
  if (self->_count)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    do
    {
      if (objc_opt_respondsToSelector()) {
        [*(id *)((char *)&self->_items->var0 + v6) performSelector:a3];
      }
      ++v5;
      v6 += 32;
    }
    while (v5 < self->_count);
  }
  [(GKTable *)self unlock];
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
  [(GKTable *)self lock];
  if (self->_count)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 8;
    do
    {
      if (objc_opt_respondsToSelector()) {
        [*(id *)((char *)&self->_items->var0 + v8) performSelector:a3 withObject:a4];
      }
      ++v7;
      v8 += 32;
    }
    while (v7 < self->_count);
  }
  [(GKTable *)self unlock];
}

- (void)lock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKTable[%p] lock error: %d", v2, v3, v4, v5, v6);
}

- (void)unlock
{
  OUTLINED_FUNCTION_7();
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_221563000, v0, v1, " [%s] %s:%d GKTable[%p] unlock error: %d", v2, v3, v4, v5, v6);
}

- (void)print
{
  id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
  double v4 = micro();
  [(GKTable *)self lock];
  uint64_t v5 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], "GKTable[%x] (%lu/%lu): {\n", self, self->_count, self->_size);
  if (self->_count)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      fprintf(*v5, "\t%d => [%s] (Q:-%.3lf, U:-%.3lf)\n", self->_items[v6].var0, (const char *)objc_msgSend((id)objc_msgSend(self->_items[v6].var1, "description"), "UTF8String"), v4 - self->_items[v6].var3, v4 - self->_items[v6].var2);
      ++v7;
      ++v6;
    }
    while (v7 < self->_count);
  }
  fwrite("}\n", 2uLL, 1uLL, *v5);
  [(GKTable *)self unlock];
  [v3 drain];
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
  OUTLINED_FUNCTION_2(&dword_221563000, v0, v1, " [%s] %s:%d GKTable init malloc error %d", v2, v3, v4, v5, v6);
}

@end