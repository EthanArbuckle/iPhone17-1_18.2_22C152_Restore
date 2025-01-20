@interface CLSServerInterfaceConfigurator
- (CLSServerInterfaceConfigurator)init;
- (id)configureServerInterface;
- (void)configureAdminRequestAPI;
- (void)configureAppsAPI;
- (void)configureAssetSupportAPI;
- (void)configureAuthorizationStatusAPI;
- (void)configureClassAPI;
- (void)configureCollaborationStateAPI;
- (void)configureCollectionsAPI;
- (void)configureContextAPI;
- (void)configureDashboardAppAPI;
- (void)configureDataObserverAPI;
- (void)configureFeatureAvailabilityAPI;
- (void)configureHandoutAPI;
- (void)configureInsightEventsAPI;
- (void)configureProgressReportingAPI;
- (void)configureQueryAPI;
- (void)configureRelayRequestAPI;
- (void)configureSaveAPI;
- (void)configureStudentActivityAPI;
- (void)configureSurveyAnswerAPI;
- (void)configureUserNotificationAPI;
- (void)configureUtilityServerAPI;
@end

@implementation CLSServerInterfaceConfigurator

- (CLSServerInterfaceConfigurator)init
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CLSServerInterfaceConfigurator;
  v3 = [(CLSServerInterfaceConfigurator *)&v15 init];
  if (v3)
  {
    uint64_t v4 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v2, (uint64_t)&unk_1F37CE0B8);
    interface = v3->_interface;
    v3->_interface = (NSXPCInterface *)v4;

    uint64_t v6 = CLSProgressClasses();
    contextsSet = v3->_contextsSet;
    v3->_contextsSet = (NSSet *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v16, 1);
    uint64_t v12 = objc_msgSend_setWithArray_(v8, v11, (uint64_t)v10);
    arraySet = v3->_arraySet;
    v3->_arraySet = (NSSet *)v12;
  }
  return v3;
}

- (id)configureServerInterface
{
  objc_msgSend_configureQueryAPI(self, a2, v2);
  objc_msgSend_configureSaveAPI(self, v4, v5);
  objc_msgSend_configureDataObserverAPI(self, v6, v7);
  objc_msgSend_configureContextAPI(self, v8, v9);
  objc_msgSend_configureProgressReportingAPI(self, v10, v11);
  objc_msgSend_configureDashboardAppAPI(self, v12, v13);
  objc_msgSend_configureAppsAPI(self, v14, v15);
  objc_msgSend_configureUserNotificationAPI(self, v16, v17);
  objc_msgSend_configureUtilityServerAPI(self, v18, v19);
  objc_msgSend_configureAuthorizationStatusAPI(self, v20, v21);
  objc_msgSend_configureHandoutAPI(self, v22, v23);
  objc_msgSend_configureCollectionsAPI(self, v24, v25);
  objc_msgSend_configureCollaborationStateAPI(self, v26, v27);
  objc_msgSend_configureClassAPI(self, v28, v29);
  objc_msgSend_configureStudentActivityAPI(self, v30, v31);
  objc_msgSend_configureFeatureAvailabilityAPI(self, v32, v33);
  objc_msgSend_configureAssetSupportAPI(self, v34, v35);
  objc_msgSend_configureAdminRequestAPI(self, v36, v37);
  objc_msgSend_configureSurveyAnswerAPI(self, v38, v39);
  objc_msgSend_configureRelayRequestAPI(self, v40, v41);
  objc_msgSend_configureInsightEventsAPI(self, v42, v43);
  interface = self->_interface;

  return interface;
}

- (void)configureQueryAPI
{
  CLSQueryInterface();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v3, (uint64_t)v10, sel_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_, 0, 0);
  interface = self->_interface;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v6, v5, sel_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_, 1, 0);
  uint64_t v7 = self->_interface;
  uint64_t v8 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v7, v9, v8, sel_remote_executeQuery_querySpecification_searchSpecification_issueServerRequest_completion_, 2, 0);
}

