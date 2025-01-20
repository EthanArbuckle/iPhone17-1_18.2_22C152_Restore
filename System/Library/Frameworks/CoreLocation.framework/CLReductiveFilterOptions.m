@interface CLReductiveFilterOptions
- (CLReductiveFilterOptions)init;
- (CLReductiveFilterOptions)initWithBeaconType:(unint64_t)a3;
- (CLReductiveFilterOptions)initWithBeaconType:(unint64_t)a3 transmitPower:(double)a4;
- (double)applyRangeEstimation;
- (double)biasRateInMeasurement;
- (double)transmitPower;
- (unint64_t)beaconType;
- (void)setApplyRangeEstimation:(double)a3;
- (void)setBiasRateInMeasurement:(double)a3;
@end

@implementation CLReductiveFilterOptions

- (CLReductiveFilterOptions)init
{
  return (CLReductiveFilterOptions *)MEMORY[0x1F4181798](self, sel_initWithBeaconType_);
}

- (CLReductiveFilterOptions)initWithBeaconType:(unint64_t)a3
{
  return (CLReductiveFilterOptions *)MEMORY[0x1F4181798](self, sel_initWithBeaconType_transmitPower_);
}

- (CLReductiveFilterOptions)initWithBeaconType:(unint64_t)a3 transmitPower:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CLReductiveFilterOptions;
  v6 = [(CLReductiveFilterOptions *)&v13 init];
  v7 = (CLReductiveFilterOptions *)v6;
  if (v6)
  {
    *((void *)v6 + 1) = a3;
    *(_OWORD *)(v6 + 24) = xmmword_190885A80;
    if (a4 < 4.0 || a4 > 20.0)
    {
      if (qword_1E929F670 != -1) {
        dispatch_once(&qword_1E929F670, &unk_1EE005DA0);
      }
      v9 = qword_1E929F678;
      if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289794;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        __int16 v18 = 2050;
        double v19 = a4;
        __int16 v20 = 2050;
        uint64_t v21 = 0x4010000000000000;
        __int16 v22 = 2050;
        uint64_t v23 = 0x4034000000000000;
        _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"transmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\", \"min.TransmitPower_dBm\":\"%{public}.6f\", \"max.TransmitPower_dBm\":\"%{public}.6f\"}", buf, 0x30u);
        if (qword_1E929F670 != -1) {
          dispatch_once(&qword_1E929F670, &unk_1EE005DA0);
        }
      }
      v10 = qword_1E929F678;
      if (os_signpost_enabled((os_log_t)qword_1E929F678))
      {
        *(_DWORD *)buf = 68289794;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        __int16 v18 = 2050;
        double v19 = a4;
        __int16 v20 = 2050;
        uint64_t v21 = 0x4010000000000000;
        __int16 v22 = 2050;
        uint64_t v23 = 0x4034000000000000;
        _os_signpost_emit_with_name_impl(&dword_1906B8000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "transmitPower: invalid range of transmit power", "{\"msg%{public}.0s\":\"transmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\", \"min.TransmitPower_dBm\":\"%{public}.6f\", \"max.TransmitPower_dBm\":\"%{public}.6f\"}", buf, 0x30u);
      }
      double v11 = 4.0;
      if (a4 >= 4.0) {
        double v11 = a4;
      }
      a4 = fmin(v11, 20.0);
    }
    v7->_transmitPower = a4;
  }
  return v7;
}

- (unint64_t)beaconType
{
  return self->_beaconType;
}

- (double)transmitPower
{
  return self->_transmitPower;
}

- (double)biasRateInMeasurement
{
  return self->_biasRateInMeasurement;
}

- (void)setBiasRateInMeasurement:(double)a3
{
  self->_biasRateInMeasurement = a3;
}

- (double)applyRangeEstimation
{
  return self->_applyRangeEstimation;
}

- (void)setApplyRangeEstimation:(double)a3
{
  self->_applyRangeEstimation = a3;
}

@end