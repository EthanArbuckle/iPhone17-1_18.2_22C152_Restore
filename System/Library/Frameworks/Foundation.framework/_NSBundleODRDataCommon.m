@interface _NSBundleODRDataCommon
- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4;
- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4;
- (_NSBundleODRDataCommon)initWithBundle:(id)a3;
- (void)dealloc;
@end

@implementation _NSBundleODRDataCommon

- (_NSBundleODRDataCommon)initWithBundle:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_NSBundleODRDataCommon;
  v4 = [(_NSBundleODRDataCommon *)&v6 init];
  v4->_bundle = (NSBundle *)a3;
  v4->_assetPackToURL = (NSMutableDictionary *)objc_opt_new();
  v4->_lock = (NSLock *)objc_opt_new();
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  if (self->_sandboxToken >= 1) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRDataCommon;
  [(_NSBundleODRDataCommon *)&v3 dealloc];
}

- (BOOL)assetPacksBecameAvailable:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  uint64_t v17 = 0;
  [(NSLock *)self->_lock lock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58___NSBundleODRDataCommon_assetPacksBecameAvailable_error___block_invoke;
  v11[3] = &unk_1E51FA550;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  [(NSLock *)self->_lock unlock];
  uint64_t v7 = v13;
  if (a4)
  {
    if (!*((unsigned char *)v19 + 24))
    {
      v8 = (void *)v13[5];
      if (v8)
      {
        *a4 = v8;
        uint64_t v7 = v13;
      }
    }
  }

  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)assetPacksBecameUnavailable:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__14;
  v16 = __Block_byref_object_dispose__14;
  uint64_t v17 = 0;
  [(NSLock *)self->_lock lock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60___NSBundleODRDataCommon_assetPacksBecameUnavailable_error___block_invoke;
  v11[3] = &unk_1E51FA550;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  [(NSLock *)self->_lock unlock];
  uint64_t v7 = v13;
  if (a4)
  {
    if (!*((unsigned char *)v19 + 24))
    {
      v8 = (void *)v13[5];
      if (v8)
      {
        *a4 = v8;
        uint64_t v7 = v13;
      }
    }
  }

  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

@end