@interface CUPairingXPCConnection
- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5;
- (void)connectionInvalidated;
- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)showWithCompletion:(id)a3;
- (void)startMonitoringWithOptions:(unint64_t)a3;
@end

@implementation CUPairingXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

- (void)startMonitoringWithOptions:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection startMonitoringWithOptions:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v4, v5, v6, v7, @"StartMonitoring");
  }
  if ([(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.Read" state:&self->_pmEntitledRead label:@"StartMonitoring"])
  {
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection startMonitoringWithOptions:]", 0x3Cu, (uint64_t)"### %@ %#{flags} failed: %#m\n", v8, v9, v10, v11, @"StartMonitoring");
    }
  }
  else
  {
    self->_monitoring = 1;
  }
}

- (void)showWithCompletion:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection showWithCompletion:]", 0x1Eu, (uint64_t)"%@\n", v5, v6, v7, v8, @"Show");
  }
  int v9 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.Read" state:&self->_pmEntitledRead label:@"Show"];
  if (v9)
  {
    int v16 = v9;
  }
  else
  {
    uint64_t v14 = [(CUPairingDaemon *)self->_daemon detailedDescription];
    if (v14)
    {
      v15 = (void *)v14;
      if (v4) {
        v4[2](v4, v14, 0);
      }
      goto LABEL_9;
    }
    int v16 = -6762;
  }
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection showWithCompletion:]", 0x3Cu, (uint64_t)"### %@ failed: %#m\n", v10, v11, v12, v13, @"Show");
  }
  if (v4)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28760];
    uint64_t v19 = v16;
    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v16, 0, 0));
    v21 = (void *)v20;
    v22 = @"?";
    if (v20) {
      v22 = (__CFString *)v20;
    }
    v26[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v24 = [v17 errorWithDomain:v18 code:v19 userInfo:v23];
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v24);
  }
  v15 = 0;
LABEL_9:
}

- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    v31 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection removePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"%@ %@ %#{flags}\n", v10, v11, v12, v13, @"RemovePairedPeer");
  }
  if ((a4 & 0x138) != 0)
  {
    int v17 = -6735;
    BOOL v18 = 1;
LABEL_13:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      v32 = [v8 identifier];
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection removePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### %@ %@ %#{flags} failed: %#m\n", v19, v20, v21, v22, @"RemovePairedPeer");
    }
    goto LABEL_17;
  }
  int v14 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.RemovePeer" state:&self->_pmEntitledRemovePeer label:@"RemovePairedPeer"];
  if (!v14)
  {
    if (self->_pmEntitledRemoveAdmin)
    {
      BOOL pmEntitledRemoveAdmin = 1;
    }
    else
    {
      int v16 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.PairingManager.RemoveAdmin"];
      self->_BOOL pmEntitledRemoveAdmin = [v16 isEqual:MEMORY[0x1E4F1CC38]];

      BOOL pmEntitledRemoveAdmin = self->_pmEntitledRemoveAdmin;
    }
    int v14 = [(CUPairingDaemon *)self->_daemon removePairedPeer:v8 options:a4 removeAdminAllowed:pmEntitledRemoveAdmin];
  }
  int v17 = v14;
  BOOL v18 = v14 != 0;
  if (v14 != -25300 && v14) {
    goto LABEL_13;
  }
