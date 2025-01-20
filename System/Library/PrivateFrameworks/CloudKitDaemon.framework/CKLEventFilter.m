@interface CKLEventFilter
- (BOOL)hasLogType:(unint64_t)a3;
- (BOOL)hasOnlyLogType:(unint64_t)a3;
- (BOOL)matchesEvent:(id)a3;
- (BOOL)onlyTestLogs;
- (BOOL)simulatorMessagesOnly;
- (CKLEventFilter)initWithLogTypes:(unint64_t)a3;
- (NSDictionary)categoriesBySubsystem;
- (NSString)processName;
- (unint64_t)logTypes;
- (void)_initFilterDict;
- (void)setCategoriesBySubsystem:(id)a3;
- (void)setLogTypes:(unint64_t)a3;
- (void)setOnlyTestLogs:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setSimulatorMessagesOnly:(BOOL)a3;
@end

@implementation CKLEventFilter

- (BOOL)hasLogType:(unint64_t)a3
{
  return (a3 & ~objc_msgSend_logTypes(self, a2, a3)) == 0;
}

- (BOOL)hasOnlyLogType:(unint64_t)a3
{
  unint64_t v4 = objc_msgSend_logTypes(self, a2, a3) & a3;
  return v4 == objc_msgSend_logTypes(self, v5, v6);
}

- (void)_initFilterDict
{
  objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  unint64_t v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  int v7 = objc_msgSend_simulatorMessagesOnly(self, v5, v6);
  v8 = @"com.apple.cloudkit";
  if (v7) {
    v8 = @"com.apple.cloudkit.sim";
  }
  v70 = v8;
  int v11 = objc_msgSend_simulatorMessagesOnly(self, v9, v10);
  v12 = @"com.apple.cloudkit.test";
  if (v11) {
    v12 = @"com.apple.cloudkit.test.sim";
  }
  v13 = v12;
  v16 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v14, v15);
  v18 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v17, (uint64_t)&unk_1F20AB898);
  if (objc_msgSend_hasLogType_(self, v19, 1))
  {
    objc_msgSend_addObject_(v16, v20, @"CK");
    objc_msgSend_addObject_(v16, v21, @"LogFacilityCK");
  }
  if (objc_msgSend_hasLogType_(self, v20, 4))
  {
    objc_msgSend_addObject_(v16, v22, @"PCS");
    objc_msgSend_addObject_(v16, v23, @"LogFacilityPCS");
  }
  if (objc_msgSend_hasLogType_(self, v22, 8))
  {
    objc_msgSend_addObject_(v16, v24, @"SQL");
    objc_msgSend_addObject_(v16, v25, @"LogFacilitySQL");
  }
  if (objc_msgSend_hasLogType_(self, v24, 16))
  {
    objc_msgSend_addObject_(v16, v26, @"STAT");
    objc_msgSend_addObject_(v16, v27, @"LogFacilitySTAT");
  }
  if (objc_msgSend_hasLogType_(self, v26, 32))
  {
    objc_msgSend_addObject_(v16, v28, @"Request");
    objc_msgSend_addObject_(v16, v29, @"LogFacilityRequest");
  }
  if (objc_msgSend_hasLogType_(self, v28, 128))
  {
    objc_msgSend_addObject_(v16, v30, @"OP");
    objc_msgSend_addObject_(v16, v31, @"LogFacilityOP");
  }
  if (objc_msgSend_hasLogType_(self, v30, 2))
  {
    objc_msgSend_addObject_(v16, v32, @"Traffic");
    objc_msgSend_addObject_(v16, v33, @"LogFacilityTraffic");
  }
  if (objc_msgSend_hasLogType_(self, v32, 256))
  {
    objc_msgSend_addObject_(v16, v34, @"TrafficBinary");
    objc_msgSend_addObject_(v16, v35, @"LogFacilityTrafficBinary");
  }
  if (objc_msgSend_hasLogType_(self, v34, 0x10000))
  {
    objc_msgSend_addObject_(v16, v36, @"TrafficCompressed");
    objc_msgSend_addObject_(v16, v37, @"LogFacilityTrafficCompressed");
  }
  if (objc_msgSend_hasLogType_(self, v36, 512))
  {
    objc_msgSend_addObject_(v16, v38, @"LogStats");
    objc_msgSend_addObject_(v16, v39, @"LogFacilityLogStats");
  }
  if (objc_msgSend_hasLogType_(self, v38, 1024))
  {
    objc_msgSend_addObject_(v16, v40, @"Scheduler");
    objc_msgSend_addObject_(v16, v41, @"LogFacilityScheduler");
  }
  if (objc_msgSend_hasLogType_(self, v40, 2048))
  {
    objc_msgSend_addObject_(v16, v42, @"NotificationListener");
    objc_msgSend_addObject_(v16, v43, @"LogFacilityNotificationListener");
  }
  if (objc_msgSend_hasLogType_(self, v42, 4096))
  {
    objc_msgSend_addObject_(v16, v44, @"Engine");
    objc_msgSend_addObject_(v16, v45, @"LogFacilityEngine");
  }
  if (objc_msgSend_hasLogType_(self, v44, 0x2000))
  {
    objc_msgSend_addObject_(v16, v46, @"DataRepair");
    objc_msgSend_addObject_(v16, v47, @"LogFacilityDataRepair");
  }
  if (objc_msgSend_hasLogType_(self, v46, 0x4000))
  {
    objc_msgSend_addObject_(v16, v48, @"DiscretionaryDaemon");
    objc_msgSend_addObject_(v16, v49, @"LogFacilityDiscretionaryDaemon");
  }
  if (objc_msgSend_hasLogType_(self, v48, 0x8000))
  {
    objc_msgSend_addObject_(v16, v50, @"MockServer");
    objc_msgSend_addObject_(v16, v51, @"LogFacilityMockServer");
  }
  if (objc_msgSend_hasOnlyLogType_(self, v50, 64))
  {
    v53 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v52, (uint64_t)&unk_1F20AB8B0);
    objc_msgSend_addObject_(v16, v54, @"LogFacilityCK");
    objc_msgSend_addObject_(v16, v55, @"LogFacilityMMCS");
    v56 = @"MMCS";
    objc_msgSend_addObject_(v16, v57, @"CK");
  }
  else
  {
    v53 = 0;
    if (!objc_msgSend_hasLogType_(self, v52, 64)) {
      goto LABEL_42;
    }
    v56 = @"LogFacilityMMCS";
    objc_msgSend_addObject_(v16, v59, @"MMCS");
  }
  objc_msgSend_addObject_(v16, v58, (uint64_t)v56);