- (void)configureSaveAPI
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = CLSObjectsClasses();
  objc_msgSend_setWithUnionOfSets_(v3, v5, (uint64_t)v4, self->_arraySet, 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v6, (uint64_t)v9, sel_remote_saveObjects_saveResponse_completion_, 0, 0);
  uint64_t v7 = CLSSaveResponseInterface();
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v7, sel_remote_saveObjects_saveResponse_completion_, 1, 0);
}

- (void)configureDataObserverAPI
{
  id v8 = (id)objc_opt_new();
  objc_msgSend_setProtocol_(v8, v3, (uint64_t)&unk_1F37BD308);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v4, (uint64_t)v8, sel_remote_registerDataObserver_withID_querySpecification_oldChangeTag_completion_, 0, 0);
  interface = self->_interface;
  uint64_t v6 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v7, v6, sel_remote_registerDataObserver_withID_querySpecification_oldChangeTag_completion_, 2, 0);
}

- (void)configureContextAPI
{
  v40[2] = *MEMORY[0x1E4F143B8];
  interface = self->_interface;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v8 = objc_msgSend_setWithObjects_(v4, v7, v5, v6, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v9, (uint64_t)v8, sel_remote_mainAppContextWithCompletion_, 0, 1);

  id v10 = self->_interface;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v15 = objc_msgSend_setWithObjects_(v11, v14, v12, v13, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v10, v16, (uint64_t)v15, sel_remote_fetchContextsForContextIDs_completion_, 0, 1);

  uint64_t v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v40, 2);
  v22 = objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_contextsMatchingIdentifierPath_parentContextID_completion_, 0, 0);

  v24 = self->_interface;
  uint64_t v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_contextsMatchingIdentifierPath_parentContextID_completion_, 1, 0);
  uint64_t v27 = self->_interface;
  uint64_t v29 = objc_msgSend_setWithUnionOfSets_(MEMORY[0x1E4F1CAD0], v28, (uint64_t)self->_arraySet, self->_contextsSet, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v27, v30, (uint64_t)v29, sel_remote_contextsMatchingIdentifierPath_parentContextID_completion_, 0, 1);

  uint64_t v31 = self->_interface;
  uint64_t v32 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v31, v33, v32, sel_remote_fetchThumbnailBlobForContextID_completion_, 0, 0);
  v34 = self->_interface;
  uint64_t v35 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v34, v36, v35, sel_remote_fetchThumbnailBlobForContextID_completion_, 0, 1);
  uint64_t v37 = self->_interface;
  uint64_t v38 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v37, v39, v38, sel_remote_deleteThumbnailBlobForContextID_completion_, 0, 0);
}

- (void)configureProgressReportingAPI
{
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_fetchProgressReportingCapabilitiesForContextID_completion_, 0, 0);
  uint64_t v6 = self->_interface;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v6, v12, (uint64_t)v11, sel_remote_fetchProgressReportingCapabilitiesForContextID_completion_, 0, 1);

  uint64_t v13 = self->_interface;
  uint64_t v15 = objc_opt_class();

  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v13, v14, v15, sel_remote_deleteProgressReportingCapabilitiesForContextID_completion_, 0, 0);
}

- (void)configureDashboardAppAPI
{
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_getServerSyncStatusWithCompletion_, 0, 1);
  uint64_t v6 = self->_interface;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v13 = objc_msgSend_setWithObjects_(v7, v12, v8, v9, v10, v11, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v6, v14, (uint64_t)v13, sel_remote_getServerInternalStateInfoWithCompletion_, 0, 1);

  uint64_t v15 = self->_interface;
  uint64_t v16 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v15, v17, v16, sel_remote_canSearchRostersWithCompletion_, 0, 1);
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  objc_msgSend_setWithObjects_(v18, v26, v19, v20, v21, v22, v23, v24, v25, 0);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v27, (uint64_t)v41, sel_remote_currentUserWithCompletion_, 0, 1);
  v28 = self->_interface;
  uint64_t v29 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v28, v30, v29, sel_remote_fetchCountOfActivitiesForContextID_completion_, 0, 0);
  uint64_t v31 = self->_interface;
  uint64_t v32 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v31, v33, v32, sel_remote_fetchCountOfActivitiesForContextID_completion_, 0, 1);
  v34 = self->_interface;
  uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v39 = objc_msgSend_setWithObjects_(v35, v38, v36, v37, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v34, v40, (uint64_t)v39, sel_remote_fetchCountOfActivitiesForContextID_completion_, 1, 1);
}

