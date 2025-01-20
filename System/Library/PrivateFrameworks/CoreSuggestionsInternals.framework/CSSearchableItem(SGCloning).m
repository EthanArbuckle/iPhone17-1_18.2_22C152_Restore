@interface CSSearchableItem(SGCloning)
+ (id)sg_clonableItemAtIndex:()SGCloning inCodedArray:;
- (id)sg_clone;
@end

@implementation CSSearchableItem(SGCloning)

+ (id)sg_clonableItemAtIndex:()SGCloning inCodedArray:
{
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = [v6 objectAtIndexedSubscript:a3];
  if (isKindOfClass)
  {
    v9 = (void *)MEMORY[0x1E4F93BB8];
    v10 = [NSNumber numberWithUnsignedInteger:a3];
    v11 = [v9 tupleWithFirst:v6 second:v10];

    objc_setAssociatedObject(v8, a2, v11, (void *)1);
  }

  return v8;
}

- (id)sg_clone
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = objc_getAssociatedObject(a1, sel_sg_clonableItemAtIndex_inCodedArray_);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E4F23840];
    v5 = [v2 second];
    uint64_t v6 = [v5 unsignedIntegerValue];
    v7 = [v3 first];
    v8 = objc_msgSend(v4, "sg_clonableItemAtIndex:inCodedArray:", v6, v7);

    if (v8 != a1) {
      goto LABEL_11;
    }
    v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v18 = [v3 first];
      int v19 = 138412546;
      v20 = v18;
      __int16 v21 = 2112;
      v22 = a1;
      _os_log_fault_impl(&dword_1CA650000, v9, OS_LOG_TYPE_FAULT, "expected coded array %@ to give a new instance of %@ but it didn't", (uint8_t *)&v19, 0x16u);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  v8 = (void *)[a1 copy];
  v10 = [a1 attributeSet];
  uint64_t v11 = [v10 textContentNoCopy];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [v8 attributeSet];
    v14 = [v13 textContentNoCopy];

    if (v14) {
      goto LABEL_11;
    }
    v10 = [a1 attributeSet];
    v15 = [v10 textContent];
    v16 = [v8 attributeSet];
    [v16 setTextContent:v15];
  }
LABEL_11:

  return v8;
}

@end