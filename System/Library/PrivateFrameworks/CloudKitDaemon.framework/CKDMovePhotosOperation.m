@interface CKDMovePhotosOperation
- (CKDMovePhotosOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKRecordZoneID)sourceZoneID;
- (NSDictionary)moveChangesByDestinationRecordID;
- (id)_createModifyRequestWithRecordsToSave:(id)a3 recordsToDelete:(id)a4 recordsToDeleteToEtags:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 handlersByRecordID:(id)a7 sendMergeableDeltas:(BOOL)a8;
- (id)activityCreate;
- (id)handlerForDeleteWithRecordID:(id)a3;
- (id)handlerForSaveWithRecord:(id)a3;
- (id)moveCompletionBlock;
- (int)operationType;
- (int64_t)sourceDatabaseScope;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleRecordMoved:(id)a3 handler:(id)a4 responseCode:(id)a5 recordForOplockFailure:(id)a6 destinationServerRecord:(id)a7 moveMarkerServerRecord:(id)a8;
- (void)_reallyHandleRecordMoved:(id)a3 handler:(id)a4 responseCode:(id)a5 recordForOplockFailure:(id)a6 destinationServerRecord:(id)a7 moveMarkerServerRecord:(id)a8;
- (void)callbackWithMetadata:(id)a3 error:(id)a4;
- (void)main;
- (void)moveCallbackWithMetadata:(id)a3 error:(id)a4;
- (void)setMoveChangesByDestinationRecordID:(id)a3;
- (void)setMoveCompletionBlock:(id)a3;
- (void)setSourceDatabaseScope:(int64_t)a3;
- (void)setSourceZoneID:(id)a3;
@end

@implementation CKDMovePhotosOperation

- (CKDMovePhotosOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_moveChanges(v6, v8, v9);
  v12 = objc_msgSend_CKMap_(v10, v11, (uint64_t)&unk_1F2043630);

  objc_msgSend_setRecordsToSave_(v6, v13, (uint64_t)v12);
  v16 = objc_msgSend_moveChanges(v6, v14, v15);
  v18 = objc_msgSend_CKMapToDictionary_(v16, v17, (uint64_t)&unk_1F2043650);

  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, v18);
  v23.receiver = self;
  v23.super_class = (Class)CKDMovePhotosOperation;
  v19 = [(CKDModifyRecordsOperation *)&v23 initWithOperationInfo:v6 container:v7];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_moveChangesByDestinationRecordID, v18);
    v19->_sourceDatabaseScope = objc_msgSend_sourceDatabaseScope(v6, v20, v21);
  }

  return v19;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/move-photos", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 218;
}

- (id)handlerForSaveWithRecord:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 87, @"Not expected to move shares");
  }
  v8 = objc_msgSend_moveChangesByDestinationRecordID(self, v6, v7);
  v11 = objc_msgSend_recordID(v5, v9, v10);
  v13 = objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_moveHandlerWithMoveChange_operation_(CKDMoveRecordHandler, v14, (uint64_t)v13, self);

  return v15;
}

- (id)handlerForDeleteWithRecordID:(id)a3
{
  id v5 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v5, v6, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 93, @"Not expected to delete records in a move");

  return 0;
}

- (void)callbackWithMetadata:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 100, @"How'd a move operation get a non-move handler?");
  }
  v11 = objc_msgSend_callbackQueue(self, v9, v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E69370;
  block[3] = &unk_1E64F0120;
  block[4] = self;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v11, block);
}

- (void)moveCallbackWithMetadata:(id)a3 error:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v11 = objc_msgSend_moveChange(v7, v9, v10);
  v14 = objc_msgSend_sourceRecordID(v11, v12, v13);

  if (objc_msgSend_saveCompletionBlockCalled(v7, v15, v16))
  {
    v72 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 108, @"moveCallbackWithMetadata:error: called twice on %@", v14);
  }
  v19 = objc_msgSend_serverDestinationRecord(v7, v17, v18);
  v22 = objc_msgSend_streamingAssetRequestOptions(self, v20, v21);
  objc_msgSend_setStreamingAssetRequestOptions_(v19, v23, (uint64_t)v22);

  if (v8)
  {
    v26 = objc_msgSend_moveCompletionBlock(self, v24, v25);

    if (!v26) {
      goto LABEL_13;
    }
    objc_msgSend_moveCompletionBlock(self, v27, v28);
    v29 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void, void, void, id))v29)[2](v29, v14, 0, 0, 0, v8);
    goto LABEL_12;
  }
  objc_msgSend_error(v7, v24, v25);
  v32 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
  if (v32) {
    goto LABEL_9;
  }
  v33 = objc_msgSend_saveProgressBlock(self, v30, v31);

  if (v33)
  {
    objc_msgSend_saveProgressBlock(self, v34, v35);
    v32 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, double))v32)[2](v32, v14, 1.0);
