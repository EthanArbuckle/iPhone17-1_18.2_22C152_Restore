@interface CKVDonateTask
- (BOOL)_isIncrementalPreferred;
- (BOOL)wasLastDonationAccepted;
- (CKVDonateTask)init;
- (CKVDonateTask)initWithDonatorProvider:(id)a3 datasetBridge:(id)a4 timeout:(double)a5 donateOptions:(unsigned __int16)a6;
- (CKVDonateTask)initWithDonatorProvider:(id)a3 deltaDatasetBridge:(id)a4 timeout:(double)a5;
- (CKVDonateTask)initWithDonatorProvider:(id)a3 fullDatasetBridge:(id)a4 timeout:(double)a5;
- (CKVDonateTask)initWithDonatorProvider:(id)a3 multiDatasetBridge:(id)a4 timeout:(double)a5;
- (id)_getProviderBridge;
- (id)lastDonationAcceptedDate;
- (int64_t)_enumerateAndStreamDeltaDataset:(id)a3 fullStream:(id)a4 incrementalStream:(id)a5;
- (int64_t)_enumerateAndStreamFullDataset:(id)a3 fullStream:(id)a4;
- (void)_donateAllDatasets:(unsigned __int16)a3 withReason:(unsigned __int16)a4 completion:(id)a5;
- (void)_donateDataset:(id)a3 withType:(unsigned __int16)a4 reason:(unsigned __int16)a5 completion:(id)a6;
- (void)runWithType:(unsigned __int16)a3 reason:(unsigned __int16)a4;
- (void)runWithType:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5;
@end

@implementation CKVDonateTask

void __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  uint64_t v5 = *(unsigned __int16 *)(a1 + 64);
  uint64_t v6 = *(unsigned __int16 *)(a1 + 66);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_2;
  v8[3] = &unk_1E5CF95E8;
  long long v10 = *(_OWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  [v7 _donateDataset:v4 withType:v5 reason:v6 completion:v8];
}

