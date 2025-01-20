@interface CUPairingDaemon
+ (id)sharedPairingDaemon;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)testMode;
- (CUPairingDaemon)init;
- (NSString)description;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_copyHomeKitExWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyHomeKitLocalPairingIDWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyHomeKitWithOptionsHAP:(unint64_t)a3 error:(int *)a4;
- (id)_copyHomeKitWithOptionsKeychain:(unint64_t)a3 error:(int *)a4;
- (id)_copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyOrCreateWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)_findHomeKitExPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)_findHomeKitPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)_findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4;
- (id)detailedDescription;
- (id)findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5;
- (id)initStandalone;
- (int)_deleteIdentityWithOptions:(unint64_t)a3;
- (int)_removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (int)_saveIdentity:(id)a3 options:(unint64_t)a4;
- (int)_savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (int)deleteIdentityWithOptions:(unint64_t)a3;
- (int)removePairedPeer:(id)a3 options:(unint64_t)a4;
- (int)removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (int)savePairedPeer:(id)a3 options:(unint64_t)a4;
- (int)savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5;
- (void)_activate;
- (void)_connectionInvalidated:(id)a3;
- (void)_invalidate;
- (void)_removeDups:(id)a3;
- (void)_rpIdentityUpdate;
- (void)activate;
- (void)dealloc;
- (void)getIdentityWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)invalidate;
- (void)reset;
- (void)setDispatchQueue:(id)a3;
- (void)setTestMode:(BOOL)a3;
@end

@implementation CUPairingDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_rpSelfIRK, 0);
  objc_storeStrong((id *)&self->_homeKitManager, 0);
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (int)_removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(CUPairingDaemon *)self _findPairedPeer:v7 options:a4 & 0xFFFFFFFFFFFFFFFDLL error:0];
  if (!v8) {
    id v8 = v7;
  }
  v9 = [v8 identifier];
  v10 = v9;
  if (!v9)
  {
    v18 = 0;
    goto LABEL_22;
  }
  v18 = [v9 UUIDString];
  if (!v18)
  {
LABEL_22:
    int v31 = -6708;
    goto LABEL_20;
  }
  int v19 = KeychainDeleteFormatted((uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v11, v12, v13, v14, v15, v16, v17, *MEMORY[0x1E4F3B978]);
  if (v19)
  {
    int v31 = v19;
  }
  else
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _removePairedPeer:options:removeAdminAllowed:]", 0x1Eu, (uint64_t)"Removed %@\n", v20, v21, v22, v23, (uint64_t)v8);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v24 = self->_xpcConnections;
    uint64_t v25 = [(NSMutableSet *)v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if (*(unsigned char *)(v29 + 32))
          {
            v30 = [*(id *)(v29 + 40) remoteObjectProxy];
            [v30 pairedPeerRemoved:v8 options:a4];
          }
        }
        uint64_t v26 = [(NSMutableSet *)v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v26);
    }

    notify_post("com.apple.pairing.peerChanged");
    int v31 = 0;
  }
LABEL_20:

  return v31;
}

- (int)removePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  LODWORD(v5) = [(CUPairingDaemon *)v9 _removePairedPeer:v8 options:a4 removeAdminAllowed:v5];
  objc_sync_exit(v9);

  return v5;
}

- (int)removePairedPeer:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  LODWORD(a4) = [(CUPairingDaemon *)v7 _removePairedPeer:v6 options:a4 removeAdminAllowed:0];
  objc_sync_exit(v7);

  return a4;
}

- (int)_savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v122 = 0;
  id v8 = [v7 identifier];
  v9 = v8;
  v99 = v8;
  if (!v8)
  {
    v103 = 0;
    v100 = 0;
    long long v35 = 0;
    CFMutableDataRef v40 = 0;
    v97 = 0;
    v98 = 0;
    uint64_t v13 = 0;
    v41 = 0;
    v42 = 0;
    CFDictionaryRef v24 = 0;
    uint64_t v38 = 0;
LABEL_102:
    int v45 = -6708;
    goto LABEL_109;
  }
  id v8 = [(CUPairedPeer *)v8 UUIDString];
  v103 = v8;
  if (!v8)
  {
    v103 = 0;
    v100 = 0;
    long long v35 = 0;
    CFMutableDataRef v40 = 0;
    v97 = 0;
    v98 = 0;
    uint64_t v13 = 0;
    v41 = 0;
    v42 = 0;
    CFDictionaryRef v24 = 0;
    uint64_t v38 = 0;
    v9 = 0;
    goto LABEL_102;
  }
  BOOL v93 = a5;
  v91 = self;
  -[CUPairingDaemon _findPairedPeer:options:error:](self, "_findPairedPeer:options:error:", v7);
  v10 = (CUPairedPeer *)(id)objc_claimAutoreleasedReturnValue();
  v100 = v10;
  if (!v10)
  {
    v10 = objc_alloc_init(CUPairedPeer);
    [(CUPairedPeer *)v10 setIdentifier:v9];
  }
  uint64_t v11 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = [(CUPairedPeer *)v10 info];
  uint64_t v13 = (__CFString *)[v12 mutableCopy];

  if (!v13) {
    uint64_t v13 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v101 = v11;
  v105 = v10;
  uint64_t v14 = [v7 info];
  if (v14) {
    [(__CFString *)v13 addEntriesFromDictionary:v14];
  }
  v98 = (void *)v14;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v15 = [(__CFString *)v13 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v118 objects:v126 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v119 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v118 + 1) + 8 * i);
        uint64_t v21 = [(__CFString *)v13 objectForKeyedSubscript:v20];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          [(__CFString *)v13 removeObjectForKey:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v118 objects:v126 count:16];
    }
    while (v17);
  }

  uint64_t v23 = [(CUPairedPeer *)v105 acl];
  CFDictionaryRef v24 = (const __CFDictionary *)[v23 mutableCopy];

  unint64_t Int64 = CFDictionaryGetInt64(v24, @"com.apple.admin", 0);
  if (!v24) {
    CFDictionaryRef v24 = (const __CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v102 = v7;
  uint64_t v25 = [v7 acl];
  if (v25) {
    [(__CFDictionary *)v24 addEntriesFromDictionary:v25];
  }
  v97 = (void *)v25;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v26 = [(__CFDictionary *)v24 allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v114 objects:v125 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v115;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v115 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v114 + 1) + 8 * j);
        v32 = [(__CFDictionary *)v24 objectForKeyedSubscript:v31];
        objc_opt_class();
        char v33 = objc_opt_isKindOfClass();

        if (v33) {
          [(__CFDictionary *)v24 removeObjectForKey:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v114 objects:v125 count:16];
    }
    while (v28);
  }

  unint64_t v34 = CFDictionaryGetInt64(v24, @"com.apple.admin", 0);
  if (Int64 && !v34 && !v93)
  {
    id v8 = 0;
    CFMutableDataRef v40 = 0;
    v41 = 0;
    v42 = 0;
    uint64_t v38 = 0;
    int v122 = -6773;
    long long v35 = v101;
    id v7 = v102;
    v9 = v105;
    goto LABEL_99;
  }
  long long v35 = v101;
  id v7 = v102;
  v9 = v105;
  if ([(__CFDictionary *)v24 count]) {
    [(__CFString *)v101 setObject:v24 forKeyedSubscript:@"acl"];
  }
  else {
    [(__CFString *)v101 removeObjectForKey:@"acl"];
  }
  uint64_t v36 = [v102 altIRK];
  if (v36)
  {
    v37 = (void *)v36;
    [(CUPairedPeer *)v105 setAltIRK:v36];
  }
  else
  {
    v37 = [(CUPairedPeer *)v105 altIRK];
    if (!v37) {
      goto LABEL_41;
    }
  }
  [(__CFString *)v101 setObject:v37 forKeyedSubscript:@"altIRK"];

