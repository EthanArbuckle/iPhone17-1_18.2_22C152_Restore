@interface CMHistoricalDataStore
- (BOOL)_setConfiguration:(id)a3;
- (BOOL)queryConfigurationFromDaemon;
- (BOOL)tokenSanityChecks;
- (CMHistoricalDataStore)init;
- (const)tableNameFromToken;
- (id).cxx_construct;
- (id)cardioTableNames;
- (id)coldDBPath;
- (id)mobilityTableNames;
- (id)parseCardioTypeFromSql:(sqlite3_stmt *)a3 datatype:(unint64_t)a4;
- (id)parseMobilityTypeFromSql:(sqlite3_stmt *)a3 dataype:(unint64_t)a4;
- (id)tableNameForCardioType:(unint64_t)a3;
- (id)tableNameForCurrentType:(unint64_t)a3;
- (id)tableNameForMobilityType:(unint64_t)a3;
- (id)tableNames;
- (int)isDbOpenAndValid;
- (int)populateArray:(id)a3 fromSql:(sqlite3_stmt *)a4 query:(id)a5;
- (unint64_t)getFirstRecordIdForTable:(const char *)a3;
- (unint64_t)getLastRecordIdForTable:(const char *)a3;
- (unint64_t)getPageSize;
- (unint64_t)getRecordIdForTable:(const char *)a3 ascending:(BOOL)a4;
- (void)_cacheTableNamesForToken:(id)a3;
- (void)cacheAllRecordIds;
- (void)closeDBConnection;
- (void)dealloc;
- (void)fetchCardioSamplesFrom:(double)a3 to:(double)a4 queryToken:(id)a5 withHandler:(id)a6;
- (void)fetchMobilitySamplesFrom:(double)a3 to:(double)a4 queryToken:(id)a5 withHandler:(id)a6;
- (void)initializeWithToken:(id)a3 type:(unint64_t)a4 start:(double)a5 end:(double)a6;
- (void)markCursorDone;
- (void)nextHistoricalFetchWithCount:(unint64_t)a3 withHandler:(id)a4;
- (void)resetToken;
@end

@implementation CMHistoricalDataStore

- (CMHistoricalDataStore)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)CMHistoricalDataStore;
  v2 = [(CMHistoricalDataStore *)&v4 init];
  if (v2)
  {
    v2->fConfiguration = 0;
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.HistoricalDatastore", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  objc_msgSend_resetToken(self, a2, v2);
  objc_msgSend_closeDBConnection(self, v4, v5);
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  sub_190421DA8((uint64_t *)&self->fLocationdConnection, 0);

  v6.receiver = self;
  v6.super_class = (Class)CMHistoricalDataStore;
  [(CMHistoricalDataStore *)&v6 dealloc];
}

- (BOOL)queryConfigurationFromDaemon
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->fConfiguration) {
    return 1;
  }
  sub_1902DD698("kCLConnectionMessageColdStorageQueryConfiguration", &v30);
  objc_super v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v4, v8, v5, v6, v7, 0);
  uint64_t v28 = v30;
  v29 = v31;
  if (v31) {
    atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v28, v10);
  if (v29) {
    sub_1902D8B58(v29);
  }
  if (!v12)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    v19 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_ERROR, "Failed to get reply dictionary", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      goto LABEL_30;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 == -1) {
      goto LABEL_16;
    }
    goto LABEL_39;
  }
  if (!objc_msgSend_objectForKeyedSubscript_(v12, v11, @"CMErrorMessage"))
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"CMColdStorageConfiguration");
    char v2 = objc_msgSend__setConfiguration_(self, v21, v20);
    goto LABEL_31;
  }
  v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"CMErrorMessage");
  if (objc_msgSend_intValue(v14, v15, v16) != 111)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    v22 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v12, v23, @"CMErrorMessage");
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v24;
      _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_ERROR, "Error fetching configuration: %{public}@", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 0)) {
      goto LABEL_30;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v12, v26, @"CMErrorMessage");
    int v32 = 138543362;
    uint64_t v33 = v27;
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore queryConfigurationFromDaemon]", "CoreLocation: %s\n", v18);
    goto LABEL_37;
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  v17 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_FAULT, "Missing entitlement: com.apple.locationd.cold-storage", buf, 2u);
  }
  if (!sub_1902D8400(115, 0)) {
    goto LABEL_30;
  }
  bzero(buf, 0x65CuLL);
  if (qword_1E929D9F8 != -1) {
LABEL_39:
  }
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
LABEL_16:
  LOWORD(v32) = 0;
  v18 = (char *)_os_log_send_and_compose_impl();
  sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore queryConfigurationFromDaemon]", "CoreLocation: %s\n", v18);
LABEL_37:
  if (v18 != (char *)buf) {
    free(v18);
  }
LABEL_30:
  char v2 = 0;
LABEL_31:
  if (v31) {
    sub_1902D8B58(v31);
  }
  return v2;
}

- (void)fetchCardioSamplesFrom:(double)a3 to:(double)a4 queryToken:(id)a5 withHandler:(id)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (!a6)
  {
    v52 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, @"CMHistoricalDataStore.mm", 140, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  v11 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v78 = a3;
    __int16 v79 = 2048;
    double v80 = a4;
    __int16 v81 = 2112;
    double v82 = *(double *)&a5;
    _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Fetching cardio samples from: %f to: %f. Received token: %@", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    int v71 = 134218498;
    double v72 = a3;
    __int16 v73 = 2048;
    double v74 = a4;
    __int16 v75 = 2112;
    double v76 = *(double *)&a5;
    v54 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v54);
    if (v54 != (char *)buf) {
      free(v54);
    }
  }
  v12 = objc_alloc_init(CMHistoricalCardioSamples);
  v13 = (void *)MEMORY[0x192FCD2F0]();
  if ((objc_msgSend_queryConfigurationFromDaemon(self, v14, v15) & 1) == 0)
  {
    uint64_t v69 = *MEMORY[0x1E4F28568];
    v70 = @"Failed to get datastore configuration";
    uint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v70, &v69, 1);
    uint64_t v37 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v39, 103, v38);
LABEL_27:
    (*((void (**)(id, CMHistoricalCardioSamples *, void, uint64_t, uint64_t))a6 + 2))(a6, v12, 0, 1, v37);
    goto LABEL_28;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v20 = Current;
  if (a4 <= a3 || Current < a3)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    v40 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      double v78 = a3;
      __int16 v79 = 2048;
      double v80 = a4;
      __int16 v81 = 2048;
      double v82 = v20;
      _os_log_impl(&dword_1902AF000, v40, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid timestamps start:%f,end:%f,now:%f", buf, 0x20u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      int v71 = 134218496;
      double v72 = a3;
      __int16 v73 = 2048;
      double v74 = a4;
      __int16 v75 = 2048;
      double v76 = v20;
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v55);
      if (v55 != (char *)buf) {
        free(v55);
      }
    }
    uint64_t v67 = *MEMORY[0x1E4F28568];
    v68 = @"Invalid timestamps.";
    uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v41, (uint64_t)&v68, &v67, 1);
