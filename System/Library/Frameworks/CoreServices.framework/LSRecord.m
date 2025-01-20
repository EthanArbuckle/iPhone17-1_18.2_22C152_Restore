@interface LSRecord
+ (BOOL)hasDatabaseAccess;
+ (BOOL)supportsSecureCoding;
+ (NSArray)_propertyClasses;
+ (id)new;
+ (void)initialize;
+ (void)resolveAllPropertiesOfRecords:(const void *)a3 count:(unint64_t)a4 andDetachOnQueue:(id)a5;
+ (void)resolveAllPropertiesOfRecords:(id)a3 andDetachOnQueue:(id)a4;
- (BOOL)_isShared;
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (LSRecord)init;
- (LSRecord)initWithCoder:(id)a3;
- (LSRecord)initWithPersistentIdentifier:(id)a3;
- (NSData)persistentIdentifier;
- (NSURL)visualizerURL;
- (NSUUID)databaseUUID;
- (const)_resolvingMethods;
- (id).cxx_construct;
- (id)_attributedDescription;
- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_initInvalid;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifier:(id)a4;
- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5;
- (id)_initWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)_propertyClassesForCoding;
- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5;
- (id)_resolvedPropertyValueForGetter:(SEL)a3;
- (id)_resolvedPropertyValueForGetter:(SEL)a3 nullPlaceholder:(id)a4;
- (id)compatibilityObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unsigned)tableID;
- (unsigned)unitID;
- (void)_ifAttached:(id)a3 else:(id)a4;
- (void)_performBlockWithContext:(id)a3;
- (void)_removeResolvedPropertyValueForGetter:(SEL)a3;
- (void)_resolveAllProperties;
- (void)_setResolvedPropertyValue:(id)a3 forGetter:(SEL)a4;
- (void)_setShared:(BOOL)a3;
- (void)dealloc;
- (void)detach;
- (void)discardContentIfPossible;
- (void)encodeWithCoder:(id)a3;
- (void)endContentAccess;
- (void)resolveAllPropertiesAndDetachOnQueue:(id)a3;
@end

@implementation LSRecord

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (id)_resolvedPropertyValueForGetter:(SEL)a3 nullPlaceholder:(id)a4
{
  os_unfair_recursive_lock_lock_with_options();
  CachedPropertyValue = LaunchServices::Record::getCachedPropertyValue((LaunchServices::Record *)self, (LSRecord *)a3, v7);
  if (v9)
  {
    v10 = CachedPropertyValue;
    v11 = CachedPropertyValue;
    if (!v10) {
      v11 = a4;
    }
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return v12;
}

- (id)_resolvedPropertyValueForGetter:(SEL)a3
{
  return [(LSRecord *)self _resolvedPropertyValueForGetter:a3 nullPlaceholder:0];
}

- (void)detach
{
  if (*((char *)self + 31) < 0)
  {
    v13 = _LSRecordLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_ERROR, "Attempting to detach a shared record. Please file a bug report.", v14, 2u);
    }
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    p_context = &self->_context;
    if (self->_context.db)
    {
      v5 = self;
      v6 = v5;
      db = self->_context.db;
      if ((*((unsigned char *)self + 31) & 0x40) == 0 && !db) {
        __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v5, a2);
      }
      if (db)
      {
        v8 = v5;
        uint64_t Unit = CSStoreGetUnit();
        uint64_t v10 = *((unsigned __int16 *)v8 + 14);
        uint64_t unitID = v8->_unitID;
        [(LSRecord *)v8 persistentIdentifier];

        [(LSRecord *)v8 _detachFromContext:p_context tableID:v10 unitID:unitID unitBytes:Unit];
      }

      v12 = p_context->db;
      p_context->db = 0;
    }
    os_unfair_recursive_lock_unlock();
  }
}

- (NSData)persistentIdentifier
{
  return (NSData *)__LSRECORD_GETTER__<objc_object * {__strong}>(self, (LSRecord *)sel_persistentIdentifier, sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_);
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, sizeof(v8));
  int v9 = 0;
  _LSPersistentIdentifierDataMake((uint64_t *)a3, a4, a5, (uint64_t)v8);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v8 length:28];

  return v6;
}

