@interface CLEmergencyLocationSelectorConfig
+ (id)featureString:(int64_t)a3;
- (BOOL)firstLocationEarlyReturnEnabled;
- (BOOL)firstUpdateEnabled;
- (BOOL)periodicUpdatesEnabled;
- (CLEmergencyLocationUsabilityCriteria)firstLocationUsabilityCriteria;
- (CLEmergencyLocationUsabilityCriteria)locationUpdateUsabilityCriteria;
- (double)firstLocationMaxEarlyReturnHunc;
- (double)firstLocationMaxEarlyReturnVunc;
- (double)firstLocationTimeout;
- (double)firstUpdateTimeout;
- (double)locationUpdateChangeInAltitudeToSendEarly;
- (double)locationUpdateDistanceMovedToSendEarly;
- (double)locationUpdateHuncReductionToSendEarly;
- (double)locationUpdateMinDelay;
- (double)locationUpdateTimeout;
- (double)locationUpdateVuncReductionToSendEarly;
- (id)initForFeature:(int64_t)a3 withUpdatesEnabled:(BOOL)a4;
- (int64_t)feature;
- (void)dealloc;
- (void)printConfiguration;
- (void)setDefaultsForSIP;
- (void)setFeature:(int64_t)a3;
- (void)setFirstLocationEarlyReturnEnabled:(BOOL)a3;
- (void)setFirstLocationMaxEarlyReturnHunc:(double)a3;
- (void)setFirstLocationMaxEarlyReturnVunc:(double)a3;
- (void)setFirstLocationTimeout:(double)a3;
- (void)setFirstLocationUsabilityCriteria:(id)a3;
- (void)setFirstUpdateEnabled:(BOOL)a3;
- (void)setFirstUpdateTimeout:(double)a3;
- (void)setLocationUpdateChangeInAltitudeToSendEarly:(double)a3;
- (void)setLocationUpdateDistanceMovedToSendEarly:(double)a3;
- (void)setLocationUpdateHuncReductionToSendEarly:(double)a3;
- (void)setLocationUpdateMinDelay:(double)a3;
- (void)setLocationUpdateTimeout:(double)a3;
- (void)setLocationUpdateUsabilityCriteria:(id)a3;
- (void)setLocationUpdateVuncReductionToSendEarly:(double)a3;
- (void)setPeriodicUpdatesEnabled:(BOOL)a3;
@end

@implementation CLEmergencyLocationSelectorConfig

- (id)initForFeature:(int64_t)a3 withUpdatesEnabled:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)CLEmergencyLocationSelectorConfig;
  v6 = [(CLEmergencyLocationSelectorConfig *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_firstUpdateEnabled = 0;
    v6->_feature = a3;
    v6->_firstUpdateTimeout = 25.0;
    v6->_periodicUpdatesEnabled = a4;
    v6->_firstLocationUsabilityCriteria = objc_alloc_init(CLEmergencyLocationUsabilityCriteria);
    v7->_locationUpdateUsabilityCriteria = objc_alloc_init(CLEmergencyLocationUsabilityCriteria);
    v7->_firstLocationEarlyReturnEnabled = 1;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)&v7->_firstLocationTimeout = _Q0;
    v7->_locationUpdateMinDelay = 1.0;
    *(_OWORD *)&v7->_firstLocationMaxEarlyReturnHunc = xmmword_190886520;
    *(_OWORD *)&v7->_locationUpdateHuncReductionToSendEarly = xmmword_190886530;
    *(_OWORD *)&v7->_locationUpdateDistanceMovedToSendEarly = xmmword_190886540;
    if (!v7->_feature) {
      [(CLEmergencyLocationSelectorConfig *)v7 setDefaultsForSIP];
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    v13 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorConfig,initForFeature:withUpdatesEnabled:,completed", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
      }
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelectorConfig initForFeature:withUpdatesEnabled:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v9 = self;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,CLEmergencyLocationSelectorConfig,self:%{private}@,dealloc,initiated", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    int v6 = 138477827;
    v7 = self;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelectorConfig dealloc]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)CLEmergencyLocationSelectorConfig;
  [(CLEmergencyLocationSelectorConfig *)&v5 dealloc];
}

