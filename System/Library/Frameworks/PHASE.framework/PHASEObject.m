@interface PHASEObject
+ (PHASEObject)new;
+ (simd_float3)forward;
+ (simd_float3)right;
+ (simd_float3)up;
+ (void)deRegisterSubTree:(id)a3 engine:(id)a4;
+ (void)deRegisterSubTree:engine:;
+ (void)registerSubTree:(id)a3 engine:(id)a4;
- (BOOL)addChild:(PHASEObject *)child error:(NSError *)error;
- (BOOL)isConnectedToRoot;
- (BOOL)isUnderTarget:(id)a3;
- (BOOL)validateTransform:(__n128)a3 outAffine:(__n128)a4;
- (Handle64)geoEntityHandle;
- (NSArray)children;
- (NSMutableArray)geoShapeHandles;
- (PHASEEngine)engine;
- (PHASEObject)init;
- (PHASEObject)initWithEngine:(PHASEEngine *)engine;
- (PHASEObject)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5;
- (PHASEObject)parent;
- (__n128)_convertTransform:(__n128)a3 fromObject:(__n128)a4;
- (__n128)_storeTransform:(__n128)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (simd_float4x4)transform;
- (simd_float4x4)worldTransform;
- (void)dealloc;
- (void)removeChild:(PHASEObject *)child;
- (void)removeChildren;
- (void)setGeoEntityHandle:(Handle64)a3;
- (void)setGeoShapeHandles:(id)a3;
- (void)setParent:(id)a3;
- (void)setTransform:(simd_float4x4)transform;
- (void)setWorldTransform:(simd_float4x4)worldTransform;
@end

@implementation PHASEObject

- (PHASEObject)init
{
  return 0;
}

+ (PHASEObject)new
{
  return 0;
}

- (PHASEObject)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  obunint64_t j = a3;
  id v53 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PHASEObject;
  v7 = [(PHASEObject *)&v62 init];
  v8 = v7;
  if (!v7)
  {
LABEL_48:
    v41 = v8;
    goto LABEL_59;
  }
  location = (id *)&v7->_engine;
  objc_storeWeak((id *)&v7->_engine, obj);
  objc_storeWeak((id *)&v8->_parent, 0);
  __p = 0;
  v60 = 0;
  v61 = 0;
  if (!v53 || ![v53 count]) {
    goto LABEL_38;
  }
  v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v53, "count"));
  [(PHASEObject *)v8 setGeoShapeHandles:v9];

  unint64_t v10 = [v53 count];
  if (v10 > (v61 - (unsigned char *)__p) >> 3)
  {
    if (v10 >> 61) {
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    }
    v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v61, v10);
    __p = &v11[(v60 - (unsigned char *)__p) & 0xFFFFFFFFFFFFFFF8];
    v60 = (char *)__p;
    v61 = &v11[8 * v12];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v48 = v53;
  uint64_t v13 = [v48 countByEnumeratingWithState:&v55 objects:v71 count:16];
  if (!v13) {
    goto LABEL_37;
  }
  uint64_t v50 = *(void *)v56;
  while (2)
  {
    uint64_t v49 = v13;
    for (uint64_t i = 0; i != v49; ++i)
    {
      if (*(void *)v56 != v50) {
        objc_enumerationMutation(v48);
      }
      id v15 = *(id *)(*((void *)&v55 + 1) + 8 * i);
      id v16 = [v15 engine];
      id WeakRetained = objc_loadWeakRetained(location);
      BOOL v18 = v16 == WeakRetained;

      if (!v18)
      {
        v43 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v19)
                                                                                            + 432)));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = objc_loadWeakRetained(location);
          v45 = [v15 engine];
          *(_DWORD *)buf = 136315906;
          v64 = "PHASEObject.mm";
          __int16 v65 = 1024;
          int v66 = 89;
          __int16 v67 = 2048;
          id v68 = v44;
          __int16 v69 = 2048;
          v70 = v45;
          _os_log_impl(&dword_221E5E000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: Attempting to use a shape initialized with a different PHASEEngine instance @%p", buf, 0x26u);
        }
        goto LABEL_55;
      }
      v20 = [v15 geoShapeHandlesForEntityType:a4];
      if (!v20)
      {
        v43 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0)
                                                                                            + 432)));
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v46 = objc_loadWeakRetained(location);
          *(_DWORD *)buf = 136315906;
          v64 = "PHASEObject.mm";
          __int16 v65 = 1024;
          int v66 = 97;
          __int16 v67 = 2048;
          id v68 = v46;
          __int16 v69 = 1024;
          LODWORD(v70) = a4;
          _os_log_impl(&dword_221E5E000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: could not create shape handles for entity type %d!", buf, 0x22u);
        }
LABEL_55:

        goto LABEL_56;
      }
      for (unint64_t j = 0; [v20 count] > j; ++j)
      {
        v22 = [v20 objectAtIndexedSubscript:j];
        uint64_t v23 = [v22 unsignedLongLongValue];

        if (v23)
        {
          v24 = v60;
          if (v60 >= v61)
          {
            v26 = (char *)__p;
            uint64_t v27 = (v60 - (unsigned char *)__p) >> 3;
            unint64_t v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61) {
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v29 = v61 - (unsigned char *)__p;
            if ((v61 - (unsigned char *)__p) >> 2 > v28) {
              unint64_t v28 = v29 >> 2;
            }
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v30 = v28;
            }
            if (v30)
            {
              v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void *>>((uint64_t)&v61, v30);
              v26 = (char *)__p;
              v24 = v60;
            }
            else
            {
              v31 = 0;
            }
            v32 = (uint64_t *)&v31[8 * v27];
            uint64_t *v32 = v23;
            v25 = (char *)(v32 + 1);
            while (v24 != v26)
            {
              uint64_t v33 = *((void *)v24 - 1);
              v24 -= 8;
              *--v32 = v33;
            }
            __p = v32;
            v60 = v25;
            v61 = &v31[8 * v30];
            if (v26) {
              operator delete(v26);
            }
          }
          else
          {
            *(void *)v60 = v23;
            v25 = v24 + 8;
          }
          v60 = v25;
          v34 = [(PHASEObject *)v8 geoShapeHandles];
          v35 = [v20 objectAtIndexedSubscript:j];
          [v34 addObject:v35];
        }
      }
    }
    uint64_t v13 = [v48 countByEnumeratingWithState:&v55 objects:v71 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_37:

LABEL_38:
  if (!a4)
  {
LABEL_42:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v39 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
      long long v38 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
      long long v40 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      *(_OWORD *)v8->_anon_10 = *MEMORY[0x263EF89A8];
      *(_OWORD *)&v8->_anon_10[16] = v40;
      *(_OWORD *)&v8->_anon_10[32] = v39;
      *(_OWORD *)&v8->_anon_10[48] = v38;
    }
    else
    {
      -[PHASEObject setTransform:](v8, "setTransform:", *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
    }
    if (__p)
    {
      v60 = (char *)__p;
      operator delete(__p);
    }
    goto LABEL_48;
  }
  uint64_t v36 = [obj implementation];
  [(PHASEObject *)v8 setGeoEntityHandle:(*(uint64_t (**)(void, void))(**(void **)(v36 + 368) + 16))(*(void *)(v36 + 368), a4)];
  if ([(PHASEObject *)v8 geoEntityHandle])
  {
    if (v60 != __p)
    {
      uint64_t v37 = *(void *)([obj implementation] + 368);
      (*(void (**)(uint64_t, uint64_t, void **))(*(void *)v37 + 96))(v37, [(PHASEObject *)v8 geoEntityHandle], &__p);
    }
    goto LABEL_42;
  }
  v48 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0)
                                                                                      + 432)));
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    id v42 = objc_loadWeakRetained(location);
    *(_DWORD *)buf = 136315906;
    v64 = "PHASEObject.mm";
    __int16 v65 = 1024;
    int v66 = 119;
    __int16 v67 = 2048;
    id v68 = v42;
    __int16 v69 = 1024;
    LODWORD(v70) = a4;
    _os_log_impl(&dword_221E5E000, v48, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: could not create geometry entity handle for type %d!", buf, 0x22u);
  }