- (void)dealloc
{
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)resolvedProperties);
    MEMORY[0x18530EAF0](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)LSRecord;
  [(LSRecord *)&v5 dealloc];
}

- (id)_initWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5
{
  __int16 v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSRecord;
  v8 = [(LSRecord *)&v12 init];
  int v9 = v8;
  if (v8)
  {
    if (a3) {
      db = a3->db;
    }
    else {
      db = 0;
    }
    objc_storeStrong((id *)&v8->_context.db, db);
    *((_WORD *)v9 + 14) = v6;
    v9->_uint64_t unitID = a5;
    *((unsigned char *)v9 + 31) &= 0x3Fu;
    *((_WORD *)v9 + 15) = *((_WORD *)v9 + 15) & 0xC000 | 1;
  }
  return v9;
}

- (void)_resolveAllProperties
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_context.db)
  {
    v3 = [(LSRecord *)self _resolvingMethods];
    uint64_t v4 = v3[1];
    if (v4 != *v3)
    {
      resolvedProperties = (float *)self->_resolvedProperties;
      if (!resolvedProperties) {
        operator new();
      }
      std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>((uint64_t)resolvedProperties, vcvtps_u32_f32((float)(unint64_t)(((v4 - *v3) >> 4) + 1) / resolvedProperties[8]));
    }
    v7 = (void *)MEMORY[0x18530F680]();
    v8 = (char *)malloc_type_malloc(0x100uLL, 0xB6014977uLL);
    strlcpy(v8, "LSRecord: resolving ", 0x100uLL);
    size_t v9 = strlen(v8);
    qword_1EB20D5F0 = (uint64_t)v8;
    uint64_t v10 = *v3;
    uint64_t v11 = v3[1];
    if (*v3 != v11)
    {
      objc_super v12 = &v8[v9];
      size_t v13 = 256 - v9;
      do
      {
        SEL v14 = *(SEL *)v10;
        v15 = *(void (**)(LSRecord *, SEL))(v10 + 8);
        Name = sel_getName(*(SEL *)v10);
        strlcpy(v12, Name, v13);
        v15(self, v14);
        v10 += 16;
      }
      while (v10 != v11);
    }
    qword_1EB20D5F0 = 0;
    free(v8);
    [(LSRecord *)self persistentIdentifier];
  }
  else if ((*((unsigned char *)self + 31) & 0x40) == 0)
  {
    __int16 v6 = _LSRecordLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138477827;
      v18 = self;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEBUG, "Record %{private}@ may be incomplete during encoding.", (uint8_t *)&v17, 0xCu);
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (const)_resolvingMethods
{
  Superclass = objc_opt_class();
  os_unfair_recursive_lock_lock_with_options();
  if (!-[LSRecord(Private) _resolvingMethods]::resultsByClass) {
    operator new();
  }
  __p = Superclass;
  objc_super v5 = (char *)std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>((void *)-[LSRecord(Private) _resolvingMethods]::resultsByClass, &__p);
  if (!v5)
  {
    sel = a2;
    __p = 0;
    v32 = 0;
    v33 = 0;
    v29 = Superclass;
    while (Superclass && Superclass != (void *)LaunchServices::Record::recordClass)
    {
      outCount[0] = 0;
      __int16 v6 = class_copyMethodList((Class)Superclass, outCount);
      if (v6)
      {
        if (outCount[0])
        {
          unint64_t v7 = 0;
          do
          {
            v8 = v6[v7];
            Name = method_getName(v8);
            uint64_t v10 = sel_getName(Name);
            if (!strncmp("_LSRecord_resolve_", v10, 0x12uLL))
            {
              IMP Implementation = method_getImplementation(v8);
              IMP v12 = Implementation;
              size_t v13 = v32;
              if (v32 >= v33)
              {
                uint64_t v15 = (v32 - (unsigned char *)__p) >> 4;
                unint64_t v16 = v15 + 1;
                if ((unint64_t)(v15 + 1) >> 60) {
                  abort();
                }
                uint64_t v17 = v33 - (unsigned char *)__p;
                if ((v33 - (unsigned char *)__p) >> 3 > v16) {
                  unint64_t v16 = v17 >> 3;
                }
                if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v18 = v16;
                }
                uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>((uint64_t)&v33, v18);
                v21 = (const char **)&v19[16 * v15];
                *v21 = Name;
                v21[1] = (const char *)v12;
                v23 = (char *)__p;
                v22 = v32;
                v24 = v21;
                if (v32 != __p)
                {
                  do
                  {
                    *((_OWORD *)v24 - 1) = *((_OWORD *)v22 - 1);
                    v24 -= 2;
                    v22 -= 16;
                  }
                  while (v22 != v23);
                  v22 = (char *)__p;
                }
                SEL v14 = (char *)(v21 + 2);
                __p = v24;
                v32 = (char *)(v21 + 2);
                v33 = &v19[16 * v20];
                if (v22) {
                  operator delete(v22);
                }
              }
              else
              {
                *(void *)v32 = Name;
                *((void *)v13 + 1) = Implementation;
                SEL v14 = v13 + 16;
              }
              v32 = v14;
            }
            ++v7;
          }
          while (v7 < outCount[0]);
        }
        free(v6);
      }
      Superclass = class_getSuperclass((Class)Superclass);
    }
    std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>::shrink_to_fit((uint64_t)&__p);
    *(void *)outCount = v29;
    objc_super v5 = std::__hash_table<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>>>::__emplace_unique_key_args<void const*,void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>(-[LSRecord(Private) _resolvingMethods]::resultsByClass, outCount, outCount, (uint64_t)&__p);
    if (!v25)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:sel, self, @"LSRecord.mm", 1463, @"did not insert when filling cache for %@ in %s?", v29, sel_getName(sel) object file lineNumber description];
    }
    if (__p)
    {
      v32 = (char *)__p;
      operator delete(__p);
    }
  }
  os_unfair_recursive_lock_unlock();
  return v5 + 24;
}

