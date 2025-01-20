@interface IOUSBHostCIDeviceStateMachine
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status deviceAddress:(NSUInteger)deviceAddress error:(NSError *)error;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (IOUSBHostCIDeviceState)deviceState;
- (IOUSBHostCIDeviceStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (IOUSBHostControllerInterface)controllerInterface;
- (NSUInteger)completeRoute;
- (NSUInteger)deviceAddress;
- (id)description;
- (void)setCompleteRoute:(unint64_t)a3;
- (void)setControllerInterface:(id)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setDeviceState:(int)a3;
@end

@implementation IOUSBHostCIDeviceStateMachine

- (IOUSBHostCIDeviceStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  v22[3] = *MEMORY[0x263EF8340];
  v8 = interface;
  v20.receiver = self;
  v20.super_class = (Class)IOUSBHostCIDeviceStateMachine;
  v9 = [(IOUSBHostCIDeviceStateMachine *)&v20 init];
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v21[0] = *MEMORY[0x263F08320];
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 localizedStringForKey:@"Failed to create IOUSBHostCIDeviceStateMachine." value:&stru_26DBD82D0 table:0];
      v22[0] = v13;
      v21[1] = *MEMORY[0x263F08338];
      v14 = [MEMORY[0x263F086E0] mainBundle];
      v15 = [v14 localizedStringForKey:@"init failed." value:&stru_26DBD82D0 table:0];
      v22[1] = v15;
      v21[2] = *MEMORY[0x263F08348];
      v16 = [MEMORY[0x263F086E0] mainBundle];
      v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v22[2] = v17;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v18];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIDeviceStateMachine initWithInterface:command:error:]();
      }
    }
    goto LABEL_8;
  }
  [(IOUSBHostCIDeviceStateMachine *)v9 setControllerInterface:v8];
  if ([(IOUSBHostCIDeviceStateMachine *)v10 inspectCommand:command error:error])
  {
LABEL_8:
    v11 = v10;
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  if ((a3->control & 0xC000) != 0x8000)
  {
    if (a5)
    {
      uint64_t v77 = *MEMORY[0x263F08320];
      v19 = [MEMORY[0x263F086E0] mainBundle];
      objc_super v20 = [v19 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
      v80 = v20;
      uint64_t v78 = *MEMORY[0x263F08338];
      v21 = [MEMORY[0x263F086E0] mainBundle];
      v22 = [v21 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
      v81 = v22;
      uint64_t v79 = *MEMORY[0x263F08348];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v82 = v24;
      v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5();
      }
      goto LABEL_50;
    }
    return 0;
  }
  if ([(IOUSBHostCIDeviceStateMachine *)self completeRoute] || (a3->data0 & 0xFFFFFF) == 0)
  {
    if ([(IOUSBHostCIDeviceStateMachine *)self deviceAddress] != LOBYTE(a3->data0))
    {
      if (a5)
      {
        uint64_t v77 = *MEMORY[0x263F08320];
        v25 = [MEMORY[0x263F086E0] mainBundle];
        v26 = [v25 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v80 = v26;
        uint64_t v78 = *MEMORY[0x263F08338];
        v27 = [MEMORY[0x263F086E0] mainBundle];
        v28 = [v27 localizedStringForKey:@"Command does not target this state machine instance." value:&stru_26DBD82D0 table:0];
        v81 = v28;
        uint64_t v79 = *MEMORY[0x263F08348];
        v29 = [MEMORY[0x263F086E0] mainBundle];
        v30 = [v29 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v82 = v30;
        v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:]2();
        }
        goto LABEL_50;
      }
      return 0;
    }
    IOUSBHostCIDeviceState v9 = [(IOUSBHostCIDeviceStateMachine *)self deviceState];
    if (v9)
    {
      if (v9 == IOUSBHostCIDeviceStatePaused)
      {
        uint32_t v43 = (a3->control & 0x3F) - 32;
        BOOL v11 = 1;
        switch(v43)
        {
          case 0u:
          case 3u:
            if (!a5) {
              return 0;
            }
            uint64_t v77 = *MEMORY[0x263F08320];
            v44 = [MEMORY[0x263F086E0] mainBundle];
            v45 = [v44 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v80 = v45;
            uint64_t v78 = *MEMORY[0x263F08338];
            v46 = [MEMORY[0x263F086E0] mainBundle];
            v47 = [v46 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
            v81 = v47;
            uint64_t v79 = *MEMORY[0x263F08348];
            v48 = [MEMORY[0x263F086E0] mainBundle];
            v49 = [v48 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v82 = v49;
            v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            goto LABEL_50;
          case 1u:
LABEL_40:
            if (a4) {
              return v11;
            }
            [(IOUSBHostCIDeviceStateMachine *)self setDeviceAddress:0];
            v62 = self;
            uint64_t v63 = 0;
            break;
          case 2u:
            if (a4) {
              return v11;
            }
            v62 = self;
            uint64_t v63 = 2;
            break;
          case 4u:
            return v11;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v77 = *MEMORY[0x263F08320];
            v70 = [MEMORY[0x263F086E0] mainBundle];
            v71 = [v70 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v80 = v71;
            uint64_t v78 = *MEMORY[0x263F08338];
            v72 = [MEMORY[0x263F086E0] mainBundle];
            v73 = [v72 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_26DBD82D0 table:0];
            v81 = v73;
            uint64_t v79 = *MEMORY[0x263F08348];
            v74 = [MEMORY[0x263F086E0] mainBundle];
            v75 = [v74 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v82 = v75;
            v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_49;
            }
            goto LABEL_50;
        }
      }
      else
      {
        if (v9 != IOUSBHostCIDeviceStateActive) {
          return 0;
        }
        uint32_t v10 = (a3->control & 0x3F) - 32;
        BOOL v11 = 1;
        switch(v10)
        {
          case 0u:
          case 2u:
            if (!a5) {
              return 0;
            }
            uint64_t v77 = *MEMORY[0x263F08320];
            v12 = [MEMORY[0x263F086E0] mainBundle];
            v13 = [v12 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v80 = v13;
            uint64_t v78 = *MEMORY[0x263F08338];
            v14 = [MEMORY[0x263F086E0] mainBundle];
            v15 = [v14 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
            v81 = v15;
            uint64_t v79 = *MEMORY[0x263F08348];
            v16 = [MEMORY[0x263F086E0] mainBundle];
            v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v82 = v17;
            v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_29;
            }
            goto LABEL_50;
          case 1u:
            goto LABEL_40;
          case 3u:
            if (a4) {
              return v11;
            }
            v62 = self;
            uint64_t v63 = 1;
            break;
          case 4u:
            return v11;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v77 = *MEMORY[0x263F08320];
            v64 = [MEMORY[0x263F086E0] mainBundle];
            v65 = [v64 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v80 = v65;
            uint64_t v78 = *MEMORY[0x263F08338];
            v66 = [MEMORY[0x263F086E0] mainBundle];
            v67 = [v66 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_26DBD82D0 table:0];
            v81 = v67;
            uint64_t v79 = *MEMORY[0x263F08348];
            v68 = [MEMORY[0x263F086E0] mainBundle];
            v69 = [v68 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v82 = v69;
            v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_49;
            }
            goto LABEL_50;
        }
      }
      [(IOUSBHostCIDeviceStateMachine *)v62 setDeviceState:v63];
      return v11;
    }
    if ((a3->control & 0x3F) - 32 <= 4)
    {
      if (a5)
      {
        uint64_t v77 = *MEMORY[0x263F08320];
        v37 = [MEMORY[0x263F086E0] mainBundle];
        v38 = [v37 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v80 = v38;
        uint64_t v78 = *MEMORY[0x263F08338];
        v39 = [MEMORY[0x263F086E0] mainBundle];
        v40 = [v39 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
        v81 = v40;
        uint64_t v79 = *MEMORY[0x263F08348];
        v41 = [MEMORY[0x263F086E0] mainBundle];
        v42 = [v41 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v82 = v42;
        v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        goto LABEL_50;
      }
      return 0;
    }
    if (!a5) {
      return 0;
    }
    uint64_t v77 = *MEMORY[0x263F08320];
    v50 = [MEMORY[0x263F086E0] mainBundle];
    v51 = [v50 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v80 = v51;
    uint64_t v78 = *MEMORY[0x263F08338];
    v52 = [MEMORY[0x263F086E0] mainBundle];
    v53 = [v52 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_26DBD82D0 table:0];
    v81 = v53;
    uint64_t v79 = *MEMORY[0x263F08348];
    v54 = [MEMORY[0x263F086E0] mainBundle];
    v55 = [v54 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v82 = v55;
    v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
LABEL_49:
    -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:]();
    goto LABEL_50;
  }
  if ((a3->control & 0x3F) - 33 < 4)
  {
    if (a5)
    {
      uint64_t v77 = *MEMORY[0x263F08320];
      v31 = [MEMORY[0x263F086E0] mainBundle];
      v32 = [v31 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
      v80 = v32;
      uint64_t v78 = *MEMORY[0x263F08338];
      v33 = [MEMORY[0x263F086E0] mainBundle];
      v34 = [v33 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
      v81 = v34;
      uint64_t v79 = *MEMORY[0x263F08348];
      v35 = [MEMORY[0x263F086E0] mainBundle];
      v36 = [v35 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v82 = v36;
      v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_29:
      }
        -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]();
LABEL_50:

      return 0;
    }
    return 0;
  }
  if ((a3->control & 0x3F) != 0x20)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v77 = *MEMORY[0x263F08320];
    v56 = [MEMORY[0x263F086E0] mainBundle];
    v57 = [v56 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v80 = v57;
    uint64_t v78 = *MEMORY[0x263F08338];
    v58 = [MEMORY[0x263F086E0] mainBundle];
    v59 = [v58 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_26DBD82D0 table:0];
    v81 = v59;
    uint64_t v79 = *MEMORY[0x263F08348];
    v60 = [MEMORY[0x263F086E0] mainBundle];
    v61 = [v60 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v82 = v61;
    v18 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v77 count:3];

    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  if (!a4)
  {
    [(IOUSBHostCIDeviceStateMachine *)self setDeviceState:2];
    [(IOUSBHostCIDeviceStateMachine *)self setCompleteRoute:a3->data0 & 0xFFFFFF];
  }
  return 1;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return [(IOUSBHostCIDeviceStateMachine *)self processCommand:command readonly:1 error:error];
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint32_t control = command->control;
  if ((command->control & 0x3F) != 0x20)
  {
    if ((command->control & 0xC000) != 0x8000)
    {
      if (error)
      {
        v21[0] = *MEMORY[0x263F08320];
        v14 = [MEMORY[0x263F086E0] mainBundle];
        v15 = [v14 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
        v22 = v15;
        v21[1] = *MEMORY[0x263F08338];
        v16 = [MEMORY[0x263F086E0] mainBundle];
        v17 = [v16 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
        v23 = v17;
        v21[2] = *MEMORY[0x263F08348];
        v18 = [MEMORY[0x263F086E0] mainBundle];
        v19 = [v18 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v24 = v19;
        objc_super v20 = [NSDictionary dictionaryWithObjects:&v22 forKeys:v21 count:3];

        *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v20];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
        }
      }
      return 0;
    }
    if (status == IOUSBHostCIMessageStatusSuccess)
    {
      char v11 = 0;
      if (![(IOUSBHostCIDeviceStateMachine *)self processCommand:command readonly:0 error:error])return v11; {
      uint32_t control = command->control;
      }
    }
    int data0_low = LOBYTE(command->data0);
    LODWORD(v22) = control & 0x3F | (status << 8) | 0xC000;
    HIDWORD(v22) = data0_low;
    v23 = 0;
    v13 = [(IOUSBHostCIDeviceStateMachine *)self controllerInterface];
    char v11 = [v13 enqueueInterrupt:&v22 error:error];

    return v11;
  }
  return -[IOUSBHostCIDeviceStateMachine respondToCommand:status:deviceAddress:error:](self, "respondToCommand:status:deviceAddress:error:");
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status deviceAddress:(NSUInteger)deviceAddress error:(NSError *)error
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint32_t control = command->control;
  if ((command->control & 0xC03F) == 0x8020)
  {
    if (status == IOUSBHostCIMessageStatusSuccess && deviceAddress - 1 <= 0xFE)
    {
      char v12 = 0;
      if (![(IOUSBHostCIDeviceStateMachine *)self processCommand:command readonly:0 error:error])return v12; {
      [(IOUSBHostCIDeviceStateMachine *)self setDeviceAddress:deviceAddress];
      }
      uint32_t control = command->control;
    }
    uint32_t v13 = command->data0 & 0xFFFFFF;
    LODWORD(v25) = control & 0x3F | (status << 8) | 0xC000;
    HIDWORD(v25) = v13;
    if (status == IOUSBHostCIMessageStatusSuccess) {
      unint64_t v14 = deviceAddress;
    }
    else {
      unint64_t v14 = 0;
    }
    unint64_t v26 = v14;
    v15 = [(IOUSBHostCIDeviceStateMachine *)self controllerInterface];
    char v12 = [v15 enqueueInterrupt:&v25 error:error];
  }
  else
  {
    if (error)
    {
      v24[0] = *MEMORY[0x263F08320];
      v16 = [MEMORY[0x263F086E0] mainBundle];
      v17 = [v16 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
      uint64_t v25 = v17;
      v24[1] = *MEMORY[0x263F08338];
      v18 = [MEMORY[0x263F086E0] mainBundle];
      v19 = [v18 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
      unint64_t v26 = (unint64_t)v19;
      v24[2] = *MEMORY[0x263F08348];
      objc_super v20 = [MEMORY[0x263F086E0] mainBundle];
      v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v27 = v21;
      v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:v24 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v22];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
      }
    }
    return 0;
  }
  return v12;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Device %d State %s", (unsigned __int16)-[IOUSBHostCIDeviceStateMachine deviceAddress](self, "deviceAddress"), IOUSBHostCIDeviceStateToString(-[IOUSBHostCIDeviceStateMachine deviceState](self, "deviceState")));
}

- (IOUSBHostCIDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(int)a3
{
  self->_deviceState = a3;
}

- (NSUInteger)completeRoute
{
  return self->_completeRoute;
}

- (void)setCompleteRoute:(unint64_t)a3
{
  self->_completeRoute = a3;
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithInterface:command:error:.cold.1()
{
  [@"Failed to create IOUSBHostCIDeviceStateMachine." cStringUsingEncoding:4];
  [@"init failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end