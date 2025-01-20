@interface CMFallStatsItemsIterator
- (CMFallStatsItemsIterator)initWithData:(id)a3;
- (id).cxx_construct;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation CMFallStatsItemsIterator

- (CMFallStatsItemsIterator)initWithData:(id)a3
{
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3)) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CMFallStatsItemsIterator;
  v5 = [(CMFallStatsItemsIterator *)&v7 init];
  if (v5)
  {
    v5->_data = (NSData *)a3;
    v5->_item = 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMFallStatsItemsIterator;
  [(CMFallStatsItemsIterator *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v183[1] = *MEMORY[0x1E4F143B8];
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  if (!self->_data) {
    return 0;
  }
  unint64_t var0 = a3->var0;
  if (!a3->var0)
  {
    if (sub_190385130((uint64_t)&self->fMslReader))
    {
      v132 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v132, v133, (uint64_t)a2, self, @"CMFallStats.mm", 66, @"A fast enumeration is already started");
    }
    v11 = (char *)objc_msgSend_bytes(self->_data, v9, v10);
    unint64_t v14 = objc_msgSend_length(self->_data, v12, v13);
    self->fMslReaderDelegate.fBuffer = v11;
    self->fMslReaderDelegate.fLength = v14;
    if (sub_190385098((uint64_t)&self->fMslReader, (uint64_t)&self->fMslReaderDelegate))
    {
      sub_190384EF4(buf, (uint64_t)&self->fMslReader);
      v15 = v139;
      long long v16 = *(_OWORD *)buf;
      *(void *)&buf[8] = 0;
      v139 = 0;
      *(_OWORD *)&self->fMslIterator.fReader = v16;
      cntrl = self->fMslIterator.fItem.__cntrl_;
      self->fMslIterator.fItem.__cntrl_ = v15;
      if (cntrl)
      {
        sub_1902D8B58((std::__shared_weak_count *)cntrl);
        if (v139) {
          sub_1902D8B58((std::__shared_weak_count *)v139);
        }
      }
      a3->unint64_t var0 = 1;
      goto LABEL_12;
    }
    unint64_t var0 = a3->var0;
  }
  if (var0 != 1) {
    goto LABEL_13;
  }
LABEL_12:
  if (!sub_190385130((uint64_t)&self->fMslReader)) {
    return 0;
  }
LABEL_13:
  while (self->fMslIterator.fReader)
  {
    ptr = self->fMslIterator.fItem.__ptr_;
    v19 = (void *)*((void *)ptr + 125);
    if (!v19)
    {
      if (qword_1E929D8E8 != -1) {
        dispatch_once(&qword_1E929D8E8, &unk_1EDFD1640);
      }
      v33 = qword_1E929D8F0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = *((void *)ptr + 77);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v34;
        _os_log_impl(&dword_1902AF000, v33, OS_LOG_TYPE_DEBUG, "Unknown Msl node in a fall snippet sequence [cftime=%f] - update CMFallStats", buf, 0xCu);
      }
      if (!sub_1902D8400(115, 2)) {
        goto LABEL_24;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8E8 != -1) {
        dispatch_once(&qword_1E929D8E8, &unk_1EDFD1640);
      }
      uint64_t v111 = *((void *)ptr + 77);
      int v136 = 134217984;
      uint64_t v137 = v111;
      v112 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMFallStatsItemsIterator countByEnumeratingWithState:objects:count:]", "CoreLocation: %s\n", v112);
      goto LABEL_51;
    }
    if (v19[11])
    {
      v182 = @"meta";
      v180[0] = @"timestamp";
      v181[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v180[1] = @"crownUpDown";
      v181[1] = objc_msgSend_numberWithInt_(NSNumber, v20, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 88) + 8));
      v180[2] = @"isNearFall";
      v181[2] = objc_msgSend_numberWithBool_(NSNumber, v21, *(unsigned __int8 *)(*(void *)(*((void *)ptr + 125) + 88) + 70));
      v180[3] = @"fallType";
      v181[3] = objc_msgSend_numberWithInt_(NSNumber, v22, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 88) + 12));
      v180[4] = @"userAgeBucket";
      v181[4] = objc_msgSend_numberWithInt_(NSNumber, v23, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 88) + 60));
      v180[5] = @"workoutType";
      v181[5] = objc_msgSend_numberWithInt_(NSNumber, v24, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 88) + 64));
      v180[6] = @"activityLevel";
      LODWORD(v27) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 88) + 44);
      if ((LODWORD(v27) & 0x7FFFFFFFu) >= 0x7F800000) {
        *(float *)&double v27 = -1.0;
      }
      v181[6] = objc_msgSend_numberWithFloat_(NSNumber, v25, v26, v27);
      v180[7] = @"isADLImpact";
      v181[7] = objc_msgSend_numberWithBool_(NSNumber, v28, *(unsigned __int8 *)(*(void *)(*((void *)ptr + 125) + 88) + 68));
      v183[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)v181, v180, 8);
      int v30 = 1;
      v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v31, (uint64_t)v183, &v182, 1);
      goto LABEL_58;
    }
    if (v19[1])
    {
      v178 = @"accel";
      v176[0] = @"timestamp";
      v177[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v176[1] = @"x";
      LODWORD(v35) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 8) + 20);
      v177[1] = objc_msgSend_numberWithFloat_(NSNumber, v36, v37, v35);
      v176[2] = @"y";
      LODWORD(v38) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 8) + 24);
      v177[2] = objc_msgSend_numberWithFloat_(NSNumber, v39, v40, v38);
      v176[3] = @"z";
      LODWORD(v41) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 8) + 28);
      v177[3] = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v41);
      uint64_t v179 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v44, (uint64_t)v177, v176, 4);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v45, (uint64_t)&v179, &v178, 1);
