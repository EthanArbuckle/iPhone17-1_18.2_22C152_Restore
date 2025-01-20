@interface CKMovePhotosOperation
+ (SEL)daemonInvocationSelector;
+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3;
- (BOOL)CKOperationShouldRun:(id *)a3;
- (BOOL)hasCKOperationCallbacksSet;
- (CKDatabase)sourceDatabase;
- (CKMovePhotosOperation)init;
- (CKMovePhotosOperation)initWithMoveChanges:(id)a3 sourceDatabase:(id)a4;
- (NSArray)moveChanges;
- (NSDictionary)moveChangesByDestinationRecordID;
- (NSDictionary)moveChangesBySourceRecordID;
- (NSMutableDictionary)recordErrorsBySourceRecordID;
- (id)activityCreate;
- (id)movePhotosCompletionBlock;
- (id)perRecordMoveBlock;
- (id)perRecordProgressBlock;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_trackAssetsToUpload;
- (void)fillFromOperationInfo:(id)a3;
- (void)fillOutOperationInfo:(id)a3;
- (void)handleDeleteForRecordID:(id)a3 error:(id)a4;
- (void)handleMoveForSourceRecordID:(id)a3 destinationMetadata:(id)a4 moveMarkerMetadata:(id)a5 error:(id)a6;
- (void)handleRecordModificationForRecordID:(id)a3 didProgress:(double)a4;
- (void)handleRecordUploadForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 signature:(id)a6 size:(unint64_t)a7 paddedFileSize:(unint64_t)a8 uploaded:(BOOL)a9 uploadReceipt:(id)a10 uploadReceiptExpiration:(double)a11 wrappedAssetKey:(id)a12 clearAssetKey:(id)a13 referenceSignature:(id)a14;
- (void)handleSaveForRecordID:(id)a3 recordMetadata:(id)a4 error:(id)a5;
- (void)performCKOperation;
- (void)setMoveChanges:(id)a3;
- (void)setMoveChangesByDestinationRecordID:(id)a3;
- (void)setMoveChangesBySourceRecordID:(id)a3;
- (void)setMovePhotosCompletionBlock:(id)a3;
- (void)setPerRecordMoveBlock:(id)a3;
- (void)setPerRecordProgressBlock:(id)a3;
- (void)setRecordErrorsBySourceRecordID:(id)a3;
- (void)setSourceDatabase:(id)a3;
@end

@implementation CKMovePhotosOperation

- (CKMovePhotosOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKMovePhotosOperation;
  v2 = [(CKOperation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recordErrorsBySourceRecordID = v2->_recordErrorsBySourceRecordID;
    v2->_recordErrorsBySourceRecordID = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CKMovePhotosOperation)initWithMoveChanges:(id)a3 sourceDatabase:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_init(self, v9, v10, v11);
  v13 = (CKMovePhotosOperation *)v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 536), a3);
    objc_storeStrong((id *)&v13->_sourceDatabase, a4);
  }

  return v13;
}

- (void)setPerRecordProgressBlock:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B0C0924;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perRecordProgressBlock = v15;
    goto LABEL_9;
  }
  if (self->_perRecordProgressBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perRecordProgressBlock = self->_perRecordProgressBlock;
    self->_id perRecordProgressBlock = v11;
LABEL_9:
  }
}

- (id)perRecordProgressBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13E14;
    v16 = sub_18AF138F8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C0B1C;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_perRecordProgressBlock);
  }

  return v8;
}

- (void)setPerRecordMoveBlock:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B0C0CA8;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id perRecordMoveBlock = v15;
    goto LABEL_9;
  }
  if (self->_perRecordMoveBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id perRecordMoveBlock = self->_perRecordMoveBlock;
    self->_id perRecordMoveBlock = v11;
LABEL_9:
  }
}

- (id)perRecordMoveBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13E14;
    v16 = sub_18AF138F8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C0EA0;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_perRecordMoveBlock);
  }

  return v8;
}

