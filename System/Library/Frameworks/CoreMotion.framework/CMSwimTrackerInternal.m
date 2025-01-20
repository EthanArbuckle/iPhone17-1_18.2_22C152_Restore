@interface CMSwimTrackerInternal
- (CMSwimTrackerInternal)init;
- (void)_handleUpdates:(id)a3;
- (void)_querySWOLFSummaryWithSessionID:(id)a3 handler:(id)a4;
- (void)_querySwimUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)_resetOffsets;
- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)_stopUpdates;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMSwimTrackerInternal

- (CMSwimTrackerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSwimTrackerInternal;
  v2 = [(CMSwimTrackerInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMSwimTracker", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMSwimTrackerInternal;
  [(CMSwimTrackerInternal *)&v3 dealloc];
}

- (void)_teardown
{
  self->fHandler = 0;
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
  block[2] = sub_1905CA26C;
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
  block[2] = sub_1905CA8E8;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)_querySwimUpdatesFromRecord:(id)a3 handler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905CABF8;
  block[3] = &unk_1E568D398;
  block[4] = a3;
  void block[5] = self;
  block[6] = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)_querySWOLFSummaryWithSessionID:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8B8 != -1) {
    dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
  }
  v7 = qword_1E929D8C0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = objc_msgSend_UUIDString(a3, v8, v9);
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "SWOLF query for session: %@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8B8 != -1) {
      dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
    }
    int v15 = 138412290;
    uint64_t v16 = objc_msgSend_UUIDString(a3, v11, v12);
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _querySWOLFSummaryWithSessionID:handler:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905CB4F8;
  block[3] = &unk_1E568D410;
  void block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)_handleUpdates:(id)a3
{
  v155[202] = *MEMORY[0x1E4F143B8];
  id v5 = (id)objc_msgSend_copy(self->fHandler, a2, (uint64_t)a3);
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(a3, v6, @"CMErrorMessage");
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(a3, v8, @"CMSwimKeyDataArray");
  if (v7)
  {
    self->fStartedUpdates = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905CC9B0;
    block[3] = &unk_1E568D320;
    block[4] = v7;
    void block[5] = v5;
    uint64_t v12 = MEMORY[0x1E4F14428];
    v13 = block;
LABEL_3:
    dispatch_async(v12, v13);
    return;
  }
  v14 = v9;
  if (!v9)
  {
    if (qword_1E929D8B8 != -1) {
      dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
    }
    v113 = qword_1E929D8C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v151 = self;
      _os_log_impl(&dword_1902AF000, v113, OS_LOG_TYPE_FAULT, "Unable to parse update message, %p", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
      }
      int v144 = 134217984;
      v145 = self;
      v116 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v116);
      if (v116 != (char *)buf) {
        free(v116);
      }
    }
    v141[0] = MEMORY[0x1E4F143A8];
    v141[1] = 3221225472;
    v141[2] = sub_1905CCA28;
    v141[3] = &unk_1E568D2D0;
    v141[4] = v5;
    uint64_t v12 = MEMORY[0x1E4F14428];
    v13 = v141;
    goto LABEL_3;
  }
  v17 = &OBJC_IVAR___CMHeadphoneActivityManagerInternal_fLogger;
  if (objc_msgSend_count(v9, v10, v11))
  {
    id v128 = v5;
    v129 = v14;
    if (self->fDistanceOffset == 1.79769313e308)
    {
      Object = (CMSwimTrackerInternal *)objc_msgSend_firstObject(v14, v15, v16);
      objc_msgSend_distance(Object, v19, v20);
      self->double fDistanceOffset = v21;
      self->unint64_t fStrokeCountOffset = objc_msgSend_strokeCount(Object, v22, v23);
      self->fLapCountOffset = objc_msgSend_lapCount(Object, v24, v25);
      self->fSegmentCountOffset = objc_msgSend_segment(Object, v26, v27);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
      }
      v28 = qword_1E929D8C0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = getpid();
        *(_DWORD *)buf = 138413058;
        v151 = Object;
        __int16 v152 = 2112;
        uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v30, v29);
        __int16 v154 = 1024;
        LODWORD(v155[0]) = getpid();
        WORD2(v155[0]) = 2048;
        *(void *)((char *)v155 + 6) = self;
        _os_log_impl(&dword_1902AF000, v28, OS_LOG_TYPE_DEFAULT, "Setting offset record for live updates, %@, %@, %d, %p", buf, 0x26u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8B8 != -1) {
          dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
        }
        uint64_t v117 = getpid();
        int v144 = 138413058;
        v145 = Object;
        __int16 v146 = 2112;
        uint64_t v147 = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v118, v117);
        __int16 v148 = 1024;
        LODWORD(v149[0]) = getpid();
        WORD2(v149[0]) = 2048;
        *(void *)((char *)v149 + 6) = self;
        v119 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v119);
        if (v119 != (char *)buf) {
          free(v119);
        }
        v17 = &OBJC_IVAR___CMHeadphoneActivityManagerInternal_fLogger;
      }
    }
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v32, (uint64_t)&v137, v143, 16);
    v130 = v31;
    if (v33)
    {
      uint64_t v36 = v33;
      uint64_t v135 = *(void *)v138;
      do
      {
        uint64_t v37 = 0;
        uint64_t v131 = v36;
        do
        {
          if (*(void *)v138 != v135) {
            objc_enumerationMutation(v14);
          }
          v38 = *(void **)(*((void *)&v137 + 1) + 8 * v37);
          objc_msgSend_distance(v38, v34, v35);
          double v42 = v41 - self->fDistanceOffset;
          if (v42 >= -2.22044605e-16)
          {
            if (v42 >= 2.22044605e-16)
            {
              v50 = objc_msgSend_endDate(v38, v39, v40);
              objc_msgSend_timeIntervalSinceReferenceDate(v50, v51, v52);
              double v54 = v53;
              started = objc_msgSend_startDate(v38, v55, v56);
              objc_msgSend_timeIntervalSinceReferenceDate(started, v58, v59);
              self->double fActiveTime = self->fActiveTime + v54 - v60;
              v134 = [CMSwimData alloc];
              uint64_t v133 = objc_msgSend_recordId(v38, v61, v62);
              uint64_t v132 = objc_msgSend_sourceId(v38, v63, v64);
              uint64_t v67 = objc_msgSend_sessionId(v38, v65, v66);
              uint64_t v70 = objc_msgSend_startDate(v38, v68, v69);
              uint64_t v73 = objc_msgSend_endDate(v38, v71, v72);
              uint64_t v76 = objc_msgSend_strokeCount(v38, v74, v75);
              unint64_t fStrokeCountOffset = self->fStrokeCountOffset;
              objc_msgSend_distance(v38, v78, v79);
              double v81 = v80;
              double fDistanceOffset = self->fDistanceOffset;
              uint64_t v85 = objc_msgSend_distanceTimestamp(v38, v83, v84);
              objc_msgSend_distance(v38, v86, v87);
              double v91 = 0.0;
              if (v90 - self->fDistanceOffset > 0.0)
              {
                double fActiveTime = self->fActiveTime;
                objc_msgSend_distance(v38, v88, v89);
                double v91 = fActiveTime / (v93 - self->fDistanceOffset);
              }
              unint64_t v94 = v76 - fStrokeCountOffset;
              unint64_t v95 = objc_msgSend_lapCount(v38, v88, v89) - self->fLapCountOffset;
              uint64_t v98 = objc_msgSend_strokeType(v38, v96, v97);
              uint64_t v101 = objc_msgSend_segment(v38, v99, v100);
              v103 = objc_msgSend_initWithRecordId_sourceId_sessionId_startDate_endDate_strokeCount_distance_distanceTimestamp_avgPace_lapCount_strokeType_segment_SWOLF_segmentSWOLF_(v134, v102, v133, v132, v67, v70, v73, v94, v81 - fDistanceOffset, v91, 0.0, 0.0, v85, v95, v98, v101 - self->fSegmentCountOffset);
              id v31 = v130;
              objc_msgSend_addObject_(v130, v104, (uint64_t)v103);

              v17 = &OBJC_IVAR___CMHeadphoneActivityManagerInternal_fLogger;
              v14 = v129;
              uint64_t v36 = v131;
            }
            else
            {
              if (qword_1E929D8B8 != -1) {
                dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
              }
              v47 = *((void *)v17 + 280);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                double v48 = self->fDistanceOffset;
                *(_DWORD *)buf = 134218498;
                v151 = *(CMSwimTrackerInternal **)&v48;
                __int16 v152 = 2112;
                uint64_t ExecutablePathFromPid = (uint64_t)v38;
                __int16 v154 = 2048;
                v155[0] = self;
                _os_log_impl(&dword_1902AF000, v47, OS_LOG_TYPE_DEFAULT, "(Approximately) Zero distance from offset, %f, %@, %p", buf, 0x20u);
              }
              if (sub_1902D8400(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929D8B8 != -1) {
                  dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
                }
                double v49 = self->fDistanceOffset;
                int v144 = 134218498;
                v145 = *(CMSwimTrackerInternal **)&v49;
                __int16 v146 = 2112;
                uint64_t v147 = (uint64_t)v38;
                __int16 v148 = 2048;
                v149[0] = self;
                v46 = (char *)_os_log_send_and_compose_impl();
                sub_1902D398C("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v46);
                goto LABEL_36;
              }
            }
          }
          else
          {
            if (qword_1E929D8B8 != -1) {
              dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
            }
            v43 = *((void *)v17 + 280);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              double v44 = self->fDistanceOffset;
              *(_DWORD *)buf = 134218498;
              v151 = *(CMSwimTrackerInternal **)&v44;
              __int16 v152 = 2112;
              uint64_t ExecutablePathFromPid = (uint64_t)v38;
              __int16 v154 = 2048;
              v155[0] = self;
              _os_log_impl(&dword_1902AF000, v43, OS_LOG_TYPE_ERROR, "Negative distance from offset, %f, %@, %p", buf, 0x20u);
            }
            if (sub_1902D8400(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929D8B8 != -1) {
                dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
              }
              double v45 = self->fDistanceOffset;
              int v144 = 134218498;
              v145 = *(CMSwimTrackerInternal **)&v45;
              __int16 v146 = 2112;
              uint64_t v147 = (uint64_t)v38;
              __int16 v148 = 2048;
              v149[0] = self;
              v46 = (char *)_os_log_send_and_compose_impl();
              sub_1902D398C("Generic", 1, 0, 0, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v46);
LABEL_36:
              if (v46 != (char *)buf) {
                free(v46);
              }
            }
          }
          ++v37;
        }
        while (v36 != v37);
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v34, (uint64_t)&v137, v143, 16);
      }
      while (v36);
    }
    if (objc_msgSend_count(v31, v34, v35))
    {
      v136[0] = MEMORY[0x1E4F143A8];
      v136[1] = 3221225472;
      v136[2] = sub_1905CCA8C;
      v136[3] = &unk_1E568D320;
      v136[4] = v31;
      v136[5] = v128;
      dispatch_async(MEMORY[0x1E4F14428], v136);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
      }
      v105 = *((void *)v17 + 280);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v108 = objc_msgSend_lastObject(v31, v106, v107);
        uint64_t v109 = getpid();
        uint64_t v111 = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v110, v109);
        pid_t v112 = getpid();
        *(_DWORD *)buf = 138413058;
        v151 = (CMSwimTrackerInternal *)v108;
        __int16 v152 = 2112;
        uint64_t ExecutablePathFromPid = v111;
        __int16 v154 = 1024;
        LODWORD(v155[0]) = v112;
        WORD2(v155[0]) = 2048;
        *(void *)((char *)v155 + 6) = self;
        _os_log_impl(&dword_1902AF000, v105, OS_LOG_TYPE_DEFAULT, "%@, %@, %d, %p", buf, 0x26u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8B8 != -1) {
          dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
        }
        uint64_t v122 = objc_msgSend_lastObject(v130, v120, v121);
        uint64_t v123 = getpid();
        uint64_t v125 = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v124, v123);
        pid_t v126 = getpid();
        int v144 = 138413058;
        v145 = (CMSwimTrackerInternal *)v122;
        __int16 v146 = 2112;
        uint64_t v147 = v125;
        __int16 v148 = 1024;
        LODWORD(v149[0]) = v126;
        WORD2(v149[0]) = 2048;
        *(void *)((char *)v149 + 6) = self;
        v127 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v127);
        if (v127 != (char *)buf) {
          free(v127);
        }
        id v31 = v130;
      }
    }
  }
  else
  {
    if (qword_1E929D8B8 != -1) {
      dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
    }
    v114 = qword_1E929D8C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v151 = self;
      _os_log_impl(&dword_1902AF000, v114, OS_LOG_TYPE_DEFAULT, "#Warning Empty swim update, %p", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD3F80);
      }
      int v144 = 134217984;
      v145 = self;
      v115 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMSwimTrackerInternal _handleUpdates:]", "CoreLocation: %s\n", v115);
      if (v115 != (char *)buf) {
        free(v115);
      }
    }
  }
}

- (void)_resetOffsets
{
  self->unint64_t fStrokeCountOffset = 0;
  self->double fDistanceOffset = 1.79769313e308;
  self->double fActiveTime = 0.0;
  self->fSegmentCountOffset = 0;
  self->fLapCountOffset = 0;
}

@end