@interface HDCloudSyncCacheValidation
- (int64_t)changeRecordsInCache;
- (int64_t)changeRecordsInCloud;
- (int64_t)dataUploadRequestRecordInCache;
- (int64_t)dataUploadRequestRecordInCloud;
- (int64_t)individualSyncZonesInCache;
- (int64_t)individualSyncZonesInCloud;
- (int64_t)masterRecordsInCache;
- (int64_t)masterRecordsInCloud;
- (int64_t)masterZonesInCache;
- (int64_t)masterZonesInCloud;
- (int64_t)medicalIDRecordsInCache;
- (int64_t)medicalIDRecordsInCloud;
- (int64_t)registryRecordsInCache;
- (int64_t)registryRecordsInCloud;
- (int64_t)sequenceRecordsInCache;
- (int64_t)sequenceRecordsInCloud;
- (int64_t)sharedSummaryAuthRecordInCache;
- (int64_t)sharedSummaryAuthRecordInCloud;
- (int64_t)sharedSummaryParticipantRecordInCache;
- (int64_t)sharedSummaryParticipantRecordInCloud;
- (int64_t)sharedSummaryRecordInCache;
- (int64_t)sharedSummaryRecordInCloud;
- (int64_t)sharedSummaryRelationshipRecordInCache;
- (int64_t)sharedSummaryRelationshipRecordInCloud;
- (int64_t)sharedSummaryTransactionRecordInCache;
- (int64_t)sharedSummaryTransactionRecordInCloud;
- (int64_t)sharedSummaryZonesInCache;
- (int64_t)sharedSummaryZonesInCloud;
- (int64_t)storeRecordsInCache;
- (int64_t)storeRecordsInCloud;
- (int64_t)unifiedZonesInCache;
- (int64_t)unifiedZonesInCloud;
- (void)setChangeRecordsInCache:(int64_t)a3;
- (void)setChangeRecordsInCloud:(int64_t)a3;
- (void)setDataUploadRequestRecordInCache:(int64_t)a3;
- (void)setDataUploadRequestRecordInCloud:(int64_t)a3;
- (void)setIndividualSyncZonesInCache:(int64_t)a3;
- (void)setIndividualSyncZonesInCloud:(int64_t)a3;
- (void)setMasterRecordsInCache:(int64_t)a3;
- (void)setMasterRecordsInCloud:(int64_t)a3;
- (void)setMasterZonesInCache:(int64_t)a3;
- (void)setMasterZonesInCloud:(int64_t)a3;
- (void)setMedicalIDRecordsInCache:(int64_t)a3;
- (void)setMedicalIDRecordsInCloud:(int64_t)a3;
- (void)setRegistryRecordsInCache:(int64_t)a3;
- (void)setRegistryRecordsInCloud:(int64_t)a3;
- (void)setSequenceRecordsInCache:(int64_t)a3;
- (void)setSequenceRecordsInCloud:(int64_t)a3;
- (void)setSharedSummaryAuthRecordInCache:(int64_t)a3;
- (void)setSharedSummaryAuthRecordInCloud:(int64_t)a3;
- (void)setSharedSummaryParticipantRecordInCache:(int64_t)a3;
- (void)setSharedSummaryParticipantRecordInCloud:(int64_t)a3;
- (void)setSharedSummaryRecordInCache:(int64_t)a3;
- (void)setSharedSummaryRecordInCloud:(int64_t)a3;
- (void)setSharedSummaryRelationshipRecordInCache:(int64_t)a3;
- (void)setSharedSummaryRelationshipRecordInCloud:(int64_t)a3;
- (void)setSharedSummaryTransactionRecordInCache:(int64_t)a3;
- (void)setSharedSummaryTransactionRecordInCloud:(int64_t)a3;
- (void)setSharedSummaryZonesInCache:(int64_t)a3;
- (void)setSharedSummaryZonesInCloud:(int64_t)a3;
- (void)setStoreRecordsInCache:(int64_t)a3;
- (void)setStoreRecordsInCloud:(int64_t)a3;
- (void)setUnifiedZonesInCache:(int64_t)a3;
- (void)setUnifiedZonesInCloud:(int64_t)a3;
@end

