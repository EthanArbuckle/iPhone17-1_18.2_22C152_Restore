@interface GCSystemGestureXPCProxyClientEndpointDescription
+ (BOOL)supportsSecureCoding;
- (GCSystemGestureXPCProxyClientEndpointDescription)init;
- (GCSystemGestureXPCProxyClientEndpointDescription)initWithCoder:(id)a3;
- (GCSystemGestureXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialSystemGesture:(id)a4 isSystemGestureObserver:(BOOL)a5;
- (NSObject)identifier;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSystemGestureXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSystemGestureXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialSystemGesture:(id)a4 isSystemGestureObserver:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GCSystemGestureXPCProxyClientEndpointDescription;
  v10 = [(GCSystemGestureXPCProxyClientEndpointDescription *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copyWithZone:0];
    identifier = v10->_identifier;
    v10->_identifier = v11;

    objc_storeStrong((id *)&v10->_initialSystemGesture, a4);
    v10->_isSystemGestureObserver = a5;
  }

  return v10;
}

- (GCSystemGestureXPCProxyClientEndpointDescription)init
{
  return self;
}

- (GCSystemGestureXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCSystemGestureXPCProxyClientEndpointDescription;
  v5 = [(GCSystemGestureXPCProxyClientEndpointDescription *)&v12 init];
  if (v5)
  {
    v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialSystemGesture"];
    initialSystemGesture = v5->_initialSystemGesture;
    v5->_initialSystemGesture = (GCSystemGesturesState *)v9;

    v5->_isSystemGestureObserver = [v4 decodeBoolForKey:@"_isSystemGestureObserver"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  initialSystemGesture = self->_initialSystemGesture;
  id v5 = a3;
  [v5 encodeObject:initialSystemGesture forKey:@"initialSystemGesture"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeBool:self->_isSystemGestureObserver forKey:@"_isSystemGestureObserver"];
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
  id v8 = [v7 serviceClientForIPCService:&unk_26D2B46D8];

  if (v8)
  {
    uint64_t v9 = [v8 systemGestureXPCProxyServiceRemoteServer];
    v10 = [[GCSystemGestureXPCProxyClientEndpoint alloc] initWithIdentifier:self->_identifier initialSystemGesture:self->_initialSystemGesture isSystemGestureObserver:self->_isSystemGestureObserver];
    uint64_t v11 = [v5 IPCObjectRegistry];
    [v11 registerIPCObject:v10];

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __75__GCSystemGestureXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_26D22CCD0;
    v13 = v10;
    v23 = v13;
    id v24 = v8;
    dispatch_semaphore_t v25 = v12;
    objc_super v14 = v12;
    id v15 = v8;
    [v9 systemGestureXPCProxyServiceClientEndpointConnect:v13 reply:v22];
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
      -[GCSystemGestureXPCProxyClientEndpointDescription materializeWithContext:]();
    }
  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __75__GCSystemGestureXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  v6 = [v4 systemGestureXPCProxyServiceConnection];
  [v3 setRemoteEndpoint:v5 connection:v6];

  uint64_t v7 = a1[6];

  return dispatch_semaphore_signal(v7);
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_materializedObject, 0);

  objc_storeStrong((id *)&self->_initialSystemGesture, 0);
}

- (void)materializeWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1_21();
  OUTLINED_FUNCTION_0_25(&dword_220998000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
}

@end