LABEL_17:
  if (v9)
  {
    if (v18)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28760];
      uint64_t v25 = v17;
      uint64_t v33 = *MEMORY[0x1E4F28568];
      uint64_t v26 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
      v27 = (void *)v26;
      v28 = @"?";
      if (v26) {
        v28 = (__CFString *)v26;
      }
      v34[0] = v28;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      v30 = [v23 errorWithDomain:v24 code:v25 userInfo:v29];
      v9[2](v9, v30);
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    v30 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection savePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"%@ %@ %#{flags}\n", v10, v11, v12, v13, @"SavePairedPeer");
  }
  if ((a4 & 0x138) != 0)
  {
    int v17 = -6735;
    goto LABEL_11;
  }
  int v14 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.Write" state:&self->_pmEntitledWrite label:@"SavePairedPeer"];
  if (v14)
  {
    int v17 = v14;
LABEL_11:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      v31 = [v8 identifier];
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection savePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### %@ %@ %#{flags} failed: %#m\n", v18, v19, v20, v21, @"SavePairedPeer");
    }
    if (v9)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28760];
      uint64_t v24 = v17;
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
      uint64_t v26 = (void *)v25;
      v27 = @"?";
      if (v25) {
        v27 = (__CFString *)v25;
      }
      v33[0] = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      v29 = [v22 errorWithDomain:v23 code:v24 userInfo:v28];
      v9[2](v9, v29);
    }
    goto LABEL_21;
  }
  if (self->_pmEntitledRemoveAdmin)
  {
    BOOL pmEntitledRemoveAdmin = 1;
  }
  else
  {
    int v16 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.PairingManager.RemoveAdmin"];
    self->_BOOL pmEntitledRemoveAdmin = [v16 isEqual:MEMORY[0x1E4F1CC38]];

    BOOL pmEntitledRemoveAdmin = self->_pmEntitledRemoveAdmin;
  }
  int v17 = [(CUPairingDaemon *)self->_daemon savePairedPeer:v8 options:a4 removeAdminAllowed:pmEntitledRemoveAdmin];
  if (v17) {
    goto LABEL_11;
  }
  if (v9) {
    v9[2](v9, 0);
  }
LABEL_21:
}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (void (**)(id, void *, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    v29 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection findPairedPeer:options:completion:]", 0x1Eu, (uint64_t)"%@ %@ %#{flags}\n", v10, v11, v12, v13, @"FindPairedPeer");
  }
  int v14 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.Read" state:&self->_pmEntitledRead label:@"FindPairedPeer"];
  int v30 = v14;
  if (v14
    || (a4 & 0x138) != 0
    && (int v14 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.HomeKit" state:&self->_pmEntitledHomeKit label:@"FindPairedPeer"], (v30 = v14) != 0))
  {
    v15 = 0;
    goto LABEL_10;
  }
  v15 = [(CUPairingDaemon *)self->_daemon findPairedPeer:v8 options:a4 error:&v30];
  int v14 = v30;
  if (v30 || v15)
  {
LABEL_10:
    if (v14 == -25300 || !v14) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
  int v30 = -6762;
LABEL_12:
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    int v16 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection findPairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### %@ %@ %#{flags} failed: %#m\n", v17, v18, v19, v20, @"FindPairedPeer");
  }
LABEL_16:
  if (v9)
  {
    uint64_t v21 = v30;
    if (v30)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28760];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v30, 0, 0));
      uint64_t v25 = (void *)v24;
      uint64_t v26 = @"?";
      if (v24) {
        uint64_t v26 = (__CFString *)v24;
      }
      v32[0] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v28 = [v22 errorWithDomain:v23 code:v21 userInfo:v27];
      v9[2](v9, v15, v28);
    }
    else
    {
      v9[2](v9, v15, 0);
    }
  }
}

- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairedPeersWithOptions:completion:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v7, v8, v9, v10, @"GetPairedPeers");
  }
  if ((a3 & 0x138) != 0)
  {
    id v11 = 0;
    int v20 = -6735;
LABEL_24:
    int v21 = v20;
    goto LABEL_10;
  }
  int v21 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.Read" state:&self->_pmEntitledRead label:@"GetPairedPeers"];
  if (!v21)
  {
    id v11 = [(CUPairingDaemon *)self->_daemon copyPairedPeersWithOptions:a3 error:&v21];
    if (v21 || v11)
    {
      if (!v21) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
    int v20 = -6762;
    goto LABEL_24;
  }
  id v11 = 0;
LABEL_10:
  if (gLogCategory_CUPairingDaemon <= 60
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairedPeersWithOptions:completion:]", 0x3Cu, (uint64_t)"### %@ %#{flags} failed: %#m\n", v7, v8, v9, v10, @"GetPairedPeers");
  }
