@interface C2MPCloudKitInfo
+ (Class)clientOperationType;
+ (Class)operationGroupType;
- (BOOL)anonymous;
- (BOOL)hasAnonymous;
- (BOOL)hasApplicationBundleIdentifierOverrideForContainerAccess;
- (BOOL)hasApplicationBundleIdentifierOverrideForNetworkAttribution;
- (BOOL)hasClientBundleId;
- (BOOL)hasClientProcessVersion;
- (BOOL)hasContainer;
- (BOOL)hasContainerScopedDeviceIdentifier;
- (BOOL)hasContainerScopedUserIdentifier;
- (BOOL)hasDatabaseScope;
- (BOOL)hasEnvironment;
- (BOOL)hasReportClientOperationFrequency;
- (BOOL)hasReportClientOperationFrequencyBase;
- (BOOL)hasReportOperationGroupFrequency;
- (BOOL)hasReportOperationGroupFrequencyBase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)clientOperations;
- (NSMutableArray)operationGroups;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)clientBundleId;
- (NSString)clientProcessVersion;
- (NSString)container;
- (NSString)containerScopedDeviceIdentifier;
- (NSString)containerScopedUserIdentifier;
- (NSString)databaseScope;
- (NSString)environment;
- (id)clientOperationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)operationGroupAtIndex:(unint64_t)a3;
- (unint64_t)clientOperationsCount;
- (unint64_t)hash;
- (unint64_t)operationGroupsCount;
- (unint64_t)reportClientOperationFrequency;
- (unint64_t)reportClientOperationFrequencyBase;
- (unint64_t)reportOperationGroupFrequency;
- (unint64_t)reportOperationGroupFrequencyBase;
- (void)addClientOperation:(id)a3;
- (void)addOperationGroup:(id)a3;
- (void)clearClientOperations;
- (void)clearOperationGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymous:(BOOL)a3;
- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientOperations:(id)a3;
- (void)setClientProcessVersion:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerScopedDeviceIdentifier:(id)a3;
- (void)setContainerScopedUserIdentifier:(id)a3;
- (void)setDatabaseScope:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHasAnonymous:(BOOL)a3;
- (void)setHasReportClientOperationFrequency:(BOOL)a3;
- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3;
- (void)setHasReportOperationGroupFrequency:(BOOL)a3;
- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3;
- (void)setOperationGroups:(id)a3;
- (void)setReportClientOperationFrequency:(unint64_t)a3;
- (void)setReportClientOperationFrequencyBase:(unint64_t)a3;
- (void)setReportOperationGroupFrequency:(unint64_t)a3;
- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPCloudKitInfo

- (NSMutableArray)operationGroups
{
  return self->_operationGroups;
}

- (void)addOperationGroup:(id)a3
{
  id v4 = a3;
  operationGroups = self->_operationGroups;
  id v8 = v4;
  if (!operationGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_operationGroups;
    self->_operationGroups = v6;

    id v4 = v8;
    operationGroups = self->_operationGroups;
  }
  [(NSMutableArray *)operationGroups addObject:v4];
}

- (void)addClientOperation:(id)a3
{
  id v4 = a3;
  clientOperations = self->_clientOperations;
  id v8 = v4;
  if (!clientOperations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_clientOperations;
    self->_clientOperations = v6;

    id v4 = v8;
    clientOperations = self->_clientOperations;
  }
  [(NSMutableArray *)clientOperations addObject:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroups, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_containerScopedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_containerScopedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_clientProcessVersion, 0);
  objc_storeStrong((id *)&self->_clientOperations, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
}

- (void)setReportOperationGroupFrequencyBase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_reportOperationGroupFrequencyBase = a3;
}

- (void)setReportOperationGroupFrequency:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_reportOperationGroupFrequency = a3;
}

- (void)setReportClientOperationFrequencyBase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reportClientOperationFrequencyBase = a3;
}

- (void)setReportClientOperationFrequency:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reportClientOperationFrequency = a3;
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

- (void)setClientBundleId:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
}

- (void)setAnonymous:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_anonymous = a3;
}

- (void)setContainerScopedUserIdentifier:(id)a3
{
}

- (void)setContainerScopedDeviceIdentifier:(id)a3
{
}

