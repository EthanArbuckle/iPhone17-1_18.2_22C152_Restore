@interface CKScheduler
+ (id)activityFromXPCActivity:(id)a3;
+ (id)identifierWithImmediateInvocationForIdentifier:(id)a3;
+ (id)sharedScheduler;
+ (id)xpcActivityIdentifierForCKActivityIdentifier:(id)a3;
- (BOOL)hasPendingActivityWithActivityIdentifier:(id)a3;
- (BOOL)isXPCActivityPending:(id)a3;
- (NSMutableDictionary)handlersByCKActivityIdentifier;
- (NSMutableDictionary)xpcActivitiesByCKActivityIdentifier;
- (NSNumber)fakeDeviceCount;
- (double)delayAfterXPCActivityRegister;
- (id)activityForActivityIdentifier:(id)a3;
- (id)initInternal;
- (id)suggestedXPCActivityCriteriaForActivity:(id)a3;
- (id)xpcActivityForActivityWithIdentifier:(id)a3;
- (int64_t)currentPriorityForActivityIdentifier:(id)a3;
- (void)cancelActivityWithIdentifier:(id)a3;
- (void)performAsyncOnQueue:(id)a3;
- (void)registerActivityIdentifier:(id)a3 handler:(id)a4;
- (void)registerActivityIdentifier:(id)a3 replaceExistingHandler:(BOOL)a4 handler:(id)a5;
- (void)setDelayAfterXPCActivityRegister:(double)a3;
- (void)setFakeDeviceCount:(id)a3;
- (void)setXPCActivity:(id)a3 forActivityIdentifier:(id)a4;
- (void)submitActivity:(id)a3;
- (void)submitActivity:(id)a3 completionHandler:(id)a4;
- (void)unregisterActivityIdentifier:(id)a3;
- (void)unregisterHandlerForActivityIdentifier:(id)a3;
@end

@implementation CKScheduler

+ (id)sharedScheduler
{
  if (qword_1EB279B68 != -1) {
    dispatch_once(&qword_1EB279B68, &unk_1ED7EF038);
  }
  v2 = (void *)qword_1EB279B70;

  return v2;
}

- (id)initInternal
{
  v17.receiver = self;
  v17.super_class = (Class)CKScheduler;
  id v2 = [(CKScheduler *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cloudkit.scheduler", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cloudkit.scheduler.callback", v6);
    v8 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.cloudkit.scheduler.xpc_activity_register", v9, *((dispatch_queue_t *)v2 + 1));
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v14;
  }
  return v2;
}

- (void)submitActivity:(id)a3
{
}

- (void)submitActivity:(id)a3 completionHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v53 = 0;
  char v8 = _CKCheckArgument((uint64_t)"activity", v6, 0, 0, 0, &v53);
  id v9 = v53;
  dispatch_queue_t v10 = v9;
  if ((v8 & 1) == 0)
  {
    v25 = [CKException alloc];
    uint64_t v29 = objc_msgSend_code(v10, v26, v27, v28);
    v33 = objc_msgSend_localizedDescription(v10, v30, v31, v32);
    id v35 = (id)objc_msgSend_initWithCode_format_(v25, v34, v29, @"%@", v33);

    objc_exception_throw(v35);
  }

  v11 = _os_activity_create(&dword_18AF10000, "client/scheduler-submit", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v12 = ck_log_facility_scheduler;
  if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_18AF10000, v12, OS_LOG_TYPE_DEBUG, "About to submit activity: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_18AF13C00;
  v50 = sub_18AF13888;
  id v51 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B06B820;
  block[3] = &unk_1E5462070;
  v45 = &v46;
  block[4] = self;
  id v14 = v6;
  id v44 = v14;
  dispatch_sync(queue, block);
  if (!v47[5])
  {
    v36 = [CKException alloc];
    v40 = objc_msgSend_identifier(v14, v37, v38, v39);
    id v42 = (id)objc_msgSend_initWithName_format_(v36, v41, *MEMORY[0x1E4F1C3C8], @"Must register a handler for activity identifier \"%@\" before submitting it", v40);

    objc_exception_throw(v42);
  }
  objc_super v17 = objc_msgSend_suggestedXPCActivityCriteriaForActivity_(self, v15, (uint64_t)v14, v16);
  id v18 = v14;
  id v19 = v17;
  id v20 = v7;
  if (self)
  {
    xpcActivityRegisterQueue = self->_xpcActivityRegisterQueue;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v55 = sub_18B06B8A4;
    v56 = &unk_1E5462020;
    id v22 = v18;
    id v57 = v22;
    v58 = self;
    id v23 = v19;
    id v59 = v23;
    id v60 = v20;
    dispatch_async(xpcActivityRegisterQueue, &buf);
    if (sub_18B06C09C((uint64_t)CKScheduler, v22))
    {
      v24 = sub_18B06C13C((uint64_t)CKScheduler, v22, v23);
      AnalyticsSendEvent();
    }
  }

  _Block_object_dispose(&v46, 8);
  os_activity_scope_leave(&state);
}

