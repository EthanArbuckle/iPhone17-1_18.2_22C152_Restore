@interface BRCMigrationReport
+ (BOOL)supportsSecureCoding;
+ (id)cleanupStateURL;
+ (id)migrationReportFromData:(id)a3;
- (BOOL)errorOverriden;
- (BOOL)manuallyTriggered;
- (BOOL)nonSideFaultsCompletelyMigrated;
- (BOOL)sideFaultsBelowThreshold;
- (BRBouncesTypesMatrix)bouncedItemsMatrix;
- (BRCBouncingReport)bounceReport;
- (BRCEAccessReport)eaccessReport;
- (BRCMigrationReport)initWithCoder:(id)a3;
- (BRTypesField)typeOfMigrated;
- (BRTypesField)typeOfNotMigrated;
- (NSError)lastError;
- (NSString)crashReporterKey;
- (NSString)domainID;
- (NSUUID)migrationUUID;
- (double)cloningDuration;
- (double)duration;
- (double)importDuration;
- (id)convertToData;
- (id)description;
- (int64_t)unexpectedCreations;
- (unint64_t)bouncedDocumentsFolders;
- (unint64_t)bouncedItems;
- (unint64_t)ciconiaVersion;
- (unint64_t)datalessItems;
- (unint64_t)documentsFoldersWithoutItemID;
- (unint64_t)errorOriginatorId;
- (unint64_t)expectedAmountOfItemsMigrated;
- (unint64_t)ignoredContentProtectedItems;
- (unint64_t)itemsChangedDuringCloning;
- (unint64_t)itemsNotFoundInDB;
- (unint64_t)itemsThatAreNotMigrated;
- (unint64_t)materialisedCountOnFPFS;
- (unint64_t)materialisedCountOnICD;
- (unint64_t)packagesWithoutBundleBit;
- (unint64_t)symlinkedDocumentsFolders;
- (unint64_t)totalItemCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBounceReport:(id)a3;
- (void)setBouncedDocumentsFolders:(unint64_t)a3;
- (void)setBouncedItems:(unint64_t)a3;
- (void)setBouncedItemsMatrix:(BRBouncesTypesMatrix)a3;
- (void)setCiconiaVersion:(unint64_t)a3;
- (void)setCloningDuration:(double)a3;
- (void)setCrashReporterKey:(id)a3;
- (void)setDatalessItems:(unint64_t)a3;
- (void)setDocumentsFoldersWithoutItemID:(unint64_t)a3;
- (void)setDomainID:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEaccessReport:(id)a3;
- (void)setErrorOriginatorId:(unint64_t)a3;
- (void)setErrorOverriden:(BOOL)a3;
- (void)setExpectedAmountOfItemsMigrated:(unint64_t)a3;
- (void)setIgnoredContentProtectedItems:(unint64_t)a3;
- (void)setImportDuration:(double)a3;
- (void)setItemsChangedDuringCloning:(unint64_t)a3;
- (void)setItemsNotFoundInDB:(unint64_t)a3;
- (void)setItemsThatAreNotMigrated:(unint64_t)a3;
- (void)setLastError:(id)a3;
- (void)setManuallyTriggered:(BOOL)a3;
- (void)setMaterialisedCountOnFPFS:(unint64_t)a3;
- (void)setMaterialisedCountOnICD:(unint64_t)a3;
- (void)setMigrationUUID:(id)a3;
- (void)setNonSideFaultsCompletelyMigrated:(BOOL)a3;
- (void)setPackagesWithoutBundleBit:(unint64_t)a3;
- (void)setSideFaultsBelowThreshold:(BOOL)a3;
- (void)setSymlinkedDocumentsFolders:(unint64_t)a3;
- (void)setTotalItemCount:(unint64_t)a3;
- (void)setTypeOfMigrated:(BRTypesField)a3;
- (void)setTypeOfNotMigrated:(BRTypesField)a3;
- (void)setUnexpectedCreations:(int64_t)a3;
@end

