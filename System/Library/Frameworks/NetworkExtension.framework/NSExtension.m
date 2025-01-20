@interface NSExtension
- (id)extensionHostContextForUUID:(void *)a1;
@end

@implementation NSExtension

- (id)extensionHostContextForUUID:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = [a1 _extensionContextForUUID:a2];
    v3 = (void *)v2;
    if (v2)
    {
      v4 = *(id *)(v2 + 72);
      if (v4
        || ([v3 _auxiliaryConnection], (v4 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v5 = [NEProcessIdentity alloc];
        v6 = [v4 _xpcConnection];
        id v7 = [(NEProcessIdentity *)v5 initFromXPCConnection:v6];
        objc_setProperty_atomic(v3, v8, v7, 64);

        if (objc_getProperty(v3, v9, 64, 1))
        {

          goto LABEL_7;
        }
        v11 = ne_log_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "Failed to create a NEProcessIdentity object", v13, 2u);
        }
      }
      else
      {
        v4 = ne_log_obj();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Failed to derive the process identity, no vendor connection available", buf, 2u);
        }
      }

      id v10 = 0;
      goto LABEL_14;
    }
LABEL_7:
    id v10 = v3;
LABEL_14:

    goto LABEL_15;
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

@end