- (unint64_t)operationGroupsCount
{
  return [(NSMutableArray *)self->_operationGroups count];
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientProcessVersion = self->_clientProcessVersion;
  if (clientProcessVersion) {
    [v3 setObject:clientProcessVersion forKey:@"client_process_version"];
  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId) {
    [v4 setObject:clientBundleId forKey:@"client_bundle_id"];
  }
  container = self->_container;
  if (container) {
    [v4 setObject:container forKey:@"container"];
  }
  environment = self->_environment;
  if (environment) {
    [v4 setObject:environment forKey:@"environment"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_anonymous];
    [v4 setObject:v9 forKey:@"anonymous"];
  }
  containerScopedUserIdentifier = self->_containerScopedUserIdentifier;
  if (containerScopedUserIdentifier) {
    [v4 setObject:containerScopedUserIdentifier forKey:@"containerScopedUserIdentifier"];
  }
  containerScopedDeviceIdentifier = self->_containerScopedDeviceIdentifier;
  if (containerScopedDeviceIdentifier) {
    [v4 setObject:containerScopedDeviceIdentifier forKey:@"containerScopedDeviceIdentifier"];
  }
  applicationBundleIdentifierOverrideForContainerAccess = self->_applicationBundleIdentifierOverrideForContainerAccess;
  if (applicationBundleIdentifierOverrideForContainerAccess) {
    [v4 setObject:applicationBundleIdentifierOverrideForContainerAccess forKey:@"applicationBundleIdentifierOverrideForContainerAccess"];
  }
  applicationBundleIdentifierOverrideForNetworkAttribution = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
  if (applicationBundleIdentifierOverrideForNetworkAttribution) {
    [v4 setObject:applicationBundleIdentifierOverrideForNetworkAttribution forKey:@"applicationBundleIdentifierOverrideForNetworkAttribution"];
  }
  databaseScope = self->_databaseScope;
  if (databaseScope) {
    [v4 setObject:databaseScope forKey:@"database_scope"];
  }
  if ([(NSMutableArray *)self->_operationGroups count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_operationGroups, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v16 = self->_operationGroups;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v18);
    }

    [v4 setObject:v15 forKey:@"operation_group"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v23 = [NSNumber numberWithUnsignedLongLong:self->_reportOperationGroupFrequency];
    [v4 setObject:v23 forKey:@"report_operation_group_frequency"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v24 = [NSNumber numberWithUnsignedLongLong:self->_reportOperationGroupFrequencyBase];
    [v4 setObject:v24 forKey:@"report_operation_group_frequency_base"];
  }
  if ([(NSMutableArray *)self->_clientOperations count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_clientOperations, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v26 = self->_clientOperations;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "dictionaryRepresentation", (void)v36);
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"client_operation"];
  }
  char v32 = (char)self->_has;
  if (v32)
  {
    v33 = [NSNumber numberWithUnsignedLongLong:self->_reportClientOperationFrequency];
    [v4 setObject:v33 forKey:@"report_client_operation_frequency"];

    char v32 = (char)self->_has;
  }
  if ((v32 & 2) != 0)
  {
    v34 = [NSNumber numberWithUnsignedLongLong:self->_reportClientOperationFrequencyBase];
    [v4 setObject:v34 forKey:@"report_client_operation_frequency_base"];
  }
  return v4;
}

- (BOOL)hasClientProcessVersion
{
  return self->_clientProcessVersion != 0;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasContainer
{
  return self->_container != 0;
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (void)setHasAnonymous:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAnonymous
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasContainerScopedUserIdentifier
{
  return self->_containerScopedUserIdentifier != 0;
}

- (BOOL)hasContainerScopedDeviceIdentifier
{
  return self->_containerScopedDeviceIdentifier != 0;
}

- (BOOL)hasApplicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess != 0;
}

- (BOOL)hasApplicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution != 0;
}

- (BOOL)hasDatabaseScope
{
  return self->_databaseScope != 0;
}

- (void)clearOperationGroups
{
}

- (id)operationGroupAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_operationGroups objectAtIndex:a3];
}

+ (Class)operationGroupType
{
  return (Class)objc_opt_class();
}

- (void)setHasReportOperationGroupFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReportOperationGroupFrequency
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasReportOperationGroupFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReportOperationGroupFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearClientOperations
{
}

- (unint64_t)clientOperationsCount
{
  return [(NSMutableArray *)self->_clientOperations count];
}

- (id)clientOperationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_clientOperations objectAtIndex:a3];
}