LABEL_14:
  if (v6)
  {
    uint64_t v12 = v21;
    if (v21)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28760];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v21, 0, 0));
      int v16 = (void *)v15;
      uint64_t v17 = @"?";
      if (v15) {
        uint64_t v17 = (__CFString *)v15;
      }
      v23[0] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v19 = [v13 errorWithDomain:v14 code:v12 userInfo:v18];
      v6[2](v6, v11, v19);
    }
    else
    {
      v6[2](v6, v11, 0);
    }
  }
}

- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection deletePairingIdentityWithOptions:completion:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v7, v8, v9, v10, @"DeletePairingIdentity");
  }
  if ((a3 & 0x138) != 0)
  {
    int v12 = -6735;
    BOOL v13 = 1;
LABEL_10:
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection deletePairingIdentityWithOptions:completion:]", 0x3Cu, (uint64_t)"### %@ %#{flags} failed: %#m\n", v7, v8, v9, v10, @"DeletePairingIdentity");
    }
    goto LABEL_14;
  }
  int v11 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.DeleteIdentity" state:&self->_pmEntitledDeleteIdentity label:@"DeletePairingIdentity"];
  if (!v11) {
    int v11 = [(CUPairingDaemon *)self->_daemon deleteIdentityWithOptions:a3];
  }
  int v12 = v11;
  BOOL v13 = v11 != 0;
  if (v11 != -25300 && v11) {
    goto LABEL_10;
  }
LABEL_14:
  if (v6)
  {
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28760];
      uint64_t v16 = v12;
      uint64_t v22 = *MEMORY[0x1E4F28568];
      uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v12, 0, 0));
      uint64_t v18 = (void *)v17;
      uint64_t v19 = @"?";
      if (v17) {
        uint64_t v19 = (__CFString *)v17;
      }
      v23[0] = v19;
      int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      int v21 = [v14 errorWithDomain:v15 code:v16 userInfo:v20];
      v6[2](v6, v21);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairingIdentityWithOptions:completion:]", 0x1Eu, (uint64_t)"%@ %#{flags}\n", v7, v8, v9, v10, @"GetPairingIdentity");
  }
  int v11 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.Read" state:&self->_pmEntitledRead label:@"GetPairingIdentity"];
  if (v11
    || (a3 & 0x138) != 0
    && (int v11 = [(CUPairingXPCConnection *)self _entitled:@"com.apple.PairingManager.HomeKit" state:&self->_pmEntitledHomeKit label:@"GetPairingIdentity"]) != 0)
  {
    int v16 = v11;
    if (v11 != -25300
      && gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection getPairingIdentityWithOptions:completion:]", 0x3Cu, (uint64_t)"### %@ failed: %#m\n", v12, v13, v14, v15, @"GetPairingIdentity");
    }
    if (v6)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28760];
      uint64_t v19 = v16;
      uint64_t v25 = *MEMORY[0x1E4F28568];
      uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v16, 0, 0));
      int v21 = (void *)v20;
      uint64_t v22 = @"?";
      if (v20) {
        uint64_t v22 = (__CFString *)v20;
      }
      v26[0] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v24 = [v17 errorWithDomain:v18 code:v19 userInfo:v23];
      v6[2](v6, 0, v24);
    }
  }
  else
  {
    [(CUPairingDaemon *)self->_daemon getIdentityWithOptions:a3 completionHandler:v6];
  }
}

- (int)_entitled:(id)a3 state:(BOOL *)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (*a4
    || ([(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:v8],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        *a4 = [v10 isEqual:MEMORY[0x1E4F1CC38]],
        v10,
        *a4)
    || [(CUPairingDaemon *)self->_daemon testMode])
  {
    int v11 = 0;
  }
  else
  {
    int v11 = -71168;
    if (gLogCategory_CUPairingDaemon <= 60
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu)))
    {
      uint64_t v13 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection _entitled:state:label:]", 0x3Cu, (uint64_t)"### %#{pid} lacks '%@' entitlement to use %@\n", v14, v15, v16, v17, v13);
    }
  }

  return v11;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingDaemon <= 20
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x14u)))
  {
    uint64_t v3 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingXPCConnection connectionInvalidated]", 0x14u, (uint64_t)"XPC connection invalidated from %#{pid}\n", v4, v5, v6, v7, v3);
  }
}

@end