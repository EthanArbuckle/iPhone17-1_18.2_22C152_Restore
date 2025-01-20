@interface HMDBackgroundSystemTaskRequest
- (BGRepeatingSystemTaskRequest)taskRequest;
- (BOOL)requiresInexpensiveNetworkConnectivity;
- (BOOL)requiresSignificantUserInactivity;
- (HMDBackgroundSystemTaskRequest)initWithIdentifier:(id)a3;
- (HMDBackgroundSystemTaskRequest)initWithTaskRequest:(id)a3;
- (NSString)identifier;
- (double)interval;
- (double)minDurationBetweenInstances;
- (id)attributeDescriptions;
- (void)setInterval:(double)a3;
- (void)setMinDurationBetweenInstances:(double)a3;
- (void)setRequiresInexpensiveNetworkConnectivity:(BOOL)a3;
- (void)setRequiresSignificantUserInactivity:(BOOL)a3;
@end

@implementation HMDBackgroundSystemTaskRequest

- (void).cxx_destruct
{
}

- (void)setMinDurationBetweenInstances:(double)a3
{
  self->_minDurationBetweenInstances = a3;
}

- (double)minDurationBetweenInstances
{
  return self->_minDurationBetweenInstances;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setRequiresSignificantUserInactivity:(BOOL)a3
{
  self->_requiresSignificantUserInactivity = a3;
}

- (BOOL)requiresSignificantUserInactivity
{
  return self->_requiresSignificantUserInactivity;
}

- (void)setRequiresInexpensiveNetworkConnectivity:(BOOL)a3
{
  self->_requiresInexpensiveNetworkConnectivity = a3;
}

- (BOOL)requiresInexpensiveNetworkConnectivity
{
  return self->_requiresInexpensiveNetworkConnectivity;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDBackgroundSystemTaskRequest *)self identifier];
  v5 = (void *)[v3 initWithName:@"Identifier" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (BGRepeatingSystemTaskRequest)taskRequest
{
  id v3 = objc_alloc(MEMORY[0x263F298E8]);
  v4 = [(HMDBackgroundSystemTaskRequest *)self identifier];
  v5 = (void *)[v3 initWithIdentifier:v4];

  objc_msgSend(v5, "setRequiresInexpensiveNetworkConnectivity:", -[HMDBackgroundSystemTaskRequest requiresInexpensiveNetworkConnectivity](self, "requiresInexpensiveNetworkConnectivity"));
  objc_msgSend(v5, "setRequiresSignificantUserInactivity:", -[HMDBackgroundSystemTaskRequest requiresSignificantUserInactivity](self, "requiresSignificantUserInactivity"));
  [(HMDBackgroundSystemTaskRequest *)self interval];
  objc_msgSend(v5, "setInterval:");
  [(HMDBackgroundSystemTaskRequest *)self minDurationBetweenInstances];
  objc_msgSend(v5, "setMinDurationBetweenInstances:");
  [v5 setPriority:1];
  return (BGRepeatingSystemTaskRequest *)v5;
}

- (HMDBackgroundSystemTaskRequest)initWithTaskRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [(HMDBackgroundSystemTaskRequest *)self initWithIdentifier:v5];

  -[HMDBackgroundSystemTaskRequest setRequiresInexpensiveNetworkConnectivity:](v6, "setRequiresInexpensiveNetworkConnectivity:", [v4 requiresInexpensiveNetworkConnectivity]);
  -[HMDBackgroundSystemTaskRequest setRequiresSignificantUserInactivity:](v6, "setRequiresSignificantUserInactivity:", [v4 requiresSignificantUserInactivity]);
  [v4 interval];
  -[HMDBackgroundSystemTaskRequest setInterval:](v6, "setInterval:");
  [v4 minDurationBetweenInstances];
  double v8 = v7;

  [(HMDBackgroundSystemTaskRequest *)v6 setMinDurationBetweenInstances:v8];
  return v6;
}

- (HMDBackgroundSystemTaskRequest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundSystemTaskRequest;
  v6 = [(HMDBackgroundSystemTaskRequest *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

@end