- (void)_donateDataset:(id)a3 withType:(unsigned __int16)a4 reason:(unsigned __int16)a5 completion:(id)a6
{
  unsigned int v32 = a4;
  unsigned int v33 = a5;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  os_signpost_id_t v10 = os_signpost_id_generate((os_log_t)CKLogContextFramework);
  v11 = (id)CKLogContextVocabulary;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A77B3000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "donateDataset", "", buf, 2u);
  }

  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)CKLogContextFramework);
  v14 = (id)CKLogContextVocabulary;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A77B3000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "donateIncrementalDataset", "", buf, 2u);
  }

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke;
  aBlock[3] = &unk_1E5CF9DA8;
  dispatch_semaphore_t dsema = v16;
  dispatch_semaphore_t v64 = dsema;
  id v37 = v9;
  id v65 = v37;
  v38 = _Block_copy(aBlock);
  v17 = [v8 originAppId];
  donatorProvider = self->_donatorProvider;
  id v62 = 0;
  v19 = -[CKVDonatorProvider donatorWithCascadeItemType:originAppId:error:](donatorProvider, "donatorWithCascadeItemType:originAppId:error:", [v8 cascadeItemType], v17, &v62);
  v35 = (uint64_t (*)(uint64_t, uint64_t))v62;
  if (v19)
  {
    v34 = v17;
    uint64_t donateOptions = self->_donateOptions;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v73 = __Block_byref_object_copy__165;
    v74 = __Block_byref_object_dispose__166;
    id v75 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__165;
    v56 = __Block_byref_object_dispose__166;
    id v57 = 0;
    if ([v8 conformsToProtocol:&unk_1EFD85D98])
    {
      id v21 = v8;
      uint64_t v22 = [v21 version];
      v23 = [v21 validity];
      if ([v21 wasLastDonationAccepted]) {
        uint64_t donateOptions = donateOptions;
      }
      else {
        uint64_t donateOptions = (unsigned __int16)donateOptions & 0xFFFE;
      }
      [v21 recordDonationAttempt];
    }
    else
    {
      uint64_t v22 = 0;
      id v21 = 0;
      v23 = &stru_1EFD77130;
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_72;
    v39[3] = &unk_1E5CF9688;
    v45 = buf;
    v46 = &v52;
    id v25 = v34;
    id v40 = v25;
    id v44 = v38;
    v41 = self;
    id v31 = v8;
    id v42 = v31;
    id v26 = v21;
    id v43 = v26;
    v47 = &v58;
    os_signpost_id_t v48 = v10;
    __int16 v50 = v32;
    __int16 v51 = v33;
    os_signpost_id_t v49 = v13;
    [v19 donateWithOptions:donateOptions version:v22 validity:v23 usingStream:v39];
    dispatch_time_t v27 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    if (dispatch_semaphore_wait(dsema, v27))
    {
      v28 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeout];
        *(_DWORD *)v66 = 136315650;
        v67 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]";
        __int16 v68 = 2112;
        id v69 = v25;
        __int16 v70 = 2112;
        v71 = v30;
        _os_log_error_impl(&dword_1A77B3000, v28, OS_LOG_TYPE_ERROR, "%s Timed out streaming donation from app: %@ timeout: %@ seconds", v66, 0x20u);
      }
      if (v37) {
        (*((void (**)(id, uint64_t))v37 + 2))(v37, -1);
      }
    }
    if (v26)
    {
      if (*((unsigned char *)v59 + 24))
      {
        [v26 recordDonationAccepted];
      }
      else if (v53[5])
      {
        v29 = CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v66 = 136315138;
          v67 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]";
          _os_log_impl(&dword_1A77B3000, v29, OS_LOG_TYPE_INFO, "%s Incremental donation aborted. Retrying full dataset donation.", v66, 0xCu);
        }
        [(CKVDonateTask *)self _donateDataset:v31 withType:v32 reason:v33 completion:v37];
      }
    }

    v17 = v34;
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v58, 8);
  }
  else
  {
    v24 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[CKVDonateTask _donateDataset:withType:reason:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v73 = v35;
      _os_log_error_impl(&dword_1A77B3000, v24, OS_LOG_TYPE_ERROR, "%s Failed to obtain donator for app: %@ error: %@", buf, 0x20u);
    }
    (*((void (**)(void *, uint64_t))v38 + 2))(v38, -1);
  }
}

- (void)runWithType:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    os_signpost_id_t v10 = v9;
    v11 = CKVTaskIdDescription(v6);
    v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v5];
    int v13 = 136315650;
    v14 = "-[CKVDonateTask runWithType:reason:completion:]";
    __int16 v15 = 2112;
    dispatch_semaphore_t v16 = v11;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_INFO, "%s Running donate task: %@ reason: %@", (uint8_t *)&v13, 0x20u);
  }
  if (self->_isMultiDataset) {
    [(CKVDonateTask *)self _donateAllDatasets:v6 withReason:v5 completion:v8];
  }
  else {
    [(CKVDonateTask *)self _donateDataset:self->_bridge withType:v6 reason:v5 completion:v8];
  }
}

- (void)runWithType:(unsigned __int16)a3 reason:(unsigned __int16)a4
{
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 multiDatasetBridge:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 conformsToProtocol:&unk_1EFD80B70])
  {
    self = [(CKVDonateTask *)self initWithDonatorProvider:v8 datasetBridge:v9 timeout:0 donateOptions:a5];
    os_signpost_id_t v10 = self;
  }
  else
  {
    os_signpost_id_t v10 = 0;
  }

  return v10;
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 datasetBridge:(id)a4 timeout:(double)a5 donateOptions:(unsigned __int16)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKVDonateTask;
  int v13 = [(CKVDonateTask *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_donatorProvider, a3);
    if (!v14->_donatorProvider)
    {
      __int16 v15 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v14->_bridge, a4);
    if ([v14->_bridge conformsToProtocol:&unk_1EFD80B70]) {
      v14->_isMultiDataset = 1;
    }
    v14->_timeout = a5;
    v14->_uint64_t donateOptions = a6;
  }
  __int16 v15 = v14;