LABEL_26:
    uint64_t v37 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v43, 107, v42);
    goto LABEL_27;
  }
  int isDbOpenAndValid = objc_msgSend_isDbOpenAndValid(self, v17, v18);
  if (!isDbOpenAndValid)
  {
    objc_msgSend_initializeWithToken_type_start_end_(self, v22, (uint64_t)a5, 0, a3, a4);
    if (objc_msgSend_tokenSanityChecks(self, v44, v45))
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = sub_190422C44;
      v62[3] = &unk_1E568D140;
      v62[5] = self;
      v62[6] = a6;
      v62[4] = v12;
      objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v46, 0, v62);
      goto LABEL_28;
    }
    uint64_t v63 = *MEMORY[0x1E4F28568];
    v64 = @"Invalid token.";
    uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v46, (uint64_t)&v64, &v63, 1);
    goto LABEL_26;
  }
  int v24 = isDbOpenAndValid;
  v25 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v22, v23);
  uint64_t v28 = objc_msgSend_coldDBPath(self, v26, v27);
  if (objc_msgSend_fileExistsAtPath_(v25, v29, v28))
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v30 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(double *)&uint64_t v33 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v31, v32));
      *(_DWORD *)buf = 138478083;
      double v78 = *(double *)&v33;
      __int16 v79 = 1026;
      LODWORD(v80) = v24;
      _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Unable to open file at path %{private}@; return code %{public}d",
        buf,
        0x12u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      int v71 = 138478083;
      double v72 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v56, v57));
      __int16 v73 = 1026;
      LODWORD(v74) = v24;
      v58 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v58);
      if (v58 != (char *)buf) {
        free(v58);
      }
    }
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v66 = @"Unable to access datastore. Is the device locked?";
    uint64_t v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v34, (uint64_t)&v66, &v65, 1);
    uint64_t v37 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v36, 109, v35);
    goto LABEL_27;
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  v47 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
  {
    *(double *)&uint64_t v50 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v48, v49));
    *(_DWORD *)buf = 138478083;
    double v78 = *(double *)&v50;
    __int16 v79 = 1026;
    LODWORD(v80) = v24;
    _os_log_impl(&dword_1902AF000, v47, OS_LOG_TYPE_ERROR, "[HistoricalFetch] No file found at path %{private}@; return code %{public}d",
      buf,
      0x12u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    int v71 = 138478083;
    double v72 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v59, v60));
    __int16 v73 = 1026;
    LODWORD(v74) = v24;
    v61 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchCardioSamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v61);
    if (v61 != (char *)buf) {
      free(v61);
    }
  }
  (*((void (**)(id, CMHistoricalCardioSamples *, void, uint64_t, void))a6 + 2))(a6, v12, 0, 1, 0);
LABEL_28:
}

- (void)fetchMobilitySamplesFrom:(double)a3 to:(double)a4 queryToken:(id)a5 withHandler:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (!a6)
  {
    uint64_t v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, self, @"CMHistoricalDataStore.mm", 249, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  v11 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    double v65 = a3;
    __int16 v66 = 2048;
    double v67 = a4;
    __int16 v68 = 2112;
    double v69 = *(double *)&a5;
    _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Fetching mobility samples from: %f to: %f. Received token: %@", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    int v58 = 134218498;
    double v59 = a3;
    __int16 v60 = 2048;
    double v61 = a4;
    __int16 v62 = 2112;
    double v63 = *(double *)&a5;
    v44 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore fetchMobilitySamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v44);
    if (v44 != (char *)buf) {
      free(v44);
    }
  }
  v12 = objc_alloc_init(CMHistoricalMobilitySamples);
  v13 = (void *)MEMORY[0x192FCD2F0]();
  if (objc_msgSend_queryConfigurationFromDaemon(self, v14, v15))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v20 = Current;
    if (a4 <= a3 || Current < a3)
    {
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      v34 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        double v65 = a3;
        __int16 v66 = 2048;
        double v67 = a4;
        __int16 v68 = 2048;
        double v69 = v20;
        _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid timestamps start:%f,end:%f,now:%f", buf, 0x20u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
        }
        int v58 = 134218496;
        double v59 = a3;
        __int16 v60 = 2048;
        double v61 = a4;
        __int16 v62 = 2048;
        double v63 = v20;
        uint64_t v45 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchMobilitySamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v45);
        if (v45 != (char *)buf) {
          free(v45);
        }
      }
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v55 = @"Invalid timestamps.";
      uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)&v55, &v54, 1);
    }
    else
    {
      int isDbOpenAndValid = objc_msgSend_isDbOpenAndValid(self, v17, v18);
      if (isDbOpenAndValid)
      {
        int v23 = isDbOpenAndValid;
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
        }
        int v24 = qword_1E929DA00;
        if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
        {
          *(double *)&uint64_t v27 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v25, v26));
          *(_DWORD *)buf = 138478083;
          double v65 = *(double *)&v27;
          __int16 v66 = 1026;
          LODWORD(v67) = v23;
          _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Unable to open file at path %{private}@; return code %{public}d",
            buf,
            0x12u);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D9F8 != -1) {
            dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
          }
          int v58 = 138478083;
          double v59 = COERCE_DOUBLE(objc_msgSend_coldDBPath(self, v46, v47));
          __int16 v60 = 1026;
          LODWORD(v61) = v23;
          v48 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore fetchMobilitySamplesFrom:to:queryToken:withHandler:]", "CoreLocation: %s\n", v48);
          if (v48 != (char *)buf) {
            free(v48);
          }
        }
        uint64_t v52 = *MEMORY[0x1E4F28568];
        v53 = @"Unable to access datastore. Is the device locked?";
        uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)&v53, &v52, 1);
        uint64_t v31 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v30, 109, v29);
        goto LABEL_26;
      }
      objc_msgSend_initializeWithToken_type_start_end_(self, v22, (uint64_t)a5, 1, a3, a4);
      if (objc_msgSend_tokenSanityChecks(self, v38, v39))
      {
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = sub_1904239D4;
        v49[3] = &unk_1E568D140;
        v49[5] = self;
        v49[6] = a6;
        v49[4] = v12;
        objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v40, 0, v49);
        goto LABEL_27;
      }
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51 = @"Invalid token.";
      uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)&v51, &v50, 1);
    }
    uint64_t v31 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v37, 107, v36);
  }
  else
  {
    uint64_t v56 = *MEMORY[0x1E4F28568];
    uint64_t v57 = @"Failed to get datastore configuration";
    uint64_t v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v57, &v56, 1);
    uint64_t v31 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v33, 103, v32);
  }
LABEL_26:
  (*((void (**)(id, CMHistoricalMobilitySamples *, void, uint64_t, uint64_t))a6 + 2))(a6, v12, 0, 1, v31);
LABEL_27:
}

