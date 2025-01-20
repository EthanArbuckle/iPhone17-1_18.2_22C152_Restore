@interface _LSSharedWebCredentialsAppLinkPlugIn
- (_LSSharedWebCredentialsAppLinkPlugIn)init;
- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4;
- (id)appLinksWithContext:(LSContext *)a3 forSWCResults:(id)a4;
- (id)callingBundleIdentifier;
- (optional<LSBinding>)bindingWithContext:(SEL)a3 forServiceDetails:(LSContext *)a4 callingBundleIdentifier:(id)a5;
- (void)enumerateBindingsWithContext:(LSContext *)a3 forSWCResults:(id)a4 block:(id)a5;
@end

@implementation _LSSharedWebCredentialsAppLinkPlugIn

- (_LSSharedWebCredentialsAppLinkPlugIn)init
{
  v4.receiver = self;
  v4.super_class = (Class)_LSSharedWebCredentialsAppLinkPlugIn;
  v2 = [(_LSSharedWebCredentialsAppLinkPlugIn *)&v4 init];
  if (v2 && !_LSIsSWCAvailable())
  {

    return 0;
  }
  return v2;
}

- (optional<LSBinding>)bindingWithContext:(SEL)a3 forServiceDetails:(LSContext *)a4 callingBundleIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  if (a4)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a3, self, @"LSAppLinkPlugIn.mm", 501, @"Invalid parameter not satisfying: %@", @"ctx != NULL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a3, self, @"LSAppLinkPlugIn.mm", 502, @"Invalid parameter not satisfying: %@", @"serviceDetails != nil" object file lineNumber description];

LABEL_3:
  if ([v11 isApproved])
  {
    v13 = [v11 serviceSpecifier];
    v14 = [v13 applicationIdentifier];

    v15 = [v11 serviceSpecifier];
    v16 = [v15 applicationIdentifierPrefix];

    v17 = [v11 serviceSpecifier];
    v18 = [v17 bundleIdentifier];

    if (v18 && (!v12 || [v18 caseInsensitiveCompare:v12]))
    {
      if ([v11 isSystemPlaceholder])
      {
        unsigned int v19 = _LSFindBundleWithInfo(a4, 7uLL, v18, 0, 0, 0, 0);
        v20 = (LSBundleData *)_LSBundleGet(a4->db, v19);
        if (v20)
        {
          int v30 = 0;
          uint64_t v31 = 0;
          int v32 = 0;
          id v34 = 0;
          id v35 = 0;
          uint64_t v33 = 0;
          std::optional<LSBinding>::operator=[abi:nn180100]<LSBinding,void>((uint64_t)retstr, (uint64_t)&v30);

          retstr->var0.var1.bundle = v19;
          retstr->var0.var1.bundleData = v20;
        }
      }
      else
      {
        memset(v29, 0, sizeof(v29));
        LaunchServices::BindingEvaluator::CreateWithBundleInfo((LaunchServices::BindingEvaluator *)v18, 0, 0, (LSVersionNumber *)1, v29, (uint64_t)&v30);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __101___LSSharedWebCredentialsAppLinkPlugIn_bindingWithContext_forServiceDetails_callingBundleIdentifier___block_invoke;
        v26[3] = &unk_1E522D1E8;
        id v27 = v16;
        id v28 = v14;
        LaunchServices::BindingEvaluator::setFilter_NoIO((uint64_t)&v30, @"universal links", v26);
        LaunchServices::BindingEvaluator::getBestBinding((LaunchServices::BindingEvaluator *)&v30, v24);
        std::__optional_storage_base<LSBinding,false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<LSBinding,false>>((uint64_t)retstr, (uint64_t)v24);
        if (v25)
        {
        }
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)&v30);
      }
    }
  }
  return result;
}

- (void)enumerateBindingsWithContext:(LSContext *)a3 forSWCResults:(id)a4 block:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v22 = (void (**)(id, unsigned int *, void))a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LSAppLinkPlugIn.mm", 592, @"Invalid parameter not satisfying: %@", @"swcResults != nil", 0 object file lineNumber description];
  }
  v10 = [(_LSAppLinkPlugIn *)self state];
  char v11 = [v10 includeLinksForCallingApplication];

  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [(_LSSharedWebCredentialsAppLinkPlugIn *)self callingBundleIdentifier];
  }
  memset(v32, 0, sizeof(v32));
  int v33 = 1065353216;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v13)
  {
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v29;
LABEL_8:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x18530F680]();
      [(_LSSharedWebCredentialsAppLinkPlugIn *)self bindingWithContext:a3 forServiceDetails:v17 callingBundleIdentifier:v12];
      if (v27)
      {
        unsigned int v19 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>(v32, v24);
        BOOL v20 = v19 == 0;
        if (!v19)
        {
          std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>((uint64_t)v32, v24, v24);
          if (!v27)
          {
            std::__throw_bad_optional_access[abi:nn180100]();
            __break(1u);
          }
          v22[2](v22, v24, v17);
          ++v14;
        }
        if (v27)
        {
        }
      }
      else
      {
        BOOL v20 = 1;
      }
      if (!v20 || v14 >= [(_LSAppLinkPlugIn *)self limit]) {
        break;
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v13) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v32);
}

