@interface CMWorkoutManagerInternal
- (BOOL)_isReminderAllowedForType:(int64_t)a3;
- (BOOL)_shouldAllowMotionCalibrationPromptsForWorkoutType:(int64_t)a3;
- (CMWorkoutManagerInternal)init;
- (void)_beginWorkoutSession:(id)a3 withWorkout:(id)a4 enableWorkoutChangeDetection:(BOOL)a5;
- (void)_checkWorkout:(id)a3;
- (void)_endWorkoutSession:(id)a3;
- (void)_getPromptsNeededForWorkoutType:(int64_t)a3 handler:(id)a4;
- (void)_handleDaemonEvent:(id)a3;
- (void)_handleDaemonResponse:(id)a3;
- (void)_muteReminderType:(int64_t)a3 mute:(BOOL)a4;
- (void)_pauseWorkout:(id)a3;
- (void)_registerForWorkoutEvents;
- (void)_resumeWorkout:(id)a3;
- (void)_setCurrentWorkoutType:(id)a3 isManualTransition:(BOOL)a4;
- (void)_setReminderMuteSettingsForType:(int64_t)a3 mute:(BOOL)a4;
- (void)_setSuggestedStopTimeout:(double)a3;
- (void)_setWorkout:(id)a3;
- (void)_snapshotWithCompletion:(id)a3;
- (void)_startWorkout:(id)a3;
- (void)_stopWorkout:(id)a3;
- (void)_teardown;
- (void)_triggerWorkoutLocationUpdateForTesting:(int64_t)a3;
- (void)_unregisterForWorkoutEvents;
- (void)_userDismissedWorkoutAlert;
- (void)dealloc;
@end

@implementation CMWorkoutManagerInternal

- (void)_beginWorkoutSession:(id)a3 withWorkout:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v10, v9);
  if (ExecutablePathFromPid)
  {
    uint64_t v14 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    v15 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138413570;
      *(void *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(void *)&buf_4[10] = a4;
      __int16 v47 = 1024;
      BOOL v48 = v5;
      __int16 v49 = 2112;
      uint64_t v50 = v14;
      __int16 v51 = 1024;
      pid_t v52 = getpid();
      __int16 v53 = 2048;
      v54 = self;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_DEFAULT, "WorkoutSession, begin session, %@, %@, %d, %@, %d, %p", (uint8_t *)&buf, 0x36u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      *(_DWORD *)v34 = 138413570;
      *(void *)&v34[4] = a3;
      __int16 v35 = 2112;
      id v36 = a4;
      __int16 v37 = 1024;
      BOOL v38 = v5;
      __int16 v39 = 2112;
      uint64_t v40 = v14;
      __int16 v41 = 1024;
      pid_t v42 = getpid();
      __int16 v43 = 2048;
      v44 = self;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _beginWorkoutSession:withWorkout:enableWorkoutChangeDetection:]", "CoreLocation: %s\n", v25);
      if (v25 != (char *)&buf) {
        free(v25);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v16 = objc_msgSend_workouts(a3, v12, v13);
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v27, v33, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend__checkWorkout_(self, v18, *(void *)(*((void *)&v27 + 1) + 8 * i));
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v27, v33, 16);
      }
      while (v19);
    }
    objc_msgSend__checkWorkout_(self, v18, (uint64_t)a4);
    v31[0] = @"CMWorkoutAttributes";
    v31[1] = @"CMWorkoutOverviewData";
    v32[0] = a4;
    v32[1] = a3;
    v31[2] = @"CMWorkoutEnableWorkoutChangeDetection";
    v32[2] = objc_msgSend_numberWithBool_(NSNumber, v22, v5);
    *(void *)v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v32, v31, 3);
    sub_19044262C("kCLConnectionMessageBeginWorkoutSession", v34, &buf);
    v26 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v26) {
      sub_1902D8B58(v26);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  objc_msgSend__setWorkout_(self, v12, (uint64_t)a4);
  id v24 = a3;

  self->fWorkoutOverview = (CMWorkoutOverview *)a3;
  self->fSessionState = 1;
  self->fEnableWorkoutChangeDetection = v5;
}

- (CMWorkoutManagerInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMWorkoutManagerInternal;
  v2 = [(CMWorkoutManagerInternal *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMWorkoutManager", v3);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutManagerInternal;
  [(CMWorkoutManagerInternal *)&v3 dealloc];
}

- (void)_teardown
{
  objc_msgSend__unregisterForWorkoutEvents(self, a2, v2);
  sub_1902C3F54(&__p, "kCLConnectionMessageWorkoutEvent");
  CLConnectionClient::setHandlerForMessage();
  if (v7 < 0) {
    operator delete(__p);
  }
  self->fSessionState = 0;
  objc_msgSend__setWorkout_(self, v4, 0);

  self->fWorkoutOverview = 0;
  self->fEnableWorkoutChangeDetection = 0;
  if (self->fLocationdConnection)
  {
    uint64_t v5 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v5, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;

  self->fMuteSettings = 0;
}

- (void)_startWorkout:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v8 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v9 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138413058;
      id v30 = a3;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      __int16 v33 = 1024;
      pid_t v34 = getpid();
      __int16 v35 = 2048;
      id v36 = self;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEFAULT, "Workout, START, %@, %@, %d, %p", buf, 0x26u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      int v21 = 138413058;
      id v22 = a3;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 1024;
      pid_t v26 = getpid();
      __int16 v27 = 2048;
      long long v28 = self;
      uint64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _startWorkout:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  v10 = [CMWorkoutOverview alloc];
  uint64_t v13 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v11, v12);
  id v20 = a3;
  uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)&v20, 1);
  id v17 = (id)objc_msgSend_initWithOverviewId_workouts_(v10, v16, v13, v15);
  objc_msgSend__beginWorkoutSession_withWorkout_enableWorkoutChangeDetection_(self, v18, (uint64_t)v17, a3, 0);
}

