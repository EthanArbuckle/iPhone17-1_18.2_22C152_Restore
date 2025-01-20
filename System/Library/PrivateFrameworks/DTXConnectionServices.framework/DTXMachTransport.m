@interface DTXMachTransport
+ (id)_legacyFileDescriptorHandshakeWithReceivePort:(unsigned int)a3;
+ (id)_legacyFileDescriptorHandshakeWithSendPort:(unsigned int)a3;
+ (id)fileDescriptorHandshakeWithReceivePort:(unsigned int)a3;
+ (id)fileDescriptorHandshakeWithSendPort:(unsigned int)a3;
+ (id)schemes;
- (BOOL)_setupWithSendPort:(unsigned int)a3 receivePort:(unsigned int)a4 disconnectBlock:(id)a5;
- (DTXMachTransport)init;
- (DTXMachTransport)initWithReceiveRight:(unsigned int)a3 sendRight:(unsigned int)a4 disconnectBlock:(id)a5;
- (DTXMachTransport)initWithRemoteAddress:(id)a3;
- (DTXMachTransport)initWithXPCRepresentation:(id)a3;
- (id)localAddresses;
- (id)serializedXPCRepresentation;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (void)dealloc;
- (void)disconnect;
@end

@implementation DTXMachTransport

+ (id)schemes
{
  return [MEMORY[0x263EFFA08] setWithObjects:a2, @"mach", nil];
}

- (BOOL)_setupWithSendPort:(unsigned int)a3 receivePort:(unsigned int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  BOOL v8 = a3 - 1 >= 0xFFFFFFFE || a4 - 1 >= 0xFFFFFFFE;
  BOOL v9 = !v8;
  if (v8)
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = NSStringFromSelector(a2);
    NSLog(&cfstr_InvalidPortsPr.isa, v23, v24, v6, v5);
  }
  else
  {
    self->_sendPort = a3;
    self->_receivePort = a4;
    v10 = (void *)MEMORY[0x230F36B10](a5, a2);
    id disconnectBlock = self->_disconnectBlock;
    self->_id disconnectBlock = v10;

    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83C8], self->_receivePort, 0, (dispatch_queue_t)self->_inputQueue);
    listenSource = self->_listenSource;
    self->_listenSource = v12;

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_22AF39000;
    v27[3] = &unk_264883A58;
    v27[4] = self;
    v14 = (void *)MEMORY[0x230F36B10](v27);
    v15 = (void *)MEMORY[0x230F36B10]();
    id inputReaderBlock = self->_inputReaderBlock;
    self->_id inputReaderBlock = v15;

    dispatch_source_set_event_handler((dispatch_source_t)self->_listenSource, self->_inputReaderBlock);
    dispatch_resume((dispatch_object_t)self->_listenSource);
    v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83D0], self->_sendPort, 1uLL, (dispatch_queue_t)self->_inputQueue);
    deadPortSource = self->_deadPortSource;
    self->_deadPortSource = v17;

    v19 = self->_deadPortSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_22AF39158;
    handler[3] = &unk_264883A58;
    handler[4] = self;
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume((dispatch_object_t)self->_deadPortSource);
    [self setStatus:1];
  }
  return v9;
}

- (DTXMachTransport)init
{
  return self;
}

- (DTXMachTransport)initWithReceiveRight:(unsigned int)a3 sendRight:(unsigned int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  BOOL v8 = (void (**)(void))a5;
  v13.receiver = self;
  v13.super_class = (Class)DTXMachTransport;
  BOOL v9 = [(DTXTransport *)&v13 init];
  v10 = v9;
  if (v9)
  {
    sub_22AF392B0(v9);
    if ([v10 _setupWithSendPort:v11 receivePort:v5 disconnectBlock:v6] == NO)
    {
      if (v8) {
        v8[2](v8);
      }

      v10 = 0;
    }
  }

  return v10;
}

