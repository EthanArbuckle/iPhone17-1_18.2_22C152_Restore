@interface CMMotionActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)automotive;
- (BOOL)cycling;
- (BOOL)isMounted;
- (BOOL)isRunWalk;
- (BOOL)isSameStateAs:(id)a3;
- (BOOL)isVehicleBTHint;
- (BOOL)isVehicleBasebandHint;
- (BOOL)isVehicleConnected;
- (BOOL)isVehicleGpsHint;
- (BOOL)isVehicleMotionHint;
- (BOOL)isVehicleWifiHint;
- (BOOL)running;
- (BOOL)stationary;
- (BOOL)unknown;
- (BOOL)walking;
- (CLMotionActivity)motionActivity;
- (CMMotionActivity)initWithCoder:(id)a3;
- (CMMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3;
- (CMMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3 endDate:(double)a4;
- (CMMotionActivityConfidence)confidence;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)mountedProbability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)vehicleType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setIsRunWalk:(BOOL)a3;
@end

@implementation CMMotionActivity

- (CMMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3
{
  double timestamp = a3->timestamp;
  v24.receiver = self;
  v24.super_class = (Class)CMMotionActivity;
  v14 = -[CMLogItem initWithTimestamp:](&v24, sel_initWithTimestamp_, timestamp, a10);
  v16 = v14;
  if (v14)
  {
    v14->fEndTime = 1.79769313e308;
    long long v18 = *(_OWORD *)&a3[1].mountedConfidence;
    long long v17 = *(_OWORD *)&a3[1].isStanding;
    long long v19 = *(_OWORD *)&a3[1].type;
    *(void *)&v14->_anon_60[48] = *(void *)&a3[1].isVehicleConnected;
    *(_OWORD *)&v14->_anon_60[16] = v18;
    *(_OWORD *)&v14->_anon_60[32] = v17;
    *(_OWORD *)v14->_anon_60 = v19;
    long long v21 = *(_OWORD *)&a3->mountedConfidence;
    long long v20 = *(_OWORD *)&a3->isStanding;
    long long v22 = *(_OWORD *)&a3->vehicleType;
    *(_OWORD *)&v14->fState.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&v14->fState.vehicleType = v22;
    *(_OWORD *)&v14->fState.mountedConfidence = v21;
    *(_OWORD *)&v14->fState.isStanding = v20;
    *(_OWORD *)&v14->fState.type = *(_OWORD *)&a3->type;
    objc_msgSend_setIsRunWalk_(v14, v15, 0);
  }
  return v16;
}

- (CMMotionActivity)initWithMotionActivity:(CLMotionActivity *)a3 endDate:(double)a4
{
  v12 = *(void **)&a5;
  double v14 = *(double *)&a3[1].type;
  v27.receiver = self;
  v27.super_class = (Class)CMMotionActivity;
  long long v17 = -[CMLogItem initWithTimestamp:](&v27, sel_initWithTimestamp_, v14, a10);
  if (v17)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(v12, v15, v16);
    v17->fEndTime = v18;
    *(_OWORD *)&v17->fState.type = *(_OWORD *)&a3->type;
    long long v19 = *(_OWORD *)&a3->vehicleType;
    long long v21 = *(_OWORD *)&a3->mountedConfidence;
    long long v20 = *(_OWORD *)&a3->isStanding;
    *(_OWORD *)&v17->fState.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&v17->fState.vehicleType = v19;
    *(_OWORD *)&v17->fState.mountedConfidence = v21;
    *(_OWORD *)&v17->fState.isStanding = v20;
    long long v23 = *(_OWORD *)&a3[1].mountedConfidence;
    long long v22 = *(_OWORD *)&a3[1].isStanding;
    long long v24 = *(_OWORD *)&a3[1].type;
    *(void *)&v17->_anon_60[48] = *(void *)&a3[1].isVehicleConnected;
    *(_OWORD *)&v17->_anon_60[16] = v23;
    *(_OWORD *)&v17->_anon_60[32] = v22;
    *(_OWORD *)v17->_anon_60 = v24;
    objc_msgSend_setIsRunWalk_(v17, v25, 0);
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionActivity)initWithCoder:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CMMotionActivity;
  v4 = -[CMLogItem initWithCoder:](&v31, sel_initWithCoder_);
  v6 = v4;
  if (v4)
  {
    *((void *)v4 + 2) = 0;
    *((void *)v4 + 13) = 0;
    *((_DWORD *)v4 + 13) = 0;
    *(void *)(v4 + 36) = 0;
    *(void *)(v4 + 28) = 0;
    *((_DWORD *)v4 + 11) = 0;
    *((void *)v4 + 7) = 0xBFF0000000000000;
    *((_DWORD *)v4 + 17) = 0;
    *((void *)v4 + 9) = 0xBFF0000000000000;
    *((void *)v4 + 12) = 0xBFF0000000000000;
    v4[48] = 0;
    v4[64] = 0;
    v4[112] = 0;
    *(void *)(v4 + 116) = 0;
    *((_DWORD *)v4 + 6) = 0;
    *((_DWORD *)v4 + 20) = 0;
    *((void *)v4 + 16) = 0;
    *((void *)v4 + 17) = 0;
    *((_DWORD *)v4 + 36) = 0;
    *((_DWORD *)v4 + 4) = objc_msgSend_decodeIntegerForKey_(a3, v5, @"kCMMotionActivityCodingKeyType");
    *((_DWORD *)v6 + 5) = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMMotionActivityCodingKeyConfidence");
    objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCMMotionActivityCodingKeyStartTime");
    *((void *)v6 + 12) = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, @"kCMMotionActivityCodingKeyVehicleConnected");
    v6[64] = v11 != 0.0;
    if (objc_msgSend_decodeBoolForKey_(a3, v12, @"kCMMotionActivityCodingKeyVehicularGpsHint"))char v14 = 2; {
    else
    }
      char v14 = 0;
    v6[112] = v6[112] & 0xFD | v14;
    if (objc_msgSend_decodeBoolForKey_(a3, v13, @"kCMMotionActivityCodingKeyVehicularBasebandHint"))char v16 = 4; {
    else
    }
      char v16 = 0;
    v6[112] = v6[112] & 0xFB | v16;
    if (objc_msgSend_decodeBoolForKey_(a3, v15, @"kCMMotionActivityCodingKeyVehicularWifiHint"))char v18 = 8; {
    else
    }
      char v18 = 0;
    v6[112] = v6[112] & 0xF7 | v18;
    v6[112] = v6[112] & 0xFE | objc_msgSend_decodeBoolForKey_(a3, v17, @"kCMMotionActivityCodingKeyVehicularMotionHint");
    if (objc_msgSend_decodeBoolForKey_(a3, v19, @"kCMMotionActivityCodingKeyVehicularBTHint"))char v21 = 16; {
    else
    }
      char v21 = 0;
    v6[112] = v6[112] & 0xEF | v21;
    objc_msgSend_decodeDoubleForKey_(a3, v20, @"kCMMotionActivityCodingKeyTimestamp");
    *((void *)v6 + 7) = v22;
    *((_DWORD *)v6 + 9) = objc_msgSend_decodeIntegerForKey_(a3, v23, @"kCMMotionActivityCodingKeyMounted");
    objc_msgSend_decodeDoubleForKey_(a3, v24, @"kCMMotionActivityCodingKeyMountedProbability");
    *((void *)v6 + 5) = v25;
    *((_DWORD *)v6 + 20) = objc_msgSend_decodeIntegerForKey_(a3, v26, @"kCMMotionActivityCodingKeyVehicleType");
    objc_msgSend_decodeDoubleForKey_(a3, v27, @"kCMMotionActivityCodingKeyEndTime");
    *((void *)v6 + 19) = v28;
    objc_msgSend_setIsRunWalk_(v6, v29, 0);
  }
  return (CMMotionActivity *)v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMMotionActivity;
  [(CMLogItem *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMMotionActivity;
  id result = [(CMLogItem *)&v11 copyWithZone:a3];
  if (result)
  {
    *((_OWORD *)result + 1) = *(_OWORD *)&self->fState.type;
    long long v5 = *(_OWORD *)&self->fState.vehicleType;
    long long v7 = *(_OWORD *)&self->fState.mountedConfidence;
    long long v6 = *(_OWORD *)&self->fState.isStanding;
    *((_OWORD *)result + 4) = *(_OWORD *)&self->fState.isVehicleConnected;
    *((_OWORD *)result + 5) = v5;
    *((_OWORD *)result + 2) = v7;
    *((_OWORD *)result + 3) = v6;
    long long v9 = *(_OWORD *)&self->_anon_60[16];
    long long v8 = *(_OWORD *)&self->_anon_60[32];
    long long v10 = *(_OWORD *)self->_anon_60;
    *((void *)result + 18) = *(void *)&self->_anon_60[48];
    *((_OWORD *)result + 7) = v9;
    *((_OWORD *)result + 8) = v8;
    *((_OWORD *)result + 6) = v10;
    *((void *)result + 19) = *(void *)&self->fEndTime;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CMMotionActivity;
  -[CMLogItem encodeWithCoder:](&v20, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fState.type, @"kCMMotionActivityCodingKeyType");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fState.confidence, @"kCMMotionActivityCodingKeyConfidence");
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMMotionActivityCodingKeyStartTime", *(double *)self->_anon_60);
  double v9 = 0.0;
  if (self->fState.isVehicleConnected) {
    double v9 = 1.0;
  }
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMMotionActivityCodingKeyVehicleConnected", v9);
  objc_msgSend_encodeBool_forKey_(a3, v10, (self->_anon_60[16] >> 1) & 1, @"kCMMotionActivityCodingKeyVehicularGpsHint");
  objc_msgSend_encodeBool_forKey_(a3, v11, (self->_anon_60[16] >> 2) & 1, @"kCMMotionActivityCodingKeyVehicularBasebandHint");
  objc_msgSend_encodeBool_forKey_(a3, v12, (self->_anon_60[16] >> 3) & 1, @"kCMMotionActivityCodingKeyVehicularWifiHint");
  objc_msgSend_encodeBool_forKey_(a3, v13, self->_anon_60[16] & 1, @"kCMMotionActivityCodingKeyVehicularMotionHint");
  objc_msgSend_encodeBool_forKey_(a3, v14, (self->_anon_60[16] >> 4) & 1, @"kCMMotionActivityCodingKeyVehicularBTHint");
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMMotionActivityCodingKeyTimestamp", self->fState.timestamp);
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->fState.conservativeMountedState, @"kCMMotionActivityCodingKeyMounted");
  objc_msgSend_encodeDouble_forKey_(a3, v17, @"kCMMotionActivityCodingKeyMountedProbability", self->fState.conservativeMountedProbability);
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->fState.vehicleType, @"kCMMotionActivityCodingKeyVehicleType");
  objc_msgSend_encodeDouble_forKey_(a3, v19, @"kCMMotionActivityCodingKeyEndTime", self->fEndTime);
}

