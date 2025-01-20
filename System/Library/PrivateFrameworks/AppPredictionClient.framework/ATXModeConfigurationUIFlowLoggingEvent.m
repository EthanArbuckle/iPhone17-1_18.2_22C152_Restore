@interface ATXModeConfigurationUIFlowLoggingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXModeConfigurationUIFlowLoggingEvent)initWithDndModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 suggestedEntityIdentifiers:(id)a7 candidateEntityIdentifiers:(id)a8 previousEntityIdentifiers:(id)a9 currentEntityIdentifiers:(id)a10 eventDate:(id)a11;
- (ATXModeConfigurationUIFlowLoggingEvent)initWithProto:(id)a3;
- (ATXModeConfigurationUIFlowLoggingEvent)initWithProtoData:(id)a3;
- (NSArray)candidateEntityIdentifiers;
- (NSArray)currentEntityIdentifiers;
- (NSArray)previousEntityIdentifiers;
- (NSArray)suggestedEntityIdentifiers;
- (NSDate)eventDate;
- (NSUUID)dndModeUUID;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)json;
- (id)jsonRawData;
- (id)jsonRepresentation;
- (id)proto;
- (int)modeConfigurationEntityType;
- (int)modeConfigurationUI;
- (int64_t)modeConfigurationType;
- (unsigned)dataVersion;
@end

@implementation ATXModeConfigurationUIFlowLoggingEvent

- (ATXModeConfigurationUIFlowLoggingEvent)initWithDndModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 suggestedEntityIdentifiers:(id)a7 candidateEntityIdentifiers:(id)a8 previousEntityIdentifiers:(id)a9 currentEntityIdentifiers:(id)a10 eventDate:(id)a11
{
  id v15 = a3;
  id v16 = a7;
  id v28 = a8;
  id v27 = a9;
  id v26 = a10;
  id v17 = a11;
  if (!v15)
  {
    id v22 = v16;
    v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[ATXModeConfigurationUIFlowLoggingEvent initWithDndModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:](v18);
    }

    id v16 = v22;
  }
  v29.receiver = self;
  v29.super_class = (Class)ATXModeConfigurationUIFlowLoggingEvent;
  v19 = [(ATXModeConfigurationUIFlowLoggingEvent *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dndModeUUID, a3);
    v20->_modeConfigurationEntityType = a5;
    v20->_modeConfigurationUI = a4;
    objc_storeStrong((id *)&v20->_suggestedEntityIdentifiers, a7);
    objc_storeStrong((id *)&v20->_candidateEntityIdentifiers, a8);
    objc_storeStrong((id *)&v20->_previousEntityIdentifiers, a9);
    objc_storeStrong((id *)&v20->_currentEntityIdentifiers, a10);
    objc_storeStrong((id *)&v20->_eventDate, a11);
    v20->_modeConfigurationType = a6;
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonRawData
{
  v20[9] = *MEMORY[0x1E4F143B8];
  v19[0] = @"dndModeUUID";
  v3 = [(NSUUID *)self->_dndModeUUID UUIDString];
  v20[0] = v3;
  v19[1] = @"modeConfigurationUI";
  uint64_t modeConfigurationUI = self->_modeConfigurationUI;
  if (modeConfigurationUI >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationUI);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E5D08388[modeConfigurationUI];
  }
  v20[1] = v5;
  v19[2] = @"modeConfigurationEntityType";
  uint64_t modeConfigurationEntityType = self->_modeConfigurationEntityType;
  if (modeConfigurationEntityType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationEntityType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E5D083A8[modeConfigurationEntityType];
  }
  v20[2] = v7;
  v19[3] = @"modeConfigurationType";
  int64_t modeConfigurationType = self->_modeConfigurationType;
  if (modeConfigurationType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeConfigurationType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E5D083C0[(int)modeConfigurationType];
  }
  suggestedEntityIdentifiers = self->_suggestedEntityIdentifiers;
  candidateEntityIdentifiers = self->_candidateEntityIdentifiers;
  if (!suggestedEntityIdentifiers) {
    suggestedEntityIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v20[3] = v9;
  v20[4] = suggestedEntityIdentifiers;
  v19[4] = @"suggestedEntityIdentifiers";
  v19[5] = @"candidateEntityIdentifiers";
  if (candidateEntityIdentifiers) {
    v12 = candidateEntityIdentifiers;
  }
  else {
    v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  previousEntityIdentifiers = self->_previousEntityIdentifiers;
  currentEntityIdentifiers = self->_currentEntityIdentifiers;
  if (!currentEntityIdentifiers) {
    currentEntityIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v20[5] = v12;
  v20[6] = currentEntityIdentifiers;
  v19[6] = @"currentEntityIdentifiers";
  v19[7] = @"previousEntityIdentifiers";
  if (previousEntityIdentifiers) {
    id v15 = previousEntityIdentifiers;
  }
  else {
    id v15 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v20[7] = v15;
  v19[8] = @"eventTime";
  id v16 = [(NSDate *)self->_eventDate description];
  v20[8] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:9];

  return v17;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXModeConfigurationUIFlowLoggingEvent *)self jsonRawData];
  v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXModeConfigurationUIFlowLoggingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBModeConfigurationUIFlowLoggingEvent alloc] initWithData:v4];

    self = [(ATXModeConfigurationUIFlowLoggingEvent *)self initWithProto:v5];
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
  v2 = [(ATXModeConfigurationUIFlowLoggingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXModeConfigurationUIFlowLoggingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_19:
    v33 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v34);
    }

    goto LABEL_19;
  }
  id v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = v4;
  id v7 = [v5 alloc];
  v8 = [v6 dndModeUUID];
  v9 = (void *)[v7 initWithUUIDString:v8];

  unsigned int v37 = [v6 modeConfigurationUI];
  unsigned int v36 = [v6 modeConfigurationEntityType];
  uint64_t v10 = (int)[v6 modeConfigurationType];
  uint64_t v11 = [v6 suggestedEntityIdentifiers];
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    v14 = (void *)v11;
  }
  else {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v15 = v14;

  uint64_t v16 = [v6 candidateEntityIdentifiers];
  id v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v13;
  }
  id v19 = v18;

  uint64_t v20 = [v6 previousEntityIdentifiers];
  v21 = (void *)v20;
  if (v20) {
    id v22 = (void *)v20;
  }
  else {
    id v22 = v13;
  }
  id v23 = v22;

  uint64_t v24 = [v6 currentEntityIdentifiers];
  v25 = (void *)v24;
  if (v24) {
    id v26 = (void *)v24;
  }
  else {
    id v26 = v13;
  }
  id v27 = v26;

  id v28 = (void *)MEMORY[0x1E4F1C9C8];
  [v6 secondsSinceReferenceDate];
  double v30 = v29;

  v31 = [v28 dateWithTimeIntervalSinceReferenceDate:v30];
  v32 = [(ATXModeConfigurationUIFlowLoggingEvent *)self initWithDndModeUUID:v9 modeConfigurationUI:v37 modeConfigurationEntityType:v36 modeConfigurationType:v10 suggestedEntityIdentifiers:v15 candidateEntityIdentifiers:v19 previousEntityIdentifiers:v23 currentEntityIdentifiers:v27 eventDate:v31];

  self = v32;
  v33 = self;
