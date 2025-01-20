@interface IOUSBHostCIPortStateMachine
- (BOOL)connected;
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)overcurrent;
- (BOOL)powered;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 commandResult:(int)a5 error:(id *)a6;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (BOOL)updateLinkState:(const IOUSBHostCILinkState)linkState speed:(const IOUSBHostCIDeviceSpeed)speed inhibitLinkStateChange:(const BOOL)inhibitLinkStateChange error:(NSError *)error;
- (IOUSBHostCIDeviceSpeed)speed;
- (IOUSBHostCILinkState)linkState;
- (IOUSBHostCIPortState)portState;
- (IOUSBHostCIPortStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface portNumber:(NSUInteger)portNumber error:(NSError *)error;
- (IOUSBHostCIPortStatus)portStatus;
- (IOUSBHostControllerInterface)controllerInterface;
- (NSUInteger)portNumber;
- (id)description;
- (void)setConnected:(BOOL)connected;
- (void)setControllerInterface:(id)a3;
- (void)setOvercurrent:(BOOL)overcurrent;
- (void)setPortNumber:(unint64_t)a3;
- (void)setPortState:(int)a3;
- (void)setPortStatus:(unsigned int)a3;
- (void)setPowered:(BOOL)powered;
@end

@implementation IOUSBHostCIPortStateMachine

- (IOUSBHostCIPortStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface portNumber:(NSUInteger)portNumber error:(NSError *)error
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v8 = interface;
  v27.receiver = self;
  v27.super_class = (Class)IOUSBHostCIPortStateMachine;
  v9 = [(IOUSBHostCIPortStateMachine *)&v27 init];
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      uint64_t v28 = *MEMORY[0x263F08320];
      v19 = [MEMORY[0x263F086E0] mainBundle];
      v20 = [v19 localizedStringForKey:@"Failed to create IOUSBHostCIControllerStateMachine." value:&stru_26DBD82D0 table:0];
      v31 = v20;
      uint64_t v29 = *MEMORY[0x263F08338];
      v21 = [MEMORY[0x263F086E0] mainBundle];
      v22 = [v21 localizedStringForKey:@"init failed." value:&stru_26DBD82D0 table:0];
      v32 = v22;
      uint64_t v30 = *MEMORY[0x263F08348];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v33 = v24;
      v25 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v28 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870211 userInfo:v25];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:]();
      }
    }
    goto LABEL_13;
  }
  [(IOUSBHostCIPortStateMachine *)v9 setPortNumber:portNumber];
  if ([(IOUSBHostCIPortStateMachine *)v10 portNumber] < 0x10)
  {
    [(IOUSBHostCIPortStateMachine *)v10 setPortState:0];
    [(IOUSBHostCIPortStateMachine *)v10 setControllerInterface:v8];
LABEL_13:
    v18 = v10;
    goto LABEL_14;
  }
  if (error)
  {
    uint64_t v28 = *MEMORY[0x263F08320];
    v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 localizedStringForKey:@"Failed to create IOUSBHostCIControllerStateMachine." value:&stru_26DBD82D0 table:0];
    v31 = v12;
    uint64_t v29 = *MEMORY[0x263F08338];
    v13 = [MEMORY[0x263F086E0] mainBundle];
    v14 = [v13 localizedStringForKey:@"Port number is too high." value:&stru_26DBD82D0 table:0];
    v32 = v14;
    uint64_t v30 = *MEMORY[0x263F08348];
    v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v33 = v16;
    v17 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v28 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v17];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:]();
    }
  }
  v18 = 0;
