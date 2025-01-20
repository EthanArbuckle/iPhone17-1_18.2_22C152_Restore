@interface GCMotionXPCProxyClientEndpointDescription
+ (BOOL)supportsSecureCoding;
- (GCMotionXPCProxyClientEndpointDescription)init;
- (GCMotionXPCProxyClientEndpointDescription)initWithCoder:(id)a3;
- (GCMotionXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialSensorsActive:(BOOL)a4;
- (NSObject)identifier;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCMotionXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCMotionXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialSensorsActive:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCMotionXPCProxyClientEndpointDescription;
  v7 = [(GCMotionXPCProxyClientEndpointDescription *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:0];
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_initialSensorsActive = a4;
  }

  return v7;
}

- (GCMotionXPCProxyClientEndpointDescription)init
{
  return self;
}

- (GCMotionXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GCMotionXPCProxyClientEndpointDescription;
  v5 = [(GCMotionXPCProxyClientEndpointDescription *)&v10 init];
  if (v5)
  {
    id v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v5->_initialSensorsActive = [v4 decodeBoolForKey:@"initialSensorsActive"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL initialSensorsActive = self->_initialSensorsActive;
  id v5 = a3;
  [v5 encodeInteger:initialSensorsActive forKey:@"initialSensorsActive"];
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
  uint64_t v8 = [v7 serviceClientForIPCService:&unk_26D2B3CE8];

  if (v8)
  {
    v9 = [v8 motionXPCProxyServiceRemoteServer];
    objc_super v10 = [[GCMotionXPCProxyClientEndpoint alloc] initWithIdentifier:self->_identifier initialSensorsActive:self->_initialSensorsActive];
    objc_super v11 = [v5 IPCObjectRegistry];
    [v11 registerIPCObject:v10];

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __68__GCMotionXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_26D22B0F8;
    v13 = v10;
    v23 = v13;
    id v24 = v8;
    dispatch_semaphore_t v25 = v12;
    v14 = v12;
    id v15 = v8;
    [v9 motionXPCProxyServiceClientEndpointConnect:v13 reply:v22];
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
      -[GCMotionXPCProxyClientEndpointDescription materializeWithContext:]();
    }
  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __68__GCMotionXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 motionXPCProxyServiceConnection];
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
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_220998000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
}

@end