- (void)_stopWorkout:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v9 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    v10 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 138413058;
      id v13 = a3;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      pid_t v17 = getpid();
      __int16 v18 = 2048;
      uint64_t v19 = self;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "Workout, STOP, %@, %@, %d, %p", buf, 0x26u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      getpid();
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _stopWorkout:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  objc_msgSend__endWorkoutSession_(self, v8, (uint64_t)a3);
}

- (void)_setSuggestedStopTimeout:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v10 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    v11 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138412802;
      *(void *)buf_4 = v10;
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = getpid();
      __int16 v24 = 2048;
      __int16 v25 = self;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "Workout, Registering suggested stop timeout, %@, %d, %p", (uint8_t *)&buf, 0x1Cu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      *(_DWORD *)pid_t v17 = 138412802;
      *(void *)&v17[4] = v10;
      __int16 v18 = 1024;
      pid_t v19 = getpid();
      __int16 v20 = 2048;
      int v21 = self;
      id v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _setSuggestedStopTimeout:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)&buf) {
        free(v13);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    uint64_t v15 = @"CMWorkoutTimeout";
    uint64_t v16 = objc_msgSend_numberWithDouble_(NSNumber, v8, v9, a3);
    *(void *)pid_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v16, &v15, 1);
    sub_1904EF1FC("kCLConnectionMessageSetWorkoutTimeout", v17, &buf);
    __int16 v14 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v14) {
      sub_1902D8B58(v14);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
}

- (void)_userDismissedWorkoutAlert
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v4, v3);
  if (ExecutablePathFromPid)
  {
    uint64_t v6 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    char v7 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138412802;
      *(void *)buf_4 = v6;
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = getpid();
      __int16 v12 = 2048;
      id v13 = self;
      _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "Workout, User dismissed workout alert, %@, %d, %p", (uint8_t *)&buf, 0x1Cu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      getpid();
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _userDismissedWorkoutAlert]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)&buf) {
        free(v8);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    sub_1904EF348("kCLConnectionMessageUserDismissedWorkoutAlert", &buf);
    uint64_t v9 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v9) {
      sub_1902D8B58(v9);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
}

- (void)_triggerWorkoutLocationUpdateForTesting:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v9 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v10 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 134218754;
      *(void *)&uint8_t buf[4] = a3;
      __int16 v26 = 2112;
      uint64_t v27 = v9;
      __int16 v28 = 1024;
      pid_t v29 = getpid();
      __int16 v30 = 2048;
      __int16 v31 = self;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "Workout, SET LOCATION FOR TESTING, %zd, %@, %d, %p", buf, 0x26u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      int v17 = 134218754;
      int64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 1024;
      pid_t v22 = getpid();
      __int16 v23 = 2048;
      __int16 v24 = self;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _triggerWorkoutLocationUpdateForTesting:]", "CoreLocation: %s\n", v14);
      if (v14 != buf) {
        free(v14);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    uint64_t v15 = @"CMWorkoutTriggerWorkoutLocationEventForTesting";
    uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v8, a3);
    uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)&v16, &v15, 1);
    id v13 = (std::__shared_weak_count *)operator new(0x70uLL);
    v13->__shared_owners_ = 0;
    v13->__shared_weak_owners_ = 0;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
    sub_1902C3F54(buf, "kCLConnectionMessageTriggerWorkoutLocationEventForTesting");
    MEMORY[0x192FCC420](&v13[1], buf, v12);
    if (SHIBYTE(v28) < 0) {
      operator delete(*(void **)buf);
    }
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    CLConnectionClient::sendMessage();
    if (v13) {
      sub_1902D8B58(v13);
    }
    sub_1902D8B58(v13);
  }
}

- (void)_handleDaemonResponse:(id)a3
{
  *(void *)&v30[409] = *MEMORY[0x1E4F143B8];
  if (self->fDelegate)
  {
    if (a3)
    {
      if (!objc_msgSend_objectForKeyedSubscript_(a3, a2, @"CMErrorMessage")) {
        return;
      }
      uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
      char v7 = objc_msgSend_objectForKeyedSubscript_(a3, v5, @"CMErrorMessage");
      uint64_t v10 = objc_msgSend_integerValue(v7, v8, v9);
      uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(v6, v11, @"CMErrorDomain", v10, 0);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      id v13 = qword_1E929D940;
      if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(a3, v14, @"CMErrorMessage");
        int v18 = objc_msgSend_intValue(v15, v16, v17);
        fWorkout = self->fWorkout;
        *(_DWORD *)int buf = 67109378;
        v30[0] = v18;
        LOWORD(v30[1]) = 2112;
        *(void *)((char *)&v30[1] + 2) = fWorkout;
        _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_ERROR, "Workout, Error, %d, %@", buf, 0x12u);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_17;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      __int16 v21 = objc_msgSend_objectForKeyedSubscript_(a3, v20, @"CMErrorMessage");
      objc_msgSend_intValue(v21, v22, v23);
    }
    else
    {
      uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, @"CMErrorDomain", 103, 0);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      __int16 v24 = qword_1E929D940;
      if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_FAULT))
      {
        __int16 v25 = self->fWorkout;
        *(_DWORD *)int buf = 138412290;
        *(void *)__int16 v30 = v25;
        _os_log_impl(&dword_1902AF000, v24, OS_LOG_TYPE_FAULT, "Workout, nil event dictionary, %@", buf, 0xCu);
      }
      if (!sub_1902D8400(115, 0)) {
        goto LABEL_17;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
    }
    __int16 v28 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonResponse:]", "CoreLocation: %s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
LABEL_17:
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend_workoutManager_didFailWorkout_withError_(self->fDelegate, v26, (uint64_t)self->fSender, self->fWorkout, v12);
    }
    else if (objc_opt_respondsToSelector())
    {
      objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v27, (uint64_t)self->fSender, self->fWorkout, v12);
    }
  }
}

