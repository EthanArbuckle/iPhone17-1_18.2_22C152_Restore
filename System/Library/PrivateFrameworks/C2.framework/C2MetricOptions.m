@interface C2MetricOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)anonymous;
- (BOOL)clientOperationTriggered:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)operationGroupTriggered:(id)a3;
- (BOOL)pushTrigger;
- (C2MetricOptions)init;
- (C2MetricOptions)initWithCoder:(id)a3;
- (NSArray)clientOperations;
- (NSArray)operationGroups;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)clientProcessBundleId;
- (NSString)clientProcessVersion;
- (NSString)container;
- (NSString)containerScopedDeviceIdentifier;
- (NSString)containerScopedUserIdentifier;
- (NSString)databaseScope;
- (NSString)environment;
- (NSString)headerValueForTriggers;
- (NSURL)c2MetricsEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)didCompleteWithError;
- (id)generateCloudKitInfo;
- (id)testBehavior_reportMetric;
- (int)generateTriggerWithResponseHeader:(unsigned __int8)a3;
- (unint64_t)hash;
- (unint64_t)reportClientOperationFrequency;
- (unint64_t)reportClientOperationFrequencyBase;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)reportOperationGroupFrequency;
- (unint64_t)reportOperationGroupFrequencyBase;
- (unsigned)reportFrequencyRandomValue;
- (void)encodeWithCoder:(id)a3;
- (void)rollReportFrequencyRandomValue;
- (void)setAnonymous:(BOOL)a3;
- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setC2MetricsEndpoint:(id)a3;
- (void)setClientOperations:(id)a3;
- (void)setClientProcessBundleId:(id)a3;
- (void)setClientProcessVersion:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerScopedDeviceIdentifier:(id)a3;
- (void)setContainerScopedUserIdentifier:(id)a3;
- (void)setDatabaseScope:(id)a3;
- (void)setDidCompleteWithError:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setOperationGroups:(id)a3;
- (void)setPushTrigger:(BOOL)a3;
- (void)setReportClientOperationFrequency:(unint64_t)a3;
- (void)setReportClientOperationFrequencyBase:(unint64_t)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setReportFrequencyRandomValue:(unsigned int)a3;
- (void)setReportOperationGroupFrequency:(unint64_t)a3;
- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3;
- (void)setTestBehavior_reportMetric:(id)a3;
@end

@implementation C2MetricOptions

void __39__C2MetricOptions_generateCloudKitInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = objc_alloc_init(C2MPCloudKitOperationInfo);
  v4 = [v11 operationId];
  [(C2MPCloudKitOperationInfo *)v3 setOperationId:v4];

  v5 = [v11 operationType];
  [(C2MPCloudKitOperationInfo *)v3 setOperationType:v5];

  -[C2MPCloudKitOperationInfo setOperationTriggered:](v3, "setOperationTriggered:", [*(id *)(a1 + 32) clientOperationTriggered:v11]);
  v6 = [v11 operationGroup];

  if (v6)
  {
    v7 = *(NSMapTable **)(a1 + 40);
    v8 = [v11 operationGroup];
    v9 = [v8 operationGroupId];
    v10 = NSMapGet(v7, v9);

    if (v10) {
      [(C2MPCloudKitOperationInfo *)v3 setOperationGroupIndex:(v10 - 1)];
    }
  }
  if (v3) {
    [*(id *)(a1 + 48) addClientOperation:v3];
  }
}

void __39__C2MetricOptions_generateCloudKitInfo__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = objc_alloc_init(C2MPCloudKitOperationGroupInfo);
  v4 = [v9 operationGroupId];
  [(C2MPCloudKitOperationGroupInfo *)v3 setOperationGroupId:v4];

  v5 = [v9 operationGroupName];
  [(C2MPCloudKitOperationGroupInfo *)v3 setOperationGroupName:v5];

  -[C2MPCloudKitOperationGroupInfo setOperationGroupTriggered:](v3, "setOperationGroupTriggered:", [*(id *)(a1 + 32) operationGroupTriggered:v9]);
  if (v3)
  {
    [*(id *)(a1 + 40) addOperationGroup:v3];
    v6 = *(NSMapTable **)(a1 + 48);
    v7 = [v9 operationGroupId];
    v8 = [*(id *)(a1 + 40) operationGroups];
    NSMapInsert(v6, v7, (const void *)[v8 count]);
  }
}

