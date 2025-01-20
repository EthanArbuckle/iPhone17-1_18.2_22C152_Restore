@interface _LSApplicationRecordEnumerator
- (BOOL)_enumerateAllBundles;
- (BOOL)_getContainer:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5;
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (_LSApplicationRecordEnumerator)initWithContext:(LSContext *)a3 volumeURL:(id)a4 options:(unint64_t)a5;
- (id).cxx_construct;
- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)bundleClass;
- (void)setBundleClass:(unsigned int)a3;
@end

@implementation _LSApplicationRecordEnumerator

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_bundleIdentifiersOrUnits.__begin_;
  unint64_t v7 = self->_bundleIdentifiersOrUnits.__end_ - begin;
  if (v7 > a4)
  {
    v9 = [(_LSApplicationRecordEnumerator *)self _applicationRecordWithContext:a5 bundleIdentifierOrUnit:begin[a4]];
    id v10 = *a3;
    *a3 = v9;
  }
  return v7 > a4;
}

- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4
{
  v4 = *(LSContext **)&a4;
  unsigned int v31 = 0;
  id v30 = 0;
  if ([(_LSApplicationRecordEnumerator *)self _enumerateAllBundles])
  {
    id v7 = (id)_LSBundleGet(a3->db, (int)v4);
    id v30 = v7;
    if (!v7) {
      goto LABEL_22;
    }
    if (!evaluateBundleNoIOCommon(v4, (uint64_t)v7, (const LSBundleData *)self->_options))
    {
      id v7 = 0;
      goto LABEL_22;
    }
    unsigned int v31 = v4;
    BOOL v8 = 1;
  }
  else
  {
    v9 = (LSContext *)_CSStringCopyCFString();
    v4 = v9;
    if (v9)
    {
      unint64_t options = self->_options;
      unsigned int bundleClass = self->_bundleClass;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke;
      v26[3] = &unk_1E522BCA0;
      v26[4] = self;
      v28 = a3;
      v12 = v9;
      v27 = v12;
      unsigned int v29 = bundleClass;
      uint64_t v13 = MEMORY[0x18530F950](v26);
      v14 = (uint64_t (**)(void, void, void, void))v13;
      if ((options & 0xC0) == 0x40) {
        char v15 = 0;
      }
      else {
        char v15 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, id *))(v13 + 16))(v13, 128, &v31, &v30);
      }
      if ((v15 & 1) == 0 && (options & 0x40) != 0) {
        char v15 = ((uint64_t (**)(void, uint64_t, unsigned int *, id *))v14)[2](v14, 1152, &v31, &v30);
      }
      if ((v15 & 1) == 0)
      {
        v17 = _LSEnumeratorLog;
        if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
          -[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:]((uint64_t)v12, v17, v18, v19, v20, v21, v22, v23);
        }
      }
    }
    else
    {
      v16 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10817, (uint64_t)"-[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:]", 256, 0);
      _LSEnumeratorFireErrorHandler((atomic_uchar *)self, v16);
    }
    LODWORD(v4) = v31;
    BOOL v8 = v30 != 0;
  }
  id v7 = 0;
  if (v4 && v8)
  {
    v24 = [LSApplicationRecord alloc];
    id v7 = [(LSApplicationRecord *)v24 _initWithContext:a3 bundleID:v31 bundleData:v30 error:0];
  }
LABEL_22:

  return v7;
}

- (BOOL)_enumerateAllBundles
{
  return (~LODWORD(self->_options) & 0xD0) == 0;
}

- (_LSApplicationRecordEnumerator)initWithContext:(LSContext *)a3 volumeURL:(id)a4 options:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_LSApplicationRecordEnumerator;
  id v7 = [(_LSDBEnumerator *)&v10 _initWithContext:a3];
  BOOL v8 = v7;
  if (v7)
  {
    v7->_unint64_t options = a5;
    objc_storeStrong((id *)&v7->_volumeURL, a4);
    v8->_unsigned int bundleClass = 2;
  }
  return v8;
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_bundleIdentifiersOrUnits = &self->_bundleIdentifiersOrUnits;
  begin = self->_bundleIdentifiersOrUnits.__begin_;
  if (begin)
  {
    p_bundleIdentifiersOrUnits->__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_volumeURL, 0);
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  BOOL v5 = [(_LSApplicationRecordEnumerator *)self _getContainer:&self->_container context:a3 error:a4];
  if (v5)
  {
    if ([(_LSApplicationRecordEnumerator *)self _enumerateAllBundles]) {
      _CSStoreEnumerateUnits();
    }
    else {
      _CSStringBindingEnumerateAllBindings();
    }
    v6 = _LSEnumeratorLog;
    if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
      -[_LSApplicationRecordEnumerator _prepareWithContext:error:]((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  volumeURL = self->_volumeURL;
  self->_volumeURL = 0;

  return v5;
}

- (BOOL)_getContainer:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_LSApplicationRecordEnumerator;
  BOOL v5 = -[_LSDBEnumerator copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSURL *)self->_volumeURL copyWithZone:a3];
    volumeURL = v5->_volumeURL;
    v5->_volumeURL = (NSURL *)v6;

    v5->_unint64_t options = self->_options;
    if (v5 != self) {
      std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>((char *)&v5->_bundleIdentifiersOrUnits, (char *)self->_bundleIdentifiersOrUnits.__begin_, (uint64_t)self->_bundleIdentifiersOrUnits.__end_, self->_bundleIdentifiersOrUnits.__end_ - self->_bundleIdentifiersOrUnits.__begin_);
    }
    v5->_container = self->_container;
    v5->_unsigned int bundleClass = self->_bundleClass;
  }
  return v5;
}

- (unsigned)bundleClass
{
  return self->_bundleClass;
}

- (void)setBundleClass:(unsigned int)a3
{
  self->_unsigned int bundleClass = a3;
}

- (void)_prepareWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end