- (void)setXPCActivity:(id)a3 forActivityIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B06C528;
  block[3] = &unk_1E54614E0;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_sync(queue, block);
}

- (void)registerActivityIdentifier:(id)a3 handler:(id)a4
{
}

- (void)registerActivityIdentifier:(id)a3 replaceExistingHandler:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v49 = 0;
  char v10 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v8, 0, 0, 0, &v49);
  id v11 = v49;
  id v12 = v11;
  if ((v10 & 1) == 0
    || (v11,
        id v13 = _Block_copy(v9),
        id v48 = 0,
        char v14 = _CKCheckArgument((uint64_t)"handler", v13, 0, 0, 0, &v48),
        id v12 = v48,
        v13,
        (v14 & 1) == 0))
  {
    v21 = [CKException alloc];
    uint64_t v25 = objc_msgSend_code(v12, v22, v23, v24);
    uint64_t v29 = objc_msgSend_localizedDescription(v12, v26, v27, v28);
    id v31 = (id)objc_msgSend_initWithCode_format_(v21, v30, v25, @"%@", v29);

    objc_exception_throw(v31);
  }

  v15 = _os_activity_create(&dword_18AF10000, "client/scheduler-register", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B06C894;
  block[3] = &unk_1E5462778;
  id v17 = v8;
  BOOL v42 = a4;
  id v38 = v17;
  uint64_t v39 = self;
  v41 = &v43;
  id v18 = v9;
  id v40 = v18;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v44 + 24))
  {
    uint64_t v32 = [CKException alloc];
    id v34 = (id)objc_msgSend_initWithName_format_(v32, v33, *MEMORY[0x1E4F1C3C8], @"Illegal attempt to register a second handler for activity identifier %@", v17);
    objc_exception_throw(v34);
  }
  if (self) {
    xpcActivityRegisterQueue = self->_xpcActivityRegisterQueue;
  }
  else {
    xpcActivityRegisterQueue = 0;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_18B06CA80;
  v35[3] = &unk_1E5461F80;
  v35[4] = self;
  id v36 = v17;
  id v20 = v17;
  dispatch_async(xpcActivityRegisterQueue, v35);

  _Block_object_dispose(&v43, 8);
  os_activity_scope_leave(&state);
}

- (void)unregisterActivityIdentifier:(id)a3
{
  id v4 = a3;
  id v25 = 0;
  char v5 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v4, 0, 0, 0, &v25);
  id v6 = v25;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v13 = [CKException alloc];
    uint64_t v17 = objc_msgSend_code(v7, v14, v15, v16);
    v21 = objc_msgSend_localizedDescription(v7, v18, v19, v20);
    id v23 = (id)objc_msgSend_initWithCode_format_(v13, v22, v17, @"%@", v21);

    objc_exception_throw(v23);
  }

  id v8 = _os_activity_create(&dword_18AF10000, "client/scheduler-unregister", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_unregisterHandlerForActivityIdentifier_(self, v9, (uint64_t)v4, v10);
  objc_msgSend_cancelActivityWithIdentifier_(self, v11, (uint64_t)v4, v12);
  os_activity_scope_leave(&state);
}

