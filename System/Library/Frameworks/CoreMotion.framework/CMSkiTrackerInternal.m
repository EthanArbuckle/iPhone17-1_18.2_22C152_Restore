@interface CMSkiTrackerInternal
- (CMSkiTrackerInternal)init;
- (void)_handleUpdates:(id)a3;
- (void)_queryUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)_startLiveUpdatesWithHandler:(id)a3;
- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)_stopLiveUpdates;
- (void)_stopUpdates;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMSkiTrackerInternal

- (CMSkiTrackerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSkiTrackerInternal;
  v2 = [(CMSkiTrackerInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSkiTracker", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSkiTrackerInternal;
  [(CMSkiTrackerInternal *)&v3 dealloc];
}

- (void)_teardown
{
  self->fHandler = 0;
  self->fLiveUpdateHandler = 0;

  self->fMostRecentRecord = 0;
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190583D5C;
  block[3] = &unk_1E568D410;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)_stopUpdates
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190584554;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)_queryUpdatesFromRecord:(id)a3 handler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19058482C;
  block[3] = &unk_1E568D398;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)_handleUpdates:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v5 = (id)objc_msgSend_copy(self->fHandler, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(a3, v6, @"CMErrorMessage");
  v9 = objc_msgSend_objectForKeyedSubscript_(a3, v8, @"CMSkiKeyDataArray");
  if (v7)
  {
    self->fStartedUpdates = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905855C8;
    block[3] = &unk_1E568D320;
    block[4] = v7;
    void block[5] = v5;
    v12 = MEMORY[0x1E4F14428];
    v13 = block;
LABEL_3:
    dispatch_async(v12, v13);
    return;
  }
  if (!v9)
  {
    if (qword_1E929D718 != -1) {
      dispatch_once(&qword_1E929D718, &unk_1EDFC3548);
    }
    v97 = qword_1E929D710;
    if (os_log_type_enabled((os_log_t)qword_1E929D710, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v97, OS_LOG_TYPE_FAULT, "Unable to parse kCLConnectionMessageSkiDataUpdate message.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D718 != -1) {
        dispatch_once(&qword_1E929D718, &unk_1EDFC3548);
      }
      LOWORD(v110) = 0;
      v98 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSkiTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v98);
      if (v98 != (char *)buf) {
        free(v98);
      }
    }
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = sub_190585658;
    v103[3] = &unk_1E568D2D0;
    v103[4] = v5;
    v12 = MEMORY[0x1E4F14428];
    v13 = v103;
    goto LABEL_3;
  }
  id obj = v9;
  if (objc_msgSend_count(v9, v10, v11))
  {
    id v99 = v5;
    if (self->fRunDistanceOffset == -1.0)
    {
      Object = objc_msgSend_firstObject(obj, v14, v15);
      objc_msgSend_runDistance(Object, v17, v18);
      self->double fRunDistanceOffset = v19;
      objc_msgSend_runElevationDescent(Object, v20, v21);
      self->double fRunElevationDescendedOffset = v22;
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v105, v126, 16);
    if (v102)
    {
      uint64_t v101 = *(void *)v106;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v106 != v101) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v105 + 1) + 8 * v27);
          if (qword_1E929D718 != -1) {
            dispatch_once(&qword_1E929D718, &unk_1EDFC3548);
          }
          v29 = qword_1E929D710;
          if (os_log_type_enabled((os_log_t)qword_1E929D710, OS_LOG_TYPE_DEFAULT))
          {
            double fRunDistanceOffset = self->fRunDistanceOffset;
            objc_msgSend_runDistance(v28, v30, v31);
            uint64_t v34 = v33;
            double fRunElevationDescendedOffset = self->fRunElevationDescendedOffset;
            objc_msgSend_runElevationDescent(v28, v36, v37);
            *(_DWORD *)buf = 134218752;
            double v119 = fRunDistanceOffset;
            __int16 v120 = 2048;
            uint64_t v121 = v34;
            __int16 v122 = 2048;
            double v123 = fRunElevationDescendedOffset;
            __int16 v124 = 2048;
            uint64_t v125 = v38;
            _os_log_impl(&dword_1902AF000, v29, OS_LOG_TYPE_DEFAULT, "Delivering update with distance offset %f for record distance %f, elevation offset %f for record elevation %f", buf, 0x2Au);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D718 != -1) {
              dispatch_once(&qword_1E929D718, &unk_1EDFC3548);
            }
            double v86 = self->fRunDistanceOffset;
            objc_msgSend_runDistance(v28, v84, v85);
            uint64_t v88 = v87;
            double v89 = self->fRunElevationDescendedOffset;
            objc_msgSend_runElevationDescent(v28, v90, v91);
            int v110 = 134218752;
            double v111 = v86;
            __int16 v112 = 2048;
            uint64_t v113 = v88;
            __int16 v114 = 2048;
            double v115 = v89;
            __int16 v116 = 2048;
            uint64_t v117 = v92;
            v93 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMSkiTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v93);
            if (v93 != (char *)buf) {
              free(v93);
            }
          }
          objc_msgSend_runDistance(v28, v39, v40);
          if (v43 - self->fRunDistanceOffset > 0.0
            || (objc_msgSend_runElevationDescent(v28, v41, v42), v45 - self->fRunElevationDescendedOffset > 0.0))
          {
            v46 = [CMSkiData alloc];
            uint64_t v49 = objc_msgSend_recordId(v28, v47, v48);
            uint64_t v52 = objc_msgSend_sourceId(v28, v50, v51);
            uint64_t v55 = objc_msgSend_sessionId(v28, v53, v54);
            uint64_t started = objc_msgSend_startDate(v28, v56, v57);
            uint64_t v61 = objc_msgSend_endDate(v28, v59, v60);
            objc_msgSend_runDistance(v28, v62, v63);
            double v65 = v64 - self->fRunDistanceOffset;
            objc_msgSend_runAvgSpeed(v28, v66, v67);
            double v69 = v68;
            objc_msgSend_runMaxSpeed(v28, v70, v71);
            double v73 = v72;
            objc_msgSend_runSlope(v28, v74, v75);
            double v77 = v76;
            objc_msgSend_runElevationDescent(v28, v78, v79);
            v82 = objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_runDistance_runAvgSpeed_runMaxSpeed_runSlope_runElevationDescent_(v46, v81, v49, v52, v55, started, v61, v65, v69, v73, v77, v80 - self->fRunElevationDescendedOffset);
            objc_msgSend_addObject_(v23, v83, (uint64_t)v82);
          }
          ++v27;
        }
        while (v102 != v27);
        uint64_t v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v105, v126, 16);
        uint64_t v102 = v94;
      }
      while (v94);
    }
    if (objc_msgSend_count(v23, v25, v26))
    {
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = sub_190585640;
      v104[3] = &unk_1E568D320;
      v104[4] = v23;
      v104[5] = v99;
      dispatch_async(MEMORY[0x1E4F14428], v104);
    }

    self->fMostRecentRecord = (CMSkiData *)(id)objc_msgSend_lastObject(obj, v95, v96);
  }
}

- (void)_startLiveUpdatesWithHandler:(id)a3
{
  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190585730;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_stopLiveUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D718 != -1) {
    dispatch_once(&qword_1E929D718, &unk_1EDFC3548);
  }
  uint64_t v3 = qword_1E929D710;
  if (os_log_type_enabled((os_log_t)qword_1E929D710, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "[live data] stopping updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D718 != -1) {
      dispatch_once(&qword_1E929D718, &unk_1EDFC3548);
    }
    __int16 v7 = 0;
    id v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSkiTrackerInternal _stopLiveUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905862E4;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

@end