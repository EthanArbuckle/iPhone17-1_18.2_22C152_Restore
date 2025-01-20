@interface VCConnection
- (VCConnection)init;
- (id)getConnectionSelectionPriorities;
- (int64_t)compare:(id)a3 isPrimary:(BOOL)a4 selectionPolicy:(id *)a5;
- (int64_t)compareConnectionTypePriority:(id)a3 selectionPolicy:(id *)a4;
- (int64_t)compareE2EPriority:(id)a3 selectionPolicy:(id *)a4;
- (int64_t)compareInterfacePriority:(id)a3 isPrimary:(BOOL)a4 preferWired:(BOOL)a5;
- (int64_t)compareIpVersionPriority:(id)a3 selectionPolicy:(id *)a4;
- (int64_t)compareVpnPriority:(id)a3 selectionPolicy:(id *)a4;
- (void)dealloc;
- (void)setLinkFlags:(unsigned __int16)a3;
- (void)setRemoteLinkFlags:(unsigned __int16)a3;
- (void)setUpVTable;
@end

@implementation VCConnection

- (void)setUpVTable
{
}

- (VCConnection)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCConnection;
  v2 = [(VCConnection *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(VCConnection *)v2 setUpVTable];
    v3->_connectionSelectionPriorities = (NSDictionary *)[(VCConnection *)v3 getConnectionSelectionPriorities];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCConnection;
  [(VCConnection *)&v3 dealloc];
}

- (void)setLinkFlags:(unsigned __int16)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_int linkFlags = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    objc_super v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int linkFlags = self->_linkFlags;
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      v10 = "-[VCConnection setLinkFlags:]";
      __int16 v11 = 1024;
      int v12 = 84;
      __int16 v13 = 1024;
      int v14 = linkFlags;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set link flags='%08x'", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (void)setRemoteLinkFlags:(unsigned __int16)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_int remoteLinkFlags = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    objc_super v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int remoteLinkFlags = self->_remoteLinkFlags;
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      v10 = "-[VCConnection setRemoteLinkFlags:]";
      __int16 v11 = 1024;
      int v12 = 89;
      __int16 v13 = 1024;
      int v14 = remoteLinkFlags;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set remote link flags='%08x'", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (int64_t)compare:(id)a3 isPrimary:(BOOL)a4 selectionPolicy:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  BOOL v6 = a4;
  if (!a5->var3
    || (int64_t result = [(VCConnection *)self compareE2EPriority:a3 selectionPolicy:a5]) == 0)
  {
    int64_t result = [(VCConnection *)self compareInterfacePriority:a3 isPrimary:v6 preferWired:a5->var5];
    if (!result)
    {
      int64_t result = [(VCConnection *)self compareConnectionTypePriority:a3 selectionPolicy:a5];
      if (!result)
      {
        int64_t result = [(VCConnection *)self compareIpVersionPriority:a3 selectionPolicy:a5];
        if (!result)
        {
          int64_t result = [(VCConnection *)self compareVpnPriority:a3 selectionPolicy:a5];
          if (!result)
          {
            v10 = (void *)[(VCConnection *)self connectionUUID];
            __int16 v11 = (void *)[a3 connectionUUID];
            uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "UUIDString"), "compare:", objc_msgSend(v11, "UUIDString"));
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              int v14 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v15 = [v10 UUIDString];
                uint64_t v16 = [v11 UUIDString];
                int v18 = 136316418;
                v17 = "Old";
                uint64_t v19 = v13;
                v21 = "-[VCConnection compare:isPrimary:selectionPolicy:]";
                __int16 v22 = 1024;
                __int16 v20 = 2080;
                if (v12 == -1) {
                  v17 = "New";
                }
                int v23 = 125;
                __int16 v24 = 2112;
                uint64_t v25 = v15;
                __int16 v26 = 2112;
                uint64_t v27 = v16;
                __int16 v28 = 2080;
                v29 = v17;
                _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connections %@, and %@ are identical for primary, choosing %s", (uint8_t *)&v18, 0x3Au);
              }
            }
            if (v12 == -1) {
              return 1;
            }
            else {
              return -1;
            }
          }
        }
      }
    }
  }
  return result;
}

