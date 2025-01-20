@interface _ACPluginDBBundle
+ (BOOL)supportsSecureCoding;
- (_ACPluginDBBundle)initWithCoder:(id)a3;
- (_ACPluginDBBundle)initWithPath:(id)a3 infoPlistModDate:(double)a4 rsrcModDate:(double)a5;
- (__n128)scanWithPriority:loadable:infoPlistPath:;
- (id).cxx_construct;
- (uint64_t)scanWithPriority:loadable:infoPlistPath:;
- (void)encodeWithCoder:(id)a3;
- (void)loadAllComponents:(void *)a3;
- (void)scanWithPriority:(int)a3 loadable:(BOOL)a4 infoPlistPath:(id)a5;
- (void)scanWithPriority:loadable:infoPlistPath:;
@end

@implementation _ACPluginDBBundle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 56) = 1;
  return self;
}

- (void).cxx_destruct
{
  p_mBundleComponentVector = &self->mBundleComponentVector;
  std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mBundleComponentVector);
  objc_storeStrong((id *)&self->mFullPath, 0);
}

- (void)scanWithPriority:(int)a3 loadable:(BOOL)a4 infoPlistPath:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v33 = self;
  int v32 = a3;
  BOOL v31 = a4;
  id v6 = a5;
  std::vector<std::shared_ptr<CA::ADMPackFormat>>::__clear[abi:ne180100]((uint64_t *)&self->mBundleComponentVector);
  self->mBundleComponentVector.mSorted = 1;
  v7 = (void *)MEMORY[0x1E4F1C9E8];
  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
  id v30 = 0;
  v9 = [v7 dictionaryWithContentsOfURL:v8 error:&v30];
  id v10 = v30;

  if (v10)
  {
    if (!gAudioComponentLogCategory) {
      operator new();
    }
    v16 = *(id *)gAudioComponentLogCategory;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)cf = 136315906;
      *(void *)&cf[4] = "AudioComponentPluginScanner.mm";
      __int16 v37 = 1024;
      int v38 = 167;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = v10;
      _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Can't read %@ error: %@", cf, 0x26u);
    }
  }
  else
  {
    v11 = [v9 objectForKeyedSubscript:@"AudioComponents"];
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F1C978] array];
      v13 = v12;
      if (v12) {
        CFRetain(v12);
      }
      applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)cf, v13);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v11;
        CFRetain(v14);
        applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v29, v14);

        v15 = *(const void **)cf;
        *(void *)cf = v29;
        CFTypeRef v29 = v15;
        if (v15) {
          CFRelease(v15);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v11, 0);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18) {
            CFRetain(v18);
          }
          applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v29, v19);

          v20 = *(const void **)cf;
          *(void *)cf = v29;
          CFTypeRef v29 = v20;
          if (v20) {
            CFRelease(v20);
          }
        }
      }
      v21 = self->mFullPath;
      v22 = v21;
      if (v21) {
        CFRetain(v21);
      }
      applesauce::CF::StringRef::StringRef((applesauce::CF::StringRef *)&v29, v22);

      v23 = [MEMORY[0x1E4F28B50] bundleWithPath:self->mFullPath];
      id v24 = [v23 executableArchitectures];
      v25 = v24;
      if (v24) {
        CFRetain(v24);
      }
      applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&v28, v25);

      CFTypeRef v26 = v29;
      v35 = 0;
      v27 = operator new(0x30uLL);
      void *v27 = &unk_1EDF9E710;
      v27[1] = &v31;
      v27[2] = &v32;
      v27[3] = &v29;
      v27[4] = &v28;
      v27[5] = &v33;
      v35 = v27;
      AudioComponentRegistrationInfo::parseInfoPlistArray(0, (uint64_t)v26, (CFArrayRef *)cf, (uint64_t)v34);
      std::__function::__value_func<void ()(AudioComponentRegistrationInfo &)>::~__value_func[abi:ne180100](v34);
      if (v28) {
        CFRelease(v28);
      }

      if (v29) {
        CFRelease(v29);
      }
      if (*(void *)cf) {
        CFRelease(*(CFTypeRef *)cf);
      }
    }
  }
}

- (uint64_t)scanWithPriority:loadable:infoPlistPath:
{
  if (*(_OWORD *)(a2 + 40) != 0)
  {
    if (**(unsigned char **)(result + 8)) {
      APComponent_FromBundle_Loadable::create_shared();
    }
    operator new();
  }
  return result;
}

- (__n128)scanWithPriority:loadable:infoPlistPath:
{
  v2 = (char *)operator new(0x30uLL);
  *(void *)v2 = &unk_1EDF9E710;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((void *)v2 + 5) = *(void *)(a1 + 40);
  return result;
}

- (void)scanWithPriority:loadable:infoPlistPath:
{
}

- (void)loadAllComponents:(void *)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->mFullPath forKey:@"path"];
  [v5 encodeDouble:@"infoPlistModDate" forKey:self->mInfoPlistModDate];
  v4 = [[_ACComponentVector alloc] initWithVector:&self->mBundleComponentVector];
  [v5 encodeObject:v4 forKey:@"components"];
}

- (_ACPluginDBBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
  mFullPath = self->mFullPath;
  self->mFullPath = v5;

  [v4 decodeDoubleForKey:@"infoPlistModDate"];
  self->mInfoPlistModDate = v7;
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"components"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (&self->mBundleComponentVector != (AudioComponentVector *)(v8 + 8)) {
      std::vector<std::shared_ptr<APComponent>>::__assign_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>((uint64_t *)&self->mBundleComponentVector, *(uint64_t **)(v8 + 8), *(uint64_t **)(v8 + 16), (uint64_t)(*(void *)(v8 + 16) - *(void *)(v8 + 8)) >> 4);
    }
    self->mBundleComponentVector.mSorted = *(unsigned char *)(v8 + 32);
  }

  return self;
}

- (_ACPluginDBBundle)initWithPath:(id)a3 infoPlistModDate:(double)a4 rsrcModDate:(double)a5
{
  self->mInfoPlistModDate = a4;
  self->mRsrcModDate = a5;
  return self;
}

@end