@interface GCPlayerIndicatorXPCProxyClientEndpointDescription
+ (BOOL)supportsSecureCoding;
- (GCPlayerIndicatorXPCProxyClientEndpointDescription)init;
- (GCPlayerIndicatorXPCProxyClientEndpointDescription)initWithCoder:(id)a3;
- (GCPlayerIndicatorXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialPlayerIndex:(int64_t)a4;
- (NSObject)identifier;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCPlayerIndicatorXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCPlayerIndicatorXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialPlayerIndex:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCPlayerIndicatorXPCProxyClientEndpointDescription;
  v7 = [(GCPlayerIndicatorXPCProxyClientEndpointDescription *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:0];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_initialPlayerIndex = a4;
  }

  return v7;
}

- (GCPlayerIndicatorXPCProxyClientEndpointDescription)init
{
  return self;
}

- (GCPlayerIndicatorXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCPlayerIndicatorXPCProxyClientEndpointDescription;
  v5 = [(GCPlayerIndicatorXPCProxyClientEndpointDescription *)&v10 init];
  if (v5)
  {
    id v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v5->_initialPlayerIndex = [v4 decodeIntegerForKey:@"initialPlayerIndex"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t initialPlayerIndex = self->_initialPlayerIndex;
  id v5 = a3;
  [v5 encodeInteger:initialPlayerIndex forKey:@"initialPlayerIndex"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)materializeWithContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  materializedObject = self->_materializedObject;
  if (materializedObject) {
    goto LABEL_4;
  }
  uint64_t v7 = [v4 IPCServiceRegistry];
  uint64_t v8 = [v7 serviceClientForIPCService:&unk_26D2B4618];

  if (v8)
  {
    v9 = [v8 playerIndicatorXPCProxyServiceRemoteServer];
    objc_super v10 = [[GCPlayerIndicatorXPCProxyClientEndpoint alloc] initWithIdentifier:self->_identifier initialPlayerIndex:self->_initialPlayerIndex];
    objc_super v11 = [v5 IPCObjectRegistry];
    [v11 registerIPCObject:v10];

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __77__GCPlayerIndicatorXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_26D22D338;
    v13 = v10;
    v23 = v13;
    id v24 = v8;
    dispatch_semaphore_t v25 = v12;
    v14 = v12;
    id v15 = v8;
    [v9 playerIndicatorXPCProxyServiceClientEndpointConnect:v13 reply:v22];
    dispatch_time_t v16 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v14, v16);
    v17 = self->_materializedObject;
    self->_materializedObject = v13;
    v18 = v13;

    materializedObject = self->_materializedObject;
LABEL_4:
    v19 = materializedObject;
    goto LABEL_5;
  }
  if (gc_isInternalBuild())
  {
    v21 = getGCLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[GCPlayerIndicatorXPCProxyClientEndpointDescription materializeWithContext:]();
    }
  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __77__GCPlayerIndicatorXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 playerIndicatorXPCProxyServiceConnection];
  [v3 setRemoteEndpoint:v5 connection:v6];

  uint64_t v7 = a1[6];

  return dispatch_semaphore_signal(v7);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_materializedObject, 0);
}

- (void)materializeWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1_24();
  OUTLINED_FUNCTION_0_28(&dword_220998000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
}

@end