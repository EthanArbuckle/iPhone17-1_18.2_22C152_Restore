@interface NSMutableDictionary(BaseBoard)
- (id)bs_takeObjectForKey:()BaseBoard;
- (void)bs_addObject:()BaseBoard toCollectionClass:forKey:;
- (void)bs_removeObject:()BaseBoard fromCollectionForKey:;
- (void)bs_setSafeObject:()BaseBoard forKey:;
@end

@implementation NSMutableDictionary(BaseBoard)

- (void)bs_setSafeObject:()BaseBoard forKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKey:");
    }
  }
  return a1;
}

- (void)bs_addObject:()BaseBoard toCollectionClass:forKey:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((objc_class *)objc_opt_class() != a4
    && (objc_class *)objc_opt_class() != a4
    && (objc_class *)objc_opt_class() != a4)
  {
    v10 = [NSString stringWithFormat:@"'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)", a5, a4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v16 = v11;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2048;
      v20 = a1;
      __int16 v21 = 2114;
      v22 = @"NSDictionary+BaseBoard.m";
      __int16 v23 = 1024;
      int v24 = 107;
      __int16 v25 = 2114;
      v26 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AADFA10);
  }
  id v14 = [a1 objectForKey:a5];
  if (!v14)
  {
    id v14 = objc_alloc_init(a4);
    [a1 setObject:v14 forKey:a5];
  }
  [v14 addObject:a3];
}

- (void)bs_removeObject:()BaseBoard fromCollectionForKey:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = [a1 objectForKey:a4];
  if (v12)
  {
    if ((_NSIsNSSet() & 1) == 0 && (_NSIsNSOrderedSet() & 1) == 0 && (_NSIsNSArray() & 1) == 0)
    {
      v8 = [NSString stringWithFormat:@"'%@' must be NSMutableSet, NSMutableOrderedSet, or NSMutableArray, not (%@)", a4, objc_opt_class()];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        id v14 = v9;
        __int16 v15 = 2114;
        id v16 = v11;
        __int16 v17 = 2048;
        v18 = a1;
        __int16 v19 = 2114;
        v20 = @"NSDictionary+BaseBoard.m";
        __int16 v21 = 1024;
        int v22 = 120;
        __int16 v23 = 2114;
        int v24 = v8;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v8 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE0084);
    }
    [v12 removeObject:a3];
    if (![v12 count]) {
      [a1 removeObjectForKey:a4];
    }
  }
}

- (id)bs_takeObjectForKey:()BaseBoard
{
  v5 = objc_msgSend(a1, "objectForKey:");
  if (v5)
  {
    [a1 removeObjectForKey:a3];
    id v6 = v5;
  }

  return v5;
}

@end