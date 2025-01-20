@interface SCNMTLLibraryManager
+ (id)hashCodeForSource:(id)a3 macros:(id)a4;
- (SCNMTLLibraryManager)initWithDevice:(id)a3;
- (id)commonProfileCacheLibrary;
- (id)defaultLibrary;
- (id)device;
- (id)deviceQueue;
- (id)frameworkLibrary;
- (id)libraryForFile:(id)a3;
- (id)libraryForSourceCode:(id)a3 options:(id)a4;
- (id)shaderCompilationGroup;
- (void)_setEngineStats:(__C3DEngineStats *)a3;
- (void)clearCompiledLibraries;
- (void)dealloc;
- (void)libraryForProgramDesc:(id *)a3 completionHandler:(id)a4;
- (void)waitForShadersCompilation;
@end

@implementation SCNMTLLibraryManager

- (void)waitForShadersCompilation
{
}

+ (id)hashCodeForSource:(id)a3 macros:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CC_SHA256_Init(&c);
  CFStringUpdateHash((uint64_t)a3);
  v6 = objc_msgSend((id)objc_msgSend(a4, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v12 = (void *)[a4 objectForKeyedSubscript:v11];
        CFStringUpdateHash(v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFStringUpdateHash((uint64_t)v12);
        }
        else
        {
          data[0] = 0;
          data[0] = [v12 hash];
          CC_SHA256_Update(&c, data, 8u);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
  CC_SHA256_Final(md, &c);
  uint64_t v13 = 0;
  v14 = (char *)data;
  v15.i64[0] = 0xA0A0A0A0A0A0A0A0;
  v15.i64[1] = 0xA0A0A0A0A0A0A0A0;
  v16.i64[0] = 0x3737373737373737;
  v16.i64[1] = 0x3737373737373737;
  v17.i64[0] = 0x3030303030303030;
  v17.i64[1] = 0x3030303030303030;
  v18.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v18.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v19.i64[0] = 0xA0A0A0A0A0A0A0ALL;
  v19.i64[1] = 0xA0A0A0A0A0A0A0ALL;
  do
  {
    int8x16_t v20 = *(int8x16_t *)&md[v13];
    v33.val[0] = (int8x16_t)vsraq_n_u8((uint8x16_t)vbslq_s8((int8x16_t)vcgtq_u8(v15, (uint8x16_t)v20), v17, v16), (uint8x16_t)v20, 4uLL);
    int8x16_t v21 = vandq_s8(v20, v18);
    v33.val[1] = vaddq_s8(vbslq_s8((int8x16_t)vcgtq_u8(v19, (uint8x16_t)v21), v17, v16), v21);
    vst2q_s8(v14, v33);
    v14 += 32;
    v13 += 16;
  }
  while (v13 != 32);
  char v29 = 0;
  return (id)[NSString stringWithCString:data encoding:1];
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2_55(uint64_t a1)
{
  *(CFTimeInterval *)(*(void *)(*(void *)(a1 + 32) + 32) + 288) = CACurrentMediaTime()
                                                                        - *(double *)(a1 + 64)
                                                                        + *(double *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 32)
                                                                                    + 288);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);

  dispatch_group_leave(v2);
}

uint64_t __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_49(uint64_t a1, const void *a2, void *a3)
{
  if (a3)
  {
    v6 = *(void **)(a1 + 152);
    if (v6) {
      [v6 setObject:a3 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  if (a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 104));
    if (!CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a1 + 40) + 96), *(const void **)(a1 + 48))) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 40) + 96), *(const void **)(a1 + 48), a2);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 104));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 184);
    if (v7
      && (uint64_t Callbacks = C3DFXProgramDelegateGetCallbacks(v7)) != 0
      && (uint64_t v9 = *(void (**)(void, void *, uint64_t))(Callbacks + 16)) != 0)
    {
      uint64_t UserInfo = C3DFXProgramDelegateGetUserInfo(*(void *)(a1 + 184));
      v9(0, a3, UserInfo);
    }
    else
    {
      uint64_t v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_49_cold_1(a3, v11);
      }
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x2020000000;
      int v16 = 0;
      v12 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_50;
      v14[3] = &unk_264008180;
      v14[4] = v15;
      [v12 enumerateLinesUsingBlock:v14];
      _Block_object_dispose(v15, 8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  return kdebug_trace();
}

- (id)shaderCompilationGroup
{
  return self->_shaderCompilationGroup;
}

