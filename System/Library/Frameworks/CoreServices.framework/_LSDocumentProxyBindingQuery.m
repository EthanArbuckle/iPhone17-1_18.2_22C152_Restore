@interface _LSDocumentProxyBindingQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)_requiresDatabaseMappingEntitlement;
- (BOOL)isEqual:(id)a3;
- (BOOL)yieldClaimBindings;
- (LSDocumentProxy)documentProxy;
- (NSString)handlerRank;
- (_LSDocumentProxyBindingQuery)initWithCoder:(id)a3;
- (_LSDocumentProxyBindingQuery)initWithDocumentProxy:(id)a3 style:(unsigned __int8)a4 handlerRank:(id)a5;
- (unint64_t)hash;
- (unsigned)style;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)filterOpenRestrictedBindings:(void *)a3 connection:(id)a4 context:(LSContext *)a5 earlyYield:(id)a6;
- (void)setYieldClaimBindings:(BOOL)a3;
@end

@implementation _LSDocumentProxyBindingQuery

- (_LSDocumentProxyBindingQuery)initWithDocumentProxy:(id)a3 style:(unsigned __int8)a4 handlerRank:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_LSDocumentProxyBindingQuery;
  v11 = [(_LSQuery *)&v16 _init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 2, a3);
    *((unsigned char *)v12 + 10) = a4;
    uint64_t v13 = [v10 copy];
    id v14 = v12[3];
    v12[3] = (id)v13;
  }
  return (_LSDocumentProxyBindingQuery *)v12;
}