LABEL_56:

  if (__p)
  {
    v60 = (char *)__p;
    operator delete(__p);
  }
  v41 = 0;
LABEL_59:

  return v41;
}

- (PHASEObject)initWithEngine:(PHASEEngine *)engine
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = engine;
  v16.receiver = self;
  v16.super_class = (Class)PHASEObject;
  v5 = [(PHASEObject *)&v16 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&v5->_engine, v4);
  objc_storeWeak((id *)&v6->_parent, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_engine);
  uint64_t v8 = [WeakRetained implementation];
  [(PHASEObject *)v6 setGeoEntityHandle:(*(uint64_t (**)(void, uint64_t))(**(void **)(v8 + 368) + 16))(*(void *)(v8 + 368), 1)];

  if ([(PHASEObject *)v6 geoEntityHandle])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v10 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
      long long v9 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
      long long v11 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      *(_OWORD *)v6->_anon_10 = *MEMORY[0x263EF89A8];
      *(_OWORD *)&v6->_anon_10[16] = v11;
      *(_OWORD *)&v6->_anon_10[32] = v10;
      *(_OWORD *)&v6->_anon_10[48] = v9;
    }
    else
    {
      -[PHASEObject setTransform:](v6, "setTransform:", *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
    }
LABEL_9:
    v14 = v6;
    goto LABEL_10;
  }
  uint64_t v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(0)
                                                                                      + 432)));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = objc_loadWeakRetained((id *)&v6->_engine);
    *(_DWORD *)buf = 136315906;
    BOOL v18 = "PHASEObject.mm";
    __int16 v19 = 1024;
    int v20 = 161;
    __int16 v21 = 2048;
    id v22 = v13;
    __int16 v23 = 1024;
    int v24 = 1;
    _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: could not create geometry entity handle for type %d!", buf, 0x22u);
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v4 = WeakRetained;
  if (WeakRetained && [WeakRetained implementation])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [(PHASEObject *)self geoShapeHandles];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = [*(id *)(*((void *)&v16 + 1) + 8 * v8) unsignedLongLongValue];
          uint64_t v10 = [v4 implementation];
          (*(void (**)(void, uint64_t))(**(void **)(v10 + 368) + 304))(*(void *)(v10 + 368), v9);
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v6);
    }

    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      uint64_t v12 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)isKindOfClass) + 432);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v21 = "PHASEObject.mm";
        __int16 v22 = 1024;
        int v23 = 198;
        __int16 v24 = 2112;
        uint64_t v25 = self;
        _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed %@", buf, 0x1Cu);
      }
    }
    uint64_t v13 = *(void *)([v4 implementation] + 368);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v13 + 280))(v13, [(PHASEObject *)self geoEntityHandle]);
    [(PHASEObject *)self setGeoEntityHandle:0];
    v14 = [(PHASEObject *)self geoShapeHandles];
    [v14 removeAllObjects];
  }
  v15.receiver = self;
  v15.super_class = (Class)PHASEObject;
  [(PHASEObject *)&v15 dealloc];
}

- (BOOL)isConnectedToRoot
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  for (uint64_t i = self; ; uint64_t i = (PHASEObject *)v10)
  {
    v5 = [(PHASEObject *)i parent];
    BOOL v3 = v5 != 0;

    if (!v5) {
      break;
    }
    uint64_t v6 = [(PHASEObject *)i parent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      break;
    }
    uint64_t v8 = [(PHASEObject *)i parent];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();

    if (v9) {
      break;
    }
    uint64_t v10 = [(PHASEObject *)i parent];
  }
  return v3;
}

+ (void)registerSubTree:(id)a3 engine:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (id *)a3;
  id v6 = a4;
  uint64_t v7 = *(void *)([v6 implementation] + 368);
  id WeakRetained = objc_loadWeakRetained(v5 + 10);
  (*(void (**)(uint64_t, void, id))(*(void *)v7 + 240))(v7, WeakRetained[12], v5[12]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v5[1];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(id *)(*((void *)&v14 + 1) + 8 * v12);
        +[PHASEObject registerSubTree:engine:](PHASEObject, "registerSubTree:engine:", v13, v6, (void)v14);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

+ (void)deRegisterSubTree:(id)a3 engine:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v5 = (id *)a3;
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5[1];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        +[PHASEObject deRegisterSubTree:engine:](PHASEObject, "deRegisterSubTree:engine:", v11, v6, (void)v23);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v12 = Phase::Controller::TaskManager::GetService<Phase::Controller::AssetUnloader>((Phase::Logger *)(objc_msgSend(v6, "implementation", (void)v23) + 48), 12);
    id WeakRetained = objc_loadWeakRetained(v5 + 10);
    uint64_t v14 = WeakRetained[12];
    id v15 = v5[12];
    uint64_t v16 = **(void **)(v12 + 8);
    unint64_t v28 = 0;
    BOOL v27 = 1;
    long long v17 = (void *)Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v16, 32, &v28, &v27);
    if (!v17)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      __int16 v21 = **(id **)(v16 + 48);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "CommandQueue.hpp";
        __int16 v32 = 1024;
        int v33 = 100;
        _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v27)
    {
      long long v18 = **(id **)(v16 + 48);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        v31 = "CommandQueue.hpp";
        __int16 v32 = 1024;
        int v33 = 89;
        __int16 v34 = 2048;
        unint64_t v35 = v28;
        __int16 v36 = 2048;
        uint64_t v37 = 32;
        _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *long long v17 = &unk_26D4791C0;
    v17[1] = v12;
    v17[2] = v14;
    v17[3] = v15;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v16, 32);
    atomic_store(0, (unsigned __int8 *)(v16 + 40));
  }
  else
  {
    uint64_t v19 = *(void *)([v6 implementation] + 368);
    id WeakRetained = objc_loadWeakRetained(v5 + 10);
    (*(void (**)(uint64_t, void, id))(*(void *)v19 + 248))(v19, WeakRetained[12], v5[12]);
  }
}

