@interface CHSWidgetHost
+ (id)new;
- (BOOL)isActive;
- (CHSWidgetConfiguration)configuration;
- (CHSWidgetHost)init;
- (CHSWidgetHost)initWithIdentifier:(id)a3;
- (CHSWidgetHost)initWithIdentifier:(id)a3 configuration:(id)a4 activationState:(unint64_t)a5 connection:(id)a6;
- (CHSWidgetHost)initWithIdentifier:(id)a3 configuration:(id)a4 active:(BOOL)a5;
- (NSString)description;
- (NSString)identifier;
- (id)_connectionCopy;
- (id)_initWithHost:(id)a3;
- (unint64_t)_activationState;
- (void)_connectionCreateOrUpdateConfigurations;
- (void)_connectionRemoveHost;
- (void)_connectionUpdateActivationState;
- (void)activate;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)invalidate;
- (void)setConfiguration:(id)a3;
@end

@implementation CHSWidgetHost

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSWidgetHost.m" lineNumber:35 description:@"use initWithIdentifier:"];

  return 0;
}

- (CHSWidgetHost)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSWidgetHost.m" lineNumber:40 description:@"use initWithIdentifier:"];

  return 0;
}

- (CHSWidgetHost)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[CHSChronoServicesConnection sharedInstance];
  v6 = [(CHSWidgetHost *)self initWithIdentifier:v4 configuration:0 activationState:1 connection:v5];

  return v6;
}

- (CHSWidgetHost)initWithIdentifier:(id)a3 configuration:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = +[CHSChronoServicesConnection sharedInstance];
  v11 = [(CHSWidgetHost *)self initWithIdentifier:v8 configuration:v9 activationState:v5 connection:v10];

  return v11;
}

- (CHSWidgetHost)initWithIdentifier:(id)a3 configuration:(id)a4 activationState:(unint64_t)a5 connection:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CHSWidgetHost;
  v13 = [(CHSWidgetHost *)&v28 init];
  v14 = v13;
  if (v13)
  {
    v13->_activationState = a5;
    objc_storeStrong((id *)&v13->_connection, a6);
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [NSString stringWithFormat:@"%@-%p", v10, v14];
    loggingIdentifier = v14->_loggingIdentifier;
    v14->_loggingIdentifier = (NSString *)v17;

    uint64_t v19 = [v11 copy];
    configuration = v14->_configuration;
    v14->_configuration = (CHSWidgetConfiguration *)v19;

    v21 = CHSLogWidgetHosts();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v14->_loggingIdentifier;
      *(_DWORD *)buf = 138543618;
      v30 = v22;
      __int16 v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_190C6F000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Created: %{public}@", buf, 0x16u);
    }

    if (v11)
    {
      [(CHSWidgetHost *)v14 _connectionCreateOrUpdateConfigurations];
    }
    else
    {
      v23 = [CHSWidgetConfiguration alloc];
      v24 = objc_alloc_init(CHSWidgetMetricsSpecification);
      uint64_t v25 = [(CHSWidgetConfiguration *)v23 initWithContainerDescriptors:MEMORY[0x1E4F1CBF0] metricsSpecification:v24];
      v26 = v14->_configuration;
      v14->_configuration = (CHSWidgetConfiguration *)v25;
    }
  }

  return v14;
}

- (id)_initWithHost:(id)a3
{
  id v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSWidgetHost;
  BOOL v5 = [(CHSWidgetHost *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_identifier, v4[1]);
    objc_storeStrong((id *)&v6->_loggingIdentifier, v4[2]);
    objc_storeStrong((id *)&v6->_connection, v4[3]);
    v6->_invalid = *((unsigned char *)v4 + 40);
    v6->_activationState = (unint64_t)v4[4];
    objc_storeStrong((id *)&v6->_configuration, v4[6]);
  }

  return v6;
}

- (void)dealloc
{
  if (!self->_invalid)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"CHSWidgetHost.m" lineNumber:98 description:@"CHSWidgetHost must be invalidated before it is deallocated"];
  }
  v5.receiver = self;
  v5.super_class = (Class)CHSWidgetHost;
  [(CHSWidgetHost *)&v5 dealloc];
}

- (void)setConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_invalid)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CHSWidgetHost.m" lineNumber:105 description:@"CHSWidgetHost is invalid"];
  }
  if (![(CHSWidgetConfiguration *)self->_configuration isEqual:v5])
  {
    v6 = (CHSWidgetConfiguration *)[v5 copy];
    configuration = self->_configuration;
    self->_configuration = v6;

    objc_super v8 = CHSLogWidgetHosts();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      int v11 = 138543618;
      id v12 = loggingIdentifier;
      __int16 v13 = 2114;
      v14 = self;
      _os_log_impl(&dword_190C6F000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Configuration changed: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    [(CHSWidgetHost *)self _connectionCreateOrUpdateConfigurations];
  }
}

- (BOOL)isActive
{
  return self->_activationState == 1;
}

- (void)activate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_invalid)
  {
    v3 = CHSLogWidgetHosts();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      int v5 = 138543618;
      v6 = loggingIdentifier;
      __int16 v7 = 2114;
      objc_super v8 = self;
      _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Activated: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    self->_activationState = 1;
    [(CHSWidgetHost *)self _connectionUpdateActivationState];
  }
}

- (void)deactivate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_invalid)
  {
    v3 = CHSLogWidgetHosts();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      int v5 = 138543618;
      v6 = loggingIdentifier;
      __int16 v7 = 2114;
      objc_super v8 = self;
      _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Deactivated: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    self->_activationState = 0;
    [(CHSWidgetHost *)self _connectionUpdateActivationState];
  }
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_invalid)
  {
    self->_invalid = 1;
    v3 = CHSLogWidgetHosts();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      int v5 = 138543618;
      v6 = loggingIdentifier;
      __int16 v7 = 2114;
      objc_super v8 = self;
      _os_log_impl(&dword_190C6F000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Invalidated: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    self->_activationState = 0;
    [(CHSWidgetHost *)self _connectionRemoveHost];
  }
}

- (id)_connectionCopy
{
  v2 = [[_CHSWidgetHostForConnection alloc] initWithIdentifier:self->_identifier configuration:self->_configuration activationState:self->_activationState];
  return v2;
}

- (unint64_t)_activationState
{
  return self->_activationState;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CHSWidgetHost_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E56C81F0;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

void __46__CHSWidgetHost_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"identifier"];
  if (*(void *)(*(void *)(a1 + 40) + 32)) {
    v3 = @"activated";
  }
  else {
    v3 = @"deactivated";
  }
  id v4 = (id)[*(id *)(a1 + 32) appendObject:v3 withName:@"activationState"];
  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(*(void *)(a1 + 40) + 48) succinctDescription];
  id v6 = (id)objc_msgSend(v5, "appendObject:withName:");
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)_connectionRemoveHost
{
  connection = self->_connection;
  id v3 = [(CHSWidgetHost *)self _connectionCopy];
  -[CHSChronoServicesConnection removeWidgetHost:](connection, "removeWidgetHost:");
}

- (void)_connectionCreateOrUpdateConfigurations
{
  connection = self->_connection;
  id v3 = [(CHSWidgetHost *)self _connectionCopy];
  -[CHSChronoServicesConnection updateWidgetHostConfigurations:](connection, "updateWidgetHostConfigurations:");
}

- (void)_connectionUpdateActivationState
{
  connection = self->_connection;
  id v3 = [(CHSWidgetHost *)self _connectionCopy];
  -[CHSChronoServicesConnection updateWidgetHostActivationState:](connection, "updateWidgetHostActivationState:");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CHSWidgetConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end