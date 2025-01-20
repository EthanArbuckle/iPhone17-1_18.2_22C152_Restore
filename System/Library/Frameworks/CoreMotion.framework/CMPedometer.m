@interface CMPedometer
+ (BOOL)isAllDayElevationAvailable;
+ (BOOL)isCadenceAvailable;
+ (BOOL)isDistanceAvailable;
+ (BOOL)isFloorCountingAvailable;
+ (BOOL)isPaceAvailable;
+ (BOOL)isPedometerEventTrackingAvailable;
+ (BOOL)isStepCountingAvailable;
+ (CMAuthorizationStatus)authorizationStatus;
- (BOOL)sendStrideCalibrationHistoryToFile:(id)a3;
- (CMPedometer)init;
- (CMPedometerProxy)pedometerProxy;
- (id)_pedometerDataWithRecordID:(int64_t)a3;
- (id)strideCalibrationDump;
- (void)_queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4;
- (void)_startPedometerUpdatesSinceDataRecord:(id)a3 withHandler:(id)a4;
- (void)dealloc;
- (void)queryPedometerDataFromDate:(NSDate *)start toDate:(NSDate *)end withHandler:(CMPedometerHandler)handler;
- (void)queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4;
- (void)queryPedometerDataSinceRecord:(int64_t)a3 withHandler:(id)a4;
- (void)queryRawSpeedToKValueBinsWithHandler:(id)a3;
- (void)queryRemoteRawSpeedToKValueBinsWithHandler:(id)a3;
- (void)queryRemoteStepCadenceToStrideLengthBinsWithHandler:(id)a3;
- (void)queryStepCadenceToStrideLengthBinsWithHandler:(id)a3;
- (void)startPedometerEventUpdatesWithHandler:(CMPedometerEventHandler)handler;
- (void)startPedometerUpdatesFromDate:(NSDate *)start withHandler:(CMPedometerHandler)handler;
- (void)stopPedometerEventUpdates;
- (void)stopPedometerUpdates;
@end

@implementation CMPedometer

- (BOOL)sendStrideCalibrationHistoryToFile:(id)a3
{
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  if (a3 && (objc_msgSend_isFileURL(a3, a2, (uint64_t)a3) & 1) != 0)
  {
    v7 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v5, v6);
    uint64_t v10 = objc_msgSend_path(a3, v8, v9);
    if (objc_msgSend_fileExistsAtPath_(v7, v11, v10))
    {
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
      }
      v14 = qword_1E929D740;
      if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_ERROR, "File already exists at URL.", buf, 2u);
      }
      int v15 = sub_1902D8400(115, 0);
      BOOL result = 0;
      if (v15)
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D748 != -1) {
          dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
        }
        LOWORD(v196) = 0;
