@interface CUNetInterfaceMonitor
- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv4Addr;
- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv6Addr;
- (CUNetInterfaceMonitor)init;
- (NSArray)interfaces;
- (NSString)label;
- (NSString)primaryNetworkSignature;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)flagsChangedHandler;
- (id)interfacesChangedHandler;
- (id)invalidationHandler;
- (id)primaryIPChangedHandler;
- (id)primaryNetworkChangedHandler;
- (unsigned)controlFlags;
- (unsigned)flags;
- (void)_ensureStartedNW;
- (void)_ensureStartedSC;
- (void)_ensureStopped;
- (void)_invalidate;
- (void)_invalidated;
- (void)_networkInterfacesChanged:(BOOL)a3;
- (void)_primaryIPChanged:(BOOL)a3;
- (void)_primaryIPChangedNW:(BOOL)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlagsChangedHandler:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setInterfacesChangedHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPrimaryIPChangedHandler:(id)a3;
- (void)setPrimaryNetworkChangedHandler:(id)a3;
@end

@implementation CUNetInterfaceMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryNetworkSignature, 0);
  objc_storeStrong(&self->_primaryNetworkChangedHandler, 0);
  objc_storeStrong(&self->_primaryIPChangedHandler, 0);
  objc_storeStrong(&self->_interfacesChangedHandler, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong(&self->_flagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_nwPathEvaluator, 0);
}

- (NSString)primaryNetworkSignature
{
  return self->_primaryNetworkSignature;
}

- (void)setPrimaryNetworkChangedHandler:(id)a3
{
}

- (id)primaryNetworkChangedHandler
{
  return self->_primaryNetworkChangedHandler;
}

- (void)setPrimaryIPChangedHandler:(id)a3
{
}

- (id)primaryIPChangedHandler
{
  return self->_primaryIPChangedHandler;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv6Addr
{
  retstr->var0 = (sockaddr)self[5].var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[5].var2.sin6_addr + 12);
  return self;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)primaryIPv4Addr
{
  retstr->var0 = (sockaddr)self[4].var2.sin6_addr;
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = *(in6_addr *)((char *)&self[4].var2.sin6_addr + 12);
  return self;
}

- (void)setInterfacesChangedHandler:(id)a3
{
}

- (id)interfacesChangedHandler
{
  return self->_interfacesChangedHandler;
}

- (void)setInterfaces:(id)a3
{
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setFlagsChangedHandler:(id)a3
{
}

- (id)flagsChangedHandler
{
  return self->_flagsChangedHandler;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)_primaryIPChangedNW:(BOOL)a3
{
  v4 = nw_path_evaluator_copy_path();
  if (!v4)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_25;
        }
        ucat = self->_ucat;
      }
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### No NW path", v5, v6, v7, v8, v71);
    }
LABEL_25:
    v19 = 0;
    v9 = 0;
    goto LABEL_26;
  }
  v9 = v4;
  if (nw_path_get_status(v4) != nw_path_status_satisfied)
  {
    v41 = self->_ucat;
    if (v41->var0 <= 30)
    {
      if (v41->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v41, 0x1Eu)) {
          goto LABEL_24;
        }
        v41 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v41, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x1Eu, (uint64_t)"Path not satisfied", v10, v11, v12, v13, v71);
    }
LABEL_24:

    goto LABEL_25;
  }
  v14 = nw_path_copy_interface();
  if (!v14)
  {
    v42 = self->_ucat;
    if (v42->var0 <= 90)
    {
      if (v42->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v42, 0x5Au)) {
          goto LABEL_58;
        }
        v42 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v42, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### No primary interface", v15, v16, v17, v18, v71);
    }
LABEL_58:
    v19 = 0;
    goto LABEL_26;
  }
  v19 = v14;
  name = nw_interface_get_name(v14);
  if (!name)
  {
    v43 = self->_ucat;
    if (v43->var0 <= 90)
    {
      if (v43->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v43, 0x5Au)) {
          goto LABEL_26;
        }
        v43 = self->_ucat;
      }
      LogPrintF_safe((uint64_t)v43, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### No interface name", v21, v22, v23, v24, v71);
    }