- (void)filterOpenRestrictedBindings:(void *)a3 connection:(id)a4 context:(LSContext *)a5 earlyYield:(id)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v30 = (void (**)(id, void, void *))a6;
  id v11 = [(_LSDocumentProxyBindingQuery *)self documentProxy];
  v12 = (_OWORD *)[v11 sourceAuditToken];

  if (v10
    && (memset(v34, 0, sizeof(v34)), [v10 auditToken], !_LSAuditTokensAreEqual(v12, v34))
    && ([v10 _xpcConnection],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = _LSCheckEntitlementForXPCConnection(v13, @"com.apple.private.launchservices.canspecifymanageddocumentsource") == 0, v13, v14))
  {
    std::vector<LSBinding>::__base_destruct_at_end[abi:nn180100]((uint64_t)a3, *(void *)a3);
    uint64_t v35 = *MEMORY[0x1E4F28228];
    v36[0] = @"missing entitlement";
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v29 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:]", 754, v28);
    v30[2](v30, 0, v29);
  }
  else
  {
    v15 = (void *)_LSCopyBundleIdentifierForAuditToken(v12, 1);
    if (v15)
    {
      objc_super v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4)];
      uint64_t v17 = *(void *)a3;
      uint64_t v18 = *((void *)a3 + 1);
      if (*(void *)a3 != v18)
      {
        do
        {
          v19 = (void *)_CSStringCopyCFString();
          if (v19) {
            [v16 addObject:v19];
          }

          v17 += 48;
        }
        while (v17 != v18);
      }
      v20 = +[LSApplicationRestrictionsManager sharedInstance]();
      v21 = [(_LSDocumentProxyBindingQuery *)self documentProxy];
      v22 = -[LSApplicationRestrictionsManager allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:](v20, v16, v15, [v21 isContentManaged]);

      uint64_t v23 = *(void *)a3;
      uint64_t v24 = *((void *)a3 + 1);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __91___LSDocumentProxyBindingQuery_filterOpenRestrictedBindings_connection_context_earlyYield___block_invoke;
      v31[3] = &unk_1E522F220;
      v33 = a5;
      id v25 = v22;
      id v32 = v25;
      uint64_t v26 = std::remove_if[abi:nn180100]<std::__wrap_iter<LSBinding *>,BOOL({block_pointer} {__strong})(LSBinding const&)>(v23, v24, v31);
      std::vector<LSBinding>::erase((uint64_t)a3, v26, *((void *)a3 + 1));
    }
    else
    {
      v27 = _LSDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[_LSDocumentProxyBindingQuery filterOpenRestrictedBindings:connection:context:earlyYield:](v27);
      }
    }
  }
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v7 = (void (**)(id, void, id))a4;
  CFStringRef v8 = [(_LSDocumentProxyBindingQuery *)self handlerRank];
  id v9 = (__CFString *)v8;
  if (v8)
  {
    __int16 v10 = _LSNumericHandlerRankFromHandlerRankString(v8);
    unsigned __int8 v11 = v10;
    __int16 v4 = HIBYTE(v10);
    int v12 = 0x10000;
  }
  else
  {
    int v12 = 0;
    unsigned __int8 v11 = 0;
  }

  v40 = [(_LSDocumentProxyBindingQuery *)self documentProxy];
  if (v40)
  {
    int v13 = [(_LSDocumentProxyBindingQuery *)self style];
    BOOL v14 = [(_LSDocumentProxyBindingQuery *)self yieldClaimBindings];
    id v56 = 0;
    v53 = 0;
    id v54 = 0;
    char v55 = 0;
    if (LaunchServices::Database::Context::status((id *)&v53))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v53, v15, 0);

      if (v16) {
        id v17 = 0;
      }
      else {
        id v17 = v56;
      }
      v7[2](v7, 0, v17);
    }
    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v21 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v53, v20, 0);

      long long v51 = 0u;
      long long v52 = 0u;
      if (v41)
      {
        [v41 auditToken];
        long long v51 = v57[0];
        long long v52 = v57[1];
        v22 = &v51;
      }
      else
      {
        v22 = 0;
      }
      [v40 _bindingEvaluatorWithAuditToken:v22];
      if (v13 == 1) {
        int v23 = 320;
      }
      else {
        int v23 = 0;
      }
      if (v13 == 2) {
        int v23 = 12320;
      }
      unsigned __int16 v24 = v11 | (unsigned __int16)(v4 << 8);
      if (v24) {
        BOOL v25 = 1;
      }
      else {
        BOOL v25 = v9 == 0;
      }
      if (!v25) {
        v23 |= 0x1000u;
      }
      int v26 = v23 | 0x2020;
      if (v23 | 0x2020)
      {
        int Options = LaunchServices::BindingEvaluator::getOptions((LaunchServices::BindingEvaluator *)v57);
        LaunchServices::BindingEvaluator::setOptions((uint64_t)v57, Options | v26);
      }
      if (v9)
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __66___LSDocumentProxyBindingQuery__enumerateWithXPCConnection_block___block_invoke;
        v49[3] = &__block_descriptor_36_e60_B24__0__LSContext___8r__LSBinding_I__LSBundleData_I_______16l;
        int v50 = v12 | v24;
        LaunchServices::BindingEvaluator::setFilter_NoIO((uint64_t)v57, @"handler rank", v49);
      }
      id v48 = 0;
      if (v14) {
        v28 = &v48;
      }
      else {
        v28 = 0;
      }
      id v45 = 0;
      LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)v57, v21, v28, &v45, (uint64_t *)&v46);
      id v39 = v45;
      if (v46 == v47 && _LSGetOSStatusFromNSError(v39) != -10814)
      {
        v7[2](v7, 0, v39);
      }
      else
      {
        v29 = +[LSApplicationRestrictionsManager sharedInstance]();
        int v30 = -[LSApplicationRestrictionsManager isOpenInRestrictionInEffect](v29);

        if (v30) {
          [(_LSDocumentProxyBindingQuery *)self filterOpenRestrictedBindings:&v46 connection:v41 context:v21 earlyYield:v7];
        }
        id v44 = 0;
        memset(v42, 0, sizeof(v42));
        int v43 = 1065353216;
        id v32 = v46;
        for (i = v47; v32 != i; v32 += 12)
        {
          if (!std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>(v42, v32))
          {
            v33 = (void *)MEMORY[0x18530F680]();
            if (v14)
            {
              v34 = [LSClaimBinding alloc];
              uint64_t v35 = [(LSClaimBinding *)v34 _initWithContext:v21 binding:v32 coreTypesBundleRecord:&v44 typeRecord:v48 error:0];
            }
            else
            {
              uint64_t v35 = +[LSApplicationProxy applicationProxyWithBundleUnitID:*v32 withContext:v21];
            }
            v36 = (void *)v35;
            std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>((uint64_t)v42, v32, v32);
            if (v36 && !((unsigned int (*)(id, void *, void))v7[2])(v7, v36, 0))
            {

              break;
            }
          }
        }
        std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v42);
      }
      *(void *)&v42[0] = &v46;
      std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100]((void ***)v42);

      if (v58) {
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v57);
      }
    }
    if (v53 && v55) {
      _LSContextDestroy(v53);
    }
    id v37 = v54;
    v53 = 0;
    id v54 = 0;

    char v55 = 0;
    id v38 = v56;
    id v56 = 0;
  }
  else
  {
    uint64_t v59 = *MEMORY[0x1E4F28228];
    v60[0] = @"documentProxy";
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
    v19 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"-[_LSDocumentProxyBindingQuery _enumerateWithXPCConnection:block:]", 810, v18);
    v7[2](v7, 0, v19);
  }
}

