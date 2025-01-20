@interface CLTripSegmentProcessorManager
- (CLTripSegmentProcessorManager)init;
- (id).cxx_construct;
- (id)errorObject:(int64_t)a3 description:(id)a4;
- (id)processTripSegmentData:(id)a3 withOptions:(id)a4 outputHandler:(id)a5;
- (void)clearMapHelperMemoryAndExitCleanly;
- (void)dealloc;
- (void)processTripSegmentData:(id)a3 outputHandler:(id)a4 completionHandler:(id)a5;
- (void)processTripSegmentData:(id)a3 withOptions:(id)a4 outputHandler:(id)a5 completionHandler:(id)a6;
- (void)simulateSparseTrajectoryAndSubmitCoreAnalytics:(id)a3;
@end

@implementation CLTripSegmentProcessorManager

- (CLTripSegmentProcessorManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLTripSegmentProcessorManager;
  v2 = [(CLTripSegmentProcessorManager *)&v4 init];
  if (v2) {
    v2->fQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreLocation.TripSegmentProcessor", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fQueue);
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentProcessorManager;
  [(CLTripSegmentProcessorManager *)&v3 dealloc];
}

- (id)errorObject:(int64_t)a3 description:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
  v9[0] = [NSString stringWithFormat:@"%@", a4, *MEMORY[0x1E4F28568]];
  return (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", @"com.apple.locationd.TripSegmentProcessor", a3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
}

- (id)processTripSegmentData:(id)a3 withOptions:(id)a4 outputHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v11 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "CLTSP,trip segment data is nil", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    v10 = @"CLTSP,trip segment data is nil";
    goto LABEL_22;
  }
  if (![a3 modeOfTransport])
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v12 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "CLTSP,unknown mode of transport", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    v10 = @"CLTSP,invalid mode of transport";
    goto LABEL_22;
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count") <= 1)
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v9 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      int v24 = objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "CLTSP,location count less than two,count,%{public}d", buf, 8u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    v10 = @"CLTSP,location object has less than two entries";
LABEL_22:
    v13 = self;
    uint64_t v14 = 0;
    return [(CLTripSegmentProcessorManager *)v13 errorObject:v14 description:v10];
  }
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
  }
  v16 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240450;
    int v24 = objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
    __int16 v25 = 2114;
    uint64_t v26 = [a3 tripSegmentID];
    _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "CLTSP,processTripSegmentData called with locations count,%{public}d,tripSegmentID,%{public}@", buf, 0x12u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
    [a3 tripSegmentID];
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf) {
      free(v21);
    }
  }
  if ((sub_19086E42C((uint64_t)&self->cltsp, a3, a4, (uint64_t)a5) & 1) == 0)
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v17 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_ERROR, "CLTSP,trip segment processing failed", buf, 2u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      v22 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLTripSegmentProcessorManager processTripSegmentData:withOptions:outputHandler:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    v10 = @"CLTSP,trip segment processing failed";
    v13 = self;
    uint64_t v14 = 1;
    return [(CLTripSegmentProcessorManager *)v13 errorObject:v14 description:v10];
  }
  return 0;
}

- (void)processTripSegmentData:(id)a3 outputHandler:(id)a4 completionHandler:(id)a5
{
  id v6 = objc_alloc_init(CLTripSegmentProcessorOptions);

  MEMORY[0x1F4181798](self, sel_processTripSegmentData_withOptions_outputHandler_completionHandler_);
}

- (void)processTripSegmentData:(id)a3 withOptions:(id)a4 outputHandler:(id)a5 completionHandler:(id)a6
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_1907AB9CC;
  v14[4] = sub_1907AB9DC;
  id v15 = 0;
  id v15 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_1907AB9CC;
  v12[4] = sub_1907AB9DC;
  id v13 = 0;
  id v13 = a4;
  fQueue = self->fQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1907AB9E8;
  block[3] = &unk_1E5697A48;
  block[7] = v14;
  block[8] = v12;
  block[4] = self;
  block[5] = a5;
  block[6] = a6;
  dispatch_async(fQueue, block);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

