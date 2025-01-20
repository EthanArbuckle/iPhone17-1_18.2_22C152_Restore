@interface VCNWConnectionInfo
- (BOOL)isSameRemoteAddress:(id)a3;
- (NSString)connectionID;
- (OS_nw_connection)connection;
- (OS_nw_parameters)parameters;
- (VCNetworkAddress)remoteAddress;
- (id)newParametersFromConnection;
- (id)newRemoteAddressFromConnection;
- (void)dealloc;
- (void)newParametersFromConnection;
- (void)newRemoteAddressFromConnection;
- (void)setConnection:(id)a3;
- (void)setConnectionID:(id)a3;
- (void)setParameters:(id)a3;
- (void)setRemoteAddress:(id)a3;
@end

@implementation VCNWConnectionInfo

- (void)setConnection:(id)a3
{
  self->_connection = (OS_nw_connection *)nw_retain(a3);
}

- (void)setParameters:(id)a3
{
  self->_parameters = (OS_nw_parameters *)nw_retain(a3);
}

- (void)setRemoteAddress:(id)a3
{
  self->_remoteAddress = (VCNetworkAddress *)[a3 copy];
}

- (VCNetworkAddress)remoteAddress
{
  result = self->_remoteAddress;
  if (!result)
  {
    result = [(VCNWConnectionInfo *)self newRemoteAddressFromConnection];
    self->_remoteAddress = result;
  }
  return result;
}

- (OS_nw_parameters)parameters
{
  result = self->_parameters;
  if (!result)
  {
    result = [(VCNWConnectionInfo *)self newParametersFromConnection];
    self->_parameters = result;
  }
  return result;
}

- (void)setConnectionID:(id)a3
{
  self->_connectionID = (NSString *)[a3 copy];
}

- (id)newRemoteAddressFromConnection
{
  connection = self->_connection;
  if (!connection)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNWConnectionInfo newRemoteAddressFromConnection]();
      }
    }
    goto LABEL_18;
  }
  v3 = nw_connection_copy_endpoint(connection);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNWConnectionInfo newRemoteAddressFromConnection]();
      }
    }
LABEL_18:
    v4 = 0;
LABEL_22:
    nw_release(v4);
    return 0;
  }
  v4 = v3;
  v5 = nw_endpoint_copy_address_string(v3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNWConnectionInfo newRemoteAddressFromConnection]();
      }
    }
    goto LABEL_22;
  }
  v6 = v5;
  address = nw_endpoint_get_address(v4);
  if (address)
  {
    v8 = address;
    v9 = objc_opt_new();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "setIp:", objc_msgSend(NSString, "stringWithUTF8String:", v6));
      [v10 setPort:nw_endpoint_get_port(v4)];
      if (v8->sa_family == 30) {
        uint64_t v11 = 6;
      }
      else {
        uint64_t v11 = 4;
      }
      [v10 setIpVersion:v11];
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.5();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.4();
    }
  }
  v10 = 0;
LABEL_10:
  nw_release(v4);
  free(v6);
  return v10;
}

- (id)newParametersFromConnection
{
  id result = self->_connection;
  if (result)
  {
    id result = nw_connection_copy_parameters((nw_connection_t)result);
    if (!result)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCNWConnectionInfo newParametersFromConnection]();
        }
      }
      return 0;
    }
  }
  return result;
}

- (BOOL)isSameRemoteAddress:(id)a3
{
  BOOL v5 = -[NSString isEqualToString:](-[VCNetworkAddress ip](-[VCNWConnectionInfo remoteAddress](self, "remoteAddress"), "ip"), "isEqualToString:", [a3 ip]);
  if (v5)
  {
    int v6 = [(VCNetworkAddress *)[(VCNWConnectionInfo *)self remoteAddress] port];
    if (v6 == [a3 port])
    {
      int v7 = [(VCNetworkAddress *)[(VCNWConnectionInfo *)self remoteAddress] ipVersion];
      LOBYTE(v5) = v7 == [a3 ipVersion];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  nw_release(self->_connection);
  nw_release(self->_parameters);

  v3.receiver = self;
  v3.super_class = (Class)VCNWConnectionInfo;
  [(VCObject *)&v3 dealloc];
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)newRemoteAddressFromConnection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate networkAddress", v2, v3, v4, v5, v6);
}

- (void)newParametersFromConnection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve the nw parameters", v2, v3, v4, v5, v6);
}

@end