@interface AudioComponentPrefRegConnection
- (AudioComponentPrefRegConnection)initWithRegistrar:(void *)a3 connection:(id)a4;
- (BOOL)isGenericAppIcon:(id)a3 size:(CGSize)a4 scale:(double)a5;
- (id).cxx_construct;
- (void)clearConfigurationInfoCache:(id)a3;
- (void)copyConfigurationInfoFromCache:(id)a3 reply:(id)a4;
- (void)getComponentUserTags:(id)a3 reply:(id)a4;
- (void)getExtensionComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 reply:(id)a5;
- (void)getExtensionIcon:(id)a3 reply:(id)a4;
- (void)getInterAppIcon:(id)a3 reply:(id)a4;
- (void)setComponentUserTags:(id)a3 tags:(id)a4;
- (void)setExtensionComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 components:(id)a5 reply:(id)a6;
- (void)writeConfigurationInfoToCache:(id)a3 configurationInfo:(id)a4;
@end

@implementation AudioComponentPrefRegConnection

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 6) = -1;
  *((unsigned char *)self + 28) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (void)clearConfigurationInfoCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  CFStringRef v4 = (const __CFString *)[NSString stringWithUTF8String:"com.apple.audio.AudioComponentCache"];
  if (v3 && [(__CFString *)v3 length])
  {
    CFPreferencesSetAppValue(v3, 0, v4);
  }
  else
  {
    CFArrayRef v5 = CFPreferencesCopyKeyList(v4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    CFArrayRef v6 = v5;
    uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v10 + 1) + 8 * v9++), 0, v4);
        }
        while (v7 != v9);
        uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  CFPreferencesAppSynchronize(v4);
}

- (void)writeConfigurationInfoToCache:(id)a3 configurationInfo:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  CFArrayRef v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.audio.AudioComponentCache"];
  [v6 setValue:v5 forKey:v7];
}

- (void)copyConfigurationInfoFromCache:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, void *))a4;
  CFArrayRef v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.audio.AudioComponentCache"];
  id v7 = [v6 dictionaryForKey:v8];
  v5[2](v5, v7);
}

- (void)getInterAppIcon:(id)a3 reply:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (v9)
  {
    objc_msgSend((id)-[objc_class mainScreen](NSClassFromString(&cfstr_Uiscreen.isa), "mainScreen"), "scale");
    id v7 = (UIImage *)(id)[NSClassFromString(&cfstr_Uiimage.isa) _applicationIconImageForBundleIdentifier:v9 format:2 scale:v6];
    id v8 = localUIImagePNGRepresentation(v7);
    v5[2](v5, v8);
  }
  v5[2](v5, 0);
}

- (void)getExtensionIcon:(id)a3 reply:(id)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id ISImageDescriptorClass = getISImageDescriptorClass();
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  id v9 = (id *)getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr;
  uint64_t v38 = getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr;
  if (!getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = ___ZL40getkISImageDescriptorHomeScreenSymbolLocv_block_invoke;
    v33 = &unk_1E5688B80;
    v34 = &v35;
    long long v10 = IconServicesLibrary();
    v36[3] = (uint64_t)dlsym(v10, "kISImageDescriptorHomeScreen");
    getkISImageDescriptorHomeScreenSymbolLoc(void)::ptr = *(void *)(v34[1] + 24);
    id v9 = (id *)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v9)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [NSString stringWithUTF8String:"NSString *getkISImageDescriptorHomeScreen()"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"AudioComponentRegistrar.mm", 630, @"%s", dlerror());

    __break(1u);
  }
  id v11 = *v9;
  long long v12 = [ISImageDescriptorClass imageDescriptorNamed:v11];

  [v12 size];
  double v14 = v13;
  double v16 = v15;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v17 = (void *)getUIScreenClass(void)::softClass;
  uint64_t v38 = getUIScreenClass(void)::softClass;
  if (!getUIScreenClass(void)::softClass)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = ___ZL16getUIScreenClassv_block_invoke;
    v33 = &unk_1E5688B80;
    v34 = &v35;
    ___ZL16getUIScreenClassv_block_invoke((uint64_t)&v30);
    v17 = (void *)v36[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v35, 8);
  v19 = [v18 mainScreen];
  [v19 scale];
  double v21 = v20;

  v22 = (void *)[objc_alloc((Class)getISIconClass()) initWithBundleIdentifier:v6];
  v23 = objc_msgSend(objc_alloc((Class)getISImageDescriptorClass()), "initWithSize:scale:", v14, v16, v21);
  v39[0] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  [v22 prepareImagesForImageDescriptors:v24];

  objc_msgSend(getUIImageClass(), "imageWithCGImage:scale:orientation:", objc_msgSend(v22, "CGImageForDescriptor:", v23), 0, v21);
  v25 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v26 = localUIImagePNGRepresentation(v25);
  if (-[AudioComponentPrefRegConnection isGenericAppIcon:size:scale:](self, "isGenericAppIcon:size:scale:", v26, v14, v16, v21))
  {
    v27 = 0;
  }
  else
  {
    v27 = v26;
  }
  ((void (**)(id, void *))v7)[2](v7, v27);
}