@implementation HDCloudSyncCacheValidation

- (int64_t)individualSyncZonesInCloud
{
  return self->_individualSyncZonesInCloud;
}

- (void)setIndividualSyncZonesInCloud:(int64_t)a3
{
  self->_individualSyncZonesInCloud = a3;
}

- (int64_t)masterZonesInCloud
{
  return self->_masterZonesInCloud;
}

- (void)setMasterZonesInCloud:(int64_t)a3
{
  self->_masterZonesInCloud = a3;
}

- (int64_t)unifiedZonesInCloud
{
  return self->_unifiedZonesInCloud;
}

- (void)setUnifiedZonesInCloud:(int64_t)a3
{
  self->_unifiedZonesInCloud = a3;
}

- (int64_t)sharedSummaryZonesInCloud
{
  return self->_sharedSummaryZonesInCloud;
}

- (void)setSharedSummaryZonesInCloud:(int64_t)a3
{
  self->_sharedSummaryZonesInCloud = a3;
}

- (int64_t)individualSyncZonesInCache
{
  return self->_individualSyncZonesInCache;
}

- (void)setIndividualSyncZonesInCache:(int64_t)a3
{
  self->_individualSyncZonesInCache = a3;
}

- (int64_t)masterZonesInCache
{
  return self->_masterZonesInCache;
}

- (void)setMasterZonesInCache:(int64_t)a3
{
  self->_masterZonesInCache = a3;
}

- (int64_t)unifiedZonesInCache
{
  return self->_unifiedZonesInCache;
}

- (void)setUnifiedZonesInCache:(int64_t)a3
{
  self->_unifiedZonesInCache = a3;
}

- (int64_t)sharedSummaryZonesInCache
{
  return self->_sharedSummaryZonesInCache;
}

- (void)setSharedSummaryZonesInCache:(int64_t)a3
{
  self->_sharedSummaryZonesInCache = a3;
}

- (int64_t)storeRecordsInCloud
{
  return self->_storeRecordsInCloud;
}

- (void)setStoreRecordsInCloud:(int64_t)a3
{
  self->_storeRecordsInCloud = a3;
}

- (int64_t)sequenceRecordsInCloud
{
  return self->_sequenceRecordsInCloud;
}

- (void)setSequenceRecordsInCloud:(int64_t)a3
{
  self->_sequenceRecordsInCloud = a3;
}

- (int64_t)medicalIDRecordsInCloud
{
  return self->_medicalIDRecordsInCloud;
}

- (void)setMedicalIDRecordsInCloud:(int64_t)a3
{
  self->_medicalIDRecordsInCloud = a3;
}

- (int64_t)changeRecordsInCloud
{
  return self->_changeRecordsInCloud;
}

- (void)setChangeRecordsInCloud:(int64_t)a3
{
  self->_changeRecordsInCloud = a3;
}

- (int64_t)registryRecordsInCloud
{
  return self->_registryRecordsInCloud;
}

- (void)setRegistryRecordsInCloud:(int64_t)a3
{
  self->_registryRecordsInCloud = a3;
}

- (int64_t)masterRecordsInCloud
{
  return self->_masterRecordsInCloud;
}

- (void)setMasterRecordsInCloud:(int64_t)a3
{
  self->_masterRecordsInCloud = a3;
}

- (int64_t)dataUploadRequestRecordInCloud
{
  return self->_dataUploadRequestRecordInCloud;
}

- (void)setDataUploadRequestRecordInCloud:(int64_t)a3
{
  self->_dataUploadRequestRecordInCloud = a3;
}

- (int64_t)sharedSummaryAuthRecordInCloud
{
  return self->_sharedSummaryAuthRecordInCloud;
}

- (void)setSharedSummaryAuthRecordInCloud:(int64_t)a3
{
  self->_sharedSummaryAuthRecordInCloud = a3;
}

- (int64_t)sharedSummaryParticipantRecordInCloud
{
  return self->_sharedSummaryParticipantRecordInCloud;
}

