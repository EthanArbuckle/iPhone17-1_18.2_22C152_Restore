@interface VCNetworkAgentCell
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (VCNetworkAgentCell)init;
- (id)copyAgentData;
- (id)queryWifiInterfaceName;
- (void)dealloc;
- (void)queryWifiInterfaceName;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
@end

@implementation VCNetworkAgentCell

- (VCNetworkAgentCell)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCNetworkAgentCell;
  v2 = [(VCObject *)&v5 init];
  if (v2)
  {
    v2->_agentUUID = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    v2->_active = 1;
    v2->_voluntary = 1;
    v2->_wifiInterfaceName = (NSString *)[(VCNetworkAgentCell *)v2 queryWifiInterfaceName];
    v3 = (NWNetworkAgentRegistration *)[objc_alloc(MEMORY[0x1E4F38C00]) initWithNetworkAgentClass:objc_opt_class()];
    v2->_agentRegistration = v3;
    [(NWNetworkAgentRegistration *)v3 registerNetworkAgent:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCNetworkAgentCell;
  [(VCObject *)&v3 dealloc];
}

- (id)queryWifiInterfaceName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = nw_parameters_create();
  objc_super v3 = v2;
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNetworkAgentCell queryWifiInterfaceName]();
      }
    }
    goto LABEL_15;
  }
  nw_parameters_set_required_interface_type(v2, nw_interface_type_wifi);
  uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
  if (!evaluator_for_endpoint)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNetworkAgentCell queryWifiInterfaceName]();
      }
    }
LABEL_15:
    v9 = 0;
    v7 = 0;
    objc_super v5 = 0;
LABEL_24:
    v10 = @"en0";
    goto LABEL_8;
  }
  objc_super v5 = (void *)evaluator_for_endpoint;
  uint64_t v6 = nw_path_evaluator_copy_path();
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNetworkAgentCell queryWifiInterfaceName]();
      }
    }
    v9 = 0;
    v7 = 0;
    goto LABEL_24;
  }
  v7 = (void *)v6;
  v8 = nw_path_copy_interface();
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCNetworkAgentCell queryWifiInterfaceName].cold.4();
      }
    }
    v9 = 0;
    goto LABEL_24;
  }
  v9 = v8;
  v10 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%s", nw_interface_get_name(v8));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      v17 = "-[VCNetworkAgentCell queryWifiInterfaceName]";
      __int16 v18 = 1024;
      int v19 = 91;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Wifi interface name %@", buf, 0x26u);
    }
  }
LABEL_8:

  return v10;
}

+ (id)agentDomain
{
  return @"AVConference";
}

+ (id)agentType
{
  return @"CellularFallback";
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->_voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->_voluntary = a3;
}

- (NSUUID)agentUUID
{
  return self->_agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSString)agentDescription
{
  return self->_agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

VCNetworkAgentCell *___VCNetworkAgentCell_SharedInstance_block_invoke()
{
  result = objc_alloc_init(VCNetworkAgentCell);
  _VCNetworkAgentCell_SharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (void)queryWifiInterfaceName
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil interface", v2, v3, v4, v5, v6);
}

@end