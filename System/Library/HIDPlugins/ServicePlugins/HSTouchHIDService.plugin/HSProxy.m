@interface HSProxy
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (Class)hsProxyClass;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hsProxyAlive;
- (BOOL)hsProxyAsync;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (id).cxx_construct;
@end

@implementation HSProxy

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  if (!a3)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v6 handleFailureInMethod:a2, a1, @"HSRemoteObject.mm", 744, @"Invalid parameter not satisfying: %@", @"sel" object file lineNumber description];
  }
  Name = sel_getName(a3);
  if (Name)
  {
    unint64_t v8 = 0;
    for (uint64_t i = 0; Name[i]; ++i)
    {
      if (Name[i] == 58) {
        ++v8;
      }
    }
    strcpy(types, "@@:@@@@@@@@@@@@");
    if (v8 < 0xD)
    {
      types[v8 + 3] = 0;
      cls = (objc_class *)objc_opt_class();
      imp = (void (*)(void))getProxyFn(v8);
      return class_addMethod(cls, a3, imp, types);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 0;
  }
}

+ (Class)hsProxyClass
{
  return result;
}

- (BOOL)hsProxyAlive
{
  v4[3] = self;
  v4[2] = a2;
  std::weak_ptr<HSMapper>::lock((uint64_t)&self->mapper, v4);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v4))
  {
    v2 = (HSMapper *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v4);
    BOOL v5 = HSMapper::alive(v2);
  }
  else
  {
    BOOL v5 = 0;
  }
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
  return v5;
}

- (BOOL)hsProxyAsync
{
  v4[3] = self;
  v4[2] = a2;
  std::weak_ptr<HSMapper>::lock((uint64_t)&self->mapper, v4);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v4))
  {
    v2 = (HSMapper *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v4);
    char v5 = HSMapper::async(v2) & 1;
  }
  else
  {
    char v5 = 0;
  }
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
  return v5 & 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v10 = self;
  SEL v9 = a2;
  Class v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HSProxy;
  if ([(HSProxy *)&v7 isKindOfClass:a3])
  {
    char v11 = 1;
  }
  else
  {
    v4 = v10;
    char v5 = NSStringFromClass(v8);
    id location = proxyFn1(v4, (objc_selector *)"HSProxy_isKindOfClass:", v5);

    if (location) {
      char v11 = [location BOOLValue] & 1;
    }
    else {
      char v11 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  return v11 & 1;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v10 = self;
  SEL v9 = a2;
  SEL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HSProxy;
  if ([(HSProxy *)&v7 respondsToSelector:a3])
  {
    char v11 = 1;
  }
  else
  {
    v4 = v10;
    char v5 = NSStringFromSelector(v8);
    id location = proxyFn1(v4, (objc_selector *)"HSProxy_respondsToSelector:", v5);

    if (location) {
      char v11 = [location BOOLValue] & 1;
    }
    else {
      char v11 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  return v11 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)HSProxy;
  if ([(HSProxy *)&v8 conformsToProtocol:location[0]])
  {
    char v11 = 1;
    int v7 = 1;
  }
  else
  {
    char v5 = v10;
    v4 = NSStringFromProtocol((Protocol *)location[0]);
    id v6 = proxyFn1(v5, (objc_selector *)"HSProxy_conformsToProtocol:", v4);

    if (v6) {
      char v11 = [v6 BOOLValue] & 1;
    }
    else {
      char v11 = 0;
    }
    int v7 = 1;
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end