@interface CLSubmersionStateMachine
- (CLSubmersionStateMachine)initWithType:(int64_t)a3;
- (double)deepThreshold;
- (double)nearDepthLimitThreshold;
- (double)pastMaxDepthThreshold;
- (double)sensorErrorThreshold;
- (int64_t)getType;
- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4;
- (int64_t)type;
- (void)initializeThresholds;
- (void)setType:(int64_t)a3;
@end

@implementation CLSubmersionStateMachine

- (CLSubmersionStateMachine)initWithType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSubmersionStateMachine;
  v4 = [(CLSubmersionStateMachine *)&v9 init];
  v7 = v4;
  if (v4)
  {
    v4->_type = a3;
    objc_msgSend_initializeThresholds(v4, v5, v6);
  }
  return v7;
}

- (void)initializeThresholds
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = 6.0;
  if (self->_type != 1) {
    goto LABEL_9;
  }
  self->_double maxDepth = 40.0;
  int v4 = MGGetSInt32Answer();
  if (qword_1E929D758 != -1) {
    dispatch_once(&qword_1E929D758, &unk_1EDFD1D40);
  }
  v5 = qword_1E929D750;
  if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    float v15 = *(float *)&v4;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Max depth from gestalt, %d", buf, 8u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D758 != -1) {
      dispatch_once(&qword_1E929D758, &unk_1EDFD1D40);
    }
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if (v4 >= 1)
  {
    double v3 = (double)v4;
LABEL_9:
    self->_double maxDepth = v3;
  }
  if (qword_1E929D758 != -1) {
    dispatch_once(&qword_1E929D758, &unk_1EDFD1D40);
  }
  uint64_t v6 = qword_1E929D750;
  if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_DEFAULT))
  {
    int64_t type = self->_type;
    double maxDepth = self->_maxDepth;
    *(_DWORD *)buf = 67109376;
    float v15 = *(float *)&type;
    __int16 v16 = 2048;
    double v17 = maxDepth;
    _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "initializing submersion thresholds,type,%d,maxdepth,%f", buf, 0x12u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D758 != -1) {
      dispatch_once(&qword_1E929D758, &unk_1EDFD1D40);
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CLSubmersionStateMachine initializeThresholds]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  sub_1904F4EBC((uint64_t)buf, (uint64_t)"DeepDepthMeters", 1.0);
  self->_deepThreshold = v15;
  float v9 = self->_maxDepth * 0.875;
  sub_1904F4EBC((uint64_t)buf, (uint64_t)"NearDepthLimitMeters", v9);
  self->_nearDepthLimitThreshold = v15;
  float v10 = self->_maxDepth;
  sub_1904F4EBC((uint64_t)buf, (uint64_t)"PastMaxDepthMeters", v10);
  self->_pastMaxDepthThreshold = v15;
  float v11 = self->_maxDepth * 1.1;
  sub_1904F4EBC((uint64_t)buf, (uint64_t)"SensorErrorDepthMeters", v11);
  self->_sensorErrorThreshold = v15;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
  objc_msgSend_initializeThresholds(self, a2, a3);
}

- (int64_t)getType
{
  return self->_type;
}

- (int64_t)stateFromDepth:(id)a3 forceSubmersion:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(a3, a2, (uint64_t)a3) > 199 || a4)
  {
    objc_msgSend_depth(a3, v7, v8);
    if (v21 <= self->_sensorErrorThreshold)
    {
      objc_msgSend_depth(a3, v19, v20);
      if (v24 <= self->_pastMaxDepthThreshold)
      {
        objc_msgSend_depth(a3, v22, v23);
        if (v27 <= self->_nearDepthLimitThreshold)
        {
          objc_msgSend_depth(a3, v25, v26);
          if (v28 <= self->_deepThreshold) {
            return 200;
          }
          else {
            return 300;
          }
        }
        else
        {
          return 400;
        }
      }
      else
      {
        return 500;
      }
    }
    else
    {
      return 600;
    }
  }
  else
  {
    if (qword_1E929D758 != -1) {
      dispatch_once(&qword_1E929D758, &unk_1EDFD1D40);
    }
    float v9 = qword_1E929D750;
    if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = objc_msgSend_state(a3, v10, v11);
      objc_msgSend_depth(a3, v13, v14);
      *(_DWORD *)buf = 134218240;
      uint64_t v35 = v12;
      __int16 v36 = 2048;
      uint64_t v37 = v15;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_DEBUG, "not updating client state because not submerged,state,%ld,depth,%f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D758 != -1) {
        dispatch_once(&qword_1E929D758, &unk_1EDFD1D40);
      }
      objc_msgSend_state(a3, v29, v30);
      objc_msgSend_depth(a3, v31, v32);
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CLSubmersionStateMachine stateFromDepth:forceSubmersion:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf) {
        free(v33);
      }
    }
    return objc_msgSend_state(a3, v16, v17);
  }
}

- (double)deepThreshold
{
  return self->_deepThreshold;
}

- (double)nearDepthLimitThreshold
{
  return self->_nearDepthLimitThreshold;
}

- (double)pastMaxDepthThreshold
{
  return self->_pastMaxDepthThreshold;
}

- (double)sensorErrorThreshold
{
  return self->_sensorErrorThreshold;
}

- (int64_t)type
{
  return self->_type;
}

@end