- (void)setMovePhotosCompletionBlock:(id)a3
{
  id v7 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v4, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v13 = objc_msgSend_callbackQueue(self, v8, v9, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_18B0C102C;
    v14[3] = &unk_1E5460058;
    v14[4] = self;
    id v15 = v7;
    dispatch_sync(v13, v14);

    id movePhotosCompletionBlock = v15;
    goto LABEL_9;
  }
  if (self->_movePhotosCompletionBlock != v7)
  {
    uint64_t v11 = objc_msgSend_copy(v7, v8, v9, v10);
    id movePhotosCompletionBlock = self->_movePhotosCompletionBlock;
    self->_id movePhotosCompletionBlock = v11;
LABEL_9:
  }
}

- (id)movePhotosCompletionBlock
{
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3A8], @"Callback check triggered");
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = sub_18AF13E14;
    v16 = sub_18AF138F8;
    id v17 = 0;
    uint64_t v10 = objc_msgSend_callbackQueue(self, v5, v6, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B0C1224;
    v11[3] = &unk_1E5460080;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = _Block_copy(self->_movePhotosCompletionBlock);
  }

  return v8;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_18AF10000, "client/move-photos", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

  return v2;
}

- (void)fillOutOperationInfo:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CKMovePhotosOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v23 fillOutOperationInfo:v4];
  id v8 = objc_msgSend_moveChanges(self, v5, v6, v7, v23.receiver, v23.super_class);
  objc_msgSend_setMoveChanges_(v4, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_sourceDatabase(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_scope(v14, v15, v16, v17);
  objc_msgSend_setSourceDatabaseScope_(v4, v19, v18, v20);

  objc_msgSend_setAlwaysFetchPCSFromServer_(v4, v21, 1, v22);
}

- (void)fillFromOperationInfo:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CKMovePhotosOperation;
  id v4 = a3;
  [(CKDatabaseOperation *)&v28 fillFromOperationInfo:v4];
  id v8 = objc_msgSend_moveChanges(v4, v5, v6, v7, v28.receiver, v28.super_class);
  objc_msgSend_setMoveChanges_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_configuration(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_container(v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_sourceDatabaseScope(v4, v19, v20, v21);

  v25 = objc_msgSend_databaseWithDatabaseScope_(v18, v23, v22, v24);
  objc_msgSend_setSourceDatabase_(self, v26, (uint64_t)v25, v27);
}

- (BOOL)hasCKOperationCallbacksSet
{
  v17.receiver = self;
  v17.super_class = (Class)CKMovePhotosOperation;
  if ([(CKOperation *)&v17 hasCKOperationCallbacksSet]) {
    return 1;
  }
  uint64_t v10 = objc_msgSend_perRecordProgressBlock(self, v3, v4, v5);
  if (v10)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_perRecordMoveBlock(self, v7, v8, v9);
    if (v14)
    {
      BOOL v6 = 1;
    }
    else
    {
      id v15 = objc_msgSend_movePhotosCompletionBlock(self, v11, v12, v13);
      BOOL v6 = v15 != 0;
    }
  }

  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v4 = a3;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend_moveChanges(self, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

  if (!v10) {
    return v10;
  }
  uint64_t v14 = objc_msgSend_sourceDatabase(self, v11, v12, v13);

  if (!v14)
  {
    if (v4)
    {
      v94 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v94);
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v96, @"CKErrorDomain", 12, @"You must specify a sourceDatabase on %@", v95);
      id *v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    LOBYTE(v10) = 0;
    return v10;
  }
  id v15 = objc_opt_new();
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  objc_msgSend_moveChanges(self, v16, v17, v18);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v126, (uint64_t)v131, 16);
  v122 = v15;
  v123 = v4;
  if (!v20) {
    goto LABEL_18;
  }
  uint64_t v24 = v20;
  uint64_t v25 = *(void *)v127;
  while (2)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v127 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v27 = objc_msgSend_destinationRecord(*(void **)(*((void *)&v126 + 1) + 8 * i), v21, v22, v23);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v4) {
          goto LABEL_42;
        }
        v110 = (objc_class *)objc_opt_class();
        v111 = NSStringFromClass(v110);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v112, @"CKErrorDomain", 12, @"Unexpected record in property destinationRecords passed to %@: %@", v111, v27);