LABEL_14:

  return v18;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 commandResult:(int)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  if ((a3->control & 0xC000) != 0x8000
    || [(IOUSBHostCIPortStateMachine *)self portNumber] != (a3->data0 & 0xF))
  {
    if (!a6) {
      return 0;
    }
    uint64_t v49 = *MEMORY[0x263F08320];
    v19 = [MEMORY[0x263F086E0] mainBundle];
    v20 = [v19 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v52 = v20;
    uint64_t v50 = *MEMORY[0x263F08338];
    v21 = [MEMORY[0x263F086E0] mainBundle];
    v22 = [v21 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
    v53 = v22;
    uint64_t v51 = *MEMORY[0x263F08348];
    v23 = [MEMORY[0x263F086E0] mainBundle];
    v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v54 = v24;
    v18 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v49 count:3];

    *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5();
    }
LABEL_11:

    return 0;
  }
  IOUSBHostCIPortState v11 = [(IOUSBHostCIPortStateMachine *)self portState];
  if (v11 - 1 < 3)
  {
    switch(a3->control & 0x3F)
    {
      case 0x18u:
        if (!a6) {
          return 0;
        }
        uint64_t v49 = *MEMORY[0x263F08320];
        v12 = [MEMORY[0x263F086E0] mainBundle];
        v13 = [v12 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v52 = v13;
        uint64_t v50 = *MEMORY[0x263F08338];
        v14 = [MEMORY[0x263F086E0] mainBundle];
        v15 = [v14 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
        v53 = v15;
        uint64_t v51 = *MEMORY[0x263F08348];
        v16 = [MEMORY[0x263F086E0] mainBundle];
        v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v54 = v17;
        v18 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v49 count:3];

        *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        goto LABEL_11;
      case 0x19u:
        if (a4) {
          return 1;
        }
        [(IOUSBHostCIPortStateMachine *)self setPowered:0];
        v39 = self;
        uint64_t v40 = 0;
        goto LABEL_33;
      case 0x1Au:
        IOUSBHostCIPortState v41 = [(IOUSBHostCIPortStateMachine *)self portState];
        BOOL v25 = v41 == IOUSBHostCIPortStateSuspended;
        if (v41 != IOUSBHostCIPortStateSuspended || a4) {
          return v25;
        }
        goto LABEL_32;
      case 0x1Bu:
        IOUSBHostCIPortState v42 = [(IOUSBHostCIPortStateMachine *)self portState];
        BOOL v25 = v42 == IOUSBHostCIPortStateActive;
        if (v42 != IOUSBHostCIPortStateActive || a4) {
          return v25;
        }
        v39 = self;
        uint64_t v40 = 2;
        goto LABEL_33;
      case 0x1Cu:
        if (a4) {
          return 1;
        }
        if (a5 != 1) {
          goto LABEL_35;
        }
LABEL_32:
        v39 = self;
        uint64_t v40 = 3;
LABEL_33:
        [(IOUSBHostCIPortStateMachine *)v39 setPortState:v40];
        return 1;
      case 0x1Du:
        if (a4) {
          return 1;
        }
LABEL_35:
        BOOL v25 = 1;
        goto LABEL_36;
      case 0x1Eu:
        if (!a4) {
          [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] & (~LODWORD(a3->data1) | 0xFFE9FFFF)];
        }
        return 1;
      default:
        if (!a6) {
          return 0;
        }
        uint64_t v49 = *MEMORY[0x263F08320];
        v33 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v34 = [v33 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v52 = v34;
        uint64_t v50 = *MEMORY[0x263F08338];
        v35 = [MEMORY[0x263F086E0] mainBundle];
        v36 = [v35 localizedStringForKey:@"Command is not handled by the port state machine." value:&stru_26DBD82D0 table:0];
        v53 = v36;
        uint64_t v51 = *MEMORY[0x263F08348];
        v37 = [MEMORY[0x263F086E0] mainBundle];
        v38 = [v37 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v54 = v38;
        v18 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v49 count:3];

        *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        goto LABEL_11;
    }
  }
  if (v11) {
    return 0;
  }
  if ((a3->control & 0x3F) - 25 < 6)
  {
    if (!a6) {
      return 0;
    }
    uint64_t v49 = *MEMORY[0x263F08320];
    objc_super v27 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v28 = [v27 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v52 = v28;
    uint64_t v50 = *MEMORY[0x263F08338];
    uint64_t v29 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v30 = [v29 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
    v53 = v30;
    uint64_t v51 = *MEMORY[0x263F08348];
    v31 = [MEMORY[0x263F086E0] mainBundle];
    v32 = [v31 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v54 = v32;
    v18 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v49 count:3];

    *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v18];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_7:
    }
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]();
    goto LABEL_11;
  }
  if ((a3->control & 0x3F) != 0x18)
  {
    if (!a6) {
      return 0;
    }
    uint64_t v49 = *MEMORY[0x263F08320];
    v43 = [MEMORY[0x263F086E0] mainBundle];
    v44 = [v43 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v52 = v44;
    uint64_t v50 = *MEMORY[0x263F08338];
    v45 = [MEMORY[0x263F086E0] mainBundle];
    v46 = [v45 localizedStringForKey:@"Command is not handled by the port state machine." value:&stru_26DBD82D0 table:0];
    v53 = v46;
    uint64_t v51 = *MEMORY[0x263F08348];
    v47 = [MEMORY[0x263F086E0] mainBundle];
    v48 = [v47 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v54 = v48;
    v18 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v49 count:3];

    *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_21:
    }
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]();
    goto LABEL_11;
  }
  if (a4) {
    return 1;
  }
  BOOL v25 = 1;
  [(IOUSBHostCIPortStateMachine *)self setPowered:1];