- (void)_handleDaemonEvent:(id)a3
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  if (!self->fDelegate) {
    return;
  }
  if (!a3)
  {
    uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, @"CMErrorDomain", 103, 0);
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    __int16 v25 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_FAULT))
    {
      fWorkout = self->fWorkout;
      *(_DWORD *)int buf = 138412290;
      *(void *)v239 = fWorkout;
      _os_log_impl(&dword_1902AF000, v25, OS_LOG_TYPE_FAULT, "Workout, nil event dictionary, %@", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 0)) {
      goto LABEL_35;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D938 == -1) {
      goto LABEL_196;
    }
LABEL_257:
    dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
LABEL_196:
    v191 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v191);
    if (v191 != (char *)buf) {
      free(v191);
    }
    goto LABEL_35;
  }
  if (objc_msgSend_objectForKeyedSubscript_(a3, a2, @"CMErrorMessage"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    char v7 = objc_msgSend_objectForKeyedSubscript_(a3, v5, @"CMErrorMessage");
    uint64_t v10 = objc_msgSend_integerValue(v7, v8, v9);
    uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(v6, v11, @"CMErrorDomain", v10, 0);
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(a3, v13, @"CMWorkoutAttributes");
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v15 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(a3, v16, @"CMErrorMessage");
      *(_DWORD *)int buf = 67109378;
      *(_DWORD *)v239 = objc_msgSend_intValue(v17, v18, v19);
      *(_WORD *)&v239[4] = 2112;
      *(void *)&v239[6] = v14;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_ERROR, "Workout, ERROR, %d, %@", buf, 0x12u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      v187 = objc_msgSend_objectForKeyedSubscript_(a3, v186, @"CMErrorMessage");
      objc_msgSend_intValue(v187, v188, v189);
      v190 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v190);
      if (v190 != (char *)buf) {
        free(v190);
      }
    }
    char v21 = objc_opt_respondsToSelector();
    fDelegate = self->fDelegate;
    if (v21)
    {
      fSender = self->fSender;
      __int16 v24 = (CMWorkout *)v14;
LABEL_37:
      objc_msgSend_workoutManager_didFailWorkout_withError_(fDelegate, v20, (uint64_t)fSender, v24, v12);
      return;
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v40, (uint64_t)self->fSender, v14, v12);
    }
    return;
  }
  if (objc_msgSend_objectForKeyedSubscript_(a3, v5, @"CMReturnCode")
    && objc_msgSend_objectForKeyedSubscript_(a3, v27, @"CMWorkoutAttributes"))
  {
    __int16 v28 = objc_msgSend_objectForKeyedSubscript_(a3, v27, @"CMReturnCode");
    unint64_t v31 = objc_msgSend_integerValue(v28, v29, v30);
    __int16 v33 = objc_msgSend_objectForKeyedSubscript_(a3, v32, @"CMWorkoutAttributes");
    uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(a3, v34, @"CMWorkoutOverviewData");
    uint64_t v37 = v35;
    switch(v31)
    {
      case 2uLL:
        if (!objc_msgSend_objectForKeyedSubscript_(a3, v36, @"CMWorkoutEventDate")) {
          goto LABEL_66;
        }
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v45 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v47 = objc_msgSend_objectForKeyedSubscript_(a3, v46, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v47, v48, v49);
          *(_DWORD *)int buf = 134218242;
          *(void *)v239 = v50;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          _os_log_impl(&dword_1902AF000, v45, OS_LOG_TYPE_DEFAULT, "Workout, WILL PAUSE at %f, %@", buf, 0x16u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v215 = objc_msgSend_objectForKeyedSubscript_(a3, v214, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v215, v216, v217);
          v218 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v218);
          if (v218 != (char *)buf) {
            free(v218);
          }
        }
        char v51 = objc_opt_respondsToSelector();
        __int16 v53 = self->fDelegate;
        if (v51)
        {
          v54 = self->fSender;
          uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(a3, v52, @"CMWorkoutEventDate");
          objc_msgSend_workoutManager_willPauseWorkout_atDate_(v53, v56, (uint64_t)v54, v33, v55);
        }
        else if (objc_opt_respondsToSelector())
        {
          v172 = self->fDelegate;
          v171 = self->fSender;
          uint64_t v173 = objc_msgSend_objectForKeyedSubscript_(a3, v170, @"CMWorkoutEventDate");
          objc_msgSend_workoutManagerWillPauseWorkout_workout_pauseDate_(v172, v174, (uint64_t)v171, v33, v173);
        }
        break;
      case 3uLL:
        if (!objc_msgSend_objectForKeyedSubscript_(a3, v36, @"CMWorkoutEventDate")) {
          goto LABEL_66;
        }
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v57 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          v59 = objc_msgSend_objectForKeyedSubscript_(a3, v58, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v59, v60, v61);
          *(_DWORD *)int buf = 134218242;
          *(void *)v239 = v62;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          _os_log_impl(&dword_1902AF000, v57, OS_LOG_TYPE_DEFAULT, "Workout, WILL RESUME at %f, %@", buf, 0x16u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v220 = objc_msgSend_objectForKeyedSubscript_(a3, v219, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v220, v221, v222);
          v223 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v223);
          if (v223 != (char *)buf) {
            free(v223);
          }
        }
        char v63 = objc_opt_respondsToSelector();
        v65 = self->fDelegate;
        if (v63)
        {
          v66 = self->fSender;
          uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(a3, v64, @"CMWorkoutEventDate");
          objc_msgSend_workoutManager_willResumeWorkout_atDate_(v65, v68, (uint64_t)v66, v33, v67);
        }
        else if (objc_opt_respondsToSelector())
        {
          v177 = self->fDelegate;
          v176 = self->fSender;
          uint64_t v178 = objc_msgSend_objectForKeyedSubscript_(a3, v175, @"CMWorkoutEventDate");
          objc_msgSend_workoutManagerWillResumeWorkout_workout_resumeDate_(v177, v179, (uint64_t)v176, v33, v178);
        }
        break;
      case 4uLL:
        int isReminderAllowedForType = objc_msgSend__isReminderAllowedForType_(self, v36, 2);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v70 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          v73 = objc_msgSend_endDate(v33, v71, v72);
          objc_msgSend_timeIntervalSinceReferenceDate(v73, v74, v75);
          *(_DWORD *)int buf = 134218498;
          *(void *)v239 = v76;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          __int16 v240 = 1024;
          int v241 = isReminderAllowedForType;
          _os_log_impl(&dword_1902AF000, v70, OS_LOG_TYPE_DEFAULT, "Workout, SUGGESTED STOP at %f, %@, allowed %d", buf, 0x1Cu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v195 = objc_msgSend_endDate(v33, v193, v194);
          objc_msgSend_timeIntervalSinceReferenceDate(v195, v196, v197);
          v198 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v198);
          if (v198 != (char *)buf) {
            free(v198);
          }
        }
        if (isReminderAllowedForType)
        {
          char v77 = objc_opt_respondsToSelector();
          v80 = self->fDelegate;
          if (v77)
          {
            v81 = self->fSender;
            uint64_t v82 = objc_msgSend_endDate(v33, v78, v79);
            objc_msgSend_workoutManager_suggestedStopWorkout_atDate_(v80, v83, (uint64_t)v81, v33, v82);
          }
          else if (objc_opt_respondsToSelector())
          {
            v183 = self->fDelegate;
            v182 = self->fSender;
            uint64_t v184 = objc_msgSend_endDate(v33, v180, v181);
            objc_msgSend_workoutManagerSuggestedStop_workout_stopDate_(v183, v185, (uint64_t)v182, v33, v184);
          }
        }
        break;
      case 6uLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v87 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          v89 = objc_msgSend_objectForKeyedSubscript_(a3, v88, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v89, v90, v91);
          *(_DWORD *)int buf = 134218242;
          *(void *)v239 = v92;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          _os_log_impl(&dword_1902AF000, v87, OS_LOG_TYPE_DEFAULT, "Workout, PREDICTION START DID MUTE at %f, %@", buf, 0x16u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v94 = objc_msgSend_objectForKeyedSubscript_(a3, v93, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v94, v95, v96);
          goto LABEL_95;
        }
        break;
      case 7uLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v97 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          v99 = objc_msgSend_objectForKeyedSubscript_(a3, v98, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v99, v100, v101);
          *(_DWORD *)int buf = 134218242;
          *(void *)v239 = v102;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          _os_log_impl(&dword_1902AF000, v97, OS_LOG_TYPE_DEFAULT, "Workout, LOCATION DID UPDATE at %f, %@", buf, 0x16u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v200 = objc_msgSend_objectForKeyedSubscript_(a3, v199, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v200, v201, v202);
          v203 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v203);
          if (v203 != (char *)buf) {
            free(v203);
          }
        }
        objc_msgSend__setWorkout_(self, v103, (uint64_t)v33);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend_workoutManager_workoutLocationEventUpdate_(self->fDelegate, v104, (uint64_t)self->fSender, v33);
        }
        break;
      case 8uLL:
      case 0xAuLL:
      case 0xBuLL:
        int v38 = objc_msgSend__isReminderAllowedForType_(self, v36, 0);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        __int16 v39 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 134218498;
          *(void *)v239 = v31;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          __int16 v240 = 1024;
          int v241 = v38;
          _os_log_impl(&dword_1902AF000, v39, OS_LOG_TYPE_DEFAULT, "Workout, PREDICTION, event %lu, %@, allowed %d", buf, 0x1Cu);
        }
        if (!sub_1902D8400(115, 2)) {
          goto LABEL_102;
        }
        bzero(buf, 0x65CuLL);
        if (qword_1E929D938 != -1) {
          goto LABEL_259;
        }
        goto LABEL_211;
      case 9uLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v105 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          *(void *)v239 = v33;
          _os_log_impl(&dword_1902AF000, v105, OS_LOG_TYPE_DEFAULT, "Workout, (internal only) PREDICTION UPDATE, %@", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
LABEL_95:
          v106 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v106);
          if (v106 != (char *)buf) {
            free(v106);
          }
        }
        break;
      case 0xCuLL:
        int v38 = objc_msgSend__isReminderAllowedForType_(self, v36, 2);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v107 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 134218498;
          *(void *)v239 = 12;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          __int16 v240 = 1024;
          int v241 = v38;
          _os_log_impl(&dword_1902AF000, v107, OS_LOG_TYPE_DEFAULT, "Workout, STOP RETRACTION, event %lu, %@, allowed %d", buf, 0x1Cu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
LABEL_259:
          }
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
LABEL_211:
          v204 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v204);
          if (v204 != (char *)buf) {
            free(v204);
          }
        }
