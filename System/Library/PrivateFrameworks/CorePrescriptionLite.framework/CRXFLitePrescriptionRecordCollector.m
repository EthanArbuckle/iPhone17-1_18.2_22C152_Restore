@interface CRXFLitePrescriptionRecordCollector
- (CRXFLitePrescriptionRecordCollector)initWithDeviceModel:(id)a3 timeout:(double)a4;
- (CRXFLitePrescriptionRecordCollector)initWithTimeout:(double)a3;
- (id)prescriptionRecordWithEnrollmentName:(id)a3 enrollmentDate:(id)a4 accPayload:(id)a5;
- (void)fetchPrescriptionRecordsWithCompletion:(id)a3;
@end

@implementation CRXFLitePrescriptionRecordCollector

- (CRXFLitePrescriptionRecordCollector)initWithTimeout:(double)a3
{
  return [(CRXFLitePrescriptionRecordCollector *)self initWithDeviceModel:@"RealityDevice14,1" timeout:a3];
}

- (CRXFLitePrescriptionRecordCollector)initWithDeviceModel:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRXFLitePrescriptionRecordCollector;
  v7 = [(CRXFLitePrescriptionRecordCollector *)&v22 init];
  if (v7)
  {
    os_log_t v8 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = [[CRXFLiteHealthDataProvider alloc] initWithDeviceModel:v6];
    healthDataProvider = v7->_healthDataProvider;
    v7->_healthDataProvider = v10;

    if (a4 >= 2.0) {
      double v12 = a4 + -1.0;
    }
    else {
      double v12 = 1.0;
    }
    v13 = [[CRXFCalibrationDataDownloader alloc] initWithServer:0 serverVersion:0 timeout:v12];
    calibrationDataDownloader = v7->_calibrationDataDownloader;
    v7->_calibrationDataDownloader = v13;

    v15 = [[CRXFKeychainAccess alloc] initWithDeviceModel:v6];
    keychainAccess = v7->_keychainAccess;
    v7->_keychainAccess = v15;

    uint64_t v17 = +[CRXUDispatchQueue concurrentQueueWithName:@"PrescriptionRecordCollector.SerialQueue"];
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (CRXUDispatchQueue *)v17;

    uint64_t v19 = +[CRXFAppClipCodeTranscoder sharedInstance];
    accTranscoder = v7->_accTranscoder;
    v7->_accTranscoder = (CRXFAppClipCodeTranscoder *)v19;
  }
  return v7;
}

