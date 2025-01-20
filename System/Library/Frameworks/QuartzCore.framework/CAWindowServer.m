@interface CAWindowServer
+ (id)context;
+ (id)contextWithOptions:(id)a3;
+ (id)server;
+ (id)serverIfRunning;
+ (id)serverWithOptions:(id)a3;
+ (void)stopServer;
- (BOOL)isMirroringEnabled;
- (BOOL)isSecure;
- (BOOL)isSlotValid:(unsigned int)a3;
- (CAWindowServer)init;
- (NSArray)displays;
- (id)_init;
- (id)description;
- (id)displayWithDisplayId:(unsigned int)a3;
- (id)displayWithName:(id)a3;
- (id)displayWithUniqueId:(id)a3;
- (id)insecureProcessIds;
- (id)secureModeViolations;
- (id)slotDeletionCallback;
- (unsigned)clientPortOfContextId:(unsigned int)a3;
- (unsigned)contextIdHostingContextId:(unsigned int)a3;
- (unsigned)rendererFlags;
- (unsigned)taskNamePortOfContextId:(unsigned int)a3;
- (void)_detectDisplays;
- (void)addDisplay:(id)a3;
- (void)dealloc;
- (void)removeAllDisplays;
- (void)removeDisplay:(id)a3;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)setRendererFlags:(unsigned int)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSlotDeletionCallback:(id)a3;
@end

@implementation CAWindowServer

- (unsigned)contextIdHostingContextId:(unsigned int)a3
{
  if (!self->_impl) {
    return 0;
  }
  v3 = (CA::Render::Context *)CA::Render::Context::context_by_id(*(CA::Render::Context **)&a3);
  if (!v3) {
    return 0;
  }
  v4 = (atomic_uint *)v3;
  v5 = (atomic_uint *)CA::Render::Context::retain_host_context(v3);
  if (v5)
  {
    unsigned int v6 = v5[4];
    if (atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
  }
  return v6;
}

- (unsigned)taskNamePortOfContextId:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_impl) {
    return 0;
  }
  uint64_t v3 = CA::Render::Context::context_by_id(*(CA::Render::Context **)&a3);
  if (!v3) {
    return 0;
  }
  v4 = (atomic_uint *)v3;
  mach_port_name_t v5 = *(_DWORD *)(v3 + 252);
  mach_port_name_t tn = v5;
  if (!v5)
  {
    mach_port_name_t v6 = *MEMORY[0x1E4F14960];
    pid_t v7 = getpid();
    task_name_for_pid(v6, v7, &tn);
    mach_port_name_t v5 = tn;
  }
  if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
  }
  return v5;
}

+ (id)serverIfRunning
{
  return (id)_shared_server;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

- (BOOL)isMirroringEnabled
{
  return self->_mirroringEnabled;
}

- (unsigned)clientPortOfContextId:(unsigned int)a3
{
  if (!self->_impl) {
    return 0;
  }
  uint64_t v3 = (atomic_uint *)CA::Render::Context::context_by_id(*(CA::Render::Context **)&a3);
  if (!v3) {
    return 0;
  }
  unsigned int v4 = v3[65];
  if (!v4) {
    unsigned int v4 = v3[64];
  }
  if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
  }
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CAWindowServer:%p %@>", self, -[CAWindowServer displays](self, "displays")];
}

- (id)slotDeletionCallback
{
  return self->_impl->var2;
}

- (void)setSlotDeletionCallback:(id)a3
{
  self->_impl->var2 = _Block_copy(a3);
}

- (BOOL)isSlotValid:(unsigned int)a3
{
  os_unfair_lock_lock(&CA::Render::Context::_context_lock);
  if (CA::Render::Context::_slot_table) {
    BOOL v4 = x_hash_table_lookup(CA::Render::Context::_slot_table, a3, 0) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  os_unfair_lock_unlock(&CA::Render::Context::_context_lock);
  return v4;
}

- (id)insecureProcessIds
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = 0;
  v13 = 0;
  uint64_t v14 = 0;
  os_unfair_lock_lock(&CA::Render::Context::_context_lock);
  uint64_t v4 = 0;
  uint64_t v5 = CA::Render::Context::_context_table;
  uint64_t v6 = 1 << *(_DWORD *)CA::Render::Context::_context_table;
  do
  {
    for (i = *(uint64_t ***)(*(void *)(v5 + 16) + 8 * v4); i; i = (uint64_t **)*i)
      CA::Render::collect_insecure_process_ids((CA::Render *)i[2], (uint64_t)i[3], (CA::Render::Context *)&v12, v3);
    ++v4;
  }
  while (v4 != v6);
  os_unfair_lock_unlock(&CA::Render::Context::_context_lock);
  v8 = v12;
  v9 = v13;
  if (v12 != v13)
  {
    do
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", *v8, v12);
      if (([v2 containsObject:v10] & 1) == 0) {
        [v2 addObject:v10];
      }
      ++v8;
    }
    while (v8 != v9);
    v8 = v12;
  }
  if (v8)
  {
    v13 = v8;
    operator delete(v8);
  }
  return v2;
}

