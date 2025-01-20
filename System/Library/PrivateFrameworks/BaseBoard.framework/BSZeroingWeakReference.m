@interface BSZeroingWeakReference
+ (BSZeroingWeakReference)referenceWithObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BSZeroingWeakReference)init;
- (BSZeroingWeakReference)initWithObject:(id)a3;
- (id)description;
- (id)object;
- (unint64_t)hash;
@end

@implementation BSZeroingWeakReference

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void).cxx_destruct
{
}

+ (BSZeroingWeakReference)referenceWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return (BSZeroingWeakReference *)v5;
}

- (BSZeroingWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BSZeroingWeakReference;
  v5 = [(BSZeroingWeakReference *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v6->_objectClass = (Class)objc_opt_class();
    v6->_objectAddress = (unint64_t)v4;
  }

  return v6;
}

- (BSZeroingWeakReference)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"BSZeroingWeakReference does not support -init"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSZeroingWeakReference.m";
    __int16 v17 = 1024;
    int v18 = 38;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  result = (BSZeroingWeakReference *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (id)description
{
  v3 = [(BSZeroingWeakReference *)self object];
  id v4 = NSString;
  id v5 = NSStringFromClass(self->_objectClass);
  if (v3) {
    [v4 stringWithFormat:@"<%@: %p>", v5, self->_objectAddress];
  }
  else {
  v6 = [v4 stringWithFormat:@"<%@: %p (deallocated)>", v5, self->_objectAddress];
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSZeroingWeakReference *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_objectAddress == self->_objectAddress
      && v4->_objectClass == self->_objectClass)
    {
      v7 = [(BSZeroingWeakReference *)self object];
      objc_super v8 = [(BSZeroingWeakReference *)v4 object];
      BOOL v5 = v7 == v8;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

@end