- (void)setDefaultsForSIP
{
  self->_firstLocationTimeout = 6.0;
  [(CLEmergencyLocationUsabilityCriteria *)self->_firstLocationUsabilityCriteria setMaxUsableHunc:1000.0];
  self->_firstLocationMaxEarlyReturnVunc = 1.79769313e308;
  BOOL periodicUpdatesEnabled = self->_periodicUpdatesEnabled;
  self->_firstUpdateEnabled = periodicUpdatesEnabled;
  self->_firstUpdateTimeout = 25.0;
  if (periodicUpdatesEnabled)
  {
    *(_OWORD *)&self->_locationUpdateTimeout = xmmword_190886550;
    self->_firstLocationMaxEarlyReturnHunc = 165.0;
  }
  else
  {
    self->_firstLocationEarlyReturnEnabled = 0;
  }
}

+ (id)featureString:(int64_t)a3
{
  return @"SIP";
}

- (void)printConfiguration
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v3 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[CLEmergencyLocationSelectorConfig featureString:[(CLEmergencyLocationSelectorConfig *)self feature]];
    BOOL v5 = [(CLEmergencyLocationSelectorConfig *)self firstUpdateEnabled];
    BOOL v6 = [(CLEmergencyLocationSelectorConfig *)self periodicUpdatesEnabled];
    [(CLEmergencyLocationSelectorConfig *)self firstLocationMaxEarlyReturnHunc];
    uint64_t v8 = v7;
    [(CLEmergencyLocationSelectorConfig *)self firstLocationMaxEarlyReturnVunc];
    double v9 = -1.0;
    if (v10 != 1.79769313e308)
    {
      [(CLEmergencyLocationSelectorConfig *)self firstLocationMaxEarlyReturnVunc];
      double v9 = v11;
    }
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateHuncReductionToSendEarly];
    uint64_t v13 = v12;
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateDistanceMovedToSendEarly];
    uint64_t v15 = v14;
    BOOL v16 = [(CLEmergencyLocationSelectorConfig *)self firstLocationEarlyReturnEnabled];
    [(CLEmergencyLocationSelectorConfig *)self firstLocationTimeout];
    uint64_t v18 = v17;
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateTimeout];
    uint64_t v20 = v19;
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateMinDelay];
    *(_DWORD *)buf = 138545922;
    id v27 = v4;
    __int16 v28 = 1026;
    BOOL v29 = v5;
    __int16 v30 = 1026;
    BOOL v31 = v6;
    __int16 v32 = 2050;
    uint64_t v33 = v8;
    __int16 v34 = 2050;
    double v35 = v9;
    __int16 v36 = 2050;
    uint64_t v37 = v13;
    __int16 v38 = 2050;
    uint64_t v39 = v15;
    __int16 v40 = 1026;
    BOOL v41 = v16;
    __int16 v42 = 2050;
    uint64_t v43 = v18;
    __int16 v44 = 2050;
    uint64_t v45 = v20;
    __int16 v46 = 2050;
    uint64_t v47 = v21;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "#CLELS,%{public}@,printConfiguration,firstUpdateEnabled,%{public}d,periodicUpdatesEnabled,%{public}d,firstLocationMaxEarlyReturnHunc,%{public}f,firstLocationMaxEarlyReturnVunc,%{public}f,locationUpdateHuncReductionToSendEarly,%{public}f,locationUpdateDistanceMovedToSendEarly,%{public}f,firstLocationEarlyReturnEnabled,%{public}d,firstLocationTimeout,%{public}f,locationUpdateTimeout,%{public}f,locationUpdateMinDelay,%{public}f", buf, 0x64u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    +[CLEmergencyLocationSelectorConfig featureString:[(CLEmergencyLocationSelectorConfig *)self feature]];
    [(CLEmergencyLocationSelectorConfig *)self firstUpdateEnabled];
    [(CLEmergencyLocationSelectorConfig *)self periodicUpdatesEnabled];
    [(CLEmergencyLocationSelectorConfig *)self firstLocationMaxEarlyReturnHunc];
    [(CLEmergencyLocationSelectorConfig *)self firstLocationMaxEarlyReturnVunc];
    if (v24 != 1.79769313e308) {
      [(CLEmergencyLocationSelectorConfig *)self firstLocationMaxEarlyReturnVunc];
    }
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateHuncReductionToSendEarly];
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateDistanceMovedToSendEarly];
    [(CLEmergencyLocationSelectorConfig *)self firstLocationEarlyReturnEnabled];
    [(CLEmergencyLocationSelectorConfig *)self firstLocationTimeout];
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateTimeout];
    [(CLEmergencyLocationSelectorConfig *)self locationUpdateMinDelay];
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationSelectorConfig printConfiguration]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
  v22 = [(CLEmergencyLocationSelectorConfig *)self firstLocationUsabilityCriteria];
  -[CLEmergencyLocationUsabilityCriteria printUsabilityCriteria:](v22, "printUsabilityCriteria:", [NSString stringWithFormat:@"#CLELS,%@,first location usability criteria", +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", -[CLEmergencyLocationSelectorConfig feature](self, "feature"))]);
  v23 = [(CLEmergencyLocationSelectorConfig *)self locationUpdateUsabilityCriteria];
  -[CLEmergencyLocationUsabilityCriteria printUsabilityCriteria:](v23, "printUsabilityCriteria:", [NSString stringWithFormat:@"#CLELS,%@,location update usability criteria", +[CLEmergencyLocationSelectorConfig featureString:](CLEmergencyLocationSelectorConfig, "featureString:", -[CLEmergencyLocationSelectorConfig feature](self, "feature"))]);
}

- (BOOL)firstLocationEarlyReturnEnabled
{
  return self->_firstLocationEarlyReturnEnabled;
}

- (void)setFirstLocationEarlyReturnEnabled:(BOOL)a3
{
  self->_firstLocationEarlyReturnEnabled = a3;
}

- (double)firstLocationTimeout
{
  return self->_firstLocationTimeout;
}

- (void)setFirstLocationTimeout:(double)a3
{
  self->_firstLocationTimeout = a3;
}

- (double)locationUpdateTimeout
{
  return self->_locationUpdateTimeout;
}

- (void)setLocationUpdateTimeout:(double)a3
{
  self->_locationUpdateTimeout = a3;
}

- (double)locationUpdateMinDelay
{
  return self->_locationUpdateMinDelay;
}

- (void)setLocationUpdateMinDelay:(double)a3
{
  self->_locationUpdateMinDelay = a3;
}

- (int64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(int64_t)a3
{
  self->_feature = a3;
}

- (BOOL)firstUpdateEnabled
{
  return self->_firstUpdateEnabled;
}

- (void)setFirstUpdateEnabled:(BOOL)a3
{
  self->_firstUpdateEnabled = a3;
}

- (double)firstUpdateTimeout
{
  return self->_firstUpdateTimeout;
}

- (void)setFirstUpdateTimeout:(double)a3
{
  self->_firstUpdateTimeout = a3;
}

- (BOOL)periodicUpdatesEnabled
{
  return self->_periodicUpdatesEnabled;
}

- (void)setPeriodicUpdatesEnabled:(BOOL)a3
{
  self->_BOOL periodicUpdatesEnabled = a3;
}

- (CLEmergencyLocationUsabilityCriteria)firstLocationUsabilityCriteria
{
  return self->_firstLocationUsabilityCriteria;
}

- (void)setFirstLocationUsabilityCriteria:(id)a3
{
}

- (double)firstLocationMaxEarlyReturnHunc
{
  return self->_firstLocationMaxEarlyReturnHunc;
}

- (void)setFirstLocationMaxEarlyReturnHunc:(double)a3
{
  self->_firstLocationMaxEarlyReturnHunc = a3;
}

- (double)firstLocationMaxEarlyReturnVunc
{
  return self->_firstLocationMaxEarlyReturnVunc;
}

- (void)setFirstLocationMaxEarlyReturnVunc:(double)a3
{
  self->_firstLocationMaxEarlyReturnVunc = a3;
}

- (CLEmergencyLocationUsabilityCriteria)locationUpdateUsabilityCriteria
{
  return self->_locationUpdateUsabilityCriteria;
}

- (void)setLocationUpdateUsabilityCriteria:(id)a3
{
}

- (double)locationUpdateHuncReductionToSendEarly
{
  return self->_locationUpdateHuncReductionToSendEarly;
}

- (void)setLocationUpdateHuncReductionToSendEarly:(double)a3
{
  self->_locationUpdateHuncReductionToSendEarly = a3;
}

- (double)locationUpdateVuncReductionToSendEarly
{
  return self->_locationUpdateVuncReductionToSendEarly;
}

- (void)setLocationUpdateVuncReductionToSendEarly:(double)a3
{
  self->_locationUpdateVuncReductionToSendEarly = a3;
}

- (double)locationUpdateDistanceMovedToSendEarly
{
  return self->_locationUpdateDistanceMovedToSendEarly;
}

- (void)setLocationUpdateDistanceMovedToSendEarly:(double)a3
{
  self->_locationUpdateDistanceMovedToSendEarly = a3;
}

- (double)locationUpdateChangeInAltitudeToSendEarly
{
  return self->_locationUpdateChangeInAltitudeToSendEarly;
}

- (void)setLocationUpdateChangeInAltitudeToSendEarly:(double)a3
{
  self->_locationUpdateChangeInAltitudeToSendEarly = a3;
}

@end