LABEL_79:
        v177 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMPedometer sendStrideCalibrationHistoryToFile:]", "CoreLocation: %s\n", v177);
        if (v177 != (char *)buf) {
          free(v177);
        }
        return 0;
      }
    }
    else
    {
      v19 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13);
      uint64_t v22 = objc_msgSend_path(a3, v20, v21);
      if (objc_msgSend_createFileAtPath_contents_attributes_(v19, v23, v22, 0, 0))
      {
        id v178 = a3;
        v26 = objc_msgSend_strideCalibrationDump(self, v24, v25);
        v29 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v27, v28);
        v180 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v30, v31);
        v182 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v32, v33);
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        v179 = v26;
        obuint64_t j = (id)objc_msgSend_calibrationTracks(v26, v34, v35);
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v192, v208, 16);
        if (v37)
        {
          uint64_t v40 = v37;
          uint64_t v41 = *(void *)v193;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v193 != v41) {
                objc_enumerationMutation(obj);
              }
              v43 = *(void **)(*((void *)&v192 + 1) + 8 * i);
              v206[0] = @"startTime";
              v44 = NSNumber;
              objc_msgSend_startTime(v43, v38, v39);
              v207[0] = objc_msgSend_numberWithDouble_(v44, v45, v46);
              v206[1] = @"pacebin";
              v47 = NSNumber;
              uint64_t v50 = objc_msgSend_pacebin(v43, v48, v49);
              v207[1] = objc_msgSend_numberWithUnsignedInt_(v47, v51, v50);
              v206[2] = @"kvalue";
              v52 = NSNumber;
              objc_msgSend_kvalue(v43, v53, v54);
              v207[2] = objc_msgSend_numberWithDouble_(v52, v55, v56);
              v206[3] = @"kvalueTrack";
              v57 = NSNumber;
              objc_msgSend_kvalueTrack(v43, v58, v59);
              v207[3] = objc_msgSend_numberWithDouble_(v57, v60, v61);
              v206[4] = @"score";
              v62 = NSNumber;
              objc_msgSend_score(v43, v63, v64);
              v207[4] = objc_msgSend_numberWithDouble_(v62, v65, v66);
              v206[5] = @"endTime";
              v67 = NSNumber;
              objc_msgSend_endTime(v43, v68, v69);
              v207[5] = objc_msgSend_numberWithDouble_(v67, v70, v71);
              v206[6] = @"distance";
              v72 = NSNumber;
              objc_msgSend_distance(v43, v73, v74);
              v207[6] = objc_msgSend_numberWithDouble_(v72, v75, v76);
              v206[7] = @"steps";
              v77 = NSNumber;
              uint64_t v80 = objc_msgSend_steps(v43, v78, v79);
              v207[7] = objc_msgSend_numberWithInt_(v77, v81, v80);
              v206[8] = @"session";
              v82 = NSNumber;
              uint64_t v85 = objc_msgSend_session(v43, v83, v84);
              v207[8] = objc_msgSend_numberWithInt_(v82, v86, v85);
              v206[9] = @"speed";
              v87 = NSNumber;
              objc_msgSend_speed(v43, v88, v89);
              v207[9] = objc_msgSend_numberWithDouble_(v87, v90, v91);
              v206[10] = @"percentGrade";
              v92 = NSNumber;
              objc_msgSend_percentGrade(v43, v93, v94);
              v207[10] = objc_msgSend_numberWithDouble_(v92, v95, v96);
              v206[11] = @"gpsSource";
              v97 = NSNumber;
              uint64_t v100 = objc_msgSend_gpsSource(v43, v98, v99);
              v207[11] = objc_msgSend_numberWithInteger_(v97, v101, v100);
              uint64_t v103 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v102, (uint64_t)v207, v206, 12);
              objc_msgSend_addObject_(v29, v104, v103);
            }
            uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v192, v208, 16);
          }
          while (v40);
        }
        long long v190 = 0u;
        long long v191 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        v105 = objc_msgSend_rawSpeedToKValueBins(v179, v38, v39);
        uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v106, (uint64_t)&v188, v205, 16);
        if (v107)
        {
          uint64_t v110 = v107;
          uint64_t v111 = *(void *)v189;
          do
          {
            for (uint64_t j = 0; j != v110; ++j)
            {
              if (*(void *)v189 != v111) {
                objc_enumerationMutation(v105);
              }
              v113 = *(void **)(*((void *)&v188 + 1) + 8 * j);
              v203[0] = @"begin";
              v114 = NSNumber;
              objc_msgSend_begin(v113, v108, v109);
              v204[0] = objc_msgSend_numberWithDouble_(v114, v115, v116);
              v203[1] = @"end";
              v117 = NSNumber;
              objc_msgSend_end(v113, v118, v119);
              v204[1] = objc_msgSend_numberWithDouble_(v117, v120, v121);
              v203[2] = @"state";
              v122 = NSNumber;
              uint64_t v125 = objc_msgSend_state(v113, v123, v124);
              v204[2] = objc_msgSend_numberWithInteger_(v122, v126, v125);
              v203[3] = @"kValue";
              v127 = NSNumber;
              objc_msgSend_kValue(v113, v128, v129);
              v204[3] = objc_msgSend_numberWithDouble_(v127, v130, v131);
              uint64_t v133 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v132, (uint64_t)v204, v203, 4);
              objc_msgSend_addObject_(v180, v134, v133);
            }
            uint64_t v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v105, v108, (uint64_t)&v188, v205, 16);
          }
          while (v110);
        }
        long long v186 = 0u;
        long long v187 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        v135 = objc_msgSend_stepCadenceToStrideLengthBins(v179, v108, v109);
        uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v136, (uint64_t)&v184, v202, 16);
        if (v137)
        {
          uint64_t v140 = v137;
          uint64_t v141 = *(void *)v185;
          do
          {
            for (uint64_t k = 0; k != v140; ++k)
            {
              if (*(void *)v185 != v141) {
                objc_enumerationMutation(v135);
              }
              v143 = *(void **)(*((void *)&v184 + 1) + 8 * k);
              v200[0] = @"begin";
              v144 = NSNumber;
              objc_msgSend_begin(v143, v138, v139);
              v201[0] = objc_msgSend_numberWithDouble_(v144, v145, v146);
              v200[1] = @"end";
              v147 = NSNumber;
              objc_msgSend_end(v143, v148, v149);
              v201[1] = objc_msgSend_numberWithDouble_(v147, v150, v151);
              v200[2] = @"state";
              v152 = NSNumber;
              uint64_t v155 = objc_msgSend_state(v143, v153, v154);
              v201[2] = objc_msgSend_numberWithInteger_(v152, v156, v155);
              v200[3] = @"strideLength";
              v157 = NSNumber;
              objc_msgSend_kValue(v143, v158, v159);
              v201[3] = objc_msgSend_numberWithDouble_(v157, v160, v161);
              uint64_t v163 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v162, (uint64_t)v201, v200, 4);
              objc_msgSend_addObject_(v182, v164, v163);
            }
            uint64_t v140 = objc_msgSend_countByEnumeratingWithState_objects_count_(v135, v138, (uint64_t)&v184, v202, 16);
          }
          while (v140);
        }
        v198[0] = @"history";
        v198[1] = @"rawSpeedToKValueBins";
        v199[0] = v29;
        v199[1] = v180;
        v198[2] = @"stepCadenceToStrideLengthBins";
        v199[2] = v182;
        uint64_t v165 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v138, (uint64_t)v199, v198, 3);
        if (v165)
        {
          uint64_t v183 = 0;
          v167 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v166, v165, 1, &v183);
          if (v183)
          {
            if (qword_1E929D748 != -1) {
              dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
            }
            v169 = qword_1E929D740;
            if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v210 = v183;
              _os_log_impl(&dword_1902AF000, v169, OS_LOG_TYPE_ERROR, "Unable to serialize stride cal data to json. Error: %@", buf, 0xCu);
            }
            int v170 = sub_1902D8400(115, 0);
            BOOL result = 0;
            if (v170)
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929D748 != -1) {
                dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
              }
              int v196 = 138412290;
              uint64_t v197 = v183;
              goto LABEL_79;
            }
          }
          else
          {
            if (objc_msgSend_writeToURL_atomically_(v167, v168, (uint64_t)v178, 0)) {
              return 1;
            }
            if (qword_1E929D748 != -1) {
              dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
            }
            v175 = qword_1E929D740;
            if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1902AF000, v175, OS_LOG_TYPE_ERROR, "Unable to write stride cal data to output file.", buf, 2u);
            }
            int v176 = sub_1902D8400(115, 0);
            BOOL result = 0;
            if (v176)
            {
              bzero(buf, 0x65CuLL);
              if (qword_1E929D748 != -1) {
                dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
              }
              LOWORD(v196) = 0;
              goto LABEL_79;
            }
          }
        }
        else
        {
          if (qword_1E929D748 != -1) {
            dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
          }
          v173 = qword_1E929D740;
          if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1902AF000, v173, OS_LOG_TYPE_ERROR, "Unable to dump stride calibration data.", buf, 2u);
          }
          int v174 = sub_1902D8400(115, 0);
          BOOL result = 0;
          if (v174)
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D748 != -1) {
              dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
            }
            LOWORD(v196) = 0;
            goto LABEL_79;
          }
        }
      }
      else
      {
        if (qword_1E929D748 != -1) {
          dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
        }
        v171 = qword_1E929D740;
        if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v171, OS_LOG_TYPE_ERROR, "URL must point to a file path which you have access to write to.", buf, 2u);
        }
        int v172 = sub_1902D8400(115, 0);
        BOOL result = 0;
        if (v172)
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D748 != -1) {
            dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
          }
          LOWORD(v196) = 0;
          goto LABEL_79;
        }
      }
    }
  }
  else
  {
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
    }
    v17 = qword_1E929D740;
    if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_ERROR, "fileURL must be a valid fileURL.", buf, 2u);
    }
    int v18 = sub_1902D8400(115, 0);
    BOOL result = 0;
    if (v18)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
      }
      LOWORD(v196) = 0;
      goto LABEL_79;
    }
  }
  return result;
}