- (BOOL)isGenericAppIcon:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [getISIconClass() genericApplicationIcon];
  long long v10 = objc_msgSend(objc_alloc((Class)getISImageDescriptorClass()), "initWithSize:scale:", width, height, a5);
  v16[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v9 prepareImagesForImageDescriptors:v11];

  objc_msgSend(getUIImageClass(), "imageWithCGImage:scale:orientation:", objc_msgSend(v9, "CGImageForDescriptor:", v10), 0, a5);
  long long v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  double v13 = localUIImagePNGRepresentation(v12);
  char v14 = [v8 isEqualToData:v13];

  return v14;
}

- (void)setComponentUserTags:(id)a3 tags:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  mImpl = self->mImpl;
  id v6 = (NSDictionary *)a3;
  id v7 = a4;
  if (!*mImpl)
  {
    memset(&v12, 0, sizeof(v12));
    dictionaryToComponentDescription(v6, &v12, &v11);
    id v8 = NSString;
    CAX4CCString::CAX4CCString((CAX4CCString *)v15, v12.componentType);
    CAX4CCString::CAX4CCString((CAX4CCString *)v14, v12.componentSubType);
    CAX4CCString::CAX4CCString((CAX4CCString *)v13, v12.componentManufacturer);
    id v9 = objc_msgSend(v8, "stringWithFormat:", @"2-%s-%s-%s", v15, v14, v13);
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.audio.UserComponentTags"];
    [v10 setObject:v7 forKey:v9];
    [v10 synchronize];
  }
}

- (void)getComponentUserTags:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v26 = (void (**)(id, id))a4;
  mImpl = self->mImpl;
  id v7 = (NSDictionary *)a3;
  id v8 = v7;
  if (*mImpl)
  {
    id v9 = 0;
  }
  else
  {
    memset(&v28, 0, sizeof(v28));
    unsigned int v27 = 0;
    dictionaryToComponentDescription(v7, &v28, &v27);
    long long v10 = NSString;
    OSType componentType = v28.componentType;
    CAX4CCString::CAX4CCString((CAX4CCString *)&v33, v28.componentType);
    OSType componentSubType = v28.componentSubType;
    CAX4CCString::CAX4CCString((CAX4CCString *)&v31, v28.componentSubType);
    OSType componentManufacturer = v28.componentManufacturer;
    CAX4CCString::CAX4CCString((CAX4CCString *)&v29, v28.componentManufacturer);
    char v14 = objc_msgSend(v10, "stringWithFormat:", @"2-%s-%s-%s", &v33, &v31, &v29);
    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.audio.UserComponentTags"];
    [v15 synchronize];
    uint64_t v16 = [v15 objectForKey:v14];
    double v20 = v16;
    if (v16)
    {
      id v9 = v16;
    }
    else
    {
      v17.i32[0] = componentType;
      *(int8x8_t *)v17.i8 = vzip1_s8(*(int8x8_t *)v17.i8, *(int8x8_t *)v17.i8);
      v18.i32[0] = componentSubType;
      int16x4_t v21 = (int16x4_t)vzip1_s8(v18, *(int8x8_t *)v17.i8);
      v19.i32[0] = componentManufacturer;
      int16x4_t v22 = (int16x4_t)vzip1_s8(v19, *(int8x8_t *)v17.i8);
      *(int16x4_t *)v17.i8 = vrev64_s16(*(int16x4_t *)v17.i8);
      unsigned __int32 v33 = vmovn_s16(v17).u32[0];
      char v34 = 0;
      *(int16x4_t *)v17.i8 = vrev64_s16(v21);
      unsigned __int32 v31 = vmovn_s16(v17).u32[0];
      char v32 = 0;
      *(int16x4_t *)v17.i8 = vrev64_s16(v22);
      unsigned __int32 v29 = vmovn_s16(v17).u32[0];
      char v30 = 0;
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"1-'%s'-'%s'-'%s'-0x%X", &v33, &v31, &v29, v27);
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.audio.ComponentTagHelper"];
      [v24 synchronize];
      id v9 = [v24 objectForKey:v23];
      if (v9)
      {
        [v15 setObject:v9 forKey:v14];
        [v15 synchronize];
        id v25 = v9;
      }
    }
  }

  v26[2](v26, v9);
}

