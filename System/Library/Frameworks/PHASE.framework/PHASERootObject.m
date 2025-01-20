@interface PHASERootObject
+ (id)new;
- (PHASERootObject)init;
- (PHASERootObject)initWithEngine:(id)a3;
- (PHASERootObject)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setParent:(id)a3;
- (void)setTransform:(Phase::Logger *)a1;
@end

@implementation PHASERootObject

- (PHASERootObject)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASERootObject)initWithEngine:(id)a3 entityType:(unsigned int)a4 shapes:(id)a5
{
  return 0;
}

- (PHASERootObject)initWithEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHASERootObject;
  v5 = [(PHASEObject *)&v10 initWithEngine:v4 entityType:0 shapes:0];
  v6 = v5;
  if (v5)
  {
    v7 = [(PHASEObject *)v5 engine];
    uint64_t v8 = [v7 implementation];
    [(PHASEObject *)v6 setGeoEntityHandle:(*(uint64_t (**)(void))(**(void **)(v8 + 368) + 72))(*(void *)(v8 + 368))];
  }
  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PHASERootObject;
  [(PHASEObject *)&v2 dealloc];
}

- (void)setParent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)a3) + 432);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    v6 = "PHASERootObject.mm";
    __int16 v7 = 1024;
    int v8 = 66;
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Error: Do not set the parent of a Root Object.\"", (uint8_t *)&v5, 0x12u);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Error: Do not set the parent of a Root Object.");
}

- (void)setTransform:(Phase::Logger *)a1
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315394;
    id v4 = "PHASERootObject.mm";
    __int16 v5 = 1024;
    int v6 = 71;
    _os_log_impl(&dword_221E5E000, v1, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Error: Do not set the transform of a Root Object.\"", (uint8_t *)&v3, 0x12u);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Error: Do not set the transform of a Root Object.");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    int v6 = "PHASERootObject.mm";
    __int16 v7 = 1024;
    int v8 = 76;
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error): \"Error: Do not clone a PHASERootObject.\"", (uint8_t *)&v5, 0x12u);
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Error: Do not clone a PHASERootObject.");
}

@end