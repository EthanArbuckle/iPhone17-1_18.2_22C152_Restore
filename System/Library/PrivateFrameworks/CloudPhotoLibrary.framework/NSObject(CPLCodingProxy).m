@interface NSObject(CPLCodingProxy)
+ (id)_cplPropertyAttributeMap;
+ (id)cplAllPropertyNames;
+ (uint64_t)cplAdditionalSecureClassesForProperty:()CPLCodingProxy;
+ (uint64_t)cplShouldIgnorePropertyForCoding:()CPLCodingProxy;
+ (uint64_t)cplShouldIgnorePropertyForEquality:()CPLCodingProxy;
+ (void)_addPropertyAttributeMapToPropertyMapLocked:()CPLCodingProxy;
+ (void)cplDumpProperties;
- (BOOL)cplProperties:()CPLCodingProxy areEqualToPropertiesOf:diffTracker:withEqualityBlock:;
- (id)cplDeepCopy;
- (id)cplFullDescription;
- (uint64_t)cplCopyPropertiesFromObject:()CPLCodingProxy withCopyBlock:;
- (uint64_t)cplHash;
- (uint64_t)cplIsEqual:()CPLCodingProxy;
- (uint64_t)cplIsEqual:()CPLCodingProxy withEqualityBlock:;
- (uint64_t)cplProperties:()CPLCodingProxy areEqualToPropertiesOf:withEqualityBlock:;
- (void)_cplCopyProperties:()CPLCodingProxy fromOtherObject:withCopyBlock:;
- (void)cplClearProperties:()CPLCodingProxy;
- (void)cplDecodePropertiesFromCoder:()CPLCodingProxy;
- (void)cplEncodePropertiesWithCoder:()CPLCodingProxy;
@end

@implementation NSObject(CPLCodingProxy)

- (id)cplFullDescription
{
  return +[CPLArchiver fullDescriptionForObject:a1];
}

- (uint64_t)cplCopyPropertiesFromObject:()CPLCodingProxy withCopyBlock:
{
  return [a1 _cplCopyProperties:0 fromOtherObject:a3 withCopyBlock:a4];
}

- (void)_cplCopyProperties:()CPLCodingProxy fromOtherObject:withCopyBlock:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_class();
  if (v12 != objc_opt_class())
  {
    if (!_CPLSilentLogging)
    {
      v23 = __CPLCodingOSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v37 = (id)objc_opt_class();
        __int16 v38 = 2112;
        v39 = v12;
        id v24 = v37;
        _os_log_impl(&dword_1B4CAC000, v23, OS_LOG_TYPE_ERROR, "Trying to copy properties from an instance of %@ to an instance of %@", buf, 0x16u);
      }
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/NSObject+CPLCodingProxy.m"];
    [v25 handleFailureInMethod:a2, a1, v26, 962, @"Trying to copy properties from an instance of %@ to an instance of %@", objc_opt_class(), v12 object file lineNumber description];

    abort();
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke;
  v33[3] = &unk_1E60A8C60;
  id v13 = v11;
  id v35 = v13;
  v33[4] = a1;
  id v14 = v10;
  id v34 = v14;
  v15 = (void *)MEMORY[0x1BA994060](v33);
  v16 = [v12 _cplPropertyAttributeMap];
  if (v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
    v18 = [v9 allObjects];
    v19 = [v16 objectsForKeys:v18 notFoundMarker:v17];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_2;
    v27[3] = &unk_1E60A8C38;
    id v29 = v18;
    id v30 = v15;
    id v28 = v17;
    id v20 = v18;
    id v21 = v15;
    id v22 = v17;
    [v19 enumerateObjectsUsingBlock:v27];
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_140;
    v31[3] = &unk_1E60A8C10;
    v32 = v15;
    id v22 = v15;
    [v16 enumerateKeysAndObjectsUsingBlock:v31];
    id v21 = v32;
  }
}