LABEL_33:
        id *v123 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_42;
      }
      v31 = objc_msgSend_recordID(v27, v28, v29, v30);
      v35 = objc_msgSend_zoneID(v31, v32, v33, v34);
      int v37 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v36, (uint64_t)v35, (uint64_t)v4);

      if (!v37) {
        goto LABEL_42;
      }
      if (objc_msgSend_containsIndexedKeys(v27, v38, v39, v40))
      {
        if (!v123) {
          goto LABEL_42;
        }
        v113 = (objc_class *)objc_opt_class();
        v111 = NSStringFromClass(v113);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v114, @"CKErrorDomain", 12, @"Moved records must not have array-indexed keys %@: %@", v111, v27);
        goto LABEL_33;
      }
      if (objc_msgSend_containsPackageValues(v27, v41, v42, v43))
      {
        if (!v123) {
          goto LABEL_42;
        }
        v115 = (objc_class *)objc_opt_class();
        v111 = NSStringFromClass(v115);
        objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v116, @"CKErrorDomain", 12, @"Moved records must not have packages %@: %@", v111, v27);
        goto LABEL_33;
      }
      v47 = objc_msgSend_valueStore(v27, v44, v45, v46);
      uint64_t v130 = objc_opt_class();
      v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v48, (uint64_t)&v130, 1);
      v125[0] = MEMORY[0x1E4F143A8];
      v125[1] = 3221225472;
      v125[2] = sub_18B0C1B44;
      v125[3] = &unk_1E5463D48;
      v125[4] = self;
      int v51 = objc_msgSend_containsValueOfClasses_passingTest_(v47, v50, (uint64_t)v49, (uint64_t)v125);

      if (v51)
      {
        if (v123)
        {
          v117 = objc_msgSend_recordID(v27, v52, v53, v54);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v118, @"CKErrorDomain", 12, @"Invalid CKAssetReference on record %@", v117);
LABEL_39:
          id *v123 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_42:

        goto LABEL_43;
      }
      v55 = objc_msgSend_recordType(v27, v52, v53, v54);
      if (objc_msgSend_isEqualToString_(v55, v56, @"cloudkit.share", v57))
      {

        uint64_t v4 = v123;
LABEL_37:
        if (v4)
        {
          v117 = objc_msgSend_recordID(v27, v62, v63, v64);
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v119, @"CKErrorDomain", 12, @"You may not move shares or shared records %@", v117);
          goto LABEL_39;
        }
        goto LABEL_42;
      }
      v61 = objc_msgSend_share(v27, v58, v59, v60);

      uint64_t v4 = v123;
      if (v61) {
        goto LABEL_37;
      }
      v65 = objc_msgSend_recordID(v27, v62, v63, v64);
      int v68 = objc_msgSend_containsObject_(v122, v66, (uint64_t)v65, v67);

      if (v68)
      {
        if (v123)
        {
          objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v69, @"CKErrorDomain", 12, @"You can't move the same record twice: %@", v27);
          id *v123 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_42;
      }
      v72 = objc_msgSend_recordID(v27, v69, v70, v71);
      objc_msgSend_addObject_(v122, v73, (uint64_t)v72, v74);
    }
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v126, (uint64_t)v131, 16);
    id v15 = v122;
    if (v24) {
      continue;
    }
    break;
  }