- (void)nextHistoricalFetchWithCount:(unint64_t)a3 withHandler:(id)a4
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  uint64_t v7 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEBUG))
  {
    uint64_t Type = objc_msgSend_fetchType(self->fToken, v8, v9);
    v11 = "Mobility";
    if (!Type) {
      v11 = "Cardio";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)v163 = v11;
    *(_WORD *)&v163[8] = 2048;
    *(void *)&v163[10] = a3;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEBUG, "[HistoricalFetch] Next %s fetch with count: %lu", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v133 = objc_msgSend_fetchType(self->fToken, v131, v132);
    v134 = "Mobility";
    if (!v133) {
      v134 = "Cardio";
    }
    int v154 = 136315394;
    *(void *)v155 = v134;
    *(_WORD *)&v155[8] = 2048;
    *(void *)&v155[10] = a3;
    v135 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v135);
    if (v135 != (char *)buf) {
      free(v135);
    }
  }
  int isDbOpenAndValid = objc_msgSend_isDbOpenAndValid(self, v12, v13);
  if (isDbOpenAndValid)
  {
    int v17 = isDbOpenAndValid;
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v18 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend_coldDBPath(self, v19, v20);
      *(_DWORD *)buf = 138478083;
      *(void *)v163 = v21;
      *(_WORD *)&v163[8] = 1026;
      *(_DWORD *)&v163[10] = v17;
      _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Unable to open file at path %{private}@; return code %{public}d",
        buf,
        0x12u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      int v154 = 138478083;
      *(void *)v155 = objc_msgSend_coldDBPath(self, v136, v137);
      *(_WORD *)&v155[8] = 1026;
      *(_DWORD *)&v155[10] = v17;
      v138 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v138);
      if (v138 != (char *)buf) {
        free(v138);
      }
    }
    uint64_t v160 = *MEMORY[0x1E4F28568];
    v161 = @"Unable to access datastore. Is the device locked?";
    uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)&v161, &v160, 1);
    uint64_t v25 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v24, 109, v23);
LABEL_32:
    uint64_t v77 = v25;
    double v78 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((void *)a4 + 2);
    id v79 = a4;
    id v80 = 0;
LABEL_33:
    uint64_t v81 = 0;
    uint64_t v82 = 1;
LABEL_34:
    v78(v79, v80, v81, v82, v77);
    return;
  }
  if (!self->fToken || !self->fDb)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    __int16 v73 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v73, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid DB or token", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      LOWORD(v154) = 0;
      v139 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v139);
      if (v139 != (char *)buf) {
        free(v139);
      }
    }
    uint64_t v158 = *MEMORY[0x1E4F28568];
    v159 = @"Unexpected invalidation.";
    uint64_t v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v74, (uint64_t)&v159, &v158, 1);
    uint64_t v25 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v76, 107, v75);
    goto LABEL_32;
  }
  uint64_t v26 = objc_msgSend_tableNames(self, v15, v16);
  if (objc_msgSend_count(v26, v27, v28) <= a3)
  {
    double v78 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((void *)a4 + 2);
    id v79 = a4;
    id v80 = 0;
    uint64_t v81 = 0;
    uint64_t v82 = 1;
    goto LABEL_36;
  }
  uint64_t v31 = objc_msgSend_tables(self->fToken, v29, v30);
  if (!objc_msgSend_count(v31, v32, v33))
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v83 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v83, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: No tables in token", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      LOWORD(v154) = 0;
      v140 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v140);
      if (v140 != (char *)buf) {
        free(v140);
      }
    }
    uint64_t v156 = *MEMORY[0x1E4F28568];
    v157 = @"Empty token.";
    uint64_t v85 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v84, (uint64_t)&v157, &v156, 1);
    uint64_t v25 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v86, 112, v85);
    goto LABEL_32;
  }
  uint64_t v36 = objc_msgSend_tables(self->fToken, v34, v35);
  Object = objc_msgSend_firstObject(v36, v37, v38);
  uint64_t v42 = (unsigned char *)objc_msgSend_tableNameFromToken(self, v40, v41);
  if (*v42)
  {
    uint64_t v45 = (uint64_t)v42;
    if (!objc_msgSend_cachedLastRecordId(Object, v43, v44) || !objc_msgSend_recordId(Object, v46, v47))
    {
      uint64_t FirstRecordIdForTable = objc_msgSend_getFirstRecordIdForTable_(self, v46, v45);
      objc_msgSend_setRecordId_(Object, v49, FirstRecordIdForTable);
    }
    uint64_t LastRecordIdForTable = objc_msgSend_getLastRecordIdForTable_(self, v46, v45);
    objc_msgSend_setCachedLastRecordId_(Object, v51, LastRecordIdForTable);
    unint64_t v54 = objc_msgSend_recordId(Object, v52, v53);
    if (v54 >= objc_msgSend_cachedLastRecordId(Object, v55, v56))
    {
      objc_msgSend_markCursorDone(self, v57, v58);
      v146[0] = MEMORY[0x1E4F143A8];
      v146[1] = 3221225472;
      v146[2] = sub_190424D6C;
      v146[3] = &unk_1E568D168;
      v146[4] = a4;
      objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v88, a3 + 1, v146);
    }
    else
    {
      uint64_t v144 = v45;
      ppStmt = 0;
      uint64_t PageSize = objc_msgSend_getPageSize(self, v57, v58);
      __int16 v60 = NSString;
      uint64_t v63 = objc_msgSend_recordId(Object, v61, v62);
      unint64_t v66 = objc_msgSend_recordId(Object, v64, v65) + PageSize;
      if (v66 >= objc_msgSend_cachedLastRecordId(Object, v67, v68)) {
        uint64_t RecordId = objc_msgSend_cachedLastRecordId(Object, v69, v70);
      }
      else {
        uint64_t RecordId = objc_msgSend_recordId(Object, v69, v70) + PageSize;
      }
      v89 = objc_msgSend_stringWithFormat_(v60, v72, @"SELECT * FROM %s WHERE id > %lu AND id <= %lu ORDER BY id ASC", v144, v63, RecordId);
      fDb = self->fDb;
      v93 = (const char *)objc_msgSend_UTF8String(v89, v91, v92);
      int v94 = sqlite3_prepare_v2(fDb, v93, -1, &ppStmt, 0);
      if (v94)
      {
        int v95 = v94;
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
        }
        v96 = qword_1E929DA00;
        if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109635;
          *(_DWORD *)v163 = v95;
          *(_WORD *)&v163[4] = 2113;
          *(void *)&v163[6] = v89;
          *(_WORD *)&v163[14] = 2082;
          *(void *)&v163[16] = v144;
          _os_log_impl(&dword_1902AF000, v96, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error %d preparing SQLite statement: %{private}@, table: %{public}s", buf, 0x1Cu);
        }
        if (sub_1902D8400(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D9F8 != -1) {
            dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
          }
          int v154 = 67109635;
          *(_DWORD *)v155 = v95;
          *(_WORD *)&v155[4] = 2113;
          *(void *)&v155[6] = v89;
          *(_WORD *)&v155[14] = 2082;
          *(void *)&v155[16] = v144;
          v141 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v141);
          if (v141 != (char *)buf) {
            free(v141);
          }
        }
        uint64_t v152 = *MEMORY[0x1E4F28568];
        v153 = @"Unknown database error.";
        uint64_t v98 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v97, (uint64_t)&v153, &v152, 1);
        uint64_t v25 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v99, 103, v98);
        goto LABEL_32;
      }
      id v100 = (id)objc_opt_new();
      int v102 = objc_msgSend_populateArray_fromSql_query_(self, v101, (uint64_t)v100, ppStmt, v89);
      if (v102 == 101)
      {
        int v103 = sqlite3_finalize(ppStmt);
        if (v103)
        {
          int v106 = v103;
          if (qword_1E929D9F8 != -1) {
            dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
          }
          v107 = qword_1E929DA00;
          if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67240450;
            *(_DWORD *)v163 = v106;
            *(_WORD *)&v163[4] = 2082;
            *(void *)&v163[6] = v144;
            _os_log_impl(&dword_1902AF000, v107, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error finalizing SQLite statement: %{public}d, table: %{public}s", buf, 0x12u);
          }
          if (sub_1902D8400(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D9F8 != -1) {
              dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
            }
            int v154 = 67240450;
            *(_DWORD *)v155 = v106;
            *(_WORD *)&v155[4] = 2082;
            *(void *)&v155[6] = v144;
            v143 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v143);
            if (v143 != (char *)buf) {
              free(v143);
            }
          }
          uint64_t v148 = *MEMORY[0x1E4F28568];
          v149 = @"Unknown database error.";
          uint64_t v109 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v108, (uint64_t)&v149, &v148, 1);
          uint64_t v77 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v110, 103, v109);
          double v78 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((void *)a4 + 2);
          id v79 = a4;
          id v80 = v100;
          goto LABEL_33;
        }
        v119 = objc_msgSend_tables(self->fToken, v104, v105);
        objc_msgSend_setObject_atIndexedSubscript_(v119, v120, (uint64_t)Object, 0);
        uint64_t v123 = objc_msgSend_datatype(Object, v121, v122);
        unint64_t v126 = objc_msgSend_recordId(Object, v124, v125);
        if (v126 >= objc_msgSend_cachedLastRecordId(Object, v127, v128)) {
          objc_msgSend_markCursorDone(self, v129, v130);
        }
        double v78 = (void (*)(id, id, uint64_t, uint64_t, uint64_t))*((void *)a4 + 2);
        id v79 = a4;
        id v80 = v100;
        uint64_t v81 = v123;
        uint64_t v82 = 0;
