@interface NSObject(BSCoding)
+ (id)bs_secureDataFromObject:()BSCoding;
+ (id)bs_secureDecodedFromData:()BSCoding;
+ (id)bs_secureDecodedFromData:()BSCoding withAdditionalClasses:;
+ (id)bs_secureObjectFromData:()BSCoding ofClass:;
+ (id)bs_secureObjectFromData:()BSCoding ofClasses:;
+ (uint64_t)bs_isPlistableType;
- (id)bs_secureEncoded;
- (uint64_t)bs_isPlistableType;
@end

@implementation NSObject(BSCoding)

+ (id)bs_secureDecodedFromData:()BSCoding
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _BSCreateObjectOfClassFromData(a1, v5);
    if (v6) {
      goto LABEL_6;
    }
    if (([(objc_class *)a1 conformsToProtocol:&unk_1ED7873C8] & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, a1, @"NSObject+BSCoding.m", 125, @"%@ does not implement NSSecureCoding", a1 object file lineNumber description];
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

+ (id)bs_secureDecodedFromData:()BSCoding withAdditionalClasses:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a1;
  id v7 = a3;
  id v8 = a4;
  if ([a1 supportsSecureCoding])
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = NSStringFromClass((Class)a1);
    [v17 handleFailureInMethod:a2, a1, @"NSObject+BSCoding.m", 133, @"%@ does not support secure coding", v18 object file lineNumber description];

    if (v7)
    {
LABEL_3:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithObjects:&v21 count:1];
      v10 = v9;
      if (v8) {
        [v9 unionSet:v8];
      }
      id v11 = _BSCreateObjectOfClassesFromData(v10, v7);
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if (v12)
        {
LABEL_15:

          goto LABEL_18;
        }
      }
      else if (v11)
      {
        v13 = BSLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = v21;
          v15 = objc_opt_class();
          *(_DWORD *)buf = 136315650;
          v23 = "+[NSObject(BSCoding) bs_secureDecodedFromData:withAdditionalClasses:]";
          __int16 v24 = 2114;
          id v25 = v14;
          __int16 v26 = 2114;
          v27 = v15;
          id v16 = v15;
          _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "%s decoded an unexpected type : expected=%{public}@ decoded=%{public}@", buf, 0x20u);
        }
      }
      if (([v21 conformsToProtocol:&unk_1ED7873C8] & 1) == 0)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21);
      }
      id v12 = 0;
      goto LABEL_15;
    }
  }
  id v12 = 0;
LABEL_18:

  return v12;
}

+ (id)bs_secureObjectFromData:()BSCoding ofClasses:
{
  id v4 = _BSCreateObjectOfClassesFromData(a4, a3);
  return v4;
}

+ (id)bs_secureDataFromObject:()BSCoding
{
  v3 = (void *)_BSCreateDataFromObject(a3);
  return v3;
}

+ (uint64_t)bs_isPlistableType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1EB21B340 != -1) {
    dispatch_once(&qword_1EB21B340, &__block_literal_global_26);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = (id)_MergedGlobals_31;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(a1, "isSubclassOfClass:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
        {
          uint64_t v6 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 0;
LABEL_13:

  return v6;
}

- (uint64_t)bs_isPlistableType
{
  v0 = objc_opt_class();
  return objc_msgSend(v0, "bs_isPlistableType");
}

- (id)bs_secureEncoded
{
  v1 = (void *)_BSCreateDataFromObject(a1);
  return v1;
}

+ (id)bs_secureObjectFromData:()BSCoding ofClass:
{
  id v5 = a3;
  id v6 = 0;
  if (v5 && a4) {
    id v6 = _BSCreateObjectOfClassFromData(a4, v5);
  }

  return v6;
}

@end