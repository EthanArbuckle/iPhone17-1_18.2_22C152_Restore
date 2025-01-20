@interface ATXPredictionDeviceStateContext
- (ATXPredictionDeviceStateContext)initWithProto:(id)a3;
- (ATXPredictionDeviceStateContext)initWithProtoData:(id)a3;
- (ATXPredictionDeviceStateContext)initWithWifiSSID:(id)a3 onWifi:(BOOL)a4 inAirplaneMode:(BOOL)a5;
- (BOOL)inAirplaneMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPredictionDeviceStateContext:(id)a3;
- (BOOL)onWifi;
- (NSString)wifiSSID;
- (id)description;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
@end

@implementation ATXPredictionDeviceStateContext

- (ATXPredictionDeviceStateContext)initWithWifiSSID:(id)a3 onWifi:(BOOL)a4 inAirplaneMode:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXPredictionDeviceStateContext;
  v9 = [(ATXPredictionDeviceStateContext *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    wifiSSID = v9->_wifiSSID;
    v9->_wifiSSID = (NSString *)v10;

    v9->_onWifi = a4;
    v9->_inAirplaneMode = a5;
  }

  return v9;
}

- (id)description
{
  v2 = [(ATXPredictionDeviceStateContext *)self jsonDict];
  v3 = [v2 description];

  return v3;
}

- (id)jsonDict
{
  v9[3] = *MEMORY[0x1E4F143B8];
  wifiSSID = self->_wifiSSID;
  v8[0] = @"wifiSSID";
  v8[1] = @"onWifi";
  if (self->_onWifi) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v9[0] = wifiSSID;
  v9[1] = v3;
  BOOL inAirplaneMode = self->_inAirplaneMode;
  v8[2] = @"inAirplaneMode";
  if (inAirplaneMode) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  return v6;
}

- (ATXPredictionDeviceStateContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBPredictionDeviceStateContext alloc] initWithData:v4];

    self = [(ATXPredictionDeviceStateContext *)self initWithProto:v5];
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
  v2 = [(ATXPredictionDeviceStateContext *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXPredictionDeviceStateContext)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionDeviceStateContext initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [v5 wifiSSID];
  uint64_t v7 = [v5 onWifi];
  uint64_t v8 = [v5 inAirplaneMode];

  self = [(ATXPredictionDeviceStateContext *)self initWithWifiSSID:v6 onWifi:v7 inAirplaneMode:v8];
  v9 = self;
LABEL_8:

  return v9;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setWifiSSID:self->_wifiSSID];
  [v3 setOnWifi:self->_onWifi];
  [v3 setInAirplaneMode:self->_inAirplaneMode];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPredictionDeviceStateContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPredictionDeviceStateContext *)self isEqualToATXPredictionDeviceStateContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPredictionDeviceStateContext:(id)a3
{
  id v4 = (id *)a3;
  wifiSSID = self->_wifiSSID;
  BOOL v6 = (NSString *)v4[2];
  if (wifiSSID == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = wifiSSID;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  if (self->_onWifi != *((unsigned __int8 *)v4 + 8))
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  BOOL v10 = self->_inAirplaneMode == *((unsigned __int8 *)v4 + 9);
LABEL_8:

  return v10;
}

- (BOOL)onWifi
{
  return self->_onWifi;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (BOOL)inAirplaneMode
{
  return self->_inAirplaneMode;
}

- (void).cxx_destruct
{
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionDeviceStateContext proto", (uint8_t *)&v5, 0xCu);
}

@end