- (BOOL)isUnderTarget:(id)a3
{
  v4 = (PHASEObject *)a3;
  v5 = self;
  while (1)
  {
    id v6 = v5;
    if (v5 == v4) {
      break;
    }
    v5 = [(PHASEObject *)v5 parent];

    if (!v5)
    {
      id v7 = 0;
      goto LABEL_6;
    }
  }
  id v7 = v4;
LABEL_6:

  return v6 == v4;
}

- (BOOL)addChild:(PHASEObject *)child error:(NSError *)error
{
  v97[1] = *MEMORY[0x263EF8340];
  id v6 = child;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  uint64_t v8 = WeakRetained;
  if (error) {
    *error = 0;
  }
  if (!WeakRetained)
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    uint64_t v96 = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithFormat:@"Invalid PHASEEngine"];
    v97[0] = v16;
    id v11 = [NSDictionary dictionaryWithObjects:v97 forKeys:&v96 count:1];

    long long v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v17)
                                                                                        + 432)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v11 objectForKeyedSubscript:v15];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 305;
      __int16 v74 = 2080;
      uint64_t v75 = [v19 UTF8String];
      _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913633 userInfo:v11];
    }
    goto LABEL_67;
  }
  if (!v6)
  {
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v94 = *MEMORY[0x263F08320];
    __int16 v21 = [NSString stringWithFormat:@"Nil child PHASEObject is invalid"];
    v95 = v21;
    id v11 = [NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];

    long long v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v22)
                                                                                        + 432)));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = [v11 objectForKeyedSubscript:v20];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 317;
      __int16 v74 = 2080;
      uint64_t v75 = [v24 UTF8String];
      _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  if (v6 == self)
  {
    uint64_t v25 = *MEMORY[0x263F08320];
    uint64_t v92 = *MEMORY[0x263F08320];
    long long v26 = [NSString stringWithFormat:@"Cannot make an entity a parent of itself"];
    v93 = v26;
    id v11 = [NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];

    unint64_t v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v27)
                                                                                        + 432)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [v11 objectForKeyedSubscript:v25];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 329;
      __int16 v74 = 2080;
      uint64_t v75 = [v29 UTF8String];
      _os_log_impl(&dword_221E5E000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  if ([(PHASEObject *)self isUnderTarget:v6])
  {
    uint64_t v9 = *MEMORY[0x263F08320];
    uint64_t v90 = *MEMORY[0x263F08320];
    uint64_t v10 = [NSString stringWithFormat:@"Cannot add child that is in this object's parentage"];
    v91 = v10;
    id v11 = [NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];

    id v13 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v12)
                                                                                        + 432)));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v11 objectForKeyedSubscript:v9];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 343;
      __int16 v74 = 2080;
      uint64_t v75 = [v14 UTF8String];
      _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
LABEL_67:

    BOOL v66 = 0;
    goto LABEL_68;
  }
  unint64_t v30 = [(PHASEObject *)v6 engine];

  if (v8 != v30)
  {
    uint64_t v31 = *MEMORY[0x263F08320];
    uint64_t v88 = *MEMORY[0x263F08320];
    __int16 v32 = [NSString stringWithFormat:@"Cannot add a child belonging to a different engine"];
    v89 = v32;
    id v11 = [NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];

    __int16 v34 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v33)
                                                                                        + 432)));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v35 = [v11 objectForKeyedSubscript:v31];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 357;
      __int16 v74 = 2080;
      uint64_t v75 = [v35 UTF8String];
      _os_log_impl(&dword_221E5E000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  v36.mData = (unint64_t)[(PHASEObject *)self geoEntityHandle];
  if (v36.mData == [(PHASEObject *)v6 geoEntityHandle])
  {
    uint64_t v37 = *MEMORY[0x263F08320];
    uint64_t v86 = *MEMORY[0x263F08320];
    uint64_t v38 = [NSString stringWithFormat:@"Cannot make an entity a parent of itself"];
    v87 = v38;
    id v11 = [NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];

    long long v40 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v39)
                                                                                        + 432)));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = [v11 objectForKeyedSubscript:v37];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 370;
      __int16 v74 = 2080;
      uint64_t v75 = [v41 UTF8String];
      _os_log_impl(&dword_221E5E000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
      dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
    }
    if (!Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
    {
      uint64_t v53 = *MEMORY[0x263F08320];
      uint64_t v84 = *MEMORY[0x263F08320];
      v85 = @"Cannot add PHASESharedListener as child";
      id v11 = [NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      v54 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)v11)
                                                                                          + 432)));
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        long long v55 = [v11 objectForKeyedSubscript:v53];
        *(_DWORD *)buf = 136315650;
        v71 = "PHASEObject.mm";
        __int16 v72 = 1024;
        int v73 = 384;
        __int16 v74 = 2112;
        uint64_t v75 = (uint64_t)v55;
        _os_log_impl(&dword_221E5E000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
      }
      if (error)
      {
        *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
      }
      goto LABEL_67;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v42 = *MEMORY[0x263F08320];
    uint64_t v82 = *MEMORY[0x263F08320];
    v83 = @"Cannot add root object as child";
    id v11 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v43 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)v11)
                                                                                        + 432)));
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      id v44 = [v11 objectForKeyedSubscript:v42];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 398;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v44;
      _os_log_impl(&dword_221E5E000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  if (!self->_children)
  {
    v45 = (NSMutableSet *)objc_opt_new();
    children = self->_children;
    self->_children = v45;
  }
  v47 = [(PHASEObject *)v6 parent];

  if (v47)
  {
    uint64_t v48 = *MEMORY[0x263F08320];
    uint64_t v80 = *MEMORY[0x263F08320];
    uint64_t v49 = [NSString stringWithFormat:@"PHASEObject child node already has a parent"];
    v81 = v49;
    id v11 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];

    v51 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v50)
                                                                                        + 432)));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v52 = [v11 objectForKeyedSubscript:v48];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 419;
      __int16 v74 = 2080;
      uint64_t v75 = [v52 UTF8String];
      _os_log_impl(&dword_221E5E000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  long long v56 = [(PHASEObject *)self engine];
  long long v57 = [(PHASEObject *)v6 engine];

  if (v56 != v57)
  {
    uint64_t v58 = *MEMORY[0x263F08320];
    uint64_t v78 = *MEMORY[0x263F08320];
    v59 = NSString;
    v60 = [(PHASEObject *)self engine];
    v61 = [(PHASEObject *)v6 engine];
    objc_super v62 = objc_msgSend(v59, "stringWithFormat:", @"PHASEObject child is registered with a different engine instance than the parent @%p - @%p", v60, v61);
    v79 = v62;
    id v11 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];

    v64 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v63)
                                                                                        + 432)));
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      id v65 = [v11 objectForKeyedSubscript:v58];
      *(_DWORD *)buf = 136315650;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 436;
      __int16 v74 = 2080;
      uint64_t v75 = [v65 UTF8String];
      _os_log_impl(&dword_221E5E000, v64, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);
    }
    if (error)
    {
      *error = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }
    goto LABEL_67;
  }
  [(NSMutableSet *)self->_children addObject:v6];
  [(PHASEObject *)v6 setParent:self];
  if ([(PHASEObject *)self isConnectedToRoot]) {
    +[PHASEObject registerSubTree:v6 engine:v8];
  }
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    __int16 v69 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)isKindOfClass) + 432);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v71 = "PHASEObject.mm";
      __int16 v72 = 1024;
      int v73 = 455;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v6;
      __int16 v76 = 2112;
      v77 = self;
      _os_log_impl(&dword_221E5E000, v69, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Added child %@ to parent %@", buf, 0x26u);
    }
  }
  BOOL v66 = 1;