LABEL_36:
  [(IOUSBHostCIPortStateMachine *)self setPortState:1];
  return v25;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return [(IOUSBHostCIPortStateMachine *)self processCommand:command readonly:1 commandResult:1 error:error];
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status == IOUSBHostCIMessageStatusSuccess)
    {
      if ((command->control & 0x3F) == 0x1C)
      {
        if (([(IOUSBHostCIPortStateMachine *)self portStatus] & 0xF0) != 0)
        {
          if (error)
          {
            uint64_t v25 = *MEMORY[0x263F08320];
            v9 = [MEMORY[0x263F086E0] mainBundle];
            v10 = [v9 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
            uint64_t v28 = v10;
            uint64_t v26 = *MEMORY[0x263F08338];
            IOUSBHostCIPortState v11 = [MEMORY[0x263F086E0] mainBundle];
            v12 = [v11 localizedStringForKey:@"A successful IOUSBHostCIMessageTypePortReset requires a U0 link state." value:&stru_26DBD82D0 table:0];
            unint64_t v29 = (unint64_t)v12;
            uint64_t v27 = *MEMORY[0x263F08348];
            v13 = [MEMORY[0x263F086E0] mainBundle];
            v14 = [v13 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            uint64_t v30 = v14;
            v15 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v25 count:3];

            *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v15];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
            }
LABEL_11:

            return 0;
          }
          return 0;
        }
        char v22 = 0;
        if (![(IOUSBHostCIPortStateMachine *)self processCommand:command readonly:0 commandResult:1 error:error])return v22; {
      }
        }
      else
      {
        char v22 = 0;
        if (![(IOUSBHostCIPortStateMachine *)self processCommand:command readonly:0 commandResult:1 error:error])return v22; {
      }
        }
    }
    LODWORD(v28) = command->control & 0x3F | (status << 8) | 0xC000;
    BYTE4(v28) = [(IOUSBHostCIPortStateMachine *)self portNumber];
    HIDWORD(v28) = BYTE4(v28);
    unint64_t v29 = [(IOUSBHostCIPortStateMachine *)self portStatus];
    v23 = [(IOUSBHostCIPortStateMachine *)self controllerInterface];
    char v22 = [v23 enqueueInterrupt:&v28 error:error];

    return v22;
  }
  if (error)
  {
    uint64_t v25 = *MEMORY[0x263F08320];
    v16 = [MEMORY[0x263F086E0] mainBundle];
    v17 = [v16 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
    uint64_t v28 = v17;
    uint64_t v26 = *MEMORY[0x263F08338];
    v18 = [MEMORY[0x263F086E0] mainBundle];
    v19 = [v18 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
    unint64_t v29 = (unint64_t)v19;
    uint64_t v27 = *MEMORY[0x263F08348];
    v20 = [MEMORY[0x263F086E0] mainBundle];
    v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    uint64_t v30 = v21;
    v15 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v25 count:3];

    *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v15];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
    }
    goto LABEL_11;
  }
  return 0;
}