- (BOOL)operationGroupTriggered:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_reportOperationGroupFrequencyBase) {
    goto LABEL_6;
  }
  if (!self->_reportOperationGroupFrequency) {
    goto LABEL_6;
  }
  v6 = [v4 operationGroupId];

  if (!v6) {
    goto LABEL_6;
  }
  v7 = [v5 operationGroupId];
  unint64_t v8 = [v7 c2UniformlyDistributedIdentifier];
  p_unint64_t reportOperationGroupFrequency = &self->_reportOperationGroupFrequency;
  unint64_t reportOperationGroupFrequency = self->_reportOperationGroupFrequency;
  unint64_t v11 = v8 % p_reportOperationGroupFrequency[1];

  if (v11 < reportOperationGroupFrequency) {
    BOOL v12 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (BOOL)clientOperationTriggered:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_reportClientOperationFrequencyBase) {
    goto LABEL_6;
  }
  if (!self->_reportClientOperationFrequency) {
    goto LABEL_6;
  }
  v6 = [v4 operationId];

  if (!v6) {
    goto LABEL_6;
  }
  v7 = [v5 operationId];
  unint64_t v8 = [v7 c2UniformlyDistributedIdentifier];
  p_unint64_t reportClientOperationFrequency = &self->_reportClientOperationFrequency;
  unint64_t reportClientOperationFrequency = self->_reportClientOperationFrequency;
  unint64_t v11 = v8 % p_reportClientOperationFrequency[1];

  if (v11 < reportClientOperationFrequency) {
    BOOL v12 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[C2MetricOptions allocWithZone:a3];
  if (v4)
  {
    v5 = [(C2MetricOptions *)self c2MetricsEndpoint];
    [(C2MetricOptions *)v4 setC2MetricsEndpoint:v5];

    [(C2MetricOptions *)v4 setReportFrequency:[(C2MetricOptions *)self reportFrequency]];
    [(C2MetricOptions *)v4 setReportFrequencyBase:[(C2MetricOptions *)self reportFrequencyBase]];
    [(C2MetricOptions *)v4 setReportClientOperationFrequency:[(C2MetricOptions *)self reportClientOperationFrequency]];
    [(C2MetricOptions *)v4 setReportClientOperationFrequencyBase:[(C2MetricOptions *)self reportClientOperationFrequencyBase]];
    [(C2MetricOptions *)v4 setReportOperationGroupFrequency:[(C2MetricOptions *)self reportOperationGroupFrequency]];
    [(C2MetricOptions *)v4 setReportOperationGroupFrequencyBase:[(C2MetricOptions *)self reportOperationGroupFrequencyBase]];
    v6 = [(C2MetricOptions *)self clientProcessVersion];
    [(C2MetricOptions *)v4 setClientProcessVersion:v6];

    v7 = [(C2MetricOptions *)self clientProcessBundleId];
    [(C2MetricOptions *)v4 setClientProcessBundleId:v7];

    unint64_t v8 = [(C2MetricOptions *)self container];
    [(C2MetricOptions *)v4 setContainer:v8];

    id v9 = [(C2MetricOptions *)self environment];
    [(C2MetricOptions *)v4 setEnvironment:v9];

    v10 = [(C2MetricOptions *)self databaseScope];
    [(C2MetricOptions *)v4 setDatabaseScope:v10];

    [(C2MetricOptions *)v4 setAnonymous:[(C2MetricOptions *)self anonymous]];
    unint64_t v11 = [(C2MetricOptions *)self containerScopedUserIdentifier];
    [(C2MetricOptions *)v4 setContainerScopedUserIdentifier:v11];

    BOOL v12 = [(C2MetricOptions *)self containerScopedDeviceIdentifier];
    [(C2MetricOptions *)v4 setContainerScopedDeviceIdentifier:v12];

    v13 = [(C2MetricOptions *)self applicationBundleIdentifierOverrideForContainerAccess];
    [(C2MetricOptions *)v4 setApplicationBundleIdentifierOverrideForContainerAccess:v13];

    v14 = [(C2MetricOptions *)self applicationBundleIdentifierOverrideForNetworkAttribution];
    [(C2MetricOptions *)v4 setApplicationBundleIdentifierOverrideForNetworkAttribution:v14];

    v15 = [(C2MetricOptions *)self operationGroups];
    [(C2MetricOptions *)v4 setOperationGroups:v15];

    v16 = [(C2MetricOptions *)self clientOperations];
    [(C2MetricOptions *)v4 setClientOperations:v16];

    [(C2MetricOptions *)v4 setPushTrigger:[(C2MetricOptions *)self pushTrigger]];
    v17 = [(C2MetricOptions *)self didCompleteWithError];
    [(C2MetricOptions *)v4 setDidCompleteWithError:v17];

    v18 = [(C2MetricOptions *)self testBehavior_reportMetric];
    [(C2MetricOptions *)v4 setTestBehavior_reportMetric:v18];

    [(C2MetricOptions *)v4 setReportFrequencyRandomValue:[(C2MetricOptions *)self reportFrequencyRandomValue]];
  }
  return v4;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (void)setC2MetricsEndpoint:(id)a3
{
  id v8 = a3;
  if (!v8
    || ([v8 scheme],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqual:@"https"],
        v5,
        v7 = v8,
        v6))
  {
    objc_storeStrong((id *)&self->_c2MetricsEndpoint, a3);
    v7 = v8;
  }
}

