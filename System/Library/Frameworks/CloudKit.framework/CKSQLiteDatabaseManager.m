@interface CKSQLiteDatabaseManager
+ (id)managerInDatabase:(id)a3 error:(id *)a4;
- (id)activitiesStartingBeforeDate:(id)a3;
- (id)activityEntryForTarget:(id)a3 error:(id *)a4;
- (id)addActivityTriggerWithTarget:(id)a3 date:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6;
- (id)createTables:(id *)a3;
- (id)earliestActivityDate;
- (id)finishInitializing;
- (id)migrateDataFromGroup:(id)a3;
- (id)nextActivityDate;
- (id)nextActivityDateForTarget:(id)a3;
- (id)registerDatabase:(id)a3;
- (id)target:(id)a3 group:(id)a4 willRunActivity:(id)a5;
- (void)databaseWasRemoved:(id)a3;
- (void)flush;
- (void)runActivities:(id)a3;
- (void)scheduleActivityDate:(id)a3;
- (void)setSchedulingDataInActivity:(id)a3 date:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6;
- (void)target:(id)a3 group:(id)a4 didRunActivity:(id)a5;
- (void)waitForComplete;
- (void)waitForTargetActivityComplete:(id)a3;
@end

@implementation CKSQLiteDatabaseManager

+ (id)managerInDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v10 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(CKSQLiteDatabaseManager, v9, 0, 0, v8);

  v12 = objc_msgSend_tableGroupInDatabase_withName_error_(a1, v11, (uint64_t)v6, (uint64_t)v10, a4);

  return v12;
}

- (id)migrateDataFromGroup:(id)a3
{
  id v3 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v4 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_fault_impl(&dword_18AF10000, v4, OS_LOG_TYPE_FAULT, "CKSQLiteDatabaseManagerTableGroup migration needed", v6, 2u);
  }

  return 0;
}

- (id)createTables:(id *)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v4 = [CKSQLiteDatabaseRegistry alloc];
  v7 = (CKSQLiteDatabaseRegistry *)objc_msgSend_initWithLogicalTableName_(v4, v5, @"Registry", v6);
  registry = self->_registry;
  self->_registry = v7;

  v9 = [CKSQLiteDatabaseActivities alloc];
  v12 = (CKSQLiteDatabaseActivities *)objc_msgSend_initWithLogicalTableName_(v9, v10, @"Activities", v11);
  activities = self->_activities;
  self->_activities = v12;

  v14 = self->_activities;
  v18[0] = self->_registry;
  v18[1] = v14;
  v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v18, 2);

  return v16;
}