- (void)clearMapHelperMemoryAndExitCleanly
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [+[CLMapsXPCServiceManager sharedInstance] clearMemoryAndExitHelperProcessCleanly];
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
  }
  v2 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_DEFAULT, "CLTSP,tspManager,clearMemoryAndExitHelperProcessCleanly", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    objc_super v3 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager clearMapHelperMemoryAndExitCleanly]", "CoreLocation: %s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)simulateSparseTrajectoryAndSubmitCoreAnalytics:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  uint64_t v89 = 0;
  v90 = (double *)&v89;
  uint64_t v91 = 0x3812000000;
  v92 = sub_1907ACE78;
  v93 = nullsub_24;
  v94 = "";
  double v95 = -1.0;
  uint64_t v4 = mach_continuous_time();
  double v95 = sub_1907E1770(v4);
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  int v88 = 0;
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = sub_1907ACE88;
  v84[3] = &unk_1E5697A70;
  v84[4] = a3;
  v84[5] = &v85;
  v84[6] = &v89;
  uint64_t v5 = (void *)[a3 tripLocations];
  if ((unint64_t)[v5 count] < 2)
  {
LABEL_38:
    uint64_t v14 = (void *)[v5 mutableCopy];
    goto LABEL_39;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  int v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v96 objects:v115 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v97 != v8) {
          objc_enumerationMutation(v5);
        }
        v6 += [*(id *)(*((void *)&v96 + 1) + 8 * i) isGPSLocationType];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v96 objects:v115 count:16];
    }
    while (v7);
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "lastObject"), "timestamp"), "timeIntervalSinceDate:", objc_msgSend((id)objc_msgSend(v5, "firstObject"), "timestamp"));
  double v11 = v10;
  if (v6 < 2 || (int v12 = (int)(v10 * 0.6), v6 <= v12))
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    __int16 v25 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      uint64_t v107 = *(void *)&v11;
      __int16 v108 = 1026;
      *(_DWORD *)v109 = v6;
      _os_log_impl(&dword_1906B8000, v25, OS_LOG_TYPE_INFO, "CLTSP,hasSubstantialGPSData,0,duration,%{public}.1lf,numberOfGPSLocations,%{public}d", buf, 0x12u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      int v100 = 134349312;
      double v101 = v11;
      __int16 v102 = 1026;
      int v103 = v6;
      LODWORD(v81) = 18;
      v74 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::hasSubstantialGPSData(NSArray<CLTripSegmentLocation *> * _Nonnull, double)", "CoreLocation: %s\n", v74);
      if (v74 != (char *)buf) {
        free(v74);
      }
    }
    goto LABEL_38;
  }
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
  }
  id v13 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349568;
    uint64_t v107 = *(void *)&v11;
    __int16 v108 = 1026;
    *(_DWORD *)v109 = v6;
    *(_WORD *)&v109[4] = 1026;
    *(_DWORD *)&v109[6] = v12;
    _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_INFO, "CLTSP,hasSubstantialGPSData,1,duration,%{public}.1lf,numberOfGPSLocations,%{public}d,threshold,%{public}d", buf, 0x18u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    int v100 = 134349568;
    double v101 = v11;
    __int16 v102 = 1026;
    int v103 = v6;
    __int16 v104 = 1026;
    int v105 = v12;
    LODWORD(v81) = 24;
    v80 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "static BOOL CLTripSegmentUtilities::hasSubstantialGPSData(NSArray<CLTripSegmentLocation *> * _Nonnull, double)", "CoreLocation: %s\n", v80);
    if (v80 != (char *)buf) {
      free(v80);
    }
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v5];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(v115, 0, 64);
  uint64_t v16 = [v5 countByEnumeratingWithState:v115 objects:buf count:16];
  id v82 = a3;
  if (v16)
  {
    int v17 = 0;
    int v18 = 0;
    uint64_t v19 = **(void **)&v115[1];
    double v20 = -1.0;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (**(void **)&v115[1] != v19) {
          objc_enumerationMutation(v5);
        }
        v22 = *(void **)(*((void *)&v115[0] + 1) + 8 * j);
        if ([v22 isGPSLocationType])
        {
          objc_msgSend((id)objc_msgSend(v22, "timestamp"), "timeIntervalSinceReferenceDate");
          double v24 = v23;
          if (vabdd_f64(v23, v20) < 3.0) {
            ++v17;
          }
          else {
            int v17 = 1;
          }
          if (v17 >= 11)
          {
            [v15 addObject:v22];
            if (v18 <= 119)
            {
              ++v18;
            }
            else
            {
              int v17 = 0;
              int v18 = 0;
            }
          }
          double v20 = v24;
        }
      }
      uint64_t v16 = [v5 countByEnumeratingWithState:v115 objects:buf count:16];
    }
    while (v16);
  }
  [v14 removeObjectsInArray:v15];
  a3 = v82;