- (NSURL)c2MetricsEndpoint
{
  return self->_c2MetricsEndpoint;
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  self->_reportOperationGroupFrequencyBase = a3;
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  self->_unint64_t reportOperationGroupFrequency = a3;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  self->_reportFrequencyBase = a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  self->_reportFrequency = a3;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  self->_reportClientOperationFrequencyBase = a3;
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  self->_unint64_t reportClientOperationFrequency = a3;
}

- (void)setOperationGroups:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (void)setDatabaseScope:(id)a3
{
}

- (void)setContainer:(id)a3
{
}

- (void)setClientProcessVersion:(id)a3
{
}

- (void)setClientProcessBundleId:(id)a3
{
}

- (void)setClientOperations:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
}

- (id)generateCloudKitInfo
{
  v3 = objc_alloc_init(C2MPCloudKitInfo);
  id v4 = v3;
  if (v3)
  {
    [(C2MPCloudKitInfo *)v3 setClientProcessVersion:self->_clientProcessVersion];
    [(C2MPCloudKitInfo *)v4 setClientBundleId:self->_clientProcessBundleId];
    [(C2MPCloudKitInfo *)v4 setContainer:self->_container];
    [(C2MPCloudKitInfo *)v4 setEnvironment:self->_environment];
    [(C2MPCloudKitInfo *)v4 setDatabaseScope:self->_databaseScope];
    [(C2MPCloudKitInfo *)v4 setAnonymous:self->_anonymous];
    [(C2MPCloudKitInfo *)v4 setContainerScopedUserIdentifier:self->_containerScopedUserIdentifier];
    [(C2MPCloudKitInfo *)v4 setContainerScopedDeviceIdentifier:self->_containerScopedDeviceIdentifier];
    [(C2MPCloudKitInfo *)v4 setApplicationBundleIdentifierOverrideForContainerAccess:self->_applicationBundleIdentifierOverrideForContainerAccess];
    [(C2MPCloudKitInfo *)v4 setApplicationBundleIdentifierOverrideForNetworkAttribution:self->_applicationBundleIdentifierOverrideForNetworkAttribution];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:1282 capacity:0];
    if ([(NSArray *)self->_operationGroups count])
    {
      operationGroups = self->_operationGroups;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __39__C2MetricOptions_generateCloudKitInfo__block_invoke;
      v19[3] = &unk_1E6CCBE60;
      v19[4] = self;
      v7 = v4;
      v20 = v7;
      id v21 = v5;
      [(NSArray *)operationGroups enumerateObjectsUsingBlock:v19];
      [(C2MPCloudKitInfo *)v7 setReportOperationGroupFrequency:self->_reportOperationGroupFrequency];
      [(C2MPCloudKitInfo *)v7 setReportOperationGroupFrequencyBase:self->_reportOperationGroupFrequencyBase];
    }
    if ([(NSArray *)self->_clientOperations count])
    {
      clientOperations = self->_clientOperations;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __39__C2MetricOptions_generateCloudKitInfo__block_invoke_2;
      v15 = &unk_1E6CCBE88;
      v16 = self;
      id v17 = v5;
      id v9 = v4;
      v18 = v9;
      [(NSArray *)clientOperations enumerateObjectsUsingBlock:&v12];
      -[C2MPCloudKitInfo setReportClientOperationFrequency:](v9, "setReportClientOperationFrequency:", self->_reportClientOperationFrequency, v12, v13, v14, v15, v16);
      [(C2MPCloudKitInfo *)v9 setReportClientOperationFrequencyBase:self->_reportClientOperationFrequencyBase];
    }
    v10 = v4;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testBehavior_reportMetric, 0);
  objc_storeStrong(&self->_didCompleteWithError, 0);
  objc_storeStrong((id *)&self->_clientOperations, 0);
  objc_storeStrong((id *)&self->_operationGroups, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_containerScopedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_containerScopedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_clientProcessBundleId, 0);
  objc_storeStrong((id *)&self->_clientProcessVersion, 0);
  objc_storeStrong((id *)&self->_c2MetricsEndpoint, 0);
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (int)generateTriggerWithResponseHeader:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v5 = [MEMORY[0x1E4F1CB18] c2DefaultsDomain];
  int v6 = [v5 BOOLForKey:@"C2Metrics"];

  if (v6) {
    *((_DWORD *)v16 + 6) |= 1u;
  }
  if (v3) {
    *((_DWORD *)v16 + 6) |= 4u;
  }
  if (self->_pushTrigger) {
    *((_DWORD *)v16 + 6) |= 0x20u;
  }
  unint64_t reportFrequencyBase = self->_reportFrequencyBase;
  if (reportFrequencyBase)
  {
    unint64_t reportFrequency = self->_reportFrequency;
    if (reportFrequency)
    {
      if (self->_reportFrequencyRandomValue % reportFrequencyBase < reportFrequency) {
        *((_DWORD *)v16 + 6) |= 2u;
      }
      clientOperations = self->_clientOperations;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke;
      v14[3] = &unk_1E6CCBEB0;
      v14[4] = self;
      v14[5] = &v15;
      [(NSArray *)clientOperations enumerateObjectsUsingBlock:v14];
      operationGroups = self->_operationGroups;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke_2;
      v13[3] = &unk_1E6CCBED8;
      v13[4] = self;
      v13[5] = &v15;
      [(NSArray *)operationGroups enumerateObjectsUsingBlock:v13];
    }
  }
  int v11 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v11;
}