LABEL_41:
  uint64_t v38 = [v102 model];
  if (!v38)
  {
    uint64_t v39 = [(__CFString *)v13 objectForKeyedSubscript:@"model"];
    if (v39)
    {
      uint64_t v38 = (__CFString *)v39;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0;
        CFMutableDataRef v40 = 0;
        v41 = 0;
        v42 = 0;
LABEL_52:
        int v45 = -6756;
LABEL_109:
        int v122 = v45;
        goto LABEL_99;
      }
    }
    else
    {
      uint64_t v43 = [(CUPairedPeer *)v105 model];
      if (v43) {
        uint64_t v38 = (__CFString *)v43;
      }
      else {
        uint64_t v38 = &stru_1EDD2ACE8;
      }
    }
  }
  [(CUPairedPeer *)v105 setModel:v38];
  [(__CFString *)v13 setObject:v38 forKeyedSubscript:@"model"];
  v42 = [v102 name];
  if (!v42)
  {
    uint64_t v44 = [(__CFString *)v13 objectForKeyedSubscript:@"name"];
    if (v44)
    {
      v42 = (__CFString *)v44;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0;
        CFMutableDataRef v40 = 0;
        v41 = 0;
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v46 = [(CUPairedPeer *)v105 name];
      if (v46) {
        v42 = (__CFString *)v46;
      }
      else {
        v42 = &stru_1EDD2ACE8;
      }
    }
  }
  [(CUPairedPeer *)v105 setName:v42];
  [(__CFString *)v13 removeObjectForKey:@"name"];
  uint64_t v47 = [v102 publicKey];
  if (v47)
  {
    v41 = (void *)v47;
    [(CUPairedPeer *)v105 setPublicKey:v47];
  }
  else
  {
    id v8 = [(CUPairedPeer *)v105 publicKey];
    v41 = v8;
    if (!v8)
    {
      CFMutableDataRef v40 = 0;
      if (v100) {
        int v45 = -6768;
      }
      else {
        int v45 = -25300;
      }
      goto LABEL_109;
    }
  }
  [(__CFString *)v101 setObject:v41 forKeyedSubscript:@"pk"];
  [(CUPairedPeer *)v105 setInfo:v13];
  CFMutableDataRef v48 = OPACKEncoderCreateDataMutable(v13, 0, &v122);
  CFMutableDataRef v40 = v48;
  if (v122)
  {
    id v8 = 0;
    goto LABEL_99;
  }
  if (!v48)
  {
    id v8 = 0;
    goto LABEL_108;
  }
  id v8 = (CUPairedPeer *)OPACKEncoderCreateDataMutable(v101, 0, &v122);
  if (v122) {
    goto LABEL_99;
  }
  v96 = v8;
  if (!v8)
  {
LABEL_108:
    int v45 = -6762;
    goto LABEL_109;
  }
  v94 = v40;
  uint64_t v92 = *MEMORY[0x1E4F3B978];
  CFDictionaryRef v55 = (const __CFDictionary *)CFCreateF(&v122, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v49, v50, v51, v52, v53, v54, *MEMORY[0x1E4F3B978]);
  CFDictionaryRef v62 = v55;
  if (!v122)
  {
    CFDictionaryRef v90 = v55;
    int updated = KeychainUpdateFormatted(v55, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O}", v56, v57, v58, v59, v60, v61, *MEMORY[0x1E4F3B678]);
    int v122 = updated;
    if (updated)
    {
      CFDictionaryRef v62 = v90;
      if (updated != -25300) {
        goto LABEL_96;
      }
      int v70 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v64, v65, v66, v67, v68, v69, v92);
      CFDictionaryRef v62 = v90;
      int v122 = v70;
      if (v70) {
        goto LABEL_96;
      }
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]", 0x1Eu, (uint64_t)"Saved %@\n", v71, v72, v73, v74, (uint64_t)v102);
      }
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      v75 = v91->_xpcConnections;
      uint64_t v82 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v106 objects:v123 count:16];
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v84 = *(void *)v107;
        do
        {
          for (uint64_t k = 0; k != v83; ++k)
          {
            if (*(void *)v107 != v84) {
              objc_enumerationMutation(v75);
            }
            uint64_t v86 = *(void *)(*((void *)&v106 + 1) + 8 * k);
            if (*(unsigned char *)(v86 + 32))
            {
              v87 = [*(id *)(v86 + 40) remoteObjectProxy];
              [v87 pairedPeerAdded:v105 options:a4];
            }
          }
          uint64_t v83 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v106 objects:v123 count:16];
        }
        while (v83);
      }
    }
    else
    {
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _savePairedPeer:options:removeAdminAllowed:]", 0x1Eu, (uint64_t)"Updated %@\n", v66, v67, v68, v69, (uint64_t)v105);
      }
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      v75 = v91->_xpcConnections;
      uint64_t v76 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v110 objects:v124 count:16];
      if (v76)
      {
        uint64_t v77 = v76;
        uint64_t v78 = *(void *)v111;
        do
        {
          for (uint64_t m = 0; m != v77; ++m)
          {
            if (*(void *)v111 != v78) {
              objc_enumerationMutation(v75);
            }
            uint64_t v80 = *(void *)(*((void *)&v110 + 1) + 8 * m);
            if (*(unsigned char *)(v80 + 32))
            {
              v81 = [*(id *)(v80 + 40) remoteObjectProxy];
              [v81 pairedPeerChanged:v105 options:a4];
            }
          }
          uint64_t v77 = [(NSMutableSet *)v75 countByEnumeratingWithState:&v110 objects:v124 count:16];
        }
        while (v77);
      }
    }

    notify_post("com.apple.pairing.peerChanged");
    CFDictionaryRef v62 = v90;
  }
LABEL_96:
  v9 = v105;
  long long v35 = v101;
  if (v62) {
    CFRelease(v62);
  }
  id v7 = v102;
  CFMutableDataRef v40 = v94;
  id v8 = v96;
LABEL_99:
  int v88 = v122;

  return v88;
}

- (int)savePairedPeer:(id)a3 options:(unint64_t)a4 removeAdminAllowed:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  LODWORD(v5) = [(CUPairingDaemon *)v9 _savePairedPeer:v8 options:a4 removeAdminAllowed:v5];
  objc_sync_exit(v9);

  return v5;
}

- (int)savePairedPeer:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  LODWORD(a4) = [(CUPairingDaemon *)v7 _savePairedPeer:v6 options:a4 removeAdminAllowed:0];
  objc_sync_exit(v7);

  return a4;
}

- (id)_findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v66 = 0;
  id v8 = [v7 identifier];
  uint64_t v60 = v8;
  uint64_t v61 = v7;
  if (!v8)
  {
    uint64_t v31 = [v7 publicKey];
    if (v31)
    {
      id v32 = [(CUPairingDaemon *)self _copyPairedPeersWithOptions:a4 error:&v66];
      id v33 = v32;
      if (v66)
      {
        v42 = 0;
        goto LABEL_44;
      }
      if (v32)
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v67 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          id v36 = 0;
          uint64_t v37 = *(void *)v63;
LABEL_19:
          uint64_t v38 = 0;
          uint64_t v39 = v36;
          while (1)
          {
            if (*(void *)v63 != v37) {
              objc_enumerationMutation(v33);
            }
            id v36 = *(id *)(*((void *)&v62 + 1) + 8 * v38);

            CFMutableDataRef v40 = [v36 publicKey];
            char v41 = [v40 isEqual:v31];

            if (v41) {
              break;
            }
            ++v38;
            uint64_t v39 = v36;
            if (v35 == v38)
            {
              uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v67 count:16];
              if (v35) {
                goto LABEL_19;
              }

              goto LABEL_26;
            }
          }
          v42 = (CUPairedPeer *)v36;

          if (!v42) {
            goto LABEL_27;
          }
          goto LABEL_44;
        }
LABEL_26:

LABEL_27:
        v42 = 0;
        int v43 = -25300;
      }
      else
      {
        v42 = 0;
        int v43 = -6762;
      }
    }
    else
    {
      v42 = 0;
      id v33 = 0;
      int v43 = -6708;
    }
    int v66 = v43;
LABEL_44:

    uint64_t v16 = 0;
    uint64_t v29 = 0;
    CFDictionaryRef v18 = 0;
    CFDataRef v46 = 0;
    uint64_t v50 = 0;
    uint64_t v27 = 0;
    CFDictionaryRef v48 = 0;
    int v19 = v42;
    goto LABEL_48;
  }
  v9 = v8;
  uint64_t v16 = [v8 UUIDString];
  if (v16)
  {
    CFDictionaryRef v17 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v66, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v10, v11, v12, v13, v14, v15, *MEMORY[0x1E4F3B978]);
    CFDictionaryRef v18 = v17;
    if (v66)
    {
      v42 = 0;
      uint64_t v29 = 0;
      int v19 = 0;
      CFDataRef v46 = 0;
      uint64_t v50 = 0;
      uint64_t v27 = 0;
      CFDictionaryRef v48 = 0;
      goto LABEL_48;
    }
    if (!v17)
    {
      v42 = 0;
      uint64_t v29 = 0;
      int v19 = 0;
      CFDataRef v46 = 0;
      uint64_t v50 = 0;
      uint64_t v27 = 0;
      CFDictionaryRef v48 = 0;
LABEL_67:
      int v57 = -6762;
      goto LABEL_68;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v42 = 0;
      uint64_t v29 = 0;
      int v19 = 0;
      CFDataRef v46 = 0;
      uint64_t v50 = 0;
      uint64_t v27 = 0;
      CFDictionaryRef v48 = 0;
LABEL_63:
      int v58 = -6756;
      goto LABEL_64;
    }
    int v19 = objc_alloc_init(CUPairedPeer);
    [(CUPairedPeer *)v19 setIdentifier:v9];
    uint64_t v20 = (const void *)*MEMORY[0x1E4F3B788];
    CFTypeID TypeID = CFStringGetTypeID();
    uint64_t v22 = CFDictionaryGetTypedValue(v18, v20, TypeID, 0);
    if (v22) {
      [(CUPairedPeer *)v19 setName:v22];
    }
    uint64_t v23 = (const void *)*MEMORY[0x1E4F3B688];
    CFTypeID v24 = CFDataGetTypeID();
    CFDictionaryGetTypedValue(v18, v23, v24, 0);
    CFDataRef v25 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    CFDataRef v26 = v25;
    if (v25)
    {
      uint64_t v27 = OPACKDecodeData(v25, 0, 0);
      if (v27)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFTypeID v28 = CFStringGetTypeID();
          uint64_t v29 = CFDictionaryGetTypedValue((const __CFDictionary *)v27, @"model", v28, 0);

          if (v29) {
            [(CUPairedPeer *)v19 setModel:v29];
          }
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v27];
          [v30 removeObjectForKey:@"model"];
          [(CUPairedPeer *)v19 setInfo:v30];