LABEL_18:

  v78 = objc_msgSend_configuration(self, v75, v76, v77);
  v82 = objc_msgSend_container(v78, v79, v80, v81);
  v86 = objc_msgSend_options(v82, v83, v84, v85);
  if (objc_msgSend_bypassPCSEncryption(v86, v87, v88, v89))
  {

    goto LABEL_24;
  }
  v97 = objc_msgSend_configuration(self, v90, v91, v92);
  v101 = objc_msgSend_container(v97, v98, v99, v100);
  v105 = objc_msgSend_options(v101, v102, v103, v104);
  int OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v105, v106, v107, v108);

  if (OnlyManatee)
  {
LABEL_24:
    if (v123)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v93, @"CKErrorDomain", 12, @"This container has requested no encryption but encryption is required when moving records");
      LOBYTE(v10) = 0;
      id *v123 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_43:
      LOBYTE(v10) = 0;
    }
    id v15 = v122;
  }
  else
  {
    v124.receiver = self;
    v124.super_class = (Class)CKMovePhotosOperation;
    LOBYTE(v10) = [(CKDatabaseOperation *)&v124 CKOperationShouldRun:v123];
  }

  return v10;
}

- (void)_trackAssetsToUpload
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v33 = self;
  objc_msgSend_moveChanges(self, v4, v5, v6);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, (uint64_t)v42, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v38;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = objc_msgSend_destinationRecord(*(void **)(*((void *)&v37 + 1) + 8 * v14), v9, v10, v11);
        v19 = objc_msgSend_valueStore(v15, v16, v17, v18);
        uint64_t v41 = objc_opt_class();
        uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v41, 1);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = sub_18B0C1ED0;
        v35[3] = &unk_1E54624F0;
        id v36 = v3;
        objc_msgSend_enumerateKeysAndValuesOfClasses_usingBlock_(v19, v22, (uint64_t)v21, (uint64_t)v35);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, (uint64_t)v42, 16);
    }
    while (v12);
  }

  v26 = objc_msgSend_deviceContext(v33, v23, v24, v25);
  uint64_t v30 = objc_msgSend_deviceScopedStateManager(v26, v27, v28, v29);
  objc_msgSend_trackAssets_(v30, v31, (uint64_t)v3, v32);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performMovePhotosOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v5 = objc_msgSend_moveChanges(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_CKMapToDictionary_(v5, v6, (uint64_t)&unk_1ED7EF1D8, v7);
  objc_msgSend_setMoveChangesBySourceRecordID_(self, v9, (uint64_t)v8, v10);

  uint64_t v14 = objc_msgSend_moveChanges(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_CKMapToDictionary_(v14, v15, (uint64_t)&unk_1ED7F0258, v16);
  objc_msgSend_setMoveChangesByDestinationRecordID_(self, v18, (uint64_t)v17, v19);

  objc_msgSend__trackAssetsToUpload(self, v20, v21, v22);
  v23.receiver = self;
  v23.super_class = (Class)CKMovePhotosOperation;
  [(CKOperation *)&v23 performCKOperation];
}

- (void)handleMoveForSourceRecordID:(id)a3 destinationMetadata:(id)a4 moveMarkerMetadata:(id)a5 error:(id)a6
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_moveChangesBySourceRecordID(self, v14, v15, v16);
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v10, v19);

  if (v20)
  {
    uint64_t v24 = objc_msgSend_destinationRecord(v20, v21, v22, v23);
    v31 = objc_msgSend_CKClientSuitableError(v13, v25, v26, v27);
    if (v31)
    {
      uint64_t v32 = objc_msgSend_recordErrorsBySourceRecordID(self, v28, v29, v30);
      objc_msgSend_setObject_forKeyedSubscript_(v32, v33, (uint64_t)v31, (uint64_t)v10);
      uint64_t v34 = 0;
    }
    else
    {
      id v36 = objc_msgSend_etag(v11, v28, v29, v30);

      if (v36)
      {
        long long v40 = objc_msgSend_etag(v11, v37, v38, v39);
        objc_msgSend_setEtag_(v24, v41, (uint64_t)v40, v42);
      }
      uint64_t v43 = objc_msgSend_creationDate(v11, v37, v38, v39);

      if (v43)
      {
        v47 = objc_msgSend_creationDate(v11, v44, v45, v46);
        objc_msgSend_setCreationDate_(v24, v48, (uint64_t)v47, v49);
      }
      id v50 = v10;
      int v51 = objc_msgSend_modificationDate(v11, v44, v45, v46);

      if (v51)
      {
        v55 = objc_msgSend_modificationDate(v11, v52, v53, v54);
        objc_msgSend_setModificationDate_(v24, v56, (uint64_t)v55, v57);
      }
      v58 = objc_msgSend_serverRecord(v11, v52, v53, v54);
      v62 = objc_msgSend_pluginFields(v58, v59, v60, v61);
      objc_msgSend_setPluginFields_(v24, v63, (uint64_t)v62, v64);

      int v68 = objc_msgSend_serverRecord(v11, v65, v66, v67);
      v72 = objc_msgSend_creatorUserRecordID(v68, v69, v70, v71);
      objc_msgSend_setCreatorUserRecordID_(v24, v73, (uint64_t)v72, v74);

      v78 = objc_msgSend_serverRecord(v11, v75, v76, v77);
      v82 = objc_msgSend_lastModifiedUserRecordID(v78, v79, v80, v81);
      objc_msgSend_setLastModifiedUserRecordID_(v24, v83, (uint64_t)v82, v84);

      uint64_t v88 = objc_msgSend_serverRecord(v11, v85, v86, v87);
      uint64_t v92 = objc_msgSend_modifiedByDevice(v88, v89, v90, v91);
      objc_msgSend_setModifiedByDevice_(v24, v93, (uint64_t)v92, v94);

      v98 = objc_msgSend_serverRecord(v11, v95, v96, v97);
      v102 = objc_msgSend_routingKey(v98, v99, v100, v101);
      objc_msgSend_setRoutingKey_(v24, v103, (uint64_t)v102, v104);

      uint64_t v108 = objc_msgSend_serverRecord(v11, v105, v106, v107);
      v112 = objc_msgSend_mutableEncryptedPSK(v108, v109, v110, v111);
      objc_msgSend_setMutableEncryptedPSK_(v24, v113, (uint64_t)v112, v114);

      v118 = objc_msgSend_serverRecord(v11, v115, v116, v117);
      v122 = objc_msgSend_displayedHostname(v118, v119, v120, v121);
      objc_msgSend_setDisplayedHostname_(v24, v123, (uint64_t)v122, v124);

      long long v128 = objc_msgSend_serverRecord(v11, v125, v126, v127);
      uint64_t v132 = objc_msgSend_chainParentPublicKeyID(v128, v129, v130, v131);
      objc_msgSend_setChainParentPublicKeyID_(v24, v133, (uint64_t)v132, v134);

      v138 = objc_msgSend_serverRecord(v11, v135, v136, v137);
      v142 = objc_msgSend_chainProtectionInfo(v138, v139, v140, v141);
      objc_msgSend_setChainProtectionInfo_(v24, v143, (uint64_t)v142, v144);

      v148 = objc_msgSend_serverRecord(v11, v145, v146, v147);
      v152 = objc_msgSend_chainPrivateKey(v148, v149, v150, v151);
      objc_msgSend_setChainPrivateKey_(v24, v153, (uint64_t)v152, v154);

      objc_msgSend_setKnownToServer_(v24, v155, 1, v156);
      objc_msgSend_resetChangedKeys(v24, v157, v158, v159);
      v163 = objc_msgSend_protectionData(v11, v160, v161, v162);
      objc_msgSend_setProtectionData_(v24, v164, (uint64_t)v163, v165);

      v169 = objc_msgSend_pcsKeyID(v11, v166, v167, v168);
      objc_msgSend_setPcsKeyID_(v24, v170, (uint64_t)v169, v171);

      v175 = objc_msgSend_allPCSKeyIDs(v11, v172, v173, v174);
      objc_msgSend_setAllPCSKeyIDs_(v24, v176, (uint64_t)v175, v177);

      v181 = objc_msgSend_zoneishKeyID(v11, v178, v179, v180);
      objc_msgSend_setZoneishKeyID_(v24, v182, (uint64_t)v181, v183);

      uint64_t v34 = objc_msgSend_serverRecord(v12, v184, v185, v186);
      v190 = objc_msgSend_etag(v12, v187, v188, v189);

      if (v190)
      {
        v194 = objc_msgSend_etag(v12, v191, v192, v193);
        objc_msgSend_setEtag_(v34, v195, (uint64_t)v194, v196);
      }
      v197 = objc_msgSend_creationDate(v12, v191, v192, v193);

      id v10 = v50;
      if (v197)
      {
        v201 = objc_msgSend_creationDate(v12, v198, v199, v200);
        objc_msgSend_setCreationDate_(v34, v202, (uint64_t)v201, v203);
      }
      v204 = objc_msgSend_modificationDate(v12, v198, v199, v200);

      v31 = 0;
      if (v204)
      {
        v208 = objc_msgSend_modificationDate(v12, v205, v206, v207);
        objc_msgSend_setModificationDate_(v34, v209, (uint64_t)v208, v210);
      }
      v211 = objc_msgSend_protectionData(v12, v205, v206, v207);
      objc_msgSend_setProtectionData_(v34, v212, (uint64_t)v211, v213);

      v217 = objc_msgSend_pcsKeyID(v12, v214, v215, v216);
      objc_msgSend_setPcsKeyID_(v34, v218, (uint64_t)v217, v219);

      v223 = objc_msgSend_allPCSKeyIDs(v12, v220, v221, v222);
      objc_msgSend_setAllPCSKeyIDs_(v34, v224, (uint64_t)v223, v225);

      uint64_t v32 = objc_msgSend_zoneishKeyID(v12, v226, v227, v228);
      objc_msgSend_setZoneishKeyID_(v34, v229, (uint64_t)v32, v230);
    }

    v234 = objc_msgSend_perRecordMoveBlock(self, v231, v232, v233);

    if (v234)
    {
      id v257 = v12;
      id v258 = v13;
      if (v31)
      {
        id v235 = 0;
        id v236 = 0;
      }
      else
      {
        id v235 = v24;
        id v236 = v34;
      }
      v237 = v20;
      id v238 = v10;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v239 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
      {
        v255 = v239;
        v254 = objc_msgSend_operationID(self, v244, v245, v246);
        v256 = objc_msgSend_recordID(v24, v247, v248, v249);
        v253 = objc_msgSend_recordID(v34, v250, v251, v252);
        *(_DWORD *)buf = 138544386;
        id v260 = v254;
        __int16 v261 = 2112;
        id v262 = v238;
        __int16 v263 = 2112;
        v264 = v256;
        __int16 v265 = 2112;
        v266 = v253;
        __int16 v267 = 2112;
        v268 = v31;
        _os_log_debug_impl(&dword_18AF10000, v255, OS_LOG_TYPE_DEBUG, "Operation %{public}@ calling out about moved record with source ID %@ destination ID %@ moveMarker ID %@: %@", buf, 0x34u);
      }
      objc_msgSend_perRecordMoveBlock(self, v240, v241, v242, v253);
      v243 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
      id v10 = v238;
      ((void (**)(void, id, id, id, void *))v243)[2](v243, v238, v235, v236, v31);

      uint64_t v20 = v237;
      id v12 = v257;
      id v13 = v258;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v35 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v260 = v10;
      _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "Received progress callback for unknown move source recordID %@", buf, 0xCu);
    }
  }
}