LABEL_36:
        uint64_t v77 = 0;
        goto LABEL_34;
      }
      int v111 = v102;
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      v112 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v163 = v111;
        *(_WORD *)&v163[4] = 2082;
        *(void *)&v163[6] = v144;
        _os_log_impl(&dword_1902AF000, v112, OS_LOG_TYPE_ERROR, "[HistoricalFetch] SQLite error: %{public}d, table: %{public}s", buf, 0x12u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
        }
        int v154 = 67240450;
        *(_DWORD *)v155 = v111;
        *(_WORD *)&v155[4] = 2082;
        *(void *)&v155[6] = v144;
        v142 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore nextHistoricalFetchWithCount:withHandler:]", "CoreLocation: %s\n", v142);
        if (v142 != (char *)buf) {
          free(v142);
        }
      }
      uint64_t v150 = *MEMORY[0x1E4F28568];
      v151 = @"Unknown database error.";
      uint64_t v114 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v113, (uint64_t)&v151, &v150, 1);
      uint64_t v116 = objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, v115, 103, v114);
      objc_msgSend_removeAllObjects(v100, v117, v118);
      (*((void (**)(id, id, void, uint64_t, uint64_t))a4 + 2))(a4, v100, 0, 1, v116);
    }
  }
  else
  {
    objc_msgSend_markCursorDone(self, v43, v44);
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = sub_190424D5C;
    v147[3] = &unk_1E568D168;
    v147[4] = a4;
    objc_msgSend_nextHistoricalFetchWithCount_withHandler_(self, v87, a3 + 1, v147);
  }
}

- (int)populateArray:(id)a3 fromSql:(sqlite3_stmt *)a4 query:(id)a5
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend_tables(self->fToken, a2, (uint64_t)a3);
  v11 = objc_msgSend_objectAtIndexedSubscript_(v9, v10, 0);
  uint64_t v14 = objc_msgSend_recordId(v11, v12, v13);
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v18 = objc_msgSend_tables(self->fToken, v16, v17);
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, 0);
  int v23 = sqlite3_step(a4);
  if (v23 != 100) {
    goto LABEL_11;
  }
  do
  {
    int v24 = sqlite3_column_int(a4, 0);
    uint64_t Type = objc_msgSend_fetchType(self->fToken, v25, v26);
    if (Type == 1)
    {
      uint64_t v34 = objc_msgSend_datatype(v20, v28, v29);
      uint64_t v32 = objc_msgSend_parseMobilityTypeFromSql_dataype_(self, v35, (uint64_t)a4, v34);
      goto LABEL_6;
    }
    if (!Type)
    {
      uint64_t v30 = objc_msgSend_datatype(v20, v28, v29);
      uint64_t v32 = objc_msgSend_parseCardioTypeFromSql_datatype_(self, v31, (uint64_t)a4, v30);
LABEL_6:
      objc_msgSend_addObject_(a3, v33, v32);
      goto LABEL_8;
    }
    objc_msgSend_addObject_(a3, v28, 0);
LABEL_8:
    int v36 = sqlite3_step(a4);
  }
  while (v36 == 100);
  int v23 = v36;
  if (v24)
  {
    objc_msgSend_setRecordId_(v20, v21, v24);
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v37 = objc_msgSend_recordId(v20, v21, v22);
  objc_msgSend_setRecordId_(v20, v38, v37);
LABEL_12:
  if (v23 == 101)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v39 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_INFO, "[HistoricalFetch] Constructed results.", buf, 2u);
    }
    if (!sub_1902D8400(115, 2)) {
      goto LABEL_27;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    v40 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore populateArray:fromSql:query:]", "CoreLocation: %s\n", v40);
    if (v40 == (char *)buf) {
      goto LABEL_27;
    }
LABEL_38:
    free(v40);
    goto LABEL_27;
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  uint64_t v41 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
  {
    uint64_t v44 = objc_msgSend_datatype(v20, v42, v43);
    *(_DWORD *)buf = 67240450;
    int v71 = v23;
    __int16 v72 = 2114;
    __int16 v73 = (const char *)objc_msgSend_tableNameForCurrentType_(self, v45, v44);
    _os_log_impl(&dword_1902AF000, v41, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error constructing results. SQL return code: %{public}d, table:%{public}@", buf, 0x12u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v68 = objc_msgSend_datatype(v20, v66, v67);
    objc_msgSend_tableNameForCurrentType_(self, v69, v68);
    v40 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore populateArray:fromSql:query:]", "CoreLocation: %s\n", v40);
    if (v40 != (char *)buf) {
      goto LABEL_38;
    }
  }
LABEL_27:
  double v46 = CFAbsoluteTimeGetCurrent();
  uint64_t v49 = objc_msgSend_tables(self->fToken, v47, v48);
  v51 = objc_msgSend_objectAtIndexedSubscript_(v49, v50, 0);
  uint64_t v54 = objc_msgSend_recordId(v51, v52, v53);
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  v55 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend_fetchType(self->fToken, v56, v57)) {
      __int16 v60 = "Mobility";
    }
    else {
      __int16 v60 = "Cardio";
    }
    int v61 = objc_msgSend_count(a3, v58, v59);
    uint64_t v64 = objc_msgSend_tableNameFromToken(self, v62, v63);
    *(_DWORD *)buf = 68291586;
    int v71 = 0;
    __int16 v72 = 2082;
    __int16 v73 = "";
    __int16 v74 = 2082;
    uint64_t v75 = v60;
    __int16 v76 = 2050;
    double v77 = v46 - Current;
    __int16 v78 = 1026;
    int v79 = v61;
    __int16 v80 = 2050;
    double v81 = Current;
    __int16 v82 = 2050;
    double v83 = v46;
    __int16 v84 = 1026;
    int v85 = v23;
    __int16 v86 = 2082;
    uint64_t v87 = v64;
    __int16 v88 = 2050;
    uint64_t v89 = v14;
    __int16 v90 = 2050;
    uint64_t v91 = v54;
    __int16 v92 = 2114;
    id v93 = a5;
    _os_log_impl(&dword_1902AF000, v55, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"[HistoricalFetch] Query complete\", \"type\":%{public, location:escape_only}s, \"duration\":\"%{public}f\", \"numSamples\":%{public}u, \"start\":\"%{public}f\", \"end\":\"%{public}f\", \"returnCode\":%{public}d, \"table\":%{public, location:escape_only}s, \"recordId (pre-query)\":%{public}lu, \"recordId (post-query)\":%{public}lu, \"query\":%{public, location:escape_only}@}", buf, 0x6Eu);
  }
  return v23;
}

