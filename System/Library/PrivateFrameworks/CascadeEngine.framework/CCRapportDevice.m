@interface CCRapportDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CCRapportDevice)initWithCoder:(id)a3;
- (CCRapportDevice)initWithRPCompanionLinkDevice:(id)a3;
- (NSArray)serviceTypes;
- (NSMutableArray)requestQueue;
- (NSString)ccDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)rapportIdentifier;
- (NSString)shortenedRapportIdentifier;
- (RPCompanionLinkClient)client;
- (RPCompanionLinkDevice)device;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)platform;
- (unint64_t)hash;
- (unint64_t)linkState;
- (void)encodeWithCoder:(id)a3;
- (void)handleInvalidationWithError:(id)a3;
- (void)invalidateClientWithError:(id)a3;
- (void)setCcDeviceIdentifier:(id)a3;
- (void)setClient:(id)a3;
- (void)setDevice:(id)a3;
- (void)setLinkState:(unint64_t)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation CCRapportDevice

- (CCRapportDevice)initWithRPCompanionLinkDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCRapportDevice;
  v6 = [(CCRapportDevice *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_msgSend(v5, "CC_companionLinkDeviceIdentifier");
    rapportIdentifier = v7->_rapportIdentifier;
    v7->_rapportIdentifier = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (NSMutableArray *)v10;
  }
  return v7;
}

- (NSString)shortenedRapportIdentifier
{
  return [(NSString *)self->_rapportIdentifier substringToIndex:8];
}

- (NSString)name
{
  v2 = [(CCRapportDevice *)self device];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)model
{
  v2 = [(CCRapportDevice *)self device];
  v3 = [v2 model];

  return (NSString *)v3;
}

- (NSArray)serviceTypes
{
  v2 = [(CCRapportDevice *)self device];
  v3 = [v2 serviceTypes];

  return (NSArray *)v3;
}

- (int64_t)platform
{
  v2 = [(CCRapportDevice *)self device];
  v3 = [v2 model];
  int64_t v4 = BMDevicePlatformFromModelString();

  return v4;
}

- (void)invalidateClientWithError:(id)a3
{
  client = self->_client;
  if (client)
  {
    id v6 = a3;
    id v5 = [(RPCompanionLinkClient *)client dispatchQueue];
    dispatch_assert_queue_V2(v5);

    [(RPCompanionLinkClient *)self->_client setInvalidationHandler:0];
    [(RPCompanionLinkClient *)self->_client invalidate];
    [(CCRapportDevice *)self handleInvalidationWithError:v6];
  }
}

- (void)handleInvalidationWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  client = self->_client;
  if (client)
  {
    id v6 = [(RPCompanionLinkClient *)client dispatchQueue];
    dispatch_assert_queue_V2(v6);

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v17 = self;
    v7 = self->_requestQueue;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKeyedSubscript:@"~~RESPONSE_HANDLER~~"];
          objc_super v13 = (void (**)(void, void, void, void))v12;
          if (v12)
          {
            if (v4)
            {
              (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v4);
            }
            else
            {
              v14 = [MEMORY[0x263F087E8] errorWithDomain:@"CCRapportErrorDomain" code:0 userInfo:0];
              ((void (**)(void, void, void, void *))v13)[2](v13, 0, 0, v14);
            }
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [(NSMutableArray *)v17->_requestQueue removeAllObjects];
    v15 = v17->_client;
    v17->_client = 0;

    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[CCRapportDevice handleInvalidationWithError:](v17, v16);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 rapportIdentifier];
    id v6 = [(CCRapportDevice *)self rapportIdentifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CCRapportDevice *)self rapportIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(CCRapportDevice *)self shortenedRapportIdentifier];
  id v5 = [(CCRapportDevice *)self rapportIdentifier];
  id v6 = [(CCRapportDevice *)self ccDeviceIdentifier];
  char v7 = [(CCRapportDevice *)self model];
  uint64_t v8 = [(CCRapportDevice *)self name];
  uint64_t v9 = (void *)[v3 initWithFormat:@"CCRapportDevice[%@]: id=%@ ccID=%@ model=%@ name=%@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  device = v3->_device;
  return [(CCRapportDevice *)v3 initWithRPCompanionLinkDevice:device];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CCRapportDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];

  id v6 = [(CCRapportDevice *)self initWithRPCompanionLinkDevice:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CCRapportDevice *)self device];
  [v4 encodeObject:v5 forKey:@"device"];
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)ccDeviceIdentifier
{
  return self->_ccDeviceIdentifier;
}

- (void)setCcDeviceIdentifier:(id)a3
{
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSMutableArray)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (unint64_t)linkState
{
  return self->_linkState;
}

- (void)setLinkState:(unint64_t)a3
{
  self->_linkState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_ccDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
}

- (void)handleInvalidationWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 shortenedRapportIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_249B69000, a2, v4, "CCRapportDevice[%@]: invalidated", v5);
}

@end