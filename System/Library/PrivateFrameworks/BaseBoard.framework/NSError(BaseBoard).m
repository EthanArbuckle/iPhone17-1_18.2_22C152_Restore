@interface NSError(BaseBoard)
+ (id)bs_errorWithDomain:()BaseBoard code:configuration:;
- (id)descriptionBuilderWithMultilinePrefix:()BaseBoard;
- (id)descriptionWithMultilinePrefix:()BaseBoard;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation NSError(BaseBoard)

+ (id)bs_errorWithDomain:()BaseBoard code:configuration:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = a5;
  if (!v10)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v23 = v19;
      __int16 v24 = 2114;
      v25 = v21;
      __int16 v26 = 2048;
      uint64_t v27 = a1;
      __int16 v28 = 2114;
      v29 = @"NSError+BaseBoard.m";
      __int16 v30 = 1024;
      int v31 = 114;
      __int16 v32 = 2114;
      v33 = v18;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v18 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFAF5CLL);
  }
  v11 = -[_BSErrorConfiguration initWithDomain:code:]([_BSErrorConfiguration alloc], v9, a4);
  v10[2](v10, v11);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = v11[1];
    uint64_t v14 = v11[2];
    if ([(id)v11[3] count]) {
      uint64_t v15 = v11[3];
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = [v12 errorWithDomain:v13 code:v14 userInfo:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)succinctDescription
{
  v1 = [a1 succinctDescriptionBuilder];
  v2 = [v1 build];

  return v2;
}

- (id)succinctDescriptionBuilder
{
  v2 = +[BSDescriptionBuilder builderWithObject:a1];
  v3 = [a1 domain];
  id v4 = (id)[v2 appendObject:v3 withName:@"domain"];

  v5 = [a1 userInfo];
  v6 = [v5 objectForKey:@"BSErrorCodeDescription"];

  if (v6)
  {
    v7 = [NSString stringWithFormat:@"%ld (\"%@\", objc_msgSend(a1, "code""), v6];
    id v8 = (id)[v2 appendObject:v7 withName:@"code"];
  }
  else
  {
    id v9 = (id)objc_msgSend(v2, "appendInteger:withName:", objc_msgSend(a1, "code"), @"code");
  }
  v10 = [a1 userInfo];
  v11 = [v10 objectForKey:*MEMORY[0x1E4F28578]];

  v12 = [a1 userInfo];
  uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F28588]];

  if (v11 && v13)
  {
    if ([v11 hasSuffix:@"."]) {
      uint64_t v14 = @"%@ %@";
    }
    else {
      uint64_t v14 = @"%@. %@";
    }
    objc_msgSend(NSString, "stringWithFormat:", v14, v11, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13) {
      v16 = v13;
    }
    else {
      v16 = v11;
    }
    id v15 = v16;
  }
  v17 = v15;
  [v2 appendString:v15 withName:0 skipIfEmpty:1];

  return v2;
}

- (id)descriptionWithMultilinePrefix:()BaseBoard
{
  v1 = objc_msgSend(a1, "descriptionBuilderWithMultilinePrefix:");
  v2 = [v1 build];

  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:()BaseBoard
{
  id v4 = a3;
  if (qword_1EB21B240 != -1) {
    dispatch_once(&qword_1EB21B240, &__block_literal_global_21);
  }
  v5 = [a1 userInfo];
  v6 = [v5 allKeys];
  v7 = (void *)[v6 mutableCopy];

  [v7 removeObjectsInArray:_MergedGlobals_23];
  [v7 sortUsingSelector:sel_compare_];
  id v8 = [a1 underlyingErrors];
  id v9 = objc_msgSend(v8, "bs_orderedSet");

  v10 = [a1 succinctDescriptionBuilder];
  if ([v7 count] || objc_msgSend(v9, "count"))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__NSError_BaseBoard__descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v12[3] = &unk_1E5446388;
    id v13 = v7;
    id v14 = v5;
    id v15 = v10;
    id v16 = v9;
    [v15 appendBodySectionWithName:0 multilinePrefix:v4 block:v12];
  }
  return v10;
}

@end