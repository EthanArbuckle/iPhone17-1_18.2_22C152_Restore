@interface IOUSBHostCIControllerStateMachine
- (BOOL)enqueueUpdatedFrame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error;
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status frame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error;
- (IOUSBHostCIControllerState)controllerState;
- (IOUSBHostCIControllerStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface error:(NSError *)error;
- (IOUSBHostControllerInterface)controllerInterface;
- (id)description;
- (unint64_t)lastFrameNumber;
- (unint64_t)lastFrameTimestamp;
- (void)setControllerInterface:(id)a3;
- (void)setControllerState:(int)a3;
- (void)setLastFrameNumber:(unint64_t)a3;
- (void)setLastFrameTimestamp:(unint64_t)a3;
@end

@implementation IOUSBHostCIControllerStateMachine

- (IOUSBHostCIControllerStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface error:(NSError *)error
{
  v19[3] = *MEMORY[0x263EF8340];
  v6 = interface;
  v17.receiver = self;
  v17.super_class = (Class)IOUSBHostCIControllerStateMachine;
  v7 = [(IOUSBHostCIControllerStateMachine *)&v17 init];
  v8 = v7;
  if (v7)
  {
    [(IOUSBHostCIControllerStateMachine *)v7 setControllerState:0];
    [(IOUSBHostCIControllerStateMachine *)v8 setControllerInterface:v6];
  }
  else if (error)
  {
    v18[0] = *MEMORY[0x263F08320];
    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 localizedStringForKey:@"Failed to create IOUSBHostCIControllerStateMachine." value:&stru_26DBD82D0 table:0];
    v19[0] = v10;
    v18[1] = *MEMORY[0x263F08338];
    v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 localizedStringForKey:@"init failed." value:&stru_26DBD82D0 table:0];
    v19[1] = v12;
    v18[2] = *MEMORY[0x263F08348];
    v13 = [MEMORY[0x263F086E0] mainBundle];
    v14 = [v13 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v19[2] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v15];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:]();
    }
  }
  return v8;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  if ((a3->control & 0xC000) == 0x8000)
  {
    IOUSBHostCIControllerState v9 = [(IOUSBHostCIControllerStateMachine *)self controllerState];
    if (v9 != IOUSBHostCIControllerStateActive)
    {
      if (v9 == IOUSBHostCIControllerStatePaused)
      {
        switch(a3->control & 0x3F)
        {
          case 0x10u:
          case 0x13u:
          case 0x14u:
            if (!a5) {
              return 0;
            }
            uint64_t v60 = *MEMORY[0x263F08320];
            v32 = [MEMORY[0x263F086E0] mainBundle];
            v33 = [v32 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v63 = v33;
            uint64_t v61 = *MEMORY[0x263F08338];
            v34 = [MEMORY[0x263F086E0] mainBundle];
            v35 = [v34 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
            v64 = v35;
            uint64_t v62 = *MEMORY[0x263F08348];
            v36 = [MEMORY[0x263F086E0] mainBundle];
            v37 = [v36 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v65 = v37;
            v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v16];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            goto LABEL_12;
          case 0x11u:
            if (a4) {
              return 1;
            }
            [(IOUSBHostCIControllerStateMachine *)self setLastFrameNumber:0];
            [(IOUSBHostCIControllerStateMachine *)self setLastFrameTimestamp:0];
            v52 = self;
            uint64_t v53 = 0;
            break;
          case 0x12u:
            if (a4) {
              return 1;
            }
            v52 = self;
            uint64_t v53 = 2;
            break;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v60 = *MEMORY[0x263F08320];
            v46 = [MEMORY[0x263F086E0] mainBundle];
            v47 = [v46 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v63 = v47;
            uint64_t v61 = *MEMORY[0x263F08338];
            v48 = [MEMORY[0x263F086E0] mainBundle];
            v49 = [v48 localizedStringForKey:@"Command is not handled by the controller state machine." value:&stru_26DBD82D0 table:0];
            v64 = v49;
            uint64_t v62 = *MEMORY[0x263F08348];
            v50 = [MEMORY[0x263F086E0] mainBundle];
            v51 = [v50 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v65 = v51;
            v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_45;
            }
            goto LABEL_12;
        }
        [(IOUSBHostCIControllerStateMachine *)v52 setControllerState:v53];
      }
      else
      {
        if (v9) {
          return 0;
        }
        if ((a3->control & 0x3F) - 17 < 4)
        {
          if (a5)
          {
            uint64_t v60 = *MEMORY[0x263F08320];
            v10 = [MEMORY[0x263F086E0] mainBundle];
            v11 = [v10 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v63 = v11;
            uint64_t v61 = *MEMORY[0x263F08338];
            v12 = [MEMORY[0x263F086E0] mainBundle];
            v13 = [v12 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
            v64 = v13;
            uint64_t v62 = *MEMORY[0x263F08348];
            v14 = [MEMORY[0x263F086E0] mainBundle];
            v15 = [v14 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v65 = v15;
            v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v16];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_22:
            }
              -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]();
LABEL_12:

            return 0;
          }
          return 0;
        }
        if ((a3->control & 0x3F) != 0x10)
        {
          if (!a5) {
            return 0;
          }
          uint64_t v60 = *MEMORY[0x263F08320];
          v54 = [MEMORY[0x263F086E0] mainBundle];
          v55 = [v54 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
          v63 = v55;
          uint64_t v61 = *MEMORY[0x263F08338];
          v56 = [MEMORY[0x263F086E0] mainBundle];
          v57 = [v56 localizedStringForKey:@"Command is not handled by the controller state machine." value:&stru_26DBD82D0 table:0];
          v64 = v57;
          uint64_t v62 = *MEMORY[0x263F08348];
          v58 = [MEMORY[0x263F086E0] mainBundle];
          v59 = [v58 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
          v65 = v59;
          v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

          *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_45:
          }
            -[IOUSBHostCIControllerStateMachine processCommand:readonly:error:]();
          goto LABEL_12;
        }
        if (!a4)
        {
          BOOL v23 = 1;
LABEL_32:
          v44 = self;
          uint64_t v45 = 1;
LABEL_33:
          [(IOUSBHostCIControllerStateMachine *)v44 setControllerState:v45];
          return v23;
        }
      }
      return 1;
    }
    uint32_t v25 = (a3->control & 0x3F) - 16;
    BOOL v23 = 1;
    switch(v25)
    {
      case 0u:
      case 2u:
        if (!a5) {
          return 0;
        }
        uint64_t v60 = *MEMORY[0x263F08320];
        v26 = [MEMORY[0x263F086E0] mainBundle];
        v27 = [v26 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v63 = v27;
        uint64_t v61 = *MEMORY[0x263F08338];
        v28 = [MEMORY[0x263F086E0] mainBundle];
        v29 = [v28 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
        v64 = v29;
        uint64_t v62 = *MEMORY[0x263F08348];
        v30 = [MEMORY[0x263F086E0] mainBundle];
        v31 = [v30 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v65 = v31;
        v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v16];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        goto LABEL_12;
      case 1u:
        if (a4) {
          return v23;
        }
        [(IOUSBHostCIControllerStateMachine *)self setLastFrameNumber:0];
        [(IOUSBHostCIControllerStateMachine *)self setLastFrameTimestamp:0];
        v44 = self;
        uint64_t v45 = 0;
        break;
      case 3u:
        if (!a4) {
          goto LABEL_32;
        }
        return v23;
      case 4u:
        return v23;
      default:
        if (!a5) {
          return 0;
        }
        uint64_t v60 = *MEMORY[0x263F08320];
        v38 = [MEMORY[0x263F086E0] mainBundle];
        v39 = [v38 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v63 = v39;
        uint64_t v61 = *MEMORY[0x263F08338];
        v40 = [MEMORY[0x263F086E0] mainBundle];
        v41 = [v40 localizedStringForKey:@"Command is not handled by the controller state machine." value:&stru_26DBD82D0 table:0];
        v64 = v41;
        uint64_t v62 = *MEMORY[0x263F08348];
        v42 = [MEMORY[0x263F086E0] mainBundle];
        v43 = [v42 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v65 = v43;
        v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_45;
        }
        goto LABEL_12;
    }
    goto LABEL_33;
  }
  if (a5)
  {
    uint64_t v60 = *MEMORY[0x263F08320];
    objc_super v17 = [MEMORY[0x263F086E0] mainBundle];
    v18 = [v17 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v63 = v18;
    uint64_t v61 = *MEMORY[0x263F08338];
    v19 = [MEMORY[0x263F086E0] mainBundle];
    v20 = [v19 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
    v64 = v20;
    uint64_t v62 = *MEMORY[0x263F08348];
    v21 = [MEMORY[0x263F086E0] mainBundle];
    v22 = [v21 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v65 = v22;
    v16 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v60 count:3];

    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v16];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5();
    }
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return [(IOUSBHostCIControllerStateMachine *)self processCommand:command readonly:1 error:error];
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint32_t control = command->control;
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status != IOUSBHostCIMessageStatusSuccess)
    {
LABEL_5:
      unint64_t v21 = control & 0x3F | (status << 8) | 0xC000;
      v22 = 0;
      v11 = [(IOUSBHostCIControllerStateMachine *)self controllerInterface];
      char v10 = [v11 enqueueInterrupt:&v21 error:error];

      return v10;
    }
    char v10 = 0;
    if (-[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:"))
    {
      uint32_t control = command->control;
      goto LABEL_5;
    }
  }
  else
  {
    if (error)
    {
      v20[0] = *MEMORY[0x263F08320];
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
      unint64_t v21 = (unint64_t)v13;
      v20[1] = *MEMORY[0x263F08338];
      v14 = [MEMORY[0x263F086E0] mainBundle];
      v15 = [v14 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
      v22 = v15;
      v20[2] = *MEMORY[0x263F08348];
      v16 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      BOOL v23 = v17;
      v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:v20 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
      }
    }
    return 0;
  }
  return v10;
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status frame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint32_t control = command->control;
  if ((command->control & 0xC03F) != 0x8014)
  {
    if (error)
    {
      v24[0] = *MEMORY[0x263F08320];
      v16 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v17 = [v16 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
      unint64_t v25 = (unint64_t)v17;
      v24[1] = *MEMORY[0x263F08338];
      v18 = [MEMORY[0x263F086E0] mainBundle];
      v19 = [v18 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
      v26 = v19;
      v24[2] = *MEMORY[0x263F08348];
      v20 = [MEMORY[0x263F086E0] mainBundle];
      unint64_t v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v27 = v21;
      v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:v24 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v22];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
      }
    }
    return 0;
  }
  if (status != IOUSBHostCIMessageStatusSuccess)
  {
LABEL_6:
    unint64_t v25 = control & 0x3F | (status << 8) | 0xC000;
    v26 = 0;
    v15 = [(IOUSBHostCIControllerStateMachine *)self controllerInterface];
    char v14 = [v15 enqueueInterrupt:&v25 error:error];

    return v14;
  }
  char v14 = 0;
  if (-[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:"))
  {
    if ([(IOUSBHostCIControllerStateMachine *)self enqueueUpdatedFrame:frame timestamp:timestamp error:error])
    {
      uint32_t control = command->control;
      goto LABEL_6;
    }
    return 0;
  }
  return v14;
}

- (BOOL)enqueueUpdatedFrame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(IOUSBHostCIControllerStateMachine *)self controllerState] != IOUSBHostCIControllerStateActive)
  {
    if (error)
    {
      uint64_t v28 = *MEMORY[0x263F08320];
      v16 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v17 = [v16 localizedStringForKey:@"Frame update was not sent." value:&stru_26DBD82D0 table:0];
      unint64_t v25 = v17;
      uint64_t v29 = *MEMORY[0x263F08338];
      v18 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", v17);
      v19 = [v18 localizedStringForKey:@"Frame updates are not meaningful in the current state." value:&stru_26DBD82D0 table:0];
      v26 = v19;
      uint64_t v30 = *MEMORY[0x263F08348];
      v20 = [MEMORY[0x263F086E0] mainBundle];
      unint64_t v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v27 = v21;
      v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v28 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v15];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:]();
      }
      goto LABEL_10;
    }
LABEL_11:
    LOBYTE(v22) = 0;
    return v22;
  }
  if ([(IOUSBHostCIControllerStateMachine *)self lastFrameNumber] > frame
    || [(IOUSBHostCIControllerStateMachine *)self lastFrameTimestamp] > timestamp)
  {
    if (error)
    {
      uint64_t v28 = *MEMORY[0x263F08320];
      IOUSBHostCIControllerState v9 = [MEMORY[0x263F086E0] mainBundle];
      char v10 = [v9 localizedStringForKey:@"Frame update was not sent." value:&stru_26DBD82D0 table:0];
      unint64_t v25 = v10;
      uint64_t v29 = *MEMORY[0x263F08338];
      v11 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", v10);
      v12 = [v11 localizedStringForKey:@"The frame number or timestamp cannot regress." value:&stru_26DBD82D0 table:0];
      v26 = v12;
      uint64_t v30 = *MEMORY[0x263F08348];
      v13 = [MEMORY[0x263F086E0] mainBundle];
      char v14 = [v13 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v27 = v14;
      v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v28 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v15];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:]();
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v24 = [(IOUSBHostCIControllerStateMachine *)self controllerInterface];
  int v22 = [v24 enqueueInterrupts:&v25 count:2 error:error];

  if (v22)
  {
    [(IOUSBHostCIControllerStateMachine *)self setLastFrameNumber:frame];
    [(IOUSBHostCIControllerStateMachine *)self setLastFrameTimestamp:timestamp];
  }
  return v22;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IOUSBHostCIControllerStateMachine *)self controllerInterface];
  v5 = [v4 uuid];
  v6 = [v5 UUIDString];
  v7 = [v3 stringWithFormat:@"Conroller %@ State %s", v6, IOUSBHostCIControllerStateToString(-[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState"))];

  return v7;
}

- (IOUSBHostCIControllerState)controllerState
{
  return self->_controllerState;
}

- (void)setControllerState:(int)a3
{
  self->_controllerState = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (unint64_t)lastFrameNumber
{
  return self->_lastFrameNumber;
}

- (void)setLastFrameNumber:(unint64_t)a3
{
  self->_lastFrameNumber = a3;
}

- (unint64_t)lastFrameTimestamp
{
  return self->_lastFrameTimestamp;
}

- (void)setLastFrameTimestamp:(unint64_t)a3
{
  self->_lastFrameTimestamp = a3;
}

- (void).cxx_destruct
{
}

- (void)processCommand:readonly:error:.cold.1()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command is not handled by the controller state machine." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueUpdatedFrame:timestamp:error:.cold.1()
{
  [@"Frame update was not sent." cStringUsingEncoding:4];
  [@"The frame number or timestamp cannot regress." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueUpdatedFrame:timestamp:error:.cold.2()
{
  [@"Frame update was not sent." cStringUsingEncoding:4];
  [@"Frame updates are not meaningful in the current state." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end