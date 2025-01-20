@interface OSLaunchdJobInfo
- (BOOL)removing;
- (NSUUID)instance;
- (OSLaunchdJobExitStatus)lastExitStatus;
- (OSLaunchdJobInfo)initWithState:(int64_t)a3 pid:(int)a4 lastSpawnError:(int)a5 lastExitStatus:(id)a6 additionalPropertiesDict:(id)a7 removing:(BOOL)a8 instance:(id)a9;
- (OS_xpc_object)additionalPropertiesDictionary;
- (id)description;
- (int)lastSpawnError;
- (int)pid;
- (int64_t)state;
@end

@implementation OSLaunchdJobInfo

- (int)pid
{
  return self->_pid;
}

- (id)description
{
  int64_t state = self->_state;
  switch(state)
  {
    case 4:
      v3 = NSString;
      unint64_t lastExitStatus = (unint64_t)self->_lastExitStatus;
      v5 = @"exited, %@";
LABEL_8:
      v6 = v3;
LABEL_10:
      objc_msgSend(v6, "stringWithFormat:", v5, lastExitStatus, pid);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      v7 = NSString;
      unint64_t lastExitStatus = self->_lastSpawnError;
      uint64_t pid = xpc_strerror();
      v5 = @"spawn failed, error=%d: %s";
      v6 = v7;
      goto LABEL_10;
    case 2:
      v3 = NSString;
      v4 = "removing";
      if (!self->_removing) {
        v4 = "running";
      }
      unint64_t lastExitStatus = (unint64_t)v4;
      uint64_t pid = self->_pid;
      v5 = @"%s, pid=%d";
      goto LABEL_8;
  }
  v8 = @"never ran";
LABEL_12:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_additionalPropertiesDictionary, 0);

  objc_storeStrong((id *)&self->_lastExitStatus, 0);
}

- (OSLaunchdJobInfo)initWithState:(int64_t)a3 pid:(int)a4 lastSpawnError:(int)a5 lastExitStatus:(id)a6 additionalPropertiesDict:(id)a7 removing:(BOOL)a8 instance:(id)a9
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  switch(a3)
  {
    case 1:
      if (a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      if (a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      if (v15) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      return result;
    case 2:
      if (!a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.4(&v24, v25);
      }
      if (a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      return result;
    case 3:
      if (a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      if (!a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.6(&v24, v25);
      }
      if (v15) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      return result;
    case 4:
      if (a4) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      if (a5) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:](&v24, v25);
      }
      if (!v15) {
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.9(&v24, v25);
      }
      return result;
    default:
      break;
  }
  v23.receiver = self;
  v23.super_class = (Class)OSLaunchdJobInfo;
  v18 = [(OSLaunchdJobInfo *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_int64_t state = a3;
    v18->_uint64_t pid = a4;
    v18->_lastSpawnError = a5;
    objc_storeStrong((id *)&v18->_lastExitStatus, a6);
    objc_storeStrong((id *)&v19->_additionalPropertiesDictionary, a7);
    v19->_removing = a8;
    objc_storeStrong((id *)&v19->_instance, a9);
    v20 = v19;
  }

  return v19;
}

- (int64_t)state
{
  return self->_state;
}

- (OSLaunchdJobExitStatus)lastExitStatus
{
  return self->_lastExitStatus;
}

- (int)lastSpawnError
{
  return self->_lastSpawnError;
}

- (OS_xpc_object)additionalPropertiesDictionary
{
  return self->_additionalPropertiesDictionary;
}

- (BOOL)removing
{
  return self->_removing;
}

- (NSUUID)instance
{
  return self->_instance;
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.4(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.6(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithState:(void *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.9(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
  _CFXPCCreateXPCObjectFromCFObject();
}

@end