LABEL_8:

  return v15;
}

- (void)_donateAllDatasets:(unsigned __int16)a3 withReason:(unsigned __int16)a4 completion:(id)a5
{
  id v8 = a5;
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)CKLogContextFramework);
  os_signpost_id_t v10 = (id)CKLogContextVocabulary;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A77B3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "streamDonateMultiDataset", "", buf, 2u);
  }

  uint64_t v41 = 0;
  *(void *)buf = 0;
  v38 = buf;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  dispatch_group_t v12 = dispatch_group_create();
  bridge = self->_bridge;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke;
  v29[3] = &unk_1E5CF9610;
  v14 = v12;
  v30 = v14;
  id v31 = self;
  unsigned __int16 v34 = a3;
  unsigned __int16 v35 = a4;
  unsigned int v32 = v36;
  unsigned int v33 = buf;
  [bridge enumerateAllDatasets:&v41 usingBlock:v29];
  __int16 v15 = (objc_class *)objc_opt_class();
  dispatch_semaphore_t v16 = NSStringFromClass(v15);
  if (_sharedQueue_onceToken != -1) {
    dispatch_once(&_sharedQueue_onceToken, &__block_literal_global_174);
  }
  objc_super v17 = _sharedQueue_sharedQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_3;
  v20[3] = &unk_1E5CF9638;
  unsigned __int16 v27 = a3;
  unsigned __int16 v28 = a4;
  v23 = v36;
  v24 = buf;
  os_signpost_id_t v25 = v9;
  uint64_t v26 = v41;
  id v21 = v16;
  id v22 = v8;
  id v18 = v8;
  id v19 = v16;
  dispatch_group_notify(v14, v17, v20);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(buf, 8);
}

void __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = a1 + 72;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v17 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v29 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]_block_invoke";
        __int16 v30 = 2112;
        uint64_t v31 = v18;
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_error_impl(&dword_1A77B3000, v17, OS_LOG_TYPE_ERROR, "%s Donation rejected for app: %@ error: %@ ", buf, 0x20u);
      }
      goto LABEL_16;
    }
    uint64_t v8 = a1 + 80;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v8 + 8) + 40), a2);
  os_signpost_id_t v9 = *(_WORD **)(a1 + 40);
  if (v9[17])
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v15)
    {
      dispatch_semaphore_t v16 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[CKVDonateTask _donateDataset:withType:reason:completion:]_block_invoke";
        _os_log_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_INFO, "%s Incremental donation cannot be made. Falling back to full dataset donation.", buf, 0xCu);
      }
      [*(id *)(a1 + 56) resetDeltaState];
      os_signpost_id_t v9 = *(_WORD **)(a1 + 40);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
    uint64_t v10 = [v9 _enumerateAndStreamDeltaDataset:*(void *)(a1 + 56) fullStream:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) incrementalStream:v15];
    if ((v10 & 0x8000000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
  uint64_t v10 = [v9 _enumerateAndStreamFullDataset:*(void *)(a1 + 48) fullStream:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  if (v10 < 0)
  {
LABEL_13:
    [v6 cancel];
LABEL_16:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_17;
  }
LABEL_7:
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_75;
  v19[3] = &unk_1E5CF9660;
  uint64_t v25 = v10;
  id v20 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 88);
  id v21 = v11;
  int v27 = *(_DWORD *)(a1 + 112);
  v14 = *(void **)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  long long v26 = *(_OWORD *)(a1 + 96);
  id v22 = v14;
  [v6 finish:v19];

LABEL_17:
}

- (int64_t)_enumerateAndStreamFullDataset:(id)a3 fullStream:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  id v21 = &v23;
  id v22 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  objc_super v17 = __59__CKVDonateTask__enumerateAndStreamFullDataset_fullStream___block_invoke;
  uint64_t v18 = &unk_1E5CF96B0;
  id v7 = v6;
  id v19 = v7;
  id v8 = v5;
  id v20 = v8;
  char v9 = [v8 enumerateItemsWithError:&v22 usingBlock:&v15];
  id v10 = v22;
  if (v9)
  {
    int64_t v11 = v24[3];
  }
  else
  {
    uint64_t v12 = (id)CKLogContextVocabulary;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(v8, "originAppId", v15, v16, v17, v18, v19);
      *(_DWORD *)buf = 136315650;
      unsigned __int16 v28 = "-[CKVDonateTask _enumerateAndStreamFullDataset:fullStream:]";
      __int16 v29 = 2112;
      __int16 v30 = v14;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_error_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed to enumerate full dataset from app: %@. error: %@", buf, 0x20u);
    }
    int64_t v11 = -1;
  }

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_donatorProvider, 0);
}