- (void)setPushTrigger:(BOOL)a3
{
  self->_pushTrigger = a3;
}

- (void)setContainerScopedUserIdentifier:(id)a3
{
}

- (void)setContainerScopedDeviceIdentifier:(id)a3
{
}

- (id)didCompleteWithError
{
  return self->_didCompleteWithError;
}

- (void)setDidCompleteWithError:(id)a3
{
}

- (id)testBehavior_reportMetric
{
  return self->_testBehavior_reportMetric;
}

- (void)setTestBehavior_reportMetric:(id)a3
{
}

- (void)setReportFrequencyRandomValue:(unsigned int)a3
{
  self->_reportFrequencyRandomValue = a3;
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (unsigned)reportFrequencyRandomValue
{
  return self->_reportFrequencyRandomValue;
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

- (BOOL)pushTrigger
{
  return self->_pushTrigger;
}

- (NSArray)operationGroups
{
  return self->_operationGroups;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSString)databaseScope
{
  return self->_databaseScope;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)containerScopedUserIdentifier
{
  return self->_containerScopedUserIdentifier;
}

- (NSString)containerScopedDeviceIdentifier
{
  return self->_containerScopedDeviceIdentifier;
}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (NSString)clientProcessBundleId
{
  return self->_clientProcessBundleId;
}

- (NSArray)clientOperations
{
  return self->_clientOperations;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (C2MetricOptions)init
{
  v19.receiver = self;
  v19.super_class = (Class)C2MetricOptions;
  v2 = [(C2MetricOptions *)&v19 init];
  int v3 = v2;
  if (v2)
  {
    c2MetricsEndpoint = v2->_c2MetricsEndpoint;
    v2->_c2MetricsEndpoint = 0;

    *(_OWORD *)&v3->_unint64_t reportOperationGroupFrequency = 0u;
    *(_OWORD *)&v3->_unint64_t reportClientOperationFrequency = 0u;
    *(_OWORD *)&v3->_unint64_t reportFrequency = 0u;
    clientProcessVersion = v3->_clientProcessVersion;
    v3->_clientProcessVersion = 0;

    clientProcessBundleId = v3->_clientProcessBundleId;
    v3->_clientProcessBundleId = 0;

    container = v3->_container;
    v3->_container = 0;

    environment = v3->_environment;
    v3->_environment = 0;

    databaseScope = v3->_databaseScope;
    v3->_databaseScope = 0;

    v3->_anonymous = 1;
    containerScopedUserIdentifier = v3->_containerScopedUserIdentifier;
    v3->_containerScopedUserIdentifier = 0;

    containerScopedDeviceIdentifier = v3->_containerScopedDeviceIdentifier;
    v3->_containerScopedDeviceIdentifier = 0;

    applicationBundleIdentifierOverrideForContainerAccess = v3->_applicationBundleIdentifierOverrideForContainerAccess;
    v3->_applicationBundleIdentifierOverrideForContainerAccess = 0;

    applicationBundleIdentifierOverrideForNetworkAttribution = v3->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v3->_applicationBundleIdentifierOverrideForNetworkAttribution = 0;

    operationGroups = v3->_operationGroups;
    v3->_operationGroups = 0;

    clientOperations = v3->_clientOperations;
    v3->_clientOperations = 0;

    v3->_pushTrigger = 0;
    id didCompleteWithError = v3->_didCompleteWithError;
    v3->_id didCompleteWithError = 0;

    id testBehavior_reportMetric = v3->_testBehavior_reportMetric;
    v3->_id testBehavior_reportMetric = 0;

    v3->_reportFrequencyRandomValue = arc4random();
  }
  return v3;
}

- (NSString)headerValueForTriggers
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%llu", -[C2MetricOptions generateTriggerWithResponseHeader:](self, "generateTriggerWithResponseHeader:", 0));
}

- (void)rollReportFrequencyRandomValue
{
  self->_reportFrequencyRandomValue = arc4random();
}

uint64_t __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) clientOperationTriggered:a2];
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 8u;
    if (a4) {
      *a4 = 1;
    }
  }
  return result;
}

