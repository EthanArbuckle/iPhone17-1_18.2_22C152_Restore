@interface ATXHeuristicCacheContextStoreExpirer
+ (BOOL)supportsSecureCoding;
- (ATXHeuristicCacheContextStoreExpirer)initWithCDContextualKeyPath:(id)a3;
- (ATXHeuristicCacheContextStoreExpirer)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXHeuristicCacheContextStoreExpirer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_contextKeyPath, 0);
}

- (void)_stop
{
  if (self->_registration)
  {
    v3 = [MEMORY[0x1E4F5B6A8] userContext];
    [v3 deregisterCallback:self->_registration];

    registration = self->_registration;
    self->_registration = 0;
  }
}

- (ATXHeuristicCacheContextStoreExpirer)initWithCDContextualKeyPath:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXHeuristicCacheContextStoreExpirer;
  v6 = [(ATXHeuristicCacheExpirer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextKeyPath, a3);
    uint64_t v8 = [MEMORY[0x1E4F5B6E8] predicateForChangeAtKeyPath:v5];
    predicate = v7->_predicate;
    v7->_predicate = (_CDContextualPredicate *)v8;
  }
  return v7;
}

- (void)_start
{
  if (!self->_registration)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke;
    v10[3] = &unk_1E68A50D8;
    objc_copyWeak(&v11, &location);
    v3 = (void *)MEMORY[0x1D25F45D0](v10);
    v4 = NSString;
    id v5 = [(_CDContextualKeyPath *)self->_contextKeyPath key];
    v6 = [v4 stringWithFormat:@"com.apple.duetexpertd.heuristics.contextchange-%@", v5];

    v7 = [MEMORY[0x1E4F5B6C8] localWakingRegistrationWithIdentifier:v6 contextualPredicate:self->_predicate clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v3];
    registration = self->_registration;
    self->_registration = v7;

    v9 = [MEMORY[0x1E4F5B6A8] userContext];
    [v9 registerCallback:self->_registration];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v3 = [v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [WeakRetained[10] key];
    [v3 setObject:v4 forKey:v5];

    v6 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = WeakRetained[10];
      int v8 = 134218242;
      v9 = WeakRetained;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCacheContextStoreExpirer (%p): Context changed at keypath %@. Triggering heuristics refresh.", (uint8_t *)&v8, 0x16u);
    }

    [WeakRetained expire];
  }
  else
  {
    v3 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke_cold_1();
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(_CDContextualKeyPath *)self->_contextKeyPath hash];
  return [(_CDContextualPredicate *)self->_predicate hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXHeuristicCacheContextStoreExpirer *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      contextKeyPath = self->_contextKeyPath;
      if (contextKeyPath == v5->_contextKeyPath
        || -[_CDContextualKeyPath isEqual:](contextKeyPath, "isEqual:"))
      {
        predicate = self->_predicate;
        if (predicate == v5->_predicate) {
          char v8 = 1;
        }
        else {
          char v8 = -[_CDContextualPredicate isEqual:](predicate, "isEqual:");
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(_CDContextualKeyPath *)self->_contextKeyPath key];
  id v5 = (void *)[v3 initWithFormat:@"ATXHeuristicCacheContextStoreExpirer for %@", v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicCacheContextStoreExpirer;
  id v4 = a3;
  [(ATXHeuristicCacheExpirer *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contextKeyPath, @"contextKeyPath", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_predicate forKey:@"predicate"];
}

- (ATXHeuristicCacheContextStoreExpirer)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXHeuristicCacheContextStoreExpirer;
  objc_super v5 = [(ATXHeuristicCacheExpirer *)&v15 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = [v4 error];

  if (v6) {
    goto LABEL_3;
  }
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextKeyPath"];
  contextKeyPath = v5->_contextKeyPath;
  v5->_contextKeyPath = (_CDContextualKeyPath *)v9;

  if (!v5->_contextKeyPath) {
    goto LABEL_3;
  }
  id v11 = [v4 error];

  if (v11) {
    goto LABEL_3;
  }
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  predicate = v5->_predicate;
  v5->_predicate = (_CDContextualPredicate *)v12;

  if (!v5->_predicate
    || ([v4 error], v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
LABEL_3:
    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

void __46__ATXHeuristicCacheContextStoreExpirer__start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_ERROR, "ATXHeuristicCacheContextStoreExpirer: unable to handle CDContextChange because strongSelf is nil", v1, 2u);
}

@end