- (void)_performBlockWithContext:(id)a3
{
  uint64_t v4 = self;
  os_unfair_recursive_lock_lock_with_options();
  objc_super v5 = v4;
  p_context = &v5->_context;
  db = v5->_context.db;
  uint64_t v10 = v5;
  if ((*((unsigned char *)v5 + 31) & 0x40) == 0 && !db) {
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v5, 0);
  }
  if (db)
  {
    v8 = v5;
    uint64_t Unit = CSStoreGetUnit();
    (*((void (**)(id, LSContext *, void, void, uint64_t))a3 + 2))(a3, p_context, *((unsigned __int16 *)v8 + 14), v8->_unitID, Unit);
  }
  os_unfair_recursive_lock_unlock();
}

- (void)_ifAttached:(id)a3 else:(id)a4
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_context.db)
  {
    unint64_t v7 = self;
    uint64_t Unit = CSStoreGetUnit();
    (*((void (**)(id, LSContext *, void, void, uint64_t))a3 + 2))(a3, &self->_context, *((unsigned __int16 *)v7 + 14), v7->_unitID, Unit);

    os_unfair_recursive_lock_unlock();
  }
  else
  {
    os_unfair_recursive_lock_unlock();
    if (a4)
    {
      size_t v9 = (void (*)(id))*((void *)a4 + 2);
      v9(a4);
    }
  }
}

- (id)compatibilityObject
{
  id v14 = 0;
  uint64_t v15 = self;
  v3 = self;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = v3;
  objc_super v5 = v4;
  p_context = &v4->_context;
  db = v4->_context.db;
  if ((*((unsigned char *)v4 + 31) & 0x40) == 0 && !db) {
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v4, a2);
  }
  if (db)
  {
    v8 = v4;
    uint64_t Unit = CSStoreGetUnit();
    int v10 = *((unsigned __int16 *)v8 + 14);
    unsigned int unitID = v8->_unitID;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___ZZ31__LSRecord_compatibilityObject_ENK3__0clEP9LSContextjjPKv_block_invoke;
    v16[3] = &__block_descriptor_72_e5_v8__0ls32l8s40l8;
    v16[4] = &v14;
    v16[5] = &v15;
    int v17 = v10;
    unsigned int v18 = unitID;
    v16[6] = p_context;
    v16[7] = Unit;
    __LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__((uint64_t)v16);
  }
  os_unfair_recursive_lock_unlock();

  id v12 = v14;

  return v12;
}