LABEL_31:
          uint64_t v44 = (const void *)*MEMORY[0x1E4F3BD38];
          CFTypeID v45 = CFDataGetTypeID();
          CFDictionaryGetTypedValue(v18, v44, v45, &v66);
          CFDataRef v46 = (const __CFData *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            v42 = 0;
            uint64_t v50 = 0;
            CFDictionaryRef v48 = 0;
            goto LABEL_48;
          }
          if (v46)
          {
            uint64_t v47 = OPACKDecodeData(v46, 0, &v66);
            CFDictionaryRef v48 = (const __CFDictionary *)v47;
            if (v66)
            {
              v42 = 0;
              uint64_t v50 = 0;
              goto LABEL_48;
            }
            if (v47)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                CFTypeID v49 = CFDictionaryGetTypeID();
                uint64_t v50 = CFDictionaryGetTypedValue(v48, @"acl", v49, 0);
                if (v50) {
                  [(CUPairedPeer *)v19 setAcl:v50];
                }
                CFTypeID v51 = CFDataGetTypeID();
                CFDictionaryGetTypedValue(v48, @"pk", v51, &v66);
                CFDataRef v52 = (const __CFData *)objc_claimAutoreleasedReturnValue();

                if (v66)
                {
                  v42 = 0;
LABEL_47:
                  CFDataRef v46 = v52;
                  goto LABEL_48;
                }
                if (v52)
                {
                  [(CUPairedPeer *)v19 setPublicKey:v52];
                  if ((a4 & 2) != 0)
                  {
                    CFTypeID v53 = CFDataGetTypeID();
                    uint64_t v54 = CFDictionaryGetTypedValue(v48, @"altIRK", v53, 0);

                    if (v54)
                    {
                      [(CUPairedPeer *)v19 setAltIRK:v54];
                      CFDataRef v52 = (const __CFData *)v54;
                    }
                    else
                    {
                      CFDataRef v52 = 0;
                    }
                  }
                  v42 = v19;
                  int v19 = v42;
                  goto LABEL_47;
                }
                v42 = 0;
                CFDataRef v46 = 0;
                goto LABEL_67;
              }
              v42 = 0;
              uint64_t v50 = 0;
              goto LABEL_63;
            }
            v42 = 0;
            uint64_t v50 = 0;
          }
          else
          {
            v42 = 0;
            uint64_t v50 = 0;
            CFDictionaryRef v48 = 0;
          }
          int v58 = -6762;
LABEL_64:
          int v66 = v58;
          goto LABEL_48;
        }
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
    uint64_t v29 = v22;
    goto LABEL_31;
  }
  v42 = 0;
  uint64_t v29 = 0;
  CFDictionaryRef v18 = 0;
  int v19 = 0;
  CFDataRef v46 = 0;
  uint64_t v50 = 0;
  uint64_t v27 = 0;
  CFDictionaryRef v48 = 0;
  int v57 = -6708;
LABEL_68:
  int v66 = v57;
LABEL_48:
  if (a5) {
    *a5 = v66;
  }
  CFDictionaryRef v55 = v42;

  return v55;
}

- (id)_findHomeKitExPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__5786;
  v30 = __Block_byref_object_dispose__5787;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5786;
  CFTypeID v24 = __Block_byref_object_dispose__5787;
  id v25 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  homeKitManager = self->_homeKitManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__CUPairingDaemon__findHomeKitExPairedPeer_options_error___block_invoke;
  v16[3] = &unk_1E55BF8C8;
  CFDictionaryRef v18 = &v26;
  int v19 = &v20;
  uint64_t v11 = v9;
  CFDictionaryRef v17 = v11;
  [(CUHomeKitManager *)homeKitManager findPairedPeer:v8 options:a4 completion:v16];
  dispatch_time_t v12 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    LODWORD(v13) = -6722;
  }
  else
  {
    uint64_t v13 = (void *)v21[5];
    if (v13) {
      LODWORD(v13) = NSErrorToOSStatusEx(v13, 0);
    }
  }
  if (a5) {
    *a5 = (int)v13;
  }
  id v14 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __58__CUPairingDaemon__findHomeKitExPairedPeer_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_findHomeKitPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8 = [a3 identifier];
  if (!v8)
  {
    id v14 = 0;
    uint64_t v10 = 0;
    uint64_t v13 = 0;
    int v15 = -6708;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v9 = [(CUPairingDaemon *)self _copyHomeKitWithOptions:a4 error:0];
  uint64_t v10 = v9;
  if (v9
    && ([v9 identifier],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:v8],
        v11,
        v12))
  {
    uint64_t v13 = [v10 publicKey];
    if (v13)
    {
      id v14 = objc_alloc_init(CUPairedPeer);
      [(CUPairedPeer *)v14 setIdentifier:v8];
      [(CUPairedPeer *)v14 setPublicKey:v13];
      int v15 = 0;
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    id v14 = 0;
  }
  else
  {
    id v14 = 0;
    uint64_t v13 = 0;
  }
  int v15 = -25300;
  if (a5) {
LABEL_9:
  }
    *a5 = v15;
LABEL_10:
  uint64_t v16 = v14;

  return v16;
}

- (id)findPairedPeer:(id)a3 options:(unint64_t)a4 error:(int *)a5
{
  id v8 = a3;
  id v9 = self;
  objc_sync_enter(v9);
  if ((a4 & 8) != 0)
  {
    uint64_t v10 = [(CUPairingDaemon *)v9 _findHomeKitPairedPeer:v8 options:a4 error:a5];
  }
  else
  {
    if ((a4 & 0x138) != 0) {
      [(CUPairingDaemon *)v9 _findHomeKitExPairedPeer:v8 options:a4 error:a5];
    }
    else {
    uint64_t v10 = [(CUPairingDaemon *)v9 _findPairedPeer:v8 options:a4 error:a5];
    }
  }
  id v11 = (void *)v10;
  objc_sync_exit(v9);

  return v11;
}

- (void)_removeDups:(id)a3
{
  id v17 = a3;
  uint64_t v3 = [v17 count];
  if (!v3) {
    goto LABEL_20;
  }
  unint64_t v4 = v3;
  for (unint64_t i = 0; i < v4; ++i)
  {
    id v6 = [v17 objectAtIndexedSubscript:i];
    uint64_t v7 = [v6 info];
    id v8 = [v7 objectForKeyedSubscript:@"mac"];

    if (!v8) {
      goto LABEL_17;
    }
    id v9 = [v6 dateModified];
    if (!v9) {
      goto LABEL_16;
    }
    uint64_t v10 = 0;
    unint64_t v15 = v4 - 1;
    unint64_t v16 = v4;
    if (v4 <= 1) {
      unint64_t v4 = 1;
    }
    while (i == v10)
    {
LABEL_14:
      if (v4 == ++v10)
      {
        unint64_t v4 = v16;
        goto LABEL_16;
      }
    }
    id v11 = [v17 objectAtIndexedSubscript:v10];
    int v12 = [v11 info];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"mac"];

    if (!v13 || ![v13 isEqual:v8]) {
      goto LABEL_13;
    }
    id v14 = [v11 dateModified];
    if (!v14 || [v9 compare:v14] >= 1)
    {

LABEL_13:
      goto LABEL_14;
    }
    [v17 removeObjectAtIndex:i--];

    unint64_t v4 = v15;
LABEL_16:

LABEL_17:
  }
LABEL_20:
}

