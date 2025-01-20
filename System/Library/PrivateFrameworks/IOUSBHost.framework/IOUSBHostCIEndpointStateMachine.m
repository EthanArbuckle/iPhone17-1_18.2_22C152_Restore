@interface IOUSBHostCIEndpointStateMachine
- (BOOL)enqueueTransferCompletionForMessage:(const IOUSBHostCIMessage *)message status:(IOUSBHostCIMessageStatus)status transferLength:(NSUInteger)transferLength error:(NSError *)error;
- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5;
- (BOOL)processDoorbell:(const IOUSBHostCIDoorbell)doorbell error:(NSError *)error;
- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error;
- (IOUSBHostCIEndpointState)endpointState;
- (IOUSBHostCIEndpointStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error;
- (IOUSBHostControllerInterface)controllerInterface;
- (NSUInteger)deviceAddress;
- (NSUInteger)endpointAddress;
- (const)currentTransferMessage;
- (id)description;
- (int)endpointType;
- (void)setControllerInterface:(id)a3;
- (void)setCurrentTransferMessage:(const IOUSBHostCIMessage *)a3;
- (void)setDeviceAddress:(unint64_t)a3;
- (void)setEndpointAddress:(unint64_t)a3;
- (void)setEndpointState:(int)a3;
- (void)setEndpointType:(int)a3;
@end

@implementation IOUSBHostCIEndpointStateMachine

- (IOUSBHostCIEndpointStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  v22[3] = *MEMORY[0x263EF8340];
  v8 = interface;
  v20.receiver = self;
  v20.super_class = (Class)IOUSBHostCIEndpointStateMachine;
  v9 = [(IOUSBHostCIEndpointStateMachine *)&v20 init];
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v21[0] = *MEMORY[0x263F08320];
      v12 = [MEMORY[0x263F086E0] mainBundle];
      v13 = [v12 localizedStringForKey:@"Failed to create IOUSBHostCIEndpointStateMachine." value:&stru_26DBD82D0 table:0];
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
        -[IOUSBHostCIEndpointStateMachine initWithInterface:command:error:]();
      }
    }
    goto LABEL_8;
  }
  [(IOUSBHostCIEndpointStateMachine *)v9 setControllerInterface:v8];
  if ([(IOUSBHostCIEndpointStateMachine *)v10 inspectCommand:command error:error])
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
  uint64_t v97 = *MEMORY[0x263EF8340];
  if ((a3->control & 0xC000) != 0x8000 || !LOBYTE(a3->data0))
  {
    if (!a5) {
      return 0;
    }
    uint64_t v91 = *MEMORY[0x263F08320];
    v16 = [MEMORY[0x263F086E0] mainBundle];
    v17 = [v16 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v94 = v17;
    uint64_t v92 = *MEMORY[0x263F08338];
    v18 = [MEMORY[0x263F086E0] mainBundle];
    v19 = [v18 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
    v95 = v19;
    uint64_t v93 = *MEMORY[0x263F08348];
    objc_super v20 = [MEMORY[0x263F086E0] mainBundle];
    v21 = [v20 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v96 = v21;
    v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v15];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5();
    }
    goto LABEL_15;
  }
  if ([(IOUSBHostCIEndpointStateMachine *)self deviceAddress])
  {
    if ([(IOUSBHostCIEndpointStateMachine *)self deviceAddress] != LOBYTE(a3->data0)
      || [(IOUSBHostCIEndpointStateMachine *)self endpointAddress] != BYTE1(a3->data0))
    {
      if (!a5) {
        return 0;
      }
      uint64_t v91 = *MEMORY[0x263F08320];
      v23 = [MEMORY[0x263F086E0] mainBundle];
      v24 = [v23 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
      v94 = v24;
      uint64_t v92 = *MEMORY[0x263F08338];
      v25 = [MEMORY[0x263F086E0] mainBundle];
      v26 = [v25 localizedStringForKey:@"Command does not target this state machine instance." value:&stru_26DBD82D0 table:0];
      v95 = v26;
      uint64_t v93 = *MEMORY[0x263F08348];
      v27 = [MEMORY[0x263F086E0] mainBundle];
      v28 = [v27 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v96 = v28;
      v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:]2();
      }
      goto LABEL_15;
    }
    switch([(IOUSBHostCIEndpointStateMachine *)self endpointState])
    {
      case IOUSBHostCIEndpointStateDestroyed:
        if ((a3->control & 0x3F) <= 0x2E && ((1 << (a3->control & 0x3F)) & 0x7B0000000000) != 0)
        {
          if (!a5) {
            return 0;
          }
          uint64_t v91 = *MEMORY[0x263F08320];
          v9 = [MEMORY[0x263F086E0] mainBundle];
          v10 = [v9 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
          v94 = v10;
          uint64_t v92 = *MEMORY[0x263F08338];
          v11 = [MEMORY[0x263F086E0] mainBundle];
          v12 = [v11 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
          v95 = v12;
          uint64_t v93 = *MEMORY[0x263F08348];
          v13 = [MEMORY[0x263F086E0] mainBundle];
          v14 = [v13 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
          v96 = v14;
          v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

          *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          goto LABEL_47;
        }
        if (!a5) {
          return 0;
        }
        uint64_t v91 = *MEMORY[0x263F08320];
        v65 = [MEMORY[0x263F086E0] mainBundle];
        v66 = [v65 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v94 = v66;
        uint64_t v92 = *MEMORY[0x263F08338];
        v67 = [MEMORY[0x263F086E0] mainBundle];
        v68 = [v67 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_26DBD82D0 table:0];
        v95 = v68;
        uint64_t v93 = *MEMORY[0x263F08348];
        v69 = [MEMORY[0x263F086E0] mainBundle];
        v70 = [v69 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v96 = v70;
        v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        goto LABEL_74;
      case IOUSBHostCIEndpointStateHalted:
        uint64_t v44 = a3->control & 0x3F;
        if ((a3->control & 0x3F) > 0x2E) {
          goto LABEL_72;
        }
        if (((1 << v44) & 0x590000000000) == 0)
        {
          if (v44 == 41)
          {
LABEL_52:
            if (a4) {
              return 1;
            }
LABEL_58:
            v63 = self;
            uint64_t v64 = 0;
          }
          else
          {
            if (v44 != 45)
            {
LABEL_72:
              if (!a5) {
                return 0;
              }
              uint64_t v91 = *MEMORY[0x263F08320];
              v85 = [MEMORY[0x263F086E0] mainBundle];
              v86 = [v85 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
              v94 = v86;
              uint64_t v92 = *MEMORY[0x263F08338];
              v87 = [MEMORY[0x263F086E0] mainBundle];
              v88 = [v87 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_26DBD82D0 table:0];
              v95 = v88;
              uint64_t v93 = *MEMORY[0x263F08348];
              v89 = [MEMORY[0x263F086E0] mainBundle];
              v90 = [v89 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
              v96 = v90;
              v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

              *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_74:
              }
                -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.4();
              goto LABEL_15;
            }
            if (a4) {
              return 1;
            }
            v63 = self;
            uint64_t v64 = 2;
          }
          [(IOUSBHostCIEndpointStateMachine *)v63 setEndpointState:v64];
          v71 = self;
          data1 = 0;
LABEL_60:
          [(IOUSBHostCIEndpointStateMachine *)v71 setCurrentTransferMessage:data1];
          return 1;
        }
        if (!a5) {
          return 0;
        }
        uint64_t v91 = *MEMORY[0x263F08320];
        v45 = [MEMORY[0x263F086E0] mainBundle];
        v46 = [v45 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
        v94 = v46;
        uint64_t v92 = *MEMORY[0x263F08338];
        v47 = [MEMORY[0x263F086E0] mainBundle];
        v48 = [v47 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
        v95 = v48;
        uint64_t v93 = *MEMORY[0x263F08348];
        v49 = [MEMORY[0x263F086E0] mainBundle];
        v50 = [v49 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
        v96 = v50;
        v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

        *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_47;
        }
        goto LABEL_15;
      case IOUSBHostCIEndpointStatePaused:
        BOOL result = 1;
        switch(a3->control & 0x3F)
        {
          case '(':
          case '-':
            if (!a5) {
              return 0;
            }
            uint64_t v91 = *MEMORY[0x263F08320];
            v51 = [MEMORY[0x263F086E0] mainBundle];
            v52 = [v51 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v94 = v52;
            uint64_t v92 = *MEMORY[0x263F08338];
            v53 = [MEMORY[0x263F086E0] mainBundle];
            v54 = [v53 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
            v95 = v54;
            uint64_t v93 = *MEMORY[0x263F08348];
            v55 = [MEMORY[0x263F086E0] mainBundle];
            v56 = [v55 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v96 = v56;
            v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_47;
            }
            goto LABEL_15;
          case ')':
            if (!a4) {
              goto LABEL_58;
            }
            return result;
          case '+':
          case ',':
            return result;
          case '.':
            if (a4) {
              return result;
            }
            data1 = a3->data1;
            v71 = self;
            break;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v91 = *MEMORY[0x263F08320];
            v73 = [MEMORY[0x263F086E0] mainBundle];
            v74 = [v73 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v94 = v74;
            uint64_t v92 = *MEMORY[0x263F08338];
            v75 = [MEMORY[0x263F086E0] mainBundle];
            v76 = [v75 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_26DBD82D0 table:0];
            v95 = v76;
            uint64_t v93 = *MEMORY[0x263F08348];
            v77 = [MEMORY[0x263F086E0] mainBundle];
            v78 = [v77 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v96 = v78;
            v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_74;
            }
            goto LABEL_15;
        }
        goto LABEL_60;
      case IOUSBHostCIEndpointStateActive:
        switch(a3->control & 0x3F)
        {
          case '(':
          case ',':
          case '-':
          case '.':
            if (!a5) {
              return 0;
            }
            uint64_t v91 = *MEMORY[0x263F08320];
            v57 = [MEMORY[0x263F086E0] mainBundle];
            v58 = [v57 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v94 = v58;
            uint64_t v92 = *MEMORY[0x263F08338];
            v59 = [MEMORY[0x263F086E0] mainBundle];
            v60 = [v59 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
            v95 = v60;
            uint64_t v93 = *MEMORY[0x263F08348];
            v61 = [MEMORY[0x263F086E0] mainBundle];
            v62 = [v61 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v96 = v62;
            v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_47;
            }
            goto LABEL_15;
          case ')':
            goto LABEL_52;
          case '+':
            if (!a4) {
              [(IOUSBHostCIEndpointStateMachine *)self setEndpointState:2];
            }
            return 1;
          default:
            if (!a5) {
              return 0;
            }
            uint64_t v91 = *MEMORY[0x263F08320];
            v79 = [MEMORY[0x263F086E0] mainBundle];
            v80 = [v79 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
            v94 = v80;
            uint64_t v92 = *MEMORY[0x263F08338];
            v81 = [MEMORY[0x263F086E0] mainBundle];
            v82 = [v81 localizedStringForKey:@"Command is not handled by the endpoint state machine." value:&stru_26DBD82D0 table:0];
            v95 = v82;
            uint64_t v93 = *MEMORY[0x263F08348];
            v83 = [MEMORY[0x263F086E0] mainBundle];
            v84 = [v83 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v96 = v84;
            v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

            *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_74;
            }
            goto LABEL_15;
        }
      default:
        return 0;
    }
  }
  uint32_t v29 = a3->control & 0x3F;
  if (v29 - 43 < 4 || v29 == 41)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v91 = *MEMORY[0x263F08320];
    v32 = [MEMORY[0x263F086E0] mainBundle];
    v33 = [v32 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v94 = v33;
    uint64_t v92 = *MEMORY[0x263F08338];
    v34 = [MEMORY[0x263F086E0] mainBundle];
    v35 = [v34 localizedStringForKey:@"Command cannot be processed in the current state." value:&stru_26DBD82D0 table:0];
    v95 = v35;
    uint64_t v93 = *MEMORY[0x263F08348];
    v36 = [MEMORY[0x263F086E0] mainBundle];
    v37 = [v36 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v96 = v37;
    v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
LABEL_47:
    -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:]();
LABEL_15:

    return 0;
  }
  if (v29 != 40)
  {
    if (!a5) {
      return 0;
    }
    uint64_t v91 = *MEMORY[0x263F08320];
    v38 = [MEMORY[0x263F086E0] mainBundle];
    v39 = [v38 localizedStringForKey:@"Command cannot be processed successfully." value:&stru_26DBD82D0 table:0];
    v94 = v39;
    uint64_t v92 = *MEMORY[0x263F08338];
    v40 = [MEMORY[0x263F086E0] mainBundle];
    v41 = [v40 localizedStringForKey:@"Command is not handled by the device state machine." value:&stru_26DBD82D0 table:0];
    v95 = v41;
    uint64_t v93 = *MEMORY[0x263F08348];
    v42 = [MEMORY[0x263F086E0] mainBundle];
    v43 = [v42 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
    v96 = v43;
    v15 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v91 count:3];

    *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v15];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:]();
    }
    goto LABEL_15;
  }
  if (!a4)
  {
    [(IOUSBHostCIEndpointStateMachine *)self setEndpointState:2];
    [(IOUSBHostCIEndpointStateMachine *)self setDeviceAddress:LOBYTE(a3->data0)];
    [(IOUSBHostCIEndpointStateMachine *)self setEndpointAddress:BYTE1(a3->data0)];
    DescriptorWithType = (const IOUSBEndpointDescriptor *)a3->data1;
    int bDescriptorType = DescriptorWithType->bDescriptorType;
    if (bDescriptorType == 5
      || bDescriptorType == 2
      && (DescriptorWithType = (const IOUSBEndpointDescriptor *)IOUSBGetNextDescriptorWithType((const IOUSBConfigurationDescriptor *)DescriptorWithType, 0, 5u)) != 0)
    {
      [(IOUSBHostCIEndpointStateMachine *)self setEndpointType:IOUSBGetEndpointType(DescriptorWithType)];
    }
  }
  return 1;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return [(IOUSBHostCIEndpointStateMachine *)self processCommand:command readonly:1 error:error];
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint32_t control = command->control;
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status != IOUSBHostCIMessageStatusSuccess)
    {
LABEL_5:
      int data0_low = LOWORD(command->data0);
      LODWORD(v22) = control & 0x3F | (status << 8) | 0xC000;
      HIDWORD(v22) = data0_low;
      v23 = 0;
      v12 = [(IOUSBHostCIEndpointStateMachine *)self controllerInterface];
      char v10 = [v12 enqueueInterrupt:&v22 error:error];

      return v10;
    }
    char v10 = 0;
    if ([(IOUSBHostCIEndpointStateMachine *)self processCommand:command readonly:0 error:error])
    {
      uint32_t control = command->control;
      goto LABEL_5;
    }
  }
  else
  {
    if (error)
    {
      v21[0] = *MEMORY[0x263F08320];
      v13 = [MEMORY[0x263F086E0] mainBundle];
      v14 = [v13 localizedStringForKey:@"Command response was not sent." value:&stru_26DBD82D0 table:0];
      v22 = v14;
      v21[1] = *MEMORY[0x263F08338];
      v15 = [MEMORY[0x263F086E0] mainBundle];
      v16 = [v15 localizedStringForKey:@"Command failed common validation checks." value:&stru_26DBD82D0 table:0];
      v23 = v16;
      v21[2] = *MEMORY[0x263F08348];
      v17 = [MEMORY[0x263F086E0] mainBundle];
      v18 = [v17 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v24 = v18;
      v19 = [NSDictionary dictionaryWithObjects:&v22 forKeys:v21 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v19];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:]();
      }
    }
    return 0;
  }
  return v10;
}

- (BOOL)processDoorbell:(const IOUSBHostCIDoorbell)doorbell error:(NSError *)error
{
  uint64_t v5 = *(void *)&doorbell;
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v7 = doorbell;
  NSUInteger v8 = [(IOUSBHostCIEndpointStateMachine *)self deviceAddress];
  NSUInteger v9 = v8 | ([(IOUSBHostCIEndpointStateMachine *)self endpointAddress] << 8);
  if (v9 == v5)
  {
    if ([(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage]
      && ([(IOUSBHostCIEndpointStateMachine *)self endpointState] == IOUSBHostCIEndpointStatePaused
       || [(IOUSBHostCIEndpointStateMachine *)self endpointState] == IOUSBHostCIEndpointStateActive))
    {
      while (((_BYTE)[(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage][1] & 0x80) != 0
           && ((_BYTE)[(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage][1] & 0x40) != 0
           && (*(_DWORD *)[(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage] & 0x3F) == 0x3C)
      {
        if (!(void)[(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage][8])
        {
          if (error)
          {
            uint64_t v27 = v7;
            uint64_t v28 = *MEMORY[0x263F08320];
            v18 = [MEMORY[0x263F086E0] mainBundle];
            v19 = [v18 localizedStringForKey:@"Rejected doorbell." value:&stru_26DBD82D0 table:0];
            v31 = v19;
            uint64_t v29 = *MEMORY[0x263F08338];
            objc_super v20 = [MEMORY[0x263F086E0] mainBundle];
            v21 = [v20 localizedStringForKey:@"Found a link to an invalid transfer structure address." value:&stru_26DBD82D0 table:0];
            v32 = v21;
            uint64_t v30 = *MEMORY[0x263F08348];
            v22 = [MEMORY[0x263F086E0] mainBundle];
            v23 = [v22 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v33 = v23;
            v24 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v28 count:3];

            *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v24];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[IOUSBHostCIEndpointStateMachine processDoorbell:error:]();
            }

            uint64_t v7 = v27;
          }
          break;
        }
        -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](self, "setCurrentTransferMessage:");
      }
      [(IOUSBHostCIEndpointStateMachine *)self setEndpointState:3];
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"0x%08x does not target this endpoint.", v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      uint64_t v26 = v7;
      uint64_t v28 = *MEMORY[0x263F08320];
      v11 = [MEMORY[0x263F086E0] mainBundle];
      v12 = [v11 localizedStringForKey:@"Rejected doorbell." value:&stru_26DBD82D0 table:0];
      v31 = v12;
      uint64_t v29 = *MEMORY[0x263F08338];
      v13 = [MEMORY[0x263F086E0] mainBundle];
      v14 = [v13 localizedStringForKey:v10 value:&stru_26DBD82D0 table:0];
      v32 = v14;
      uint64_t v30 = *MEMORY[0x263F08348];
      v15 = [MEMORY[0x263F086E0] mainBundle];
      v16 = [v15 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v33 = v16;
      v17 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v28 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v17];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIEndpointStateMachine processDoorbell:error:](v10);
      }

      uint64_t v7 = v26;
    }
  }
  return v9 == v7;
}

- (BOOL)enqueueTransferCompletionForMessage:(const IOUSBHostCIMessage *)message status:(IOUSBHostCIMessageStatus)status transferLength:(NSUInteger)transferLength error:(NSError *)error
{
  id v10 = self;
  uint64_t v64 = *MEMORY[0x263EF8340];
  while ([(IOUSBHostCIEndpointStateMachine *)self endpointState] == IOUSBHostCIEndpointStateActive
       && [(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage]
       && ((_BYTE)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][1] & 0x80) != 0
       && ((_BYTE)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][1] & 0x40) != 0)
  {
    int v11 = *(_DWORD *)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage] & 0x3F;
    uint64_t v12 = [(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage];
    if (v11 == 60)
    {
      uint64_t v13 = *(void *)(v12 + 8);
      if (!v13)
      {
        if (error)
        {
          uint64_t v58 = *MEMORY[0x263F08320];
          v55 = [MEMORY[0x263F086E0] mainBundle];
          v54 = [v55 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_26DBD82D0 table:0];
          v61 = v54;
          uint64_t v59 = *MEMORY[0x263F08338];
          v14 = [MEMORY[0x263F086E0] mainBundle];
          v15 = [v14 localizedStringForKey:@"Found a link to an invalid transfer structure address." value:&stru_26DBD82D0 table:0];
          v62 = v15;
          uint64_t v60 = *MEMORY[0x263F08348];
          v16 = [MEMORY[0x263F086E0] mainBundle];
          v17 = [v16 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
          v63 = v17;
          v18 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v58 count:3];

          *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v18];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:]();
          }
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = v12 + 16;
    }
    [(IOUSBHostCIEndpointStateMachine *)v10 setCurrentTransferMessage:v13];
    self = v10;
  }
  if ([(IOUSBHostCIEndpointStateMachine *)v10 endpointState] != IOUSBHostCIEndpointStateActive)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"The current endpoint state %s cannot generate transfer completions.", IOUSBHostCIEndpointStateToString(-[IOUSBHostCIEndpointStateMachine endpointState](v10, "endpointState")));
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      uint64_t v58 = *MEMORY[0x263F08320];
      uint64_t v27 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v28 = [v27 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_26DBD82D0 table:0];
      v61 = v28;
      uint64_t v59 = *MEMORY[0x263F08338];
      uint64_t v29 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v30 = [v29 localizedStringForKey:v19 value:&stru_26DBD82D0 table:0];
      v62 = v30;
      uint64_t v60 = *MEMORY[0x263F08348];
      v31 = [MEMORY[0x263F086E0] mainBundle];
      v32 = [v31 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v63 = v32;
      uint64_t v26 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v58 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870174 userInfo:v26];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_22:
      }
        -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:](v19);
LABEL_23:
    }
LABEL_24:

    return 0;
  }
  if ([(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage] != message)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"The specified message %p does not match the current transfer %p.", message, -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage"));
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      uint64_t v58 = *MEMORY[0x263F08320];
      objc_super v20 = [MEMORY[0x263F086E0] mainBundle];
      v21 = [v20 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_26DBD82D0 table:0];
      v61 = v21;
      uint64_t v59 = *MEMORY[0x263F08338];
      v22 = [MEMORY[0x263F086E0] mainBundle];
      v23 = [v22 localizedStringForKey:v19 value:&stru_26DBD82D0 table:0];
      v62 = v23;
      uint64_t v60 = *MEMORY[0x263F08348];
      v24 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v25 = [v24 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v63 = v25;
      uint64_t v26 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v58 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870206 userInfo:v26];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (![(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage]
    || ((_BYTE)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][1] & 0x80) == 0
    || ((_BYTE)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][1] & 0x40) != 0)
  {
    if (error)
    {
      uint64_t v58 = *MEMORY[0x263F08320];
      v35 = [MEMORY[0x263F086E0] mainBundle];
      v36 = [v35 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_26DBD82D0 table:0];
      v61 = v36;
      uint64_t v59 = *MEMORY[0x263F08338];
      v37 = [MEMORY[0x263F086E0] mainBundle];
      v38 = [v37 localizedStringForKey:@"The current transfer cannot generate a transfer completion." value:&stru_26DBD82D0 table:0];
      v62 = v38;
      uint64_t v60 = *MEMORY[0x263F08348];
      v39 = [MEMORY[0x263F086E0] mainBundle];
      v40 = [v39 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
      v63 = v40;
      v41 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v58 count:3];

      *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870184 userInfo:v41];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:]();
      }
    }
    return 0;
  }
  if ((*(_DWORD *)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage] & 0x3D | 2) == 0x3B) {
    NSUInteger v34 = v10->_currentTransferMessage->data0 & 0xFFFFFFF;
  }
  else {
    NSUInteger v34 = 0;
  }
  if (v34 >= transferLength) {
    int v42 = transferLength;
  }
  else {
    int v42 = v34;
  }
  if (v34 < transferLength && status == IOUSBHostCIMessageStatusSuccess) {
    IOUSBHostCIMessageStatus v44 = IOUSBHostCIMessageStatusOverrunError;
  }
  else {
    IOUSBHostCIMessageStatus v44 = status;
  }
  int v45 = [(IOUSBHostCIEndpointStateMachine *)v10 deviceAddress];
  v56[0] = (v44 << 8) | (v45 << 16) | ([(IOUSBHostCIEndpointStateMachine *)v10 endpointAddress] << 24) | 0xC03D;
  v56[1] = v42;
  uint64_t v57 = [(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage];
  if (v44 != IOUSBHostCIMessageStatusEndpointStopped)
  {
    if (v44 == IOUSBHostCIMessageStatusSuccess)
    {
      uint64_t v46 = (uint64_t)([(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage] + 16);
      while (1)
      {
        [(IOUSBHostCIEndpointStateMachine *)v10 setCurrentTransferMessage:v46];
        if (((_BYTE)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][1] & 0x80) == 0
          || ((_BYTE)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][1] & 0x40) == 0
          || (*(_DWORD *)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage] & 0x3F) != 0x3C)
        {
          break;
        }
        uint64_t v46 = (uint64_t)[(IOUSBHostCIEndpointStateMachine *)v10 currentTransferMessage][8];
        if (!v46)
        {
          if (error)
          {
            uint64_t v58 = *MEMORY[0x263F08320];
            v47 = [MEMORY[0x263F086E0] mainBundle];
            v48 = [v47 localizedStringForKey:@"Transfer completion message was not sent." value:&stru_26DBD82D0 table:0];
            v61 = v48;
            uint64_t v59 = *MEMORY[0x263F08338];
            v49 = [MEMORY[0x263F086E0] mainBundle];
            v50 = [v49 localizedStringForKey:@"Found a link to an invalid transfer structure address." value:&stru_26DBD82D0 table:0];
            v62 = v50;
            uint64_t v60 = *MEMORY[0x263F08348];
            v51 = [MEMORY[0x263F086E0] mainBundle];
            v52 = [v51 localizedStringForKey:0 value:&stru_26DBD82D0 table:0];
            v63 = v52;
            v53 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v58 count:3];

            *error = [MEMORY[0x263F087E8] errorWithDomain:@"IOUSBHostErrorDomain" code:-536870199 userInfo:v53];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:]();
            }
          }
          return [(IOUSBHostControllerInterface *)v10->_controllerInterface enqueueInterrupt:v56 error:error];
        }
      }
    }
    else
    {
      if ([(IOUSBHostCIEndpointStateMachine *)v10 endpointType] != 1) {
        [(IOUSBHostCIEndpointStateMachine *)v10 setEndpointState:1];
      }
      [(IOUSBHostCIEndpointStateMachine *)v10 setCurrentTransferMessage:0];
    }
  }
  return [(IOUSBHostControllerInterface *)v10->_controllerInterface enqueueInterrupt:v56 error:error];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (unsigned __int16)[(IOUSBHostCIEndpointStateMachine *)self deviceAddress];
  uint64_t v5 = [(IOUSBHostCIEndpointStateMachine *)self endpointAddress];
  v6 = IOUSBHostCIEndpointStateToString([(IOUSBHostCIEndpointStateMachine *)self endpointState]);
  uint64_t v7 = [(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage];
  if ([(IOUSBHostCIEndpointStateMachine *)self currentTransferMessage])
  {
    NSUInteger v8 = [(IOUSBHostCIEndpointStateMachine *)self controllerInterface];
    NSUInteger v9 = objc_msgSend(v8, "descriptionForMessage:", -[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage"));
    id v10 = [v3 stringWithFormat:@"Device %d Endpoint 0x%02x State %s Current Transfer %p(%@)", v4, v5, v6, v7, v9];
  }
  else
  {
    id v10 = [v3 stringWithFormat:@"Device %d Endpoint 0x%02x State %s Current Transfer %p(%@)", v4, v5, v6, v7, @"None"];
  }
  return v10;
}

- (IOUSBHostCIEndpointState)endpointState
{
  return self->_endpointState;
}

- (void)setEndpointState:(int)a3
{
  self->_endpointState = a3;
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (NSUInteger)endpointAddress
{
  return self->_endpointAddress;
}

- (void)setEndpointAddress:(unint64_t)a3
{
  self->_endpointAddress = a3;
}

- (const)currentTransferMessage
{
  return self->_currentTransferMessage;
}

- (void)setCurrentTransferMessage:(const IOUSBHostCIMessage *)a3
{
  self->_currentTransferMessage = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithInterface:command:error:.cold.1()
{
  [@"Failed to create IOUSBHostCIEndpointStateMachine." cStringUsingEncoding:4];
  [@"init failed." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processCommand:readonly:error:.cold.2()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command is not handled by the device state machine." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processCommand:readonly:error:.cold.4()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command is not handled by the endpoint state machine." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processCommand:readonly:error:.cold.12()
{
  [@"Command cannot be processed successfully." cStringUsingEncoding:4];
  [@"Command does not target this state machine instance." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processDoorbell:error:.cold.1()
{
  [@"Rejected doorbell." cStringUsingEncoding:4];
  [@"Found a link to an invalid transfer structure address." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)processDoorbell:(void *)a1 error:.cold.2(void *a1)
{
  [@"Rejected doorbell." cStringUsingEncoding:4];
  [a1 cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v2, "Error:%s with reason: %s", v3, v4, v5, v6, 2u);
}

- (void)enqueueTransferCompletionForMessage:status:transferLength:error:.cold.1()
{
  [@"Transfer completion message was not sent." cStringUsingEncoding:4];
  [@"The current transfer cannot generate a transfer completion." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueTransferCompletionForMessage:status:transferLength:error:.cold.2()
{
  [@"Transfer completion message was not sent." cStringUsingEncoding:4];
  [@"Found a link to an invalid transfer structure address." cStringUsingEncoding:4];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v0, "Error:%s with reason: %s", v1, v2, v3, v4, v5);
}

- (void)enqueueTransferCompletionForMessage:(void *)a1 status:transferLength:error:.cold.3(void *a1)
{
  [@"Transfer completion message was not sent." cStringUsingEncoding:4];
  [a1 cStringUsingEncoding:4];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_227999000, &_os_log_internal, v2, "Error:%s with reason: %s", v3, v4, v5, v6, 2u);
}

@end