LABEL_68:

  return v66;
}

- (void)removeChild:(PHASEObject *)child
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = child;
  id WeakRetained = (Phase::Logger *)objc_loadWeakRetained((id *)&self->_engine);
  id v6 = WeakRetained;
  if (v4
    && WeakRetained
    && ([(PHASEObject *)v4 parent],
        id v7 = (PHASEObject *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == self))
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v11 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)isKindOfClass) + 432);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        id v13 = "PHASEObject.mm";
        __int16 v14 = 1024;
        int v15 = 474;
        __int16 v16 = 2112;
        long long v17 = v4;
        __int16 v18 = 2112;
        id v19 = self;
        _os_log_impl(&dword_221E5E000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed child %@ from parent %@", (uint8_t *)&v12, 0x26u);
      }
    }
    if ([(PHASEObject *)self isConnectedToRoot]) {
      +[PHASEObject deRegisterSubTree:v4 engine:v6];
    }
    [(NSMutableSet *)self->_children removeObject:v4];
    [(PHASEObject *)v4 setParent:0];
  }
  else
  {
    uint64_t v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(WeakRetained)
                                                                                       + 432)));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(PHASEObject *)v4 parent];
      int v12 = 136316418;
      id v13 = "PHASEObject.mm";
      __int16 v14 = 1024;
      int v15 = 468;
      __int16 v16 = 2048;
      long long v17 = (PHASEObject *)v6;
      __int16 v18 = 2048;
      id v19 = self;
      __int16 v20 = 2048;
      __int16 v21 = v4;
      __int16 v22 = 2048;
      long long v23 = v9;
      _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d engine@%p: Error: object@%p, cannot remove the child@%p with parent@%p!", (uint8_t *)&v12, 0x3Au);
    }
  }
}

- (void)removeChildren
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained && [(PHASEObject *)self isConnectedToRoot])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = self->_children;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(id *)(*((void *)&v9 + 1) + 8 * v7);
          +[PHASEObject deRegisterSubTree:engine:](PHASEObject, "deRegisterSubTree:engine:", v8, WeakRetained, (void)v9);

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  [(NSMutableSet *)self->_children removeAllObjects];
}

- (NSArray)children
{
  children = self->_children;
  if (children && [(NSMutableSet *)children count])
  {
    v4 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v5 = [(NSMutableSet *)self->_children allObjects];
    uint64_t v6 = [v4 arrayWithArray:v5];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263EFF8C0] array];
  }

  return (NSArray *)v6;
}

+ (simd_float3)right
{
  return (simd_float3)xmmword_2220A59A0;
}

+ (simd_float3)up
{
  return (simd_float3)xmmword_2220E7910;
}

+ (simd_float3)forward
{
  return (simd_float3)xmmword_2220E7920;
}

