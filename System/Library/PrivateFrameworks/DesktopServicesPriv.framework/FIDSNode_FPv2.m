@interface FIDSNode_FPv2
+ (id)makeWithCoder:(id)a3;
+ (uint64_t)makeWithCoder:(uint64_t)a1;
- (id)shortDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FIDSNode_FPv2

- (id)shortDescription
{
  v3 = [(FIDSNode *)self fpItem];
  v8.receiver = self;
  v8.super_class = (Class)FIDSNode_FPv2;
  v4 = [(FIDSNode *)&v8 shortDescription];
  v5 = objc_msgSend(v4, "stringByAppendingFormat:", @" -- fpItem: %p", v3);

  if ([v3 isPlaceholder])
  {
    uint64_t v6 = [v5 stringByAppendingString:@", placeholder"];

    v5 = (void *)v6;
  }

  return v5;
}

+ (id)makeWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FI FPv2 FPItem"];
  v5 = static_objc_cast<NSString,objc_object * {__strong}>(v4);

  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"FI FPv2 Domain"];
  v7 = static_objc_cast<NSString,objc_object * {__strong}>(v6);

  if (!v5 || !v7) {
    goto LABEL_8;
  }
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v9 = (std::__shared_weak_count *)operator new(0x20uLL);
  v9->__shared_weak_owners_ = 0;
  v9->__shared_owners_ = 0;
  v9[1].__vftable = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2ABD2C0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3321888768;
  v20[2] = __31__FIDSNode_FPv2_makeWithCoder___block_invoke;
  v20[3] = &__block_descriptor_72_ea8_32c44_ZTSKZ31__FIDSNode_FPv2_makeWithCoder__E3__0_e28_v24__0__FINode_8__NSError_16l;
  v17 = v8;
  uint64_t v10 = 1;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  id v18 = v5;
  id v19 = v7;
  v11 = v17;
  v21 = v11;
  v22 = v9 + 1;
  v23 = v9;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  id v12 = v18;
  id v24 = v12;
  id v13 = v19;
  id v25 = v13;
  +[FINode fiNodeFromItem:v12 inFPv2Domain:v13 completion:v20];

  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  dispatch_time_t v14 = dispatch_time(0, 3000000000);
  intptr_t v15 = dispatch_semaphore_wait(v11, v14);
  if (!v15) {
    uint64_t v10 = v9[1].__vftable;
  }

  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }

  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  if (v15) {
LABEL_8:
  }
    uint64_t v10 = 0;

  return (id)v10;
}

+ (uint64_t)makeWithCoder:(uint64_t)a1
{
  v2 = *(std::__shared_weak_count **)(a1 + 16);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FIDSNode_FPv2;
  [(FIDSNode *)&v7 encodeWithCoder:v4];
  v5 = [(FIDSNode *)self fpItem];
  [v4 encodeObject:v5 forKey:@"FI FPv2 FPItem"];
  uint64_t v6 = [(FIDSNode *)self fpDomain];
  [v4 encodeObject:v6 forKey:@"FI FPv2 Domain"];
}

@end