LABEL_26:
    memset(v76, 0, 28);
    memset(v75, 0, 28);
    goto LABEL_27;
  }
  uint64_t v25 = (uint64_t)name;
  memset(v76, 0, 28);
  memset(v75, 0, 28);
  uint64_t v26 = CUGetInterfaceAddresses((self->_controlFlags >> 2) & 2, name, v76, (uint64_t)v75, 0);
  if (v26)
  {
    v34 = self->_ucat;
    if (v34->var0 <= 90)
    {
      uint64_t v35 = v26;
      if (v34->var0 != -1)
      {
LABEL_8:
        v72 = NSPrintF((uint64_t)"%#m", v27, v28, v29, v30, v31, v32, v33, v35);
        LogPrintF_safe((uint64_t)v34, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", 0x5Au, (uint64_t)"### Get interface addresses failed: interface=%s, error=%@", v36, v37, v38, v39, v25);

        goto LABEL_27;
      }
      if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au))
      {
        v34 = self->_ucat;
        goto LABEL_8;
      }
    }
  }
LABEL_27:
  p_primaryIPv4Addr = &self->_primaryIPv4Addr;
  if (SockAddrCompareAddrEx(v76, (uint64_t)&self->_primaryIPv4Addr, 1))
  {
    if (v76[0].sa_family)
    {
      if (v76[0].sa_family == 30)
      {
        p_primaryIPv4Addr->sa = v76[0];
        *(sockaddr *)((char *)&self->_primaryIPv4Addr.v6.sin6_addr + 4) = *(sockaddr *)&v76[0].sa_data[10];
      }
      else if (v76[0].sa_family == 2)
      {
        p_primaryIPv4Addr->sa = v76[0];
      }
    }
    else
    {
      self->_primaryIPv4Addr.sa.sa_family = 0;
    }
    p_primaryIPv6Addr = &self->_primaryIPv6Addr;
    int v53 = 1;
    if (!SockAddrCompareAddrEx(v75, (uint64_t)&self->_primaryIPv6Addr, 1))
    {
      signed int v54 = 30;
      goto LABEL_45;
    }
  }
  else
  {
    p_primaryIPv6Addr = &self->_primaryIPv6Addr;
    if (!SockAddrCompareAddrEx(v75, (uint64_t)&self->_primaryIPv6Addr, 1))
    {
      int v53 = 0;
      signed int v54 = 20;
      goto LABEL_45;
    }
  }
  if (BYTE1(v75[0]))
  {
    if (BYTE1(v75[0]) == 30)
    {
      p_primaryIPv6Addr->sa = (sockaddr)v75[0];
      *(in6_addr *)((char *)&p_primaryIPv6Addr->v6.sin6_addr + 4) = *(in6_addr *)((char *)v75 + 12);
    }
    else if (BYTE1(v75[0]) == 2)
    {
      p_primaryIPv6Addr->sa = (sockaddr)v75[0];
    }
  }
  else
  {
    self->_primaryIPv6Addr.sa.sa_family = 0;
  }
  signed int v54 = 30;
  int v53 = 1;
LABEL_45:
  v55 = self->_ucat;
  if (v54 >= v55->var0)
  {
    if (v55->var0 != -1)
    {
      v73 = v9;
      v74 = v19;
LABEL_48:
      if (v53) {
        v56 = "changed";
      }
      else {
        v56 = "unchanged";
      }
      v57 = NSPrintF((uint64_t)"%##a", v46, v47, v48, v49, v50, v51, v52, (uint64_t)&self->_primaryIPv4Addr);
      v65 = NSPrintF((uint64_t)"%##a", v58, v59, v60, v61, v62, v63, v64, (uint64_t)p_primaryIPv6Addr);
      LogPrintF_safe((uint64_t)v55, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChangedNW:]", v54, (uint64_t)"Primary IPs %s: interface=%s, IPv4=%@, IPv6=%@ %s", v66, v67, v68, v69, (uint64_t)v56);

      v9 = v73;
      v19 = v74;
      goto LABEL_53;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, v54))
    {
      v73 = v9;
      v74 = v19;
      v55 = self->_ucat;
      goto LABEL_48;
    }
  }
LABEL_53:
  if (v53)
  {
    primaryIPChangedHandler = (void (**)(void))self->_primaryIPChangedHandler;
    if (primaryIPChangedHandler) {
      primaryIPChangedHandler[2]();
    }
  }
}

