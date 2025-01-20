@interface _LSApplicationExtensionRecordEnumerator
- (BOOL)_evaluatePluginNoIO:(unsigned int)a3 data:(const LSPluginData *)a4 extensionPointID:(unsigned int)a5 context:(LSContext *)a6;
- (BOOL)_getExtensionPointID:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5;
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPoint:(id)a3 options:(unint64_t)a4;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 filter:(id)a5;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5 filter:(id)a6;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _LSApplicationExtensionRecordEnumerator

- (BOOL)_evaluatePluginNoIO:(unsigned int)a3 data:(const LSPluginData *)a4 extensionPointID:(unsigned int)a5 context:(LSContext *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5 && a4->var4 != a5)
  {
    uint64_t v16 = _LSEnumeratorLog;
    BOOL v17 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v17) {
      return v17;
    }
    uint64_t var4 = a4->var4;
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = a3;
    __int16 v31 = 2048;
    *(void *)v32 = a5;
    *(_WORD *)&v32[8] = 2048;
    uint64_t v33 = var4;
    v19 = "Skipping plugin %llx during enumeration because it is on the wrong extension point (want %llx, had %llx)";
    v20 = v16;
    uint32_t v21 = 32;
    goto LABEL_20;
  }
  unint64_t options = self->_options;
  if (options & 1) != 0 && (*(unsigned char *)&a4->var0.flags)
  {
    BOOL v17 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v17) {
      return v17;
    }
    -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.4();
LABEL_30:
    LOBYTE(v17) = 0;
    return v17;
  }
  unsigned int platform = self->_platform;
  if (platform && a4->var0.platform != platform)
  {
    uint64_t v22 = _LSEnumeratorLog;
    BOOL v17 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v17) {
      return v17;
    }
    unsigned int v23 = a4->var0.platform;
    unsigned int v24 = self->_platform;
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = a3;
    __int16 v31 = 1024;
    *(_DWORD *)v32 = v23;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v24;
    v19 = "Skipping plugin %llx during enumeration because it is the wrong platform (%x, want %x)";
    v20 = v22;
    uint32_t v21 = 24;
LABEL_20:
    _os_log_debug_impl(&dword_182959000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_30;
  }
  if ((options & 0x4000000000000000) == 0)
  {
    uint64_t v13 = _LSBundleGet(a6->db, a4->var8);
    if (v13)
    {
      if (((*(unsigned __int16 *)(v13 + 189) | (*(unsigned __int8 *)(v13 + 191) << 16)) & 0x100000) != 0)
      {
        int v29 = 0;
        *(void *)buf = 0;
        _LSExtensionPointFindWithStringID(a6->db, a4->var4, a4->var0.platform, 0, &v29, buf);
        if (*(void *)buf)
        {
          uint64_t v14 = *(void *)(*(void *)buf + 68);
          BOOL v15 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
          if ((v14 & 1) == 0)
          {
            if (v15) {
              -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:]();
            }
            goto LABEL_30;
          }
          if (v15) {
            -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:]();
          }
        }
      }
    }
  }
  if (self->_filterBlock)
  {
    v25 = +[_LSLazyPropertyList lazyPropertyListWithContext:a6 unit:a4->var0.infoDictionary];
    v26 = +[_LSLazyPropertyList lazyPropertyListWithContext:a6 unit:_LSPluginGetSDKDictionaryDataUnit(a6->db, a3, (uint64_t)a4)];
    v27 = [[_LSPlugInPropertyList alloc] initWithInfoPlist:v25 SDKPlist:v26];
    objc_storeStrong((id *)&self->_propertyList, v27);
    if (((*((uint64_t (**)(void))self->_filterBlock + 2))() & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
        -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:]();
      }

      goto LABEL_30;
    }
  }
  LOBYTE(v17) = 1;
  return v17;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_plugins.__begin_;
  unint64_t v7 = self->_plugins.__end_ - begin;
  if (v7 > a4)
  {
    uint64_t v11 = begin[a4];
    uint64_t v12 = _LSGetPlugin((uint64_t)a5->db, begin[a4]);
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v14 = self->_options >> 63;
      db = a5->db;
      uint32_t v21 = 0;
      int IsValid = _LSPluginIsValid(db, v11, v13, 0, v14, &v21);
      BOOL v17 = v21;
      if (IsValid)
      {
        if (self->_extensionPointRecord) {
          id v18 = [[LSApplicationExtensionRecord alloc] _initWithContext:a5 pluginID:v11 pluginData:v13 extensionPointRecord:self->_extensionPointRecord error:0];
        }
        else {
          id v18 = [[LSApplicationExtensionRecord alloc] _initWithContext:a5 pluginID:v11 pluginData:v13 error:0];
        }
        id v19 = *a3;
        *a3 = v18;
      }
      else if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
      {
        -[_LSApplicationExtensionRecordEnumerator _getObject:atIndex:context:]();
      }
    }
  }
  return v7 > a4;
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPoint:(id)a3 options:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationExtensionRecordEnumerator;
  v6 = [(_LSDBEnumerator *)&v10 _initWithContext:0];
  if (v6)
  {
    unint64_t v7 = [a3 identifier];
    objc_storeStrong((id *)&v6->_extensionPointID, v7);
    v6->_unint64_t options = a4;
    id filterBlock = v6->_filterBlock;
    v6->_id filterBlock = 0;

    v6->_unsigned int platform = [a3 platform];
    objc_storeStrong((id *)&v6->_extensionPointRecord, a3);
  }
  return v6;
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_plugins = &self->_plugins;
  begin = self->_plugins.__begin_;
  if (begin)
  {
    p_plugins->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_extensionPointRecord, 0);

  objc_storeStrong((id *)&self->_extensionPointID, 0);
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  int v20 = 0;
  BOOL v6 = [(_LSApplicationExtensionRecordEnumerator *)self _getExtensionPointID:&v20 context:a3 error:a4];
  if (v6)
  {
    int v7 = (LOBYTE(self->_options) >> 4) & 1;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69___LSApplicationExtensionRecordEnumerator__prepareWithContext_error___block_invoke;
    v17[3] = &unk_1E5230028;
    int v18 = v20;
    v17[4] = self;
    v17[5] = a3;
    char v19 = v7;
    id v8 = (id)MEMORY[0x18530F950](v17);
    _CSStringBindingEnumerateAllBindings();
    v9 = _LSEnumeratorLog;
    if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
      -[_LSApplicationExtensionRecordEnumerator _prepareWithContext:error:]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  return v6;
}