LABEL_9:
  }
  v36 = objc_msgSend_moveCompletionBlock(self, v34, v35);

  if (!v36) {
    goto LABEL_13;
  }
  objc_msgSend_moveCompletionBlock(self, v27, v28);
  v29 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend_moveChange(v7, v37, v38);
  objc_msgSend_sourceRecordID(v74, v39, v40);
  v41 = v75 = v14;
  v44 = objc_msgSend_moveChange(v7, v42, v43);
  v47 = objc_msgSend_destinationRecord(v44, v45, v46);
  v50 = objc_msgSend_serverDestinationRecord(v7, v48, v49);
  v53 = objc_msgSend_serverMoveMarkerRecord(v7, v51, v52);
  v56 = objc_msgSend_error(v7, v54, v55);
  ((void (**)(void, void *, void *, void *, void *, void *))v29)[2](v29, v41, v47, v50, v53, v56);

  v14 = v75;
LABEL_12:

LABEL_13:
  if (objc_msgSend_didAttemptZoneWideShareKeyRoll(v7, v27, v28))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v59 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      v64 = v59;
      v67 = objc_msgSend_operationID(self, v65, v66);
      *(_DWORD *)buf = 138543618;
      v79 = v67;
      __int16 v80 = 2114;
      uint64_t v81 = 0x1F2058370;
      _os_log_debug_impl(&dword_1C4CFF000, v64, OS_LOG_TYPE_DEBUG, "Operation %{public}@ sending CoreAnalytics event %{public}@", buf, 0x16u);

      if (v8) {
        goto LABEL_18;
      }
    }
    else if (v8)
    {
LABEL_18:
      id v62 = v8;
LABEL_21:
      v68 = v62;
      v69 = objc_msgSend_dugongKeyRollAnalyticsPayloadWithError_(self, v63, (uint64_t)v62);
      AnalyticsSendEvent();

      goto LABEL_22;
    }
    objc_msgSend_error(v7, v60, v61);
    id v62 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  if (!v8)
  {
    v70 = objc_msgSend_error(v7, v57, v58);

    if (!v70)
    {
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = sub_1C4E697CC;
      v76[3] = &unk_1E64F4438;
      v76[4] = self;
      id v77 = v7;
      objc_msgSend_updateCloudKitMetrics_(self, v71, (uint64_t)v76);
    }
  }
  objc_msgSend_setSaveCompletionBlockCalled_(v7, v57, 1);
}

- (id)_createModifyRequestWithRecordsToSave:(id)a3 recordsToDelete:(id)a4 recordsToDeleteToEtags:(id)a5 recordIDsToDeleteToSigningPCSIdentity:(id)a6 handlersByRecordID:(id)a7 sendMergeableDeltas:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  objc_initWeak(&location, self);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = sub_1C4E69B80;
  v48[3] = &unk_1E64F4460;
  v48[4] = self;
  v20 = objc_msgSend_CKMap_(v14, v19, (uint64_t)v48);
  if (objc_msgSend_count(v15, v21, v22))
  {
    uint64_t v40 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v23, v24);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 162, @"How did a move operation decide to delete records?");
  }
  if (objc_msgSend_count(v17, v23, v24))
  {
    v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v25, v26);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 163, @"How did a move operation decide to delete records?");
  }
  if (objc_msgSend_count(v16, v25, v26))
  {
    v44 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v27, v28);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, @"CKDMovePhotosOperation.m", 164, @"How did a move operation decide to delete records?");
  }
  v29 = [CKDMovePhotosURLRequest alloc];
  uint64_t v32 = objc_msgSend_sourceDatabaseScope(self, v30, v31);
  uint64_t v35 = objc_msgSend_atomic(self, v33, v34);
  v37 = objc_msgSend_initWithOperation_moveChanges_sourceDatabaseScope_atomic_(v29, v36, (uint64_t)self, v20, v32, v35);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1C4E69C04;
  v46[3] = &unk_1E64F4488;
  objc_copyWeak(&v47, &location);
  objc_msgSend_setRecordPostedBlock_(v37, v38, (uint64_t)v46);
  objc_destroyWeak(&v47);

  objc_destroyWeak(&location);
  return v37;
}