- (BOOL)validateTransform:(__n128)a3 outAffine:(__n128)a4
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  float v7 = a2.n128_f32[1];
  float v8 = a2.n128_f32[2];
  float v9 = a2.n128_f32[3];
  float v10 = a3.n128_f32[1];
  float v11 = a3.n128_f32[3];
  float v12 = a5.n128_f32[1];
  float v13 = a5.n128_f32[3];
  long long v97 = xmmword_2220A4E00;
  float v95 = 0.0;
  uint64_t v96 = 0;
  if (a5.n128_f32[3] < 0.0) {
    float v14 = -a5.n128_f32[3];
  }
  else {
    float v14 = a5.n128_f32[3];
  }
  unint64_t v94 = a5.n128_u64[0];
  float v93 = a5.n128_f32[2];
  float v92 = a3.n128_f32[0];
  unint64_t v15 = a4.n128_u64[0];
  float v91 = a4.n128_f32[3];
  float v89 = a3.n128_f32[2];
  float v90 = a4.n128_f32[2];
  float v88 = a2.n128_f32[0];
  if (v14 <= 0.00000011921) {
    goto LABEL_39;
  }
  float v86 = a3.n128_f32[1];
  float v87 = a5.n128_f32[1];
  v102[0] = a2.n128_f32[0] / a5.n128_f32[3];
  v102[1] = a2.n128_f32[1] / a5.n128_f32[3];
  float v17 = a2.n128_f32[3] / a5.n128_f32[3];
  v102[2] = a2.n128_f32[2] / a5.n128_f32[3];
  v102[3] = a2.n128_f32[3] / a5.n128_f32[3];
  v102[4] = a3.n128_f32[0] / a5.n128_f32[3];
  v102[5] = a3.n128_f32[1] / a5.n128_f32[3];
  float v18 = a3.n128_f32[3];
  float v19 = a3.n128_f32[3] / a5.n128_f32[3];
  v102[6] = a3.n128_f32[2] / a5.n128_f32[3];
  v102[7] = a3.n128_f32[3] / a5.n128_f32[3];
  v102[8] = a4.n128_f32[0] / a5.n128_f32[3];
  v102[9] = a4.n128_f32[1] / a5.n128_f32[3];
  float v20 = a4.n128_f32[3] / a5.n128_f32[3];
  v102[10] = a4.n128_f32[2] / a5.n128_f32[3];
  v102[11] = a4.n128_f32[3] / a5.n128_f32[3];
  v98[0] = a2.n128_f32[0] / a5.n128_f32[3];
  v98[1] = a2.n128_f32[1] / a5.n128_f32[3];
  v98[2] = a2.n128_f32[2] / a5.n128_f32[3];
  v98[4] = a3.n128_f32[0] / a5.n128_f32[3];
  v98[5] = a3.n128_f32[1] / a5.n128_f32[3];
  v98[6] = a3.n128_f32[2] / a5.n128_f32[3];
  v98[8] = a4.n128_f32[0] / a5.n128_f32[3];
  v98[9] = a4.n128_f32[1] / a5.n128_f32[3];
  v98[10] = a4.n128_f32[2] / a5.n128_f32[3];
  unint64_t v99 = a5.n128_u64[0];
  unsigned __int32 v100 = a5.n128_u32[2];
  v98[3] = 0.0;
  v98[7] = 0.0;
  v98[11] = 0.0;
  int v101 = 1065353216;
  float v21 = Phase::Determinant<float>(v98);
  if (v21 < 0.0) {
    float v21 = -v21;
  }
  if (v21 <= 0.00000011921)
  {
    float v11 = v18;
    float v10 = v86;
    float v12 = v87;
LABEL_39:
    v64 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
    BOOL result = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136319490;
    *(void *)&uint8_t buf[4] = "PHASEObject.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 547;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v88;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v7;
    __int16 v114 = 2048;
    double v115 = v8;
    __int16 v116 = 2048;
    double v117 = v9;
    __int16 v118 = 2048;
    double v119 = v92;
    __int16 v120 = 2048;
    double v121 = v10;
    __int16 v122 = 2048;
    double v123 = v89;
    __int16 v124 = 2048;
    double v125 = v11;
    __int16 v126 = 2048;
    double v127 = *(float *)&v15;
    __int16 v128 = 2048;
    double v129 = *((float *)&v15 + 1);
    __int16 v130 = 2048;
    double v131 = v90;
    __int16 v132 = 2048;
    double v133 = v91;
    __int16 v134 = 2048;
    double v135 = *(float *)&v94;
    __int16 v136 = 2048;
    double v137 = v12;
    __int16 v138 = 2048;
    double v139 = v93;
    __int16 v140 = 2048;
    double v141 = v13;
    BOOL v66 = "%25s:%-5d [PHASEObject setTransform]: transform either has a zero in the last row diagonal (and thus can't be "
          "normalized), or it's singular (i.e., non-invertible, non-orthogonal): [%f, %f, %f, %f], [%f, %f, %f, %f], [%f,"
          " %f, %f, %f], [%f, %f, %f, %f]";
    goto LABEL_55;
  }
  float v22 = -v17;
  if (v17 >= 0.0) {
    float v22 = v9 / v13;
  }
  if (v22 <= 0.00000011921) {
    goto LABEL_17;
  }
  float v23 = -v19;
  if (v19 >= 0.0) {
    float v23 = v19;
  }
  if (v23 <= 0.00000011921) {
    goto LABEL_17;
  }
  float v24 = -v20;
  if (v20 >= 0.0) {
    float v24 = v20;
  }
  if (v24 <= 0.00000011921)
  {
LABEL_17:
    uint64_t v25 = 0;
    long long v26 = (float *)buf;
    do
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        uint64_t v28 = 0;
        id v29 = &v104;
        unint64_t v30 = v98;
        do
        {
          if (v28 != i)
          {
            for (uint64_t j = 0; j != 4; ++j)
            {
              if (v25 != j) {
                *v29++ = v30[j];
              }
            }
          }
          ++v28;
          v30 += 4;
        }
        while (v28 != 4);
        float v32 = (float)((float)((float)((float)((float)(v105 * v109) * v110) + (float)((float)(v104 * v108) * v112))
                            + (float)((float)(v106 * v107) * v111))
                    + (float)((float)-(float)(v106 * v108) * v110))
            + (float)((float)-(float)(v105 * v107) * v112);
        float v33 = -(float)(v32 + (float)((float)-(float)(v104 * v109) * v111));
        if (((i ^ v25) & 1) == 0) {
          float v33 = v32 + (float)((float)-(float)(v104 * v109) * v111);
        }
        *v26++ = v33;
      }
      ++v25;
    }
    while (v25 != 4);
  }
  uint64_t v34 = 0;
  uint64_t v103 = 0;
  v102[12] = 0.0;
  memset(buf, 0, 36);
  id v35 = v102;
  do
  {
    Handle64 v36 = (float *)&buf[v34];
    *(void *)Handle64 v36 = *(void *)v35;
    v36[2] = v35[2];
    v34 += 12;
    v35 += 4;
  }
  while (v34 != 36);
  float v37 = sqrtf((float)((float)(*(float *)buf * *(float *)buf) + (float)(*(float *)&buf[4] * *(float *)&buf[4]))+ (float)(*(float *)&buf[8] * *(float *)&buf[8]));
  float v38 = *(float *)buf / v37;
  *(float *)buf = v38;
  *(float *)&uint8_t buf[4] = *(float *)&buf[4] / v37;
  float v39 = (float)((float)(v38 * *(float *)&buf[12]) + (float)(*(float *)&buf[4] * *(float *)&buf[16]))
      + (float)((float)(*(float *)&buf[8] / v37) * *(float *)&buf[20]);
  float v40 = *(float *)&buf[12] - (float)(v38 * v39);
  float v41 = *(float *)&buf[16] - (float)(*(float *)&buf[4] * v39);
  float v42 = *(float *)&buf[20] - (float)((float)(*(float *)&buf[8] / v37) * v39);
  float v43 = sqrtf((float)(v42 * v42) + (float)((float)(v40 * v40) + (float)(v41 * v41)));
  float v95 = v37;
  *(float *)&uint64_t v96 = v43;
  float v44 = v41 / v43;
  *(float *)&buf[8] = *(float *)&buf[8] / v37;
  *(float *)&buf[12] = v40 / v43;
  *(float *)&buf[16] = v44;
  *(float *)&buf[20] = v42 / v43;
  float v45 = (float)((float)(v38 * *(float *)&buf[24]) + (float)(*(float *)&buf[4] * *(float *)&buf[28]))
      + (float)(*(float *)&buf[8] * *(float *)&buf[32]);
  float v46 = *(float *)&buf[24] - (float)(v38 * v45);
  float v47 = *(float *)&buf[28] - (float)(*(float *)&buf[4] * v45);
  float v48 = *(float *)&buf[32] - (float)(*(float *)&buf[8] * v45);
  float v49 = (float)(*(float *)&buf[20] * v48) + (float)((float)((float)(v40 / v43) * v46) + (float)(v44 * v47));
  float v50 = v46 - (float)(*(float *)&buf[12] * v49);
  float v51 = v47 - (float)(v44 * v49);
  float v52 = v48 - (float)(*(float *)&buf[20] * v49);
  float v53 = sqrtf((float)(v52 * v52) + (float)((float)(v50 * v50) + (float)(v51 * v51)));
  *((float *)&v96 + 1) = v53;
  float v54 = v51 / v53;
  float v55 = v52 / v53;
  *(float *)&buf[24] = v50 / v53;
  *(float *)&buf[28] = v54;
  *(float *)&buf[32] = v52 / v53;
  if ((float)((float)(*(float *)&buf[8] * (float)((float)(*(float *)&buf[12] * v54) - (float)(v44 * (float)(v50 / v53))))
             + (float)((float)(v38 * (float)((float)(v44 * (float)(v52 / v53)) - (float)(*(float *)&buf[20] * v54)))
                     + (float)(*(float *)&buf[4]
                             * (float)((float)(*(float *)&buf[20] * (float)(v50 / v53))
                                     - (float)(*(float *)&buf[12] * (float)(v52 / v53)))))) < 0.0)
  {
    uint64_t v56 = 0;
    long long v57 = &v95;
    do
    {
      *long long v57 = -*v57;
      ++v57;
      uint64_t v58 = (float32x2_t *)&buf[v56];
      *uint64_t v58 = vneg_f32(*(float32x2_t *)&buf[v56]);
      v58[1].f32[0] = -*(float *)&buf[v56 + 8];
      v56 += 12;
    }
    while (v56 != 36);
    float v55 = *(float *)&buf[32];
    float v44 = *(float *)&buf[16];
    float v38 = *(float *)buf;
  }
  float v59 = v49 / v53;
  float v60 = v55 + (float)(v44 + v38);
  if (v60 <= 0.0)
  {
    uint64_t v67 = v44 > v38;
    if (v55 > *(float *)(((unint64_t)buf | (4 * v67) | (8 * v67)) + 4 * v67)) {
      uint64_t v67 = 2;
    }
    uint64_t v68 = Phase::Decompose<float>(Phase::Matrix<float,4ul,4ul> const&,Phase::Quaternion<float> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,4ul> &,float)::sNext[v67];
    uint64_t v69 = Phase::Decompose<float>(Phase::Matrix<float,4ul,4ul> const&,Phase::Quaternion<float> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,3ul> &,Phase::Vector<float,4ul> &,float)::sNext[v68];
    v70 = &buf[12 * v67];
    v71 = &buf[12 * (int)v68];
    __int16 v72 = &buf[12 * (int)v69];
    float v73 = sqrtf((float)((float)(*(float *)&v70[4 * v67] - *(float *)&v71[4 * v68]) - *(float *)&v72[4 * v69]) + 1.0);
    *(float *)((unint64_t)&v97 | (4 * v67)) = v73 * 0.5;
    float v74 = 0.5 / v73;
    v98[v68 - 1] = v74 * (float)(*(float *)&v70[4 * v68] + *(float *)&v71[4 * v67]);
    v98[v69 - 1] = v74 * (float)(*(float *)&v70[4 * v69] + *(float *)&v72[4 * v67]);
    float v62 = v74 * (float)(*(float *)&v71[4 * v69] - *(float *)&v72[4 * v68]);
  }
  else
  {
    float v61 = sqrtf(v60 + 1.0);
    float v62 = v61 * 0.5;
    float v63 = 0.5 / v61;
    *(float32x2_t *)&long long v97 = vmul_n_f32(vsub_f32(*(float32x2_t *)&buf[20], (float32x2_t)__PAIR64__(*(unsigned int *)&buf[8], *(unsigned int *)&buf[28])), v63);
    *((float *)&v97 + 2) = v63 * (float)(*(float *)&buf[4] - *(float *)&buf[12]);
  }
  *((float *)&v97 + 3) = v62;
  if (v59 < 0.0) {
    float v59 = -v59;
  }
  if (v59 > 0.0001) {
    goto LABEL_53;
  }
  float v75 = v45 / v53;
  if (v75 < 0.0) {
    float v75 = -v75;
  }
  if (v75 > 0.0001) {
    goto LABEL_53;
  }
  float v76 = v39 / v43;
  if (v76 < 0.0) {
    float v76 = -v76;
  }
  if (v76 > 0.0001)
  {
LABEL_53:
    v64 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
    BOOL result = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136319490;
    *(void *)&uint8_t buf[4] = "PHASEObject.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 561;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v88;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v7;
    __int16 v114 = 2048;
    double v115 = v8;
    __int16 v116 = 2048;
    double v117 = v9;
    __int16 v118 = 2048;
    double v119 = v92;
    __int16 v120 = 2048;
    double v121 = v86;
    __int16 v122 = 2048;
    double v123 = v89;
    __int16 v124 = 2048;
    double v125 = v18;
    __int16 v126 = 2048;
    double v127 = *(float *)&v15;
    __int16 v128 = 2048;
    double v129 = *((float *)&v15 + 1);
    __int16 v130 = 2048;
    double v131 = v90;
    __int16 v132 = 2048;
    double v133 = v91;
    __int16 v134 = 2048;
    double v135 = *(float *)&v94;
    __int16 v136 = 2048;
    double v137 = v87;
    __int16 v138 = 2048;
    double v139 = v93;
    __int16 v140 = 2048;
    double v141 = v13;
    BOOL v66 = "%25s:%-5d [PHASEObject setTransform]: transform is skewed (i.e., has non axis-aligned scale): [%f, %f, %f, %f]"
          ", [%f, %f, %f, %f], [%f, %f, %f, %f], [%f, %f, %f, %f]";
    goto LABEL_55;
  }
  float v77 = fmaxf(fmaxf(v95, *(float *)&v96), *((float *)&v96 + 1));
  float v78 = v77 * 0.001;
  float v79 = v95 - *(float *)&v96;
  if ((float)(v95 - *(float *)&v96) < 0.0) {
    float v79 = -(float)(v95 - *(float *)&v96);
  }
  if (v79 > v78) {
    goto LABEL_63;
  }
  float v80 = v95 - *((float *)&v96 + 1);
  if ((float)(v95 - *((float *)&v96 + 1)) < 0.0) {
    float v80 = -v80;
  }
  if (v80 <= v78)
  {
    unint64_t v81 = v94;
    float v82 = v93;
    if (fabsf(*(float *)&v94) >= 1000000000.0 || fabsf(v87) >= 1000000000.0 || fabsf(v93) >= 1000000000.0)
    {
      v83 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
      BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_ERROR);
      float v82 = v93;
      unint64_t v81 = v94;
      if (v84)
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = "PHASEObject.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 591;
        *(_WORD *)&buf[18] = 2048;
        *(double *)&buf[20] = *(float *)&v94;
        *(_WORD *)&buf[28] = 2048;
        *(double *)&buf[30] = v87;
        __int16 v114 = 2048;
        double v115 = v93;
        _os_log_impl(&dword_221E5E000, v83, OS_LOG_TYPE_ERROR, "%25s:%-5d [PHASEObject setTransform]: WARNING: transform has extremely large translation values [%f, %f, %f]. Expect numerical errors.", buf, 0x30u);
        float v82 = v93;
        unint64_t v81 = v94;
      }
    }
    int v85 = DWORD2(v97);
    *(void *)a7 = v97;
    *(_DWORD *)(a7 + 8) = v85;
    *(float *)(a7 + 12) = v62;
    *(void *)(a7 + 16) = v81;
    *(float *)(a7 + 24) = v82;
    *(float *)(a7 + 28) = v77;
    return 1;
  }
  else
  {
LABEL_63:
    v64 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
    BOOL result = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_DWORD *)buf = 136319490;
      *(void *)&uint8_t buf[4] = "PHASEObject.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 579;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v88;
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = v7;
      __int16 v114 = 2048;
      double v115 = v8;
      __int16 v116 = 2048;
      double v117 = v9;
      __int16 v118 = 2048;
      double v119 = v92;
      __int16 v120 = 2048;
      double v121 = v86;
      __int16 v122 = 2048;
      double v123 = v89;
      __int16 v124 = 2048;
      double v125 = v18;
      __int16 v126 = 2048;
      double v127 = *(float *)&v15;
      __int16 v128 = 2048;
      double v129 = *((float *)&v15 + 1);
      __int16 v130 = 2048;
      double v131 = v90;
      __int16 v132 = 2048;
      double v133 = v91;
      __int16 v134 = 2048;
      double v135 = *(float *)&v94;
      __int16 v136 = 2048;
      double v137 = v87;
      __int16 v138 = 2048;
      double v139 = v93;
      __int16 v140 = 2048;
      double v141 = v13;
      BOOL v66 = "%25s:%-5d [PHASEObject setTransform]: transform has non-uniform scale: [%f, %f, %f, %f], [%f, %f, %f, %f], ["
            "%f, %f, %f, %f], [%f, %f, %f, %f]";
