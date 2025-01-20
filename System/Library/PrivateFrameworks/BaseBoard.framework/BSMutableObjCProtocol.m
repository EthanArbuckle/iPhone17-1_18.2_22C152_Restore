@interface BSMutableObjCProtocol
+ (id)protocolWithName:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)properties;
- (void)addProperty:(id)a3;
- (void)removeProperty:(id)a3;
@end

@implementation BSMutableObjCProtocol

- (void)addProperty:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"property != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2114;
      v18 = @"BSObjCRuntime.m";
      __int16 v19 = 1024;
      int v20 = 1462;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v6 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF05ACLL);
  }
  [(NSMutableArray *)self->_properties addObject:v5];
  -[BSObjCProperty _reifySelectors]((uint64_t)v10);
}

+ (id)protocolWithName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"name"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v17 = v13;
      __int16 v18 = 2114;
      __int16 v19 = v15;
      __int16 v20 = 2048;
      id v21 = a1;
      __int16 v22 = 2114;
      uint64_t v23 = @"BSObjCRuntime.m";
      __int16 v24 = 1024;
      int v25 = 1450;
      __int16 v26 = 2114;
      v27 = v12;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v12 UTF8String];
    __break(0);
    JUMPOUT(0x18AB10180);
  }
  v6 = [BSMutableObjCProtocol alloc];
  uint64_t v7 = [v5 copy];
  name = v6->_name;
  v6->_name = (NSString *)v7;

  uint64_t v9 = objc_opt_new();
  properties = v6->_properties;
  v6->_properties = (NSMutableArray *)v9;

  return v6;
}

- (id)properties
{
  return self->_properties;
}

- (void)removeProperty:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"property != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2114;
      __int16 v18 = @"BSObjCRuntime.m";
      __int16 v19 = 1024;
      int v20 = 1470;
      __int16 v21 = 2114;
      __int16 v22 = v6;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v6 UTF8String];
    __break(0);
    JUMPOUT(0x18AB10364);
  }
  [(NSMutableArray *)self->_properties removeObject:v5];
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)BSMutableObjCProtocol;
  return [(BSMutableObjCProtocol *)&v3 copy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BSObjCProtocol alloc];
  name = self->_name;
  properties = self->_properties;
  return -[BSObjCProtocol _initWithName:protocol:inherited:methods:properties:virtual:]((id *)&v4->super.isa, name, 0, 0, 0, properties, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end