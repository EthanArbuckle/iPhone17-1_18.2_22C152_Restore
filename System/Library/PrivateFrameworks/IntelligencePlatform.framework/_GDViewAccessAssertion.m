@interface _GDViewAccessAssertion
- (BOOL)alwaysAvailable;
- (NSString)viewArtifactTableName;
- (NSString)viewName;
- (NSURL)viewArtifactURL;
- (_GDViewAccessAssertion)initWithViewName:(id)a3 extensionToken:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation _GDViewAccessAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewArtifactTableName, 0);
  objc_storeStrong((id *)&self->_viewArtifactURL, 0);

  objc_storeStrong((id *)&self->_viewName, 0);
}

- (BOOL)alwaysAvailable
{
  return self->_alwaysAvailable;
}

- (NSString)viewArtifactTableName
{
  return self->_viewArtifactTableName;
}

- (NSURL)viewArtifactURL
{
  return self->_viewArtifactURL;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_handle != -1)
  {
    int v3 = sandbox_extension_release();
    v4 = GDViewLog();
    v5 = v4;
    if (v3 == -1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        viewName = self->_viewName;
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 138412546;
        v13 = viewName;
        __int16 v14 = 2080;
        v15 = v10;
        _os_log_fault_impl(&dword_1B2996000, v5, OS_LOG_TYPE_FAULT, "Error releasing sandbox extension token for %@: %s", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_viewName;
      viewArtifactURL = self->_viewArtifactURL;
      *(_DWORD *)buf = 138412546;
      v13 = v6;
      __int16 v14 = 2112;
      v15 = viewArtifactURL;
      _os_log_impl(&dword_1B2996000, v5, OS_LOG_TYPE_DEFAULT, "Released sandbox extension for %@ at %@", buf, 0x16u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)_GDViewAccessAssertion;
  [(_GDViewAccessAssertion *)&v11 dealloc];
}

- (_GDViewAccessAssertion)initWithViewName:(id)a3 extensionToken:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v82.receiver = self;
  v82.super_class = (Class)_GDViewAccessAssertion;
  v10 = [(_GDViewAccessAssertion *)&v82 init];
  v15 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  v10->_handle = -1;
  uint64_t v16 = objc_msgSend_copy(v8, v11, v12, v13, v14);
  viewName = v15->_viewName;
  v15->_viewName = (NSString *)v16;

  v22 = objc_msgSend_url(v9, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_copy(v22, v23, v24, v25, v26);
  viewArtifactURL = v15->_viewArtifactURL;
  v15->_viewArtifactURL = (NSURL *)v27;

  v33 = objc_msgSend_tableName(v9, v29, v30, v31, v32);
  uint64_t v38 = objc_msgSend_copy(v33, v34, v35, v36, v37);
  viewArtifactTableName = v15->_viewArtifactTableName;
  v15->_viewArtifactTableName = (NSString *)v38;

  v15->_alwaysAvailable = objc_msgSend_alwaysAvailable(v9, v40, v41, v42, v43);
  v48 = objc_msgSend_token(v9, v44, v45, v46, v47);
  uint64_t v53 = objc_msgSend_length(v48, v49, v50, v51, v52);

  if (!v53)
  {
LABEL_7:
    v68 = v15;
    goto LABEL_8;
  }
  v58 = objc_msgSend_token(v9, v54, v55, v56, v57);
  objc_msgSend_bytes(v58, v59, v60, v61, v62);
  uint64_t v63 = sandbox_extension_consume();
  if (v63 != -1)
  {
    uint64_t v64 = v63;
    v65 = GDViewLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      v66 = v15->_viewName;
      v67 = v15->_viewArtifactURL;
      *(_DWORD *)buf = 138412546;
      v86 = v66;
      __int16 v87 = 2112;
      v88 = v67;
      _os_log_impl(&dword_1B2996000, v65, OS_LOG_TYPE_DEFAULT, "Consumed sandbox extension for %@ at %@", buf, 0x16u);
    }

    v15->_handle = v64;
    goto LABEL_7;
  }
  v70 = NSString;
  v71 = __error();
  v72 = strerror(*v71);
  objc_msgSend_stringWithCString_encoding_(v70, v73, (uint64_t)v72, 4, v74);
  v75 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v76 = GDViewLog();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
  {
    v81 = v15->_viewName;
    *(_DWORD *)buf = 138412546;
    v86 = v81;
    __int16 v87 = 2112;
    v88 = v75;
    _os_log_fault_impl(&dword_1B2996000, v76, OS_LOG_TYPE_FAULT, "Error consuming sandbox extension token for %@: %@", buf, 0x16u);
  }

  if (a5)
  {
    id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84 = v75;
    v79 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v78, (uint64_t)&v84, (uint64_t)&v83, 1);
    *a5 = (id)objc_msgSend_initWithDomain_code_userInfo_(v77, v80, @"GDErrorDomain", 11, (uint64_t)v79);
  }
  v68 = 0;
LABEL_8:

  return v68;
}

@end