- (DTXMachTransport)initWithRemoteAddress:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v83.receiver = self;
  v83.super_class = (Class)DTXMachTransport;
  uint64_t v6 = [(DTXTransport *)&v83 initWithRemoteAddress:v5];
  v7 = v6;
  if (v6)
  {
    sub_22AF392B0(v6);
    v10 = [v5 performSelector:v8 withObject:v9];
    uint64_t v13 = [v10 intValue];

    p_sendPort = &v7->_sendPort;
    v7->_sendPort = 0;
    p_receivePort = &v7->_receivePort;
    v7->_receivePort = 0;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v18 = [v5 pathComponents:v16, v17];
    uint64_t v20 = [v18 countByEnumeratingWithState:v19 objects:&v79 count:16];
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v80 != v24) {
            objc_enumerationMutation(v18);
          }
          unsigned int v26 = [*(void **)(*((void *)&v79 + 1) + 8 * i) performSelector:v21 withObject:v22];
          if (v26 - 1 <= 0xFFFFFFFD)
          {
            v27 = &v7->_sendPort;
            if (*p_sendPort + 1 < 2 || (v27 = &v7->_receivePort, *p_receivePort + 1 <= 1)) {
              unsigned int *v27 = v26;
            }
          }
        }
        uint64_t v23 = [v18 countByEnumeratingWithState:v21 objects:&v79 count:16];
      }
      while (v23);
    }

    if (*p_sendPort + 1 < 2 || *p_receivePort + 1 <= 1)
    {
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      v30 = NSStringFromSelector(a2);
      NSLog(&cfstr_InvalidPortsIn.isa, v29, v30, v5);

LABEL_16:
LABEL_17:
      v7 = 0;
      goto LABEL_18;
    }
    pid_t v32 = getpid();
    pid_t v33 = v32;
    uint64_t v34 = *MEMORY[0x263EF8960];
    mach_port_name_t task = *MEMORY[0x263EF8960];
    if (v13 == v32)
    {
      pid_t v74 = v32;
      uint64_t v75 = v13;
      uint64_t v35 = v34;
    }
    else
    {
      if (task_for_pid(v34, v13, &task))
      {
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        v38 = NSStringFromSelector(a2);
        NSLog(&cfstr_UnableToConnec.isa, v37, v38, v13, v5);

        goto LABEL_16;
      }
      pid_t v74 = v33;
      uint64_t v75 = v13;
      uint64_t v35 = task;
      LODWORD(v34) = *MEMORY[0x263EF8960];
    }
    uint64_t v39 = *p_receivePort;
    unsigned int *p_receivePort = 0;
    *(void *)poly = 0;
    mach_port_name_t name = 0;
    is_self = mach_task_is_self(v35);
    if (is_self)
    {
      BOOLean_t v72 = is_self;
      poly[1] = v39;
      mach_msg_type_name_t v41 = 16;
    }
    else
    {
      uint64_t v45 = MEMORY[0x230F36750](v35, v39, 16, &poly[1], poly);
      if (v45) {
        goto LABEL_45;
      }
      BOOLean_t v72 = 0;
      mach_msg_type_name_t v41 = poly[0];
    }
    if (mach_task_is_self(v34))
    {
      mach_port_t v42 = poly[1];
      mach_port_name_t name = poly[1];
      if (v41 - 19 > 0xFFFFFFFC)
      {
LABEL_36:
        unsigned int *p_receivePort = v42;
        if (v42 - 1 <= 0xFFFFFFFD) {
          goto LABEL_46;
        }
        uint64_t v45 = 5;
LABEL_45:
        v49 = (objc_class *)objc_opt_class();
        v50 = NSStringFromClass(v49);
        v51 = NSStringFromSelector(a2);
        v52 = mach_error_string(v45);
        NSLog(&cfstr_UnableToExtrac.isa, v50, v51, v75, v52, v45);

LABEL_46:
        uint64_t v53 = task;
        ipc_space_t v54 = *MEMORY[0x263EF8960];
        uint64_t v55 = *p_sendPort;
        unsigned int *p_sendPort = 0;
        *(void *)poly = 0;
        BOOLean_t v56 = mach_task_is_self(v53);
        if (v56)
        {
          BOOLean_t v73 = v56;
          poly[1] = v55;
          mach_msg_type_name_t v57 = 17;
        }
        else
        {
          uint64_t v61 = MEMORY[0x230F36750](v53, v55, 17, &poly[1], poly);
          if (v61) {
            goto LABEL_68;
          }
          BOOLean_t v73 = 0;
          mach_msg_type_name_t v57 = poly[0];
        }
        if (mach_task_is_self(v54))
        {
          mach_port_t v58 = poly[1];
          mach_port_name_t name = poly[1];
          if (v57 - 19 > 0xFFFFFFFC)
          {
LABEL_58:
            unsigned int *p_sendPort = v58;
            if (v58 - 1 <= 0xFFFFFFFD)
            {
              int v64 = v75;
LABEL_69:
              if (v64 != v74) {
                mach_port_deallocate(*MEMORY[0x263EF8960], task);
              }
              v76[0] = MEMORY[0x263EF8330];
              v76[1] = 3221225472;
              v76[2] = sub_22AF39A1C;
              v76[3] = &unk_264883A58;
              v7 = v7;
              v77 = v7;
              v70 = (void (**)(void))MEMORY[0x230F36B10](v76);
              if ([v7 _setupWithSendPort:v71 receivePort:*p_receivePort disconnectBlock:v70])
              {

                goto LABEL_18;
              }
              v70[2](v70);

              goto LABEL_17;
            }
            uint64_t v61 = 5;
LABEL_68:
            v66 = (objc_class *)objc_opt_class();
            v67 = NSStringFromClass(v66);
            v68 = NSStringFromSelector(a2);
            v69 = mach_error_string(v61);
            int v64 = v75;
            NSLog(&cfstr_UnableToExtrac_0.isa, v67, v68, v75, v69, v61);

            goto LABEL_69;
          }
          ipc_space_t v59 = v54;
          mach_port_t v60 = poly[1];
        }
        else
        {
          if (v53 != v54)
          {
            while (1)
            {
              mach_port_name_t name = 0;
              uint64_t v65 = mach_port_allocate(v54, 4u, &name);
              if (v65) {
                break;
              }
              uint64_t v65 = mach_port_deallocate(v54, name);
              if (v65) {
                break;
              }
              uint64_t inserted = mach_port_insert_right(v54, name, poly[1], v57);
              if ((inserted & 0xFFFFFFF7) != 5) {
                goto LABEL_56;
              }
            }
            uint64_t v61 = v65;
            BOOLean_t v63 = v73;
            goto LABEL_66;
          }
          mach_port_name_t name = v55;
          mach_port_t v60 = poly[1];
          ipc_space_t v59 = v53;
          mach_port_t v58 = v55;
        }
        uint64_t inserted = mach_port_insert_right(v59, v58, v60, v57);
LABEL_56:
        uint64_t v61 = inserted;
        BOOLean_t v63 = v73;
        if (!inserted)
        {
          mach_port_t v58 = name;
          goto LABEL_58;
        }
LABEL_66:
        if (!v63) {
          mach_port_mod_refs(*MEMORY[0x263EF8960], poly[1], poly[0], -1);
        }
        goto LABEL_68;
      }
      ipc_space_t v43 = v34;
      mach_port_t v44 = poly[1];
    }
    else
    {
      if (v35 != v34)
      {
        while (1)
        {
          mach_port_name_t name = 0;
          uint64_t v48 = mach_port_allocate(v34, 4u, &name);
          if (v48) {
            break;
          }
          uint64_t v48 = mach_port_deallocate(v34, name);
          if (v48) {
            break;
          }
          uint64_t v46 = mach_port_insert_right(v34, name, poly[1], v41);
          if ((v46 & 0xFFFFFFF7) != 5) {
            goto LABEL_34;
          }
        }
        uint64_t v45 = v48;
        BOOLean_t v47 = v72;
        goto LABEL_43;
      }
      mach_port_name_t name = v39;
      mach_port_t v44 = poly[1];
      ipc_space_t v43 = v34;
      mach_port_t v42 = v39;
    }
    uint64_t v46 = mach_port_insert_right(v43, v42, v44, v41);
