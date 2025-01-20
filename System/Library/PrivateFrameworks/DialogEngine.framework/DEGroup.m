@interface DEGroup
- (DEGroup)init;
- (DEGroup)initWithSharedPtr:(shared_ptr<siri::dialogengine::Group>)a3;
- (id)getNodes;
- (void)dealloc;
@end

@implementation DEGroup

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DEGroup;
  [(DEGroup *)&v2 dealloc];
}

- (id)getNodes
{
  [(DENode *)self This];
  v15 = 0;
  uint64_t v16 = 0;
  v14 = 0;
  std::vector<std::shared_ptr<siri::dialogengine::Node>>::__init_with_size[abi:ne180100]<std::shared_ptr<siri::dialogengine::Node>*,std::shared_ptr<siri::dialogengine::Node>*>(&v14, v12[26], v12[27], ((unsigned char *)v12[27] - (unsigned char *)v12[26]) >> 4);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  objc_super v2 = objc_opt_new();
  v3 = v14;
  for (i = v15; v3 != i; v3 += 2)
  {
    uint64_t v6 = *v3;
    v5 = (std::__shared_weak_count *)v3[1];
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v7 = [DENode alloc];
    uint64_t v10 = v6;
    v11 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v8 = [(DENode *)v7 initWithSharedPtr:&v10];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    [v2 addObject:v8];

    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  v12 = (void **)&v14;
  std::vector<std::shared_ptr<siri::dialogengine::PatternSchemaComponent>>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v2;
}

- (DEGroup)initWithSharedPtr:(shared_ptr<siri::dialogengine::Group>)a3
{
  var0 = a3.var0;
  v10.receiver = self;
  v10.super_class = (Class)DEGroup;
  v4 = [(DENode *)&v10 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v8 = *(void *)var0;
    v9 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(DENode *)v4 setThis:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  return v5;
}

- (DEGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)DEGroup;
  return [(DENode *)&v3 init];
}

@end