- (void)fetchPrescriptionRecordsWithCompletion:(id)a3
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v50 = a3;
  v4 = [[CRXUDispatchGroup alloc] initWithName:@"PrescriptionRecordCollectorGroup"];
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [MEMORY[0x263EFF980] array];
  v7 = [MEMORY[0x263EFF980] array];
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x3032000000;
  v109[3] = __Block_byref_object_copy_;
  v109[4] = __Block_byref_object_dispose_;
  id v110 = 0;
  v107[0] = 0;
  v107[1] = v107;
  v107[2] = 0x3032000000;
  v107[3] = __Block_byref_object_copy_;
  v107[4] = __Block_byref_object_dispose_;
  id v108 = 0;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x2020000000;
  v106[3] = 0;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  v105[3] = 0;
  v104[0] = 0;
  v104[1] = v104;
  v104[2] = 0x2020000000;
  v104[3] = 0;
  os_log_t v8 = [MEMORY[0x263EFF910] date];
  [v8 timeIntervalSinceReferenceDate];
  uint64_t v10 = v9;

  serialQueue = self->_serialQueue;
  v103[0] = MEMORY[0x263EF8330];
  v103[1] = 3221225472;
  v103[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke;
  v103[3] = &unk_2652E1FF0;
  v103[4] = self;
  [(CRXUDispatchQueue *)serialQueue dispatchSync:v103];
  [(CRXUDispatchGroup *)v4 enter];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:].cold.4();
  }
  healthDataProvider = self->_healthDataProvider;
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_446;
  v99[3] = &unk_2652E2068;
  v99[4] = self;
  id v13 = v6;
  id v100 = v13;
  v102 = v109;
  v14 = v4;
  v101 = v14;
  [(CRXFLiteHealthDataProvider *)healthDataProvider fetchHealthRecordsWithCompletion:v99];
  [(CRXUDispatchGroup *)v14 enter];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]();
  }
  keychainAccess = self->_keychainAccess;
  v95[0] = MEMORY[0x263EF8330];
  v95[1] = 3221225472;
  v95[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_452;
  v95[3] = &unk_2652E2068;
  v95[4] = self;
  id v16 = v7;
  id v96 = v16;
  v98 = v107;
  uint64_t v17 = v14;
  v97 = v17;
  [(CRXFKeychainAccess *)keychainAccess fetchASAKeysWithCompletion:v95];
  [(CRXUDispatchGroup *)v17 waitFor:1.0];
  v58 = v17;
  v51 = [MEMORY[0x263EFF980] array];
  v52 = [MEMORY[0x263EFF980] array];
  id v18 = v5;
  objc_sync_enter(v18);
  [v51 addObjectsFromArray:v18];
  objc_sync_exit(v18);
  v49 = v18;

  id v19 = v16;
  objc_sync_enter(v19);
  [v52 addObjectsFromArray:v19];
  objc_sync_exit(v19);
  v48 = v19;

  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x2020000000;
  uint64_t v94 = 0;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v13;
  uint64_t v20 = [obj countByEnumeratingWithState:&v87 objects:v120 count:16];
  v21 = &unk_24C4A0000;
  if (v20)
  {
    uint64_t v22 = 0;
    uint64_t v56 = *(void *)v88;
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = v22;
      do
      {
        if (*(void *)v88 != v56) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v87 + 1) + 8 * v23);
        [(CRXUDispatchGroup *)v58 enter];
        v26 = self->_log;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_INFO))
        {
          v27 = [NSNumber numberWithUnsignedInteger:v24 + v23];
          v28 = NSNumber;
          [(CRXFCalibrationDataDownloader *)self->_calibrationDataDownloader timeout];
          v29 = objc_msgSend(v28, "numberWithDouble:");
          *(_DWORD *)buf = 136315906;
          v113 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]";
          __int16 v114 = 1024;
          int v115 = 385;
          __int16 v116 = 2114;
          v117 = v27;
          __int16 v118 = 2114;
          v119 = v29;
          _os_log_impl(&dword_24C484000, (os_log_t)v26, OS_LOG_TYPE_INFO, "%s @%d: Downloading calibration for health record #%{public}@ with timeout %{public}@", buf, 0x26u);
        }
        calibrationDataDownloader = self->_calibrationDataDownloader;
        v31 = [v25 accPayload];
        v32 = self->_serialQueue;
        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_453;
        v81[3] = &unk_2652E2090;
        v83 = v104;
        v84 = v105;
        v85 = v106;
        uint64_t v86 = v24 + v23;
        v81[4] = self;
        v81[5] = v25;
        v82 = v58;
        v33 = calibrationDataDownloader;
        v21 = (void *)&unk_24C4A0000;
        [(CRXFCalibrationDataDownloader *)v33 downloadCalibrationDataForACCPayload:v31 completionQueue:v32 completion:v81];

        ++v23;
      }
      while (v20 != v23);
      uint64_t v20 = [obj countByEnumeratingWithState:&v87 objects:v120 count:16];
      uint64_t v22 = v24 + v23;
    }
    while (v20);
    uint64_t v34 = v24 + v23;
  }
  else
  {
    uint64_t v34 = 0;
  }

  v92[3] = v34;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]();
  }
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  v80[3] = 0;
  if (v52)
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v54 = v52;
    uint64_t v35 = [v54 countByEnumeratingWithState:&v76 objects:v111 count:16];
    if (v35)
    {
      uint64_t v36 = 0;
      uint64_t v57 = *(void *)v77;
      int v53 = v21[320];
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v77 != v57) {
            objc_enumerationMutation(v54);
          }
          v38 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          [(CRXUDispatchGroup *)v58 enter];
          v39 = self->_log;
          if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_INFO))
          {
            v40 = [NSNumber numberWithUnsignedInteger:v36 + i];
            v41 = NSNumber;
            [(CRXFCalibrationDataDownloader *)self->_calibrationDataDownloader timeout];
            v42 = objc_msgSend(v41, "numberWithDouble:");
            *(_DWORD *)buf = v53;
            v113 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]";
            __int16 v114 = 1024;
            int v115 = 426;
            __int16 v116 = 2114;
            v117 = v40;
            __int16 v118 = 2114;
            v119 = v42;
            _os_log_impl(&dword_24C484000, (os_log_t)v39, OS_LOG_TYPE_INFO, "%s @%d: Downloading calibration for ASA key #%{public}@ with timeout %{public}@", buf, 0x26u);
          }
          v43 = self->_calibrationDataDownloader;
          v44 = [v38 privateKey];
          v45 = self->_serialQueue;
          v69[0] = MEMORY[0x263EF8330];
          v69[1] = 3221225472;
          v69[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_455;
          v69[3] = &unk_2652E20B8;
          v74 = v106;
          uint64_t v75 = v36 + i;
          v71 = v104;
          v72 = v105;
          v69[4] = self;
          v69[5] = v38;
          v73 = v80;
          v70 = v58;
          [(CRXFCalibrationDataDownloader *)v43 downloadCalibrationDataForASAKey:v44 completionQueue:v45 completion:v69];
        }
        uint64_t v35 = [v54 countByEnumeratingWithState:&v76 objects:v111 count:16];
        v36 += i;
      }
      while (v35);
    }

    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      -[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]();
    }
  }
  v46 = self->_serialQueue;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_456;
  v59[3] = &unk_2652E20E0;
  uint64_t v68 = v10;
  v59[4] = self;
  v61 = v105;
  v62 = v104;
  v63 = v109;
  v64 = v107;
  v65 = &v91;
  v66 = v80;
  v67 = v106;
  id v47 = v50;
  id v60 = v47;
  [(CRXUDispatchGroup *)v58 notifyOnQueue:v46 withBlock:v59];

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(v104, 8);
  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v106, 8);
  _Block_object_dispose(v107, 8);

  _Block_object_dispose(v109, 8);
}

