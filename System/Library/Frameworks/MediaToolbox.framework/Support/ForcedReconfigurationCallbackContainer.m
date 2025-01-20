@interface ForcedReconfigurationCallbackContainer
- (BOOL)isEmpty;
- (ForcedReconfigurationCallbackContainer)initWithLabel:(const void *)a3;
- (id).cxx_construct;
- (unint64_t)addCallback:(id)a3;
- (void)fireAll;
- (void)removeCallback:(unint64_t)a3;
@end

@implementation ForcedReconfigurationCallbackContainer

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((void *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_label.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_label.__r_.__value_.var0.__l.__data_);
  }

  objc_storeStrong((id *)&self->_callbacks, 0);
}

- (BOOL)isEmpty
{
  return [(NSMutableDictionary *)self->_callbacks count] == 0;
}

- (void)fireAll
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_callbacks;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        -[NSMutableDictionary objectForKey:](self->_callbacks, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)removeCallback:(unint64_t)a3
{
  callbacks = self->_callbacks;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  -[NSMutableDictionary removeObjectForKey:](callbacks, "removeObjectForKey:");
}

- (unint64_t)addCallback:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = self->_callbackCounter + 1;
    do
    {
      unint64_t v6 = v5;
      unint64_t v5 = 1;
    }
    while (!v6);
    self->_callbackCounter = v6;
    callbacks = self->_callbacks;
    long long v8 = [NSNumber numberWithUnsignedLongLong:v6];
    long long v9 = [(NSMutableDictionary *)callbacks objectForKey:v8];

    if (v9)
    {
      long long v10 = STS_N_Log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        p_label = &self->_label;
        if (*((char *)&self->_label.__r_.__value_.var0.__l + 23) < 0) {
          p_label = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_label->__r_.__value_.var0.__l.__data_;
        }
        int v16 = 136315138;
        v17 = p_label;
        _os_log_error_impl(&dword_23773E000, v10, OS_LOG_TYPE_ERROR, "overwriting ForcedReconfigurationCallback for label %s", (uint8_t *)&v16, 0xCu);
      }
    }
    long long v11 = self->_callbacks;
    v12 = (void *)MEMORY[0x237E1EAE0](v4);
    uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v6];
    [(NSMutableDictionary *)v11 setObject:v12 forKey:v13];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (ForcedReconfigurationCallbackContainer)initWithLabel:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ForcedReconfigurationCallbackContainer;
  id v4 = [(ForcedReconfigurationCallbackContainer *)&v9 init];
  unint64_t v5 = (ForcedReconfigurationCallbackContainer *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 1, (const std::string *)a3);
    unint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    callbacks = v5->_callbacks;
    v5->_callbacks = v6;
  }
  return v5;
}

@end