- (CMMotionActivityConfidence)confidence
{
  return (unint64_t)self->fState.confidence;
}

- (BOOL)isVehicleConnected
{
  return self->fState.isVehicleConnected;
}

- (BOOL)isVehicleWifiHint
{
  return (self->_anon_60[16] >> 3) & 1;
}

- (BOOL)isVehicleGpsHint
{
  return (self->_anon_60[16] >> 1) & 1;
}

- (BOOL)isVehicleBasebandHint
{
  return (self->_anon_60[16] >> 2) & 1;
}

- (BOOL)isVehicleMotionHint
{
  return self->_anon_60[16] & 1;
}

- (BOOL)isVehicleBTHint
{
  return (self->_anon_60[16] >> 4) & 1;
}

- (BOOL)isMounted
{
  return self->fState.conservativeMountedState != 0;
}

- (double)mountedProbability
{
  return self->fState.conservativeMountedProbability;
}

- (int64_t)vehicleType
{
  return self->fState.vehicleType;
}

- (NSDate)startDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, *(double *)self->_anon_60);
}

- (BOOL)unknown
{
  return self->fState.type == 0;
}

- (BOOL)stationary
{
  return (self->fState.type < 0xCu) & (0xC06u >> self->fState.type);
}

- (BOOL)walking
{
  int type = self->fState.type;
  BOOL v3 = 1;
  if (type != 4 && type != 41)
  {
    if (type == 8) {
      return ((uint64_t (*)(CMMotionActivity *, char *))MEMORY[0x1F4181798])(self, sel_isRunWalk);
    }
    return 0;
  }
  return v3;
}

