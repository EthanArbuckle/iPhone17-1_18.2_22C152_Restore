@interface CVNLPPerformance
- (BOOL)computePerf;
- (CVNLPPerformance)initWithOptions:(id)a3;
- (NSMutableDictionary)results;
- (void)run:(id)a3 block:(id)a4;
@end

@implementation CVNLPPerformance

- (CVNLPPerformance)initWithOptions:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CVNLPPerformance;
  v7 = [(CVNLPPerformance *)&v19 init];
  if (v7)
  {
    v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CVNLPCaptionTrackPerformance, v6);
    int v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
    v7->_computePerf = v12;
    if (v12)
    {
      uint64_t v16 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15);
      results = v7->_results;
      v7->_results = (NSMutableDictionary *)v16;
    }
  }

  return v7;
}

- (void)run:(id)a3 block:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (objc_msgSend_computePerf(self, v8, v9, v10))
  {
    pc_session_create();
    uint64_t v14 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v11, v12, v13);
    objc_msgSend_processIdentifier(v14, v15, v16, v17);
    pc_session_set_procpid();

    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_begin();
    v24 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v18, v19, v20);
    if (v7) {
      v7[2](v7);
    }
    v25 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v21, v22, v23);
    objc_msgSend_timeIntervalSinceDate_(v25, v26, (uint64_t)v24, v27);
    uint64_t v29 = v28;

    pc_session_end();
    v30 = [CVNLPPerformanceResult alloc];
    uint64_t v33 = objc_msgSend_initWithName_(v30, v31, (uint64_t)v6, v32);
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_destroy();
    float64x2_t v34 = (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL);
    *(float64x2_t *)(v33 + 8) = vmulq_f64(*(float64x2_t *)(v33 + 8), v34);
    *(float64x2_t *)(v33 + 24) = vmulq_f64(*(float64x2_t *)(v33 + 24), v34);
    *(double *)(v33 + 40) = *(double *)(v33 + 40) * 0.000001;
    *(void *)(v33 + 56) = v29;
    v38 = objc_msgSend_results(self, v35, v36, v37);
    v41 = objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)v6, v40);

    if (!v41)
    {
      v45 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v42, v43, v44);
      v49 = objc_msgSend_results(self, v46, v47, v48);
      objc_msgSend_setObject_forKeyedSubscript_(v49, v50, (uint64_t)v45, (uint64_t)v6);
    }
    v51 = objc_msgSend_results(self, v42, v43, v44);
    v54 = objc_msgSend_objectForKeyedSubscript_(v51, v52, (uint64_t)v6, v53);
    v58 = objc_msgSend_dict((void *)v33, v55, v56, v57);
    objc_msgSend_addObject_(v54, v59, (uint64_t)v58, v60);
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (BOOL)computePerf
{
  return self->_computePerf;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end