- (void)unregisterHandlerForActivityIdentifier:(id)a3
{
  id v4 = a3;
  id v26 = 0;
  char v5 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v4, 0, 0, 0, &v26);
  id v6 = v26;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v11 = [CKException alloc];
    uint64_t v15 = objc_msgSend_code(v7, v12, v13, v14);
    uint64_t v19 = objc_msgSend_localizedDescription(v7, v16, v17, v18);
    id v21 = (id)objc_msgSend_initWithCode_format_(v11, v20, v15, @"%@", v19);

    objc_exception_throw(v21);
  }

  id v8 = _os_activity_create(&dword_18AF10000, "client/scheduler-unregister-handler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B06CE14;
  block[3] = &unk_1E5461F80;
  id v23 = v4;
  uint64_t v24 = self;
  id v10 = v4;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

- (void)cancelActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  id v25 = 0;
  char v5 = _CKCheckArgument((uint64_t)"ckActivityIdentifier", v4, 0, 0, 0, &v25);
  id v6 = v25;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    id v11 = [CKException alloc];
    uint64_t v15 = objc_msgSend_code(v7, v12, v13, v14);
    uint64_t v19 = objc_msgSend_localizedDescription(v7, v16, v17, v18);
    id v21 = (id)objc_msgSend_initWithCode_format_(v11, v20, v15, @"%@", v19);

    objc_exception_throw(v21);
  }

  id v8 = _os_activity_create(&dword_18AF10000, "client/scheduler-cancel", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B06D088;
  block[3] = &unk_1E5461F80;
  void block[4] = self;
  id v23 = v4;
  id v10 = v4;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

- (id)xpcActivityForActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_18B06EA24;
  uint64_t v16 = sub_18B06EA34;
  id v17 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B06EA3C;
  block[3] = &unk_1E5462070;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)suggestedXPCActivityCriteriaForActivity:(id)a3
{
  uint64_t v274 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], 1);
  id v9 = objc_msgSend_container(v4, v6, v7, v8);
  uint64_t v13 = objc_msgSend_container(v4, v10, v11, v12);
  id v17 = objc_msgSend_deviceContext(v13, v14, v15, v16);
  int v21 = objc_msgSend_useLiveServer(v17, v18, v19, v20);

  id v22 = (const char *)*MEMORY[0x1E4F14338];
  if (v21)
  {
    xpc_dictionary_set_BOOL(v5, v22, 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14330], 0);
    nw_parameters_t v23 = nw_parameters_create();
    uint64_t v27 = objc_msgSend_untrustedEntitlements(v9, v24, v25, v26);
    int hasNetworkSocketDelegateEntitlement = objc_msgSend_hasNetworkSocketDelegateEntitlement(v27, v28, v29, v30);

    if (hasNetworkSocketDelegateEntitlement)
    {
      id v35 = objc_msgSend_relatedApplicationBundleIdentifiers(v4, v32, v33, v34);
      uint64_t v39 = objc_msgSend_firstObject(v35, v36, v37, v38);

      if (v39
        || (objc_msgSend_defaultRelatedApplicationBundleIdentifiersForContainer_(CKSchedulerActivity, v40, (uint64_t)v9, v41), v42 = objc_claimAutoreleasedReturnValue(), objc_msgSend_firstObject(v42, v43, v44, v45), uint64_t v39 = objc_claimAutoreleasedReturnValue(), v42, v39))
      {
        id v46 = v39;
        objc_msgSend_UTF8String(v46, v47, v48, v49);
        nw_parameters_set_source_application_by_bundle_id();
      }
    }
    v50 = (void *)nw_parameters_copy_dictionary();
    if (v50) {
      xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F14290], v50);
    }
  }
  else
  {
    xpc_dictionary_set_BOOL(v5, v22, 0);
  }
  v54 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v51, v52, v53);
  v58 = objc_msgSend_untrustedEntitlements(v54, v55, v56, v57);
  char hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v58, v59, v60, v61);

  if ((hasAllowAccessDuringBuddyEntitlement & 1) == 0) {
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14308], 1);
  }
  v66 = objc_msgSend_relatedApplicationBundleIdentifiers(v4, v63, v64, v65);
  uint64_t v70 = objc_msgSend_count(v66, v67, v68, v69);

  if (v70)
  {
    xpc_object_t empty = xpc_array_create_empty();
    long long v260 = 0u;
    long long v261 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    v78 = objc_msgSend_relatedApplicationBundleIdentifiers(v4, v75, v76, v77);
    uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v79, (uint64_t)&v260, (uint64_t)v268, 16);
    if (v80)
    {
      uint64_t v81 = *(void *)v261;
      do
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v261 != v81) {
            objc_enumerationMutation(v78);
          }
          id v83 = *(id *)(*((void *)&v260 + 1) + 8 * i);
          v87 = (const char *)objc_msgSend_UTF8String(v83, v84, v85, v86);
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v87);
        }
        uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v88, (uint64_t)&v260, (uint64_t)v268, 16);
      }
      while (v80);
    }

    xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F14198], empty);
  }
  int64_t v89 = objc_msgSend_priority(v4, v71, v72, v73);
  xpc_dictionary_set_int64(v5, "ck_scheduler_priority", v89);
  objc_msgSend_identifier(v4, v90, v91, v92);
  id v93 = objc_claimAutoreleasedReturnValue();
  v97 = (const char *)objc_msgSend_UTF8String(v93, v94, v95, v96);
  xpc_dictionary_set_string(v5, "ck_scheduler_activity_identifier", v97);

  v101 = objc_msgSend_containerID(v4, v98, v99, v100);
  objc_msgSend_containerIdentifier(v101, v102, v103, v104);
  id v105 = objc_claimAutoreleasedReturnValue();
  v109 = (const char *)objc_msgSend_UTF8String(v105, v106, v107, v108);
  xpc_dictionary_set_string(v5, "ck_container_identifier", v109);

  v113 = objc_msgSend_containerID(v4, v110, v111, v112);
  int64_t v117 = objc_msgSend_environment(v113, v114, v115, v116);
  xpc_dictionary_set_int64(v5, "ck_environment", v117);

  v121 = objc_msgSend_earliestStartDate(v4, v118, v119, v120);

  if (v121)
  {
    v125 = objc_msgSend_earliestStartDate(v4, v122, v123, v124);
    objc_msgSend_timeIntervalSinceReferenceDate(v125, v126, v127, v128);
    xpc_dictionary_set_double(v5, "ck_earliest_start_date", v129);
  }
  if (objc_msgSend_expectedTransferSizeBytes(v4, v122, v123, v124))
  {
    int64_t v133 = objc_msgSend_expectedTransferSizeBytes(v4, v130, v131, v132);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F14298], v133);
  }
  if (objc_msgSend_userRequestedBackupTask(v4, v130, v131, v132))
  {
    char v137 = objc_msgSend_userRequestedBackupTask(v4, v134, v135, v136);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14360], v137);
  }
  id v141 = v4;
  if (self)
  {
    v142 = objc_msgSend_fakeDeviceCount(self, v138, v139, v140);
    if (objc_msgSend_priority(v141, v143, v144, v145) || v142)
    {
      if (v142)
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        v157 = ck_log_facility_scheduler;
        if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&buf[4] = v142;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v141;
          _os_log_impl(&dword_18AF10000, v157, OS_LOG_TYPE_INFO, "Using fake device count (%@) for activity %@", buf, 0x16u);
        }
        uint64_t KnownDeviceCount = objc_msgSend_integerValue(v142, v158, v159, v160);
      }
      else
      {
        uint64_t KnownDeviceCount = 0;
      }
    }
    else
    {
      v149 = objc_msgSend_container(v141, v146, v147, v148);
      uint64_t KnownDeviceCount = objc_msgSend_lastKnownDeviceCount(v149, v150, v151, v152);

      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v154 = (void *)ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
      {
        v155 = v154;
        v156 = CKStringFromDeviceCount(KnownDeviceCount);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v141;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v156;
        _os_log_debug_impl(&dword_18AF10000, v155, OS_LOG_TYPE_DEBUG, "Fetched number of active devices for %@: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t KnownDeviceCount = 0;
  }

  uint64_t v164 = objc_msgSend_priority(v141, v161, v162, v163);
  double v168 = 0.0;
  if (v164 == 2)
  {
    v174 = (const char *)*MEMORY[0x1E4F142E0];
    int v175 = 1;
    double v176 = 60.0;
    goto LABEL_55;
  }
  if (v164 == 1)
  {
    int v175 = 0;
    v174 = (const char *)*MEMORY[0x1E4F142D0];
    double v176 = 86400.0;
    double v168 = 3600.0;
    goto LABEL_55;
  }
  if (v164)
  {
    int v175 = 0;
    v174 = 0;
    double v176 = 0.0;
    goto LABEL_55;
  }
  CKStringFromDeviceCount(KnownDeviceCount);
  id v169 = objc_claimAutoreleasedReturnValue();
  v173 = (const char *)objc_msgSend_UTF8String(v169, v170, v171, v172);
  xpc_dictionary_set_string(v5, "ck_device_count_string", v173);
  if (KnownDeviceCount != 2)
  {
    if (KnownDeviceCount == 1)
    {
      int v175 = 0;
      v174 = (const char *)*MEMORY[0x1E4F142D0];
      double v176 = 86400.0;
      double v168 = 14400.0;
      goto LABEL_54;
    }
    if (KnownDeviceCount)
    {
      int v175 = 0;
      v174 = 0;
      double v176 = 0.0;
      goto LABEL_54;
    }
  }
  v174 = (const char *)*MEMORY[0x1E4F142E0];
  int v175 = 1;
  double v176 = 60.0;
LABEL_54:

LABEL_55:
  v177 = objc_msgSend_earliestStartDate(v141, v165, v166, v167);
  objc_msgSend_timeIntervalSinceNow(v177, v178, v179, v180);
  double v182 = v181;

  if (v182 >= v168) {
    double v183 = v182;
  }
  else {
    double v183 = v168;
  }
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v183);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], (uint64_t)v176);
  xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F142C8], v174);
  if ((v175 & (objc_msgSend_userRequestedBackupTask(v141, v184, v185, v186) ^ 1)) == 1) {
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14350], 1);
  }
  uint64_t v190 = objc_msgSend_overrideRateLimiting(v141, v187, v188, v189);
  if (v190)
  {
    v194 = sub_18B06F8D0(v190, v191, v192, v193);
    if (v194)
    {
      xpc_object_t v195 = xpc_dictionary_create(0, 0, 0);
      p_info = v194;
      v200 = (const char *)objc_msgSend_UTF8String(p_info, v197, v198, v199);
      xpc_dictionary_set_BOOL(v195, v200, 1);
      xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F14190], v195);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v231 = ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_fault_impl(&dword_18AF10000, v231, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Couldn't get soft-linked rate limiting key", buf, 2u);
      }
      p_info = 0;
    }
    goto LABEL_82;
  }
  uint64_t v264 = 0;
  v265 = &v264;
  uint64_t v266 = 0x2020000000;
  p_info = CKContainerID.info;
  v201 = (id *)qword_1EB279B90;
  uint64_t v267 = qword_1EB279B90;
  if (!qword_1EB279B90)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_18B070EA0;
    v270 = &unk_1E545FF40;
    v271 = &v264;
    v202 = sub_18B070CD8(v190, v191, v192, v193);
    v203 = dlsym(v202, "_DASRateLimitConfigurationKey");
    *(void *)(v271[1] + 24) = v203;
    qword_1EB279B90 = *(void *)(v271[1] + 24);
    v201 = (id *)v265[3];
  }
  _Block_object_dispose(&v264, 8);
  if (!v201)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v204, v205, v206);
    objc_msgSend_stringWithUTF8String_(NSString, v251, (uint64_t)"NSString *get_DASRateLimitConfigurationKey(void)", v252);
    id v233 = (id)objc_claimAutoreleasedReturnValue();
    v253 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v9, v254, (uint64_t)v233, @"CKScheduler.m", 28, @"%s", v253);