- (id)parseCardioTypeFromSql:(sqlite3_stmt *)a3 datatype:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case 0uLL:
      objc_msgSend_inputFromPreparedStatement_(CMPedestrianGrade, a2, (uint64_t)a3);
      objc_super v4 = [CMPedestrianGrade alloc];
      long long v27 = v31;
      uint64_t v28 = v32;
      uint64_t v6 = objc_msgSend_initWithSample_(v4, v5, (uint64_t)&v27, v22, v23, v24, v25);
      goto LABEL_11;
    case 1uLL:
      objc_msgSend_inputFromPreparedStatement_(CMRecoveryHeartRate, a2, (uint64_t)a3);
      v8 = [CMRecoveryHeartRate alloc];
      v26[0] = v31;
      v26[1] = v32;
      uint64_t v6 = objc_msgSend_initWithSample_(v8, v9, (uint64_t)v26, v22, v23, v24, v25);
      goto LABEL_11;
    case 2uLL:
      objc_msgSend_inputFromPreparedStatement_(CMWorkoutPhysicalEffort, a2, (uint64_t)a3);
      uint64_t v10 = [CMWorkoutPhysicalEffort alloc];
      uint64_t v6 = objc_msgSend_initWithSample_(v10, v11, (uint64_t)&v22, (void)v31, *((void *)&v31 + 1), (void)v32, *((void *)&v32 + 1), (void)v33, *((void *)&v33 + 1), (void)v34);
      goto LABEL_11;
    case 3uLL:
      objc_msgSend_inputFromPreparedStatement_(CMRecoverySession, a2, (uint64_t)a3);
      v12 = [CMRecoverySession alloc];
      v46[6] = v37;
      v46[7] = v38;
      v46[8] = v39;
      v46[9] = v40;
      v46[2] = v33;
      v46[3] = v34;
      v46[4] = v35;
      v46[5] = v36;
      v46[0] = v31;
      v46[1] = v32;
      uint64_t v6 = objc_msgSend_initWithSample_(v12, v13, (uint64_t)v46, v22, v23, v24, v25);
      goto LABEL_11;
    case 4uLL:
      objc_msgSend_inputFromPreparedStatement_(CMVO2MaxInputs, a2, (uint64_t)a3);
      uint64_t v14 = [CMVO2MaxInputs alloc];
      v45[4] = v35;
      v45[5] = v36;
      v45[6] = v37;
      v45[0] = v31;
      v45[1] = v32;
      v45[2] = v33;
      v45[3] = v34;
      uint64_t v6 = objc_msgSend_initWithSample_(v14, v15, (uint64_t)v45, v22, v23, v24, v25);
      goto LABEL_11;
    case 5uLL:
      objc_msgSend_inputFromPreparedStatement_(CMCardioFitnessResults, a2, (uint64_t)a3);
      uint64_t v16 = [CMCardioFitnessResults alloc];
      v44[6] = v37;
      v44[7] = v38;
      v44[8] = v39;
      v44[2] = v33;
      v44[3] = v34;
      v44[4] = v35;
      v44[5] = v36;
      v44[0] = v31;
      v44[1] = v32;
      uint64_t v6 = objc_msgSend_initWithSample_(v16, v17, (uint64_t)v44, v22, v23, v24, v25);
      goto LABEL_11;
    case 6uLL:
      objc_msgSend_inputFromPreparedStatement_(CMCardioFitnessInputsSessionMetrics, a2, (uint64_t)a3);
      uint64_t v18 = [CMCardioFitnessInputsSessionMetrics alloc];
      v43[2] = v33;
      v43[3] = v34;
      v43[4] = v35;
      v43[0] = v31;
      v43[1] = v32;
      uint64_t v6 = objc_msgSend_initWithSample_(v18, v19, (uint64_t)v43, v22, v23, v24, v25);
      goto LABEL_11;
    case 7uLL:
      objc_msgSend_inputFromPreparedStatement_(CMCardioFitnessSummary, a2, (uint64_t)a3);
      uint64_t v20 = [CMCardioFitnessSummary alloc];
      v29[8] = v39;
      v29[9] = v40;
      v29[10] = v41;
      uint64_t v30 = v42;
      v29[4] = v35;
      v29[5] = v36;
      v29[6] = v37;
      v29[7] = v38;
      v29[0] = v31;
      v29[1] = v32;
      v29[2] = v33;
      v29[3] = v34;
      uint64_t v6 = objc_msgSend_initWithSample_(v20, v21, (uint64_t)v29, v22, v23, v24, v25);
LABEL_11:
      id result = v6;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)parseMobilityTypeFromSql:(sqlite3_stmt *)a3 dataype:(unint64_t)a4
{
  uint64_t v43 = v4;
  uint64_t v44 = v5;
  uint64_t v45 = v6;
  switch(a4)
  {
    case 0uLL:
      objc_msgSend_inputFromPreparedStatement_(CMWalkingBoutMobilityMetrics, a2, (uint64_t)a3);
      v8 = [CMWalkingBoutMobilityMetrics alloc];
      v28[10] = v39;
      v28[11] = v40;
      v28[12] = v41;
      v28[13] = v42;
      v28[6] = v35;
      v28[7] = v36;
      v28[8] = v37;
      v28[9] = v38;
      v28[2] = v31;
      v28[3] = v32;
      v28[4] = v33;
      v28[5] = v34;
      v28[0] = v29;
      v28[1] = v30;
      uint64_t v10 = objc_msgSend_initWithSample_(v8, v9, (uint64_t)v28);
      goto LABEL_9;
    case 1uLL:
      objc_msgSend_inputFromPreparedStatement_(CMPredictedDistanceBout, a2, (uint64_t)a3);
      v12 = [CMPredictedDistanceBout alloc];
      v26[4] = v33;
      v26[5] = v34;
      v26[6] = v35;
      uint64_t v27 = v36;
      v26[0] = v29;
      v26[1] = v30;
      _OWORD v26[2] = v31;
      v26[3] = v32;
      uint64_t v10 = objc_msgSend_initWithSample_(v12, v13, (uint64_t)v26);
      goto LABEL_9;
    case 2uLL:
      objc_msgSend_inputFromPreparedStatement_(CMSmoothGaitMetrics, a2, (uint64_t)a3);
      uint64_t v14 = [CMSmoothGaitMetrics alloc];
      v25[0] = v29;
      v25[1] = v30;
      v25[2] = v31;
      uint64_t v10 = objc_msgSend_initWithSample_(v14, v15, (uint64_t)v25);
      goto LABEL_9;
    case 3uLL:
      uint64_t v16 = sqlite3_column_int(a3, 0);
      objc_msgSend_inputFromPreparedStatement_(CMPredictedDistanceBoutMobilityCalibration, v17, (uint64_t)a3);
      uint64_t v18 = [CMPredictedDistanceBoutMobilityCalibration alloc];
      v24[0] = v29;
      v24[1] = v30;
      v24[2] = v31;
      uint64_t v10 = objc_msgSend_initWithSample_recordId_(v18, v19, (uint64_t)v24, v16);
      goto LABEL_9;
    case 4uLL:
      *(void *)&long long v36 = 0;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
      objc_msgSend_inputFromPreparedStatement_(CMStrideCalibrationEntry, a2, (uint64_t)a3);
      uint64_t v20 = [CMStrideCalibrationEntry alloc];
      v22[4] = v33;
      v22[5] = v34;
      v22[6] = v35;
      uint64_t v23 = v36;
      v22[0] = v29;
      v22[1] = v30;
      v22[2] = v31;
      v22[3] = v32;
      uint64_t v10 = objc_msgSend_initWithCLStrideCalEntry_(v20, v21, (uint64_t)v22);
LABEL_9:
      id result = v10;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (int)isDbOpenAndValid
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_fDb = &self->fDb;
  if (self->fDb) {
    return 0;
  }
  objc_msgSend_closeDBConnection(self, a2, v2);
  v8 = objc_msgSend_coldDBPath(self, v6, v7);
  v11 = (const char *)objc_msgSend_UTF8String(v8, v9, v10);
  int v4 = sqlite3_open_v2(v11, p_fDb, 131073, 0);
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  v12 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    uint64_t v20 = objc_msgSend_coldDBPath(self, v13, v14);
    __int16 v21 = 1024;
    int v22 = v4;
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Opened DB at %{private}@ with rc %d", buf, 0x12u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    objc_msgSend_coldDBPath(self, v16, v17);
    uint64_t v18 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore isDbOpenAndValid]", "CoreLocation: %s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
  return v4;
}

