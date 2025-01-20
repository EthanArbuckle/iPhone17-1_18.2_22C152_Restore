@interface HSStage
+ (Class)hsProxyClass;
+ (const)hsClassName;
- (BOOL)decodeStateFromData:(id)a3;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (BOOL)hsDecode:(void *)a3;
- (BOOL)hsEncode:(void *)a3;
- (HSStage)init;
- (id).cxx_construct;
- (id)HSStageProxy_decodeStateFromData:(id)a3;
- (id)consumers;
- (id)encodeStateToData;
- (id)name;
- (id)stateObject;
- (void)_pruneObservers;
- (void)addStageObserver:(id)a3;
- (void)consume:(id)a3;
- (void)dealloc;
- (void)handleConsume:(id)a3;
- (void)lock;
- (void)postNotification:(id)a3;
- (void)removeStageObserver:(id)a3;
- (void)setConsumers:(id)a3;
- (void)setStateObject:(id)a3;
- (void)unlock;
@end

@implementation HSStage

- (void)handleConsume:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  obj = v12->_state.consumers;
  id v8 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v13 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v5);
      [v10 consume:location[0]];
      objc_storeStrong(&v10, 0);
      ++v5;
      if (v3 + 1 >= (unint64_t)v6)
      {
        uint64_t v5 = 0;
        id v6 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (void)consume:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v3, v5);
  [(HSStage *)v5 handleConsume:location[0]];
  HSUtil::ObjectLock::~ObjectLock(v3);
  objc_storeStrong(location, 0);
}

- (void)unlock
{
}

- (void)lock
{
}

- (HSStage)init
{
  SEL v10 = a2;
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)HSStage;
  obj = [(HSStage *)&v9 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    id v5 = [(id)objc_opt_class() instanceMethodForSelector:"consume:"];
    if (v5 != +[HSStage instanceMethodForSelector:"consume:"]) {
      __assert_rtn("-[HSStage init]", "HSStage.mm", 32, "[[self class] instanceMethodForSelector:@selector(consume:)] == [HSStage instanceMethodForSelector:@selector(consume:)]");
    }
    id v4 = [(id)objc_opt_class() instanceMethodForSelector:"hsEncode:"];
    if (v4 != +[HSStage instanceMethodForSelector:"hsEncode:"]) {
      __assert_rtn("-[HSStage init]", "HSStage.mm", 33, "[[self class] instanceMethodForSelector:@selector(hsEncode:)] == [HSStage instanceMethodForSelector:@selector(hsEncode:)]");
    }
    id v3 = [(id)objc_opt_class() instanceMethodForSelector:"hsDecode:"];
    if (v3 != +[HSStage instanceMethodForSelector:"hsDecode:"]) {
      __assert_rtn("-[HSStage init]", "HSStage.mm", 34, "[[self class] instanceMethodForSelector:@selector(hsDecode:)] == [HSStage instanceMethodForSelector:@selector(hsDecode:)]");
    }
    HSUtil::ObjectLock::ObjectLock((uint64_t)v7, location);
    objc_storeStrong((id *)location + 9, &__NSArray0__struct);
    v12 = (HSStage *)location;
    int v8 = 1;
    HSUtil::ObjectLock::~ObjectLock(v7);
  }
  else
  {
    v12 = 0;
    int v8 = 1;
  }
  objc_storeStrong(&location, 0);
  return v12;
}

- (void)dealloc
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = &_os_log_default;
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_debug_impl(&def_411C8, log, type, "~HSStage", v5, 2u);
  }
  objc_storeStrong(location, 0);
  v4.receiver = v8;
  v4.super_class = (Class)HSStage;
  [(HSStage *)&v4 dealloc];
}

- (id)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)consumers
{
  id v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  id v3 = v5->_state.consumers;
  HSUtil::ObjectLock::~ObjectLock(v4);

  return v3;
}

- (void)setConsumers:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, v7);
  objc_super v4 = (NSArray *)[location[0] copy];
  consumers = v7->_state.consumers;
  v7->_state.consumers = v4;

  HSUtil::ObjectLock::~ObjectLock(v5);
  objc_storeStrong(location, 0);
}

+ (const)hsClassName
{
}

- (BOOL)hsEncode:(void *)a3
{
  int v8 = self;
  SEL v7 = a2;
  char v6 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, self);
  unsigned __int8 v4 = [(HSStage *)v8 handleHSEncode:v6];
  HSUtil::ObjectLock::~ObjectLock(v5);
  return v4 & 1;
}

