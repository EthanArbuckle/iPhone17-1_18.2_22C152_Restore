@interface AssetRequestProperties
- (AssetDataConsumer)dataConsumer;
- (AssetRequestProperties)init;
- (BOOL)allowsAuthentication;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsConstrainedNetworkAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)allowsWatchCellularAccess;
- (BOOL)enforceATS;
- (BOOL)locateAssetCache;
- (BOOL)requiresPowerPluggedIn;
- (NSArray)protocolClasses;
- (NSNumber)bytesPerSecondLimit;
- (NSNumber)loadingPriority;
- (NSNumber)maximumWatchCellularTransferSize;
- (NSNumber)taskPriority;
- (NSString)duetBudgetingIdentifier;
- (NSString)logKey;
- (NSString)networkBudgetingIdentifier;
- (NSUUID)clientIdentifier;
- (NSUUID)externalID;
- (NSUUID)requestUUID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)connectionPool;
- (int64_t)discretionaryType;
- (int64_t)requestReason;
- (unint64_t)expectedContentLength;
- (unint64_t)expectedDiskUsage;
- (unint64_t)rangeOffset;
- (unsigned)qosClass;
- (void)setAllowsAuthentication:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
- (void)setAllowsWatchCellularAccess:(BOOL)a3;
- (void)setBytesPerSecondLimit:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setConnectionPool:(int64_t)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDiscretionaryType:(int64_t)a3;
- (void)setDuetBudgetingIdentifier:(id)a3;
- (void)setEnforceATS:(BOOL)a3;
- (void)setExpectedContentLength:(unint64_t)a3;
- (void)setExpectedDiskUsage:(unint64_t)a3;
- (void)setExternalID:(id)a3;
- (void)setLoadingPriority:(id)a3;
- (void)setLocateAssetCache:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setMaximumWatchCellularTransferSize:(id)a3;
- (void)setNetworkBudgetingIdentifier:(id)a3;
- (void)setProtocolClasses:(id)a3;
- (void)setQosClass:(unsigned int)a3;
- (void)setRangeOffset:(unint64_t)a3;
- (void)setRequestReason:(int64_t)a3;
- (void)setRequestUUID:(id)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setTaskPriority:(id)a3;
@end

@implementation AssetRequestProperties

- (AssetRequestProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssetRequestProperties;
  v2 = [(AssetRequestProperties *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    v4 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v3;

    *(_DWORD *)(v2 + 9) = 16843009;
  }
  return (AssetRequestProperties *)v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[AssetRequestProperties allocWithZone:](AssetRequestProperties, "allocWithZone:") init];
  v5->_allowsAuthentication = self->_allowsAuthentication;
  v5->_allowsCellularAccess = self->_allowsCellularAccess;
  v5->_allowsConstrainedNetworkAccess = self->_allowsConstrainedNetworkAccess;
  v5->_allowsExpensiveNetworkAccess = self->_allowsExpensiveNetworkAccess;
  v5->_allowsWatchCellularAccess = self->_allowsWatchCellularAccess;
  objc_super v6 = (NSNumber *)[(NSNumber *)self->_bytesPerSecondLimit copyWithZone:a3];
  bytesPerSecondLimit = v5->_bytesPerSecondLimit;
  v5->_bytesPerSecondLimit = v6;

  objc_storeStrong((id *)&v5->_clientIdentifier, self->_clientIdentifier);
  v5->_connectionPool = self->_connectionPool;
  objc_storeStrong((id *)&v5->_dataConsumer, self->_dataConsumer);
  v5->_discretionaryType = self->_discretionaryType;
  v8 = (NSString *)[(NSString *)self->_duetBudgetingIdentifier copyWithZone:a3];
  duetBudgetingIdentifier = v5->_duetBudgetingIdentifier;
  v5->_duetBudgetingIdentifier = v8;

  v5->_enforceATS = self->_enforceATS;
  objc_storeStrong((id *)&v5->_externalID, self->_externalID);
  v5->_expectedContentLength = self->_expectedContentLength;
  v5->_expectedDiskUsage = self->_expectedDiskUsage;
  v10 = (NSNumber *)[(NSNumber *)self->_loadingPriority copyWithZone:a3];
  loadingPriority = v5->_loadingPriority;
  v5->_loadingPriority = v10;

  v5->_locateAssetCache = self->_locateAssetCache;
  v12 = (NSString *)[(NSString *)self->_logKey copyWithZone:a3];
  logKey = v5->_logKey;
  v5->_logKey = v12;

  v14 = (NSNumber *)[(NSNumber *)self->_maximumWatchCellularTransferSize copyWithZone:a3];
  maximumWatchCellularTransferSize = v5->_maximumWatchCellularTransferSize;
  v5->_maximumWatchCellularTransferSize = v14;

  v16 = (NSString *)[(NSString *)self->_networkBudgetingIdentifier copyWithZone:a3];
  networkBudgetingIdentifier = v5->_networkBudgetingIdentifier;
  v5->_networkBudgetingIdentifier = v16;

  v18 = (NSArray *)[(NSArray *)self->_protocolClasses copyWithZone:a3];
  protocolClasses = v5->_protocolClasses;
  v5->_protocolClasses = v18;

  v5->_qosClass = self->_qosClass;
  v5->_rangeOffset = self->_rangeOffset;
  v5->_requiresPowerPluggedIn = self->_requiresPowerPluggedIn;
  v5->_requestReason = self->_requestReason;
  objc_storeStrong((id *)&v5->_requestUUID, self->_requestUUID);
  v20 = (NSNumber *)[(NSNumber *)self->_taskPriority copyWithZone:a3];
  taskPriority = v5->_taskPriority;
  v5->_taskPriority = v20;

  return v5;
}