- (id)finishInitializing
{
  v30.receiver = self;
  v30.super_class = (Class)CKSQLiteDatabaseManager;
  id v3 = [(CKSQLiteTableGroup *)&v30 finishInitializing];
  v7 = objc_msgSend_db(self, v4, v5, v6);
  objc_msgSend_databaseManagerTimer(v7, v8, v9, v10);
  uint64_t v11 = (CKSQLiteDatabaseManagerTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v11;

  if (self->_timer)
  {
    if (v3) {
      goto LABEL_9;
    }
  }
  else
  {
    v16 = [CKSQLiteDatabaseManagerTimer alloc];
    v19 = (CKSQLiteDatabaseManagerTimer *)objc_msgSend_initWithDatabase_(v16, v17, (uint64_t)v7, v18);
    v20 = self->_timer;
    self->_timer = v19;

    objc_msgSend_setDatabaseManagerTimer_(v7, v21, (uint64_t)self->_timer, v22);
    if (v3) {
      goto LABEL_9;
    }
  }
  if (objc_msgSend_isFirstInstance(self, v13, v14, v15))
  {
    v28 = objc_msgSend_earliestActivityDate(self->_activities, v23, v24, v25);
    if (v28) {
      objc_msgSend_scheduleActivityDate_(self, v26, (uint64_t)v28, v27);
    }
  }
LABEL_9:

  return v3;
}

- (void)databaseWasRemoved:(id)a3
{
  id v15 = a3;
  activities = self->_activities;
  v8 = objc_msgSend_databaseID(v15, v5, v6, v7);
  id v11 = (id)objc_msgSend_deleteEntriesForDatabase_(activities, v9, (uint64_t)v8, v10);

  id v14 = (id)objc_msgSend_deleteObject_(self->_registry, v12, (uint64_t)v15, v13);
}

- (id)activityEntryForTarget:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_msgSend_db(self, v8, v9, v10);

  objc_msgSend_databaseManagerData(v7, v11, v12, v13);
  id v14 = (CKSQLiteDatabaseActivityEntry *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    id v14 = objc_alloc_init(CKSQLiteDatabaseActivityEntry);
    registry = self->_registry;
    v19 = objc_msgSend_db(v7, v16, v17, v18);
    id v42 = 0;
    v21 = objc_msgSend_databaseIDForDatabase_error_(registry, v20, (uint64_t)v19, (uint64_t)&v42);
    id v22 = v42;

    if (v22)
    {

      id v14 = 0;
      if (a4) {
        *a4 = v22;
      }
      goto LABEL_11;
    }
    objc_msgSend_setDatabaseID_(v14, v23, (uint64_t)v21, v24);
    objc_msgSend__setupActivityEntry_(v7, v25, (uint64_t)v14, v26);
    v29 = objc_msgSend_fetchActivityForTarget_(self->_activities, v27, (uint64_t)v14, v28);
    if (objc_msgSend_CKIsNoMatchingRowError_(MEMORY[0x1E4F28C58], v30, (uint64_t)v29, v31))
    {
      v35 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v32, v33, v34);
      objc_msgSend_setActivityNotBeforeDate_(v14, v36, (uint64_t)v35, v37);
    }
    else
    {
      if (!v29) {
        goto LABEL_10;
      }
      v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v32, v33, v34);
      v40 = self;
      v35 = v39;
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v41, (uint64_t)a2, (uint64_t)v40, @"CKSQLiteDatabaseManager.m", 555, @"database error: %@", v29);
    }

LABEL_10:
    objc_msgSend_setDatabaseManagerData_(v7, v32, (uint64_t)v14, v34);
LABEL_11:
  }

  return v14;
}

- (void)setSchedulingDataInActivity:(id)a3 date:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6
{
  id v30 = a3;
  id v9 = a4;
  objc_msgSend_setActivityEarliestDate_(v30, v10, (uint64_t)v9, v11);
  id v15 = objc_msgSend_numberWithDouble_(NSNumber, v12, v13, v14, a5);
  objc_msgSend_setCoalescingInterval_(v30, v16, (uint64_t)v15, v17);

  v21 = objc_msgSend_dateByAddingTimeInterval_(v9, v18, v19, v20, a5);

  objc_msgSend_setActivityLatestDate_(v30, v22, (uint64_t)v21, v23);
  if (a6 > 0.0)
  {
    uint64_t v27 = objc_msgSend_numberWithDouble_(NSNumber, v24, v25, v26, a6);
    objc_msgSend_setSeparationInterval_(v30, v28, (uint64_t)v27, v29);
  }
}

- (id)addActivityTriggerWithTarget:(id)a3 date:(id)a4 coalescingInterval:(double)a5 minimumSeparation:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v19[1] = 3221225472;
  double v12 = 0.001;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[2] = sub_18B126B18;
  v19[3] = &unk_1E5460AF0;
  if (a5 > 0.0) {
    double v12 = a5;
  }
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  double v22 = v12;
  double v23 = a6;
  id v13 = v11;
  id v14 = v10;
  uint64_t v17 = objc_msgSend_performInTransaction_(self, v15, (uint64_t)v19, v16);

  return v17;
}