- (BOOL)wasLastDonationAccepted
{
  int v3 = [self->_bridge conformsToProtocol:&unk_1EFD85D98];
  if (v3)
  {
    bridge = self->_bridge;
    LOBYTE(v3) = [bridge wasLastDonationAccepted];
  }
  return v3;
}

- (id)lastDonationAcceptedDate
{
  if ([self->_bridge conformsToProtocol:&unk_1EFD85D98])
  {
    int v3 = [self->_bridge lastDonationAcceptedDate];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (BOOL)_isIncrementalPreferred
{
  return self->_donateOptions & 1;
}

- (id)_getProviderBridge
{
  return self->_bridge;
}

- (int64_t)_enumerateAndStreamDeltaDataset:(id)a3 fullStream:(id)a4 incrementalStream:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  __int16 v31 = &v33;
  id v32 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke;
  v27[3] = &unk_1E5CF96D8;
  id v28 = v9;
  id v29 = v7;
  id v10 = v8;
  id v30 = v10;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke_84;
  uint64_t v23 = &unk_1E5CF9700;
  uint64_t v26 = &v33;
  id v11 = v28;
  id v24 = v11;
  id v12 = v29;
  id v25 = v12;
  char v13 = [v12 enumerateDeltaItemsWithError:&v32 addOrUpdateBlock:v27 removeBlock:&v20];
  id v14 = v32;
  uint64_t v15 = v14;
  if (v13)
  {
    int64_t v16 = v34[3];
  }
  else
  {
    if (v14)
    {
      objc_super v17 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = objc_msgSend(v12, "originAppId", v20, v21, v22, v23, v24);
        *(_DWORD *)buf = 136315650;
        v38 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]";
        __int16 v39 = 2112;
        uint64_t v40 = v19;
        __int16 v41 = 2112;
        id v42 = v15;
        _os_log_error_impl(&dword_1A77B3000, v17, OS_LOG_TYPE_ERROR, "%s Failed to enumerate delta dataset from app: %@. error: %@", buf, 0x20u);
      }
    }
    int64_t v16 = -1;
  }

  _Block_object_dispose(&v33, 8);
  return v16;
}

uint64_t __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  id v4 = (void *)a1[4];
  if (v4)
  {
    id v21 = 0;
    char v5 = [v4 addOrUpdateItem:v3 error:&v21];
    id v6 = v21;
    if ((v5 & 1) == 0)
    {
      id v7 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        id v14 = (void *)a1[5];
        uint64_t v15 = v7;
        int64_t v16 = [v14 originAppId];
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v3;
        __int16 v26 = 2112;
        int v27 = v16;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_error_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to add or update item: %@ from app: %@. error: %@", buf, 0x2Au);
      }
      uint64_t v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v9 = (void *)a1[6];
  if (v9)
  {
    id v20 = v6;
    char v10 = [v9 registerItem:v3 error:&v20];
    id v11 = v20;

    if (v10)
    {
      uint64_t v8 = 1;
    }
    else
    {
      id v12 = (void *)CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        objc_super v17 = (void *)a1[5];
        uint64_t v18 = v12;
        id v19 = [v17 originAppId];
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]_block_invoke";
        __int16 v24 = 2112;
        id v25 = v3;
        __int16 v26 = 2112;
        int v27 = v19;
        __int16 v28 = 2112;
        id v29 = v11;
        _os_log_error_impl(&dword_1A77B3000, v18, OS_LOG_TYPE_ERROR, "%s Failed to register item: %@ from app: %@. error: %@", buf, 0x2Au);
      }
      uint64_t v8 = 0;
    }
    id v6 = v11;
  }
  else
  {
    uint64_t v8 = 1;
  }