+ (Class)clientOperationType
{
  return (Class)objc_opt_class();
}

- (void)setHasReportClientOperationFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportClientOperationFrequency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasReportClientOperationFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportClientOperationFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPCloudKitInfo;
  id v4 = [(C2MPCloudKitInfo *)&v8 description];
  v5 = [(C2MPCloudKitInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPCloudKitInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_clientProcessVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_container) {
    PBDataWriterWriteStringField();
  }
  if (self->_environment) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_containerScopedUserIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_containerScopedDeviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationBundleIdentifierOverrideForContainerAccess) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationBundleIdentifierOverrideForNetworkAttribution) {
    PBDataWriterWriteStringField();
  }
  if (self->_databaseScope) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_operationGroups;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_clientOperations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = (char)self->_has;
  if (v16)
  {
    PBDataWriterWriteUint64Field();
    char v16 = (char)self->_has;
  }
  if ((v16 & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v15 = v4;
  if (self->_clientProcessVersion)
  {
    objc_msgSend(v4, "setClientProcessVersion:");
    id v4 = v15;
  }
  if (self->_clientBundleId)
  {
    objc_msgSend(v15, "setClientBundleId:");
    id v4 = v15;
  }
  if (self->_container)
  {
    objc_msgSend(v15, "setContainer:");
    id v4 = v15;
  }
  if (self->_environment)
  {
    objc_msgSend(v15, "setEnvironment:");
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v4[128] = self->_anonymous;
    v4[132] |= 0x10u;
  }
  if (self->_containerScopedUserIdentifier) {
    objc_msgSend(v15, "setContainerScopedUserIdentifier:");
  }
  if (self->_containerScopedDeviceIdentifier) {
    objc_msgSend(v15, "setContainerScopedDeviceIdentifier:");
  }
  if (self->_applicationBundleIdentifierOverrideForContainerAccess) {
    objc_msgSend(v15, "setApplicationBundleIdentifierOverrideForContainerAccess:");
  }
  if (self->_applicationBundleIdentifierOverrideForNetworkAttribution) {
    objc_msgSend(v15, "setApplicationBundleIdentifierOverrideForNetworkAttribution:");
  }
  if (self->_databaseScope) {
    objc_msgSend(v15, "setDatabaseScope:");
  }
  if ([(C2MPCloudKitInfo *)self operationGroupsCount])
  {
    [v15 clearOperationGroups];
    unint64_t v5 = [(C2MPCloudKitInfo *)self operationGroupsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(C2MPCloudKitInfo *)self operationGroupAtIndex:i];
        [v15 addOperationGroup:v8];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v15 + 3) = self->_reportOperationGroupFrequency;
    v15[132] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((void *)v15 + 4) = self->_reportOperationGroupFrequencyBase;
    v15[132] |= 8u;
  }
  if ([(C2MPCloudKitInfo *)self clientOperationsCount])
  {
    [v15 clearClientOperations];
    unint64_t v10 = [(C2MPCloudKitInfo *)self clientOperationsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(C2MPCloudKitInfo *)self clientOperationAtIndex:j];
        [v15 addClientOperation:v13];
      }
    }
  }
  char v14 = (char)self->_has;
  if (v14)
  {
    *((void *)v15 + 1) = self->_reportClientOperationFrequency;
    v15[132] |= 1u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *((void *)v15 + 2) = self->_reportClientOperationFrequencyBase;
    v15[132] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientProcessVersion copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  uint64_t v8 = [(NSString *)self->_clientBundleId copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_container copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  uint64_t v12 = [(NSString *)self->_environment copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v12;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_anonymous;
    *(unsigned char *)(v5 + 132) |= 0x10u;
  }
  uint64_t v14 = [(NSString *)self->_containerScopedUserIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  uint64_t v16 = [(NSString *)self->_containerScopedDeviceIdentifier copyWithZone:a3];
  long long v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  uint64_t v18 = [(NSString *)self->_applicationBundleIdentifierOverrideForContainerAccess copyWithZone:a3];
  long long v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  uint64_t v20 = [(NSString *)self->_applicationBundleIdentifierOverrideForNetworkAttribution copyWithZone:a3];
  long long v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  uint64_t v22 = [(NSString *)self->_databaseScope copyWithZone:a3];
  long long v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v24 = self->_operationGroups;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addOperationGroup:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v26);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_reportOperationGroupFrequency;
    *(unsigned char *)(v5 + 132) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_reportOperationGroupFrequencyBase;
    *(unsigned char *)(v5 + 132) |= 8u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v31 = self->_clientOperations;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "copyWithZone:", a3, (void)v39);
        [(id)v5 addClientOperation:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v33);
  }

  char v37 = (char)self->_has;
  if (v37)
  {
    *(void *)(v5 + 8) = self->_reportClientOperationFrequency;
    *(unsigned char *)(v5 + 132) |= 1u;
    char v37 = (char)self->_has;
  }
  if ((v37 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_reportClientOperationFrequencyBase;
    *(unsigned char *)(v5 + 132) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  clientProcessVersion = self->_clientProcessVersion;
  if ((unint64_t)clientProcessVersion | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](clientProcessVersion, "isEqual:")) {
      goto LABEL_52;
    }
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](clientBundleId, "isEqual:")) {
      goto LABEL_52;
    }
  }
  container = self->_container;
  if ((unint64_t)container | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](container, "isEqual:")) {
      goto LABEL_52;
    }
  }
  environment = self->_environment;
  if ((unint64_t)environment | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](environment, "isEqual:")) {
      goto LABEL_52;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_anonymous)
    {
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 128))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  containerScopedUserIdentifier = self->_containerScopedUserIdentifier;
  if ((unint64_t)containerScopedUserIdentifier | *((void *)v4 + 12)
    && !-[NSString isEqual:](containerScopedUserIdentifier, "isEqual:"))
  {
    goto LABEL_52;
  }
  containerScopedDeviceIdentifier = self->_containerScopedDeviceIdentifier;
  if ((unint64_t)containerScopedDeviceIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](containerScopedDeviceIdentifier, "isEqual:")) {
      goto LABEL_52;
    }
  }
  applicationBundleIdentifierOverrideForContainerAccess = self->_applicationBundleIdentifierOverrideForContainerAccess;
  if ((unint64_t)applicationBundleIdentifierOverrideForContainerAccess | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](applicationBundleIdentifierOverrideForContainerAccess, "isEqual:")) {
      goto LABEL_52;
    }
  }
  applicationBundleIdentifierOverrideForNetworkAttribution = self->_applicationBundleIdentifierOverrideForNetworkAttribution;
  if ((unint64_t)applicationBundleIdentifierOverrideForNetworkAttribution | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](applicationBundleIdentifierOverrideForNetworkAttribution, "isEqual:")) {
      goto LABEL_52;
    }
  }
  databaseScope = self->_databaseScope;
  if ((unint64_t)databaseScope | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](databaseScope, "isEqual:")) {
      goto LABEL_52;
    }
  }
  operationGroups = self->_operationGroups;
  if ((unint64_t)operationGroups | *((void *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](operationGroups, "isEqual:")) {
      goto LABEL_52;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 4) == 0 || self->_reportOperationGroupFrequency != *((void *)v4 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 8) == 0 || self->_reportOperationGroupFrequencyBase != *((void *)v4 + 4)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 132) & 8) != 0)
  {
    goto LABEL_52;
  }
  clientOperations = self->_clientOperations;
  if ((unint64_t)clientOperations | *((void *)v4 + 8))
  {
    if (-[NSMutableArray isEqual:](clientOperations, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_43;
    }
LABEL_52:
    BOOL v17 = 0;
    goto LABEL_53;
  }
LABEL_43:
  if (has)
  {
    if ((*((unsigned char *)v4 + 132) & 1) == 0 || self->_reportClientOperationFrequency != *((void *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 132))
  {
    goto LABEL_52;
  }
  BOOL v17 = (*((unsigned char *)v4 + 132) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 132) & 2) == 0 || self->_reportClientOperationFrequencyBase != *((void *)v4 + 2)) {
      goto LABEL_52;
    }
    BOOL v17 = 1;
  }