- (int64_t)compareInterfacePriority:(id)a3 isPrimary:(BOOL)a4 preferWired:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4) {
    uint64_t v8 = @"connectionPrimary";
  }
  else {
    uint64_t v8 = @"connectionSecondary";
  }
  __int16 v9 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_connectionSelectionPriorities, "objectForKeyedSubscript:", @"interfacePriority"), "objectForKeyedSubscript:", v8);
  if (v5)
  {
    if (VCConnection_IsLocalOnWired((uint64_t)self))
    {
      v10 = @"interfaceWired";
    }
    else if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)self))
    {
      v10 = @"interfaceWiFi";
    }
    else
    {
      v10 = @"interfaceCellular";
    }
    if (VCConnection_IsRemoteOnWired((uint64_t)self))
    {
      __int16 v11 = @"interfaceWired";
    }
    else if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self))
    {
      __int16 v11 = @"interfaceWiFi";
    }
    else
    {
      __int16 v11 = @"interfaceCellular";
    }
    if (VCConnection_IsLocalOnWired((uint64_t)a3))
    {
      uint64_t v12 = @"interfaceWired";
    }
    else if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3))
    {
      uint64_t v12 = @"interfaceWiFi";
    }
    else
    {
      uint64_t v12 = @"interfaceCellular";
    }
    if (VCConnection_IsRemoteOnWired((uint64_t)a3))
    {
      uint64_t v13 = @"interfaceWired";
      goto LABEL_34;
    }
  }
  else
  {
    if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)self)) {
      v10 = @"interfaceWiFi";
    }
    else {
      v10 = @"interfaceCellular";
    }
    if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self)) {
      __int16 v11 = @"interfaceWiFi";
    }
    else {
      __int16 v11 = @"interfaceCellular";
    }
    if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3)) {
      uint64_t v12 = @"interfaceWiFi";
    }
    else {
      uint64_t v12 = @"interfaceCellular";
    }
  }
  if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)a3)) {
    uint64_t v13 = @"interfaceWiFi";
  }
  else {
    uint64_t v13 = @"interfaceCellular";
  }
LABEL_34:
  int v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v11), "intValue")+ objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v10), "intValue"));
  int64_t result = objc_msgSend(v14, "compare:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v13), "intValue")+ objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v12), "intValue")));
  if (!v5 && !result)
  {
    uint64_t v16 = [v9 objectForKeyedSubscript:v10];
    if (v16 == [v9 objectForKeyedSubscript:v12]) {
      return 0;
    }
    else {
      return -1;
    }
  }
  return result;
}

- (int64_t)compareConnectionTypePriority:(id)a3 selectionPolicy:(id *)a4
{
  if (a4->var0) {
    BOOL v6 = @"preferRelay";
  }
  else {
    BOOL v6 = @"preferP2P";
  }
  int v7 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_connectionSelectionPriorities, "objectForKeyedSubscript:", @"connectionTypePriority"), "objectForKeyedSubscript:", v6);
  if (VCConnection_IsRelay((uint64_t)self)) {
    uint64_t v8 = @"connectionTypeRelay";
  }
  else {
    uint64_t v8 = @"connectionTypeP2P";
  }
  if (VCConnection_IsRelay((uint64_t)a3)) {
    __int16 v9 = @"connectionTypeRelay";
  }
  else {
    __int16 v9 = @"connectionTypeP2P";
  }
  v10 = (void *)[v7 objectForKeyedSubscript:v8];
  uint64_t v11 = [v7 objectForKeyedSubscript:v9];

  return [v10 compare:v11];
}