- (void)handleRecordUploadForRecordID:(id)a3 recordKey:(id)a4 arrayIndex:(int64_t)a5 signature:(id)a6 size:(unint64_t)a7 paddedFileSize:(unint64_t)a8 uploaded:(BOOL)a9 uploadReceipt:(id)a10 uploadReceiptExpiration:(double)a11 wrappedAssetKey:(id)a12 clearAssetKey:(id)a13 referenceSignature:(id)a14
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a10;
  id v22 = a12;
  id v91 = a13;
  id v92 = a14;
  uint64_t v26 = objc_msgSend_moveChangesByDestinationRecordID(self, v23, v24, v25);
  uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)v18, v28);

  uint64_t v33 = objc_msgSend_destinationRecord(v29, v30, v31, v32);
  id v36 = v33;
  if (v19 && v33)
  {
    objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)v19, v35);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = v37;
      long long v40 = v20;
      if (v37)
      {
LABEL_5:
        objc_msgSend_setArrayIndex_(v37, v38, a5, v39);
        objc_msgSend_setSignature_(v37, v41, (uint64_t)v40, v42);
        objc_msgSend_setSize_(v37, v43, a7, v44);
        objc_msgSend_setPaddedFileSize_(v37, v45, a8, v46);
        objc_msgSend_setUploaded_(v37, v47, a9, v48);
        uint64_t v49 = v21;
        objc_msgSend_setUploadReceipt_(v37, v50, (uint64_t)v21, v51);
        objc_msgSend_setUploadReceiptExpiration_(v37, v52, v53, v54, a11);
        v55 = v22;
        objc_msgSend_setWrappedAssetKey_(v37, v56, (uint64_t)v22, v57);
        v58 = v91;
        objc_msgSend_setClearAssetKey_(v37, v59, (uint64_t)v91, v60);
        objc_msgSend_setReferenceSignature_(v37, v61, (uint64_t)v92, v62);
        uint64_t v63 = v37;
LABEL_22:

        goto LABEL_23;
      }
      goto LABEL_15;
    }
    objc_opt_class();
    long long v40 = v20;
    if (objc_opt_isKindOfClass())
    {
      id v65 = v37;
      v69 = v65;
      if (a5 < 0 || objc_msgSend_count(v65, v66, v67, v68) <= (unint64_t)a5)
      {
        id v37 = v69;
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v49 = v21;
        v72 = (void *)ck_log_facility_ck;
        BOOL v73 = os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR);
        uint64_t v74 = v37;
        v55 = v22;
        if (v73)
        {
          id v76 = v37;
          uint64_t v77 = v72;
          uint64_t v81 = objc_msgSend_recordID(v36, v78, v79, v80);
          *(_DWORD *)buf = 134218242;
          int64_t v94 = a5;
          __int16 v95 = 2112;
          id v96 = v81;
          _os_log_error_impl(&dword_18AF10000, v77, OS_LOG_TYPE_ERROR, "Invalid arrayIndex %ld for record %@", buf, 0x16u);

          uint64_t v74 = v76;
          id v37 = v76;
        }
      }
      else
      {
        objc_msgSend_objectAtIndex_(v69, v70, a5, v71);
        id v37 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v37 = v37;

          if (v37) {
            goto LABEL_5;
          }
          goto LABEL_15;
        }
        uint64_t v49 = v21;
        uint64_t v87 = v69;
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v55 = v22;
        v75 = (void *)ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          v82 = v75;
          uint64_t v86 = objc_msgSend_recordID(v36, v83, v84, v85);
          *(_DWORD *)buf = 134218242;
          int64_t v94 = a5;
          __int16 v95 = 2112;
          id v96 = v86;
          _os_log_error_impl(&dword_18AF10000, v82, OS_LOG_TYPE_ERROR, "Invalid asset at arrayIndex %ld for record %@", buf, 0x16u);

          v55 = v22;
        }
        uint64_t v74 = v87;
      }

      uint64_t v63 = 0;
      goto LABEL_21;
    }