LABEL_102:
        if (v38 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend_workoutManager_issuedPrediction_(self->fDelegate, v108, (uint64_t)self->fSender, v33);
        }
        break;
      case 0xDuLL:
        if (v35 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v122 = qword_1E929D940;
          if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            *(void *)v239 = v33;
            _os_log_impl(&dword_1902AF000, v122, OS_LOG_TYPE_DEFAULT, "Workout, SESSION DID BEGIN, %@", buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D938 != -1) {
              dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
            }
            v237 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v237);
            if (v237 != (char *)buf) {
              free(v237);
            }
          }
          objc_msgSend_workoutManager_didBeginWorkoutSessionWithWorkout_withOverview_(self->fDelegate, v123, (uint64_t)self->fSender, v33, v37);
        }
        else if (objc_opt_respondsToSelector())
        {
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v150 = qword_1E929D940;
          if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
          {
            started = objc_msgSend_startDate(v33, v151, v152);
            objc_msgSend_timeIntervalSinceReferenceDate(started, v154, v155);
            *(_DWORD *)int buf = 134218242;
            *(void *)v239 = v156;
            *(_WORD *)&v239[8] = 2112;
            *(void *)&v239[10] = v33;
            _os_log_impl(&dword_1902AF000, v150, OS_LOG_TYPE_DEFAULT, "Workout, DID START at %f, %@", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D938 != -1) {
              dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
            }
            v232 = objc_msgSend_startDate(v33, v230, v231);
            objc_msgSend_timeIntervalSinceReferenceDate(v232, v233, v234);
            v235 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v235);
            if (v235 != (char *)buf) {
              free(v235);
            }
          }
          v160 = self->fDelegate;
          v159 = self->fSender;
          uint64_t v161 = objc_msgSend_startDate(v33, v157, v158);
          objc_msgSend_workoutManager_didStartWorkout_atDate_(v160, v162, (uint64_t)v159, v33, v161);
        }
        else if (objc_opt_respondsToSelector())
        {
          v169 = self->fDelegate;
          v168 = self->fSender;
          objc_msgSend_objectForKeyedSubscript_(a3, v167, @"CMWorkoutEventDate");
          MEMORY[0x1F4181798](v169, sel_workoutManagerDidStartWorkout_workout_startDate_, v168);
        }
        break;
      case 0xEuLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v109 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          *(void *)v239 = v33;
          _os_log_impl(&dword_1902AF000, v109, OS_LOG_TYPE_DEFAULT, "Workout, SET CURRENT TYPE, %@", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v205 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v205);
          if (v205 != (char *)buf) {
            free(v205);
          }
        }
        if (v37)
        {
          objc_msgSend__setWorkout_(self, v110, (uint64_t)v33);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_workoutManager_didSetCurrentWorkoutType_withOverview_(self->fDelegate, v111, (uint64_t)self->fSender, v33, v37);
          }
        }
        break;
      case 0xFuLL:
        if (v35 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v112 = qword_1E929D940;
          if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 138412290;
            *(void *)v239 = v33;
            _os_log_impl(&dword_1902AF000, v112, OS_LOG_TYPE_DEFAULT, "Workout, SESSION DID END, %@", buf, 0xCu);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D938 != -1) {
              dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
            }
            v236 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v236);
            if (v236 != (char *)buf) {
              free(v236);
            }
          }
          objc_msgSend_workoutManager_didEndWorkoutSessionWithWorkout_withOverview_(self->fDelegate, v113, (uint64_t)self->fSender, v33, v37);
        }
        else if (objc_opt_respondsToSelector())
        {
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v137 = qword_1E929D940;
          if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
          {
            v140 = objc_msgSend_endDate(v33, v138, v139);
            objc_msgSend_timeIntervalSinceReferenceDate(v140, v141, v142);
            *(_DWORD *)int buf = 134218242;
            *(void *)v239 = v143;
            *(_WORD *)&v239[8] = 2112;
            *(void *)&v239[10] = v33;
            _os_log_impl(&dword_1902AF000, v137, OS_LOG_TYPE_DEFAULT, "Workout, DID STOP at %f, %@", buf, 0x16u);
          }
          if (sub_1902D8400(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D938 != -1) {
              dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
            }
            v226 = objc_msgSend_endDate(v33, v224, v225);
            objc_msgSend_timeIntervalSinceReferenceDate(v226, v227, v228);
            v229 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v229);
            if (v229 != (char *)buf) {
              free(v229);
            }
          }
          v147 = self->fDelegate;
          v146 = self->fSender;
          uint64_t v148 = objc_msgSend_endDate(v33, v144, v145);
          objc_msgSend_workoutManager_didStopWorkout_atDate_(v147, v149, (uint64_t)v146, v33, v148);
        }
        else if (objc_opt_respondsToSelector())
        {
          v166 = self->fDelegate;
          v165 = self->fSender;
          objc_msgSend_objectForKeyedSubscript_(a3, v164, @"CMWorkoutEventDate");
          MEMORY[0x1F4181798](v166, sel_workoutManagerDidStopWorkout_workout_stopDate_, v165);
        }
        break;
      case 0x10uLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v114 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          *(void *)v239 = v33;
          _os_log_impl(&dword_1902AF000, v114, OS_LOG_TYPE_DEFAULT, "Workout, PAUSED, %@", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v206 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v206);
          if (v206 != (char *)buf) {
            free(v206);
          }
        }
        if (v37)
        {
          objc_msgSend__setWorkout_(self, v115, (uint64_t)v33);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_workoutManager_didPauseWorkout_withOverview_(self->fDelegate, v116, (uint64_t)self->fSender, v33, v37);
          }
        }
        break;
      case 0x11uLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v117 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          *(void *)v239 = v33;
          _os_log_impl(&dword_1902AF000, v117, OS_LOG_TYPE_DEFAULT, "Workout, RESUMED, %@", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v207 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v207);
          if (v207 != (char *)buf) {
            free(v207);
          }
        }
        if (v37)
        {
          objc_msgSend__setWorkout_(self, v118, (uint64_t)v33);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_workoutManager_didResumeWorkout_withOverview_(self->fDelegate, v119, (uint64_t)self->fSender, v33, v37);
          }
        }
        break;
      case 0x12uLL:
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v120 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 138412290;
          *(void *)v239 = v33;
          _os_log_impl(&dword_1902AF000, v120, OS_LOG_TYPE_DEFAULT, "Workout, DETECTED CHANGE, %@", buf, 0xCu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v208 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v208);
          if (v208 != (char *)buf) {
            free(v208);
          }
        }
        if (v37 && (objc_opt_respondsToSelector() & 1) != 0) {
          objc_msgSend_workoutManager_detectedChangeInWorkoutType_withOverview_(self->fDelegate, v121, (uint64_t)self->fSender, v33, v37);
        }
        break;
      case 0x16uLL:
        int v124 = objc_msgSend__isReminderAllowedForType_(self, v36, 1);
        if (qword_1E929D938 != -1) {
          dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
        }
        v125 = qword_1E929D940;
        if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
        {
          v127 = objc_msgSend_objectForKeyedSubscript_(a3, v126, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v127, v128, v129);
          *(_DWORD *)int buf = 134218498;
          *(void *)v239 = v130;
          *(_WORD *)&v239[8] = 2112;
          *(void *)&v239[10] = v33;
          __int16 v240 = 1024;
          int v241 = v124;
          _os_log_impl(&dword_1902AF000, v125, OS_LOG_TYPE_DEFAULT, "Workout, RESUME SUGGESTION at %f, %@, allowed %d", buf, 0x1Cu);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v210 = objc_msgSend_objectForKeyedSubscript_(a3, v209, @"CMWorkoutEventDate");
          objc_msgSend_timeIntervalSinceReferenceDate(v210, v211, v212);
          v213 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v213);
          if (v213 != (char *)buf) {
            free(v213);
          }
        }
        if (v124 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v134 = self->fDelegate;
          v133 = self->fSender;
          uint64_t v135 = objc_msgSend_startDate(v33, v131, v132);
          objc_msgSend_workoutManager_suggestedResumeWorkout_atDate_(v134, v136, (uint64_t)v133, v33, v135);
        }
        break;
      default:
        if (v31 >= 2)
        {
LABEL_66:
          uint64_t v84 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v36, @"CMErrorDomain", 103, 0);
          if (qword_1E929D938 != -1) {
            dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
          }
          v85 = qword_1E929D940;
          if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)int buf = 138412546;
            *(void *)v239 = v33;
            *(_WORD *)&v239[8] = 2048;
            *(void *)&v239[10] = v31;
            _os_log_impl(&dword_1902AF000, v85, OS_LOG_TYPE_FAULT, "Workout, Unrecognized event, %@, %ld", buf, 0x16u);
          }
          if (sub_1902D8400(115, 0))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1E929D938 != -1) {
              dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
            }
            v192 = (char *)_os_log_send_and_compose_impl();
            sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _handleDaemonEvent:]", "CoreLocation: %s\n", v192);
            if (v192 != (char *)buf) {
              free(v192);
            }
          }
          if (objc_opt_respondsToSelector())
          {
            objc_msgSend_workoutManager_didFailWorkout_withError_(self->fDelegate, v86, (uint64_t)self->fSender, v33, v84);
          }
          else if (objc_opt_respondsToSelector())
          {
            objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v163, (uint64_t)self->fSender, v33, v84);
          }
        }
        break;
    }
    return;
  }
  uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v27, @"CMErrorDomain", 103, 0);
  if (qword_1E929D938 != -1) {
    dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
  }
  __int16 v41 = qword_1E929D940;
  if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_FAULT))
  {
    pid_t v42 = self->fWorkout;
    *(_DWORD *)int buf = 138412290;
    *(void *)v239 = v42;
    _os_log_impl(&dword_1902AF000, v41, OS_LOG_TYPE_FAULT, "Workout, Unrecognizable event dictionary, %@", buf, 0xCu);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D938 == -1) {
      goto LABEL_196;
    }
    goto LABEL_257;
  }