- (id)target:(id)a3 group:(id)a4 willRunActivity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v14 = objc_msgSend_db(self, v11, v12, v13);
  id v15 = _CKSQLDBSerializerLock((uint64_t)v14 + 8);

  if (v8)
  {
    objc_msgSend_databaseManagerData(v8, v16, v17, v18);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      double v23 = objc_msgSend_name(v9, v19, v20, v21);
      objc_msgSend_setGroupName_(v10, v24, (uint64_t)v23, v25);

      id v22 = v10;
      objc_msgSend_setDatabaseManagerData_(v8, v26, (uint64_t)v22, v27);
    }
  }
  else
  {
    id v22 = v10;
  }
  uint64_t v28 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v19, v20, v21);
  objc_msgSend_setActivityStartDate_(v22, v29, (uint64_t)v28, v30);

  objc_msgSend_setActivityEarliestDate_(v22, v31, 0, v32);
  objc_msgSend_setActivityLatestDate_(v22, v33, 0, v34);
  objc_msgSend_setCoalescingInterval_(v22, v35, 0, v36);
  v40 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v37, v38, v39);
  objc_msgSend_setActivityNotBeforeDate_(v22, v41, (uint64_t)v40, v42);

  if (v15)
  {
    v15[1].__sig = 0;
    pthread_mutex_unlock(v15);
  }

  return v22;
}

- (void)target:(id)a3 group:(id)a4 didRunActivity:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (!v8)
  {
    id v68 = (id)objc_msgSend_deleteObject_(self->_activities, v10, (uint64_t)v13, v12);
    goto LABEL_18;
  }
  id v14 = objc_msgSend_db(self, v10, v11, v12);
  id v15 = _CKSQLDBSerializerLock((uint64_t)v14 + 8);

  uint64_t v19 = objc_msgSend_separationInterval(v13, v16, v17, v18);
  double v23 = v19;
  if (v19)
  {
    objc_msgSend_doubleValue(v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v24, v25, v26);
    objc_msgSend_setActivityNotBeforeDate_(v13, v28, (uint64_t)v27, v29);
    uint64_t v33 = objc_msgSend_activityEarliestDate(v13, v30, v31, v32);
    uint64_t v36 = v33;
    if (v33 && objc_msgSend_compare_(v33, v34, (uint64_t)v27, v35) == -1)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v37 = (id)ck_log_facility_sql;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v77 = objc_msgSend_targetDescription(v13, v38, v39, v40);
        int v78 = 138543874;
        v79 = v36;
        __int16 v80 = 2114;
        v81 = v27;
        __int16 v82 = 2114;
        v83 = v77;
        _os_log_debug_impl(&dword_18AF10000, v37, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager rescheduled activity: %{public}@ -> %{public}@ for %{public}@", (uint8_t *)&v78, 0x20u);
      }
      v44 = objc_msgSend_coalescingInterval(v13, v41, v42, v43);
      objc_msgSend_doubleValue(v44, v45, v46, v47);
      double v49 = v48;
      v53 = objc_msgSend_separationInterval(v13, v50, v51, v52);
      objc_msgSend_doubleValue(v53, v54, v55, v56);
      objc_msgSend_setSchedulingDataInActivity_date_coalescingInterval_minimumSeparation_(self, v57, (uint64_t)v13, (uint64_t)v27, v49, v58);
    }
  }
  objc_msgSend_setActivityStartDate_(v13, v20, 0, v22);
  v62 = objc_msgSend_activityEarliestDate(v13, v59, v60, v61);
  if (v62)
  {

LABEL_15:
    id v75 = (id)objc_msgSend_insertOrUpdateActivityDate_(self->_activities, v66, (uint64_t)v13, v67);
    goto LABEL_16;
  }
  v69 = objc_msgSend_activityNotBeforeDate(v13, v63, v64, v65);
  objc_msgSend_timeIntervalSinceNow(v69, v70, v71, v72);
  BOOL v74 = v73 > 0.0;

  if (v74) {
    goto LABEL_15;
  }
  id v76 = (id)objc_msgSend_deleteObject_(self->_activities, v66, (uint64_t)v13, v67);
