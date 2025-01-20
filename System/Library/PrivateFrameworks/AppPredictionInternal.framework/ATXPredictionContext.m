@interface ATXPredictionContext
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXBluetoothDuetEvent)bluetoothEvent;
- (ATXMicrolocationVisitDuetEvent)microlocationVisitEvent;
- (ATXPredictionAmbientLightContext)ambientLightContext;
- (ATXPredictionContext)initWithCoder:(id)a3;
- (ATXPredictionContext)initWithDeviceStateContext:(id)a3 timeContext:(id)a4 locationMotionContext:(id)a5 ambientLightContext:(id)a6 userContext:(id)a7;
- (ATXPredictionContext)initWithDeviceStateContext:(id)a3 timeContext:(id)a4 locationMotionContext:(id)a5 ambientLightContext:(id)a6 userContext:(id)a7 isOverridden:(BOOL)a8;
- (ATXPredictionContext)initWithProto:(id)a3;
- (ATXPredictionContext)initWithProtoData:(id)a3;
- (ATXPredictionDeviceStateContext)deviceStateContext;
- (ATXPredictionLocationMotionContext)locationMotionContext;
- (ATXPredictionTimeContext)timeContext;
- (ATXPredictionUserContext)userContext;
- (BMUserFocusInferredMode)inferredModeEvent;
- (BMUserFocusModeComputed)userFocusComputedModeEvent;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPredictionContext:(id)a3;
- (BOOL)isOverridden;
- (NSDictionary)candidateIdentifiersLaunchAge;
- (NSString)description;
- (NSString)poiCategory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientLightContext:(id)a3;
- (void)setBluetoothEvent:(id)a3;
- (void)setCandidateIdentifiersLaunchAge:(id)a3;
- (void)setDeviceStateContext:(id)a3;
- (void)setInferredModeEvent:(id)a3;
- (void)setIsOverridden:(BOOL)a3;
- (void)setLocationMotionContext:(id)a3;
- (void)setMicrolocationVisitEvent:(id)a3;
- (void)setPoiCategory:(id)a3;
- (void)setTimeContext:(id)a3;
- (void)setUserContext:(id)a3;
- (void)setUserFocusComputedModeEvent:(id)a3;
- (void)updateTimeContextWithDate:(id)a3;
- (void)updateWithInjectedContext:(id)a3;
@end

@implementation ATXPredictionContext

- (ATXPredictionContext)initWithDeviceStateContext:(id)a3 timeContext:(id)a4 locationMotionContext:(id)a5 ambientLightContext:(id)a6 userContext:(id)a7
{
  return [(ATXPredictionContext *)self initWithDeviceStateContext:a3 timeContext:a4 locationMotionContext:a5 ambientLightContext:a6 userContext:a7 isOverridden:0];
}

- (ATXPredictionContext)initWithDeviceStateContext:(id)a3 timeContext:(id)a4 locationMotionContext:(id)a5 ambientLightContext:(id)a6 userContext:(id)a7 isOverridden:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXPredictionContext;
  v18 = [(ATXPredictionContext *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_deviceStateContext, a3);
    objc_storeStrong((id *)&v19->_timeContext, a4);
    objc_storeStrong((id *)&v19->_locationMotionContext, a5);
    objc_storeStrong((id *)&v19->_ambientLightContext, a6);
    objc_storeStrong((id *)&v19->_userContext, a7);
    v19->_isOverridden = a8;
  }

  return v19;
}

- (NSString)description
{
  v2 = [(ATXPredictionContext *)self jsonDict];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (void)updateWithInjectedContext:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_deviceStateContext;
LABEL_14:
    objc_storeStrong(p_deviceStateContext, a3);
    goto LABEL_15;
  }
  if (v6 == objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_timeContext;
    goto LABEL_14;
  }
  if (v6 == objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_locationMotionContext;
    goto LABEL_14;
  }
  if (v6 == objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_ambientLightContext;
    goto LABEL_14;
  }
  if (v6 == objc_opt_class())
  {
    p_deviceStateContext = (id *)&self->_userContext;
    goto LABEL_14;
  }
  v7 = __atxlog_handle_default();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ATXPredictionContext updateWithInjectedContext:](v6, v7);
  }

  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = [v6 description];
  [v8 raise:v9, @"Unexpected context injected %@", v10 format];