LABEL_34:
    uint64_t v45 = v46;
    BOOLean_t v47 = v72;
    if (!v46)
    {
      mach_port_t v42 = name;
      goto LABEL_36;
    }
LABEL_43:
    if (!v47) {
      mach_port_mod_refs(*MEMORY[0x263EF8960], poly[1], poly[0], -1);
    }
    goto LABEL_45;
  }
LABEL_18:

  return v7;
}

- (DTXMachTransport)initWithXPCRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DTXMachTransport;
  id v5 = [(DTXTransport *)&v13 initWithXPCRepresentation:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    sub_22AF392B0(v5);
    v6->_sendPort = xpc_dictionary_copy_mach_send();
    v6->_receivePort = xpc_dictionary_extract_mach_recv();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_22AF39BF8;
    v11[3] = &unk_264883A58;
    v7 = v6;
    uint64_t v12 = v7;
    BOOL v8 = (void (**)(void))MEMORY[0x230F36B10](v11);
    if ([v7 _setupWithSendPort:v9 receivePort:v6->_sendPort disconnectBlock:v6->_receivePort] == NO)
    {
      v8[2](v8);

      v7 = 0;
    }

    uint64_t v6 = v7;
  }

  return v6;
}

- (id)serializedXPCRepresentation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_22AF39D80;
  v10 = sub_22AF39D90;
  id v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF39D98;
  v5[3] = &unk_2648839B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)dealloc
{
  sendBuffer = self->_sendBuffer;
  if (sendBuffer)
  {
    free(sendBuffer);
    self->_sendBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXMachTransport;
  [(DTXTransport *)&v4 dealloc];
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  if (self->_sendPort + 1 >= 2)
  {
    unint64_t v6 = a4;
    v7 = (char *)a3;
    unint64_t v5 = 0;
    unsigned int bufferedLength = self->_bufferedLength;
    do
    {
      if (v6 >= 32672 - (unint64_t)bufferedLength) {
        unsigned int v9 = 32672 - bufferedLength;
      }
      else {
        unsigned int v9 = v6;
      }
      memcpy(&self->_sendBuffer->var1[bufferedLength], v7, v9);
      unsigned int bufferedLength = self->_bufferedLength + v9;
      self->_unsigned int bufferedLength = bufferedLength;
      if (!v6 || bufferedLength == 32672)
      {
        sendBuffer = self->_sendBuffer;
        *(void *)&sendBuffer->var0.var0.var0 = 0;
        *(void *)&sendBuffer->var0.var0.var2 = 0;
        sendBuffer->var0.var1 = 0;
        *(void *)&sendBuffer->var0.var0.var4 = 0;
        id v11 = (mach_msg_header_t *)self->_sendBuffer;
        v11->msgh_remote_port = self->_sendPort;
        v11->msgh_bits = 19;
        LODWORD(sendBuffer) = self->_bufferedLength;
        v11[1].msgh_bits = sendBuffer;
        if (mach_msg(v11, 1, (sendBuffer + 35) & 0xFFFFFFF8, 0, 0, 0, 0)) {
          goto LABEL_3;
        }
        unsigned int bufferedLength = 0;
        self->_unsigned int bufferedLength = 0;
      }
      v7 += v9;
      v5 += v9;
      v6 -= v9;
    }
    while (v6);
  }
  else
  {
    unint64_t v5 = 0;
LABEL_3:
    [self _disconnectWithConnection:a2 connectionIdentifier:a3 connectionType:a4];
  }
  return v5;
}

- (void)disconnect
{
  listenSource = self->_listenSource;
  if (listenSource) {
    dispatch_source_cancel(listenSource);
  }
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF3A178;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_sync(inputQueue, block);
  v7.receiver = self;
  v7.super_class = (Class)DTXMachTransport;
  [(DTXTransport *)&v7 disconnect];
  outputQueue = self->_outputQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_22AF3A1E0;
  v6[3] = &unk_264883A58;
  v6[4] = self;
  dispatch_async(outputQueue, v6);
}

- (id)localAddresses
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = getpid();
  objc_super v4 = NSURL;
  unint64_t v6 = [@"mach" stringByAppendingFormat:@"://%d/%d/%d", v3, self->_receivePort, self->_sendPort];
  uint64_t v8 = [v4 URLWithString:v7];

  v12[0] = v8;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v10;
}