- (id)_copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4
{
  id v8 = a4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  int v69 = 0;
  char v62 = a3;
  uint64_t v61 = *MEMORY[0x1E4F3B978];
  CFTypeRef v10 = KeychainCopyMatchingFormatted(&v69, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", a3, (uint64_t)a4, v4, v5, v6, v7, *MEMORY[0x1E4F3B978]);
  id v11 = (void *)v10;
  if (v69)
  {
    id v49 = 0;
    id v63 = 0;
    if (v69 == -25300)
    {
      id v63 = 0;
      int v69 = 0;
      id v49 = (id)MEMORY[0x1E4F1CBF0];
    }
    goto LABEL_60;
  }
  if (!v10)
  {
    id v49 = 0;
    id v63 = 0;
    int v52 = -6762;
LABEL_67:
    int v69 = v52;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v49 = 0;
    id v63 = 0;
    int v52 = -6756;
    goto LABEL_67;
  }
  CFTypeID v53 = self;
  CFDictionaryRef v55 = v8;
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v54 = v11;
  obuint64_t j = v11;
  uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (!v64) {
    goto LABEL_39;
  }
  uint64_t v60 = *(void *)v66;
  int v12 = (const void *)*MEMORY[0x1E4F3B5C0];
  uint64_t v59 = (const void *)*MEMORY[0x1E4F3B790];
  int v58 = (const void *)*MEMORY[0x1E4F3B788];
  int v57 = (const void *)*MEMORY[0x1E4F3B688];
  while (2)
  {
    for (uint64_t i = 0; i != v64; ++i)
    {
      if (*(void *)v66 != v60) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v14 = *(const __CFDictionary **)(*((void *)&v65 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v69 = -6756;
LABEL_58:
        id v11 = v54;
        id v8 = v55;
        goto LABEL_59;
      }
      unint64_t v15 = objc_alloc_init(CUPairedPeer);
      CFTypeID TypeID = CFStringGetTypeID();
      id v17 = CFDictionaryGetTypedValue(v14, v12, TypeID, &v69);
      id v18 = v17;
      if (v69) {
        goto LABEL_42;
      }
      if (!v17)
      {
        int v69 = -6762;
        goto LABEL_57;
      }
      id v18 = v17;
      int v19 = (char *)[v18 UTF8String];
      int v69 = StringToUUIDEx(v19, 0xFFFFFFFFFFFFFFFFLL, 0, 0, &v70, v20, v21, v22);
      if (v69)
      {
LABEL_42:
        id v32 = 0;
LABEL_43:
        id v36 = 0;
        uint64_t v34 = 0;
LABEL_54:
        id v11 = v54;
        id v8 = v55;

LABEL_59:
        id v49 = 0;
        goto LABEL_60;
      }
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v70];
      [(CUPairedPeer *)v15 setIdentifier:v23];

      CFTypeID v24 = CFDateGetTypeID();
      [(CUPairedPeer *)v15 setDateModified:CFDictionaryGetTypedValue(v14, v59, v24, 0)];
      CFTypeRef v31 = KeychainCopyMatchingFormatted(&v69, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v25, v26, v27, v28, v29, v30, v61);
      id v32 = (void *)v31;
      if (v69) {
        goto LABEL_43;
      }
      if (!v31)
      {
        int v69 = -6762;
        goto LABEL_56;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v50 = -6756;
        goto LABEL_50;
      }
      id v33 = OPACKDecodeData((const __CFData *)v32, 0, &v69);
      uint64_t v34 = v33;
      if (v69)
      {
        id v36 = 0;
        goto LABEL_54;
      }
      if (!v33)
      {
        int v50 = -6762;
LABEL_50:
        int v69 = v50;
LABEL_52:

LABEL_56:
LABEL_57:

        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v69 = -6756;

        goto LABEL_52;
      }
      CFTypeID v35 = CFDictionaryGetTypeID();
      id v36 = CFDictionaryGetTypedValue((const __CFDictionary *)v34, @"acl", v35, 0);
      if (v36) {
        [(CUPairedPeer *)v15 setAcl:v36];
      }
      CFTypeID v37 = CFDataGetTypeID();
      uint64_t v38 = CFDictionaryGetTypedValue((const __CFDictionary *)v34, @"pk", v37, &v69);

      if (v69)
      {
        id v32 = v38;
        goto LABEL_54;
      }
      if (!v38)
      {
        int v69 = -6762;

        goto LABEL_56;
      }
      [(CUPairedPeer *)v15 setPublicKey:v38];
      CFTypeID v39 = CFStringGetTypeID();
      CFMutableDataRef v40 = CFDictionaryGetTypedValue(v14, v58, v39, 0);
      if (v40) {
        [(CUPairedPeer *)v15 setName:v40];
      }
      CFTypeID v41 = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v14, v57, v41, 0);
      CFDataRef v42 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        int v43 = 0;
LABEL_32:
        CFTypeID v45 = v40;
        goto LABEL_33;
      }
      int v43 = OPACKDecodeData(v42, 0, 0);
      if (!v43) {
        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      CFTypeID v44 = CFStringGetTypeID();
      CFTypeID v45 = CFDictionaryGetTypedValue((const __CFDictionary *)v43, @"model", v44, 0);

      if (v45) {
        [(CUPairedPeer *)v15 setModel:v45];
      }
      CFDataRef v46 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v43];
      [v46 removeObjectForKey:@"model"];
      [(CUPairedPeer *)v15 setInfo:v46];

LABEL_33:
      if ((v62 & 2) != 0)
      {
        CFTypeID v47 = CFDataGetTypeID();
        uint64_t v48 = CFDictionaryGetTypedValue((const __CFDictionary *)v34, @"altIRK", v47, 0);

        if (v48)
        {
          [(CUPairedPeer *)v15 setAltIRK:v48];
          CFDataRef v42 = (const __CFData *)v48;
        }
        else
        {
          CFDataRef v42 = 0;
        }
      }
      [v63 addObject:v15];
    }
    uint64_t v64 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v64) {
      continue;
    }
    break;
  }
LABEL_39:

  if (v62 < 0) {
    [(CUPairingDaemon *)v53 _removeDups:v63];
  }
  id v49 = v63;
  int v69 = 0;
  id v63 = v49;
  id v11 = v54;
  id v8 = v55;
LABEL_60:
  if (v8) {
    *id v8 = v69;
  }

  return v49;
}

- (id)copyPairedPeersWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = [(CUPairingDaemon *)v6 _copyPairedPeersWithOptions:a3 error:a4];
  objc_sync_exit(v6);

  return v7;
}

- (int)_saveIdentity:(id)a3 options:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x1Eu, (uint64_t)"Save %@\n", v6, v7, v8, v9, (uint64_t)v10);
  }
  int v50 = 0;
  int v12 = [v10 identifier];
  uint64_t v13 = [v12 UUIDString];

  if (!v13)
  {
    uint64_t v21 = 0;
    CFMutableDataRef v24 = 0;
    id v18 = 0;
    CFDictionaryRef v25 = 0;
    int v42 = -6708;
LABEL_50:
    int v50 = v42;
    goto LABEL_41;
  }
  id v18 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v19 = [v10 altIRK];
  if (v19) {
    [(__CFString *)v18 setObject:v19 forKeyedSubscript:@"altIRK"];
  }
  uint64_t v20 = [v10 publicKey];

  if (v20) {
    [(__CFString *)v18 setObject:v20 forKeyedSubscript:@"pk"];
  }
  uint64_t v21 = [v10 secretKey];

  if (v21) {
    [(__CFString *)v18 setObject:v21 forKeyedSubscript:@"sk"];
  }
  CFMutableDataRef v24 = OPACKEncoderCreateDataMutable(v18, 0, &v50);
  if (v50)
  {
    CFDictionaryRef v25 = 0;
    goto LABEL_41;
  }
  if (!v24)
  {
    CFDictionaryRef v25 = 0;
    int v42 = -6762;
    goto LABEL_50;
  }
  int v43 = v21;
  CFTypeID v45 = v24;
  uint64_t v26 = *MEMORY[0x1E4F3B978];
  CFTypeID v44 = v13;
  CFDictionaryRef v25 = (const __CFDictionary *)CFCreateF(&v50, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v22, v23, v14, v15, v16, v17, *MEMORY[0x1E4F3B978]);
  if (!v50)
  {
    int updated = KeychainUpdateFormatted(v25, (uint64_t)"{%kO=%O%kO=%O%kO=%O}", v27, v28, v14, v15, v16, v17, *MEMORY[0x1E4F3B678]);
    int v50 = updated;
    if (updated)
    {
      if (updated != -25300)
      {
        id v11 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
        uint64_t v21 = v43;
        goto LABEL_41;
      }
      int v50 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", v30, v31, v14, v15, v16, v17, v26);
      uint64_t v21 = v43;
      if (v50)
      {
        id v11 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
        goto LABEL_41;
      }
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x1Eu, (uint64_t)"Saved %@\n", v14, v15, v16, v17, (uint64_t)v10);
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v32 = self->_xpcConnections;
      uint64_t v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v47 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            if (*(unsigned char *)(v37 + 32))
            {
              uint64_t v38 = [*(id *)(v37 + 40) remoteObjectProxy];
              [v38 pairingIdentityCreated:v10 options:a4];
            }
          }
          uint64_t v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v34);
      }

      notify_post("com.apple.pairing.identityChanged");
      uint64_t v13 = v44;
      CFMutableDataRef v24 = v45;
      id v11 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
    }
    else
    {
      id v11 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
      uint64_t v21 = v43;
      if (gLogCategory_CUPairingDaemon > 30) {
        goto LABEL_45;
      }
      if (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)) {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x1Eu, (uint64_t)"Updated %@\n", v14, v15, v16, v17, (uint64_t)v10);
      }
    }
    if (!v50) {
      goto LABEL_45;
    }
    goto LABEL_41;
  }
  id v11 = &OBJC_IVAR___CUPairingSession__dispatchQueue;
  uint64_t v21 = v43;
LABEL_41:
  int v39 = v11[632];
  if (v39 <= 60 && (v39 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu))) {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _saveIdentity:options:]", 0x3Cu, (uint64_t)"### Save %@ failed: %#m\n", v14, v15, v16, v17, (uint64_t)v10);
  }
LABEL_45:
  if (v25) {
    CFRelease(v25);
  }
  int v40 = v50;

  return v40;
}

- (int)_deleteIdentityWithOptions:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v14 = KeychainDeleteFormatted((uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O}", (uint64_t)a2, a3, v3, v4, v5, v6, v7, *MEMORY[0x1E4F3B978]);
  if (!v14)
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _deleteIdentityWithOptions:]", 0x1Eu, (uint64_t)"Deleted identity\n", v10, v11, v12, v13, v23);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v15 = self->_xpcConnections;
    uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (*(unsigned char *)(v20 + 32))
          {
            uint64_t v21 = [*(id *)(v20 + 40) remoteObjectProxy];
            [v21 pairingIdentityDeletedWithOptions:a3];
          }
        }
        uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    notify_post("com.apple.pairing.identityChanged");
  }
  return v14;
}

- (int)deleteIdentityWithOptions:(unint64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  LODWORD(a3) = [(CUPairingDaemon *)v4 _deleteIdentityWithOptions:a3];
  objc_sync_exit(v4);

  return a3;
}