- (void)_primaryIPChanged:(BOOL)a3
{
  scStore = self->_scStore;
  if (scStore)
  {
    memset(v48, 0, 28);
    memset(v47, 0, 28);
    uint64_t PrimaryIPAddress = GetPrimaryIPAddressEx(scStore, (uint64_t)v48, (uint64_t)v47);
    if (PrimaryIPAddress)
    {
      uint64_t v15 = PrimaryIPAddress;
      ucat = self->_ucat;
      if (ucat->var0 <= 90)
      {
        if (ucat->var0 != -1)
        {
LABEL_5:
          LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x5Au, (uint64_t)"### GetPrimaryIP failed: %#m\n", v11, v12, v13, v14, v15);
          return;
        }
        if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
        {
          ucat = self->_ucat;
          goto LABEL_5;
        }
      }
      return;
    }
    p_primaryIPv4Addr = &self->_primaryIPv4Addr;
    if (!SockAddrCompareAddrEx(v48, (uint64_t)&self->_primaryIPv4Addr, 1)) {
      goto LABEL_23;
    }
    if (BYTE1(v48[0]))
    {
      if (BYTE1(v48[0]) == 30)
      {
        p_primaryIPv4Addr->sa = (sockaddr)v48[0];
        *(in6_addr *)((char *)&self->_primaryIPv4Addr.v6.sin6_addr + 4) = *(in6_addr *)((char *)v48 + 12);
        if (!a3) {
          goto LABEL_25;
        }
        goto LABEL_23;
      }
      if (BYTE1(v48[0]) == 2)
      {
        p_primaryIPv4Addr->sa = (sockaddr)v48[0];
        if (!a3)
        {
LABEL_25:
          uint64_t v24 = self->_ucat;
          if (v24->var0 <= 30)
          {
            if (v24->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v24, 0x1Eu)) {
                goto LABEL_29;
              }
              uint64_t v24 = self->_ucat;
            }
            LogPrintF((uint64_t)v24, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x1Eu, (uint64_t)"PrimaryIPv4 changed: %##a\n", v19, v20, v21, v22, (uint64_t)v48);
          }
LABEL_29:
          int v23 = 1;
LABEL_30:
          p_primaryIPv6Addr = &self->_primaryIPv6Addr;
          if (!SockAddrCompareAddrEx(v47, (uint64_t)&self->_primaryIPv6Addr, 1)) {
            goto LABEL_38;
          }
          if (BYTE1(v47[0]))
          {
            if (BYTE1(v47[0]) == 30)
            {
              p_primaryIPv6Addr->sa = (sockaddr)v47[0];
              *(in6_addr *)((char *)&self->_primaryIPv6Addr.v6.sin6_addr + 4) = *(in6_addr *)((char *)v47 + 12);
              if (!a3) {
                goto LABEL_41;
              }
              goto LABEL_38;
            }
            if (BYTE1(v47[0]) == 2)
            {
              p_primaryIPv6Addr->sa = (sockaddr)v47[0];
              if (!a3)
              {
LABEL_41:
                uint64_t v30 = self->_ucat;
                if (v30->var0 <= 30)
                {
                  if (v30->var0 == -1)
                  {
                    if (!_LogCategory_Initialize((uint64_t)v30, 0x1Eu)) {
                      goto LABEL_45;
                    }
                    uint64_t v30 = self->_ucat;
                  }
                  LogPrintF((uint64_t)v30, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x1Eu, (uint64_t)"PrimaryIPv6 changed: %##a\n", v26, v27, v28, v29, (uint64_t)v47);
                }
LABEL_45:
                uint64_t v31 = _Block_copy(self->_primaryIPChangedHandler);
                uint64_t v32 = v31;
                if (v31) {
                  (*((void (**)(void *))v31 + 2))(v31);
                }

LABEL_48:
                if (!self->_primaryNetworkChangedHandler) {
                  return;
                }
                active = (void *)SCNetworkSignatureCopyActiveIdentifiers();
                v34 = [active firstObject];
                primaryNetworkSignature = self->_primaryNetworkSignature;
                uint64_t v36 = v34;
                uint64_t v37 = primaryNetworkSignature;
                if (v36 == v37)
                {

                  v40 = v36;
LABEL_62:

                  goto LABEL_63;
                }
                uint64_t v38 = v37;
                if ((v36 == 0) != (v37 != 0))
                {
                  char v39 = [(NSString *)v36 isEqual:v37];

                  if (v39) {
                    goto LABEL_63;
                  }
                }
                else
                {
                }
                objc_storeStrong((id *)&self->_primaryNetworkSignature, v34);
                if (a3)
                {
LABEL_63:

                  return;
                }
                v45 = self->_ucat;
                if (v45->var0 <= 30)
                {
                  if (v45->var0 != -1)
                  {
LABEL_58:
                    LogPrintF((uint64_t)v45, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x1Eu, (uint64_t)"PrimaryNetwork changed: %@\n", v41, v42, v43, v44, (uint64_t)v36);
                    goto LABEL_60;
                  }
                  if (_LogCategory_Initialize((uint64_t)v45, 0x1Eu))
                  {
                    v45 = self->_ucat;
                    goto LABEL_58;
                  }
                }
LABEL_60:
                uint64_t v46 = (NSString *)_Block_copy(self->_primaryNetworkChangedHandler);
                v40 = v46;
                if (v46) {
                  ((void (*)(NSString *))v46[2])(v46);
                }
                goto LABEL_62;
              }
LABEL_38:
              if (!v23) {
                goto LABEL_48;
              }
              goto LABEL_45;
            }
          }
          else
          {
            self->_primaryIPv6Addr.sa.sa_family = 0;
          }
          if (!a3) {
            goto LABEL_41;
          }
          goto LABEL_38;
        }
LABEL_23:
        int v23 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      self->_primaryIPv4Addr.sa.sa_family = 0;
    }
    if (!a3) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  uint64_t v17 = self->_ucat;
  if (v17->var0 > 90) {
    return;
  }
  if (v17->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au)) {
      return;
    }
    uint64_t v17 = self->_ucat;
  }
  LogPrintF((uint64_t)v17, (uint64_t)"-[CUNetInterfaceMonitor _primaryIPChanged:]", 0x5Au, (uint64_t)"### PrimaryIP changed with no SCStore\n", v3, v4, v5, v6, v50);
}