- (void)_handleRecordMoved:(id)a3 handler:(id)a4 responseCode:(id)a5 recordForOplockFailure:(id)a6 destinationServerRecord:(id)a7 moveMarkerServerRecord:(id)a8
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = sub_1C4E6A320;
  v79[4] = sub_1C4E6A330;
  id v20 = v18;
  id v80 = v20;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = sub_1C4E6A320;
  v77[4] = sub_1C4E6A330;
  id v21 = v19;
  id v78 = v21;
  uint64_t v24 = objc_msgSend_stateTransitionGroup(self, v22, v23);
  dispatch_group_enter(v24);

  uint64_t v25 = dispatch_group_create();
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = sub_1C4E6A320;
  v75[4] = sub_1C4E6A330;
  id v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = sub_1C4E6A320;
  v73[4] = sub_1C4E6A330;
  id v74 = 0;
  if ((objc_msgSend_hasPropertiesRequiringEncryption(v20, v26, v27) & 1) != 0
    || objc_msgSend_hasPropertiesRequiringEncryption(v21, v28, v29))
  {
    if (objc_msgSend_hasPropertiesRequiringEncryption(v20, v28, v29))
    {
      dispatch_group_enter(v25);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v32 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v51 = objc_msgSend_recordID(v20, v33, v34);
        *(_DWORD *)buf = 138412290;
        uint64_t v82 = v51;
        _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Decrypting destination record %@ returned from move", buf, 0xCu);
      }
      v37 = objc_msgSend_recordDecryptOperation(self, v35, v36);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = sub_1C4E6A338;
      v68[3] = &unk_1E64F44B0;
      id v69 = v20;
      v71 = v75;
      v72 = v79;
      v70 = v25;
      objc_msgSend_decryptRecord_withCompletion_(v37, v38, (uint64_t)v69, v68);
    }
    if (objc_msgSend_hasPropertiesRequiringEncryption(v21, v30, v31))
    {
      dispatch_group_enter(v25);
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v39 = (id)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v52 = objc_msgSend_recordID(v21, v40, v41);
        *(_DWORD *)buf = 138412290;
        uint64_t v82 = v52;
        _os_log_debug_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEBUG, "Decrypting move marker record %@ returned from move", buf, 0xCu);
      }
      v44 = objc_msgSend_recordDecryptOperation(self, v42, v43);
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = sub_1C4E6A4E8;
      v63[3] = &unk_1E64F44B0;
      id v64 = v21;
      uint64_t v66 = v73;
      v67 = v77;
      v65 = v25;
      objc_msgSend_decryptRecord_withCompletion_(v44, v45, (uint64_t)v64, v63);
    }
  }
  uint64_t v46 = objc_msgSend_callbackQueue(self, v28, v29);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E6A698;
  block[3] = &unk_1E64F44D8;
  id v54 = v15;
  uint64_t v55 = self;
  id v56 = v14;
  id v57 = v16;
  id v58 = v17;
  v59 = v75;
  v60 = v73;
  uint64_t v61 = v79;
  id v62 = v77;
  id v47 = v17;
  id v48 = v16;
  id v49 = v14;
  id v50 = v15;
  dispatch_group_notify(v25, v46, block);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v79, 8);
}