- (BOOL)tokenSanityChecks
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_version(self->fToken, a2, v2) != 2)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v17 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend_version(self->fToken, v18, v19);
      *(_DWORD *)buf = 134217984;
      uint64_t v42 = v20;
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: unexpected token version %lu", buf, 0xCu);
    }
    int v21 = sub_1902D8400(115, 0);
    BOOL result = 0;
    if (!v21) {
      return result;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    objc_msgSend_version(self->fToken, v22, v23);
LABEL_21:
    long long v37 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore tokenSanityChecks]", "CoreLocation: %s\n", v37);
    if (v37 == (char *)buf) {
      return 0;
    }
LABEL_22:
    free(v37);
    return 0;
  }
  objc_msgSend_startTime(self->fToken, v4, v5);
  double v7 = v6;
  objc_msgSend_endTime(self->fToken, v8, v9);
  if (v7 >= v12)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    long long v24 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_startTime(self->fToken, v25, v26);
      uint64_t v28 = v27;
      objc_msgSend_endTime(self->fToken, v29, v30);
      *(_DWORD *)buf = 134349312;
      uint64_t v42 = v28;
      __int16 v43 = 2050;
      uint64_t v44 = v31;
      _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: invalid token timestamps, start:%{public}f end:%{public}f", buf, 0x16u);
    }
    int v32 = sub_1902D8400(115, 0);
    BOOL result = 0;
    if (!v32) {
      return result;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    objc_msgSend_startTime(self->fToken, v33, v34);
    objc_msgSend_endTime(self->fToken, v35, v36);
    goto LABEL_21;
  }
  uint64_t v13 = objc_msgSend_tables(self->fToken, v10, v11);
  if (objc_msgSend_count(v13, v14, v15)) {
    return 1;
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  long long v38 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
  {
    fToken = self->fToken;
    *(_DWORD *)buf = 138412290;
    uint64_t v42 = (uint64_t)fToken;
    _os_log_impl(&dword_1902AF000, v38, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: no mobility tables found in token: %@", buf, 0xCu);
  }
  int v40 = sub_1902D8400(115, 0);
  BOOL result = 0;
  if (v40)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    long long v37 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore tokenSanityChecks]", "CoreLocation: %s\n", v37);
    if (v37 == (char *)buf) {
      return 0;
    }
    goto LABEL_22;
  }
  return result;
}

- (void)initializeWithToken:(id)a3 type:(unint64_t)a4 start:(double)a5 end:(double)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v30 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v54 = *(double *)&a4;
      _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Generating new token for type=%lu", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      uint64_t v52 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore initializeWithToken:type:start:end:]", "CoreLocation: %s\n", v52);
      if (v52 != (char *)buf) {
        free(v52);
      }
    }
    if (a4)
    {
      if (a4 != 1)
      {
        fToken = self->fToken;
        goto LABEL_33;
      }
      long long v33 = objc_msgSend_mobilityToken(CMMobilityToken, v31, v32);
    }
    else
    {
      long long v33 = objc_msgSend_cardioToken(CMCardioToken, v31, v32);
    }
    fToken = v33;
    self->fToken = fToken;
LABEL_33:
    objc_msgSend_setStartTime_(fToken, v31, v32, a5);
    objc_msgSend_setEndTime_(self->fToken, v48, v49, a6);
    objc_msgSend_cacheAllRecordIds(self, v50, v51);
    return;
  }
  uint64_t v10 = self->fToken;
  if (v10)
  {
    objc_msgSend_startTime(v10, a2, (uint64_t)a3, a4);
    objc_msgSend_setStartTime_(a3, v11, v12);
    objc_msgSend_endTime(self->fToken, v13, v14);
    objc_msgSend_setEndTime_(a3, v15, v16);

    self->fToken = 0;
  }
  uint64_t v17 = (CMHistoricalFetchToken *)a3;
  self->fToken = v17;
  double v20 = fabs(a6);
  if (fabs(a5) == INFINITY && v20 == INFINITY)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v34 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_startTime(self->fToken, v35, v36);
      uint64_t v38 = v37;
      objc_msgSend_endTime(self->fToken, v39, v40);
      *(_DWORD *)buf = 134218752;
      double v54 = a5;
      __int16 v55 = 2048;
      double v56 = a6;
      __int16 v57 = 2048;
      uint64_t v58 = v38;
      __int16 v59 = 2048;
      uint64_t v60 = v41;
      _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_INFO, "[HistoricalFetch] #Warning: ignoring [%f,%f], persisting previous parameters (start=%f, end=%f)", buf, 0x2Au);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      objc_msgSend_startTime(self->fToken, v42, v43);
      objc_msgSend_endTime(self->fToken, v44, v45);
      double v46 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore initializeWithToken:type:start:end:]", "CoreLocation: %s\n", v46);
      if (v46 != (char *)buf) {
        free(v46);
      }
    }
  }
  else
  {
    objc_msgSend_startTime(v17, v18, v19, v20);
    if (v24 > a5)
    {
      objc_msgSend_startTime(self->fToken, v22, v23);
      a5 = v25;
    }
    objc_msgSend_setStartTime_(self->fToken, v22, v23, a5);
    uint64_t v28 = self->fToken;
    objc_msgSend_setEndTime_(v28, v26, v27, a6);
  }
}

- (unint64_t)getFirstRecordIdForTable:(const char *)a3
{
  return MEMORY[0x1F4181798](self, sel_getRecordIdForTable_ascending_, a3);
}

- (unint64_t)getLastRecordIdForTable:(const char *)a3
{
  return MEMORY[0x1F4181798](self, sel_getRecordIdForTable_ascending_, a3);
}