- (int64_t)compareVpnPriority:(id)a3 selectionPolicy:(id *)a4
{
  if (!a4->var2) {
    return 0;
  }
  if (-[VCConnection isVPN](self, "isVPN") & 1) == 0 && ([a3 isVPN]) {
    return 1;
  }
  if (-[VCConnection isVPN](self, "isVPN") && ![a3 isVPN]) {
    return -1;
  }
  else {
    return 0;
  }
}

- (int64_t)compareE2EPriority:(id)a3 selectionPolicy:(id *)a4
{
  int IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)self);
  int v7 = VCConnection_IsEndToEndLink((uint64_t)a3);
  if (!IsEndToEndLink || (v7 & 1) != 0)
  {
    if ((IsEndToEndLink | v7 ^ 1)) {
      return 0;
    }
    BOOL v8 = !a4->var4;
    int64_t v9 = 1;
  }
  else
  {
    BOOL v8 = !a4->var4;
    int64_t v9 = -1;
  }
  if (v8) {
    return v9;
  }
  else {
    return -v9;
  }
}

- (int64_t)compareIpVersionPriority:(id)a3 selectionPolicy:(id *)a4
{
  if (a4->var1) {
    BOOL v6 = @"preferIPv6";
  }
  else {
    BOOL v6 = @"preferIPv4";
  }
  int v7 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_connectionSelectionPriorities, "objectForKeyedSubscript:", @"networkTypePriority"), "objectForKeyedSubscript:", v6);
  if (VCConnection_IsIPv6((uint64_t)self)) {
    BOOL v8 = @"IPv6";
  }
  else {
    BOOL v8 = @"IPv4";
  }
  if (VCConnection_IsIPv6((uint64_t)a3)) {
    int64_t v9 = @"IPv6";
  }
  else {
    int64_t v9 = @"IPv4";
  }
  v10 = (void *)[v7 objectForKeyedSubscript:v8];
  uint64_t v11 = [v7 objectForKeyedSubscript:v9];

  return [v10 compare:v11];
}

- (id)getConnectionSelectionPriorities
{
  v25[3] = *MEMORY[0x1E4F143B8];
  v24[0] = @"interfacePriority";
  v20[0] = @"interfaceWired";
  v20[1] = @"interfaceWiFi";
  v21[0] = &unk_1F3DC4290;
  v21[1] = &unk_1F3DC42A8;
  v20[2] = @"interfaceCellular";
  v21[2] = &unk_1F3DC42C0;
  v22[0] = @"connectionPrimary";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v22[1] = @"connectionSecondary";
  v23[0] = v2;
  v18[0] = @"interfaceWired";
  v18[1] = @"interfaceWiFi";
  v19[0] = &unk_1F3DC42D8;
  v19[1] = &unk_1F3DC42C0;
  v18[2] = @"interfaceCellular";
  v19[2] = &unk_1F3DC42A8;
  v23[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v25[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v24[1] = @"connectionTypePriority";
  v15[1] = &unk_1F3DC42C0;
  v16[0] = @"preferP2P";
  v14[0] = @"connectionTypeP2P";
  v14[1] = @"connectionTypeRelay";
  v15[0] = &unk_1F3DC42A8;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16[1] = @"preferRelay";
  v17[0] = v3;
  v12[0] = @"connectionTypeP2P";
  v12[1] = @"connectionTypeRelay";
  v13[0] = &unk_1F3DC42C0;
  v13[1] = &unk_1F3DC42A8;
  v17[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v25[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v24[2] = @"networkTypePriority";
  v9[1] = &unk_1F3DC42C0;
  v10[0] = @"preferIPv4";
  v8[0] = @"IPv4";
  v8[1] = @"IPv6";
  v9[0] = &unk_1F3DC42A8;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[1] = @"preferIPv6";
  v11[0] = v4;
  v6[0] = @"IPv4";
  v6[1] = @"IPv6";
  v7[0] = &unk_1F3DC42C0;
  v7[1] = &unk_1F3DC42A8;
  v11[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  v25[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
}

@end