@implementation BRCMigrationReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t ciconiaVersion = self->ciconiaVersion;
  id v5 = a3;
  [v5 encodeInt64:ciconiaVersion forKey:@"ciconiaVersion"];
  [v5 encodeObject:self->lastError forKey:@"lastError"];
  [v5 encodeObject:self->crashReporterKey forKey:@"crashReporterKey"];
  [v5 encodeBool:self->errorOverriden forKey:@"errorOverriden"];
  [v5 encodeDouble:@"duration" forKey:self->duration];
  [v5 encodeDouble:@"cloningDuration" forKey:self->cloningDuration];
  [v5 encodeDouble:@"importDuration" forKey:self->importDuration];
  [v5 encodeBool:self->manuallyTriggered forKey:@"manuallyTriggered"];
  [v5 encodeObject:self->migrationUUID forKey:@"migrationUUID"];
  [v5 encodeObject:self->domainID forKey:@"domainID"];
  [v5 encodeBool:self->sideFaultsBelowThreshold forKey:@"sideFaultsBelowThreshold"];
  [v5 encodeBool:self->nonSideFaultsCompletelyMigrated forKey:@"nonSideFaultsCompletelyMigrated"];
  [v5 encodeInt64:self->expectedAmountOfItemsMigrated forKey:@"expectedAmountOfItemsMigrated"];
  [v5 encodeInt64:self->itemsThatAreNotMigrated forKey:@"itemsThatAreNotMigrated"];
  [v5 encodeInt:self->typeOfMigrated.var0.var0 forKey:@"typeOfMigrated"];
  [v5 encodeInt:self->typeOfNotMigrated.var0.var0 forKey:@"typeOfNotMigrated"];
  [v5 encodeInt64:self->materialisedCountOnICD forKey:@"materialisedCountOnICD"];
  [v5 encodeInt64:self->materialisedCountOnFPFS forKey:@"materialisedCountOnFPFS"];
  [v5 encodeInt64:self->totalItemCount forKey:@"totalItemCount"];
  [v5 encodeInt64:self->itemsNotFoundInDB forKey:@"itemsNotFoundInDB"];
  [v5 encodeInt64:self->itemsChangedDuringCloning forKey:@"itemsChangedDuringCloning"];
  [v5 encodeInt64:self->ignoredContentProtectedItems forKey:@"ignoredContentProtectedItems"];
  [v5 encodeInt64:self->packagesWithoutBundleBit forKey:@"packagesWithoutBundleBit"];
  [v5 encodeInt64:self->bouncedDocumentsFolders forKey:@"bouncedDocumentsFolders"];
  [v5 encodeInt64:self->symlinkedDocumentsFolders forKey:@"symlinkedDocumentsFolders"];
  [v5 encodeInt64:self->documentsFoldersWithoutItemID forKey:@"documentsFoldersWithoutItemID"];
  [v5 encodeInt64:self->datalessItems forKey:@"datalessItems"];
  [v5 encodeInt64:self->unexpectedCreations forKey:@"unexpectedCreations"];
  [v5 encodeInt64:self->bouncedItems forKey:@"bouncedItems"];
  [v5 encodeInt64:self->bouncedItemsMatrix.var0.var0 forKey:@"bouncedItemsMatrix"];
  [v5 encodeObject:self->bounceReport forKey:@"bounceReport"];
  [v5 encodeObject:self->eaccessReport forKey:@"eaccessReport"];
  [v5 encodeInt64:self->errorOriginatorId forKey:@"errorOriginatorId"];
}