LABEL_35:
  char v43 = objc_opt_respondsToSelector();
  fDelegate = self->fDelegate;
  if (v43)
  {
    fSender = self->fSender;
    __int16 v24 = self->fWorkout;
    goto LABEL_37;
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_workoutManagerDidFail_workout_error_(self->fDelegate, v44, (uint64_t)self->fSender, self->fWorkout, v12);
  }
}

- (void)_registerForWorkoutEvents
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->fLocationdConnection)
  {
    sub_1902C3F54(&__p, "kCLConnectionMessageWorkoutEvent");
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = sub_1905F0B34;
    v5[4] = &unk_1E568D558;
    v5[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v8 < 0) {
      operator delete(__p);
    }
    uint64_t v9 = @"kCLConnectionMessageSubscribeKey";
    v10[0] = MEMORY[0x1E4F1CC38];
    v5[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v10, &v9, 1);
    sub_1905066B4("kCLConnectionMessageWorkoutEvent", v5, &__p);
    v4 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v4) {
      sub_1902D8B58(v4);
    }
    if (v7) {
      sub_1902D8B58(v7);
    }
  }
}

- (void)_unregisterForWorkoutEvents
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->fLocationdConnection)
  {
    sub_1902C3F54(&__p, "kCLConnectionMessageWorkoutEvent");
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = sub_1905F0DB8;
    v5[4] = &unk_1E568D558;
    v5[5] = self;
    CLConnectionClient::setHandlerForMessage();
    if (v8 < 0) {
      operator delete(__p);
    }
    uint64_t v9 = @"kCLConnectionMessageSubscribeKey";
    v10[0] = MEMORY[0x1E4F1CC28];
    v5[0] = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v3, (uint64_t)v10, &v9, 1);
    sub_1905066B4("kCLConnectionMessageWorkoutEvent", v5, &__p);
    v4 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v4) {
      sub_1902D8B58(v4);
    }
    if (v7) {
      sub_1902D8B58(v7);
    }
  }
}