- (void)_reallyHandleRecordMoved:(id)a3 handler:(id)a4 responseCode:(id)a5 recordForOplockFailure:(id)a6 destinationServerRecord:(id)a7 moveMarkerServerRecord:(id)a8
{
  uint64_t v403 = *MEMORY[0x1E4F143B8];
  id v14 = (__CFString *)a3;
  id v15 = a4;
  id v16 = self;
  id v17 = v15;
  id v18 = (__CFString *)a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v26 = objc_msgSend_container(v16, v22, v23);
  if (v14)
  {
    uint64_t v27 = objc_msgSend_handlersByRecordID(v16, v24, v25);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v14);
    v384 = objc_msgSend_record(v29, v30, v31);
  }
  else
  {
    v384 = 0;
  }
  objc_msgSend_setServerDestinationRecord_(v17, v24, (uint64_t)v20);
  objc_msgSend_setServerMoveMarkerRecord_(v17, v32, (uint64_t)v21);
  int v35 = objc_msgSend_code(v18, v33, v34);
  if (!v14 || v35 != 1)
  {
    v379 = v19;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v381 = v21;
    v60 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v400 = v14;
      __int16 v401 = 2112;
      v402 = v18;
      _os_log_impl(&dword_1C4CFF000, v60, OS_LOG_TYPE_INFO, "Error when moving record %@: %@", buf, 0x16u);
    }
    v63 = objc_msgSend_error(v18, v61, v62);
    uint64_t v66 = objc_msgSend_clientError(v63, v64, v65);
    int hasType = objc_msgSend_hasType(v66, v67, v68);

    if (hasType)
    {
      v72 = objc_msgSend_error(v18, v70, v71);
      v75 = objc_msgSend_clientError(v72, v73, v74);
      int v78 = objc_msgSend_type(v75, v76, v77);

      if (v78 == 52)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v21 = v381;
        uint64_t v81 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v400 = v14;
          uint64_t v82 = "Record PCS etag failed for record %@";
LABEL_38:
          _os_log_impl(&dword_1C4CFF000, v81, OS_LOG_TYPE_INFO, v82, buf, 0xCu);
          v370 = 0;
          goto LABEL_39;
        }
        goto LABEL_41;
      }
      v96 = objc_msgSend_error(v18, v79, v80);
      v99 = objc_msgSend_clientError(v96, v97, v98);
      int v102 = objc_msgSend_type(v99, v100, v101);

      if (v102 == 53)
      {
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v21 = v381;
        uint64_t v81 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v400 = v14;
          uint64_t v82 = "Zone PCS etag failed for record %@";
          goto LABEL_38;
        }
