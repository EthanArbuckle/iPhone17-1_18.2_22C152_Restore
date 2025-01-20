@interface IPInstallableStateSource
- (IPInstallableStateSource)initWithRegistry:(id)a3;
- (IPStateObserver)observer;
- (id)associatedRegistry;
- (id)collationKey;
- (id)currentProgressForSource:(id)a3 error:(id *)a4;
- (id)currentStateWithError:(id *)a3;
- (id)progressSourceWithError:(id *)a3;
- (unint64_t)installableType;
- (void)dealloc;
- (void)noteInstallStarted;
- (void)notifyOfUpdate:(id)a3;
- (void)resume;
- (void)setObserver:(id)a3;
@end

@implementation IPInstallableStateSource

- (id)associatedRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedRegistry);

  return WeakRetained;
}

- (IPInstallableStateSource)initWithRegistry:(id)a3
{
  id v4 = a3;
  v5 = [(IPInstallableStateSource *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_associatedRegistry, v4);
    v6->_resumed = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_observer, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedRegistry);
  [WeakRetained unregisterStateSource:self];

  v4.receiver = self;
  v4.super_class = (Class)IPInstallableStateSource;
  [(IPInstallableStateSource *)&v4 dealloc];
}

- (void)resume
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_252AA9000, a2, OS_LOG_TYPE_FAULT, "Attempted to resume %@, which was already resumed!", (uint8_t *)&v2, 0xCu);
}

- (IPStateObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (IPStateObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);

  objc_destroyWeak((id *)&self->_associatedRegistry);
}

- (id)collationKey
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_1(v2);
  return 0;
}

- (unint64_t)installableType
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0_1(v2);
  return 0;
}

- (id)currentStateWithError:(id *)a3
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_1(v3);
  return 0;
}

- (id)progressSourceWithError:(id *)a3
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_1(v3);
  return 0;
}

- (id)currentProgressForSource:(id)a3 error:(id *)a4
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = objc_opt_class();
  OUTLINED_FUNCTION_0_1(v4);
  return 0;
}

- (void)noteInstallStarted
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = objc_opt_class();

  MEMORY[0x270EF2BB8](v3, v2, v4);
}

- (void)notifyOfUpdate:(id)a3
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = objc_opt_class();

  MEMORY[0x270EF2BB8](v4, v3, v5);
}

@end