LABEL_55:
      _os_log_impl(&dword_221E5E000, v64, OS_LOG_TYPE_ERROR, v66, buf, 0xB2u);
      return 0;
    }
  }
  return result;
}

- (__n128)_storeTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (void)setTransform:(simd_float4x4)transform
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32((float32x4_t)transform.columns[1], *(float32x4_t *)&self->_anon_10[16]), (int8x16_t)vceqq_f32((float32x4_t)transform.columns[0], *(float32x4_t *)self->_anon_10)), vandq_s8((int8x16_t)vceqq_f32((float32x4_t)transform.columns[2], *(float32x4_t *)&self->_anon_10[32]), (int8x16_t)vceqq_f32((float32x4_t)transform.columns[3], *(float32x4_t *)&self->_anon_10[48])))) & 0x80000000) == 0)
    {
      long long v20 = xmmword_2220A4E00;
      float v21 = 0.0;
      uint64_t v22 = 0;
      int v23 = 1065353216;
      uint64_t v5 = (Phase::Logger *)-[PHASEObject validateTransform:outAffine:](self, "validateTransform:outAffine:", &v20, *(double *)transform.columns[0].i64, *(double *)transform.columns[1].i64, *(double *)transform.columns[2].i64, *(double *)transform.columns[3].i64);
      if (v5)
      {
        Instance = (Phase::Logger *)Phase::Logger::GetInstance(v5);
        if (*((unsigned char *)Instance + 440))
        {
          float v7 = (Phase::Logger *)objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(Instance)
                                                                                                  + 432)));
          uint64_t v8 = Phase::Logger::GetInstance(v7);
          os_signpost_id_t v9 = os_signpost_id_generate(**(os_log_t **)(v8 + 432));
          if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v10 = v9;
            if (os_signpost_enabled((os_log_t)v7))
            {
              v11.unint64_t mData = (unint64_t)[(PHASEObject *)self geoEntityHandle];
              *(_DWORD *)buf = 134220032;
              uint64_t v25 = self;
              __int16 v26 = 2048;
              unint64_t mData = v11.mData;
              __int16 v28 = 2048;
              double v29 = *(float *)&v20;
              __int16 v30 = 2048;
              double v31 = *((float *)&v20 + 1);
              __int16 v32 = 2048;
              double v33 = *((float *)&v20 + 2);
              __int16 v34 = 2048;
              double v35 = *((float *)&v20 + 3);
              __int16 v36 = 2048;
              double v37 = v21;
              __int16 v38 = 2048;
              double v39 = *(float *)&v22;
              __int16 v40 = 2048;
              double v41 = *((float *)&v22 + 1);
              _os_signpost_emit_with_name_impl(&dword_221E5E000, (os_log_t)v7, OS_SIGNPOST_EVENT, v10, "Phase_API_Transform_Update", "Entity@%p: %llu Update Rotation: [%f, %f, %f, %f], Position: [%f, %f, %f]", buf, 0x5Cu);
            }
          }
        }
        uint64_t v12 = *(void *)(objc_msgSend(WeakRetained, "implementation", *(_OWORD *)transform.columns, *(_OWORD *)&transform.columns[1], *(_OWORD *)&transform.columns[2], *(_OWORD *)&transform.columns[3])+ 368);
        v13.unint64_t mData = (unint64_t)[(PHASEObject *)self geoEntityHandle];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        (*(void (**)(uint64_t, Handle64, long long *, void))(*(void *)v12 + 256))(v12, v13, &v20, isKindOfClass & 1);
        -[PHASEObject _storeTransform:](self, "_storeTransform:", v16, v17, v18, v19);
      }
    }
  }
}