- (void)getExtensionComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 reply:(id)a5
{
  self->mConnInfo.mLinkedSDKRequiresEntitlement = a4;
  mImpl = (os_unfair_lock_t *)self->mImpl;
  AudioComponentDescription v12 = (NSString *)a3;
  id v8 = (void (**)(id, void *))a5;
  int mExtUsePermission = self->mConnInfo.mExtUsePermission;
  if (mExtUsePermission == -1)
  {
    int mExtUsePermission = ConnectionInfo::_canUseExtensions(&self->mConnInfo);
    self->mConnInfo.int mExtUsePermission = mExtUsePermission;
  }
  if (mExtUsePermission == 1 && (long long v10 = mImpl[32]) != 0)
  {
    os_unfair_lock_lock(mImpl[32]);
    unsigned int v11 = AUExtensionScanner::getExtensionComponentList((AUExtensionScanner *)&v10[2], v12);
    os_unfair_lock_unlock(v10);
  }
  else
  {
    unsigned int v11 = 0;
  }
  v8[2](v8, v11);
}

- (void)setExtensionComponentList:(id)a3 linkedSDKRequiresEntitlement:(BOOL)a4 components:(id)a5 reply:(id)a6
{
  self->mConnInfo.mLinkedSDKRequiresEntitlement = a4;
  mImpl = (AudioComponentRegistrarImpl *)self->mImpl;
  id v10 = a3;
  id v11 = a5;
  AudioComponentDescription v12 = (void (**)(id, uint64_t))a6;
  int mExtUsePermission = self->mConnInfo.mExtUsePermission;
  if (mExtUsePermission == -1)
  {
    int mExtUsePermission = ConnectionInfo::_canUseExtensions(&self->mConnInfo);
    self->mConnInfo.int mExtUsePermission = mExtUsePermission;
  }
  uint64_t v14 = 4294900548;
  if (mExtUsePermission == 1)
  {
    uint64_t v15 = *((void *)mImpl + 32);
    if (v15)
    {
      memset(&v28, 0, 24);
      v28.mSorted = 1;
      memset(&v27, 0, 24);
      v27.mSorted = 1;
      os_unfair_lock_lock((os_unfair_lock_t)v15);
      uint64_t v16 = (NSString *)v10;
      id v17 = v11;
      Extension = AUExtensionScanner::findExtension((AUExtensionScanner *)(v15 + 8), v16);
      if (*(id **)(v15 + 144) == Extension)
      {
        uint64_t v14 = 4294900552;
      }
      else
      {
        id v25 = v17;
        v26 = v16;
        int8x8_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.audio.ComponentRegistrationOverrides"];
        [v19 setObject:v17 forKey:v16];
        [v19 synchronize];
        double v20 = (AudioComponentVector *)Extension[2];
        int16x4_t v21 = (std::__shared_weak_count *)Extension[3];
        if (v21) {
          atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        AUExtensionScanner::componentsForExtension((AUExtensionScanner *)&v30, (NSExtension *)(v15 + 8), *Extension);
        int16x4_t v22 = v30;
        v23 = v31;
        if (v31) {
          atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v24 = (std::__shared_weak_count *)Extension[3];
        Extension[2] = v22;
        Extension[3] = v23;
        if (v24)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
          int16x4_t v22 = v30;
        }
        AudioComponentVector::subtract(&v29, v20, v22);
        std::vector<std::shared_ptr<APComponent>>::__vdeallocate((uint64_t *)&v27);
        AudioComponentVector v27 = v29;
        memset(&v29, 0, 24);
        char v32 = &v29;
        std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
        AudioComponentVector::subtract(&v29, v30, v20);
        std::vector<std::shared_ptr<APComponent>>::__vdeallocate((uint64_t *)&v28);
        AudioComponentVector v28 = v29;
        memset(&v29, 0, 24);
        char v32 = &v29;
        std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v32);
        uint64_t v16 = v26;
        if (v31) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v31);
        }
        if (v21) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v21);
        }

        uint64_t v14 = 0;
        id v17 = v25;
      }

      os_unfair_lock_unlock((os_unfair_lock_t)v15);
      AudioComponentRegistrarImpl::addRemoveComponents(mImpl, &v28, &v27);
      v29.__begin_ = &v27;
      std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
      v29.__begin_ = &v28;
      std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
    }
    else
    {
      uint64_t v14 = 4294967292;
    }
  }
  v12[2](v12, v14);
}

- (AudioComponentPrefRegConnection)initWithRegistrar:(void *)a3 connection:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AudioComponentPrefRegConnection;
  id v7 = [(AudioComponentPrefRegConnection *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    v7->mImpl = a3;
    objc_storeWeak((id *)&v7->mConnInfo.mConnection, v6);
  }

  return v8;
}

@end