LABEL_95:
    __break(1u);
LABEL_96:
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    goto LABEL_88;
  }
  v207 = (__objc2_class_ro **)*v201;
  p_info = v207;
  uint64_t v264 = 0;
  v265 = &v264;
  uint64_t v266 = 0x2020000000;
  v211 = (id *)qword_1EB279B98;
  uint64_t v267 = qword_1EB279B98;
  if (!qword_1EB279B98)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_18B070EF0;
    v270 = &unk_1E545FF40;
    v271 = &v264;
    v212 = sub_18B070CD8((uint64_t)v207, v208, v209, v210);
    v213 = dlsym(v212, "_DASCKRateLimitConfigurationName");
    *(void *)(v271[1] + 24) = v213;
    qword_1EB279B98 = *(void *)(v271[1] + 24);
    v211 = (id *)v265[3];
  }
  _Block_object_dispose(&v264, 8);
  if (!v211)
  {
    id v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v214, v215, v216);
    objc_msgSend_stringWithUTF8String_(NSString, v255, (uint64_t)"NSString *get_DASCKRateLimitConfigurationName(void)", v256);
    id v233 = (id)objc_claimAutoreleasedReturnValue();
    v257 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v9, v258, (uint64_t)v233, @"CKScheduler.m", 29, @"%s", v257);

    goto LABEL_95;
  }
  id v217 = *v211;
  v218 = v217;
  if (p_info && v217)
  {
    xpc_object_t v219 = xpc_dictionary_create(0, 0, 0);
    v220 = p_info;
    v224 = (const char *)objc_msgSend_UTF8String(v220, v221, v222, v223);
    id v225 = v218;
    v229 = (const char *)objc_msgSend_UTF8String(v225, v226, v227, v228);
    xpc_dictionary_set_string(v219, v224, v229);
    xpc_dictionary_set_value(v5, (const char *)*MEMORY[0x1E4F14190], v219);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v230 = ck_log_facility_scheduler;
    if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&buf[4] = p_info;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v218;
      _os_log_fault_impl(&dword_18AF10000, v230, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Couldn't get soft-linked rate limiting key (%@) or name (%@)", buf, 0x16u);
    }
  }

