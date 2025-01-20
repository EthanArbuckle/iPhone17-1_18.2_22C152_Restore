@interface VCNetworkAddress
- (BOOL)isEqual:(id)a3;
- (BOOL)isIPv6;
- (BOOL)isValid;
- (NSString)interfaceName;
- (NSString)ip;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)getSockaddrStorage:(sockaddr_storage *)a3 size:(unint64_t *)a4;
- (unsigned)ipVersion;
- (unsigned)port;
- (void)dealloc;
- (void)setInterfaceName:(id)a3;
- (void)setIp:(id)a3;
- (void)setIpVersion:(unsigned __int16)a3;
- (void)setPort:(unsigned __int16)a3;
@end

@implementation VCNetworkAddress

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCNetworkAddress;
  [(VCNetworkAddress *)&v3 dealloc];
}

- (BOOL)isIPv6
{
  return self->_ipVersion == 6;
}

- (BOOL)isValid
{
  ip = self->_ip;
  if (ip) {
    LOBYTE(ip) = ![(NSString *)ip isEqualToString:&stru_1F3D3E450]
  }
              && self->_port
              && (self->_ipVersion & 0xFFFD) == 4;
  return (char)ip;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = -[NSString isEqual:](self->_ip, "isEqual:", [a3 ip]);
  if (v5)
  {
    int port = self->_port;
    if (port == [a3 port])
    {
      int ipVersion = self->_ipVersion;
      if (ipVersion == [a3 ipVersion])
      {
        if (-[NSString isEqual:](self->_interfaceName, "isEqual:", [a3 interfaceName]))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        if (!self->_interfaceName)
        {
          LOBYTE(v5) = [a3 interfaceName] == 0;
          return v5;
        }
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCNetworkAddress;
  return (id)[NSString stringWithFormat:@"%@ %@:%d", -[VCNetworkAddress description](&v3, sel_description), self->_ip, self->_port];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[VCNetworkAddress allocWithZone:a3];
  [(VCNetworkAddress *)v4 setIp:self->_ip];
  [(VCNetworkAddress *)v4 setPort:self->_port];
  [(VCNetworkAddress *)v4 setIpVersion:self->_ipVersion];
  [(VCNetworkAddress *)v4 setInterfaceName:self->_interfaceName];
  return v4;
}

- (int)getSockaddrStorage:(sockaddr_storage *)a3 size:(unint64_t *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v17.unint64_t ai_addrlen = v4;
  *(_OWORD *)&v17.ai_addr = v4;
  *(_OWORD *)&v17.ai_flags = v4;
  v16 = 0;
  if (a3)
  {
    if (a4)
    {
      memset(&v17, 0, sizeof(v17));
      if (self->_ipVersion == 6) {
        int v8 = 30;
      }
      else {
        int v8 = 2;
      }
      v17.ai_family = v8;
      v17.ai_socktype = 2;
      v9 = [(NSString *)self->_ip UTF8String];
      if (getaddrinfo(v9, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedShort:", self->_port), "stringValue"), "UTF8String"), &v17, &v16) == -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCNetworkAddress getSockaddrStorage:size:](v14, v15);
          }
        }
        int v12 = -1;
      }
      else
      {
        v10 = v16;
        if (v16)
        {
          unint64_t ai_addrlen = v16->ai_addrlen;
          if (*a4 < ai_addrlen)
          {
            *a4 = ai_addrlen;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            {
              int v12 = -2143879105;
            }
            else
            {
              VRTraceErrorLogLevelToCSTR();
              int v12 = -2143879105;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCNetworkAddress getSockaddrStorage:size:].cold.5();
              }
            }
          }
          else
          {
            memcpy(a3, v16->ai_addr, ai_addrlen);
            int v12 = 0;
            *a4 = v10->ai_addrlen;
          }
        }
        else
        {
          int v12 = -2143879164;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              -[VCNetworkAddress getSockaddrStorage:size:].cold.4();
              int v12 = -2143879164;
            }
          }
        }
      }
    }
    else
    {
      int v12 = -2143879167;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCNetworkAddress getSockaddrStorage:size:]();
        }
      }
    }
  }
  else
  {
    int v12 = -2143879167;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v12;
    }
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCNetworkAddress getSockaddrStorage:size:]();
    }
  }
  if (v16) {
    freeaddrinfo(v16);
  }
  return v12;
}

- (NSString)ip
{
  return self->_ip;
}

- (void)setIp:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_int port = a3;
}

- (unsigned)ipVersion
{
  return self->_ipVersion;
}

- (void)setIpVersion:(unsigned __int16)a3
{
  self->_int ipVersion = a3;
}

- (void)getSockaddrStorage:size:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Parameter 'storage'  must not be NULL", v2, v3, v4, v5, v6);
}

- (void)getSockaddrStorage:size:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Parameter 'size' must not be NULL", v2, v3, v4, v5, v6);
}

- (void)getSockaddrStorage:(uint64_t)a1 size:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315906;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  int v8 = "-[VCNetworkAddress getSockaddrStorage:size:]";
  __int16 v9 = 1024;
  int v10 = 84;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d getaddrinfo failed with error '%d'", (uint8_t *)&v5, 0x22u);
}

- (void)getSockaddrStorage:size:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d getaddrinfo failed to return valid data", v2, v3, v4, v5, v6);
}

- (void)getSockaddrStorage:size:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d getaddrinfo failed to return valid data", v2, v3, v4, v5, v6);
}

@end