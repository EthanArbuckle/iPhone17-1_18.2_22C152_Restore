@interface LASSProperties4RB
+ (id)_propertiesFromAttrs:(id)a3;
+ (id)propertiesForJob:(id)a3 error:(id *)a4;
+ (id)propertiesForPid:(int)a3 error:(id *)a4;
- (BOOL)enablePressuredExit;
- (BOOL)enableTransactions;
- (BOOL)keepAlive;
- (BOOL)runAtLoad;
- (BOOL)xpcBundle;
- (LASSProperties4RB)initWithLabel:(id)a3 instance:(id)a4 requestedJetsamPriority:(int)a5 additionalProperties:(id)a6 program:(id)a7 processType:(unsigned int)a8 keepAlive:(BOOL)a9 runAtLoad:(BOOL)a10 enableTransactions:(BOOL)a11 endpoints:(id)a12 serviceType:(int64_t)a13 path:(id)a14 xpcBundle:(BOOL)a15 hostPID:(int)a16;
- (NSString)label;
- (NSString)path;
- (NSString)program;
- (NSUUID)instance;
- (OS_xpc_object)additionalProperties;
- (OS_xpc_object)endpoints;
- (int)hostPID;
- (int)requestedJetsamPriority;
- (int64_t)serviceType;
- (unsigned)processType;
@end

@implementation LASSProperties4RB

- (NSString)label
{
  return self->_label;
}

- (BOOL)xpcBundle
{
  return self->_xpcBundle;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSString)program
{
  return self->_program;
}

- (NSString)path
{
  return self->_path;
}

- (NSUUID)instance
{
  return self->_instance;
}

- (OS_xpc_object)additionalProperties
{
  return self->_additionalProperties;
}

- (OS_xpc_object)endpoints
{
  return self->_endpoints;
}

- (int)hostPID
{
  return self->_hostPID;
}

+ (id)propertiesForPid:(int)a3 error:(id *)a4
{
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "pid", a3);
  int v8 = _xpc_service_routine();
  if (v8)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v8 userInfo:0];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v10 = xpc_dictionary_get_value(0, "attrs");
    v9 = [a1 _propertiesFromAttrs:v10];
  }

  return v9;
}