LABEL_16:

  if (v15)
  {
    v15[1].__sig = 0;
    pthread_mutex_unlock(v15);
  }
LABEL_18:
}

- (id)activitiesStartingBeforeDate:(id)a3
{
  return (id)objc_msgSend_activitiesStartingBeforeDate_(self->_activities, a2, (uint64_t)a3, v3);
}

- (id)earliestActivityDate
{
  uint64_t v5 = objc_msgSend_db(self, a2, v2, v3);
  uint64_t v6 = _CKSQLDBSerializerLock((uint64_t)v5 + 8);

  id v10 = objc_msgSend_earliestActivityDate(self->_activities, v7, v8, v9);
  if (v6)
  {
    v6[1].__sig = 0;
    pthread_mutex_unlock(v6);
  }

  return v10;
}

- (id)registerDatabase:(id)a3
{
  return (id)objc_msgSend_registerDatabase_(self->_registry, a2, (uint64_t)a3, v3);
}

- (void)scheduleActivityDate:(id)a3
{
  objc_msgSend_scheduleActivityDate_(self->_timer, a2, (uint64_t)a3, v3);
}

- (void)runActivities:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x18C12ADA0]();
  v87 = v4;
  objc_msgSend_activitiesStartingBeforeDate_(self, v6, (uint64_t)v4, v7);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v92, (uint64_t)v102, 16);
  if (v89)
  {
    v85 = v5;
    uint64_t v9 = 0;
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = &unk_1ED846918;
    uint64_t v88 = *(void *)v93;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v93 != v88) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(id *)(*((void *)&v92 + 1) + 8 * v13);

        id v15 = (void *)MEMORY[0x18C12ADA0]();
        uint64_t v19 = objc_msgSend_databaseID(v14, v16, v17, v18);
        int isEqualToNumber = objc_msgSend_isEqualToNumber_(v12, v20, (uint64_t)v19, v21);

        if (isEqualToNumber)
        {
          id v11 = v11;
          if (!v11) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v41 = objc_msgSend_databaseID(v14, v23, v24, v25);

          objc_msgSend_databaseWithID_(self->_registry, v42, v41, v43);
          id v44 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v12 = (void *)v41;
          id v11 = v44;
          if (!v44)
          {
LABEL_12:
            id v40 = 0;
            v45 = 0;
            objc_msgSend_target_group_willRunActivity_(self, v26, 0, 0, v14);
            goto LABEL_24;
          }
        }
        if (v10
          && (objc_msgSend_groupID(v10, v26, v27, v28),
              uint64_t v29 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend_groupID(v14, v30, v31, v32),
              uint64_t v33 = objc_claimAutoreleasedReturnValue(),
              int v36 = objc_msgSend_isEqualToNumber_(v29, v34, (uint64_t)v33, v35),
              v33,
              v29,
              v36))
        {
          id v40 = v10;
        }
        else
        {
          uint64_t v46 = objc_msgSend_groupID(v14, v26, v27, v28);
          id v91 = 0;
          double v48 = objc_msgSend_tableGroupInDatabase_withID_error_(CKSQLiteTableGroup, v47, (uint64_t)v11, (uint64_t)v46, &v91);
          id v49 = v91;

          if (v49)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v50 = ck_log_facility_sql;
            if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v97 = v49;
              _os_log_error_impl(&dword_18AF10000, v50, OS_LOG_TYPE_ERROR, "Failed to fetch group for activity: %{public}@", buf, 0xCu);
            }
          }
          id v40 = v48;

          if (!v40)
          {
            v45 = 0;
            id v10 = 0;
            objc_msgSend_target_group_willRunActivity_(self, v37, 0, 0, v14);
            goto LABEL_24;
          }
        }
        v53 = objc_msgSend_tableName(v14, v37, v38, v39);
        if (v53)
        {
          objc_msgSend_tableWithName_(v40, v51, (uint64_t)v53, v52);
          id v54 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v54 = v40;
        }
        v45 = v54;

        id v10 = v40;
        objc_msgSend_target_group_willRunActivity_(self, v55, (uint64_t)v45, (uint64_t)v40, v14);
        uint64_t v9 = LABEL_24:;

        if (v45)
        {
          id v90 = v11;
          v59 = v15;
          uint64_t v60 = self;
          uint64_t v61 = v10;
          v62 = objc_msgSend_targetDescription(v9, v56, v57, v58);
          v63 = v12;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          uint64_t v64 = ck_log_facility_sql;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v97 = v62;
            _os_log_debug_impl(&dword_18AF10000, v64, OS_LOG_TYPE_DEBUG, "Running database activity on %{public}@", buf, 0xCu);
          }
          objc_msgSend_activityTriggered_(v45, v65, (uint64_t)v87, v66);

          uint64_t v12 = v63;
          id v10 = v61;
          self = v60;
          id v15 = v59;
          id v11 = v90;
          objc_msgSend_target_group_didRunActivity_(self, v67, (uint64_t)v45, (uint64_t)v40, v9);
        }
        else
        {
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
          }
          id v68 = ck_log_facility_sql;
          if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543874;
            id v97 = v9;
            __int16 v98 = 2114;
            id v99 = v11;
            __int16 v100 = 2114;
            id v101 = v40;
            _os_log_debug_impl(&dword_18AF10000, v68, OS_LOG_TYPE_DEBUG, "Skipped database activity %{public}@ with no target. (db = %{public}@, group = %{public}@)", buf, 0x20u);
          }
          objc_msgSend_target_group_didRunActivity_(self, v69, 0, (uint64_t)v40, v9);
        }

        ++v13;
      }
      while (v89 != v13);
      uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v92, (uint64_t)v102, 16);
      if (!v89)
      {

        uint64_t v5 = v85;
        goto LABEL_39;
      }
    }
  }
  id v10 = 0;
  id v11 = 0;
  uint64_t v12 = &unk_1ED846918;