- (id)_copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4
{
  char v9 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v27 = 0;
  CFDictionaryRef v10 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v27, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O%kO=%O}", a3, (uint64_t)a4, v4, v5, v6, v7, *MEMORY[0x1E4F3B978]);
  int v11 = v27;
  if (v27)
  {
    long long v24 = 0;
    uint64_t v12 = 0;
    goto LABEL_27;
  }
  if (!v10)
  {
    long long v24 = 0;
    uint64_t v12 = 0;
    CFDataRef v17 = 0;
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v24 = 0;
    uint64_t v12 = 0;
    CFDataRef v17 = 0;
    uint64_t v18 = 0;
LABEL_36:
    int v11 = -6756;
    goto LABEL_40;
  }
  uint64_t v12 = objc_alloc_init(CUPairingIdentity);
  Value = (__CFString *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E4F3B5C0]);
  if (Value)
  {
    int v11 = CFGetUUIDEx(Value, 0, (uint64_t)v28);
    int v27 = v11;
    if (!v11)
    {
      int v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v28];
      [(CUPairingIdentity *)v12 setIdentifier:v14];

      uint64_t v15 = (const void *)*MEMORY[0x1E4F3BD38];
      CFTypeID TypeID = CFDataGetTypeID();
      CFDictionaryGetTypedValue(v10, v15, TypeID, &v27);
      CFDataRef v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      int v11 = v27;
      if (!v27)
      {
        if (v17)
        {
          uint64_t v18 = OPACKDecodeData(v17, 0, &v27);
          int v11 = v27;
          if (v27) {
            goto LABEL_24;
          }
          if (!v18)
          {
LABEL_25:
            long long v24 = 0;
LABEL_39:
            int v11 = -6762;
            goto LABEL_40;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFTypeID v19 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, @"pk", v19, &v27);
            CFDataRef v20 = (const __CFData *)objc_claimAutoreleasedReturnValue();

            int v11 = v27;
            if (v27)
            {
              long long v24 = 0;
              CFDataRef v17 = v20;
              goto LABEL_21;
            }
            if (!v20)
            {
              long long v24 = 0;
              CFDataRef v17 = 0;
              goto LABEL_39;
            }
            [(CUPairingIdentity *)v12 setPublicKey:v20];
            if ((v9 & 2) == 0)
            {
              CFDataRef v17 = v20;
LABEL_20:
              long long v24 = v12;
              int v11 = 0;
              int v27 = 0;
              uint64_t v12 = v24;
              goto LABEL_21;
            }
            CFTypeID v21 = CFDataGetTypeID();
            uint64_t v22 = CFDictionaryGetTypedValue((const __CFDictionary *)v18, @"altIRK", v21, 0);

            if (v22) {
              [(CUPairingIdentity *)v12 setAltIRK:v22];
            }
            CFTypeID v23 = CFDataGetTypeID();
            CFDictionaryGetTypedValue((const __CFDictionary *)v18, @"sk", v23, &v27);
            CFDataRef v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();

            int v11 = v27;
            if (!v27)
            {
              if (v17)
              {
                [(CUPairingIdentity *)v12 setSecretKey:v17];
                goto LABEL_20;
              }
              goto LABEL_25;
            }
LABEL_24:
            long long v24 = 0;
            goto LABEL_21;
          }
          long long v24 = 0;
          goto LABEL_36;
        }
        long long v24 = 0;
LABEL_34:
        uint64_t v18 = 0;
        goto LABEL_39;
      }
      long long v24 = 0;
LABEL_32:
      uint64_t v18 = 0;
      goto LABEL_21;
    }
    long long v24 = 0;
LABEL_27:
    CFDataRef v17 = 0;
    goto LABEL_32;
  }
  long long v24 = 0;
  CFDataRef v17 = 0;
  uint64_t v18 = 0;
  int v11 = -6727;
LABEL_40:
  int v27 = v11;
LABEL_21:
  if (a4) {
    *a4 = v11;
  }
  long long v25 = v24;

  return v25;
}

- (id)_copyOrCreateWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned int v39 = 0;
  uint64_t v7 = [(CUPairingDaemon *)self _copyIdentityWithOptions:a3 error:&v39];
  uint64_t v8 = v7;
  if (v7 && !v39)
  {
    if ((a3 & 2) != 0)
    {
      char v9 = [(CUPairingIdentity *)v7 altIRK];
      if (!v9)
      {
        if ((a3 & 4) == 0) {
          goto LABEL_30;
        }
        goto LABEL_21;
      }
      CFDictionaryRef v10 = v9;
      if ((a3 & 4) != 0 && self->_rpSelfIRK)
      {
        int v11 = [(CUPairingIdentity *)v8 altIRK];
        char v12 = [v11 isEqual:self->_rpSelfIRK];

        if (v12) {
          goto LABEL_38;
        }
LABEL_21:
        if (self->_rpSelfIRK)
        {
          -[CUPairingIdentity setAltIRK:](v8, "setAltIRK:");
          if (gLogCategory_CUPairingDaemon <= 30
            && (gLogCategory_CUPairingDaemon != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x1Eu, (uint64_t)"Updating identity for RP IRK: %@\n", v23, v24, v25, v26, (uint64_t)v8);
          }
          goto LABEL_37;
        }
LABEL_30:
        RandomBytes(bytes, 0x10uLL);
        CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)bytes, 16, "AltIRKSalt", 0xAuLL, (uint64_t)"AltIRKInfo", 10, 0x10uLL, (uint64_t)bytes);
        uint64_t v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:16];
        [(CUPairingIdentity *)v8 setAltIRK:v28];

        if (gLogCategory_CUPairingDaemon <= 30
          && (gLogCategory_CUPairingDaemon != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x1Eu, (uint64_t)"Updating identity for missing IRK: %@\n", v29, v30, v31, v32, (uint64_t)v8);
        }
LABEL_37:
        unsigned int v39 = [(CUPairingDaemon *)self _saveIdentity:v8 options:a3];
        if (v39)
        {
          uint64_t v13 = 0;
          goto LABEL_40;
        }
        goto LABEL_38;
      }
    }
LABEL_38:
    int v27 = v8;
LABEL_39:
    uint64_t v13 = v27;
    uint64_t v8 = v27;
    goto LABEL_40;
  }
  uint64_t v13 = 0;
  if (!v39)
  {
    unsigned int v39 = -6762;
    goto LABEL_40;
  }
  if ((a3 & 1) != 0 && v39 != -25293)
  {
    int v14 = objc_alloc_init(CUPairingIdentity);

    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    [(CUPairingIdentity *)v14 setIdentifier:v15];

    if ((a3 & 4) != 0 && self->_rpSelfIRK)
    {
      -[CUPairingIdentity setAltIRK:](v14, "setAltIRK:");
    }
    else
    {
      RandomBytes(bytes, 0x10uLL);
      CryptoHKDF((uint64_t)_kCryptoHashDescriptor_SHA512, (uint64_t)bytes, 16, "AltIRKSalt", 0xAuLL, (uint64_t)"AltIRKInfo", 10, 0x10uLL, (uint64_t)bytes);
      uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:16];
      [(CUPairingIdentity *)v14 setAltIRK:v16];
    }
    cced25519_make_key_pair_compat((uint64_t)bytes, (uint64_t)__s);
    CFDataRef v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes length:32];
    [(CUPairingIdentity *)v14 setPublicKey:v17];

    uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:__s length:32];
    [(CUPairingIdentity *)v14 setSecretKey:v18];

    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x1Eu, (uint64_t)"Created %@\n", v19, v20, v21, v22, (uint64_t)v14);
    }
    unsigned int v39 = [(CUPairingDaemon *)self _saveIdentity:v14 options:a3];
    if (v39)
    {
      uint64_t v13 = 0;
      uint64_t v8 = v14;
      goto LABEL_40;
    }
    if ((a3 & 2) == 0)
    {
      [(CUPairingIdentity *)v14 setAltIRK:0];
      [(CUPairingIdentity *)v14 setSecretKey:0];
    }
    int v27 = v14;
    goto LABEL_39;
  }
LABEL_40:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  uint64_t v37 = v39;
  if (v39 != -25300 && v39 && gLogCategory_CUPairingDaemon <= 60)
  {
    if (gLogCategory_CUPairingDaemon != -1)
    {
LABEL_44:
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyOrCreateWithOptions:error:]", 0x3Cu, (uint64_t)"### CopyIdentity failed: %#m\n", v33, v34, v35, v36, v37);
      goto LABEL_46;
    }
    if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x3Cu))
    {
      uint64_t v37 = v39;
      goto LABEL_44;
    }
  }
LABEL_46:
  if (a4) {
    *a4 = v39;
  }

  return v13;
}