LABEL_15:
}

- (void)updateTimeContextWithDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPredictionTimeContext alloc] initWithDate:v4];

    [(ATXPredictionContext *)self updateWithInjectedContext:v5];
  }
}

- (ATXPredictionContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBPredictionContext alloc] initWithData:v4];

    self = [(ATXPredictionContext *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXPredictionContext *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXPredictionContext)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v22 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[ATXMinimalAction initWithProto:]((uint64_t)self, v23);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [ATXPredictionDeviceStateContext alloc];
  v7 = [v5 deviceStateContext];
  v8 = [(ATXPredictionDeviceStateContext *)v6 initWithProto:v7];

  uint64_t v9 = [ATXPredictionTimeContext alloc];
  v10 = [v5 timeContext];
  v11 = [(ATXPredictionTimeContext *)v9 initWithProto:v10];

  v12 = [ATXPredictionLocationMotionContext alloc];
  v13 = [v5 locationMotionContext];
  id v14 = [(ATXPredictionLocationMotionContext *)v12 initWithProto:v13];

  id v15 = [ATXPredictionAmbientLightContext alloc];
  id v16 = [v5 ambientLightContext];
  id v17 = [(ATXPredictionAmbientLightContext *)v15 initWithProto:v16];

  v18 = [ATXPredictionUserContext alloc];
  v19 = [v5 userContext];
  v20 = [(ATXPredictionUserContext *)v18 initWithProto:v19];

  uint64_t v21 = [v5 isOverridden];
  self = [(ATXPredictionContext *)self initWithDeviceStateContext:v8 timeContext:v11 locationMotionContext:v14 ambientLightContext:v17 userContext:v20 isOverridden:v21];

  id v22 = self;
LABEL_8:

  return v22;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(ATXPredictionDeviceStateContext *)self->_deviceStateContext proto];
  [v3 setDeviceStateContext:v4];

  id v5 = [(ATXPredictionTimeContext *)self->_timeContext proto];
  [v3 setTimeContext:v5];

  v6 = [(ATXPredictionLocationMotionContext *)self->_locationMotionContext proto];
  [v3 setLocationMotionContext:v6];

  v7 = [(ATXPredictionAmbientLightContext *)self->_ambientLightContext proto];
  [v3 setAmbientLightContext:v7];

  v8 = [(ATXPredictionUserContext *)self->_userContext proto];
  [v3 setUserContext:v8];

  [v3 setIsOverridden:self->_isOverridden];
  return v3;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonDict
{
  v19[12] = *MEMORY[0x1E4F143B8];
  v18[0] = @"deviceStateContext";
  v3 = [(ATXPredictionDeviceStateContext *)self->_deviceStateContext jsonDict];
  v19[0] = v3;
  v18[1] = @"timeContext";
  id v4 = [(ATXPredictionTimeContext *)self->_timeContext jsonDict];
  v19[1] = v4;
  v18[2] = @"locationMotionContext";
  id v5 = [(ATXPredictionLocationMotionContext *)self->_locationMotionContext jsonDict];
  v19[2] = v5;
  v18[3] = @"ambientLightContext";
  v6 = [(ATXPredictionAmbientLightContext *)self->_ambientLightContext jsonDict];
  v19[3] = v6;
  v18[4] = @"userContext";
  uint64_t v7 = [(ATXPredictionUserContext *)self->_userContext jsonDict];
  v8 = (void *)v7;
  uint64_t v9 = @"YES";
  if (!self->_isOverridden) {
    uint64_t v9 = @"NO";
  }
  v19[4] = v7;
  v19[5] = v9;
  v18[5] = @"isOverridden";
  v18[6] = @"candidateIdentifiersLaunchAge";
  candidateIdentifiersLaunchAge = self->_candidateIdentifiersLaunchAge;
  inferredModeEvent = self->_inferredModeEvent;
  if (!candidateIdentifiersLaunchAge) {
    candidateIdentifiersLaunchAge = (NSDictionary *)@"nil";
  }
  if (!inferredModeEvent) {
    inferredModeEvent = (BMUserFocusInferredMode *)@"nil";
  }
  v19[6] = candidateIdentifiersLaunchAge;
  v19[7] = inferredModeEvent;
  v18[7] = @"inferredModeEvent";
  v18[8] = @"userFocusComputedModeEvent";
  userFocusComputedModeEvent = self->_userFocusComputedModeEvent;
  poiCategory = (__CFString *)self->_poiCategory;
  if (!userFocusComputedModeEvent) {
    userFocusComputedModeEvent = (BMUserFocusModeComputed *)@"nil";
  }
  if (!poiCategory) {
    poiCategory = @"nil";
  }
  v19[8] = userFocusComputedModeEvent;
  v19[9] = poiCategory;
  v18[9] = @"poiCategory";
  v18[10] = @"bluetoothEvent";
  microlocationVisitEvent = self->_microlocationVisitEvent;
  bluetoothEvent = self->_bluetoothEvent;
  if (!bluetoothEvent) {
    bluetoothEvent = (ATXBluetoothDuetEvent *)@"nil";
  }
  v18[11] = @"microlocationVisitEvent";
  if (!microlocationVisitEvent) {
    microlocationVisitEvent = (ATXMicrolocationVisitDuetEvent *)@"nil";
  }
  v19[10] = bluetoothEvent;
  v19[11] = microlocationVisitEvent;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:12];

  return v16;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXPredictionContext *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXPredictionContext *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"predictionContext"];
}

