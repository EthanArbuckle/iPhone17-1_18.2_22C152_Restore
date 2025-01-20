@interface BSServiceQuality
+ (id)background;
+ (id)main;
+ (id)serviceWithClass:(unsigned int)a3;
+ (id)serviceWithClass:(unsigned int)a3 relativePriority:(int)a4;
+ (id)userInitiated;
+ (id)userInteractive;
+ (id)utility;
+ (void)_serviceWithClass:(uint64_t)a3 relativePriority:(unsigned int)a4 main:;
- (BOOL)isEqual:(id)a3;
- (BSServiceQuality)init;
- (id)description;
- (int)relativePriority;
- (unint64_t)hash;
- (unsigned)serviceClass;
- (void)_initWithClass:(void *)a3 name:(int)a4 relativePriority:(char)a5 singleton:(char)a6 main:;
- (void)dealloc;
@end

@implementation BSServiceQuality

+ (id)userInitiated
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 25, 0, 0);
}

- (unsigned)serviceClass
{
  return self->_serviceClass;
}

- (int)relativePriority
{
  return self->_relativePriority;
}

+ (id)userInteractive
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 33, 0, 0);
}

+ (void)_serviceWithClass:(uint64_t)a3 relativePriority:(unsigned int)a4 main:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = self;
  HIDWORD(v9) = a2 - 9;
  LODWORD(v9) = a2 - 9;
  unsigned int v8 = v9 >> 2;
  if (v8 >= 7 || ((0x5Du >> v8) & 1) == 0)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"unknown qos=%u", a2);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__serviceWithClass_relativePriority_main_);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      id v31 = v19;
      __int16 v32 = 2114;
      v33 = v21;
      __int16 v34 = 2048;
      uint64_t v35 = v7;
      __int16 v36 = 2114;
      v37 = @"BSServiceQuality.m";
      __int16 v38 = 1024;
      int v39 = 57;
      __int16 v40 = 2114;
      v41 = v18;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C76B67CLL);
  }
  v10 = off_1E58FCB90[v8];
  if (a3)
  {
    if (a4)
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"cannot ask for main with relative priority : qos=%u rp=%i", a2, a3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__serviceWithClass_relativePriority_main_);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        id v31 = v27;
        __int16 v32 = 2114;
        v33 = v29;
        __int16 v34 = 2048;
        uint64_t v35 = v7;
        __int16 v36 = 2114;
        v37 = @"BSServiceQuality.m";
        __int16 v38 = 1024;
        int v39 = 88;
        __int16 v40 = 2114;
        v41 = v26;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76B878);
    }
    v11 = -[BSServiceQuality _initWithClass:name:relativePriority:singleton:main:]([BSServiceQuality alloc], a2, v10, a3, 0, 0);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_9);
    if (a4)
    {
      v12 = (void *)qword_1EB27F888;
      if (!qword_1EB27F888)
      {
        v12 = -[BSServiceQuality _initWithClass:name:relativePriority:singleton:main:]([BSServiceQuality alloc], a2, v10, 0, 1, 1);
        v13 = (void *)qword_1EB27F888;
        qword_1EB27F888 = (uint64_t)v12;
      }
      v11 = v12;
    }
    else
    {
      v11 = [(id)qword_1EB27F890 objectForKey:a2];
      if (!v11)
      {
        v11 = -[BSServiceQuality _initWithClass:name:relativePriority:singleton:main:]([BSServiceQuality alloc], a2, v10, 0, 1, 0);
        v14 = (void *)qword_1EB27F890;
        if (!qword_1EB27F890)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F4F788]);
          v16 = (void *)qword_1EB27F890;
          qword_1EB27F890 = (uint64_t)v15;

          v14 = (void *)qword_1EB27F890;
        }
        [v14 setObject:v11 forKey:a2];
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_9);
    if (*((_DWORD *)v11 + 5) != a2
      || *((_DWORD *)v11 + 6)
      || !*((unsigned char *)v11 + 16)
      || *((unsigned __int8 *)v11 + 17) != a4)
    {
      v22 = [NSString stringWithFormat:@"cached properties aren't consistent : qos=%u main=%i cached=%@", a2, a4, v11];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__serviceWithClass_relativePriority_main_);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138544642;
        id v31 = v23;
        __int16 v32 = 2114;
        v33 = v25;
        __int16 v34 = 2048;
        uint64_t v35 = v7;
        __int16 v36 = 2114;
        v37 = @"BSServiceQuality.m";
        __int16 v38 = 1024;
        int v39 = 84;
        __int16 v40 = 2114;
        v41 = v22;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v22 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76B77CLL);
    }
  }

  return v11;
}