+ (id)fileDescriptorHandshakeWithReceivePort:(unsigned int)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  int v26 = -1;
  unsigned int v27 = -1;
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    int v6 = 1;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    int v37 = 0;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v29 = sub_22AF3B870;
    v30 = &unk_264883B18;
    v31 = &v34;
    pid_t v32 = &v27;
    pid_t v33 = &v26;
    unint64_t v5 = v28;
    bzero(&msg, 0x324uLL);
    if (mach_msg((mach_msg_header_t *)&msg, 2, 0, 0x324u, a3, 0, 0) || msg_20 == 70)
    {
      LODWORD(v41[0]) = 0;
      LODWORD(v40[0]) = 4;
      ((void (*)(void *, void, _OWORD *, _OWORD *, void))v29)(v5, 0, v41, v40, 0);
    }
    else if (v50[191] + msg_4 == 804 && (HIDWORD(msg_20) - 65) > 0xFFFFFFBF)
    {
      uint64_t v14 = 0;
      int v15 = msg;
      memset(v41, 0, sizeof(v41));
      uint64_t v16 = 4 * HIDWORD(msg_20);
      uint64_t v17 = v50;
      v18 = v50;
      memset(v40, 0, sizeof(v40));
      while (1)
      {
        unsigned int v20 = *v18;
        v18 += 3;
        unsigned int v19 = v20;
        if (HIBYTE(v20)) {
          break;
        }
        unsigned int v21 = v19 - 1441792;
        int v22 = v19 & 0xFF0000;
        BOOL v23 = v21 >= 0xFFFB0000 || v22 == 0x100000;
        if (v23 && (v15 & 0x80000000) == 0) {
          break;
        }
        int v24 = 4 * (v21 < 0xFFFB0000);
        if (v22 == 0x100000) {
          int v24 = 1;
        }
        *(_DWORD *)((char *)v41 + v14) = *(v17 - 2);
        if (v15 >= 0) {
          int v25 = 6;
        }
        else {
          int v25 = v24;
        }
        *(_DWORD *)((char *)v40 + v14) = v25;
        v14 += 4;
        uint64_t v17 = v18;
        if (v16 == v14) {
          goto LABEL_33;
        }
      }
      int v38 = 4;
      int v39 = 0;
LABEL_33:
      ((void (*)(void *))v29)(v5);
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }
    else
    {
      LODWORD(v41[0]) = 0;
      LODWORD(v40[0]) = 4;
      ((void (*)(void *, void, _OWORD *, _OWORD *, void))v29)(v5, 0, v41, v40, 0);
      mach_msg_destroy((mach_msg_header_t *)&msg);
    }

    int v6 = *((_DWORD *)v35 + 6);
    _Block_object_dispose(&v34, 8);
    if (!v6)
    {
      uint64_t v12 = [DTXFileDescriptorTransport alloc];
      v10 = [v12 initWithIncomingFileDescriptor:v13 outgoingFileDescriptor:v27 disconnectBlock:MEMORY[0x263EF8330] queue:3221225472 block:sub_22AF3A7D4 completion:__PAIR64__(v26, v27)];
      goto LABEL_13;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    objc_super v7 = getprogname();
    pid_t v8 = getpid();
    Name = sel_getName(a2);
    int msg = 136315906;
    msg_4 = v7;
    __int16 msg_12 = 1024;
    pid_t msg_14 = v8;
    __int16 msg_18 = 2082;
    msg_20 = Name;
    __int16 v48 = 1024;
    int v49 = v6;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s(%d) [error]: '%{public}s' failed: (%d)\n", (uint8_t *)&msg, 0x22u);
  }
  v10 = 0;