- (BOOL)_shouldAllowMotionCalibrationPromptsForWorkoutType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x32) & (0x27EF809BA801EuLL >> a3);
}

- (void)_getPromptsNeededForWorkoutType:(int64_t)a3 handler:(id)a4
{
  if (objc_msgSend__shouldAllowMotionCalibrationPromptsForWorkoutType_(self, a2, a3))
  {
    sub_19044FADC("kCLConnectionMessageWorkoutPrompts", &v7);
    uint64_t v6 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v6) {
      sub_1902D8B58(v6);
    }
    if (v8) {
      sub_1902D8B58(v8);
    }
  }
  else
  {
    uint64_t v5 = (void (*)(id, void, void))*((void *)a4 + 2);
    v5(a4, 0, 0);
  }
}

- (void)_setCurrentWorkoutType:(id)a3 isManualTransition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v8, v7);
  if (ExecutablePathFromPid)
  {
    uint64_t v11 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v12 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138413314;
      *(void *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 1024;
      *(_DWORD *)&buf_4[10] = v4;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      __int16 v31 = 1024;
      pid_t v32 = getpid();
      __int16 v33 = 2048;
      pid_t v34 = self;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEFAULT, "WorkoutSession, set current type, %@, %d, %@, %d, %p", (uint8_t *)&buf, 0x2Cu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      *(_DWORD *)int v18 = 138413314;
      *(void *)&v18[4] = a3;
      __int16 v19 = 1024;
      BOOL v20 = v4;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 1024;
      pid_t v24 = getpid();
      __int16 v25 = 2048;
      __int16 v26 = self;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _setCurrentWorkoutType:isManualTransition:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)&buf) {
        free(v14);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    v16[0] = @"CMWorkoutAttributes";
    v16[1] = @"CMWorkoutIsManualTransition";
    v17[0] = a3;
    v17[1] = objc_msgSend_numberWithBool_(NSNumber, v10, v4);
    *(void *)int v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v17, v16, 2);
    sub_19044F990("kCLConnectionMessageSetCurrentWorkoutType", v18, &buf);
    uint64_t v15 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v15) {
      sub_1902D8B58(v15);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  objc_msgSend__setWorkout_(self, v10, (uint64_t)a3);
  self->fSessionState = 1;
}