LABEL_41:
        v370 = 0;
        goto LABEL_42;
      }
      v174 = objc_msgSend_error(v18, v103, v104);
      v177 = objc_msgSend_clientError(v174, v175, v176);
      int v180 = objc_msgSend_type(v177, v178, v179);

      v183 = objc_msgSend_error(v18, v181, v182);
      v186 = v183;
      if (v180 == 15)
      {
        v187 = objc_msgSend_errorDescription(v183, v184, v185);
        char hasPrefix = objc_msgSend_hasPrefix_(v187, v188, @"Record PCS oplock failed");

        if (hasPrefix)
        {
          int v192 = 1;
          v193 = @"Record";
        }
        else
        {
          v225 = objc_msgSend_error(v18, v190, v191);
          v228 = objc_msgSend_errorDescription(v225, v226, v227);
          char v230 = objc_msgSend_hasPrefix_(v228, v229, @"Zone PCS oplock failed");

          if (v230)
          {
            int v192 = 1;
            v193 = @"Zone";
          }
          else
          {
            v255 = objc_msgSend_error(v18, v231, v232);
            v258 = objc_msgSend_errorDescription(v255, v256, v257);
            int v192 = objc_msgSend_hasPrefix_(v258, v259, @"Share Etag Oplock failure");

            if (v192) {
              v193 = @"Share";
            }
            else {
              v193 = @"Unknown";
            }
          }
        }
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v260 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v400 = v193;
          __int16 v401 = 2112;
          v402 = v14;
          _os_log_impl(&dword_1C4CFF000, v260, OS_LOG_TYPE_INFO, "%{public}@ oplock failed for record %@", buf, 0x16u);
        }
        if (v192)
        {
          v370 = 0;
          id v21 = v381;
LABEL_39:
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
LABEL_42:
          v105 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v400 = v14;
            _os_log_impl(&dword_1C4CFF000, v105, OS_LOG_TYPE_INFO, "Handling error for record %@ as an oplock failure", buf, 0xCu);
          }
          if (objc_msgSend_retryPCSFailures(v16, v106, v107))
          {
            v110 = v16;
            objc_msgSend_clearProtectionDataForRecord(v17, v108, v109);
            v113 = objc_msgSend_recordID(v384, v111, v112);
            v116 = objc_msgSend_zoneID(v113, v114, v115);

            if (!v116)
            {
              uint64_t v40 = v384;
              objc_msgSend_setState_(v17, v117, 13);
              goto LABEL_62;
            }
            v373 = v26;
            id v376 = v20;
            id v366 = v17;
            v367 = v14;
            long long v396 = 0u;
            long long v397 = 0u;
            long long v395 = 0u;
            long long v394 = 0u;
            v119 = objc_msgSend_modifyHandlersByZoneID(v16, v117, v118);
            v122 = objc_msgSend_recordID(v384, v120, v121);
            v125 = objc_msgSend_zoneID(v122, v123, v124);
            v127 = objc_msgSend_objectForKeyedSubscript_(v119, v126, (uint64_t)v125);

            uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v127, v128, (uint64_t)&v394, v398, 16);
            if (v129)
            {
              uint64_t v130 = v129;
              uint64_t v131 = *(void *)v395;
              do
              {
                uint64_t v132 = 0;
                do
                {
                  if (*(void *)v395 != v131) {
                    objc_enumerationMutation(v127);
                  }
                  v133 = *(void **)(*((void *)&v394 + 1) + 8 * v132);
                  if (*MEMORY[0x1E4F1A550] != -1) {
                    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
                  }
                  v134 = (void *)*MEMORY[0x1E4F1A500];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
                  {
                    v159 = v134;
                    v162 = objc_msgSend_record(v133, v160, v161);
                    objc_msgSend_recordID(v162, v163, v164);
                    v165 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v400 = v165;
                    _os_log_debug_impl(&dword_1C4CFF000, v159, OS_LOG_TYPE_DEBUG, "Clearing zone PCS tag for record %@", buf, 0xCu);
                  }
                  v137 = objc_msgSend_record(v133, v135, v136);
                  objc_msgSend_setZoneProtectionEtag_(v137, v138, 0);

                  v141 = objc_msgSend_record(v133, v139, v140);
                  objc_msgSend_setShareEtag_(v141, v142, 0);

                  v145 = objc_msgSend_error(v18, v143, v144);
                  v148 = objc_msgSend_clientError(v145, v146, v147);
                  int v151 = objc_msgSend_type(v148, v149, v150);

                  if (v151 != 52)
                  {
                    v154 = objc_msgSend_record(v133, v152, v153);
                    v157 = objc_msgSend_recordID(v154, v155, v156);
                    objc_msgSend_setPCSData_forFetchedRecordID_(v110, v158, 0, v157);
                  }
                  ++v132;
                }
                while (v130 != v132);
                uint64_t v130 = objc_msgSend_countByEnumeratingWithState_objects_count_(v127, v152, (uint64_t)&v394, v398, 16);
              }
              while (v130);
            }

            uint64_t v166 = 13;
            id v17 = v366;
            id v14 = v367;
            uint64_t v26 = v373;
            id v20 = v376;
            id v21 = v381;
          }
          else
          {
            uint64_t v166 = 12;
          }
          uint64_t v40 = v384;
          objc_msgSend_setState_(v17, v108, v166);
LABEL_62:
          id v19 = v379;
          if (v370)
          {
            objc_msgSend_setError_(v17, v167, (uint64_t)v370);

            goto LABEL_114;
          }
          v168 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v169 = *MEMORY[0x1E4F19DD8];
          v170 = objc_msgSend_recordID(v40, v167, 0);
          v172 = objc_msgSend_errorWithDomain_code_userInfo_format_(v168, v171, v169, 2037, 0, @"Error moving record %@ on server: Protection data didn't match", v170);
          objc_msgSend_setError_(v17, v173, (uint64_t)v172);

