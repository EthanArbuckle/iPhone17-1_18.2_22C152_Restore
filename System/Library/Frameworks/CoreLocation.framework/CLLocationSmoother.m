@interface CLLocationSmoother
- (CLLocationManagerDelegateInternal)delegate;
- (_CLLocationSmootherProxy)locationManagerSmootherProxy;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)smoothLocations:(id)a3;
- (void)smoothLocations:(id)a3 handler:(id)a4;
- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 handler:(id)a5;
- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 shouldReconstructRoute:(BOOL)a5 handler:(id)a6;
- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 shouldReconstructRoute:(BOOL)a5 timeIntervalsThatNeedPopulated:(id)a6 handler:(id)a7;
@end

@implementation CLLocationSmoother

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationSmoother;
  [(CLLocationSmoother *)&v3 dealloc];
}

- (_CLLocationSmootherProxy)locationManagerSmootherProxy
{
  result = self->_locationManagerSmootherProxy;
  if (!result)
  {
    result = [[_CLLocationSmootherProxy alloc] initWithCLLocationSmoother:self];
    self->_locationManagerSmootherProxy = result;
  }
  return result;
}

- (void)smoothLocations:(id)a3
{
  v5 = [(CLLocationSmoother *)self locationManagerSmootherProxy][8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190733098;
  v6[3] = &unk_1E5696EE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)smoothLocations:(id)a3 handler:(id)a4
{
}

- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 handler:(id)a5
{
}

- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 shouldReconstructRoute:(BOOL)a5 handler:(id)a6
{
}

- (void)smoothLocations:(id)a3 workoutActivityType:(unint64_t)a4 shouldReconstructRoute:(BOOL)a5 timeIntervalsThatNeedPopulated:(id)a6 handler:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if ((sub_190795014() & 1) == 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190733C20;
    block[3] = &unk_1E5696C40;
    block[4] = a7;
    dispatch_async(global_queue, block);
    return;
  }
  v12 = (void **)&v64;
  int64_t v55 = a4;
  id v56 = a3;
  if (!a6)
  {
    id obj = 0;
    goto LABEL_35;
  }
  id obj = a6;
  if (![a6 count]) {
    goto LABEL_35;
  }
  unsigned int v54 = v9;
  id v53 = a7;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v13 = [a6 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v60;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v60 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v59 + 1) + 8 * v17);
        if (qword_1E929F6B0 != -1) {
          dispatch_once(&qword_1E929F6B0, &unk_1EE0056E0);
        }
        v19 = qword_1E929F6B8;
        if (os_log_type_enabled((os_log_t)qword_1E929F6B8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend((id)objc_msgSend(v18, "startDate"), "timeIntervalSinceReferenceDate");
          uint64_t v21 = v20;
          objc_msgSend((id)objc_msgSend(v18, "endDate"), "timeIntervalSinceReferenceDate");
          *(_DWORD *)buf = 134218496;
          *(void *)v71 = v15 + v17;
          *(_WORD *)&v71[8] = 2048;
          v12 = (void **)&v64;
          *(void *)&v71[10] = v21;
          *(_WORD *)&v71[18] = 2048;
          *(void *)&v71[20] = v22;
          _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "CLRS,timeIntervalsThatNeedPopulated,index,%zu,start,%.lf,stop,%.1lf", buf, 0x20u);
        }
        if (sub_1906CB57C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929F6B0 != -1) {
            dispatch_once(&qword_1E929F6B0, &unk_1EE0056E0);
          }
          objc_msgSend((id)objc_msgSend(v18, "startDate"), "timeIntervalSinceReferenceDate");
          uint64_t v24 = v23;
          objc_msgSend((id)objc_msgSend(v18, "endDate"), "timeIntervalSinceReferenceDate");
          int v64 = 134218496;
          uint64_t v65 = v15 + v17;
          __int16 v66 = 2048;
          v12 = (void **)&v64;
          uint64_t v67 = v24;
          __int16 v68 = 2048;
          uint64_t v69 = v25;
          v26 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationSmoother smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "CoreLocation: %s\n", v26);
          if (v26 != (char *)buf) {
            free(v26);
          }
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v27 = [obj countByEnumeratingWithState:&v59 objects:v72 count:16];
      uint64_t v14 = v27;
      v15 += v17;
    }
    while (v27);
  }
  LODWORD(p_cache) = +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/LocationBundles/AppleWatchWorkout.bundle"];
  if (qword_1E929F6B0 != -1) {
    goto LABEL_68;
  }
  while (1)
  {
    unsigned int v29 = p_cache - 3;
    v30 = qword_1E929F6B8;
    a7 = v53;
    uint64_t v9 = v54;
    if (os_log_type_enabled((os_log_t)qword_1E929F6B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v71 = v29 < 2;
      *(_WORD *)&v71[4] = 1026;
      *(_DWORD *)((char *)v12 + 42) = p_cache;
      _os_log_impl(&dword_1906B8000, v30, OS_LOG_TYPE_DEFAULT, "CLRS,workoutAppIsAuthorizedForLocations,%{public}d,workoutAppAuthorizationStatus,%{public}d", buf, 0xEu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6B0 != -1) {
        dispatch_once(&qword_1E929F6B0, &unk_1EE0056E0);
      }
      int v64 = 67240448;
      LODWORD(v65) = v29 < 2;
      WORD2(v65) = 1026;
      *(_DWORD *)((char *)v12 + 10) = p_cache;
      v51 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationSmoother smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "CoreLocation: %s\n", v51);
      if (v51 != (char *)buf) {
        free(v51);
      }
      a7 = v53;
      uint64_t v9 = v54;
    }
    if (v29 >= 2)
    {
      if (qword_1E929F6B0 != -1) {
        dispatch_once(&qword_1E929F6B0, &unk_1EE0056E0);
      }
      v31 = qword_1E929F6B8;
      if (os_log_type_enabled((os_log_t)qword_1E929F6B8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v71 = p_cache;
        _os_log_impl(&dword_1906B8000, v31, OS_LOG_TYPE_ERROR, "CLRS,workout app is not authorized for locations,clearing time intervals that need populated,status,%{public}d", buf, 8u);
      }
      if (sub_1906CB57C(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F6B0 != -1) {
          dispatch_once(&qword_1E929F6B0, &unk_1EE0056E0);
        }
        int v64 = 67240192;
        LODWORD(v65) = p_cache;
        v52 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 0, "-[CLLocationSmoother smoothLocations:workoutActivityType:shouldReconstructRoute:timeIntervalsThatNeedPopulated:handler:]", "CoreLocation: %s\n", v52);
        if (v52 != (char *)buf) {
          free(v52);
        }
        id obj = 0;
        a7 = v53;
      }
      else
      {
        id obj = 0;
      }
      uint64_t v9 = v54;
    }
LABEL_35:
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.smoother" options:4096];
    if (v33) {
      break;
    }
    p_cache = CLCircularRegion.cache;
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0064A0);
    }
    v12 = CLCircularRegion.cache;
    v48 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v71 = 0;
      *(_WORD *)&v71[4] = 2082;
      *(void *)&v71[6] = "";
      *(_WORD *)&v71[14] = 2082;
      *(void *)&v71[16] = "assert";
      *(_WORD *)&v71[24] = 2081;
      *(void *)&v71[26] = "connection";
      _os_log_impl(&dword_1906B8000, v48, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"-initWithMachServiceName:options: is declared to return nonnull but failed to return an object\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0064A0);
      }
    }
    v49 = qword_1EB2713E0;
    if (os_signpost_enabled((os_log_t)qword_1EB2713E0))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v71 = 0;
      *(_WORD *)&v71[4] = 2082;
      *(void *)&v71[6] = "";
      *(_WORD *)&v71[14] = 2082;
      *(void *)&v71[16] = "assert";
      *(_WORD *)&v71[24] = 2081;
      *(void *)&v71[26] = "connection";
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v49, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "-initWithMachServiceName:options: is declared to return nonnull but failed to return an object", "{\"msg%{public}.0s\":\"-initWithMachServiceName:options: is declared to return nonnull but failed to return an object\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0064A0);
      }
    }
    v50 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v71 = 0;
      *(_WORD *)&v71[4] = 2082;
      *(void *)&v71[6] = "";
      *(_WORD *)&v71[14] = 2082;
      *(void *)&v71[16] = "assert";
      *(_WORD *)&v71[24] = 2081;
      *(void *)&v71[26] = "connection";
      _os_log_impl(&dword_1906B8000, v50, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"-initWithMachServiceName:options: is declared to return nonnull but failed to return an object\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_68:
    dispatch_once(&qword_1E929F6B0, &unk_1EE0056E0);
  }
  v34 = v33;
  objc_msgSend(v33, "setExportedInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EE02AC68));
  objc_msgSend(v34, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EE041038));
  v35 = (void *)[v34 remoteObjectInterface];
  v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  objc_msgSend(v35, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0), sel_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, 0, 0);
  v38 = (void *)[v34 remoteObjectInterface];
  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0), sel_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, 3, 0);
  v41 = (void *)[v34 remoteObjectInterface];
  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  objc_msgSend(v41, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0), sel_smoothLocations_workoutActivity_shouldReconstructRoute_timeIntervalsThatNeedPopulated_handler_, 0, 1);
  [v34 resume];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = sub_190733C90;
  v58[3] = &unk_1E5697380;
  v58[4] = a7;
  v44 = (void *)[v34 remoteObjectProxyWithErrorHandler:v58];
  uint64_t v45 = 4;
  if (v55 > 51)
  {
    id v46 = v56;
    id v47 = obj;
    if (v55 > 69)
    {
      if ((unint64_t)(v55 - 70) < 2)
      {
        uint64_t v45 = 90603;
        goto LABEL_56;
      }
    }
    else
    {
      switch(v55)
      {
        case '4':
          goto LABEL_56;
        case '=':
          uint64_t v45 = 19150;
          goto LABEL_56;
        case 'C':
          uint64_t v45 = 519150;
          goto LABEL_56;
      }
    }
    goto LABEL_55;
  }
  id v46 = v56;
  id v47 = obj;
  if (v55 <= 23)
  {
    if (v55 == 13)
    {
      uint64_t v45 = 6;
      goto LABEL_56;
    }
    if (v55 == 21)
    {
      uint64_t v45 = 15255;
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  if (v55 != 24)
  {
    if (v55 == 37)
    {
      uint64_t v45 = 8;
      goto LABEL_56;
    }
    if (v55 == 46)
    {
      uint64_t v45 = 18240;
      goto LABEL_56;
    }
LABEL_55:
    uint64_t v45 = 62;
  }
LABEL_56:
  [v44 smoothLocations:v46 workoutActivity:v45 shouldReconstructRoute:v9 timeIntervalsThatNeedPopulated:v47 handler:a7];
}

- (void)setDelegate:(id)a3
{
  v5 = [(CLLocationSmoother *)self locationManagerSmootherProxy][8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_190733DE4;
  v6[3] = &unk_1E5696EE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (CLLocationManagerDelegateInternal)delegate
{
  v2 = [(CLLocationSmoother *)self locationManagerSmootherProxy];

  return [(_CLLocationSmootherProxy *)v2 delegate];
}

@end