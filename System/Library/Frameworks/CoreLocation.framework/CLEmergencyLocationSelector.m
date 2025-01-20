@interface CLEmergencyLocationSelector
- (CLAssertion)fCleeaAssertion;
- (CLEmergencyLocationSelector)initWithConfig:(id)a3 bundle:(id)a4 delegate:(id)a5 queue:(id)a6;
- (CLEmergencyLocationSelectorDelegate)fDelegate;
- (CLLocationManager)fLocManager;
- (void)dealloc;
- (void)fInstance;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setFCleeaAssertion:(id)a3;
- (void)setFDelegate:(id)a3;
- (void)setFInstance:(void *)a3;
- (void)setFLocManager:(id)a3;
- (void)stopSession;
@end

@implementation CLEmergencyLocationSelector

- (CLEmergencyLocationSelector)initWithConfig:(id)a3 bundle:(id)a4 delegate:(id)a5 queue:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLEmergencyLocationSelector.mm", 288, @"Invalid parameter not satisfying: %@", @"config");
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_15:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLEmergencyLocationSelector.mm", 290, @"Invalid parameter not satisfying: %@", @"delegate");
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLEmergencyLocationSelector.mm", 289, @"Invalid parameter not satisfying: %@", @"bundle");
  if (!a5) {
    goto LABEL_15;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_16:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLEmergencyLocationSelector.mm", 291, @"Invalid parameter not satisfying: %@", @"queue");
LABEL_5:
  dispatch_assert_queue_V2((dispatch_queue_t)a6);
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v12 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,initWithConfig:bundle:delegate:queue:,initiated", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    LOWORD(v18) = 0;
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector initWithConfig:bundle:delegate:queue:]", "CoreLocation: %s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)CLEmergencyLocationSelector;
  v13 = [(CLEmergencyLocationSelector *)&v16 init];
  if (v13)
  {
    [a3 printConfiguration];
    v13->_fCleeaAssertion = (CLAssertion *)+[CLEmergencyEnablementAssertion newAssertionForBundle:withReason:](CLEmergencyEnablementAssertion, "newAssertionForBundle:withReason:", a4, [NSString stringWithFormat:@"Emergency Location Session for %@", +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", objc_msgSend(a3, "feature"))]);
    v13->_fLocManager = [[CLLocationManager alloc] initWithEffectiveBundle:a4 delegate:v13 onQueue:a6];
    objc_storeWeak((id *)&v13->_fDelegate, a5);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v9 = self;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,dealloc,self:%{private}@,initiated", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    int v6 = 138477827;
    v7 = self;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector dealloc]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLEmergencyLocationSelector *)self stopSession];
  v5.receiver = self;
  v5.super_class = (Class)CLEmergencyLocationSelector;
  [(CLEmergencyLocationSelector *)&v5 dealloc];
}