LABEL_92:
          uint64_t v40 = v384;
          goto LABEL_114;
        }
      }
      else
      {
        v194 = objc_msgSend_clientError(v183, v184, v185);
        int v197 = objc_msgSend_type(v194, v195, v196);

        if (v197 == 48)
        {
          v200 = objc_msgSend_container(v16, v198, v199);
          v203 = objc_msgSend_recordCache(v200, v201, v202);
          v206 = objc_msgSend_zoneID(v14, v204, v205);
          objc_msgSend_clearAllRecordsForZoneWithID_(v203, v207, (uint64_t)v206);

          if (objc_msgSend_databaseScope(v16, v208, v209) != 1)
          {
            v210 = objc_msgSend_recordID(v384, v70, v71);
            v213 = objc_msgSend_zoneID(v210, v211, v212);
            objc_msgSend_setPCSData_forFetchedZoneID_(v16, v214, 0, v213);

            v217 = objc_msgSend_pcsCache(v26, v215, v216);
            v220 = objc_msgSend_recordID(v384, v218, v219);
            v223 = objc_msgSend_zoneID(v220, v221, v222);
            objc_msgSend_removePCSDataForItemsInZoneWithID_(v217, v224, (uint64_t)v223);
          }
        }
        else
        {
          v233 = objc_msgSend_error(v18, v198, v199);
          v236 = objc_msgSend_clientError(v233, v234, v235);
          int v239 = objc_msgSend_type(v236, v237, v238);

          if (v239 == 64)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v240 = v16;
            v368 = v14;
            id v377 = v20;
            v241 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C4CFF000, v241, OS_LOG_TYPE_INFO, "Record PCS chain was invalid", buf, 2u);
            }
            v242 = (void *)MEMORY[0x1E4F1A280];
            uint64_t v243 = *MEMORY[0x1E4F19DD8];
            uint64_t v244 = sub_1C4E94D98(v18);
            v247 = objc_msgSend_recordID(v384, v245, v246);
            v250 = objc_msgSend_error(v18, v248, v249);
            v253 = objc_msgSend_errorDescription(v250, v251, v252);
            v370 = objc_msgSend_errorWithDomain_code_userInfo_format_(v242, v254, v243, v244, 0, @"Error moving record %@ on server: \"%@\"", v247, v253);

            id v20 = v377;
            id v21 = v381;
            id v14 = v368;
            id v16 = v240;
            goto LABEL_39;
          }
        }
      }
    }
    v261 = objc_msgSend_error(v18, v70, v71);
    if (objc_msgSend_hasExtensionError(v261, v262, v263))
    {
      v266 = objc_msgSend_error(v18, v264, v265);
      objc_msgSend_extensionError(v266, v267, v268);
      v270 = v269 = v16;
      int hasTypeCode = objc_msgSend_hasTypeCode(v270, v271, v272);

      id v16 = v269;
      if (hasTypeCode)
      {
        v276 = (void *)MEMORY[0x1E4F1A280];
        uint64_t v277 = *MEMORY[0x1E4F19DD8];
        v278 = objc_msgSend_request(v269, v274, v275);
        v279 = sub_1C4E940D0(v278, v18);
        v281 = objc_msgSend_errorWithDomain_code_userInfo_format_(v276, v280, v277, 6000, v279, @"Plugin-Specific Error");
        objc_msgSend_setError_(v17, v282, (uint64_t)v281);

        objc_msgSend_setState_(v17, v283, 12);
        id v19 = v379;
        id v21 = v381;
        goto LABEL_92;
      }
    }
    else
    {
    }
    id v378 = v20;
    v383 = v16;
    v284 = objc_msgSend_request(v16, v274, v275);
    v285 = sub_1C4E940D0(v284, v18);
    v288 = objc_msgSend_mutableCopy(v285, v286, v287);

    v291 = objc_msgSend_error(v18, v289, v290);
    v294 = objc_msgSend_clientError(v291, v292, v293);
    v297 = objc_msgSend_moveOplockFailure(v294, v295, v296);
    int hasMovedRecordDestinationIdentifier = objc_msgSend_hasMovedRecordDestinationIdentifier(v297, v298, v299);

    v374 = v26;
    if (hasMovedRecordDestinationIdentifier)
    {
      v303 = v14;
      v304 = objc_msgSend_translator(v383, v301, v302);
      v307 = objc_msgSend_error(v18, v305, v306);
      v310 = objc_msgSend_clientError(v307, v308, v309);
      v313 = objc_msgSend_moveOplockFailure(v310, v311, v312);
      v316 = objc_msgSend_movedRecordDestinationIdentifier(v313, v314, v315);
      v318 = objc_msgSend_recordIDFromPRecordIdentifier_error_(v304, v317, (uint64_t)v316, 0);

      if (v318) {
        objc_msgSend_setObject_forKeyedSubscript_(v288, v319, (uint64_t)v318, *MEMORY[0x1E4F19D40]);
      }

      id v14 = v303;
      uint64_t v26 = v374;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1C4E6BAB0;
    aBlock[3] = &unk_1E64F08D0;
    id v393 = v17;
    v320 = _Block_copy(aBlock);
    v323 = objc_msgSend_error(v18, v321, v322);
    v326 = objc_msgSend_clientError(v323, v324, v325);
    int hasOplockFailure = objc_msgSend_hasOplockFailure(v326, v327, v328);

    if (hasOplockFailure)
    {
      id v330 = v379;
      uint64_t v40 = v384;
      id v331 = v384;
      v336 = objc_msgSend_copyWithOriginalValues(v331, v332, v333);
      if (v336) {
        objc_msgSend_setObject_forKeyedSubscript_(v288, v334, (uint64_t)v336, *MEMORY[0x1E4F19D00]);
      }
      if (v330) {
        objc_msgSend_setObject_forKeyedSubscript_(v288, v334, (uint64_t)v330, *MEMORY[0x1E4F19D10]);
      }
      if (v331) {
        objc_msgSend_setObject_forKeyedSubscript_(v288, v334, (uint64_t)v331, *MEMORY[0x1E4F19D08]);
      }
      if (objc_msgSend_hasPropertiesRequiringEncryption(v330, v334, v335))
      {
        v371 = v288;
        v339 = objc_msgSend_stateTransitionGroup(v383, v337, v338);
        dispatch_group_enter(v339);

        v369 = v336;
        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        id v19 = v379;
        v340 = (void *)*MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
        {
          v361 = v340;
          objc_msgSend_recordID(v330, v362, v363);
          v364 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v400 = v364;
          _os_log_debug_impl(&dword_1C4CFF000, v361, OS_LOG_TYPE_DEBUG, "Decrypting server record returned by oplock failure %@", buf, 0xCu);
        }
        v380 = objc_msgSend_recordDecryptOperation(v383, v341, v342);
        v385[0] = MEMORY[0x1E4F143A8];
        v385[1] = 3221225472;
        v385[2] = sub_1C4E6BB20;
        v385[3] = &unk_1E64F4500;
        id v386 = v330;
        v343 = v371;
        id v387 = v371;
        v388 = v18;
        v389 = v14;
        v390 = v383;
        id v391 = v320;
        id v344 = v330;
        objc_msgSend_decryptRecord_withCompletion_(v380, v345, (uint64_t)v344, v385);

        uint64_t v26 = v374;
        goto LABEL_113;
      }

      uint64_t v26 = v374;
    }
    v346 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v347 = *MEMORY[0x1E4F19DD8];
    uint64_t v348 = sub_1C4E94D98(v18);
    objc_msgSend_error(v18, v349, v350);
    v352 = v351 = v26;
    uint64_t v355 = objc_msgSend_errorDescription(v352, v353, v354);
    v356 = v288;
    id v357 = v17;
    v358 = (void *)v355;
    uint64_t v365 = v355;
    v359 = v346;
    v343 = v356;
    objc_msgSend_errorWithDomain_code_userInfo_format_(v359, v360, v347, v348, v356, @"Error moving record %@ on server: %@", v14, v365);
    id v331 = (id)objc_claimAutoreleasedReturnValue();

    id v17 = v357;
    uint64_t v26 = v351;
    (*((void (**)(void *, id))v320 + 2))(v320, v331);
    id v19 = v379;
    uint64_t v40 = v384;
LABEL_113:

    id v20 = v378;
    id v21 = v381;
    goto LABEL_114;
  }
  uint64_t v36 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v37 = *MEMORY[0x1E4F1A550];
  if (!v384)
  {
    v372 = v26;
    if (v37 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v36);
    }
    id v382 = v21;
    id v375 = v20;
    uint64_t v83 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v400 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v83, OS_LOG_TYPE_ERROR, "Got a response for record with ID %@, but we didn't try to move that record.", buf, 0xCu);
    }
    objc_msgSend_setState_(v17, v84, 12);
    v85 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v86 = *MEMORY[0x1E4F19DD8];
    uint64_t v87 = sub_1C4E94D98(v18);
    v90 = objc_msgSend_request(v16, v88, v89);
    sub_1C4E940D0(v90, v18);
    v92 = v91 = v14;
    v94 = objc_msgSend_errorWithDomain_code_userInfo_format_(v85, v93, v86, v87, v92, @"Got a response for record with ID %@, but we didn't try to move that record.", v91);
    objc_msgSend_setError_(v17, v95, (uint64_t)v94);

    id v14 = v91;
    uint64_t v26 = v372;
    id v20 = v375;
    id v21 = v382;
    goto LABEL_92;
  }
  if (v37 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v36);
  }
  uint64_t v38 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v400 = v14;
    _os_log_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_INFO, "Record %@ was successfully moved on the server", buf, 0xCu);
  }
  objc_msgSend_setState_(v17, v39, 8);
  uint64_t v40 = v384;
  objc_msgSend_setKnownToServer_(v384, v41, 1);
  objc_msgSend_setKnownToServer_(v21, v42, 1);
  v45 = objc_msgSend_etag(v20, v43, v44);

  if (v45)
  {
    id v48 = objc_msgSend_etag(v20, v46, v47);
    objc_msgSend_setEtag_(v384, v49, (uint64_t)v48);
  }
  id v50 = objc_msgSend_creationDate(v20, v46, v47);

  if (v50)
  {
    v53 = objc_msgSend_creationDate(v20, v51, v52);
    objc_msgSend_setCreationDate_(v384, v54, (uint64_t)v53);
  }
  uint64_t v55 = objc_msgSend_modificationDate(v20, v51, v52);

  if (v55)
  {
    id v58 = objc_msgSend_modificationDate(v20, v56, v57);
    objc_msgSend_setModificationDate_(v384, v59, (uint64_t)v58);
  }
  objc_msgSend_savePCSDataToCache(v17, v56, v57);