- (__n128)_convertTransform:(__n128)a3 fromObject:(__n128)a4
{
  id v8 = a7;
  os_signpost_id_t v9 = v8;
  if (v8)
  {
    os_signpost_id_t v10 = (id *)v8;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 11);
    uint64_t v12 = [WeakRetained rootObject];

    os_signpost_id_t v10 = (id *)v12;
  }
  if (v10 != a1)
  {
    [a1 worldTransform];
    simd_float4x4 v36 = __invert_f4(v35);
    float32x4_t v22 = (float32x4_t)v36.columns[1];
    float32x4_t v23 = (float32x4_t)v36.columns[0];
    float32x4_t v24 = (float32x4_t)v36.columns[3];
    float32x4_t v25 = (float32x4_t)v36.columns[2];
    if (v9)
    {
      [v9 worldTransform];
      unint64_t v13 = 0;
      __n128 v30 = v14;
      __n128 v31 = v15;
      __n128 v32 = v16;
      __n128 v33 = v17;
      do
      {
        v34[v13 / 2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v13 * 8))), v22, (float32x2_t)v30.n128_u64[v13], 1), v25, *(float32x4_t *)((char *)&v30 + v13 * 8), 2), v24, *(float32x4_t *)((char *)&v30 + v13 * 8), 3);
        v13 += 2;
      }
      while (v13 != 8);
      float32x4_t v18 = (float32x4_t)v34[0];
      float32x4_t v19 = (float32x4_t)v34[1];
      float32x4_t v24 = (float32x4_t)v34[3];
      float32x4_t v25 = (float32x4_t)v34[2];
    }
    else
    {
      float32x4_t v19 = (float32x4_t)v36.columns[1];
      float32x4_t v18 = (float32x4_t)v36.columns[0];
    }
    unint64_t v20 = 0;
    __n128 v30 = a2;
    __n128 v31 = a3;
    __n128 v32 = a4;
    __n128 v33 = a5;
    do
    {
      v34[v20 / 2] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(_OWORD *)((char *)&v30 + v20 * 8))), v19, (float32x2_t)v30.n128_u64[v20], 1), v25, *(float32x4_t *)((char *)&v30 + v20 * 8), 2), v24, *(float32x4_t *)((char *)&v30 + v20 * 8), 3);
      v20 += 2;
    }
    while (v20 != 8);
    a2 = (__n128)v34[0];
  }

  return a2;
}