- (void)_networkInterfacesChanged:(BOOL)a3
{
  BOOL v47 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  int v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    if (*__error())
    {
      uint64_t v15 = *__error();
      if (!v15) {
        goto LABEL_2;
      }
    }
    else
    {
      uint64_t v15 = 4294960596;
    }
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 0x5Au, (uint64_t)"### Open socket failed: %#m\n", v11, v12, v13, v14, v15);
    return;
  }
LABEL_2:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke;
  aBlock[3] = &__block_descriptor_36_e5_v8__0l;
  int v52 = v4;
  uint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v50 = 0;
  if (!getifaddrs(&v50))
  {
    uint64_t v10 = 0;
LABEL_10:
    if (v50) {
      goto LABEL_21;
    }
    goto LABEL_13;
  }
  if (!*__error())
  {
    uint64_t v10 = 4294960596;
    goto LABEL_13;
  }
  uint64_t v10 = *__error();
  if (!v10) {
    goto LABEL_10;
  }
LABEL_13:
  uint64_t v16 = self->_ucat;
  if (v16->var0 > 90) {
    goto LABEL_21;
  }
  if (v16->var0 != -1) {
    goto LABEL_15;
  }
  if (_LogCategory_Initialize((uint64_t)v16, 0x5Au))
  {
    uint64_t v16 = self->_ucat;
LABEL_15:
    LogPrintF((uint64_t)v16, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 0x5Au, (uint64_t)"### Get interface list failed: %#m\n", v6, v7, v8, v9, v10);
  }