LABEL_82:
  BOOL v232 = self == 0;

  id v233 = v5;
  id v234 = v141;
  xpc_object_t v5 = v234;
  if (!v232)
  {
    v238 = objc_msgSend_xpcActivityCriteriaOverrides(v234, v235, v236, v237);

    if (v238)
    {
      xpc_object_t v239 = xpc_dictionary_create(0, 0, 0);
      v243 = objc_msgSend_xpcActivityCriteriaOverrides(v5, v240, v241, v242);
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_18B06FA38;
      v270 = &unk_1E5462890;
      v244 = (uint64_t *)v233;
      v271 = v244;
      id v272 = v5;
      id v273 = v239;
      id v245 = v239;
      xpc_dictionary_apply(v243, buf);

      xpc_dictionary_set_value(v244, "ck_additional_xpc_activity_criteria", v245);
    }
  }

  id v259 = 0;
  objc_msgSend_networkTransferEndpointWithError_(v9, v246, (uint64_t)&v259, v247);
  id v141 = (id)objc_claimAutoreleasedReturnValue();
  p_info = (__objc2_class_ro **)v259;
  if (v141)
  {
    v248 = (void *)MEMORY[0x18C12ACF0](v141);
    xpc_dictionary_set_value(v233, (const char *)*MEMORY[0x1E4F14288], v248);

    goto LABEL_90;
  }
  if (ck_log_initialization_predicate != -1) {
    goto LABEL_96;
  }