- (void)setPowered:(BOOL)powered
{
  if ([(IOUSBHostCIPortStateMachine *)self powered] != powered)
  {
    self->_powered = powered;
    if (powered)
    {
      [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | 1];
      [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] & 0xFFFFF80FLL];
      [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | 0x50];
      uint64_t v5 = [(IOUSBHostCIPortStateMachine *)self portStatus];
    }
    else
    {
      uint64_t v5 = 0;
      *(_WORD *)&self->_connected = 0;
    }
    [(IOUSBHostCIPortStateMachine *)self setPortStatus:v5];
  }
}

- (void)setConnected:(BOOL)connected
{
  BOOL v3 = connected;
  if ([(IOUSBHostCIPortStateMachine *)self powered]
    && [(IOUSBHostCIPortStateMachine *)self connected] != v3)
  {
    self->_connected = v3;
    if (v3)
    {
      uint64_t v5 = [(IOUSBHostCIPortStateMachine *)self portStatus] | 4;
      uint64_t v6 = 7;
    }
    else
    {
      [(IOUSBHostCIPortStateMachine *)self setPortState:1];
      uint64_t v5 = [(IOUSBHostCIPortStateMachine *)self portStatus] & 0xFFFFFFFBLL;
      uint64_t v6 = 5;
    }
    [(IOUSBHostCIPortStateMachine *)self setPortStatus:v5];
    [(IOUSBHostCIPortStateMachine *)self updateLinkState:v6 speed:0 inhibitLinkStateChange:1 error:0];
    [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | 0x40000];
    LODWORD(v8[0]) = 49160;
    HIDWORD(v8[0]) = [(IOUSBHostCIPortStateMachine *)self portNumber];
    v8[1] = 0;
    v7 = [(IOUSBHostCIPortStateMachine *)self controllerInterface];
    [v7 enqueueInterrupt:v8 error:0];
  }
}

- (void)setOvercurrent:(BOOL)overcurrent
{
  BOOL v3 = overcurrent;
  if ([(IOUSBHostCIPortStateMachine *)self powered]
    && [(IOUSBHostCIPortStateMachine *)self overcurrent] != v3)
  {
    self->_overcurrent = v3;
    IOUSBHostCIPortStatus v5 = [(IOUSBHostCIPortStateMachine *)self portStatus];
    if (v3)
    {
      [(IOUSBHostCIPortStateMachine *)self setPortStatus:v5 | 2];
    }
    else
    {
      [(IOUSBHostCIPortStateMachine *)self setPortStatus:v5 & 0xFFFFFFFD];
      if ([(IOUSBHostCIPortStateMachine *)self connected])
      {
        uint64_t v6 = 7;
LABEL_9:
        [(IOUSBHostCIPortStateMachine *)self updateLinkState:v6 speed:0 inhibitLinkStateChange:1 error:0];
        [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | 0x20000];
        LODWORD(v8[0]) = 49160;
        HIDWORD(v8[0]) = [(IOUSBHostCIPortStateMachine *)self portNumber];
        v8[1] = 0;
        v7 = [(IOUSBHostCIPortStateMachine *)self controllerInterface];
        [v7 enqueueInterrupt:v8 error:0];

        return;
      }
      [(IOUSBHostCIPortStateMachine *)self setPortState:1];
    }
    uint64_t v6 = 5;
    goto LABEL_9;
  }
}

