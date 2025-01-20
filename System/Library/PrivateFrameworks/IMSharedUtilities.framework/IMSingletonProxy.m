@interface IMSingletonProxy
+ (void)initialize;
- (BOOL)__isSingletonProxy__im;
- (IMSingletonProxy)initWithSingleton:(id)a3 singletonOverride:(id)a4;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)singletonOverrideRef;
- (id)singletonRef;
- (void)forwardInvocation:(id)a3;
- (void)setSingletonOverride:(id)a3;
@end

@implementation IMSingletonProxy

- (BOOL)__isSingletonProxy__im
{
  return 1;
}

+ (void)initialize
{
  if ((byte_1E94FF851 & 1) == 0)
  {
    byte_1E94FF851 = 1;
    if (NSClassFromString(&cfstr_Xctestcase.isa))
    {
      IMSetAlwaysUseSingletonProxies(1);
    }
  }
}

- (id)singletonRef
{
  return self->_singleton;
}

- (id)singletonOverrideRef
{
  id WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);

  return WeakRetained;
}

- (IMSingletonProxy)initWithSingleton:(id)a3 singletonOverride:(id)a4
{
  objc_storeStrong(&self->_singleton, a3);
  id v6 = a4;
  [(IMSingletonProxy *)self setSingletonOverride:v6];

  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);
  if (!WeakRetained)
  {
    id singleton = self->_singleton;
LABEL_5:
    id v6 = v8;
    goto LABEL_10;
  }
  uint64_t v5 = [v8 selector];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v6 = v8;
      id singleton = self->_singleton;
      goto LABEL_10;
    }
    if (![WeakRetained shouldInvokeSelector:v5 onSingleton:self->_singleton]) {
      goto LABEL_11;
    }
    id singleton = self->_singleton;
    goto LABEL_5;
  }
  id v6 = v8;
  id singleton = WeakRetained;
LABEL_10:
  [v6 setTarget:singleton];
  [v8 invoke];
LABEL_11:
}

- (id)methodSignatureForSelector:(SEL)a3
{
  p_singletonOverride = &self->_singletonOverride;
  id WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);
  if (!WeakRetained && self->_overrideClass)
  {
    v7 = IMLogHandleForCategory("IMSingletonLog");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1A09F1E94(&self->_overrideClass);
    }

    self->_overrideClass = 0;
  }
  id singleton = self->_singleton;
  if (!singleton
    || ([singleton methodSignatureForSelector:a3],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0)
    && ([(id)objc_opt_class() instanceMethodSignatureForSelector:a3],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = objc_loadWeakRetained(p_singletonOverride);

    if (!v10
      || (id v11 = objc_loadWeakRetained(p_singletonOverride),
          [v11 methodSignatureForSelector:a3],
          v9 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v9))
    {
      v13.receiver = self;
      v13.super_class = (Class)IMSingletonProxy;
      v9 = [(IMSingletonProxy *)&v13 methodSignatureForSelector:a3];
    }
  }

  return v9;
}

- (void)setSingletonOverride:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained didOverrideSingleton:0];
  }
  id v6 = objc_storeWeak(&self->_singletonOverride, v4);

  if (v4)
  {
    id v7 = objc_loadWeakRetained(&self->_singletonOverride);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained(&self->_singletonOverride);
      [v9 didOverrideSingleton:self->_singleton];
    }
    id v10 = objc_loadWeakRetained(&self->_singletonOverride);
    self->_overrideClass = (Class)objc_opt_class();

    id v11 = IMLogHandleForCategory("IMSingletonLog");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1A09F1FEC(self);
    }
  }
  else
  {
    overrideClass = self->_overrideClass;
    self->_overrideClass = 0;
    id v11 = IMLogHandleForCategory("IMSingletonLog");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1A09F1F1C(overrideClass, (uint64_t)self, v11);
    }
  }
}

- (id)description
{
  p_singletonOverride = &self->_singletonOverride;
  id WeakRetained = objc_loadWeakRetained(&self->_singletonOverride);

  id v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  id v7 = (void *)v6;
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(p_singletonOverride);
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [v4 stringWithFormat:@"IMSingletonProxy: singleton class: %@ overridden by class: %@", v7, v10];
  }
  else
  {
    id v11 = [v4 stringWithFormat:@"IMSingletonProxy: singleton class: %@ not overridden", v6];
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_singletonOverride);

  objc_storeStrong(&self->_singleton, 0);
}

@end