- (id)strideCalibrationDump
{
  uint64_t v3 = objc_msgSend_pedometerProxy(self, a2, v2);

  return (id)MEMORY[0x1F4181798](v3, sel__strideCalibrationDump, v4);
}

- (CMPedometer)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMPedometer;
  uint64_t v2 = [(CMPedometer *)&v4 init];
  if (v2) {
    v2->_pedometerProxy = objc_alloc_init(CMPedometerProxy);
  }
  return v2;
}

- (void)dealloc
{
  pedometerProxy = self->_pedometerProxy;
  fAppQueue = pedometerProxy->fAppQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905245DC;
  block[3] = &unk_1E568D118;
  block[4] = pedometerProxy;
  dispatch_async(fAppQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMPedometer;
  [(CMPedometer *)&v5 dealloc];
}

+ (BOOL)isStepCountingAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  if ((sub_1902CD6B0() & 0x2000000) != 0) {
    return 1;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageStartStepCountAvailable");
}

+ (BOOL)isDistanceAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_isStepCountingAvailable(CMPedometer, v2, v3);
}

+ (BOOL)isFloorCountingAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return ((unint64_t)sub_1902CD6B0() >> 27) & 1;
  }
  return v2;
}

+ (BOOL)isPaceAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  if ((sub_1902CD6B0() & 0x4000000) != 0) {
    return 1;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessagePaceAndCadenceAPIAvailable");
}