- (BOOL)hsDecode:(void *)a3
{
  int v8 = self;
  SEL v7 = a2;
  char v6 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, self);
  unsigned __int8 v4 = [(HSStage *)v8 handleHSDecode:v6];
  HSUtil::ObjectLock::~ObjectLock(v5);
  return v4 & 1;
}

- (BOOL)handleHSEncode:(void *)a3
{
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  return 1;
}

- (void)addStageObserver:(id)a3
{
  objc_super v9 = self;
  SEL v8 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    unsigned __int8 v4 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v4 handleFailureInMethod:v8, v9, @"HSStage.mm", 129, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  HSUtil::ObjectLock::ObjectLock((uint64_t)v6, v9);
  p_observers = &v9->_state.observers;
  objc_initWeak(&v5, location);
  std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::insert[abi:ne180100]((uint64_t)p_observers, &v5);
  objc_destroyWeak(&v5);
  [(HSStage *)v9 _pruneObservers];
  HSUtil::ObjectLock::~ObjectLock(v6);
  objc_storeStrong(&location, 0);
}

- (void)removeStageObserver:(id)a3
{
  objc_super v9 = self;
  SEL v8 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    unsigned __int8 v4 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v4 handleFailureInMethod:v8, v9, @"HSStage.mm", 136, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  HSUtil::ObjectLock::ObjectLock((uint64_t)v6, v9);
  p_observers = &v9->_state.observers;
  objc_initWeak(&v5, location);
  std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::erase[abi:ne180100]((uint64_t)p_observers, &v5);
  objc_destroyWeak(&v5);
  [(HSStage *)v9 _pruneObservers];
  HSUtil::ObjectLock::~ObjectLock(v6);
  objc_storeStrong(&location, 0);
}

- (void)postNotification:(id)a3
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v8, v10);
  std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::unordered_set((uint64_t)v7, (uint64_t)&v10->_state.observers);
  HSUtil::ObjectLock::unlock(v8);
  v6[1] = v7;
  v6[0] = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::begin[abi:ne180100]((uint64_t)v7);
  uint64_t v5 = std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::end[abi:ne180100]((uint64_t)v7);
  while (std::operator!=[abi:ne180100](v6, &v5))
  {
    unsigned __int8 v4 = (id *)std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator*[abi:ne180100]();
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained stage:v10 postedNotification:location[0]];

    std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator++[abi:ne180100](v6);
  }
  std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::~unordered_set[abi:ne180100]((uint64_t)v7);
  HSUtil::ObjectLock::~ObjectLock(v8);
  objc_storeStrong(location, 0);
}