- (BOOL)_getExtensionPointID:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFStringRef extensionPointID = (const __CFString *)self->_extensionPointID;
  if (!extensionPointID) {
    goto LABEL_5;
  }
  unsigned int StringForCFString = _LSDatabaseGetStringForCFString(a4->db, extensionPointID, 0);
  if (!StringForCFString)
  {
    v9 = _LSEnumeratorLog;
    BOOL v10 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEFAULT);
    unsigned int StringForCFString = 0;
    if (v10)
    {
      uint64_t v11 = self->_extensionPointID;
      int v13 = 138477827;
      uint64_t v14 = v11;
      _os_log_impl(&dword_182959000, v9, OS_LOG_TYPE_DEFAULT, "Could not find extension point %{private}@ in database; will yield nothing",
        (uint8_t *)&v13,
        0xCu);
LABEL_5:
      unsigned int StringForCFString = 0;
    }
  }
  if (a3) {
    *a3 = StringForCFString;
  }
  return 1;
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4
{
  return [(_LSApplicationExtensionRecordEnumerator *)self initWithExtensionPointIdentifier:a3 options:a4 platform:0];
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5
{
  return [(_LSApplicationExtensionRecordEnumerator *)self initWithExtensionPointIdentifier:a3 options:a4 platform:*(void *)&a5 filter:0];
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  return [(_LSApplicationExtensionRecordEnumerator *)self initWithExtensionPointIdentifier:a3 options:a4 platform:0 filter:a5];
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5 filter:(id)a6
{
  v18.receiver = self;
  v18.super_class = (Class)_LSApplicationExtensionRecordEnumerator;
  BOOL v10 = [(_LSDBEnumerator *)&v18 _initWithContext:0];
  if (v10)
  {
    uint64_t v11 = [a3 copy];
    CFStringRef extensionPointID = v10->_extensionPointID;
    v10->_CFStringRef extensionPointID = (NSString *)v11;

    v10->_unint64_t options = a4;
    uint64_t v13 = [a6 copy];
    id filterBlock = v10->_filterBlock;
    v10->_id filterBlock = (id)v13;

    v10->_unsigned int platform = a5;
    if (a6)
    {
      uint64_t v15 = _LSLazyPropertyListGetSharedEmptyPropertyList();
      propertyList = v10->_propertyList;
      v10->_propertyList = (LSPropertyList *)v15;
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_LSApplicationExtensionRecordEnumerator;
  v5 = -[_LSDBEnumerator copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_extensionPointID copyWithZone:a3];
    CFStringRef extensionPointID = v5->_extensionPointID;
    v5->_CFStringRef extensionPointID = (NSString *)v6;

    v5->_unint64_t options = self->_options;
    uint64_t v8 = [self->_filterBlock copy];
    id filterBlock = v5->_filterBlock;
    v5->_id filterBlock = (id)v8;

    BOOL v10 = [(LSPropertyList *)self->_propertyList copyWithZone:a3];
    propertyList = v5->_propertyList;
    v5->_propertyList = v10;

    if (v5 != self) {
      std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>((char *)&v5->_plugins, (char *)self->_plugins.__begin_, (uint64_t)self->_plugins.__end_, self->_plugins.__end_ - self->_plugins.__begin_);
    }
    objc_storeStrong((id *)&v5->_extensionPointRecord, self->_extensionPointRecord);
  }
  return v5;
}

- (void)_prepareWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getObject:atIndex:context:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_12();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_182959000, v1, OS_LOG_TYPE_DEBUG, "Skipping plugin %llx during enumeration because it is invalid: %{public}@", v2, 0x16u);
}

@end