LABEL_57:
      v32 = (void *)v46;
      goto LABEL_58;
    }
    if (v19[2])
    {
      v174 = @"fastAccel";
      v172[0] = @"timestamp";
      v173[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v172[1] = @"x";
      LODWORD(v47) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 16) + 20);
      v173[1] = objc_msgSend_numberWithFloat_(NSNumber, v48, v49, v47);
      v172[2] = @"y";
      LODWORD(v50) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 16) + 24);
      v173[2] = objc_msgSend_numberWithFloat_(NSNumber, v51, v52, v50);
      v172[3] = @"z";
      LODWORD(v53) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 16) + 28);
      v173[3] = objc_msgSend_numberWithFloat_(NSNumber, v54, v55, v53);
      uint64_t v175 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)v173, v172, 4);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v57, (uint64_t)&v175, &v174, 1);
      goto LABEL_57;
    }
    if (v19[8])
    {
      v170 = @"gyro";
      v168[0] = @"timestamp";
      v169[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v168[1] = @"x";
      LODWORD(v58) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 64) + 28);
      v169[1] = objc_msgSend_numberWithFloat_(NSNumber, v59, v60, v58);
      v168[2] = @"y";
      LODWORD(v61) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 64) + 32);
      v169[2] = objc_msgSend_numberWithFloat_(NSNumber, v62, v63, v61);
      v168[3] = @"z";
      LODWORD(v64) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 64) + 36);
      v169[3] = objc_msgSend_numberWithFloat_(NSNumber, v65, v66, v64);
      uint64_t v171 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v67, (uint64_t)v169, v168, 4);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v68, (uint64_t)&v171, &v170, 1);
      goto LABEL_57;
    }
    if (v19[9])
    {
      v166 = @"fastGyro";
      v164[0] = @"timestamp";
      v165[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v164[1] = @"x";
      LODWORD(v69) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 72) + 28);
      v165[1] = objc_msgSend_numberWithFloat_(NSNumber, v70, v71, v69);
      v164[2] = @"y";
      LODWORD(v72) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 72) + 32);
      v165[2] = objc_msgSend_numberWithFloat_(NSNumber, v73, v74, v72);
      v164[3] = @"z";
      LODWORD(v75) = *(_DWORD *)(*(void *)(*((void *)ptr + 125) + 72) + 36);
      v165[3] = objc_msgSend_numberWithFloat_(NSNumber, v76, v77, v75);
      uint64_t v167 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v78, (uint64_t)v165, v164, 4);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v79, (uint64_t)&v167, &v166, 1);
      goto LABEL_57;
    }
    if (v19[4])
    {
      v162 = @"deviceMotion";
      v160[0] = @"timestamp";
      v161[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v160[1] = @"qx";
      v161[1] = objc_msgSend_numberWithDouble_(NSNumber, v80, v81, *(double *)(*(void *)(*((void *)ptr + 125) + 32) + 16));
      v160[2] = @"qy";
      v161[2] = objc_msgSend_numberWithDouble_(NSNumber, v82, v83, *(double *)(*(void *)(*((void *)ptr + 125) + 32) + 24));
      v160[3] = @"qz";
      v161[3] = objc_msgSend_numberWithDouble_(NSNumber, v84, v85, *(double *)(*(void *)(*((void *)ptr + 125) + 32) + 32));
      v160[4] = @"qw";
      v161[4] = objc_msgSend_numberWithDouble_(NSNumber, v86, v87, *(double *)(*(void *)(*((void *)ptr + 125) + 32) + 8));
      uint64_t v163 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v88, (uint64_t)v161, v160, 5);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v89, (uint64_t)&v163, &v162, 1);
      goto LABEL_57;
    }
    if (v19[13])
    {
      v158 = @"pressure";
      v156[0] = @"timestamp";
      v157[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v156[1] = @"pressure";
      if ((*(_DWORD *)(*(void *)(*((void *)ptr + 125) + 104) + 16) & 0x7FFFFFFFu) >= 0x7F800000) {
        uint64_t v92 = objc_msgSend_numberWithDouble_(NSNumber, v90, v91, -1.0);
      }
      else {
        uint64_t v92 = objc_msgSend_numberWithDouble_(NSNumber, v90, v91, *(float *)(*(void *)(*((void *)ptr + 125) + 104) + 16));
      }
      v157[1] = v92;
      uint64_t v159 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v93, (uint64_t)v157, v156, 2);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v94, (uint64_t)&v159, &v158, 1);
      goto LABEL_57;
    }
    if (v19[10])
    {
      v154 = @"heartRate";
      v152[0] = @"timestamp";
      v153[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v152[1] = @"heartRate";
      double v97 = *(double *)(*(void *)(*(void *)(*((void *)ptr + 125) + 80) + 8) + 16);
      if ((*(void *)&v97 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
        double v97 = -1.0;
      }
      v153[1] = objc_msgSend_numberWithDouble_(NSNumber, v95, v96, v97);
      v152[2] = @"confidence";
      double v100 = *(double *)(*(void *)(*(void *)(*((void *)ptr + 125) + 80) + 8) + 8);
      if ((*(void *)&v100 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
        double v100 = 0.0;
      }
      v153[2] = objc_msgSend_numberWithDouble_(NSNumber, v98, v99, v100);
      uint64_t v155 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v101, (uint64_t)v153, v152, 3);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v102, (uint64_t)&v155, &v154, 1);
      goto LABEL_57;
    }
    if (v19[15])
    {
      v150 = @"wristState";
      v148[0] = @"timestamp";
      v149[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v148[1] = @"onWrist";
      v149[1] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v103, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 120) + 24));
      v148[2] = @"onWristSensor";
      v149[2] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v104, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 120) + 32));
      v148[3] = @"onWristConfidence";
      v149[3] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v105, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 120) + 28));
      v148[4] = @"isOnCharger";
      v149[4] = objc_msgSend_numberWithBool_(NSNumber, v106, *(unsigned __int8 *)(*(void *)(*((void *)ptr + 125) + 120) + 37));
      v148[5] = @"isForcedOnWristEnabled";
      v149[5] = objc_msgSend_numberWithBool_(NSNumber, v107, *(unsigned __int8 *)(*(void *)(*((void *)ptr + 125) + 120) + 36));
      v148[6] = @"isWristDetectionEnabled";
      v149[6] = objc_msgSend_numberWithBool_(NSNumber, v108, *(unsigned __int8 *)(*(void *)(*((void *)ptr + 125) + 120) + 38));
      uint64_t v151 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v109, (uint64_t)v149, v148, 7);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v110, (uint64_t)&v151, &v150, 1);
      goto LABEL_57;
    }
    if (v19[6])
    {
      v146 = @"state";
      v144[0] = @"timestamp";
      v145[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v144[1] = @"aopTsSensor";
      v145[1] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v113, *(void *)(*(void *)(*((void *)ptr + 125) + 48) + 16));
      v144[2] = @"state";
      v145[2] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v114, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 48) + 40));
      v144[3] = @"response";
      v145[3] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v115, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 48) + 36));
      v144[4] = @"resolution";
      v145[4] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v116, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 48) + 32));
      uint64_t v147 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v117, (uint64_t)v145, v144, 5);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v118, (uint64_t)&v147, &v146, 1);
      goto LABEL_57;
    }
    if (v19[7])
    {
      v142 = @"impact";
      v140[0] = @"timestamp";
      v141[0] = objc_msgSend_numberWithDouble_(NSNumber, a2, (uint64_t)a3, *((double *)ptr + 77));
      v140[1] = @"aopTsSensor";
      v141[1] = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v119, *(void *)(*(void *)(*((void *)ptr + 125) + 56) + 16));
      v140[2] = @"fallType";
      v141[2] = objc_msgSend_numberWithInt_(NSNumber, v120, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 56) + 68));
      v140[3] = @"isFall";
      v141[3] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v121, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 56) + 76));
      v140[4] = @"isNearFall";
      v141[4] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v122, *(unsigned int *)(*(void *)(*((void *)ptr + 125) + 56) + 80));
      uint64_t v143 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v123, (uint64_t)v141, v140, 5);
      int v30 = 1;
      uint64_t v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v124, (uint64_t)&v143, &v142, 1);
      goto LABEL_57;
    }
    if (qword_1E929D8E8 != -1) {
      dispatch_once(&qword_1E929D8E8, &unk_1EDFD1640);
    }
    v125 = qword_1E929D8F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8F0, OS_LOG_TYPE_FAULT))
    {
      uint64_t v126 = *((void *)ptr + 77);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v126;
      _os_log_impl(&dword_1902AF000, v125, OS_LOG_TYPE_FAULT, "Unknown fall snippet node [cftime=%f] - update CMFallStats", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8E8 != -1) {
        dispatch_once(&qword_1E929D8E8, &unk_1EDFD1640);
      }
      uint64_t v127 = *((void *)ptr + 77);
      int v136 = 134217984;
      uint64_t v137 = v127;
      v112 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMFallStatsItemsIterator countByEnumeratingWithState:objects:count:]", "CoreLocation: %s\n", v112);