uint64_t __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = [MEMORY[0x263EFF980] array];
  return MEMORY[0x270F9A758]();
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_446(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  os_log_t v8 = *(void **)(v7 + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2;
  v13[3] = &unk_2652E2040;
  id v14 = v5;
  uint64_t v15 = v7;
  id v16 = *(id *)(a1 + 40);
  id v17 = v6;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v18 = v12;
  id v10 = v6;
  id v11 = v5;
  [v8 dispatchAsync:v13];
}

uint64_t __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = (void **)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    v3 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_2(v2, v3);
    }
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = *v2;
    uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v38;
      uint64_t v9 = *MEMORY[0x263F0AB88];
      uint64_t v10 = *MEMORY[0x263F09A80];
      *(void *)&long long v6 = 136315650;
      long long v30 = v6;
      v32 = v4;
      do
      {
        uint64_t v11 = 0;
        uint64_t v33 = v7;
        do
        {
          if (*(void *)v38 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
          id v13 = objc_msgSend(v12, "metadata", v30);
          id v14 = objc_msgSend(v13, "crxu_dataForKey:", v9);

          if (v14)
          {
            uint64_t v15 = [v12 metadata];
            int v16 = objc_msgSend(v15, "crxu_containsKey:", v10);

            if (v16)
            {
              uint64_t v17 = v10;
              uint64_t v18 = v8;
              id v19 = [v4 objectForKey:v14];
              uint64_t v20 = v19;
              if (!v19) {
                goto LABEL_15;
              }
              v21 = [v19 _creationDate];
              uint64_t v22 = [v12 _creationDate];
              int v23 = objc_msgSend(v21, "crxu_isBefore:", v22);

              v4 = v32;
              if (v23)
              {
                uint64_t v24 = *(NSObject **)(*(void *)(a1 + 40) + 8);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  v25 = v24;
                  v26 = objc_msgSend(v14, "crxu_asHexString");
                  *(_DWORD *)buf = v30;
                  v42 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
                  __int16 v43 = 1024;
                  int v44 = 306;
                  __int16 v45 = 2112;
                  v46 = v26;
                  _os_log_debug_impl(&dword_24C484000, v25, OS_LOG_TYPE_DEBUG, "%s @%d: Discarding health record with duplicate ACC %@", buf, 0x1Cu);

                  v4 = v32;
                }
LABEL_15:
                [v4 setObject:v12 forKey:v14];
              }

              uint64_t v8 = v18;
              uint64_t v10 = v17;
              uint64_t v7 = v33;
            }
          }

          ++v11;
        }
        while (v7 != v11);
        uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v7);
    }

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_449;
    v35[3] = &unk_2652E2018;
    v27 = v4;
    uint64_t v1 = a1;
    v28 = *(void **)(a1 + 48);
    v35[4] = *(void *)(a1 + 40);
    id v36 = v28;
    [v27 enumerateKeysAndObjectsUsingBlock:v35];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(v1 + 40) + 8), OS_LOG_TYPE_DEBUG)) {
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_1();
    }
  }
  return [*(id *)(v1 + 64) leave];
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_449(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v5 metadata];
  objc_msgSend(v7, "crxu_stringForKey:", *MEMORY[0x263F09A80]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v5 dateIssued];

  uint64_t v10 = [v8 prescriptionRecordWithEnrollmentName:v11 enrollmentDate:v9 accPayload:v6];

  if (v10)
  {
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:v10];
    [*(id *)(a1 + 40) addObject:v10];
  }
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_452(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_452_cold_2(v7, v5);
    }
    id v8 = *(id *)(a1 + 40);
    objc_sync_enter(v8);
    [*(id *)(a1 + 40) addObjectsFromArray:v5];
    objc_sync_exit(v8);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
      __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_452_cold_1();
    }
  }
  [*(id *)(a1 + 48) leave];
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_453(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 56))
  {
    uint64_t v10 = *(NSObject **)(v9 + 8);
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = NSNumber;
        uint64_t v12 = *(void *)(a1 + 80);
        id v13 = v10;
        id v14 = [v11 numberWithUnsignedInteger:v12];
        int v18 = 136315650;
        id v19 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 395;
        __int16 v22 = 2114;
        int v23 = v14;
        _os_log_impl(&dword_24C484000, v13, OS_LOG_TYPE_INFO, "%s @%d: Calibration download for health record #%{public}@ completed", (uint8_t *)&v18, 0x1Cu);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  + a4;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_453_cold_1(a1, v10);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    uint64_t v15 = *(void **)(a1 + 40);
    int v16 = [v7 leftCalibrationData];
    uint64_t v17 = [v7 rightCalibrationData];
    [v15 addLeftCalibrationData:v16 rightCalibrationData:v17];
  }
  [*(id *)(a1 + 48) leave];
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_455(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 56))
  {
    uint64_t v10 = *(NSObject **)(v9 + 8);
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = NSNumber;
        uint64_t v12 = *(void *)(a1 + 88);
        id v13 = v10;
        id v14 = [v11 numberWithUnsignedInteger:v12];
        int v22 = 136315650;
        int v23 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 436;
        __int16 v26 = 2114;
        v27 = v14;
        _os_log_impl(&dword_24C484000, v13, OS_LOG_TYPE_INFO, "%s @%d: Calibration download for ASA key #%{public}@ completed", (uint8_t *)&v22, 0x1Cu);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  + a4;
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v15 = *(void **)(a1 + 32);
      int v16 = [*(id *)(a1 + 40) name];
      uint64_t v17 = [*(id *)(a1 + 40) creationDate];
      int v18 = [v7 accPayload];
      id v19 = [v15 prescriptionRecordWithEnrollmentName:v16 enrollmentDate:v17 accPayload:v18];

      if (v19)
      {
        __int16 v20 = [v7 leftCalibrationData];
        int v21 = [v7 rightCalibrationData];
        [v19 addLeftCalibrationData:v20 rightCalibrationData:v21];

        [*(id *)(*(void *)(a1 + 32) + 56) addObject:v19];
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_455_cold_1(a1, v10);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
  }
  [*(id *)(a1 + 48) leave];
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_456(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;

  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6 - *(double *)(a1 + 104);

  id v8 = [[CRXFLitePrescriptionRecordFetchSummary alloc] initWithHealthKitError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) keychainError:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) healthRecordCount:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) asaKeyCount:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) calibrationDataDownloadFailureCount:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) meanCalibrationDataDownloadTime:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)/ (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) totalFetchTime:v7];
  +[CRXFLiteAnalytics addRecordFetchEventWithFetchSummary:v8];
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_456_cold_1(v9, v2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)prescriptionRecordWithEnrollmentName:(id)a3 enrollmentDate:(id)a4 accPayload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accTranscoder = self->_accTranscoder;
  id v34 = 0;
  uint64_t v12 = [(CRXFAppClipCodeTranscoder *)accTranscoder decodeAppClipCodeFromData:v10 allowUnsupportedRX:0 error:&v34];
  id v13 = v34;
  if (v12)
  {
    id v14 = [CRXFLiteRXValues alloc];
    [v12 leftDisplaySphere];
    int v16 = v15;
    [v12 leftDisplayCylinder];
    int v18 = v17;
    uint64_t v19 = [v12 leftDisplayAxis];
    LODWORD(v20) = v16;
    LODWORD(v21) = v18;
    int v22 = [(CRXFLiteRXValues *)v14 initWithSphere:v19 cylinder:v20 axis:v21];
    int v23 = [CRXFLiteRXValues alloc];
    [v12 rightDisplaySphere];
    int v25 = v24;
    [v12 rightDisplayCylinder];
    int v27 = v26;
    uint64_t v28 = [v12 rightDisplayAxis];
    LODWORD(v29) = v25;
    LODWORD(v30) = v27;
    v31 = [(CRXFLiteRXValues *)v23 initWithSphere:v28 cylinder:v29 axis:v30];
    v32 = [[CRXFLitePrescriptionRecord alloc] initWithACCPayload:v10 enrollmentName:v8 enrollmentDate:v9 leftEyeRX:v22 rightEyeRX:v31];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[CRXFLitePrescriptionRecordCollector prescriptionRecordWithEnrollmentName:enrollmentDate:accPayload:]();
    }
    v32 = 0;
  }

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_accTranscoder, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_keychainAccess, 0);
  objc_storeStrong((id *)&self->_calibrationDataDownloader, 0);
  objc_storeStrong((id *)&self->_healthDataProvider, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_24C484000, v0, v1, "%s @%d: Done processing ASA keys", v2, v3, v4, v5, 2u);
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_24C484000, v0, v1, "%s @%d: Done processing health records", v2, v3, v4, v5, 2u);
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_24C484000, v0, v1, "%s @%d: Fetching ASA keys", v2, v3, v4, v5, 2u);
}

