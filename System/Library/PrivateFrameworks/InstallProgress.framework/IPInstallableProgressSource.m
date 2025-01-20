@interface IPInstallableProgressSource
- (IPInstallableProgressSource)initWithStateSource:(id)a3;
- (IPInstallableStateSource)installableStateSource;
- (IPProgressObserver)observer;
- (id)collationKey;
- (id)currentProgressWithError:(id *)a3;
- (id)description;
- (void)dealloc;
- (void)finishWithReason:(unint64_t)a3;
- (void)notifyOfUpdate:(id)a3;
- (void)resume;
- (void)setObserver:(id)a3;
@end

@implementation IPInstallableProgressSource

- (IPInstallableProgressSource)initWithStateSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPInstallableProgressSource;
  v6 = [(IPInstallableProgressSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_installableStateSource, a3);
    v7->_resumed = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_observer, 0);
  v3 = [(IPInstallableStateSource *)self->_installableStateSource associatedRegistry];
  [v3 unregisterProgressSource:self];

  v4.receiver = self;
  v4.super_class = (Class)IPInstallableProgressSource;
  [(IPInstallableProgressSource *)&v4 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p { %@ }>", objc_opt_class(), self, self->_installableStateSource];
}

- (id)currentProgressWithError:(id *)a3
{
  objc_super v4 = [(IPInstallableStateSource *)self->_installableStateSource currentProgressForSource:self error:a3];
  if (v4) {
    id v5 = [[IPInstallableProgress alloc] initWithSource:self progressSnapshot:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)resume
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_resumed)
  {
    v3 = _IPDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      [(IPInstallableStateSource *)(uint64_t)self resume];
    }
  }
  else
  {
    self->_resumed = 1;
    objc_super v4 = [(IPInstallableStateSource *)self->_installableStateSource associatedRegistry];
    [v4 registerProgressSource:self];

    v3 = _IPClientLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "Progress source resumed: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)collationKey
{
  return [(IPInstallableStateSource *)self->_installableStateSource collationKey];
}

- (void)notifyOfUpdate:(id)a3
{
  id v4 = a3;
  v6 = [[IPInstallableProgress alloc] initWithSource:self progressSnapshot:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained progressSource:self progressDidChange:v6];
}

- (void)finishWithReason:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained progressSource:self didEndForReason:a3];
}

- (IPInstallableStateSource)installableStateSource
{
  return (IPInstallableStateSource *)objc_getProperty(self, a2, 16, 1);
}

- (IPProgressObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (IPProgressObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_installableStateSource, 0);
}

@end