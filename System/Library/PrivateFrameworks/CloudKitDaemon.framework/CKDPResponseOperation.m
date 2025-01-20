@interface CKDPResponseOperation
- (BOOL)hasAdopterCapabilitiesCheckResponse;
- (BOOL)hasAdopterCapabilitiesSaveResponse;
- (BOOL)hasAnonymousShareAddResponse;
- (BOOL)hasAnonymousShareRemoveResponse;
- (BOOL)hasArchiveRecordsResponse;
- (BOOL)hasAssetUploadTokenRetrieveResponse;
- (BOOL)hasBundlesForContainerResponse;
- (BOOL)hasDeleteContainerResponse;
- (BOOL)hasFetchArchivedRecordsResponse;
- (BOOL)hasFunctionInvokeResponse;
- (BOOL)hasHeader;
- (BOOL)hasMarkAssetBrokenResponse;
- (BOOL)hasMergeableDeltaMetadataRetrieveResponse;
- (BOOL)hasMergeableDeltaReplaceResponse;
- (BOOL)hasMergeableDeltaRetrieveResponse;
- (BOOL)hasMergeableDeltaSaveResponse;
- (BOOL)hasNotificationMarkReadResponse;
- (BOOL)hasNotificationSyncResponse;
- (BOOL)hasQueryRetrieveResponse;
- (BOOL)hasRecordDeleteResponse;
- (BOOL)hasRecordMoveResponse;
- (BOOL)hasRecordResolveTokenResponse;
- (BOOL)hasRecordRetrieveChangesResponse;
- (BOOL)hasRecordRetrieveResponse;
- (BOOL)hasRecordRetrieveVersionsResponse;
- (BOOL)hasRecordSaveResponse;
- (BOOL)hasResponse;
- (BOOL)hasResult;
- (BOOL)hasSetBadgeCountResponse;
- (BOOL)hasShareAcceptResponse;
- (BOOL)hasShareAccessResponse;
- (BOOL)hasShareDeclineResponse;
- (BOOL)hasShareUsageSaveResponse;
- (BOOL)hasShareVettingInitiateResponse;
- (BOOL)hasSubscriptionCreateResponse;
- (BOOL)hasSubscriptionDeleteResponse;
- (BOOL)hasSubscriptionRetrieveResponse;
- (BOOL)hasTokenRegistrationResponse;
- (BOOL)hasTokenUnregistrationResponse;
- (BOOL)hasUpdateMissingAssetStatusResponse;
- (BOOL)hasUserAvailableQuotaResponse;
- (BOOL)hasUserPrivacySettingsBatchLookupResponse;
- (BOOL)hasUserPrivacySettingsResetResponse;
- (BOOL)hasUserPrivacySettingsRetrieveResponse;
- (BOOL)hasUserPrivacySettingsUpdateResponse;
- (BOOL)hasUserQueryResponse;
- (BOOL)hasUserRetrieveResponse;
- (BOOL)hasWebAuthTokenRetrieveResponse;
- (BOOL)hasZoneDeleteResponse;
- (BOOL)hasZoneRetrieveChangesResponse;
- (BOOL)hasZoneRetrieveResponse;
- (BOOL)hasZoneSaveResponse;
- (BOOL)hasZoneUsageSaveResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAdopterCapabilitiesCheckResponse)adopterCapabilitiesCheckResponse;
- (CKDPAdopterCapabilitiesSaveResponse)adopterCapabilitiesSaveResponse;
- (CKDPAnonymousShareAddResponse)anonymousShareAddResponse;
- (CKDPAnonymousShareRemoveResponse)anonymousShareRemoveResponse;
- (CKDPArchiveRecordsResponse)archiveRecordsResponse;
- (CKDPAssetUploadTokenRetrieveResponse)assetUploadTokenRetrieveResponse;
- (CKDPBundlesForContainerResponse)bundlesForContainerResponse;
- (CKDPCodeFunctionInvokeResponse)functionInvokeResponse;
- (CKDPDeleteContainerResponse)deleteContainerResponse;
- (CKDPFetchArchivedRecordsResponse)fetchArchivedRecordsResponse;
- (CKDPMarkAssetBrokenResponse)markAssetBrokenResponse;
- (CKDPMergeableDeltaMetadataRetrieveResponse)mergeableDeltaMetadataRetrieveResponse;
- (CKDPMergeableDeltaReplaceResponse)mergeableDeltaReplaceResponse;
- (CKDPMergeableDeltaRetrieveResponse)mergeableDeltaRetrieveResponse;
- (CKDPMergeableDeltaSaveResponse)mergeableDeltaSaveResponse;
- (CKDPNotificationMarkReadResponse)notificationMarkReadResponse;
- (CKDPNotificationSyncResponse)notificationSyncResponse;
- (CKDPOperation)response;
- (CKDPQueryRetrieveResponse)queryRetrieveResponse;
- (CKDPRecordDeleteResponse)recordDeleteResponse;
- (CKDPRecordMoveResponse)recordMoveResponse;
- (CKDPRecordResolveTokenResponse)recordResolveTokenResponse;
- (CKDPRecordRetrieveChangesResponse)recordRetrieveChangesResponse;
- (CKDPRecordRetrieveResponse)recordRetrieveResponse;
- (CKDPRecordRetrieveVersionsResponse)recordRetrieveVersionsResponse;
- (CKDPRecordSaveResponse)recordSaveResponse;
- (CKDPResponseOperationHeader)header;
- (CKDPResponseOperationResult)result;
- (CKDPSetBadgeCountResponse)setBadgeCountResponse;
- (CKDPShareAcceptResponse)shareAcceptResponse;
- (CKDPShareAccessResponse)shareAccessResponse;
- (CKDPShareDeclineResponse)shareDeclineResponse;
- (CKDPShareUsageSaveResponse)shareUsageSaveResponse;
- (CKDPShareVettingInitiateResponse)shareVettingInitiateResponse;
- (CKDPSubscriptionCreateResponse)subscriptionCreateResponse;
- (CKDPSubscriptionDeleteResponse)subscriptionDeleteResponse;
- (CKDPSubscriptionRetrieveResponse)subscriptionRetrieveResponse;
- (CKDPTokenRegistrationResponse)tokenRegistrationResponse;
- (CKDPTokenUnregistrationResponse)tokenUnregistrationResponse;
- (CKDPUpdateMissingAssetStatusResponse)updateMissingAssetStatusResponse;
- (CKDPUserAvailableQuotaResponse)userAvailableQuotaResponse;
- (CKDPUserPrivacySettingsBatchLookupResponse)userPrivacySettingsBatchLookupResponse;
- (CKDPUserPrivacySettingsResetResponse)userPrivacySettingsResetResponse;
- (CKDPUserPrivacySettingsRetrieveResponse)userPrivacySettingsRetrieveResponse;
- (CKDPUserPrivacySettingsUpdateResponse)userPrivacySettingsUpdateResponse;
- (CKDPUserQueryResponse)userQueryResponse;
- (CKDPUserRetrieveResponse)userRetrieveResponse;
- (CKDPWebAuthTokenRetrieveResponse)webAuthTokenRetrieveResponse;
- (CKDPZoneDeleteResponse)zoneDeleteResponse;
- (CKDPZoneRetrieveChangesResponse)zoneRetrieveChangesResponse;
- (CKDPZoneRetrieveResponse)zoneRetrieveResponse;
- (CKDPZoneSaveResponse)zoneSaveResponse;
- (CKDPZoneUsageSaveResponse)zoneUsageSaveResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopterCapabilitiesCheckResponse:(id)a3;
- (void)setAdopterCapabilitiesSaveResponse:(id)a3;
- (void)setAnonymousShareAddResponse:(id)a3;
- (void)setAnonymousShareRemoveResponse:(id)a3;
- (void)setArchiveRecordsResponse:(id)a3;
- (void)setAssetUploadTokenRetrieveResponse:(id)a3;
- (void)setBundlesForContainerResponse:(id)a3;
- (void)setDeleteContainerResponse:(id)a3;
- (void)setFetchArchivedRecordsResponse:(id)a3;
- (void)setFunctionInvokeResponse:(id)a3;
- (void)setHeader:(id)a3;
- (void)setMarkAssetBrokenResponse:(id)a3;
- (void)setMergeableDeltaMetadataRetrieveResponse:(id)a3;
- (void)setMergeableDeltaReplaceResponse:(id)a3;
- (void)setMergeableDeltaRetrieveResponse:(id)a3;
- (void)setMergeableDeltaSaveResponse:(id)a3;
- (void)setNotificationMarkReadResponse:(id)a3;
- (void)setNotificationSyncResponse:(id)a3;
- (void)setQueryRetrieveResponse:(id)a3;
- (void)setRecordDeleteResponse:(id)a3;
- (void)setRecordMoveResponse:(id)a3;
- (void)setRecordResolveTokenResponse:(id)a3;
- (void)setRecordRetrieveChangesResponse:(id)a3;
- (void)setRecordRetrieveResponse:(id)a3;
- (void)setRecordRetrieveVersionsResponse:(id)a3;
- (void)setRecordSaveResponse:(id)a3;
- (void)setResponse:(id)a3;
- (void)setResult:(id)a3;
- (void)setSetBadgeCountResponse:(id)a3;
- (void)setShareAcceptResponse:(id)a3;
- (void)setShareAccessResponse:(id)a3;
- (void)setShareDeclineResponse:(id)a3;
- (void)setShareUsageSaveResponse:(id)a3;
- (void)setShareVettingInitiateResponse:(id)a3;
- (void)setSubscriptionCreateResponse:(id)a3;
- (void)setSubscriptionDeleteResponse:(id)a3;
- (void)setSubscriptionRetrieveResponse:(id)a3;
- (void)setTokenRegistrationResponse:(id)a3;
- (void)setTokenUnregistrationResponse:(id)a3;
- (void)setUpdateMissingAssetStatusResponse:(id)a3;
- (void)setUserAvailableQuotaResponse:(id)a3;
- (void)setUserPrivacySettingsBatchLookupResponse:(id)a3;
- (void)setUserPrivacySettingsResetResponse:(id)a3;
- (void)setUserPrivacySettingsRetrieveResponse:(id)a3;
- (void)setUserPrivacySettingsUpdateResponse:(id)a3;
- (void)setUserQueryResponse:(id)a3;
- (void)setUserRetrieveResponse:(id)a3;
- (void)setWebAuthTokenRetrieveResponse:(id)a3;
- (void)setZoneDeleteResponse:(id)a3;
- (void)setZoneRetrieveChangesResponse:(id)a3;
- (void)setZoneRetrieveResponse:(id)a3;
- (void)setZoneSaveResponse:(id)a3;
- (void)setZoneUsageSaveResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPResponseOperation

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasResult
{
  return self->_result != 0;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPResponseOperation;
  v4 = [(CKDPResponseOperation *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  response = self->_response;
  if (response)
  {
    v8 = objc_msgSend_dictionaryRepresentation(response, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"response");
  }
  v10 = self->_result;
  if (v10)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(v10, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"result");
  }
  header = self->_header;
  if (header)
  {
    v14 = objc_msgSend_dictionaryRepresentation(header, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"header");
  }
  functionInvokeResponse = self->_functionInvokeResponse;
  if (functionInvokeResponse)
  {
    v17 = objc_msgSend_dictionaryRepresentation(functionInvokeResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"functionInvokeResponse");
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  if (mergeableDeltaSaveResponse)
  {
    v20 = objc_msgSend_dictionaryRepresentation(mergeableDeltaSaveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"mergeableDeltaSaveResponse");
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  if (mergeableDeltaMetadataRetrieveResponse)
  {
    v23 = objc_msgSend_dictionaryRepresentation(mergeableDeltaMetadataRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, @"mergeableDeltaMetadataRetrieveResponse");
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  if (mergeableDeltaReplaceResponse)
  {
    v26 = objc_msgSend_dictionaryRepresentation(mergeableDeltaReplaceResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"mergeableDeltaReplaceResponse");
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  if (mergeableDeltaRetrieveResponse)
  {
    v29 = objc_msgSend_dictionaryRepresentation(mergeableDeltaRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, @"mergeableDeltaRetrieveResponse");
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  if (shareVettingInitiateResponse)
  {
    v32 = objc_msgSend_dictionaryRepresentation(shareVettingInitiateResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, @"shareVettingInitiateResponse");
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  if (zoneSaveResponse)
  {
    v35 = objc_msgSend_dictionaryRepresentation(zoneSaveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v35, @"zoneSaveResponse");
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  if (zoneRetrieveResponse)
  {
    v38 = objc_msgSend_dictionaryRepresentation(zoneRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v39, (uint64_t)v38, @"zoneRetrieveResponse");
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  if (zoneDeleteResponse)
  {
    v41 = objc_msgSend_dictionaryRepresentation(zoneDeleteResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v42, (uint64_t)v41, @"zoneDeleteResponse");
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  if (zoneRetrieveChangesResponse)
  {
    v44 = objc_msgSend_dictionaryRepresentation(zoneRetrieveChangesResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v45, (uint64_t)v44, @"zoneRetrieveChangesResponse");
  }
  recordSaveResponse = self->_recordSaveResponse;
  if (recordSaveResponse)
  {
    v47 = objc_msgSend_dictionaryRepresentation(recordSaveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v48, (uint64_t)v47, @"recordSaveResponse");
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if (recordRetrieveResponse)
  {
    v50 = objc_msgSend_dictionaryRepresentation(recordRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v51, (uint64_t)v50, @"recordRetrieveResponse");
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  if (recordRetrieveVersionsResponse)
  {
    v53 = objc_msgSend_dictionaryRepresentation(recordRetrieveVersionsResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v54, (uint64_t)v53, @"recordRetrieveVersionsResponse");
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  if (recordRetrieveChangesResponse)
  {
    v56 = objc_msgSend_dictionaryRepresentation(recordRetrieveChangesResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v57, (uint64_t)v56, @"recordRetrieveChangesResponse");
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  if (recordDeleteResponse)
  {
    v59 = objc_msgSend_dictionaryRepresentation(recordDeleteResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v60, (uint64_t)v59, @"recordDeleteResponse");
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  if (recordResolveTokenResponse)
  {
    v62 = objc_msgSend_dictionaryRepresentation(recordResolveTokenResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v62, @"recordResolveTokenResponse");
  }
  shareAccessResponse = self->_shareAccessResponse;
  if (shareAccessResponse)
  {
    v65 = objc_msgSend_dictionaryRepresentation(shareAccessResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v66, (uint64_t)v65, @"shareAccessResponse");
  }
  recordMoveResponse = self->_recordMoveResponse;
  if (recordMoveResponse)
  {
    v68 = objc_msgSend_dictionaryRepresentation(recordMoveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v69, (uint64_t)v68, @"recordMoveResponse");
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  if (fetchArchivedRecordsResponse)
  {
    v71 = objc_msgSend_dictionaryRepresentation(fetchArchivedRecordsResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v72, (uint64_t)v71, @"fetchArchivedRecordsResponse");
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  if (userAvailableQuotaResponse)
  {
    v74 = objc_msgSend_dictionaryRepresentation(userAvailableQuotaResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v75, (uint64_t)v74, @"userAvailableQuotaResponse");
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  if (userRetrieveResponse)
  {
    v77 = objc_msgSend_dictionaryRepresentation(userRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v77, @"userRetrieveResponse");
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if (queryRetrieveResponse)
  {
    v80 = objc_msgSend_dictionaryRepresentation(queryRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v81, (uint64_t)v80, @"queryRetrieveResponse");
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  if (assetUploadTokenRetrieveResponse)
  {
    v83 = objc_msgSend_dictionaryRepresentation(assetUploadTokenRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v84, (uint64_t)v83, @"assetUploadTokenRetrieveResponse");
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  if (deleteContainerResponse)
  {
    v86 = objc_msgSend_dictionaryRepresentation(deleteContainerResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v87, (uint64_t)v86, @"deleteContainerResponse");
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  if (bundlesForContainerResponse)
  {
    v89 = objc_msgSend_dictionaryRepresentation(bundlesForContainerResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v90, (uint64_t)v89, @"bundlesForContainerResponse");
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  if (webAuthTokenRetrieveResponse)
  {
    v92 = objc_msgSend_dictionaryRepresentation(webAuthTokenRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v93, (uint64_t)v92, @"webAuthTokenRetrieveResponse");
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  if (updateMissingAssetStatusResponse)
  {
    v95 = objc_msgSend_dictionaryRepresentation(updateMissingAssetStatusResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v96, (uint64_t)v95, @"updateMissingAssetStatusResponse");
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  if (shareAcceptResponse)
  {
    v98 = objc_msgSend_dictionaryRepresentation(shareAcceptResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v99, (uint64_t)v98, @"shareAcceptResponse");
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  if (shareDeclineResponse)
  {
    v101 = objc_msgSend_dictionaryRepresentation(shareDeclineResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v102, (uint64_t)v101, @"shareDeclineResponse");
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  if (anonymousShareAddResponse)
  {
    v104 = objc_msgSend_dictionaryRepresentation(anonymousShareAddResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v105, (uint64_t)v104, @"anonymousShareAddResponse");
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  if (anonymousShareRemoveResponse)
  {
    v107 = objc_msgSend_dictionaryRepresentation(anonymousShareRemoveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v108, (uint64_t)v107, @"anonymousShareRemoveResponse");
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  if (subscriptionCreateResponse)
  {
    v110 = objc_msgSend_dictionaryRepresentation(subscriptionCreateResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v111, (uint64_t)v110, @"subscriptionCreateResponse");
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  if (subscriptionRetrieveResponse)
  {
    v113 = objc_msgSend_dictionaryRepresentation(subscriptionRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v114, (uint64_t)v113, @"subscriptionRetrieveResponse");
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  if (subscriptionDeleteResponse)
  {
    v116 = objc_msgSend_dictionaryRepresentation(subscriptionDeleteResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v117, (uint64_t)v116, @"subscriptionDeleteResponse");
  }
  archiveRecordsResponse = self->_archiveRecordsResponse;
  if (archiveRecordsResponse)
  {
    v119 = objc_msgSend_dictionaryRepresentation(archiveRecordsResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v120, (uint64_t)v119, @"archiveRecordsResponse");
  }
  markAssetBrokenResponse = self->_markAssetBrokenResponse;
  if (markAssetBrokenResponse)
  {
    v122 = objc_msgSend_dictionaryRepresentation(markAssetBrokenResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v123, (uint64_t)v122, @"markAssetBrokenResponse");
  }
  userQueryResponse = self->_userQueryResponse;
  if (userQueryResponse)
  {
    v125 = objc_msgSend_dictionaryRepresentation(userQueryResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v126, (uint64_t)v125, @"userQueryResponse");
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  if (userPrivacySettingsUpdateResponse)
  {
    v128 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsUpdateResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v129, (uint64_t)v128, @"userPrivacySettingsUpdateResponse");
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  if (userPrivacySettingsResetResponse)
  {
    v131 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsResetResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v132, (uint64_t)v131, @"userPrivacySettingsResetResponse");
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  if (userPrivacySettingsBatchLookupResponse)
  {
    v134 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsBatchLookupResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v135, (uint64_t)v134, @"userPrivacySettingsBatchLookupResponse");
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  if (userPrivacySettingsRetrieveResponse)
  {
    v137 = objc_msgSend_dictionaryRepresentation(userPrivacySettingsRetrieveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v138, (uint64_t)v137, @"userPrivacySettingsRetrieveResponse");
  }
  adopterCapabilitiesSaveResponse = self->_adopterCapabilitiesSaveResponse;
  if (adopterCapabilitiesSaveResponse)
  {
    v140 = objc_msgSend_dictionaryRepresentation(adopterCapabilitiesSaveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v141, (uint64_t)v140, @"adopterCapabilitiesSaveResponse");
  }
  zoneUsageSaveResponse = self->_zoneUsageSaveResponse;
  if (zoneUsageSaveResponse)
  {
    v143 = objc_msgSend_dictionaryRepresentation(zoneUsageSaveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v144, (uint64_t)v143, @"zoneUsageSaveResponse");
  }
  shareUsageSaveResponse = self->_shareUsageSaveResponse;
  if (shareUsageSaveResponse)
  {
    v146 = objc_msgSend_dictionaryRepresentation(shareUsageSaveResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v147, (uint64_t)v146, @"shareUsageSaveResponse");
  }
  adopterCapabilitiesCheckResponse = self->_adopterCapabilitiesCheckResponse;
  if (adopterCapabilitiesCheckResponse)
  {
    v149 = objc_msgSend_dictionaryRepresentation(adopterCapabilitiesCheckResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v150, (uint64_t)v149, @"adopterCapabilitiesCheckResponse");
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  if (tokenRegistrationResponse)
  {
    v152 = objc_msgSend_dictionaryRepresentation(tokenRegistrationResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v153, (uint64_t)v152, @"tokenRegistrationResponse");
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  if (tokenUnregistrationResponse)
  {
    v155 = objc_msgSend_dictionaryRepresentation(tokenUnregistrationResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v156, (uint64_t)v155, @"tokenUnregistrationResponse");
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  if (setBadgeCountResponse)
  {
    v158 = objc_msgSend_dictionaryRepresentation(setBadgeCountResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v159, (uint64_t)v158, @"setBadgeCountResponse");
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  if (notificationSyncResponse)
  {
    v161 = objc_msgSend_dictionaryRepresentation(notificationSyncResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v162, (uint64_t)v161, @"notificationSyncResponse");
  }
  notificationMarkReadResponse = self->_notificationMarkReadResponse;
  if (notificationMarkReadResponse)
  {
    v164 = objc_msgSend_dictionaryRepresentation(notificationMarkReadResponse, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v165, (uint64_t)v164, @"notificationMarkReadResponse");
  }
  id v166 = v6;

  return v166;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E525CC((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_result)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneDeleteResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneRetrieveChangesResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveVersionsResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordRetrieveChangesResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordDeleteResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordResolveTokenResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fetchArchivedRecordsResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_recordMoveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareAccessResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_queryRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaMetadataRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaReplaceResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mergeableDeltaRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_assetUploadTokenRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deleteContainerResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userAvailableQuotaResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bundlesForContainerResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_webAuthTokenRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_updateMissingAssetStatusResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_anonymousShareAddResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_anonymousShareRemoveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionCreateResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subscriptionDeleteResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userQueryResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsRetrieveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsUpdateResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsResetResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userPrivacySettingsBatchLookupResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adopterCapabilitiesSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_adopterCapabilitiesCheckResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneUsageSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareUsageSaveResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareAcceptResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareDeclineResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareVettingInitiateResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tokenRegistrationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tokenUnregistrationResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_setBadgeCountResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notificationSyncResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_notificationMarkReadResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_archiveRecordsResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_markAssetBrokenResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_functionInvokeResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  response = self->_response;
  id v59 = v4;
  if (response)
  {
    objc_msgSend_setResponse_(v4, v5, (uint64_t)response);
    id v4 = v59;
  }
  result = self->_result;
  if (result)
  {
    objc_msgSend_setResult_(v59, v5, (uint64_t)result);
    id v4 = v59;
  }
  header = self->_header;
  if (header)
  {
    objc_msgSend_setHeader_(v59, v5, (uint64_t)header);
    id v4 = v59;
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  if (zoneSaveResponse)
  {
    objc_msgSend_setZoneSaveResponse_(v59, v5, (uint64_t)zoneSaveResponse);
    id v4 = v59;
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  if (zoneRetrieveResponse)
  {
    objc_msgSend_setZoneRetrieveResponse_(v59, v5, (uint64_t)zoneRetrieveResponse);
    id v4 = v59;
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  if (zoneDeleteResponse)
  {
    objc_msgSend_setZoneDeleteResponse_(v59, v5, (uint64_t)zoneDeleteResponse);
    id v4 = v59;
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  if (zoneRetrieveChangesResponse)
  {
    objc_msgSend_setZoneRetrieveChangesResponse_(v59, v5, (uint64_t)zoneRetrieveChangesResponse);
    id v4 = v59;
  }
  recordSaveResponse = self->_recordSaveResponse;
  if (recordSaveResponse)
  {
    objc_msgSend_setRecordSaveResponse_(v59, v5, (uint64_t)recordSaveResponse);
    id v4 = v59;
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  if (recordRetrieveResponse)
  {
    objc_msgSend_setRecordRetrieveResponse_(v59, v5, (uint64_t)recordRetrieveResponse);
    id v4 = v59;
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  if (recordRetrieveVersionsResponse)
  {
    objc_msgSend_setRecordRetrieveVersionsResponse_(v59, v5, (uint64_t)recordRetrieveVersionsResponse);
    id v4 = v59;
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  if (recordRetrieveChangesResponse)
  {
    objc_msgSend_setRecordRetrieveChangesResponse_(v59, v5, (uint64_t)recordRetrieveChangesResponse);
    id v4 = v59;
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  if (recordDeleteResponse)
  {
    objc_msgSend_setRecordDeleteResponse_(v59, v5, (uint64_t)recordDeleteResponse);
    id v4 = v59;
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  if (recordResolveTokenResponse)
  {
    objc_msgSend_setRecordResolveTokenResponse_(v59, v5, (uint64_t)recordResolveTokenResponse);
    id v4 = v59;
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  if (fetchArchivedRecordsResponse)
  {
    objc_msgSend_setFetchArchivedRecordsResponse_(v59, v5, (uint64_t)fetchArchivedRecordsResponse);
    id v4 = v59;
  }
  recordMoveResponse = self->_recordMoveResponse;
  if (recordMoveResponse)
  {
    objc_msgSend_setRecordMoveResponse_(v59, v5, (uint64_t)recordMoveResponse);
    id v4 = v59;
  }
  shareAccessResponse = self->_shareAccessResponse;
  if (shareAccessResponse)
  {
    objc_msgSend_setShareAccessResponse_(v59, v5, (uint64_t)shareAccessResponse);
    id v4 = v59;
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  if (queryRetrieveResponse)
  {
    objc_msgSend_setQueryRetrieveResponse_(v59, v5, (uint64_t)queryRetrieveResponse);
    id v4 = v59;
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  if (mergeableDeltaSaveResponse)
  {
    objc_msgSend_setMergeableDeltaSaveResponse_(v59, v5, (uint64_t)mergeableDeltaSaveResponse);
    id v4 = v59;
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  if (mergeableDeltaMetadataRetrieveResponse)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveResponse_(v59, v5, (uint64_t)mergeableDeltaMetadataRetrieveResponse);
    id v4 = v59;
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  if (mergeableDeltaReplaceResponse)
  {
    objc_msgSend_setMergeableDeltaReplaceResponse_(v59, v5, (uint64_t)mergeableDeltaReplaceResponse);
    id v4 = v59;
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  if (mergeableDeltaRetrieveResponse)
  {
    objc_msgSend_setMergeableDeltaRetrieveResponse_(v59, v5, (uint64_t)mergeableDeltaRetrieveResponse);
    id v4 = v59;
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  if (assetUploadTokenRetrieveResponse)
  {
    objc_msgSend_setAssetUploadTokenRetrieveResponse_(v59, v5, (uint64_t)assetUploadTokenRetrieveResponse);
    id v4 = v59;
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  if (deleteContainerResponse)
  {
    objc_msgSend_setDeleteContainerResponse_(v59, v5, (uint64_t)deleteContainerResponse);
    id v4 = v59;
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  if (userAvailableQuotaResponse)
  {
    objc_msgSend_setUserAvailableQuotaResponse_(v59, v5, (uint64_t)userAvailableQuotaResponse);
    id v4 = v59;
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  if (bundlesForContainerResponse)
  {
    objc_msgSend_setBundlesForContainerResponse_(v59, v5, (uint64_t)bundlesForContainerResponse);
    id v4 = v59;
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  if (webAuthTokenRetrieveResponse)
  {
    objc_msgSend_setWebAuthTokenRetrieveResponse_(v59, v5, (uint64_t)webAuthTokenRetrieveResponse);
    id v4 = v59;
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  if (updateMissingAssetStatusResponse)
  {
    objc_msgSend_setUpdateMissingAssetStatusResponse_(v59, v5, (uint64_t)updateMissingAssetStatusResponse);
    id v4 = v59;
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  if (anonymousShareAddResponse)
  {
    objc_msgSend_setAnonymousShareAddResponse_(v59, v5, (uint64_t)anonymousShareAddResponse);
    id v4 = v59;
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  if (anonymousShareRemoveResponse)
  {
    objc_msgSend_setAnonymousShareRemoveResponse_(v59, v5, (uint64_t)anonymousShareRemoveResponse);
    id v4 = v59;
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  if (subscriptionCreateResponse)
  {
    objc_msgSend_setSubscriptionCreateResponse_(v59, v5, (uint64_t)subscriptionCreateResponse);
    id v4 = v59;
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  if (subscriptionRetrieveResponse)
  {
    objc_msgSend_setSubscriptionRetrieveResponse_(v59, v5, (uint64_t)subscriptionRetrieveResponse);
    id v4 = v59;
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  if (subscriptionDeleteResponse)
  {
    objc_msgSend_setSubscriptionDeleteResponse_(v59, v5, (uint64_t)subscriptionDeleteResponse);
    id v4 = v59;
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  if (userRetrieveResponse)
  {
    objc_msgSend_setUserRetrieveResponse_(v59, v5, (uint64_t)userRetrieveResponse);
    id v4 = v59;
  }
  userQueryResponse = self->_userQueryResponse;
  if (userQueryResponse)
  {
    objc_msgSend_setUserQueryResponse_(v59, v5, (uint64_t)userQueryResponse);
    id v4 = v59;
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  if (userPrivacySettingsRetrieveResponse)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveResponse_(v59, v5, (uint64_t)userPrivacySettingsRetrieveResponse);
    id v4 = v59;
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  if (userPrivacySettingsUpdateResponse)
  {
    objc_msgSend_setUserPrivacySettingsUpdateResponse_(v59, v5, (uint64_t)userPrivacySettingsUpdateResponse);
    id v4 = v59;
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  if (userPrivacySettingsResetResponse)
  {
    objc_msgSend_setUserPrivacySettingsResetResponse_(v59, v5, (uint64_t)userPrivacySettingsResetResponse);
    id v4 = v59;
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  if (userPrivacySettingsBatchLookupResponse)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupResponse_(v59, v5, (uint64_t)userPrivacySettingsBatchLookupResponse);
    id v4 = v59;
  }
  adopterCapabilitiesSaveResponse = self->_adopterCapabilitiesSaveResponse;
  if (adopterCapabilitiesSaveResponse)
  {
    objc_msgSend_setAdopterCapabilitiesSaveResponse_(v59, v5, (uint64_t)adopterCapabilitiesSaveResponse);
    id v4 = v59;
  }
  adopterCapabilitiesCheckResponse = self->_adopterCapabilitiesCheckResponse;
  if (adopterCapabilitiesCheckResponse)
  {
    objc_msgSend_setAdopterCapabilitiesCheckResponse_(v59, v5, (uint64_t)adopterCapabilitiesCheckResponse);
    id v4 = v59;
  }
  zoneUsageSaveResponse = self->_zoneUsageSaveResponse;
  if (zoneUsageSaveResponse)
  {
    objc_msgSend_setZoneUsageSaveResponse_(v59, v5, (uint64_t)zoneUsageSaveResponse);
    id v4 = v59;
  }
  shareUsageSaveResponse = self->_shareUsageSaveResponse;
  if (shareUsageSaveResponse)
  {
    objc_msgSend_setShareUsageSaveResponse_(v59, v5, (uint64_t)shareUsageSaveResponse);
    id v4 = v59;
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  if (shareAcceptResponse)
  {
    objc_msgSend_setShareAcceptResponse_(v59, v5, (uint64_t)shareAcceptResponse);
    id v4 = v59;
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  if (shareDeclineResponse)
  {
    objc_msgSend_setShareDeclineResponse_(v59, v5, (uint64_t)shareDeclineResponse);
    id v4 = v59;
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  if (shareVettingInitiateResponse)
  {
    objc_msgSend_setShareVettingInitiateResponse_(v59, v5, (uint64_t)shareVettingInitiateResponse);
    id v4 = v59;
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  if (tokenRegistrationResponse)
  {
    objc_msgSend_setTokenRegistrationResponse_(v59, v5, (uint64_t)tokenRegistrationResponse);
    id v4 = v59;
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  if (tokenUnregistrationResponse)
  {
    objc_msgSend_setTokenUnregistrationResponse_(v59, v5, (uint64_t)tokenUnregistrationResponse);
    id v4 = v59;
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  if (setBadgeCountResponse)
  {
    objc_msgSend_setSetBadgeCountResponse_(v59, v5, (uint64_t)setBadgeCountResponse);
    id v4 = v59;
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  if (notificationSyncResponse)
  {
    objc_msgSend_setNotificationSyncResponse_(v59, v5, (uint64_t)notificationSyncResponse);
    id v4 = v59;
  }
  notificationMarkReadResponse = self->_notificationMarkReadResponse;
  if (notificationMarkReadResponse)
  {
    objc_msgSend_setNotificationMarkReadResponse_(v59, v5, (uint64_t)notificationMarkReadResponse);
    id v4 = v59;
  }
  archiveRecordsResponse = self->_archiveRecordsResponse;
  if (archiveRecordsResponse)
  {
    objc_msgSend_setArchiveRecordsResponse_(v59, v5, (uint64_t)archiveRecordsResponse);
    id v4 = v59;
  }
  markAssetBrokenResponse = self->_markAssetBrokenResponse;
  if (markAssetBrokenResponse)
  {
    objc_msgSend_setMarkAssetBrokenResponse_(v59, v5, (uint64_t)markAssetBrokenResponse);
    id v4 = v59;
  }
  functionInvokeResponse = self->_functionInvokeResponse;
  if (functionInvokeResponse)
  {
    objc_msgSend_setFunctionInvokeResponse_(v59, v5, (uint64_t)functionInvokeResponse);
    id v4 = v59;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_response, v11, (uint64_t)a3);
  v13 = (void *)v10[27];
  v10[27] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_result, v14, (uint64_t)a3);
  v16 = (void *)v10[28];
  v10[28] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_header, v17, (uint64_t)a3);
  v19 = (void *)v10[11];
  v10[11] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_zoneSaveResponse, v20, (uint64_t)a3);
  v22 = (void *)v10[52];
  v10[52] = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_zoneRetrieveResponse, v23, (uint64_t)a3);
  v25 = (void *)v10[51];
  v10[51] = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_zoneDeleteResponse, v26, (uint64_t)a3);
  v28 = (void *)v10[49];
  v10[49] = v27;

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_zoneRetrieveChangesResponse, v29, (uint64_t)a3);
  v31 = (void *)v10[50];
  v10[50] = v30;

  uint64_t v33 = objc_msgSend_copyWithZone_(self->_recordSaveResponse, v32, (uint64_t)a3);
  v34 = (void *)v10[26];
  v10[26] = v33;

  uint64_t v36 = objc_msgSend_copyWithZone_(self->_recordRetrieveResponse, v35, (uint64_t)a3);
  v37 = (void *)v10[24];
  v10[24] = v36;

  uint64_t v39 = objc_msgSend_copyWithZone_(self->_recordRetrieveVersionsResponse, v38, (uint64_t)a3);
  v40 = (void *)v10[25];
  v10[25] = v39;

  uint64_t v42 = objc_msgSend_copyWithZone_(self->_recordRetrieveChangesResponse, v41, (uint64_t)a3);
  v43 = (void *)v10[23];
  v10[23] = v42;

  uint64_t v45 = objc_msgSend_copyWithZone_(self->_recordDeleteResponse, v44, (uint64_t)a3);
  v46 = (void *)v10[20];
  v10[20] = v45;

  uint64_t v48 = objc_msgSend_copyWithZone_(self->_recordResolveTokenResponse, v47, (uint64_t)a3);
  v49 = (void *)v10[22];
  v10[22] = v48;

  uint64_t v51 = objc_msgSend_copyWithZone_(self->_fetchArchivedRecordsResponse, v50, (uint64_t)a3);
  v52 = (void *)v10[9];
  v10[9] = v51;

  uint64_t v54 = objc_msgSend_copyWithZone_(self->_recordMoveResponse, v53, (uint64_t)a3);
  v55 = (void *)v10[21];
  v10[21] = v54;

  uint64_t v57 = objc_msgSend_copyWithZone_(self->_shareAccessResponse, v56, (uint64_t)a3);
  v58 = (void *)v10[31];
  v10[31] = v57;

  uint64_t v60 = objc_msgSend_copyWithZone_(self->_queryRetrieveResponse, v59, (uint64_t)a3);
  v61 = (void *)v10[19];
  v10[19] = v60;

  uint64_t v63 = objc_msgSend_copyWithZone_(self->_mergeableDeltaSaveResponse, v62, (uint64_t)a3);
  v64 = (void *)v10[16];
  v10[16] = v63;

  uint64_t v66 = objc_msgSend_copyWithZone_(self->_mergeableDeltaMetadataRetrieveResponse, v65, (uint64_t)a3);
  v67 = (void *)v10[13];
  v10[13] = v66;

  uint64_t v69 = objc_msgSend_copyWithZone_(self->_mergeableDeltaReplaceResponse, v68, (uint64_t)a3);
  v70 = (void *)v10[14];
  v10[14] = v69;

  uint64_t v72 = objc_msgSend_copyWithZone_(self->_mergeableDeltaRetrieveResponse, v71, (uint64_t)a3);
  v73 = (void *)v10[15];
  v10[15] = v72;

  uint64_t v75 = objc_msgSend_copyWithZone_(self->_assetUploadTokenRetrieveResponse, v74, (uint64_t)a3);
  v76 = (void *)v10[6];
  v10[6] = v75;

  uint64_t v78 = objc_msgSend_copyWithZone_(self->_deleteContainerResponse, v77, (uint64_t)a3);
  v79 = (void *)v10[8];
  v10[8] = v78;

  uint64_t v81 = objc_msgSend_copyWithZone_(self->_userAvailableQuotaResponse, v80, (uint64_t)a3);
  v82 = (void *)v10[41];
  v10[41] = v81;

  uint64_t v84 = objc_msgSend_copyWithZone_(self->_bundlesForContainerResponse, v83, (uint64_t)a3);
  v85 = (void *)v10[7];
  v10[7] = v84;

  uint64_t v87 = objc_msgSend_copyWithZone_(self->_webAuthTokenRetrieveResponse, v86, (uint64_t)a3);
  v88 = (void *)v10[48];
  v10[48] = v87;

  uint64_t v90 = objc_msgSend_copyWithZone_(self->_updateMissingAssetStatusResponse, v89, (uint64_t)a3);
  v91 = (void *)v10[40];
  v10[40] = v90;

  uint64_t v93 = objc_msgSend_copyWithZone_(self->_anonymousShareAddResponse, v92, (uint64_t)a3);
  v94 = (void *)v10[3];
  v10[3] = v93;

  uint64_t v96 = objc_msgSend_copyWithZone_(self->_anonymousShareRemoveResponse, v95, (uint64_t)a3);
  v97 = (void *)v10[4];
  v10[4] = v96;

  uint64_t v99 = objc_msgSend_copyWithZone_(self->_subscriptionCreateResponse, v98, (uint64_t)a3);
  v100 = (void *)v10[35];
  v10[35] = v99;

  uint64_t v102 = objc_msgSend_copyWithZone_(self->_subscriptionRetrieveResponse, v101, (uint64_t)a3);
  v103 = (void *)v10[37];
  v10[37] = v102;

  uint64_t v105 = objc_msgSend_copyWithZone_(self->_subscriptionDeleteResponse, v104, (uint64_t)a3);
  v106 = (void *)v10[36];
  v10[36] = v105;

  uint64_t v108 = objc_msgSend_copyWithZone_(self->_userRetrieveResponse, v107, (uint64_t)a3);
  v109 = (void *)v10[47];
  v10[47] = v108;

  uint64_t v111 = objc_msgSend_copyWithZone_(self->_userQueryResponse, v110, (uint64_t)a3);
  v112 = (void *)v10[46];
  v10[46] = v111;

  uint64_t v114 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsRetrieveResponse, v113, (uint64_t)a3);
  v115 = (void *)v10[44];
  v10[44] = v114;

  uint64_t v117 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsUpdateResponse, v116, (uint64_t)a3);
  v118 = (void *)v10[45];
  v10[45] = v117;

  uint64_t v120 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsResetResponse, v119, (uint64_t)a3);
  v121 = (void *)v10[43];
  v10[43] = v120;

  uint64_t v123 = objc_msgSend_copyWithZone_(self->_userPrivacySettingsBatchLookupResponse, v122, (uint64_t)a3);
  v124 = (void *)v10[42];
  v10[42] = v123;

  uint64_t v126 = objc_msgSend_copyWithZone_(self->_adopterCapabilitiesSaveResponse, v125, (uint64_t)a3);
  v127 = (void *)v10[2];
  v10[2] = v126;

  uint64_t v129 = objc_msgSend_copyWithZone_(self->_adopterCapabilitiesCheckResponse, v128, (uint64_t)a3);
  v130 = (void *)v10[1];
  v10[1] = v129;

  uint64_t v132 = objc_msgSend_copyWithZone_(self->_zoneUsageSaveResponse, v131, (uint64_t)a3);
  v133 = (void *)v10[53];
  v10[53] = v132;

  uint64_t v135 = objc_msgSend_copyWithZone_(self->_shareUsageSaveResponse, v134, (uint64_t)a3);
  v136 = (void *)v10[33];
  v10[33] = v135;

  uint64_t v138 = objc_msgSend_copyWithZone_(self->_shareAcceptResponse, v137, (uint64_t)a3);
  v139 = (void *)v10[30];
  v10[30] = v138;

  uint64_t v141 = objc_msgSend_copyWithZone_(self->_shareDeclineResponse, v140, (uint64_t)a3);
  v142 = (void *)v10[32];
  v10[32] = v141;

  uint64_t v144 = objc_msgSend_copyWithZone_(self->_shareVettingInitiateResponse, v143, (uint64_t)a3);
  v145 = (void *)v10[34];
  v10[34] = v144;

  uint64_t v147 = objc_msgSend_copyWithZone_(self->_tokenRegistrationResponse, v146, (uint64_t)a3);
  v148 = (void *)v10[38];
  v10[38] = v147;

  uint64_t v150 = objc_msgSend_copyWithZone_(self->_tokenUnregistrationResponse, v149, (uint64_t)a3);
  v151 = (void *)v10[39];
  v10[39] = v150;

  uint64_t v153 = objc_msgSend_copyWithZone_(self->_setBadgeCountResponse, v152, (uint64_t)a3);
  v154 = (void *)v10[29];
  v10[29] = v153;

  uint64_t v156 = objc_msgSend_copyWithZone_(self->_notificationSyncResponse, v155, (uint64_t)a3);
  v157 = (void *)v10[18];
  v10[18] = v156;

  uint64_t v159 = objc_msgSend_copyWithZone_(self->_notificationMarkReadResponse, v158, (uint64_t)a3);
  v160 = (void *)v10[17];
  v10[17] = v159;

  uint64_t v162 = objc_msgSend_copyWithZone_(self->_archiveRecordsResponse, v161, (uint64_t)a3);
  v163 = (void *)v10[5];
  v10[5] = v162;

  uint64_t v165 = objc_msgSend_copyWithZone_(self->_markAssetBrokenResponse, v164, (uint64_t)a3);
  id v166 = (void *)v10[12];
  v10[12] = v165;

  uint64_t v168 = objc_msgSend_copyWithZone_(self->_functionInvokeResponse, v167, (uint64_t)a3);
  v169 = (void *)v10[10];
  v10[10] = v168;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_108;
  }
  response = self->_response;
  uint64_t v9 = v4[27];
  if ((unint64_t)response | v9)
  {
    if (!objc_msgSend_isEqual_(response, v7, v9)) {
      goto LABEL_108;
    }
  }
  v10 = self->_result;
  uint64_t v11 = v4[28];
  if ((unint64_t)v10 | v11)
  {
    if (!objc_msgSend_isEqual_(v10, v7, v11)) {
      goto LABEL_108;
    }
  }
  header = self->_header;
  uint64_t v13 = v4[11];
  if ((unint64_t)header | v13)
  {
    if (!objc_msgSend_isEqual_(header, v7, v13)) {
      goto LABEL_108;
    }
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  uint64_t v15 = v4[52];
  if ((unint64_t)zoneSaveResponse | v15)
  {
    if (!objc_msgSend_isEqual_(zoneSaveResponse, v7, v15)) {
      goto LABEL_108;
    }
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  uint64_t v17 = v4[51];
  if ((unint64_t)zoneRetrieveResponse | v17)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveResponse, v7, v17)) {
      goto LABEL_108;
    }
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  uint64_t v19 = v4[49];
  if ((unint64_t)zoneDeleteResponse | v19)
  {
    if (!objc_msgSend_isEqual_(zoneDeleteResponse, v7, v19)) {
      goto LABEL_108;
    }
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  uint64_t v21 = v4[50];
  if ((unint64_t)zoneRetrieveChangesResponse | v21)
  {
    if (!objc_msgSend_isEqual_(zoneRetrieveChangesResponse, v7, v21)) {
      goto LABEL_108;
    }
  }
  recordSaveResponse = self->_recordSaveResponse;
  uint64_t v23 = v4[26];
  if ((unint64_t)recordSaveResponse | v23)
  {
    if (!objc_msgSend_isEqual_(recordSaveResponse, v7, v23)) {
      goto LABEL_108;
    }
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  uint64_t v25 = v4[24];
  if ((unint64_t)recordRetrieveResponse | v25)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveResponse, v7, v25)) {
      goto LABEL_108;
    }
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  uint64_t v27 = v4[25];
  if ((unint64_t)recordRetrieveVersionsResponse | v27)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveVersionsResponse, v7, v27)) {
      goto LABEL_108;
    }
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  uint64_t v29 = v4[23];
  if ((unint64_t)recordRetrieveChangesResponse | v29)
  {
    if (!objc_msgSend_isEqual_(recordRetrieveChangesResponse, v7, v29)) {
      goto LABEL_108;
    }
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  uint64_t v31 = v4[20];
  if ((unint64_t)recordDeleteResponse | v31)
  {
    if (!objc_msgSend_isEqual_(recordDeleteResponse, v7, v31)) {
      goto LABEL_108;
    }
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  uint64_t v33 = v4[22];
  if ((unint64_t)recordResolveTokenResponse | v33)
  {
    if (!objc_msgSend_isEqual_(recordResolveTokenResponse, v7, v33)) {
      goto LABEL_108;
    }
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  uint64_t v35 = v4[9];
  if ((unint64_t)fetchArchivedRecordsResponse | v35)
  {
    if (!objc_msgSend_isEqual_(fetchArchivedRecordsResponse, v7, v35)) {
      goto LABEL_108;
    }
  }
  recordMoveResponse = self->_recordMoveResponse;
  uint64_t v37 = v4[21];
  if ((unint64_t)recordMoveResponse | v37)
  {
    if (!objc_msgSend_isEqual_(recordMoveResponse, v7, v37)) {
      goto LABEL_108;
    }
  }
  shareAccessResponse = self->_shareAccessResponse;
  uint64_t v39 = v4[31];
  if ((unint64_t)shareAccessResponse | v39)
  {
    if (!objc_msgSend_isEqual_(shareAccessResponse, v7, v39)) {
      goto LABEL_108;
    }
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  uint64_t v41 = v4[19];
  if ((unint64_t)queryRetrieveResponse | v41)
  {
    if (!objc_msgSend_isEqual_(queryRetrieveResponse, v7, v41)) {
      goto LABEL_108;
    }
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  uint64_t v43 = v4[16];
  if ((unint64_t)mergeableDeltaSaveResponse | v43)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaSaveResponse, v7, v43)) {
      goto LABEL_108;
    }
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  uint64_t v45 = v4[13];
  if ((unint64_t)mergeableDeltaMetadataRetrieveResponse | v45)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaMetadataRetrieveResponse, v7, v45)) {
      goto LABEL_108;
    }
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  uint64_t v47 = v4[14];
  if ((unint64_t)mergeableDeltaReplaceResponse | v47)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaReplaceResponse, v7, v47)) {
      goto LABEL_108;
    }
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  uint64_t v49 = v4[15];
  if ((unint64_t)mergeableDeltaRetrieveResponse | v49)
  {
    if (!objc_msgSend_isEqual_(mergeableDeltaRetrieveResponse, v7, v49)) {
      goto LABEL_108;
    }
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  uint64_t v51 = v4[6];
  if ((unint64_t)assetUploadTokenRetrieveResponse | v51)
  {
    if (!objc_msgSend_isEqual_(assetUploadTokenRetrieveResponse, v7, v51)) {
      goto LABEL_108;
    }
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  uint64_t v53 = v4[8];
  if ((unint64_t)deleteContainerResponse | v53)
  {
    if (!objc_msgSend_isEqual_(deleteContainerResponse, v7, v53)) {
      goto LABEL_108;
    }
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  uint64_t v55 = v4[41];
  if ((unint64_t)userAvailableQuotaResponse | v55)
  {
    if (!objc_msgSend_isEqual_(userAvailableQuotaResponse, v7, v55)) {
      goto LABEL_108;
    }
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  uint64_t v57 = v4[7];
  if ((unint64_t)bundlesForContainerResponse | v57)
  {
    if (!objc_msgSend_isEqual_(bundlesForContainerResponse, v7, v57)) {
      goto LABEL_108;
    }
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  uint64_t v59 = v4[48];
  if ((unint64_t)webAuthTokenRetrieveResponse | v59)
  {
    if (!objc_msgSend_isEqual_(webAuthTokenRetrieveResponse, v7, v59)) {
      goto LABEL_108;
    }
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  uint64_t v61 = v4[40];
  if ((unint64_t)updateMissingAssetStatusResponse | v61)
  {
    if (!objc_msgSend_isEqual_(updateMissingAssetStatusResponse, v7, v61)) {
      goto LABEL_108;
    }
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  uint64_t v63 = v4[3];
  if ((unint64_t)anonymousShareAddResponse | v63)
  {
    if (!objc_msgSend_isEqual_(anonymousShareAddResponse, v7, v63)) {
      goto LABEL_108;
    }
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  uint64_t v65 = v4[4];
  if ((unint64_t)anonymousShareRemoveResponse | v65)
  {
    if (!objc_msgSend_isEqual_(anonymousShareRemoveResponse, v7, v65)) {
      goto LABEL_108;
    }
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  uint64_t v67 = v4[35];
  if ((unint64_t)subscriptionCreateResponse | v67)
  {
    if (!objc_msgSend_isEqual_(subscriptionCreateResponse, v7, v67)) {
      goto LABEL_108;
    }
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  uint64_t v69 = v4[37];
  if ((unint64_t)subscriptionRetrieveResponse | v69)
  {
    if (!objc_msgSend_isEqual_(subscriptionRetrieveResponse, v7, v69)) {
      goto LABEL_108;
    }
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  uint64_t v71 = v4[36];
  if ((unint64_t)subscriptionDeleteResponse | v71)
  {
    if (!objc_msgSend_isEqual_(subscriptionDeleteResponse, v7, v71)) {
      goto LABEL_108;
    }
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  uint64_t v73 = v4[47];
  if ((unint64_t)userRetrieveResponse | v73)
  {
    if (!objc_msgSend_isEqual_(userRetrieveResponse, v7, v73)) {
      goto LABEL_108;
    }
  }
  userQueryResponse = self->_userQueryResponse;
  uint64_t v75 = v4[46];
  if ((unint64_t)userQueryResponse | v75)
  {
    if (!objc_msgSend_isEqual_(userQueryResponse, v7, v75)) {
      goto LABEL_108;
    }
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  uint64_t v77 = v4[44];
  if ((unint64_t)userPrivacySettingsRetrieveResponse | v77)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsRetrieveResponse, v7, v77)) {
      goto LABEL_108;
    }
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  uint64_t v79 = v4[45];
  if ((unint64_t)userPrivacySettingsUpdateResponse | v79)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsUpdateResponse, v7, v79)) {
      goto LABEL_108;
    }
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  uint64_t v81 = v4[43];
  if ((unint64_t)userPrivacySettingsResetResponse | v81)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsResetResponse, v7, v81)) {
      goto LABEL_108;
    }
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  uint64_t v83 = v4[42];
  if ((unint64_t)userPrivacySettingsBatchLookupResponse | v83)
  {
    if (!objc_msgSend_isEqual_(userPrivacySettingsBatchLookupResponse, v7, v83)) {
      goto LABEL_108;
    }
  }
  adopterCapabilitiesSaveResponse = self->_adopterCapabilitiesSaveResponse;
  uint64_t v85 = v4[2];
  if ((unint64_t)adopterCapabilitiesSaveResponse | v85)
  {
    if (!objc_msgSend_isEqual_(adopterCapabilitiesSaveResponse, v7, v85)) {
      goto LABEL_108;
    }
  }
  adopterCapabilitiesCheckResponse = self->_adopterCapabilitiesCheckResponse;
  uint64_t v87 = v4[1];
  if ((unint64_t)adopterCapabilitiesCheckResponse | v87)
  {
    if (!objc_msgSend_isEqual_(adopterCapabilitiesCheckResponse, v7, v87)) {
      goto LABEL_108;
    }
  }
  zoneUsageSaveResponse = self->_zoneUsageSaveResponse;
  uint64_t v89 = v4[53];
  if ((unint64_t)zoneUsageSaveResponse | v89)
  {
    if (!objc_msgSend_isEqual_(zoneUsageSaveResponse, v7, v89)) {
      goto LABEL_108;
    }
  }
  shareUsageSaveResponse = self->_shareUsageSaveResponse;
  uint64_t v91 = v4[33];
  if ((unint64_t)shareUsageSaveResponse | v91)
  {
    if (!objc_msgSend_isEqual_(shareUsageSaveResponse, v7, v91)) {
      goto LABEL_108;
    }
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  uint64_t v93 = v4[30];
  if ((unint64_t)shareAcceptResponse | v93)
  {
    if (!objc_msgSend_isEqual_(shareAcceptResponse, v7, v93)) {
      goto LABEL_108;
    }
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  uint64_t v95 = v4[32];
  if ((unint64_t)shareDeclineResponse | v95)
  {
    if (!objc_msgSend_isEqual_(shareDeclineResponse, v7, v95)) {
      goto LABEL_108;
    }
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  uint64_t v97 = v4[34];
  if ((unint64_t)shareVettingInitiateResponse | v97)
  {
    if (!objc_msgSend_isEqual_(shareVettingInitiateResponse, v7, v97)) {
      goto LABEL_108;
    }
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  uint64_t v99 = v4[38];
  if ((unint64_t)tokenRegistrationResponse | v99)
  {
    if (!objc_msgSend_isEqual_(tokenRegistrationResponse, v7, v99)) {
      goto LABEL_108;
    }
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  uint64_t v101 = v4[39];
  if ((unint64_t)tokenUnregistrationResponse | v101)
  {
    if (!objc_msgSend_isEqual_(tokenUnregistrationResponse, v7, v101)) {
      goto LABEL_108;
    }
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  uint64_t v103 = v4[29];
  if ((unint64_t)setBadgeCountResponse | v103)
  {
    if (!objc_msgSend_isEqual_(setBadgeCountResponse, v7, v103)) {
      goto LABEL_108;
    }
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  uint64_t v105 = v4[18];
  if ((unint64_t)notificationSyncResponse | v105)
  {
    if (!objc_msgSend_isEqual_(notificationSyncResponse, v7, v105)) {
      goto LABEL_108;
    }
  }
  if (((notificationMarkReadResponse = self->_notificationMarkReadResponse,
         uint64_t v107 = v4[17],
         !((unint64_t)notificationMarkReadResponse | v107))
     || objc_msgSend_isEqual_(notificationMarkReadResponse, v7, v107))
    && ((archiveRecordsResponse = self->_archiveRecordsResponse,
         uint64_t v109 = v4[5],
         !((unint64_t)archiveRecordsResponse | v109))
     || objc_msgSend_isEqual_(archiveRecordsResponse, v7, v109))
    && ((markAssetBrokenResponse = self->_markAssetBrokenResponse,
         uint64_t v111 = v4[12],
         !((unint64_t)markAssetBrokenResponse | v111))
     || objc_msgSend_isEqual_(markAssetBrokenResponse, v7, v111)))
  {
    functionInvokeResponse = self->_functionInvokeResponse;
    uint64_t v113 = v4[10];
    if ((unint64_t)functionInvokeResponse | v113) {
      char isEqual = objc_msgSend_isEqual_(functionInvokeResponse, v7, v113);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_108:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_response, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_result, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_header, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_zoneSaveResponse, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_zoneRetrieveResponse, v14, v15);
  uint64_t v19 = v16 ^ objc_msgSend_hash(self->_zoneDeleteResponse, v17, v18);
  uint64_t v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_zoneRetrieveChangesResponse, v20, v21);
  uint64_t v25 = objc_msgSend_hash(self->_recordSaveResponse, v23, v24);
  uint64_t v28 = v25 ^ objc_msgSend_hash(self->_recordRetrieveResponse, v26, v27);
  uint64_t v31 = v28 ^ objc_msgSend_hash(self->_recordRetrieveVersionsResponse, v29, v30);
  uint64_t v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_recordRetrieveChangesResponse, v32, v33);
  uint64_t v37 = objc_msgSend_hash(self->_recordDeleteResponse, v35, v36);
  uint64_t v40 = v37 ^ objc_msgSend_hash(self->_recordResolveTokenResponse, v38, v39);
  uint64_t v43 = v40 ^ objc_msgSend_hash(self->_fetchArchivedRecordsResponse, v41, v42);
  uint64_t v46 = v43 ^ objc_msgSend_hash(self->_recordMoveResponse, v44, v45);
  uint64_t v49 = v34 ^ v46 ^ objc_msgSend_hash(self->_shareAccessResponse, v47, v48);
  uint64_t v52 = objc_msgSend_hash(self->_queryRetrieveResponse, v50, v51);
  uint64_t v55 = v52 ^ objc_msgSend_hash(self->_mergeableDeltaSaveResponse, v53, v54);
  uint64_t v58 = v55 ^ objc_msgSend_hash(self->_mergeableDeltaMetadataRetrieveResponse, v56, v57);
  uint64_t v61 = v58 ^ objc_msgSend_hash(self->_mergeableDeltaReplaceResponse, v59, v60);
  uint64_t v64 = v61 ^ objc_msgSend_hash(self->_mergeableDeltaRetrieveResponse, v62, v63);
  uint64_t v67 = v49 ^ v64 ^ objc_msgSend_hash(self->_assetUploadTokenRetrieveResponse, v65, v66);
  uint64_t v70 = objc_msgSend_hash(self->_deleteContainerResponse, v68, v69);
  uint64_t v73 = v70 ^ objc_msgSend_hash(self->_userAvailableQuotaResponse, v71, v72);
  uint64_t v76 = v73 ^ objc_msgSend_hash(self->_bundlesForContainerResponse, v74, v75);
  uint64_t v79 = v76 ^ objc_msgSend_hash(self->_webAuthTokenRetrieveResponse, v77, v78);
  uint64_t v82 = v79 ^ objc_msgSend_hash(self->_updateMissingAssetStatusResponse, v80, v81);
  uint64_t v85 = v82 ^ objc_msgSend_hash(self->_anonymousShareAddResponse, v83, v84);
  uint64_t v88 = v67 ^ v85 ^ objc_msgSend_hash(self->_anonymousShareRemoveResponse, v86, v87);
  uint64_t v91 = objc_msgSend_hash(self->_subscriptionCreateResponse, v89, v90);
  uint64_t v94 = v91 ^ objc_msgSend_hash(self->_subscriptionRetrieveResponse, v92, v93);
  uint64_t v97 = v94 ^ objc_msgSend_hash(self->_subscriptionDeleteResponse, v95, v96);
  uint64_t v100 = v97 ^ objc_msgSend_hash(self->_userRetrieveResponse, v98, v99);
  uint64_t v103 = v100 ^ objc_msgSend_hash(self->_userQueryResponse, v101, v102);
  uint64_t v106 = v103 ^ objc_msgSend_hash(self->_userPrivacySettingsRetrieveResponse, v104, v105);
  uint64_t v109 = v106 ^ objc_msgSend_hash(self->_userPrivacySettingsUpdateResponse, v107, v108);
  uint64_t v112 = v88 ^ v109 ^ objc_msgSend_hash(self->_userPrivacySettingsResetResponse, v110, v111);
  uint64_t v115 = objc_msgSend_hash(self->_userPrivacySettingsBatchLookupResponse, v113, v114);
  uint64_t v118 = v115 ^ objc_msgSend_hash(self->_adopterCapabilitiesSaveResponse, v116, v117);
  uint64_t v121 = v118 ^ objc_msgSend_hash(self->_adopterCapabilitiesCheckResponse, v119, v120);
  uint64_t v124 = v121 ^ objc_msgSend_hash(self->_zoneUsageSaveResponse, v122, v123);
  uint64_t v127 = v124 ^ objc_msgSend_hash(self->_shareUsageSaveResponse, v125, v126);
  uint64_t v130 = v127 ^ objc_msgSend_hash(self->_shareAcceptResponse, v128, v129);
  uint64_t v133 = v130 ^ objc_msgSend_hash(self->_shareDeclineResponse, v131, v132);
  uint64_t v136 = v133 ^ objc_msgSend_hash(self->_shareVettingInitiateResponse, v134, v135);
  uint64_t v139 = v112 ^ v136 ^ objc_msgSend_hash(self->_tokenRegistrationResponse, v137, v138);
  uint64_t v142 = objc_msgSend_hash(self->_tokenUnregistrationResponse, v140, v141);
  uint64_t v145 = v142 ^ objc_msgSend_hash(self->_setBadgeCountResponse, v143, v144);
  uint64_t v148 = v145 ^ objc_msgSend_hash(self->_notificationSyncResponse, v146, v147);
  uint64_t v151 = v148 ^ objc_msgSend_hash(self->_notificationMarkReadResponse, v149, v150);
  uint64_t v154 = v151 ^ objc_msgSend_hash(self->_archiveRecordsResponse, v152, v153);
  uint64_t v157 = v154 ^ objc_msgSend_hash(self->_markAssetBrokenResponse, v155, v156);
  return v139 ^ v157 ^ objc_msgSend_hash(self->_functionInvokeResponse, v158, v159);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (uint64_t *)a3;
  response = self->_response;
  uint64_t v111 = v4;
  uint64_t v6 = v4[27];
  if (response)
  {
    if (v6) {
      objc_msgSend_mergeFrom_(response, (const char *)v4, v6);
    }
  }
  else if (v6)
  {
    objc_msgSend_setResponse_(self, (const char *)v4, v6);
  }
  result = self->_result;
  uint64_t v8 = v111[28];
  if (result)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(result, (const char *)v111, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setResult_(self, (const char *)v111, v8);
  }
  header = self->_header;
  uint64_t v10 = v111[11];
  if (header)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(header, (const char *)v111, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setHeader_(self, (const char *)v111, v10);
  }
  zoneSaveResponse = self->_zoneSaveResponse;
  uint64_t v12 = v111[52];
  if (zoneSaveResponse)
  {
    if (v12) {
      objc_msgSend_mergeFrom_(zoneSaveResponse, (const char *)v111, v12);
    }
  }
  else if (v12)
  {
    objc_msgSend_setZoneSaveResponse_(self, (const char *)v111, v12);
  }
  zoneRetrieveResponse = self->_zoneRetrieveResponse;
  uint64_t v14 = v111[51];
  if (zoneRetrieveResponse)
  {
    if (v14) {
      objc_msgSend_mergeFrom_(zoneRetrieveResponse, (const char *)v111, v14);
    }
  }
  else if (v14)
  {
    objc_msgSend_setZoneRetrieveResponse_(self, (const char *)v111, v14);
  }
  zoneDeleteResponse = self->_zoneDeleteResponse;
  uint64_t v16 = v111[49];
  if (zoneDeleteResponse)
  {
    if (v16) {
      objc_msgSend_mergeFrom_(zoneDeleteResponse, (const char *)v111, v16);
    }
  }
  else if (v16)
  {
    objc_msgSend_setZoneDeleteResponse_(self, (const char *)v111, v16);
  }
  zoneRetrieveChangesResponse = self->_zoneRetrieveChangesResponse;
  uint64_t v18 = v111[50];
  if (zoneRetrieveChangesResponse)
  {
    if (v18) {
      objc_msgSend_mergeFrom_(zoneRetrieveChangesResponse, (const char *)v111, v18);
    }
  }
  else if (v18)
  {
    objc_msgSend_setZoneRetrieveChangesResponse_(self, (const char *)v111, v18);
  }
  recordSaveResponse = self->_recordSaveResponse;
  uint64_t v20 = v111[26];
  if (recordSaveResponse)
  {
    if (v20) {
      objc_msgSend_mergeFrom_(recordSaveResponse, (const char *)v111, v20);
    }
  }
  else if (v20)
  {
    objc_msgSend_setRecordSaveResponse_(self, (const char *)v111, v20);
  }
  recordRetrieveResponse = self->_recordRetrieveResponse;
  uint64_t v22 = v111[24];
  if (recordRetrieveResponse)
  {
    if (v22) {
      objc_msgSend_mergeFrom_(recordRetrieveResponse, (const char *)v111, v22);
    }
  }
  else if (v22)
  {
    objc_msgSend_setRecordRetrieveResponse_(self, (const char *)v111, v22);
  }
  recordRetrieveVersionsResponse = self->_recordRetrieveVersionsResponse;
  uint64_t v24 = v111[25];
  if (recordRetrieveVersionsResponse)
  {
    if (v24) {
      objc_msgSend_mergeFrom_(recordRetrieveVersionsResponse, (const char *)v111, v24);
    }
  }
  else if (v24)
  {
    objc_msgSend_setRecordRetrieveVersionsResponse_(self, (const char *)v111, v24);
  }
  recordRetrieveChangesResponse = self->_recordRetrieveChangesResponse;
  uint64_t v26 = v111[23];
  if (recordRetrieveChangesResponse)
  {
    if (v26) {
      objc_msgSend_mergeFrom_(recordRetrieveChangesResponse, (const char *)v111, v26);
    }
  }
  else if (v26)
  {
    objc_msgSend_setRecordRetrieveChangesResponse_(self, (const char *)v111, v26);
  }
  recordDeleteResponse = self->_recordDeleteResponse;
  uint64_t v28 = v111[20];
  if (recordDeleteResponse)
  {
    if (v28) {
      objc_msgSend_mergeFrom_(recordDeleteResponse, (const char *)v111, v28);
    }
  }
  else if (v28)
  {
    objc_msgSend_setRecordDeleteResponse_(self, (const char *)v111, v28);
  }
  recordResolveTokenResponse = self->_recordResolveTokenResponse;
  uint64_t v30 = v111[22];
  if (recordResolveTokenResponse)
  {
    if (v30) {
      objc_msgSend_mergeFrom_(recordResolveTokenResponse, (const char *)v111, v30);
    }
  }
  else if (v30)
  {
    objc_msgSend_setRecordResolveTokenResponse_(self, (const char *)v111, v30);
  }
  fetchArchivedRecordsResponse = self->_fetchArchivedRecordsResponse;
  uint64_t v32 = v111[9];
  if (fetchArchivedRecordsResponse)
  {
    if (v32) {
      objc_msgSend_mergeFrom_(fetchArchivedRecordsResponse, (const char *)v111, v32);
    }
  }
  else if (v32)
  {
    objc_msgSend_setFetchArchivedRecordsResponse_(self, (const char *)v111, v32);
  }
  recordMoveResponse = self->_recordMoveResponse;
  uint64_t v34 = v111[21];
  if (recordMoveResponse)
  {
    if (v34) {
      objc_msgSend_mergeFrom_(recordMoveResponse, (const char *)v111, v34);
    }
  }
  else if (v34)
  {
    objc_msgSend_setRecordMoveResponse_(self, (const char *)v111, v34);
  }
  shareAccessResponse = self->_shareAccessResponse;
  uint64_t v36 = v111[31];
  if (shareAccessResponse)
  {
    if (v36) {
      objc_msgSend_mergeFrom_(shareAccessResponse, (const char *)v111, v36);
    }
  }
  else if (v36)
  {
    objc_msgSend_setShareAccessResponse_(self, (const char *)v111, v36);
  }
  queryRetrieveResponse = self->_queryRetrieveResponse;
  uint64_t v38 = v111[19];
  if (queryRetrieveResponse)
  {
    if (v38) {
      objc_msgSend_mergeFrom_(queryRetrieveResponse, (const char *)v111, v38);
    }
  }
  else if (v38)
  {
    objc_msgSend_setQueryRetrieveResponse_(self, (const char *)v111, v38);
  }
  mergeableDeltaSaveResponse = self->_mergeableDeltaSaveResponse;
  uint64_t v40 = v111[16];
  if (mergeableDeltaSaveResponse)
  {
    if (v40) {
      objc_msgSend_mergeFrom_(mergeableDeltaSaveResponse, (const char *)v111, v40);
    }
  }
  else if (v40)
  {
    objc_msgSend_setMergeableDeltaSaveResponse_(self, (const char *)v111, v40);
  }
  mergeableDeltaMetadataRetrieveResponse = self->_mergeableDeltaMetadataRetrieveResponse;
  uint64_t v42 = v111[13];
  if (mergeableDeltaMetadataRetrieveResponse)
  {
    if (v42) {
      objc_msgSend_mergeFrom_(mergeableDeltaMetadataRetrieveResponse, (const char *)v111, v42);
    }
  }
  else if (v42)
  {
    objc_msgSend_setMergeableDeltaMetadataRetrieveResponse_(self, (const char *)v111, v42);
  }
  mergeableDeltaReplaceResponse = self->_mergeableDeltaReplaceResponse;
  uint64_t v44 = v111[14];
  if (mergeableDeltaReplaceResponse)
  {
    if (v44) {
      objc_msgSend_mergeFrom_(mergeableDeltaReplaceResponse, (const char *)v111, v44);
    }
  }
  else if (v44)
  {
    objc_msgSend_setMergeableDeltaReplaceResponse_(self, (const char *)v111, v44);
  }
  mergeableDeltaRetrieveResponse = self->_mergeableDeltaRetrieveResponse;
  uint64_t v46 = v111[15];
  if (mergeableDeltaRetrieveResponse)
  {
    if (v46) {
      objc_msgSend_mergeFrom_(mergeableDeltaRetrieveResponse, (const char *)v111, v46);
    }
  }
  else if (v46)
  {
    objc_msgSend_setMergeableDeltaRetrieveResponse_(self, (const char *)v111, v46);
  }
  assetUploadTokenRetrieveResponse = self->_assetUploadTokenRetrieveResponse;
  uint64_t v48 = v111[6];
  if (assetUploadTokenRetrieveResponse)
  {
    if (v48) {
      objc_msgSend_mergeFrom_(assetUploadTokenRetrieveResponse, (const char *)v111, v48);
    }
  }
  else if (v48)
  {
    objc_msgSend_setAssetUploadTokenRetrieveResponse_(self, (const char *)v111, v48);
  }
  deleteContainerResponse = self->_deleteContainerResponse;
  uint64_t v50 = v111[8];
  if (deleteContainerResponse)
  {
    if (v50) {
      objc_msgSend_mergeFrom_(deleteContainerResponse, (const char *)v111, v50);
    }
  }
  else if (v50)
  {
    objc_msgSend_setDeleteContainerResponse_(self, (const char *)v111, v50);
  }
  userAvailableQuotaResponse = self->_userAvailableQuotaResponse;
  uint64_t v52 = v111[41];
  if (userAvailableQuotaResponse)
  {
    if (v52) {
      objc_msgSend_mergeFrom_(userAvailableQuotaResponse, (const char *)v111, v52);
    }
  }
  else if (v52)
  {
    objc_msgSend_setUserAvailableQuotaResponse_(self, (const char *)v111, v52);
  }
  bundlesForContainerResponse = self->_bundlesForContainerResponse;
  uint64_t v54 = v111[7];
  if (bundlesForContainerResponse)
  {
    if (v54) {
      objc_msgSend_mergeFrom_(bundlesForContainerResponse, (const char *)v111, v54);
    }
  }
  else if (v54)
  {
    objc_msgSend_setBundlesForContainerResponse_(self, (const char *)v111, v54);
  }
  webAuthTokenRetrieveResponse = self->_webAuthTokenRetrieveResponse;
  uint64_t v56 = v111[48];
  if (webAuthTokenRetrieveResponse)
  {
    if (v56) {
      objc_msgSend_mergeFrom_(webAuthTokenRetrieveResponse, (const char *)v111, v56);
    }
  }
  else if (v56)
  {
    objc_msgSend_setWebAuthTokenRetrieveResponse_(self, (const char *)v111, v56);
  }
  updateMissingAssetStatusResponse = self->_updateMissingAssetStatusResponse;
  uint64_t v58 = v111[40];
  if (updateMissingAssetStatusResponse)
  {
    if (v58) {
      objc_msgSend_mergeFrom_(updateMissingAssetStatusResponse, (const char *)v111, v58);
    }
  }
  else if (v58)
  {
    objc_msgSend_setUpdateMissingAssetStatusResponse_(self, (const char *)v111, v58);
  }
  anonymousShareAddResponse = self->_anonymousShareAddResponse;
  uint64_t v60 = v111[3];
  if (anonymousShareAddResponse)
  {
    if (v60) {
      objc_msgSend_mergeFrom_(anonymousShareAddResponse, (const char *)v111, v60);
    }
  }
  else if (v60)
  {
    objc_msgSend_setAnonymousShareAddResponse_(self, (const char *)v111, v60);
  }
  anonymousShareRemoveResponse = self->_anonymousShareRemoveResponse;
  uint64_t v62 = v111[4];
  if (anonymousShareRemoveResponse)
  {
    if (v62) {
      objc_msgSend_mergeFrom_(anonymousShareRemoveResponse, (const char *)v111, v62);
    }
  }
  else if (v62)
  {
    objc_msgSend_setAnonymousShareRemoveResponse_(self, (const char *)v111, v62);
  }
  subscriptionCreateResponse = self->_subscriptionCreateResponse;
  uint64_t v64 = v111[35];
  if (subscriptionCreateResponse)
  {
    if (v64) {
      objc_msgSend_mergeFrom_(subscriptionCreateResponse, (const char *)v111, v64);
    }
  }
  else if (v64)
  {
    objc_msgSend_setSubscriptionCreateResponse_(self, (const char *)v111, v64);
  }
  subscriptionRetrieveResponse = self->_subscriptionRetrieveResponse;
  uint64_t v66 = v111[37];
  if (subscriptionRetrieveResponse)
  {
    if (v66) {
      objc_msgSend_mergeFrom_(subscriptionRetrieveResponse, (const char *)v111, v66);
    }
  }
  else if (v66)
  {
    objc_msgSend_setSubscriptionRetrieveResponse_(self, (const char *)v111, v66);
  }
  subscriptionDeleteResponse = self->_subscriptionDeleteResponse;
  uint64_t v68 = v111[36];
  if (subscriptionDeleteResponse)
  {
    if (v68) {
      objc_msgSend_mergeFrom_(subscriptionDeleteResponse, (const char *)v111, v68);
    }
  }
  else if (v68)
  {
    objc_msgSend_setSubscriptionDeleteResponse_(self, (const char *)v111, v68);
  }
  userRetrieveResponse = self->_userRetrieveResponse;
  uint64_t v70 = v111[47];
  if (userRetrieveResponse)
  {
    if (v70) {
      objc_msgSend_mergeFrom_(userRetrieveResponse, (const char *)v111, v70);
    }
  }
  else if (v70)
  {
    objc_msgSend_setUserRetrieveResponse_(self, (const char *)v111, v70);
  }
  userQueryResponse = self->_userQueryResponse;
  uint64_t v72 = v111[46];
  if (userQueryResponse)
  {
    if (v72) {
      objc_msgSend_mergeFrom_(userQueryResponse, (const char *)v111, v72);
    }
  }
  else if (v72)
  {
    objc_msgSend_setUserQueryResponse_(self, (const char *)v111, v72);
  }
  userPrivacySettingsRetrieveResponse = self->_userPrivacySettingsRetrieveResponse;
  uint64_t v74 = v111[44];
  if (userPrivacySettingsRetrieveResponse)
  {
    if (v74) {
      objc_msgSend_mergeFrom_(userPrivacySettingsRetrieveResponse, (const char *)v111, v74);
    }
  }
  else if (v74)
  {
    objc_msgSend_setUserPrivacySettingsRetrieveResponse_(self, (const char *)v111, v74);
  }
  userPrivacySettingsUpdateResponse = self->_userPrivacySettingsUpdateResponse;
  uint64_t v76 = v111[45];
  if (userPrivacySettingsUpdateResponse)
  {
    if (v76) {
      objc_msgSend_mergeFrom_(userPrivacySettingsUpdateResponse, (const char *)v111, v76);
    }
  }
  else if (v76)
  {
    objc_msgSend_setUserPrivacySettingsUpdateResponse_(self, (const char *)v111, v76);
  }
  userPrivacySettingsResetResponse = self->_userPrivacySettingsResetResponse;
  uint64_t v78 = v111[43];
  if (userPrivacySettingsResetResponse)
  {
    if (v78) {
      objc_msgSend_mergeFrom_(userPrivacySettingsResetResponse, (const char *)v111, v78);
    }
  }
  else if (v78)
  {
    objc_msgSend_setUserPrivacySettingsResetResponse_(self, (const char *)v111, v78);
  }
  userPrivacySettingsBatchLookupResponse = self->_userPrivacySettingsBatchLookupResponse;
  uint64_t v80 = v111[42];
  if (userPrivacySettingsBatchLookupResponse)
  {
    if (v80) {
      objc_msgSend_mergeFrom_(userPrivacySettingsBatchLookupResponse, (const char *)v111, v80);
    }
  }
  else if (v80)
  {
    objc_msgSend_setUserPrivacySettingsBatchLookupResponse_(self, (const char *)v111, v80);
  }
  adopterCapabilitiesSaveResponse = self->_adopterCapabilitiesSaveResponse;
  uint64_t v82 = v111[2];
  if (adopterCapabilitiesSaveResponse)
  {
    if (v82) {
      objc_msgSend_mergeFrom_(adopterCapabilitiesSaveResponse, (const char *)v111, v82);
    }
  }
  else if (v82)
  {
    objc_msgSend_setAdopterCapabilitiesSaveResponse_(self, (const char *)v111, v82);
  }
  adopterCapabilitiesCheckResponse = self->_adopterCapabilitiesCheckResponse;
  uint64_t v84 = v111[1];
  if (adopterCapabilitiesCheckResponse)
  {
    if (v84) {
      objc_msgSend_mergeFrom_(adopterCapabilitiesCheckResponse, (const char *)v111, v84);
    }
  }
  else if (v84)
  {
    objc_msgSend_setAdopterCapabilitiesCheckResponse_(self, (const char *)v111, v84);
  }
  zoneUsageSaveResponse = self->_zoneUsageSaveResponse;
  uint64_t v86 = v111[53];
  if (zoneUsageSaveResponse)
  {
    if (v86) {
      objc_msgSend_mergeFrom_(zoneUsageSaveResponse, (const char *)v111, v86);
    }
  }
  else if (v86)
  {
    objc_msgSend_setZoneUsageSaveResponse_(self, (const char *)v111, v86);
  }
  shareUsageSaveResponse = self->_shareUsageSaveResponse;
  uint64_t v88 = v111[33];
  if (shareUsageSaveResponse)
  {
    if (v88) {
      objc_msgSend_mergeFrom_(shareUsageSaveResponse, (const char *)v111, v88);
    }
  }
  else if (v88)
  {
    objc_msgSend_setShareUsageSaveResponse_(self, (const char *)v111, v88);
  }
  shareAcceptResponse = self->_shareAcceptResponse;
  uint64_t v90 = v111[30];
  if (shareAcceptResponse)
  {
    if (v90) {
      objc_msgSend_mergeFrom_(shareAcceptResponse, (const char *)v111, v90);
    }
  }
  else if (v90)
  {
    objc_msgSend_setShareAcceptResponse_(self, (const char *)v111, v90);
  }
  shareDeclineResponse = self->_shareDeclineResponse;
  uint64_t v92 = v111[32];
  if (shareDeclineResponse)
  {
    if (v92) {
      objc_msgSend_mergeFrom_(shareDeclineResponse, (const char *)v111, v92);
    }
  }
  else if (v92)
  {
    objc_msgSend_setShareDeclineResponse_(self, (const char *)v111, v92);
  }
  shareVettingInitiateResponse = self->_shareVettingInitiateResponse;
  uint64_t v94 = v111[34];
  if (shareVettingInitiateResponse)
  {
    if (v94) {
      objc_msgSend_mergeFrom_(shareVettingInitiateResponse, (const char *)v111, v94);
    }
  }
  else if (v94)
  {
    objc_msgSend_setShareVettingInitiateResponse_(self, (const char *)v111, v94);
  }
  tokenRegistrationResponse = self->_tokenRegistrationResponse;
  uint64_t v96 = v111[38];
  if (tokenRegistrationResponse)
  {
    if (v96) {
      objc_msgSend_mergeFrom_(tokenRegistrationResponse, (const char *)v111, v96);
    }
  }
  else if (v96)
  {
    objc_msgSend_setTokenRegistrationResponse_(self, (const char *)v111, v96);
  }
  tokenUnregistrationResponse = self->_tokenUnregistrationResponse;
  uint64_t v98 = v111[39];
  if (tokenUnregistrationResponse)
  {
    if (v98) {
      objc_msgSend_mergeFrom_(tokenUnregistrationResponse, (const char *)v111, v98);
    }
  }
  else if (v98)
  {
    objc_msgSend_setTokenUnregistrationResponse_(self, (const char *)v111, v98);
  }
  setBadgeCountResponse = self->_setBadgeCountResponse;
  uint64_t v100 = v111[29];
  if (setBadgeCountResponse)
  {
    if (v100) {
      objc_msgSend_mergeFrom_(setBadgeCountResponse, (const char *)v111, v100);
    }
  }
  else if (v100)
  {
    objc_msgSend_setSetBadgeCountResponse_(self, (const char *)v111, v100);
  }
  notificationSyncResponse = self->_notificationSyncResponse;
  uint64_t v102 = v111[18];
  if (notificationSyncResponse)
  {
    if (v102) {
      objc_msgSend_mergeFrom_(notificationSyncResponse, (const char *)v111, v102);
    }
  }
  else if (v102)
  {
    objc_msgSend_setNotificationSyncResponse_(self, (const char *)v111, v102);
  }
  notificationMarkReadResponse = self->_notificationMarkReadResponse;
  uint64_t v104 = v111[17];
  if (notificationMarkReadResponse)
  {
    if (v104) {
      objc_msgSend_mergeFrom_(notificationMarkReadResponse, (const char *)v111, v104);
    }
  }
  else if (v104)
  {
    objc_msgSend_setNotificationMarkReadResponse_(self, (const char *)v111, v104);
  }
  archiveRecordsResponse = self->_archiveRecordsResponse;
  uint64_t v106 = v111[5];
  if (archiveRecordsResponse)
  {
    if (v106) {
      objc_msgSend_mergeFrom_(archiveRecordsResponse, (const char *)v111, v106);
    }
  }
  else if (v106)
  {
    objc_msgSend_setArchiveRecordsResponse_(self, (const char *)v111, v106);
  }
  markAssetBrokenResponse = self->_markAssetBrokenResponse;
  uint64_t v108 = v111[12];
  if (markAssetBrokenResponse)
  {
    if (v108) {
      objc_msgSend_mergeFrom_(markAssetBrokenResponse, (const char *)v111, v108);
    }
  }
  else if (v108)
  {
    objc_msgSend_setMarkAssetBrokenResponse_(self, (const char *)v111, v108);
  }
  functionInvokeResponse = self->_functionInvokeResponse;
  uint64_t v110 = v111[10];
  if (functionInvokeResponse)
  {
    if (v110) {
      objc_msgSend_mergeFrom_(functionInvokeResponse, (const char *)v111, v110);
    }
  }
  else if (v110)
  {
    objc_msgSend_setFunctionInvokeResponse_(self, (const char *)v111, v110);
  }
}

- (CKDPOperation)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (CKDPResponseOperationResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (CKDPResponseOperationHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneUsageSaveResponse, 0);
  objc_storeStrong((id *)&self->_zoneSaveResponse, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_zoneRetrieveChangesResponse, 0);
  objc_storeStrong((id *)&self->_zoneDeleteResponse, 0);
  objc_storeStrong((id *)&self->_webAuthTokenRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_userRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_userQueryResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsUpdateResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsResetResponse, 0);
  objc_storeStrong((id *)&self->_userPrivacySettingsBatchLookupResponse, 0);
  objc_storeStrong((id *)&self->_userAvailableQuotaResponse, 0);
  objc_storeStrong((id *)&self->_updateMissingAssetStatusResponse, 0);
  objc_storeStrong((id *)&self->_tokenUnregistrationResponse, 0);
  objc_storeStrong((id *)&self->_tokenRegistrationResponse, 0);
  objc_storeStrong((id *)&self->_subscriptionRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_subscriptionDeleteResponse, 0);
  objc_storeStrong((id *)&self->_subscriptionCreateResponse, 0);
  objc_storeStrong((id *)&self->_shareVettingInitiateResponse, 0);
  objc_storeStrong((id *)&self->_shareUsageSaveResponse, 0);
  objc_storeStrong((id *)&self->_shareDeclineResponse, 0);
  objc_storeStrong((id *)&self->_shareAccessResponse, 0);
  objc_storeStrong((id *)&self->_shareAcceptResponse, 0);
  objc_storeStrong((id *)&self->_setBadgeCountResponse, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_recordSaveResponse, 0);
  objc_storeStrong((id *)&self->_recordRetrieveVersionsResponse, 0);
  objc_storeStrong((id *)&self->_recordRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_recordRetrieveChangesResponse, 0);
  objc_storeStrong((id *)&self->_recordResolveTokenResponse, 0);
  objc_storeStrong((id *)&self->_recordMoveResponse, 0);
  objc_storeStrong((id *)&self->_recordDeleteResponse, 0);
  objc_storeStrong((id *)&self->_queryRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_notificationSyncResponse, 0);
  objc_storeStrong((id *)&self->_notificationMarkReadResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaSaveResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaReplaceResponse, 0);
  objc_storeStrong((id *)&self->_mergeableDeltaMetadataRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_markAssetBrokenResponse, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_functionInvokeResponse, 0);
  objc_storeStrong((id *)&self->_fetchArchivedRecordsResponse, 0);
  objc_storeStrong((id *)&self->_deleteContainerResponse, 0);
  objc_storeStrong((id *)&self->_bundlesForContainerResponse, 0);
  objc_storeStrong((id *)&self->_assetUploadTokenRetrieveResponse, 0);
  objc_storeStrong((id *)&self->_archiveRecordsResponse, 0);
  objc_storeStrong((id *)&self->_anonymousShareRemoveResponse, 0);
  objc_storeStrong((id *)&self->_anonymousShareAddResponse, 0);
  objc_storeStrong((id *)&self->_adopterCapabilitiesSaveResponse, 0);
  objc_storeStrong((id *)&self->_adopterCapabilitiesCheckResponse, 0);
}

- (BOOL)hasFunctionInvokeResponse
{
  return self->_functionInvokeResponse != 0;
}

- (CKDPCodeFunctionInvokeResponse)functionInvokeResponse
{
  return self->_functionInvokeResponse;
}

- (void)setFunctionInvokeResponse:(id)a3
{
}

- (BOOL)hasMergeableDeltaSaveResponse
{
  return self->_mergeableDeltaSaveResponse != 0;
}

- (CKDPMergeableDeltaSaveResponse)mergeableDeltaSaveResponse
{
  return self->_mergeableDeltaSaveResponse;
}

- (void)setMergeableDeltaSaveResponse:(id)a3
{
}

- (BOOL)hasMergeableDeltaMetadataRetrieveResponse
{
  return self->_mergeableDeltaMetadataRetrieveResponse != 0;
}

- (CKDPMergeableDeltaMetadataRetrieveResponse)mergeableDeltaMetadataRetrieveResponse
{
  return self->_mergeableDeltaMetadataRetrieveResponse;
}

- (void)setMergeableDeltaMetadataRetrieveResponse:(id)a3
{
}

- (BOOL)hasMergeableDeltaReplaceResponse
{
  return self->_mergeableDeltaReplaceResponse != 0;
}

- (CKDPMergeableDeltaReplaceResponse)mergeableDeltaReplaceResponse
{
  return self->_mergeableDeltaReplaceResponse;
}

- (void)setMergeableDeltaReplaceResponse:(id)a3
{
}

- (BOOL)hasMergeableDeltaRetrieveResponse
{
  return self->_mergeableDeltaRetrieveResponse != 0;
}

- (CKDPMergeableDeltaRetrieveResponse)mergeableDeltaRetrieveResponse
{
  return self->_mergeableDeltaRetrieveResponse;
}

- (void)setMergeableDeltaRetrieveResponse:(id)a3
{
}

- (BOOL)hasShareVettingInitiateResponse
{
  return self->_shareVettingInitiateResponse != 0;
}

- (CKDPShareVettingInitiateResponse)shareVettingInitiateResponse
{
  return self->_shareVettingInitiateResponse;
}

- (void)setShareVettingInitiateResponse:(id)a3
{
}

- (BOOL)hasZoneSaveResponse
{
  return self->_zoneSaveResponse != 0;
}

- (CKDPZoneSaveResponse)zoneSaveResponse
{
  return self->_zoneSaveResponse;
}

- (void)setZoneSaveResponse:(id)a3
{
}

- (BOOL)hasZoneRetrieveResponse
{
  return self->_zoneRetrieveResponse != 0;
}

- (CKDPZoneRetrieveResponse)zoneRetrieveResponse
{
  return self->_zoneRetrieveResponse;
}

- (void)setZoneRetrieveResponse:(id)a3
{
}

- (BOOL)hasZoneDeleteResponse
{
  return self->_zoneDeleteResponse != 0;
}

- (CKDPZoneDeleteResponse)zoneDeleteResponse
{
  return self->_zoneDeleteResponse;
}

- (void)setZoneDeleteResponse:(id)a3
{
}

- (BOOL)hasZoneRetrieveChangesResponse
{
  return self->_zoneRetrieveChangesResponse != 0;
}

- (CKDPZoneRetrieveChangesResponse)zoneRetrieveChangesResponse
{
  return self->_zoneRetrieveChangesResponse;
}

- (void)setZoneRetrieveChangesResponse:(id)a3
{
}

- (BOOL)hasRecordSaveResponse
{
  return self->_recordSaveResponse != 0;
}

- (CKDPRecordSaveResponse)recordSaveResponse
{
  return self->_recordSaveResponse;
}

- (void)setRecordSaveResponse:(id)a3
{
}

- (BOOL)hasRecordRetrieveResponse
{
  return self->_recordRetrieveResponse != 0;
}

- (CKDPRecordRetrieveResponse)recordRetrieveResponse
{
  return self->_recordRetrieveResponse;
}

- (void)setRecordRetrieveResponse:(id)a3
{
}

- (BOOL)hasRecordRetrieveVersionsResponse
{
  return self->_recordRetrieveVersionsResponse != 0;
}

- (CKDPRecordRetrieveVersionsResponse)recordRetrieveVersionsResponse
{
  return self->_recordRetrieveVersionsResponse;
}

- (void)setRecordRetrieveVersionsResponse:(id)a3
{
}

- (BOOL)hasRecordRetrieveChangesResponse
{
  return self->_recordRetrieveChangesResponse != 0;
}

- (CKDPRecordRetrieveChangesResponse)recordRetrieveChangesResponse
{
  return self->_recordRetrieveChangesResponse;
}

- (void)setRecordRetrieveChangesResponse:(id)a3
{
}

- (BOOL)hasRecordDeleteResponse
{
  return self->_recordDeleteResponse != 0;
}

- (CKDPRecordDeleteResponse)recordDeleteResponse
{
  return self->_recordDeleteResponse;
}

- (void)setRecordDeleteResponse:(id)a3
{
}

- (BOOL)hasRecordResolveTokenResponse
{
  return self->_recordResolveTokenResponse != 0;
}

- (CKDPRecordResolveTokenResponse)recordResolveTokenResponse
{
  return self->_recordResolveTokenResponse;
}

- (void)setRecordResolveTokenResponse:(id)a3
{
}

- (BOOL)hasShareAccessResponse
{
  return self->_shareAccessResponse != 0;
}

- (CKDPShareAccessResponse)shareAccessResponse
{
  return self->_shareAccessResponse;
}

- (void)setShareAccessResponse:(id)a3
{
}

- (BOOL)hasRecordMoveResponse
{
  return self->_recordMoveResponse != 0;
}

- (CKDPRecordMoveResponse)recordMoveResponse
{
  return self->_recordMoveResponse;
}

- (void)setRecordMoveResponse:(id)a3
{
}

- (BOOL)hasFetchArchivedRecordsResponse
{
  return self->_fetchArchivedRecordsResponse != 0;
}

- (CKDPFetchArchivedRecordsResponse)fetchArchivedRecordsResponse
{
  return self->_fetchArchivedRecordsResponse;
}

- (void)setFetchArchivedRecordsResponse:(id)a3
{
}

- (BOOL)hasUserAvailableQuotaResponse
{
  return self->_userAvailableQuotaResponse != 0;
}

- (CKDPUserAvailableQuotaResponse)userAvailableQuotaResponse
{
  return self->_userAvailableQuotaResponse;
}

- (void)setUserAvailableQuotaResponse:(id)a3
{
}

- (BOOL)hasUserRetrieveResponse
{
  return self->_userRetrieveResponse != 0;
}

- (CKDPUserRetrieveResponse)userRetrieveResponse
{
  return self->_userRetrieveResponse;
}

- (void)setUserRetrieveResponse:(id)a3
{
}

- (BOOL)hasQueryRetrieveResponse
{
  return self->_queryRetrieveResponse != 0;
}

- (CKDPQueryRetrieveResponse)queryRetrieveResponse
{
  return self->_queryRetrieveResponse;
}

- (void)setQueryRetrieveResponse:(id)a3
{
}

- (BOOL)hasAssetUploadTokenRetrieveResponse
{
  return self->_assetUploadTokenRetrieveResponse != 0;
}

- (CKDPAssetUploadTokenRetrieveResponse)assetUploadTokenRetrieveResponse
{
  return self->_assetUploadTokenRetrieveResponse;
}

- (void)setAssetUploadTokenRetrieveResponse:(id)a3
{
}

- (BOOL)hasDeleteContainerResponse
{
  return self->_deleteContainerResponse != 0;
}

- (CKDPDeleteContainerResponse)deleteContainerResponse
{
  return self->_deleteContainerResponse;
}

- (void)setDeleteContainerResponse:(id)a3
{
}

- (BOOL)hasBundlesForContainerResponse
{
  return self->_bundlesForContainerResponse != 0;
}

- (CKDPBundlesForContainerResponse)bundlesForContainerResponse
{
  return self->_bundlesForContainerResponse;
}

- (void)setBundlesForContainerResponse:(id)a3
{
}

- (BOOL)hasWebAuthTokenRetrieveResponse
{
  return self->_webAuthTokenRetrieveResponse != 0;
}

- (CKDPWebAuthTokenRetrieveResponse)webAuthTokenRetrieveResponse
{
  return self->_webAuthTokenRetrieveResponse;
}

- (void)setWebAuthTokenRetrieveResponse:(id)a3
{
}

- (BOOL)hasUpdateMissingAssetStatusResponse
{
  return self->_updateMissingAssetStatusResponse != 0;
}

- (CKDPUpdateMissingAssetStatusResponse)updateMissingAssetStatusResponse
{
  return self->_updateMissingAssetStatusResponse;
}

- (void)setUpdateMissingAssetStatusResponse:(id)a3
{
}

- (BOOL)hasShareAcceptResponse
{
  return self->_shareAcceptResponse != 0;
}

- (CKDPShareAcceptResponse)shareAcceptResponse
{
  return self->_shareAcceptResponse;
}

- (void)setShareAcceptResponse:(id)a3
{
}

- (BOOL)hasShareDeclineResponse
{
  return self->_shareDeclineResponse != 0;
}

- (CKDPShareDeclineResponse)shareDeclineResponse
{
  return self->_shareDeclineResponse;
}

- (void)setShareDeclineResponse:(id)a3
{
}

- (BOOL)hasAnonymousShareAddResponse
{
  return self->_anonymousShareAddResponse != 0;
}

- (CKDPAnonymousShareAddResponse)anonymousShareAddResponse
{
  return self->_anonymousShareAddResponse;
}

- (void)setAnonymousShareAddResponse:(id)a3
{
}

- (BOOL)hasAnonymousShareRemoveResponse
{
  return self->_anonymousShareRemoveResponse != 0;
}

- (CKDPAnonymousShareRemoveResponse)anonymousShareRemoveResponse
{
  return self->_anonymousShareRemoveResponse;
}

- (void)setAnonymousShareRemoveResponse:(id)a3
{
}

- (BOOL)hasSubscriptionCreateResponse
{
  return self->_subscriptionCreateResponse != 0;
}

- (CKDPSubscriptionCreateResponse)subscriptionCreateResponse
{
  return self->_subscriptionCreateResponse;
}

- (void)setSubscriptionCreateResponse:(id)a3
{
}

- (BOOL)hasSubscriptionRetrieveResponse
{
  return self->_subscriptionRetrieveResponse != 0;
}

- (CKDPSubscriptionRetrieveResponse)subscriptionRetrieveResponse
{
  return self->_subscriptionRetrieveResponse;
}

- (void)setSubscriptionRetrieveResponse:(id)a3
{
}

- (BOOL)hasSubscriptionDeleteResponse
{
  return self->_subscriptionDeleteResponse != 0;
}

- (CKDPSubscriptionDeleteResponse)subscriptionDeleteResponse
{
  return self->_subscriptionDeleteResponse;
}

- (void)setSubscriptionDeleteResponse:(id)a3
{
}

- (BOOL)hasArchiveRecordsResponse
{
  return self->_archiveRecordsResponse != 0;
}

- (CKDPArchiveRecordsResponse)archiveRecordsResponse
{
  return self->_archiveRecordsResponse;
}

- (void)setArchiveRecordsResponse:(id)a3
{
}

- (BOOL)hasMarkAssetBrokenResponse
{
  return self->_markAssetBrokenResponse != 0;
}

- (CKDPMarkAssetBrokenResponse)markAssetBrokenResponse
{
  return self->_markAssetBrokenResponse;
}

- (void)setMarkAssetBrokenResponse:(id)a3
{
}

- (BOOL)hasUserQueryResponse
{
  return self->_userQueryResponse != 0;
}

- (CKDPUserQueryResponse)userQueryResponse
{
  return self->_userQueryResponse;
}

- (void)setUserQueryResponse:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsUpdateResponse
{
  return self->_userPrivacySettingsUpdateResponse != 0;
}

- (CKDPUserPrivacySettingsUpdateResponse)userPrivacySettingsUpdateResponse
{
  return self->_userPrivacySettingsUpdateResponse;
}

- (void)setUserPrivacySettingsUpdateResponse:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsResetResponse
{
  return self->_userPrivacySettingsResetResponse != 0;
}

- (CKDPUserPrivacySettingsResetResponse)userPrivacySettingsResetResponse
{
  return self->_userPrivacySettingsResetResponse;
}

- (void)setUserPrivacySettingsResetResponse:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsBatchLookupResponse
{
  return self->_userPrivacySettingsBatchLookupResponse != 0;
}

- (CKDPUserPrivacySettingsBatchLookupResponse)userPrivacySettingsBatchLookupResponse
{
  return self->_userPrivacySettingsBatchLookupResponse;
}

- (void)setUserPrivacySettingsBatchLookupResponse:(id)a3
{
}

- (BOOL)hasUserPrivacySettingsRetrieveResponse
{
  return self->_userPrivacySettingsRetrieveResponse != 0;
}

- (CKDPUserPrivacySettingsRetrieveResponse)userPrivacySettingsRetrieveResponse
{
  return self->_userPrivacySettingsRetrieveResponse;
}

- (void)setUserPrivacySettingsRetrieveResponse:(id)a3
{
}

- (BOOL)hasAdopterCapabilitiesSaveResponse
{
  return self->_adopterCapabilitiesSaveResponse != 0;
}

- (CKDPAdopterCapabilitiesSaveResponse)adopterCapabilitiesSaveResponse
{
  return self->_adopterCapabilitiesSaveResponse;
}

- (void)setAdopterCapabilitiesSaveResponse:(id)a3
{
}

- (BOOL)hasZoneUsageSaveResponse
{
  return self->_zoneUsageSaveResponse != 0;
}

- (CKDPZoneUsageSaveResponse)zoneUsageSaveResponse
{
  return self->_zoneUsageSaveResponse;
}

- (void)setZoneUsageSaveResponse:(id)a3
{
}

- (BOOL)hasShareUsageSaveResponse
{
  return self->_shareUsageSaveResponse != 0;
}

- (CKDPShareUsageSaveResponse)shareUsageSaveResponse
{
  return self->_shareUsageSaveResponse;
}

- (void)setShareUsageSaveResponse:(id)a3
{
}

- (BOOL)hasAdopterCapabilitiesCheckResponse
{
  return self->_adopterCapabilitiesCheckResponse != 0;
}

- (CKDPAdopterCapabilitiesCheckResponse)adopterCapabilitiesCheckResponse
{
  return self->_adopterCapabilitiesCheckResponse;
}

- (void)setAdopterCapabilitiesCheckResponse:(id)a3
{
}

- (BOOL)hasTokenRegistrationResponse
{
  return self->_tokenRegistrationResponse != 0;
}

- (CKDPTokenRegistrationResponse)tokenRegistrationResponse
{
  return self->_tokenRegistrationResponse;
}

- (void)setTokenRegistrationResponse:(id)a3
{
}

- (BOOL)hasTokenUnregistrationResponse
{
  return self->_tokenUnregistrationResponse != 0;
}

- (CKDPTokenUnregistrationResponse)tokenUnregistrationResponse
{
  return self->_tokenUnregistrationResponse;
}

- (void)setTokenUnregistrationResponse:(id)a3
{
}

- (BOOL)hasSetBadgeCountResponse
{
  return self->_setBadgeCountResponse != 0;
}

- (CKDPSetBadgeCountResponse)setBadgeCountResponse
{
  return self->_setBadgeCountResponse;
}

- (void)setSetBadgeCountResponse:(id)a3
{
}

- (BOOL)hasNotificationSyncResponse
{
  return self->_notificationSyncResponse != 0;
}

- (CKDPNotificationSyncResponse)notificationSyncResponse
{
  return self->_notificationSyncResponse;
}

- (void)setNotificationSyncResponse:(id)a3
{
}

- (BOOL)hasNotificationMarkReadResponse
{
  return self->_notificationMarkReadResponse != 0;
}

- (CKDPNotificationMarkReadResponse)notificationMarkReadResponse
{
  return self->_notificationMarkReadResponse;
}

- (void)setNotificationMarkReadResponse:(id)a3
{
}

@end