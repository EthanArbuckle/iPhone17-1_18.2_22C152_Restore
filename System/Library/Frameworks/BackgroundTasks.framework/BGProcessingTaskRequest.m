@interface BGProcessingTaskRequest
+ (Class)_correspondingTaskClass;
+ (id)_requestFromActivity:(id)a3;
- (BGProcessingTaskRequest)initWithIdentifier:(NSString *)identifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresExternalPower;
- (BOOL)requiresNetworkConnectivity;
- (id)_activity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setRequiresExternalPower:(BOOL)requiresExternalPower;
- (void)setRequiresNetworkConnectivity:(BOOL)requiresNetworkConnectivity;
@end

@implementation BGProcessingTaskRequest

- (BGProcessingTaskRequest)initWithIdentifier:(NSString *)identifier
{
  v4.receiver = self;
  v4.super_class = (Class)BGProcessingTaskRequest;
  return (BGProcessingTaskRequest *)[(BGTaskRequest *)&v4 _initWithIdentifier:identifier];
}

- (void)setRequiresExternalPower:(BOOL)requiresExternalPower
{
  self->_requiresExternalPower = requiresExternalPower;
}

- (void)setRequiresNetworkConnectivity:(BOOL)requiresNetworkConnectivity
{
  self->_requiresNetworkConnectivity = requiresNetworkConnectivity;
}

+ (id)_requestFromActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 launchReason];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F3B028]];

  if (v6)
  {
    id v7 = objc_alloc((Class)a1);
    v8 = [v4 clientProvidedIdentifier];
    v9 = (void *)[v7 initWithIdentifier:v8];

    v10 = [v4 clientProvidedStartDate];
    [v9 setEarliestBeginDate:v10];

    objc_msgSend(v9, "setRequiresExternalPower:", objc_msgSend(v4, "requiresPlugin"));
    objc_msgSend(v9, "setRequiresNetworkConnectivity:", objc_msgSend(v4, "requiresNetwork"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(BGTaskRequest *)self identifier];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  int v6 = [v3 stringWithFormat:@"<BGProcessingTaskRequest: %@, earliestBeginDate: %@, requiresExternalPower=%u, requiresNetworkConnectivity=%u>", v4, v5, -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"), -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity")];

  return v6;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
}

- (id)_activity
{
  v3 = NSString;
  id v4 = [(BGTaskRequest *)self identifier];
  v5 = [v3 stringWithFormat:@"bgProcessing-%@", v4];

  int v6 = (void *)MEMORY[0x263F3AFC8];
  uint64_t v7 = *MEMORY[0x263F3B050];
  uint64_t v8 = *MEMORY[0x263F3AFF0];
  v9 = [MEMORY[0x263EFF910] distantFuture];
  v10 = [MEMORY[0x263EFF910] distantFuture];
  v11 = [v6 activityWithName:v5 priority:v7 duration:v8 startingAfter:v9 startingBefore:v10];

  [v11 setLaunchReason:*MEMORY[0x263F3B028]];
  v12 = [(BGTaskRequest *)self identifier];
  [v11 setClientProvidedIdentifier:v12];

  v13 = [(BGTaskRequest *)self earliestBeginDate];
  [v11 setClientProvidedStartDate:v13];

  objc_msgSend(v11, "setRequiresPlugin:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  objc_msgSend(v11, "setRequiresNetwork:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));

  return v11;
}

- (unint64_t)hash
{
  v3 = [(BGTaskRequest *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  uint64_t v6 = v4 ^ (2 * [v5 hash]);
  if ([(BGProcessingTaskRequest *)self requiresNetworkConnectivity]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(BGProcessingTaskRequest *)self requiresExternalPower];
  uint64_t v9 = 8;
  if (!v8) {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v6 ^ v7 ^ v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v7 = (BGProcessingTaskRequest *)a3;
  if (self == v7)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = v7;
      uint64_t v9 = [(BGTaskRequest *)v8 identifier];
      unint64_t v10 = [(BGTaskRequest *)self identifier];
      if (v9 != v10)
      {
        v3 = [(BGTaskRequest *)v8 identifier];
        uint64_t v4 = [(BGTaskRequest *)self identifier];
        if (![v3 isEqual:v4])
        {
          LOBYTE(v11) = 0;
          goto LABEL_24;
        }
        v15 = v3;
      }
      v12 = [(BGTaskRequest *)v8 earliestBeginDate];
      v13 = [(BGTaskRequest *)self earliestBeginDate];
      if (v12 != v13)
      {
        v5 = [(BGTaskRequest *)v8 earliestBeginDate];
        v3 = [(BGTaskRequest *)self earliestBeginDate];
        if (![v5 isEqual:v3])
        {
          LOBYTE(v11) = 0;
LABEL_22:

LABEL_23:
          v3 = v15;
          if (v9 == v10)
          {
LABEL_25:

            goto LABEL_26;
          }
LABEL_24:

          goto LABEL_25;
        }
      }
      if ((![(BGProcessingTaskRequest *)v8 requiresNetworkConnectivity]
         || ![(BGProcessingTaskRequest *)self requiresNetworkConnectivity])
        && ([(BGProcessingTaskRequest *)v8 requiresNetworkConnectivity]
         || [(BGProcessingTaskRequest *)self requiresNetworkConnectivity]))
      {
        goto LABEL_20;
      }
      if ([(BGProcessingTaskRequest *)v8 requiresExternalPower]
        && [(BGProcessingTaskRequest *)self requiresExternalPower])
      {
        LOBYTE(v11) = 1;
        goto LABEL_21;
      }
      if ([(BGProcessingTaskRequest *)v8 requiresExternalPower]) {
LABEL_20:
      }
        LOBYTE(v11) = 0;
      else {
        BOOL v11 = ![(BGProcessingTaskRequest *)self requiresExternalPower];
      }
LABEL_21:
      if (v12 == v13) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    LOBYTE(v11) = 0;
  }
LABEL_26:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BGProcessingTaskRequest;
  id v4 = [(BGTaskRequest *)&v7 copyWithZone:a3];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  [v4 setEarliestBeginDate:v5];

  objc_msgSend(v4, "setRequiresNetworkConnectivity:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  objc_msgSend(v4, "setRequiresExternalPower:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  return v4;
}

- (BOOL)requiresNetworkConnectivity
{
  return self->_requiresNetworkConnectivity;
}

- (BOOL)requiresExternalPower
{
  return self->_requiresExternalPower;
}

@end