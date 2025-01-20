@interface SecCTKKey
+ (id)fromKeyRef:(__SecKey *)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)keychainAttributes;
- (NSDictionary)sessionParameters;
- (SecCTKKey)initWithAttributes:(id)a3 error:(id *)a4;
- (TKClientTokenObject)tokenObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromKey:(id)a3;
- (id)performOperation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
- (int64_t)algorithmID;
- (void)setSessionParameters:(id)a3;
- (void)setTokenObject:(id)a3;
@end

@implementation SecCTKKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionParameters, 0);
  objc_storeStrong((id *)&self->_keychainAttributes, 0);

  objc_storeStrong((id *)&self->_tokenObject, 0);
}

- (void)setSessionParameters:(id)a3
{
}

- (NSDictionary)sessionParameters
{
  return self->_sessionParameters;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void)setTokenObject:(id)a3
{
}

- (TKClientTokenObject)tokenObject
{
  return self->_tokenObject;
}

- (int64_t)algorithmID
{
  v2 = [(SecCTKKey *)self tokenObject];
  v3 = [v2 keychainAttributes];
  v4 = [v3 objectForKeyedSubscript:@"type"];

  if (([v4 isEqualToString:@"73"] & 1) != 0
    || ([v4 isEqualToString:@"2147483678"] & 1) != 0
    || ([v4 isEqualToString:@"2147483679"] & 1) != 0
    || ([v4 isEqualToString:@"2147483680"] & 1) != 0)
  {
    int64_t v5 = 3;
  }
  else if ([v4 isEqualToString:@"105"])
  {
    int64_t v5 = 4;
  }
  else if ([v4 isEqualToString:@"106"])
  {
    int64_t v5 = 5;
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SecCTKKey *)self tokenObject];
  v6 = [v5 session];
  v7 = [v6 token];
  v8 = [v7 tokenID];
  v9 = [v4 tokenObject];
  v10 = [v9 session];
  v11 = [v10 token];
  v12 = [v11 tokenID];
  if ([v8 isEqualToString:v12])
  {
    [(SecCTKKey *)self tokenObject];
    v20 = v22 = v5;
    [v20 objectID];
    v13 = v21 = v6;
    [v4 tokenObject];
    v14 = id v23 = v4;
    [v14 objectID];
    v15 = v8;
    v17 = v16 = v7;
    char v18 = [v13 isEqualToData:v17];

    v7 = v16;
    v8 = v15;

    id v4 = v23;
    v6 = v21;

    int64_t v5 = v22;
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)performOperation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12 || (unint64_t)[v12 length] <= 0x8000) {
    goto LABEL_6;
  }
  v15 = [(SecCTKKey *)self tokenObject];
  v16 = [v15 operation:a3 data:0 algorithms:v13 parameters:v14 error:a7];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
    char v18 = [v16 isEqual:v17];

    if ((v18 & 1) == 0)
    {

LABEL_6:
      v19 = [(SecCTKKey *)self tokenObject];
      v16 = [v19 operation:a3 data:v12 algorithms:v13 parameters:v14 error:a7];
    }
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SecCTKKey alloc];

  return [(SecCTKKey *)v4 initFromKey:self];
}

- (id)initFromKey:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SecCTKKey;
  int64_t v5 = [(SecCTKKey *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 sessionParameters];
    sessionParameters = v5->_sessionParameters;
    v5->_sessionParameters = (NSDictionary *)v6;

    uint64_t v8 = [v4 keychainAttributes];
    keychainAttributes = v5->_keychainAttributes;
    v5->_keychainAttributes = (NSDictionary *)v8;

    uint64_t v10 = [v4 tokenObject];
    tokenObject = v5->_tokenObject;
    v5->_tokenObject = (TKClientTokenObject *)v10;
  }
  return v5;
}