uint64_t __53__C2MetricOptions_generateTriggerWithResponseHeader___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) operationGroupTriggered:a2];
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x10u;
    if (a4) {
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (C2MetricOptions *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      c2MetricsEndpoint = self->_c2MetricsEndpoint;
      uint64_t v7 = [(C2MetricOptions *)v5 c2MetricsEndpoint];
      if (c2MetricsEndpoint == (NSURL *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        id v9 = self->_c2MetricsEndpoint;
        if (!v9) {
          goto LABEL_71;
        }
        v10 = [(C2MetricOptions *)v5 c2MetricsEndpoint];
        int v11 = [(NSURL *)v9 isEqual:v10];

        if (!v11) {
          goto LABEL_72;
        }
      }
      unint64_t reportFrequency = self->_reportFrequency;
      if (reportFrequency != [(C2MetricOptions *)v5 reportFrequency]) {
        goto LABEL_72;
      }
      unint64_t reportFrequencyBase = self->_reportFrequencyBase;
      if (reportFrequencyBase != [(C2MetricOptions *)v5 reportFrequencyBase]) {
        goto LABEL_72;
      }
      unint64_t reportClientOperationFrequency = self->_reportClientOperationFrequency;
      if (reportClientOperationFrequency != [(C2MetricOptions *)v5 reportClientOperationFrequency])goto LABEL_72; {
      unint64_t reportClientOperationFrequencyBase = self->_reportClientOperationFrequencyBase;
      }
      if (reportClientOperationFrequencyBase != [(C2MetricOptions *)v5 reportClientOperationFrequencyBase])goto LABEL_72; {
      unint64_t reportOperationGroupFrequency = self->_reportOperationGroupFrequency;
      }
      if (reportOperationGroupFrequency != [(C2MetricOptions *)v5 reportOperationGroupFrequency])goto LABEL_72; {
      unint64_t reportOperationGroupFrequencyBase = self->_reportOperationGroupFrequencyBase;
      }
      if (reportOperationGroupFrequencyBase != [(C2MetricOptions *)v5 reportOperationGroupFrequencyBase])goto LABEL_72; {
      clientProcessVersion = self->_clientProcessVersion;
      }
      uint64_t v20 = [(C2MetricOptions *)v5 clientProcessVersion];
      if (clientProcessVersion == (NSString *)v20)
      {
      }
      else
      {
        id v8 = (void *)v20;
        id v21 = self->_clientProcessVersion;
        if (!v21) {
          goto LABEL_71;
        }
        v22 = [(C2MetricOptions *)v5 clientProcessVersion];
        int v23 = [(NSString *)v21 isEqual:v22];

        if (!v23) {
          goto LABEL_72;
        }
      }
      clientProcessBundleId = self->_clientProcessBundleId;
      uint64_t v25 = [(C2MetricOptions *)v5 clientProcessBundleId];
      if (clientProcessBundleId == (NSString *)v25)
      {
      }
      else
      {
        id v8 = (void *)v25;
        v26 = self->_clientProcessBundleId;
        if (!v26) {
          goto LABEL_71;
        }
        v27 = [(C2MetricOptions *)v5 clientProcessBundleId];
        int v28 = [(NSString *)v26 isEqual:v27];

        if (!v28) {
          goto LABEL_72;
        }
      }
      container = self->_container;
      uint64_t v30 = [(C2MetricOptions *)v5 container];
      if (container == (NSString *)v30)
      {
      }
      else
      {
        id v8 = (void *)v30;
        v31 = self->_container;
        if (!v31) {
          goto LABEL_71;
        }
        v32 = [(C2MetricOptions *)v5 container];
        int v33 = [(NSString *)v31 isEqual:v32];

        if (!v33) {
          goto LABEL_72;
        }
      }
      environment = self->_environment;
      uint64_t v35 = [(C2MetricOptions *)v5 environment];
      if (environment == (NSString *)v35)
      {
      }
      else
      {
        id v8 = (void *)v35;
        v36 = self->_environment;
        if (!v36) {
          goto LABEL_71;
        }
        v37 = [(C2MetricOptions *)v5 environment];
        int v38 = [(NSString *)v36 isEqual:v37];

        if (!v38) {
          goto LABEL_72;
        }
      }
      databaseScope = self->_databaseScope;
      uint64_t v40 = [(C2MetricOptions *)v5 databaseScope];
      if (databaseScope == (NSString *)v40)
      {
      }
      else
      {
        id v8 = (void *)v40;
        v41 = self->_databaseScope;
        if (!v41) {
          goto LABEL_71;
        }
        v42 = [(C2MetricOptions *)v5 databaseScope];
        int v43 = [(NSString *)v41 isEqual:v42];

        if (!v43) {
          goto LABEL_72;
        }
      }
      BOOL anonymous = self->_anonymous;
      if (anonymous != [(C2MetricOptions *)v5 anonymous]) {
        goto LABEL_72;
      }
      containerScopedUserIdentifier = self->_containerScopedUserIdentifier;
      uint64_t v46 = [(C2MetricOptions *)v5 containerScopedUserIdentifier];
      if (containerScopedUserIdentifier == (NSString *)v46)
      {
      }
      else
      {
        id v8 = (void *)v46;
        v47 = self->_containerScopedUserIdentifier;
        if (!v47) {
          goto LABEL_71;
        }
        v48 = [(C2MetricOptions *)v5 containerScopedUserIdentifier];
        int v49 = [(NSString *)v47 isEqual:v48];

        if (!v49) {
          goto LABEL_72;
        }
      }
      containerScopedDeviceIdentifier = self->_containerScopedDeviceIdentifier;
      uint64_t v51 = [(C2MetricOptions *)v5 containerScopedDeviceIdentifier];
      if (containerScopedDeviceIdentifier == (NSString *)v51)
      {
      }
      else
      {
        id v8 = (void *)v51;
        v52 = self->_containerScopedDeviceIdentifier;
        if (!v52) {
          goto LABEL_71;
        }
        v53 = [(C2MetricOptions *)v5 containerScopedDeviceIdentifier];
        int v54 = [(NSString *)v52 isEqual:v53];

        if (!v54) {
          goto LABEL_72;
        }
      }
      applicationBundleIdentifierOverrideForContainerAccess = self->_applicationBundleIdentifierOverrideForContainerAccess;
      uint64_t v56 = [(C2MetricOptions *)v5 applicationBundleIdentifierOverrideForContainerAccess];
      if (applicationBundleIdentifierOverrideForContainerAccess == (NSString *)v56)
      {
      }
      else
      {
        id v8 = (void *)v56;
        v57 = self->_applicationBundleIdentifierOverrideForContainerAccess;
        if (!v57) {
          goto LABEL_71;
        }
        v58 = [(C2MetricOptions *)v5 applicationBundleIdentifierOverrideForContainerAccess];
        int v59 = [(NSString *)v57 isEqual:v58];

        if (!v59) {
          goto LABEL_72;
        }
      }
      applicationBundleIdentifierOverrideForNetworkAttribution = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
      uint64_t v61 = [(C2MetricOptions *)v5 applicationBundleIdentifierOverrideForNetworkAttribution];
      if (applicationBundleIdentifierOverrideForNetworkAttribution == (NSString *)v61)
      {
      }
      else
      {
        id v8 = (void *)v61;
        v62 = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
        if (!v62) {
          goto LABEL_71;
        }
        v63 = [(C2MetricOptions *)v5 applicationBundleIdentifierOverrideForNetworkAttribution];
        int v64 = [(NSString *)v62 isEqual:v63];

        if (!v64) {
          goto LABEL_72;
        }
      }
      operationGroups = self->_operationGroups;
      uint64_t v66 = [(C2MetricOptions *)v5 operationGroups];
      if (operationGroups == (NSArray *)v66)
      {
      }
      else
      {
        id v8 = (void *)v66;
        v67 = self->_operationGroups;
        if (!v67) {
          goto LABEL_71;
        }
        v68 = [(C2MetricOptions *)v5 operationGroups];
        int v69 = [(NSArray *)v67 isEqual:v68];

        if (!v69) {
          goto LABEL_72;
        }
      }
      clientOperations = self->_clientOperations;
      uint64_t v71 = [(C2MetricOptions *)v5 clientOperations];
      if (clientOperations == (NSArray *)v71)
      {

LABEL_76:
        BOOL pushTrigger = self->_pushTrigger;
        if (pushTrigger == [(C2MetricOptions *)v5 pushTrigger])
        {
          id didCompleteWithError = self->_didCompleteWithError;
          id v78 = [(C2MetricOptions *)v5 didCompleteWithError];

          if (didCompleteWithError == v78)
          {
            id testBehavior_reportMetric = self->_testBehavior_reportMetric;
            id v80 = [(C2MetricOptions *)v5 testBehavior_reportMetric];

            if (testBehavior_reportMetric == v80)
            {
              unsigned int reportFrequencyRandomValue = self->_reportFrequencyRandomValue;
              BOOL v12 = reportFrequencyRandomValue == [(C2MetricOptions *)v5 reportFrequencyRandomValue];
              goto LABEL_73;
            }
          }
        }
LABEL_72:
        BOOL v12 = 0;
LABEL_73:

        goto LABEL_74;
      }
      id v8 = (void *)v71;
      v72 = self->_clientOperations;
      if (v72)
      {
        v73 = [(C2MetricOptions *)v5 clientOperations];
        int v74 = [(NSArray *)v72 isEqual:v73];

        if (!v74) {
          goto LABEL_72;
        }
        goto LABEL_76;
      }
LABEL_71:

      goto LABEL_72;
    }
    BOOL v12 = 0;
  }
LABEL_74:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v21 = [(NSURL *)self->_c2MetricsEndpoint hash];
  int8x16_t v16 = *(int8x16_t *)&self->_reportFrequency;
  int8x16_t v17 = *(int8x16_t *)&self->_reportClientOperationFrequency;
  unint64_t reportOperationGroupFrequencyBase = self->_reportOperationGroupFrequencyBase;
  unint64_t reportOperationGroupFrequency = self->_reportOperationGroupFrequency;
  NSUInteger v20 = [(NSString *)self->_clientProcessVersion hash];
  NSUInteger v15 = [(NSString *)self->_clientProcessBundleId hash];
  NSUInteger v3 = [(NSString *)self->_container hash];
  NSUInteger v4 = [(NSString *)self->_environment hash];
  NSUInteger v5 = [(NSString *)self->_databaseScope hash];
  BOOL anonymous = self->_anonymous;
  NSUInteger v7 = [(NSString *)self->_containerScopedUserIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_containerScopedDeviceIdentifier hash];
  NSUInteger v9 = [(NSString *)self->_applicationBundleIdentifierOverrideForContainerAccess hash];
  NSUInteger v10 = [(NSString *)self->_applicationBundleIdentifierOverrideForNetworkAttribution hash];
  uint64_t v11 = [(NSArray *)self->_operationGroups hash];
  uint64_t v12 = [(NSArray *)self->_clientOperations hash];
  int8x16_t v13 = veorq_s8(v16, v17);
  return *(void *)&veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) ^ reportOperationGroupFrequency ^ reportOperationGroupFrequencyBase ^ anonymous ^ v12 ^ v11 ^ self->_reportFrequencyRandomValue ^ self->_pushTrigger ^ v10 ^ v9 ^ v8 ^ v7 ^ v5 ^ v4 ^ v3 ^ v15 ^ v20 ^ v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  c2MetricsEndpoint = self->_c2MetricsEndpoint;
  id v5 = a3;
  [v5 encodeObject:c2MetricsEndpoint forKey:@"c2MetricsEndpoint"];
  [v5 encodeInt64:self->_reportFrequency forKey:@"reportFrequency"];
  [v5 encodeInt64:self->_reportFrequencyBase forKey:@"reportFrequencyBase"];
  [v5 encodeInt64:self->_reportClientOperationFrequency forKey:@"reportClientOperationFrequency"];
  [v5 encodeInt64:self->_reportClientOperationFrequencyBase forKey:@"reportClientOperationFrequencyBase"];
  [v5 encodeInt64:self->_reportOperationGroupFrequency forKey:@"reportOperationGroupFrequency"];
  [v5 encodeInt64:self->_reportOperationGroupFrequencyBase forKey:@"reportOperationGroupFrequencyBase"];
  [v5 encodeObject:self->_clientProcessVersion forKey:@"clientProcessVersion"];
  [v5 encodeObject:self->_clientProcessBundleId forKey:@"clientProcessBundleId"];
  [v5 encodeObject:self->_container forKey:@"container"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  [v5 encodeObject:self->_databaseScope forKey:@"databaseScope"];
  [v5 encodeBool:self->_anonymous forKey:@"anonymous"];
  [v5 encodeObject:self->_containerScopedUserIdentifier forKey:@"containerScopedUserIdentifier"];
  [v5 encodeObject:self->_containerScopedDeviceIdentifier forKey:@"containerScopedDeviceIdentifier"];
  [v5 encodeObject:self->_applicationBundleIdentifierOverrideForContainerAccess forKey:@"applicationBundleIdentifierOverrideForContainerAccess"];
  [v5 encodeObject:self->_applicationBundleIdentifierOverrideForNetworkAttribution forKey:@"applicationBundleIdentifierOverrideForNetworkAttribution"];
  [v5 encodeObject:self->_operationGroups forKey:@"operationGroups"];
  [v5 encodeObject:self->_clientOperations forKey:@"clientOperations"];
  [v5 encodeBool:self->_pushTrigger forKey:@"pushTrigger"];
  [v5 encodeInt32:self->_reportFrequencyRandomValue forKey:@"reportFrequencyRandomValue"];
}

