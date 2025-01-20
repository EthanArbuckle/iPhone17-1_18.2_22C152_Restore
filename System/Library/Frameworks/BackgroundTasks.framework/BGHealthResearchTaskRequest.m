@interface BGHealthResearchTaskRequest
+ (Class)_correspondingTaskClass;
+ (id)_requestFromActivity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSFileProtectionType)protectionTypeOfRequiredData;
- (id)_activity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setProtectionTypeOfRequiredData:(NSFileProtectionType)protectionTypeOfRequiredData;
@end

@implementation BGHealthResearchTaskRequest

+ (id)_requestFromActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 launchReason];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F3B048]];

  if (v6)
  {
    id v7 = objc_alloc((Class)a1);
    v8 = [v4 clientProvidedIdentifier];
    v9 = (void *)[v7 initWithIdentifier:v8];

    v10 = [v4 clientProvidedStartDate];
    [v9 setEarliestBeginDate:v10];

    objc_msgSend(v9, "setRequiresExternalPower:", objc_msgSend(v4, "requiresPlugin"));
    objc_msgSend(v9, "setRequiresNetworkConnectivity:", objc_msgSend(v4, "requiresNetwork"));
    v11 = [v4 fileProtection];
    v12 = [v11 protectionType];
    [v9 setProtectionTypeOfRequiredData:v12];
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
  BOOL v6 = [(BGProcessingTaskRequest *)self requiresExternalPower];
  BOOL v7 = [(BGProcessingTaskRequest *)self requiresNetworkConnectivity];
  v8 = [(BGHealthResearchTaskRequest *)self protectionTypeOfRequiredData];
  v9 = [v3 stringWithFormat:@"<BGHealthResearchTaskRequest: %@, earliestBeginDate: %@, requiresExternalPower=%u, requiresNetworkConnectivity=%u, protectionTypeOfRequiredData=%@>", v4, v5, v6, v7, v8];

  return v9;
}

+ (Class)_correspondingTaskClass
{
  return (Class)objc_opt_class();
}

- (id)_activity
{
  v3 = NSString;
  id v4 = [(BGTaskRequest *)self identifier];
  v5 = [v3 stringWithFormat:@"bgHealthResearch-%@", v4];

  BOOL v6 = (void *)MEMORY[0x263F3AFC8];
  uint64_t v7 = *MEMORY[0x263F3B070];
  uint64_t v8 = *MEMORY[0x263F3AFF0];
  v9 = [MEMORY[0x263EFF910] distantFuture];
  v10 = [MEMORY[0x263EFF910] distantFuture];
  v11 = [v6 activityWithName:v5 priority:v7 duration:v8 startingAfter:v9 startingBefore:v10];

  [v11 setLaunchReason:*MEMORY[0x263F3B048]];
  v12 = [(BGTaskRequest *)self identifier];
  [v11 setClientProvidedIdentifier:v12];

  v13 = [(BGTaskRequest *)self earliestBeginDate];
  [v11 setClientProvidedStartDate:v13];

  objc_msgSend(v11, "setRequiresPlugin:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  objc_msgSend(v11, "setRequiresNetwork:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  v14 = (void *)MEMORY[0x263F3AFD0];
  v15 = [(BGHealthResearchTaskRequest *)self protectionTypeOfRequiredData];
  v16 = [v14 protectionWithType:v15];
  [v11 setFileProtection:v16];

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
  uint64_t v10 = v6 ^ v7 ^ v9;
  v11 = [(BGHealthResearchTaskRequest *)self protectionTypeOfRequiredData];
  unint64_t v12 = v10 ^ (16 * [v11 hash]);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (BGHealthResearchTaskRequest *)a3;
  if (self == v6)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      BOOL v8 = [(BGTaskRequest *)v7 identifier];
      uint64_t v9 = [(BGTaskRequest *)self identifier];
      if (v8 != v9)
      {
        uint64_t v10 = [(BGTaskRequest *)v7 identifier];
        v3 = [(BGTaskRequest *)self identifier];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_25;
        }
        v24 = v10;
      }
      unint64_t v12 = [(BGTaskRequest *)v7 earliestBeginDate];
      v13 = [(BGTaskRequest *)self earliestBeginDate];
      if (v12 == v13
        || ([(BGTaskRequest *)v7 earliestBeginDate],
            v14 = objc_claimAutoreleasedReturnValue(),
            [(BGTaskRequest *)self earliestBeginDate],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            v23 = v14,
            [v14 isEqual:v4]))
      {
        if (([(BGProcessingTaskRequest *)v7 requiresNetworkConnectivity]
           && [(BGProcessingTaskRequest *)self requiresNetworkConnectivity]
           || ![(BGProcessingTaskRequest *)v7 requiresNetworkConnectivity]
           && ![(BGProcessingTaskRequest *)self requiresNetworkConnectivity])
          && ([(BGProcessingTaskRequest *)v7 requiresExternalPower]
           && [(BGProcessingTaskRequest *)self requiresExternalPower]
           || ![(BGProcessingTaskRequest *)v7 requiresExternalPower]
           && ![(BGProcessingTaskRequest *)self requiresExternalPower]))
        {
          v17 = [(BGHealthResearchTaskRequest *)v7 protectionTypeOfRequiredData];
          uint64_t v18 = [(BGHealthResearchTaskRequest *)self protectionTypeOfRequiredData];
          if (v17 == (void *)v18)
          {

            char v11 = 1;
            char v15 = 1;
          }
          else
          {
            v22 = (void *)v18;
            v20 = [(BGHealthResearchTaskRequest *)v7 protectionTypeOfRequiredData];
            v21 = v17;
            v19 = [(BGHealthResearchTaskRequest *)self protectionTypeOfRequiredData];
            char v11 = objc_msgSend(v20, "isEqual:");

            char v15 = v11;
          }
        }
        else
        {
          char v11 = 0;
          char v15 = 0;
        }
        if (v12 == v13)
        {

          char v11 = v15;
LABEL_24:
          uint64_t v10 = v24;
          if (v8 == v9)
          {
LABEL_26:

            goto LABEL_27;
          }
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        char v11 = 0;
      }

      goto LABEL_24;
    }
    char v11 = 0;
  }
LABEL_27:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BGHealthResearchTaskRequest;
  id v4 = [(BGProcessingTaskRequest *)&v8 copyWithZone:a3];
  v5 = [(BGTaskRequest *)self earliestBeginDate];
  [v4 setEarliestBeginDate:v5];

  objc_msgSend(v4, "setRequiresNetworkConnectivity:", -[BGProcessingTaskRequest requiresNetworkConnectivity](self, "requiresNetworkConnectivity"));
  objc_msgSend(v4, "setRequiresExternalPower:", -[BGProcessingTaskRequest requiresExternalPower](self, "requiresExternalPower"));
  uint64_t v6 = [(BGHealthResearchTaskRequest *)self protectionTypeOfRequiredData];
  [v4 setProtectionTypeOfRequiredData:v6];

  return v4;
}

- (NSFileProtectionType)protectionTypeOfRequiredData
{
  return self->_protectionTypeOfRequiredData;
}

- (void)setProtectionTypeOfRequiredData:(NSFileProtectionType)protectionTypeOfRequiredData
{
  self->_protectionTypeOfRequiredData = protectionTypeOfRequiredData;
}

@end