- (BRCMigrationReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCMigrationReport;
  id v5 = [(BRCMigrationReport *)&v22 init];
  if (v5)
  {
    v5->unint64_t ciconiaVersion = [v4 decodeInt64ForKey:@"ciconiaVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastError"];
    lastError = v5->lastError;
    v5->lastError = (NSError *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crashReporterKey"];
    crashReporterKey = v5->crashReporterKey;
    v5->crashReporterKey = (NSString *)v8;

    v5->errorOverriden = [v4 decodeBoolForKey:@"errorOverriden"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->duration = v10;
    [v4 decodeDoubleForKey:@"cloningDuration"];
    v5->cloningDuration = v11;
    [v4 decodeDoubleForKey:@"importDuration"];
    v5->importDuration = v12;
    v5->manuallyTriggered = [v4 decodeBoolForKey:@"manuallyTriggered"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"migrationUUID"];
    migrationUUID = v5->migrationUUID;
    v5->migrationUUID = (NSUUID *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainID"];
    domainID = v5->domainID;
    v5->domainID = (NSString *)v15;

    v5->sideFaultsBelowThreshold = [v4 decodeBoolForKey:@"sideFaultsBelowThreshold"];
    v5->nonSideFaultsCompletelyMigrated = [v4 decodeBoolForKey:@"nonSideFaultsCompletelyMigrated"];
    v5->expectedAmountOfItemsMigrated = [v4 decodeInt64ForKey:@"expectedAmountOfItemsMigrated"];
    v5->itemsThatAreNotMigrated = [v4 decodeInt64ForKey:@"itemsThatAreNotMigrated"];
    v5->typeOfMigrated.var0.var0 = [v4 decodeIntForKey:@"typeOfMigrated"];
    v5->typeOfNotMigrated.var0.var0 = [v4 decodeIntForKey:@"typeOfNotMigrated"];
    v5->materialisedCountOnICD = [v4 decodeInt64ForKey:@"materialisedCountOnICD"];
    v5->materialisedCountOnFPFS = [v4 decodeInt64ForKey:@"materialisedCountOnFPFS"];
    v5->totalItemCount = [v4 decodeInt64ForKey:@"totalItemCount"];
    v5->itemsNotFoundInDB = [v4 decodeInt64ForKey:@"itemsNotFoundInDB"];
    v5->itemsChangedDuringCloning = [v4 decodeInt64ForKey:@"itemsChangedDuringCloning"];
    v5->ignoredContentProtectedItems = [v4 decodeInt64ForKey:@"ignoredContentProtectedItems"];
    v5->packagesWithoutBundleBit = [v4 decodeInt64ForKey:@"packagesWithoutBundleBit"];
    v5->bouncedDocumentsFolders = [v4 decodeInt64ForKey:@"bouncedDocumentsFolders"];
    v5->symlinkedDocumentsFolders = [v4 decodeInt64ForKey:@"symlinkedDocumentsFolders"];
    v5->documentsFoldersWithoutItemID = [v4 decodeInt64ForKey:@"documentsFoldersWithoutItemID"];
    v5->datalessItems = [v4 decodeInt64ForKey:@"datalessItems"];
    v5->unexpectedCreations = [v4 decodeInt64ForKey:@"unexpectedCreations"];
    v5->bouncedItems = [v4 decodeInt64ForKey:@"bouncedItems"];
    v5->bouncedItemsMatrix.var0.var0 = [v4 decodeInt64ForKey:@"bouncedItemsMatrix"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bounceReport"];
    bounceReport = v5->bounceReport;
    v5->bounceReport = (BRCBouncingReport *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eaccessReport"];
    eaccessReport = v5->eaccessReport;
    v5->eaccessReport = (BRCEAccessReport *)v19;

    v5->errorOriginatorId = [v4 decodeInt64ForKey:@"errorOriginatorId"];
  }

  return v5;
}

- (id)convertToData
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (id)migrationReportFromData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v11 = 0;
  id v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];

  id v6 = v11;
  if (!v5)
  {
    v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "fp_prettyDescription");
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed restoring migration report: %@%@", buf, 0x16u);
    }
  }

  return v5;
}

+ (id)cleanupStateURL
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "brc_ciconiaWorkDirForCurrentPersona");
  v3 = [v2 URLByAppendingPathComponent:@"cleanup.state"];

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(BRCMigrationReport *)self ciconiaVersion];
  id v6 = [(BRCMigrationReport *)self migrationUUID];
  if ([(BRCMigrationReport *)self errorOverriden]) {
    v7 = @" ‼️ ";
  }
  else {
    v7 = @" ";
  }
  uint64_t v8 = [(BRCMigrationReport *)self lastError];
  v9 = objc_msgSend(v8, "fp_prettyDescription");
  double v10 = [v3 stringWithFormat:@"<%@: %p v:%llu u:%@%@e:%@ o:%llu>", v4, self, v5, v6, v7, v9, -[BRCMigrationReport errorOriginatorId](self, "errorOriginatorId")];

  return v10;
}

- (unint64_t)ciconiaVersion
{
  return self->ciconiaVersion;
}

- (void)setCiconiaVersion:(unint64_t)a3
{
  self->unint64_t ciconiaVersion = a3;
}

- (NSError)lastError
{
  return self->lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSString)crashReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCrashReporterKey:(id)a3
{
}

- (BOOL)errorOverriden
{
  return self->errorOverriden;
}