- (id)_copyHomeKitExWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  int v27 = __Block_byref_object_copy__5786;
  uint64_t v28 = __Block_byref_object_dispose__5787;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__5786;
  uint64_t v22 = __Block_byref_object_dispose__5787;
  id v23 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  homeKitManager = self->_homeKitManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__CUPairingDaemon__copyHomeKitExWithOptions_error___block_invoke;
  v14[3] = &unk_1E55BF8F0;
  uint64_t v16 = &v24;
  CFDataRef v17 = &v18;
  char v9 = v7;
  uint64_t v15 = v9;
  [(CUHomeKitManager *)homeKitManager getPairingIdentityWithOptions:a3 completion:v14];
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    LODWORD(v11) = -6722;
  }
  else
  {
    int v11 = (void *)v19[5];
    if (v11) {
      LODWORD(v11) = NSErrorToOSStatusEx(v11, 0);
    }
  }
  if (a4) {
    *a4 = (int)v11;
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __51__CUPairingDaemon__copyHomeKitExWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_copyHomeKitWithOptionsKeychain:(unint64_t)a3 error:(int *)a4
{
  char v51 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"Get HomeKit Local key", v4, v5, v6, v7, v49);
  }
  unsigned int v55 = 0;
  int64_t v53 = 0;
  size_t v54 = 0;
  uint64_t v8 = *MEMORY[0x1E4F3B978];
  CFDictionaryRef v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v55, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", a3, (uint64_t)a4, v4, v5, v6, v7, *MEMORY[0x1E4F3B978]);
  if (!v15)
  {
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"No HomeKit Local key, try v2 key: %#m", v11, v12, v13, v14, v55);
    }
    CFDictionaryRef v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v55, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v9, v10, v11, v12, v13, v14, v8);
    if (!v15)
    {
      if (gLogCategory_CUPairingDaemon <= 30
        && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"No HomeKit v2 key, try v0 key: %#m", v18, v19, v20, v21, v55);
      }
      CFDictionaryRef v15 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v55, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v16, v17, v18, v19, v20, v21, v8);
      if (!v15)
      {
        uint64_t v42 = 0;
        uint64_t v28 = 0;
        uint64_t v30 = 0;
        id v34 = 0;
        id v29 = a4;
        goto LABEL_31;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = a4;
    if (gLogCategory_CUPairingDaemon <= 90
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x5Au, (uint64_t)"Bad HomeKit key type", v22, v23, v24, v25, v50);
    }
    id v34 = 0;
    uint64_t v30 = 0;
    uint64_t v28 = 0;
    uint64_t v42 = 0;
    uint64_t v41 = 4294960540;
    goto LABEL_51;
  }
  uint64_t v26 = (const void *)*MEMORY[0x1E4F3B5C0];
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t v28 = CFDictionaryGetTypedValue(v15, v26, TypeID, (int *)&v55);
  id v29 = a4;
  if (!v28)
  {
    uint64_t v42 = 0;
    uint64_t v30 = 0;
LABEL_47:
    id v34 = 0;
    goto LABEL_31;
  }
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v28];
  if (!v30)
  {
    id v34 = 0;
    uint64_t v42 = 0;
    uint64_t v41 = 4294960588;
    goto LABEL_51;
  }
  uint64_t v31 = (const void *)*MEMORY[0x1E4F3BD38];
  CFTypeID v32 = CFDataGetTypeID();
  uint64_t v33 = CFDictionaryGetTypedValue(v15, v31, v32, (int *)&v55);
  if (!v33)
  {
    uint64_t v42 = 0;
    goto LABEL_47;
  }
  id v34 = v33;
  uint64_t v35 = (char *)[v34 bytes];
  size_t v36 = [v34 length];
  size_t v54 = v36;
  uint64_t v37 = (char *)memchr(v35, 43, v36);
  if (!v37)
  {
    uint64_t v42 = 0;
    uint64_t v41 = 4294960554;
    goto LABEL_51;
  }
  uint64_t v38 = &v35[v36];
  unsigned int v39 = v37 + 1;
  int64_t v40 = v38 - (v37 + 1);
  int64_t v53 = v40;
  size_t v54 = v37 - v35;
  uint64_t v41 = HexToData(v35, v37 - v35, 22, (uint64_t)v57, 0x20uLL, &v54, 0, 0);
  unsigned int v55 = v41;
  if (v41) {
    goto LABEL_39;
  }
  if (v54 != 32)
  {
LABEL_40:
    uint64_t v42 = 0;
    uint64_t v41 = 4294960553;
LABEL_51:
    unsigned int v55 = v41;
    goto LABEL_32;
  }
  uint64_t v41 = HexToData(v39, v40, 22, (uint64_t)v56, 0x20uLL, (unint64_t *)&v53, 0, 0);
  unsigned int v55 = v41;
  if (v41)
  {
LABEL_39:
    uint64_t v42 = 0;
    goto LABEL_32;
  }
  if (v53 != 32) {
    goto LABEL_40;
  }
  uint64_t v42 = objc_alloc_init(CUPairingIdentity);
  [(CUPairingIdentity *)v42 setIdentifier:v30];
  id v43 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  CFTypeID v44 = (void *)[v43 initWithBytes:v57 length:v54];
  [(CUPairingIdentity *)v42 setPublicKey:v44];

  if ((v51 & 2) != 0)
  {
    id v45 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    long long v46 = (void *)[v45 initWithBytes:v56 length:v53];
    [(CUPairingIdentity *)v42 setSecretKey:v46];
  }
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x1Eu, (uint64_t)"Got HomeKit key: %@", v22, v23, v24, v25, (uint64_t)v42);
  }
LABEL_31:
  uint64_t v41 = v55;
  if (!v55) {
    goto LABEL_36;
  }
LABEL_32:
  if (gLogCategory_CUPairingDaemon > 90) {
    goto LABEL_36;
  }
  if (gLogCategory_CUPairingDaemon != -1) {
    goto LABEL_34;
  }
  if (_LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au))
  {
    uint64_t v41 = v55;
LABEL_34:
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsKeychain:error:]", 0x5Au, (uint64_t)"### Get HomeKit key failed: %#m", v22, v23, v24, v25, v41);
  }
LABEL_36:
  if (v29) {
    *id v29 = v55;
  }
  long long v47 = v42;

  return v47;
}

- (id)_copyHomeKitLocalPairingIDWithOptions:(unint64_t)a3 error:(int *)a4
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  int v27 = __Block_byref_object_copy__5786;
  uint64_t v28 = __Block_byref_object_dispose__5787;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__5786;
  uint64_t v22 = __Block_byref_object_dispose__5787;
  id v23 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  homeKitManager = self->_homeKitManager;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CUPairingDaemon__copyHomeKitLocalPairingIDWithOptions_error___block_invoke;
  v14[3] = &unk_1E55BF8F0;
  uint64_t v16 = &v24;
  uint64_t v17 = &v18;
  uint64_t v9 = v7;
  CFDictionaryRef v15 = v9;
  [(CUHomeKitManager *)homeKitManager getHomeKitLocalPairingIdentityWithOptions:a3 completion:v14];
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    LODWORD(v11) = -6722;
  }
  else
  {
    uint64_t v11 = (void *)v19[5];
    if (v11) {
      LODWORD(v11) = NSErrorToOSStatusEx(v11, 0);
    }
  }
  if (a4) {
    *a4 = (int)v11;
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __63__CUPairingDaemon__copyHomeKitLocalPairingIDWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_copyHomeKitWithOptionsHAP:(unint64_t)a3 error:(int *)a4
{
  id v11 = -[CUPairingDaemon _copyHomeKitLocalPairingIDWithOptions:error:](self, "_copyHomeKitLocalPairingIDWithOptions:error:");
  if (v11) {
    return v11;
  }
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _copyHomeKitWithOptionsHAP:error:]", 0x1Eu, (uint64_t)"No HomeKit Local Pairing ID, trying HAP directly", v7, v8, v9, v10, v26);
  }
  id v12 = [(objc_class *)getHAPSystemKeychainStoreClass_5819() systemStore];
  if (v12)
  {
    uint64_t v13 = v12;
    id v27 = 0;
    uint64_t v14 = [v12 getLocalPairingIdentity:&v27];
    id v15 = v27;
    uint64_t v16 = v15;
    if (v14)
    {
      uint64_t v17 = [v14 identifier];
      if (v17)
      {
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
        if (v18)
        {
          uint64_t v19 = objc_alloc_init(CUPairingIdentity);
          [(CUPairingIdentity *)v19 setIdentifier:v18];
          uint64_t v20 = [v14 publicKey];
          uint64_t v21 = [v20 data];
          [(CUPairingIdentity *)v19 setPublicKey:v21];

          if ((a3 & 2) != 0)
          {
            uint64_t v22 = [v14 privateKey];
            id v23 = [v22 data];
            [(CUPairingIdentity *)v19 setSecretKey:v23];
          }
          int v24 = 0;
          goto LABEL_13;
        }
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = 0;
        uint64_t v18 = 0;
      }
      int v24 = -6708;
    }
    else
    {
      int v24 = NSErrorToOSStatusEx(v15, 0);
      uint64_t v19 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
    }
LABEL_13:
    if (a4) {
      *a4 = v24;
    }
    id v11 = v19;

    return v11;
  }
  return [(CUPairingDaemon *)self _copyHomeKitWithOptionsKeychain:a3 error:a4];
}

- (void)getIdentityWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, void *, void *))a4;
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ((a3 & 8) != 0)
  {
    int v24 = 0;
    id v11 = [(CUPairingDaemon *)v9 _copyHomeKitWithOptions:a3 error:&v24];
    if (v8)
    {
      uint64_t v12 = v24;
      if (v24)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
        uint64_t v4 = (void *)v14;
        id v15 = @"?";
        if (v14) {
          id v15 = (__CFString *)v14;
        }
        v28[0] = v15;
        id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        uint64_t v16 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:v5];
      }
      else
      {
        uint64_t v16 = 0;
      }
      v8[2](v8, v11, v16);
      if (v12)
      {
      }
    }
    goto LABEL_21;
  }
  if ((a3 & 0x138) == 0)
  {
    int v24 = 0;
    id v11 = [(CUPairingDaemon *)v9 _copyOrCreateWithOptions:a3 error:&v24];
    if (v8)
    {
      uint64_t v17 = v24;
      if (v24)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
        uint64_t v4 = (void *)v19;
        uint64_t v20 = @"?";
        if (v19) {
          uint64_t v20 = (__CFString *)v19;
        }
        uint64_t v26 = v20;
        id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        uint64_t v21 = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:v17 userInfo:v5];
      }
      else
      {
        uint64_t v21 = 0;
      }
      v8[2](v8, v11, v21);
      if (v17)
      {
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  homeKitManager = v9->_homeKitManager;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__CUPairingDaemon_getIdentityWithOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E55BE608;
  id v23 = v8;
  [(CUHomeKitManager *)homeKitManager getPairingIdentityWithOptions:a3 completion:v22];

LABEL_22:
  objc_sync_exit(v9);
}