- (void)cplClearProperties:()CPLCodingProxy
{
  id v4 = a3;
  v5 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke;
  v20[3] = &unk_1E60A8BE8;
  v20[4] = a1;
  v6 = (void *)MEMORY[0x1BA994060](v20);
  v7 = [v5 _cplPropertyAttributeMap];
  if (v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
    id v9 = [v4 allObjects];
    id v10 = [v7 objectsForKeys:v9 notFoundMarker:v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_2;
    v14[3] = &unk_1E60A8C38;
    id v16 = v9;
    id v17 = v6;
    id v15 = v8;
    id v11 = v9;
    id v12 = v6;
    id v13 = v8;
    [v10 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_132;
    v18[3] = &unk_1E60A8C10;
    v19 = v6;
    id v13 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:v18];
    id v12 = v19;
  }
}

- (uint64_t)cplHash
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = -1;
  v2 = objc_opt_class();
  v3 = [v2 _cplPropertyAttributeMap];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__NSObject_CPLCodingProxy__cplHash__block_invoke;
  v6[3] = &unk_1E60A8BC0;
  v6[4] = a1;
  v6[5] = &v7;
  v6[6] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  uint64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)cplProperties:()CPLCodingProxy areEqualToPropertiesOf:withEqualityBlock:
{
  return [a1 cplProperties:a3 areEqualToPropertiesOf:a4 diffTracker:0 withEqualityBlock:a5];
}

- (BOOL)cplProperties:()CPLCodingProxy areEqualToPropertiesOf:diffTracker:withEqualityBlock:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11 == a1)
  {
    BOOL v17 = 1;
  }
  else
  {
    id v14 = objc_opt_class();
    if ([v11 isMemberOfClass:v14])
    {
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v15 = 1;
      char v31 = 1;
      if (v12) {
        char v15 = [v12 shouldCompareAllProperties] ^ 1;
      }
      id v16 = [v14 _cplPropertyAttributeMap];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __95__NSObject_CPLCodingProxy__cplProperties_areEqualToPropertiesOf_diffTracker_withEqualityBlock___block_invoke;
      v19[3] = &unk_1E60A8B98;
      id v20 = v10;
      v26 = v14;
      id v24 = v13;
      id v21 = a1;
      id v22 = v11;
      v25 = &v28;
      id v23 = v12;
      char v27 = v15;
      [v16 enumerateKeysAndObjectsUsingBlock:v19];
      BOOL v17 = *((unsigned char *)v29 + 24) != 0;

      _Block_object_dispose(&v28, 8);
    }
    else
    {
      [v12 noteObjectAreTotallyDifferent];
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (uint64_t)cplIsEqual:()CPLCodingProxy withEqualityBlock:
{
  return [a1 cplProperties:0 areEqualToPropertiesOf:a3 withEqualityBlock:a4];
}

- (uint64_t)cplIsEqual:()CPLCodingProxy
{
  return [a1 cplIsEqual:a3 withEqualityBlock:0];
}

- (void)cplDecodePropertiesFromCoder:()CPLCodingProxy
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _cplPropertyAttributeMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NSObject_CPLCodingProxy__cplDecodePropertiesFromCoder___block_invoke;
  v7[3] = &unk_1E60A8B70;
  id v8 = v4;
  uint64_t v9 = a1;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)cplEncodePropertiesWithCoder:()CPLCodingProxy
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _cplPropertyAttributeMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NSObject_CPLCodingProxy__cplEncodePropertiesWithCoder___block_invoke;
  v7[3] = &unk_1E60A8B70;
  void v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)cplDeepCopy
{
  if ([a1 conformsToProtocol:&unk_1F0D950A8])
  {
    return (id)[a1 copy];
  }
  else
  {
    return a1;
  }
}

+ (id)cplAllPropertyNames
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2050000000;
  uint64_t v12 = 0;
  uint64_t v12 = objc_opt_class();
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12496;
  uint64_t v9 = __Block_byref_object_dispose__12497;
  id v10 = 0;
  if (cplAllPropertyNames_onceToken != -1) {
    dispatch_once(&cplAllPropertyNames_onceToken, &__block_literal_global_142);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NSObject_CPLCodingProxy__cplAllPropertyNames__block_invoke_2;
  block[3] = &unk_1E60A8C88;
  block[4] = &v5;
  block[5] = v11;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)cplAllPropertyNames_lock, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v2;
}