- (unint64_t)getRecordIdForTable:(const char *)a3 ascending:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!self->fDb)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v28 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v28, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error: DB invalid", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    LOWORD(v47) = 0;
    goto LABEL_71;
  }
  BOOL v4 = a4;
  ppStmt = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend_startTime(self->fToken, v8, v9);
  double v12 = Current + -63072000.0;
  if (v13 > Current + -63072000.0)
  {
    objc_msgSend_startTime(self->fToken, v10, v11);
    double v12 = v14;
  }
  objc_msgSend_endTime(self->fToken, v10, v11);
  if (v17 < Current)
  {
    objc_msgSend_endTime(self->fToken, v15, v16);
    double Current = v18;
  }
  if (v4) {
    uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v15, @"SELECT id FROM %s WHERE startTime >= %f AND startTime <= %f ORDER BY id %s LIMIT 1", a3, *(void *)&v12, *(void *)&Current, "ASC");
  }
  else {
    uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v15, @"SELECT id FROM %s WHERE startTime >= %f AND startTime <= %f ORDER BY id %s LIMIT 1", a3, *(void *)&v12, *(void *)&Current, "DESC");
  }
  int v22 = v19;
  fDb = self->fDb;
  double v24 = (const char *)objc_msgSend_UTF8String(v19, v20, v21);
  int v25 = sqlite3_prepare_v2(fDb, v24, -1, &ppStmt, 0);
  if (v25)
  {
    int v26 = v25;
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v27 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      uint64_t v52 = a3;
      __int16 v53 = 1024;
      *(_DWORD *)double v54 = v26;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v22;
      _os_log_impl(&dword_1902AF000, v27, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error on table %{private}s prepare statement (code=%d): %@", buf, 0x1Cu);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 == -1) {
      goto LABEL_70;
    }
LABEL_82:
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
LABEL_70:
    int v47 = 136381187;
    uint64_t v48 = a3;
    __int16 v49 = 1024;
    *(_DWORD *)uint64_t v50 = v26;
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v22;
LABEL_71:
    uint64_t v44 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n", v44);
    if (v44 != (char *)buf) {
      free(v44);
    }
    return 0;
  }
  int v29 = sqlite3_step(ppStmt);
  if ((v29 - 102) <= 0xFFFFFFFD)
  {
    int v26 = v29;
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v30 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      uint64_t v52 = a3;
      __int16 v53 = 1024;
      *(_DWORD *)double v54 = v26;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v22;
      _os_log_impl(&dword_1902AF000, v30, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error on table %{private}s step statement (code=%d): %@", buf, 0x1Cu);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 == -1) {
      goto LABEL_70;
    }
    goto LABEL_82;
  }
  int v33 = sqlite3_column_int(ppStmt, 0);
  if (v33 < 1)
  {
    if (v33)
    {
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      uint64_t v34 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v52 = a3;
        _os_log_impl(&dword_1902AF000, v34, OS_LOG_TYPE_ERROR, "[HistoricalFetch] %s: Invalid rowId", buf, 0xCu);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_49;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      int v47 = 136315138;
      uint64_t v48 = a3;
      long long v35 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n");
    }
    else
    {
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      uint64_t v36 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v52 = a3;
        _os_log_impl(&dword_1902AF000, v36, OS_LOG_TYPE_DEBUG, "[HistoricalFetch] %s: No records found", buf, 0xCu);
      }
      if (!sub_1902D8400(115, 2)) {
        goto LABEL_49;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      int v47 = 136315138;
      uint64_t v48 = a3;
      long long v35 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n");
    }
    if (v35 != buf) {
      free(v35);
    }
LABEL_49:
    unint64_t v31 = 0;
    goto LABEL_50;
  }
  unint64_t v31 = (v33 - v4);
LABEL_50:
  int v37 = sqlite3_finalize(ppStmt);
  if (v37)
  {
    int v38 = v37;
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    long long v39 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      uint64_t v52 = a3;
      __int16 v53 = 1024;
      *(_DWORD *)double v54 = v38;
      _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error on table %{private}s finalize (code=%d)", buf, 0x12u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      int v47 = 136380931;
      uint64_t v48 = a3;
      __int16 v49 = 1024;
      *(_DWORD *)uint64_t v50 = v38;
      uint64_t v45 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n", v45);
      if (v45 != (char *)buf) {
        free(v45);
      }
    }
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  uint64_t v40 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v41 = "last";
    *(_DWORD *)buf = 136315651;
    if (v4) {
      uint64_t v41 = "first";
    }
    uint64_t v52 = v41;
    __int16 v53 = 2048;
    *(void *)double v54 = v31;
    *(_WORD *)&v54[8] = 2081;
    *(void *)&v54[10] = a3;
    _os_log_impl(&dword_1902AF000, v40, OS_LOG_TYPE_DEBUG, "[HistoricalFetch] Caching %s record id %lu for table %{private}s", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v42 = "last";
    int v47 = 136315651;
    if (v4) {
      uint64_t v42 = "first";
    }
    uint64_t v48 = v42;
    __int16 v49 = 2048;
    *(void *)uint64_t v50 = v31;
    *(_WORD *)&v50[8] = 2081;
    *(void *)&v50[10] = a3;
    uint64_t v43 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore getRecordIdForTable:ascending:]", "CoreLocation: %s\n", v43);
    if (v43 != (char *)buf) {
      free(v43);
    }
  }
  return v31;
}

- (unint64_t)getPageSize
{
  return 50;
}

- (void)markCursorDone
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_msgSend_tables(self->fToken, a2, v2);
  uint64_t Object = objc_msgSend_firstObject(v4, v5, v6);
  objc_msgSend_addObject_(v4, v8, Object);
  objc_msgSend_removeObjectAtIndex_(v4, v9, 0);
  uint64_t v12 = objc_msgSend_tableNameFromToken(self, v10, v11);
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  double v13 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380675;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "[HistoricalFetch] Bumped token, next table:%{private}s", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    double v14 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore markCursorDone]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
}

- (void)cacheAllRecordIds
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  objc_msgSend_startTime(self->fToken, a2, v2);
  uint64_t v5 = v4;
  objc_msgSend_endTime(self->fToken, v6, v7);
  uint64_t v9 = v8;
  uint64_t v12 = objc_msgSend_tables(self->fToken, v10, v11);
  if (objc_msgSend_count(v12, v13, v14))
  {
    unint64_t v17 = 0;
    do
    {
      double v18 = objc_msgSend_tables(self->fToken, v15, v16);
      double v20 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, v17);
      uint64_t v23 = objc_msgSend_datatype(v20, v21, v22);
      uint64_t v25 = objc_msgSend_tableNameForCurrentType_(self, v24, v23);
      objc_msgSend_setTableName_(v20, v26, v25);
      int v29 = objc_msgSend_tableName(v20, v27, v28);
      uint64_t v32 = objc_msgSend_UTF8String(v29, v30, v31);
      uint64_t LastRecordIdForTable = objc_msgSend_getLastRecordIdForTable_(self, v33, v32);
      objc_msgSend_setCachedLastRecordId_(v20, v35, LastRecordIdForTable);
      ++v17;
      int v38 = objc_msgSend_tables(self->fToken, v36, v37);
    }
    while (objc_msgSend_count(v38, v39, v40) > v17);
  }
  if (qword_1E929D9F8 != -1) {
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
  }
  uint64_t v41 = qword_1E929DA00;
  if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v44 = v5;
    __int16 v45 = 2048;
    uint64_t v46 = v9;
    _os_log_impl(&dword_1902AF000, v41, OS_LOG_TYPE_INFO, "[HistoricalFetch] Cached all record ids from %f to %f", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v42 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore cacheAllRecordIds]", "CoreLocation: %s\n", v42);
    if (v42 != (char *)buf) {
      free(v42);
    }
  }
}