- (BOOL)updateLinkState:(const IOUSBHostCILinkState)linkState speed:(const IOUSBHostCIDeviceSpeed)speed inhibitLinkStateChange:(const BOOL)inhibitLinkStateChange error:(NSError *)error
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (![(IOUSBHostCIPortStateMachine *)self powered])
  {
    if (error)
    {
      uint64_t v32 = *MEMORY[0x263F08320];
      v19 = [MEMORY[0x263F086E0] mainBundle];
      v20 = [v19 localizedStringForKey:@"Link state cannot be updated." value:&stru_26DBD82D0 table:0];
      v35 = v20;
      uint64_t v33 = *MEMORY[0x263F08338];
      v21 = [MEMORY[0x263F086E0] mainBundle];
      char v22 = [v21 localizedStringForKey:@"Port is not powered." value:&stru_26DBD82D0 table:0];
      v36 = v22;
      uint64_t v34 = *MEMORY[0x263F08348];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v37 = v24;
      v18 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v32 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v18];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:]();
      }
      goto LABEL_10;
    }
    return 0;
  }
  BOOL v11 = IOUSBHostCILinkStateEnabled(linkState);
  if (speed == IOUSBHostCIDeviceSpeedNone && v11)
  {
    if (error)
    {
      uint64_t v32 = *MEMORY[0x263F08320];
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 localizedStringForKey:@"Link state cannot be updated." value:&stru_26DBD82D0 table:0];
      v35 = v13;
      uint64_t v33 = *MEMORY[0x263F08338];
      v14 = [MEMORY[0x263F086E0] mainBundle];
      v15 = [v14 localizedStringForKey:@"Link state is not compatible with speed." value:&stru_26DBD82D0 table:0];
      v36 = v15;
      uint64_t v34 = *MEMORY[0x263F08348];
      v16 = [MEMORY[0x263F086E0] mainBundle];
      v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v37 = v17;
      v18 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v32 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v18];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:]();
      }
LABEL_10:

      return 0;
    }
    return 0;
  }
  IOUSBHostCILinkState v26 = [(IOUSBHostCIPortStateMachine *)self portStatus] >> 4;
  [(IOUSBHostCIPortStateMachine *)self portStatus];
  [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] & 0xFFFFF80FLL];
  [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | (16 * linkState)];
  if (IOUSBHostCILinkStateEnabled(linkState)) {
    IOUSBHostCIDeviceSpeed v27 = speed << 8;
  }
  else {
    IOUSBHostCIDeviceSpeed v27 = IOUSBHostCIDeviceSpeedNone;
  }
  [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | v27];
  int v28 = IOUSBHostCILinkStateEnabled(v26);
  int v29 = IOUSBHostCILinkStateEnabled(linkState);
  if (linkState != IOUSBHostCILinkStateResume && v28 == v29) {
    return 1;
  }
  if (IOUSBHostCILinkStateEnabled(v26) && !IOUSBHostCILinkStateEnabled(linkState)) {
    [(IOUSBHostCIPortStateMachine *)self setPortState:1];
  }
  if (inhibitLinkStateChange) {
    return 1;
  }
  [(IOUSBHostCIPortStateMachine *)self setPortStatus:[(IOUSBHostCIPortStateMachine *)self portStatus] | 0x100000];
  LODWORD(v35) = 49160;
  BYTE4(v35) = [(IOUSBHostCIPortStateMachine *)self portNumber];
  HIDWORD(v35) = BYTE4(v35);
  v36 = 0;
  uint64_t v30 = [(IOUSBHostCIPortStateMachine *)self controllerInterface];
  char v25 = [v30 enqueueInterrupt:&v35 error:error];

  return v25;
}

