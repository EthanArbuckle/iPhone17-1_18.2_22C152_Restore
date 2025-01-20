@interface ATXInformationHeuristicRefreshContextChangeTrigger
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3;
- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3 equalToValue:(id)a4 withMinimumDurationInPreviousState:(double)a5;
- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3 predicate:(id)a4 registrationIdentifier:(id)a5;
- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXInformationHeuristicRefreshContextChangeTrigger

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3 equalToValue:(id)a4 withMinimumDurationInPreviousState:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v11 = [(ATXInformationHeuristicRefreshTrigger *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contextKeyPath, a3);
    uint64_t v13 = [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v12->_contextKeyPath equalToValue:v10 withMinimumDurationInPreviousState:a5];
    predicate = v12->_predicate;
    v12->_predicate = (_CDContextualPredicate *)v13;

    uint64_t v15 = [v9 key];
    registrationIdentifier = v12->_registrationIdentifier;
    v12->_registrationIdentifier = (NSString *)v15;
  }
  return v12;
}

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v6 = [(ATXInformationHeuristicRefreshTrigger *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contextKeyPath, a3);
    uint64_t v8 = [MEMORY[0x1E4F5B6E8] predicateForChangeAtKeyPath:v5];
    predicate = v7->_predicate;
    v7->_predicate = (_CDContextualPredicate *)v8;

    uint64_t v10 = [v5 key];
    registrationIdentifier = v7->_registrationIdentifier;
    v7->_registrationIdentifier = (NSString *)v10;
  }
  return v7;
}

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCDContextualKeyPath:(id)a3 predicate:(id)a4 registrationIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  v12 = [(ATXInformationHeuristicRefreshTrigger *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextKeyPath, a3);
    objc_storeStrong((id *)&v13->_predicate, a4);
    objc_storeStrong((id *)&v13->_registrationIdentifier, a5);
  }

  return v13;
}

- (void)_start
{
  if (!self->_registration)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke;
    v9[3] = &unk_1E68A50D8;
    objc_copyWeak(&v10, &location);
    v3 = (void *)MEMORY[0x1D25F45D0](v9);
    v4 = (void *)MEMORY[0x1E4F5B6C8];
    id v5 = [NSString stringWithFormat:@"com.apple.duetexpertd.information.contextchange.%@", self->_registrationIdentifier];
    v6 = [v4 localWakingRegistrationWithIdentifier:v5 contextualPredicate:self->_predicate clientIdentifier:@"com.apple.duetexpertd.cdidentifier" callback:v3];
    registration = self->_registration;
    self->_registration = v6;

    uint64_t v8 = [MEMORY[0x1E4F5B6A8] userContext];
    [v8 registerCallback:self->_registration];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v3 = [v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [WeakRetained[3] key];
    [v3 setObject:v4 forKey:v5];

    v6 = __atxlog_handle_gi();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = WeakRetained[3];
      int v17 = 134218242;
      objc_super v18 = WeakRetained;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshContextChangeTrigger (%p): Context changed at keypath %@. Triggering heuristics refresh.", (uint8_t *)&v17, 0x16u);
    }

    uint64_t v8 = [WeakRetained delegate];
    id v9 = [WeakRetained registeredHeuristics];
    [v8 informationHeuristicRefreshTrigger:WeakRetained didTriggerRefreshForHeuristics:v9];
  }
  else
  {
    v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke_cold_1(v3, v10, v11, v12, v13, v14, v15, v16);
    }
  }
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

- (unint64_t)hash
{
  uint64_t v3 = [(_CDContextualKeyPath *)self->_contextKeyPath hash];
  return [(_CDContextualPredicate *)self->_predicate hash] - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXInformationHeuristicRefreshContextChangeTrigger *)a3;
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
  id v5 = (void *)[v3 initWithFormat:@"InfoHeuristicRefreshContextChangeTrigger for %@", v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  id v4 = a3;
  [(ATXInformationHeuristicRefreshTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contextKeyPath, @"contextKeyPath", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_predicate forKey:@"predicate"];
  [v4 encodeObject:self->_registrationIdentifier forKey:@"registrationIdKey"];
}

- (ATXInformationHeuristicRefreshContextChangeTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXInformationHeuristicRefreshContextChangeTrigger;
  objc_super v5 = [(ATXInformationHeuristicRefreshTrigger *)&v18 initWithCoder:v4];
  if (!v5) {
    goto LABEL_3;
  }
  v6 = [v4 error];

  if (v6) {
    goto LABEL_3;
  }
  uint64_t v9 = [(ATXInformationHeuristicRefreshTrigger *)v5 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"contextKeyPath" withCoder:v4 nonNull:1];
  contextKeyPath = v5->_contextKeyPath;
  v5->_contextKeyPath = (_CDContextualKeyPath *)v9;

  if (!v5->_contextKeyPath) {
    goto LABEL_3;
  }
  uint64_t v11 = [v4 error];

  if (v11) {
    goto LABEL_3;
  }
  uint64_t v12 = [(ATXInformationHeuristicRefreshTrigger *)v5 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"predicate" withCoder:v4 nonNull:1];
  predicate = v5->_predicate;
  v5->_predicate = (_CDContextualPredicate *)v12;

  if (!v5->_predicate) {
    goto LABEL_3;
  }
  uint64_t v14 = [v4 error];

  if (v14) {
    goto LABEL_3;
  }
  uint64_t v15 = [(ATXInformationHeuristicRefreshTrigger *)v5 _safeDecodeObjectOfClass:objc_opt_class() forKey:@"registrationIdKey" withCoder:v4 nonNull:1];
  registrationIdentifier = v5->_registrationIdentifier;
  v5->_registrationIdentifier = (NSString *)v15;

  if (!v5->_registrationIdentifier
    || ([v4 error], int v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationIdentifier, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_contextKeyPath, 0);
}

void __60__ATXInformationHeuristicRefreshContextChangeTrigger__start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end