LABEL_88:
  v249 = ck_log_facility_scheduler;
  if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = p_info;
    _os_log_error_impl(&dword_18AF10000, v249, OS_LOG_TYPE_ERROR, "Error getting network transfer endpoint: %@", buf, 0xCu);
  }
LABEL_90:

  return v233;
}

+ (id)xpcActivityIdentifierForCKActivityIdentifier:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_stringWithFormat_(NSString, v5, @"%@.", v6, @"com.apple.xpc.activity.test");
  int hasPrefix = objc_msgSend_hasPrefix_(v4, v8, (uint64_t)v7, v9);
  if (hasPrefix)
  {
    uint64_t v14 = objc_msgSend_length(v7, v10, v11, v12);
    id v17 = objc_msgSend_substringFromIndex_(v4, v15, v14, v16);
    objc_msgSend_stringWithFormat_(NSString, v18, @"%@.%@", v19, @"com.apple.xpc.activity.test", v17);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = v4;
    id v17 = v23;
  }
  if ((unint64_t)objc_msgSend_length(v23, v20, v21, v22) < 0x7E)
  {
    id v34 = v23;
    goto LABEL_14;
  }
  uint64_t v27 = objc_msgSend_CKSafeHashStringForPathComponent(v17, v24, v25, v26);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v28 = ck_log_facility_scheduler;
  if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v38 = v27;
    __int16 v39 = 2114;
    id v40 = v17;
    _os_log_debug_impl(&dword_18AF10000, v28, OS_LOG_TYPE_DEBUG, "Using hash %{public}@ for name %{public}@", buf, 0x16u);
    if (hasPrefix) {
      goto LABEL_9;
    }
