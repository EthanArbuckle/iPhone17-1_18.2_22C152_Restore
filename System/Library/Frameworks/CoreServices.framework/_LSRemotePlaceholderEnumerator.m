@interface _LSRemotePlaceholderEnumerator
- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4;
@end

@implementation _LSRemotePlaceholderEnumerator

- (id)_applicationRecordWithContext:(LSContext *)a3 bundleIdentifierOrUnit:(unsigned int)a4
{
  v4 = *(LSContext **)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v25 = 0;
  id v24 = 0;
  if ([(_LSApplicationRecordEnumerator *)self _enumerateAllBundles])
  {
    id v7 = (id)_LSBundleGet(a3->db, (int)v4);
    id v24 = v7;
    if (!v7) {
      goto LABEL_16;
    }
    if (!evaluateBundleNoIOCommon(v4, (uint64_t)v7, (const LSBundleData *)self->super._options))
    {
      id v7 = 0;
      goto LABEL_16;
    }
    unsigned int v25 = v4;
    BOOL v8 = 1;
  }
  else
  {
    v4 = (LSContext *)_CSStringCopyCFString();
    if (v4)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __87___LSRemotePlaceholderEnumerator__applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke;
      v23[3] = &unk_1E522BC78;
      v23[4] = self;
      v9 = (void *)MEMORY[0x18530F950](v23);
      memset(v26, 0, sizeof(v26));
      int v10 = [(_LSApplicationRecordEnumerator *)self bundleClass];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      LOBYTE(v10) = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)a3, 0, v4, 0, v26, v10, 33792, v12, v9, &v25, &v24, 0);

      if ((v10 & 1) == 0)
      {
        v13 = _LSEnumeratorLog;
        if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
          -[_LSApplicationRecordEnumerator(Private) _applicationRecordWithContext:bundleIdentifierOrUnit:]((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
        }
      }
    }
    else
    {
      v20 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -10817, (uint64_t)"-[_LSRemotePlaceholderEnumerator _applicationRecordWithContext:bundleIdentifierOrUnit:]", 314, 0);
      _LSEnumeratorFireErrorHandler((atomic_uchar *)self, v20);
    }
    LODWORD(v4) = v25;
    BOOL v8 = v24 != 0;
  }
  id v7 = 0;
  if (v4 && v8)
  {
    v21 = [LSApplicationRecord alloc];
    id v7 = [(LSApplicationRecord *)v21 _initWithContext:a3 bundleID:v25 bundleData:v24 error:0];
  }
LABEL_16:

  return v7;
}

@end