+ (BOOL)isCadenceAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_isPaceAvailable(CMPedometer, v2, v3);
}

+ (BOOL)isPedometerEventTrackingAvailable
{
  if (sub_1902BACB4())
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    sub_1902BAD40();
    return ((unint64_t)sub_1902CD6B0() >> 32) & 1;
  }
  return v2;
}

+ (BOOL)isAllDayElevationAvailable
{
  if (sub_1902BACB4()) {
    LOBYTE(v2) = 0;
  }
  else {
    return ((unint64_t)sub_1902CD6B0() >> 37) & 1;
  }
  return v2;
}

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

- (void)queryPedometerDataFromDate:(NSDate *)start toDate:(NSDate *)end withHandler:(CMPedometerHandler)handler
{
  if (start)
  {
    if (end) {
      goto LABEL_3;
    }
LABEL_6:
    v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CMPedometer.mm", 662, @"Invalid parameter not satisfying: %@", @"end");
    if (handler) {
      goto LABEL_4;
    }
LABEL_7:
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMPedometer.mm", 663, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_4;
  }
  uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMPedometer.mm", 661, @"Invalid parameter not satisfying: %@", @"start");
  if (!end) {
    goto LABEL_6;
  }
LABEL_3:
  if (!handler) {
    goto LABEL_7;
  }
LABEL_4:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_190524980;
  v16[3] = &unk_1E568DCF8;
  v16[4] = self;
  v16[5] = start;
  v16[6] = end;
  v16[7] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v16);
}