- (void)_setResolvedPropertyValue:(id)a3 forGetter:(SEL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = _LSRecordLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136446466;
    Name = sel_getName(a4);
    __int16 v11 = 2112;
    id v12 = a3;
    _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEBUG, "Setting value of property %{public}s to %@", (uint8_t *)&v9, 0x16u);
  }

  os_unfair_recursive_lock_lock_with_options();
  LaunchServices::Record::setCachedPropertyValue((LaunchServices::Record *)self, (LSRecord *)a4, (objc_selector *)a3, v8);
  os_unfair_recursive_lock_unlock();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    LaunchServices::Record::recordClass = (uint64_t)a1;
    std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LSRECORD_IS_CONSTRUCTING_A_COMPATIBILITY_OBJECT__);
    std::__function::__func<BOOL (*)(objc_object *),std::allocator<BOOL (*)(objc_object *)>,BOOL ()(objc_object *)>::~__func(__LSRECORD_IS_PERFORMING_IO_FOR_A_CALLER__);
  }
}

- (void)_setShared:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 31) = v3 & 0x80 | *((unsigned char *)self + 31) & 0x7F;
}

void *__26__LSRecord_initWithCoder___block_invoke(uint64_t a1, NSString *aSelectorName, void *a3)
{
  id v6 = a3;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void **)(a1 + 32) == a3)
  {
    SEL v5 = NSSelectorFromString(aSelectorName);
    return std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *,decltype(nullptr)>(v3, &v5, &v5);
  }
  else
  {
    SEL v5 = NSSelectorFromString(aSelectorName);
    return std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *&,objc_object * const {__strong}&>(v3, &v5, &v5, &v6);
  }
}

+ (BOOL)hasDatabaseAccess
{
  return _LSCurrentProcessMayMapDatabase() != 0;
}

- (LSRecord)initWithCoder:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)LSRecord;
  uint64_t v4 = [(LSRecord *)&v14 init];
  SEL v5 = v4;
  if (v4)
  {
    id v6 = [(LSRecord *)v4 _propertyClassesForCoding];
    unint64_t v7 = objc_msgSend(a3, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", objc_opt_class(), v6, @"resolvedProperties");
    v8 = v7;
    if (v7)
    {
      int v9 = (LaunchServices::Record *)[v7 count];
      if (v9)
      {
        LaunchServices::Record::getNullPlaceholder(v9);
        objc_claimAutoreleasedReturnValue();
        operator new();
      }

      *((_WORD *)v5 + 14) = [a3 decodeInt64ForKey:@"tableID"];
      v5->_unsigned int unitID = [a3 decodeInt64ForKey:@"unitID"];
      if ([a3 decodeBoolForKey:@"intentionallyInvalid"]) {
        char v10 = 64;
      }
      else {
        char v10 = 0;
      }
      *((unsigned char *)v5 + 31) = v10 & 0xC0 | *((unsigned char *)v5 + 31) & 0x3F;
      *((_WORD *)v5 + 15) = *((_WORD *)v5 + 15) & 0xC000 | 1;
    }
    else
    {
      uint64_t v15 = *MEMORY[0x1E4F28228];
      v16[0] = @"Could not decode the set of resolved property values for this record.";
      __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v12 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F281F8], 4865, (uint64_t)"-[LSRecord initWithCoder:]", 580, v11);
      [a3 failWithError:v12];

      SEL v5 = 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  LaunchServices::Record::checkForExfiltrationRisk((LaunchServices::Record *)a3, (NSCoder *)a2);
  os_unfair_recursive_lock_lock_with_options();
  [(LSRecord *)self _resolveAllProperties];
  if (self->_resolvedProperties)
  {
    SEL v5 = (LaunchServices::Record *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*((void *)self->_resolvedProperties + 3)];
    id v6 = LaunchServices::Record::getNullPlaceholder(v5);
    for (i = (uint64_t **)*((void *)self->_resolvedProperties + 2); i; i = (uint64_t **)*i)
    {
      v8 = (const char *)i[2];
      int v9 = i[3];
      char v10 = [(LSRecord *)self _replacementObjectForResolvedPropertyValue:v9 forGetter:v8 encoder:a3];

      __int16 v11 = NSStringFromSelector(v8);
      if (v10) {
        [(LaunchServices::Record *)v5 setObject:v10 forKeyedSubscript:v11];
      }
      else {
        [(LaunchServices::Record *)v5 setObject:v6 forKeyedSubscript:v11];
      }
    }
    [a3 encodeObject:v5 forKey:@"resolvedProperties"];
  }
  os_unfair_recursive_lock_unlock();
  [a3 encodeInt64:*((unsigned __int16 *)self + 14) forKey:@"tableID"];
  [a3 encodeInt64:self->_unitID forKey:@"unitID"];
  uint64_t v12 = (*((unsigned __int8 *)self + 31) >> 6) & 1;

  [a3 encodeBool:v12 forKey:@"intentionallyInvalid"];
}