- (void)configureAppsAPI
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_setOverrideBundleIdentifier_completion_, 0, 0);
  uint64_t v6 = self->_interface;
  uint64_t v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_deleteAppWithBundleIdentifier_completion_, 0, 0);
  uint64_t v9 = self->_interface;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)&v19, 3);
  v14 = objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12, v19, v20);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v9, v15, (uint64_t)v14, sel_remote_listAppsWithCompletion_, 0, 1);

  uint64_t v16 = self->_interface;
  uint64_t v17 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v16, v18, v17, sel_remote_listAppsWithCompletion_, 1, 1);
}

- (void)configureUserNotificationAPI
{
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_triggerUserNotificationReviewDueHandoutsWithReferenceDate_completion_, 0, 0);
  uint64_t v6 = self->_interface;
  uint64_t v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_triggerUserNotificationRevisedSubmissionWithAttachmentID_studentName_completion_, 0, 0);
  uint64_t v9 = self->_interface;
  uint64_t v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v9, v11, v10, sel_remote_triggerUserNotificationHandoutPastDueSummaryWithReferenceDate_completion_, 0, 0);
  uint64_t v12 = self->_interface;
  uint64_t v13 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v12, v14, v13, sel_remote_triggerUserNotificationHandoutDueSoonWithReferenceDate_completion_, 0, 0);
  uint64_t v15 = self->_interface;
  uint64_t v16 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v15, v17, v16, sel_remote_triggerUserNotificationHandoutAssignedWithHandoutID_completion_, 0, 0);
  v18 = self->_interface;
  uint64_t v19 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v18, v20, v19, sel_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_, 0, 0);
  uint64_t v21 = self->_interface;
  uint64_t v22 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v21, v23, v22, sel_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_, 1, 0);
  uint64_t v24 = self->_interface;
  uint64_t v26 = objc_opt_class();

  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v25, v26, sel_remote_triggerUserNotificationWithTitle_message_wrappedImageURL_, 2, 0);
}

- (void)configureUtilityServerAPI
{
  v54[4] = *MEMORY[0x1E4F143B8];
  v52 = objc_msgSend_classesForSelector_argumentIndex_ofReply_(self->_interface, a2, (uint64_t)sel_remote_statusWithCompletion_, 0, 1);
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = objc_msgSend_setByAddingObject_(v52, v4, v3);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v6, (uint64_t)v5, sel_remote_statusWithCompletion_, 0, 1);
  interface = self->_interface;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  v54[3] = objc_opt_class();
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v54, 4);
  uint64_t v12 = objc_msgSend_setWithArray_(v8, v11, (uint64_t)v10);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v13, (uint64_t)v12, sel_remote_syncStatsWithCompletion_, 0, 1);

  v14 = self->_interface;
  uint64_t v15 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v14, v16, v15, sel_remote_fetchReportsWithPredicate_completion_, 0, 0);
  uint64_t v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v22 = objc_msgSend_setWithObjects_(v18, v21, v19, v20, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_fetchReportsWithPredicate_completion_, 1, 1);

  uint64_t v24 = self->_interface;
  uint64_t v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_addAdminRequestor_completion_, 0, 0);
  uint64_t v27 = self->_interface;
  uint64_t v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_remote_addAdminRequestor_completion_, 0, 1);
  v30 = self->_interface;
  uint64_t v31 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v30, v32, v31, sel_remote_addAdminRequestor_completion_, 1, 1);
  uint64_t v33 = self->_interface;
  uint64_t v34 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v33, v35, v34, sel_remote_addOrganization_withLocations_completion_, 0, 0);
  uint64_t v36 = self->_interface;
  uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  uint64_t v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)v53, 2);
  id v41 = objc_msgSend_setWithArray_(v37, v40, (uint64_t)v39);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v36, v42, (uint64_t)v41, sel_remote_addOrganization_withLocations_completion_, 1, 0);

  uint64_t v43 = self->_interface;
  uint64_t v44 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v43, v45, v44, sel_remote_addOrganization_withLocations_completion_, 0, 1);
  v46 = self->_interface;
  uint64_t v47 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v46, v48, v47, sel_remote_addOrganization_withLocations_completion_, 1, 1);
  v49 = self->_interface;
  uint64_t v50 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v49, v51, v50, sel_remote_deleteOrganization_completion_, 0, 0);
}

