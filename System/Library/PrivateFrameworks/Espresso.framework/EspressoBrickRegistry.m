@interface EspressoBrickRegistry
+ (void)registerBrickClass:(Class)a3;
@end

@implementation EspressoBrickRegistry

+ (void)registerBrickClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  if (+[EspressoBrickRegistry registerBrickClass:]::onceToken != -1) {
    dispatch_once(&+[EspressoBrickRegistry registerBrickClass:]::onceToken, &__block_literal_global_31014);
  }
  v5 = lockQ;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__EspressoBrickRegistry_registerBrickClass___block_invoke_2;
  v7[3] = &unk_1E5747D98;
  id v8 = v4;
  Class v9 = a3;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__EspressoBrickRegistry_registerBrickClass___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1) {
    [(id)registry setObject:v1 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  v2 = Espresso::factory_t<Espresso::SerDes::layer_io_base>::shared();
  std::string::basic_string[abi:ne180100]<0>(__p, "brick");
  v3 = (std::__shared_weak_count *)operator new(0x20uLL);
  v3->__shared_owners_ = 0;
  v3->__shared_weak_owners_ = 0;
  v3->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE389E60;
  v3[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE36CA78;
  Espresso::factory_t<Espresso::SerDes::layer_io_base>::register_object((uint64_t)v2, (uint64_t)__p, (uint64_t)&v3[1], (uint64_t)v3);
  nitro::nitro_function::nitro_function(v3);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

uint64_t __44__EspressoBrickRegistry_registerBrickClass___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)registry;
  registry = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.Espresso.registerBrickLock", 0);
  uint64_t v3 = lockQ;
  lockQ = (uint64_t)v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

@end