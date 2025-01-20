@interface FPItemToURLResourcesConverter
+ (id)dictionaryFromItem:(id)a3 requestedKeys:(id)a4;
- (FPItemToURLResourcesConverter)initWithItemClass:(Class)a3;
- (id)_dictionaryFromItem:(id)a3 requestedKeys:(id)a4;
- (void)_addHelperMethodsToClass:(Class)a3;
- (void)_addMethod:(SEL)a3 toClass:(Class)a4;
- (void)_cacheImplementedPropertiesForClass:(Class)a3;
@end

@implementation FPItemToURLResourcesConverter

- (FPItemToURLResourcesConverter)initWithItemClass:(Class)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FPItemToURLResourcesConverter;
  v4 = [(FPItemToURLResourcesConverter *)&v12 init];
  if (v4)
  {
    uint64_t section = __fp_create_section();
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FPItemToURLResourcesConverter initWithItemClass:]();
    }

    uint64_t v6 = objc_opt_new();
    gettersByURLKey = v4->_gettersByURLKey;
    v4->_gettersByURLKey = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    typesByURLKey = v4->_typesByURLKey;
    v4->_typesByURLKey = (NSMutableDictionary *)v8;

    [(FPItemToURLResourcesConverter *)v4 _addHelperMethodsToClass:a3];
    [(FPItemToURLResourcesConverter *)v4 _cacheImplementedPropertiesForClass:a3];
    __fp_leave_section_Debug((uint64_t)&section);
  }
  return v4;
}

- (void)_addMethod:(SEL)a3 toClass:(Class)a4
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v6, a3);
  uint64_t v8 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v8, a3);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);

  class_addMethod(a4, a3, MethodImplementation, TypeEncoding);
}

- (void)_addHelperMethodsToClass:(Class)a3
{
  [(FPItemToURLResourcesConverter *)self _addMethod:sel_fp_downloadingStatus toClass:a3];
  [(FPItemToURLResourcesConverter *)self _addMethod:sel_fp_isReadable toClass:a3];
  [(FPItemToURLResourcesConverter *)self _addMethod:sel_fp_isWritable toClass:a3];
  [(FPItemToURLResourcesConverter *)self _addMethod:sel_fp_sharingCurrentUserRole toClass:a3];

  [(FPItemToURLResourcesConverter *)self _addMethod:sel_fp_sharingCurrentUserPermissions toClass:a3];
}

- (void)_cacheImplementedPropertiesForClass:(Class)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t section = __fp_create_section();
  v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[FPItemToURLResourcesConverter _cacheImplementedPropertiesForClass:]();
  }

  FPItemPropertyNamesByURLResourceKey();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v7 = 138412546;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, v18);
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_super v12 = NSSelectorFromString(v11);
        if ([(objc_class *)a3 instancesRespondToSelector:v12])
        {
          v13 = [(objc_class *)a3 instanceMethodSignatureForSelector:v12];
          v14 = NSString;
          v15 = v13;
          v16 = objc_msgSend(v14, "stringWithUTF8String:", -[NSObject methodReturnType](v15, "methodReturnType"));
          [(NSMutableDictionary *)self->_typesByURLKey setObject:v16 forKeyedSubscript:v10];

          v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", class_getMethodImplementation(a3, v12));
          [(NSMutableDictionary *)self->_gettersByURLKey setObject:v17 forKeyedSubscript:v10];
        }
        else
        {
          v15 = fp_current_or_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            __int16 v27 = 2112;
            Class v28 = a3;
            _os_log_debug_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] property %@ is unavailable on %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v6);
  }

  __fp_leave_section_Debug((uint64_t)&section);
}