- (C2MetricOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)C2MetricOptions;
  id v5 = [(C2MetricOptions *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c2MetricsEndpoint"];
    c2MetricsEndpoint = v5->_c2MetricsEndpoint;
    v5->_c2MetricsEndpoint = (NSURL *)v6;

    v5->_unint64_t reportFrequency = [v4 decodeInt64ForKey:@"reportFrequency"];
    v5->_unint64_t reportFrequencyBase = [v4 decodeInt64ForKey:@"reportFrequencyBase"];
    v5->_unint64_t reportClientOperationFrequency = [v4 decodeInt64ForKey:@"reportClientOperationFrequency"];
    v5->_unint64_t reportClientOperationFrequencyBase = [v4 decodeInt64ForKey:@"reportClientOperationFrequencyBase"];
    v5->_unint64_t reportOperationGroupFrequency = [v4 decodeInt64ForKey:@"reportOperationGroupFrequency"];
    v5->_unint64_t reportOperationGroupFrequencyBase = [v4 decodeInt64ForKey:@"reportOperationGroupFrequencyBase"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessVersion"];
    clientProcessVersion = v5->_clientProcessVersion;
    v5->_clientProcessVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientProcessBundleId"];
    clientProcessBundleId = v5->_clientProcessBundleId;
    v5->_clientProcessBundleId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    container = v5->_container;
    v5->_container = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    environment = v5->_environment;
    v5->_environment = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"databaseScope"];
    databaseScope = v5->_databaseScope;
    v5->_databaseScope = (NSString *)v16;

    v5->_BOOL anonymous = [v4 decodeBoolForKey:@"anonymous"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerScopedUserIdentifier"];
    containerScopedUserIdentifier = v5->_containerScopedUserIdentifier;
    v5->_containerScopedUserIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerScopedDeviceIdentifier"];
    containerScopedDeviceIdentifier = v5->_containerScopedDeviceIdentifier;
    v5->_containerScopedDeviceIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifierOverrideForContainerAccess"];
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifierOverrideForNetworkAttribution"];
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    int v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"operationGroups"];
    operationGroups = v5->_operationGroups;
    v5->_operationGroups = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    int v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"clientOperations"];
    clientOperations = v5->_clientOperations;
    v5->_clientOperations = (NSArray *)v34;

    v5->_BOOL pushTrigger = [v4 decodeBoolForKey:@"pushTrigger"];
    v5->_unsigned int reportFrequencyRandomValue = [v4 decodeInt32ForKey:@"reportFrequencyRandomValue"];
    id didCompleteWithError = v5->_didCompleteWithError;
    v5->_id didCompleteWithError = 0;

    id testBehavior_reportMetric = v5->_testBehavior_reportMetric;
    v5->_id testBehavior_reportMetric = 0;
  }
  return v5;
}

@end