- (void)libraryForProgramDesc:(id *)a3 completionHandler:(id)a4
{
  if (a3->var0)
  {
    uint64_t TypeID = C3DFXMetalProgramGetTypeID();
    if (TypeID == CFGetTypeID(a3->var0))
    {
      var0 = a3->var0;
      uint64_t LibraryProviderBlock = C3DFXMetalProgramGetLibraryProviderBlock(&a3->var0->var0.var0.var0.var0);
      if (!LibraryProviderBlock
        || (v10 = (MTLLibrary *)(*(uint64_t (**)(uint64_t, MTLDevice *))(LibraryProviderBlock + 16))(LibraryProviderBlock, self->_device)) == 0)
      {
        uint64_t SourceCode = C3DFXMetalProgramGetSourceCode(var0);
        if (SourceCode)
        {
          uint64_t v12 = SourceCode;
          uint64_t PreprocessorsMacros = C3DFXMetalProgramGetPreprocessorsMacros(var0);
          id v14 = +[SCNMTLLibraryManager hashCodeForSource:v12 macros:PreprocessorsMacros];
          os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
          Value = (MTLLibrary *)CFDictionaryGetValue(self->_availableCompiledLibraries, v14);
          os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
          if (Value)
          {
            int v16 = (void (*)(id, MTLLibrary *, void))*((void *)a4 + 2);
            id v17 = a4;
            commonProfileCacheLibrary = Value;
LABEL_19:
            v16(v17, commonProfileCacheLibrary, 0);
            return;
          }
          BOOL v20 = C3DShouldCollectGeneratedShaders();
          NSUInteger v21 = [(NSDictionary *)self->_commonProfilePrecompiledFunctions count];
          if (!v21 && !v20)
          {
LABEL_34:
            uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)var0);
            unint64_t v28 = SCNMetalLanguageVersion();
            unsigned int LanguageVersion = C3DFXMetalProgramGetLanguageVersion((unsigned int *)var0);
            if (v28 <= LanguageVersion) {
              unint64_t v30 = LanguageVersion;
            }
            else {
              unint64_t v30 = v28;
            }
            id v31 = objc_alloc_init(MEMORY[0x263F12838]);
            [v31 setPreprocessorMacros:PreprocessorsMacros];
            [v31 setLanguageVersion:v30];
            [v31 setAdditionalCompilerArguments:@" -w "];
            kdebug_trace();
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v49 = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_49;
            v50 = &unk_2640081A8;
            long long v32 = *(_OWORD *)&a3->var13;
            long long v59 = *(_OWORD *)&a3->var11;
            long long v60 = v32;
            $A49D611864553F0D08D037E9411B91D8 var16 = a3->var16;
            unint64_t var17 = a3->var17;
            long long v34 = *(_OWORD *)&a3->var2;
            long long v55 = *(_OWORD *)&a3->var0;
            long long v56 = v34;
            long long v35 = *(_OWORD *)&a3->var6;
            long long v57 = *(_OWORD *)&a3->var4;
            long long v58 = v35;
            unint64_t v62 = var17;
            uint64_t v63 = OverrideMaterial;
            uint64_t v51 = v12;
            v52 = self;
            id v53 = v14;
            id v54 = a4;
            int v64 = (int)var0;
            ++self->__engineStats->onlineShaderCount;
            double v36 = CACurrentMediaTime();
            int var14 = a3->var14;
            p_int var14 = &a3->var14;
            int v37 = var14;
            if (var14)
            {
              if (v37 == 2)
              {
                device = self->_device;
                v46[0] = MEMORY[0x263EF8330];
                v46[1] = 3221225472;
                v46[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_56;
                v46[3] = &unk_264008248;
                v46[4] = self;
                v46[5] = v48;
                v41 = v46;
              }
              else
              {
                if (v37 != 1)
                {
                  v43 = scn_default_log();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                    -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:](p_var14, v43);
                  }
                  goto LABEL_46;
                }
                dispatch_group_enter((dispatch_group_t)self->_shaderCompilationGroup);
                device = self->_device;
                v47[0] = MEMORY[0x263EF8330];
                v47[1] = 3221225472;
                v47[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_54;
                v47[3] = &unk_2640081F8;
                *(double *)&v47[6] = v36;
                v47[4] = self;
                v47[5] = v48;
                v41 = v47;
              }
              [(MTLDevice *)device newLibraryWithSource:v12 options:v31 completionHandler:v41];
            }
            else
            {
              v45 = 0;
              v42 = (void *)[(MTLDevice *)self->_device newLibraryWithSource:v12 options:v31 error:&v45];
              self->__engineStats->onlineShaderCompilationTime = CACurrentMediaTime()
                                                               - v36
                                                               + self->__engineStats->onlineShaderCompilationTime;
              v49((uint64_t)v48, v42, v45);
            }
LABEL_46:

            return;
          }
          v22 = (const void *)[@"commonprofile_vert" stringByAppendingString:v14];
          v44 = (const void *)[@"commonprofile_frag" stringByAppendingString:v14];
          if (v21)
          {
            if ([(NSDictionary *)self->_commonProfilePrecompiledFunctions objectForKeyedSubscript:v22]&& [(NSDictionary *)self->_commonProfilePrecompiledFunctions objectForKeyedSubscript:v44])
            {
              C3DFXMetalProgramSetFunctionName((char *)var0, 0, v22);
              C3DFXMetalProgramSetFunctionName((char *)var0, 1, v44);
              C3DFXMetalProgramReplaceSourceCodeWithLibrary(var0, self->_commonProfileCacheLibraryHasherBlock, self->_commonProfileCacheLibraryProviderBlock);
              commonProfileCacheLibrary = self->_commonProfileCacheLibrary;
              goto LABEL_18;
            }
            long long v23 = scn_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              long long v24 = v44;
              -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]();
              if (!v20) {
                goto LABEL_34;
              }
            }
            else
            {
              long long v24 = v44;
              if (!v20) {
                goto LABEL_34;
              }
            }
          }
          else
          {
            long long v24 = v44;
            if (!v20) {
              goto LABEL_34;
            }
          }
          uint64_t v25 = C3DGetShaderCompilationDirectory();
          if (v25)
          {
            uint64_t v26 = v25;
            if (-[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::onceToken != -1) {
              dispatch_once(&-[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::onceToken, &__block_literal_global_65);
            }
            CFRetain(var0);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2;
            block[3] = &unk_264008158;
            block[4] = v26;
            block[5] = v14;
            block[7] = v24;
            block[8] = var0;
            block[6] = v22;
            dispatch_async((dispatch_queue_t)-[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::shaderCollectionQueue, block);
          }
          goto LABEL_34;
        }
        if (C3DFXProgramIsClientProgram((uint64_t)a3->var0)) {
          v10 = [(SCNMTLLibraryManager *)self defaultLibrary];
        }
        else {
          v10 = [(SCNMTLLibraryManager *)self frameworkLibrary];
        }
      }
      commonProfileCacheLibrary = v10;
LABEL_18:
      int v16 = (void (*)(id, MTLLibrary *, void))*((void *)a4 + 2);
      id v17 = a4;
      goto LABEL_19;
    }
  }
  uint8x16_t v19 = scn_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]();
  }
}

