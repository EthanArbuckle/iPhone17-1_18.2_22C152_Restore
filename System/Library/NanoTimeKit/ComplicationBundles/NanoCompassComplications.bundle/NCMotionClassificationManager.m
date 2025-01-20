@interface NCMotionClassificationManager
- (BOOL)isStationary;
- (NCMotionClassificationManager)init;
- (int64_t)motionType;
- (void)_computeStatus;
- (void)_housekeepingWith:(id)a3;
- (void)_startMotionActivityUpdate;
- (void)_updateMotionActivity:(id)a3;
- (void)_updateMotionType:(int64_t)a3 isDeviceStationary:(BOOL)a4;
- (void)_updateStatusFromPedometer;
- (void)startMotionActivityUpdatesWithHandler:(id)a3;
- (void)stopMotionActivityUpdates;
@end

@implementation NCMotionClassificationManager

- (NCMotionClassificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCMotionClassificationManager;
  v2 = [(NCMotionClassificationManager *)&v8 init];
  if (v2)
  {
    v3 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x263F01780]);
    motionActivityManager = v2->_motionActivityManager;
    v2->_motionActivityManager = v3;

    v5 = (CMPedometer *)objc_alloc_init(MEMORY[0x263F017A0]);
    pedometer = v2->_pedometer;
    v2->_pedometer = v5;

    v2->_motionType = 1;
    v2->_stationary = 0;
  }
  return v2;
}

- (void)startMotionActivityUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_2375CF414;
  v6[3] = &unk_264CD5BF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)stopMotionActivityUpdates
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375CF544;
  block[3] = &unk_264CD5570;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_startMotionActivityUpdate
{
  objc_initWeak(&location, self);
  v3 = NCLogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23759D000, v3, OS_LOG_TYPE_DEFAULT, "Motion activity is available and starting the event updating.", buf, 2u);
  }

  motionActivityManager = self->_motionActivityManager;
  objc_super v8 = objc_msgSend_mainQueue(MEMORY[0x263F08A48], v5, v6, v7);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2375CF6D8;
  v10[3] = &unk_264CD5F08;
  objc_copyWeak(&v11, &location);
  objc_msgSend_startActivityUpdatesToQueue_withHandler_(motionActivityManager, v9, (uint64_t)v8, (uint64_t)v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateMotionActivity:(id)a3
{
  id v4 = a3;
  int isMoving = objc_msgSend_nc_isMoving(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_nc_motionType(v4, v9, v10, v11);
  v19 = objc_msgSend_now(MEMORY[0x263EFF910], v13, v14, v15);
  if (isMoving)
  {
    objc_msgSend_eventWithType_timestamp_stationary_(NCMotionEvent, v16, v12, (uint64_t)v19, 0);
    v25 = LABEL_7:;
    objc_msgSend__housekeepingWith_(self, v26, (uint64_t)v25, v27);

    goto LABEL_8;
  }
  if (objc_msgSend_stationary(v4, v16, v17, v18))
  {
    v23 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_23759D000, v23, OS_LOG_TYPE_DEFAULT, "Device is stationary and user is not walking/running/cycling/in automotive.", v33, 2u);
    }

    objc_msgSend_eventWithType_timestamp_stationary_(NCMotionEvent, v24, 0, (uint64_t)v19, 1);
    goto LABEL_7;
  }
  if (objc_msgSend_isStepCountingAvailable(MEMORY[0x263F017A0], v20, v21, v22))
  {
    objc_msgSend__updateStatusFromPedometer(self, v28, v29, v30);
  }
  else
  {
    v31 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_2375D9898(v31);
    }

    objc_msgSend__updateMotionType_isDeviceStationary_(self, v32, 1, 0);
  }
LABEL_8:
}

- (void)_updateStatusFromPedometer
{
  id v5 = objc_msgSend_now(MEMORY[0x263EFF910], a2, v2, v3);
  v9 = objc_msgSend_dateByAddingTimeInterval_(v5, v6, v7, v8, -90.0);
  pedometer = self->_pedometer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2375CF97C;
  v12[3] = &unk_264CD5F58;
  v12[4] = self;
  objc_msgSend_queryPedometerDataFromDate_toDate_withHandler_(pedometer, v11, (uint64_t)v9, (uint64_t)v5, v12);
}

