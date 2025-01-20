@interface PluginBackendXPC
+ (BOOL)supportsSecureCoding;
- (DIURL)URL;
- (PluginBackendXPC)initWithCoder:(id)a3;
- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4;
- (const)pluginHeader;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PluginBackendXPC

- (PluginBackendXPC)initWithURL:(id)a3 openMode:(int)a4
{
  id v7 = a3;
  unsigned int v22 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PluginBackendXPC;
  v8 = [(PluginBackendXPC *)&v21 init];
  if (v8)
  {
    id v9 = [v7 pluginName];
    v10 = (char *)[v9 UTF8String];

    v20 = v10;
    if (!v10)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &unk_26CF39EE0;
      v14 = std::generic_category();
      exception[1] = 22;
      exception[2] = v14;
      *((unsigned char *)exception + 24) = 0;
      *((unsigned char *)exception + 48) = 0;
      exception[7] = "Invalid plugin URL, plugin name is missing";
    }
    v11 = [v7 pluginParams];
    v17 = v11;
    std::allocate_shared[abi:ne180100]<plugin_header,std::allocator<plugin_header>,char const*&,__CFDictionary const*,int &,void>(&v20, (uint64_t *)&v17, &v22, &v18);

    std::allocate_shared[abi:ne180100]<BackendPlugin,std::allocator<BackendPlugin>,std::shared_ptr<plugin_header> &,void>(&v18, &v15);
    long long v16 = v15;
    long long v15 = 0uLL;
    -[BackendXPC setBackend:](v8, "setBackend:", &v16, 0);
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*((void *)&v15 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
    }
    objc_storeStrong((id *)&v8->_URL, a3);
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }

  return v8;
}

- (PluginBackendXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PluginBackendXPC;
  v5 = [(BackendXPC *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (DIURL *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"encodedDict"];

    long long v23 = xmmword_26CF20F30;
    v24 = off_26CF20F40;
    id v14 = [(DIURL *)v5->_URL pluginName];
    uint64_t v19 = 0;
    v20 = (char *)[v14 UTF8String];
    uint64_t v18 = v13;
    std::allocate_shared[abi:ne180100]<plugin_header,std::allocator<plugin_header>,char const*,decltype(nullptr),std::nullopt_t const&,diskimage_decode_fn_t &,void *,void>(&v20, (uint64_t)&v19, (uint64_t)&std::nullopt, (uint64_t)&v23, &v18, &v21);

    std::allocate_shared[abi:ne180100]<BackendPlugin,std::allocator<BackendPlugin>,std::shared_ptr<plugin_header> &,void>(&v21, &v16);
    long long v17 = v16;
    long long v16 = 0uLL;
    [(BackendXPC *)v5 setBackend:&v17];
    if (*((void *)&v17 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
    }
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PluginBackendXPC;
  [(BackendXPC *)&v7 encodeWithCoder:v4];
  v5 = [(PluginBackendXPC *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  (*(void (**)(void))(*(void *)[(PluginBackendXPC *)self pluginHeader] + 64))();
  if ([v6 count]) {
    [v4 encodeObject:v6 forKey:@"encodedDict"];
  }
}

- (const)pluginHeader
{
  [(BackendXPC *)self backend];
  v2 = *(const void **)(v4 + 24);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end