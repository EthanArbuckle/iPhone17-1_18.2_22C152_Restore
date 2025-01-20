@interface CBScalablePipe
- (BOOL)reliablePipe;
- (CBCentral)central;
- (CBPeer)peer;
- (CBScalablePipe)initWithPipeManager:(id)a3 info:(id)a4;
- (NSInputStream)input;
- (NSOutputStream)output;
- (NSString)name;
- (id)description;
- (int64_t)peerType;
- (int64_t)priority;
- (int64_t)type;
- (unsigned)localCLFeatures;
- (unsigned)localCLVersion;
- (unsigned)peerCLFeatures;
- (unsigned)peerCLVersion;
- (void)channel;
- (void)dealloc;
- (void)setOrphan;
@end

@implementation CBScalablePipe

- (CBScalablePipe)initWithPipeManager:(id)a3 info:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CBScalablePipe;
  v9 = [(CBScalablePipe *)&v36 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pipeManager, a3);
    v11 = [[CBPeer alloc] initWithInfo:v8 manager:v7];
    peer = v10->_peer;
    v10->_peer = v11;

    objc_storeStrong((id *)&v10->_central, v10->_peer);
    uint64_t v13 = [v8 objectForKeyedSubscript:@"kCBMsgArgName"];
    name = v10->_name;
    v10->_name = (NSString *)v13;

    v15 = [v8 objectForKeyedSubscript:@"kCBMsgArgType"];
    v10->_type = [v15 integerValue];

    v16 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPriority"];
    v10->_priority = [v16 integerValue];

    v17 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgReliable"];
    v10->_reliablePipe = [v17 integerValue] != 0;

    v18 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPeerType"];
    v10->_peerType = [v18 integerValue];

    v19 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPeerCLVersion"];
    v10->_peerCLVersion = [v19 integerValue];

    v20 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgPeerCLFeatures"];
    v10->_peerCLFeatures = [v20 unsignedIntValue];

    v21 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArglocalCLVersion"];
    v10->_localCLVersion = [v21 integerValue];

    v22 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArglocalCLFeatures"];
    v10->_localCLFeatures = [v22 unsignedIntValue];

    v23 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgSocket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [v8 objectForKeyedSubscript:@"kCBLePipeMsgArgSocket"];
      v10->_int socket = [v24 intValue];

      readStream[0] = 0;
      CFWriteStreamRef writeStream = 0;
      CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10->_socket, readStream, &writeStream);
      input = v10->_input;
      v10->_input = (NSInputStream *)readStream[0];

      output = v10->_output;
      v10->_output = (NSOutputStream *)writeStream;

      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      }
      v27 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        int socket = v10->_socket;
        v29 = "yes";
        if (v10->_input) {
          v30 = "yes";
        }
        else {
          v30 = "no";
        }
        if (!v10->_output) {
          v29 = "no";
        }
        *(_DWORD *)buf = 138413058;
        v39 = v10;
        __int16 v40 = 1024;
        *(_DWORD *)v41 = socket;
        *(_WORD *)&v41[4] = 2080;
        *(void *)&v41[6] = v30;
        *(_WORD *)&v41[14] = 2080;
        *(void *)&v41[16] = v29;
        _os_log_impl(&dword_1AB9F0000, v27, OS_LOG_TYPE_DEFAULT, "%@ created socket pipe: fd %d, in %s, out %s", buf, 0x26u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        readStream[0] = 0;
        readStream[1] = 0;
        [v23 getUUIDBytes:readStream];
        if (uuid_is_null((const unsigned __int8 *)readStream))
        {
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          }
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
            -[CBScalablePipe initWithPipeManager:info:]();
          }
        }
        else
        {
          os_channel_attr_create();
          os_channel_attr_set();
          v10->_channel = (void *)os_channel_create_extended();
          os_channel_attr_destroy();
          if (CBLogInitOnce != -1) {
            dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
          }
          v32 = CBLogComponent;
          if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
          {
            channel = v10->_channel;
            *(_DWORD *)buf = 138412802;
            if (channel) {
              v34 = "yes";
            }
            else {
              v34 = "no";
            }
            v39 = v10;
            __int16 v40 = 2112;
            *(void *)v41 = v23;
            *(_WORD *)&v41[8] = 2080;
            *(void *)&v41[10] = v34;
            _os_log_impl(&dword_1AB9F0000, v32, OS_LOG_TYPE_DEFAULT, "%@ created skywalk pipe: UUID %@, channel %s", buf, 0x20u);
          }
        }
      }
      else
      {
        if (CBLogInitOnce != -1) {
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        }
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
          -[CBScalablePipe initWithPipeManager:info:]();
        }
      }
    }
  }
  return v10;
}

- (void)setOrphan
{
  self->_pipeManager = 0;
  MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  int socket = self->_socket;
  if (socket) {
    close(socket);
  }
  if (self->_channel) {
    os_channel_destroy();
  }
  v4.receiver = self;
  v4.super_class = (Class)CBScalablePipe;
  [(CBScalablePipe *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = "low";
  v6 = "medium";
  int64_t type = self->_type;
  int64_t priority = self->_priority;
  v9 = "isochronous";
  if (priority == 2) {
    v9 = "high";
  }
  if (priority != 1) {
    v6 = v9;
  }
  if (priority) {
    v5 = v6;
  }
  v10 = "server";
  if (type != 1) {
    v10 = "peer-to-peer";
  }
  if (!type) {
    v10 = "client";
  }
  if (self->_reliablePipe) {
    v11 = "ON";
  }
  else {
    v11 = "OFF";
  }
  v12 = "yes";
  if (!self->_channel) {
    v12 = "no";
  }
  return (id)[v3 stringWithFormat:@"<%@: peer = %@, name = \"%@\", int64_t type = %s, priority = %s reliability is %s, socket %d, channel %s>", v4, self->_peer, self->_name, v10, v5, v11, self->_socket, v12];
}

- (CBCentral)central
{
  return self->_central;
}

- (CBPeer)peer
{
  return self->_peer;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)reliablePipe
{
  return self->_reliablePipe;
}

- (int64_t)peerType
{
  return self->_peerType;
}

- (NSInputStream)input
{
  return self->_input;
}

- (NSOutputStream)output
{
  return self->_output;
}

- (void)channel
{
  return self->_channel;
}

- (unsigned)localCLVersion
{
  return self->_localCLVersion;
}

- (unsigned)peerCLVersion
{
  return self->_peerCLVersion;
}

- (unsigned)localCLFeatures
{
  return self->_localCLFeatures;
}

- (unsigned)peerCLFeatures
{
  return self->_peerCLFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_central, 0);

  objc_storeStrong((id *)&self->_pipeManager, 0);
}

- (void)initWithPipeManager:info:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1AB9F0000, v0, v1, "%@ not creating skywalk channel: UUID %@");
}

- (void)initWithPipeManager:info:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1AB9F0000, v0, v1, "%@ init with no socket/UUID: %@");
}

@end