LABEL_42:
  if (objc_msgSend_count(v16, v59, v60))
  {
    if ((objc_msgSend_onlyTestLogs(self, v61, v62) & 1) == 0) {
      objc_msgSend_setObject_forKeyedSubscript_(v4, v63, (uint64_t)v16, v70);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v4, v63, (uint64_t)v16, v13);
  }
  if (objc_msgSend_count(v53, v61, v62))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v64, (uint64_t)v18, @"com.apple.c2");
    objc_msgSend_setObject_forKeyedSubscript_(v4, v65, (uint64_t)v53, @"com.apple.mmcs");
    v67 = objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], v66, @"default");
    objc_msgSend_setObject_forKeyedSubscript_(v4, v68, (uint64_t)v67, @"com.apple.chunkinglibrary");
  }
  categoriesBySubsystem = self->_categoriesBySubsystem;
  self->_categoriesBySubsystem = v4;
}

- (CKLEventFilter)initWithLogTypes:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKLEventFilter;
  result = [(CKLEventFilter *)&v5 init];
  if (result) {
    result->_logTypes = a3;
  }
  return result;
}

- (BOOL)matchesEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_categoriesBySubsystem) {
    objc_msgSend__initFilterDict(v5, v6, v7);
  }
  objc_sync_exit(v5);

  if (!v5->_categoriesBySubsystem) {
    __assert_rtn("-[CKLEventFilter matchesEvent:]", "CKLEventFilter.m", 99, "_categoriesBySubsystem && \"_categoriesBySubsystem\"");
  }
  if (objc_msgSend_type(v4, v8, v9) == 1024)
  {
    categoriesBySubsystem = v5->_categoriesBySubsystem;
    v13 = objc_msgSend_subsystem(v4, v10, v11);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(categoriesBySubsystem, v14, (uint64_t)v13);

    if (!v15 || !objc_msgSend_count(v15, v16, v17))
    {
      char isEqualToString = 0;
LABEL_12:

      goto LABEL_13;
    }
    v20 = objc_msgSend_category(v4, v18, v19);
    int v22 = objc_msgSend_containsObject_(v15, v21, (uint64_t)v20);

    if (v22)
    {
      v25 = objc_msgSend_processName(v5, v23, v24);

      if (!v25)
      {
        char isEqualToString = 1;
        goto LABEL_13;
      }
      uint64_t v15 = objc_msgSend_process(v4, v26, v27);
      v30 = objc_msgSend_processName(v5, v28, v29);
      char isEqualToString = objc_msgSend_isEqualToString_(v15, v31, (uint64_t)v30);

      goto LABEL_12;
    }
  }
  char isEqualToString = 0;
LABEL_13:

  return isEqualToString;
}

- (unint64_t)logTypes
{
  return self->_logTypes;
}

- (void)setLogTypes:(unint64_t)a3
{
  self->_logTypes = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (BOOL)simulatorMessagesOnly
{
  return self->_simulatorMessagesOnly;
}

- (void)setSimulatorMessagesOnly:(BOOL)a3
{
  self->_simulatorMessagesOnly = a3;
}

- (BOOL)onlyTestLogs
{
  return self->_onlyTestLogs;
}

- (void)setOnlyTestLogs:(BOOL)a3
{
  self->_onlyTestLogs = a3;
}

- (NSDictionary)categoriesBySubsystem
{
  return self->_categoriesBySubsystem;
}

- (void)setCategoriesBySubsystem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesBySubsystem, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end