- (BOOL)_requiresDatabaseMappingEntitlement
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LSDocumentProxyBindingQuery;
  if ([(_LSQuery *)&v13 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 documentProxy];
    v6 = [(_LSDocumentProxyBindingQuery *)self documentProxy];
    if ([v5 isEqual:v6]
      && (int v7 = [v4 style], v7 == -[_LSDocumentProxyBindingQuery style](self, "style")))
    {
      CFStringRef v8 = [v4 handlerRank];
      id v9 = [(_LSDocumentProxyBindingQuery *)self handlerRank];
      if ([v8 isEqual:v9])
      {
        int v10 = [v4 yieldClaimBindings];
        int v11 = v10 ^ [(_LSDocumentProxyBindingQuery *)self yieldClaimBindings] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(_LSDocumentProxyBindingQuery *)self documentProxy];
  uint64_t v4 = [v3 hash];
  unsigned int v5 = [(_LSDocumentProxyBindingQuery *)self style];
  v6 = [(_LSDocumentProxyBindingQuery *)self handlerRank];
  uint64_t v7 = v4 ^ [v6 hash] ^ v5;

  uint64_t v8 = v7 ^ ([(_LSDocumentProxyBindingQuery *)self yieldClaimBindings] << 63 >> 63);
  v10.receiver = self;
  v10.super_class = (Class)_LSDocumentProxyBindingQuery;
  return v8 ^ [(_LSQuery *)&v10 hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(_LSDocumentProxyBindingQuery *)self documentProxy];
  [v6 encodeObject:v4 forKey:@"documentProxy"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[_LSDocumentProxyBindingQuery style](self, "style"), @"style");
  unsigned int v5 = [(_LSDocumentProxyBindingQuery *)self handlerRank];
  [v6 encodeObject:v5 forKey:@"handlerRank"];

  objc_msgSend(v6, "encodeBool:forKey:", -[_LSDocumentProxyBindingQuery yieldClaimBindings](self, "yieldClaimBindings"), @"yieldClaimBindings");
}

- (_LSDocumentProxyBindingQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"documentProxy");
  unsigned __int8 v6 = [v4 decodeIntegerForKey:@"style"];
  uint64_t v7 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"handlerRank");
  uint64_t v8 = [(_LSDocumentProxyBindingQuery *)self initWithDocumentProxy:v5 style:v6 handlerRank:v7];
  if (v8) {
    -[_LSDocumentProxyBindingQuery setYieldClaimBindings:](v8, "setYieldClaimBindings:", [v4 decodeBoolForKey:@"yieldClaimBindings"]);
  }

  return v8;
}

- (BOOL)yieldClaimBindings
{
  return *(&self->super._legacy + 1);
}

- (void)setYieldClaimBindings:(BOOL)a3
{
  *(&self->super._legacy + 1) = a3;
}

- (LSDocumentProxy)documentProxy
{
  return *(LSDocumentProxy **)&self->_yieldClaimBindings;
}

- (unsigned)style
{
  return *(&self->super._legacy + 2);
}

- (NSString)handlerRank
{
  return (NSString *)&self->_documentProxy->super.super.super.isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProxy, 0);

  objc_storeStrong((id *)&self->_yieldClaimBindings, 0);
}

- (void)filterOpenRestrictedBindings:(os_log_t)log connection:context:earlyYield:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Open restriction in effect, but caller has no bundle ID.", v1, 2u);
}

@end