LABEL_15:
    uint64_t v63 = 0;
    uint64_t v49 = v21;
    v55 = v22;
LABEL_21:
    v58 = v91;
    goto LABEL_22;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  long long v40 = v20;
  uint64_t v49 = v21;
  uint64_t v64 = ck_log_facility_ck;
  v55 = v22;
  v58 = v91;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v94 = (int64_t)v36;
    __int16 v95 = 2114;
    id v96 = v19;
    __int16 v97 = 2112;
    id v98 = v18;
    _os_log_error_impl(&dword_18AF10000, v64, OS_LOG_TYPE_ERROR, "Received upload completion callback with nil record %p or recordKey %{public}@ for recordID %@", buf, 0x20u);
  }
LABEL_23:
}

- (void)handleDeleteForRecordID:(id)a3 error:(id)a4
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, (uint64_t)a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, (uint64_t)self, @"CKMovePhotosOperation.m", 320, @"Move Photos do not expect to hear about deletes");
}

- (void)handleRecordModificationForRecordID:(id)a3 didProgress:(double)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_moveChangesByDestinationRecordID(self, v7, v8, v9);
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6, v12);
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = objc_msgSend_sourceRecordID(v25, v13, v14, v15);
  id v20 = objc_msgSend_perRecordProgressBlock(self, v17, v18, v19);

  if (v20)
  {
    objc_msgSend_perRecordProgressBlock(self, v21, v22, v23);
    uint64_t v24 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, double))v24)[2](v24, v16, a4);
  }
}