LABEL_15:

  return v8;
}

uint64_t __78__CKVDonateTask__enumerateAndStreamDeltaDataset_fullStream_incrementalStream___block_invoke_84(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  id v4 = (void *)a1[4];
  id v12 = 0;
  uint64_t v5 = [v4 removeItemWithItemId:v3 error:&v12];
  id v6 = v12;
  if ((v5 & 1) == 0)
  {
    id v7 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)a1[5];
      char v10 = v7;
      id v11 = [v9 originAppId];
      *(_DWORD *)buf = 136315906;
      id v14 = "-[CKVDonateTask _enumerateAndStreamDeltaDataset:fullStream:incrementalStream:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to remove item with itemId: %@ from app: %@. error: %@", buf, 0x2Au);
    }
  }

  return v5;
}

uint64_t __59__CKVDonateTask__enumerateAndStreamFullDataset_fullStream___block_invoke(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  id v4 = (void *)a1[4];
  id v12 = 0;
  uint64_t v5 = [v4 registerItem:v3 error:&v12];
  id v6 = v12;
  if ((v5 & 1) == 0)
  {
    id v7 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      id v9 = (void *)a1[5];
      char v10 = v7;
      id v11 = [v9 originAppId];
      *(_DWORD *)buf = 136315906;
      id v14 = "-[CKVDonateTask _enumerateAndStreamFullDataset:fullStream:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to stream vocabulary item: %@ from app: %@. error: %@", buf, 0x2Au);
    }
  }

  return v5;
}

intptr_t __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke(uint64_t a1)
{
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (result)
  {
    intptr_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

void __59__CKVDonateTask__donateDataset_withType_reason_completion___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v6 = *(void *)(a1 + 72);
    id v7 = v4;
    uint64_t v8 = [v5 numberWithInteger:v6];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F70B80], "descriptionForTypeIdentifier:", objc_msgSend(*(id *)(a1 + 32), "cascadeItemType"));
    char v10 = (void *)v9;
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = @"success";
    *(_DWORD *)__int16 v26 = 136316162;
    *(void *)&v26[4] = "-[CKVDonateTask _donateDataset:withType:reason:completion:]_block_invoke";
    if (v3) {
      id v12 = v3;
    }
    *(_WORD *)&v26[12] = 2112;
    *(void *)&v26[14] = v8;
    __int16 v27 = 2112;
    *(void *)__int16 v28 = v9;
    *(_WORD *)&v28[8] = 2112;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    __int16 v31 = v12;
    _os_log_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_INFO, "%s Finished streaming %@ items of type: %@ from app: %@ result: %@", v26, 0x34u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3 == 0;
  +[CKVAnalytics sendDonateEvent:*(unsigned __int16 *)(a1 + 96) itemCount:*(void *)(a1 + 72) appId:*(void *)(a1 + 40) reason:*(unsigned __int16 *)(a1 + 98) result:*(_OWORD *)v26];
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v14 = (id)CKLogContextVocabulary;
  __int16 v15 = v14;
  if (v13)
  {
    os_signpost_id_t v16 = *(void *)(a1 + 80);
    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
      goto LABEL_13;
    }
    __int16 v17 = CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 96));
    uint64_t v18 = *(void *)(a1 + 40);
    int v19 = *(unsigned __int16 *)(a1 + 98);
    uint64_t v20 = *(void *)(a1 + 72);
    *(_DWORD *)__int16 v26 = 138544130;
    *(void *)&v26[4] = v17;
    *(_WORD *)&v26[12] = 2114;
    *(void *)&v26[14] = v18;
    __int16 v27 = 1026;
    *(_DWORD *)__int16 v28 = v19;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = v20;
    uint64_t v21 = "donateDataset";
  }
  else
  {
    os_signpost_id_t v16 = *(void *)(a1 + 88);
    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14)) {
      goto LABEL_13;
    }
    __int16 v17 = CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 96));
    uint64_t v22 = *(void *)(a1 + 40);
    int v23 = *(unsigned __int16 *)(a1 + 98);
    uint64_t v24 = *(void *)(a1 + 72);
    *(_DWORD *)__int16 v26 = 138544130;
    *(void *)&v26[4] = v17;
    *(_WORD *)&v26[12] = 2114;
    *(void *)&v26[14] = v22;
    __int16 v27 = 1026;
    *(_DWORD *)__int16 v28 = v23;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = v24;
    uint64_t v21 = "donateIncrementalDataset";
  }
  _os_signpost_emit_with_name_impl(&dword_1A77B3000, v15, OS_SIGNPOST_INTERVAL_END, v16, v21, " type=%{public,signpost.telemetry:string1}@  appId=%{public,signpost.telemetry:string2}@  reason=%{public,signpost.telemetry:number1}d  itemCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", v26, 0x22u);