- (void)fetchPrescriptionRecordsWithCompletion:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1(&dword_24C484000, v0, v1, "%s @%d: Fetching health records", v2, v3, v4, v5, 2u);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v1 = 136315650;
  uint64_t v2 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke_2";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_24C484000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: Failed to fetch health records: %{public}@", (uint8_t *)&v1, 0x1Cu);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_2_cold_2(void **a1, void *a2)
{
  uint64_t v2 = NSNumber;
  __int16 v3 = *a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24C484000, v6, v7, "%s @%d: Fetched %{public}@ health records", v8, v9, v10, v11, 2u);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_452_cold_1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  int v1 = 136315650;
  uint64_t v2 = "-[CRXFLitePrescriptionRecordCollector fetchPrescriptionRecordsWithCompletion:]_block_invoke";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_24C484000, v0, OS_LOG_TYPE_ERROR, "%s @%d: Failed to fetch ASA keys: %{public}@", (uint8_t *)&v1, 0x1Cu);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_452_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  __int16 v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v6[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_24C484000, v4, OS_LOG_TYPE_DEBUG, "%s @%d: Fetched %{public}@ ASA keys", (uint8_t *)v6, 0x1Cu);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_453_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 80);
  id v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedInteger:v3];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_24C484000, v6, v7, "%s @%d: Calibration download for health record #%{public}@ failed: %{public}@", v8, v9, v10, v11, 2u);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_455_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 88);
  id v4 = a2;
  uint64_t v5 = [v2 numberWithUnsignedInteger:v3];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_24C484000, v6, v7, "%s @%d: Calibration download for ASA key #%{public}@ failed: %{public}@", v8, v9, v10, v11, 2u);
}

void __78__CRXFLitePrescriptionRecordCollector_fetchPrescriptionRecordsWithCompletion___block_invoke_456_cold_1(void *a1, void *a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24C484000, v6, v7, "%s @%d: %{public}@ enrollment records collected", v8, v9, v10, v11, 2u);
}

- (void)prescriptionRecordWithEnrollmentName:enrollmentDate:accPayload:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_24C484000, v0, OS_LOG_TYPE_ERROR, "%s @%d: Failed to decode ACC: %{public}@", (uint8_t *)v1, 0x1Cu);
}

@end