LABEL_13:

  return v10;
}

+ (id)fileDescriptorHandshakeWithSendPort:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a3 - 1 >= 0xFFFFFFFE)
  {
    int v4 = 1;
    goto LABEL_15;
  }
  *(void *)unsigned int v9 = -1;
  *(void *)v10 = -1;
  if (pipe(v9) || pipe(v10))
  {
    int v4 = 6;
LABEL_5:
    if ((v9[0] & 0x80000000) == 0) {
      close(v9[0]);
    }
    goto LABEL_7;
  }
  if (!fileport_makeport()) {
    fileport_makeport();
  }
  int v4 = 15;
  if ((v9[0] & 0x80000000) == 0)
  {
    if (fcntl(v9[0], 2, 1) == -1 || v9[1] < 0 || fcntl(v9[1], 2, 1) == -1) {
      int v4 = 29;
    }
    goto LABEL_5;
  }
  int v4 = 29;
LABEL_7:
  if ((v9[1] & 0x80000000) == 0) {
    close(v9[1]);
  }
  if ((v10[0] & 0x80000000) == 0) {
    close(v10[0]);
  }
  if ((v10[1] & 0x80000000) == 0) {
    close(v10[1]);
  }
LABEL_15:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    unint64_t v5 = getprogname();
    pid_t v6 = getpid();
    Name = sel_getName(a2);
    *(_DWORD *)buf = 136315906;
    uint64_t v12 = v5;
    __int16 v13 = 1024;
    pid_t v14 = v6;
    __int16 v15 = 2082;
    uint64_t v16 = Name;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s(%d) [error]: '%{public}s' failed: (%d)\n", buf, 0x22u);
  }

  return 0;
}

