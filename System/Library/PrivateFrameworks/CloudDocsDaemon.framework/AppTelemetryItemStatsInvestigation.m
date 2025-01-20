@interface AppTelemetryItemStatsInvestigation
- (BOOL)apfsEncrypted;
- (BOOL)appLibraryMatches;
- (BOOL)bTimeIsBusy;
- (BOOL)dbIsApplibrary;
- (BOOL)dbIsPackage;
- (BOOL)dbIsSuper;
- (BOOL)doGenCountsMatchInFileId;
- (BOOL)docIDMatches;
- (BOOL)hasAcls;
- (BOOL)hasApfsAvailableSpace;
- (BOOL)hasApfsBlockSize;
- (BOOL)hasApfsEncrypted;
- (BOOL)hasApfsFlags;
- (BOOL)hasApfsRole;
- (BOOL)hasAppLibraryMatches;
- (BOOL)hasBTime;
- (BOOL)hasBTimeIsBusy;
- (BOOL)hasCloneErrorCode;
- (BOOL)hasCompressionType;
- (BOOL)hasDataProtectionClass;
- (BOOL)hasDbCapabilities;
- (BOOL)hasDbEffectiveContentPolicy;
- (BOOL)hasDbErrorCode;
- (BOOL)hasDbErrorDomain;
- (BOOL)hasDbFpContentStatus;
- (BOOL)hasDbFpDeletionStatus;
- (BOOL)hasDbFpImportStatus;
- (BOOL)hasDbFsContentStatus;
- (BOOL)hasDbFsDeletionStatus;
- (BOOL)hasDbFsImportStatus;
- (BOOL)hasDbGenCount;
- (BOOL)hasDbIsApplibrary;
- (BOOL)hasDbIsPackage;
- (BOOL)hasDbIsSuper;
- (BOOL)hasDbSharingState;
- (BOOL)hasDbTransferState;
- (BOOL)hasDiagErrorCode;
- (BOOL)hasDiagErrorDomain;
- (BOOL)hasDiagFailuresBitmap;
- (BOOL)hasDiagUnderlyingErrorCode;
- (BOOL)hasDiagUnderlyingErrorDomain;
- (BOOL)hasDoGenCountsMatchInFileId;
- (BOOL)hasDocIDMatches;
- (BOOL)hasFileNameExtension;
- (BOOL)hasFileNameLength;
- (BOOL)hasFinderInfoFlagsBase64;
- (BOOL)hasFsGenCount;
- (BOOL)hasGencountDiff;
- (BOOL)hasHasAcls;
- (BOOL)hasHasLocalChanges;
- (BOOL)hasHasMoreLinks;
- (BOOL)hasIsAppleDouble;
- (BOOL)hasIsBundleBit;
- (BOOL)hasIsFileNameNonAscii;
- (BOOL)hasIsOwnedByLoggedInUser;
- (BOOL)hasIsOwnedByRoot;
- (BOOL)hasIsPurgable;
- (BOOL)hasIsQuarantined;
- (BOOL)hasIsResourceFork;
- (BOOL)hasIsSparseFile;
- (BOOL)hasIsUnderDirStatFolder;
- (BOOL)hasIsUrgent;
- (BOOL)hasItemNumber;
- (BOOL)hasItemType;
- (BOOL)hasLocalChanges;
- (BOOL)hasMTime;
- (BOOL)hasMTimeBeforeMigrationStarted;
- (BOOL)hasNameIsTrashed;
- (BOOL)hasNameUnicodeNorm;
- (BOOL)hasParentHasAcls;
- (BOOL)hasParentMatches;
- (BOOL)hasPathDepth;
- (BOOL)hasPathLength;
- (BOOL)hasPurgeATime;
- (BOOL)hasPurgeGenCount;
- (BOOL)hasPurgeSyncRoot;
- (BOOL)hasReadErrorCode;
- (BOOL)hasStFlags;
- (BOOL)hasStMode;
- (BOOL)hasStatDirEntryCount;
- (BOOL)hasStatDocID;
- (BOOL)hasStatLogicalSize;
- (BOOL)hasStatPhysicalSize;
- (BOOL)hasSyncRootEnum;
- (BOOL)hasSysDocIDResolutionOK;
- (BOOL)hasSysPageSize;
- (BOOL)hasSysUID;
- (BOOL)hasUtType;
- (BOOL)hasXattrCount;
- (BOOL)hasXattrHasBeforeBounce;
- (BOOL)hasXattrHasDemotion;
- (BOOL)hasXattrHasPromotion;
- (BOOL)isAppleDouble;
- (BOOL)isBundleBit;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFileNameNonAscii;
- (BOOL)isOwnedByLoggedInUser;
- (BOOL)isOwnedByRoot;
- (BOOL)isPurgable;
- (BOOL)isQuarantined;
- (BOOL)isResourceFork;
- (BOOL)isSparseFile;
- (BOOL)isUnderDirStatFolder;
- (BOOL)isUrgent;
- (BOOL)mTimeBeforeMigrationStarted;
- (BOOL)nameIsTrashed;
- (BOOL)parentHasAcls;
- (BOOL)parentMatches;
- (BOOL)readFrom:(id)a3;
- (BOOL)sysDocIDResolutionOK;
- (BOOL)xattrHasBeforeBounce;
- (BOOL)xattrHasDemotion;
- (BOOL)xattrHasPromotion;
- (NSString)dbErrorDomain;
- (NSString)diagErrorDomain;
- (NSString)diagUnderlyingErrorDomain;
- (NSString)fileNameExtension;
- (NSString)finderInfoFlagsBase64;
- (NSString)nameUnicodeNorm;
- (NSString)utType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)compressionType;
- (int)dataProtectionClass;
- (int)itemType;
- (int)syncRootEnum;
- (int)xattrCount;
- (int64_t)apfsAvailableSpace;
- (int64_t)apfsBlockSize;
- (int64_t)apfsFlags;
- (int64_t)apfsRole;
- (int64_t)bTime;
- (int64_t)cloneErrorCode;
- (int64_t)dbCapabilities;
- (int64_t)dbEffectiveContentPolicy;
- (int64_t)dbErrorCode;
- (int64_t)dbFpContentStatus;
- (int64_t)dbFpDeletionStatus;
- (int64_t)dbFpImportStatus;
- (int64_t)dbFsContentStatus;
- (int64_t)dbFsDeletionStatus;
- (int64_t)dbFsImportStatus;
- (int64_t)dbGenCount;
- (int64_t)dbSharingState;
- (int64_t)dbTransferState;
- (int64_t)diagErrorCode;
- (int64_t)diagFailuresBitmap;
- (int64_t)diagUnderlyingErrorCode;
- (int64_t)fileNameLength;
- (int64_t)fsGenCount;
- (int64_t)gencountDiff;
- (int64_t)hasMoreLinks;
- (int64_t)itemNumber;
- (int64_t)mTime;
- (int64_t)pathDepth;
- (int64_t)pathLength;
- (int64_t)purgeATime;
- (int64_t)purgeGenCount;
- (int64_t)purgeSyncRoot;
- (int64_t)readErrorCode;
- (int64_t)stFlags;
- (int64_t)stMode;
- (int64_t)statDirEntryCount;
- (int64_t)statDocID;
- (int64_t)statLogicalSize;
- (int64_t)statPhysicalSize;
- (int64_t)sysPageSize;
- (int64_t)sysUID;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApfsAvailableSpace:(int64_t)a3;
- (void)setApfsBlockSize:(int64_t)a3;
- (void)setApfsEncrypted:(BOOL)a3;
- (void)setApfsFlags:(int64_t)a3;
- (void)setApfsRole:(int64_t)a3;
- (void)setAppLibraryMatches:(BOOL)a3;
- (void)setBTime:(int64_t)a3;
- (void)setBTimeIsBusy:(BOOL)a3;
- (void)setCloneErrorCode:(int64_t)a3;
- (void)setCompressionType:(int)a3;
- (void)setDataProtectionClass:(int)a3;
- (void)setDbCapabilities:(int64_t)a3;
- (void)setDbEffectiveContentPolicy:(int64_t)a3;
- (void)setDbErrorCode:(int64_t)a3;
- (void)setDbErrorDomain:(id)a3;
- (void)setDbFpContentStatus:(int64_t)a3;
- (void)setDbFpDeletionStatus:(int64_t)a3;
- (void)setDbFpImportStatus:(int64_t)a3;
- (void)setDbFsContentStatus:(int64_t)a3;
- (void)setDbFsDeletionStatus:(int64_t)a3;
- (void)setDbFsImportStatus:(int64_t)a3;
- (void)setDbGenCount:(int64_t)a3;
- (void)setDbIsApplibrary:(BOOL)a3;
- (void)setDbIsPackage:(BOOL)a3;
- (void)setDbIsSuper:(BOOL)a3;
- (void)setDbSharingState:(int64_t)a3;
- (void)setDbTransferState:(int64_t)a3;
- (void)setDiagErrorCode:(int64_t)a3;
- (void)setDiagErrorDomain:(id)a3;
- (void)setDiagFailuresBitmap:(int64_t)a3;
- (void)setDiagUnderlyingErrorCode:(int64_t)a3;
- (void)setDiagUnderlyingErrorDomain:(id)a3;
- (void)setDoGenCountsMatchInFileId:(BOOL)a3;
- (void)setDocIDMatches:(BOOL)a3;
- (void)setFileNameExtension:(id)a3;
- (void)setFileNameLength:(int64_t)a3;
- (void)setFinderInfoFlagsBase64:(id)a3;
- (void)setFsGenCount:(int64_t)a3;
- (void)setGencountDiff:(int64_t)a3;
- (void)setHasAcls:(BOOL)a3;
- (void)setHasApfsAvailableSpace:(BOOL)a3;
- (void)setHasApfsBlockSize:(BOOL)a3;
- (void)setHasApfsEncrypted:(BOOL)a3;
- (void)setHasApfsFlags:(BOOL)a3;
- (void)setHasApfsRole:(BOOL)a3;
- (void)setHasAppLibraryMatches:(BOOL)a3;
- (void)setHasBTime:(BOOL)a3;
- (void)setHasBTimeIsBusy:(BOOL)a3;
- (void)setHasCloneErrorCode:(BOOL)a3;
- (void)setHasCompressionType:(BOOL)a3;
- (void)setHasDataProtectionClass:(BOOL)a3;
- (void)setHasDbCapabilities:(BOOL)a3;
- (void)setHasDbEffectiveContentPolicy:(BOOL)a3;
- (void)setHasDbErrorCode:(BOOL)a3;
- (void)setHasDbFpContentStatus:(BOOL)a3;
- (void)setHasDbFpDeletionStatus:(BOOL)a3;
- (void)setHasDbFpImportStatus:(BOOL)a3;
- (void)setHasDbFsContentStatus:(BOOL)a3;
- (void)setHasDbFsDeletionStatus:(BOOL)a3;
- (void)setHasDbFsImportStatus:(BOOL)a3;
- (void)setHasDbGenCount:(BOOL)a3;
- (void)setHasDbIsApplibrary:(BOOL)a3;
- (void)setHasDbIsPackage:(BOOL)a3;
- (void)setHasDbIsSuper:(BOOL)a3;
- (void)setHasDbSharingState:(BOOL)a3;
- (void)setHasDbTransferState:(BOOL)a3;
- (void)setHasDiagErrorCode:(BOOL)a3;
- (void)setHasDiagFailuresBitmap:(BOOL)a3;
- (void)setHasDiagUnderlyingErrorCode:(BOOL)a3;
- (void)setHasDoGenCountsMatchInFileId:(BOOL)a3;
- (void)setHasDocIDMatches:(BOOL)a3;
- (void)setHasFileNameLength:(BOOL)a3;
- (void)setHasFsGenCount:(BOOL)a3;
- (void)setHasGencountDiff:(BOOL)a3;
- (void)setHasHasAcls:(BOOL)a3;
- (void)setHasHasLocalChanges:(BOOL)a3;
- (void)setHasHasMoreLinks:(BOOL)a3;
- (void)setHasIsAppleDouble:(BOOL)a3;
- (void)setHasIsBundleBit:(BOOL)a3;
- (void)setHasIsFileNameNonAscii:(BOOL)a3;
- (void)setHasIsOwnedByLoggedInUser:(BOOL)a3;
- (void)setHasIsOwnedByRoot:(BOOL)a3;
- (void)setHasIsPurgable:(BOOL)a3;
- (void)setHasIsQuarantined:(BOOL)a3;
- (void)setHasIsResourceFork:(BOOL)a3;
- (void)setHasIsSparseFile:(BOOL)a3;
- (void)setHasIsUnderDirStatFolder:(BOOL)a3;
- (void)setHasIsUrgent:(BOOL)a3;
- (void)setHasItemNumber:(BOOL)a3;
- (void)setHasItemType:(BOOL)a3;
- (void)setHasLocalChanges:(BOOL)a3;
- (void)setHasMTime:(BOOL)a3;
- (void)setHasMTimeBeforeMigrationStarted:(BOOL)a3;
- (void)setHasMoreLinks:(int64_t)a3;
- (void)setHasNameIsTrashed:(BOOL)a3;
- (void)setHasParentHasAcls:(BOOL)a3;
- (void)setHasParentMatches:(BOOL)a3;
- (void)setHasPathDepth:(BOOL)a3;
- (void)setHasPathLength:(BOOL)a3;
- (void)setHasPurgeATime:(BOOL)a3;
- (void)setHasPurgeGenCount:(BOOL)a3;
- (void)setHasPurgeSyncRoot:(BOOL)a3;
- (void)setHasReadErrorCode:(BOOL)a3;
- (void)setHasStFlags:(BOOL)a3;
- (void)setHasStMode:(BOOL)a3;
- (void)setHasStatDirEntryCount:(BOOL)a3;
- (void)setHasStatDocID:(BOOL)a3;
- (void)setHasStatLogicalSize:(BOOL)a3;
- (void)setHasStatPhysicalSize:(BOOL)a3;
- (void)setHasSyncRootEnum:(BOOL)a3;
- (void)setHasSysDocIDResolutionOK:(BOOL)a3;
- (void)setHasSysPageSize:(BOOL)a3;
- (void)setHasSysUID:(BOOL)a3;
- (void)setHasXattrCount:(BOOL)a3;
- (void)setHasXattrHasBeforeBounce:(BOOL)a3;
- (void)setHasXattrHasDemotion:(BOOL)a3;
- (void)setHasXattrHasPromotion:(BOOL)a3;
- (void)setIsAppleDouble:(BOOL)a3;
- (void)setIsBundleBit:(BOOL)a3;
- (void)setIsFileNameNonAscii:(BOOL)a3;
- (void)setIsOwnedByLoggedInUser:(BOOL)a3;
- (void)setIsOwnedByRoot:(BOOL)a3;
- (void)setIsPurgable:(BOOL)a3;
- (void)setIsQuarantined:(BOOL)a3;
- (void)setIsResourceFork:(BOOL)a3;
- (void)setIsSparseFile:(BOOL)a3;
- (void)setIsUnderDirStatFolder:(BOOL)a3;
- (void)setIsUrgent:(BOOL)a3;
- (void)setItemNumber:(int64_t)a3;
- (void)setItemType:(int)a3;
- (void)setMTime:(int64_t)a3;
- (void)setMTimeBeforeMigrationStarted:(BOOL)a3;
- (void)setNameIsTrashed:(BOOL)a3;
- (void)setNameUnicodeNorm:(id)a3;
- (void)setParentHasAcls:(BOOL)a3;
- (void)setParentMatches:(BOOL)a3;
- (void)setPathDepth:(int64_t)a3;
- (void)setPathLength:(int64_t)a3;
- (void)setPurgeATime:(int64_t)a3;
- (void)setPurgeGenCount:(int64_t)a3;
- (void)setPurgeSyncRoot:(int64_t)a3;
- (void)setReadErrorCode:(int64_t)a3;
- (void)setStFlags:(int64_t)a3;
- (void)setStMode:(int64_t)a3;
- (void)setStatDirEntryCount:(int64_t)a3;
- (void)setStatDocID:(int64_t)a3;
- (void)setStatLogicalSize:(int64_t)a3;
- (void)setStatPhysicalSize:(int64_t)a3;
- (void)setSyncRootEnum:(int)a3;
- (void)setSysDocIDResolutionOK:(BOOL)a3;
- (void)setSysPageSize:(int64_t)a3;
- (void)setSysUID:(int64_t)a3;
- (void)setUtType:(id)a3;
- (void)setXattrCount:(int)a3;
- (void)setXattrHasBeforeBounce:(BOOL)a3;
- (void)setXattrHasDemotion:(BOOL)a3;
- (void)setXattrHasPromotion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryItemStatsInvestigation

- (void)setItemNumber:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_itemNumber = a3;
}

- (void)setHasItemNumber:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasItemNumber
{
  return (*(void *)&self->_has >> 25) & 1;
}

- (void)setItemType:(int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasItemType
{
  return (*(void *)&self->_has >> 43) & 1;
}

- (void)setDataProtectionClass:(int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_dataProtectionClass = a3;
}

- (void)setHasDataProtectionClass:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasDataProtectionClass
{
  return (*(void *)&self->_has >> 42) & 1;
}

- (void)setIsOwnedByLoggedInUser:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_isOwnedByLoggedInUser = a3;
}

- (void)setHasIsOwnedByLoggedInUser:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsOwnedByLoggedInUser
{
  return (*(void *)&self->_has >> 59) & 1;
}

- (void)setIsOwnedByRoot:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_isOwnedByRoot = a3;
}

- (void)setHasIsOwnedByRoot:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsOwnedByRoot
{
  return (*(void *)&self->_has >> 60) & 1;
}

- (void)setXattrCount:(int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_xattrCount = a3;
}

- (void)setHasXattrCount:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasXattrCount
{
  return (*(void *)&self->_has >> 45) & 1;
}

- (void)setIsAppleDouble:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_isAppleDouble = a3;
}

- (void)setHasIsAppleDouble:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsAppleDouble
{
  return HIBYTE(*(void *)&self->_has) & 1;
}

- (void)setIsResourceFork:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_isResourceFork = a3;
}

- (void)setHasIsResourceFork:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasIsResourceFork
{
  return *(void *)&self->_has >> 63;
}

- (void)setIsQuarantined:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_isQuarantined = a3;
}

- (void)setHasIsQuarantined:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsQuarantined
{
  return (*(void *)&self->_has >> 62) & 1;
}

- (BOOL)hasUtType
{
  return self->_utType != 0;
}

- (void)setIsBundleBit:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_isBundleBit = a3;
}

- (void)setHasIsBundleBit:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsBundleBit
{
  return (*(void *)&self->_has >> 57) & 1;
}

- (void)setIsSparseFile:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 1u;
  self->_isSparseFile = a3;
}

- (void)setHasIsSparseFile:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFE | a3;
}

- (BOOL)hasIsSparseFile
{
  return *((_WORD *)&self->_has + 4) & 1;
}

- (void)setCompressionType:(int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_compressionType = a3;
}

- (void)setHasCompressionType:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasCompressionType
{
  return (*(void *)&self->_has >> 41) & 1;
}

- (void)setReadErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_readErrorCode = a3;
}

- (void)setHasReadErrorCode:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasReadErrorCode
{
  return HIDWORD(*(void *)&self->_has) & 1;
}

- (void)setCloneErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_cloneErrorCode = a3;
}

- (void)setHasCloneErrorCode:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasCloneErrorCode
{
  return (*(void *)&self->_has >> 5) & 1;
}

- (void)setSyncRootEnum:(int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_syncRootEnum = a3;
}