- (ATXPredictionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionContext"];
  BOOL v6 = [(ATXPredictionContext *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"predictionContext" coder:v4 errorDomain:@"com.apple.duetexpertd.ATXPredictionContext" errorCode:-1];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    self = [(ATXPredictionContext *)self initWithProtoData:v5];
    uint64_t v7 = self;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPredictionContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPredictionContext *)self isEqualToATXPredictionContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPredictionContext:(id)a3
{
  id v4 = (id *)a3;
  deviceStateContext = self->_deviceStateContext;
  BOOL v6 = (ATXPredictionDeviceStateContext *)v4[2];
  if (deviceStateContext == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    v8 = deviceStateContext;
    BOOL v9 = [(ATXPredictionDeviceStateContext *)v8 isEqual:v7];

    if (!v9) {
      goto LABEL_19;
    }
  }
  timeContext = self->_timeContext;
  id v11 = (ATXPredictionTimeContext *)v4[3];
  if (timeContext == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = timeContext;
    BOOL v14 = [(ATXPredictionTimeContext *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_19;
    }
  }
  locationMotionContext = self->_locationMotionContext;
  id v16 = (ATXPredictionLocationMotionContext *)v4[4];
  if (locationMotionContext == v16)
  {
  }
  else
  {
    id v17 = v16;
    v18 = locationMotionContext;
    BOOL v19 = [(ATXPredictionLocationMotionContext *)v18 isEqual:v17];

    if (!v19) {
      goto LABEL_19;
    }
  }
  ambientLightContext = self->_ambientLightContext;
  uint64_t v21 = (ATXPredictionAmbientLightContext *)v4[5];
  if (ambientLightContext == v21)
  {
  }
  else
  {
    id v22 = v21;
    objc_super v23 = ambientLightContext;
    BOOL v24 = [(ATXPredictionAmbientLightContext *)v23 isEqual:v22];

    if (!v24) {
      goto LABEL_19;
    }
  }
  userContext = self->_userContext;
  v26 = (ATXPredictionUserContext *)v4[6];
  if (userContext == v26)
  {

    goto LABEL_22;
  }
  v27 = v26;
  v28 = userContext;
  BOOL v29 = [(ATXPredictionUserContext *)v28 isEqual:v27];

  if (v29)
  {
LABEL_22:
    BOOL v30 = self->_isOverridden == *((unsigned __int8 *)v4 + 8);
    goto LABEL_20;
  }
LABEL_19:
  BOOL v30 = 0;
LABEL_20:

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ATXPredictionContext allocWithZone:a3] initWithDeviceStateContext:self->_deviceStateContext timeContext:self->_timeContext locationMotionContext:self->_locationMotionContext ambientLightContext:self->_ambientLightContext userContext:self->_userContext isOverridden:self->_isOverridden];
  id v5 = [(ATXPredictionContext *)self candidateIdentifiersLaunchAge];
  [(ATXPredictionContext *)v4 setCandidateIdentifiersLaunchAge:v5];

  BOOL v6 = [(ATXPredictionContext *)self inferredModeEvent];
  [(ATXPredictionContext *)v4 setInferredModeEvent:v6];

  uint64_t v7 = [(ATXPredictionContext *)self userFocusComputedModeEvent];
  [(ATXPredictionContext *)v4 setUserFocusComputedModeEvent:v7];

  v8 = [(ATXPredictionContext *)self poiCategory];
  [(ATXPredictionContext *)v4 setPoiCategory:v8];

  BOOL v9 = [(ATXPredictionContext *)self bluetoothEvent];
  [(ATXPredictionContext *)v4 setBluetoothEvent:v9];

  v10 = [(ATXPredictionContext *)self microlocationVisitEvent];
  [(ATXPredictionContext *)v4 setMicrolocationVisitEvent:v10];

  return v4;
}