- (id)_dictionaryFromItem:(id)a3 requestedKeys:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  v9 = [v6 filename];
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1C6E8]];

  char v10 = objc_opt_respondsToSelector();
  v11 = (void *)MEMORY[0x1E4F1C728];
  if (v10)
  {
    objc_super v12 = [v6 contentType];
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1C538]];

    v13 = [v6 contentType];
    v14 = [v13 identifier];
    [v8 setObject:v14 forKeyedSubscript:*v11];
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F1C728];
    v13 = [v6 typeIdentifier];
    [v8 setObject:v13 forKeyedSubscript:v15];
  }

  uint64_t v89 = *MEMORY[0x1E4F1C770];
  if (objc_msgSend(v7, "containsObject:"))
  {
    uint64_t v16 = *MEMORY[0x1E4F1C758];
    if (([v7 containsObject:*MEMORY[0x1E4F1C758]] & 1) == 0)
    {
      uint64_t v17 = [v7 arrayByAddingObject:v16];

      id v7 = (id)v17;
    }
  }
  uint64_t v18 = *MEMORY[0x1E4F1C7E8];
  if ([v7 containsObject:*MEMORY[0x1E4F1C7E8]])
  {
    uint64_t v19 = [v7 arrayByAddingObject:*MEMORY[0x1E4F1C7B0]];

    id v7 = (id)v19;
  }
  uint64_t v86 = *MEMORY[0x1E4F1C7C8];
  if (objc_msgSend(v7, "containsObject:"))
  {
    uint64_t v20 = [v7 arrayByAddingObject:*MEMORY[0x1E4F1C7C0]];

    id v7 = (id)v20;
  }
  uint64_t v87 = *MEMORY[0x1E4F1C690];
  if (objc_msgSend(v7, "containsObject:"))
  {
    uint64_t v21 = *MEMORY[0x1E4F1C758];
    if (([v7 containsObject:*MEMORY[0x1E4F1C758]] & 1) == 0)
    {
      uint64_t v22 = [v7 arrayByAddingObject:v21];

      id v7 = (id)v22;
    }
  }
  v91 = v8;
  v93 = v6;
  v88 = v7;
  uint64_t v85 = v18;
  if (v7)
  {
    id v23 = v7;
  }
  else
  {
    id v23 = [(NSMutableDictionary *)self->_gettersByURLKey allKeys];
  }
  v24 = v23;
  v94 = FPItemPropertyNamesByURLResourceKey();
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = v24;
  uint64_t v25 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v96 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v95 + 1) + 8 * i);
        uint64_t v30 = [(NSMutableDictionary *)self->_gettersByURLKey objectForKeyedSubscript:v29];
        v31 = (void (*)(void *, SEL))[v30 pointerValue];

        v32 = [(NSMutableDictionary *)self->_typesByURLKey objectForKeyedSubscript:v29];
        if (v31)
        {
          v33 = [v94 objectForKeyedSubscript:v29];
          if (!v33)
          {
            v34 = [MEMORY[0x1E4F28B00] currentHandler];
            [v34 handleFailureInMethod:a2 object:self file:@"FPItemConversion.m" lineNumber:404 description:@"property doesn't exist"];
          }
          SEL v35 = NSSelectorFromString(v33);
          id v36 = v32;
          int v37 = *(char *)[v36 UTF8String];
          if (v37 <= 80)
          {
            switch(v37)
            {
              case '@':
                uint64_t v38 = v31(v93, v35);
                break;
              case 'B':
                uint64_t v38 = objc_msgSend(NSNumber, "numberWithBool:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
                break;
              case 'L':
                uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
                break;
              default:
                goto LABEL_40;
            }
          }
          else if (v37 > 107)
          {
            if (v37 == 108)
            {
              uint64_t v38 = objc_msgSend(NSNumber, "numberWithLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
            }
            else
            {
              if (v37 != 113) {
                goto LABEL_40;
              }
              uint64_t v38 = objc_msgSend(NSNumber, "numberWithLongLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
            }
          }
          else
          {
            if (v37 != 81)
            {
              if (v37 == 99)
              {
                uint64_t v38 = objc_msgSend(NSNumber, "numberWithChar:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
                goto LABEL_43;
              }
LABEL_40:
              v39 = fp_current_or_default_log();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v100 = v36;
                __int16 v101 = 2112;
                v102 = v33;
                _os_log_error_impl(&dword_1A33AE000, v39, OS_LOG_TYPE_ERROR, "[ERROR] unsupported type '%@' for property: %@", buf, 0x16u);
              }
LABEL_45:

              goto LABEL_46;
            }
            uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
          }
LABEL_43:
          v39 = v38;
          if (v38)
          {
            [v91 setObject:v38 forKeyedSubscript:v29];
            goto LABEL_45;
          }
LABEL_46:
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
    }
    while (v26);
  }

  uint64_t v40 = *MEMORY[0x1E4F1C6A8];
  uint64_t v41 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F1C6A8]];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F1C788]];
    int v44 = [v43 BOOLValue];

    if (v44)
    {
      v45 = [v91 objectForKeyedSubscript:v40];
      int v46 = [v45 BOOLValue];

      v47 = (id *)MEMORY[0x1E4F1C7D8];
      if (v46) {
        v47 = (id *)MEMORY[0x1E4F1C7E0];
      }
      id v48 = *v47;
      [v91 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F1C7A8]];
    }
  }
  if ([v88 containsObject:v89])
  {
    v49 = fp_current_or_default_log();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);
    }

    v57 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F1C758]];
    v58 = v57;
    if (v57)
    {
      v59 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v57, "isEqual:", *MEMORY[0x1E4F1C760]) ^ 1);
      [v91 setObject:v59 forKeyedSubscript:v89];
    }
  }
  if ([v88 containsObject:v85])
  {
    v60 = fp_current_or_default_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:](v60, v61, v62, v63, v64, v65, v66, v67);
    }

    v68 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F1C7B0]];
    [v91 setObject:v68 forKeyedSubscript:v85];
  }
  if ([v88 containsObject:v86])
  {
    v69 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F1C7C0]];
    v70 = fp_current_or_default_log();
    BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG);
    if (v69)
    {
      if (v71) {
        -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:](v70, v72, v73, v74, v75, v76, v77, v78);
      }

      v79 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v69 style:0 options:0];
      [v91 setObject:v79 forKeyedSubscript:v86];
    }
    else
    {
      if (v71) {
        -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:]((uint64_t)v93, v70);
      }

      [v91 setObject:0 forKeyedSubscript:v86];
    }
  }
  if ([v88 containsObject:v87])
  {
    v80 = [v91 objectForKeyedSubscript:v87];

    if (!v80)
    {
      v81 = NSNumber;
      v82 = [v91 objectForKeyedSubscript:*MEMORY[0x1E4F1C758]];
      v83 = [v81 numberWithInt:v82 != 0];
      [v91 setObject:v83 forKeyedSubscript:v87];
    }
  }

  return v91;
}