+ (id)_propertiesFromAttrs:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, "label");
  if (!string) {
    +[LASSProperties4RB _propertiesFromAttrs:](&v32, v33);
  }
  v5 = string;
  uuid = (uint8_t *)xpc_dictionary_get_uuid(v3, "instance");
  int64_t int64 = xpc_dictionary_get_int64(v3, "jp-priority");
  uint64_t v8 = xpc_dictionary_get_value(v3, "additional-properties");
  v9 = xpc_dictionary_get_string(v3, "program");
  if (!v9) {
    +[LASSProperties4RB _propertiesFromAttrs:](&v32, v33);
  }
  v10 = v9;
  int64_t v29 = int64;
  v30 = (void *)v8;
  uint64_t int64 = xpc_dictionary_get_uint64(v3, "process-type");
  BOOL v27 = xpc_dictionary_get_BOOL(v3, "keep-alive");
  BOOL v26 = xpc_dictionary_get_BOOL(v3, "run-at-load");
  BOOL v25 = xpc_dictionary_get_BOOL(v3, "enable-transactions");
  empty = xpc_dictionary_get_value(v3, "XPCServiceEndpoints");
  if (!empty) {
    empty = xpc_array_create_empty();
  }
  uint64_t v24 = xpc_dictionary_get_uint64(v3, "service-type");
  v12 = xpc_dictionary_get_string(v3, "path");
  BOOL v13 = xpc_dictionary_get_BOOL(v3, "XPCExtensionXPCBundle");
  int v14 = xpc_dictionary_get_int64(v3, "XPCExtensionHostPID");
  v15 = [LASSProperties4RB alloc];
  v16 = [NSString stringWithUTF8String:v5];
  v31 = uuid;
  if (uuid) {
    uuid = (uint8_t *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
  }
  v17 = [NSString stringWithUTF8String:v10];
  if (v12)
  {
    v18 = [NSString stringWithUTF8String:v12];
    HIDWORD(v23) = v14;
    LOBYTE(v23) = v13;
    BYTE2(v22) = v25;
    BYTE1(v22) = v26;
    LOBYTE(v22) = v27;
    v19 = v30;
    v20 = -[LASSProperties4RB initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:](v15, "initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:", v16, uuid, v29, v30, v17, uint64, v22, empty, v24, v18, v23);
  }
  else
  {
    HIDWORD(v23) = v14;
    LOBYTE(v23) = v13;
    BYTE2(v22) = v25;
    BYTE1(v22) = v26;
    LOBYTE(v22) = v27;
    v19 = v30;
    v20 = -[LASSProperties4RB initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:](v15, "initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:", v16, uuid, v29, v30, v17, uint64, v22, empty, v24, 0, v23);
  }

  if (v31) {

  }
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->_instance, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (LASSProperties4RB)initWithLabel:(id)a3 instance:(id)a4 requestedJetsamPriority:(int)a5 additionalProperties:(id)a6 program:(id)a7 processType:(unsigned int)a8 keepAlive:(BOOL)a9 runAtLoad:(BOOL)a10 enableTransactions:(BOOL)a11 endpoints:(id)a12 serviceType:(int64_t)a13 path:(id)a14 xpcBundle:(BOOL)a15 hostPID:(int)a16
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a6;
  id v32 = a7;
  id v31 = a12;
  id v30 = a14;
  uint64_t v24 = [(LASSProperties4RB *)self init];
  BOOL v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_label, a3);
    objc_storeStrong((id *)&v25->_instance, a4);
    v25->_requestedJetsamPriority = a5;
    objc_storeStrong((id *)&v25->_additionalProperties, a6);
    objc_storeStrong((id *)&v25->_program, a7);
    v25->_processType = a8;
    v25->_keepAlive = a9;
    v25->_runAtLoad = a10;
    v25->_enableTransactions = a11;
    objc_storeStrong((id *)&v25->_endpoints, a12);
    v25->_serviceType = a13;
    objc_storeStrong((id *)&v25->_path, a14);
    v25->_xpcBundle = a15;
    v25->_hostPID = a16;
    BOOL v26 = v25;
  }

  return v25;
}

+ (id)propertiesForJob:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    +[LASSProperties4RB propertiesForJob:error:](&xdict, uuid);
  }
  xpc_object_t v7 = v6;
  uint64_t v8 = [v6 handle];

  if (!v8) {
    +[LASSProperties4RB propertiesForJob:error:](&xdict, uuid);
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  *(void *)uuid = 0;
  *(void *)&uuid[8] = 0;
  v10 = [v7 handle];
  [v10 getUUIDBytes:uuid];

  xpc_dictionary_set_uuid(v9, "job-handle", uuid);
  xpc_object_t xdict = 0;
  int v11 = _launch_job_routine();
  if (v11)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08438], v11, 0, xdict);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    BOOL v13 = xpc_dictionary_get_value(xdict, "attrs");
    v12 = [a1 _propertiesFromAttrs:v13];
  }

  return v12;
}

- (int)requestedJetsamPriority
{
  return self->_requestedJetsamPriority;
}

- (unsigned)processType
{
  return self->_processType;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (BOOL)runAtLoad
{
  return self->_runAtLoad;
}

- (BOOL)enableTransactions
{
  return self->_enableTransactions;
}

- (BOOL)enablePressuredExit
{
  return self->_enablePressuredExit;
}

+ (void)_propertiesFromAttrs:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)_propertiesFromAttrs:(void *)a1 .cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)propertiesForJob:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)propertiesForJob:(void *)a1 error:(_OWORD *)a2 .cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

@end