LABEL_21:
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke_2;
  v49[3] = &__block_descriptor_40_e5_v8__0l;
  v49[4] = v50;
  uint64_t v18 = (void (**)(void))_Block_copy(v49);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v20 = v50;
  if (v50)
  {
    unsigned int v21 = 0;
    while (1)
    {
      unsigned int ifa_flags = v20->ifa_flags;
      if ((ifa_flags & 1) != 0 && ((ifa_flags & 8) == 0 || (self->_controlFlags & 2) != 0))
      {
        uint64_t ifa_addr = (uint64_t)v20->ifa_addr;
        if (ifa_addr)
        {
          int v24 = *(unsigned __int8 *)(ifa_addr + 1);
          if (v24 == 30 || v24 == 2)
          {
            ifa_name = v20->ifa_name;
            if (ifa_name) {
              break;
            }
          }
        }
      }
LABEL_44:
      uint64_t v20 = v20->ifa_next;
      if (!v20) {
        goto LABEL_47;
      }
    }
    int v48 = 0;
    SocketGetInterfaceInfo(v4, ifa_name, 0, 0, 0, 0, 0, 0, 0, (uint64_t)&v48);
    uint64_t v31 = self->_ucat;
    if (v31->var0 <= 9)
    {
      if (v31->var0 != -1)
      {
LABEL_37:
        LogPrintF((uint64_t)v31, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 9u, (uint64_t)"Network interface: Nm '%s', Type %s\n", v27, v28, v29, v30, (uint64_t)ifa_name);
        goto LABEL_38;
      }
      if (_LogCategory_Initialize((uint64_t)v31, 9u))
      {
        uint64_t v31 = self->_ucat;
        goto LABEL_37;
      }
    }
LABEL_38:
    if ((v48 & 8) != 0) {
      unsigned int v21 = 1;
    }
    uint64_t v32 = objc_alloc_init(CUNetInterfaceInfo);
    uint64_t v33 = [NSString stringWithUTF8String:ifa_name];
    [(CUNetInterfaceInfo *)v32 setInterfaceName:v33];
    if (*(unsigned char *)(ifa_addr + 1) == 2)
    {
      v53[0] = 0;
      SockAddrToString(ifa_addr, 1, v53);
      if (v53[0])
      {
        v34 = [NSString stringWithUTF8String:v53];
        [(CUNetInterfaceInfo *)v32 setIpv4String:v34];
      }
    }
    [v19 setObject:v32 forKeyedSubscript:v33];

    goto LABEL_44;
  }
  unsigned int v21 = 0;
LABEL_47:
  uint64_t v35 = [v19 allValues];
  interfaces = self->_interfaces;
  self->_interfaces = v35;

  uint64_t v37 = _Block_copy(self->_interfacesChangedHandler);
  uint64_t v38 = v37;
  if (v37) {
    (*((void (**)(void *))v37 + 2))(v37);
  }

  uint64_t flags = self->_flags;
  if (v21 == flags) {
    goto LABEL_61;
  }
  if (!v47)
  {
    uint64_t v44 = self->_ucat;
    if (v44->var0 <= 30)
    {
      if (v44->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v44, 0x1Eu)) {
          goto LABEL_58;
        }
        uint64_t v44 = self->_ucat;
        uint64_t flags = self->_flags;
      }
      LogPrintF((uint64_t)v44, (uint64_t)"-[CUNetInterfaceMonitor _networkInterfacesChanged:]", 0x1Eu, (uint64_t)"Network interface flags changed: %#{flags} -> %#{flags}\n", v39, v40, v41, v42, flags);
    }
LABEL_58:
    self->_uint64_t flags = v21;
    v45 = _Block_copy(self->_flagsChangedHandler);
    uint64_t v46 = v45;
    if (v45) {
      (*((void (**)(void *))v45 + 2))(v45);
    }

    goto LABEL_61;
  }
  self->_uint64_t flags = v21;
LABEL_61:

  v18[2](v18);
  v5[2](v5);
}

uint64_t __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __51__CUNetInterfaceMonitor__networkInterfacesChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    JUMPOUT(0x192FAA4D0);
  }
  return result;
}

- (void)_ensureStopped
{
  if (self->_scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_6;
        }
        ucat = self->_ucat;
      }
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _ensureStopped]", 0x1Eu, (uint64_t)"Monitoring stop SC", v2, v3, v4, v5, v10);
    }