- (BOOL)isOverridden
{
  return self->_isOverridden;
}

- (void)setIsOverridden:(BOOL)a3
{
  self->_isOverridden = a3;
}

- (ATXPredictionDeviceStateContext)deviceStateContext
{
  return self->_deviceStateContext;
}

- (void)setDeviceStateContext:(id)a3
{
}

- (ATXPredictionTimeContext)timeContext
{
  return self->_timeContext;
}

- (void)setTimeContext:(id)a3
{
}

- (ATXPredictionLocationMotionContext)locationMotionContext
{
  return self->_locationMotionContext;
}

- (void)setLocationMotionContext:(id)a3
{
}

- (ATXPredictionAmbientLightContext)ambientLightContext
{
  return self->_ambientLightContext;
}

- (void)setAmbientLightContext:(id)a3
{
}

- (ATXPredictionUserContext)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (NSDictionary)candidateIdentifiersLaunchAge
{
  return self->_candidateIdentifiersLaunchAge;
}

- (void)setCandidateIdentifiersLaunchAge:(id)a3
{
}

- (BMUserFocusInferredMode)inferredModeEvent
{
  return self->_inferredModeEvent;
}

- (void)setInferredModeEvent:(id)a3
{
}

- (BMUserFocusModeComputed)userFocusComputedModeEvent
{
  return self->_userFocusComputedModeEvent;
}

- (void)setUserFocusComputedModeEvent:(id)a3
{
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
}

- (ATXMicrolocationVisitDuetEvent)microlocationVisitEvent
{
  return self->_microlocationVisitEvent;
}

- (void)setMicrolocationVisitEvent:(id)a3
{
}

- (ATXBluetoothDuetEvent)bluetoothEvent
{
  return self->_bluetoothEvent;
}

- (void)setBluetoothEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothEvent, 0);
  objc_storeStrong((id *)&self->_microlocationVisitEvent, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_userFocusComputedModeEvent, 0);
  objc_storeStrong((id *)&self->_inferredModeEvent, 0);
  objc_storeStrong((id *)&self->_candidateIdentifiersLaunchAge, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_ambientLightContext, 0);
  objc_storeStrong((id *)&self->_locationMotionContext, 0);
  objc_storeStrong((id *)&self->_timeContext, 0);
  objc_storeStrong((id *)&self->_deviceStateContext, 0);
}

- (void)updateWithInjectedContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Unexpected context injected %@", (uint8_t *)&v4, 0xCu);
}

@end