- (id)deviceQueue
{
  return self->_deviceQueue;
}

- (id)commonProfileCacheLibrary
{
  return self->_commonProfileCacheLibrary;
}

- (id)frameworkLibrary
{
  return [(SCNMTLLibrary *)self->_frameworkLibrary library];
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_54(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[4];
  v4 = *(NSObject **)(v3 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2_55;
  block[3] = &unk_2640081D0;
  block[8] = a1[6];
  uint64_t v5 = a1[5];
  block[4] = v3;
  block[5] = a2;
  block[6] = a3;
  block[7] = v5;
  dispatch_async(v4, block);
}

- (void)_setEngineStats:(__C3DEngineStats *)a3
{
  self->__engineStats = a3;
}

- (SCNMTLLibraryManager)initWithDevice:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)SCNMTLLibraryManager;
  v4 = [(SCNMTLLibraryManager *)&v27 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v4->_frameworkLibrary = -[SCNMTLLibrary initWithPath:manager:]([SCNMTLLibrary alloc], "initWithPath:manager:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"default", @"metallib"), v4);
    v5->_availableLibraries = (NSMapTable *)(id)[MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    v5->_availableCompiledLibraries = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    v5->_availableCompiledLibrariesLock._os_unfair_lock_opaque = 0;
    v5->_deviceQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.scenekit.device", 0);
    v5->_shaderCompilationGroup = (OS_dispatch_group *)dispatch_group_create();
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "URLForResource:withExtension:", @"scenekit", @"metallib");
    if (!v6)
    {
      v6 = (void *)C3DGetShaderCacheLibraryURL();
      if (!v6) {
        v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "URLForResource:withExtension:", @"default", @"metallib");
      }
    }
    uint64_t v26 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v6, "path")))
    {
      uint64_t v7 = [(MTLDevice *)v5->_device newLibraryWithURL:v6 error:&v26];
      if (v7)
      {
        uint64_t v8 = (MTLLibrary *)v7;
        CFHashCode v9 = CFHash(v6);
        v5->_commonProfileCacheLibrary = v8;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __39__SCNMTLLibraryManager_initWithDevice___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_Q8__0l;
        aBlock[4] = v9;
        v5->_commonProfileCacheLibraryHasherBlock = _Block_copy(aBlock);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __39__SCNMTLLibraryManager_initWithDevice___block_invoke_2;
        v24[3] = &unk_2640080B8;
        v24[4] = v8;
        v5->_commonProfileCacheuint64_t LibraryProviderBlock = _Block_copy(v24);
        v10 = (void *)[(MTLLibrary *)v5->_commonProfileCacheLibrary functionNames];
        id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v10);
              }
              int v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              if (([v16 hasPrefix:@"commonprofile_vert"] & 1) != 0
                || [v16 hasPrefix:@"commonprofile_frag"])
              {
                id v17 = (void *)[(MTLLibrary *)v5->_commonProfileCacheLibrary newFunctionWithName:v16];
                [v11 setObject:v17 forKeyedSubscript:v16];
              }
            }
            uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
        if ([v11 count])
        {
          v5->_commonProfilePrecompiledFunctions = (NSDictionary *)[v11 copy];
        }
        else
        {
          CFRelease(v5->_commonProfileCacheLibrary);
          CFRelease(v5->_commonProfileCacheLibraryHasherBlock);
          CFRelease(v5->_commonProfileCacheLibraryProviderBlock);
        }
      }
      else
      {
        int8x16_t v18 = scn_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SCNMTLLibraryManager initWithDevice:]();
        }
      }
    }
  }
  return v5;
}

