@interface ASDExtensionMonitor
- (ASDExtensionMonitor)initWithAttributes:(id)a3;
- (NSArray)extensions;
- (id)updateHandler;
- (void)dealloc;
- (void)setUpdateHandler:(id)a3;
@end

@implementation ASDExtensionMonitor

- (ASDExtensionMonitor)initWithAttributes:(id)a3
{
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDExtensionMonitor;
  v5 = [(ASDExtensionMonitor *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    extensionAttributes = v5->_extensionAttributes;
    v5->_extensionAttributes = (NSDictionary *)v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v5->_extensionAttributes error:&v16];
    extensions = v5->_extensions;
    v5->_extensions = (NSArray *)v8;

    if (!v5->_extensions)
    {
      v5->_extensions = (NSArray *)MEMORY[0x1E4F1CBF0];
      v10 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_error_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_ERROR, "Failed to get extensions: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    objc_initWeak(&location, v5);
    v11 = (void *)MEMORY[0x1E4F28C70];
    v12 = v5->_extensionAttributes;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v20 = __49__ASDExtensionMonitor__startMonitoringExtensions__block_invoke;
    v21 = &unk_1E58B5030;
    objc_copyWeak(v22, &location);
    uint64_t v13 = [v11 beginMatchingExtensionsWithAttributes:v12 completion:&buf];
    id matchingContext = v5->_matchingContext;
    v5->_id matchingContext = (id)v13;

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  if (self)
  {
    [MEMORY[0x1E4F28C70] endMatchingExtensions:self->_matchingContext];
    id matchingContext = self->_matchingContext;
    self->_id matchingContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDExtensionMonitor;
  [(ASDExtensionMonitor *)&v4 dealloc];
}

- (NSArray)extensions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_extensions;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)updateHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = (void *)MEMORY[0x19F393180](self->_updateHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x19F393180](v4);

  return v5;
}

- (void)setUpdateHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)[v5 copy];

  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

void __49__ASDExtensionMonitor__startMonitoringExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = (void *)[v5 copy];
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)WeakRetained + 4, v8);
      uint64_t v9 = MEMORY[0x19F393180](*((void *)WeakRetained + 5));
      os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 6);
      if (v9) {
        (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
      }
    }
    else
    {
      uint64_t v9 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543362;
        id v11 = v6;
        _os_log_error_impl(&dword_19BF6A000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Failed to get extensions: %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_matchingContext, 0);
  objc_storeStrong((id *)&self->_extensionAttributes, 0);
}

@end