@interface CMActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)hasExitedVehicle;
- (BOOL)isDriving;
- (BOOL)isMoving;
- (BOOL)isRunning;
- (BOOL)isWalking;
- (BOOL)maybeExitingVehicle;
- (CLMotionActivity)activity;
- (CMActivity)initWithCoder:(id)a3;
- (CMActivity)initWithMotionActivity:(CLMotionActivity *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)confidence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMActivity

- (CMActivity)initWithMotionActivity:(CLMotionActivity *)a3
{
  double timestamp = a3->timestamp;
  v21.receiver = self;
  v21.super_class = (Class)CMActivity;
  result = -[CMLogItem initWithTimestamp:](&v21, sel_initWithTimestamp_, timestamp, a10);
  if (result)
  {
    *(_OWORD *)&result->fActivity.type = *(_OWORD *)&a3->type;
    long long v15 = *(_OWORD *)&a3->vehicleType;
    long long v17 = *(_OWORD *)&a3->mountedConfidence;
    long long v16 = *(_OWORD *)&a3->isStanding;
    *(_OWORD *)&result->fActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
    *(_OWORD *)&result->fActivity.vehicleType = v15;
    *(_OWORD *)&result->fActivity.mountedConfidence = v17;
    *(_OWORD *)&result->fActivity.isStanding = v16;
    long long v19 = *(_OWORD *)&a3[1].mountedConfidence;
    long long v18 = *(_OWORD *)&a3[1].isStanding;
    CMLogItem v20 = *(CMLogItem *)&a3[1].type;
    *(void *)&result[1].fActivity.isStanding = *(void *)&a3[1].isVehicleConnected;
    *(_OWORD *)&result[1].fActivity.type = v19;
    *(_OWORD *)&result[1].fActivity.mountedConfidence = v18;
    result[1].super = v20;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMActivity)initWithCoder:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CMActivity;
  v5 = -[CMLogItem initWithCoder:](&v29, sel_initWithCoder_);
  if (v5)
  {
    int v6 = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMActivityCodingKeyType");
    int v8 = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMActivityCodingKeyConfidence");
    int v10 = objc_msgSend_decodeIntegerForKey_(a3, v9, @"kCMActivityCodingKeyMounted");
    int v12 = objc_msgSend_decodeIntegerForKey_(a3, v11, @"kCMActivityCodingKeyMountedConfidence");
    char v14 = objc_msgSend_decodeBoolForKey_(a3, v13, @"kCMActivityCodingKeyIsStanding");
    objc_msgSend_decodeFloatForKey_(a3, v15, @"kCMActivityCodingKeyTiltAngle");
    int v17 = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMActivityCodingKeyTimestamp");
    uint64_t v20 = v19;
    int v22 = objc_msgSend_decodeIntegerForKey_(a3, v21, @"kCMActivityCodingKeyVehicleExitState");
    objc_msgSend_decodeDoubleForKey_(a3, v23, @"kCMActivityCodingKeyEstExitTime");
    uint64_t v25 = v24;
    objc_msgSend_decodeDoubleForKey_(a3, v26, @"kCMActivityCodingKeyStartTime");
    *((_DWORD *)v5 + 4) = v6;
    *((_DWORD *)v5 + 5) = v8;
    *((_DWORD *)v5 + 6) = 0;
    *((_DWORD *)v5 + 7) = v10;
    *((_DWORD *)v5 + 8) = v12;
    *((_DWORD *)v5 + 9) = 0;
    *((void *)v5 + 5) = 0;
    v5[48] = v14;
    *((_DWORD *)v5 + 13) = v17;
    *((void *)v5 + 7) = v20;
    v5[64] = 0;
    *((_DWORD *)v5 + 17) = v22;
    *((void *)v5 + 9) = v25;
    *((_DWORD *)v5 + 22) = 0;
    *((_DWORD *)v5 + 20) = 0;
    *(_DWORD *)(v5 + 83) = 0;
    *((void *)v5 + 12) = v27;
    *((void *)v5 + 13) = 0;
    v5[112] = 0;
    *((_DWORD *)v5 + 29) = 0;
    *((_DWORD *)v5 + 30) = 0;
    *((_DWORD *)v5 + 36) = 0;
    *((void *)v5 + 16) = 0;
    *((void *)v5 + 17) = 0;
  }
  return (CMActivity *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = self;
  v16.receiver = self;
  v16.super_class = (Class)CMActivity;
  -[CMLogItem encodeWithCoder:](&v16, sel_encodeWithCoder_);
  v4 = (CMActivity *)((char *)v4 + 16);
  objc_msgSend_encodeInteger_forKey_(a3, v5, LODWORD(v4->super.super.isa), @"kCMActivityCodingKeyType");
  objc_msgSend_encodeInteger_forKey_(a3, v6, HIDWORD(v4->super.super.isa), @"kCMActivityCodingKeyConfidence");
  objc_msgSend_encodeInteger_forKey_(a3, v7, HIDWORD(v4->super._internalLogItem), @"kCMActivityCodingKeyMounted");
  objc_msgSend_encodeInteger_forKey_(a3, v8, v4->fActivity.type, @"kCMActivityCodingKeyMountedConfidence");
  objc_msgSend_encodeBool_forKey_(a3, v9, LOBYTE(v4->fActivity.mountedConfidence), @"kCMActivityCodingKeyIsStanding");
  LODWORD(v10) = v4->fActivity.conservativeMountedState;
  objc_msgSend_encodeFloat_forKey_(a3, v11, @"kCMActivityCodingKeyTiltAngle", v10);
  objc_msgSend_encodeDouble_forKey_(a3, v12, @"kCMActivityCodingKeyTimestamp", v4->fActivity.conservativeMountedProbability);
  objc_msgSend_encodeInteger_forKey_(a3, v13, LODWORD(v4->fActivity.tilt), @"kCMActivityCodingKeyVehicleExitState");
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"kCMActivityCodingKeyEstExitTime", v4->fActivity.timestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMActivityCodingKeyStartTime", *(double *)&v4->fActivity.vehicleType);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMActivity;
  id result = [(CMLogItem *)&v11 copyWithZone:a3];
  if (result)
  {
    *((_OWORD *)result + 1) = *(_OWORD *)&self->fActivity.type;
    long long v5 = *(_OWORD *)&self->fActivity.vehicleType;
    long long v7 = *(_OWORD *)&self->fActivity.mountedConfidence;
    long long v6 = *(_OWORD *)&self->fActivity.isStanding;
    *((_OWORD *)result + 4) = *(_OWORD *)&self->fActivity.isVehicleConnected;
    *((_OWORD *)result + 5) = v5;
    *((_OWORD *)result + 2) = v7;
    *((_OWORD *)result + 3) = v6;
    long long v9 = *(_OWORD *)&self[1].fActivity.type;
    long long v8 = *(_OWORD *)&self[1].fActivity.mountedConfidence;
    CMLogItem super = self[1].super;
    *((void *)result + 18) = *(void *)&self[1].fActivity.isStanding;
    *((_OWORD *)result + 7) = v9;
    *((_OWORD *)result + 8) = v8;
    *((CMLogItem *)result + 6) = super;
  }
  return result;
}

- (id)description
{
  if (self) {
    objc_msgSend_activity(self, a2, v2);
  }
  v4 = NSString;
  long long v5 = (objc_class *)objc_opt_class();
  long long v6 = NSStringFromClass(v5);
  objc_msgSend_timestamp(self, v7, v8);
  uint64_t v10 = v9;
  uint64_t v13 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v11, v12, 0.0);
  char v14 = CLMotionActivity::activityTypeToString(0);
  return (id)objc_msgSend_stringWithFormat_(v4, v15, @"%@ @ %f,<startDate,%@,type,%s,confidence,%s,mountedState,%d,mountedConfidence,%s,isStanding,%d,tiltAngle,%f,exitState,%d,estExitTime,%f>", v6, v10, v13, v14, "low", 0, "low", 0, 0.0, 0, 0);
}

- (CLMotionActivity)activity
{
  long long v10 = *(_OWORD *)&self[1].isVehicleConnected;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[1].isStanding;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(void *)&retstr[1].isVehicleConnected = *(void *)&self[1].vehicleType;
  long long v11 = *(_OWORD *)&self->vehicleType;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self->isVehicleConnected;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  long long v12 = *(_OWORD *)&self[1].mountedConfidence;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].type;
  *(_OWORD *)&retstr[1].type = v12;
  long long v13 = *(_OWORD *)&self->isStanding;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->mountedConfidence;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (int)confidence
{
  return self->fActivity.confidence;
}

- (BOOL)isMoving
{
  return (self->fActivity.type > 0xBu) | (0x3F8u >> self->fActivity.type) & 1;
}

- (BOOL)isWalking
{
  int type = self->fActivity.type;
  return type == 4 || type == 41;
}

- (BOOL)isRunning
{
  return self->fActivity.type == 8;
}

- (BOOL)isDriving
{
  int type = self->fActivity.type;
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

- (BOOL)maybeExitingVehicle
{
  return self->fActivity.exitState == 1;
}

- (BOOL)hasExitedVehicle
{
  return self->fActivity.exitState == 2;
}

@end