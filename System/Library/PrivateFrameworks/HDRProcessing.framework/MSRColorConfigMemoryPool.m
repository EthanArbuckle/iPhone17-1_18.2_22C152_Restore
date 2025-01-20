@interface MSRColorConfigMemoryPool
- (MSRColorConfigMemoryPool)initWithCapacity:(unsigned int)a3 Size:(unsigned int)a4;
- (id)generateColorConfig:(id)a3 msrCU:(void *)a4;
- (id)getAlloc;
- (void)dealloc;
- (void)dumpPoolState;
@end

@implementation MSRColorConfigMemoryPool

- (MSRColorConfigMemoryPool)initWithCapacity:(unsigned int)a3 Size:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MSRColorConfigMemoryPool;
  v6 = [(MSRColorConfigMemoryPool *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_data = 0;
    v6->_size = a4;
    v6->_capacity = a3;
    *(void *)&v6->_allocated = 0;
    v6->_array = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6->_capacity];
  }
  return v7;
}

- (void)dealloc
{
  Config = GetConfig((HDRConfig *)self);
  if (Config && (v4 = GetConfig((HDRConfig *)Config), *(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v4, 0x14u, 0)))
  {
    p_array = &self->_array;
  }
  else
  {
    p_array = &self->_data;
  }
  void *p_array = 0;
  [(MSRColorConfigMemoryPool *)self dumpPoolState];
  v6.receiver = self;
  v6.super_class = (Class)MSRColorConfigMemoryPool;
  [(MSRColorConfigMemoryPool *)&v6 dealloc];
}

- (void)dumpPoolState
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    v4 = GetConfig((HDRConfig *)Config);
    ConfigEntryValue = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v4, 0x15u, 0);
    if (*(unsigned char *)ConfigEntryValue)
    {
      objc_super v6 = GetConfig(ConfigEntryValue);
      if (v6)
      {
        v7 = GetConfig((HDRConfig *)v6);
        if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v7, 0x14u, 0))
        {
          if (self->_array)
          {
            unint64_t v8 = -1;
            do
              ++v8;
            while ([(NSMutableArray *)self->_array count] > v8);
            array = self->_array;
            [(NSMutableArray *)array count];
          }
        }
      }
    }
  }
}

- (id)getAlloc
{
  v3 = (HDRConfig *)objc_sync_enter(self);
  Config = (HDRConfig *)GetConfig(v3);
  if (Config
    && (v5 = GetConfig(Config),
        Config = (HDRConfig *)HDRConfig::GetConfigEntryValue((uint64_t)v5, 0x14u, 0),
        *(unsigned char *)Config))
  {
    unsigned int v6 = [(NSMutableArray *)self->_array count];
    unsigned int v7 = v6;
    if (v6)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      while (1)
      {
        v10 = (void *)[(NSMutableArray *)self->_array objectAtIndexedSubscript:v8];
        v11 = (HDRConfig *)[v10 retainCount];
        if (v11 == (HDRConfig *)1) {
          break;
        }
        v12 = GetConfig(v11);
        if (v12)
        {
          v13 = GetConfig((HDRConfig *)v12);
          HDRConfig::GetConfigEntryValue((uint64_t)v13, 0x15u, 0);
        }
        if (v9 == ++v8) {
          goto LABEL_9;
        }
      }
      v19 = GetConfig((HDRConfig *)1);
      if (v19)
      {
        v20 = GetConfig((HDRConfig *)v19);
        HDRConfig::GetConfigEntryValue((uint64_t)v20, 0x15u, 0);
      }
      if (v7 - 1 != v8)
      {
        [(NSMutableArray *)self->_array addObject:v10];
        [(NSMutableArray *)self->_array removeObjectAtIndex:v8];
      }
      [(MSRColorConfigMemoryPool *)self dumpPoolState];
      v18 = v10;
    }
    else
    {
LABEL_9:
      if (v7 && self->_capacity + self->_released < self->_allocated + 1)
      {
        uint64_t v14 = 0;
        while ((unint64_t)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", v14), "retainCount") < 2)
        {
          if (v7 == ++v14) {
            goto LABEL_27;
          }
        }
        v21 = (HDRConfig *)[(NSMutableArray *)self->_array removeObjectAtIndex:v14];
        ++self->_released;
        v22 = GetConfig(v21);
        if (v22)
        {
          v23 = GetConfig((HDRConfig *)v22);
          HDRConfig::GetConfigEntryValue((uint64_t)v23, 0x15u, 0);
        }
      }
LABEL_27:
      v24 = (void *)[MEMORY[0x263EFF990] dataWithLength:self->_size];
      v25 = (HDRConfig *)[(NSMutableArray *)self->_array addObject:v24];
      ++self->_allocated;
      v26 = GetConfig(v25);
      if (v26)
      {
        v27 = GetConfig((HDRConfig *)v26);
        HDRConfig::GetConfigEntryValue((uint64_t)v27, 0x15u, 0);
      }
      [(MSRColorConfigMemoryPool *)self dumpPoolState];
      v18 = v24;
    }
  }
  else
  {
    if (!self->_data)
    {
      v15 = (NSMutableData *)[MEMORY[0x263EFF990] dataWithLength:self->_size];
      self->_data = v15;
      Config = v15;
    }
    v16 = GetConfig(Config);
    if (v16)
    {
      v17 = GetConfig((HDRConfig *)v16);
      HDRConfig::GetConfigEntryValue((uint64_t)v17, 0x15u, 0);
    }
    [(MSRColorConfigMemoryPool *)self dumpPoolState];
    v18 = self->_data;
  }
  v28 = v18;
  objc_sync_exit(self);
  return v28;
}

- (id)generateColorConfig:(id)a3 msrCU:(void *)a4
{
  Config = GetConfig((HDRConfig *)self);
  if (Config)
  {
    uint64_t v8 = GetConfig((HDRConfig *)Config);
    if (*(unsigned char *)HDRConfig::GetConfigEntryValue((uint64_t)v8, 0x14u, 0)) {
      return a3;
    }
  }
  v10 = (void *)MEMORY[0x263EFF8F8];
  uint64_t size = self->_size;
  return (id)[v10 dataWithBytes:a4 length:size];
}

@end