- (void)stopSession
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,stopSession,self:%{private}@,initiated", (uint8_t *)&buf, 0xCu);
  }
  v104 = self;
  v4 = self;
  if (sub_1906CB57C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    LODWORD(v105) = 138477827;
    *(void *)((char *)&v105 + 4) = self;
    v53 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector stopSession]", "CoreLocation: %s\n", v53);
    if (v53 != (char *)&buf) {
      free(v53);
    }
    v4 = self;
  }
  fLocManager = v4->_fLocManager;
  if (fLocManager)
  {
    [(CLLocationManager *)fLocManager stopUpdatingLocation];

    self->_fLocManager = 0;
    v4 = self;
  }
  fInstance = (unsigned __int8 *)v4->_fInstance;
  if (fInstance)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    v7 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134283521;
      *(void *)((char *)&buf + 4) = fInstance;
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,stopSession,this:%{private}p,initiated", (uint8_t *)&buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      LODWORD(v105) = 134283521;
      *(void *)((char *)&v105 + 4) = fInstance;
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::stopSession()", "CoreLocation: %s\n", v55);
      if (v55 != (char *)&buf) {
        free(v55);
      }
    }
    sub_190861C8C((uint64_t)(fInstance + 24), 2);
    if (*(void *)fInstance)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      v8 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        int v103 = fInstance[208];
        int v101 = [*(id *)fInstance firstLocationEarlyReturnEnabled];
        int v99 = fInstance[209];
        [*(id *)fInstance firstLocationTimeout];
        uint64_t v10 = v9;
        int v89 = *((_DWORD *)fInstance + 53);
        int v91 = *((_DWORD *)fInstance + 54);
        int v93 = *((_DWORD *)fInstance + 55);
        int v95 = *((_DWORD *)fInstance + 56);
        int v97 = *((_DWORD *)fInstance + 57);
        int v87 = [*(id *)fInstance firstUpdateEnabled];
        int v85 = fInstance[232];
        [*(id *)fInstance firstUpdateTimeout];
        uint64_t v12 = v11;
        int v13 = *((_DWORD *)fInstance + 59);
        int v14 = *((_DWORD *)fInstance + 60);
        int v79 = *((_DWORD *)fInstance + 61);
        int v81 = *((_DWORD *)fInstance + 62);
        int v83 = *((_DWORD *)fInstance + 63);
        int v15 = [*(id *)fInstance periodicUpdatesEnabled];
        int v16 = *((_DWORD *)fInstance + 64);
        int v17 = *((_DWORD *)fInstance + 65);
        int v18 = *((_DWORD *)fInstance + 66);
        int v19 = *((_DWORD *)fInstance + 67);
        int v20 = *((_DWORD *)fInstance + 68);
        int v75 = *((_DWORD *)fInstance + 69);
        int v77 = *((_DWORD *)fInstance + 70);
        [*(id *)fInstance locationUpdateTimeout];
        uint64_t v22 = v21;
        [*(id *)fInstance locationUpdateMinDelay];
        LODWORD(buf) = 67115776;
        DWORD1(buf) = v103;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v101;
        HIWORD(buf) = 1024;
        LODWORD(v123) = v99;
        WORD2(v123) = 2048;
        *(void *)((char *)&v123 + 6) = v10;
        HIWORD(v123) = 1024;
        LODWORD(v124) = v89;
        WORD2(v124) = 1024;
        *(_DWORD *)((char *)&v124 + 6) = v91;
        WORD5(v124) = 1024;
        HIDWORD(v124) = v93;
        LOWORD(v125) = 1024;
        *(_DWORD *)((char *)&v125 + 2) = v95;
        HIWORD(v125) = 1024;
        LODWORD(v126) = v97;
        WORD2(v126) = 1024;
        *(_DWORD *)((char *)&v126 + 6) = v87;
        WORD5(v126) = 1024;
        HIDWORD(v126) = v85;
        LOWORD(v127) = 2048;
        *(void *)((char *)&v127 + 2) = v12;
        WORD5(v127) = 1024;
        HIDWORD(v127) = v13;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v14;
        HIWORD(v128) = 1024;
        LODWORD(v129) = v79;
        WORD2(v129) = 1024;
        *(_DWORD *)((char *)&v129 + 6) = v81;
        WORD5(v129) = 1024;
        HIDWORD(v129) = v83;
        LOWORD(v130) = 1024;
        *(_DWORD *)((char *)&v130 + 2) = v15;
        HIWORD(v130) = 1024;
        LODWORD(v131) = v16;
        WORD2(v131) = 1024;
        *(_DWORD *)((char *)&v131 + 6) = v17;
        WORD5(v131) = 1024;
        HIDWORD(v131) = v18;
        LOWORD(v132) = 1024;
        *(_DWORD *)((char *)&v132 + 2) = v19;
        HIWORD(v132) = 1024;
        LODWORD(v133) = v20;
        WORD2(v133) = 1024;
        *(_DWORD *)((char *)&v133 + 6) = v75;
        WORD5(v133) = 1024;
        HIDWORD(v133) = v77;
        *(_WORD *)v134 = 2048;
        *(void *)&v134[2] = v22;
        *(_WORD *)&v134[10] = 2048;
        *(void *)&v134[12] = v23;
        _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "#CLELS,#careport,firstLocationAvailable,%d,firstLocationEarlyReturnEnabled,%d,wasFirstLocationEarlyReturn,%d,firstLocationTimeout,%f,locationTypeOfFirstLocation,%d,,horizontalAccOfFirstLocation,%d,verticalAccOfFirstLocation,%d,integrityOfFirstLocation,%d,ageOfFirstLocation,%d,firstUpdateEnabled,%d,firstUpdateLocAvailable,%d,firstUpdateTimeout,%f,locationTypeInFirstUpdate,%d,horizontalAccOfLocInFirstUpdate,%d,verticalAccOfLocInFirstUpdate,%d,integrityOfLocInFirstUpdate,%d,ageOfLocInFirstUpdate,%d,periodicUpdatesEnabled,%d,periodicUpdatesCount,%d,validPeriodUpdatesCount,%d,horizontalAccOfLocInBestPeriodicUpdate,%d,verticalAccOfLocInBestPeriodicUpdate,%d,integrityOfLocInBestPeriodicUpdate,%d,ageOfLocInBestPeriodicUpdate,%d,locationTypeInBestPeriodicUpdate,%d,locationUpdateTimeout,%f,locationUpdateMinDelay,%f", (uint8_t *)&buf, 0xB4u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
        }
        int v102 = fInstance[208];
        int v100 = [*(id *)fInstance firstLocationEarlyReturnEnabled];
        int v98 = fInstance[209];
        [*(id *)fInstance firstLocationTimeout];
        uint64_t v58 = v57;
        int v88 = *((_DWORD *)fInstance + 53);
        int v90 = *((_DWORD *)fInstance + 54);
        int v92 = *((_DWORD *)fInstance + 55);
        int v94 = *((_DWORD *)fInstance + 56);
        int v96 = *((_DWORD *)fInstance + 57);
        int v86 = [*(id *)fInstance firstUpdateEnabled];
        int v84 = fInstance[232];
        [*(id *)fInstance firstUpdateTimeout];
        uint64_t v60 = v59;
        int v62 = *((_DWORD *)fInstance + 59);
        int v61 = *((_DWORD *)fInstance + 60);
        int v76 = *((_DWORD *)fInstance + 61);
        int v80 = *((_DWORD *)fInstance + 62);
        int v82 = *((_DWORD *)fInstance + 63);
        int v63 = [*(id *)fInstance periodicUpdatesEnabled];
        int v64 = *((_DWORD *)fInstance + 64);
        int v65 = *((_DWORD *)fInstance + 65);
        int v66 = *((_DWORD *)fInstance + 66);
        int v67 = *((_DWORD *)fInstance + 67);
        int v68 = *((_DWORD *)fInstance + 68);
        int v74 = *((_DWORD *)fInstance + 69);
        int v78 = *((_DWORD *)fInstance + 70);
        [*(id *)fInstance locationUpdateTimeout];
        uint64_t v70 = v69;
        [*(id *)fInstance locationUpdateMinDelay];
        LODWORD(v105) = 67115776;
        DWORD1(v105) = v102;
        WORD4(v105) = 1024;
        *(_DWORD *)((char *)&v105 + 10) = v100;
        HIWORD(v105) = 1024;
        LODWORD(v106) = v98;
        WORD2(v106) = 2048;
        *(void *)((char *)&v106 + 6) = v58;
        HIWORD(v106) = 1024;
        LODWORD(v107) = v88;
        WORD2(v107) = 1024;
        *(_DWORD *)((char *)&v107 + 6) = v90;
        WORD5(v107) = 1024;
        HIDWORD(v107) = v92;
        LOWORD(v108) = 1024;
        *(_DWORD *)((char *)&v108 + 2) = v94;
        HIWORD(v108) = 1024;
        LODWORD(v109) = v96;
        WORD2(v109) = 1024;
        *(_DWORD *)((char *)&v109 + 6) = v86;
        WORD5(v109) = 1024;
        HIDWORD(v109) = v84;
        LOWORD(v110) = 2048;
        *(void *)((char *)&v110 + 2) = v60;
        WORD5(v110) = 1024;
        HIDWORD(v110) = v62;
        LOWORD(v111) = 1024;
        *(_DWORD *)((char *)&v111 + 2) = v61;
        HIWORD(v111) = 1024;
        LODWORD(v112) = v76;
        WORD2(v112) = 1024;
        *(_DWORD *)((char *)&v112 + 6) = v80;
        WORD5(v112) = 1024;
        HIDWORD(v112) = v82;
        LOWORD(v113) = 1024;
        *(_DWORD *)((char *)&v113 + 2) = v63;
        HIWORD(v113) = 1024;
        LODWORD(v114) = v64;
        WORD2(v114) = 1024;
        *(_DWORD *)((char *)&v114 + 6) = v65;
        WORD5(v114) = 1024;
        HIDWORD(v114) = v66;
        LOWORD(v115) = 1024;
        *(_DWORD *)((char *)&v115 + 2) = v67;
        HIWORD(v115) = 1024;
        LODWORD(v116) = v68;
        WORD2(v116) = 1024;
        *(_DWORD *)((char *)&v116 + 6) = v74;
        WORD5(v116) = 1024;
        HIDWORD(v116) = v78;
        *(_WORD *)v117 = 2048;
        *(void *)&v117[2] = v70;
        *(_WORD *)&v117[10] = 2048;
        *(void *)&v117[12] = v71;
        v72 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::submitSipSessionStatsToCA()", "CoreLocation: %s\n", v72);
        if (v72 != (char *)&buf) {
          free(v72);
        }
      }
      *(void *)&long long v105 = @"firstLocationAvailable";
      *(void *)&long long buf = [NSNumber numberWithBool:fInstance[208]];
      *((void *)&v105 + 1) = @"firstLocationEarlyReturnEnabled";
      *((void *)&buf + 1) = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)fInstance, "firstLocationEarlyReturnEnabled"));
      *(void *)&long long v106 = @"wasFirstLocationEarlyReturn";
      *(void *)&long long v123 = [NSNumber numberWithBool:fInstance[209]];
      *((void *)&v106 + 1) = @"firstLocationTimeout";
      v24 = NSNumber;
      [*(id *)fInstance firstLocationTimeout];
      *((void *)&v123 + 1) = objc_msgSend(v24, "numberWithDouble:");
      *(void *)&long long v107 = @"locationTypeOfFirstLocation";
      *(void *)&long long v124 = [NSNumber numberWithInt:*((unsigned int *)fInstance + 53)];
      *((void *)&v107 + 1) = @"horizontalAccOfFirstLocation";
      if ((*((_DWORD *)fInstance + 54) & 0x80000000) != 0) {
        uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      *((void *)&v124 + 1) = v25;
      v108 = @"verticalAccOfFirstLocation";
      if ((*((_DWORD *)fInstance + 55) & 0x80000000) != 0) {
        uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      uint64_t v125 = v28;
      *(void *)&long long v109 = @"integrityOfFirstLocation";
      *(void *)&long long v126 = [NSNumber numberWithInt:*((unsigned int *)fInstance + 56)];
      *((void *)&v109 + 1) = @"ageOfFirstLocation";
      if ((*((_DWORD *)fInstance + 57) & 0x80000000) != 0) {
        uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v29 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      *((void *)&v126 + 1) = v29;
      *(void *)&long long v110 = @"firstUpdateEnabled";
      *(void *)&long long v127 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)fInstance, "firstUpdateEnabled"));
      *((void *)&v110 + 1) = @"firstUpdateLocAvailable";
      *((void *)&v127 + 1) = [NSNumber numberWithBool:fInstance[232]];
      v111 = @"firstUpdateLocTimeout";
      v30 = NSNumber;
      [*(id *)fInstance firstUpdateTimeout];
      uint64_t v128 = objc_msgSend(v30, "numberWithDouble:");
      *(void *)&long long v112 = @"locationTypeInFirstUpdate";
      *(void *)&long long v129 = [NSNumber numberWithInt:*((unsigned int *)fInstance + 59)];
      *((void *)&v112 + 1) = @"horizontalAccOfLocInFirstUpdate";
      if ((*((_DWORD *)fInstance + 60) & 0x80000000) != 0) {
        uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v31 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      *((void *)&v129 + 1) = v31;
      v113 = @"verticalAccOfLocInFirstUpdate";
      if ((*((_DWORD *)fInstance + 61) & 0x80000000) != 0) {
        uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      uint64_t v130 = v32;
      *(void *)&long long v114 = @"integrityOfLocInFirstUpdate";
      *(void *)&long long v131 = [NSNumber numberWithInt:*((unsigned int *)fInstance + 62)];
      *((void *)&v114 + 1) = @"ageOfLocInFirstUpdate";
      if ((*((_DWORD *)fInstance + 63) & 0x80000000) != 0) {
        uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v33 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      *((void *)&v131 + 1) = v33;
      v115 = @"periodicUpdatesEnabled";
      uint64_t v132 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)fInstance, "periodicUpdatesEnabled"));
      *(void *)&long long v116 = @"periodicUpdatesCount";
      *(void *)&long long v133 = [NSNumber numberWithInt:*((unsigned int *)fInstance + 64)];
      *((void *)&v116 + 1) = @"validPeriodUpdatesCount";
      *((void *)&v133 + 1) = [NSNumber numberWithInt:*((unsigned int *)fInstance + 65)];
      *(void *)v117 = @"horizontalAccOfLocInBestPeriodicUpdate";
      if ((*((_DWORD *)fInstance + 66) & 0x80000000) != 0) {
        uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v34 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      *(void *)v134 = v34;
      *(void *)&v117[8] = @"verticalAccOfLocInBestPeriodicUpdate";
      if ((*((_DWORD *)fInstance + 67) & 0x80000000) != 0) {
        uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v35 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      *(void *)&v134[8] = v35;
      *(void *)&v117[16] = @"integrityOfLocInBestPeriodicUpdate";
      *(void *)&v134[16] = [NSNumber numberWithInt:*((unsigned int *)fInstance + 68)];
      v118 = @"ageOfLocInBestPeriodicUpdate";
      if ((*((_DWORD *)fInstance + 69) & 0x80000000) != 0) {
        uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      }
      else {
        uint64_t v36 = objc_msgSend(NSNumber, "numberWithInt:");
      }
      uint64_t v135 = v36;
      v119 = @"locationTypeInBestPeriodicUpdate";
      uint64_t v136 = [NSNumber numberWithInt:*((unsigned int *)fInstance + 70)];
      v120 = @"locationUpdateTimeout";
      v37 = NSNumber;
      [*(id *)fInstance locationUpdateTimeout];
      uint64_t v137 = objc_msgSend(v37, "numberWithDouble:");
      v121 = @"locationUpdateMinDelay";
      v38 = NSNumber;
      [*(id *)fInstance locationUpdateMinDelay];
      uint64_t v138 = objc_msgSend(v38, "numberWithDouble:");
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v105 count:27];
      AnalyticsSendEventLazy();
    }
    else
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      v26 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134283521;
        *(void *)((char *)&buf + 4) = fInstance;
        _os_log_impl(&dword_1906B8000, v26, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,submitSipSessionStatsToCA,this:%{private}p,nil fConfig,early return", (uint8_t *)&buf, 0xCu);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
        }
        LODWORD(v105) = 134283521;
        *(void *)((char *)&v105 + 4) = fInstance;
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::submitSipSessionStatsToCA()", "CoreLocation: %s\n", v27);
        if (v27 != (char *)&buf) {
          free(v27);
        }
      }
    }
    *((_WORD *)fInstance + 104) = 0;
    *(_OWORD *)(fInstance + 212) = xmmword_190886560;
    *((_DWORD *)fInstance + 57) = -1;
    fInstance[232] = 0;
    *(_OWORD *)(fInstance + 236) = xmmword_190886560;
    *(_OWORD *)(fInstance + 252) = xmmword_190886570;
    *(void *)&long long v39 = 0xFFFFFFFFLL;
    *((void *)&v39 + 1) = 0xFFFFFFFFLL;
    *(_OWORD *)(fInstance + 268) = v39;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    v40 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134283521;
      *(void *)((char *)&buf + 4) = fInstance;
      _os_log_impl(&dword_1906B8000, v40, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,stopSession,this:%{private}p,completed", (uint8_t *)&buf, 0xCu);
    }
    v4 = v104;
    if (sub_1906CB57C(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      LODWORD(v105) = 134283521;
      *(void *)((char *)&v105 + 4) = fInstance;
      v56 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::stopSession()", "CoreLocation: %s\n", v56);
      if (v56 != (char *)&buf) {
        free(v56);
      }
      v4 = v104;
    }
    v41 = v4->_fInstance;
    if (v41)
    {
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      v42 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134283521;
        *(void *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_1906B8000, v42, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorInternal,destructor,this:%{private}p,initiated", (uint8_t *)&buf, 0xCu);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
        }
        LODWORD(v105) = 134283521;
        *(void *)((char *)&v105 + 4) = v41;
        v73 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "CLEmergencyLocationSelectorInternal::~CLEmergencyLocationSelectorInternal()", "CoreLocation: %s\n", v73);
        if (v73 != (char *)&buf) {
          free(v73);
        }
      }
      if (*(void *)v41)
      {

        *(void *)v41 = 0;
      }
      v43 = *((void *)v41 + 1);
      if (v43)
      {
        dispatch_release(v43);
        *((void *)v41 + 1) = 0;
      }
      v44 = (void *)*((void *)v41 + 19);
      if (v44)
      {

        *((void *)v41 + 19) = 0;
      }
      v45 = (void *)*((void *)v41 + 20);
      if (v45)
      {

        *((void *)v41 + 20) = 0;
      }
      v46 = (void *)*((void *)v41 + 22);
      if (v46)
      {

        *((void *)v41 + 22) = 0;
      }
      v47 = (void *)*((void *)v41 + 23);
      if (v47)
      {

        *((void *)v41 + 23) = 0;
      }
      v48 = (void *)*((void *)v41 + 24);
      if (v48)
      {

        *((void *)v41 + 24) = 0;
      }
      v49 = (void *)*((void *)v41 + 25);
      if (v49)
      {

        *((void *)v41 + 25) = 0;
      }
      v50 = (void *)*((void *)v41 + 2);
      if (v50)
      {

        *((void *)v41 + 2) = 0;
      }
      sub_190868504((uint64_t)v41 + 24);
      MEMORY[0x192FCEAD0](v41, 0x10B2C40AA91F4E7);
    }
    v4->_fInstance = 0;
  }
  fCleeaAssertion = v4->_fCleeaAssertion;
  if (fCleeaAssertion)
  {
    [(CLAssertion *)fCleeaAssertion invalidate];

    v104->_fCleeaAssertion = 0;
    v4 = v104;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v52 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1906B8000, v52, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,stopSession,self:%{private}@,completed", (uint8_t *)&buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    LODWORD(v105) = 138477827;
    *(void *)((char *)&v105 + 4) = v104;
    v54 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector stopSession]", "CoreLocation: %s\n", v54);
    if (v54 != (char *)&buf) {
      free(v54);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (![(CLEmergencyLocationSelector *)self fInstance])
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    v26 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138477827;
      int v92 = self;
      _os_log_impl(&dword_1906B8000, v26, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,locationManager:didUpdateLocations,self:%{private}@,nil fInstance,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    *(_DWORD *)v50 = 138477827;
    v51 = self;
    uint64_t v28 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector locationManager:didUpdateLocations:]", "CoreLocation: %s\n");
    goto LABEL_43;
  }
  if (!a4 || ![a4 count]) {
    return;
  }
  int v6 = (void *)[a4 lastObject];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138478083;
    int v92 = self;
    __int16 v93 = 2049;
    int v94 = [(CLEmergencyLocationSelector *)self fInstance];
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelector,locationManager:didUpdateLocations,self:%{private}@,fInstance:%{private}p", buf, 0x16u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    *(_DWORD *)v50 = 138478083;
    v51 = self;
    __int16 v52 = 2049;
    v53 = [(CLEmergencyLocationSelector *)self fInstance];
    uint64_t v32 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelector locationManager:didUpdateLocations:]", "CoreLocation: %s\n", v32);
    if (v32 != (char *)buf) {
      free(v32);
    }
  }
  v8 = [(CLEmergencyLocationSelector *)self fInstance];
  if (!*v8)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    v27 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134283521;
      int v92 = (CLEmergencyLocationSelector *)v8;
      _os_log_impl(&dword_1906B8000, v27, OS_LOG_TYPE_ERROR, "#CLELS,CLEmergencyLocationSelectorInternal,updateLocation,this:%{private}p,nil fConfig,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    *(_DWORD *)v50 = 134283521;
    v51 = (CLEmergencyLocationSelector *)v8;
    uint64_t v28 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::updateLocation(CLLocation *)", "CoreLocation: %s\n");
LABEL_43:
    if (v28 == buf) {
      return;
    }
    goto LABEL_44;
  }
  if (v6)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    uint64_t v9 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", [*v8 feature]);
      [v6 coordinate];
      uint64_t v12 = v11;
      [v6 coordinate];
      uint64_t v14 = v13;
      [v6 horizontalAccuracy];
      uint64_t v16 = v15;
      [v6 altitude];
      uint64_t v18 = v17;
      [v6 ellipsoidalAltitude];
      uint64_t v20 = v19;
      [v6 verticalAccuracy];
      uint64_t v22 = v21;
      uint64_t v23 = [v6 timestamp];
      [v6 clientLocation];
      int v24 = v95;
      int v25 = [v6 integrity];
      *(_DWORD *)v50 = 138545667;
      v51 = v10;
      __int16 v52 = 2049;
      v53 = v12;
      __int16 v54 = 2049;
      uint64_t v55 = v14;
      __int16 v56 = 2050;
      uint64_t v57 = v16;
      __int16 v58 = 2049;
      uint64_t v59 = v18;
      __int16 v60 = 2049;
      uint64_t v61 = v20;
      __int16 v62 = 2050;
      uint64_t v63 = v22;
      __int16 v64 = 2114;
      uint64_t v65 = v23;
      __int16 v66 = 1026;
      int v67 = v24;
      __int16 v68 = 1026;
      int v69 = v25;
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,updateLocation,lat,%{private}.7f,lon,%{private}.7f,hunc,%{public}f,alt,%{private}f,ellipsoidalAlt,%{private}f,vunc,%{public}f,timestamp,%{public}@,locationType,%{public}d,integrity,%{public}d", v50, 0x5Eu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      id v33 = +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", [*v8 feature]);
      [v6 coordinate];
      uint64_t v35 = v34;
      [v6 coordinate];
      uint64_t v37 = v36;
      [v6 horizontalAccuracy];
      uint64_t v39 = v38;
      [v6 altitude];
      uint64_t v41 = v40;
      [v6 ellipsoidalAltitude];
      uint64_t v43 = v42;
      [v6 verticalAccuracy];
      uint64_t v45 = v44;
      uint64_t v46 = [v6 timestamp];
      [v6 clientLocation];
      int v47 = v70;
      int v48 = [v6 integrity];
      int v71 = 138545667;
      id v72 = v33;
      __int16 v73 = 2049;
      uint64_t v74 = v35;
      __int16 v75 = 2049;
      uint64_t v76 = v37;
      __int16 v77 = 2050;
      uint64_t v78 = v39;
      __int16 v79 = 2049;
      uint64_t v80 = v41;
      __int16 v81 = 2049;
      uint64_t v82 = v43;
      __int16 v83 = 2050;
      uint64_t v84 = v45;
      __int16 v85 = 2114;
      uint64_t v86 = v46;
      __int16 v87 = 1026;
      int v88 = v47;
      __int16 v89 = 1026;
      int v90 = v48;
      v49 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLEmergencyLocationSelectorInternal::updateLocation(CLLocation *)", "CoreLocation: %s\n", v49);
      if (v49 != (char *)buf) {
        free(v49);
      }
    }

    v8[19] = (id)[v6 copy];
    sub_190861C8C((uint64_t)(v8 + 3), 3);
    return;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  uint64_t v29 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_ERROR))
  {
    v30 = +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", [*v8 feature]);
    *(_DWORD *)long long buf = 138543362;
    int v92 = v30;
    _os_log_impl(&dword_1906B8000, v29, OS_LOG_TYPE_ERROR, "#CLELS,%{public}@,updateLocation,nil Location object", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    uint64_t v31 = +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", [*v8 feature]);
    *(_DWORD *)v50 = 138543362;
    v51 = v31;
    uint64_t v28 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "void CLEmergencyLocationSelectorInternal::updateLocation(CLLocation *)", "CoreLocation: %s\n", (const char *)v28);
    if (v28 != buf) {
LABEL_44:
    }
      free(v28);
  }
}

- (void)fInstance
{
  return self->_fInstance;
}

- (void)setFInstance:(void *)a3
{
  self->_fInstance = a3;
}

- (CLLocationManager)fLocManager
{
  return self->_fLocManager;
}

- (void)setFLocManager:(id)a3
{
  self->_fLocManager = (CLLocationManager *)a3;
}

- (CLEmergencyLocationSelectorDelegate)fDelegate
{
  return (CLEmergencyLocationSelectorDelegate *)objc_loadWeak((id *)&self->_fDelegate);
}

- (void)setFDelegate:(id)a3
{
}

- (CLAssertion)fCleeaAssertion
{
  return self->_fCleeaAssertion;
}

- (void)setFCleeaAssertion:(id)a3
{
  self->_fCleeaAssertion = (CLAssertion *)a3;
}

- (void).cxx_destruct
{
}

@end