- (SecCTKKey)initWithAttributes:(id)a3 error:(id *)a4
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SecCTKKey;
  uint64_t v6 = [(SecCTKKey *)&v65 init];
  v7 = v6;
  if (v6)
  {
    if (!v6->_tokenObject)
    {
      uint64_t v8 = [v60 objectForKeyedSubscript:@"u_TokenSession"];
      if (!v8)
      {
        if (!CryptoTokenKitLibraryCore())
        {
          if (a4)
          {
            v31 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v77 = *MEMORY[0x1E4F28228];
            v78 = @"CryptoTokenKit is not available";
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            *a4 = [v31 errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:v32];
          }
          uint64_t v8 = 0;
          goto LABEL_43;
        }
        if (SecCTKIsQueryForSystemKeychain(v60))
        {
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2020000000;
          id v12 = (id *)getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr;
          uint64_t v74 = getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr;
          if (!getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getTKClientTokenParameterForceSystemSessionSymbolLoc_block_invoke;
            v69 = &unk_1E5484FA0;
            v70 = &v71;
            objc_super v13 = CryptoTokenKitLibrary();
            id v14 = dlsym(v13, "TKClientTokenParameterForceSystemSession");
            *(void *)(v70[1] + 24) = v14;
            getTKClientTokenParameterForceSystemSessionSymbolLoc_ptr = *(void *)(v70[1] + 24);
            id v12 = (id *)v72[3];
          }
          _Block_object_dispose(&v71, 8);
          if (!v12)
          {
            v57 = [MEMORY[0x1E4F28B00] currentHandler];
            v58 = [NSString stringWithUTF8String:"NSString *getTKClientTokenParameterForceSystemSession(void)"];
            objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, @"SecSoftLink.h", 41, @"%s", dlerror());

            __break(1u);
          }
          id v79 = *v12;
          v80[0] = MEMORY[0x1E4F1CC38];
          v15 = (void *)MEMORY[0x1E4F1C9E8];
          id v16 = v79;
          v17 = [v15 dictionaryWithObjects:v80 forKeys:&v79 count:1];
        }
        else
        {
          v17 = (void *)MEMORY[0x1E4F1CC08];
        }
        id v33 = objc_alloc((Class)getTKClientTokenClass());
        v34 = [v60 objectForKeyedSubscript:@"tkid"];
        v35 = (void *)[v33 initWithTokenID:v34];

        id v36 = objc_alloc((Class)getTKClientTokenSessionClass());
        v37 = [v60 objectForKeyedSubscript:@"u_AuthCtx"];
        uint64_t v8 = (void *)[v36 initWithToken:v35 LAContext:v37 parameters:v17 error:a4];

        if (!v8) {
          goto LABEL_43;
        }
      }
      v9 = [v60 objectForKeyedSubscript:@"toid"];
      if (v9)
      {
        uint64_t v10 = [v8 objectForObjectID:v9 error:a4];
        tokenObject = v7->_tokenObject;
        v7->_tokenObject = (TKClientTokenObject *)v10;
      }
      else
      {
        tokenObject = (TKClientTokenObject *)[v60 mutableCopy];
        char v18 = [v60 objectForKeyedSubscript:@"u_AuthCtx"];
        BOOL v19 = v18 == 0;

        if (!v19) {
          [(TKClientTokenObject *)tokenObject removeObjectForKey:@"u_AuthCtx"];
        }
        v20 = [v60 objectForKeyedSubscript:@"accc"];
        v21 = v20;
        if (v20)
        {
          CFTypeID v22 = CFGetTypeID(v20);
          if (v22 == SecAccessControlGetTypeID())
          {
            v30 = SecAccessControlCopyData((uint64_t)v21, v23, v24, v25, v26, v27, v28, v29);

            [(TKClientTokenObject *)tokenObject setObject:v30 forKeyedSubscript:@"accc"];
          }
          else
          {
            v30 = (__CFData *)v21;
          }
        }
        else
        {
          v30 = 0;
        }
        uint64_t v38 = [(TKClientTokenObject *)tokenObject copy];

        uint64_t v39 = [v8 createObjectWithAttributes:v38 error:a4];
        v40 = v7->_tokenObject;
        v7->_tokenObject = (TKClientTokenObject *)v39;

        id v60 = (id)v38;
      }

      BOOL v41 = v7->_tokenObject == 0;
      if (v41)
      {
LABEL_43:

        v55 = 0;
        goto LABEL_44;
      }
    }
    sessionParameters = v7->_sessionParameters;
    v7->_sessionParameters = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v43 = [(SecCTKKey *)v7 tokenObject];
    v44 = [v43 keychainAttributes];
    uint64_t v8 = (void *)[v44 mutableCopy];

    [v8 addEntriesFromDictionary:v60];
    CFDataRef v45 = [v8 objectForKeyedSubscript:@"accc"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v59 = v45;
      goto LABEL_32;
    }
    v59 = SecAccessControlCreateFromData((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v45, (__CFString **)a4);

    if (v59)
    {
      [v8 setObject:v59 forKeyedSubscript:@"accc"];
LABEL_32:
      [v8 removeObjectForKey:@"toid"];
      [v8 removeObjectForKey:@"u_TokenSession"];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v75[0] = @"type";
      v75[1] = @"kcls";
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
      uint64_t v47 = [v46 countByEnumeratingWithState:&v61 objects:v76 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v62 != v48) {
              objc_enumerationMutation(v46);
            }
            uint64_t v50 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            v51 = [v8 objectForKeyedSubscript:v50];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v52 = [v51 stringValue];
              [v8 setObject:v52 forKeyedSubscript:v50];
            }
          }
          uint64_t v47 = [v46 countByEnumeratingWithState:&v61 objects:v76 count:16];
        }
        while (v47);
      }

      [v8 setObject:@"keys" forKeyedSubscript:@"class"];
      [v8 setObject:@"1" forKeyedSubscript:@"kcls"];
      uint64_t v53 = [v8 copy];
      keychainAttributes = v7->_keychainAttributes;
      v7->_keychainAttributes = (NSDictionary *)v53;

      goto LABEL_42;
    }
    goto LABEL_43;
  }
LABEL_42:
  v55 = v7;
LABEL_44:

  return v55;
}

+ (id)fromKeyRef:(__SecKey *)a3
{
  return *((id *)a3 + 3);
}

@end