- (void)handleSaveForRecordID:(id)a3 recordMetadata:(id)a4 error:(id)a5
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3, (uint64_t)a4, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v7, (uint64_t)a2, (uint64_t)self, @"CKMovePhotosOperation.m", 332, @"Move Photos do not expect to hear about saves");
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v8 = objc_msgSend_recordErrorsBySourceRecordID(self, v4, v5, v6);
    uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);

    if (v12)
    {
      id v13 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6);
      uint64_t v17 = objc_msgSend_recordErrorsBySourceRecordID(self, v14, v15, v16);
      objc_msgSend_setObject_forKeyedSubscript_(v13, v18, (uint64_t)v17, @"CKPartialErrors");

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v19, @"CKInternalErrorDomain", 1011, v13, @"Failed to move some records");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = 0;
    }
  }
  id v20 = objc_msgSend_movePhotosCompletionBlock(self, v4, v5, v6);

  if (v20)
  {
    objc_msgSend_movePhotosCompletionBlock(self, v21, v22, v23);
    uint64_t v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v28 = objc_msgSend_CKClientSuitableError(v7, v25, v26, v27);
    ((void (**)(void, void *))v24)[2](v24, v28);

    objc_msgSend_setMovePhotosCompletionBlock_(self, v29, 0, v30);
  }
  objc_msgSend_setPerRecordProgressBlock_(self, v21, 0, v23);
  objc_msgSend_setPerRecordMoveBlock_(self, v31, 0, v32);
  v33.receiver = self;
  v33.super_class = (Class)CKMovePhotosOperation;
  [(CKOperation *)&v33 _finishOnCallbackQueueWithError:v7];
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CKErrorUserInfoClasses();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleMoveForSourceRecordID_destinationMetadata_moveMarkerMetadata_error_, 3, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKMovePhotosOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);
}

