@interface FBProcessObserver
- (BOOL)isEqual:(id)a3;
- (FBProcessObserver)initWithObserver:(id)a3;
- (FBProcessObserver)observer;
- (unint64_t)hash;
- (void)applicationProcessDebuggingStateDidChange:(id)a3;
- (void)applicationProcessDidLaunch:(id)a3;
- (void)applicationProcessWillLaunch:(id)a3;
- (void)invalidate;
- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
- (void)processDidExit:(id)a3;
- (void)processWillExit:(id)a3;
@end

@implementation FBProcessObserver

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (void)applicationProcessDidLaunch:(id)a3
{
  id v5 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (WeakRetained)
    {
      [(FBProcessObserver *)self applicationProcessWillLaunch:v5];
      if (self->_supportsApplicationDidLaunch
        && (BSAtomicGetFlag() & 1) == 0
        && [v5 isApplicationProcess])
      {
        [WeakRetained applicationProcessDidLaunch:v5];
      }
    }
  }
}

- (void)applicationProcessWillLaunch:(id)a3
{
  id v5 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (self->_supportsApplicationWillLaunch
      && (BSAtomicGetFlag() & 1) == 0
      && WeakRetained
      && [v5 isApplicationProcess])
    {
      [WeakRetained applicationProcessWillLaunch:v5];
    }
  }
}

- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (self->_supportsStateDidChange && (BSAtomicGetFlag() & 1) == 0 && WeakRetained) { {
    [WeakRetained process:v11 stateDidChangeFromState:v8 toState:v9];
  }
  }
}

- (FBProcessObserver)initWithObserver:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)FBProcessObserver;
    v7 = [(FBProcessObserver *)&v11 init];
    id v8 = v7;
    if (v7)
    {
      objc_storeWeak((id *)&v7->_observer, v6);
      v8->_observerAddress = (unint64_t)v6;
      v8->_observerClass = (Class)objc_opt_class();
      v8->_supportsWillExit = objc_opt_respondsToSelector() & 1;
      v8->_supportsDidExit = objc_opt_respondsToSelector() & 1;
      v8->_supportsStateDidChange = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationDidExit = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationWillLaunch = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationDidLaunch = objc_opt_respondsToSelector() & 1;
      v8->_supportsApplicationDebugState = objc_opt_respondsToSelector() & 1;
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBProcessObserver *)a2 initWithObserver:(uint64_t)v10];
    }
    }
    [v10 UTF8String];
    result = (FBProcessObserver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FBProcessObserver *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_observerAddress == self->_observerAddress
      && v4->_observerClass == self->_observerClass)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      id v8 = objc_loadWeakRetained((id *)&self->_observer);
      BOOL v5 = WeakRetained == v8;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)invalidate
{
}

- (void)processWillExit:(id)a3
{
  id v6 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    BOOL v5 = WeakRetained;
    if (WeakRetained && self->_supportsWillExit) { {
      [WeakRetained processWillExit:v6];
    }
    }
  }
}

- (void)processDidExit:(id)a3
{
  id v6 = a3;
  if ((BSAtomicGetFlag() & 1) == 0 && BSAtomicSetFlag())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    if (WeakRetained)
    {
      if (self->_supportsApplicationDidExit && [v6 isApplicationProcess])
      {
        BOOL v5 = [v6 exitContext];
        [WeakRetained applicationProcessDidExit:v6 withContext:v5];
      }
      if (self->_supportsDidExit) { {
        [WeakRetained processDidExit:v6];
      }
      }
    }
  }
}

- (void)applicationProcessDebuggingStateDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_supportsApplicationDebugState)
  {
    id v8 = v4;
    int v6 = [v4 isApplicationProcess];
    BOOL v5 = v8;
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      [WeakRetained applicationProcessDebuggingStateDidChange:v8];

      BOOL v5 = v8;
    }
  }
}

- (FBProcessObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (FBProcessObserver *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)initWithObserver:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  int v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  objc_super v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBProcessObserver.m";
  __int16 v16 = 1024;
  int v17 = 34;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end