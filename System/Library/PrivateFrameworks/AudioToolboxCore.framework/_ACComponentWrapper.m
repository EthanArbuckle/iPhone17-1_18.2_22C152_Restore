@interface _ACComponentWrapper
+ (BOOL)supportsSecureCoding;
- (_ACComponentWrapper)initWithCoder:(id)a3;
- (_ACComponentWrapper)initWithComponent:(void *)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ACComponentWrapper

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  cntrl = self->mComponent.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (_ACComponentWrapper)initWithComponent:(void *)a3
{
  v5 = *(APComponent **)a3;
  uint64_t v4 = *((void *)a3 + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->mComponent.__cntrl_;
  self->mComponent.__ptr_ = v5;
  self->mComponent.__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ptr = self->mComponent.__ptr_;
  id v11 = v4;
  [v4 encodeInt:*((unsigned int *)ptr + 8) forKey:@"implType"];
  [v11 encodeInt:*((unsigned int *)ptr + 15) forKey:@"priority"];
  [v11 encodeInt32:*((unsigned int *)ptr + 9) forKey:@"type"];
  [v11 encodeInt32:*((unsigned int *)ptr + 10) forKey:@"subType"];
  [v11 encodeInt32:*((unsigned int *)ptr + 11) forKey:@"manufacturer"];
  [v11 encodeInt32:*((unsigned int *)ptr + 12) forKey:@"flags"];
  [v11 encodeInt32:*((unsigned int *)ptr + 14) forKey:@"version"];
  APComponent::name((APComponent *)&v12, *((const void **)ptr + 8));
  v6 = v12;
  [v11 encodeObject:v12 forKey:@"name"];
  if (v6) {
    CFRelease(v6);
  }
  [v11 encodeObject:*((void *)ptr + 15) forKey:@"tags"];
  [v11 encodeInt:*((unsigned __int8 *)ptr + 128) forKey:@"validated"];
  [v11 encodeInt:*((unsigned int *)ptr + 33) forKey:@"validationResult"];
  uint64_t v7 = (*(uint64_t (**)(APComponent *))(*(void *)ptr + 80))(ptr);
  v8 = (void *)v7;
  if (v7)
  {
    [v11 encodeObject:*(void *)(v7 + 160) forKey:@"bundlePath"];
    [v11 encodeObject:v8[21] forKey:@"archs"];
    [v11 encodeObject:v8[22] forKey:@"factoryFunctionName"];
    [v11 encodeObject:v8[23] forKey:@"className"];
  }
  uint64_t v9 = (*(uint64_t (**)(APComponent *))(*(void *)ptr + 64))(ptr);
  v10 = v11;
  if (v9)
  {
    [v11 encodeObject:*(void *)(v9 + 160) forKey:@"extensionIdentifier"];
    [v11 encodeObject:*(void *)(v9 + 192) forKey:@"factoryFunctionName"];
    v10 = v11;
  }
}

- (_ACComponentWrapper)initWithCoder:(id)a3
{
  id v3 = a3;
  int v4 = [v3 decodeIntForKey:@"implType"];
  [v3 decodeIntForKey:@"priority"];
  v34[0] = [v3 decodeInt32ForKey:@"type"];
  v34[1] = [v3 decodeInt32ForKey:@"subType"];
  v34[2] = [v3 decodeInt32ForKey:@"manufacturer"];
  int v35 = [v3 decodeInt32ForKey:@"flags"];
  int v36 = 0;
  int v5 = [v3 decodeInt32ForKey:@"version"];
  {
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    -[_ACComponentWrapper initWithCoder:]::arrayOfString = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  }
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v33, v7);

  id v8 = [v3 decodeObjectOfClasses:-[_ACComponentWrapper initWithCoder:]::arrayOfString forKey:@"tags"];
  uint64_t v9 = v8;
  if (v8) {
    CFRetain(v8);
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v32, v9);

  [v3 decodeIntForKey:@"wasValidated"];
  [v3 decodeIntForKey:@"validationResult"];
  if (v4 != 1)
  {
    if (v4 == 3)
    {
      v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentifier"];
      id v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"factoryFunctionName"];
      v12 = v11;
      if (v11) {
        CFRetain(v11);
      }
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v12);

      v26 = 0;
      AudioComponentRegistrationInfo::AudioComponentRegistrationInfo((uint64_t)v27, (uint64_t)v34, v35, &v33, v5, &cf, &v26, &v32);
      APComponent_NSExtension::create_shared((APComponent_NSExtension *)&v26, (const AudioComponentRegistrationInfo *)v27, v10, 0);
    }
    __assert_rtn("-[_ACComponentWrapper initWithCoder:]", "AudioComponentVector.mm", 287, "0");
  }
  {
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    -[_ACComponentWrapper initWithCoder:]::arrayOfNumber = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  }
  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];
  v14 = v13;
  if (v13) {
    CFRetain(v13);
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&cf, v14);

  id v15 = [v3 decodeObjectOfClasses:-[_ACComponentWrapper initWithCoder:]::arrayOfNumber forKey:@"archs"];
  v16 = v15;
  if (v15) {
    CFRetain(v15);
  }
  applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v30, v16);

  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"factoryFunctionName"];
  v18 = v17;
  if (v17) {
    CFRetain(v17);
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v29, v18);

  id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
  v20 = v19;
  if (v19) {
    CFRetain(v19);
  }
  applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v28, v20);

  AudioComponentRegistrationInfo::AudioComponentRegistrationInfo((uint64_t)v27, (uint64_t)v34, v35, &v33, v5, &v29, &v28, &v32);
  APComponent_FromBundle_Loadable::create_shared();
}

@end