- (id)_replacementObjectForResolvedPropertyValue:(id)a3 forGetter:(SEL)a4 encoder:(id)a5
{
  id v5 = a3;
  id v6 = v5;
  if (-[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::once == -1)
  {
    if (!v5) {
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&-[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::once, &__block_literal_global_67);
    if (!v6) {
      goto LABEL_5;
    }
  }
  if (objc_opt_isKindOfClass())
  {

    id v6 = 0;
  }
LABEL_5:

  return v6;
}

- (id)_propertyClassesForCoding
{
  id v13 = 0;
  uint64_t v2 = objc_opt_class();
  os_unfair_recursive_lock_lock_with_options();
  if (!-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass) {
    operator new();
  }
  uint64_t v12 = v2;
  uint64_t v3 = std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,std::shared_ptr<LaunchServices::PerThreadContext>>>>::find<_opaque_pthread_t *>((void *)-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass, &v12);
  if (v3)
  {
    id v13 = (id)v3[3];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x18530F680]();
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = XNSGetPropertyListClasses();
    [v5 unionSet:v6];

    [v5 addObject:objc_opt_class()];
    for (i = (objc_class *)v2; i && i != (objc_class *)LaunchServices::Record::recordClass; i = class_getSuperclass(i))
    {
      v8 = [(objc_class *)i _propertyClasses];
      [v5 addObjectsFromArray:v8];
    }
    int v9 = (void *)[v5 copy];
    uint64_t v12 = v2;
    id v13 = v9;
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,objc_selector *&,objc_object * const {__strong}&>(-[LSRecord(Private) _propertyClassesForCoding]::resultsByClass, &v12, &v12, &v13);
  }
  os_unfair_recursive_lock_unlock();
  id v10 = v13;

  return v10;
}

+ (void)resolveAllPropertiesOfRecords:(const void *)a3 count:(unint64_t)a4 andDetachOnQueue:(id)a5
{
  unint64_t v7 = (void **)a3;
  if (!a3 && a4)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"LSRecord.mm", 723, @"Invalid parameter not satisfying: %@", @"records != NULL || count == 0" object file lineNumber description];

    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    if (!a4) {
      return;
    }
    if (a5)
    {
LABEL_5:
      v24 = 0;
      char v25 = 0;
      uint64_t v26 = 0;
      std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(&v24, v7, &v7[a4], a4);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3321888768;
      v22[2] = __79__LSRecord_LSDetachable__resolveAllPropertiesOfRecords_count_andDetachOnQueue___block_invoke;
      v22[3] = &__block_descriptor_56_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE_e5_v8__0l;
      memset(v23, 0, sizeof(v23));
      std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>(v23, v24, v25, v25 - v24);
      [a5 addOperationWithBlock:v22];
      v27 = (id **)v23;
      std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v27);
      v27 = &v24;
      std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v27);
      return;
    }
  }
  if (pthread_main_np() && ([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    uint64_t v16 = LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
    if (!LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool) {
      operator new();
    }
    int v17 = *(id **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
    unsigned int v18 = *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8);
    if (v17 == v18)
    {
      std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool, v17, v7, &v7[a4], a4);
      v21 = MEMORY[0x1E4F14428];
      dispatch_async(v21, &__block_literal_global_247);
    }
    else
    {
      v24 = 0;
      uint64_t v19 = std::remove[abi:nn180100]<std::__wrap_iter<LSRecord * {__weak}*>,decltype(nullptr)>(&v17[LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex], v18);
      std::vector<LSRecord * {__weak}>::erase(v16, v19, *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8));
      uint64_t v20 = *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8);
      LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex = ((uint64_t)v20 - *(void *)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool) >> 3;
      std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool, v20, v7, &v7[a4], a4);
    }
  }
  else
  {
    unint64_t v11 = 8 * a4;
    unint64_t v12 = 8 * a4;
    id v13 = v7;
    do
    {
      id v14 = *v13;
      [v14 _resolveAllProperties];

      ++v13;
      v12 -= 8;
    }
    while (v12);
    do
    {
      id v15 = *v7;
      [v15 detach];

      ++v7;
      v11 -= 8;
    }
    while (v11);
  }
}