- (void)setErrorOverriden:(BOOL)a3
{
  self->errorOverriden = a3;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (double)cloningDuration
{
  return self->cloningDuration;
}

- (void)setCloningDuration:(double)a3
{
  self->cloningDuration = a3;
}

- (double)importDuration
{
  return self->importDuration;
}

- (void)setImportDuration:(double)a3
{
  self->importDuration = a3;
}

- (BOOL)manuallyTriggered
{
  return self->manuallyTriggered;
}

- (void)setManuallyTriggered:(BOOL)a3
{
  self->manuallyTriggered = a3;
}

- (NSUUID)migrationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMigrationUUID:(id)a3
{
}

- (NSString)domainID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDomainID:(id)a3
{
}

- (BOOL)sideFaultsBelowThreshold
{
  return self->sideFaultsBelowThreshold;
}

- (void)setSideFaultsBelowThreshold:(BOOL)a3
{
  self->sideFaultsBelowThreshold = a3;
}

- (BOOL)nonSideFaultsCompletelyMigrated
{
  return self->nonSideFaultsCompletelyMigrated;
}

- (void)setNonSideFaultsCompletelyMigrated:(BOOL)a3
{
  self->nonSideFaultsCompletelyMigrated = a3;
}

- (unint64_t)expectedAmountOfItemsMigrated
{
  return self->expectedAmountOfItemsMigrated;
}

- (void)setExpectedAmountOfItemsMigrated:(unint64_t)a3
{
  self->expectedAmountOfItemsMigrated = a3;
}

- (unint64_t)itemsThatAreNotMigrated
{
  return self->itemsThatAreNotMigrated;
}

- (void)setItemsThatAreNotMigrated:(unint64_t)a3
{
  self->itemsThatAreNotMigrated = a3;
}

- (BRTypesField)typeOfNotMigrated
{
  return self->typeOfNotMigrated;
}

- (void)setTypeOfNotMigrated:(BRTypesField)a3
{
  self->typeOfNotMigrated = a3;
}

- (unint64_t)materialisedCountOnICD
{
  return self->materialisedCountOnICD;
}

- (void)setMaterialisedCountOnICD:(unint64_t)a3
{
  self->materialisedCountOnICD = a3;
}

- (unint64_t)materialisedCountOnFPFS
{
  return self->materialisedCountOnFPFS;
}

- (void)setMaterialisedCountOnFPFS:(unint64_t)a3
{
  self->materialisedCountOnFPFS = a3;
}

- (unint64_t)totalItemCount
{
  return self->totalItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->totalItemCount = a3;
}

- (BRTypesField)typeOfMigrated
{
  return self->typeOfMigrated;
}

- (void)setTypeOfMigrated:(BRTypesField)a3
{
  self->typeOfMigrated = a3;
}

- (unint64_t)errorOriginatorId
{
  return self->errorOriginatorId;
}

- (void)setErrorOriginatorId:(unint64_t)a3
{
  self->errorOriginatorId = a3;
}

- (unint64_t)itemsNotFoundInDB
{
  return self->itemsNotFoundInDB;
}

- (void)setItemsNotFoundInDB:(unint64_t)a3
{
  self->itemsNotFoundInDB = a3;
}

- (unint64_t)itemsChangedDuringCloning
{
  return self->itemsChangedDuringCloning;
}

- (void)setItemsChangedDuringCloning:(unint64_t)a3
{
  self->itemsChangedDuringCloning = a3;
}

- (unint64_t)ignoredContentProtectedItems
{
  return self->ignoredContentProtectedItems;
}

- (void)setIgnoredContentProtectedItems:(unint64_t)a3
{
  self->ignoredContentProtectedItems = a3;
}

- (unint64_t)packagesWithoutBundleBit
{
  return self->packagesWithoutBundleBit;
}

- (void)setPackagesWithoutBundleBit:(unint64_t)a3
{
  self->packagesWithoutBundleBit = a3;
}

- (unint64_t)bouncedDocumentsFolders
{
  return self->bouncedDocumentsFolders;
}

- (void)setBouncedDocumentsFolders:(unint64_t)a3
{
  self->bouncedDocumentsFolders = a3;
}

- (unint64_t)symlinkedDocumentsFolders
{
  return self->symlinkedDocumentsFolders;
}

- (void)setSymlinkedDocumentsFolders:(unint64_t)a3
{
  self->symlinkedDocumentsFolders = a3;
}

- (unint64_t)documentsFoldersWithoutItemID
{
  return self->documentsFoldersWithoutItemID;
}

- (void)setDocumentsFoldersWithoutItemID:(unint64_t)a3
{
  self->documentsFoldersWithoutItemID = a3;
}

- (unint64_t)datalessItems
{
  return self->datalessItems;
}

- (void)setDatalessItems:(unint64_t)a3
{
  self->datalessItems = a3;
}

- (int64_t)unexpectedCreations
{
  return self->unexpectedCreations;
}

- (void)setUnexpectedCreations:(int64_t)a3
{
  self->unexpectedCreations = a3;
}

- (unint64_t)bouncedItems
{
  return self->bouncedItems;
}

- (void)setBouncedItems:(unint64_t)a3
{
  self->bouncedItems = a3;
}

- (BRBouncesTypesMatrix)bouncedItemsMatrix
{
  return self->bouncedItemsMatrix;
}

- (void)setBouncedItemsMatrix:(BRBouncesTypesMatrix)a3
{
  self->bouncedItemsMatrix = a3;
}

- (BRCBouncingReport)bounceReport
{
  return (BRCBouncingReport *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBounceReport:(id)a3
{
}

- (BRCEAccessReport)eaccessReport
{
  return (BRCEAccessReport *)objc_getProperty(self, a2, 232, 1);
}

- (void)setEaccessReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eaccessReport, 0);
  objc_storeStrong((id *)&self->bounceReport, 0);
  objc_storeStrong((id *)&self->domainID, 0);
  objc_storeStrong((id *)&self->migrationUUID, 0);
  objc_storeStrong((id *)&self->crashReporterKey, 0);
  objc_storeStrong((id *)&self->lastError, 0);
}

@end