+ (id)utility
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 17, 0, 0);
}

- (void)_initWithClass:(void *)a3 name:(int)a4 relativePriority:(char)a5 singleton:(char)a6 main:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (a1)
  {
    uint64_t v12 = objc_opt_class();
    if (v12 != objc_opt_class())
    {
      v17 = [NSString stringWithFormat:@"BSServiceQuality is not intended to be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__initWithClass_name_relativePriority_singleton_main_);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        id v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138544642;
        id v23 = v18;
        __int16 v24 = 2114;
        v25 = v20;
        __int16 v26 = 2048;
        id v27 = a1;
        __int16 v28 = 2114;
        v29 = @"BSServiceQuality.m";
        __int16 v30 = 1024;
        int v31 = 31;
        __int16 v32 = 2114;
        v33 = v17;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C76BD34);
    }
    v21.receiver = a1;
    v21.super_class = (Class)BSServiceQuality;
    v13 = objc_msgSendSuper2(&v21, sel_init);
    if (v13)
    {
      uint64_t v14 = [v11 copy];
      id v15 = (void *)v13[1];
      v13[1] = v14;

      *((_DWORD *)v13 + 5) = a2;
      *((_DWORD *)v13 + 6) = a4;
      *((unsigned char *)v13 + 16) = a5;
      *((unsigned char *)v13 + 17) = a6;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)serviceWithClass:(unsigned int)a3
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, *(uint64_t *)&a3, 0, 0);
}

+ (id)main
{
  uint64_t v2 = qos_class_main();

  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, v2, 0, 1u);
}

- (BSServiceQuality)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = [NSString stringWithFormat:@"init is not allowed on BSServiceQuality"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"BSServiceQuality.m";
    __int16 v17 = 1024;
    int v18 = 26;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BSServiceQuality *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_singleton)
  {
    v4 = [NSString stringWithFormat:@"can not deallocate a singleton BSServiceQuality : %@", self];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      v16 = @"BSServiceQuality.m";
      __int16 v17 = 1024;
      int v18 = 94;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x19C795690);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSServiceQuality;
  [(BSServiceQuality *)&v8 dealloc];
}

+ (id)background
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, 9, 0, 0);
}

+ (id)serviceWithClass:(unsigned int)a3 relativePriority:(int)a4
{
  return +[BSServiceQuality _serviceWithClass:relativePriority:main:]((uint64_t)BSServiceQuality, *(uint64_t *)&a3, *(uint64_t *)&a4, 0);
}

- (unint64_t)hash
{
  return (101333 * self->_relativePriority) ^ (106853 * self->_serviceClass);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSServiceQuality *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && self->_serviceClass == v4->_serviceClass
      && self->_relativePriority == v4->_relativePriority;
  }

  return v6;
}

- (id)description
{
  serviceClassName = self->_serviceClassName;
  if (serviceClassName)
  {
    v4 = serviceClassName;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<%x>", self->_serviceClass);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;
  if (self->_main)
  {
    uint64_t v6 = [NSString stringWithFormat:@"main(%@)", v4];

    uint64_t v5 = (void *)v6;
  }
  uint64_t relativePriority = self->_relativePriority;
  if (relativePriority)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@%+i", v5, relativePriority];

    uint64_t v5 = (void *)v8;
  }
  if (self->_singleton) {
    int v9 = @"<BSServiceQuality:(%p) %@>";
  }
  else {
    int v9 = @"<BSServiceQuality:%p %@>";
  }
  id v10 = objc_msgSend(NSString, "stringWithFormat:", v9, self, v5);

  return v10;
}

- (void).cxx_destruct
{
}

@end