- (LSRecord)initWithPersistentIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v17 = 0;
  char v18 = 0;
  id v19 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0);

  if (v6)
  {
    id v7 = [(LSRecord *)self _initWithContext:v6 persistentIdentifier:a3];
  }
  else
  {
    v8 = _LSRecordLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      int v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v9, 0);

      if (v10) {
        id v11 = 0;
      }
      else {
        id v11 = v19;
      }
      *(_DWORD *)buf = 138412546;
      id v21 = a3;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEBUG, "Failed to initialize record with persistent identifier %@ because the current database was not reachable. Error %@", buf, 0x16u);
    }
    id v7 = 0;
  }
  unint64_t v12 = (LSRecord *)v7;
  if (CurrentContext && v18) {
    _LSContextDestroy(CurrentContext);
  }
  id v13 = v17;
  CurrentContext = 0;
  id v17 = 0;

  char v18 = 0;
  id v14 = v19;
  id v19 = 0;

  return v12;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  id v7 = _LSCheckRecordPISizeAndVersionReturningPIInnerBytes(a4, &v16);
  id v8 = v16;
  if (!v7)
  {
    int v9 = _LSRecordLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uu1 = 138412546;
      *(void *)&uu1[4] = a4;
      *(_WORD *)&uu1[12] = 2112;
      *(void *)&uu1[14] = v8;
      _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEBUG, "failed to initialize record with persistent identifier %@: %@", uu1, 0x16u);
    }
    goto LABEL_8;
  }
  *(void *)uu1 = 0;
  *(void *)&uu1[8] = 0;
  _LSDatabaseGetCacheGUIDBytes((uint64_t)a3->db, uu1);
  if (uuid_compare(uu1, v7 + 12))
  {
    int v9 = _LSRecordLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = a4;
      _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEBUG, "Failed to initialize record with persistent identifier %@ because it came from a different database.", buf, 0xCu);
    }
LABEL_8:

    id v10 = 0;
    goto LABEL_17;
  }
  if ([(LSRecord *)self isMemberOfClass:LaunchServices::Record::recordClass])
  {
    SubclassForTable = (objc_class *)LaunchServices::Record::findSubclassForTable((LaunchServices::Record *)a3, (LSContext *)*((unsigned int *)v7 + 2));
    if (SubclassForTable)
    {
      unint64_t v12 = (LSRecord *)[SubclassForTable alloc];
    }
    else
    {
      id v13 = _LSRecordLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = (void *)*((unsigned int *)v7 + 2);
        *(_DWORD *)buf = 134217984;
        id v19 = v14;
        _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_ERROR, "Unexpected table ID 0x%llx when instantiating an LSRecord from a persistent identifier.", buf, 0xCu);
      }

      unint64_t v12 = 0;
    }

    self = v12;
  }
  id v10 = -[LSRecord _initWithContext:persistentIdentifierData:length:](self, "_initWithContext:persistentIdentifierData:length:", a3, v7, [a4 length]);