- (id)description
{
  BOOL v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"Port %d State %s Status 0x%08x", -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber"), IOUSBHostCIPortStateToString(-[IOUSBHostCIPortStateMachine portState](self, "portState")), -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus"));
  if ([(IOUSBHostCIPortStateMachine *)self portStatus])
  {
    objc_msgSend(v3, "appendString:", @" (");
    if ([(IOUSBHostCIPortStateMachine *)self portStatus]) {
      [v3 appendString:@" Powered"];
    }
    if (([(IOUSBHostCIPortStateMachine *)self portStatus] & 2) != 0) {
      [v3 appendString:@" Overcurrent"];
    }
    if (([(IOUSBHostCIPortStateMachine *)self portStatus] & 4) != 0) {
      [v3 appendString:@" Connected"];
    }
    objc_msgSend(v3, "appendFormat:", @" Link State %s", IOUSBHostCILinkStateToString((IOUSBHostCILinkState)(-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 4)));
    if (IOUSBHostCILinkStateEnabled((const IOUSBHostCILinkState)(-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 4)))objc_msgSend(v3, "appendFormat:", @" Device Speed %s", IOUSBHostCIDeviceSpeedToString((IOUSBHostCIDeviceSpeed)((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 8) & 7))); {
    if (([(IOUSBHostCIPortStateMachine *)self portStatus] & 0x20000) != 0)
    }
      [v3 appendString:@" Overcurrent Change"];
    if (([(IOUSBHostCIPortStateMachine *)self portStatus] & 0x40000) != 0) {
      [v3 appendString:@" Connect Change"];
    }
    if (([(IOUSBHostCIPortStateMachine *)self portStatus] & 0x100000) != 0) {
      [v3 appendString:@" Link Change"];
    }
    [v3 appendString:@""]);
  }
  return v3;
}

- (NSUInteger)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unint64_t)a3
{
  self->_portNumber = a3;
}

- (IOUSBHostCIPortState)portState
{
  return self->_portState;
}

- (void)setPortState:(int)a3
{
  self->_portState = a3;
}

- (IOUSBHostCIPortStatus)portStatus
{
  return self->_portStatus;
}

- (void)setPortStatus:(unsigned int)a3
{
  self->_portStatus = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (BOOL)powered
{
  return self->_powered;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)overcurrent
{
  return self->_overcurrent;
}

- (IOUSBHostCILinkState)linkState
{
  return self->_linkState;
}

- (IOUSBHostCIDeviceSpeed)speed
{
  return self->_speed;
}

- (void).cxx_destruct
{
}

- (void)initWithInterface:portNumber:error:.cold.1()
{
  [@"Failed to create IOUSBHostCIControllerStateMachine." cStringUsingEncoding:4];
  [@"init failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)initWithInterface:portNumber:error:.cold.2()
{
  [@"Failed to create IOUSBHostCIControllerStateMachine." cStringUsingEncoding:4];
  [@"Port number is too high." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processCommand:readonly:commandResult:error:.cold.1()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command is not handled by the port state machine." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processCommand:readonly:commandResult:error:.cold.2()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command cannot be processed in the current state." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processCommand:readonly:commandResult:error:.cold.5()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command failed common validation checks." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)respondToCommand:status:error:.cold.1()
{
  [@"Command response was not sent." cStringUsingEncoding:4];
  [@"A successful IOUSBHostCIMessageTypePortReset requires a U0 link state." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)respondToCommand:status:error:.cold.2()
{
  [@"Command response was not sent." cStringUsingEncoding:4];
  [@"Command failed common validation checks." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)updateLinkState:speed:inhibitLinkStateChange:error:.cold.1()
{
  [@"Link state cannot be updated." cStringUsingEncoding:4];
  [@"Link state is not compatible with speed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)updateLinkState:speed:inhibitLinkStateChange:error:.cold.2()
{
  [@"Link state cannot be updated." cStringUsingEncoding:4];
  [@"Port is not powered." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

@end