LABEL_12:
    id v31 = v27;
    goto LABEL_13;
  }
  if (!hasPrefix) {
    goto LABEL_12;
  }
LABEL_9:
  objc_msgSend_stringWithFormat_(NSString, v29, @"%@.%@", v30, @"com.apple.xpc.activity.test", v27);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  id v35 = v31;
  objc_msgSend_xpcActivityIdentifierForCKActivityIdentifier_(a1, v32, (uint64_t)v31, v33);
  id v34 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:

  return v34;
}

+ (id)activityFromXPCActivity:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v3 = (_xpc_activity_s *)a3;
  xpc_object_t v4 = xpc_activity_copy_criteria(v3);
  xpc_object_t v5 = v4;
  if (v4)
  {
    string = xpc_dictionary_get_string(v4, "ck_container_identifier");
    int64_t int64 = xpc_dictionary_get_int64(v5, "ck_environment");
    if (string && (uint64_t v8 = int64) != 0)
    {
      id v9 = [NSString alloc];
      uint64_t v12 = objc_msgSend_initWithUTF8String_(v9, v10, (uint64_t)string, v11);
      uint64_t v13 = [CKContainerID alloc];
      uint64_t v15 = objc_msgSend_initWithContainerIdentifier_environment_(v13, v14, (uint64_t)v12, v8);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v18 = ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v80 = (_xpc_activity_s *)v5;
        _os_log_impl(&dword_18AF10000, v18, OS_LOG_TYPE_INFO, "Unable to get container identifier and environment from XPC activity criteria: %@", buf, 0xCu);
      }
      uint64_t v15 = 0;
    }
    int64_t v19 = xpc_dictionary_get_int64(v5, "ck_scheduler_priority");
    uint64_t v20 = xpc_dictionary_get_string(v5, "ck_scheduler_activity_identifier");
    if (v20)
    {
      id v23 = objc_msgSend_stringWithUTF8String_(NSString, v21, (uint64_t)v20, v22);
      id v17 = 0;
      if (v23 && v15)
      {
        uint64_t v24 = [CKSchedulerActivity alloc];
        id v17 = objc_msgSend_initWithIdentifier_containerID_priority_(v24, v25, (uint64_t)v23, (uint64_t)v15, v19);
        uint64_t v26 = [CKXPCActivity alloc];
        uint64_t v29 = objc_msgSend_initWithXPCActivity_(v26, v27, (uint64_t)v3, v28);
        objc_msgSend_setCkXPCActivity_(v17, v30, (uint64_t)v29, v31);

        int64_t v32 = xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1E4F14298]);
        objc_msgSend_setExpectedTransferSizeBytes_(v17, v33, v32, v34);
        double v35 = xpc_dictionary_get_double(v5, "ck_earliest_start_date");
        __int16 v39 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v36, v37, v38, v35);
        objc_msgSend_setEarliestStartDate_(v17, v40, (uint64_t)v39, v41);

        BOOL v42 = xpc_dictionary_get_BOOL(v5, (const char *)*MEMORY[0x1E4F14360]);
        objc_msgSend_setUserRequestedBackupTask_(v17, v43, v42, v44);
        v47 = xpc_dictionary_get_dictionary(v5, "ck_additional_xpc_activity_criteria");
        if (v47) {
          objc_msgSend_setXpcActivityCriteriaOverrides_(v17, v45, (uint64_t)v47, v46);
        }
        uint64_t v48 = xpc_dictionary_get_array(v5, (const char *)*MEMORY[0x1E4F14198]);
        uint64_t v52 = v48;
        if (v48)
        {
          v78 = v47;
          size_t count = xpc_array_get_count(v48);
          id v54 = objc_alloc(MEMORY[0x1E4F1CA48]);
          id v59 = objc_msgSend_initWithCapacity_(v54, v55, count, v56);
          if (count)
          {
            for (size_t i = 0; i != count; ++i)
            {
              uint64_t v61 = xpc_array_get_string(v52, i);
              if (v61)
              {
                uint64_t v64 = objc_msgSend_stringWithUTF8String_(NSString, v57, (uint64_t)v61, v58);
                if (v64) {
                  objc_msgSend_addObject_(v59, v62, (uint64_t)v64, v63);
                }
              }
            }
          }
          objc_msgSend_setRelatedApplicationBundleIdentifiers_(v17, v57, (uint64_t)v59, v58);

          v47 = v78;
        }
        uint64_t v65 = sub_18B06F8D0((uint64_t)v48, v49, v50, v51);
        if (v65)
        {
          v66 = xpc_dictionary_get_dictionary(v5, (const char *)*MEMORY[0x1E4F14190]);
          if (v66)
          {
            id v67 = v65;
            v71 = (const char *)objc_msgSend_UTF8String(v67, v68, v69, v70);
            BOOL v72 = xpc_dictionary_get_BOOL(v66, v71);
            objc_msgSend_setOverrideRateLimiting_(v17, v73, v72, v74);
          }
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          uint64_t v76 = ck_log_facility_scheduler;
          if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl(&dword_18AF10000, v76, OS_LOG_TYPE_FAULT, "BUG IN CLOUDKIT: Couldn't get soft-linked rate limiting key when re-creating activity", buf, 2u);
          }
        }
      }
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v75 = ck_log_facility_scheduler;
      if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v80 = (_xpc_activity_s *)v5;
        _os_log_impl(&dword_18AF10000, v75, OS_LOG_TYPE_INFO, "Unable to get activity identifier from XPC activity criteria: %@", buf, 0xCu);
      }
      id v23 = 0;
      id v17 = 0;
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v16 = ck_log_facility_scheduler;
    if (os_log_type_enabled((os_log_t)ck_log_facility_scheduler, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v80 = v3;
      _os_log_debug_impl(&dword_18AF10000, v16, OS_LOG_TYPE_DEBUG, "Couldn't get XPC activity criteria for xpc_activity %@", buf, 0xCu);
    }
    id v17 = 0;
  }

  return v17;
}