LABEL_6:
    SCDynamicStoreSetDispatchQueue(self->_scStore, 0);
    CFRelease(self->_scStore);
    self->_scStore = 0;
  }
  if (!self->_nwPathEvaluator) {
    return;
  }
  uint64_t v8 = self->_ucat;
  if (v8->var0 <= 30)
  {
    if (v8->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu)) {
        goto LABEL_13;
      }
      uint64_t v8 = self->_ucat;
    }
    LogPrintF_safe((uint64_t)v8, (uint64_t)"-[CUNetInterfaceMonitor _ensureStopped]", 0x1Eu, (uint64_t)"Monitoring stop NW", v2, v3, v4, v5, v10);
  }
LABEL_13:
  nw_path_evaluator_cancel();
  nwPathEvaluator = self->_nwPathEvaluator;
  self->_nwPathEvaluator = 0;
}

- (void)_ensureStartedNW
{
  if (self->_nwPathEvaluator) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = MEMORY[0x1E4F38CB8] == 0;
  }
  if (v6) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedNW]", 0x1Eu, (uint64_t)"Monitoring start NW", v2, v3, v4, v5, v14);
  }
LABEL_9:
  uint64_t v9 = nw_parameters_create();
  xpc_object_t v10 = xpc_array_create(0, 0);
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NetworkExtension");
  xpc_array_set_string(v10, 0xFFFFFFFFFFFFFFFFLL, "NetworkExtension");
  xpc_object_t v11 = xpc_array_create(0, 0);
  xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, "VPN");
  xpc_array_set_string(v11, 0xFFFFFFFFFFFFFFFFLL, "AppVPN");
  nw_parameters_set_avoided_netagent_classes();
  nw_parameters_prohibit_interface_type(v9, nw_interface_type_other);
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
  nwPathEvaluator = self->_nwPathEvaluator;
  self->_nwPathEvaluator = evaluator_for_endpoint;

  if (self->_nwPathEvaluator)
  {
    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __41__CUNetInterfaceMonitor__ensureStartedNW__block_invoke;
    uint64_t v17 = &unk_1E55BE990;
    objc_copyWeak(&v18, &location);
    nw_path_evaluator_set_update_handler();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  -[CUNetInterfaceMonitor _primaryIPChangedNW:](self, "_primaryIPChangedNW:", 1, v14, v15, v16, v17);
}

void __41__CUNetInterfaceMonitor__ensureStartedNW__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _primaryIPChangedNW:0];
}