- (void)configureAuthorizationStatusAPI
{
  v62[2] = *MEMORY[0x1E4F143B8];
  interface = self->_interface;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v62[0] = objc_opt_class();
  v62[1] = objc_opt_class();
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v62, 2);
  uint64_t v8 = objc_msgSend_setWithArray_(v4, v7, (uint64_t)v6);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v9, (uint64_t)v8, sel_remote_addAuthorizationStatus_forContextAtPath_completion_, 1, 0);

  uint64_t v10 = self->_interface;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  v61[0] = objc_opt_class();
  v61[1] = objc_opt_class();
  uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v61, 2);
  uint64_t v15 = objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v10, v16, (uint64_t)v15, sel_remote_removeAuthorizationStatus_forContextAtPath_completion_, 1, 0);

  uint64_t v17 = self->_interface;
  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v60[0] = objc_opt_class();
  v60[1] = objc_opt_class();
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v60, 2);
  uint64_t v22 = objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_authorizationStatusForContextAtPath_completion_, 0, 0);

  uint64_t v24 = self->_interface;
  uint64_t v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_authorizationStatusForContextAtPath_completion_, 0, 1);
  uint64_t v27 = self->_interface;
  uint64_t v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_remote_authorizationStatusForHandoutAssignedItem_completion_, 0, 0);
  v30 = self->_interface;
  uint64_t v31 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v30, v32, v31, sel_remote_authorizationStatusForHandoutAssignedItem_completion_, 0, 1);
  uint64_t v33 = self->_interface;
  uint64_t v34 = (void *)MEMORY[0x1E4F1CAD0];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  uint64_t v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v59, 2);
  uint64_t v38 = objc_msgSend_setWithArray_(v34, v37, (uint64_t)v36);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v33, v39, (uint64_t)v38, sel_remote_addAuthorizationStatus_forHandoutAssignedItem_completion_, 1, 0);

  v40 = self->_interface;
  id v41 = (void *)MEMORY[0x1E4F1CAD0];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  uint64_t v43 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v42, (uint64_t)v58, 2);
  v45 = objc_msgSend_setWithArray_(v41, v44, (uint64_t)v43);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v40, v46, (uint64_t)v45, sel_remote_removeAuthorizationStatus_forHandoutAssignedItem_completion_, 1, 0);

  uint64_t v47 = self->_interface;
  uint64_t v48 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v47, v49, v48, sel_remote_authTreeWithCompletion_, 0, 1);
  uint64_t v50 = self->_interface;
  v51 = (void *)MEMORY[0x1E4F1CAD0];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  v53 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v52, (uint64_t)v57, 2);
  v55 = objc_msgSend_setWithArray_(v51, v54, (uint64_t)v53);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v50, v56, (uint64_t)v55, sel_remote_authTreeForAttachment_withCompletion_, 0, 1);
}

- (void)configureHandoutAPI
{
  uint64_t v3 = CLSHandoutClasses();
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_setByAddingObject_(v3, v5, v4);

  uint64_t v7 = CLSSurveyClasses();
  objc_msgSend_setByAddingObjectsFromSet_(v6, v8, (uint64_t)v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v9, (uint64_t)v11, sel_remote_publishHandoutGraph_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v10, (uint64_t)v11, sel_remote_repairHandoutAttachments_completion_, 0, 0);
}

- (void)configureCollectionsAPI
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v9 = (id)objc_msgSend_initWithObjects_(v3, v7, v4, v5, v6, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v9, sel_remote_deleteCollectionRelatedObjectsWithCompletion_completion_, 0, 0);
}

