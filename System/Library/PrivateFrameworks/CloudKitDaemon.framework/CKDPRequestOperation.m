@interface CKDPRequestOperation
- (BOOL)hasAdopterCapabilitiesCheckRequest;
- (BOOL)hasAdopterCapabilitiesSaveRequest;
- (BOOL)hasAnonymousShareAddRequest;
- (BOOL)hasAnonymousShareRemoveRequest;
- (BOOL)hasArchiveRecordsRequest;
- (BOOL)hasAssetUploadTokenRetrieveRequest;
- (BOOL)hasBundlesForContainerRequest;
- (BOOL)hasDeleteContainerRequest;
- (BOOL)hasFetchArchivedRecordsRequest;
- (BOOL)hasFunctionInvokeRequest;
- (BOOL)hasHeader;
- (BOOL)hasMarkAssetBrokenRequest;
- (BOOL)hasMergeableDeltaMetadataRetrieveRequest;
- (BOOL)hasMergeableDeltaReplaceRequest;
- (BOOL)hasMergeableDeltaRetrieveRequest;
- (BOOL)hasMergeableDeltaSaveRequest;
- (BOOL)hasNotificationMarkReadRequest;
- (BOOL)hasNotificationSyncRequest;
- (BOOL)hasQueryRetrieveRequest;
- (BOOL)hasRecordDeleteRequest;
- (BOOL)hasRecordMoveRequest;
- (BOOL)hasRecordResolveTokenRequest;
- (BOOL)hasRecordRetrieveChangesRequest;
- (BOOL)hasRecordRetrieveRequest;
- (BOOL)hasRecordRetrieveVersionsRequest;
- (BOOL)hasRecordSaveRequest;
- (BOOL)hasRequest;
- (BOOL)hasSetBadgeCountRequest;
- (BOOL)hasShareAcceptRequest;
- (BOOL)hasShareAccessRequest;
- (BOOL)hasShareDeclineRequest;
- (BOOL)hasShareUsageSaveRequest;
- (BOOL)hasShareVettingInitiateRequest;
- (BOOL)hasSubscriptionCreateRequest;
- (BOOL)hasSubscriptionDeleteRequest;
- (BOOL)hasSubscriptionRetrieveRequest;
- (BOOL)hasTokenRegistrationRequest;
- (BOOL)hasTokenUnregistrationRequest;
- (BOOL)hasUpdateMissingAssetStatusRequest;
- (BOOL)hasUserAvailableQuotaRequest;
- (BOOL)hasUserPrivacySettingsBatchLookupRequest;
- (BOOL)hasUserPrivacySettingsResetRequest;
- (BOOL)hasUserPrivacySettingsRetrieveRequest;
- (BOOL)hasUserPrivacySettingsUpdateRequest;
- (BOOL)hasUserQueryRequest;
- (BOOL)hasUserRetrieveRequest;
- (BOOL)hasWebAuthTokenRetrieveRequest;
- (BOOL)hasZoneDeleteRequest;
- (BOOL)hasZoneRetrieveChangesRequest;
- (BOOL)hasZoneRetrieveRequest;
- (BOOL)hasZoneSaveRequest;
- (BOOL)hasZoneUsageSaveRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAdopterCapabilitiesCheckRequest)adopterCapabilitiesCheckRequest;
- (CKDPAdopterCapabilitiesSaveRequest)adopterCapabilitiesSaveRequest;
- (CKDPAnonymousShareAddRequest)anonymousShareAddRequest;
- (CKDPAnonymousShareRemoveRequest)anonymousShareRemoveRequest;
- (CKDPArchiveRecordsRequest)archiveRecordsRequest;
- (CKDPAssetUploadTokenRetrieveRequest)assetUploadTokenRetrieveRequest;
- (CKDPBundlesForContainerRequest)bundlesForContainerRequest;
- (CKDPCodeFunctionInvokeRequest)functionInvokeRequest;
- (CKDPDeleteContainerRequest)deleteContainerRequest;
- (CKDPFetchArchivedRecordsRequest)fetchArchivedRecordsRequest;
- (CKDPMarkAssetBrokenRequest)markAssetBrokenRequest;
- (CKDPMergeableDeltaMetadataRetrieveRequest)mergeableDeltaMetadataRetrieveRequest;
- (CKDPMergeableDeltaReplaceRequest)mergeableDeltaReplaceRequest;
- (CKDPMergeableDeltaRetrieveRequest)mergeableDeltaRetrieveRequest;
- (CKDPMergeableDeltaSaveRequest)mergeableDeltaSaveRequest;
- (CKDPNotificationMarkReadRequest)notificationMarkReadRequest;
- (CKDPNotificationSyncRequest)notificationSyncRequest;
- (CKDPOperation)request;
- (CKDPQueryRetrieveRequest)queryRetrieveRequest;
- (CKDPRecordDeleteRequest)recordDeleteRequest;
- (CKDPRecordMoveRequest)recordMoveRequest;
- (CKDPRecordResolveTokenRequest)recordResolveTokenRequest;
- (CKDPRecordRetrieveChangesRequest)recordRetrieveChangesRequest;
- (CKDPRecordRetrieveRequest)recordRetrieveRequest;
- (CKDPRecordRetrieveVersionsRequest)recordRetrieveVersionsRequest;
- (CKDPRecordSaveRequest)recordSaveRequest;
- (CKDPRequestOperationHeader)header;
- (CKDPSetBadgeCountRequest)setBadgeCountRequest;
- (CKDPShareAcceptRequest)shareAcceptRequest;
- (CKDPShareAccessRequest)shareAccessRequest;
- (CKDPShareDeclineRequest)shareDeclineRequest;
- (CKDPShareUsageSaveRequest)shareUsageSaveRequest;
- (CKDPShareVettingInitiateRequest)shareVettingInitiateRequest;
- (CKDPSubscriptionCreateRequest)subscriptionCreateRequest;
- (CKDPSubscriptionDeleteRequest)subscriptionDeleteRequest;
- (CKDPSubscriptionRetrieveRequest)subscriptionRetrieveRequest;
- (CKDPTokenRegistrationRequest)tokenRegistrationRequest;
- (CKDPTokenUnregistrationRequest)tokenUnregistrationRequest;
- (CKDPUpdateMissingAssetStatusRequest)updateMissingAssetStatusRequest;
- (CKDPUserAvailableQuotaRequest)userAvailableQuotaRequest;
- (CKDPUserPrivacySettingsBatchLookupRequest)userPrivacySettingsBatchLookupRequest;
- (CKDPUserPrivacySettingsResetRequest)userPrivacySettingsResetRequest;
- (CKDPUserPrivacySettingsRetrieveRequest)userPrivacySettingsRetrieveRequest;
- (CKDPUserPrivacySettingsUpdateRequest)userPrivacySettingsUpdateRequest;
- (CKDPUserQueryRequest)userQueryRequest;
- (CKDPUserRetrieveRequest)userRetrieveRequest;
- (CKDPWebAuthTokenRetrieveRequest)webAuthTokenRetrieveRequest;
- (CKDPZoneDeleteRequest)zoneDeleteRequest;
- (CKDPZoneRetrieveChangesRequest)zoneRetrieveChangesRequest;
- (CKDPZoneRetrieveRequest)zoneRetrieveRequest;
- (CKDPZoneSaveRequest)zoneSaveRequest;
- (CKDPZoneUsageSaveRequest)zoneUsageSaveRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopterCapabilitiesCheckRequest:(id)a3;
- (void)setAdopterCapabilitiesSaveRequest:(id)a3;
- (void)setAnonymousShareAddRequest:(id)a3;
- (void)setAnonymousShareRemoveRequest:(id)a3;
- (void)setArchiveRecordsRequest:(id)a3;
- (void)setAssetUploadTokenRetrieveRequest:(id)a3;
- (void)setBundlesForContainerRequest:(id)a3;
- (void)setDeleteContainerRequest:(id)a3;
- (void)setFetchArchivedRecordsRequest:(id)a3;
- (void)setFunctionInvokeRequest:(id)a3;
- (void)setHeader:(id)a3;
- (void)setMarkAssetBrokenRequest:(id)a3;
- (void)setMergeableDeltaMetadataRetrieveRequest:(id)a3;
- (void)setMergeableDeltaReplaceRequest:(id)a3;
- (void)setMergeableDeltaRetrieveRequest:(id)a3;
- (void)setMergeableDeltaSaveRequest:(id)a3;
- (void)setNotificationMarkReadRequest:(id)a3;
- (void)setNotificationSyncRequest:(id)a3;
- (void)setQueryRetrieveRequest:(id)a3;
- (void)setRecordDeleteRequest:(id)a3;
- (void)setRecordMoveRequest:(id)a3;
- (void)setRecordResolveTokenRequest:(id)a3;
- (void)setRecordRetrieveChangesRequest:(id)a3;
- (void)setRecordRetrieveRequest:(id)a3;
- (void)setRecordRetrieveVersionsRequest:(id)a3;
- (void)setRecordSaveRequest:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSetBadgeCountRequest:(id)a3;
- (void)setShareAcceptRequest:(id)a3;
- (void)setShareAccessRequest:(id)a3;
- (void)setShareDeclineRequest:(id)a3;
- (void)setShareUsageSaveRequest:(id)a3;
- (void)setShareVettingInitiateRequest:(id)a3;
- (void)setSubscriptionCreateRequest:(id)a3;
- (void)setSubscriptionDeleteRequest:(id)a3;
- (void)setSubscriptionRetrieveRequest:(id)a3;
- (void)setTokenRegistrationRequest:(id)a3;
- (void)setTokenUnregistrationRequest:(id)a3;
- (void)setUpdateMissingAssetStatusRequest:(id)a3;
- (void)setUserAvailableQuotaRequest:(id)a3;
- (void)setUserPrivacySettingsBatchLookupRequest:(id)a3;
- (void)setUserPrivacySettingsResetRequest:(id)a3;
- (void)setUserPrivacySettingsRetrieveRequest:(id)a3;
- (void)setUserPrivacySettingsUpdateRequest:(id)a3;
- (void)setUserQueryRequest:(id)a3;
- (void)setUserRetrieveRequest:(id)a3;
- (void)setWebAuthTokenRetrieveRequest:(id)a3;
- (void)setZoneDeleteRequest:(id)a3;
- (void)setZoneRetrieveChangesRequest:(id)a3;
- (void)setZoneRetrieveRequest:(id)a3;
- (void)setZoneSaveRequest:(id)a3;
- (void)setZoneUsageSaveRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRequestOperation

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRequestOperation;
  v4 = [(CKDPRequestOperation *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  header = self->_header;
  if (header)
  {
    v8 = objc_msgSend_dictionaryRepresentation(header, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"header");
  }
  request = self->_request;
  if (request)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(request, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"request");
  }
  functionInvokeRequest = self->_functionInvokeRequest;
  if (functionInvokeRequest)
  {
    v14 = objc_msgSend_dictionaryRepresentation(functionInvokeRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"functionInvokeRequest");
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  if (mergeableDeltaSaveRequest)
  {
    v17 = objc_msgSend_dictionaryRepresentation(mergeableDeltaSaveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"mergeableDeltaSaveRequest");
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  if (mergeableDeltaMetadataRetrieveRequest)
  {
    v20 = objc_msgSend_dictionaryRepresentation(mergeableDeltaMetadataRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"mergeableDeltaMetadataRetrieveRequest");
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  if (mergeableDeltaReplaceRequest)
  {
    v23 = objc_msgSend_dictionaryRepresentation(mergeableDeltaReplaceRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, @"mergeableDeltaReplaceRequest");
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  if (mergeableDeltaRetrieveRequest)
  {
    v26 = objc_msgSend_dictionaryRepresentation(mergeableDeltaRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"mergeableDeltaRetrieveRequest");
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  if (shareVettingInitiateRequest)
  {
    v29 = objc_msgSend_dictionaryRepresentation(shareVettingInitiateRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, @"shareVettingInitiateRequest");
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  if (zoneSaveRequest)
  {
    v32 = objc_msgSend_dictionaryRepresentation(zoneSaveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, @"zoneSaveRequest");
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  if (zoneRetrieveRequest)
  {
    v35 = objc_msgSend_dictionaryRepresentation(zoneRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v35, @"zoneRetrieveRequest");
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  if (zoneDeleteRequest)
  {
    v38 = objc_msgSend_dictionaryRepresentation(zoneDeleteRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v38, @"zoneDeleteRequest");
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  if (zoneRetrieveChangesRequest)
  {
    v41 = objc_msgSend_dictionaryRepresentation(zoneRetrieveChangesRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, @"zoneRetrieveChangesRequest");
  }
  recordSaveRequest = self->_recordSaveRequest;
  if (recordSaveRequest)
  {
    v44 = objc_msgSend_dictionaryRepresentation(recordSaveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v45, (uint64_t)v44, @"recordSaveRequest");
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  if (recordRetrieveRequest)
  {
    v47 = objc_msgSend_dictionaryRepresentation(recordRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v48, (uint64_t)v47, @"recordRetrieveRequest");
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  if (recordRetrieveVersionsRequest)
  {
    v50 = objc_msgSend_dictionaryRepresentation(recordRetrieveVersionsRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v50, @"recordRetrieveVersionsRequest");
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  if (recordRetrieveChangesRequest)
  {
    v53 = objc_msgSend_dictionaryRepresentation(recordRetrieveChangesRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v54, (uint64_t)v53, @"recordRetrieveChangesRequest");
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  if (recordDeleteRequest)
  {
    v56 = objc_msgSend_dictionaryRepresentation(recordDeleteRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v57, (uint64_t)v56, @"recordDeleteRequest");
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  if (recordResolveTokenRequest)
  {
    v59 = objc_msgSend_dictionaryRepresentation(recordResolveTokenRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v60, (uint64_t)v59, @"recordResolveTokenRequest");
  }
  shareAccessRequest = self->_shareAccessRequest;
  if (shareAccessRequest)
  {
    v62 = objc_msgSend_dictionaryRepresentation(shareAccessRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v62, @"shareAccessRequest");
  }
  recordMoveRequest = self->_recordMoveRequest;
  if (recordMoveRequest)
  {
    v65 = objc_msgSend_dictionaryRepresentation(recordMoveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v66, (uint64_t)v65, @"recordMoveRequest");
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  if (fetchArchivedRecordsRequest)
  {
    v68 = objc_msgSend_dictionaryRepresentation(fetchArchivedRecordsRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v69, (uint64_t)v68, @"fetchArchivedRecordsRequest");
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  if (userAvailableQuotaRequest)
  {
    v71 = objc_msgSend_dictionaryRepresentation(userAvailableQuotaRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v72, (uint64_t)v71, @"userAvailableQuotaRequest");
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  if (userRetrieveRequest)
  {
    v74 = objc_msgSend_dictionaryRepresentation(userRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v75, (uint64_t)v74, @"userRetrieveRequest");
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  if (queryRetrieveRequest)
  {
    v77 = objc_msgSend_dictionaryRepresentation(queryRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v77, @"queryRetrieveRequest");
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  if (assetUploadTokenRetrieveRequest)
  {
    v80 = objc_msgSend_dictionaryRepresentation(assetUploadTokenRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v81, (uint64_t)v80, @"assetUploadTokenRetrieveRequest");
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  if (deleteContainerRequest)
  {
    v83 = objc_msgSend_dictionaryRepresentation(deleteContainerRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v84, (uint64_t)v83, @"deleteContainerRequest");
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  if (bundlesForContainerRequest)
  {
    v86 = objc_msgSend_dictionaryRepresentation(bundlesForContainerRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v87, (uint64_t)v86, @"bundlesForContainerRequest");
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  if (webAuthTokenRetrieveRequest)
  {
    v89 = objc_msgSend_dictionaryRepresentation(webAuthTokenRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v90, (uint64_t)v89, @"webAuthTokenRetrieveRequest");
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  if (updateMissingAssetStatusRequest)
  {
    v92 = objc_msgSend_dictionaryRepresentation(updateMissingAssetStatusRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v93, (uint64_t)v92, @"updateMissingAssetStatusRequest");
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  if (shareAcceptRequest)
  {
    v95 = objc_msgSend_dictionaryRepresentation(shareAcceptRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v96, (uint64_t)v95, @"shareAcceptRequest");
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  if (shareDeclineRequest)
  {
    v98 = objc_msgSend_dictionaryRepresentation(shareDeclineRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v99, (uint64_t)v98, @"shareDeclineRequest");
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  if (anonymousShareAddRequest)
  {
    v101 = objc_msgSend_dictionaryRepresentation(anonymousShareAddRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v102, (uint64_t)v101, @"anonymousShareAddRequest");
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  if (anonymousShareRemoveRequest)
  {
    v104 = objc_msgSend_dictionaryRepresentation(anonymousShareRemoveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v105, (uint64_t)v104, @"anonymousShareRemoveRequest");
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  if (subscriptionCreateRequest)
  {
    v107 = objc_msgSend_dictionaryRepresentation(subscriptionCreateRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v108, (uint64_t)v107, @"subscriptionCreateRequest");
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  if (subscriptionRetrieveRequest)
  {
    v110 = objc_msgSend_dictionaryRepresentation(subscriptionRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v111, (uint64_t)v110, @"subscriptionRetrieveRequest");
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  if (subscriptionDeleteRequest)
  {
    v113 = objc_msgSend_dictionaryRepresentation(subscriptionDeleteRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v114, (uint64_t)v113, @"subscriptionDeleteRequest");
  }
  archiveRecordsRequest = self->_archiveRecordsRequest;
  if (archiveRecordsRequest)
  {
    v116 = objc_msgSend_dictionaryRepresentation(archiveRecordsRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v117, (uint64_t)v116, @"archiveRecordsRequest");
  }
  markAssetBrokenRequest = self->_markAssetBrokenRequest;
  if (markAssetBrokenRequest)
  {
    v119 = objc_msgSend_dictionaryRepresentation(markAssetBrokenRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v120, (uint64_t)v119, @"markAssetBrokenRequest");
  }
  userQueryRequest = self->_userQueryRequest;
  if (userQueryRequest)
  {
    v122 = objc_msgSend_dictionaryRepresentation(userQueryRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v123, (uint64_t)v122, @"userQueryRequest");
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  if (userPrivacySettingsUpdateRequest)
  {
    v125 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsUpdateRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v126, (uint64_t)v125, @"userPrivacySettingsUpdateRequest");
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  if (userPrivacySettingsResetRequest)
  {
    v128 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsResetRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v129, (uint64_t)v128, @"userPrivacySettingsResetRequest");
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  if (userPrivacySettingsBatchLookupRequest)
  {
    v131 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsBatchLookupRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v132, (uint64_t)v131, @"userPrivacySettingsBatchLookupRequest");
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  if (userPrivacySettingsRetrieveRequest)
  {
    v134 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsRetrieveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v135, (uint64_t)v134, @"userPrivacySettingsRetrieveRequest");
  }
  adopterCapabilitiesSaveRequest = self->_adopterCapabilitiesSaveRequest;
  if (adopterCapabilitiesSaveRequest)
  {
    v137 = objc_msgSend_dictionaryRepresentation(adopterCapabilitiesSaveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v138, (uint64_t)v137, @"adopterCapabilitiesSaveRequest");
  }
  zoneUsageSaveRequest = self->_zoneUsageSaveRequest;
  if (zoneUsageSaveRequest)
  {
    v140 = objc_msgSend_dictionaryRepresentation(zoneUsageSaveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v141, (uint64_t)v140, @"zoneUsageSaveRequest");
  }
  shareUsageSaveRequest = self->_shareUsageSaveRequest;
  if (shareUsageSaveRequest)
  {
    v143 = objc_msgSend_dictionaryRepresentation(shareUsageSaveRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v144, (uint64_t)v143, @"shareUsageSaveRequest");
  }
  adopterCapabilitiesCheckRequest = self->_adopterCapabilitiesCheckRequest;
  if (adopterCapabilitiesCheckRequest)
  {
    v146 = objc_msgSend_dictionaryRepresentation(adopterCapabilitiesCheckRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v147, (uint64_t)v146, @"adopterCapabilitiesCheckRequest");
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  if (tokenRegistrationRequest)
  {
    v149 = objc_msgSend_dictionaryRepresentation(tokenRegistrationRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v150, (uint64_t)v149, @"tokenRegistrationRequest");
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  if (tokenUnregistrationRequest)
  {
    v152 = objc_msgSend_dictionaryRepresentation(tokenUnregistrationRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v153, (uint64_t)v152, @"tokenUnregistrationRequest");
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  if (setBadgeCountRequest)
  {
    v155 = objc_msgSend_dictionaryRepresentation(setBadgeCountRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v156, (uint64_t)v155, @"setBadgeCountRequest");
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  if (notificationSyncRequest)
  {
    v158 = objc_msgSend_dictionaryRepresentation(notificationSyncRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v159, (uint64_t)v158, @"notificationSyncRequest");
  }
  notificationMarkReadRequest = self->_notificationMarkReadRequest;
  if (notificationMarkReadRequest)
  {
    v161 = objc_msgSend_dictionaryRepresentation(notificationMarkReadRequest, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v162, (uint64_t)v161, @"notificationMarkReadRequest");
  }
  id v163 = v6;

  return v163;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRequestOperationReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneDeleteRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneRetrieveChangesRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveVersionsRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveChangesRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordDeleteRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordResolveTokenRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fetchArchivedRecordsRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordMoveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareAccessRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_queryRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaMetadataRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaReplaceRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_assetUploadTokenRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deleteContainerRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userAvailableQuotaRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bundlesForContainerRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_webAuthTokenRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_updateMissingAssetStatusRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_anonymousShareAddRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_anonymousShareRemoveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionCreateRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionDeleteRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userQueryRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsRetrieveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsUpdateRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsResetRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsBatchLookupRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adopterCapabilitiesSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adopterCapabilitiesCheckRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneUsageSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareUsageSaveRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareAcceptRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareDeclineRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareVettingInitiateRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tokenRegistrationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tokenUnregistrationRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setBadgeCountRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notificationSyncRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notificationMarkReadRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_archiveRecordsRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_markAssetBrokenRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_functionInvokeRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  header = self->_header;
  id v58 = v4;
  if (header)
  {
    objc_msgSend_setHeader_(v4, v5, (uint64_t)header);
    id v4 = v58;
  }
  request = self->_request;
  if (request)
  {
    objc_msgSend_setRequest_(v58, v5, (uint64_t)request);
    id v4 = v58;
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  if (zoneSaveRequest)
  {
    objc_msgSend_setZoneSaveRequest_(v58, v5, (uint64_t)zoneSaveRequest);
    id v4 = v58;
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  if (zoneRetrieveRequest)
  {
    objc_msgSend_setZoneRetrieveRequest_(v58, v5, (uint64_t)zoneRetrieveRequest);
    id v4 = v58;
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  if (zoneDeleteRequest)
  {
    objc_msgSend_setZoneDeleteRequest_(v58, v5, (uint64_t)zoneDeleteRequest);
    id v4 = v58;
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  if (zoneRetrieveChangesRequest)
  {
    objc_msgSend_setZoneRetrieveChangesRequest_(v58, v5, (uint64_t)zoneRetrieveChangesRequest);
    id v4 = v58;
  }
  recordSaveRequest = self->_recordSaveRequest;
  if (recordSaveRequest)
  {
    objc_msgSend_setRecordSaveRequest_(v58, v5, (uint64_t)recordSaveRequest);
    id v4 = v58;
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  if (recordRetrieveRequest)
  {
    objc_msgSend_setRecordRetrieveRequest_(v58, v5, (uint64_t)recordRetrieveRequest);
    id v4 = v58;
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  if (recordRetrieveVersionsRequest)
  {
    objc_msgSend_setRecordRetrieveVersionsRequest_(v58, v5, (uint64_t)recordRetrieveVersionsRequest);
    id v4 = v58;
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  if (recordRetrieveChangesRequest)
  {
    objc_msgSend_setRecordRetrieveChangesRequest_(v58, v5, (uint64_t)recordRetrieveChangesRequest);
    id v4 = v58;
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  if (recordDeleteRequest)
  {
    objc_msgSend_setRecordDeleteRequest_(v58, v5, (uint64_t)recordDeleteRequest);
    id v4 = v58;
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  if (recordResolveTokenRequest)
  {
    objc_msgSend_setRecordResolveTokenRequest_(v58, v5, (uint64_t)recordResolveTokenRequest);
    id v4 = v58;
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  if (fetchArchivedRecordsRequest)
  {
    objc_msgSend_setFetchArchivedRecordsRequest_(v58, v5, (uint64_t)fetchArchivedRecordsRequest);
    id v4 = v58;
  }
  recordMoveRequest = self->_recordMoveRequest;
  if (recordMoveRequest)
  {
    objc_msgSend_setRecordMoveRequest_(v58, v5, (uint64_t)recordMoveRequest);
    id v4 = v58;
  }
  shareAccessRequest = self->_shareAccessRequest;
  if (shareAccessRequest)
  {
    objc_msgSend_setShareAccessRequest_(v58, v5, (uint64_t)shareAccessRequest);
    id v4 = v58;
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  if (queryRetrieveRequest)
  {
    objc_msgSend_setQueryRetrieveRequest_(v58, v5, (uint64_t)queryRetrieveRequest);
    id v4 = v58;
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  if (mergeableDeltaSaveRequest)
  {
    objc_msgSend_setMergeableDeltaSaveRequest_(v58, v5, (uint64_t)mergeableDeltaSaveRequest);
    id v4 = v58;
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  if (mergeableDeltaMetadataRetrieveRequest)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveRequest_(v58, v5, (uint64_t)mergeableDeltaMetadataRetrieveRequest);
    id v4 = v58;
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  if (mergeableDeltaReplaceRequest)
  {
    objc_msgSend_setMergeableDeltaReplaceRequest_(v58, v5, (uint64_t)mergeableDeltaReplaceRequest);
    id v4 = v58;
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  if (mergeableDeltaRetrieveRequest)
  {
    objc_msgSend_setMergeableDeltaRetrieveRequest_(v58, v5, (uint64_t)mergeableDeltaRetrieveRequest);
    id v4 = v58;
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  if (assetUploadTokenRetrieveRequest)
  {
    objc_msgSend_setAssetUploadTokenRetrieveRequest_(v58, v5, (uint64_t)assetUploadTokenRetrieveRequest);
    id v4 = v58;
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  if (deleteContainerRequest)
  {
    objc_msgSend_setDeleteContainerRequest_(v58, v5, (uint64_t)deleteContainerRequest);
    id v4 = v58;
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  if (userAvailableQuotaRequest)
  {
    objc_msgSend_setUserAvailableQuotaRequest_(v58, v5, (uint64_t)userAvailableQuotaRequest);
    id v4 = v58;
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  if (bundlesForContainerRequest)
  {
    objc_msgSend_setBundlesForContainerRequest_(v58, v5, (uint64_t)bundlesForContainerRequest);
    id v4 = v58;
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  if (webAuthTokenRetrieveRequest)
  {
    objc_msgSend_setWebAuthTokenRetrieveRequest_(v58, v5, (uint64_t)webAuthTokenRetrieveRequest);
    id v4 = v58;
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  if (updateMissingAssetStatusRequest)
  {
    objc_msgSend_setUpdateMissingAssetStatusRequest_(v58, v5, (uint64_t)updateMissingAssetStatusRequest);
    id v4 = v58;
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  if (anonymousShareAddRequest)
  {
    objc_msgSend_setAnonymousShareAddRequest_(v58, v5, (uint64_t)anonymousShareAddRequest);
    id v4 = v58;
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  if (anonymousShareRemoveRequest)
  {
    objc_msgSend_setAnonymousShareRemoveRequest_(v58, v5, (uint64_t)anonymousShareRemoveRequest);
    id v4 = v58;
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  if (subscriptionCreateRequest)
  {
    objc_msgSend_setSubscriptionCreateRequest_(v58, v5, (uint64_t)subscriptionCreateRequest);
    id v4 = v58;
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  if (subscriptionRetrieveRequest)
  {
    objc_msgSend_setSubscriptionRetrieveRequest_(v58, v5, (uint64_t)subscriptionRetrieveRequest);
    id v4 = v58;
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  if (subscriptionDeleteRequest)
  {
    objc_msgSend_setSubscriptionDeleteRequest_(v58, v5, (uint64_t)subscriptionDeleteRequest);
    id v4 = v58;
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  if (userRetrieveRequest)
  {
    objc_msgSend_setUserRetrieveRequest_(v58, v5, (uint64_t)userRetrieveRequest);
    id v4 = v58;
  }
  userQueryRequest = self->_userQueryRequest;
  if (userQueryRequest)
  {
    objc_msgSend_setUserQueryRequest_(v58, v5, (uint64_t)userQueryRequest);
    id v4 = v58;
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  if (userPrivacySettingsRetrieveRequest)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveRequest_(v58, v5, (uint64_t)userPrivacySettingsRetrieveRequest);
    id v4 = v58;
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  if (userPrivacySettingsUpdateRequest)
  {
    objc_msgSend_setUserPrivacySettingsUpdateRequest_(v58, v5, (uint64_t)userPrivacySettingsUpdateRequest);
    id v4 = v58;
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  if (userPrivacySettingsResetRequest)
  {
    objc_msgSend_setUserPrivacySettingsResetRequest_(v58, v5, (uint64_t)userPrivacySettingsResetRequest);
    id v4 = v58;
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  if (userPrivacySettingsBatchLookupRequest)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupRequest_(v58, v5, (uint64_t)userPrivacySettingsBatchLookupRequest);
    id v4 = v58;
  }
  adopterCapabilitiesSaveRequest = self->_adopterCapabilitiesSaveRequest;
  if (adopterCapabilitiesSaveRequest)
  {
    objc_msgSend_setAdopterCapabilitiesSaveRequest_(v58, v5, (uint64_t)adopterCapabilitiesSaveRequest);
    id v4 = v58;
  }
  adopterCapabilitiesCheckRequest = self->_adopterCapabilitiesCheckRequest;
  if (adopterCapabilitiesCheckRequest)
  {
    objc_msgSend_setAdopterCapabilitiesCheckRequest_(v58, v5, (uint64_t)adopterCapabilitiesCheckRequest);
    id v4 = v58;
  }
  zoneUsageSaveRequest = self->_zoneUsageSaveRequest;
  if (zoneUsageSaveRequest)
  {
    objc_msgSend_setZoneUsageSaveRequest_(v58, v5, (uint64_t)zoneUsageSaveRequest);
    id v4 = v58;
  }
  shareUsageSaveRequest = self->_shareUsageSaveRequest;
  if (shareUsageSaveRequest)
  {
    objc_msgSend_setShareUsageSaveRequest_(v58, v5, (uint64_t)shareUsageSaveRequest);
    id v4 = v58;
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  if (shareAcceptRequest)
  {
    objc_msgSend_setShareAcceptRequest_(v58, v5, (uint64_t)shareAcceptRequest);
    id v4 = v58;
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  if (shareDeclineRequest)
  {
    objc_msgSend_setShareDeclineRequest_(v58, v5, (uint64_t)shareDeclineRequest);
    id v4 = v58;
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  if (shareVettingInitiateRequest)
  {
    objc_msgSend_setShareVettingInitiateRequest_(v58, v5, (uint64_t)shareVettingInitiateRequest);
    id v4 = v58;
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  if (tokenRegistrationRequest)
  {
    objc_msgSend_setTokenRegistrationRequest_(v58, v5, (uint64_t)tokenRegistrationRequest);
    id v4 = v58;
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  if (tokenUnregistrationRequest)
  {
    objc_msgSend_setTokenUnregistrationRequest_(v58, v5, (uint64_t)tokenUnregistrationRequest);
    id v4 = v58;
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  if (setBadgeCountRequest)
  {
    objc_msgSend_setSetBadgeCountRequest_(v58, v5, (uint64_t)setBadgeCountRequest);
    id v4 = v58;
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  if (notificationSyncRequest)
  {
    objc_msgSend_setNotificationSyncRequest_(v58, v5, (uint64_t)notificationSyncRequest);
    id v4 = v58;
  }
  notificationMarkReadRequest = self->_notificationMarkReadRequest;
  if (notificationMarkReadRequest)
  {
    objc_msgSend_setNotificationMarkReadRequest_(v58, v5, (uint64_t)notificationMarkReadRequest);
    id v4 = v58;
  }
  archiveRecordsRequest = self->_archiveRecordsRequest;
  if (archiveRecordsRequest)
  {
    objc_msgSend_setArchiveRecordsRequest_(v58, v5, (uint64_t)archiveRecordsRequest);
    id v4 = v58;
  }
  markAssetBrokenRequest = self->_markAssetBrokenRequest;
  if (markAssetBrokenRequest)
  {
    objc_msgSend_setMarkAssetBrokenRequest_(v58, v5, (uint64_t)markAssetBrokenRequest);
    id v4 = v58;
  }
  functionInvokeRequest = self->_functionInvokeRequest;
  if (functionInvokeRequest)
  {
    objc_msgSend_setFunctionInvokeRequest_(v58, v5, (uint64_t)functionInvokeRequest);
    id v4 = v58;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_header, v11, (uint64_t)a3);
  v13 = (void *)v10[11];
  v10[11] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_request, v14, (uint64_t)a3);
  v16 = (void *)v10[27];
  v10[27] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_zoneSaveRequest, v17, (uint64_t)a3);
  v19 = (void *)v10[51];
  v10[51] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_zoneRetrieveRequest, v20, (uint64_t)a3);
  v22 = (void *)v10[50];
  v10[50] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_zoneDeleteRequest, v23, (uint64_t)a3);
  v25 = (void *)v10[48];
  v10[48] = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_zoneRetrieveChangesRequest, v26, (uint64_t)a3);
  v28 = (void *)v10[49];
  v10[49] = v27;

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_recordSaveRequest, v29, (uint64_t)a3);
  v31 = (void *)v10[26];
  v10[26] = v30;

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_recordRetrieveRequest, v32, (uint64_t)a3);
  v34 = (void *)v10[24];
  v10[24] = v33;

  uint64_t v36 = objc_msgSend_copyWithZone_(self->_recordRetrieveVersionsRequest, v35, (uint64_t)a3);
  v37 = (void *)v10[25];
  v10[25] = v36;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_recordRetrieveChangesRequest, v38, (uint64_t)a3);
  v40 = (void *)v10[23];
  v10[23] = v39;

  uint64_t v42 = objc_msgSend_copyWithZone_(self->_recordDeleteRequest, v41, (uint64_t)a3);
  v43 = (void *)v10[20];
  v10[20] = v42;

  uint64_t v45 = objc_msgSend_copyWithZone_(self->_recordResolveTokenRequest, v44, (uint64_t)a3);
  v46 = (void *)v10[22];
  v10[22] = v45;

  uint64_t v48 = objc_msgSend_copyWithZone_(self->_fetchArchivedRecordsRequest, v47, (uint64_t)a3);
  v49 = (void *)v10[9];
  v10[9] = v48;

  uint64_t v51 = objc_msgSend_copyWithZone_(self->_recordMoveRequest, v50, (uint64_t)a3);
  v52 = (void *)v10[21];
  v10[21] = v51;

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_shareAccessRequest, v53, (uint64_t)a3);
  v55 = (void *)v10[30];
  v10[30] = v54;

  uint64_t v57 = objc_msgSend_copyWithZone_(self->_queryRetrieveRequest, v56, (uint64_t)a3);
  id v58 = (void *)v10[19];
  v10[19] = v57;

  uint64_t v60 = objc_msgSend_copyWithZone_(self->_mergeableDeltaSaveRequest, v59, (uint64_t)a3);
  v61 = (void *)v10[16];
  v10[16] = v60;

  uint64_t v63 = objc_msgSend_copyWithZone_(self->_mergeableDeltaMetadataRetrieveRequest, v62, (uint64_t)a3);
  v64 = (void *)v10[13];
  v10[13] = v63;

  uint64_t v66 = objc_msgSend_copyWithZone_(self->_mergeableDeltaReplaceRequest, v65, (uint64_t)a3);
  v67 = (void *)v10[14];
  v10[14] = v66;

  uint64_t v69 = objc_msgSend_copyWithZone_(self->_mergeableDeltaRetrieveRequest, v68, (uint64_t)a3);
  v70 = (void *)v10[15];
  v10[15] = v69;

  uint64_t v72 = objc_msgSend_copyWithZone_(self->_assetUploadTokenRetrieveRequest, v71, (uint64_t)a3);
  v73 = (void *)v10[6];
  v10[6] = v72;

  uint64_t v75 = objc_msgSend_copyWithZone_(self->_deleteContainerRequest, v74, (uint64_t)a3);
  v76 = (void *)v10[8];
  v10[8] = v75;

  uint64_t v78 = objc_msgSend_copyWithZone_(self->_userAvailableQuotaRequest, v77, (uint64_t)a3);
  v79 = (void *)v10[40];
  v10[40] = v78;

  uint64_t v81 = objc_msgSend_copyWithZone_(self->_bundlesForContainerRequest, v80, (uint64_t)a3);
  v82 = (void *)v10[7];
  v10[7] = v81;

  uint64_t v84 = objc_msgSend_copyWithZone_(self->_webAuthTokenRetrieveRequest, v83, (uint64_t)a3);
  v85 = (void *)v10[47];
  v10[47] = v84;

  uint64_t v87 = objc_msgSend_copyWithZone_(self->_updateMissingAssetStatusRequest, v86, (uint64_t)a3);
  v88 = (void *)v10[39];
  v10[39] = v87;

  uint64_t v90 = objc_msgSend_copyWithZone_(self->_anonymousShareAddRequest, v89, (uint64_t)a3);
  v91 = (void *)v10[3];
  v10[3] = v90;

  uint64_t v93 = objc_msgSend_copyWithZone_(self->_anonymousShareRemoveRequest, v92, (uint64_t)a3);
  v94 = (void *)v10[4];
  v10[4] = v93;

  uint64_t v96 = objc_msgSend_copyWithZone_(self->_subscriptionCreateRequest, v95, (uint64_t)a3);
  v97 = (void *)v10[34];
  v10[34] = v96;

  uint64_t v99 = objc_msgSend_copyWithZone_(self->_subscriptionRetrieveRequest, v98, (uint64_t)a3);
  v100 = (void *)v10[36];
  v10[36] = v99;

  uint64_t v102 = objc_msgSend_copyWithZone_(self->_subscriptionDeleteRequest, v101, (uint64_t)a3);
  v103 = (void *)v10[35];
  v10[35] = v102;

  uint64_t v105 = objc_msgSend_copyWithZone_(self->_userRetrieveRequest, v104, (uint64_t)a3);
  v106 = (void *)v10[46];
  v10[46] = v105;

  uint64_t v108 = objc_msgSend_copyWithZone_(self->_userQueryRequest, v107, (uint64_t)a3);
  v109 = (void *)v10[45];
  v10[45] = v108;

  uint64_t v111 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsRetrieveRequest, v110, (uint64_t)a3);
  v112 = (void *)v10[43];
  v10[43] = v111;

  uint64_t v114 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsUpdateRequest, v113, (uint64_t)a3);
  v115 = (void *)v10[44];
  v10[44] = v114;

  uint64_t v117 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsResetRequest, v116, (uint64_t)a3);
  v118 = (void *)v10[42];
  v10[42] = v117;

  uint64_t v120 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsBatchLookupRequest, v119, (uint64_t)a3);
  v121 = (void *)v10[41];
  v10[41] = v120;

  uint64_t v123 = objc_msgSend_copyWithZone_(self->_adopterCapabilitiesSaveRequest, v122, (uint64_t)a3);
  v124 = (void *)v10[2];
  v10[2] = v123;

  uint64_t v126 = objc_msgSend_copyWithZone_(self->_adopterCapabilitiesCheckRequest, v125, (uint64_t)a3);
  v127 = (void *)v10[1];
  v10[1] = v126;

  uint64_t v129 = objc_msgSend_copyWithZone_(self->_zoneUsageSaveRequest, v128, (uint64_t)a3);
  v130 = (void *)v10[52];
  v10[52] = v129;

  uint64_t v132 = objc_msgSend_copyWithZone_(self->_shareUsageSaveRequest, v131, (uint64_t)a3);
  v133 = (void *)v10[32];
  v10[32] = v132;

  uint64_t v135 = objc_msgSend_copyWithZone_(self->_shareAcceptRequest, v134, (uint64_t)a3);
  v136 = (void *)v10[29];
  v10[29] = v135;

  uint64_t v138 = objc_msgSend_copyWithZone_(self->_shareDeclineRequest, v137, (uint64_t)a3);
  v139 = (void *)v10[31];
  v10[31] = v138;

  uint64_t v141 = objc_msgSend_copyWithZone_(self->_shareVettingInitiateRequest, v140, (uint64_t)a3);
  v142 = (void *)v10[33];
  v10[33] = v141;

  uint64_t v144 = objc_msgSend_copyWithZone_(self->_tokenRegistrationRequest, v143, (uint64_t)a3);
  v145 = (void *)v10[37];
  v10[37] = v144;

  uint64_t v147 = objc_msgSend_copyWithZone_(self->_tokenUnregistrationRequest, v146, (uint64_t)a3);
  v148 = (void *)v10[38];
  v10[38] = v147;

  uint64_t v150 = objc_msgSend_copyWithZone_(self->_setBadgeCountRequest, v149, (uint64_t)a3);
  v151 = (void *)v10[28];
  v10[28] = v150;

  uint64_t v153 = objc_msgSend_copyWithZone_(self->_notificationSyncRequest, v152, (uint64_t)a3);
  v154 = (void *)v10[18];
  v10[18] = v153;

  uint64_t v156 = objc_msgSend_copyWithZone_(self->_notificationMarkReadRequest, v155, (uint64_t)a3);
  v157 = (void *)v10[17];
  v10[17] = v156;

  uint64_t v159 = objc_msgSend_copyWithZone_(self->_archiveRecordsRequest, v158, (uint64_t)a3);
  v160 = (void *)v10[5];
  v10[5] = v159;

  uint64_t v162 = objc_msgSend_copyWithZone_(self->_markAssetBrokenRequest, v161, (uint64_t)a3);
  id v163 = (void *)v10[12];
  v10[12] = v162;

  uint64_t v165 = objc_msgSend_copyWithZone_(self->_functionInvokeRequest, v164, (uint64_t)a3);
  v166 = (void *)v10[10];
  v10[10] = v165;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_106;
  }
  header = self->_header;
  uint64_t v9 = v4[11];
  if ((unint64_t)header | v9)
  {
    if (!objc_msgSend_isEqual_(header, v7, v9)) {
      goto LABEL_106;
    }
  }
  request = self->_request;
  uint64_t v11 = v4[27];
  if ((unint64_t)request | v11)
  {
    if (!objc_msgSend_isEqual_(request, v7, v11)) {
      goto LABEL_106;
    }
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  uint64_t v13 = v4[51];
  if ((unint64_t)zoneSaveRequest | v13)
  {
    if (!objc_msgSend_isEqual_(zoneSaveRequest, v7, v13)) {
      goto LABEL_106;
    }
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  uint64_t v15 = v4[50];
  if ((unint64_t)zoneRetrieveRequest | v15)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveRequest, v7, v15)) {
      goto LABEL_106;
    }
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  uint64_t v17 = v4[48];
  if ((unint64_t)zoneDeleteRequest | v17)
  {
    if (!objc_msgSend_isEqual_(zoneDeleteRequest, v7, v17)) {
      goto LABEL_106;
    }
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  uint64_t v19 = v4[49];
  if ((unint64_t)zoneRetrieveChangesRequest | v19)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveChangesRequest, v7, v19)) {
      goto LABEL_106;
    }
  }
  recordSaveRequest = self->_recordSaveRequest;
  uint64_t v21 = v4[26];
  if ((unint64_t)recordSaveRequest | v21)
  {
    if (!objc_msgSend_isEqual_(recordSaveRequest, v7, v21)) {
      goto LABEL_106;
    }
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  uint64_t v23 = v4[24];
  if ((unint64_t)recordRetrieveRequest | v23)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveRequest, v7, v23)) {
      goto LABEL_106;
    }
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  uint64_t v25 = v4[25];
  if ((unint64_t)recordRetrieveVersionsRequest | v25)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveVersionsRequest, v7, v25)) {
      goto LABEL_106;
    }
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  uint64_t v27 = v4[23];
  if ((unint64_t)recordRetrieveChangesRequest | v27)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveChangesRequest, v7, v27)) {
      goto LABEL_106;
    }
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  uint64_t v29 = v4[20];
  if ((unint64_t)recordDeleteRequest | v29)
  {
    if (!objc_msgSend_isEqual_(recordDeleteRequest, v7, v29)) {
      goto LABEL_106;
    }
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  uint64_t v31 = v4[22];
  if ((unint64_t)recordResolveTokenRequest | v31)
  {
    if (!objc_msgSend_isEqual_(recordResolveTokenRequest, v7, v31)) {
      goto LABEL_106;
    }
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  uint64_t v33 = v4[9];
  if ((unint64_t)fetchArchivedRecordsRequest | v33)
  {
    if (!objc_msgSend_isEqual_(fetchArchivedRecordsRequest, v7, v33)) {
      goto LABEL_106;
    }
  }
  recordMoveRequest = self->_recordMoveRequest;
  uint64_t v35 = v4[21];
  if ((unint64_t)recordMoveRequest | v35)
  {
    if (!objc_msgSend_isEqual_(recordMoveRequest, v7, v35)) {
      goto LABEL_106;
    }
  }
  shareAccessRequest = self->_shareAccessRequest;
  uint64_t v37 = v4[30];
  if ((unint64_t)shareAccessRequest | v37)
  {
    if (!objc_msgSend_isEqual_(shareAccessRequest, v7, v37)) {
      goto LABEL_106;
    }
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  uint64_t v39 = v4[19];
  if ((unint64_t)queryRetrieveRequest | v39)
  {
    if (!objc_msgSend_isEqual_(queryRetrieveRequest, v7, v39)) {
      goto LABEL_106;
    }
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  uint64_t v41 = v4[16];
  if ((unint64_t)mergeableDeltaSaveRequest | v41)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaSaveRequest, v7, v41)) {
      goto LABEL_106;
    }
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  uint64_t v43 = v4[13];
  if ((unint64_t)mergeableDeltaMetadataRetrieveRequest | v43)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaMetadataRetrieveRequest, v7, v43)) {
      goto LABEL_106;
    }
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  uint64_t v45 = v4[14];
  if ((unint64_t)mergeableDeltaReplaceRequest | v45)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaReplaceRequest, v7, v45)) {
      goto LABEL_106;
    }
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  uint64_t v47 = v4[15];
  if ((unint64_t)mergeableDeltaRetrieveRequest | v47)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaRetrieveRequest, v7, v47)) {
      goto LABEL_106;
    }
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  uint64_t v49 = v4[6];
  if ((unint64_t)assetUploadTokenRetrieveRequest | v49)
  {
    if (!objc_msgSend_isEqual_(assetUploadTokenRetrieveRequest, v7, v49)) {
      goto LABEL_106;
    }
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  uint64_t v51 = v4[8];
  if ((unint64_t)deleteContainerRequest | v51)
  {
    if (!objc_msgSend_isEqual_(deleteContainerRequest, v7, v51)) {
      goto LABEL_106;
    }
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  uint64_t v53 = v4[40];
  if ((unint64_t)userAvailableQuotaRequest | v53)
  {
    if (!objc_msgSend_isEqual_(userAvailableQuotaRequest, v7, v53)) {
      goto LABEL_106;
    }
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  uint64_t v55 = v4[7];
  if ((unint64_t)bundlesForContainerRequest | v55)
  {
    if (!objc_msgSend_isEqual_(bundlesForContainerRequest, v7, v55)) {
      goto LABEL_106;
    }
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  uint64_t v57 = v4[47];
  if ((unint64_t)webAuthTokenRetrieveRequest | v57)
  {
    if (!objc_msgSend_isEqual_(webAuthTokenRetrieveRequest, v7, v57)) {
      goto LABEL_106;
    }
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  uint64_t v59 = v4[39];
  if ((unint64_t)updateMissingAssetStatusRequest | v59)
  {
    if (!objc_msgSend_isEqual_(updateMissingAssetStatusRequest, v7, v59)) {
      goto LABEL_106;
    }
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  uint64_t v61 = v4[3];
  if ((unint64_t)anonymousShareAddRequest | v61)
  {
    if (!objc_msgSend_isEqual_(anonymousShareAddRequest, v7, v61)) {
      goto LABEL_106;
    }
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  uint64_t v63 = v4[4];
  if ((unint64_t)anonymousShareRemoveRequest | v63)
  {
    if (!objc_msgSend_isEqual_(anonymousShareRemoveRequest, v7, v63)) {
      goto LABEL_106;
    }
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  uint64_t v65 = v4[34];
  if ((unint64_t)subscriptionCreateRequest | v65)
  {
    if (!objc_msgSend_isEqual_(subscriptionCreateRequest, v7, v65)) {
      goto LABEL_106;
    }
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  uint64_t v67 = v4[36];
  if ((unint64_t)subscriptionRetrieveRequest | v67)
  {
    if (!objc_msgSend_isEqual_(subscriptionRetrieveRequest, v7, v67)) {
      goto LABEL_106;
    }
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  uint64_t v69 = v4[35];
  if ((unint64_t)subscriptionDeleteRequest | v69)
  {
    if (!objc_msgSend_isEqual_(subscriptionDeleteRequest, v7, v69)) {
      goto LABEL_106;
    }
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  uint64_t v71 = v4[46];
  if ((unint64_t)userRetrieveRequest | v71)
  {
    if (!objc_msgSend_isEqual_(userRetrieveRequest, v7, v71)) {
      goto LABEL_106;
    }
  }
  userQueryRequest = self->_userQueryRequest;
  uint64_t v73 = v4[45];
  if ((unint64_t)userQueryRequest | v73)
  {
    if (!objc_msgSend_isEqual_(userQueryRequest, v7, v73)) {
      goto LABEL_106;
    }
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  uint64_t v75 = v4[43];
  if ((unint64_t)userPrivacySettingsRetrieveRequest | v75)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsRetrieveRequest, v7, v75)) {
      goto LABEL_106;
    }
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  uint64_t v77 = v4[44];
  if ((unint64_t)userPrivacySettingsUpdateRequest | v77)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsUpdateRequest, v7, v77)) {
      goto LABEL_106;
    }
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  uint64_t v79 = v4[42];
  if ((unint64_t)userPrivacySettingsResetRequest | v79)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsResetRequest, v7, v79)) {
      goto LABEL_106;
    }
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  uint64_t v81 = v4[41];
  if ((unint64_t)userPrivacySettingsBatchLookupRequest | v81)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsBatchLookupRequest, v7, v81)) {
      goto LABEL_106;
    }
  }
  adopterCapabilitiesSaveRequest = self->_adopterCapabilitiesSaveRequest;
  uint64_t v83 = v4[2];
  if ((unint64_t)adopterCapabilitiesSaveRequest | v83)
  {
    if (!objc_msgSend_isEqual_(adopterCapabilitiesSaveRequest, v7, v83)) {
      goto LABEL_106;
    }
  }
  adopterCapabilitiesCheckRequest = self->_adopterCapabilitiesCheckRequest;
  uint64_t v85 = v4[1];
  if ((unint64_t)adopterCapabilitiesCheckRequest | v85)
  {
    if (!objc_msgSend_isEqual_(adopterCapabilitiesCheckRequest, v7, v85)) {
      goto LABEL_106;
    }
  }
  zoneUsageSaveRequest = self->_zoneUsageSaveRequest;
  uint64_t v87 = v4[52];
  if ((unint64_t)zoneUsageSaveRequest | v87)
  {
    if (!objc_msgSend_isEqual_(zoneUsageSaveRequest, v7, v87)) {
      goto LABEL_106;
    }
  }
  shareUsageSaveRequest = self->_shareUsageSaveRequest;
  uint64_t v89 = v4[32];
  if ((unint64_t)shareUsageSaveRequest | v89)
  {
    if (!objc_msgSend_isEqual_(shareUsageSaveRequest, v7, v89)) {
      goto LABEL_106;
    }
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  uint64_t v91 = v4[29];
  if ((unint64_t)shareAcceptRequest | v91)
  {
    if (!objc_msgSend_isEqual_(shareAcceptRequest, v7, v91)) {
      goto LABEL_106;
    }
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  uint64_t v93 = v4[31];
  if ((unint64_t)shareDeclineRequest | v93)
  {
    if (!objc_msgSend_isEqual_(shareDeclineRequest, v7, v93)) {
      goto LABEL_106;
    }
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  uint64_t v95 = v4[33];
  if ((unint64_t)shareVettingInitiateRequest | v95)
  {
    if (!objc_msgSend_isEqual_(shareVettingInitiateRequest, v7, v95)) {
      goto LABEL_106;
    }
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  uint64_t v97 = v4[37];
  if ((unint64_t)tokenRegistrationRequest | v97)
  {
    if (!objc_msgSend_isEqual_(tokenRegistrationRequest, v7, v97)) {
      goto LABEL_106;
    }
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  uint64_t v99 = v4[38];
  if ((unint64_t)tokenUnregistrationRequest | v99)
  {
    if (!objc_msgSend_isEqual_(tokenUnregistrationRequest, v7, v99)) {
      goto LABEL_106;
    }
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  uint64_t v101 = v4[28];
  if ((unint64_t)setBadgeCountRequest | v101)
  {
    if (!objc_msgSend_isEqual_(setBadgeCountRequest, v7, v101)) {
      goto LABEL_106;
    }
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  uint64_t v103 = v4[18];
  if ((unint64_t)notificationSyncRequest | v103)
  {
    if (!objc_msgSend_isEqual_(notificationSyncRequest, v7, v103)) {
      goto LABEL_106;
    }
  }
  if (((notificationMarkReadRequest = self->_notificationMarkReadRequest,
         uint64_t v105 = v4[17],
         !((unint64_t)notificationMarkReadRequest | v105))
     || objc_msgSend_isEqual_(notificationMarkReadRequest, v7, v105))
    && ((archiveRecordsRequest = self->_archiveRecordsRequest,
         uint64_t v107 = v4[5],
         !((unint64_t)archiveRecordsRequest | v107))
     || objc_msgSend_isEqual_(archiveRecordsRequest, v7, v107))
    && ((markAssetBrokenRequest = self->_markAssetBrokenRequest,
         uint64_t v109 = v4[12],
         !((unint64_t)markAssetBrokenRequest | v109))
     || objc_msgSend_isEqual_(markAssetBrokenRequest, v7, v109)))
  {
    functionInvokeRequest = self->_functionInvokeRequest;
    uint64_t v111 = v4[10];
    if ((unint64_t)functionInvokeRequest | v111) {
      char isEqual = objc_msgSend_isEqual_(functionInvokeRequest, v7, v111);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_106:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_header, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_request, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_zoneSaveRequest, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_zoneRetrieveRequest, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_zoneDeleteRequest, v14, v15);
  uint64_t v19 = v16 ^ objc_msgSend_hash(self->_zoneRetrieveChangesRequest, v17, v18);
  uint64_t v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_recordSaveRequest, v20, v21);
  uint64_t v25 = objc_msgSend_hash(self->_recordRetrieveRequest, v23, v24);
  uint64_t v28 = v25 ^ objc_msgSend_hash(self->_recordRetrieveVersionsRequest, v26, v27);
  uint64_t v31 = v28 ^ objc_msgSend_hash(self->_recordRetrieveChangesRequest, v29, v30);
  uint64_t v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_recordDeleteRequest, v32, v33);
  uint64_t v37 = objc_msgSend_hash(self->_recordResolveTokenRequest, v35, v36);
  uint64_t v40 = v37 ^ objc_msgSend_hash(self->_fetchArchivedRecordsRequest, v38, v39);
  uint64_t v43 = v40 ^ objc_msgSend_hash(self->_recordMoveRequest, v41, v42);
  uint64_t v46 = v43 ^ objc_msgSend_hash(self->_shareAccessRequest, v44, v45);
  uint64_t v49 = v34 ^ v46 ^ objc_msgSend_hash(self->_queryRetrieveRequest, v47, v48);
  uint64_t v52 = objc_msgSend_hash(self->_mergeableDeltaSaveRequest, v50, v51);
  uint64_t v55 = v52 ^ objc_msgSend_hash(self->_mergeableDeltaMetadataRetrieveRequest, v53, v54);
  uint64_t v58 = v55 ^ objc_msgSend_hash(self->_mergeableDeltaReplaceRequest, v56, v57);
  uint64_t v61 = v58 ^ objc_msgSend_hash(self->_mergeableDeltaRetrieveRequest, v59, v60);
  uint64_t v64 = v61 ^ objc_msgSend_hash(self->_assetUploadTokenRetrieveRequest, v62, v63);
  uint64_t v67 = v49 ^ v64 ^ objc_msgSend_hash(self->_deleteContainerRequest, v65, v66);
  uint64_t v70 = objc_msgSend_hash(self->_userAvailableQuotaRequest, v68, v69);
  uint64_t v73 = v70 ^ objc_msgSend_hash(self->_bundlesForContainerRequest, v71, v72);
  uint64_t v76 = v73 ^ objc_msgSend_hash(self->_webAuthTokenRetrieveRequest, v74, v75);
  uint64_t v79 = v76 ^ objc_msgSend_hash(self->_updateMissingAssetStatusRequest, v77, v78);
  uint64_t v82 = v79 ^ objc_msgSend_hash(self->_anonymousShareAddRequest, v80, v81);
  uint64_t v85 = v82 ^ objc_msgSend_hash(self->_anonymousShareRemoveRequest, v83, v84);
  uint64_t v88 = v67 ^ v85 ^ objc_msgSend_hash(self->_subscriptionCreateRequest, v86, v87);
  uint64_t v91 = objc_msgSend_hash(self->_subscriptionRetrieveRequest, v89, v90);
  uint64_t v94 = v91 ^ objc_msgSend_hash(self->_subscriptionDeleteRequest, v92, v93);
  uint64_t v97 = v94 ^ objc_msgSend_hash(self->_userRetrieveRequest, v95, v96);
  uint64_t v100 = v97 ^ objc_msgSend_hash(self->_userQueryRequest, v98, v99);
  uint64_t v103 = v100 ^ objc_msgSend_hash(self->_userPrivacySettingsRetrieveRequest, v101, v102);
  uint64_t v106 = v103 ^ objc_msgSend_hash(self->_userPrivacySettingsUpdateRequest, v104, v105);
  uint64_t v109 = v106 ^ objc_msgSend_hash(self->_userPrivacySettingsResetRequest, v107, v108);
  uint64_t v112 = v88 ^ v109 ^ objc_msgSend_hash(self->_userPrivacySettingsBatchLookupRequest, v110, v111);
  uint64_t v115 = objc_msgSend_hash(self->_adopterCapabilitiesSaveRequest, v113, v114);
  uint64_t v118 = v115 ^ objc_msgSend_hash(self->_adopterCapabilitiesCheckRequest, v116, v117);
  uint64_t v121 = v118 ^ objc_msgSend_hash(self->_zoneUsageSaveRequest, v119, v120);
  uint64_t v124 = v121 ^ objc_msgSend_hash(self->_shareUsageSaveRequest, v122, v123);
  uint64_t v127 = v124 ^ objc_msgSend_hash(self->_shareAcceptRequest, v125, v126);
  uint64_t v130 = v127 ^ objc_msgSend_hash(self->_shareDeclineRequest, v128, v129);
  uint64_t v133 = v130 ^ objc_msgSend_hash(self->_shareVettingInitiateRequest, v131, v132);
  uint64_t v136 = v133 ^ objc_msgSend_hash(self->_tokenRegistrationRequest, v134, v135);
  uint64_t v139 = v112 ^ v136 ^ objc_msgSend_hash(self->_tokenUnregistrationRequest, v137, v138);
  uint64_t v142 = objc_msgSend_hash(self->_setBadgeCountRequest, v140, v141);
  uint64_t v145 = v142 ^ objc_msgSend_hash(self->_notificationSyncRequest, v143, v144);
  uint64_t v148 = v145 ^ objc_msgSend_hash(self->_notificationMarkReadRequest, v146, v147);
  uint64_t v151 = v148 ^ objc_msgSend_hash(self->_archiveRecordsRequest, v149, v150);
  uint64_t v154 = v151 ^ objc_msgSend_hash(self->_markAssetBrokenRequest, v152, v153);
  return v139 ^ v154 ^ objc_msgSend_hash(self->_functionInvokeRequest, v155, v156);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (uint64_t *)a3;
  header = self->_header;
  uint64_t v109 = v4;
  uint64_t v6 = v4[11];
  if (header)
  {
    if (v6) {
      objc_msgSend_mergeFrom_(header, (const char *)v4, v6);
    }
  }
  else if (v6)
  {
    objc_msgSend_setHeader_(self, (const char *)v4, v6);
  }
  request = self->_request;
  uint64_t v8 = v109[27];
  if (request)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(request, (const char *)v109, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setRequest_(self, (const char *)v109, v8);
  }
  zoneSaveRequest = self->_zoneSaveRequest;
  uint64_t v10 = v109[51];
  if (zoneSaveRequest)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(zoneSaveRequest, (const char *)v109, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setZoneSaveRequest_(self, (const char *)v109, v10);
  }
  zoneRetrieveRequest = self->_zoneRetrieveRequest;
  uint64_t v12 = v109[50];
  if (zoneRetrieveRequest)
  {
    if (v12) {
      objc_msgSend_mergeFrom_(zoneRetrieveRequest, (const char *)v109, v12);
    }
  }
  else if (v12)
  {
    objc_msgSend_setZoneRetrieveRequest_(self, (const char *)v109, v12);
  }
  zoneDeleteRequest = self->_zoneDeleteRequest;
  uint64_t v14 = v109[48];
  if (zoneDeleteRequest)
  {
    if (v14) {
      objc_msgSend_mergeFrom_(zoneDeleteRequest, (const char *)v109, v14);
    }
  }
  else if (v14)
  {
    objc_msgSend_setZoneDeleteRequest_(self, (const char *)v109, v14);
  }
  zoneRetrieveChangesRequest = self->_zoneRetrieveChangesRequest;
  uint64_t v16 = v109[49];
  if (zoneRetrieveChangesRequest)
  {
    if (v16) {
      objc_msgSend_mergeFrom_(zoneRetrieveChangesRequest, (const char *)v109, v16);
    }
  }
  else if (v16)
  {
    objc_msgSend_setZoneRetrieveChangesRequest_(self, (const char *)v109, v16);
  }
  recordSaveRequest = self->_recordSaveRequest;
  uint64_t v18 = v109[26];
  if (recordSaveRequest)
  {
    if (v18) {
      objc_msgSend_mergeFrom_(recordSaveRequest, (const char *)v109, v18);
    }
  }
  else if (v18)
  {
    objc_msgSend_setRecordSaveRequest_(self, (const char *)v109, v18);
  }
  recordRetrieveRequest = self->_recordRetrieveRequest;
  uint64_t v20 = v109[24];
  if (recordRetrieveRequest)
  {
    if (v20) {
      objc_msgSend_mergeFrom_(recordRetrieveRequest, (const char *)v109, v20);
    }
  }
  else if (v20)
  {
    objc_msgSend_setRecordRetrieveRequest_(self, (const char *)v109, v20);
  }
  recordRetrieveVersionsRequest = self->_recordRetrieveVersionsRequest;
  uint64_t v22 = v109[25];
  if (recordRetrieveVersionsRequest)
  {
    if (v22) {
      objc_msgSend_mergeFrom_(recordRetrieveVersionsRequest, (const char *)v109, v22);
    }
  }
  else if (v22)
  {
    objc_msgSend_setRecordRetrieveVersionsRequest_(self, (const char *)v109, v22);
  }
  recordRetrieveChangesRequest = self->_recordRetrieveChangesRequest;
  uint64_t v24 = v109[23];
  if (recordRetrieveChangesRequest)
  {
    if (v24) {
      objc_msgSend_mergeFrom_(recordRetrieveChangesRequest, (const char *)v109, v24);
    }
  }
  else if (v24)
  {
    objc_msgSend_setRecordRetrieveChangesRequest_(self, (const char *)v109, v24);
  }
  recordDeleteRequest = self->_recordDeleteRequest;
  uint64_t v26 = v109[20];
  if (recordDeleteRequest)
  {
    if (v26) {
      objc_msgSend_mergeFrom_(recordDeleteRequest, (const char *)v109, v26);
    }
  }
  else if (v26)
  {
    objc_msgSend_setRecordDeleteRequest_(self, (const char *)v109, v26);
  }
  recordResolveTokenRequest = self->_recordResolveTokenRequest;
  uint64_t v28 = v109[22];
  if (recordResolveTokenRequest)
  {
    if (v28) {
      objc_msgSend_mergeFrom_(recordResolveTokenRequest, (const char *)v109, v28);
    }
  }
  else if (v28)
  {
    objc_msgSend_setRecordResolveTokenRequest_(self, (const char *)v109, v28);
  }
  fetchArchivedRecordsRequest = self->_fetchArchivedRecordsRequest;
  uint64_t v30 = v109[9];
  if (fetchArchivedRecordsRequest)
  {
    if (v30) {
      objc_msgSend_mergeFrom_(fetchArchivedRecordsRequest, (const char *)v109, v30);
    }
  }
  else if (v30)
  {
    objc_msgSend_setFetchArchivedRecordsRequest_(self, (const char *)v109, v30);
  }
  recordMoveRequest = self->_recordMoveRequest;
  uint64_t v32 = v109[21];
  if (recordMoveRequest)
  {
    if (v32) {
      objc_msgSend_mergeFrom_(recordMoveRequest, (const char *)v109, v32);
    }
  }
  else if (v32)
  {
    objc_msgSend_setRecordMoveRequest_(self, (const char *)v109, v32);
  }
  shareAccessRequest = self->_shareAccessRequest;
  uint64_t v34 = v109[30];
  if (shareAccessRequest)
  {
    if (v34) {
      objc_msgSend_mergeFrom_(shareAccessRequest, (const char *)v109, v34);
    }
  }
  else if (v34)
  {
    objc_msgSend_setShareAccessRequest_(self, (const char *)v109, v34);
  }
  queryRetrieveRequest = self->_queryRetrieveRequest;
  uint64_t v36 = v109[19];
  if (queryRetrieveRequest)
  {
    if (v36) {
      objc_msgSend_mergeFrom_(queryRetrieveRequest, (const char *)v109, v36);
    }
  }
  else if (v36)
  {
    objc_msgSend_setQueryRetrieveRequest_(self, (const char *)v109, v36);
  }
  mergeableDeltaSaveRequest = self->_mergeableDeltaSaveRequest;
  uint64_t v38 = v109[16];
  if (mergeableDeltaSaveRequest)
  {
    if (v38) {
      objc_msgSend_mergeFrom_(mergeableDeltaSaveRequest, (const char *)v109, v38);
    }
  }
  else if (v38)
  {
    objc_msgSend_setMergeableDeltaSaveRequest_(self, (const char *)v109, v38);
  }
  mergeableDeltaMetadataRetrieveRequest = self->_mergeableDeltaMetadataRetrieveRequest;
  uint64_t v40 = v109[13];
  if (mergeableDeltaMetadataRetrieveRequest)
  {
    if (v40) {
      objc_msgSend_mergeFrom_(mergeableDeltaMetadataRetrieveRequest, (const char *)v109, v40);
    }
  }
  else if (v40)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveRequest_(self, (const char *)v109, v40);
  }
  mergeableDeltaReplaceRequest = self->_mergeableDeltaReplaceRequest;
  uint64_t v42 = v109[14];
  if (mergeableDeltaReplaceRequest)
  {
    if (v42) {
      objc_msgSend_mergeFrom_(mergeableDeltaReplaceRequest, (const char *)v109, v42);
    }
  }
  else if (v42)
  {
    objc_msgSend_setMergeableDeltaReplaceRequest_(self, (const char *)v109, v42);
  }
  mergeableDeltaRetrieveRequest = self->_mergeableDeltaRetrieveRequest;
  uint64_t v44 = v109[15];
  if (mergeableDeltaRetrieveRequest)
  {
    if (v44) {
      objc_msgSend_mergeFrom_(mergeableDeltaRetrieveRequest, (const char *)v109, v44);
    }
  }
  else if (v44)
  {
    objc_msgSend_setMergeableDeltaRetrieveRequest_(self, (const char *)v109, v44);
  }
  assetUploadTokenRetrieveRequest = self->_assetUploadTokenRetrieveRequest;
  uint64_t v46 = v109[6];
  if (assetUploadTokenRetrieveRequest)
  {
    if (v46) {
      objc_msgSend_mergeFrom_(assetUploadTokenRetrieveRequest, (const char *)v109, v46);
    }
  }
  else if (v46)
  {
    objc_msgSend_setAssetUploadTokenRetrieveRequest_(self, (const char *)v109, v46);
  }
  deleteContainerRequest = self->_deleteContainerRequest;
  uint64_t v48 = v109[8];
  if (deleteContainerRequest)
  {
    if (v48) {
      objc_msgSend_mergeFrom_(deleteContainerRequest, (const char *)v109, v48);
    }
  }
  else if (v48)
  {
    objc_msgSend_setDeleteContainerRequest_(self, (const char *)v109, v48);
  }
  userAvailableQuotaRequest = self->_userAvailableQuotaRequest;
  uint64_t v50 = v109[40];
  if (userAvailableQuotaRequest)
  {
    if (v50) {
      objc_msgSend_mergeFrom_(userAvailableQuotaRequest, (const char *)v109, v50);
    }
  }
  else if (v50)
  {
    objc_msgSend_setUserAvailableQuotaRequest_(self, (const char *)v109, v50);
  }
  bundlesForContainerRequest = self->_bundlesForContainerRequest;
  uint64_t v52 = v109[7];
  if (bundlesForContainerRequest)
  {
    if (v52) {
      objc_msgSend_mergeFrom_(bundlesForContainerRequest, (const char *)v109, v52);
    }
  }
  else if (v52)
  {
    objc_msgSend_setBundlesForContainerRequest_(self, (const char *)v109, v52);
  }
  webAuthTokenRetrieveRequest = self->_webAuthTokenRetrieveRequest;
  uint64_t v54 = v109[47];
  if (webAuthTokenRetrieveRequest)
  {
    if (v54) {
      objc_msgSend_mergeFrom_(webAuthTokenRetrieveRequest, (const char *)v109, v54);
    }
  }
  else if (v54)
  {
    objc_msgSend_setWebAuthTokenRetrieveRequest_(self, (const char *)v109, v54);
  }
  updateMissingAssetStatusRequest = self->_updateMissingAssetStatusRequest;
  uint64_t v56 = v109[39];
  if (updateMissingAssetStatusRequest)
  {
    if (v56) {
      objc_msgSend_mergeFrom_(updateMissingAssetStatusRequest, (const char *)v109, v56);
    }
  }
  else if (v56)
  {
    objc_msgSend_setUpdateMissingAssetStatusRequest_(self, (const char *)v109, v56);
  }
  anonymousShareAddRequest = self->_anonymousShareAddRequest;
  uint64_t v58 = v109[3];
  if (anonymousShareAddRequest)
  {
    if (v58) {
      objc_msgSend_mergeFrom_(anonymousShareAddRequest, (const char *)v109, v58);
    }
  }
  else if (v58)
  {
    objc_msgSend_setAnonymousShareAddRequest_(self, (const char *)v109, v58);
  }
  anonymousShareRemoveRequest = self->_anonymousShareRemoveRequest;
  uint64_t v60 = v109[4];
  if (anonymousShareRemoveRequest)
  {
    if (v60) {
      objc_msgSend_mergeFrom_(anonymousShareRemoveRequest, (const char *)v109, v60);
    }
  }
  else if (v60)
  {
    objc_msgSend_setAnonymousShareRemoveRequest_(self, (const char *)v109, v60);
  }
  subscriptionCreateRequest = self->_subscriptionCreateRequest;
  uint64_t v62 = v109[34];
  if (subscriptionCreateRequest)
  {
    if (v62) {
      objc_msgSend_mergeFrom_(subscriptionCreateRequest, (const char *)v109, v62);
    }
  }
  else if (v62)
  {
    objc_msgSend_setSubscriptionCreateRequest_(self, (const char *)v109, v62);
  }
  subscriptionRetrieveRequest = self->_subscriptionRetrieveRequest;
  uint64_t v64 = v109[36];
  if (subscriptionRetrieveRequest)
  {
    if (v64) {
      objc_msgSend_mergeFrom_(subscriptionRetrieveRequest, (const char *)v109, v64);
    }
  }
  else if (v64)
  {
    objc_msgSend_setSubscriptionRetrieveRequest_(self, (const char *)v109, v64);
  }
  subscriptionDeleteRequest = self->_subscriptionDeleteRequest;
  uint64_t v66 = v109[35];
  if (subscriptionDeleteRequest)
  {
    if (v66) {
      objc_msgSend_mergeFrom_(subscriptionDeleteRequest, (const char *)v109, v66);
    }
  }
  else if (v66)
  {
    objc_msgSend_setSubscriptionDeleteRequest_(self, (const char *)v109, v66);
  }
  userRetrieveRequest = self->_userRetrieveRequest;
  uint64_t v68 = v109[46];
  if (userRetrieveRequest)
  {
    if (v68) {
      objc_msgSend_mergeFrom_(userRetrieveRequest, (const char *)v109, v68);
    }
  }
  else if (v68)
  {
    objc_msgSend_setUserRetrieveRequest_(self, (const char *)v109, v68);
  }
  userQueryRequest = self->_userQueryRequest;
  uint64_t v70 = v109[45];
  if (userQueryRequest)
  {
    if (v70) {
      objc_msgSend_mergeFrom_(userQueryRequest, (const char *)v109, v70);
    }
  }
  else if (v70)
  {
    objc_msgSend_setUserQueryRequest_(self, (const char *)v109, v70);
  }
  userPrivacySettingsRetrieveRequest = self->_userPrivacySettingsRetrieveRequest;
  uint64_t v72 = v109[43];
  if (userPrivacySettingsRetrieveRequest)
  {
    if (v72) {
      objc_msgSend_mergeFrom_(userPrivacySettingsRetrieveRequest, (const char *)v109, v72);
    }
  }
  else if (v72)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveRequest_(self, (const char *)v109, v72);
  }
  userPrivacySettingsUpdateRequest = self->_userPrivacySettingsUpdateRequest;
  uint64_t v74 = v109[44];
  if (userPrivacySettingsUpdateRequest)
  {
    if (v74) {
      objc_msgSend_mergeFrom_(userPrivacySettingsUpdateRequest, (const char *)v109, v74);
    }
  }
  else if (v74)
  {
    objc_msgSend_setUserPrivacySettingsUpdateRequest_(self, (const char *)v109, v74);
  }
  userPrivacySettingsResetRequest = self->_userPrivacySettingsResetRequest;
  uint64_t v76 = v109[42];
  if (userPrivacySettingsResetRequest)
  {
    if (v76) {
      objc_msgSend_mergeFrom_(userPrivacySettingsResetRequest, (const char *)v109, v76);
    }
  }
  else if (v76)
  {
    objc_msgSend_setUserPrivacySettingsResetRequest_(self, (const char *)v109, v76);
  }
  userPrivacySettingsBatchLookupRequest = self->_userPrivacySettingsBatchLookupRequest;
  uint64_t v78 = v109[41];
  if (userPrivacySettingsBatchLookupRequest)
  {
    if (v78) {
      objc_msgSend_mergeFrom_(userPrivacySettingsBatchLookupRequest, (const char *)v109, v78);
    }
  }
  else if (v78)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupRequest_(self, (const char *)v109, v78);
  }
  adopterCapabilitiesSaveRequest = self->_adopterCapabilitiesSaveRequest;
  uint64_t v80 = v109[2];
  if (adopterCapabilitiesSaveRequest)
  {
    if (v80) {
      objc_msgSend_mergeFrom_(adopterCapabilitiesSaveRequest, (const char *)v109, v80);
    }
  }
  else if (v80)
  {
    objc_msgSend_setAdopterCapabilitiesSaveRequest_(self, (const char *)v109, v80);
  }
  adopterCapabilitiesCheckRequest = self->_adopterCapabilitiesCheckRequest;
  uint64_t v82 = v109[1];
  if (adopterCapabilitiesCheckRequest)
  {
    if (v82) {
      objc_msgSend_mergeFrom_(adopterCapabilitiesCheckRequest, (const char *)v109, v82);
    }
  }
  else if (v82)
  {
    objc_msgSend_setAdopterCapabilitiesCheckRequest_(self, (const char *)v109, v82);
  }
  zoneUsageSaveRequest = self->_zoneUsageSaveRequest;
  uint64_t v84 = v109[52];
  if (zoneUsageSaveRequest)
  {
    if (v84) {
      objc_msgSend_mergeFrom_(zoneUsageSaveRequest, (const char *)v109, v84);
    }
  }
  else if (v84)
  {
    objc_msgSend_setZoneUsageSaveRequest_(self, (const char *)v109, v84);
  }
  shareUsageSaveRequest = self->_shareUsageSaveRequest;
  uint64_t v86 = v109[32];
  if (shareUsageSaveRequest)
  {
    if (v86) {
      objc_msgSend_mergeFrom_(shareUsageSaveRequest, (const char *)v109, v86);
    }
  }
  else if (v86)
  {
    objc_msgSend_setShareUsageSaveRequest_(self, (const char *)v109, v86);
  }
  shareAcceptRequest = self->_shareAcceptRequest;
  uint64_t v88 = v109[29];
  if (shareAcceptRequest)
  {
    if (v88) {
      objc_msgSend_mergeFrom_(shareAcceptRequest, (const char *)v109, v88);
    }
  }
  else if (v88)
  {
    objc_msgSend_setShareAcceptRequest_(self, (const char *)v109, v88);
  }
  shareDeclineRequest = self->_shareDeclineRequest;
  uint64_t v90 = v109[31];
  if (shareDeclineRequest)
  {
    if (v90) {
      objc_msgSend_mergeFrom_(shareDeclineRequest, (const char *)v109, v90);
    }
  }
  else if (v90)
  {
    objc_msgSend_setShareDeclineRequest_(self, (const char *)v109, v90);
  }
  shareVettingInitiateRequest = self->_shareVettingInitiateRequest;
  uint64_t v92 = v109[33];
  if (shareVettingInitiateRequest)
  {
    if (v92) {
      objc_msgSend_mergeFrom_(shareVettingInitiateRequest, (const char *)v109, v92);
    }
  }
  else if (v92)
  {
    objc_msgSend_setShareVettingInitiateRequest_(self, (const char *)v109, v92);
  }
  tokenRegistrationRequest = self->_tokenRegistrationRequest;
  uint64_t v94 = v109[37];
  if (tokenRegistrationRequest)
  {
    if (v94) {
      objc_msgSend_mergeFrom_(tokenRegistrationRequest, (const char *)v109, v94);
    }
  }
  else if (v94)
  {
    objc_msgSend_setTokenRegistrationRequest_(self, (const char *)v109, v94);
  }
  tokenUnregistrationRequest = self->_tokenUnregistrationRequest;
  uint64_t v96 = v109[38];
  if (tokenUnregistrationRequest)
  {
    if (v96) {
      objc_msgSend_mergeFrom_(tokenUnregistrationRequest, (const char *)v109, v96);
    }
  }
  else if (v96)
  {
    objc_msgSend_setTokenUnregistrationRequest_(self, (const char *)v109, v96);
  }
  setBadgeCountRequest = self->_setBadgeCountRequest;
  uint64_t v98 = v109[28];
  if (setBadgeCountRequest)
  {
    if (v98) {
      objc_msgSend_mergeFrom_(setBadgeCountRequest, (const char *)v109, v98);
    }
  }
  else if (v98)
  {
    objc_msgSend_setSetBadgeCountRequest_(self, (const char *)v109, v98);
  }
  notificationSyncRequest = self->_notificationSyncRequest;
  uint64_t v100 = v109[18];
  if (notificationSyncRequest)
  {
    if (v100) {
      objc_msgSend_mergeFrom_(notificationSyncRequest, (const char *)v109, v100);
    }
  }
  else if (v100)
  {
    objc_msgSend_setNotificationSyncRequest_(self, (const char *)v109, v100);
  }
  notificationMarkReadRequest = self->_notificationMarkReadRequest;
  uint64_t v102 = v109[17];
  if (notificationMarkReadRequest)
  {
    if (v102) {
      objc_msgSend_mergeFrom_(notificationMarkReadRequest, (const char *)v109, v102);
    }
  }
  else if (v102)
  {
    objc_msgSend_setNotificationMarkReadRequest_(self, (const char *)v109, v102);
  }
  archiveRecordsRequest = self->_archiveRecordsRequest;
  uint64_t v104 = v109[5];
  if (archiveRecordsRequest)
  {
    if (v104) {
      objc_msgSend_mergeFrom_(archiveRecordsRequest, (const char *)v109, v104);
    }
  }
  else if (v104)
  {
    objc_msgSend_setArchiveRecordsRequest_(self, (const char *)v109, v104);
  }
  markAssetBrokenRequest = self->_markAssetBrokenRequest;
  uint64_t v106 = v109[12];
  if (markAssetBrokenRequest)
  {
    if (v106) {
      objc_msgSend_mergeFrom_(markAssetBrokenRequest, (const char *)v109, v106);
    }
  }
  else if (v106)
  {
    objc_msgSend_setMarkAssetBrokenRequest_(self, (const char *)v109, v106);
  }
  functionInvokeRequest = self->_functionInvokeRequest;
  uint64_t v108 = v109[10];
  if (functionInvokeRequest)
  {
    if (v108) {
      objc_msgSend_mergeFrom_(functionInvokeRequest, (const char *)v109, v108);
    }
  }
  else if (v108)
  {
    objc_msgSend_setFunctionInvokeRequest_(self, (const char *)v109, v108);
  }
}

- (CKDPRequestOperationHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (CKDPOperation)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUsageSaveRequest, 0);
  objc_storeStrong((id *)&self->_zoneSaveRequest, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveChangesRequest, 0);
  objc_storeStrong((id *)&self->_zoneDeleteRequest, 0);
  objc_storeStrong((id *)&self->_webAuthTokenRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_userRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_userQueryRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsUpdateRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsResetRequest, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsBatchLookupRequest, 0);
  objc_storeStrong((id *)&self->_userAvailableQuotaRequest, 0);
  objc_storeStrong((id *)&self->_updateMissingAssetStatusRequest, 0);
  objc_storeStrong((id *)&self->_tokenUnregistrationRequest, 0);
  objc_storeStrong((id *)&self->_tokenRegistrationRequest, 0);
  objc_storeStrong((id *)&self->_subscriptionRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_subscriptionDeleteRequest, 0);
  objc_storeStrong((id *)&self->_subscriptionCreateRequest, 0);
  objc_storeStrong((id *)&self->_shareVettingInitiateRequest, 0);
  objc_storeStrong((id *)&self->_shareUsageSaveRequest, 0);
  objc_storeStrong((id *)&self->_shareDeclineRequest, 0);
  objc_storeStrong((id *)&self->_shareAccessRequest, 0);
  objc_storeStrong((id *)&self->_shareAcceptRequest, 0);
  objc_storeStrong((id *)&self->_setBadgeCountRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_recordSaveRequest, 0);
  objc_storeStrong((id *)&self->_recordRetrieveVersionsRequest, 0);
  objc_storeStrong((id *)&self->_recordRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_recordRetrieveChangesRequest, 0);
  objc_storeStrong((id *)&self->_recordResolveTokenRequest, 0);
  objc_storeStrong((id *)&self->_recordMoveRequest, 0);
  objc_storeStrong((id *)&self->_recordDeleteRequest, 0);
  objc_storeStrong((id *)&self->_queryRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_notificationSyncRequest, 0);
  objc_storeStrong((id *)&self->_notificationMarkReadRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaSaveRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaReplaceRequest, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_markAssetBrokenRequest, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_functionInvokeRequest, 0);
  objc_storeStrong((id *)&self->_fetchArchivedRecordsRequest, 0);
  objc_storeStrong((id *)&self->_deleteContainerRequest, 0);
  objc_storeStrong((id *)&self->_bundlesForContainerRequest, 0);
  objc_storeStrong((id *)&self->_assetUploadTokenRetrieveRequest, 0);
  objc_storeStrong((id *)&self->_archiveRecordsRequest, 0);
  objc_storeStrong((id *)&self->_anonymousShareRemoveRequest, 0);
  objc_storeStrong((id *)&self->_anonymousShareAddRequest, 0);
  objc_storeStrong((id *)&self->_adopterCapabilitiesSaveRequest, 0);
  objc_storeStrong((id *)&self->_adopterCapabilitiesCheckRequest, 0);
}

- (BOOL)hasFunctionInvokeRequest
{
  return self->_functionInvokeRequest != 0;
}

- (CKDPCodeFunctionInvokeRequest)functionInvokeRequest
{
  return self->_functionInvokeRequest;
}

- (void)setFunctionInvokeRequest:(id)a3
{
}

- (BOOL)hasMergeableDeltaSaveRequest
{
  return self->_mergeableDeltaSaveRequest != 0;
}

- (CKDPMergeableDeltaSaveRequest)mergeableDeltaSaveRequest
{
  return self->_mergeableDeltaSaveRequest;
}

- (void)setMergeableDeltaSaveRequest:(id)a3
{
}

- (BOOL)hasMergeableDeltaMetadataRetrieveRequest
{
  return self->_mergeableDeltaMetadataRetrieveRequest != 0;
}

- (CKDPMergeableDeltaMetadataRetrieveRequest)mergeableDeltaMetadataRetrieveRequest
{
  return self->_mergeableDeltaMetadataRetrieveRequest;
}

- (void)setMergeableDeltaMetadataRetrieveRequest:(id)a3
{
}

- (BOOL)hasMergeableDeltaReplaceRequest
{
  return self->_mergeableDeltaReplaceRequest != 0;
}

- (CKDPMergeableDeltaReplaceRequest)mergeableDeltaReplaceRequest
{
  return self->_mergeableDeltaReplaceRequest;
}

- (void)setMergeableDeltaReplaceRequest:(id)a3
{
}

- (BOOL)hasMergeableDeltaRetrieveRequest
{
  return self->_mergeableDeltaRetrieveRequest != 0;
}

- (CKDPMergeableDeltaRetrieveRequest)mergeableDeltaRetrieveRequest
{
  return self->_mergeableDeltaRetrieveRequest;
}

- (void)setMergeableDeltaRetrieveRequest:(id)a3
{
}

- (BOOL)hasShareVettingInitiateRequest
{
  return self->_shareVettingInitiateRequest != 0;
}

- (CKDPShareVettingInitiateRequest)shareVettingInitiateRequest
{
  return self->_shareVettingInitiateRequest;
}

- (void)setShareVettingInitiateRequest:(id)a3
{
}

- (BOOL)hasZoneSaveRequest
{
  return self->_zoneSaveRequest != 0;
}

- (CKDPZoneSaveRequest)zoneSaveRequest
{
  return self->_zoneSaveRequest;
}

- (void)setZoneSaveRequest:(id)a3
{
}

- (BOOL)hasZoneRetrieveRequest
{
  return self->_zoneRetrieveRequest != 0;
}

- (CKDPZoneRetrieveRequest)zoneRetrieveRequest
{
  return self->_zoneRetrieveRequest;
}

- (void)setZoneRetrieveRequest:(id)a3
{
}

- (BOOL)hasZoneDeleteRequest
{
  return self->_zoneDeleteRequest != 0;
}

- (CKDPZoneDeleteRequest)zoneDeleteRequest
{
  return self->_zoneDeleteRequest;
}

- (void)setZoneDeleteRequest:(id)a3
{
}

- (BOOL)hasZoneRetrieveChangesRequest
{
  return self->_zoneRetrieveChangesRequest != 0;
}

- (CKDPZoneRetrieveChangesRequest)zoneRetrieveChangesRequest
{
  return self->_zoneRetrieveChangesRequest;
}

- (void)setZoneRetrieveChangesRequest:(id)a3
{
}

- (BOOL)hasRecordSaveRequest
{
  return self->_recordSaveRequest != 0;
}

- (CKDPRecordSaveRequest)recordSaveRequest
{
  return self->_recordSaveRequest;
}

- (void)setRecordSaveRequest:(id)a3
{
}

- (BOOL)hasRecordRetrieveRequest
{
  return self->_recordRetrieveRequest != 0;
}

- (CKDPRecordRetrieveRequest)recordRetrieveRequest
{
  return self->_recordRetrieveRequest;
}

- (void)setRecordRetrieveRequest:(id)a3
{
}

- (BOOL)hasRecordRetrieveVersionsRequest
{
  return self->_recordRetrieveVersionsRequest != 0;
}

- (CKDPRecordRetrieveVersionsRequest)recordRetrieveVersionsRequest
{
  return self->_recordRetrieveVersionsRequest;
}

- (void)setRecordRetrieveVersionsRequest:(id)a3
{
}

- (BOOL)hasRecordRetrieveChangesRequest
{
  return self->_recordRetrieveChangesRequest != 0;
}

- (CKDPRecordRetrieveChangesRequest)recordRetrieveChangesRequest
{
  return self->_recordRetrieveChangesRequest;
}

- (void)setRecordRetrieveChangesRequest:(id)a3
{
}

- (BOOL)hasRecordDeleteRequest
{
  return self->_recordDeleteRequest != 0;
}

- (CKDPRecordDeleteRequest)recordDeleteRequest
{
  return self->_recordDeleteRequest;
}

- (void)setRecordDeleteRequest:(id)a3
{
}

- (BOOL)hasRecordResolveTokenRequest
{
  return self->_recordResolveTokenRequest != 0;
}

- (CKDPRecordResolveTokenRequest)recordResolveTokenRequest
{
  return self->_recordResolveTokenRequest;
}

- (void)setRecordResolveTokenRequest:(id)a3
{
}

- (BOOL)hasShareAccessRequest
{
  return self->_shareAccessRequest != 0;
}

- (CKDPShareAccessRequest)shareAccessRequest
{
  return self->_shareAccessRequest;
}

- (void)setShareAccessRequest:(id)a3
{
}

- (BOOL)hasRecordMoveRequest
{
  return self->_recordMoveRequest != 0;
}

- (CKDPRecordMoveRequest)recordMoveRequest
{
  return self->_recordMoveRequest;
}

- (void)setRecordMoveRequest:(id)a3
{
}

- (BOOL)hasFetchArchivedRecordsRequest
{
  return self->_fetchArchivedRecordsRequest != 0;
}

- (CKDPFetchArchivedRecordsRequest)fetchArchivedRecordsRequest
{
  return self->_fetchArchivedRecordsRequest;
}

- (void)setFetchArchivedRecordsRequest:(id)a3
{
}

- (BOOL)hasUserAvailableQuotaRequest
{
  return self->_userAvailableQuotaRequest != 0;
}

- (CKDPUserAvailableQuotaRequest)userAvailableQuotaRequest
{
  return self->_userAvailableQuotaRequest;
}

- (void)setUserAvailableQuotaRequest:(id)a3
{
}

- (BOOL)hasUserRetrieveRequest
{
  return self->_userRetrieveRequest != 0;
}

- (CKDPUserRetrieveRequest)userRetrieveRequest
{
  return self->_userRetrieveRequest;
}

- (void)setUserRetrieveRequest:(id)a3
{
}

- (BOOL)hasQueryRetrieveRequest
{
  return self->_queryRetrieveRequest != 0;
}

- (CKDPQueryRetrieveRequest)queryRetrieveRequest
{
  return self->_queryRetrieveRequest;
}

- (void)setQueryRetrieveRequest:(id)a3
{
}

- (BOOL)hasAssetUploadTokenRetrieveRequest
{
  return self->_assetUploadTokenRetrieveRequest != 0;
}

- (CKDPAssetUploadTokenRetrieveRequest)assetUploadTokenRetrieveRequest
{
  return self->_assetUploadTokenRetrieveRequest;
}

- (void)setAssetUploadTokenRetrieveRequest:(id)a3
{
}

- (BOOL)hasDeleteContainerRequest
{
  return self->_deleteContainerRequest != 0;
}

- (CKDPDeleteContainerRequest)deleteContainerRequest
{
  return self->_deleteContainerRequest;
}

- (void)setDeleteContainerRequest:(id)a3
{
}

- (BOOL)hasBundlesForContainerRequest
{
  return self->_bundlesForContainerRequest != 0;
}

- (CKDPBundlesForContainerRequest)bundlesForContainerRequest
{
  return self->_bundlesForContainerRequest;
}

- (void)setBundlesForContainerRequest:(id)a3
{
}

- (BOOL)hasWebAuthTokenRetrieveRequest
{
  return self->_webAuthTokenRetrieveRequest != 0;
}

- (CKDPWebAuthTokenRetrieveRequest)webAuthTokenRetrieveRequest
{
  return self->_webAuthTokenRetrieveRequest;
}

- (void)setWebAuthTokenRetrieveRequest:(id)a3
{
}

- (BOOL)hasUpdateMissingAssetStatusRequest
{
  return self->_updateMissingAssetStatusRequest != 0;
}

- (CKDPUpdateMissingAssetStatusRequest)updateMissingAssetStatusRequest
{
  return self->_updateMissingAssetStatusRequest;
}

- (void)setUpdateMissingAssetStatusRequest:(id)a3
{
}

- (BOOL)hasShareAcceptRequest
{
  return self->_shareAcceptRequest != 0;
}

- (CKDPShareAcceptRequest)shareAcceptRequest
{
  return self->_shareAcceptRequest;
}

- (void)setShareAcceptRequest:(id)a3
{
}

- (BOOL)hasShareDeclineRequest
{
  return self->_shareDeclineRequest != 0;
}

- (CKDPShareDeclineRequest)shareDeclineRequest
{
  return self->_shareDeclineRequest;
}

- (void)setShareDeclineRequest:(id)a3
{
}

- (BOOL)hasAnonymousShareAddRequest
{
  return self->_anonymousShareAddRequest != 0;
}

- (CKDPAnonymousShareAddRequest)anonymousShareAddRequest
{
  return self->_anonymousShareAddRequest;
}

- (void)setAnonymousShareAddRequest:(id)a3
{
}

- (BOOL)hasAnonymousShareRemoveRequest
{
  return self->_anonymousShareRemoveRequest != 0;
}

- (CKDPAnonymousShareRemoveRequest)anonymousShareRemoveRequest
{
  return self->_anonymousShareRemoveRequest;
}

- (void)setAnonymousShareRemoveRequest:(id)a3
{
}

- (BOOL)hasSubscriptionCreateRequest
{
  return self->_subscriptionCreateRequest != 0;
}

- (CKDPSubscriptionCreateRequest)subscriptionCreateRequest
{
  return self->_subscriptionCreateRequest;
}

- (void)setSubscriptionCreateRequest:(id)a3
{
}

- (BOOL)hasSubscriptionRetrieveRequest
{
  return self->_subscriptionRetrieveRequest != 0;
}

- (CKDPSubscriptionRetrieveRequest)subscriptionRetrieveRequest
{
  return self->_subscriptionRetrieveRequest;
}

- (void)setSubscriptionRetrieveRequest:(id)a3
{
}

- (BOOL)hasSubscriptionDeleteRequest
{
  return self->_subscriptionDeleteRequest != 0;
}

- (CKDPSubscriptionDeleteRequest)subscriptionDeleteRequest
{
  return self->_subscriptionDeleteRequest;
}

- (void)setSubscriptionDeleteRequest:(id)a3
{
}

- (BOOL)hasArchiveRecordsRequest
{
  return self->_archiveRecordsRequest != 0;
}

- (CKDPArchiveRecordsRequest)archiveRecordsRequest
{
  return self->_archiveRecordsRequest;
}

- (void)setArchiveRecordsRequest:(id)a3
{
}

- (BOOL)hasMarkAssetBrokenRequest
{
  return self->_markAssetBrokenRequest != 0;
}

- (CKDPMarkAssetBrokenRequest)markAssetBrokenRequest
{
  return self->_markAssetBrokenRequest;
}

- (void)setMarkAssetBrokenRequest:(id)a3
{
}

- (BOOL)hasUserQueryRequest
{
  return self->_userQueryRequest != 0;
}

- (CKDPUserQueryRequest)userQueryRequest
{
  return self->_userQueryRequest;
}

- (void)setUserQueryRequest:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsUpdateRequest
{
  return self->_userPrivacySettingsUpdateRequest != 0;
}

- (CKDPUserPrivacySettingsUpdateRequest)userPrivacySettingsUpdateRequest
{
  return self->_userPrivacySettingsUpdateRequest;
}

- (void)setUserPrivacySettingsUpdateRequest:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsResetRequest
{
  return self->_userPrivacySettingsResetRequest != 0;
}

- (CKDPUserPrivacySettingsResetRequest)userPrivacySettingsResetRequest
{
  return self->_userPrivacySettingsResetRequest;
}

- (void)setUserPrivacySettingsResetRequest:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsBatchLookupRequest
{
  return self->_userPrivacySettingsBatchLookupRequest != 0;
}

- (CKDPUserPrivacySettingsBatchLookupRequest)userPrivacySettingsBatchLookupRequest
{
  return self->_userPrivacySettingsBatchLookupRequest;
}

- (void)setUserPrivacySettingsBatchLookupRequest:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsRetrieveRequest
{
  return self->_userPrivacySettingsRetrieveRequest != 0;
}

- (CKDPUserPrivacySettingsRetrieveRequest)userPrivacySettingsRetrieveRequest
{
  return self->_userPrivacySettingsRetrieveRequest;
}

- (void)setUserPrivacySettingsRetrieveRequest:(id)a3
{
}

- (BOOL)hasAdopterCapabilitiesSaveRequest
{
  return self->_adopterCapabilitiesSaveRequest != 0;
}

- (CKDPAdopterCapabilitiesSaveRequest)adopterCapabilitiesSaveRequest
{
  return self->_adopterCapabilitiesSaveRequest;
}

- (void)setAdopterCapabilitiesSaveRequest:(id)a3
{
}

- (BOOL)hasZoneUsageSaveRequest
{
  return self->_zoneUsageSaveRequest != 0;
}

- (CKDPZoneUsageSaveRequest)zoneUsageSaveRequest
{
  return self->_zoneUsageSaveRequest;
}

- (void)setZoneUsageSaveRequest:(id)a3
{
}

- (BOOL)hasShareUsageSaveRequest
{
  return self->_shareUsageSaveRequest != 0;
}

- (CKDPShareUsageSaveRequest)shareUsageSaveRequest
{
  return self->_shareUsageSaveRequest;
}

- (void)setShareUsageSaveRequest:(id)a3
{
}

- (BOOL)hasAdopterCapabilitiesCheckRequest
{
  return self->_adopterCapabilitiesCheckRequest != 0;
}

- (CKDPAdopterCapabilitiesCheckRequest)adopterCapabilitiesCheckRequest
{
  return self->_adopterCapabilitiesCheckRequest;
}

- (void)setAdopterCapabilitiesCheckRequest:(id)a3
{
}

- (BOOL)hasTokenRegistrationRequest
{
  return self->_tokenRegistrationRequest != 0;
}

- (CKDPTokenRegistrationRequest)tokenRegistrationRequest
{
  return self->_tokenRegistrationRequest;
}

- (void)setTokenRegistrationRequest:(id)a3
{
}

- (BOOL)hasTokenUnregistrationRequest
{
  return self->_tokenUnregistrationRequest != 0;
}

- (CKDPTokenUnregistrationRequest)tokenUnregistrationRequest
{
  return self->_tokenUnregistrationRequest;
}

- (void)setTokenUnregistrationRequest:(id)a3
{
}

- (BOOL)hasSetBadgeCountRequest
{
  return self->_setBadgeCountRequest != 0;
}

- (CKDPSetBadgeCountRequest)setBadgeCountRequest
{
  return self->_setBadgeCountRequest;
}

- (void)setSetBadgeCountRequest:(id)a3
{
}

- (BOOL)hasNotificationSyncRequest
{
  return self->_notificationSyncRequest != 0;
}

- (CKDPNotificationSyncRequest)notificationSyncRequest
{
  return self->_notificationSyncRequest;
}

- (void)setNotificationSyncRequest:(id)a3
{
}

- (BOOL)hasNotificationMarkReadRequest
{
  return self->_notificationMarkReadRequest != 0;
}

- (CKDPNotificationMarkReadRequest)notificationMarkReadRequest
{
  return self->_notificationMarkReadRequest;
}

- (void)setNotificationMarkReadRequest:(id)a3
{
}

@end