+ (void)cplDumpProperties
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    id v2 = __CPLCodingOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = [a1 _cplPropertyAttributeMap];
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (id)_cplPropertyAttributeMap
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__12496;
  uint64_t v9 = __Block_byref_object_dispose__12497;
  id v10 = 0;
  if (_cplPropertyAttributeMap_onceToken != -1) {
    dispatch_once(&_cplPropertyAttributeMap_onceToken, &__block_literal_global_101);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__NSObject_CPLCodingProxy___cplPropertyAttributeMap__block_invoke_2;
  v4[3] = &unk_1E60A8B48;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)_cplPropertyAttributeMap_lock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)_addPropertyAttributeMapToPropertyMapLocked:()CPLCodingProxy
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_class() != a1)
  {
    objc_msgSend((id)objc_msgSend(a1, "superclass"), "_addPropertyAttributeMapToPropertyMapLocked:", v4);
    unsigned int outCount = 0;
    uint64_t v5 = class_copyPropertyList((Class)a1, &outCount);
    uint64_t v6 = v5;
    if (outCount)
    {
      uint64_t v7 = 0;
      v47 = v5;
      v48 = v4;
      v52 = a1;
      while (1)
      {
        id v8 = (void *)MEMORY[0x1BA993DF0]();
        uint64_t v9 = v6[v7];
        aSelectorName = (NSString *)[[NSString alloc] initWithCString:property_getName(v9) encoding:4];
        if (!objc_msgSend(a1, "cplShouldIgnorePropertyForCoding:")) {
          break;
        }
        if (!_CPLSilentLogging)
        {
          id v10 = __CPLCodingOSLogDomain();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v60 = a1;
            __int16 v61 = 2112;
            v62 = aSelectorName;
            _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, "Ignoring %@.%@ for coding", buf, 0x16u);
          }
LABEL_55:
        }
        if (++v7 >= (unint64_t)outCount) {
          goto LABEL_57;
        }
      }
      v50 = v8;
      uint64_t v51 = v7;
      v49 = [[NSString alloc] initWithCString:property_getAttributes(v9) encoding:4];
      id v11 = [v49 componentsSeparatedByString:@","];
      uint64_t v12 = objc_alloc_init(CPLCodingPropertyEntry);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v67 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = 0;
        uint64_t v17 = *(void *)v55;
LABEL_10:
        uint64_t v18 = 0;
        while (2)
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(v13);
          }
          v19 = *(void **)(*((void *)&v54 + 1) + 8 * v18);
          __darwin_ct_rune_t v20 = __tolower([v19 characterAtIndex:0]);
          switch(v20)
          {
            case 'r':
              [(CPLCodingPropertyEntry *)v12 setReadOnly:1];
              goto LABEL_23;
            case 's':
              id v21 = [v19 substringFromIndex:1];
              uint64_t v28 = NSSelectorFromString((NSString *)&v21->isa);
              IMP MethodImplementation = class_getMethodImplementation((Class)a1, v28);
              [(CPLCodingPropertyEntry *)v12 setPropertySetter:v28];
              [(CPLCodingPropertyEntry *)v12 setPropertySetterIMP:MethodImplementation];
              goto LABEL_22;
            case 't':
              char v24 = [v19 characterAtIndex:1];
              [(CPLCodingPropertyEntry *)v12 setPropertyType:v24];
              if (v24 != 64)
              {
                if (v24 != 123) {
                  goto LABEL_23;
                }
                id v21 = objc_msgSend(v19, "substringWithRange:", 2, objc_msgSend(v19, "length") - 3);
                v25 = [v21 componentsSeparatedByString:@"="];
                v26 = [v25 objectAtIndex:0];
                [(CPLCodingPropertyEntry *)v12 setStructName:v26];

                goto LABEL_22;
              }
              if ((unint64_t)[v19 length] > 3)
              {
                objc_msgSend(v19, "substringWithRange:", 3, objc_msgSend(v19, "length") - 4);
                uint64_t v30 = a1;
                char v31 = (NSString *)objc_claimAutoreleasedReturnValue();
                Class v32 = NSClassFromString(v31);
                v33 = [v30 cplAdditionalSecureClassesForProperty:aSelectorName];
                if (!_CPLSilentLogging)
                {
                  id v34 = __CPLCodingOSLogDomain();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138413058;
                    v60 = v52;
                    __int16 v61 = 2112;
                    v62 = aSelectorName;
                    __int16 v63 = 2112;
                    Class v64 = v32;
                    __int16 v65 = 2112;
                    v66 = v33;
                    _os_log_impl(&dword_1B4CAC000, v34, OS_LOG_TYPE_DEBUG, "Class for property %@.%@ is %@. Additional secure classes are %@", buf, 0x2Au);
                  }
                }
                if (v32)
                {
                  if (v33) {
                    [v33 setByAddingObject:v32];
                  }
                  else {
                  id v35 = [MEMORY[0x1E4F1CAD0] setWithObject:v32];
                  }
                  [(CPLCodingPropertyEntry *)v12 setPropertyClasses:v35];
                }
                else if (v33)
                {
                  [(CPLCodingPropertyEntry *)v12 setPropertyClasses:v33];
                }

                a1 = v52;
              }
              else if (!_CPLSilentLogging)
              {
                id v21 = __CPLCodingOSLogDomain();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v60 = a1;
                  __int16 v61 = 2112;
                  v62 = aSelectorName;
                  _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Ignoring %@.%@ for coding as its type is too generic", buf, 0x16u);
                }