+ (id)_legacyFileDescriptorHandshakeWithReceivePort:(unsigned int)a3
{
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = -1;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22AF3AFA0;
  v13[3] = &unk_264883AA0;
  v13[4] = &v14;
  uint64_t v3 = sub_22AF3ADB8(a3, v13);
  uint64_t v4 = v3;
  if ((v3 & 0x80000000) == 0)
  {
    if ((v15[3] & 0x80000000) == 0)
    {
      unint64_t v5 = [DTXFileDescriptorTransport alloc];
      uint64_t v6 = *((unsigned int *)v15 + 6);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = sub_22AF3B268;
      v11[3] = &unk_264883AC8;
      void v11[4] = &v14;
      int v12 = v4;
      pid_t v8 = [v5 initWithIncomingFileDescriptor:v7 outgoingFileDescriptor:v6 disconnectBlock:v4 completion:v11];
      goto LABEL_8;
    }
    close(v3);
  }
  int v9 = *((_DWORD *)v15 + 6);
  if ((v9 & 0x80000000) == 0) {
    close(v9);
  }
  pid_t v8 = 0;
LABEL_8:
  _Block_object_dispose(&v14, 8);

  return v8;
}

+ (id)_legacyFileDescriptorHandshakeWithSendPort:(unsigned int)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  unsigned int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_22AF39D80;
  v30 = sub_22AF39D90;
  id v31 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_22AF3B698;
  v24[3] = &unk_264883AF0;
  unsigned int v25 = a3;
  v24[4] = &v26;
  uint64_t v4 = v24;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  pid_t v33 = sub_22AF3BA1C;
  uint64_t v34 = &unk_264883B68;
  unsigned int v36 = a3;
  unint64_t v5 = v4;
  id v35 = v5;
  uint64_t v6 = v32;
  name[0] = 0;
  objc_super v7 = (ipc_space_t *)MEMORY[0x263EF8960];
  mach_error_t v8 = mach_port_allocate(*MEMORY[0x263EF8960], 1u, name);
  if (v8)
  {
    int v9 = &_os_log_internal;
    id v10 = &_os_log_internal;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = getprogname();
      pid_t v12 = getpid();
      __int16 v13 = mach_error_string(v8);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v13;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v8;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_allocate' failed: %s (%d)\n", buf, 0x22u);
    }
  }
  mach_error_t inserted = mach_port_insert_right(*v7, name[0], name[0], 0x14u);
  if (inserted)
  {
    __int16 v15 = &_os_log_internal;
    id v16 = &_os_log_internal;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = getprogname();
      pid_t v18 = getpid();
      uint64_t v19 = mach_error_string(inserted);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v18;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v19;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = inserted;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s[%d]: [error] 'mach_port_insert_right' failed: %s (%d)\n", buf, 0x22u);
    }
  }
  uint64_t v20 = name[0];
  *(void *)mach_port_name_t name = 0;
  int v38 = name;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_22AF3BAE4;
  *(void *)&buf[24] = &unk_264883AC8;
  *(void *)&buf[32] = name;
  int v42 = v20;
  unsigned int v21 = (void (**)(void))MEMORY[0x230F36B10](buf);
  v33((uint64_t)v6, v20, v21);
  v21[2](v21);

  _Block_object_dispose(name, 8);
  id v22 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong(&self->_inputReaderBlock, 0);
  objc_storeStrong((id *)&self->_deadPortSource, 0);
  objc_storeStrong((id *)&self->_listenSource, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);

  objc_storeStrong((id *)&self->_inputQueue, 0);
}

@end