- (BOOL)allowsAuthentication
{
  return self->_allowsAuthentication;
}

- (void)setAllowsAuthentication:(BOOL)a3
{
  self->_allowsAuthentication = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)allowsConstrainedNetworkAccess
{
  return self->_allowsConstrainedNetworkAccess;
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3
{
  self->_allowsConstrainedNetworkAccess = a3;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (BOOL)allowsWatchCellularAccess
{
  return self->_allowsWatchCellularAccess;
}

- (void)setAllowsWatchCellularAccess:(BOOL)a3
{
  self->_allowsWatchCellularAccess = a3;
}

- (NSNumber)bytesPerSecondLimit
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBytesPerSecondLimit:(id)a3
{
}

- (NSUUID)clientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientIdentifier:(id)a3
{
}

- (int64_t)connectionPool
{
  return self->_connectionPool;
}

- (void)setConnectionPool:(int64_t)a3
{
  self->_connectionPool = a3;
}

- (AssetDataConsumer)dataConsumer
{
  return (AssetDataConsumer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataConsumer:(id)a3
{
}

- (int64_t)discretionaryType
{
  return self->_discretionaryType;
}

- (void)setDiscretionaryType:(int64_t)a3
{
  self->_discretionaryType = a3;
}

- (NSString)duetBudgetingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDuetBudgetingIdentifier:(id)a3
{
}

- (BOOL)enforceATS
{
  return self->_enforceATS;
}

- (void)setEnforceATS:(BOOL)a3
{
  self->_enforceATS = a3;
}

- (unint64_t)expectedContentLength
{
  return self->_expectedContentLength;
}

- (void)setExpectedContentLength:(unint64_t)a3
{
  self->_expectedContentLength = a3;
}

- (unint64_t)expectedDiskUsage
{
  return self->_expectedDiskUsage;
}

- (void)setExpectedDiskUsage:(unint64_t)a3
{
  self->_expectedDiskUsage = a3;
}

- (NSUUID)externalID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExternalID:(id)a3
{
}

- (NSNumber)loadingPriority
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLoadingPriority:(id)a3
{
}

- (BOOL)locateAssetCache
{
  return self->_locateAssetCache;
}

- (void)setLocateAssetCache:(BOOL)a3
{
  self->_locateAssetCache = a3;
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogKey:(id)a3
{
}

- (NSNumber)maximumWatchCellularTransferSize
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMaximumWatchCellularTransferSize:(id)a3
{
}

- (NSString)networkBudgetingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNetworkBudgetingIdentifier:(id)a3
{
}

- (NSArray)protocolClasses
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setProtocolClasses:(id)a3
{
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (void)setQosClass:(unsigned int)a3
{
  self->_qosClass = a3;
}

- (unint64_t)rangeOffset
{
  return self->_rangeOffset;
}

- (void)setRangeOffset:(unint64_t)a3
{
  self->_rangeOffset = a3;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (NSUUID)requestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRequestUUID:(id)a3
{
}

- (NSNumber)taskPriority
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTaskPriority:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskPriority, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_protocolClasses, 0);
  objc_storeStrong((id *)&self->_networkBudgetingIdentifier, 0);
  objc_storeStrong((id *)&self->_maximumWatchCellularTransferSize, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_loadingPriority, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_duetBudgetingIdentifier, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_bytesPerSecondLimit, 0);
}

@end