uint64_t __60__CUPairingDaemon_getIdentityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)copyIdentityWithOptions:(unint64_t)a3 error:(int *)a4
{
  id v6 = self;
  objc_sync_enter(v6);
  if ((a3 & 8) != 0)
  {
    uint64_t v7 = [(CUPairingDaemon *)v6 _copyHomeKitWithOptions:a3 error:a4];
  }
  else if ((a3 & 0x138) != 0)
  {
    uint64_t v7 = [(CUPairingDaemon *)v6 _copyHomeKitExWithOptions:a3 error:a4];
  }
  else
  {
    uint64_t v7 = [(CUPairingDaemon *)v6 _copyOrCreateWithOptions:a3 error:a4];
  }
  uint64_t v8 = (void *)v7;
  objc_sync_exit(v6);

  return v8;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return [(NSXPCListener *)self->_xpcListener endpoint];
}

- (void)_rpIdentityUpdate
{
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]", 0x1Eu, (uint64_t)"Self RPIdentity get start\n", v2, v3, v4, v5, v9[0]);
  }
  id v7 = objc_alloc_init((Class)getRPClientClass[0]());
  [v7 setDispatchQueue:self->_dispatchQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)__36__CUPairingDaemon__rpIdentityUpdate__block_invoke;
  v9[3] = (uint64_t)&unk_1E55BE5E0;
  id v10 = v7;
  id v11 = self;
  id v8 = v7;
  [v8 getIdentitiesWithFlags:1 completion:v9];
}

void __36__CUPairingDaemon__rpIdentityUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) invalidate];
  if (v6)
  {
    if (gLogCategory_CUPairingDaemon <= 90
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x5Au, (uint64_t)"### Self RPIdentity get failed: %{error}\n", v7, v8, v9, v10, (uint64_t)v6);
    }
    goto LABEL_40;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
      if ([v16 type] == 1) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v13) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
    id v21 = v16;

    if (!v21) {
      goto LABEL_20;
    }
    id v22 = *(id *)(*(void *)(a1 + 40) + 24);
    id v23 = [v21 deviceIRKData];
    uint64_t v28 = v23;
    if (v23)
    {
      id v29 = v23;
      id v30 = v22;
      uint64_t v31 = v30;
      if (v29 == v30)
      {
      }
      else
      {
        if (!v30)
        {

          goto LABEL_32;
        }
        int v32 = [v29 isEqual:v30];

        if (!v32)
        {
LABEL_32:
          if (gLogCategory_CUPairingDaemon <= 30
            && (gLogCategory_CUPairingDaemon != -1
             || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
          {
            LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x1Eu, (uint64_t)"Self RPIdentity IRK changed: %{mask} -> %{mask}\n", v24, v25, v26, v27, (uint64_t)v31);
          }
          objc_storeStrong((id *)(*(void *)(a1 + 40) + 24), v28);
          notify_post("com.apple.pairing.identityChanged");
LABEL_39:

          goto LABEL_40;
        }
      }
    }
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x1Eu, (uint64_t)"Self RPIdentity IRK unchanged: %{mask} -> %{mask}\n", v24, v25, v26, v27, (uint64_t)v22);
    }
    goto LABEL_39;
  }
LABEL_13:

LABEL_20:
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _rpIdentityUpdate]_block_invoke", 0x1Eu, (uint64_t)"Self RPIdentity get failed: no self identity\n", v17, v18, v19, v20, v33);
  }
LABEL_40:
}

- (void)reset
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_testMode)
  {
    [(CUPairingDaemon *)self deleteIdentityWithOptions:0];
    [(CUPairingDaemon *)self deleteIdentityWithOptions:4];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [(CUPairingDaemon *)self copyPairedPeersWithOptions:0 error:0];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [(CUPairingDaemon *)self removePairedPeer:*(void *)(*((void *)&v22 + 1) + 8 * i) options:0 removeAdminAllowed:1];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    id v12 = [(CUPairingDaemon *)self copyPairedPeersWithOptions:4 error:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          -[CUPairingDaemon removePairedPeer:options:removeAdminAllowed:](self, "removePairedPeer:options:removeAdminAllowed:", *(void *)(*((void *)&v18 + 1) + 8 * j), 4, 1, (void)v18);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
  else if (gLogCategory_CUPairingDaemon <= 90 {
         && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x5Au)))
  }
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon reset]", 0x5Au, (uint64_t)"### Reset only allowed in test mode\n", v2, v3, v4, v5, v30);
  }
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [v5 connectionInvalidated];
  [(NSMutableSet *)self->_xpcConnections removeObject:v5];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = objc_alloc_init(CUPairingXPCConnection);
  objc_storeStrong((id *)&v7->_daemon, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v7];
  [v6 _setQueue:self->_dispatchQueue];
  id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4F980];
  [v6 setExportedInterface:v11];

  [v6 setExportedObject:v7];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__CUPairingDaemon_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E55BF170;
  v20[4] = self;
  id v12 = v7;
  long long v21 = v12;
  [v6 setInvalidationHandler:v20];
  id v13 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4FB10];
  [v6 setRemoteObjectInterface:v13];

  [v6 resume];
  if (gLogCategory_CUPairingDaemon <= 20
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x14u)))
  {
    uint64_t v14 = [v6 processIdentifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon listener:shouldAcceptNewConnection:]", 0x14u, (uint64_t)"XPC connection started from %#{pid}\n", v15, v16, v17, v18, v14);
  }

  return 1;
}

uint64_t __54__CUPairingDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _connectionInvalidated:*(void *)(a1 + 40)];
}

- (void)_invalidate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v17);
  }
  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_xpcConnections;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*(void *)(*((void *)&v17 + 1) + 8 * i) + 40), "invalidate", (void)v17);
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  [(NSMutableSet *)self->_xpcConnections removeAllObjects];
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
  int rpIdentityNotifier = self->_rpIdentityNotifier;
  if (rpIdentityNotifier != -1)
  {
    notify_cancel(rpIdentityNotifier);
    self->_int rpIdentityNotifier = -1;
  }
  rpSelfIRK = self->_rpSelfIRK;
  self->_rpSelfIRK = 0;

  [(CUHomeKitManager *)self->_homeKitManager invalidate];
  homeKitManager = self->_homeKitManager;
  self->_homeKitManager = 0;

  if ((CUPairingDaemon *)gPairingDaemon == self)
  {
    gPairingDaemon = 0;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUPairingDaemon_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__CUPairingDaemon_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activate
{
  if (gLogCategory_CUPairingDaemon <= 30
    && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _activate]", 0x1Eu, (uint64_t)"Activate\n", v2, v3, v4, v5, v13);
  }
  if (!self->_homeKitManager)
  {
    id v7 = objc_alloc_init(CUHomeKitManager);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v7;

    dispatch_queue_t v9 = dispatch_queue_create("CUPairingDaemonHomeKit", 0);
    [(CUHomeKitManager *)self->_homeKitManager setDispatchQueue:v9];

    [(CUHomeKitManager *)self->_homeKitManager setFlags:516];
    if (GestaltGetDeviceClass_sOnce != -1) {
      dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13498);
    }
    if (GestaltGetDeviceClass_deviceClass == 7 || GestaltGetDeviceClass_deviceClass == 4) {
      [(CUHomeKitManager *)self->_homeKitManager setFlags:[(CUHomeKitManager *)self->_homeKitManager flags] | 2];
    }
    [(CUHomeKitManager *)self->_homeKitManager activate];
  }
  if (self->_rpIdentityNotifier == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __28__CUPairingDaemon__activate__block_invoke;
    handler[3] = &unk_1E55BF010;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_rpIdentityNotifier, dispatchQueue, handler);
    [(CUPairingDaemon *)self _rpIdentityUpdate];
  }
  if (!self->_stateHandle) {
    self->_stateHandle = os_state_add_handler();
  }
  if (!self->_xpcListener)
  {
    uint64_t v11 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.PairingManager"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v11;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
}

uint64_t __28__CUPairingDaemon__activate__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(*(void *)(result + 32) + 16) != -1)
  {
    uint64_t v8 = result;
    if (gLogCategory_CUPairingDaemon <= 30
      && (gLogCategory_CUPairingDaemon != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingDaemon, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingDaemon, (uint64_t)"-[CUPairingDaemon _activate]_block_invoke", 0x1Eu, (uint64_t)"RPIdentities changed\n", a5, a6, a7, a8, v10);
    }
    dispatch_queue_t v9 = *(void **)(v8 + 32);
    return [v9 _rpIdentityUpdate];
  }
  return result;
}

CFMutableStringRef __28__CUPairingDaemon__activate__block_invoke_2(uint64_t a1)
{
  return CUStateDumpWithObject((uint64_t)"CUPairingDaemon", *(void **)(a1 + 32), &gLogCategory_CUPairingDaemon);
}