- (id)secureModeViolations
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&CA::Render::Context::secure_mode_violations(void)::violations_lock);
  v48 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  os_unfair_lock_lock(&CA::Render::Context::_context_lock);
  uint64_t v2 = 0;
  uint64_t v3 = CA::Render::Context::_context_table;
  v55[0] = &unk_1ED030EF0;
  v55[1] = &v48;
  v56 = v55;
  uint64_t v4 = 1 << *(_DWORD *)CA::Render::Context::_context_table;
  do
  {
    for (i = *(void **)(*(void *)(v3 + 16) + 8 * v2); i; i = (void *)*i)
      X::HashTable<unsigned int,CA::Render::Context *>::foreach(std::function<void ()(unsigned int,CA::Render::Context *)>)::{lambda(void *,void *,void *)#1}::__invoke(i[2], i[3], (uint64_t)v55);
    ++v2;
  }
  while (v2 != v4);
  if (v56 == v55)
  {
    (*(void (**)(void *))(v55[0] + 32))(v55);
  }
  else if (v56)
  {
    (*(void (**)(void))(*v56 + 40))();
  }
  os_unfair_lock_unlock(&CA::Render::Context::_context_lock);
  v45 = 0;
  v46 = 0;
  unint64_t v47 = 0;
  uint64_t v6 = v48;
  pid_t v7 = v49;
  if (v48 != v49)
  {
    v43 = &v52;
    do
    {
      uint64_t v8 = *v6;
      v9 = (pthread_mutex_t *)(*v6 + 72);
      pthread_mutex_lock(v9);
      unsigned int v10 = atomic_load((unsigned int *)(v8 + 228));
      if (!v10)
      {
        if (*(_DWORD *)(v8 + 252)) {
          pid_t v11 = 0;
        }
        else {
          pid_t v11 = getpid();
        }
        unsigned int v12 = 0;
        atomic_compare_exchange_strong((atomic_uint *volatile)(v8 + 228), &v12, v11);
        if (v12) {
          unsigned int v10 = v12;
        }
        else {
          unsigned int v10 = v11;
        }
      }
      unsigned int v13 = *(_DWORD *)(v8 + 16);
      unsigned int v14 = *(_DWORD *)(v8 + 300);
      unsigned int v15 = *(_DWORD *)(v8 + 304);
      uint64_t v16 = *(void *)(v8 + 312);
      unint64_t v17 = *(void *)(v8 + 320);
      *(void *)(v8 + 312) = 0;
      *(void *)(v8 + 320) = 0;
      *(void *)&long long v51 = v16;
      *((void *)&v51 + 1) = v17;
      uint64_t v18 = *(void *)(v8 + 328);
      uint64_t v19 = *(void *)(v8 + 336);
      *(void *)(v8 + 328) = 0;
      *(void *)(v8 + 336) = 0;
      *(void *)&long long v52 = v18;
      *((void *)&v52 + 1) = v19;
      *(void *)&long long v53 = 0;
      int v20 = *(_DWORD *)(v8 + 344);
      *(_DWORD *)(v8 + 344) = 1065353216;
      LODWORD(v53) = v20;
      if (v19)
      {
        unint64_t v21 = *(void *)(v18 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v21 >= v17) {
            v21 %= v17;
          }
        }
        else
        {
          v21 &= v17 - 1;
        }
        *(void *)(v16 + 8 * v21) = &v52;
      }
      v22 = v46;
      if ((unint64_t)v46 >= v47)
      {
        unint64_t v24 = 0x6DB6DB6DB6DB6DB7 * (((char *)v46 - (char *)v45) >> 3) + 1;
        if (v24 > 0x492492492492492) {
          abort();
        }
        if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v47 - (void)v45) >> 3) > v24) {
          unint64_t v24 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v47 - (void)v45) >> 3);
        }
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v47 - (void)v45) >> 3)) >= 0x249249249249249) {
          unint64_t v25 = 0x492492492492492;
        }
        else {
          unint64_t v25 = v24;
        }
        if (v25)
        {
          if (v25 > 0x492492492492492) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v26 = (char *)operator new(56 * v25);
        }
        else
        {
          v26 = 0;
        }
        v27 = (unsigned int *)&v26[8 * (((char *)v46 - (char *)v45) >> 3)];
        unsigned int *v27 = v10;
        v27[1] = v13;
        v28 = &v26[56 * v25];
        v27[2] = v14;
        v27[3] = v15;
        std::__hash_table<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>>>::__hash_table((uint64_t)(v27 + 4), (uint64_t *)&v51);
        v23 = v27 + 14;
        v30 = v45;
        v29 = (uint64_t *)v46;
        if (v46 == v45)
        {
          v45 = v27;
          v46 = v27 + 14;
          unint64_t v47 = (unint64_t)v28;
        }
        else
        {
          do
          {
            unsigned int v31 = *((_DWORD *)v29 - 14);
            v29 -= 7;
            *(v27 - 14) = v31;
            v27 -= 14;
            v27[1] = *((_DWORD *)v29 + 1);
            v27[2] = *((_DWORD *)v29 + 2);
            v27[3] = *((_DWORD *)v29 + 3);
            std::__hash_table<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>>>::__hash_table((uint64_t)(v27 + 4), v29 + 2);
          }
          while (v29 != (uint64_t *)v30);
          v32 = v45;
          v29 = (uint64_t *)v46;
          v45 = v27;
          v46 = v23;
          unint64_t v47 = (unint64_t)v28;
          if (v29 != (uint64_t *)v32)
          {
            do
            {
              std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)(v29 - 5));
              v29 -= 7;
            }
            while (v29 != (uint64_t *)v32);
            v29 = (uint64_t *)v32;
          }
        }
        if (v29) {
          operator delete(v29);
        }
      }
      else
      {
        unsigned int *v46 = v10;
        v22[1] = v13;
        v22[2] = v14;
        v22[3] = v15;
        std::__hash_table<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void (*)(CALayer *,CA::Render::Layer const*,CA::Render::Layer const*,std::string const&,ReverseSerializationState const&)>>>::__hash_table((uint64_t)(v22 + 4), (uint64_t *)&v51);
        v23 = v22 + 14;
      }
      v46 = v23;
      std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&v51);
      pthread_mutex_unlock(v9);
      *(_DWORD *)(v8 + 12) &= ~0x40000u;
      if (atomic_fetch_add((atomic_uint *volatile)(v8 + 8), 0xFFFFFFFF) == 1) {
        (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
      }
      ++v6;
    }
    while (v6 != v7);
    uint64_t v6 = v48;
  }
  if (v6)
  {
    v49 = v6;
    operator delete(v6);
  }
  os_unfair_lock_unlock(&CA::Render::Context::secure_mode_violations(void)::violations_lock);
  for (j = v45; j != v46; j += 14)
  {
    uint64_t v54 = 0;
    long long v51 = *(_OWORD *)j;
    long long v52 = 0u;
    long long v53 = 0u;
    LODWORD(v54) = j[12];
    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::__rehash<true>((uint64_t)&v52, *((void *)j + 3));
    for (k = (void *)*((void *)j + 4); k; k = (void *)*k)
      std::__hash_table<CA::Render::String *,std::hash<CA::Render::String *>,std::equal_to<CA::Render::String *>,std::allocator<CA::Render::String *>>::__emplace_unique_key_args<CA::Render::String *,CA::Render::String * const&>((uint64_t)&v52, k[2], k[2]);
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v36 = DWORD1(v51);
    uint64_t v38 = DWORD2(v51);
    uint64_t v37 = HIDWORD(v51);
    objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v51), @"processId");
    objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v36), @"contextId");
    if (v38 && v37)
    {
      objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v38), @"hostProcessId");
      objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v37), @"hostContextId");
    }
    if (*((void *)&v53 + 1))
    {
      v39 = (void *)[MEMORY[0x1E4F1CA48] array];
      for (m = (void *)v53; m; m = (void *)*m)
      {
        objc_msgSend(v39, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", m[2] + 28, v43));
        v41 = (atomic_uint *)m[2];
        if (atomic_fetch_add(v41 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v41 + 16))(v41);
        }
      }
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v39, @"layerNames", v43);
    }
    objc_msgSend(v44, "addObject:", v35, v43);

    std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&v52);
  }
  *(void *)&long long v51 = &v45;
  std::vector<std::tuple<int,unsigned int,int,unsigned int,std::unordered_set<CA::Render::String *>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v51);
  return v44;
}