LABEL_22:
              }
LABEL_23:
              if (v15 != ++v18) {
                continue;
              }
              uint64_t v36 = [v13 countByEnumeratingWithState:&v54 objects:v67 count:16];
              uint64_t v15 = v36;
              if (!v36) {
                goto LABEL_44;
              }
              goto LABEL_10;
            case 'u':
              goto LABEL_23;
            case 'v':
              uint64_t v27 = [v19 substringFromIndex:1];

              id v16 = (void *)v27;
              goto LABEL_23;
            default:
              if (v20 != 103) {
                goto LABEL_23;
              }
              id v21 = [v19 substringFromIndex:1];
              id v22 = NSSelectorFromString((NSString *)&v21->isa);
              IMP v23 = class_getMethodImplementation((Class)a1, v22);
              [(CPLCodingPropertyEntry *)v12 setPropertyGetter:v22];
              [(CPLCodingPropertyEntry *)v12 setPropertyGetterIMP:v23];
              goto LABEL_22;
          }
        }
      }
      id v16 = 0;
LABEL_44:

      if (![(CPLCodingPropertyEntry *)v12 propertyGetter])
      {
        id v37 = NSSelectorFromString(aSelectorName);
        IMP v38 = class_getMethodImplementation((Class)a1, v37);
        [(CPLCodingPropertyEntry *)v12 setPropertyGetter:v37];
        [(CPLCodingPropertyEntry *)v12 setPropertyGetterIMP:v38];
      }
      if (![(CPLCodingPropertyEntry *)v12 propertySetter]
        && ![(CPLCodingPropertyEntry *)v12 isReadOnly])
      {
        id v39 = [NSString alloc];
        uint64_t v40 = __toupper([(NSString *)aSelectorName characterAtIndex:0]);
        v41 = [(NSString *)aSelectorName substringFromIndex:1];
        v42 = (NSString *)[v39 initWithFormat:@"set%c%@:", v40, v41];

        v43 = NSSelectorFromString(v42);
        IMP v44 = class_getMethodImplementation((Class)a1, v43);
        [(CPLCodingPropertyEntry *)v12 setPropertySetter:v43];
        [(CPLCodingPropertyEntry *)v12 setPropertySetterIMP:v44];
      }
      if (![v16 length])
      {
        uint64_t v45 = [NSString stringWithFormat:@"_%@", aSelectorName];

        id v16 = (void *)v45;
      }
      uint64_t v6 = v47;
      id v4 = v48;
      id v8 = v50;
      uint64_t v7 = v51;
      if ([v16 length])
      {
        Ivar InstanceVariable = class_getInstanceVariable((Class)a1, (const char *)[v16 UTF8String]);
        if (InstanceVariable) {
          [(CPLCodingPropertyEntry *)v12 setIvar:InstanceVariable];
        }
      }
      [v48 setObject:v12 forKey:aSelectorName];

      id v10 = v49;
      goto LABEL_55;
    }
LABEL_57:
    free(v6);
  }
}

+ (uint64_t)cplShouldIgnorePropertyForEquality:()CPLCodingProxy
{
  return 0;
}

+ (uint64_t)cplShouldIgnorePropertyForCoding:()CPLCodingProxy
{
  uint64_t v3 = cplShouldIgnorePropertyForCoding__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&cplShouldIgnorePropertyForCoding__onceToken, &__block_literal_global_12517);
  }
  uint64_t v5 = [(id)cplShouldIgnorePropertyForCoding__baseIgnorableProperties containsObject:v4];

  return v5;
}

+ (uint64_t)cplAdditionalSecureClassesForProperty:()CPLCodingProxy
{
  return 0;
}

@end