- (void)configureCollaborationStateAPI
{
  id v3 = CLSCollaborationStateClasses();
  uint64_t v6 = objc_msgSend_supportedInfoDictionaryClasses(CLSCollaborationState, v4, v5);
  objc_msgSend_setByAddingObjectsFromSet_(v3, v7, (uint64_t)v6);
  id v49 = (id)objc_claimAutoreleasedReturnValue();

  interface = self->_interface;
  uint64_t v9 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v10, v9, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 0, 0);
  id v11 = self->_interface;
  uint64_t v12 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v11, v13, v12, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 1, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v14, (uint64_t)v49, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 0, 1);
  uint64_t v15 = self->_interface;
  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v20 = objc_msgSend_setWithObjects_(v16, v19, v17, v18, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v15, v21, (uint64_t)v20, sel_remote_collaborationStatesForObjectWithID_ownerPersonID_completion_, 1, 1);

  uint64_t v22 = self->_interface;
  uint64_t v23 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v22, v24, v23, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 0, 0);
  uint64_t v25 = self->_interface;
  uint64_t v26 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v25, v27, v26, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 1, 0);
  uint64_t v28 = self->_interface;
  uint64_t v29 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v28, v30, v29, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 2, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v31, (uint64_t)v49, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 0, 1);
  uint64_t v32 = self->_interface;
  uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v37 = objc_msgSend_setWithObjects_(v33, v36, v34, v35, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v32, v38, (uint64_t)v37, sel_remote_collaborationStatesForObjectWithID_classID_forOwnersWithRole_completion_, 1, 1);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v39, (uint64_t)v49, sel_remote_publishCollaborationStateChanges_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v40, (uint64_t)v49, sel_remote_publishCollaborationStateChanges_completion_, 0, 1);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v41, (uint64_t)v49, sel_remote_publishCollaborationStateChanges_completion_, 1, 1);
  v42 = self->_interface;
  uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v47 = objc_msgSend_setWithObjects_(v43, v46, v44, v45, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v42, v48, (uint64_t)v47, sel_remote_publishCollaborationStateChanges_completion_, 2, 1);
}

- (void)configureClassAPI
{
  id v3 = CLSRosterClasses();
  uint64_t v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_setByAddingObject_(v3, v5, v4);

  uint64_t v7 = objc_opt_class();
  objc_msgSend_setByAddingObject_(v6, v8, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v9, (uint64_t)v12, sel_remote_publishClass_membersToInsert_membersToDelete_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v10, (uint64_t)v12, sel_remote_publishClass_membersToInsert_membersToDelete_completion_, 1, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v11, (uint64_t)v12, sel_remote_publishClass_membersToInsert_membersToDelete_completion_, 2, 0);
}

- (void)configureStudentActivityAPI
{
  void v59[2] = *MEMORY[0x1E4F143B8];
  interface = self->_interface;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v59[0] = objc_opt_class();
  v59[1] = objc_opt_class();
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v59, 2);
  uint64_t v8 = objc_msgSend_setWithArray_(v4, v7, (uint64_t)v6);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v9, (uint64_t)v8, sel_remote_studentActivityForAttachmentsWithIDs_completion_, 0, 0);

  uint64_t v10 = self->_interface;
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  void v58[2] = objc_opt_class();
  uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v58, 3);
  uint64_t v15 = objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v10, v16, (uint64_t)v15, sel_remote_studentActivityForAttachmentsWithIDs_completion_, 0, 1);

  uint64_t v17 = self->_interface;
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  v57[0] = objc_opt_class();
  v57[1] = objc_opt_class();
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v19, (uint64_t)v57, 2);
  uint64_t v22 = objc_msgSend_setWithArray_(v18, v21, (uint64_t)v20);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v17, v23, (uint64_t)v22, sel_remote_fetchAndCompleteActiveAssignedActivitiesForContextPath_withCompletion_, 0, 0);

  uint64_t v24 = self->_interface;
  uint64_t v25 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v24, v26, v25, sel_remote_triggerUserNotificationRevisionRequestedWithAttachmentID_completion_, 0, 0);
  uint64_t v27 = self->_interface;
  uint64_t v28 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v27, v29, v28, sel_remote_validateAndCreateHandoutAssignedItem_withCompletion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v30, (uint64_t)self->_contextsSet, sel_remote_validateAndCreateHandoutAssignedItem_withCompletion_, 0, 1);
  uint64_t v31 = self->_interface;
  uint64_t v32 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v31, v33, v32, sel_remote_fetchHandoutAttachmentForDocumentURL_withCompletion_, 0, 0);
  uint64_t v34 = self->_interface;
  uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v36, (uint64_t)v56, 2);
  uint64_t v39 = objc_msgSend_setWithArray_(v35, v38, (uint64_t)v37, v56[0]);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v34, v40, (uint64_t)v39, sel_remote_fetchHandoutAttachmentForDocumentURL_withCompletion_, 0, 1);

  id v41 = self->_interface;
  uint64_t v42 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v41, v43, v42, sel_remote_startAppActivity_bundleID_activityType_completion_, 0, 0);
  uint64_t v44 = self->_interface;
  uint64_t v45 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v44, v46, v45, sel_remote_startAppActivity_bundleID_activityType_completion_, 1, 0);
  uint64_t v47 = self->_interface;
  uint64_t v48 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v47, v49, v48, sel_remote_startActivityFailed_completion_, 0, 0);
  uint64_t v50 = self->_interface;
  uint64_t v51 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v50, v52, v51, sel_remote_fetchAppBasedAssignmentUsage_completion_, 0, 0);
  v53 = self->_interface;
  uint64_t v54 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v53, v55, v54, sel_remote_fetchAppBasedAssignmentUsage_completion_, 0, 1);
}