- (void)setWorldTransform:(simd_float4x4)worldTransform
{
  double v13 = *(double *)worldTransform.columns[3].i64;
  double v11 = *(double *)worldTransform.columns[1].i64;
  double v12 = *(double *)worldTransform.columns[2].i64;
  double v10 = *(double *)worldTransform.columns[0].i64;
  id v9 = [(PHASEObject *)self parent];
  if (v9)
  {
    BOOL v3 = [(PHASEObject *)self parent];
    objc_msgSend(v3, "_convertTransform:fromObject:", 0, v10, v11, v12, v13);
    double v10 = v5;
    double v11 = v6;
    double v12 = v7;
    double v13 = v8;
  }
  -[PHASEObject setTransform:](self, "setTransform:", v10, v11, v12, v13);
  if (v9) {
}
  }

- (simd_float4x4)worldTransform
{
  BOOL v3 = [(PHASEObject *)self parent];
  v4 = v3;
  if (v3)
  {
    [v3 worldTransform];
    float32x4_t v26 = v6;
    float32x4_t v28 = v5;
    float32x4_t v22 = v8;
    float32x4_t v24 = v7;
    [(PHASEObject *)self transform];
    uint64_t v9 = 0;
    v30[0] = v10;
    v30[1] = v11;
    v30[2] = v12;
    v30[3] = v13;
    do
    {
      v31[v9] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, COERCE_FLOAT(v30[v9])), v26, *(float32x2_t *)&v30[v9], 1), v24, (float32x4_t)v30[v9], 2), v22, (float32x4_t)v30[v9], 3);
      ++v9;
    }
    while (v9 != 4);
    simd_float4 v27 = (simd_float4)v31[1];
    simd_float4 v29 = (simd_float4)v31[0];
    simd_float4 v23 = (simd_float4)v31[3];
    simd_float4 v25 = (simd_float4)v31[2];
  }
  else
  {
    [(PHASEObject *)self transform];
    simd_float4 v27 = v15;
    simd_float4 v29 = v14;
    simd_float4 v23 = v17;
    simd_float4 v25 = v16;
  }

  simd_float4 v19 = v27;
  simd_float4 v18 = v29;
  simd_float4 v21 = v23;
  simd_float4 v20 = v25;
  result.columns[3] = v21;
  result.columns[2] = v20;
  result.columns[1] = v19;
  result.columns[0] = v18;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (([(PHASEObject *)self isMemberOfClass:objc_opt_class()] & 1) == 0) {
    std::terminate();
  }
  float32x4_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  float32x4_t v6 = [(PHASEObject *)self engine];
  float32x4_t v7 = (void *)[v5 initWithEngine:v6];

  [(PHASEObject *)self transform];
  objc_msgSend(v7, "setTransform:");
  return v7;
}

- (PHASEObject)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (PHASEObject *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (simd_float4x4)transform
{
  simd_float4 v2 = *(simd_float4 *)self->_anon_10;
  simd_float4 v3 = *(simd_float4 *)&self->_anon_10[16];
  simd_float4 v4 = *(simd_float4 *)&self->_anon_10[32];
  simd_float4 v5 = *(simd_float4 *)&self->_anon_10[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (PHASEEngine)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return (PHASEEngine *)WeakRetained;
}

- (Handle64)geoEntityHandle
{
  return self->_geoEntityHandle;
}

- (void)setGeoEntityHandle:(Handle64)a3
{
  self->_geoEntityHandle = a3;
}

- (NSMutableArray)geoShapeHandles
{
  return self->_geoShapeHandles;
}

- (void)setGeoShapeHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoShapeHandles, 0);
  objc_destroyWeak((id *)&self->_engine);
  objc_destroyWeak((id *)&self->_parent);

  objc_storeStrong((id *)&self->_children, 0);
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  return self;
}

+ (void)deRegisterSubTree:engine:
{
  v1 = (void *)a1[1];
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  simd_float4x4 result = operator new(0x20uLL);
  result[2] = v2;
  result[3] = v3;
  uint64_t v5 = v1[8];
  v1 += 8;
  *(void *)(v5 + 8) = result;
  *simd_float4x4 result = v5;
  void *v1 = result;
  result[1] = v1;
  ++v1[2];
  return result;
}

@end