- (void)_ensureStartedSC
{
  if (!self->_scStore)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_6;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
LABEL_6:
        context.version = 0;
        context.info = self;
        context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
        context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
        context.copyDescription = 0;
        if (self->_label)
        {
          NSPrintF((uint64_t)"CUNetInterfaceMonitor-%@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_label);
        }
        else
        {
          uint64_t v41 = getprogname();
          NSPrintF((uint64_t)"CUNetInterfaceMonitor-%s", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v41);
        }
        uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        SCDynamicStoreRef v18 = SCDynamicStoreCreate(0, v17, (SCDynamicStoreCallBack)_networkInterfacesChanged, &context);
        if (!v18)
        {
          if (!SCError())
          {
            uint64_t v37 = 4294960596;
            goto LABEL_33;
          }
          uint64_t v37 = SCError();
          if (v37) {
            goto LABEL_33;
          }
        }
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        if (!Mutable)
        {
          uint64_t v37 = 4294960568;
          if (!v18)
          {
LABEL_30:
            if (!v37) {
              goto LABEL_38;
            }
LABEL_33:
            uint64_t v39 = self->_ucat;
            if (v39->var0 <= 90)
            {
              if (v39->var0 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v39, 0x5Au)) {
                  goto LABEL_37;
                }
                uint64_t v39 = self->_ucat;
              }
              LogPrintF((uint64_t)v39, (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedSC]", 0x5Au, (uint64_t)"### Monitoring start failed: %#m\n", v20, v21, v22, v23, v37);
            }
LABEL_37:
            [(CUNetInterfaceMonitor *)self _ensureStopped];
LABEL_38:

            return;
          }
LABEL_29:
          CFRelease(v18);
          goto LABEL_30;
        }
        int v24 = Mutable;
        CFStringRef v25 = (const __CFString *)*MEMORY[0x1E4F41AC8];
        CFStringRef v26 = (const __CFString *)*MEMORY[0x1E4F41AB8];
        CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F41B10];
        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B10]);
        if (!NetworkInterfaceEntity) {
          goto LABEL_40;
        }
        CFStringRef v29 = NetworkInterfaceEntity;
        CFArrayAppendValue(v24, NetworkInterfaceEntity);
        CFRelease(v29);
        CFStringRef v30 = (const __CFString *)*MEMORY[0x1E4F41B18];
        CFStringRef v31 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v25, v26, (CFStringRef)*MEMORY[0x1E4F41B18]);
        if (!v31) {
          goto LABEL_40;
        }
        CFStringRef v32 = v31;
        CFArrayAppendValue(v24, v31);
        CFRelease(v32);
        CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v25, v27);
        if (!NetworkGlobalEntity
          || (CFStringRef v34 = NetworkGlobalEntity,
              CFArrayAppendValue(v24, NetworkGlobalEntity),
              CFRelease(v34),
              (CFStringRef v35 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v25, v30)) == 0))
        {
LABEL_40:
          uint64_t v37 = 4294960568;
LABEL_28:
          CFRelease(v24);
          if (!v18) {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
        CFStringRef v36 = v35;
        CFArrayAppendValue(v24, v35);
        CFRelease(v36);
        if (!SCDynamicStoreSetNotificationKeys(v18, 0, v24))
        {
          if (!SCError())
          {
LABEL_27:
            uint64_t v37 = 4294960596;
            goto LABEL_28;
          }
          uint64_t v38 = SCError();
          if (v38)
          {
LABEL_26:
            uint64_t v37 = v38;
            goto LABEL_28;
          }
        }
        if (SCDynamicStoreSetDispatchQueue(v18, (dispatch_queue_t)self->_dispatchQueue))
        {
LABEL_17:
          self->_scStore = v18;
          [(CUNetInterfaceMonitor *)self _networkInterfacesChanged:1];
          [(CUNetInterfaceMonitor *)self _primaryIPChanged:1];
          SCDynamicStoreRef v18 = 0;
          uint64_t v37 = 0;
          goto LABEL_28;
        }
        if (SCError())
        {
          uint64_t v38 = SCError();
          if (!v38) {
            goto LABEL_17;
          }
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _ensureStartedSC]", 0x1Eu, (uint64_t)"Monitoring start SC", v4, v5, v6, v7, v40);
    goto LABEL_6;
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id flagsChangedHandler = self->_flagsChangedHandler;
    self->_id flagsChangedHandler = 0;

    id interfacesChangedHandler = self->_interfacesChangedHandler;
    self->_id interfacesChangedHandler = 0;

    id v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id primaryIPChangedHandler = self->_primaryIPChangedHandler;
    self->_id primaryIPChangedHandler = 0;

    id primaryNetworkChangedHandler = self->_primaryNetworkChangedHandler;
    self->_id primaryNetworkChangedHandler = 0;

    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_9;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v14);
LABEL_9:
    self->_invalidateDone = 1;
  }
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetInterfaceMonitor _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v8);
  }
LABEL_6:
  self->_invalidateCalled = 1;
  [(CUNetInterfaceMonitor *)self _ensureStopped];
  [(CUNetInterfaceMonitor *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CUNetInterfaceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__CUNetInterfaceMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CUNetInterfaceMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __48__CUNetInterfaceMonitor_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 32);
  if (*v10 > 30) {
    goto LABEL_5;
  }
  if (*v10 != -1) {
    goto LABEL_3;
  }
  BOOL v11 = _LogCategory_Initialize(*(void *)(v9 + 32), 0x1Eu);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v10 = *(int **)(v9 + 32);
LABEL_3:
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNetInterfaceMonitor activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v14);
    uint64_t v9 = *(void *)(a1 + 32);
  }
LABEL_5:
  if ((*(unsigned char *)(v9 + 40) & 4) != 0) {
    [(id)v9 _ensureStartedNW];
  }
  else {
    [(id)v9 _ensureStartedSC];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CBFA8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (id)description
{
  return NSPrintF((uint64_t)"CUNetInterfaceMonitor", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUNetInterfaceMonitor;
  [(CUNetInterfaceMonitor *)&v4 dealloc];
}

- (CUNetInterfaceMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUNetInterfaceMonitor;
  uint64_t v2 = [(CUNetInterfaceMonitor *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_CUNetInterfaceMonitor;
    objc_super v4 = v3;
  }

  return v3;
}

@end