LABEL_20:

  return v33;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_dndModeUUID UUIDString];
  [v3 setDndModeUUID:v4];

  [v3 setModeConfigurationUI:self->_modeConfigurationUI];
  [v3 setModeConfigurationEntityType:self->_modeConfigurationEntityType];
  [v3 setModeConfigurationType:LODWORD(self->_modeConfigurationType)];
  id v5 = (void *)[(NSArray *)self->_suggestedEntityIdentifiers mutableCopy];
  [v3 setSuggestedEntityIdentifiers:v5];

  id v6 = (void *)[(NSArray *)self->_candidateEntityIdentifiers mutableCopy];
  [v3 setCandidateEntityIdentifiers:v6];

  id v7 = (void *)[(NSArray *)self->_previousEntityIdentifiers mutableCopy];
  [v3 setPreviousEntityIdentifiers:v7];

  v8 = (void *)[(NSArray *)self->_currentEntityIdentifiers mutableCopy];
  [v3 setCurrentEntityIdentifiers:v8];

  [(NSDate *)self->_eventDate timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setSecondsSinceReferenceDate:");

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBModeConfigurationUIFlowLoggingEvent alloc] initFromJSON:v4];

  id v6 = [(ATXModeConfigurationUIFlowLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXModeConfigurationUIFlowLoggingEvent *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (NSUUID)dndModeUUID
{
  return self->_dndModeUUID;
}

- (int)modeConfigurationEntityType
{
  return self->_modeConfigurationEntityType;
}

- (int)modeConfigurationUI
{
  return self->_modeConfigurationUI;
}

- (NSArray)suggestedEntityIdentifiers
{
  return self->_suggestedEntityIdentifiers;
}

- (NSArray)candidateEntityIdentifiers
{
  return self->_candidateEntityIdentifiers;
}

- (NSArray)previousEntityIdentifiers
{
  return self->_previousEntityIdentifiers;
}

- (NSArray)currentEntityIdentifiers
{
  return self->_currentEntityIdentifiers;
}

- (int64_t)modeConfigurationType
{
  return self->_modeConfigurationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_candidateEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_suggestedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_dndModeUUID, 0);

  objc_storeStrong((id *)&self->_eventDate, 0);
}

- (void)initWithDndModeUUID:(os_log_t)log modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:suggestedEntityIdentifiers:candidateEntityIdentifiers:previousEntityIdentifiers:currentEntityIdentifiers:eventDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Attempting to initialize ATXModeConfigurationUIFlowLoggingEvent without specifying dndModeUUID", v1, 2u);
}

@end