+ (id)identifierWithImmediateInvocationForIdentifier:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@.%@", v3, @"com.apple.xpc.activity.test", a3);
}

- (BOOL)hasPendingActivityWithActivityIdentifier:(id)a3
{
  xpc_object_t v4 = self;
  xpc_object_t v5 = objc_msgSend_xpcActivityForActivityWithIdentifier_(self, a2, (uint64_t)a3, v3);
  LOBYTE(v4) = objc_msgSend_isXPCActivityPending_(v4, v6, (uint64_t)v5, v7);

  return (char)v4;
}

- (BOOL)isXPCActivityPending:(id)a3
{
  uint64_t v3 = (_xpc_activity_s *)a3;
  xpc_object_t v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (!state)
  {
    xpc_object_t v7 = xpc_activity_copy_criteria(v4);
    BOOL v6 = v7 != 0;

    goto LABEL_8;
  }
  if (state == 3 || state == 1) {
    BOOL v6 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (id)activityForActivityIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_18B06EA24;
  uint64_t v16 = sub_18B06EA34;
  id v17 = 0;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B07065C;
  block[3] = &unk_1E54628B8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (int64_t)currentPriorityForActivityIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 1;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B070874;
  block[3] = &unk_1E54628B8;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)performAsyncOnQueue:(id)a3
{
  if (self) {
    self = (CKScheduler *)self->_queue;
  }
  dispatch_async(&self->super, a3);
}

- (NSMutableDictionary)xpcActivitiesByCKActivityIdentifier
{
  return self->_xpcActivitiesByCKActivityIdentifier;
}

- (NSNumber)fakeDeviceCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFakeDeviceCount:(id)a3
{
}

- (double)delayAfterXPCActivityRegister
{
  return self->_delayAfterXPCActivityRegister;
}

- (void)setDelayAfterXPCActivityRegister:(double)a3
{
  self->_delayAfterXPCActivityRegister = a3;
}

- (NSMutableDictionary)handlersByCKActivityIdentifier
{
  return self->_handlersByCKActivityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlersByCKActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_fakeDeviceCount, 0);
  objc_storeStrong((id *)&self->_xpcActivitiesByCKActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcActivityRegisterQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end