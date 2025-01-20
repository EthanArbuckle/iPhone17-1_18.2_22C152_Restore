@interface ATXAVRouteInfo
+ (BOOL)supportsSecureCoding;
- (ATXAVRouteInfo)initWithCoder:(id)a3;
- (ATXAVRouteInfo)initWithDeviceName:(id)a3 deviceID:(id)a4 isExternalRoute:(BOOL)a5;
- (ATXAVRouteInfo)initWithProto:(id)a3;
- (ATXAVRouteInfo)initWithProtoData:(id)a3;
- (BOOL)isExternalRoute;
- (NSString)deviceID;
- (NSString)deviceName;
- (id)encodeAsProto;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXAVRouteInfo

- (ATXAVRouteInfo)initWithDeviceName:(id)a3 deviceID:(id)a4 isExternalRoute:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAVRouteInfo;
  v11 = [(ATXAVRouteInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceName, a3);
    objc_storeStrong((id *)&v12->_deviceID, a4);
    v12->_isExternalRoute = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_deviceID forKey:@"deviceID"];
  [v5 encodeBool:self->_isExternalRoute forKey:@"isExternalRoute"];
}

- (ATXAVRouteInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isExternalRoute"];

  v8 = [(ATXAVRouteInfo *)self initWithDeviceName:v5 deviceID:v6 isExternalRoute:v7];
  return v8;
}

- (ATXAVRouteInfo)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBAVRouteInfo alloc] initWithData:v4];

    self = [(ATXAVRouteInfo *)self initWithProto:v5];
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
  v2 = [(ATXAVRouteInfo *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXAVRouteInfo)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXAVRouteInfo initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [v5 deviceName];
  uint64_t v7 = [v5 deviceID];
  uint64_t v8 = [v5 isExternalRoute];

  self = [(ATXAVRouteInfo *)self initWithDeviceName:v6 deviceID:v7 isExternalRoute:v8];
  id v9 = self;
LABEL_8:

  return v9;
}

- (id)proto
{
  v3 = objc_alloc_init(ATXPBAVRouteInfo);
  [(ATXPBAVRouteInfo *)v3 setDeviceName:self->_deviceName];
  [(ATXPBAVRouteInfo *)v3 setDeviceID:self->_deviceID];
  [(ATXPBAVRouteInfo *)v3 setIsExternalRoute:self->_isExternalRoute];

  return v3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (BOOL)isExternalRoute
{
  return self->_isExternalRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);

  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAVRouteInfo proto", (uint8_t *)&v5, 0xCu);
}

@end