- (id)appLinksWithContext:(LSContext *)a3 forSWCResults:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v29[0] = 0;
  v29[1] = v29;
  _OWORD v29[2] = 0x4812000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  v29[5] = &unk_182B5933F;
  memset(v30, 0, sizeof(v30));
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_forSWCResults___block_invoke;
  v25[3] = &unk_1E522D210;
  long long v28 = a3;
  v25[4] = self;
  id v8 = v7;
  id v26 = v8;
  char v27 = v29;
  [(_LSSharedWebCredentialsAppLinkPlugIn *)self enumerateBindingsWithContext:a3 forSWCResults:v6 block:v25];
  if (-[_LSAppLinkPlugIn limit](self, "limit") != -1 && (unint64_t)[v8 count] >= 2)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v15 isEnabled]) {
            uint64_t v16 = v9;
          }
          else {
            uint64_t v16 = v10;
          }
          [v16 addObject:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v12);
    }

    [v11 setArray:v9];
    unint64_t v17 = [v9 count];
    if (v17 < [(_LSAppLinkPlugIn *)self limit]) {
      [v11 addObjectsFromArray:v10];
    }
  }
  +[LSRecord resolveAllPropertiesOfRecords:count:andDetachOnQueue:](LSRecord, "resolveAllPropertiesOfRecords:count:andDetachOnQueue:");
  v18 = v26;
  id v19 = v8;

  _Block_object_dispose(v29, 8);
  long long v31 = (void **)v30;
  std::vector<LSApplicationRecord * {__strong}>::__destroy_vector::operator()[abi:nn180100](&v31);

  return v19;
}

- (id)callingBundleIdentifier
{
  v2 = [(_LSAppLinkPlugIn *)self state];
  v3 = (void *)_LSCopyBundleIdentifierForAuditToken((_OWORD *)[v2 auditToken], 1);

  return v3;
}

- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4
{
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__141;
  v44 = __Block_byref_object_dispose__142;
  id v45 = (id)MEMORY[0x1E4F1CBF0];
  v7 = (void *)MEMORY[0x18530F680](self, a2);
  id v8 = objc_alloc((Class)_LSSWCServiceSpecifierClass());
  id v9 = _LSSWCServiceTypeAppLinks();
  v10 = [(_LSAppLinkPlugIn *)self URLComponents];
  id v11 = [v10 host];
  uint64_t v12 = (void *)[v8 initWithServiceType:v9 applicationIdentifier:0 domain:v11];

  uint64_t v13 = [(_LSAppLinkPlugIn *)self state];
  unint64_t v14 = (_OWORD *)[v13 auditToken];

  if (v14 && (_LSSWCServiceDetailsClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v15 = (void *)_LSSWCServiceDetailsClass();
    uint64_t v16 = [(_LSAppLinkPlugIn *)self URLComponents];
    unint64_t v17 = [(_LSAppLinkPlugIn *)self limit];
    long long v18 = v14[1];
    v39[0] = *v14;
    v39[1] = v18;
    uint64_t v38 = 0;
    id v19 = (id *)&v38;
    uint64_t v20 = [v15 serviceDetailsWithServiceSpecifier:v12 URLComponents:v16 limit:v17 auditToken:v39 error:&v38];
  }
  else
  {
    long long v21 = (void *)_LSSWCServiceDetailsClass();
    uint64_t v16 = [(_LSAppLinkPlugIn *)self URLComponents];
    uint64_t v37 = 0;
    id v19 = (id *)&v37;
    uint64_t v20 = objc_msgSend(v21, "serviceDetailsWithServiceSpecifier:URLComponents:limit:error:", v12, v16, -[_LSAppLinkPlugIn limit](self, "limit"), &v37);
  }
  long long v22 = (void *)v20;
  id v23 = *v19;

  if ([v22 count])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke;
    v33[3] = &unk_1E522D238;
    uint64_t v35 = &v40;
    uint64_t v36 = a3;
    v33[4] = self;
    id v34 = v22;
    long long v24 = (void (**)(void))MEMORY[0x18530F950](v33);
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      _LSServer_DatabaseExecutionContext();
      id v25 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      -[LSDBExecutionContext assertNotActiveForThisThread](v25);

      _LSServer_DatabaseExecutionContext();
      id v26 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __66___LSSharedWebCredentialsAppLinkPlugIn_appLinksWithContext_error___block_invoke_2;
      v31[3] = &unk_1E522D260;
      int v32 = v24;
      -[LSDBExecutionContext syncRead:](v26, v31);
    }
    else
    {
      v24[2](v24);
    }
  }
  else if (v22)
  {
    char v27 = (void *)v41[5];
    v41[5] = MEMORY[0x1E4F1CBF0];
  }
  long long v28 = (void *)v41[5];
  if (a4 && !v28)
  {
    *a4 = v23;
    long long v28 = (void *)v41[5];
  }
  id v29 = v28;

  _Block_object_dispose(&v40, 8);

  return v29;
}

@end