- (BOOL)running
{
  return self->fState.type == 8;
}

- (BOOL)automotive
{
  int type = self->fState.type;
  BOOL v3 = 1;
  if (type > 51)
  {
    if (type == 52 || type == 56) {
      return (type & 0xFFFFFFFE) == 0xA || v3;
    }
    goto LABEL_7;
  }
  if (!type) {
    return 0;
  }
  if (type != 5) {
LABEL_7:
  }
    BOOL v3 = 0;
  return (type & 0xFFFFFFFE) == 0xA || v3;
}

- (BOOL)cycling
{
  return self->fState.type == 6;
}

- (id)description
{
  BOOL v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  objc_msgSend_timestamp(self, v6, v7);
  uint64_t v9 = v8;
  uint64_t started = objc_msgSend_startDate(self, v10, v11);
  uint64_t v15 = objc_msgSend_confidence(self, v13, v14);
  unsigned int v18 = objc_msgSend_unknown(self, v16, v17);
  unsigned int v21 = objc_msgSend_stationary(self, v19, v20);
  unsigned int v24 = objc_msgSend_walking(self, v22, v23);
  unsigned int v27 = objc_msgSend_running(self, v25, v26);
  unsigned int v30 = objc_msgSend_cycling(self, v28, v29);
  unsigned int v33 = objc_msgSend_automotive(self, v31, v32);
  return (id)objc_msgSend_stringWithFormat_(v3, v34, @"%@ @ %f,<startDate,%@,confidence,%ld,unknown,%d,stationary,%d,walking,%d,running,%d,cycling,%d,automotive,%d>", v5, v9, started, v15, v18, v21, v24, v27, v30, v33);
}