+ (id)dictionaryFromItem:(id)a3 requestedKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if (dictionaryFromItem_requestedKeys__once != -1) {
      dispatch_once(&dictionaryFromItem_requestedKeys__once, &__block_literal_global_362);
    }
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__31;
    uint64_t v27 = __Block_byref_object_dispose__31;
    id v28 = 0;
    v9 = (objc_class *)objc_opt_class();
    char v10 = NSStringFromClass(v9);
    v11 = dictionaryFromItem_requestedKeys__queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __66__FPItemToURLResourcesConverter_dictionaryFromItem_requestedKeys___block_invoke_364;
    uint64_t v19 = &unk_1E5AF6500;
    uint64_t v21 = &v23;
    id v12 = v10;
    id v20 = v12;
    uint64_t v22 = v9;
    dispatch_sync(v11, &block);
    v13 = [(id)v24[5] _dictionaryFromItem:v7 requestedKeys:v8];
    if (!v13)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, a1, @"FPItemConversion.m", 524, @"couldn't convert item: %@", v7, block, v17, v18, v19 object file lineNumber description];
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __66__FPItemToURLResourcesConverter_dictionaryFromItem_requestedKeys___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("NSFileProviderPropertyDictionary", v0);
  v2 = (void *)dictionaryFromItem_requestedKeys__queue;
  dictionaryFromItem_requestedKeys__queue = (uint64_t)v1;

  uint64_t v3 = objc_opt_new();
  uint64_t v4 = dictionaryFromItem_requestedKeys__convertersByItemClass;
  dictionaryFromItem_requestedKeys__convertersByItemClass = v3;

  return MEMORY[0x1F41817F8](v3, v4);
}

void __66__FPItemToURLResourcesConverter_dictionaryFromItem_requestedKeys___block_invoke_364(void *a1)
{
  uint64_t v2 = [(id)dictionaryFromItem_requestedKeys__convertersByItemClass objectForKeyedSubscript:a1[4]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v5 = [[FPItemToURLResourcesConverter alloc] initWithItemClass:a1[6]];
    uint64_t v6 = *(void *)(a1[5] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = a1[4];
    uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 40);
    char v10 = (void *)dictionaryFromItem_requestedKeys__convertersByItemClass;
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesByURLKey, 0);

  objc_storeStrong((id *)&self->_gettersByURLKey, 0);
}

- (void)initWithItemClass:.cold.1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┏%llx instantiating dictionary converter for %@");
}

- (void)_cacheImplementedPropertiesForClass:.cold.1()
{
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] ┏%llx caching properties of %@");
}

- (void)_dictionaryFromItem:(uint64_t)a1 requestedKeys:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Deprecated NSURLUbiquitousSharedItemOwnerNameKey was called for item %@ that does not have name components", (uint8_t *)&v2, 0xCu);
}

- (void)_dictionaryFromItem:(uint64_t)a3 requestedKeys:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dictionaryFromItem:(uint64_t)a3 requestedKeys:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dictionaryFromItem:(uint64_t)a3 requestedKeys:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end