- (void)configureFeatureAvailabilityAPI
{
  v38[3] = *MEMORY[0x1E4F143B8];
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_featureIsEnabled_completion_, 0, 0);
  uint64_t v6 = self->_interface;
  uint64_t v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_featureIsEnabled_completion_, 0, 1);
  uint64_t v9 = self->_interface;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  id v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v38, 3);
  v14 = objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v9, v15, (uint64_t)v14, sel_remote_getUserDefaultsConfigurationDictionaryWithCompletion_, 0, 1);

  uint64_t v16 = self->_interface;
  uint64_t v17 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v16, v18, v17, sel_remote_getUserDefaultForDefaultNamed_completion_, 0, 0);
  uint64_t v19 = self->_interface;
  uint64_t v20 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)v37, 2);
  uint64_t v24 = objc_msgSend_setWithArray_(v20, v23, (uint64_t)v22);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v19, v25, (uint64_t)v24, sel_remote_getUserDefaultForDefaultNamed_completion_, 0, 1);

  uint64_t v26 = self->_interface;
  uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v36, 2);
  uint64_t v31 = objc_msgSend_setWithArray_(v27, v30, (uint64_t)v29, v36[0]);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v26, v32, (uint64_t)v31, sel_remote_setUserDefaultValue_forDefaultNamed_completion_, 0, 0);

  uint64_t v33 = self->_interface;
  uint64_t v34 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v33, v35, v34, sel_remote_setUserDefaultValue_forDefaultNamed_completion_, 1, 0);
}