- (void)setHasSyncRootEnum:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasSyncRootEnum
{
  return (*(void *)&self->_has >> 44) & 1;
}

- (void)setPathLength:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_pathLength = a3;
}

- (void)setHasPathLength:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasPathLength
{
  return (*(void *)&self->_has >> 28) & 1;
}

- (void)setFileNameLength:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_fileNameLength = a3;
}

- (void)setHasFileNameLength:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasFileNameLength
{
  return (*(void *)&self->_has >> 21) & 1;
}

- (void)setStMode:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_stMode = a3;
}

- (void)setHasStMode:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasStMode
{
  return (*(void *)&self->_has >> 34) & 1;
}

- (void)setStFlags:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_stFlags = a3;
}

- (void)setHasStFlags:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasStFlags
{
  return (*(void *)&self->_has >> 33) & 1;
}

- (void)setHasAcls:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_hasAcls = a3;
}

- (void)setHasHasAcls:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasHasAcls
{
  return (*(void *)&self->_has >> 54) & 1;
}

- (void)setParentHasAcls:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x20u;
  self->_parentHasAcls = a3;
}

- (void)setHasParentHasAcls:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFDF | v3;
}

- (BOOL)hasParentHasAcls
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 5) & 1;
}

- (void)setIsPurgable:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_isPurgable = a3;
}

- (void)setHasIsPurgable:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsPurgable
{
  return (*(void *)&self->_has >> 61) & 1;
}

- (void)setIsUrgent:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 4u;
  self->_isUrgent = a3;
}

- (void)setHasIsUrgent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFB | v3;
}

- (BOOL)hasIsUrgent
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 2) & 1;
}

- (void)setIsUnderDirStatFolder:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 2u;
  self->_isUnderDirStatFolder = a3;
}

- (void)setHasIsUnderDirStatFolder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFFD | v3;
}

- (BOOL)hasIsUnderDirStatFolder
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsFileNameNonAscii:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_isFileNameNonAscii = a3;
}

- (void)setHasIsFileNameNonAscii:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasIsFileNameNonAscii
{
  return (*(void *)&self->_has >> 58) & 1;
}

- (BOOL)hasFinderInfoFlagsBase64
{
  return self->_finderInfoFlagsBase64 != 0;
}

- (void)setHasMoreLinks:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_hasMoreLinks = a3;
}

- (void)setHasHasMoreLinks:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasHasMoreLinks
{
  return (*(void *)&self->_has >> 24) & 1;
}

- (void)setFsGenCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_fsGenCount = a3;
}

- (void)setHasFsGenCount:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasFsGenCount
{
  return (*(void *)&self->_has >> 22) & 1;
}

- (void)setDbGenCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_dbGenCount = a3;
}

- (void)setHasDbGenCount:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasDbGenCount
{
  return (*(void *)&self->_has >> 15) & 1;
}

- (void)setHasLocalChanges:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_hasLocalChanges = a3;
}

- (void)setHasHasLocalChanges:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasHasLocalChanges
{
  return (*(void *)&self->_has >> 55) & 1;
}

- (void)setDoGenCountsMatchInFileId:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_doGenCountsMatchInFileId = a3;
}

- (void)setHasDoGenCountsMatchInFileId:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDoGenCountsMatchInFileId
{
  return (*(void *)&self->_has >> 52) & 1;
}

- (BOOL)hasFileNameExtension
{
  return self->_fileNameExtension != 0;
}

- (void)setPathDepth:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_pathDepth = a3;
}

- (void)setHasPathDepth:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasPathDepth
{
  return (*(void *)&self->_has >> 27) & 1;
}

- (void)setXattrHasDemotion:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x200u;
  self->_xattrHasDemotion = a3;
}

- (void)setHasXattrHasDemotion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFDFF | v3;
}

- (BOOL)hasXattrHasDemotion
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 9) & 1;
}

- (void)setXattrHasPromotion:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x400u;
  self->_xattrHasPromotion = a3;
}

- (void)setHasXattrHasPromotion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFBFF | v3;
}

- (BOOL)hasXattrHasPromotion
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 10) & 1;
}

- (BOOL)hasDbErrorDomain
{
  return self->_dbErrorDomain != 0;
}

- (void)setDbErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_dbErrorCode = a3;
}

- (void)setHasDbErrorCode:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasDbErrorCode
{
  return (*(void *)&self->_has >> 8) & 1;
}

- (void)setDbCapabilities:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_dbCapabilities = a3;
}

- (void)setHasDbCapabilities:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasDbCapabilities
{
  return (*(void *)&self->_has >> 6) & 1;
}

- (void)setDbTransferState:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_dbTransferState = a3;
}

- (void)setHasDbTransferState:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasDbTransferState
{
  return (*(void *)&self->_has >> 17) & 1;
}

- (void)setDbSharingState:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_dbSharingState = a3;
}

- (void)setHasDbSharingState:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasDbSharingState
{
  return (*(void *)&self->_has >> 16) & 1;
}

- (void)setDbIsApplibrary:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_dbIsApplibrary = a3;
}

- (void)setHasDbIsApplibrary:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDbIsApplibrary
{
  return (*(void *)&self->_has >> 49) & 1;
}

- (void)setDbEffectiveContentPolicy:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_dbEffectiveContentPolicy = a3;
}

- (void)setHasDbEffectiveContentPolicy:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasDbEffectiveContentPolicy
{
  return (*(void *)&self->_has >> 7) & 1;
}

- (void)setDbIsPackage:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_dbIsPackage = a3;
}

- (void)setHasDbIsPackage:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDbIsPackage
{
  return (*(void *)&self->_has >> 50) & 1;
}

- (void)setDbFsContentStatus:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_dbFsContentStatus = a3;
}

- (void)setHasDbFsContentStatus:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasDbFsContentStatus
{
  return (*(void *)&self->_has >> 12) & 1;
}

- (void)setDbFpContentStatus:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_dbFpContentStatus = a3;
}

- (void)setHasDbFpContentStatus:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasDbFpContentStatus
{
  return (*(void *)&self->_has >> 9) & 1;
}

- (void)setDbFsDeletionStatus:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_dbFsDeletionStatus = a3;
}

- (void)setHasDbFsDeletionStatus:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasDbFsDeletionStatus
{
  return (*(void *)&self->_has >> 13) & 1;
}

- (void)setDbFpDeletionStatus:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_dbFpDeletionStatus = a3;
}

- (void)setHasDbFpDeletionStatus:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasDbFpDeletionStatus
{
  return (*(void *)&self->_has >> 10) & 1;
}

- (void)setDbFsImportStatus:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_dbFsImportStatus = a3;
}

- (void)setHasDbFsImportStatus:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasDbFsImportStatus
{
  return (*(void *)&self->_has >> 14) & 1;
}

- (void)setDbFpImportStatus:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_dbFpImportStatus = a3;
}

- (void)setHasDbFpImportStatus:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasDbFpImportStatus
{
  return (*(void *)&self->_has >> 11) & 1;
}

- (void)setDbIsSuper:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_dbIsSuper = a3;
}

- (void)setHasDbIsSuper:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDbIsSuper
{
  return (*(void *)&self->_has >> 51) & 1;
}

- (void)setGencountDiff:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_gencountDiff = a3;
}

- (void)setHasGencountDiff:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasGencountDiff
{
  return (*(void *)&self->_has >> 23) & 1;
}

- (void)setParentMatches:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x40u;
  self->_parentMatches = a3;
}

- (void)setHasParentMatches:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFBF | v3;
}

- (BOOL)hasParentMatches
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 6) & 1;
}

- (void)setAppLibraryMatches:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_appLibraryMatches = a3;
}

- (void)setHasAppLibraryMatches:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasAppLibraryMatches
{
  return (*(void *)&self->_has >> 47) & 1;
}

- (void)setMTimeBeforeMigrationStarted:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 8u;
  self->_mTimeBeforeMigrationStarted = a3;
}

- (void)setHasMTimeBeforeMigrationStarted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFF7 | v3;
}

- (BOOL)hasMTimeBeforeMigrationStarted
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 3) & 1;
}

- (void)setDocIDMatches:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_docIDMatches = a3;
}

- (void)setHasDocIDMatches:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasDocIDMatches
{
  return (*(void *)&self->_has >> 53) & 1;
}

- (void)setMTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_mTime = a3;
}

- (void)setHasMTime:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasMTime
{
  return (*(void *)&self->_has >> 26) & 1;
}

- (void)setBTime:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_bTime = a3;
}

- (void)setHasBTime:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasBTime
{
  return (*(void *)&self->_has >> 4) & 1;
}

- (void)setBTimeIsBusy:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_bTimeIsBusy = a3;
}

- (void)setHasBTimeIsBusy:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasBTimeIsBusy
{
  return HIWORD(*(void *)&self->_has) & 1;
}

- (void)setXattrHasBeforeBounce:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x100u;
  self->_xattrHasBeforeBounce = a3;
}

- (void)setHasXattrHasBeforeBounce:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFEFF | v3;
}

- (BOOL)hasXattrHasBeforeBounce
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 8) & 1;
}

- (BOOL)hasNameUnicodeNorm
{
  return self->_nameUnicodeNorm != 0;
}

- (void)setNameIsTrashed:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x10u;
  self->_nameIsTrashed = a3;
}

- (void)setHasNameIsTrashed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFFEF | v3;
}

- (BOOL)hasNameIsTrashed
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSysPageSize:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_sysPageSize = a3;
}

- (void)setHasSysPageSize:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasSysPageSize
{
  return (*(void *)&self->_has >> 39) & 1;
}

- (void)setSysUID:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_sysUID = a3;
}

- (void)setHasSysUID:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasSysUID
{
  return (*(void *)&self->_has >> 40) & 1;
}

- (void)setSysDocIDResolutionOK:(BOOL)a3
{
  *((_WORD *)&self->_has + 4) |= 0x80u;
  self->_sysDocIDResolutionOK = a3;
}

- (void)setHasSysDocIDResolutionOK:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *((_WORD *)&self->_has + 4) = *((_WORD *)&self->_has + 4) & 0xFF7F | v3;
}

- (BOOL)hasSysDocIDResolutionOK
{
  return ((unint64_t)*((unsigned __int16 *)&self->_has + 4) >> 7) & 1;
}

- (void)setPurgeGenCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_purgeGenCount = a3;
}

- (void)setHasPurgeGenCount:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasPurgeGenCount
{
  return (*(void *)&self->_has >> 30) & 1;
}

- (void)setPurgeATime:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_purgeATime = a3;
}

- (void)setHasPurgeATime:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasPurgeATime
{
  return (*(void *)&self->_has >> 29) & 1;
}

- (void)setPurgeSyncRoot:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_purgeSyncRoot = a3;
}

- (void)setHasPurgeSyncRoot:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasPurgeSyncRoot
{
  return (*(void *)&self->_has >> 31) & 1;
}

- (void)setDiagFailuresBitmap:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_diagFailuresBitmap = a3;
}

- (void)setHasDiagFailuresBitmap:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasDiagFailuresBitmap
{
  return (*(void *)&self->_has >> 19) & 1;
}

- (void)setDiagErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_diagErrorCode = a3;
}

- (void)setHasDiagErrorCode:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasDiagErrorCode
{
  return (*(void *)&self->_has >> 18) & 1;
}

- (void)setDiagUnderlyingErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_diagUnderlyingErrorCode = a3;
}

- (void)setHasDiagUnderlyingErrorCode:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasDiagUnderlyingErrorCode
{
  return (*(void *)&self->_has >> 20) & 1;
}

- (BOOL)hasDiagErrorDomain
{
  return self->_diagErrorDomain != 0;
}

- (BOOL)hasDiagUnderlyingErrorDomain
{
  return self->_diagUnderlyingErrorDomain != 0;
}

- (void)setApfsAvailableSpace:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_apfsAvailableSpace = a3;
}

- (void)setHasApfsAvailableSpace:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasApfsAvailableSpace
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setApfsFlags:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_apfsFlags = a3;
}

- (void)setHasApfsFlags:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasApfsFlags
{
  return (*(void *)&self->_has >> 2) & 1;
}

- (void)setApfsBlockSize:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_apfsBlockSize = a3;
}

- (void)setHasApfsBlockSize:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasApfsBlockSize
{
  return (*(void *)&self->_has >> 1) & 1;
}

- (void)setApfsRole:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_apfsRole = a3;
}

- (void)setHasApfsRole:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasApfsRole
{
  return (*(void *)&self->_has >> 3) & 1;
}

- (void)setApfsEncrypted:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_apfsEncrypted = a3;
}

- (void)setHasApfsEncrypted:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasApfsEncrypted
{
  return (*(void *)&self->_has >> 46) & 1;
}

- (void)setStatDocID:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_statDocID = a3;
}

- (void)setHasStatDocID:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasStatDocID
{
  return (*(void *)&self->_has >> 36) & 1;
}

- (void)setStatLogicalSize:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_statLogicalSize = a3;
}

- (void)setHasStatLogicalSize:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasStatLogicalSize
{
  return (*(void *)&self->_has >> 37) & 1;
}

- (void)setStatPhysicalSize:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_statPhysicalSize = a3;
}

- (void)setHasStatPhysicalSize:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasStatPhysicalSize
{
  return (*(void *)&self->_has >> 38) & 1;
}

- (void)setStatDirEntryCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_statDirEntryCount = a3;
}

