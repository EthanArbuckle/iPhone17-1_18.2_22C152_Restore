@interface CHSApplicationProcessStateChangeConsumer
- (CHSApplicationProcessStateChangeConsumer)init;
- (CHSApplicationProcessStateChangeConsumer)initWithConnection:(id)a3;
- (void)applicationWithBundleIdentifierEnteredForeground:(id)a3;
@end

@implementation CHSApplicationProcessStateChangeConsumer

- (CHSApplicationProcessStateChangeConsumer)init
{
  v3 = +[CHSChronoServicesConnection sharedInstance];
  v4 = [(CHSApplicationProcessStateChangeConsumer *)self initWithConnection:v3];

  return v4;
}

- (CHSApplicationProcessStateChangeConsumer)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSApplicationProcessStateChangeConsumer;
  v6 = [(CHSApplicationProcessStateChangeConsumer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)applicationWithBundleIdentifierEnteredForeground:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CHSLogChronoServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "noting foreground launch for %@ with widget extension; trigger metadata query",
      (uint8_t *)&v6,
      0xCu);
  }

  [(CHSChronoServicesConnection *)self->_connection reloadDescriptorsForContainerBundleIdentifier:v4 completion:&__block_literal_global_3];
}

void __93__CHSApplicationProcessStateChangeConsumer_applicationWithBundleIdentifierEnteredForeground___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__CHSApplicationProcessStateChangeConsumer_applicationWithBundleIdentifierEnteredForeground___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    id v7 = CHSLogChronoServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
      {
        v3 = [v5 descriptors];
        uint64_t v8 = [v3 count];
      }
      else
      {
        uint64_t v8 = 0;
      }
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "CHSApplicationProcessStateChangeConsumer: cacheDescriptors request completed with %lu extensions found", (uint8_t *)&v9, 0xCu);
      if (v5) {
    }
      }
  }
}

- (void).cxx_destruct
{
}

void __93__CHSApplicationProcessStateChangeConsumer_applicationWithBundleIdentifierEnteredForeground___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190C6F000, a2, OS_LOG_TYPE_ERROR, "CHSApplicationProcessStateChangeConsumer: cacheDescriptors request failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end