- (const)tableNameFromToken
{
  uint64_t Type = objc_msgSend_fetchType(self->fToken, a2, v2);
  uint64_t v7 = objc_msgSend_tables(self->fToken, v5, v6);
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, 0);
  uint64_t v13 = objc_msgSend_datatype(v9, v10, v11);
  if (Type) {
    uint64_t v14 = objc_msgSend_tableNameForMobilityType_(self, v12, v13);
  }
  else {
    uint64_t v14 = objc_msgSend_tableNameForCardioType_(self, v12, v13);
  }

  return (const char *)objc_msgSend_UTF8String(v14, v15, v16);
}

- (void)resetToken
{
  fToken = self->fToken;
  if (fToken) {

  }
  self->fToken = 0;
}

- (void)closeDBConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  fDb = self->fDb;
  if (fDb)
  {
    int v4 = sqlite3_close_v2(fDb);
    if (v4)
    {
      int v5 = v4;
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      uint64_t v6 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v9 = v5;
        _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_ERROR, "[HistoricalFetch] Error closing DB connection, return code: %d", buf, 8u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
        }
        uint64_t v7 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore closeDBConnection]", "CoreLocation: %s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
    }
  }
  self->fDb = 0;
}

- (id)tableNames
{
  id result = (id)objc_msgSend_fetchType(self->fToken, a2, v2);
  if (result == (id)1)
  {
    return (id)objc_msgSend_mobilityTableNames(self, v5, v6);
  }
  else if (!result)
  {
    return (id)objc_msgSend_cardioTableNames(self, v5, v6);
  }
  return result;
}

- (id)cardioTableNames
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->fConfiguration, a2, @"CMColdStorageCardioTableNames");
}

- (id)mobilityTableNames
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->fConfiguration, a2, @"CMColdStorageMobilityTableNames");
}

- (id)coldDBPath
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->fConfiguration, a2, @"CMColdStorageDatabasePath");
}

- (id)tableNameForMobilityType:(unint64_t)a3
{
  int v3 = a3;
  int v4 = objc_msgSend_mobilityTableNames(self, a2, a3);

  return (id)objc_msgSend_objectAtIndexedSubscript_(v4, v5, v3);
}

- (id)tableNameForCardioType:(unint64_t)a3
{
  int v3 = a3;
  int v4 = objc_msgSend_cardioTableNames(self, a2, a3);

  return (id)objc_msgSend_objectAtIndexedSubscript_(v4, v5, v3);
}

- (id)tableNameForCurrentType:(unint64_t)a3
{
  int v3 = a3;
  int v4 = objc_msgSend_tableNames(self, a2, a3);

  return (id)objc_msgSend_objectAtIndexedSubscript_(v4, v5, v3);
}

- (BOOL)_setConfiguration:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    int v29 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_ERROR, "Failed to get reply dictionary", buf, 2u);
    }
    int v30 = sub_1902D8400(115, 0);
    BOOL result = 0;
    if (!v30) {
      return result;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 == -1)
    {
LABEL_45:
      int v38 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalDataStore _setConfiguration:]", "CoreLocation: %s\n", v38);
      if (v38 != (char *)buf) {
        free(v38);
      }
      return 0;
    }
LABEL_56:
    dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    goto LABEL_45;
  }
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(a3, v5, @"CMColdStorageDatabasePath");
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(a3, v7, @"CMColdStorageMobilityTableNames");
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(a3, v9, @"CMColdStorageCardioTableNames");
  if (!v6
    || (uint64_t v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v31 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v42 = a3;
      _os_log_impl(&dword_1902AF000, v31, OS_LOG_TYPE_FAULT, "Malformed datastore configuration: %@. Ignoring and trying again.", buf, 0xCu);
    }
    int v32 = sub_1902D8400(115, 0);
    BOOL result = 0;
    if (!v32) {
      return result;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9F8 == -1) {
      goto LABEL_45;
    }
    goto LABEL_56;
  }
  if ((unint64_t)objc_msgSend_count(v11, v12, v13) >= 8
    && (unint64_t)objc_msgSend_count(v8, v14, v15) > 4)
  {
    if ((unint64_t)objc_msgSend_count(v11, v16, v17) > 8
      || (unint64_t)objc_msgSend_count(v8, v33, v34) >= 6)
    {
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      long long v35 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v35, OS_LOG_TYPE_DEFAULT, "#Warning: More tables available in configuration than are being collected.", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
        }
        uint64_t v40 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore _setConfiguration:]", "CoreLocation: %s\n", v40);
        if (v40 != (char *)buf) {
          free(v40);
        }
      }
    }
    self->fConfiguration = (NSDictionary *)a3;
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    uint64_t v36 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_DEFAULT))
    {
      fConfiguration = self->fConfiguration;
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v42 = fConfiguration;
      _os_log_impl(&dword_1902AF000, v36, OS_LOG_TYPE_DEFAULT, "Received datastore configuration: %@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      long long v39 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMHistoricalDataStore _setConfiguration:]", "CoreLocation: %s\n", v39);
      if (v39 != (char *)buf) {
        free(v39);
      }
    }
    return 1;
  }
  else
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
    }
    double v18 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240960;
      *(_DWORD *)uint64_t v42 = objc_msgSend_count(v11, v19, v20);
      *(_WORD *)&v42[4] = 1026;
      *(_DWORD *)&v42[6] = 8;
      __int16 v43 = 1026;
      int v44 = objc_msgSend_count(v8, v21, v22);
      __int16 v45 = 1026;
      int v46 = 5;
      _os_log_impl(&dword_1902AF000, v18, OS_LOG_TYPE_FAULT, "Invalid datastore configuration: Less than the expected number of tables. Cardio:%{public}d/%{public}d, Mobility=%{public}d/%{public}d", buf, 0x1Au);
    }
    int v23 = sub_1902D8400(115, 0);
    BOOL result = 0;
    if (v23)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFC1F60);
      }
      objc_msgSend_count(v11, v25, v26);
      objc_msgSend_count(v8, v27, v28);
      goto LABEL_45;
    }
  }
  return result;
}

- (void)_cacheTableNamesForToken:(id)a3
{
  int v5 = objc_msgSend_tables(a3, a2, (uint64_t)a3);
  if (objc_msgSend_count(v5, v6, v7))
  {
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = objc_msgSend_tables(a3, v8, v9);
      uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(v11, v12, v10);
      uint64_t Type = objc_msgSend_fetchType(a3, v14, v15);
      if (Type == 1) {
        break;
      }
      if (!Type)
      {
        uint64_t v19 = objc_msgSend_datatype(v13, v17, v18);
        uint64_t v21 = objc_msgSend_tableNameForCardioType_(self, v20, v19);
LABEL_7:
        objc_msgSend_setTableName_(v13, v22, v21);
      }
      ++v10;
      uint64_t v25 = objc_msgSend_tables(a3, v17, v18);
      if (objc_msgSend_count(v25, v26, v27) <= v10) {
        return;
      }
    }
    uint64_t v23 = objc_msgSend_datatype(v13, v17, v18);
    uint64_t v21 = objc_msgSend_tableNameForMobilityType_(self, v24, v23);
    goto LABEL_7;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end