LABEL_39:

  BOOL v74 = objc_msgSend_earliestActivityDate(self, v71, v72, v73);
  int v78 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v75, v76, v77, 1.0);
  v81 = objc_msgSend_laterDate_(v74, v79, (uint64_t)v78, v80);

  objc_msgSend_scheduleActivityDate_(self, v82, (uint64_t)v81, v83);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v84 = ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AF10000, v84, OS_LOG_TYPE_DEBUG, "CKSQLiteDatabaseManager finished running activities", buf, 2u);
  }
}

- (id)nextActivityDate
{
  return (id)((uint64_t (*)(CKSQLiteDatabaseManagerTimer *, char *))MEMORY[0x1F4181798])(self->_timer, sel_nextActivityDate);
}

- (id)nextActivityDateForTarget:(id)a3
{
  id v8 = a3;
  if (!byte_1E912FED0)
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabaseManager.m", 764, @"Only for unit tests");
  }
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_18AF14038;
  uint64_t v26 = sub_18AF13970;
  id v27 = 0;
  timer = self->_timer;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B127C88;
  void v18[3] = &unk_1E5464FF0;
  v18[4] = self;
  id v10 = v8;
  id v11 = v10;
  uint64_t v20 = &v22;
  SEL v21 = a2;
  id v19 = v10;
  if (timer)
  {
    dispatch_sync((dispatch_queue_t)timer->_activityQueue, v18);
    uint64_t v12 = (void *)v23[5];
    uint64_t v13 = v19;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  id v14 = v12;

  _Block_object_dispose(&v22, 8);

  return v14;
}