LABEL_17:

  return v10;
}

+ (id)new
{
}

- (LSRecord)init
{
}

- (id)_initInvalid
{
  v3.receiver = self;
  v3.super_class = (Class)LSRecord;
  id result = [(LSRecord *)&v3 init];
  if (result)
  {
    *((unsigned char *)result + 31) = *((unsigned char *)result + 31) & 0x3F | 0x40;
    *((_WORD *)result + 15) = *((_WORD *)result + 15) & 0xC000 | 1;
  }
  return result;
}

- (void)_removeResolvedPropertyValueForGetter:(SEL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = _LSRecordLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v7 = 136446210;
    *(void *)&v7[4] = sel_getName(a3);
    _os_log_impl(&dword_182959000, v5, OS_LOG_TYPE_DEBUG, "Removing value of property %{public}s", v7, 0xCu);
  }

  os_unfair_recursive_lock_lock_with_options();
  *(void *)id v7 = a3;
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties) {
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__erase_unique<objc_selector *>(resolvedProperties, v7);
  }
  os_unfair_recursive_lock_unlock();
}

- (id)_attributedDescription
{
  objc_super v3 = self;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = v3;
  id v5 = v4;
  uint64_t p_context = (uint64_t)&v4->_context;
  db = v4->_context.db;
  if ((*((unsigned char *)v4 + 31) & 0x40) == 0 && !db) {
    __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__((uint64_t)v4, a2);
  }
  if (db)
  {
    v4;
    CSStoreGetUnit();
    _LSContextCreateVisualizer(p_context);
  }

  os_unfair_recursive_lock_unlock();

  return 0;
}

- (BOOL)_isShared
{
  return *((unsigned __int8 *)self + 31) >> 7;
}

- (unsigned)unitID
{
  return self->_unitID;
}

- (unsigned)tableID
{
  return *((unsigned __int16 *)self + 14);
}

- (id)description
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p>", objc_opt_class(), self];

  return v2;
}

- (id)debugDescription
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  if (self->_context.db) {
    id v5 = @"yes";
  }
  else {
    id v5 = @"no";
  }
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p> { table: %llx, unit: %llx, attached: %@ }", v4, self, *((unsigned __int16 *)self + 14), self->_unitID, v5];
  os_unfair_recursive_lock_unlock();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  int v9 = self->_context.db;
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithContext:tableID:unitID:", &v9, *((unsigned __int16 *)self + 14), self->_unitID);
  if (v5)
  {
    if (self->_context.db)
    {
      uint64_t v6 = _LSRecordLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = self;
        _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEBUG, "Copied attached record %@; not copying its properties.",
          buf,
          0xCu);
      }
    }
    else if (self->_resolvedProperties)
    {
      id v7 = _LSRecordLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = self;
        _os_log_impl(&dword_182959000, v7, OS_LOG_TYPE_DEBUG, "Copied detached record %@; copying its properties.",
          buf,
          0xCu);
      }

      operator new();
    }
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (BOOL)beginContentAccess
{
  os_unfair_recursive_lock_lock_with_options();
  int v4 = *((unsigned __int16 *)self + 15);
  if ((~v4 & 0x3FFF) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"LSRecord.mm" lineNumber:632 description:@"-[LSRecord beginContentAccess] counter saturated."];

    LOWORD(v4) = *((_WORD *)self + 15);
  }
  *((_WORD *)self + 15) = v4 & 0xC000 | (v4 + 1) & 0x3FFF;
  os_unfair_recursive_lock_unlock();
  return 1;
}

- (void)endContentAccess
{
  os_unfair_recursive_lock_lock_with_options();
  __int16 v4 = *((_WORD *)self + 15);
  if ((v4 & 0x3FFF) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"LSRecord.mm" lineNumber:643 description:@"-[LSRecord endContentAccess] counter saturated."];

    __int16 v4 = *((_WORD *)self + 15);
  }
  *((_WORD *)self + 15) = v4 & 0xC000 | (v4 - 1) & 0x3FFF;
  [(LSRecord *)self discardContentIfPossible];

  os_unfair_recursive_lock_unlock();
}