- (id)device
{
  return self->_device;
}

uint64_t __39__SCNMTLLibraryManager_initWithDevice___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t __39__SCNMTLLibraryManager_initWithDevice___block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)dealloc
{
  CFRelease(self->_availableCompiledLibraries);

  dispatch_release((dispatch_object_t)self->_deviceQueue);
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLLibraryManager;
  [(SCNMTLLibraryManager *)&v3 dealloc];
}

- (void)clearCompiledLibraries
{
  p_availableCompiledLibrariesLock = &self->_availableCompiledLibrariesLock;
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  CFDictionaryRemoveAllValues(self->_availableCompiledLibraries);

  os_unfair_lock_unlock(p_availableCompiledLibrariesLock);
}

- (id)defaultLibrary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SCNMTLLibraryManager_defaultLibrary__block_invoke;
  block[3] = &unk_264004DF8;
  block[4] = self;
  if (-[SCNMTLLibraryManager defaultLibrary]::onceToken != -1) {
    dispatch_once(&-[SCNMTLLibraryManager defaultLibrary]::onceToken, block);
  }
  return [(SCNMTLLibrary *)self->_defaultLibrary library];
}

SCNMTLLibrary *__38__SCNMTLLibraryManager_defaultLibrary__block_invoke(uint64_t a1)
{
  result = -[SCNMTLLibrary initWithPath:manager:]([SCNMTLLibrary alloc], "initWithPath:manager:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "pathForResource:ofType:", @"default", @"metallib"), *(void *)(a1 + 32));
  *(void *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (id)libraryForFile:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  uint64_t v12 = 0;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SCNMTLLibraryManager_libraryForFile___block_invoke;
  block[3] = &unk_2640080E0;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(deviceQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__SCNMTLLibraryManager_libraryForFile___block_invoke(void *a1)
{
  v2 = (SCNMTLLibrary *)[*(id *)(a1[4] + 88) objectForKey:a1[5]];
  if (!v2)
  {
    v2 = [[SCNMTLLibrary alloc] initWithPath:a1[5] manager:a1[4]];
    [*(id *)(a1[4] + 88) setObject:v2 forKey:a1[5]];
  }
  uint64_t result = [(SCNMTLLibrary *)v2 library];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (id)libraryForSourceCode:(id)a3 options:(id)a4
{
  id v7 = +[SCNMTLLibraryManager hashCodeForSource:macros:](SCNMTLLibraryManager, "hashCodeForSource:macros:", a3, [a4 preprocessorMacros]);
  os_unfair_lock_lock(&self->_availableCompiledLibrariesLock);
  Value = (void *)CFDictionaryGetValue(self->_availableCompiledLibraries, v7);
  if (!Value)
  {
    uint64_t v12 = 0;
    ++self->__engineStats->onlineShaderCount;
    double v9 = CACurrentMediaTime();
    Value = (void *)[(MTLDevice *)self->_device newLibraryWithSource:a3 options:a4 error:&v12];
    self->__engineStats->onlineShaderCompilationTime = CACurrentMediaTime()
                                                     - v9
                                                     + self->__engineStats->onlineShaderCompilationTime;
    if (Value)
    {
      CFDictionarySetValue(self->_availableCompiledLibraries, v7, Value);
    }
    else
    {
      v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLLibraryManager libraryForSourceCode:options:]();
      }
    }
  }
  os_unfair_lock_unlock(&self->_availableCompiledLibrariesLock);
  return Value;
}

dispatch_queue_t __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.scenekit.shader-collection-queue", v1);
  -[SCNMTLLibraryManager libraryForProgramDesc:completionHandler:]::shaderCollectionQueue = (uint64_t)result;
  return result;
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_2(uint64_t a1)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3;
  v8[3] = &unk_264008108;
  long long v9 = *(_OWORD *)(a1 + 32);
  v2 = +[SCNCommonProfileProgramGenerator generatorWithProfile:0 allowingHotReload:0];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_43;
  v7[3] = &unk_264008130;
  v7[4] = *(void *)(a1 + 32);
  [(SCNCommonProfileProgramGenerator *)v2 collectShaderForProgram:v5 hashCode:v3 newVertexFunctionName:v4 newFragmentFunctionName:v6 sourceCodeBlock:v8 additionalFileBlock:v7];
  CFRelease(*(CFTypeRef *)(a1 + 64));
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = 0;
  if ([a2 writeToURL:objc_msgSend(v2, "URLByAppendingPathComponent:", objc_msgSend(NSString, "stringWithFormat:", @"commonProfile_%@.metal", v5)), 1, 4, &v6 atomically encoding error])BOOL v3 = v6 == 0; {
  else
  }
    BOOL v3 = 0;
  if (!v3)
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_cold_1(&v6, v4);
    }
  }
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_43(uint64_t a1, void *a2)
{
  id v6 = 0;
  BOOL v3 = objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "path")))
  {
    if ((objc_msgSend((id)objc_msgSend(NSString, "stringWithContentsOfURL:encoding:error:", v3, 4, 0), "isEqualToString:", a2) & 1) == 0)
    {
      uint64_t v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_43_cold_1();
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", objc_msgSend(v3, "URLByDeletingLastPathComponent"), 1, 0, 0);
    if (![a2 writeToURL:v3 atomically:1 encoding:4 error:&v6] || v6)
    {
      uint64_t v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_cold_1(&v6, v5);
      }
    }
  }
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_50(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v6 = *(_DWORD *)(v5 + 24);
    *(_DWORD *)(v5 + 24) = v6 + 1;
    v7[0] = 67109378;
    v7[1] = v6;
    __int16 v8 = 2112;
    uint64_t v9 = a2;
    _os_log_impl(&dword_20B249000, v4, OS_LOG_TYPE_DEFAULT, "%d: %@", (uint8_t *)v7, 0x12u);
  }
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_56(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_4;
  block[3] = &unk_264008220;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a3;
  block[6] = v4;
  block[4] = a2;
  dispatch_async(v3, block);
}

uint64_t __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)initWithDevice:.cold.1()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_20B249000, v0, v1, "Error: Failed to load common profile chache library : %@", v2);
}

- (void)libraryForSourceCode:options:.cold.1()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_20B249000, v0, v1, "Error: Compilation failed %@", v2);
}

- (void)libraryForProgramDesc:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_6(&dword_20B249000, v0, v1, "Error: Only metal program are supported %@", v2);
}

- (void)libraryForProgramDesc:(unsigned __int8 *)a1 completionHandler:(NSObject *)a2 .cold.2(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unknown compilation mode %d", (uint8_t *)v3, 8u);
}

- (void)libraryForProgramDesc:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Failed to find pre-compiled combination %@ + %@");
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_3_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [*a1 localizedDescription];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_6(&dword_20B249000, a2, v3, "Error: Failed to collect shader: %@", v4);
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_43_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_6(&dword_20B249000, v0, v1, "Error: Failed to collect shader: additional file \"%@\" is not always the same", v2);
}

void __64__SCNMTLLibraryManager_libraryForProgramDesc_completionHandler___block_invoke_49_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 description];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_6(&dword_20B249000, a2, v3, "Error: FATAL ERROR : failed compiling shader:\n%@", v4);
}

@end