- (id)descriptionInternal
{
  v65 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v3);
  objc_msgSend_timestamp(self, v4, v5);
  uint64_t v7 = v6;
  uint64_t started = objc_msgSend_startDate(self, v8, v9);
  uint64_t v62 = objc_msgSend_endDate(self, v10, v11);
  uint64_t v61 = objc_msgSend_confidence(self, v12, v13);
  unsigned int v60 = objc_msgSend_unknown(self, v14, v15);
  unsigned int v59 = objc_msgSend_stationary(self, v16, v17);
  unsigned int v58 = objc_msgSend_walking(self, v18, v19);
  unsigned int v57 = objc_msgSend_running(self, v20, v21);
  unsigned int v56 = objc_msgSend_cycling(self, v22, v23);
  unsigned int v26 = objc_msgSend_automotive(self, v24, v25);
  uint64_t v29 = objc_msgSend_vehicleType(self, v27, v28);
  unsigned int isVehicleConnected = objc_msgSend_isVehicleConnected(self, v30, v31);
  unsigned int isVehicleMotionHint = objc_msgSend_isVehicleMotionHint(self, v33, v34);
  unsigned int isVehicleGpsHint = objc_msgSend_isVehicleGpsHint(self, v36, v37);
  unsigned int isVehicleBTHint = objc_msgSend_isVehicleBTHint(self, v39, v40);
  unsigned int isVehicleWifiHint = objc_msgSend_isVehicleWifiHint(self, v42, v43);
  unsigned int isVehicleBasebandHint = objc_msgSend_isVehicleBasebandHint(self, v45, v46);
  unsigned int isMounted = objc_msgSend_isMounted(self, v48, v49);
  objc_msgSend_mountedProbability(self, v51, v52);
  return (id)objc_msgSend_stringWithFormat_(v65, v53, @"%@ @ %f,<startDate,%@,endDate,%@,confidence,%ld,unknown,%d,stationary,%d,walking,%d,running,%d,cycling,%d,automotive,%d,vehicleType,%ld,vehicleConnected,%d,motionHint,%d,gpsHint,%d,btHint,%d,wifiHint,%d,bbHint,%d,mounted,%d,mountedProb,%lf>", v64, v7, started, v62, v61, v60, v59, v58, v57, v56, v26, v29, isVehicleConnected, isVehicleMotionHint, isVehicleGpsHint, isVehicleBTHint,
               isVehicleWifiHint,
               isVehicleBasebandHint,
               isMounted,
               v54);
}

- (CLMotionActivity)motionActivity
{
  return &self->fState;
}

- (NSDate)endDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->fEndTime);
}

- (BOOL)isSameStateAs:(id)a3
{
  if (objc_msgSend_unknown(self, a2, (uint64_t)a3) && (objc_msgSend_unknown(a3, v5, v6) & 1) != 0
    || ((objc_msgSend_walking(self, v5, v6) & 1) != 0 || objc_msgSend_running(self, v7, v8))
    && ((objc_msgSend_walking(a3, v7, v8) & 1) != 0 || (objc_msgSend_running(a3, v9, v10) & 1) != 0)
    || objc_msgSend_cycling(self, v7, v8) && (objc_msgSend_cycling(a3, v11, v12) & 1) != 0
    || (objc_msgSend_stationary(self, v11, v12) & 1) == 0
    && objc_msgSend_automotive(self, v14, v15)
    && (objc_msgSend_stationary(a3, v14, v15) & 1) == 0
    && (objc_msgSend_automotive(a3, v14, v15) & 1) != 0
    || (objc_msgSend_stationary(self, v14, v15) & 1) == 0
    && objc_msgSend_automotive(self, v16, v17)
    && objc_msgSend_stationary(a3, v16, v17)
    && (objc_msgSend_automotive(a3, v16, v17) & 1) != 0
    || objc_msgSend_stationary(self, v16, v17)
    && objc_msgSend_automotive(self, v18, v19)
    && (objc_msgSend_stationary(a3, v18, v19) & 1) == 0
    && (objc_msgSend_automotive(a3, v18, v19) & 1) != 0
    || objc_msgSend_stationary(self, v18, v19)
    && objc_msgSend_automotive(self, v20, v21)
    && objc_msgSend_stationary(a3, v20, v21)
    && (objc_msgSend_automotive(a3, v20, v21) & 1) != 0)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    int v13 = objc_msgSend_stationary(self, v20, v21);
    if (v13)
    {
      LOBYTE(v13) = objc_msgSend_stationary(a3, v22, v23);
    }
  }
  return v13;
}

- (void)setEndTime:(double)a3
{
  self->fEndTime = a3;
}

- (BOOL)isRunWalk
{
  return self->_isRunWalk;
}

- (void)setIsRunWalk:(BOOL)a3
{
  self->_isRunWalk = a3;
}

@end