- (void)startPedometerUpdatesFromDate:(NSDate *)start withHandler:(CMPedometerHandler)handler
{
  if (!start)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMPedometer.mm", 675, @"Invalid parameter not satisfying: %@", @"start");
    if (handler) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)start);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMPedometer.mm", 676, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_3;
  }
  if (!handler) {
    goto LABEL_5;
  }
LABEL_3:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_190524B34;
  v12[3] = &unk_1E568D398;
  v12[4] = self;
  v12[5] = start;
  v12[6] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v12);
}

- (void)stopPedometerUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190524BE8;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (id)_pedometerDataWithRecordID:(int64_t)a3
{
  objc_super v4 = [CMPedometerData alloc];
  int v8 = 0;
  isOdometerPace_pushes_workoutType_elevationAscended_elevationDescended_distanceSource = objc_msgSend_initWithStartDate_endDate_steps_distance_floorsAscended_floorsDescended_recordID_currentPace_currentCadence_firstStepTime_activeTime_sourceId_isOdometerDistance_isOdometerPace_pushes_workoutType_elevationAscended_elevationDescended_distanceSource_(v4, v5, 0, 0, 0, a3, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 0, MEMORY[0x1E4F1CC28], MEMORY[0x1E4F1CC28], 0, 0, 0,
                                                                                                    v8);

  return isOdometerPace_pushes_workoutType_elevationAscended_elevationDescended_distanceSource;
}

- (void)_startPedometerUpdatesSinceDataRecord:(id)a3 withHandler:(id)a4
{
  if (!a4)
  {
    int v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMPedometer.mm", 715, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190524D7C;
  v10[3] = &unk_1E568D398;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10);
}

- (void)queryPedometerDataSinceRecord:(int64_t)a3 withHandler:(id)a4
{
  uint64_t v5 = objc_msgSend__pedometerDataWithRecordID_(self, a2, a3);

  MEMORY[0x1F4181798](self, sel__queryPedometerDataSinceDataRecord_withHandler_, v5);
}

- (void)queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  if (!a3) {
    a3 = (id)objc_msgSend__pedometerDataWithRecordID_(self, a2, 0);
  }

  MEMORY[0x1F4181798](self, sel__queryPedometerDataSinceDataRecord_withHandler_, a3);
}

- (void)_queryPedometerDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (qword_1EB3BF388 != -1) {
      dispatch_once(&qword_1EB3BF388, &unk_1EDFD1FA0);
    }
    if (qword_1EB3BF380 == 3)
    {
      v7 = objc_msgSend_pedometerProxy(self, a2, (uint64_t)a3);
      objc_msgSend__queryPedometerDataSinceDataRecord_withHandler_shouldStartUpdates_(v7, v8, (uint64_t)a3, a4, 0);
    }
  }
  else
  {
    if (qword_1E929D748 != -1) {
      dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
    }
    uint64_t v9 = qword_1E929D740;
    if (os_log_type_enabled((os_log_t)qword_1E929D740, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_FAULT, "handler not set.", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D748 != -1) {
        dispatch_once(&qword_1E929D748, &unk_1EDFD3500);
      }
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMPedometer _queryPedometerDataSinceDataRecord:withHandler:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (void)startPedometerEventUpdatesWithHandler:(CMPedometerEventHandler)handler
{
  if (!handler)
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMPedometer.mm", 759, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_190525194;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)stopPedometerEventUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190525248;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)queryRawSpeedToKValueBinsWithHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1905252EC;
  v3[3] = &unk_1E568D2F8;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (void)queryRemoteRawSpeedToKValueBinsWithHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1905253A8;
  v3[3] = &unk_1E568D2F8;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (void)queryStepCadenceToStrideLengthBinsWithHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_190525464;
  v3[3] = &unk_1E568D2F8;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (void)queryRemoteStepCadenceToStrideLengthBinsWithHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_190525520;
  v3[3] = &unk_1E568D2F8;
  v3[4] = self;
  v3[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (CMPedometerProxy)pedometerProxy
{
  return self->_pedometerProxy;
}

@end