- (NSArray)moveChanges
{
  return self->_moveChanges;
}

- (void)setMoveChanges:(id)a3
{
}

- (CKDatabase)sourceDatabase
{
  return self->_sourceDatabase;
}

- (void)setSourceDatabase:(id)a3
{
}

- (NSDictionary)moveChangesBySourceRecordID
{
  return self->_moveChangesBySourceRecordID;
}

- (void)setMoveChangesBySourceRecordID:(id)a3
{
}

- (NSDictionary)moveChangesByDestinationRecordID
{
  return self->_moveChangesByDestinationRecordID;
}

- (void)setMoveChangesByDestinationRecordID:(id)a3
{
}

- (NSMutableDictionary)recordErrorsBySourceRecordID
{
  return self->_recordErrorsBySourceRecordID;
}

- (void)setRecordErrorsBySourceRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordErrorsBySourceRecordID, 0);
  objc_storeStrong((id *)&self->_moveChangesByDestinationRecordID, 0);
  objc_storeStrong((id *)&self->_moveChangesBySourceRecordID, 0);
  objc_storeStrong((id *)&self->_sourceDatabase, 0);
  objc_storeStrong((id *)&self->_moveChanges, 0);
  objc_storeStrong(&self->_movePhotosCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordMoveBlock, 0);

  objc_storeStrong(&self->_perRecordProgressBlock, 0);
}

@end