LABEL_51:
      if (v112 != (char *)buf) {
        free(v112);
      }
    }
LABEL_24:
    int v30 = 0;
    v32 = 0;
LABEL_58:
    sub_19046A998((uint64_t)v134, (uint64_t)&self->fMslIterator);
    if (v135) {
      sub_1902D8B58(v135);
    }
    if (v30)
    {

      v130 = (NSDictionary *)objc_msgSend_copy(v32, v128, v129);
      self->_item = v130;
      *a3->var1 = v130;
      return 1;
    }
  }
  sub_190384FD0((uint64_t)&self->fMslReader);
  unint64_t result = 0;
  self->fMslReaderDelegate.fBuffer = 0;
  self->fMslReaderDelegate.fLength = 0;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->fMslIterator.fItem.__cntrl_;
  if (cntrl) {
    sub_1902D8B58((std::__shared_weak_count *)cntrl);
  }

  sub_190384FCC((uint64_t)&self->fMslReader);
}

- (id).cxx_construct
{
  self->fMslReaderDelegate._vptr$Delegate = (void **)&unk_1EDFD0398;
  *(_OWORD *)&self->fMslReaderDelegate.fBuffer = 0u;
  *(_OWORD *)&self->fMslIterator.fReader = 0u;
  self->fMslIterator.fItem.__cntrl_ = 0;
  return self;
}

@end