- (void)setHasStatDirEntryCount:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasStatDirEntryCount
{
  return (*(void *)&self->_has >> 35) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryItemStatsInvestigation;
  v4 = [(AppTelemetryItemStatsInvestigation *)&v8 description];
  v5 = [(AppTelemetryItemStatsInvestigation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    v30 = [NSNumber numberWithLongLong:self->_itemNumber];
    [v3 setObject:v30 forKey:@"itemNumber"];

    uint64_t has = *(void *)p_has;
    if ((*(void *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_81;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  v31 = [NSNumber numberWithInt:self->_itemType];
  [v3 setObject:v31 forKey:@"itemType"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_82;
  }
LABEL_81:
  v32 = [NSNumber numberWithInt:self->_dataProtectionClass];
  [v3 setObject:v32 forKey:@"dataProtectionClass"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_83;
  }
LABEL_82:
  v33 = [NSNumber numberWithBool:self->_isOwnedByLoggedInUser];
  [v3 setObject:v33 forKey:@"isOwnedByLoggedInUser"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_84;
  }
LABEL_83:
  v34 = [NSNumber numberWithBool:self->_isOwnedByRoot];
  [v3 setObject:v34 forKey:@"isOwnedByRoot"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_85;
  }
LABEL_84:
  v35 = [NSNumber numberWithInt:self->_xattrCount];
  [v3 setObject:v35 forKey:@"xattrCount"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_86;
  }
LABEL_85:
  v36 = [NSNumber numberWithBool:self->_isAppleDouble];
  [v3 setObject:v36 forKey:@"isAppleDouble"];

  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_86:
  v37 = [NSNumber numberWithBool:self->_isResourceFork];
  [v3 setObject:v37 forKey:@"isResourceFork"];

  if ((*(void *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_10:
    v6 = [NSNumber numberWithBool:self->_isQuarantined];
    [v3 setObject:v6 forKey:@"isQuarantined"];
  }
LABEL_11:
  utType = self->_utType;
  if (utType) {
    [v3 setObject:utType forKey:@"utType"];
  }
  uint64_t v8 = (uint64_t)self->_has;
  if ((v8 & 0x200000000000000) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isBundleBit];
    [v3 setObject:v9 forKey:@"isBundleBit"];

    uint64_t v8 = (uint64_t)self->_has;
  }
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if (v10)
  {
    v38 = [NSNumber numberWithBool:self->_isSparseFile];
    [v3 setObject:v38 forKey:@"isSparseFile"];

    uint64_t v8 = (uint64_t)self->_has;
    __int16 v10 = *((_WORD *)&self->_has + 4);
    if ((v8 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v8 & 0x100000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_90;
    }
  }
  else if ((v8 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  v39 = [NSNumber numberWithInt:self->_compressionType];
  [v3 setObject:v39 forKey:@"compressionType"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v8 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_91;
  }
LABEL_90:
  v40 = [NSNumber numberWithLongLong:self->_readErrorCode];
  [v3 setObject:v40 forKey:@"readErrorCode"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x20) == 0)
  {
LABEL_19:
    if ((v8 & 0x100000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_92;
  }
LABEL_91:
  v41 = [NSNumber numberWithLongLong:self->_cloneErrorCode];
  [v3 setObject:v41 forKey:@"cloneErrorCode"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_93;
  }
LABEL_92:
  v42 = [NSNumber numberWithInt:self->_syncRootEnum];
  [v3 setObject:v42 forKey:@"syncRootEnum"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v8 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_94;
  }
LABEL_93:
  v43 = [NSNumber numberWithLongLong:self->_pathLength];
  [v3 setObject:v43 forKey:@"pathLength"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x200000) == 0)
  {
LABEL_22:
    if ((v8 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_95;
  }
LABEL_94:
  v44 = [NSNumber numberWithLongLong:self->_fileNameLength];
  [v3 setObject:v44 forKey:@"fileNameLength"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v8 & 0x200000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_96;
  }
LABEL_95:
  v45 = [NSNumber numberWithLongLong:self->_stMode];
  [v3 setObject:v45 forKey:@"st_mode"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v8 & 0x40000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_97;
  }
LABEL_96:
  v46 = [NSNumber numberWithLongLong:self->_stFlags];
  [v3 setObject:v46 forKey:@"st_flags"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v10 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_98;
  }
LABEL_97:
  v47 = [NSNumber numberWithBool:self->_hasAcls];
  [v3 setObject:v47 forKey:@"hasAcls"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 0x20) == 0)
  {
LABEL_26:
    if ((v8 & 0x2000000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_99;
  }
LABEL_98:
  v48 = [NSNumber numberWithBool:self->_parentHasAcls];
  [v3 setObject:v48 forKey:@"parentHasAcls"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v10 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_100;
  }
LABEL_99:
  v49 = [NSNumber numberWithBool:self->_isPurgable];
  [v3 setObject:v49 forKey:@"isPurgable"];

  uint64_t v8 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 4) == 0)
  {
LABEL_28:
    if ((v10 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_101;
  }
LABEL_100:
  v50 = [NSNumber numberWithBool:self->_isUrgent];
  [v3 setObject:v50 forKey:@"isUrgent"];

  uint64_t v8 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_29:
    if ((v8 & 0x400000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_101:
  v51 = [NSNumber numberWithBool:self->_isUnderDirStatFolder];
  [v3 setObject:v51 forKey:@"isUnderDirStatFolder"];

  if ((*(void *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_30:
    v11 = [NSNumber numberWithBool:self->_isFileNameNonAscii];
    [v3 setObject:v11 forKey:@"isFileNameNonAscii"];
  }
LABEL_31:
  finderInfoFlagsBase64 = self->_finderInfoFlagsBase64;
  if (finderInfoFlagsBase64) {
    [v3 setObject:finderInfoFlagsBase64 forKey:@"finderInfoFlagsBase64"];
  }
  v13 = &self->_has;
  uint64_t v14 = (uint64_t)self->_has;
  if ((v14 & 0x1000000) != 0)
  {
    v52 = [NSNumber numberWithLongLong:self->_hasMoreLinks];
    [v3 setObject:v52 forKey:@"hasMoreLinks"];

    uint64_t v14 = *(void *)v13;
    if ((*(void *)v13 & 0x400000) == 0)
    {
LABEL_35:
      if ((v14 & 0x8000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_105;
    }
  }
  else if ((v14 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  v53 = [NSNumber numberWithLongLong:self->_fsGenCount];
  [v3 setObject:v53 forKey:@"fsGenCount"];

  uint64_t v14 = (uint64_t)self->_has;
  if ((v14 & 0x8000) == 0)
  {
LABEL_36:
    if ((v14 & 0x80000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_106;
  }
LABEL_105:
  v54 = [NSNumber numberWithLongLong:self->_dbGenCount];
  [v3 setObject:v54 forKey:@"dbGenCount"];

  uint64_t v14 = (uint64_t)self->_has;
  if ((v14 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v14 & 0x10000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_106:
  v55 = [NSNumber numberWithBool:self->_hasLocalChanges];
  [v3 setObject:v55 forKey:@"hasLocalChanges"];

  if ((*(void *)&self->_has & 0x10000000000000) != 0)
  {
LABEL_38:
    v15 = [NSNumber numberWithBool:self->_doGenCountsMatchInFileId];
    [v3 setObject:v15 forKey:@"doGenCountsMatchInFileId"];
  }
LABEL_39:
  fileNameExtension = self->_fileNameExtension;
  if (fileNameExtension) {
    [v3 setObject:fileNameExtension forKey:@"fileNameExtension"];
  }
  if ((*(void *)&self->_has & 0x8000000) != 0)
  {
    v17 = [NSNumber numberWithLongLong:self->_pathDepth];
    [v3 setObject:v17 forKey:@"pathDepth"];
  }
  __int16 v18 = *((_WORD *)&self->_has + 4);
  if ((v18 & 0x200) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_xattrHasDemotion];
    [v3 setObject:v19 forKey:@"xattrHasDemotion"];

    __int16 v18 = *((_WORD *)&self->_has + 4);
  }
  if ((v18 & 0x400) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_xattrHasPromotion];
    [v3 setObject:v20 forKey:@"xattrHasPromotion"];
  }
  dbErrorDomain = self->_dbErrorDomain;
  if (dbErrorDomain) {
    [v3 setObject:dbErrorDomain forKey:@"dbErrorDomain"];
  }
  uint64_t v22 = (uint64_t)self->_has;
  if ((v22 & 0x100) != 0)
  {
    v23 = [NSNumber numberWithLongLong:self->_dbErrorCode];
    [v3 setObject:v23 forKey:@"dbErrorCode"];

    uint64_t v22 = (uint64_t)self->_has;
  }
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x40) != 0)
  {
    v56 = [NSNumber numberWithLongLong:self->_dbCapabilities];
    [v3 setObject:v56 forKey:@"dbCapabilities"];

    uint64_t v22 = (uint64_t)self->_has;
    __int16 v24 = *((_WORD *)&self->_has + 4);
    if ((v22 & 0x20000) == 0)
    {
LABEL_53:
      if ((v22 & 0x10000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_110;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  v57 = [NSNumber numberWithLongLong:self->_dbTransferState];
  [v3 setObject:v57 forKey:@"dbTransferState"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10000) == 0)
  {
LABEL_54:
    if ((v22 & 0x2000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  v58 = [NSNumber numberWithLongLong:self->_dbSharingState];
  [v3 setObject:v58 forKey:@"dbSharingState"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v22 & 0x80) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  v59 = [NSNumber numberWithBool:self->_dbIsApplibrary];
  [v3 setObject:v59 forKey:@"dbIsApplibrary"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x80) == 0)
  {
LABEL_56:
    if ((v22 & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  v60 = [NSNumber numberWithLongLong:self->_dbEffectiveContentPolicy];
  [v3 setObject:v60 forKey:@"dbEffectiveContentPolicy"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v22 & 0x1000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  v61 = [NSNumber numberWithBool:self->_dbIsPackage];
  [v3 setObject:v61 forKey:@"dbIsPackage"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x1000) == 0)
  {
LABEL_58:
    if ((v22 & 0x200) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  v62 = [NSNumber numberWithLongLong:self->_dbFsContentStatus];
  [v3 setObject:v62 forKey:@"dbFsContentStatus"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x200) == 0)
  {
LABEL_59:
    if ((v22 & 0x2000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  v63 = [NSNumber numberWithLongLong:self->_dbFpContentStatus];
  [v3 setObject:v63 forKey:@"dbFpContentStatus"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000) == 0)
  {
LABEL_60:
    if ((v22 & 0x400) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  v64 = [NSNumber numberWithLongLong:self->_dbFsDeletionStatus];
  [v3 setObject:v64 forKey:@"dbFsDeletionStatus"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x400) == 0)
  {
LABEL_61:
    if ((v22 & 0x4000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  v65 = [NSNumber numberWithLongLong:self->_dbFpDeletionStatus];
  [v3 setObject:v65 forKey:@"dbFpDeletionStatus"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000) == 0)
  {
LABEL_62:
    if ((v22 & 0x800) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  v66 = [NSNumber numberWithLongLong:self->_dbFsImportStatus];
  [v3 setObject:v66 forKey:@"dbFsImportStatus"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800) == 0)
  {
LABEL_63:
    if ((v22 & 0x8000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  v67 = [NSNumber numberWithLongLong:self->_dbFpImportStatus];
  [v3 setObject:v67 forKey:@"dbFpImportStatus"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v22 & 0x800000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  v68 = [NSNumber numberWithBool:self->_dbIsSuper];
  [v3 setObject:v68 forKey:@"dbIsSuper"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000) == 0)
  {
LABEL_65:
    if ((v24 & 0x40) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  v69 = [NSNumber numberWithLongLong:self->_gencountDiff];
  [v3 setObject:v69 forKey:@"gencountDiff"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v24 & 0x40) == 0)
  {
LABEL_66:
    if ((v22 & 0x800000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  v70 = [NSNumber numberWithBool:self->_parentMatches];
  [v3 setObject:v70 forKey:@"parentMatches"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v24 & 8) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  v71 = [NSNumber numberWithBool:self->_appLibraryMatches];
  [v3 setObject:v71 forKey:@"appLibraryMatches"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v24 & 8) == 0)
  {
LABEL_68:
    if ((v22 & 0x20000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  v72 = [NSNumber numberWithBool:self->_mTimeBeforeMigrationStarted];
  [v3 setObject:v72 forKey:@"mTimeBeforeMigrationStarted"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v22 & 0x4000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  v73 = [NSNumber numberWithBool:self->_docIDMatches];
  [v3 setObject:v73 forKey:@"docIDMatches"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v22 & 0x10) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  v74 = [NSNumber numberWithLongLong:self->_mTime];
  [v3 setObject:v74 forKey:@"mTime"];

  uint64_t v22 = (uint64_t)self->_has;
  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10) == 0)
  {
LABEL_71:
    if ((v22 & 0x1000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  v75 = [NSNumber numberWithLongLong:self->_bTime];
  [v3 setObject:v75 forKey:@"bTime"];

  __int16 v24 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v24 & 0x100) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_128:
  v76 = [NSNumber numberWithBool:self->_bTimeIsBusy];
  [v3 setObject:v76 forKey:@"bTimeIsBusy"];

  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_73:
    v25 = [NSNumber numberWithBool:self->_xattrHasBeforeBounce];
    [v3 setObject:v25 forKey:@"xattrHasBeforeBounce"];
  }
LABEL_74:
  nameUnicodeNorm = self->_nameUnicodeNorm;
  if (nameUnicodeNorm) {
    [v3 setObject:nameUnicodeNorm forKey:@"nameUnicodeNorm"];
  }
  v27 = &self->_has;
  __int16 v28 = *((_WORD *)&self->_has + 4);
  if ((v28 & 0x10) != 0)
  {
    v77 = [NSNumber numberWithBool:self->_nameIsTrashed];
    [v3 setObject:v77 forKey:@"nameIsTrashed"];

    uint64_t v29 = *(void *)v27;
    __int16 v28 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v27 & 0x8000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_131;
  }
  uint64_t v29 = *(void *)v27;
  if ((*(void *)v27 & 0x8000000000) != 0)
  {
LABEL_131:
    v78 = [NSNumber numberWithLongLong:self->_sysPageSize];
    [v3 setObject:v78 forKey:@"sysPageSize"];

    uint64_t v29 = (uint64_t)self->_has;
    __int16 v28 = *((_WORD *)&self->_has + 4);
  }
LABEL_132:
  if ((v29 & 0x10000000000) != 0)
  {
    v87 = [NSNumber numberWithLongLong:self->_sysUID];
    [v3 setObject:v87 forKey:@"sysUID"];

    uint64_t v29 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_134:
      if ((v29 & 0x40000000) == 0) {
        goto LABEL_135;
      }
      goto LABEL_158;
    }
  }
  else if ((v28 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  v88 = [NSNumber numberWithBool:self->_sysDocIDResolutionOK];
  [v3 setObject:v88 forKey:@"sysDocIDResolutionOK"];

  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v29 & 0x20000000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_159;
  }
LABEL_158:
  v89 = [NSNumber numberWithLongLong:self->_purgeGenCount];
  [v3 setObject:v89 forKey:@"purgeGenCount"];

  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v29 & 0x80000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_160;
  }
LABEL_159:
  v90 = [NSNumber numberWithLongLong:self->_purgeATime];
  [v3 setObject:v90 forKey:@"purgeATime"];

  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v29 & 0x80000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_161;
  }
LABEL_160:
  v91 = [NSNumber numberWithLongLong:self->_purgeSyncRoot];
  [v3 setObject:v91 forKey:@"purgeSyncRoot"];

  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x80000) == 0)
  {
LABEL_138:
    if ((v29 & 0x40000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_162;
  }
LABEL_161:
  v92 = [NSNumber numberWithLongLong:self->_diagFailuresBitmap];
  [v3 setObject:v92 forKey:@"diagFailuresBitmap"];

  uint64_t v29 = (uint64_t)self->_has;
  if ((v29 & 0x40000) == 0)
  {
LABEL_139:
    if ((v29 & 0x100000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_162:
  v93 = [NSNumber numberWithLongLong:self->_diagErrorCode];
  [v3 setObject:v93 forKey:@"diagErrorCode"];

  if ((*(void *)&self->_has & 0x100000) != 0)
  {
LABEL_140:
    v79 = [NSNumber numberWithLongLong:self->_diagUnderlyingErrorCode];
    [v3 setObject:v79 forKey:@"diagUnderlyingErrorCode"];
  }
LABEL_141:
  diagErrorDomain = self->_diagErrorDomain;
  if (diagErrorDomain) {
    [v3 setObject:diagErrorDomain forKey:@"diagErrorDomain"];
  }
  diagUnderlyingErrorDomain = self->_diagUnderlyingErrorDomain;
  if (diagUnderlyingErrorDomain) {
    [v3 setObject:diagUnderlyingErrorDomain forKey:@"diagUnderlyingErrorDomain"];
  }
  v82 = &self->_has;
  uint64_t v83 = (uint64_t)self->_has;
  if (v83)
  {
    v94 = [NSNumber numberWithLongLong:self->_apfsAvailableSpace];
    [v3 setObject:v94 forKey:@"apfsAvailableSpace"];

    uint64_t v83 = *(void *)v82;
    if ((*(void *)v82 & 4) == 0)
    {
LABEL_147:
      if ((v83 & 2) == 0) {
        goto LABEL_148;
      }
      goto LABEL_166;
    }
  }
  else if ((v83 & 4) == 0)
  {
    goto LABEL_147;
  }
  v95 = [NSNumber numberWithLongLong:self->_apfsFlags];
  [v3 setObject:v95 forKey:@"apfsFlags"];

  uint64_t v83 = (uint64_t)self->_has;
  if ((v83 & 2) == 0)
  {
LABEL_148:
    if ((v83 & 8) == 0) {
      goto LABEL_149;
    }
    goto LABEL_167;
  }
LABEL_166:
  v96 = [NSNumber numberWithLongLong:self->_apfsBlockSize];
  [v3 setObject:v96 forKey:@"apfsBlockSize"];

  uint64_t v83 = (uint64_t)self->_has;
  if ((v83 & 8) == 0)
  {
LABEL_149:
    if ((v83 & 0x400000000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_168;
  }
LABEL_167:
  v97 = [NSNumber numberWithLongLong:self->_apfsRole];
  [v3 setObject:v97 forKey:@"apfsRole"];

  uint64_t v83 = (uint64_t)self->_has;
  if ((v83 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v83 & 0x1000000000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_169;
  }
LABEL_168:
  v98 = [NSNumber numberWithBool:self->_apfsEncrypted];
  [v3 setObject:v98 forKey:@"apfsEncrypted"];

  uint64_t v83 = (uint64_t)self->_has;
  if ((v83 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v83 & 0x2000000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_170;
  }
LABEL_169:
  v99 = [NSNumber numberWithLongLong:self->_statDocID];
  [v3 setObject:v99 forKey:@"statDocID"];

  uint64_t v83 = (uint64_t)self->_has;
  if ((v83 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v83 & 0x4000000000) == 0) {
      goto LABEL_153;
    }
LABEL_171:
    v101 = [NSNumber numberWithLongLong:self->_statPhysicalSize];
    [v3 setObject:v101 forKey:@"statPhysicalSize"];

    if ((*(void *)&self->_has & 0x800000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_154;
  }
LABEL_170:
  v100 = [NSNumber numberWithLongLong:self->_statLogicalSize];
  [v3 setObject:v100 forKey:@"statLogicalSize"];

  uint64_t v83 = (uint64_t)self->_has;
  if ((v83 & 0x4000000000) != 0) {
    goto LABEL_171;
  }
LABEL_153:
  if ((v83 & 0x800000000) != 0)
  {
LABEL_154:
    v84 = [NSNumber numberWithLongLong:self->_statDirEntryCount];
    [v3 setObject:v84 forKey:@"statDirEntryCount"];
  }
LABEL_155:
  id v85 = v3;

  return v85;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryItemStatsInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t has = *(void *)p_has;
    if ((*(void *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_81;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt32Field();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x4000000000000000) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_utType) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = (uint64_t)self->_has;
  if ((v6 & 0x200000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = (uint64_t)self->_has;
  }
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if (v7)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v6 = (uint64_t)self->_has;
    __int16 v7 = *((_WORD *)&self->_has + 4);
    if ((v6 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v6 & 0x100000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_90;
    }
  }
  else if ((v6 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v6 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt64Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x20) == 0)
  {
LABEL_19:
    if ((v6 & 0x100000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt64Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt64Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x200000) == 0)
  {
LABEL_22:
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt64Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v6 & 0x200000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt64Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v6 & 0x40000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt64Field();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v7 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x20) == 0)
  {
LABEL_26:
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v6 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v7 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = (uint64_t)self->_has;
  __int16 v7 = *((_WORD *)&self->_has + 4);
  if ((v7 & 4) == 0)
  {
LABEL_28:
    if ((v7 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteBOOLField();
  uint64_t v6 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_29:
    if ((v6 & 0x400000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x400000000000000) != 0) {
LABEL_30:
  }
    PBDataWriterWriteBOOLField();
LABEL_31:
  if (self->_finderInfoFlagsBase64) {
    PBDataWriterWriteStringField();
  }
  uint64_t v8 = &self->_has;
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v9 = *(void *)v8;
    if ((*(void *)v8 & 0x400000) == 0)
    {
LABEL_35:
      if ((v9 & 0x8000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_105;
    }
  }
  else if ((v9 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteInt64Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x8000) == 0)
  {
LABEL_36:
    if ((v9 & 0x80000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteInt64Field();
  uint64_t v9 = (uint64_t)self->_has;
  if ((v9 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v9 & 0x10000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x10000000000000) != 0) {
LABEL_38:
  }
    PBDataWriterWriteBOOLField();
LABEL_39:
  if (self->_fileNameExtension) {
    PBDataWriterWriteStringField();
  }
  if ((*(void *)&self->_has & 0x8000000) != 0) {
    PBDataWriterWriteInt64Field();
  }
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v10 = *((_WORD *)&self->_has + 4);
  }
  if ((v10 & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_dbErrorDomain) {
    PBDataWriterWriteStringField();
  }
  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x100) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v11 = (uint64_t)self->_has;
  }
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x40) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v11 = (uint64_t)self->_has;
    __int16 v12 = *((_WORD *)&self->_has + 4);
    if ((v11 & 0x20000) == 0)
    {
LABEL_53:
      if ((v11 & 0x10000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_110;
    }
  }
  else if ((v11 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x10000) == 0)
  {
LABEL_54:
    if ((v11 & 0x2000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v11 & 0x80) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x80) == 0)
  {
LABEL_56:
    if ((v11 & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x1000) == 0)
  {
LABEL_58:
    if ((v11 & 0x200) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200) == 0)
  {
LABEL_59:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x2000) == 0)
  {
LABEL_60:
    if ((v11 & 0x400) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x400) == 0)
  {
LABEL_61:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x4000) == 0)
  {
LABEL_62:
    if ((v11 & 0x800) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x800) == 0)
  {
LABEL_63:
    if ((v11 & 0x8000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v11 & 0x800000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x800000) == 0)
  {
LABEL_65:
    if ((v12 & 0x40) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x40) == 0)
  {
LABEL_66:
    if ((v11 & 0x800000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v12 & 8) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 8) == 0)
  {
LABEL_68:
    if ((v11 & 0x20000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v11 & 0x4000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteBOOLField();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v11 & 0x10) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt64Field();
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x10) == 0)
  {
LABEL_71:
    if ((v11 & 0x1000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt64Field();
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v12 & 0x100) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_128:
  PBDataWriterWriteBOOLField();
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0) {
LABEL_73:
  }
    PBDataWriterWriteBOOLField();
LABEL_74:
  if (self->_nameUnicodeNorm) {
    PBDataWriterWriteStringField();
  }
  v13 = &self->_has;
  __int16 v14 = *((_WORD *)&self->_has + 4);
  if ((v14 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v15 = *(void *)v13;
    __int16 v14 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v13 & 0x8000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_131;
  }
  uint64_t v15 = *(void *)v13;
  if ((*(void *)v13 & 0x8000000000) != 0)
  {
LABEL_131:
    PBDataWriterWriteInt64Field();
    uint64_t v15 = (uint64_t)self->_has;
    __int16 v14 = *((_WORD *)&self->_has + 4);
  }
LABEL_132:
  if ((v15 & 0x10000000000) != 0)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v15 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_134:
      if ((v15 & 0x40000000) == 0) {
        goto LABEL_135;
      }
      goto LABEL_160;
    }
  }
  else if ((v14 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v15 & 0x20000000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteInt64Field();
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v15 & 0x80000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt64Field();
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v15 & 0x80000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteInt64Field();
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x80000) == 0)
  {
LABEL_138:
    if ((v15 & 0x40000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteInt64Field();
  uint64_t v15 = (uint64_t)self->_has;
  if ((v15 & 0x40000) == 0)
  {
LABEL_139:
    if ((v15 & 0x100000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_164:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x100000) != 0) {
LABEL_140:
  }
    PBDataWriterWriteInt64Field();
LABEL_141:
  if (self->_diagErrorDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_diagUnderlyingErrorDomain) {
    PBDataWriterWriteStringField();
  }
  v16 = &self->_has;
  uint64_t v17 = (uint64_t)self->_has;
  if (v17)
  {
    PBDataWriterWriteInt64Field();
    uint64_t v17 = *(void *)v16;
    if ((*(void *)v16 & 4) == 0)
    {
LABEL_147:
      if ((v17 & 2) == 0) {
        goto LABEL_148;
      }
      goto LABEL_168;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_147;
  }
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_148:
    if ((v17 & 8) == 0) {
      goto LABEL_149;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 8) == 0)
  {
LABEL_149:
    if ((v17 & 0x400000000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v17 & 0x1000000000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteBOOLField();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v17 & 0x2000000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v17 & 0x4000000000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteInt64Field();
  uint64_t v17 = (uint64_t)self->_has;
  if ((v17 & 0x4000000000) == 0)
  {
LABEL_153:
    if ((v17 & 0x800000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_154;
  }
LABEL_173:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x800000000) != 0) {
LABEL_154:
  }
    PBDataWriterWriteInt64Field();
LABEL_155:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    v4[26] = self->_itemNumber;
    *(void *)((char *)v4 + 452) |= 0x2000000uLL;
    uint64_t has = *(void *)p_has;
    if ((*(void *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_81;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 96) = self->_itemType;
  *(void *)((char *)v4 + 452) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 85) = self->_dataProtectionClass;
  *(void *)((char *)v4 + 452) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((unsigned char *)v4 + 433) = self->_isOwnedByLoggedInUser;
  *(void *)((char *)v4 + 452) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((unsigned char *)v4 + 434) = self->_isOwnedByRoot;
  *(void *)((char *)v4 + 452) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)v4 + 104) = self->_xattrCount;
  *(void *)((char *)v4 + 452) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((unsigned char *)v4 + 430) = self->_isAppleDouble;
  *(void *)((char *)v4 + 452) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_86:
  *((unsigned char *)v4 + 437) = self->_isResourceFork;
  *(void *)((char *)v4 + 452) |= 0x8000000000000000;
  if ((*(void *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 436) = self->_isQuarantined;
    *(void *)((char *)v4 + 452) |= 0x4000000000000000uLL;
  }
LABEL_11:
  v19 = v4;
  if (self->_utType)
  {
    objc_msgSend(v4, "setUtType:");
    v4 = v19;
  }
  uint64_t v7 = (uint64_t)self->_has;
  if ((v7 & 0x200000000000000) != 0)
  {
    *((unsigned char *)v4 + 431) = self->_isBundleBit;
    *(void *)((char *)v4 + 452) |= 0x200000000000000uLL;
    uint64_t v7 = (uint64_t)self->_has;
  }
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if (v8)
  {
    *((unsigned char *)v4 + 438) = self->_isSparseFile;
    *((_WORD *)v4 + 230) |= 1u;
    uint64_t v7 = (uint64_t)self->_has;
    __int16 v8 = *((_WORD *)&self->_has + 4);
    if ((v7 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v7 & 0x100000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 84) = self->_compressionType;
  *(void *)((char *)v4 + 452) |= 0x20000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v7 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_91;
  }
LABEL_90:
  v4[33] = self->_readErrorCode;
  *(void *)((char *)v4 + 452) |= 0x100000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x20) == 0)
  {
LABEL_19:
    if ((v7 & 0x100000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_92;
  }
LABEL_91:
  v4[6] = self->_cloneErrorCode;
  *(void *)((char *)v4 + 452) |= 0x20uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 100) = self->_syncRootEnum;
  *(void *)((char *)v4 + 452) |= 0x100000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_94;
  }
LABEL_93:
  v4[29] = self->_pathLength;
  *(void *)((char *)v4 + 452) |= 0x10000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x200000) == 0)
  {
LABEL_22:
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_95;
  }
LABEL_94:
  v4[22] = self->_fileNameLength;
  *(void *)((char *)v4 + 452) |= 0x200000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_96;
  }
LABEL_95:
  v4[35] = self->_stMode;
  *(void *)((char *)v4 + 452) |= 0x400000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v7 & 0x40000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_97;
  }
LABEL_96:
  v4[34] = self->_stFlags;
  *(void *)((char *)v4 + 452) |= 0x200000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v8 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((unsigned char *)v4 + 428) = self->_hasAcls;
  *(void *)((char *)v4 + 452) |= 0x40000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v8 & 0x20) == 0)
  {
LABEL_26:
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((unsigned char *)v4 + 443) = self->_parentHasAcls;
  *((_WORD *)v4 + 230) |= 0x20u;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((unsigned char *)v4 + 435) = self->_isPurgable;
  *(void *)((char *)v4 + 452) |= 0x2000000000000000uLL;
  uint64_t v7 = (uint64_t)self->_has;
  __int16 v8 = *((_WORD *)&self->_has + 4);
  if ((v8 & 4) == 0)
  {
LABEL_28:
    if ((v8 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((unsigned char *)v4 + 440) = self->_isUrgent;
  *((_WORD *)v4 + 230) |= 4u;
  uint64_t v7 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_29:
    if ((v7 & 0x400000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_101:
  *((unsigned char *)v4 + 439) = self->_isUnderDirStatFolder;
  *((_WORD *)v4 + 230) |= 2u;
  if ((*(void *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_30:
    *((unsigned char *)v4 + 432) = self->_isFileNameNonAscii;
    *(void *)((char *)v4 + 452) |= 0x400000000000000uLL;
  }
LABEL_31:
  if (self->_finderInfoFlagsBase64)
  {
    objc_msgSend(v19, "setFinderInfoFlagsBase64:");
    v4 = v19;
  }
  uint64_t v9 = &self->_has;
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x1000000) != 0)
  {
    v4[25] = self->_hasMoreLinks;
    *(void *)((char *)v4 + 452) |= 0x1000000uLL;
    uint64_t v10 = *(void *)v9;
    if ((*(void *)v9 & 0x400000) == 0)
    {
LABEL_35:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_105;
    }
  }
  else if ((v10 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  v4[23] = self->_fsGenCount;
  *(void *)((char *)v4 + 452) |= 0x400000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x8000) == 0)
  {
LABEL_36:
    if ((v10 & 0x80000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_106;
  }
LABEL_105:
  v4[16] = self->_dbGenCount;
  *(void *)((char *)v4 + 452) |= 0x8000uLL;
  uint64_t v10 = (uint64_t)self->_has;
  if ((v10 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v10 & 0x10000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_106:
  *((unsigned char *)v4 + 429) = self->_hasLocalChanges;
  *(void *)((char *)v4 + 452) |= 0x80000000000000uLL;
  if ((*(void *)&self->_has & 0x10000000000000) != 0)
  {
LABEL_38:
    *((unsigned char *)v4 + 426) = self->_doGenCountsMatchInFileId;
    *(void *)((char *)v4 + 452) |= 0x10000000000000uLL;
  }
LABEL_39:
  if (self->_fileNameExtension)
  {
    objc_msgSend(v19, "setFileNameExtension:");
    v4 = v19;
  }
  if ((*(void *)&self->_has & 0x8000000) != 0)
  {
    v4[28] = self->_pathDepth;
    *(void *)((char *)v4 + 452) |= 0x8000000uLL;
  }
  __int16 v11 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 447) = self->_xattrHasDemotion;
    *((_WORD *)v4 + 230) |= 0x200u;
    __int16 v11 = *((_WORD *)&self->_has + 4);
  }
  if ((v11 & 0x400) != 0)
  {
    *((unsigned char *)v4 + 448) = self->_xattrHasPromotion;
    *((_WORD *)v4 + 230) |= 0x400u;
  }
  if (self->_dbErrorDomain)
  {
    objc_msgSend(v19, "setDbErrorDomain:");
    v4 = v19;
  }
  uint64_t v12 = (uint64_t)self->_has;
  if ((v12 & 0x100) != 0)
  {
    v4[9] = self->_dbErrorCode;
    *(void *)((char *)v4 + 452) |= 0x100uLL;
    uint64_t v12 = (uint64_t)self->_has;
  }
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x40) != 0)
  {
    v4[7] = self->_dbCapabilities;
    *(void *)((char *)v4 + 452) |= 0x40uLL;
    uint64_t v12 = (uint64_t)self->_has;
    __int16 v13 = *((_WORD *)&self->_has + 4);
    if ((v12 & 0x20000) == 0)
    {
LABEL_53:
      if ((v12 & 0x10000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_110;
    }
  }
  else if ((v12 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  v4[18] = self->_dbTransferState;
  *(void *)((char *)v4 + 452) |= 0x20000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x10000) == 0)
  {
LABEL_54:
    if ((v12 & 0x2000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  v4[17] = self->_dbSharingState;
  *(void *)((char *)v4 + 452) |= 0x10000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v12 & 0x80) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((unsigned char *)v4 + 423) = self->_dbIsApplibrary;
  *(void *)((char *)v4 + 452) |= 0x2000000000000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x80) == 0)
  {
LABEL_56:
    if ((v12 & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  v4[8] = self->_dbEffectiveContentPolicy;
  *(void *)((char *)v4 + 452) |= 0x80uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((unsigned char *)v4 + 424) = self->_dbIsPackage;
  *(void *)((char *)v4 + 452) |= 0x4000000000000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x1000) == 0)
  {
LABEL_58:
    if ((v12 & 0x200) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  v4[13] = self->_dbFsContentStatus;
  *(void *)((char *)v4 + 452) |= 0x1000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x200) == 0)
  {
LABEL_59:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  v4[10] = self->_dbFpContentStatus;
  *(void *)((char *)v4 + 452) |= 0x200uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x2000) == 0)
  {
LABEL_60:
    if ((v12 & 0x400) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  v4[14] = self->_dbFsDeletionStatus;
  *(void *)((char *)v4 + 452) |= 0x2000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x400) == 0)
  {
LABEL_61:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  v4[11] = self->_dbFpDeletionStatus;
  *(void *)((char *)v4 + 452) |= 0x400uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x4000) == 0)
  {
LABEL_62:
    if ((v12 & 0x800) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  v4[15] = self->_dbFsImportStatus;
  *(void *)((char *)v4 + 452) |= 0x4000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x800) == 0)
  {
LABEL_63:
    if ((v12 & 0x8000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  v4[12] = self->_dbFpImportStatus;
  *(void *)((char *)v4 + 452) |= 0x800uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((unsigned char *)v4 + 425) = self->_dbIsSuper;
  *(void *)((char *)v4 + 452) |= 0x8000000000000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x800000) == 0)
  {
LABEL_65:
    if ((v13 & 0x40) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  v4[24] = self->_gencountDiff;
  *(void *)((char *)v4 + 452) |= 0x800000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v13 & 0x40) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((unsigned char *)v4 + 444) = self->_parentMatches;
  *((_WORD *)v4 + 230) |= 0x40u;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v13 & 8) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((unsigned char *)v4 + 421) = self->_appLibraryMatches;
  *(void *)((char *)v4 + 452) |= 0x800000000000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v13 & 8) == 0)
  {
LABEL_68:
    if ((v12 & 0x20000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((unsigned char *)v4 + 441) = self->_mTimeBeforeMigrationStarted;
  *((_WORD *)v4 + 230) |= 8u;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v12 & 0x4000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((unsigned char *)v4 + 427) = self->_docIDMatches;
  *(void *)((char *)v4 + 452) |= 0x20000000000000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v12 & 0x10) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  v4[27] = self->_mTime;
  *(void *)((char *)v4 + 452) |= 0x4000000uLL;
  uint64_t v12 = (uint64_t)self->_has;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x10) == 0)
  {
LABEL_71:
    if ((v12 & 0x1000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  v4[5] = self->_bTime;
  *(void *)((char *)v4 + 452) |= 0x10uLL;
  __int16 v13 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v13 & 0x100) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_128:
  *((unsigned char *)v4 + 422) = self->_bTimeIsBusy;
  *(void *)((char *)v4 + 452) |= 0x1000000000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_73:
    *((unsigned char *)v4 + 446) = self->_xattrHasBeforeBounce;
    *((_WORD *)v4 + 230) |= 0x100u;
  }
LABEL_74:
  if (self->_nameUnicodeNorm)
  {
    objc_msgSend(v19, "setNameUnicodeNorm:");
    v4 = v19;
  }
  __int16 v14 = &self->_has;
  __int16 v15 = *((_WORD *)&self->_has + 4);
  if ((v15 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 442) = self->_nameIsTrashed;
    *((_WORD *)v4 + 230) |= 0x10u;
    uint64_t v16 = *(void *)v14;
    __int16 v15 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v14 & 0x8000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_131;
  }
  uint64_t v16 = *(void *)v14;
  if ((*(void *)v14 & 0x8000000000) != 0)
  {
LABEL_131:
    v4[40] = self->_sysPageSize;
    *(void *)((char *)v4 + 452) |= 0x8000000000uLL;
    uint64_t v16 = (uint64_t)self->_has;
    __int16 v15 = *((_WORD *)&self->_has + 4);
  }
LABEL_132:
  if ((v16 & 0x10000000000) != 0)
  {
    v4[41] = self->_sysUID;
    *(void *)((char *)v4 + 452) |= 0x10000000000uLL;
    uint64_t v16 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_134:
      if ((v16 & 0x40000000) == 0) {
        goto LABEL_135;
      }
      goto LABEL_160;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  *((unsigned char *)v4 + 445) = self->_sysDocIDResolutionOK;
  *((_WORD *)v4 + 230) |= 0x80u;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v16 & 0x20000000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_161;
  }
LABEL_160:
  v4[31] = self->_purgeGenCount;
  *(void *)((char *)v4 + 452) |= 0x40000000uLL;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_162;
  }
LABEL_161:
  v4[30] = self->_purgeATime;
  *(void *)((char *)v4 + 452) |= 0x20000000uLL;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v16 & 0x80000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_163;
  }
LABEL_162:
  v4[32] = self->_purgeSyncRoot;
  *(void *)((char *)v4 + 452) |= 0x80000000uLL;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x80000) == 0)
  {
LABEL_138:
    if ((v16 & 0x40000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_164;
  }
LABEL_163:
  v4[20] = self->_diagFailuresBitmap;
  *(void *)((char *)v4 + 452) |= 0x80000uLL;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x40000) == 0)
  {
LABEL_139:
    if ((v16 & 0x100000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_164:
  v4[19] = self->_diagErrorCode;
  *(void *)((char *)v4 + 452) |= 0x40000uLL;
  if ((*(void *)&self->_has & 0x100000) != 0)
  {
LABEL_140:
    v4[21] = self->_diagUnderlyingErrorCode;
    *(void *)((char *)v4 + 452) |= 0x100000uLL;
  }
LABEL_141:
  if (self->_diagErrorDomain)
  {
    objc_msgSend(v19, "setDiagErrorDomain:");
    v4 = v19;
  }
  if (self->_diagUnderlyingErrorDomain)
  {
    objc_msgSend(v19, "setDiagUnderlyingErrorDomain:");
    v4 = v19;
  }
  uint64_t v17 = &self->_has;
  uint64_t v18 = (uint64_t)self->_has;
  if (v18)
  {
    v4[1] = self->_apfsAvailableSpace;
    *(void *)((char *)v4 + 452) |= 1uLL;
    uint64_t v18 = *(void *)v17;
    if ((*(void *)v17 & 4) == 0)
    {
LABEL_147:
      if ((v18 & 2) == 0) {
        goto LABEL_148;
      }
      goto LABEL_168;
    }
  }
  else if ((v18 & 4) == 0)
  {
    goto LABEL_147;
  }
  v4[3] = self->_apfsFlags;
  *(void *)((char *)v4 + 452) |= 4uLL;
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 2) == 0)
  {
LABEL_148:
    if ((v18 & 8) == 0) {
      goto LABEL_149;
    }
    goto LABEL_169;
  }
LABEL_168:
  v4[2] = self->_apfsBlockSize;
  *(void *)((char *)v4 + 452) |= 2uLL;
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 8) == 0)
  {
LABEL_149:
    if ((v18 & 0x400000000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_170;
  }
LABEL_169:
  v4[4] = self->_apfsRole;
  *(void *)((char *)v4 + 452) |= 8uLL;
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v18 & 0x1000000000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((unsigned char *)v4 + 420) = self->_apfsEncrypted;
  *(void *)((char *)v4 + 452) |= 0x400000000000uLL;
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v18 & 0x2000000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_172;
  }
LABEL_171:
  v4[37] = self->_statDocID;
  *(void *)((char *)v4 + 452) |= 0x1000000000uLL;
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v18 & 0x4000000000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_173;
  }
LABEL_172:
  v4[38] = self->_statLogicalSize;
  *(void *)((char *)v4 + 452) |= 0x2000000000uLL;
  uint64_t v18 = (uint64_t)self->_has;
  if ((v18 & 0x4000000000) == 0)
  {
LABEL_153:
    if ((v18 & 0x800000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_154;
  }
LABEL_173:
  v4[39] = self->_statPhysicalSize;
  *(void *)((char *)v4 + 452) |= 0x4000000000uLL;
  if ((*(void *)&self->_has & 0x800000000) != 0)
  {
LABEL_154:
    v4[36] = self->_statDirEntryCount;
    *(void *)((char *)v4 + 452) |= 0x800000000uLL;
  }
LABEL_155:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  p_uint64_t has = &self->_has;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    *(void *)(v5 + 208) = self->_itemNumber;
    *(void *)(v5 + 452) |= 0x2000000uLL;
    uint64_t has = *(void *)p_has;
    if ((*(void *)p_has & 0x80000000000) == 0)
    {
LABEL_3:
      if ((has & 0x40000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_71;
    }
  }
  else if ((has & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 384) = self->_itemType;
  *(void *)(v5 + 452) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x40000000000) == 0)
  {
LABEL_4:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 340) = self->_dataProtectionClass;
  *(void *)(v5 + 452) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(unsigned char *)(v5 + 433) = self->_isOwnedByLoggedInUser;
  *(void *)(v5 + 452) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(unsigned char *)(v5 + 434) = self->_isOwnedByRoot;
  *(void *)(v5 + 452) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x200000000000) == 0)
  {
LABEL_7:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 416) = self->_xattrCount;
  *(void *)(v5 + 452) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(unsigned char *)(v5 + 430) = self->_isAppleDouble;
  *(void *)(v5 + 452) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_76:
  *(unsigned char *)(v5 + 437) = self->_isResourceFork;
  *(void *)(v5 + 452) |= 0x8000000000000000;
  if ((*(void *)&self->_has & 0x4000000000000000) != 0)
  {
LABEL_10:
    *(unsigned char *)(v5 + 436) = self->_isQuarantined;
    *(void *)(v5 + 452) |= 0x4000000000000000uLL;
  }
LABEL_11:
  uint64_t v9 = [(NSString *)self->_utType copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 408);
  *(void *)(v6 + 408) = v9;

  uint64_t v11 = (uint64_t)self->_has;
  if ((v11 & 0x200000000000000) != 0)
  {
    *(unsigned char *)(v6 + 431) = self->_isBundleBit;
    *(void *)(v6 + 452) |= 0x200000000000000uLL;
    uint64_t v11 = (uint64_t)self->_has;
  }
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if (v12)
  {
    *(unsigned char *)(v6 + 438) = self->_isSparseFile;
    *(_WORD *)(v6 + 460) |= 1u;
    uint64_t v11 = (uint64_t)self->_has;
    __int16 v12 = *((_WORD *)&self->_has + 4);
    if ((v11 & 0x20000000000) == 0)
    {
LABEL_15:
      if ((v11 & 0x100000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_80;
    }
  }
  else if ((v11 & 0x20000000000) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 336) = self->_compressionType;
  *(void *)(v6 + 452) |= 0x20000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_16:
    if ((v11 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(void *)(v6 + 264) = self->_readErrorCode;
  *(void *)(v6 + 452) |= 0x100000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x20) == 0)
  {
LABEL_17:
    if ((v11 & 0x100000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(void *)(v6 + 48) = self->_cloneErrorCode;
  *(void *)(v6 + 452) |= 0x20uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_18:
    if ((v11 & 0x10000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v6 + 400) = self->_syncRootEnum;
  *(void *)(v6 + 452) |= 0x100000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x10000000) == 0)
  {
LABEL_19:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(void *)(v6 + 232) = self->_pathLength;
  *(void *)(v6 + 452) |= 0x10000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200000) == 0)
  {
LABEL_20:
    if ((v11 & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(void *)(v6 + 176) = self->_fileNameLength;
  *(void *)(v6 + 452) |= 0x200000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x400000000) == 0)
  {
LABEL_21:
    if ((v11 & 0x200000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(void *)(v6 + 280) = self->_stMode;
  *(void *)(v6 + 452) |= 0x400000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x200000000) == 0)
  {
LABEL_22:
    if ((v11 & 0x40000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(void *)(v6 + 272) = self->_stFlags;
  *(void *)(v6 + 452) |= 0x200000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x40000000000000) == 0)
  {
LABEL_23:
    if ((v12 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(unsigned char *)(v6 + 428) = self->_hasAcls;
  *(void *)(v6 + 452) |= 0x40000000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 0x20) == 0)
  {
LABEL_24:
    if ((v11 & 0x2000000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(unsigned char *)(v6 + 443) = self->_parentHasAcls;
  *(_WORD *)(v6 + 460) |= 0x20u;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v11 & 0x2000000000000000) == 0)
  {
LABEL_25:
    if ((v12 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(unsigned char *)(v6 + 435) = self->_isPurgable;
  *(void *)(v6 + 452) |= 0x2000000000000000uLL;
  uint64_t v11 = (uint64_t)self->_has;
  __int16 v12 = *((_WORD *)&self->_has + 4);
  if ((v12 & 4) == 0)
  {
LABEL_26:
    if ((v12 & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(unsigned char *)(v6 + 440) = self->_isUrgent;
  *(_WORD *)(v6 + 460) |= 4u;
  uint64_t v11 = (uint64_t)self->_has;
  if ((*((_WORD *)&self->_has + 4) & 2) == 0)
  {
LABEL_27:
    if ((v11 & 0x400000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_91:
  *(unsigned char *)(v6 + 439) = self->_isUnderDirStatFolder;
  *(_WORD *)(v6 + 460) |= 2u;
  if ((*(void *)&self->_has & 0x400000000000000) != 0)
  {
LABEL_28:
    *(unsigned char *)(v6 + 432) = self->_isFileNameNonAscii;
    *(void *)(v6 + 452) |= 0x400000000000000uLL;
  }
LABEL_29:
  uint64_t v13 = [(NSString *)self->_finderInfoFlagsBase64 copyWithZone:a3];
  __int16 v14 = *(void **)(v6 + 376);
  *(void *)(v6 + 376) = v13;

  __int16 v15 = &self->_has;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x1000000) != 0)
  {
    *(void *)(v6 + 200) = self->_hasMoreLinks;
    *(void *)(v6 + 452) |= 0x1000000uLL;
    uint64_t v16 = *(void *)v15;
    if ((*(void *)v15 & 0x400000) == 0)
    {
LABEL_31:
      if ((v16 & 0x8000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_95;
    }
  }
  else if ((v16 & 0x400000) == 0)
  {
    goto LABEL_31;
  }
  *(void *)(v6 + 184) = self->_fsGenCount;
  *(void *)(v6 + 452) |= 0x400000uLL;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x8000) == 0)
  {
LABEL_32:
    if ((v16 & 0x80000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(void *)(v6 + 128) = self->_dbGenCount;
  *(void *)(v6 + 452) |= 0x8000uLL;
  uint64_t v16 = (uint64_t)self->_has;
  if ((v16 & 0x80000000000000) == 0)
  {
LABEL_33:
    if ((v16 & 0x10000000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_96:
  *(unsigned char *)(v6 + 429) = self->_hasLocalChanges;
  *(void *)(v6 + 452) |= 0x80000000000000uLL;
  if ((*(void *)&self->_has & 0x10000000000000) != 0)
  {
LABEL_34:
    *(unsigned char *)(v6 + 426) = self->_doGenCountsMatchInFileId;
    *(void *)(v6 + 452) |= 0x10000000000000uLL;
  }
LABEL_35:
  uint64_t v17 = [(NSString *)self->_fileNameExtension copyWithZone:a3];
  uint64_t v18 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = v17;

  if ((*(void *)&self->_has & 0x8000000) != 0)
  {
    *(void *)(v6 + 224) = self->_pathDepth;
    *(void *)(v6 + 452) |= 0x8000000uLL;
  }
  __int16 v19 = *((_WORD *)&self->_has + 4);
  if ((v19 & 0x200) != 0)
  {
    *(unsigned char *)(v6 + 447) = self->_xattrHasDemotion;
    *(_WORD *)(v6 + 460) |= 0x200u;
    __int16 v19 = *((_WORD *)&self->_has + 4);
  }
  if ((v19 & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 448) = self->_xattrHasPromotion;
    *(_WORD *)(v6 + 460) |= 0x400u;
  }
  uint64_t v20 = [(NSString *)self->_dbErrorDomain copyWithZone:a3];
  v21 = *(void **)(v6 + 344);
  *(void *)(v6 + 344) = v20;

  uint64_t v22 = (uint64_t)self->_has;
  if ((v22 & 0x100) != 0)
  {
    *(void *)(v6 + 72) = self->_dbErrorCode;
    *(void *)(v6 + 452) |= 0x100uLL;
    uint64_t v22 = (uint64_t)self->_has;
  }
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x40) != 0)
  {
    *(void *)(v6 + 56) = self->_dbCapabilities;
    *(void *)(v6 + 452) |= 0x40uLL;
    uint64_t v22 = (uint64_t)self->_has;
    __int16 v23 = *((_WORD *)&self->_has + 4);
    if ((v22 & 0x20000) == 0)
    {
LABEL_45:
      if ((v22 & 0x10000) == 0) {
        goto LABEL_46;
      }
      goto LABEL_100;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_45;
  }
  *(void *)(v6 + 144) = self->_dbTransferState;
  *(void *)(v6 + 452) |= 0x20000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10000) == 0)
  {
LABEL_46:
    if ((v22 & 0x2000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(void *)(v6 + 136) = self->_dbSharingState;
  *(void *)(v6 + 452) |= 0x10000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000000000000) == 0)
  {
LABEL_47:
    if ((v22 & 0x80) == 0) {
      goto LABEL_48;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(unsigned char *)(v6 + 423) = self->_dbIsApplibrary;
  *(void *)(v6 + 452) |= 0x2000000000000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x80) == 0)
  {
LABEL_48:
    if ((v22 & 0x4000000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(void *)(v6 + 64) = self->_dbEffectiveContentPolicy;
  *(void *)(v6 + 452) |= 0x80uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000000000) == 0)
  {
LABEL_49:
    if ((v22 & 0x1000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(unsigned char *)(v6 + 424) = self->_dbIsPackage;
  *(void *)(v6 + 452) |= 0x4000000000000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x1000) == 0)
  {
LABEL_50:
    if ((v22 & 0x200) == 0) {
      goto LABEL_51;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(void *)(v6 + 104) = self->_dbFsContentStatus;
  *(void *)(v6 + 452) |= 0x1000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x200) == 0)
  {
LABEL_51:
    if ((v22 & 0x2000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_106;
  }
LABEL_105:
  *(void *)(v6 + 80) = self->_dbFpContentStatus;
  *(void *)(v6 + 452) |= 0x200uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x2000) == 0)
  {
LABEL_52:
    if ((v22 & 0x400) == 0) {
      goto LABEL_53;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(void *)(v6 + 112) = self->_dbFsDeletionStatus;
  *(void *)(v6 + 452) |= 0x2000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x400) == 0)
  {
LABEL_53:
    if ((v22 & 0x4000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(void *)(v6 + 88) = self->_dbFpDeletionStatus;
  *(void *)(v6 + 452) |= 0x400uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000) == 0)
  {
LABEL_54:
    if ((v22 & 0x800) == 0) {
      goto LABEL_55;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(void *)(v6 + 120) = self->_dbFsImportStatus;
  *(void *)(v6 + 452) |= 0x4000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800) == 0)
  {
LABEL_55:
    if ((v22 & 0x8000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(void *)(v6 + 96) = self->_dbFpImportStatus;
  *(void *)(v6 + 452) |= 0x800uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((v22 & 0x800000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(unsigned char *)(v6 + 425) = self->_dbIsSuper;
  *(void *)(v6 + 452) |= 0x8000000000000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000) == 0)
  {
LABEL_57:
    if ((v23 & 0x40) == 0) {
      goto LABEL_58;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(void *)(v6 + 192) = self->_gencountDiff;
  *(void *)(v6 + 452) |= 0x800000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v23 & 0x40) == 0)
  {
LABEL_58:
    if ((v22 & 0x800000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(unsigned char *)(v6 + 444) = self->_parentMatches;
  *(_WORD *)(v6 + 460) |= 0x40u;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x800000000000) == 0)
  {
LABEL_59:
    if ((v23 & 8) == 0) {
      goto LABEL_60;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(unsigned char *)(v6 + 421) = self->_appLibraryMatches;
  *(void *)(v6 + 452) |= 0x800000000000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v23 & 8) == 0)
  {
LABEL_60:
    if ((v22 & 0x20000000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(unsigned char *)(v6 + 441) = self->_mTimeBeforeMigrationStarted;
  *(_WORD *)(v6 + 460) |= 8u;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x20000000000000) == 0)
  {
LABEL_61:
    if ((v22 & 0x4000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(unsigned char *)(v6 + 427) = self->_docIDMatches;
  *(void *)(v6 + 452) |= 0x20000000000000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x4000000) == 0)
  {
LABEL_62:
    if ((v22 & 0x10) == 0) {
      goto LABEL_63;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(void *)(v6 + 216) = self->_mTime;
  *(void *)(v6 + 452) |= 0x4000000uLL;
  uint64_t v22 = (uint64_t)self->_has;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((v22 & 0x10) == 0)
  {
LABEL_63:
    if ((v22 & 0x1000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(void *)(v6 + 40) = self->_bTime;
  *(void *)(v6 + 452) |= 0x10uLL;
  __int16 v23 = *((_WORD *)&self->_has + 4);
  if ((*(void *)&self->_has & 0x1000000000000) == 0)
  {
LABEL_64:
    if ((v23 & 0x100) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_118:
  *(unsigned char *)(v6 + 422) = self->_bTimeIsBusy;
  *(void *)(v6 + 452) |= 0x1000000000000uLL;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_65:
    *(unsigned char *)(v6 + 446) = self->_xattrHasBeforeBounce;
    *(_WORD *)(v6 + 460) |= 0x100u;
  }
LABEL_66:
  uint64_t v24 = [(NSString *)self->_nameUnicodeNorm copyWithZone:a3];
  v25 = *(void **)(v6 + 392);
  *(void *)(v6 + 392) = v24;

  v26 = &self->_has;
  __int16 v27 = *((_WORD *)&self->_has + 4);
  if ((v27 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 442) = self->_nameIsTrashed;
    *(_WORD *)(v6 + 460) |= 0x10u;
    uint64_t v28 = *(void *)v26;
    __int16 v27 = *((_WORD *)&self->_has + 4);
    if ((*(void *)v26 & 0x8000000000) == 0) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
  uint64_t v28 = *(void *)v26;
  if ((*(void *)v26 & 0x8000000000) != 0)
  {
LABEL_121:
    *(void *)(v6 + 320) = self->_sysPageSize;
    *(void *)(v6 + 452) |= 0x8000000000uLL;
    uint64_t v28 = (uint64_t)self->_has;
    __int16 v27 = *((_WORD *)&self->_has + 4);
  }
LABEL_122:
  if ((v28 & 0x10000000000) != 0)
  {
    *(void *)(v6 + 328) = self->_sysUID;
    *(void *)(v6 + 452) |= 0x10000000000uLL;
    uint64_t v28 = (uint64_t)self->_has;
    if ((*((_WORD *)&self->_has + 4) & 0x80) == 0)
    {
LABEL_124:
      if ((v28 & 0x40000000) == 0) {
        goto LABEL_125;
      }
      goto LABEL_144;
    }
  }
  else if ((v27 & 0x80) == 0)
  {
    goto LABEL_124;
  }
  *(unsigned char *)(v6 + 445) = self->_sysDocIDResolutionOK;
  *(_WORD *)(v6 + 460) |= 0x80u;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x40000000) == 0)
  {
LABEL_125:
    if ((v28 & 0x20000000) == 0) {
      goto LABEL_126;
    }
    goto LABEL_145;
  }
LABEL_144:
  *(void *)(v6 + 248) = self->_purgeGenCount;
  *(void *)(v6 + 452) |= 0x40000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x20000000) == 0)
  {
LABEL_126:
    if ((v28 & 0x80000000) == 0) {
      goto LABEL_127;
    }
    goto LABEL_146;
  }
LABEL_145:
  *(void *)(v6 + 240) = self->_purgeATime;
  *(void *)(v6 + 452) |= 0x20000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x80000000) == 0)
  {
LABEL_127:
    if ((v28 & 0x80000) == 0) {
      goto LABEL_128;
    }
    goto LABEL_147;
  }
LABEL_146:
  *(void *)(v6 + 256) = self->_purgeSyncRoot;
  *(void *)(v6 + 452) |= 0x80000000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x80000) == 0)
  {
LABEL_128:
    if ((v28 & 0x40000) == 0) {
      goto LABEL_129;
    }
    goto LABEL_148;
  }
LABEL_147:
  *(void *)(v6 + 160) = self->_diagFailuresBitmap;
  *(void *)(v6 + 452) |= 0x80000uLL;
  uint64_t v28 = (uint64_t)self->_has;
  if ((v28 & 0x40000) == 0)
  {
LABEL_129:
    if ((v28 & 0x100000) == 0) {
      goto LABEL_131;
    }
    goto LABEL_130;
  }
LABEL_148:
  *(void *)(v6 + 152) = self->_diagErrorCode;
  *(void *)(v6 + 452) |= 0x40000uLL;
  if ((*(void *)&self->_has & 0x100000) != 0)
  {
LABEL_130:
    *(void *)(v6 + 168) = self->_diagUnderlyingErrorCode;
    *(void *)(v6 + 452) |= 0x100000uLL;
  }
LABEL_131:
  uint64_t v29 = [(NSString *)self->_diagErrorDomain copyWithZone:a3];
  v30 = *(void **)(v6 + 352);
  *(void *)(v6 + 352) = v29;

  uint64_t v31 = [(NSString *)self->_diagUnderlyingErrorDomain copyWithZone:a3];
  v32 = *(void **)(v6 + 360);
  *(void *)(v6 + 360) = v31;

  v33 = &self->_has;
  uint64_t v34 = (uint64_t)self->_has;
  if (v34)
  {
    *(void *)(v6 + 8) = self->_apfsAvailableSpace;
    *(void *)(v6 + 452) |= 1uLL;
    uint64_t v34 = *(void *)v33;
    if ((*(void *)v33 & 4) == 0)
    {
LABEL_133:
      if ((v34 & 2) == 0) {
        goto LABEL_134;
      }
      goto LABEL_152;
    }
  }
  else if ((v34 & 4) == 0)
  {
    goto LABEL_133;
  }
  *(void *)(v6 + 24) = self->_apfsFlags;
  *(void *)(v6 + 452) |= 4uLL;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 2) == 0)
  {
LABEL_134:
    if ((v34 & 8) == 0) {
      goto LABEL_135;
    }
    goto LABEL_153;
  }
LABEL_152:
  *(void *)(v6 + 16) = self->_apfsBlockSize;
  *(void *)(v6 + 452) |= 2uLL;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 8) == 0)
  {
LABEL_135:
    if ((v34 & 0x400000000000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_154;
  }
LABEL_153:
  *(void *)(v6 + 32) = self->_apfsRole;
  *(void *)(v6 + 452) |= 8uLL;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x400000000000) == 0)
  {
LABEL_136:
    if ((v34 & 0x1000000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_155;
  }
LABEL_154:
  *(unsigned char *)(v6 + 420) = self->_apfsEncrypted;
  *(void *)(v6 + 452) |= 0x400000000000uLL;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x1000000000) == 0)
  {
LABEL_137:
    if ((v34 & 0x2000000000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_156;
  }
LABEL_155:
  *(void *)(v6 + 296) = self->_statDocID;
  *(void *)(v6 + 452) |= 0x1000000000uLL;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x2000000000) == 0)
  {
LABEL_138:
    if ((v34 & 0x4000000000) == 0) {
      goto LABEL_139;
    }
LABEL_157:
    *(void *)(v6 + 312) = self->_statPhysicalSize;
    *(void *)(v6 + 452) |= 0x4000000000uLL;
    if ((*(void *)&self->_has & 0x800000000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_156:
  *(void *)(v6 + 304) = self->_statLogicalSize;
  *(void *)(v6 + 452) |= 0x2000000000uLL;
  uint64_t v34 = (uint64_t)self->_has;
  if ((v34 & 0x4000000000) != 0) {
    goto LABEL_157;
  }
LABEL_139:
  if ((v34 & 0x800000000) != 0)
  {
LABEL_140:
    *(void *)(v6 + 288) = self->_statDirEntryCount;
    *(void *)(v6 + 452) |= 0x800000000uLL;
  }
LABEL_141:
  id v35 = (id)v6;

  return v35;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_482;
  }
  __int16 v5 = *((_WORD *)&self->_has + 4);
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *(void *)(v4 + 452);
  if ((has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_itemNumber != *((void *)v4 + 26)) {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_itemType != *((_DWORD *)v4 + 96)) {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_dataProtectionClass != *((_DWORD *)v4 + 85)) {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isOwnedByLoggedInUser)
    {
      if (!v4[433]) {
        goto LABEL_482;
      }
    }
    else if (v4[433])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isOwnedByRoot)
    {
      if (!v4[434]) {
        goto LABEL_482;
      }
    }
    else if (v4[434])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_xattrCount != *((_DWORD *)v4 + 104)) {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v7 & 0x100000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isAppleDouble)
    {
      if (!v4[430]) {
        goto LABEL_482;
      }
    }
    else if (v4[430])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x100000000000000) != 0)
  {
    goto LABEL_482;
  }
  if (has < 0)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isResourceFork)
    {
      if (!v4[437]) {
        goto LABEL_482;
      }
    }
    else if (v4[437])
    {
      goto LABEL_482;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v7 & 0x4000000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isQuarantined)
    {
      if (!v4[436]) {
        goto LABEL_482;
      }
    }
    else if (v4[436])
    {
      goto LABEL_482;
    }
  }
  else if ((v7 & 0x4000000000000000) != 0)
  {
    goto LABEL_482;
  }
  utType = self->_utType;
  if ((unint64_t)utType | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](utType, "isEqual:")) {
      goto LABEL_482;
    }
    uint64_t has = (uint64_t)self->_has;
    __int16 v5 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v9 = *(void *)(v4 + 452);
  __int16 v10 = *((_WORD *)v4 + 230);
  if ((has & 0x200000000000000) != 0)
  {
    if ((v9 & 0x200000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isBundleBit)
    {
      if (!v4[431]) {
        goto LABEL_482;
      }
    }
    else if (v4[431])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x200000000000000) != 0)
  {
    goto LABEL_482;
  }
  if (v5)
  {
    if ((v10 & 1) == 0) {
      goto LABEL_482;
    }
    if (self->_isSparseFile)
    {
      if (!v4[438]) {
        goto LABEL_482;
      }
    }
    else if (v4[438])
    {
      goto LABEL_482;
    }
  }
  else if (v10)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v9 & 0x20000000000) == 0 || self->_compressionType != *((_DWORD *)v4 + 84)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x20000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v9 & 0x100000000) == 0 || self->_readErrorCode != *((void *)v4 + 33)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x100000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_cloneErrorCode != *((void *)v4 + 6)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v9 & 0x100000000000) == 0 || self->_syncRootEnum != *((_DWORD *)v4 + 100)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x100000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v9 & 0x10000000) == 0 || self->_pathLength != *((void *)v4 + 29)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x10000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_fileNameLength != *((void *)v4 + 22)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v9 & 0x400000000) == 0 || self->_stMode != *((void *)v4 + 35)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x400000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v9 & 0x200000000) == 0 || self->_stFlags != *((void *)v4 + 34)) {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x200000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v9 & 0x40000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_hasAcls)
    {
      if (!v4[428]) {
        goto LABEL_482;
      }
    }
    else if (v4[428])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x40000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0) {
      goto LABEL_482;
    }
    if (self->_parentHasAcls)
    {
      if (!v4[443]) {
        goto LABEL_482;
      }
    }
    else if (v4[443])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v9 & 0x2000000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isPurgable)
    {
      if (!v4[435]) {
        goto LABEL_482;
      }
    }
    else if (v4[435])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x2000000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 4) != 0)
  {
    if ((v10 & 4) == 0) {
      goto LABEL_482;
    }
    if (self->_isUrgent)
    {
      if (!v4[440]) {
        goto LABEL_482;
      }
    }
    else if (v4[440])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 2) != 0)
  {
    if ((v10 & 2) == 0) {
      goto LABEL_482;
    }
    if (self->_isUnderDirStatFolder)
    {
      if (!v4[439]) {
        goto LABEL_482;
      }
    }
    else if (v4[439])
    {
      goto LABEL_482;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v9 & 0x400000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_isFileNameNonAscii)
    {
      if (!v4[432]) {
        goto LABEL_482;
      }
    }
    else if (v4[432])
    {
      goto LABEL_482;
    }
  }
  else if ((v9 & 0x400000000000000) != 0)
  {
    goto LABEL_482;
  }
  finderInfoFlagsBase64 = self->_finderInfoFlagsBase64;
  if ((unint64_t)finderInfoFlagsBase64 | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](finderInfoFlagsBase64, "isEqual:")) {
      goto LABEL_482;
    }
    uint64_t has = (uint64_t)self->_has;
    __int16 v5 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v12 = *(void *)(v4 + 452);
  if ((has & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0 || self->_hasMoreLinks != *((void *)v4 + 25)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v12 & 0x400000) == 0 || self->_fsGenCount != *((void *)v4 + 23)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x400000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_dbGenCount != *((void *)v4 + 16)) {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v12 & 0x80000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_hasLocalChanges)
    {
      if (!v4[429]) {
        goto LABEL_482;
      }
    }
    else if (v4[429])
    {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x80000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v12 & 0x10000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_doGenCountsMatchInFileId)
    {
      if (!v4[426]) {
        goto LABEL_482;
      }
    }
    else if (v4[426])
    {
      goto LABEL_482;
    }
  }
  else if ((v12 & 0x10000000000000) != 0)
  {
    goto LABEL_482;
  }
  fileNameExtension = self->_fileNameExtension;
  if ((unint64_t)fileNameExtension | *((void *)v4 + 46))
  {
    if (!-[NSString isEqual:](fileNameExtension, "isEqual:")) {
      goto LABEL_482;
    }
    uint64_t has = (uint64_t)self->_has;
    __int16 v5 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v14 = *(void *)(v4 + 452);
  if ((has & 0x8000000) != 0)
  {
    if ((v14 & 0x8000000) == 0 || self->_pathDepth != *((void *)v4 + 28)) {
      goto LABEL_482;
    }
  }
  else if ((v14 & 0x8000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 230) & 0x200) == 0) {
      goto LABEL_482;
    }
    if (self->_xattrHasDemotion)
    {
      if (!v4[447]) {
        goto LABEL_482;
      }
    }
    else if (v4[447])
    {
      goto LABEL_482;
    }
  }
  else if ((*((_WORD *)v4 + 230) & 0x200) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 230) & 0x400) == 0) {
      goto LABEL_482;
    }
    if (self->_xattrHasPromotion)
    {
      if (!v4[448]) {
        goto LABEL_482;
      }
    }
    else if (v4[448])
    {
      goto LABEL_482;
    }
  }
  else if ((*((_WORD *)v4 + 230) & 0x400) != 0)
  {
    goto LABEL_482;
  }
  dbErrorDomain = self->_dbErrorDomain;
  if ((unint64_t)dbErrorDomain | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](dbErrorDomain, "isEqual:")) {
      goto LABEL_482;
    }
    uint64_t has = (uint64_t)self->_has;
    __int16 v5 = *((_WORD *)&self->_has + 4);
  }
  uint64_t v16 = *(void *)(v4 + 452);
  __int16 v17 = *((_WORD *)v4 + 230);
  if ((has & 0x100) != 0)
  {
    if ((v16 & 0x100) == 0 || self->_dbErrorCode != *((void *)v4 + 9)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x100) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_dbCapabilities != *((void *)v4 + 7)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v16 & 0x20000) == 0 || self->_dbTransferState != *((void *)v4 + 18)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x20000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v16 & 0x10000) == 0 || self->_dbSharingState != *((void *)v4 + 17)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x10000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v16 & 0x2000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_dbIsApplibrary)
    {
      if (!v4[423]) {
        goto LABEL_482;
      }
    }
    else if (v4[423])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x2000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_dbEffectiveContentPolicy != *((void *)v4 + 8)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v16 & 0x4000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_dbIsPackage)
    {
      if (!v4[424]) {
        goto LABEL_482;
      }
    }
    else if (v4[424])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x4000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v16 & 0x1000) == 0 || self->_dbFsContentStatus != *((void *)v4 + 13)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x1000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x200) != 0)
  {
    if ((v16 & 0x200) == 0 || self->_dbFpContentStatus != *((void *)v4 + 10)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x200) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v16 & 0x2000) == 0 || self->_dbFsDeletionStatus != *((void *)v4 + 14)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x2000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x400) != 0)
  {
    if ((v16 & 0x400) == 0 || self->_dbFpDeletionStatus != *((void *)v4 + 11)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x400) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v16 & 0x4000) == 0 || self->_dbFsImportStatus != *((void *)v4 + 15)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x4000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800) != 0)
  {
    if ((v16 & 0x800) == 0 || self->_dbFpImportStatus != *((void *)v4 + 12)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x800) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v16 & 0x8000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_dbIsSuper)
    {
      if (!v4[425]) {
        goto LABEL_482;
      }
    }
    else if (v4[425])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x8000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v16 & 0x800000) == 0 || self->_gencountDiff != *((void *)v4 + 24)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x800000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0) {
      goto LABEL_482;
    }
    if (self->_parentMatches)
    {
      if (!v4[444]) {
        goto LABEL_482;
      }
    }
    else if (v4[444])
    {
      goto LABEL_482;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v16 & 0x800000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_appLibraryMatches)
    {
      if (!v4[421]) {
        goto LABEL_482;
      }
    }
    else if (v4[421])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x800000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 8) != 0)
  {
    if ((v17 & 8) == 0) {
      goto LABEL_482;
    }
    if (self->_mTimeBeforeMigrationStarted)
    {
      if (!v4[441]) {
        goto LABEL_482;
      }
    }
    else if (v4[441])
    {
      goto LABEL_482;
    }
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v16 & 0x20000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_docIDMatches)
    {
      if (!v4[427]) {
        goto LABEL_482;
      }
    }
    else if (v4[427])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x20000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v16 & 0x4000000) == 0 || self->_mTime != *((void *)v4 + 27)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x4000000) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_bTime != *((void *)v4 + 5)) {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_482;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v16 & 0x1000000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_bTimeIsBusy)
    {
      if (!v4[422]) {
        goto LABEL_482;
      }
    }
    else if (v4[422])
    {
      goto LABEL_482;
    }
  }
  else if ((v16 & 0x1000000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v5 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 230) & 0x100) == 0) {
      goto LABEL_482;
    }
    if (self->_xattrHasBeforeBounce)
    {
      if (!v4[446]) {
        goto LABEL_482;
      }
    }
    else if (v4[446])
    {
      goto LABEL_482;
    }
  }
  else if ((*((_WORD *)v4 + 230) & 0x100) != 0)
  {
    goto LABEL_482;
  }
  nameUnicodeNorm = self->_nameUnicodeNorm;
  if ((unint64_t)nameUnicodeNorm | *((void *)v4 + 49)
    && !-[NSString isEqual:](nameUnicodeNorm, "isEqual:"))
  {
    goto LABEL_482;
  }
  uint64_t v19 = (uint64_t)self->_has;
  __int16 v20 = *((_WORD *)&self->_has + 4);
  uint64_t v21 = *(void *)(v4 + 452);
  __int16 v22 = *((_WORD *)v4 + 230);
  if ((v20 & 0x10) != 0)
  {
    if ((v22 & 0x10) == 0) {
      goto LABEL_482;
    }
    if (self->_nameIsTrashed)
    {
      if (!v4[442]) {
        goto LABEL_482;
      }
    }
    else if (v4[442])
    {
      goto LABEL_482;
    }
  }
  else if ((v22 & 0x10) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x8000000000) != 0)
  {
    if ((v21 & 0x8000000000) == 0 || self->_sysPageSize != *((void *)v4 + 40)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x8000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x10000000000) != 0)
  {
    if ((v21 & 0x10000000000) == 0 || self->_sysUID != *((void *)v4 + 41)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x10000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v20 & 0x80) != 0)
  {
    if ((v22 & 0x80) == 0) {
      goto LABEL_482;
    }
    if (self->_sysDocIDResolutionOK)
    {
      if (!v4[445]) {
        goto LABEL_482;
      }
    }
    else if (v4[445])
    {
      goto LABEL_482;
    }
  }
  else if ((v22 & 0x80) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x40000000) != 0)
  {
    if ((v21 & 0x40000000) == 0 || self->_purgeGenCount != *((void *)v4 + 31)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x40000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x20000000) != 0)
  {
    if ((v21 & 0x20000000) == 0 || self->_purgeATime != *((void *)v4 + 30)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x20000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x80000000) != 0)
  {
    if ((v21 & 0x80000000) == 0 || self->_purgeSyncRoot != *((void *)v4 + 32)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x80000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x80000) != 0)
  {
    if ((v21 & 0x80000) == 0 || self->_diagFailuresBitmap != *((void *)v4 + 20)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x80000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x40000) != 0)
  {
    if ((v21 & 0x40000) == 0 || self->_diagErrorCode != *((void *)v4 + 19)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x40000) != 0)
  {
    goto LABEL_482;
  }
  if ((v19 & 0x100000) != 0)
  {
    if ((v21 & 0x100000) == 0 || self->_diagUnderlyingErrorCode != *((void *)v4 + 21)) {
      goto LABEL_482;
    }
  }
  else if ((v21 & 0x100000) != 0)
  {
    goto LABEL_482;
  }
  diagErrorDomain = self->_diagErrorDomain;
  if ((unint64_t)diagErrorDomain | *((void *)v4 + 44)
    && !-[NSString isEqual:](diagErrorDomain, "isEqual:"))
  {
    goto LABEL_482;
  }
  diagUnderlyingErrorDomain = self->_diagUnderlyingErrorDomain;
  if ((unint64_t)diagUnderlyingErrorDomain | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](diagUnderlyingErrorDomain, "isEqual:")) {
      goto LABEL_482;
    }
  }
  uint64_t v25 = (uint64_t)self->_has;
  uint64_t v26 = *(void *)(v4 + 452);
  if (v25)
  {
    if ((v26 & 1) == 0 || self->_apfsAvailableSpace != *((void *)v4 + 1)) {
      goto LABEL_482;
    }
  }
  else if (v26)
  {
    goto LABEL_482;
  }
  if ((v25 & 4) != 0)
  {
    if ((v26 & 4) == 0 || self->_apfsFlags != *((void *)v4 + 3)) {
      goto LABEL_482;
    }
  }
  else if ((v26 & 4) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_apfsBlockSize != *((void *)v4 + 2)) {
      goto LABEL_482;
    }
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 8) != 0)
  {
    if ((v26 & 8) == 0 || self->_apfsRole != *((void *)v4 + 4)) {
      goto LABEL_482;
    }
  }
  else if ((v26 & 8) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x400000000000) != 0)
  {
    if ((v26 & 0x400000000000) == 0) {
      goto LABEL_482;
    }
    if (self->_apfsEncrypted)
    {
      if (!v4[420]) {
        goto LABEL_482;
      }
    }
    else if (v4[420])
    {
      goto LABEL_482;
    }
  }
  else if ((v26 & 0x400000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x1000000000) != 0)
  {
    if ((v26 & 0x1000000000) == 0 || self->_statDocID != *((void *)v4 + 37)) {
      goto LABEL_482;
    }
  }
  else if ((v26 & 0x1000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x2000000000) != 0)
  {
    if ((v26 & 0x2000000000) == 0 || self->_statLogicalSize != *((void *)v4 + 38)) {
      goto LABEL_482;
    }
  }
  else if ((v26 & 0x2000000000) != 0)
  {
    goto LABEL_482;
  }
  if ((v25 & 0x4000000000) == 0)
  {
    if ((v26 & 0x4000000000) == 0) {
      goto LABEL_477;
    }
LABEL_482:
    BOOL v27 = 0;
    goto LABEL_483;
  }
  if ((v26 & 0x4000000000) == 0 || self->_statPhysicalSize != *((void *)v4 + 39)) {
    goto LABEL_482;
  }
LABEL_477:
  if ((v25 & 0x800000000) != 0)
  {
    if ((v26 & 0x800000000) == 0 || self->_statDirEntryCount != *((void *)v4 + 36)) {
      goto LABEL_482;
    }
    BOOL v27 = 1;
  }
  else
  {
    BOOL v27 = (v26 & 0x800000000) == 0;
  }
LABEL_483:

  return v27;
}

- (unint64_t)hash
{
  uint64_t has = (uint64_t)self->_has;
  if ((has & 0x2000000) != 0)
  {
    uint64_t v95 = 2654435761 * self->_itemNumber;
    if ((has & 0x80000000000) != 0)
    {
LABEL_3:
      uint64_t v94 = 2654435761 * self->_itemType;
      if ((has & 0x40000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v95 = 0;
    if ((has & 0x80000000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v94 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_4:
    uint64_t v93 = 2654435761 * self->_dataProtectionClass;
    if ((has & 0x800000000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v93 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_5:
    uint64_t v92 = 2654435761 * self->_isOwnedByLoggedInUser;
    if ((has & 0x1000000000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v92 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_6:
    uint64_t v91 = 2654435761 * self->_isOwnedByRoot;
    if ((has & 0x200000000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v91 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_7:
    uint64_t v90 = 2654435761 * self->_xattrCount;
    if ((has & 0x100000000000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v90 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_8:
    uint64_t v89 = 2654435761 * self->_isAppleDouble;
    if (has < 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v88 = 0;
    if ((has & 0x4000000000000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v89 = 0;
  if ((has & 0x8000000000000000) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v88 = 2654435761 * self->_isResourceFork;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_10:
    uint64_t v87 = 2654435761 * self->_isQuarantined;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v87 = 0;
LABEL_20:
  NSUInteger v86 = [(NSString *)self->_utType hash];
  uint64_t v4 = (uint64_t)self->_has;
  __int16 v5 = *((_WORD *)&self->_has + 4);
  if ((v4 & 0x200000000000000) != 0)
  {
    uint64_t v85 = 2654435761 * self->_isBundleBit;
    if (v5)
    {
LABEL_22:
      uint64_t v84 = 2654435761 * self->_isSparseFile;
      if ((v4 & 0x20000000000) != 0) {
        goto LABEL_23;
      }
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v85 = 0;
    if (v5) {
      goto LABEL_22;
    }
  }
  uint64_t v84 = 0;
  if ((v4 & 0x20000000000) != 0)
  {
LABEL_23:
    uint64_t v83 = 2654435761 * self->_compressionType;
    if ((v4 & 0x100000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v83 = 0;
  if ((v4 & 0x100000000) != 0)
  {
LABEL_24:
    uint64_t v82 = 2654435761 * self->_readErrorCode;
    if ((v4 & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v82 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_25:
    uint64_t v81 = 2654435761 * self->_cloneErrorCode;
    if ((v4 & 0x100000000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v81 = 0;
  if ((v4 & 0x100000000000) != 0)
  {
LABEL_26:
    uint64_t v80 = 2654435761 * self->_syncRootEnum;
    if ((v4 & 0x10000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v80 = 0;
  if ((v4 & 0x10000000) != 0)
  {
LABEL_27:
    uint64_t v79 = 2654435761 * self->_pathLength;
    if ((v4 & 0x200000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v79 = 0;
  if ((v4 & 0x200000) != 0)
  {
LABEL_28:
    uint64_t v78 = 2654435761 * self->_fileNameLength;
    if ((v4 & 0x400000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v78 = 0;
  if ((v4 & 0x400000000) != 0)
  {
LABEL_29:
    uint64_t v77 = 2654435761 * self->_stMode;
    if ((v4 & 0x200000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v77 = 0;
  if ((v4 & 0x200000000) != 0)
  {
LABEL_30:
    uint64_t v76 = 2654435761 * self->_stFlags;
    if ((v4 & 0x40000000000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v76 = 0;
  if ((v4 & 0x40000000000000) != 0)
  {
LABEL_31:
    uint64_t v75 = 2654435761 * self->_hasAcls;
    if ((v5 & 0x20) != 0) {
      goto LABEL_32;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v75 = 0;
  if ((v5 & 0x20) != 0)
  {
LABEL_32:
    uint64_t v74 = 2654435761 * self->_parentHasAcls;
    if ((v4 & 0x2000000000000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v74 = 0;
  if ((v4 & 0x2000000000000000) != 0)
  {
LABEL_33:
    uint64_t v73 = 2654435761 * self->_isPurgable;
    if ((v5 & 4) != 0) {
      goto LABEL_34;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v73 = 0;
  if ((v5 & 4) != 0)
  {
LABEL_34:
    uint64_t v72 = 2654435761 * self->_isUrgent;
    if ((v5 & 2) != 0) {
      goto LABEL_35;
    }
LABEL_51:
    uint64_t v71 = 0;
    if ((v4 & 0x400000000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_52;
  }
LABEL_50:
  uint64_t v72 = 0;
  if ((v5 & 2) == 0) {
    goto LABEL_51;
  }
LABEL_35:
  uint64_t v71 = 2654435761 * self->_isUnderDirStatFolder;
  if ((v4 & 0x400000000000000) != 0)
  {
LABEL_36:
    uint64_t v70 = 2654435761 * self->_isFileNameNonAscii;
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v70 = 0;
LABEL_53:
  NSUInteger v69 = [(NSString *)self->_finderInfoFlagsBase64 hash];
  uint64_t v6 = (uint64_t)self->_has;
  if ((v6 & 0x1000000) != 0)
  {
    uint64_t v68 = 2654435761 * self->_hasMoreLinks;
    if ((v6 & 0x400000) != 0)
    {
LABEL_55:
      uint64_t v67 = 2654435761 * self->_fsGenCount;
      if ((v6 & 0x8000) != 0) {
        goto LABEL_56;
      }
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v68 = 0;
    if ((v6 & 0x400000) != 0) {
      goto LABEL_55;
    }
  }
  uint64_t v67 = 0;
  if ((v6 & 0x8000) != 0)
  {
LABEL_56:
    uint64_t v66 = 2654435761 * self->_dbGenCount;
    if ((v6 & 0x80000000000000) != 0) {
      goto LABEL_57;
    }
LABEL_62:
    uint64_t v65 = 0;
    if ((v6 & 0x10000000000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_63;
  }
LABEL_61:
  uint64_t v66 = 0;
  if ((v6 & 0x80000000000000) == 0) {
    goto LABEL_62;
  }
LABEL_57:
  uint64_t v65 = 2654435761 * self->_hasLocalChanges;
  if ((v6 & 0x10000000000000) != 0)
  {
LABEL_58:
    uint64_t v64 = 2654435761 * self->_doGenCountsMatchInFileId;
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v64 = 0;
LABEL_64:
  NSUInteger v63 = [(NSString *)self->_fileNameExtension hash];
  if ((*(void *)&self->_has & 0x8000000) == 0)
  {
    uint64_t v62 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x200) != 0) {
      goto LABEL_66;
    }
LABEL_69:
    uint64_t v61 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x400) != 0) {
      goto LABEL_67;
    }
    goto LABEL_70;
  }
  uint64_t v62 = 2654435761 * self->_pathDepth;
  if ((*((_WORD *)&self->_has + 4) & 0x200) == 0) {
    goto LABEL_69;
  }
LABEL_66:
  uint64_t v61 = 2654435761 * self->_xattrHasDemotion;
  if ((*((_WORD *)&self->_has + 4) & 0x400) != 0)
  {
LABEL_67:
    uint64_t v60 = 2654435761 * self->_xattrHasPromotion;
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v60 = 0;
LABEL_71:
  NSUInteger v59 = [(NSString *)self->_dbErrorDomain hash];
  __int16 v7 = *((_WORD *)&self->_has + 4);
  uint64_t v8 = (uint64_t)self->_has;
  if ((v8 & 0x100) != 0)
  {
    uint64_t v58 = 2654435761 * self->_dbErrorCode;
    if ((v8 & 0x40) != 0)
    {
LABEL_73:
      uint64_t v57 = 2654435761 * self->_dbCapabilities;
      if ((v8 & 0x20000) != 0) {
        goto LABEL_74;
      }
      goto LABEL_97;
    }
  }
  else
  {
    uint64_t v58 = 0;
    if ((v8 & 0x40) != 0) {
      goto LABEL_73;
    }
  }
  uint64_t v57 = 0;
  if ((v8 & 0x20000) != 0)
  {
LABEL_74:
    uint64_t v56 = 2654435761 * self->_dbTransferState;
    if ((v8 & 0x10000) != 0) {
      goto LABEL_75;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v56 = 0;
  if ((v8 & 0x10000) != 0)
  {
LABEL_75:
    uint64_t v55 = 2654435761 * self->_dbSharingState;
    if ((v8 & 0x2000000000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v55 = 0;
  if ((v8 & 0x2000000000000) != 0)
  {
LABEL_76:
    uint64_t v54 = 2654435761 * self->_dbIsApplibrary;
    if ((v8 & 0x80) != 0) {
      goto LABEL_77;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v54 = 0;
  if ((v8 & 0x80) != 0)
  {
LABEL_77:
    uint64_t v53 = 2654435761 * self->_dbEffectiveContentPolicy;
    if ((v8 & 0x4000000000000) != 0) {
      goto LABEL_78;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v53 = 0;
  if ((v8 & 0x4000000000000) != 0)
  {
LABEL_78:
    uint64_t v52 = 2654435761 * self->_dbIsPackage;
    if ((v8 & 0x1000) != 0) {
      goto LABEL_79;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v52 = 0;
  if ((v8 & 0x1000) != 0)
  {
LABEL_79:
    uint64_t v51 = 2654435761 * self->_dbFsContentStatus;
    if ((v8 & 0x200) != 0) {
      goto LABEL_80;
    }
    goto LABEL_103;
  }
LABEL_102:
  uint64_t v51 = 0;
  if ((v8 & 0x200) != 0)
  {
LABEL_80:
    uint64_t v50 = 2654435761 * self->_dbFpContentStatus;
    if ((v8 & 0x2000) != 0) {
      goto LABEL_81;
    }
    goto LABEL_104;
  }
LABEL_103:
  uint64_t v50 = 0;
  if ((v8 & 0x2000) != 0)
  {
LABEL_81:
    uint64_t v49 = 2654435761 * self->_dbFsDeletionStatus;
    if ((v8 & 0x400) != 0) {
      goto LABEL_82;
    }
    goto LABEL_105;
  }
LABEL_104:
  uint64_t v49 = 0;
  if ((v8 & 0x400) != 0)
  {
LABEL_82:
    uint64_t v48 = 2654435761 * self->_dbFpDeletionStatus;
    if ((v8 & 0x4000) != 0) {
      goto LABEL_83;
    }
    goto LABEL_106;
  }
LABEL_105:
  uint64_t v48 = 0;
  if ((v8 & 0x4000) != 0)
  {
LABEL_83:
    uint64_t v47 = 2654435761 * self->_dbFsImportStatus;
    if ((v8 & 0x800) != 0) {
      goto LABEL_84;
    }
    goto LABEL_107;
  }
LABEL_106:
  uint64_t v47 = 0;
  if ((v8 & 0x800) != 0)
  {
LABEL_84:
    uint64_t v46 = 2654435761 * self->_dbFpImportStatus;
    if ((v8 & 0x8000000000000) != 0) {
      goto LABEL_85;
    }
    goto LABEL_108;
  }
LABEL_107:
  uint64_t v46 = 0;
  if ((v8 & 0x8000000000000) != 0)
  {
LABEL_85:
    uint64_t v45 = 2654435761 * self->_dbIsSuper;
    if ((v8 & 0x800000) != 0) {
      goto LABEL_86;
    }
    goto LABEL_109;
  }
LABEL_108:
  uint64_t v45 = 0;
  if ((v8 & 0x800000) != 0)
  {
LABEL_86:
    uint64_t v44 = 2654435761 * self->_gencountDiff;
    if ((v7 & 0x40) != 0) {
      goto LABEL_87;
    }
    goto LABEL_110;
  }
LABEL_109:
  uint64_t v44 = 0;
  if ((v7 & 0x40) != 0)
  {
LABEL_87:
    uint64_t v43 = 2654435761 * self->_parentMatches;
    if ((v8 & 0x800000000000) != 0) {
      goto LABEL_88;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v43 = 0;
  if ((v8 & 0x800000000000) != 0)
  {
LABEL_88:
    uint64_t v42 = 2654435761 * self->_appLibraryMatches;
    if ((v7 & 8) != 0) {
      goto LABEL_89;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v42 = 0;
  if ((v7 & 8) != 0)
  {
LABEL_89:
    uint64_t v41 = 2654435761 * self->_mTimeBeforeMigrationStarted;
    if ((v8 & 0x20000000000000) != 0) {
      goto LABEL_90;
    }
    goto LABEL_113;
  }
LABEL_112:
  uint64_t v41 = 0;
  if ((v8 & 0x20000000000000) != 0)
  {
LABEL_90:
    uint64_t v40 = 2654435761 * self->_docIDMatches;
    if ((v8 & 0x4000000) != 0) {
      goto LABEL_91;
    }
    goto LABEL_114;
  }
LABEL_113:
  uint64_t v40 = 0;
  if ((v8 & 0x4000000) != 0)
  {
LABEL_91:
    uint64_t v39 = 2654435761 * self->_mTime;
    if ((v8 & 0x10) != 0) {
      goto LABEL_92;
    }
    goto LABEL_115;
  }
LABEL_114:
  uint64_t v39 = 0;
  if ((v8 & 0x10) != 0)
  {
LABEL_92:
    uint64_t v38 = 2654435761 * self->_bTime;
    if ((v8 & 0x1000000000000) != 0) {
      goto LABEL_93;
    }
LABEL_116:
    uint64_t v37 = 0;
    if ((*((_WORD *)&self->_has + 4) & 0x100) != 0) {
      goto LABEL_94;
    }
    goto LABEL_117;
  }
LABEL_115:
  uint64_t v38 = 0;
  if ((v8 & 0x1000000000000) == 0) {
    goto LABEL_116;
  }
LABEL_93:
  uint64_t v37 = 2654435761 * self->_bTimeIsBusy;
  if ((*((_WORD *)&self->_has + 4) & 0x100) != 0)
  {
LABEL_94:
    uint64_t v36 = 2654435761 * self->_xattrHasBeforeBounce;
    goto LABEL_118;
  }
LABEL_117:
  uint64_t v36 = 0;
LABEL_118:
  NSUInteger v35 = [(NSString *)self->_nameUnicodeNorm hash];
  uint64_t v9 = (uint64_t)self->_has;
  __int16 v10 = *((_WORD *)&self->_has + 4);
  if ((v10 & 0x10) != 0)
  {
    uint64_t v34 = 2654435761 * self->_nameIsTrashed;
    if ((v9 & 0x8000000000) != 0)
    {
LABEL_120:
      uint64_t v33 = 2654435761 * self->_sysPageSize;
      if ((v9 & 0x10000000000) != 0) {
        goto LABEL_121;
      }
      goto LABEL_131;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((v9 & 0x8000000000) != 0) {
      goto LABEL_120;
    }
  }
  uint64_t v33 = 0;
  if ((v9 & 0x10000000000) != 0)
  {
LABEL_121:
    uint64_t v32 = 2654435761 * self->_sysUID;
    if ((v10 & 0x80) != 0) {
      goto LABEL_122;
    }
    goto LABEL_132;
  }
LABEL_131:
  uint64_t v32 = 0;
  if ((v10 & 0x80) != 0)
  {
LABEL_122:
    uint64_t v30 = 2654435761 * self->_sysDocIDResolutionOK;
    if ((v9 & 0x40000000) != 0) {
      goto LABEL_123;
    }
    goto LABEL_133;
  }
LABEL_132:
  uint64_t v30 = 0;
  if ((v9 & 0x40000000) != 0)
  {
LABEL_123:
    uint64_t v11 = 2654435761 * self->_purgeGenCount;
    if ((v9 & 0x20000000) != 0) {
      goto LABEL_124;
    }
    goto LABEL_134;
  }
LABEL_133:
  uint64_t v11 = 0;
  if ((v9 & 0x20000000) != 0)
  {
LABEL_124:
    uint64_t v12 = 2654435761 * self->_purgeATime;
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_125;
    }
    goto LABEL_135;
  }
LABEL_134:
  uint64_t v12 = 0;
  if ((v9 & 0x80000000) != 0)
  {
LABEL_125:
    uint64_t v13 = 2654435761 * self->_purgeSyncRoot;
    if ((v9 & 0x80000) != 0) {
      goto LABEL_126;
    }
    goto LABEL_136;
  }
LABEL_135:
  uint64_t v13 = 0;
  if ((v9 & 0x80000) != 0)
  {
LABEL_126:
    uint64_t v14 = 2654435761 * self->_diagFailuresBitmap;
    if ((v9 & 0x40000) != 0) {
      goto LABEL_127;
    }
LABEL_137:
    uint64_t v15 = 0;
    if ((v9 & 0x100000) != 0) {
      goto LABEL_128;
    }
    goto LABEL_138;
  }
LABEL_136:
  uint64_t v14 = 0;
  if ((v9 & 0x40000) == 0) {
    goto LABEL_137;
  }
LABEL_127:
  uint64_t v15 = 2654435761 * self->_diagErrorCode;
  if ((v9 & 0x100000) != 0)
  {
LABEL_128:
    uint64_t v16 = 2654435761 * self->_diagUnderlyingErrorCode;
    goto LABEL_139;
  }
LABEL_138:
  uint64_t v16 = 0;
LABEL_139:
  NSUInteger v17 = [(NSString *)self->_diagErrorDomain hash];
  NSUInteger v18 = [(NSString *)self->_diagUnderlyingErrorDomain hash];
  uint64_t v19 = (uint64_t)self->_has;
  if (v19)
  {
    uint64_t v20 = 2654435761 * self->_apfsAvailableSpace;
    if ((v19 & 4) != 0)
    {
LABEL_141:
      uint64_t v21 = 2654435761 * self->_apfsFlags;
      if ((v19 & 2) != 0) {
        goto LABEL_142;
      }
      goto LABEL_151;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((v19 & 4) != 0) {
      goto LABEL_141;
    }
  }
  uint64_t v21 = 0;
  if ((v19 & 2) != 0)
  {
LABEL_142:
    uint64_t v22 = 2654435761 * self->_apfsBlockSize;
    if ((v19 & 8) != 0) {
      goto LABEL_143;
    }
    goto LABEL_152;
  }
LABEL_151:
  uint64_t v22 = 0;
  if ((v19 & 8) != 0)
  {
LABEL_143:
    uint64_t v23 = 2654435761 * self->_apfsRole;
    if ((v19 & 0x400000000000) != 0) {
      goto LABEL_144;
    }
    goto LABEL_153;
  }
LABEL_152:
  uint64_t v23 = 0;
  if ((v19 & 0x400000000000) != 0)
  {
LABEL_144:
    uint64_t v24 = 2654435761 * self->_apfsEncrypted;
    if ((v19 & 0x1000000000) != 0) {
      goto LABEL_145;
    }
    goto LABEL_154;
  }
LABEL_153:
  uint64_t v24 = 0;
  if ((v19 & 0x1000000000) != 0)
  {
LABEL_145:
    uint64_t v25 = 2654435761 * self->_statDocID;
    if ((v19 & 0x2000000000) != 0) {
      goto LABEL_146;
    }
    goto LABEL_155;
  }
LABEL_154:
  uint64_t v25 = 0;
  if ((v19 & 0x2000000000) != 0)
  {
LABEL_146:
    uint64_t v26 = 2654435761 * self->_statLogicalSize;
    if ((v19 & 0x4000000000) != 0) {
      goto LABEL_147;
    }
LABEL_156:
    uint64_t v27 = 0;
    if ((v19 & 0x800000000) != 0) {
      goto LABEL_148;
    }
LABEL_157:
    uint64_t v28 = 0;
    return v94 ^ v95 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v86 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_155:
  uint64_t v26 = 0;
  if ((v19 & 0x4000000000) == 0) {
    goto LABEL_156;
  }
LABEL_147:
  uint64_t v27 = 2654435761 * self->_statPhysicalSize;
  if ((v19 & 0x800000000) == 0) {
    goto LABEL_157;
  }
LABEL_148:
  uint64_t v28 = 2654435761 * self->_statDirEntryCount;
  return v94 ^ v95 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v86 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  __int16 v5 = (uint64_t *)(v4 + 452);
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x2000000) != 0)
  {
    self->_itemNumber = *((void *)v4 + 26);
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v6 = *v5;
    if ((*v5 & 0x80000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x40000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_81;
    }
  }
  else if ((v6 & 0x80000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_itemType = *((_DWORD *)v4 + 96);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_4:
    if ((v6 & 0x800000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_dataProtectionClass = *((_DWORD *)v4 + 85);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_5:
    if ((v6 & 0x1000000000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_isOwnedByLoggedInUser = v4[433];
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x200000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_isOwnedByRoot = v4[434];
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x200000000000) == 0)
  {
LABEL_7:
    if ((v6 & 0x100000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_xattrCount = *((_DWORD *)v4 + 104);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x100000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_isAppleDouble = v4[430];
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v6 = *(void *)(v4 + 452);
  if ((v6 & 0x8000000000000000) == 0)
  {
LABEL_9:
    if ((v6 & 0x4000000000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_86:
  self->_isResourceFork = v4[437];
  *(void *)&self->_has |= 0x8000000000000000;
  if ((*(void *)(v4 + 452) & 0x4000000000000000) != 0)
  {
LABEL_10:
    self->_isQuarantined = v4[436];
    *(void *)&self->_has |= 0x4000000000000000uLL;
  }
LABEL_11:
  uint64_t v19 = v4;
  if (*((void *)v4 + 51))
  {
    -[AppTelemetryItemStatsInvestigation setUtType:](self, "setUtType:");
    uint64_t v4 = v19;
  }
  uint64_t v7 = *(void *)(v4 + 452);
  if ((v7 & 0x200000000000000) != 0)
  {
    self->_isBundleBit = v4[431];
    *(void *)&self->_has |= 0x200000000000000uLL;
    uint64_t v7 = *(void *)(v4 + 452);
  }
  __int16 v8 = *((_WORD *)v4 + 230);
  if (v8)
  {
    self->_isSparseFile = v4[438];
    *((_WORD *)&self->_has + 4) |= 1u;
    uint64_t v7 = *(void *)(v4 + 452);
    __int16 v8 = *((_WORD *)v4 + 230);
    if ((v7 & 0x20000000000) == 0)
    {
LABEL_17:
      if ((v7 & 0x100000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_90;
    }
  }
  else if ((v7 & 0x20000000000) == 0)
  {
    goto LABEL_17;
  }
  self->_compressionType = *((_DWORD *)v4 + 84);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_18:
    if ((v7 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_readErrorCode = *((void *)v4 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x20) == 0)
  {
LABEL_19:
    if ((v7 & 0x100000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_cloneErrorCode = *((void *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x100000000000) == 0)
  {
LABEL_20:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_syncRootEnum = *((_DWORD *)v4 + 100);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_pathLength = *((void *)v4 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x200000) == 0)
  {
LABEL_22:
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_fileNameLength = *((void *)v4 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_stMode = *((void *)v4 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_24:
    if ((v7 & 0x40000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_stFlags = *((void *)v4 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x40000000000000) == 0)
  {
LABEL_25:
    if ((v8 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_hasAcls = v4[428];
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v8 & 0x20) == 0)
  {
LABEL_26:
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_parentHasAcls = v4[443];
  *((_WORD *)&self->_has + 4) |= 0x20u;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v7 & 0x2000000000000000) == 0)
  {
LABEL_27:
    if ((v8 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_isPurgable = v4[435];
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v7 = *(void *)(v4 + 452);
  __int16 v8 = *((_WORD *)v4 + 230);
  if ((v8 & 4) == 0)
  {
LABEL_28:
    if ((v8 & 2) == 0) {
      goto LABEL_29;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_isUrgent = v4[440];
  *((_WORD *)&self->_has + 4) |= 4u;
  uint64_t v7 = *(void *)(v4 + 452);
  if ((*((_WORD *)v4 + 230) & 2) == 0)
  {
LABEL_29:
    if ((v7 & 0x400000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_101:
  self->_isUnderDirStatFolder = v4[439];
  *((_WORD *)&self->_has + 4) |= 2u;
  if ((*(void *)(v4 + 452) & 0x400000000000000) != 0)
  {
LABEL_30:
    self->_isFileNameNonAscii = v4[432];
    *(void *)&self->_has |= 0x400000000000000uLL;
  }
LABEL_31:
  if (*((void *)v4 + 47))
  {
    -[AppTelemetryItemStatsInvestigation setFinderInfoFlagsBase64:](self, "setFinderInfoFlagsBase64:");
    uint64_t v4 = v19;
  }
  uint64_t v9 = (uint64_t *)(v4 + 452);
  uint64_t v10 = *(void *)(v4 + 452);
  if ((v10 & 0x1000000) != 0)
  {
    self->_hasMoreLinks = *((void *)v4 + 25);
    *(void *)&self->_has |= 0x1000000uLL;
    uint64_t v10 = *v9;
    if ((*v9 & 0x400000) == 0)
    {
LABEL_35:
      if ((v10 & 0x8000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_105;
    }
  }
  else if ((v10 & 0x400000) == 0)
  {
    goto LABEL_35;
  }
  self->_fsGenCount = *((void *)v4 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v10 = *(void *)(v4 + 452);
  if ((v10 & 0x8000) == 0)
  {
LABEL_36:
    if ((v10 & 0x80000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_dbGenCount = *((void *)v4 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v10 = *(void *)(v4 + 452);
  if ((v10 & 0x80000000000000) == 0)
  {
LABEL_37:
    if ((v10 & 0x10000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_106:
  self->_hasLocalChanges = v4[429];
  *(void *)&self->_has |= 0x80000000000000uLL;
  if ((*(void *)(v4 + 452) & 0x10000000000000) != 0)
  {
LABEL_38:
    self->_doGenCountsMatchInFileId = v4[426];
    *(void *)&self->_has |= 0x10000000000000uLL;
  }
LABEL_39:
  if (*((void *)v4 + 46))
  {
    -[AppTelemetryItemStatsInvestigation setFileNameExtension:](self, "setFileNameExtension:");
    uint64_t v4 = v19;
  }
  if ((*(void *)(v4 + 452) & 0x8000000) != 0)
  {
    self->_pathDepth = *((void *)v4 + 28);
    *(void *)&self->_has |= 0x8000000uLL;
  }
  __int16 v11 = *((_WORD *)v4 + 230);
  if ((v11 & 0x200) != 0)
  {
    self->_xattrHasDemotion = v4[447];
    *((_WORD *)&self->_has + 4) |= 0x200u;
    __int16 v11 = *((_WORD *)v4 + 230);
  }
  if ((v11 & 0x400) != 0)
  {
    self->_xattrHasPromotion = v4[448];
    *((_WORD *)&self->_has + 4) |= 0x400u;
  }
  if (*((void *)v4 + 43))
  {
    -[AppTelemetryItemStatsInvestigation setDbErrorDomain:](self, "setDbErrorDomain:");
    uint64_t v4 = v19;
  }
  uint64_t v12 = *(void *)(v4 + 452);
  if ((v12 & 0x100) != 0)
  {
    self->_dbErrorCode = *((void *)v4 + 9);
    *(void *)&self->_has |= 0x100uLL;
    uint64_t v12 = *(void *)(v4 + 452);
  }
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x40) != 0)
  {
    self->_dbCapabilities = *((void *)v4 + 7);
    *(void *)&self->_has |= 0x40uLL;
    uint64_t v12 = *(void *)(v4 + 452);
    __int16 v13 = *((_WORD *)v4 + 230);
    if ((v12 & 0x20000) == 0)
    {
LABEL_53:
      if ((v12 & 0x10000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_110;
    }
  }
  else if ((v12 & 0x20000) == 0)
  {
    goto LABEL_53;
  }
  self->_dbTransferState = *((void *)v4 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x10000) == 0)
  {
LABEL_54:
    if ((v12 & 0x2000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_dbSharingState = *((void *)v4 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x2000000000000) == 0)
  {
LABEL_55:
    if ((v12 & 0x80) == 0) {
      goto LABEL_56;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_dbIsApplibrary = v4[423];
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x80) == 0)
  {
LABEL_56:
    if ((v12 & 0x4000000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_dbEffectiveContentPolicy = *((void *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x4000000000000) == 0)
  {
LABEL_57:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_dbIsPackage = v4[424];
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x1000) == 0)
  {
LABEL_58:
    if ((v12 & 0x200) == 0) {
      goto LABEL_59;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_dbFsContentStatus = *((void *)v4 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x200) == 0)
  {
LABEL_59:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_dbFpContentStatus = *((void *)v4 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x2000) == 0)
  {
LABEL_60:
    if ((v12 & 0x400) == 0) {
      goto LABEL_61;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_dbFsDeletionStatus = *((void *)v4 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x400) == 0)
  {
LABEL_61:
    if ((v12 & 0x4000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_dbFpDeletionStatus = *((void *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x4000) == 0)
  {
LABEL_62:
    if ((v12 & 0x800) == 0) {
      goto LABEL_63;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_dbFsImportStatus = *((void *)v4 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x800) == 0)
  {
LABEL_63:
    if ((v12 & 0x8000000000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_dbFpImportStatus = *((void *)v4 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x8000000000000) == 0)
  {
LABEL_64:
    if ((v12 & 0x800000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_dbIsSuper = v4[425];
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x800000) == 0)
  {
LABEL_65:
    if ((v13 & 0x40) == 0) {
      goto LABEL_66;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_gencountDiff = *((void *)v4 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v13 & 0x40) == 0)
  {
LABEL_66:
    if ((v12 & 0x800000000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_parentMatches = v4[444];
  *((_WORD *)&self->_has + 4) |= 0x40u;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x800000000000) == 0)
  {
LABEL_67:
    if ((v13 & 8) == 0) {
      goto LABEL_68;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_appLibraryMatches = v4[421];
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v13 & 8) == 0)
  {
LABEL_68:
    if ((v12 & 0x20000000000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_mTimeBeforeMigrationStarted = v4[441];
  *((_WORD *)&self->_has + 4) |= 8u;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x20000000000000) == 0)
  {
LABEL_69:
    if ((v12 & 0x4000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_docIDMatches = v4[427];
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x4000000) == 0)
  {
LABEL_70:
    if ((v12 & 0x10) == 0) {
      goto LABEL_71;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_mTime = *((void *)v4 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v12 = *(void *)(v4 + 452);
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((v12 & 0x10) == 0)
  {
LABEL_71:
    if ((v12 & 0x1000000000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_bTime = *((void *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  __int16 v13 = *((_WORD *)v4 + 230);
  if ((*(void *)(v4 + 452) & 0x1000000000000) == 0)
  {
LABEL_72:
    if ((v13 & 0x100) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_128:
  self->_bTimeIsBusy = v4[422];
  *(void *)&self->_has |= 0x1000000000000uLL;
  if ((*((_WORD *)v4 + 230) & 0x100) != 0)
  {
LABEL_73:
    self->_xattrHasBeforeBounce = v4[446];
    *((_WORD *)&self->_has + 4) |= 0x100u;
  }
LABEL_74:
  if (*((void *)v4 + 49))
  {
    -[AppTelemetryItemStatsInvestigation setNameUnicodeNorm:](self, "setNameUnicodeNorm:");
    uint64_t v4 = v19;
  }
  uint64_t v14 = (uint64_t *)(v4 + 452);
  __int16 v15 = *((_WORD *)v4 + 230);
  if ((v15 & 0x10) != 0)
  {
    self->_nameIsTrashed = v4[442];
    *((_WORD *)&self->_has + 4) |= 0x10u;
    uint64_t v16 = *v14;
    __int16 v15 = *((_WORD *)v4 + 230);
    if ((*v14 & 0x8000000000) == 0) {
      goto LABEL_132;
    }
    goto LABEL_131;
  }
  uint64_t v16 = *v14;
  if ((*v14 & 0x8000000000) != 0)
  {
LABEL_131:
    self->_sysPageSize = *((void *)v4 + 40);
    *(void *)&self->_has |= 0x8000000000uLL;
    uint64_t v16 = *(void *)(v4 + 452);
    __int16 v15 = *((_WORD *)v4 + 230);
  }
LABEL_132:
  if ((v16 & 0x10000000000) != 0)
  {
    self->_sysUID = *((void *)v4 + 41);
    *(void *)&self->_has |= 0x10000000000uLL;
    uint64_t v16 = *(void *)(v4 + 452);
    if ((*((_WORD *)v4 + 230) & 0x80) == 0)
    {
LABEL_134:
      if ((v16 & 0x40000000) == 0) {
        goto LABEL_135;
      }
      goto LABEL_160;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_134;
  }
  self->_sysDocIDResolutionOK = v4[445];
  *((_WORD *)&self->_has + 4) |= 0x80u;
  uint64_t v16 = *(void *)(v4 + 452);
  if ((v16 & 0x40000000) == 0)
  {
LABEL_135:
    if ((v16 & 0x20000000) == 0) {
      goto LABEL_136;
    }
    goto LABEL_161;
  }
LABEL_160:
  self->_purgeGenCount = *((void *)v4 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v16 = *(void *)(v4 + 452);
  if ((v16 & 0x20000000) == 0)
  {
LABEL_136:
    if ((v16 & 0x80000000) == 0) {
      goto LABEL_137;
    }
    goto LABEL_162;
  }
LABEL_161:
  self->_purgeATime = *((void *)v4 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v16 = *(void *)(v4 + 452);
  if ((v16 & 0x80000000) == 0)
  {
LABEL_137:
    if ((v16 & 0x80000) == 0) {
      goto LABEL_138;
    }
    goto LABEL_163;
  }
LABEL_162:
  self->_purgeSyncRoot = *((void *)v4 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v16 = *(void *)(v4 + 452);
  if ((v16 & 0x80000) == 0)
  {
LABEL_138:
    if ((v16 & 0x40000) == 0) {
      goto LABEL_139;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_diagFailuresBitmap = *((void *)v4 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v16 = *(void *)(v4 + 452);
  if ((v16 & 0x40000) == 0)
  {
LABEL_139:
    if ((v16 & 0x100000) == 0) {
      goto LABEL_141;
    }
    goto LABEL_140;
  }
LABEL_164:
  self->_diagErrorCode = *((void *)v4 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  if ((*(void *)(v4 + 452) & 0x100000) != 0)
  {
LABEL_140:
    self->_diagUnderlyingErrorCode = *((void *)v4 + 21);
    *(void *)&self->_has |= 0x100000uLL;
  }
LABEL_141:
  if (*((void *)v4 + 44))
  {
    -[AppTelemetryItemStatsInvestigation setDiagErrorDomain:](self, "setDiagErrorDomain:");
    uint64_t v4 = v19;
  }
  if (*((void *)v4 + 45))
  {
    -[AppTelemetryItemStatsInvestigation setDiagUnderlyingErrorDomain:](self, "setDiagUnderlyingErrorDomain:");
    uint64_t v4 = v19;
  }
  NSUInteger v17 = (uint64_t *)(v4 + 452);
  uint64_t v18 = *(void *)(v4 + 452);
  if (v18)
  {
    self->_apfsAvailableSpace = *((void *)v4 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v18 = *v17;
    if ((*v17 & 4) == 0)
    {
LABEL_147:
      if ((v18 & 2) == 0) {
        goto LABEL_148;
      }
      goto LABEL_168;
    }
  }
  else if ((v18 & 4) == 0)
  {
    goto LABEL_147;
  }
  self->_apfsFlags = *((void *)v4 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v18 = *(void *)(v4 + 452);
  if ((v18 & 2) == 0)
  {
LABEL_148:
    if ((v18 & 8) == 0) {
      goto LABEL_149;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_apfsBlockSize = *((void *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v18 = *(void *)(v4 + 452);
  if ((v18 & 8) == 0)
  {
LABEL_149:
    if ((v18 & 0x400000000000) == 0) {
      goto LABEL_150;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_apfsRole = *((void *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v18 = *(void *)(v4 + 452);
  if ((v18 & 0x400000000000) == 0)
  {
LABEL_150:
    if ((v18 & 0x1000000000) == 0) {
      goto LABEL_151;
    }
    goto LABEL_171;
  }
LABEL_170:
  self->_apfsEncrypted = v4[420];
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v18 = *(void *)(v4 + 452);
  if ((v18 & 0x1000000000) == 0)
  {
LABEL_151:
    if ((v18 & 0x2000000000) == 0) {
      goto LABEL_152;
    }
    goto LABEL_172;
  }
LABEL_171:
  self->_statDocID = *((void *)v4 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v18 = *(void *)(v4 + 452);
  if ((v18 & 0x2000000000) == 0)
  {
LABEL_152:
    if ((v18 & 0x4000000000) == 0) {
      goto LABEL_153;
    }
    goto LABEL_173;
  }
LABEL_172:
  self->_statLogicalSize = *((void *)v4 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v18 = *(void *)(v4 + 452);
  if ((v18 & 0x4000000000) == 0)
  {
LABEL_153:
    if ((v18 & 0x800000000) == 0) {
      goto LABEL_155;
    }
    goto LABEL_154;
  }
LABEL_173:
  self->_statPhysicalSize = *((void *)v4 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  if ((*(void *)(v4 + 452) & 0x800000000) != 0)
  {
LABEL_154:
    self->_statDirEntryCount = *((void *)v4 + 36);
    *(void *)&self->_has |= 0x800000000uLL;
  }
LABEL_155:
}

- (int64_t)itemNumber
{
  return self->_itemNumber;
}

- (int)itemType
{
  return self->_itemType;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)isOwnedByLoggedInUser
{
  return self->_isOwnedByLoggedInUser;
}

- (BOOL)isOwnedByRoot
{
  return self->_isOwnedByRoot;
}

- (int)xattrCount
{
  return self->_xattrCount;
}

- (BOOL)isAppleDouble
{
  return self->_isAppleDouble;
}

- (BOOL)isResourceFork
{
  return self->_isResourceFork;
}

- (BOOL)isQuarantined
{
  return self->_isQuarantined;
}

- (NSString)utType
{
  return self->_utType;
}

- (void)setUtType:(id)a3
{
}

- (BOOL)isBundleBit
{
  return self->_isBundleBit;
}

- (BOOL)isSparseFile
{
  return self->_isSparseFile;
}

- (int)compressionType
{
  return self->_compressionType;
}

- (int64_t)readErrorCode
{
  return self->_readErrorCode;
}

- (int64_t)cloneErrorCode
{
  return self->_cloneErrorCode;
}

- (int)syncRootEnum
{
  return self->_syncRootEnum;
}

- (int64_t)pathLength
{
  return self->_pathLength;
}

- (int64_t)fileNameLength
{
  return self->_fileNameLength;
}

- (int64_t)stMode
{
  return self->_stMode;
}

- (int64_t)stFlags
{
  return self->_stFlags;
}

- (BOOL)hasAcls
{
  return self->_hasAcls;
}

- (BOOL)parentHasAcls
{
  return self->_parentHasAcls;
}

- (BOOL)isPurgable
{
  return self->_isPurgable;
}

- (BOOL)isUrgent
{
  return self->_isUrgent;
}

- (BOOL)isUnderDirStatFolder
{
  return self->_isUnderDirStatFolder;
}

- (BOOL)isFileNameNonAscii
{
  return self->_isFileNameNonAscii;
}

- (NSString)finderInfoFlagsBase64
{
  return self->_finderInfoFlagsBase64;
}

- (void)setFinderInfoFlagsBase64:(id)a3
{
}

- (int64_t)hasMoreLinks
{
  return self->_hasMoreLinks;
}

- (int64_t)fsGenCount
{
  return self->_fsGenCount;
}

- (int64_t)dbGenCount
{
  return self->_dbGenCount;
}

- (BOOL)hasLocalChanges
{
  return self->_hasLocalChanges;
}

- (BOOL)doGenCountsMatchInFileId
{
  return self->_doGenCountsMatchInFileId;
}

- (NSString)fileNameExtension
{
  return self->_fileNameExtension;
}

- (void)setFileNameExtension:(id)a3
{
}

- (int64_t)pathDepth
{
  return self->_pathDepth;
}

- (BOOL)xattrHasDemotion
{
  return self->_xattrHasDemotion;
}

- (BOOL)xattrHasPromotion
{
  return self->_xattrHasPromotion;
}

- (NSString)dbErrorDomain
{
  return self->_dbErrorDomain;
}

- (void)setDbErrorDomain:(id)a3
{
}

- (int64_t)dbErrorCode
{
  return self->_dbErrorCode;
}

- (int64_t)dbCapabilities
{
  return self->_dbCapabilities;
}

- (int64_t)dbTransferState
{
  return self->_dbTransferState;
}

- (int64_t)dbSharingState
{
  return self->_dbSharingState;
}

- (BOOL)dbIsApplibrary
{
  return self->_dbIsApplibrary;
}

- (int64_t)dbEffectiveContentPolicy
{
  return self->_dbEffectiveContentPolicy;
}

- (BOOL)dbIsPackage
{
  return self->_dbIsPackage;
}

- (int64_t)dbFsContentStatus
{
  return self->_dbFsContentStatus;
}

- (int64_t)dbFpContentStatus
{
  return self->_dbFpContentStatus;
}

- (int64_t)dbFsDeletionStatus
{
  return self->_dbFsDeletionStatus;
}

- (int64_t)dbFpDeletionStatus
{
  return self->_dbFpDeletionStatus;
}

- (int64_t)dbFsImportStatus
{
  return self->_dbFsImportStatus;
}

- (int64_t)dbFpImportStatus
{
  return self->_dbFpImportStatus;
}

- (BOOL)dbIsSuper
{
  return self->_dbIsSuper;
}

- (int64_t)gencountDiff
{
  return self->_gencountDiff;
}

- (BOOL)parentMatches
{
  return self->_parentMatches;
}

- (BOOL)appLibraryMatches
{
  return self->_appLibraryMatches;
}

- (BOOL)mTimeBeforeMigrationStarted
{
  return self->_mTimeBeforeMigrationStarted;
}

- (BOOL)docIDMatches
{
  return self->_docIDMatches;
}

- (int64_t)mTime
{
  return self->_mTime;
}

- (int64_t)bTime
{
  return self->_bTime;
}

- (BOOL)bTimeIsBusy
{
  return self->_bTimeIsBusy;
}

- (BOOL)xattrHasBeforeBounce
{
  return self->_xattrHasBeforeBounce;
}

- (NSString)nameUnicodeNorm
{
  return self->_nameUnicodeNorm;
}

- (void)setNameUnicodeNorm:(id)a3
{
}

- (BOOL)nameIsTrashed
{
  return self->_nameIsTrashed;
}

- (int64_t)sysPageSize
{
  return self->_sysPageSize;
}

- (int64_t)sysUID
{
  return self->_sysUID;
}

- (BOOL)sysDocIDResolutionOK
{
  return self->_sysDocIDResolutionOK;
}

- (int64_t)purgeGenCount
{
  return self->_purgeGenCount;
}

- (int64_t)purgeATime
{
  return self->_purgeATime;
}

- (int64_t)purgeSyncRoot
{
  return self->_purgeSyncRoot;
}

- (int64_t)diagFailuresBitmap
{
  return self->_diagFailuresBitmap;
}

- (int64_t)diagErrorCode
{
  return self->_diagErrorCode;
}

- (int64_t)diagUnderlyingErrorCode
{
  return self->_diagUnderlyingErrorCode;
}

- (NSString)diagErrorDomain
{
  return self->_diagErrorDomain;
}

- (void)setDiagErrorDomain:(id)a3
{
}

- (NSString)diagUnderlyingErrorDomain
{
  return self->_diagUnderlyingErrorDomain;
}

- (void)setDiagUnderlyingErrorDomain:(id)a3
{
}

- (int64_t)apfsAvailableSpace
{
  return self->_apfsAvailableSpace;
}

- (int64_t)apfsFlags
{
  return self->_apfsFlags;
}

- (int64_t)apfsBlockSize
{
  return self->_apfsBlockSize;
}

- (int64_t)apfsRole
{
  return self->_apfsRole;
}

- (BOOL)apfsEncrypted
{
  return self->_apfsEncrypted;
}

- (int64_t)statDocID
{
  return self->_statDocID;
}

- (int64_t)statLogicalSize
{
  return self->_statLogicalSize;
}

- (int64_t)statPhysicalSize
{
  return self->_statPhysicalSize;
}

- (int64_t)statDirEntryCount
{
  return self->_statDirEntryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utType, 0);
  objc_storeStrong((id *)&self->_nameUnicodeNorm, 0);
  objc_storeStrong((id *)&self->_finderInfoFlagsBase64, 0);
  objc_storeStrong((id *)&self->_fileNameExtension, 0);
  objc_storeStrong((id *)&self->_diagUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_diagErrorDomain, 0);
  objc_storeStrong((id *)&self->_dbErrorDomain, 0);
}

@end