- (void)_setWorkout:(id)a3
{
  if (!a3 || objc_msgSend_type(a3, a2, (uint64_t)a3) != 33)
  {
    id v5 = a3;

    self->fLastNonTransitionWorkout = (CMWorkout *)a3;
  }
  id v6 = a3;

  self->fWorkout = (CMWorkout *)a3;
}

- (void)_endWorkoutSession:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v9 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v10 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138413058;
      *(void *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(void *)&buf_4[10] = v9;
      __int16 v24 = 1024;
      pid_t v25 = getpid();
      __int16 v26 = 2048;
      uint64_t v27 = self;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "WorkoutSession, end session, %@, %@, %d, %p", (uint8_t *)&buf, 0x26u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      *(_DWORD *)uint64_t v15 = 138413058;
      *(void *)&v15[4] = a3;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      pid_t v19 = getpid();
      __int16 v20 = 2048;
      __int16 v21 = self;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _endWorkoutSession:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)&buf) {
        free(v11);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    id v13 = @"CMWorkoutAttributes";
    id v14 = a3;
    *(void *)uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)&v14, &v13, 1);
    sub_1904EF1FC("kCLConnectionMessageEndWorkoutSession", v15, &buf);
    uint64_t v12 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v12) {
      sub_1902D8B58(v12);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  objc_msgSend__setWorkout_(self, v8, 0);

  self->fWorkoutOverview = 0;
  self->fSessionState = 0;
  self->fEnableWorkoutChangeDetection = 0;
}

- (void)_pauseWorkout:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v9 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v10 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138413058;
      *(void *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(void *)&buf_4[10] = v9;
      __int16 v24 = 1024;
      pid_t v25 = getpid();
      __int16 v26 = 2048;
      uint64_t v27 = self;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "WorkoutSession, manually pause, %@, %@, %d, %p", (uint8_t *)&buf, 0x26u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      *(_DWORD *)uint64_t v15 = 138413058;
      *(void *)&v15[4] = a3;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      pid_t v19 = getpid();
      __int16 v20 = 2048;
      __int16 v21 = self;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _pauseWorkout:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)&buf) {
        free(v11);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    id v13 = @"CMWorkoutAttributes";
    id v14 = a3;
    *(void *)uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)&v14, &v13, 1);
    sub_1905066B4("kCLConnectionMessagePauseWorkout", v15, &buf);
    uint64_t v12 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v12) {
      sub_1902D8B58(v12);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  self->fSessionState = 2;
}

- (void)_resumeWorkout:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v9 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v10 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      int buf = 138413058;
      *(void *)buf_4 = a3;
      *(_WORD *)&buf_4[8] = 2112;
      *(void *)&buf_4[10] = v9;
      __int16 v24 = 1024;
      pid_t v25 = getpid();
      __int16 v26 = 2048;
      uint64_t v27 = self;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "WorkoutSession, manually resume, %@, %@, %d, %p", (uint8_t *)&buf, 0x26u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      *(_DWORD *)uint64_t v15 = 138413058;
      *(void *)&v15[4] = a3;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 1024;
      pid_t v19 = getpid();
      __int16 v20 = 2048;
      __int16 v21 = self;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _resumeWorkout:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)&buf) {
        free(v11);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    id v13 = @"CMWorkoutAttributes";
    id v14 = a3;
    *(void *)uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)&v14, &v13, 1);
    sub_1905869D4("kCLConnectionMessageResumeWorkout", v15, &buf);
    uint64_t v12 = *(std::__shared_weak_count **)&buf_4[4];
    if (*(void *)&buf_4[4]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf_4[4] + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v12) {
      sub_1902D8B58(v12);
    }
    if (*(void *)&buf_4[4]) {
      sub_1902D8B58(*(std::__shared_weak_count **)&buf_4[4]);
    }
  }
  self->fSessionState = 1;
}

- (void)_snapshotWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v6, v5);
  if (ExecutablePathFromPid)
  {
    uint64_t v8 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v9 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412802;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v17 = 1024;
      pid_t v18 = getpid();
      __int16 v19 = 2048;
      __int16 v20 = self;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_INFO, "[snapshot] getting state for %@, %d, %p", buf, 0x1Cu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      getpid();
      id v14 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _snapshotWithCompletion:]", "CoreLocation: %s\n", v14);
      if (v14 != buf) {
        free(v14);
      }
    }
  }
  if (self->fLocationdConnection)
  {
    uint64_t v10 = (std::__shared_weak_count *)operator new(0x70uLL);
    v10->__shared_owners_ = 0;
    v10->__shared_weak_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EDFD0DA0;
    sub_1902C3F54(buf, "kCLConnectionMessageWorkoutSnapshot");
    MEMORY[0x192FCC410](&v10[1], buf);
    if (SBYTE3(v20) < 0) {
      operator delete(*(void **)buf);
    }
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    CLConnectionClient::sendMessage();
    if (v10) {
      sub_1902D8B58(v10);
    }
    sub_1902D8B58(v10);
  }
  else
  {
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v11 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "[snapshot] error, no connection to locationd", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      uint64_t v15 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _snapshotWithCompletion:]", "CoreLocation: %s\n", v15);
      if (v15 != buf) {
        free(v15);
      }
    }
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, @"CMErrorDomain", 103, 0);
    (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, v13);
  }
}