- (void)configureAssetSupportAPI
{
  v136[5] = *MEMORY[0x1E4F143B8];
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 0, 0);
  uint64_t v6 = self->_interface;
  uint64_t v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 1, 0);
  uint64_t v9 = self->_interface;
  uint64_t v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v9, v11, v10, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 2, 0);
  id v12 = self->_interface;
  uint64_t v13 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v12, v14, v13, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 3, 0);
  uint64_t v15 = self->_interface;
  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  v136[0] = objc_opt_class();
  v136[1] = objc_opt_class();
  v136[2] = objc_opt_class();
  v136[3] = objc_opt_class();
  v136[4] = objc_opt_class();
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v17, (uint64_t)v136, 5);
  uint64_t v20 = objc_msgSend_setWithArray_(v16, v19, (uint64_t)v18);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v15, v21, (uint64_t)v20, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 0, 1);

  uint64_t v22 = self->_interface;
  uint64_t v23 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v22, v24, v23, sel_remote_urlSuitableForOpeningForExpectedURL_itemID_ownerName_zoneName_completion_, 1, 1);
  uint64_t v25 = CLSAssetDownloadProgressNotifiableInterface();
  uint64_t v26 = self->_interface;
  uint64_t v27 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v26, v28, v27, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 0, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v29, (uint64_t)v25, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 1, 0);
  v30 = self->_interface;
  uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
  v135[0] = objc_opt_class();
  v135[1] = objc_opt_class();
  v135[2] = objc_opt_class();
  v135[3] = objc_opt_class();
  v135[4] = objc_opt_class();
  uint64_t v33 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)v135, 5);
  uint64_t v35 = objc_msgSend_setWithArray_(v31, v34, (uint64_t)v33);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v30, v36, (uint64_t)v35, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 0, 1);

  uint64_t v37 = self->_interface;
  uint64_t v38 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v37, v39, v38, sel_remote_cloudKitUrlSuitableForOpeningForAsset_downloadObserver_completion_, 1, 1);
  v40 = self->_interface;
  uint64_t v41 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v40, v42, v41, sel_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_, 0, 0);
  uint64_t v43 = self->_interface;
  uint64_t v44 = (void *)MEMORY[0x1E4F1CAD0];
  v134[0] = objc_opt_class();
  v134[1] = objc_opt_class();
  v134[2] = objc_opt_class();
  v134[3] = objc_opt_class();
  v134[4] = objc_opt_class();
  v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v45, (uint64_t)v134, 5);
  uint64_t v48 = objc_msgSend_setWithArray_(v44, v47, (uint64_t)v46);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v43, v49, (uint64_t)v48, sel_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_, 0, 1);

  uint64_t v50 = self->_interface;
  uint64_t v51 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v50, v52, v51, sel_remote_cloudKitThumbnailUrlSuitableForOpeningForAsset_completion_, 1, 1);
  v53 = self->_interface;
  uint64_t v54 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v53, v55, v54, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 0, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v56, (uint64_t)v25, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 1, 0);
  v57 = self->_interface;
  uint64_t v58 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v57, v59, v58, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 0, 1);
  v60 = self->_interface;
  uint64_t v61 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v60, v62, v61, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 1, 1);
  v63 = self->_interface;
  uint64_t v64 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v63, v65, v64, sel_remote_cloudKitUrlSuitableForStreamingAsset_downloadObserver_completion_, 2, 1);
  v66 = self->_interface;
  uint64_t v67 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v66, v68, v67, sel_remote_createShareIfNeededForURL_completion_, 0, 0);
  v69 = self->_interface;
  uint64_t v70 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v69, v71, v70, sel_remote_createShareIfNeededForURL_completion_, 1, 1);
  v72 = self->_interface;
  uint64_t v73 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v72, v74, v73, sel_remote_createShareIfNeededForURL_completion_, 2, 1);
  v75 = self->_interface;
  uint64_t v76 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v75, v77, v76, sel_remote_createShareIfNeededForURL_completion_, 3, 1);
  v78 = self->_interface;
  uint64_t v79 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v78, v80, v79, sel_remote_deleteBackingStoreForAsset_completion_, 0, 0);
  v81 = self->_interface;
  v82 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v83 = objc_opt_class();
  uint64_t v84 = objc_opt_class();
  v86 = objc_msgSend_setWithObjects_(v82, v85, v83, v84, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v81, v87, (uint64_t)v86, sel_remote_deleteBackingStoreForAsset_completion_, 1, 1);

  v88 = CLSAssetUploadProgressNotifiableInterface();
  v89 = self->_interface;
  uint64_t v90 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v89, v91, v90, sel_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_, 0, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(self->_interface, v92, (uint64_t)v88, sel_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_, 2, 0);
  v93 = self->_interface;
  v94 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v95 = objc_opt_class();
  uint64_t v96 = objc_opt_class();
  v98 = objc_msgSend_setWithObjects_(v94, v97, v95, v96, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v93, v99, (uint64_t)v98, sel_remote_uploadAsset_createThumbnailIfNeeded_uploadObserver_completion_, 0, 1);

  v100 = self->_interface;
  v101 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v102 = objc_opt_class();
  uint64_t v103 = objc_opt_class();
  v105 = objc_msgSend_setWithObjects_(v101, v104, v102, v103, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v100, v106, (uint64_t)v105, sel_remote_fetchOrphanedAssetsWithCompletion_, 0, 1);

  v107 = self->_interface;
  v108 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v109 = objc_opt_class();
  uint64_t v110 = objc_opt_class();
  v112 = objc_msgSend_setWithObjects_(v108, v111, v109, v110, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v107, v113, (uint64_t)v112, sel_remote_fetchOrphanedAssetsWithCompletion_, 1, 1);

  v114 = self->_interface;
  uint64_t v115 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v114, v116, v115, sel_remote_topLevelContentStoreCacheDirectoryURLWithCompletion_, 0, 1);
  v117 = self->_interface;
  v118 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v119 = objc_opt_class();
  uint64_t v120 = objc_opt_class();
  v122 = objc_msgSend_setWithObjects_(v118, v121, v119, v120, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v117, v123, (uint64_t)v122, sel_remote_topLevelContentStoreCacheDirectoryURLWithCompletion_, 1, 1);

  v124 = self->_interface;
  uint64_t v125 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v124, v126, v125, sel_remote_currentUserContentStoreCacheDirectoryURLWithCompletion_, 0, 1);
  v127 = self->_interface;
  v128 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v129 = objc_opt_class();
  uint64_t v130 = objc_opt_class();
  v132 = objc_msgSend_setWithObjects_(v128, v131, v129, v130, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v127, v133, (uint64_t)v132, sel_remote_currentUserContentStoreCacheDirectoryURLWithCompletion_, 1, 1);
}