- (BOOL)isSecure
{
  return CFArrayGetCount(self->_impl->var0)
      && *(unsigned char *)(*(void *)(*((void *)CFArrayGetValueAtIndex(self->_impl->var0, 0) + 1) + 64) + 514);
}

- (void)setSecure:(BOOL)a3
{
  BOOL v3 = a3;
  NSLog(&cfstr_Cawindowserver_0.isa, a2);
  if (CFArrayGetCount(self->_impl->var0))
  {
    uint64_t v5 = *(CA::WindowServer::Server **)(*((void *)CFArrayGetValueAtIndex(self->_impl->var0, 0) + 1) + 64);
    CA::WindowServer::Server::set_secure(v5, v3);
  }
}

- (unsigned)rendererFlags
{
  return self->_impl->var1;
}

- (void)setRendererFlags:(unsigned int)a3
{
  unsigned int v3 = a3 | 3;
  impl = self->_impl;
  if (impl->var1 != (a3 | 3))
  {
    impl->var1 = v3;
    CFIndex Count = CFArrayGetCount(impl->var0);
    if (Count)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
        *(_DWORD *)(*(void *)(*((void *)CFArrayGetValueAtIndex(self->_impl->var0, i) + 1) + 64) + 184) = v3;
    }
  }
}

- (NSArray)displays
{
  return (NSArray *)self->_impl->var0;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl)
  {
    if (impl->var0) {
      CFRelease(impl->var0);
    }
    _Block_release(impl->var2);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, impl);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAWindowServer;
  [(CAWindowServer *)&v5 dealloc];
}