- (void)_muteReminderType:(int64_t)a3 mute:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = getpid();
  uint64_t ExecutablePathFromPid = objc_msgSend_getExecutablePathFromPid_(CMMotionUtils, v8, v7);
  if (ExecutablePathFromPid)
  {
    uint64_t v11 = ExecutablePathFromPid;
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v12 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v4;
      *(_WORD *)pid_t v32 = 2048;
      *(void *)&v32[2] = a3;
      __int16 v33 = 2112;
      uint64_t v34 = v11;
      __int16 v35 = 1024;
      pid_t v36 = getpid();
      __int16 v37 = 2048;
      int v38 = self;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEFAULT, "Workout, reminder mute settings, setting mute behavior to %d for reminder type %ld for client %@, %d, %p", buf, 0x2Cu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      LODWORD(v22) = 67110146;
      HIDWORD(v22) = v4;
      __int16 v23 = 2048;
      int64_t v24 = a3;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 1024;
      pid_t v28 = getpid();
      __int16 v29 = 2048;
      uint64_t v30 = self;
      __int16 v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _muteReminderType:mute:]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  objc_msgSend__setReminderMuteSettingsForType_mute_(self, v10, a3, v4);
  if (self->fLocationdConnection)
  {
    v20[0] = @"CMWorkoutReminderSettingType";
    v21[0] = objc_msgSend_numberWithInteger_(NSNumber, v13, a3);
    v20[1] = @"CMWorkoutReminderMuteValue";
    v21[1] = objc_msgSend_numberWithBool_(NSNumber, v14, v4);
    uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v21, v20, 2);
    sub_190547BB4("kCLConnectionMessageUpdateWorkoutReminderMuteSetting", &v22, buf);
    __int16 v19 = *(std::__shared_weak_count **)v32;
    if (*(void *)v32) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)v32 + 8), 1uLL, memory_order_relaxed);
    }
    CLConnectionClient::sendMessage();
    if (v19) {
      sub_1902D8B58(v19);
    }
    if (*(void *)v32) {
      sub_1902D8B58(*(std::__shared_weak_count **)v32);
    }
  }
  else
  {
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    __int16 v16 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "Workout, reminder mute settings, no connection to locationd to send mute behavior", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      LOWORD(v22) = 0;
      pid_t v18 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _muteReminderType:mute:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
}

- (void)_checkWorkout:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_type(a3, a2, (uint64_t)a3) == 19)
  {
    if (!objc_msgSend_swimWorkoutInstance_(CMSwimWorkout, v4, (uint64_t)a3))
    {
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD44F0);
      }
      id v6 = qword_1E929D8C0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_FAULT, "Trying to start a swim session without using a CMSwimWorkout!  Treating this swim as an open water swim.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8B8 != -1) {
          dispatch_once(&qword_1E929D8B8, &unk_1EDFD44F0);
        }
LABEL_20:
        uint64_t v9 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMWorkoutManagerInternal _checkWorkout:]", "CoreLocation: %s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
  }
  else if (objc_msgSend_type(a3, v4, v5) == 14 {
         && !objc_msgSend_genericWorkoutInstance_(CMGenericWorkout, v7, (uint64_t)a3))
  }
  {
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    uint64_t v8 = qword_1E929D940;
    if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_ERROR, "Trying to start a generic workout without using CMGenericWorkout!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D938 != -1) {
        dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
      }
      goto LABEL_20;
    }
  }
}

- (void)_setReminderMuteSettingsForType:(int64_t)a3 mute:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_numberWithBool_(NSNumber, a2, a4);
  fMuteSettings = self->fMuteSettings;
  uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v9, a3);
  objc_msgSend_setObject_forKeyedSubscript_(fMuteSettings, v11, v7, v10);
  if (qword_1E929D938 != -1) {
    dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
  }
  uint64_t v12 = qword_1E929D940;
  if (os_log_type_enabled((os_log_t)qword_1E929D940, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 134219008;
    int64_t v21 = a3;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    __int16 v24 = 1024;
    int isReminderAllowedForType = objc_msgSend__isReminderAllowedForType_(self, v13, 0);
    __int16 v26 = 1024;
    int v27 = objc_msgSend__isReminderAllowedForType_(self, v14, 1);
    __int16 v28 = 1024;
    int v29 = objc_msgSend__isReminderAllowedForType_(self, v15, 2);
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_DEFAULT, "Workout, reminder mute settings, setting type %ld to %d, current snapshot, start = %d, resume = %d, end = %d", buf, 0x24u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D938 != -1) {
      dispatch_once(&qword_1E929D938, &unk_1EDFD2D80);
    }
    objc_msgSend__isReminderAllowedForType_(self, v16, 0);
    objc_msgSend__isReminderAllowedForType_(self, v17, 1);
    objc_msgSend__isReminderAllowedForType_(self, v18, 2);
    __int16 v19 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMWorkoutManagerInternal _setReminderMuteSettingsForType:mute:]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
}

- (BOOL)_isReminderAllowedForType:(int64_t)a3
{
  fMuteSettings = self->fMuteSettings;
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, a2, a3);
  if (!objc_msgSend_objectForKey_(fMuteSettings, v7, v6)) {
    return 1;
  }
  uint64_t v9 = self->fMuteSettings;
  uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v8, a3);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v11, v10);
  return objc_msgSend_BOOLValue(v12, v13, v14) ^ 1;
}

@end