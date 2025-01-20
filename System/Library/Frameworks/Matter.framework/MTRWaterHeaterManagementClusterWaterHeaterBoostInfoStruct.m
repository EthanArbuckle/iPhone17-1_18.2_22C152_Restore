@interface MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct
- (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct)init;
- (NSNumber)duration;
- (NSNumber)emergencyBoost;
- (NSNumber)oneShot;
- (NSNumber)targetPercentage;
- (NSNumber)targetReheat;
- (NSNumber)temporarySetpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDuration:(id)a3;
- (void)setEmergencyBoost:(id)a3;
- (void)setOneShot:(id)a3;
- (void)setTargetPercentage:(id)a3;
- (void)setTargetReheat:(id)a3;
- (void)setTemporarySetpoint:(id)a3;
@end

@implementation MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct

- (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct;
  v2 = [(MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    duration = v2->_duration;
    v2->_duration = (NSNumber *)&unk_26F9C8620;

    oneShot = v3->_oneShot;
    v3->_oneShot = 0;

    emergencyBoost = v3->_emergencyBoost;
    v3->_emergencyBoost = 0;

    temporarySetpoint = v3->_temporarySetpoint;
    v3->_temporarySetpoint = 0;

    targetPercentage = v3->_targetPercentage;
    v3->_targetPercentage = 0;

    targetReheat = v3->_targetReheat;
    v3->_targetReheat = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct);
  v7 = objc_msgSend_duration(self, v5, v6);
  objc_msgSend_setDuration_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_oneShot(self, v9, v10);
  objc_msgSend_setOneShot_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_emergencyBoost(self, v13, v14);
  objc_msgSend_setEmergencyBoost_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_temporarySetpoint(self, v17, v18);
  objc_msgSend_setTemporarySetpoint_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_targetPercentage(self, v21, v22);
  objc_msgSend_setTargetPercentage_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_targetReheat(self, v25, v26);
  objc_msgSend_setTargetReheat_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: duration:%@; oneShot:%@; emergencyBoost:%@; temporarySetpoint:%@; targetPercentage:%@; targetReheat:%@; >",
    v5,
    self->_duration,
    self->_oneShot,
    self->_emergencyBoost,
    self->_temporarySetpoint,
    self->_targetPercentage,
  v7 = self->_targetReheat);

  return v7;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)oneShot
{
  return self->_oneShot;
}

- (void)setOneShot:(id)a3
{
}

- (NSNumber)emergencyBoost
{
  return self->_emergencyBoost;
}

- (void)setEmergencyBoost:(id)a3
{
}

- (NSNumber)temporarySetpoint
{
  return self->_temporarySetpoint;
}

- (void)setTemporarySetpoint:(id)a3
{
}

- (NSNumber)targetPercentage
{
  return self->_targetPercentage;
}

- (void)setTargetPercentage:(id)a3
{
}

- (NSNumber)targetReheat
{
  return self->_targetReheat;
}

- (void)setTargetReheat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetReheat, 0);
  objc_storeStrong((id *)&self->_targetPercentage, 0);
  objc_storeStrong((id *)&self->_temporarySetpoint, 0);
  objc_storeStrong((id *)&self->_emergencyBoost, 0);
  objc_storeStrong((id *)&self->_oneShot, 0);

  objc_storeStrong((id *)&self->_duration, 0);
}

@end