LABEL_39:
  int v26 = [v14 count];
  *((_DWORD *)v86 + 6) = v26;
  uint64_t v27 = objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
  if (v27 == [v14 count])
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v28 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "tripSegmentID"), "UUIDString"), "UTF8String");
      int v30 = [a3 modeOfTransport];
      int v31 = objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
      *(_DWORD *)buf = 136446722;
      uint64_t v107 = v29;
      __int16 v108 = 1026;
      *(_DWORD *)v109 = v30;
      *(_WORD *)&v109[4] = 1026;
      *(_DWORD *)&v109[6] = v31;
      _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,data not created,ID,%{public}s,modeOfTransport,%{public}d,locations,%{public}d", buf, 0x18u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      uint64_t v59 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "tripSegmentID"), "UUIDString"), "UTF8String");
      int v60 = [a3 modeOfTransport];
      int v61 = objc_msgSend((id)objc_msgSend(a3, "tripLocations"), "count");
      LODWORD(v115[0]) = 136446722;
      *(void *)((char *)v115 + 4) = v59;
      WORD6(v115[0]) = 1026;
      *(_DWORD *)((char *)v115 + 14) = v60;
      WORD1(v115[1]) = 1026;
      DWORD1(v115[1]) = v61;
      v62 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v62);
      if (v62 != (char *)buf) {
        free(v62);
      }
    }
    if ([a3 isFinalPart])
    {
      uint64_t v32 = sub_190859358();
      sub_19085A1E4(v32);
    }
  }
  else
  {
    if (*(int *)(sub_190859358() + 608) < 1)
    {
      uint64_t v38 = [MEMORY[0x1E4F29128] UUID];
      id v33 = a3;
    }
    else
    {
      id v33 = a3;
      v34 = NSString;
      uint64_t v35 = sub_190859358();
      v36 = (void *)(v35 + 40);
      if (*(char *)(v35 + 63) < 0) {
        v36 = (void *)*v36;
      }
      uint64_t v37 = objc_msgSend(v34, "stringWithFormat:", @"%s", v36, v81);
      uint64_t v38 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v37];
    }
    v39 = -[CLTripSegmentInputData initWithTripSegmentID:isFinalPart:modeOfTransport:tripLocations:startTripLocation:stopTripLocation:inertialData:]([CLTripSegmentInputData alloc], "initWithTripSegmentID:isFinalPart:modeOfTransport:tripLocations:startTripLocation:stopTripLocation:inertialData:", v38, [v33 isFinalPart], objc_msgSend(v33, "modeOfTransport"), v14, objc_msgSend(v33, "startTripLocation"), objc_msgSend(v33, "stopTripLocation"), objc_msgSend(v33, "inertialData"));
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v40 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "tripSegmentID"), "UUIDString"), "UTF8String");
      uint64_t v42 = [(NSString *)[(NSUUID *)[(CLTripSegmentInputData *)v39 tripSegmentID] UUIDString] UTF8String];
      int v43 = [v33 modeOfTransport];
      int v44 = objc_msgSend((id)objc_msgSend(v33, "tripLocations"), "count");
      int v45 = [v14 count];
      *(_DWORD *)buf = 136447234;
      uint64_t v107 = v41;
      __int16 v108 = 2082;
      *(void *)v109 = v42;
      *(_WORD *)&v109[8] = 1026;
      int v110 = v43;
      __int16 v111 = 1026;
      int v112 = v44;
      __int16 v113 = 1026;
      int v114 = v45;
      _os_log_impl(&dword_1906B8000, v40, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,data created,origID,%{public}s,newID,%{public}s,modeOfTransport,%{public}d,origLocations,%{public}d,sparseLocations,%{public}d", buf, 0x28u);
    }
    v46 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
    v47 = v33;
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      uint64_t v63 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "tripSegmentID"), "UUIDString"), "UTF8String");
      uint64_t v64 = [(NSString *)[(NSUUID *)[(CLTripSegmentInputData *)v39 tripSegmentID] UUIDString] UTF8String];
      int v65 = [v33 modeOfTransport];
      int v66 = objc_msgSend((id)objc_msgSend(v33, "tripLocations"), "count");
      int v67 = [v14 count];
      LODWORD(v115[0]) = 136447234;
      *(void *)((char *)v115 + 4) = v63;
      WORD6(v115[0]) = 2082;
      *(void *)((char *)v115 + 14) = v64;
      WORD3(v115[1]) = 1026;
      DWORD2(v115[1]) = v65;
      WORD6(v115[1]) = 1026;
      *(_DWORD *)((char *)&v115[1] + 14) = v66;
      WORD1(v115[2]) = 1026;
      DWORD1(v115[2]) = v67;
      v68 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v68);
      v47 = v33;
      v46 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
      if (v68 != (char *)buf) {
        free(v68);
      }
    }
    v48 = objc_alloc_init(CLTripSegmentProcessorOptions);
    [(CLTripSegmentProcessorOptions *)v48 setSimulatedSparseProcessing:1];
    if ([(CLTripSegmentProcessorManager *)self processTripSegmentData:v39 withOptions:v48 outputHandler:v84])
    {
      if (*((void *)v46 + 218) != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      v49 = qword_1E929F6D8;
      if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v47, "tripSegmentID"), "UUIDString"), "UTF8String");
        v51 = v90;
        double v52 = 0.0;
        if (v90[6] >= 0.0)
        {
          uint64_t v53 = mach_continuous_time();
          double v52 = vabdd_f64(sub_1907E1770(v53), v51[6]) * 1000.0;
        }
        *(_DWORD *)buf = 136446466;
        uint64_t v107 = v50;
        __int16 v108 = 2050;
        *(double *)v109 = v52;
        _os_log_impl(&dword_1906B8000, v49, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,failedtripID,%{public}s,processingTime,%{public}.2lf", buf, 0x16u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (*((void *)v46 + 218) != -1) {
          dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
        }
        uint64_t v75 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v47, "tripSegmentID"), "UUIDString"), "UTF8String");
        v76 = v90;
        double v77 = 0.0;
        if (v90[6] >= 0.0)
        {
          uint64_t v78 = mach_continuous_time();
          double v77 = vabdd_f64(sub_1907E1770(v78), v76[6]) * 1000.0;
        }
        LODWORD(v115[0]) = 136446466;
        *(void *)((char *)v115 + 4) = v75;
        WORD6(v115[0]) = 2050;
        *(double *)((char *)v115 + 14) = v77;
        v79 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v79);
        if (v79 != (char *)buf) {
          free(v79);
        }
      }
    }
    if (*((void *)v46 + 218) != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
    }
    v54 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v55 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v47, "tripSegmentID"), "UUIDString"), "UTF8String");
      v56 = v90;
      double v57 = 0.0;
      if (v90[6] >= 0.0)
      {
        uint64_t v58 = mach_continuous_time();
        double v57 = vabdd_f64(sub_1907E1770(v58), v56[6]) * 1000.0;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v107 = v55;
      __int16 v108 = 2050;
      *(double *)v109 = v57;
      _os_log_impl(&dword_1906B8000, v54, OS_LOG_TYPE_DEFAULT, "CLTSP,simulatedSparse,success,tripID,%{public}s,processingTime,%{public}.2lf", buf, 0x16u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (*((void *)v46 + 218) != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE005A80);
      }
      uint64_t v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v47, "tripSegmentID"), "UUIDString"), "UTF8String");
      v70 = v90;
      double v71 = 0.0;
      if (v90[6] >= 0.0)
      {
        uint64_t v72 = mach_continuous_time();
        double v71 = vabdd_f64(sub_1907E1770(v72), v70[6]) * 1000.0;
      }
      LODWORD(v115[0]) = 136446466;
      *(void *)((char *)v115 + 4) = v69;
      WORD6(v115[0]) = 2050;
      *(double *)((char *)v115 + 14) = v71;
      v73 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLTripSegmentProcessorManager simulateSparseTrajectoryAndSubmitCoreAnalytics:]", "CoreLocation: %s\n", v73);
      if (v73 != (char *)buf) {
        free(v73);
      }
    }
  }
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
}

- (void).cxx_destruct
{
  fQueue = self[1].fQueue;
  if (fQueue) {
    sub_1906BFE48((std::__shared_weak_count *)fQueue);
  }

  sub_1907B1090((uint64_t)&self->cltsp.fOSTransaction);
}

- (id).cxx_construct
{
  self->cltsp.fDistanceCalculator.fRefLatRads = 0.0;
  self->cltsp.fDistanceCalculator.fRefLatDegs = 0.0;
  *(_OWORD *)&self->cltsp.fDistanceCalculator.fM = xmmword_1908820F0;
  self->cltsp.fDistanceCalculator.fCosRefLat = 1.0;
  p_fOSTransaction = &self->cltsp.fOSTransaction;
  sub_1906D5C70(&__p, "CLTripSegmentProcessorOSTransaction");
  sub_1907B1024(p_fOSTransaction, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  LOWORD(self->cltsp.fOSTransaction.name_.__r_.var0) = 1;
  self[1].super.isa = 0;
  self[1].fQueue = 0;
  self->cltsp.fOSTransaction.name_.var0 = (int64_t)@"/var/mobile/Library/Caches/com.apple.routined/tripSegments/";
  return self;
}

@end