LABEL_13:
  if (v3) {
    uint64_t v25 = -1;
  }
  else {
    uint64_t v25 = *(void *)(a1 + 72);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v25);
}

uint64_t __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = (id)CKLogContextVocabulary;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    CKVTaskIdDescription(*(unsigned __int16 *)(a1 + 80));
    uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
    int v6 = *(unsigned __int16 *)(a1 + 82);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v18 = 138543874;
    int v19 = v5;
    __int16 v20 = 1026;
    *(_DWORD *)uint64_t v21 = v6;
    *(_WORD *)&v21[4] = 1026;
    *(_DWORD *)&v21[6] = v7;
    _os_signpost_emit_with_name_impl(&dword_1A77B3000, v3, OS_SIGNPOST_INTERVAL_END, v4, "streamDonateMultiDataset", " type=%{public,signpost.telemetry:string1}@  reason=%{public,signpost.telemetry:number1}d  itemCnt=%{public,signpost.telemetry:number2}d  enableTelemetry=YES ", (uint8_t *)&v18, 0x18u);
  }
  uint64_t v8 = (void *)CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v14 = v8;
    __int16 v15 = [v12 numberWithUnsignedInteger:v13];
    os_signpost_id_t v16 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
    __int16 v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    int v18 = 136316162;
    int v19 = "-[CKVDonateTask _donateAllDatasets:withReason:completion:]_block_invoke";
    __int16 v20 = 2112;
    *(void *)uint64_t v21 = v11;
    *(_WORD *)&v21[8] = 2112;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    __int16 v26 = v17;
    _os_log_debug_impl(&dword_1A77B3000, v14, OS_LOG_TYPE_DEBUG, "%s Enumerated all datasets from %@ donated datasets: %@ enumerated datasets: %@ total items: %@", (uint8_t *)&v18, 0x34u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    else if (*(void *)(a1 + 72))
    {
      uint64_t v10 = -1;
    }
    else
    {
      uint64_t v10 = 0;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v10);
  }
  return result;
}

void __58__CKVDonateTask__donateAllDatasets_withReason_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a2;
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CKVDonateTask)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 deltaDatasetBridge:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 conformsToProtocol:&unk_1EFD85D98])
  {
    self = [(CKVDonateTask *)self initWithDonatorProvider:v8 datasetBridge:v9 timeout:1 donateOptions:a5];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (CKVDonateTask)initWithDonatorProvider:(id)a3 fullDatasetBridge:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 conformsToProtocol:&unk_1EFD80A90])
  {
    self = [(CKVDonateTask *)self initWithDonatorProvider:v8 datasetBridge:v9 timeout:0 donateOptions:a5];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end