- (void)setSharedSummaryParticipantRecordInCloud:(int64_t)a3
{
  self->_sharedSummaryParticipantRecordInCloud = a3;
}

- (int64_t)sharedSummaryRelationshipRecordInCloud
{
  return self->_sharedSummaryRelationshipRecordInCloud;
}

- (void)setSharedSummaryRelationshipRecordInCloud:(int64_t)a3
{
  self->_sharedSummaryRelationshipRecordInCloud = a3;
}

- (int64_t)sharedSummaryRecordInCloud
{
  return self->_sharedSummaryRecordInCloud;
}

- (void)setSharedSummaryRecordInCloud:(int64_t)a3
{
  self->_sharedSummaryRecordInCloud = a3;
}

- (int64_t)sharedSummaryTransactionRecordInCloud
{
  return self->_sharedSummaryTransactionRecordInCloud;
}

- (void)setSharedSummaryTransactionRecordInCloud:(int64_t)a3
{
  self->_sharedSummaryTransactionRecordInCloud = a3;
}

- (int64_t)storeRecordsInCache
{
  return self->_storeRecordsInCache;
}

- (void)setStoreRecordsInCache:(int64_t)a3
{
  self->_storeRecordsInCache = a3;
}

- (int64_t)sequenceRecordsInCache
{
  return self->_sequenceRecordsInCache;
}

- (void)setSequenceRecordsInCache:(int64_t)a3
{
  self->_sequenceRecordsInCache = a3;
}

- (int64_t)medicalIDRecordsInCache
{
  return self->_medicalIDRecordsInCache;
}

- (void)setMedicalIDRecordsInCache:(int64_t)a3
{
  self->_medicalIDRecordsInCache = a3;
}

- (int64_t)changeRecordsInCache
{
  return self->_changeRecordsInCache;
}

- (void)setChangeRecordsInCache:(int64_t)a3
{
  self->_changeRecordsInCache = a3;
}

- (int64_t)registryRecordsInCache
{
  return self->_registryRecordsInCache;
}

- (void)setRegistryRecordsInCache:(int64_t)a3
{
  self->_registryRecordsInCache = a3;
}

- (int64_t)masterRecordsInCache
{
  return self->_masterRecordsInCache;
}

- (void)setMasterRecordsInCache:(int64_t)a3
{
  self->_masterRecordsInCache = a3;
}

- (int64_t)dataUploadRequestRecordInCache
{
  return self->_dataUploadRequestRecordInCache;
}

- (void)setDataUploadRequestRecordInCache:(int64_t)a3
{
  self->_dataUploadRequestRecordInCache = a3;
}

- (int64_t)sharedSummaryAuthRecordInCache
{
  return self->_sharedSummaryAuthRecordInCache;
}

- (void)setSharedSummaryAuthRecordInCache:(int64_t)a3
{
  self->_sharedSummaryAuthRecordInCache = a3;
}

- (int64_t)sharedSummaryParticipantRecordInCache
{
  return self->_sharedSummaryParticipantRecordInCache;
}

- (void)setSharedSummaryParticipantRecordInCache:(int64_t)a3
{
  self->_sharedSummaryParticipantRecordInCache = a3;
}

- (int64_t)sharedSummaryRelationshipRecordInCache
{
  return self->_sharedSummaryRelationshipRecordInCache;
}

- (void)setSharedSummaryRelationshipRecordInCache:(int64_t)a3
{
  self->_sharedSummaryRelationshipRecordInCache = a3;
}

- (int64_t)sharedSummaryRecordInCache
{
  return self->_sharedSummaryRecordInCache;
}

- (void)setSharedSummaryRecordInCache:(int64_t)a3
{
  self->_sharedSummaryRecordInCache = a3;
}

- (int64_t)sharedSummaryTransactionRecordInCache
{
  return self->_sharedSummaryTransactionRecordInCache;
}

- (void)setSharedSummaryTransactionRecordInCache:(int64_t)a3
{
  self->_sharedSummaryTransactionRecordInCache = a3;
}

@end