- (void)_housekeepingWith:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_timestamp(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_array(MEMORY[0x263EFF980], v9, v10, v11);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v16 = objc_msgSend_reverseObjectEnumerator(self->_motionEventQueue, v13, v14, v15, 0);
  v20 = objc_msgSend_allObjects(v16, v17, v18, v19);

  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v65, (uint64_t)v69, 16);
  if (v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v66 != v27) {
          objc_enumerationMutation(v20);
        }
        uint64_t v29 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v30 = objc_msgSend_timestamp(v29, v23, v24, v25);
        objc_msgSend_timeIntervalSinceDate_(v8, v31, (uint64_t)v30, v32);
        double v34 = v33;

        if (v34 >= 20.0)
        {
          v38 = objc_msgSend_dateByAddingTimeInterval_(v8, v35, v36, v37, -20.0);
          objc_msgSend_setTimestamp_(v29, v39, (uint64_t)v38, v40);

          objc_msgSend_addObject_(v12, v41, (uint64_t)v29, v42);
          goto LABEL_11;
        }
        objc_msgSend_addObject_(v12, v35, (uint64_t)v29, v37);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v65, (uint64_t)v69, 16);
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v46 = objc_msgSend_reverseObjectEnumerator(v12, v43, v44, v45);
  v50 = objc_msgSend_allObjects(v46, v47, v48, v49);
  v54 = objc_msgSend_mutableCopy(v50, v51, v52, v53);

  objc_msgSend_addObject_(v54, v55, (uint64_t)v4, v56);
  v60 = (NSArray *)objc_msgSend_copy(v54, v57, v58, v59);
  motionEventQueue = self->_motionEventQueue;
  self->_motionEventQueue = v60;

  objc_msgSend__computeStatus(self, v62, v63, v64);
}

- (void)_computeStatus
{
  uint64_t v8 = objc_msgSend_count(self->_motionEventQueue, a2, v2, v3);
  motionEventQueue = self->_motionEventQueue;
  if (v8 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(motionEventQueue, v5, 0, v7);
    id v53 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_motionType(v53, v10, v11, v12);
    uint64_t isStationary = objc_msgSend_isStationary(v53, v14, v15, v16);
    objc_msgSend__updateMotionType_isDeviceStationary_(self, v18, v13, isStationary);

    return;
  }
  if (objc_msgSend_count(motionEventQueue, v5, v6, v7) == 1)
  {
    uint64_t v21 = 0;
LABEL_14:
    v50 = self;
    uint64_t v51 = v21;
    uint64_t v52 = 0;
    goto LABEL_15;
  }
  uint64_t v21 = 0;
  unint64_t v22 = 0;
  double v23 = 0.0;
  double v24 = 0.0;
  do
  {
    uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(self->_motionEventQueue, v19, v22, v20);
    uint64_t v29 = objc_msgSend_timestamp(v25, v26, v27, v28);
    uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(self->_motionEventQueue, v30, ++v22, v31);
    uint64_t v36 = objc_msgSend_timestamp(v32, v33, v34, v35);

    objc_msgSend_timeIntervalSinceDate_(v36, v37, (uint64_t)v29, v38);
    double v40 = v39;
    if (objc_msgSend_isStationary(v25, v41, v42, v43))
    {
      double v24 = v24 + v40;
    }
    else
    {
      double v23 = v23 + v40;
      uint64_t v21 = objc_msgSend_motionType(v25, v44, v45, v46);
    }
  }
  while (v22 < objc_msgSend_count(self->_motionEventQueue, v47, v48, v49) - 1);
  if (v24 <= v23) {
    goto LABEL_14;
  }
  v50 = self;
  uint64_t v51 = 0;
  uint64_t v52 = 1;
LABEL_15:

  objc_msgSend__updateMotionType_isDeviceStationary_(v50, v19, v51, v52);
}

- (void)_updateMotionType:(int64_t)a3 isDeviceStationary:(BOOL)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375D006C;
  block[3] = &unk_264CD5F80;
  block[4] = self;
  void block[5] = a3;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (int64_t)motionType
{
  return self->_motionType;
}

- (BOOL)isStationary
{
  return self->_stationary;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_motionClassificationHandler, 0);
  objc_storeStrong((id *)&self->_motionEventQueue, 0);
  objc_storeStrong((id *)&self->_pedometer, 0);

  objc_storeStrong((id *)&self->_motionActivityManager, 0);
}

@end