- (void)_detectDisplays
{
  uint64_t v2 = self;
  for (uint64_t i = 0; i != 3; ++i)
  {
    self = (CAWindowServer *)((uint64_t (*)(CAWindowServer *, SEL))[(CAWindowServer *)self _detectDisplays];
    if (self)
    {
      uint64_t v4 = self;
      objc_super v5 = 0;
      uint64_t v6 = -[CAWindowServer _detectDisplays]::open_funcs[i];
      do
      {
        self = (CAWindowServer *)((uint64_t (*)(CAWindowServer *))v6)(v5);
        if (self)
        {
          CFIndex v7 = self;
          CFIndex Count = CFArrayGetCount(v2->_impl->var0);
          v9 = (CA::WindowServer::Server *)(*((uint64_t (**)(CAWindowServer *))v7->super.isa + 203))(v7);
          if (v9)
          {
            unsigned int v10 = v9;
            if (!Count) {
              *(_DWORD *)(*((void *)v9 + 12) + 745) |= 0x20u;
            }
            CA::WindowServer::Server::attach_contexts(v9);
            id v11 = [[CAWindowServerDisplay alloc] _initWithCADisplayServer:v10];
            if (v11)
            {
              unsigned int v12 = v11;
              [(CAWindowServer *)v2 addDisplay:v11];
            }
            else
            {
              (**(void (***)(CA::WindowServer::Server *))v10)(v10);
              self = (CAWindowServer *)(*(uint64_t (**)(CA::WindowServer::Server *))(*(void *)v10 + 120))(v10);
            }
          }
          else
          {
            self = (CAWindowServer *)(*((uint64_t (**)(CAWindowServer *))v7->super.isa + 1))(v7);
          }
        }
        objc_super v5 = (CAWindowServer *)((char *)v5 + 1);
      }
      while (v4 != v5);
    }
  }
}

- (id)displayWithUniqueId:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id result = (id)[a3 UTF8String];
  if (result)
  {
    impl = self->_impl;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__CAWindowServer_displayWithUniqueId___block_invoke;
    v6[3] = &__block_descriptor_40_e31_B16__0__CAWindowServerDisplay_8l;
    v6[4] = result;
    return (id)find_display(&impl->var0, (uint64_t)v6);
  }
  return result;
}