- (void)waitForTargetActivityComplete:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!byte_1E912FED0)
  {
    uint64_t v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabaseManager.m", 778, @"Only for unit tests");
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v9 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = v9;
    SEL v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    int v28 = 138412290;
    uint64_t v29 = v22;
    _os_log_debug_impl(&dword_18AF10000, v20, OS_LOG_TYPE_DEBUG, "%@ started waiting for complete", (uint8_t *)&v28, 0xCu);
  }
  uint64_t v12 = objc_msgSend_nextActivityDateForTarget_(self, v10, (uint64_t)v8, v11);
  if (v12)
  {
    id v15 = (void *)v12;
    do
    {
      objc_msgSend_sleepUntilDate_(MEMORY[0x1E4F29060], v13, (uint64_t)v15, v14);
      uint64_t v18 = objc_msgSend_nextActivityDateForTarget_(self, v16, (uint64_t)v8, v17);

      id v15 = (void *)v18;
    }
    while (v18);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v19 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    double v23 = v19;
    uint64_t v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    int v28 = 138412290;
    uint64_t v29 = v25;
    _os_log_debug_impl(&dword_18AF10000, v23, OS_LOG_TYPE_DEBUG, "%@ finished waiting for complete", (uint8_t *)&v28, 0xCu);
  }
}

- (void)waitForComplete
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!byte_1E912FED0)
  {
    uint64_t v31 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v31, v32, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabaseManager.m", 791, @"Only for unit tests");
  }
  uint64_t v5 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2, v3);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v6 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    id v19 = v6;
    uint64_t v20 = (objc_class *)objc_opt_class();
    SEL v21 = NSStringFromClass(v20);
    int v33 = 138412290;
    uint64_t v34 = v21;
    _os_log_debug_impl(&dword_18AF10000, v19, OS_LOG_TYPE_DEBUG, "%@ started waiting for complete", (uint8_t *)&v33, 0xCu);
  }
  uint64_t v10 = objc_msgSend_earliestActivityDate(self, v7, v8, v9);
  if (v10)
  {
    uint64_t v13 = (void *)v10;
    do
    {
      objc_msgSend_sleepUntilDate_(MEMORY[0x1E4F29060], v11, (uint64_t)v13, v12);
      uint64_t v17 = objc_msgSend_earliestActivityDate(self, v14, v15, v16);

      uint64_t v13 = (void *)v17;
    }
    while (v17);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v18 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v18;
    double v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    objc_msgSend_timeIntervalSinceNow(v5, v25, v26, v27);
    uint64_t v29 = CKDescriptionForTimeInterval(-v28);
    int v33 = 138412546;
    uint64_t v34 = v24;
    __int16 v35 = 2114;
    int v36 = v29;
    _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "%@ finished waiting for complete (%{public}@)", (uint8_t *)&v33, 0x16u);
  }
}

- (void)flush
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!byte_1E912FED0)
  {
    double v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabaseManager.m", 805, @"Only for unit tests");
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v6 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v6;
    double v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412290;
    __int16 v35 = v24;
    _os_log_debug_impl(&dword_18AF10000, v22, OS_LOG_TYPE_DEBUG, "%@ started flush", buf, 0xCu);
  }
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = objc_msgSend_earliestActivityDate(self, v7, v8, v9);

    if (v11)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      do
      {
        timer = self->_timer;
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = sub_18B1285A0;
        block[3] = &unk_1E5460350;
        block[4] = self;
        if (timer) {
          dispatch_sync((dispatch_queue_t)timer->_activityQueue, block);
        }
        uint64_t v17 = objc_msgSend_earliestActivityDate(self, v12, v13, v14);
      }
      while (v17);
    }
    activities = self->_activities;
    id v32 = v10;
    char hasPendingActivities = objc_msgSend_hasPendingActivities_(activities, v12, (uint64_t)&v32, v14);
    id v20 = v32;

    uint64_t v10 = v20;
  }
  while ((hasPendingActivities & 1) != 0);
  if (v20)
  {
    uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, @"CKSQLiteDatabaseManager.m", 819, @"Error waiting for complete", v20);
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  SEL v21 = (void *)ck_log_facility_sql;
  if (os_log_type_enabled((os_log_t)ck_log_facility_sql, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = v21;
    uint64_t v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138412290;
    __int16 v35 = v27;
    _os_log_debug_impl(&dword_18AF10000, v25, OS_LOG_TYPE_DEBUG, "%@ finished flush", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_registry, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end