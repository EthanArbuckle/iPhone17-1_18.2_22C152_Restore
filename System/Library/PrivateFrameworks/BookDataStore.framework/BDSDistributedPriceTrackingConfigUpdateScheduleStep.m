@interface BDSDistributedPriceTrackingConfigUpdateScheduleStep
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithCoder:(id)a3;
- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithDuration:(int64_t)a3 minUpdateInterval:(int64_t)a4 schedulerConfigIdealInterval:(int64_t)a5 schedulerConfigMinInterval:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStep:(id)a3;
- (int64_t)duration;
- (int64_t)minUpdateInterval;
- (int64_t)schedulerConfigIdealInterval;
- (int64_t)schedulerConfigMinInterval;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfigUpdateScheduleStep

- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithDuration:(int64_t)a3 minUpdateInterval:(int64_t)a4 schedulerConfigIdealInterval:(int64_t)a5 schedulerConfigMinInterval:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)BDSDistributedPriceTrackingConfigUpdateScheduleStep;
  result = [(BDSDistributedPriceTrackingConfigUpdateScheduleStep *)&v11 init];
  if (result)
  {
    result->_duration = a3;
    result->_minUpdateInterval = a4;
    result->_schedulerConfigIdealInterval = a5;
    result->_schedulerConfigMinInterval = a6;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v9 = objc_msgSend_duration(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_minUpdateInterval(self, v10, v11, v12, v13, v14, v15, v16) ^ v9;
  uint64_t v25 = objc_msgSend_schedulerConfigIdealInterval(self, v18, v19, v20, v21, v22, v23, v24);
  return v17 ^ v25 ^ objc_msgSend_schedulerConfigIdealInterval(self, v26, v27, v28, v29, v30, v31, v32);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = BUDynamicCast();

  LOBYTE(self) = objc_msgSend_isEqualToStep_(self, v6, (uint64_t)v5, v7, v8, v9, v10, v11);
  return (char)self;
}

- (BOOL)isEqualToStep:(id)a3
{
  id v4 = a3;
  uint64_t v12 = v4;
  if (v4
    && (uint64_t v13 = objc_msgSend_duration(v4, v5, v6, v7, v8, v9, v10, v11),
        v13 == objc_msgSend_duration(self, v14, v15, v16, v17, v18, v19, v20))
    && (uint64_t updated = objc_msgSend_minUpdateInterval(v12, v21, v22, v23, v24, v25, v26, v27),
        updated == objc_msgSend_minUpdateInterval(self, v29, v30, v31, v32, v33, v34, v35))
    && (uint64_t v43 = objc_msgSend_schedulerConfigIdealInterval(v12, v36, v37, v38, v39, v40, v41, v42),
        v43 == objc_msgSend_schedulerConfigIdealInterval(self, v44, v45, v46, v47, v48, v49, v50)))
  {
    uint64_t v58 = objc_msgSend_schedulerConfigMinInterval(v12, v51, v52, v53, v54, v55, v56, v57);
    BOOL v66 = v58 == objc_msgSend_schedulerConfigMinInterval(self, v59, v60, v61, v62, v63, v64, v65);
  }
  else
  {
    BOOL v66 = 0;
  }

  return v66;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v56 = a3;
  uint64_t v11 = objc_msgSend_duration(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeInteger_forKey_(v56, v12, v11, @"duration", v13, v14, v15, v16);
  uint64_t updated = objc_msgSend_minUpdateInterval(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeInteger_forKey_(v56, v25, updated, @"minUpdateInterval", v26, v27, v28, v29);
  uint64_t v37 = objc_msgSend_schedulerConfigIdealInterval(self, v30, v31, v32, v33, v34, v35, v36);
  objc_msgSend_encodeInteger_forKey_(v56, v38, v37, @"schedulerConfigIdealInterval", v39, v40, v41, v42);
  uint64_t v50 = objc_msgSend_schedulerConfigMinInterval(self, v43, v44, v45, v46, v47, v48, v49);
  objc_msgSend_encodeInteger_forKey_(v56, v51, v50, @"schedulerConfigMinInterval", v52, v53, v54, v55);
}

- (BDSDistributedPriceTrackingConfigUpdateScheduleStep)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_decodeIntegerForKey_(v4, v5, @"duration", v6, v7, v8, v9, v10);
  uint64_t v18 = objc_msgSend_decodeIntegerForKey_(v4, v12, @"minUpdateInterval", v13, v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_decodeIntegerForKey_(v4, v19, @"schedulerConfigIdealInterval", v20, v21, v22, v23, v24);
  uint64_t v32 = objc_msgSend_decodeIntegerForKey_(v4, v26, @"schedulerConfigMinInterval", v27, v28, v29, v30, v31);

  return (BDSDistributedPriceTrackingConfigUpdateScheduleStep *)MEMORY[0x270F9A6D0](self, sel_initWithDuration_minUpdateInterval_schedulerConfigIdealInterval_schedulerConfigMinInterval_, v11, v18, v25, v32, v33, v34);
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)minUpdateInterval
{
  return self->_minUpdateInterval;
}

- (int64_t)schedulerConfigIdealInterval
{
  return self->_schedulerConfigIdealInterval;
}

- (int64_t)schedulerConfigMinInterval
{
  return self->_schedulerConfigMinInterval;
}

@end