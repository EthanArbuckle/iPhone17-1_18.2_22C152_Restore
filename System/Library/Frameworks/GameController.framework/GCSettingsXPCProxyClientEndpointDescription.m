@interface GCSettingsXPCProxyClientEndpointDescription
+ (BOOL)supportsSecureCoding;
- (GCSettingsXPCProxyClientEndpointDescription)init;
- (GCSettingsXPCProxyClientEndpointDescription)initWithCoder:(id)a3;
- (GCSettingsXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4;
- (NSObject)identifier;
- (id)materializeWithContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCSettingsXPCProxyClientEndpointDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSettingsXPCProxyClientEndpointDescription)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsXPCProxyClientEndpointDescription;
  v8 = [(GCSettingsXPCProxyClientEndpointDescription *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_initialProfile, a4);
  }

  return v8;
}

- (GCSettingsXPCProxyClientEndpointDescription)init
{
  return self;
}

- (GCSettingsXPCProxyClientEndpointDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsXPCProxyClientEndpointDescription;
  v5 = [(GCSettingsXPCProxyClientEndpointDescription *)&v12 init];
  if (v5)
  {
    id v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_initialProfile"];
    initialProfile = v5->_initialProfile;
    v5->_initialProfile = (GCSProfile *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_initialProfile forKey:@"_initialProfile"];
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
  v8 = [v7 serviceClientForIPCService:&unk_26D2B4558];

  if (v8)
  {
    uint64_t v9 = [v8 settingsXPCProxyServiceRemoteServer];
    v10 = [[GCSettingsXPCProxyClientEndpoint alloc] initWithIdentifier:self->_identifier initialValueForProfile:self->_initialProfile];
    v11 = [v5 IPCObjectRegistry];
    [v11 registerIPCObject:v10];

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __70__GCSettingsXPCProxyClientEndpointDescription_materializeWithContext___block_invoke;
    v22[3] = &unk_26D22C3D0;
    v13 = v10;
    v23 = v13;
    id v24 = v8;
    dispatch_semaphore_t v25 = v12;
    v14 = v12;
    id v15 = v8;
    [v9 settingsXPCProxyServiceClientEndpointConnect:v13 reply:v22];
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
      -[GCSettingsXPCProxyClientEndpointDescription materializeWithContext:]();
    }
  }
  v19 = 0;
LABEL_5:

  return v19;
}

intptr_t __70__GCSettingsXPCProxyClientEndpointDescription_materializeWithContext___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 settingsXPCProxyServiceConnection];
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

  objc_storeStrong((id *)&self->_initialProfile, 0);
}

- (void)materializeWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_0_17(&dword_220998000, v0, v1, "Materialization failure - Service not present: %@", v2, v3, v4, v5, v6);
}

@end