LABEL_114:
}

- (void)main
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v5 = v3;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v9 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v8, 1, 0, 0);
    id v12 = objc_msgSend_CKPropertiesStyleString(v9, v10, v11);
    id v14 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v13, 0, 1, 0);
    id v17 = objc_msgSend_CKPropertiesStyleString(v14, v15, v16);
    int v18 = 138544130;
    id v19 = v7;
    __int16 v20 = 2048;
    id v21 = self;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_DEBUG, "Starting Move Photos operation <%{public}@: %p; %{public}@, %@>",
      (uint8_t *)&v18,
      0x2Au);
  }
  objc_msgSend_makeStateTransition_(self, v4, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_sourceZoneID(self, v5, v6);

  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_msgSend_sourceZoneID(self, v8, v9);
    uint64_t v13 = objc_msgSend_setWithObject_(v10, v12, (uint64_t)v11);

    if (objc_msgSend_count(v13, v14, v15))
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1C4E6C0D8;
      v18[3] = &unk_1E64F1D18;
      id v19 = v13;
      objc_msgSend_updateCloudKitMetrics_(self, v16, (uint64_t)v18);
    }
  }
  objc_msgSend_setMoveCompletionBlock_(self, v8, 0);
  v17.receiver = self;
  v17.super_class = (Class)CKDMovePhotosOperation;
  [(CKDModifyRecordsOperation *)&v17 _finishOnCallbackQueueWithError:v4];
}

- (id)moveCompletionBlock
{
  return self->_moveCompletionBlock;
}

- (void)setMoveCompletionBlock:(id)a3
{
}

- (NSDictionary)moveChangesByDestinationRecordID
{
  return self->_moveChangesByDestinationRecordID;
}

- (void)setMoveChangesByDestinationRecordID:(id)a3
{
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (void)setSourceZoneID:(id)a3
{
}

- (int64_t)sourceDatabaseScope
{
  return self->_sourceDatabaseScope;
}

- (void)setSourceDatabaseScope:(int64_t)a3
{
  self->_sourceDatabaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceZoneID, 0);
  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, 0);
  objc_storeStrong(&self->_moveCompletionBlock, 0);
}

@end