- (void)discardContentIfPossible
{
  os_unfair_recursive_lock_lock_with_options();
  resolvedProperties = self->_resolvedProperties;
  if (resolvedProperties && (*((_WORD *)self + 15) & 0x3FFF) == 0 && self->_context.db)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table((uint64_t)resolvedProperties);
    MEMORY[0x18530EAF0](v4, 0x10A0C408EF24B1CLL);
    self->_resolvedProperties = 0;
  }

  os_unfair_recursive_lock_unlock();
}

- (BOOL)isContentDiscarded
{
  os_unfair_recursive_lock_lock_with_options();
  resolvedProperties = self->_resolvedProperties;
  os_unfair_recursive_lock_unlock();
  return resolvedProperties == 0;
}

- (NSURL)visualizerURL
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__46;
  int v9 = __Block_byref_object_dispose__46;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__LSRecord_CSStoreViewerAdditions__visualizerURL__block_invoke;
  v4[3] = &unk_1E522FCA8;
  v4[4] = &v5;
  [(LSRecord *)self _ifAttached:v4 else:0];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSURL *)v2;
}

void __49__LSRecord_CSStoreViewerAdditions__visualizerURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [MEMORY[0x1E4F5D0F8] URLForUnit:a4 inTable:a3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (NSUUID)databaseUUID
{
  id v2 = [(LSRecord *)self persistentIdentifier];
  id v3 = _LSPersistentIdentifierGetKnowledgeUUIDInternal(v2);

  return (NSUUID *)v3;
}

- (void)resolveAllPropertiesAndDetachOnQueue:(id)a3
{
  id v3 = self;
  +[LSRecord resolveAllPropertiesOfRecords:&v3 count:1 andDetachOnQueue:a3];
}

void __79__LSRecord_LSDetachable__resolveAllPropertiesOfRecords_count_andDetachOnQueue___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = *(id **)(a1 + 40);
  if (v1 != v2)
  {
    id v3 = *(id **)(a1 + 32);
    do
    {
      id WeakRetained = objc_loadWeakRetained(v3);
      [WeakRetained _resolveAllProperties];

      ++v3;
    }
    while (v3 != v2);
    do
    {
      id v5 = objc_loadWeakRetained(v1);
      [v5 detach];

      ++v1;
    }
    while (v1 != v2);
  }
}

+ (void)resolveAllPropertiesOfRecords:(id)a3 andDetachOnQueue:(id)a4
{
  if (!a3)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"LSRecord.mm", 759, @"Invalid parameter not satisfying: %@", @"records != nil" object file lineNumber description];
  }
  unint64_t v7 = [a3 count];
  if (v7 > 0x80)
  {
    __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v10 = 0;
    std::vector<LSRecord *>::resize((uint64_t)&__p, v7, &v10);
    objc_msgSend(a3, "getObjects:range:", __p, 0, v7);
    [a1 resolveAllPropertiesOfRecords:__p count:v7 andDetachOnQueue:a4];
    if (__p)
    {
      uint64_t v12 = __p;
      operator delete(__p);
    }
  }
  else
  {
    objc_msgSend(a3, "getObjects:range:", &__p, 0, v7);
    [a1 resolveAllPropertiesOfRecords:&__p count:v7 andDetachOnQueue:a4];
  }
}

- (id)_compatibilityObjectWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  return 0;
}

+ (NSArray)_propertyClasses
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  if (CSStoreGetUnit()) {
    return [(LSRecord *)self _initWithContext:a3 tableID:a4->var3 unitID:a4->var2];
  }

  return 0;
}

uint64_t __99__LSRecord_SubclassResponsibilities___replacementObjectForResolvedPropertyValue_forGetter_encoder___block_invoke()
{
  uint64_t result = objc_opt_class();
  -[LSRecord(SubclassResponsibilities) _replacementObjectForResolvedPropertyValue:forGetter:encoder:]::applicationRecordClass = result;
  return result;
}

@end