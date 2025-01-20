@interface CLEmergencyLocationUsabilityCriteria
- (BOOL)altitudeStitchingEnabled;
- (BOOL)vuncCheckRequiredForUsability;
- (CLEmergencyLocationUsabilityCriteria)init;
- (double)maxUsableAge;
- (double)maxUsableHunc;
- (double)maxUsableVunc;
- (unsigned)minUsableIntegrity;
- (void)printUsabilityCriteria:(id)a3;
- (void)setAltitudeStitchingEnabled:(BOOL)a3;
- (void)setMaxUsableAge:(double)a3;
- (void)setMaxUsableHunc:(double)a3;
- (void)setMaxUsableVunc:(double)a3;
- (void)setMinUsableIntegrity:(unsigned int)a3;
- (void)setVuncCheckRequiredForUsability:(BOOL)a3;
@end

@implementation CLEmergencyLocationUsabilityCriteria

- (CLEmergencyLocationUsabilityCriteria)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLEmergencyLocationUsabilityCriteria;
  result = [(CLEmergencyLocationUsabilityCriteria *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_vuncCheckRequiredForUsability = 256;
    *(_OWORD *)&result->_maxUsableAge = xmmword_190886510;
    result->_maxUsableVunc = 30.0;
    result->_minUsableIntegrity = 50;
  }
  return result;
}

- (void)printUsabilityCriteria:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
  }
  v5 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(CLEmergencyLocationUsabilityCriteria *)self vuncCheckRequiredForUsability];
    BOOL v7 = [(CLEmergencyLocationUsabilityCriteria *)self altitudeStitchingEnabled];
    [(CLEmergencyLocationUsabilityCriteria *)self maxUsableAge];
    uint64_t v9 = v8;
    [(CLEmergencyLocationUsabilityCriteria *)self maxUsableHunc];
    uint64_t v11 = v10;
    [(CLEmergencyLocationUsabilityCriteria *)self maxUsableVunc];
    *(_DWORD *)buf = 138544898;
    id v15 = a3;
    __int16 v16 = 1026;
    BOOL v17 = v6;
    __int16 v18 = 1026;
    BOOL v19 = v7;
    __int16 v20 = 2050;
    uint64_t v21 = v9;
    __int16 v22 = 2050;
    uint64_t v23 = v11;
    __int16 v24 = 2050;
    uint64_t v25 = v12;
    __int16 v26 = 1026;
    unsigned int v27 = [(CLEmergencyLocationUsabilityCriteria *)self minUsableIntegrity];
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@,vuncCheckRequiredForUsability,%{public}d,altitudeStitchingEnabled,%{public}d,maxUsableAge,%{public}f,maxUsableHunc,%{public}f,maxUsableVunc,%{public}f,minUsableIntegrity,%{public}d", buf, 0x3Cu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE0060C0);
    }
    [(CLEmergencyLocationUsabilityCriteria *)self vuncCheckRequiredForUsability];
    [(CLEmergencyLocationUsabilityCriteria *)self altitudeStitchingEnabled];
    [(CLEmergencyLocationUsabilityCriteria *)self maxUsableAge];
    [(CLEmergencyLocationUsabilityCriteria *)self maxUsableHunc];
    [(CLEmergencyLocationUsabilityCriteria *)self maxUsableVunc];
    [(CLEmergencyLocationUsabilityCriteria *)self minUsableIntegrity];
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEmergencyLocationUsabilityCriteria printUsabilityCriteria:]", "CoreLocation: %s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
}

- (BOOL)vuncCheckRequiredForUsability
{
  return self->_vuncCheckRequiredForUsability;
}

- (void)setVuncCheckRequiredForUsability:(BOOL)a3
{
  self->_vuncCheckRequiredForUsability = a3;
}

- (BOOL)altitudeStitchingEnabled
{
  return self->_altitudeStitchingEnabled;
}

- (void)setAltitudeStitchingEnabled:(BOOL)a3
{
  self->_altitudeStitchingEnabled = a3;
}

- (double)maxUsableAge
{
  return self->_maxUsableAge;
}

- (void)setMaxUsableAge:(double)a3
{
  self->_maxUsableAge = a3;
}

- (double)maxUsableHunc
{
  return self->_maxUsableHunc;
}

- (void)setMaxUsableHunc:(double)a3
{
  self->_maxUsableHunc = a3;
}

- (double)maxUsableVunc
{
  return self->_maxUsableVunc;
}

- (void)setMaxUsableVunc:(double)a3
{
  self->_maxUsableVunc = a3;
}

- (unsigned)minUsableIntegrity
{
  return self->_minUsableIntegrity;
}

- (void)setMinUsableIntegrity:(unsigned int)a3
{
  self->_minUsableIntegrity = a3;
}

@end