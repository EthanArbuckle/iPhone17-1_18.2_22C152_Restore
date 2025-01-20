@interface CHPowerLogger
- (void)logModelInference:(unint64_t)a3 startTimestamp:(double)a4 endTimestamp:(double)a5 data:(id)a6;
- (void)logModelLoaded:(unint64_t)a3;
- (void)logModelUnloaded:(unint64_t)a3;
@end

@implementation CHPowerLogger

- (void)logModelLoaded:(unint64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"model";
  v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4, v5);
  v10[1] = @"loadType";
  v11[0] = v6;
  v11[1] = &unk_1F203DEC0;
  v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v11, (uint64_t)v10, 2, v8);
  sub_1C495BFB4((uint64_t)CHPowerLogger, v9);
}

- (void)logModelUnloaded:(unint64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"model";
  v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a3, v3, v4, v5);
  v10[1] = @"loadType";
  v11[0] = v6;
  v11[1] = &unk_1F203DED8;
  v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v11, (uint64_t)v10, 2, v8);
  sub_1C495BFB4((uint64_t)CHPowerLogger, v9);
}

- (void)logModelInference:(unint64_t)a3 startTimestamp:(double)a4 endTimestamp:(double)a5 data:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  if (v14)
  {
    if (qword_1EA3C9048 != -1) {
      dispatch_once(&qword_1EA3C9048, &unk_1F2011170);
    }
    v15 = objc_msgSend_mutableCopy(v14, v9, v10, v11, v12, v13);
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v16 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend_description(v15, v17, v18, v19, v20, v21);
      int v49 = 134218242;
      unint64_t v50 = a3;
      __int16 v51 = 2112;
      v52 = v22;
      _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_DEFAULT, "CHPowerLog: logModelInference for model %ld with payload = %@", (uint8_t *)&v49, 0x16u);
    }
    v27 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v23, a3, v24, v25, v26);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v28, (uint64_t)v27, @"model", v29, v30);

    v36 = objc_msgSend_numberWithDouble_(NSNumber, v31, v32, v33, v34, v35, a4);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v37, (uint64_t)v36, @"startTimestamp", v38, v39);

    v45 = objc_msgSend_numberWithDouble_(NSNumber, v40, v41, v42, v43, v44, a5);
    objc_msgSend_setObject_forKeyedSubscript_(v15, v46, (uint64_t)v45, @"endTimestamp", v47, v48);

    PPSSendTelemetry();
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v49 = 134217984;
      unint64_t v50 = a3;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_ERROR, "CHPowerLog: logModelInference for model %ld with nil data", (uint8_t *)&v49, 0xCu);
    }
  }
}

@end