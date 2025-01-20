@interface _BSObjCValueBuilder
- (void)setCEncoding:(const char *)a3;
- (void)setEncoding:(id)a3;
- (void)setObjectType:(Class)a3;
- (void)setType:(char)a3;
- (void)setValueType:(id)a3;
@end

@implementation _BSObjCValueBuilder

- (void)setEncoding:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v12 = v5;
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"encoding != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v14 = v9;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2114;
      v20 = @"BSObjCRuntime.m";
      __int16 v21 = 1024;
      int v22 = 1719;
      __int16 v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v8 UTF8String];
    __break(0);
    JUMPOUT(0x18AB1076CLL);
  }
  v6 = (NSString *)[v5 copy];
  encoding = self->_encoding;
  self->_encoding = v6;
}

- (void)setCEncoding:(const char *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"encoding != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"BSObjCRuntime.m";
      __int16 v18 = 1024;
      int v19 = 1724;
      __int16 v20 = 2114;
      __int16 v21 = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AB10944);
  }
  objc_msgSend(NSString, "bs_stringWithUTF8String:");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(_BSObjCValueBuilder *)self setEncoding:v9];
}

- (void)setType:(char)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 == 63)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"type != BSObjCTypeUnknown"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = @"BSObjCRuntime.m";
      __int16 v18 = 1024;
      int v19 = 1729;
      __int16 v20 = 2114;
      __int16 v21 = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AB10B34);
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%c", a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(_BSObjCValueBuilder *)self setEncoding:v9];
}

- (void)setObjectType:(Class)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = NSString;
  if (!a3)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"clazz"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v13 = v8;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 2114;
      int v19 = @"BSObjCRuntime.m";
      __int16 v20 = 1024;
      int v21 = 1734;
      __int16 v22 = 2114;
      __int16 v23 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AB10D2CLL);
  }
  NSStringFromClass((Class)[(objc_class *)a3 classForCoder]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 stringWithFormat:@"@\"%@\"", v11];
  [(_BSObjCValueBuilder *)self setEncoding:v5];
}

- (void)setValueType:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = NSString;
  if (!v5)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"value"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v14 = v9;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      __int16 v17 = 2048;
      __int16 v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = @"BSObjCRuntime.m";
      __int16 v21 = 1024;
      int v22 = 1739;
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v8 UTF8String];
    __break(0);
    JUMPOUT(0x18AB10F38);
  }
  id v12 = v5;
  v7 = objc_msgSend(v6, "bs_stringWithUTF8String:", objc_msgSend(v12, "objCType"));
  [(_BSObjCValueBuilder *)self setEncoding:v7];
}

- (void).cxx_destruct
{
}

@end