- (void)_pruneObservers
{
  SEL v7 = self;
  v6[1] = a2;
  v6[0] = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::begin[abi:ne180100]((uint64_t)&self->_state.observers);
  while (1)
  {
    uint64_t v5 = std::unordered_set<HSStage * {__strong},HSUtil::ObjectHasher,std::equal_to<HSStage * {__strong}>,std::allocator<HSStage * {__strong}>>::end[abi:ne180100]((uint64_t)&v7->_state.observers);
    if (!std::operator!=[abi:ne180100](v6, &v5)) {
      break;
    }
    v2 = (id *)std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator*[abi:ne180100]();
    id WeakRetained = objc_loadWeakRetained(v2);
    BOOL v4 = WeakRetained != 0;

    if (v4) {
      std::__hash_const_iterator<std::__hash_node<objc_object  {objcproto15HSStageObserver}* {__weak},void *> *>::operator++[abi:ne180100](v6);
    }
    else {
      v6[0] = (void *)std::unordered_set<objc_object  {objcproto15HSStageObserver}* {__weak},HSUtil::ObjectHasher,std::equal_to<objc_object  {objcproto15HSStageObserver}*>,std::allocator<objc_object  {objcproto15HSStageObserver}*>>::erase[abi:ne180100]((uint64_t)&v7->_state.observers, v6[0]);
    }
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

- (id)encodeStateToData
{
  objc_super v9 = self;
  SEL v8 = a2;
  HSUtil::EncoderBuf::EncoderBuf((HSUtil::EncoderBuf *)v13);
  HSUtil::Encoder::encodeHSCodable((HSUtil::Coder *)v13, v9);
  SEL v7 = (HSUtil::Buffer *)HSUtil::EncoderBuf::buffer((HSUtil::EncoderBuf *)v13);
  if (HSUtil::Buffer::operator BOOL(v7))
  {
    SEL v10 = HSUtil::Buffer::getNSData(v7);
  }
  else
  {
    uint64_t v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStage+Util.mm", v12);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v11, (uint64_t)"-[HSStage(Util) encodeStateToData]", (uint64_t)v5, 11, (uint64_t)"buf");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v11, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    SEL v10 = 0;
  }
  HSUtil::EncoderBuf::~EncoderBuf((HSUtil::EncoderBuf *)v13);
  v2 = v10;

  return v2;
}

- (BOOL)decodeStateFromData:(id)a3
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::Buffer::Buffer((uint64_t)v7, location[0]);
  HSUtil::DecoderBuf::DecoderBuf((uint64_t)v8, (uint64_t)v7);
  HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v7);
  HSUtil::Decoder::decodeHSCodable((HSUtil::Coder *)v8, v10);
  if (HSUtil::Coder::ok((HSUtil::Coder *)v8))
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStage+Util.mm", v13);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v12, (uint64_t)"-[HSStage(Util) decodeStateFromData:]", (uint64_t)v5, 18, (uint64_t)"decoder");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v12, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v11 = 0;
  }
  HSUtil::DecoderBuf::~DecoderBuf((HSUtil::DecoderBuf *)v8);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (id)stateObject
{
  v15[2] = self;
  v15[1] = (id)a2;
  v15[0] = [(HSStage *)self encodeStateToData];
  BOOL v14 = v15[0] != 0;
  if (v15[0])
  {
    HSUtil::Buffer::Buffer((uint64_t)v8, v15[0]);
    HSUtil::DecoderBuf::DecoderBuf((uint64_t)v9, (uint64_t)v8);
    HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v8);
    id v7 = HSUtil::Decoder::decodeObject((HSUtil::Decoder *)v9);
    if (HSUtil::Coder::ok((HSUtil::Coder *)v9))
    {
      id v16 = v7;
      int v10 = 1;
    }
    else
    {
      uint64_t v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStage+Util.mm", v18);
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v17, (uint64_t)"-[HSStage(Util) stateObject]", (uint64_t)v5, 27, (uint64_t)"decoder");
        _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v17, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v16 = 0;
      int v10 = 1;
    }
    objc_storeStrong(&v7, 0);
    HSUtil::DecoderBuf::~DecoderBuf((HSUtil::DecoderBuf *)v9);
  }
  else
  {
    v13 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStage+Util.mm", v20);
    id location = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v19, (uint64_t)"-[HSStage(Util) stateObject]", (uint64_t)v13, 24, (uint64_t)"encodedData");
      _os_log_error_impl(&def_411C8, (os_log_t)location, type, "Assertion failed (%s @ %s:%ju): %s", v19, 0x2Au);
    }
    objc_storeStrong(&location, 0);
    id v16 = 0;
    int v10 = 1;
  }
  objc_storeStrong(v15, 0);
  v2 = v16;

  return v2;
}

- (void)setStateObject:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::EncoderBuf::EncoderBuf((HSUtil::EncoderBuf *)v22);
  HSUtil::Encoder::encodeObject((HSUtil::Encoder *)v22, (objc_object *)location[0]);
  v15 = (HSUtil::Buffer *)HSUtil::EncoderBuf::buffer((HSUtil::EncoderBuf *)v22);
  if (HSUtil::Buffer::operator BOOL(v15))
  {
    uint64_t v5 = v17;
    id v3 = HSUtil::Buffer::getNSData(v15);
    unsigned __int8 v4 = -[HSStage decodeStateFromData:](v5, "decodeStateFromData:");

    char v9 = v4 & 1;
    char v8 = v4 & 1;
    if (v4)
    {
      int v10 = 0;
    }
    else
    {
      id v7 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStage+Util.mm", v19);
      os_log_t v6 = &_os_log_default;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v18, (uint64_t)"-[HSStage(Util) setStateObject:]", (uint64_t)v7, 37, (uint64_t)"br");
        _os_log_error_impl(&def_411C8, v6, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v18, 0x2Au);
      }
      objc_storeStrong((id *)&v6, 0);
      int v10 = 1;
    }
  }
  else
  {
    v13 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSStage+Util.mm", v21);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v20, (uint64_t)"-[HSStage(Util) setStateObject:]", (uint64_t)v13, 35, (uint64_t)"buf");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v20, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v10 = 1;
  }
  HSUtil::EncoderBuf::~EncoderBuf((HSUtil::EncoderBuf *)v22);
  objc_storeStrong(location, 0);
}

+ (Class)hsProxyClass
{
  return (Class)objc_opt_class();
}

- (id)HSStageProxy_decodeStateFromData:(id)a3
{
  os_log_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = HSProxySynth::HSStageProxy_decodeStateFromData_call1<BOOL>(v6, location[0]);
  objc_storeStrong(location, 0);

  return v4;
}

@end