- (void)configureAdminRequestAPI
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v33, 2);
  uint64_t v7 = objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v7, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 0, 0);
  interface = self->_interface;
  uint64_t v10 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v11, v10, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 1, 0);
  id v12 = self->_interface;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v32, 2);
  uint64_t v17 = objc_msgSend_setWithArray_(v13, v16, (uint64_t)v15);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v12, v18, (uint64_t)v17, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 2, 0);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v19, (uint64_t)v7, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 0, 1);
  uint64_t v20 = self->_interface;
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v27 = objc_msgSend_setWithObjects_(v21, v26, v22, v23, v24, v25, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v20, v28, (uint64_t)v27, sel_remote_publishAdminRequests_withRequestor_adminRequestAccounts_completion_, 1, 1);

  uint64_t v29 = self->_interface;
  uint64_t v30 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v29, v31, v30, sel_remote_deleteAdminRequestID_completion_, 0, 0);
}

- (void)configureSurveyAnswerAPI
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v27, 3);
  uint64_t v7 = objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);

  interface = self->_interface;
  uint64_t v9 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v10, v9, sel_remote_publishSurveyAnswers_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v11, (uint64_t)v7, sel_remote_publishSurveyAnswers_completion_, 0, 1);
  id v12 = self->_interface;
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v17 = objc_msgSend_setWithObjects_(v13, v16, v14, v15, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v12, v18, (uint64_t)v17, sel_remote_publishSurveyAnswers_completion_, 1, 1);

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)v26, 2);
  uint64_t v23 = objc_msgSend_setWithArray_(v19, v22, (uint64_t)v21);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v24, (uint64_t)v23, sel_remote_fetchSurveyAnswer_responderIDs_completion_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v25, (uint64_t)v23, sel_remote_fetchSurveyAnswer_responderIDs_completion_, 1, 0);
}

- (void)configureRelayRequestAPI
{
  interface = self->_interface;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(interface, v5, v4, sel_remote_relayRequestWithData_requestType_fileHandle_completion_, 0, 0);
  uint64_t v6 = self->_interface;
  uint64_t v7 = objc_opt_class();
  objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(v6, v8, v7, sel_remote_relayRequestWithData_requestType_fileHandle_completion_, 2, 0);
  uint64_t v9 = self->_interface;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v10, v12, v11, 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v9, v13, (uint64_t)v14, sel_remote_relayRequestWithData_requestType_fileHandle_completion_, 1, 1);
}

- (void)configureInsightEventsAPI
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v16, 2);
  uint64_t v7 = objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5);

  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(self->_interface, v8, (uint64_t)v7, sel_remote_saveInsightEvents_completion_, 0, 0);
  interface = self->_interface;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v14 = objc_msgSend_setWithObjects_(v10, v13, v11, v12, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(interface, v15, (uint64_t)v14, sel_remote_saveInsightEvents_completion_, 1, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arraySet, 0);
  objc_storeStrong((id *)&self->_contextsSet, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end