LABEL_53:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v19 = [(NSString *)self->_clientProcessVersion hash];
  NSUInteger v18 = [(NSString *)self->_clientBundleId hash];
  NSUInteger v17 = [(NSString *)self->_container hash];
  NSUInteger v16 = [(NSString *)self->_environment hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v15 = 2654435761 * self->_anonymous;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_containerScopedUserIdentifier hash];
  NSUInteger v3 = [(NSString *)self->_containerScopedDeviceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_applicationBundleIdentifierOverrideForContainerAccess hash];
  NSUInteger v5 = [(NSString *)self->_applicationBundleIdentifierOverrideForNetworkAttribution hash];
  NSUInteger v6 = [(NSString *)self->_databaseScope hash];
  uint64_t v7 = [(NSMutableArray *)self->_operationGroups hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v8 = 2654435761u * self->_reportOperationGroupFrequency;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      unint64_t v9 = 2654435761u * self->_reportOperationGroupFrequencyBase;
      goto LABEL_9;
    }
  }
  unint64_t v9 = 0;
LABEL_9:
  uint64_t v10 = [(NSMutableArray *)self->_clientOperations hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v11 = 2654435761u * self->_reportClientOperationFrequency;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    unint64_t v12 = 0;
    return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  unint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v12 = 2654435761u * self->_reportClientOperationFrequencyBase;
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 9)) {
    -[C2MPCloudKitInfo setClientProcessVersion:](self, "setClientProcessVersion:");
  }
  if (*((void *)v4 + 7)) {
    -[C2MPCloudKitInfo setClientBundleId:](self, "setClientBundleId:");
  }
  if (*((void *)v4 + 10)) {
    -[C2MPCloudKitInfo setContainer:](self, "setContainer:");
  }
  if (*((void *)v4 + 14)) {
    -[C2MPCloudKitInfo setEnvironment:](self, "setEnvironment:");
  }
  if ((*((unsigned char *)v4 + 132) & 0x10) != 0)
  {
    self->_anonymous = *((unsigned char *)v4 + 128);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 12)) {
    -[C2MPCloudKitInfo setContainerScopedUserIdentifier:](self, "setContainerScopedUserIdentifier:");
  }
  if (*((void *)v4 + 11)) {
    -[C2MPCloudKitInfo setContainerScopedDeviceIdentifier:](self, "setContainerScopedDeviceIdentifier:");
  }
  if (*((void *)v4 + 5)) {
    -[C2MPCloudKitInfo setApplicationBundleIdentifierOverrideForContainerAccess:](self, "setApplicationBundleIdentifierOverrideForContainerAccess:");
  }
  if (*((void *)v4 + 6)) {
    -[C2MPCloudKitInfo setApplicationBundleIdentifierOverrideForNetworkAttribution:](self, "setApplicationBundleIdentifierOverrideForNetworkAttribution:");
  }
  if (*((void *)v4 + 13)) {
    -[C2MPCloudKitInfo setDatabaseScope:](self, "setDatabaseScope:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 15);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(C2MPCloudKitInfo *)self addOperationGroup:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 132);
  if ((v10 & 4) != 0)
  {
    self->_reportOperationGroupFrequency = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)v4 + 132);
  }
  if ((v10 & 8) != 0)
  {
    self->_reportOperationGroupFrequencyBase = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = *((id *)v4 + 8);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[C2MPCloudKitInfo addClientOperation:](self, "addClientOperation:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  char v16 = *((unsigned char *)v4 + 132);
  if (v16)
  {
    self->_reportClientOperationFrequency = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v16 = *((unsigned char *)v4 + 132);
  }
  if ((v16 & 2) != 0)
  {
    self->_reportClientOperationFrequencyBase = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)clientProcessVersion
{
  return self->_clientProcessVersion;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)environment
{
  return self->_environment;
}

- (BOOL)anonymous
{
  return self->_anonymous;
}

- (NSString)containerScopedUserIdentifier
{
  return self->_containerScopedUserIdentifier;
}

- (NSString)containerScopedDeviceIdentifier
{
  return self->_containerScopedDeviceIdentifier;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)databaseScope
{
  return self->_databaseScope;
}

- (void)setOperationGroups:(id)a3
{
}

- (unint64_t)reportOperationGroupFrequency
{
  return self->_reportOperationGroupFrequency;
}

- (unint64_t)reportOperationGroupFrequencyBase
{
  return self->_reportOperationGroupFrequencyBase;
}

- (NSMutableArray)clientOperations
{
  return self->_clientOperations;
}

- (void)setClientOperations:(id)a3
{
}

- (unint64_t)reportClientOperationFrequency
{
  return self->_reportClientOperationFrequency;
}

- (unint64_t)reportClientOperationFrequencyBase
{
  return self->_reportClientOperationFrequencyBase;
}

@end