BOOL __38__CAWindowServer_displayWithUniqueId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 0, sizeof(v12));
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a2 + 8) + 64) + 96);
  int v10 = (*(uint64_t (**)(uint64_t, void, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v9 + 800))(v9, 0, v12, 64, 1, a6, a7, a8);
  BOOL result = 0;
  if (v10) {
    return strcmp(*(const char **)(a1 + 32), (const char *)v12) == 0;
  }
  return result;
}

- (id)displayWithDisplayId:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CAWindowServer_displayWithDisplayId___block_invoke;
  v5[3] = &__block_descriptor_36_e31_B16__0__CAWindowServerDisplay_8l;
  unsigned int v6 = a3;
  return (id)find_display(&impl->var0, (uint64_t)v5);
}

BOOL __39__CAWindowServer_displayWithDisplayId___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(*(void *)(*(void *)(*(void *)(a2 + 8) + 64) + 96) + 24) == *(_DWORD *)(a1 + 32);
}

- (id)displayWithName:(id)a3
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  impl = self->_impl;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CAWindowServer_displayWithName___block_invoke;
  v5[3] = &unk_1E527E2D8;
  void v5[4] = a3;
  return (id)find_display(&impl->var0, (uint64_t)v5);
}

uint64_t __34__CAWindowServer_displayWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(*(void *)(a2 + 8) + 64) + 104)];
}

- (void)removeAllDisplays
{
  CFIndex Count = CFArrayGetCount(self->_impl->var0);
  if (Count)
  {
    v6.length = Count;
    v6.location = 0;
    CFArrayApplyFunction(self->_impl->var0, v6, (CFArrayApplierFunction)invalidate_display, 0);
    var0 = self->_impl->var0;
    CFArrayRemoveAllValues(var0);
  }
}

- (void)removeDisplay:(id)a3
{
  if (a3)
  {
    v9.length = CFArrayGetCount(self->_impl->var0);
    v9.location = 0;
    CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(self->_impl->var0, v9, a3);
    if (FirstIndexOfValue != -1)
    {
      CFIndex v6 = FirstIndexOfValue;
      [a3 invalidate];
      var0 = self->_impl->var0;
      CFArrayRemoveValueAtIndex(var0, v6);
    }
  }
}

- (void)addDisplay:(id)a3
{
  if (a3)
  {
    v8.length = CFArrayGetCount(self->_impl->var0);
    v8.location = 0;
    if (CFArrayGetFirstIndexOfValue(self->_impl->var0, v8, a3) == -1)
    {
      impl = self->_impl;
      *(_DWORD *)(*(void *)(*((void *)a3 + 1) + 64) + 184) = impl->var1;
      var0 = impl->var0;
      CFArrayAppendValue(var0, a3);
    }
  }
}

- (id)_init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAWindowServer;
  uint64_t v2 = [(CAWindowServer *)&v5 init];
  if (v2)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v2->_impl = (CAWindowServerImpl *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v2->_impl->var0 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    v2->_impl->var1 = 3;
  }
  return v2;
}

- (CAWindowServer)init
{
  return 0;
}

+ (void)stopServer
{
  _shared_server = 0;
}

+ (id)serverWithOptions:(id)a3
{
  id result = (id)_shared_server;
  if (!_shared_server)
  {
    if (+[CAWindowServer serverWithOptions:]::once != -1) {
      dispatch_once_f(&+[CAWindowServer serverWithOptions:]::once, a3, (dispatch_function_t)shared_server_init);
    }
    return (id)_shared_server;
  }
  return result;
}

+ (id)server
{
  return (id)[a1 serverWithOptions:0];
}

+ (id)contextWithOptions:(id)a3
{
  if (!_shared_server)
  {
    id result = +[CAContext remoteContextWithOptions:a3];
    if (result) {
      return result;
    }
    if (!_shared_server) {
      +[CAWindowServer server];
    }
  }

  return +[CAContext localContextWithOptions:a3];
}

+ (id)context
{
  return (id)[a1 contextWithOptions:0];
}

@end