- (void)activate
{
  if (self->_testMode && !self->_xpcListener)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CUPairingDaemon_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__CUPairingDaemon_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (id)detailedDescription
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  CFMutableStringRef v209 = 0;
  NSAppendPrintF(&v209, (uint64_t)"=== CUPairingManager ===\n", v2, v3, v4, v5, v6, v7, v166);
  dispatch_queue_t v9 = v209;
  id v10 = [(CUPairingDaemon *)self copyIdentityWithOptions:2 error:0];
  long long v17 = v10;
  if (v10)
  {
    CFMutableStringRef v208 = v9;
    long long v18 = &v208;
    NSAppendPrintF(&v208, (uint64_t)"Per-account:      %@\n", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  else
  {
    CFMutableStringRef v207 = v9;
    long long v18 = &v207;
    NSAppendPrintF(&v207, (uint64_t)"Per-account:      No identity\n", v11, v12, v13, v14, v15, v16, v167);
  }
  long long v19 = *v18;

  id v20 = [(CUPairingDaemon *)self copyIdentityWithOptions:6 error:0];
  if (v20)
  {
    CFMutableStringRef v206 = v19;
    uint64_t v27 = &v206;
    NSAppendPrintF(&v206, (uint64_t)"Per-device:       %@\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
  }
  else
  {
    CFMutableStringRef v205 = v19;
    uint64_t v27 = &v205;
    NSAppendPrintF(&v205, (uint64_t)"Per-device:       No identity\n", v21, v22, v23, v24, v25, v26, v168);
  }
  uint64_t v28 = *v27;

  id v29 = [(CUPairingDaemon *)self copyIdentityWithOptions:10 error:0];
  if (v29)
  {
    CFMutableStringRef v204 = v28;
    long long v36 = &v204;
    NSAppendPrintF(&v204, (uint64_t)"HomeKitHAP:       %@\n", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
  }
  else
  {
    CFMutableStringRef v203 = v28;
    long long v36 = &v203;
    NSAppendPrintF(&v203, (uint64_t)"HomeKitHAP:       No identity\n", v30, v31, v32, v33, v34, v35, v169);
  }
  long long v37 = *v36;

  if (GestaltGetDeviceClass_sOnce != -1) {
    dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13498);
  }
  if (GestaltGetDeviceClass_deviceClass == 7 || GestaltGetDeviceClass_deviceClass == 4)
  {
    id v38 = [(CUPairingDaemon *)self copyIdentityWithOptions:18 error:0];

    if (v38)
    {
      CFMutableStringRef v202 = v37;
      id v45 = &v202;
      NSAppendPrintF(&v202, (uint64_t)"HomeKitAccessory: %@\n", v39, v40, v41, v42, v43, v44, (uint64_t)v38);
      id v29 = v38;
    }
    else
    {
      CFMutableStringRef v201 = v37;
      id v45 = &v201;
      NSAppendPrintF(&v201, (uint64_t)"HomeKitAccessory: No identity\n", v39, v40, v41, v42, v43, v44, v170);
      id v29 = 0;
    }
    long long v46 = *v45;

    long long v37 = v46;
  }
  id v47 = [(CUPairingDaemon *)self copyIdentityWithOptions:34 error:0];

  if (v47)
  {
    CFMutableStringRef v200 = v37;
    size_t v54 = &v200;
    NSAppendPrintF(&v200, (uint64_t)"HomeKitUser:      %@\n", v48, v49, v50, v51, v52, v53, (uint64_t)v47);
  }
  else
  {
    CFMutableStringRef v199 = v37;
    size_t v54 = &v199;
    NSAppendPrintF(&v199, (uint64_t)"HomeKitUser:      No identity\n", v48, v49, v50, v51, v52, v53, v170);
  }
  unsigned int v55 = *v54;

  id v56 = [(CUPairingDaemon *)self copyIdentityWithOptions:258 error:0];
  v175 = v56;
  if (v56)
  {
    CFMutableStringRef v198 = v55;
    uint64_t v172 = (uint64_t)v56;
    id v63 = &v198;
    NSAppendPrintF(&v198, (uint64_t)"HomeKitLegacy:    %@\n", v57, v58, v59, v60, v61, v62, v172);
  }
  else
  {
    CFMutableStringRef v197 = v55;
    id v63 = &v197;
    NSAppendPrintF(&v197, (uint64_t)"HomeKitLegacy:    No identity\n", v57, v58, v59, v60, v61, v62, v171);
  }
  uint64_t v64 = *v63;

  v176 = self;
  id v65 = [(CUPairingDaemon *)self copyPairedPeersWithOptions:2 error:0];
  CFMutableStringRef v196 = v64;
  uint64_t v66 = [v65 count];
  NSAppendPrintF(&v196, (uint64_t)"\n--- Per-account Peers (%ld) ---\n", v67, v68, v69, v70, v71, v72, v66);
  uint64_t v73 = v196;

  long long v194 = 0u;
  long long v195 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  id v74 = v65;
  uint64_t v75 = [v74 countByEnumeratingWithState:&v192 objects:v212 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v193;
    do
    {
      for (uint64_t i = 0; i != v76; ++i)
      {
        v79 = v73;
        if (*(void *)v193 != v77) {
          objc_enumerationMutation(v74);
        }
        uint64_t v80 = *(void **)(*((void *)&v192 + 1) + 8 * i);
        CFMutableStringRef v191 = v73;
        id v81 = v80;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v82 = [v81 detailedDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v81 descriptionWithLevel:20];
          }
          else {
          uint64_t v82 = NSPrintF((uint64_t)"%@\n", v83, v84, v85, v86, v87, v88, v89, (uint64_t)v81);
          }
        }
        CFDictionaryRef v90 = (void *)v82;

        NSAppendPrintF(&v191, (uint64_t)"%@", v91, v92, v93, v94, v95, v96, (uint64_t)v90);
        uint64_t v73 = v191;
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v192 objects:v212 count:16];
    }
    while (v76);
  }

  if (![v74 count])
  {
    CFMutableStringRef v190 = v73;
    NSAppendPrintF(&v190, (uint64_t)"No per-account peers\n", v97, v98, v99, v100, v101, v102, v173);
    v103 = v190;

    uint64_t v73 = v103;
  }
  id v104 = [(CUPairingDaemon *)v176 copyPairedPeersWithOptions:6 error:0];

  CFMutableStringRef v189 = v73;
  uint64_t v105 = [v104 count];
  NSAppendPrintF(&v189, (uint64_t)"\n--- Per-device Peers (%ld) ---\n", v106, v107, v108, v109, v110, v111, v105);
  long long v112 = v189;

  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id v113 = v104;
  uint64_t v114 = [v113 countByEnumeratingWithState:&v185 objects:v211 count:16];
  if (v114)
  {
    uint64_t v115 = v114;
    uint64_t v116 = *(void *)v186;
    do
    {
      for (uint64_t j = 0; j != v115; ++j)
      {
        long long v118 = v112;
        if (*(void *)v186 != v116) {
          objc_enumerationMutation(v113);
        }
        long long v119 = *(void **)(*((void *)&v185 + 1) + 8 * j);
        CFMutableStringRef v184 = v112;
        id v120 = v119;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v121 = [v120 detailedDescription];
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            [v120 descriptionWithLevel:20];
          }
          else {
          uint64_t v121 = NSPrintF((uint64_t)"%@\n", v122, v123, v124, v125, v126, v127, v128, (uint64_t)v120);
          }
        }
        v129 = (void *)v121;

        NSAppendPrintF(&v184, (uint64_t)"%@", v130, v131, v132, v133, v134, v135, (uint64_t)v129);
        long long v112 = v184;
      }
      uint64_t v115 = [v113 countByEnumeratingWithState:&v185 objects:v211 count:16];
    }
    while (v115);
  }

  if (![v113 count])
  {
    CFMutableStringRef v183 = v112;
    NSAppendPrintF(&v183, (uint64_t)"No per-device peers\n", v136, v137, v138, v139, v140, v141, v174);
    v142 = v183;

    long long v112 = v142;
  }
  CFMutableStringRef v182 = v112;
  uint64_t v143 = [(NSMutableSet *)v176->_xpcConnections count];
  NSAppendPrintF(&v182, (uint64_t)"\n--- XPC connections (%ld) ---\n", v144, v145, v146, v147, v148, v149, v143);
  v150 = v182;

  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  v151 = v176->_xpcConnections;
  uint64_t v152 = [(NSMutableSet *)v151 countByEnumeratingWithState:&v178 objects:v210 count:16];
  if (v152)
  {
    uint64_t v153 = v152;
    uint64_t v154 = *(void *)v179;
    do
    {
      uint64_t v155 = 0;
      v156 = v150;
      do
      {
        if (*(void *)v179 != v154) {
          objc_enumerationMutation(v151);
        }
        uint64_t v157 = *(void *)(*((void *)&v178 + 1) + 8 * v155);
        CFMutableStringRef v177 = v156;
        uint64_t v158 = [*(id *)(v157 + 40) processIdentifier];
        NSAppendPrintF(&v177, (uint64_t)"%#{pid}\n", v159, v160, v161, v162, v163, v164, v158);
        v150 = v177;

        ++v155;
        v156 = v150;
      }
      while (v153 != v155);
      uint64_t v153 = [(NSMutableSet *)v151 countByEnumeratingWithState:&v178 objects:v210 count:16];
    }
    while (v153);
  }

  return v150;
}

- (NSString)description
{
  [(NSMutableSet *)self->_xpcConnections count];
  return (NSString *)NSPrintF((uint64_t)"CUPairingManager %{ptr} <%ld XPC>", v3, v4, v5, v6, v7, v8, v9, (uint64_t)self);
}

- (void)dealloc
{
  if (self->_xpcListener) {
    FatalErrorF((uint64_t)"XPC listener still active during dealloc", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v8.receiver);
  }
  v8.receiver = self;
  v8.super_class = (Class)CUPairingDaemon;
  [(CUPairingDaemon *)&v8 dealloc];
}

- (id)initStandalone
{
  v5.receiver = self;
  v5.super_class = (Class)CUPairingDaemon;
  uint64_t v2 = [(CUPairingDaemon *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_int rpIdentityNotifier = -1;
    uint64_t v3 = v2;
  }

  return v2;
}

- (CUPairingDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUPairingDaemon;
  uint64_t v2 = [(CUPairingDaemon *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_int rpIdentityNotifier = -1;
    objc_storeStrong((id *)&gPairingDaemon, v2);
    uint64_t v3 = v2;
  }

  return v2;
}

+ (id)sharedPairingDaemon
{
  return (id)gPairingDaemon;
}

@end