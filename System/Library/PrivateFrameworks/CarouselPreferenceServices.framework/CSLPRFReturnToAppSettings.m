@interface CSLPRFReturnToAppSettings
- (BOOL)alwaysReturnToAppInSession;
- (BOOL)hasCustomReturnToAppTimeout;
- (BOOL)isEqual:(id)a3;
- (BOOL)sessionCapable;
- (CSLPRFReturnToAppSettings)init;
- (CSLPRFReturnToAppSettings)initWithDictionary:(id)a3;
- (double)returnToAppTimeout;
- (id)description;
- (id)toDictionary;
- (unint64_t)hash;
- (void)setAlwaysReturnToAppInSession:(BOOL)a3;
- (void)setReturnToAppTimeout:(double)a3;
- (void)setSessionCapable:(BOOL)a3;
@end

@implementation CSLPRFReturnToAppSettings

- (void)setAlwaysReturnToAppInSession:(BOOL)a3
{
  self->_alwaysReturnToAppInSession = a3;
}

- (BOOL)alwaysReturnToAppInSession
{
  return self->_alwaysReturnToAppInSession;
}

- (void)setSessionCapable:(BOOL)a3
{
  self->_sessionCapable = a3;
}

- (BOOL)sessionCapable
{
  return self->_sessionCapable;
}

- (BOOL)hasCustomReturnToAppTimeout
{
  return self->_hasCustomReturnToAppTimeout;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = v3;
  if (self->_hasCustomReturnToAppTimeout) {
    id v5 = (id)[v3 appendFloat:@"ReturnToAppTimeout" withName:self->_returnToAppTimeout];
  }
  if (self->_sessionCapable) {
    id v6 = (id)[v4 appendBool:1 withName:@"SessionCapable"];
  }
  if (self->_alwaysReturnToAppInSession) {
    id v7 = (id)[v4 appendBool:1 withName:@"AlwaysReturnToAppInSession"];
  }
  v8 = [v4 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  double returnToAppTimeout;
  id v10;
  id v11;
  BOOL sessionCapable;
  id v13;
  id v14;
  uint64_t alwaysReturnToAppInSession;
  id v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  void v24[4];
  id v25;
  void v26[4];
  id v27;
  void v28[4];
  id v29;

  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL hasCustomReturnToAppTimeout = self->_hasCustomReturnToAppTimeout;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __37__CSLPRFReturnToAppSettings_isEqual___block_invoke;
  v28[3] = &unk_264A0BCF8;
  id v7 = v4;
  v29 = v7;
  id v8 = (id)[v5 appendBool:hasCustomReturnToAppTimeout counterpart:v28];
  returnToAppTimeout = self->_returnToAppTimeout;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __37__CSLPRFReturnToAppSettings_isEqual___block_invoke_2;
  v26[3] = &unk_264A0AFE8;
  v10 = v7;
  v27 = v10;
  v11 = (id)[v5 appendDouble:v26 counterpart:returnToAppTimeout];
  sessionCapable = self->_sessionCapable;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __37__CSLPRFReturnToAppSettings_isEqual___block_invoke_3;
  v24[3] = &unk_264A0BCF8;
  v13 = v10;
  v25 = v13;
  v14 = (id)[v5 appendBool:sessionCapable counterpart:v24];
  alwaysReturnToAppInSession = self->_alwaysReturnToAppInSession;
  v19 = MEMORY[0x263EF8330];
  v20 = 3221225472;
  v21 = __37__CSLPRFReturnToAppSettings_isEqual___block_invoke_4;
  v22 = &unk_264A0BCF8;
  v23 = v13;
  v16 = v13;
  v17 = (id)[v5 appendBool:alwaysReturnToAppInSession counterpart:&v19];
  LOBYTE(alwaysReturnToAppInSession) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return alwaysReturnToAppInSession;
}

uint64_t __37__CSLPRFReturnToAppSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasCustomReturnToAppTimeout];
}

uint64_t __37__CSLPRFReturnToAppSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnToAppTimeout];
}

uint64_t __37__CSLPRFReturnToAppSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sessionCapable];
}

uint64_t __37__CSLPRFReturnToAppSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) alwaysReturnToAppInSession];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = v3;
  if (self->_hasCustomReturnToAppTimeout) {
    id v5 = (id)[v3 appendDouble:self->_returnToAppTimeout];
  }
  id v6 = (id)[v4 appendBool:self->_sessionCapable];
  id v7 = (id)[v4 appendBool:self->_alwaysReturnToAppInSession];
  unint64_t v8 = [v4 hash];

  return v8;
}

- (id)toDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_hasCustomReturnToAppTimeout)
  {
    id v4 = [NSNumber numberWithDouble:self->_returnToAppTimeout];
    [v3 setObject:v4 forKeyedSubscript:@"ReturnToAppTimeout"];
  }
  if (self->_sessionCapable)
  {
    id v5 = [NSNumber numberWithBool:1];
    [v3 setObject:v5 forKeyedSubscript:@"SessionCapable"];
  }
  if (self->_alwaysReturnToAppInSession)
  {
    id v6 = [NSNumber numberWithBool:1];
    [v3 setObject:v6 forKeyedSubscript:@"AlwaysReturnToAppInSession"];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

- (double)returnToAppTimeout
{
  double *p_returnToAppTimeout;

  if (self->_hasCustomReturnToAppTimeout) {
    p_returnToAppTimeout = &self->_returnToAppTimeout;
  }
  else {
    p_returnToAppTimeout = (double *)&CSLPRFViewOnWakeUpdateDefaultTimeout;
  }
  return *p_returnToAppTimeout;
}

- (void)setReturnToAppTimeout:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = cslprf_sessions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 67109120;
    int v12 = (int)a3;
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_INFO, "setting returnToAppTimeout to %d", (uint8_t *)&v11, 8u);
  }

  double v6 = fabs(a3);
  BOOL v7 = v6 < 0.001;
  BOOL v8 = v6 >= 0.001;
  double v9 = 120.0;
  if (!v7) {
    double v9 = a3;
  }
  self->_returnToAppTimeout = v9;
  self->_BOOL hasCustomReturnToAppTimeout = v8;
  v10 = cslprf_sessions_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 67109120;
    int v12 = (int)a3;
    _os_log_impl(&dword_22F4EA000, v10, OS_LOG_TYPE_INFO, "_BOOL hasCustomReturnToAppTimeout = %{BOOL}u", (uint8_t *)&v11, 8u);
  }
}

- (CSLPRFReturnToAppSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFReturnToAppSettings;
  result = [(CSLPRFReturnToAppSettings *)&v3 init];
  if (result) {
    result->_returnToAppTimeout = 120.0;
  }
  return result;
}

- (CSLPRFReturnToAppSettings)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLPRFReturnToAppSettings *)self init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"ReturnToAppTimeout"];
    [v6 floatValue];
    if (v7 == -1.0 && (CSLSAllowReturnToAppUntilCrownPress() & 1) == 0)
    {

      v5->_BOOL hasCustomReturnToAppTimeout = 1;
      double v6 = &unk_26E2C9828;
    }
    else
    {
      v5->_BOOL hasCustomReturnToAppTimeout = v6 != 0;
      if (!v6)
      {
        double v8 = 120.0;
LABEL_8:
        v5->_returnToAppTimeout = v8;
        v10 = [v4 objectForKeyedSubscript:@"SessionCapable"];
        v5->_sessionCapable = [v10 BOOLValue];
        int v11 = [v4 objectForKeyedSubscript:@"AlwaysReturnToAppInSession"];

        v5->_alwaysReturnToAppInSession = [v11 BOOLValue];
        goto LABEL_9;
      }
    }
    [v6 floatValue];
    double v8 = v9;

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

@end