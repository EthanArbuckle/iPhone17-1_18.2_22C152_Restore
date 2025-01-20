@interface CUPairingSession
- (BOOL)localize;
- (CUAppleIDClient)myAppleIDInfoClient;
- (CUPairedPeer)pairedPeer;
- (CUPairingSession)init;
- (NSArray)allowedMACAddresses;
- (NSData)mfiCertificateData;
- (NSData)mfiToken;
- (NSDictionary)acl;
- (NSDictionary)aclActual;
- (NSDictionary)additionalPeerInfo;
- (NSDictionary)additionalSelfInfo;
- (NSDictionary)appInfoPeer;
- (NSDictionary)appInfoSelf;
- (NSDictionary)groupInfoPeer;
- (NSDictionary)groupInfoSelf;
- (NSDictionary)peerInfo;
- (NSString)fixedPIN;
- (NSString)label;
- (NSString)languageCode;
- (NSString)localeIdentifier;
- (NSString)mfiProductType;
- (NSString)mfiSerialNumber;
- (NSString)myAppleID;
- (NSString)peerAppleID;
- (OS_dispatch_queue)dispatchQueue;
- (id)completionHandler;
- (id)copyIdentityHandler;
- (id)findPeerHandler;
- (id)hidePINHandler;
- (id)openStreamWithName:(id)a3 error:(id *)a4;
- (id)openStreamWithName:(id)a3 type:(int)a4 error:(id *)a5;
- (id)promptForPINHandler;
- (id)savePeerHandler;
- (id)sendDataHandler;
- (id)sendMessageDataHandler;
- (id)showPINHandler;
- (id)showPINHandlerEx;
- (id)signDataHandler;
- (id)verifySignatureHandler;
- (int)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 outputKeyPtr:(void *)a8;
- (int)peerDeviceClass;
- (unint64_t)peerAppFlags;
- (unint64_t)selfAppFlags;
- (unsigned)flags;
- (unsigned)pinType;
- (unsigned)pinTypeActual;
- (unsigned)sessionType;
- (void)_activate;
- (void)_cleanup;
- (void)_completed:(id)a3;
- (void)_receivedData:(id)a3 flags:(unsigned int)a4;
- (void)_tryPIN:(id)a3;
- (void)activate;
- (void)closeStream:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)receivedData:(id)a3;
- (void)receivedMessageData:(id)a3;
- (void)setAcl:(id)a3;
- (void)setAdditionalPeerInfo:(id)a3;
- (void)setAdditionalSelfInfo:(id)a3;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAppInfoSelf:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCopyIdentityHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFindPeerHandler:(id)a3;
- (void)setFixedPIN:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGroupInfoSelf:(id)a3;
- (void)setHidePINHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalize:(BOOL)a3;
- (void)setMfiCertificateData:(id)a3;
- (void)setMfiProductType:(id)a3;
- (void)setMfiSerialNumber:(id)a3;
- (void)setMfiToken:(id)a3;
- (void)setMyAppleID:(id)a3;
- (void)setMyAppleIDInfoClient:(id)a3;
- (void)setPeerAppleID:(id)a3;
- (void)setPeerDeviceClass:(int)a3;
- (void)setPinType:(unsigned int)a3;
- (void)setPromptForPINHandler:(id)a3;
- (void)setSavePeerHandler:(id)a3;
- (void)setSelfAppFlags:(unint64_t)a3;
- (void)setSendDataHandler:(id)a3;
- (void)setSendMessageDataHandler:(id)a3;
- (void)setSessionType:(unsigned int)a3;
- (void)setShowPINHandler:(id)a3;
- (void)setShowPINHandlerEx:(id)a3;
- (void)setSignDataHandler:(id)a3;
- (void)setVerifySignatureHandler:(id)a3;
- (void)tryPIN:(id)a3;
@end

@implementation CUPairingSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_savePeerHandler, 0);
  objc_storeStrong(&self->_findPeerHandler, 0);
  objc_storeStrong(&self->_copyIdentityHandler, 0);
  objc_storeStrong(&self->_verifySignatureHandler, 0);
  objc_storeStrong(&self->_signDataHandler, 0);
  objc_storeStrong(&self->_sendMessageDataHandler, 0);
  objc_storeStrong(&self->_sendDataHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_mfiToken, 0);
  objc_storeStrong((id *)&self->_mfiSerialNumber, 0);
  objc_storeStrong((id *)&self->_mfiProductType, 0);
  objc_storeStrong((id *)&self->_mfiCertificateData, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_groupInfoSelf, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_appInfoSelf, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_additionalSelfInfo, 0);
  objc_storeStrong((id *)&self->_additionalPeerInfo, 0);
  objc_storeStrong((id *)&self->_aclActual, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_pairingStreams, 0);
}

- (void)setSavePeerHandler:(id)a3
{
}

- (id)savePeerHandler
{
  return self->_savePeerHandler;
}

- (void)setFindPeerHandler:(id)a3
{
}

- (id)findPeerHandler
{
  return self->_findPeerHandler;
}

- (void)setCopyIdentityHandler:(id)a3
{
}

- (id)copyIdentityHandler
{
  return self->_copyIdentityHandler;
}

- (void)setVerifySignatureHandler:(id)a3
{
}

- (id)verifySignatureHandler
{
  return self->_verifySignatureHandler;
}

- (void)setSignDataHandler:(id)a3
{
}

- (id)signDataHandler
{
  return self->_signDataHandler;
}

- (void)setSendMessageDataHandler:(id)a3
{
}

- (id)sendMessageDataHandler
{
  return self->_sendMessageDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setHidePINHandler:(id)a3
{
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setShowPINHandler:(id)a3
{
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandlerEx:(id)a3
{
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setPeerAppleID:(id)a3
{
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setMyAppleIDInfoClient:(id)a3
{
}

- (CUAppleIDClient)myAppleIDInfoClient
{
  return self->_myAppleIDInfoClient;
}

- (void)setMyAppleID:(id)a3
{
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMfiToken:(id)a3
{
}

- (NSData)mfiToken
{
  return self->_mfiToken;
}

- (void)setMfiSerialNumber:(id)a3
{
}

- (NSString)mfiSerialNumber
{
  return self->_mfiSerialNumber;
}

- (void)setMfiProductType:(id)a3
{
}

- (NSString)mfiProductType
{
  return self->_mfiProductType;
}

- (void)setMfiCertificateData:(id)a3
{
}

- (NSData)mfiCertificateData
{
  return self->_mfiCertificateData;
}

- (void)setSessionType:(unsigned int)a3
{
  self->_sessionType = a3;
}

- (unsigned)sessionType
{
  return self->_sessionType;
}

- (unsigned)pinTypeActual
{
  return self->_pinTypeActual;
}

- (void)setPinType:(unsigned int)a3
{
  self->_pinType = a3;
}

- (unsigned)pinType
{
  return self->_pinType;
}

- (NSDictionary)peerInfo
{
  return self->_peerInfo;
}

- (void)setPeerDeviceClass:(int)a3
{
  self->_peerDeviceClass = a3;
}

- (int)peerDeviceClass
{
  return self->_peerDeviceClass;
}

- (void)setLocalize:(BOOL)a3
{
  self->_localize = a3;
}

- (BOOL)localize
{
  return self->_localize;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)label
{
  return self->_label;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFixedPIN:(id)a3
{
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setGroupInfoSelf:(id)a3
{
}

- (NSDictionary)groupInfoSelf
{
  return self->_groupInfoSelf;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setAppInfoSelf:(id)a3
{
}

- (NSDictionary)appInfoSelf
{
  return self->_appInfoSelf;
}

- (unint64_t)selfAppFlags
{
  return self->_selfAppFlags;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAdditionalSelfInfo:(id)a3
{
}

- (NSDictionary)additionalSelfInfo
{
  return self->_additionalSelfInfo;
}

- (void)setAdditionalPeerInfo:(id)a3
{
}

- (NSDictionary)additionalPeerInfo
{
  return self->_additionalPeerInfo;
}

- (NSDictionary)aclActual
{
  return self->_aclActual;
}

- (void)setAcl:(id)a3
{
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (int)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 outputKeyPtr:(void *)a8
{
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 90)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          goto LABEL_11;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]", 0x5Au, (uint64_t)"### Derive key before activate\n", (uint64_t)a5, a6, a7, (uint64_t)a8, v18);
    }
LABEL_11:
    LODWORD(v14) = -6745;
    return v14;
  }
  uint64_t v14 = PairingSessionDeriveKey((uint64_t)pairingSession, (char *)a3, a4, (uint64_t)a5, a6, a7, (uint64_t)a8);
  if (v14)
  {
    v17 = self->_ucat;
    if (v17->var0 <= 90)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au)) {
          return v14;
        }
        v17 = self->_ucat;
      }
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:]", 0x5Au, (uint64_t)"### Derive key failed: %#m\n", v10, v11, v12, v13, v14);
    }
  }
  return v14;
}

- (void)closeStream:(id)a3
{
  uint64_t v4 = [a3 name];
  uint64_t ucat = (uint64_t)self->_ucat;
  uint64_t v11 = v4;
  if (*(int *)ucat <= 30)
  {
    if (*(_DWORD *)ucat != -1)
    {
LABEL_3:
      uint64_t ucat = LogPrintF(ucat, (uint64_t)"-[CUPairingSession closeStream:]", 0x1Eu, (uint64_t)"Close stream '%@'\n", v5, v6, v7, v8, v4);
      uint64_t v4 = v11;
      goto LABEL_5;
    }
    uint64_t ucat = _LogCategory_Initialize(ucat, 0x1Eu);
    uint64_t v4 = v11;
    if (ucat)
    {
      uint64_t ucat = (uint64_t)self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (v4)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_pairingStreams objectForKeyedSubscript:v11];
    [v10 _cleanup];
  }
  MEMORY[0x1F4181820](ucat);
}

- (id)openStreamWithName:(id)a3 type:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  unsigned int v63 = 0;
  v62 = 0;
  uint64_t ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession openStreamWithName:type:error:]", 0x1Eu, (uint64_t)"Open stream '%@'\n", v8, v9, v10, v11, (uint64_t)v12);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      uint64_t ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (![v12 length])
  {
    v33 = "EmptyName";
    uint64_t v34 = 4294960552;
LABEL_14:
    NSErrorWithOSStatusF(v34, (uint64_t)v33, v14, v15, v16, v17, v18, v19, v60);
LABEL_15:
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    goto LABEL_16;
  }
  v20 = [(NSMutableDictionary *)self->_pairingStreams objectForKeyedSubscript:v12];

  if (v20)
  {
    NSErrorWithOSStatusF(4294960575, (uint64_t)"Stream '%@' already used", v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    goto LABEL_15;
  }
  if (v6 != 1)
  {
    if (v6 == 2)
    {
      v21 = &kCryptoAEADDescriptorAESGCM;
      goto LABEL_11;
    }
    uint64_t v60 = v6;
    v33 = "Bad stream type: %d";
    uint64_t v34 = 4294960591;
    goto LABEL_14;
  }
  v21 = kCryptoAEADDescriptorChaCha20Poly1305;
LABEL_11:
  v22 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))*v21;
  v23 = objc_alloc_init(CUPairingStream);
  [(CUPairingStream *)v23 setAuthTagLength:16];
  [(CUPairingStream *)v23 setName:v12];
  unsigned int v30 = self->_sessionType - 1;
  if (v30 > 0xC)
  {
    v32 = "ClientEncrypt-%@";
    v31 = "ServerEncrypt-%@";
  }
  else
  {
    v31 = off_1E55BE7F8[v30];
    v32 = off_1E55BE860[v30];
  }
  ASPrintF((void **)&v62, (uint64_t)v31, v24, v25, v26, v27, v28, v29, (uint64_t)v12);
  v47 = v62;
  if (!v62)
  {
    v59 = "CreateEncryptInfoFailed";
LABEL_44:
    uint64_t v51 = 4294960568;
    goto LABEL_50;
  }
  uint64_t v48 = [(CUPairingSession *)self deriveKeyWithSaltPtr:"" saltLen:0 infoPtr:v62 infoLen:strlen(v62) keyLen:32 outputKeyPtr:__s];
  unsigned int v63 = v48;
  free(v47);
  v62 = 0;
  if (v48)
  {
    v59 = "DeriveEncryptKeyFailed";
    uint64_t v51 = v48;
LABEL_50:
    NSErrorWithOSStatusF(v51, (uint64_t)v59, v41, v42, v43, v44, v45, v46, v61);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    if (!v35) {
      goto LABEL_33;
    }
    v40 = self->_ucat;
    if (v40->var0 <= 60)
    {
      if (v40->var0 != -1)
      {
LABEL_19:
        LogPrintF((uint64_t)v40, (uint64_t)"-[CUPairingSession openStreamWithName:type:error:]", 0x3Cu, (uint64_t)"### Open stream '%@' failed: %{error}\n", v36, v37, v38, v39, (uint64_t)v12);
        goto LABEL_31;
      }
      if (_LogCategory_Initialize((uint64_t)v40, 0x3Cu))
      {
        v40 = self->_ucat;
        goto LABEL_19;
      }
    }
LABEL_31:
    if (a5)
    {
      id v35 = v35;
      v56 = 0;
      *a5 = v35;
      goto LABEL_34;
    }
LABEL_33:
    v56 = 0;
    goto LABEL_34;
  }
  v49 = (CryptoAEADPrivate *)CryptoAEADCreate(v22, 1, (uint64_t)__s, 32, (int *)&v63);
  v23->_encryptAEAD = v49;
  if (!v49)
  {
    if (v63) {
      uint64_t v51 = v63;
    }
    else {
      uint64_t v51 = 4294960596;
    }
    v59 = "CreateEncryptAEADFailed";
    goto LABEL_50;
  }
  ASPrintF((void **)&v62, (uint64_t)v32, v41, v42, v43, v44, v45, v46, (uint64_t)v12);
  v50 = v62;
  if (!v62)
  {
    v59 = "CreateDecryptInfoFailed";
    goto LABEL_44;
  }
  unsigned int v63 = [(CUPairingSession *)self deriveKeyWithSaltPtr:"" saltLen:0 infoPtr:v62 infoLen:strlen(v62) keyLen:32 outputKeyPtr:__s];
  free(v50);
  v62 = 0;
  uint64_t v51 = v63;
  if (v63)
  {
    v59 = "DeriveDecryptKeyFailed";
    goto LABEL_50;
  }
  v52 = (CryptoAEADPrivate *)CryptoAEADCreate(v22, 2, (uint64_t)__s, 32, (int *)&v63);
  v23->_decryptAEAD = v52;
  if (!v52)
  {
    if (v63) {
      uint64_t v51 = v63;
    }
    else {
      uint64_t v51 = 4294960596;
    }
    v59 = "CreateDecryptAEADFailed";
    goto LABEL_50;
  }
  pairingStreams = self->_pairingStreams;
  if (!pairingStreams)
  {
    v54 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v55 = self->_pairingStreams;
    self->_pairingStreams = v54;

    pairingStreams = self->_pairingStreams;
  }
  [(NSMutableDictionary *)pairingStreams setObject:v23 forKeyedSubscript:v12];
  v56 = v23;
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  id v35 = 0;
  v23 = v56;
LABEL_34:
  v57 = v56;

  return v57;
}

- (id)openStreamWithName:(id)a3 error:(id *)a4
{
  return [(CUPairingSession *)self openStreamWithName:a3 type:1 error:a4];
}

- (void)_tryPIN:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _tryPIN:]", 0x1Eu, (uint64_t)"Try PIN\n", v4, v5, v6, v7, v27);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      uint64_t ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    uint64_t v16 = self->_ucat;
    if (v16->var0 <= 90)
    {
      if (v16->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v16, 0x5Au)) {
          goto LABEL_17;
        }
        uint64_t v16 = self->_ucat;
      }
      LogPrintF((uint64_t)v16, (uint64_t)"-[CUPairingSession _tryPIN:]", 0x5Au, (uint64_t)"Try PIN without activate\n", v4, v5, v6, v7, v27);
    }
LABEL_17:
    LODWORD(v17) = -6745;
    goto LABEL_18;
  }
  uint64_t v11 = ReplaceString((void **)pairingSession + 48, (size_t *)pairingSession + 49, (char *)[v8 UTF8String], 0xFFFFFFFFFFFFFFFFLL);
  if (!v11)
  {
    [(CUPairingSession *)self _receivedData:0 flags:0];
    goto LABEL_8;
  }
  uint64_t v17 = v11;
  uint64_t v18 = self->_ucat;
  if (v18->var0 <= 90)
  {
    if (v18->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v18, 0x5Au)) {
        goto LABEL_18;
      }
      uint64_t v18 = self->_ucat;
    }
    LogPrintF((uint64_t)v18, (uint64_t)"-[CUPairingSession _tryPIN:]", 0x5Au, (uint64_t)"### Set PIN failed: %#m\n", v12, v13, v14, v15, v17);
  }
LABEL_18:
  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28760];
  uint64_t v21 = (int)v17;
  uint64_t v28 = *MEMORY[0x1E4F28568];
  uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v17, 0, 0));
  v23 = (void *)v22;
  uint64_t v24 = @"?";
  if (v22) {
    uint64_t v24 = (__CFString *)v22;
  }
  v29[0] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  uint64_t v26 = [v19 errorWithDomain:v20 code:v21 userInfo:v25];
  [(CUPairingSession *)self _completed:v26];

LABEL_8:
}

- (void)tryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__CUPairingSession_tryPIN___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __27__CUPairingSession_tryPIN___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryPIN:*(void *)(a1 + 40)];
}

- (void)_receivedData:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v67[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v11 = v6;
  size_t v63 = 0;
  v64 = 0;
  char v62 = 0;
  pairingSession = self->_pairingSession;
  if (!pairingSession)
  {
    unsigned int v65 = -6745;
    uint64_t ucat = self->_ucat;
    if (ucat->var0 > 90) {
      goto LABEL_27;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        goto LABEL_27;
      }
      uint64_t ucat = self->_ucat;
    }
    uint64_t v51 = "### Use before activate\n";
    unsigned int v52 = 90;
    goto LABEL_52;
  }
  id v13 = v6;
  uint64_t v14 = (unsigned __int8 *)[v13 bytes];
  CFIndex v15 = [v13 length];
  uint64_t v18 = PairingSessionExchange((uint64_t)pairingSession, v14, v15, (char **)&v64, &v63, (uint64_t)&v62, v16, v17);
  unsigned int v65 = v18;
  if (v18)
  {
    uint64_t v49 = v18;
    if (v18 == -6771)
    {
      unsigned int v65 = 0;
      uint64_t ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_27;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_27;
        }
        uint64_t ucat = self->_ucat;
      }
      uint64_t v51 = "Waiting for user input\n";
    }
    else
    {
      uint64_t ucat = self->_ucat;
      if (ucat->var0 > 30) {
        goto LABEL_27;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_27;
        }
        uint64_t ucat = self->_ucat;
      }
      uint64_t v61 = v49;
      uint64_t v51 = "### Pairing failed: %#m\n";
    }
    unsigned int v52 = 30;
LABEL_52:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _receivedData:flags:]", v52, (uint64_t)v51, v7, v8, v9, v10, v61);
    goto LABEL_27;
  }
  uint64_t v19 = v64;
  if (!v64)
  {
    if (!v62) {
      goto LABEL_29;
    }
LABEL_26:
    [(CUPairingSession *)self _completed:0];
    goto LABEL_27;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v21 = (void *)[v20 initWithBytesNoCopy:v19 length:v63 freeWhenDone:1];
  v64 = 0;
  if (!self->_sendMessageDataHandler)
  {
    sendDataHandler = (void (**)(id, void, void *))self->_sendDataHandler;
    if (sendDataHandler) {
      sendDataHandler[2](sendDataHandler, v4, v21);
    }
LABEL_25:

    if (!v62) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  uint64_t v22 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(__CFString *)v22 setObject:v21 forKeyedSubscript:@"_pd"];
  if (v4)
  {
    v23 = self->_languageCode;
    if (v23)
    {
LABEL_7:
      [(__CFString *)v22 setObject:v23 forKeyedSubscript:@"_lc"];
      goto LABEL_8;
    }
    if (self->_localize)
    {
      v47 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      v23 = [v47 firstObject];

      if (v23) {
        goto LABEL_7;
      }
    }
    else
    {
      v23 = 0;
    }
LABEL_8:
    uint64_t v24 = self->_localeIdentifier;
    if (v24
      || self->_localize
      && ([MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale],
          uint64_t v48 = objc_claimAutoreleasedReturnValue(),
          [v48 localeIdentifier],
          uint64_t v24 = (NSString *)objc_claimAutoreleasedReturnValue(),
          v48,
          v24))
    {
      [(__CFString *)v22 setObject:v24 forKeyedSubscript:@"_li"];
    }
    if (self->_pinType)
    {
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [(__CFString *)v22 setObject:v25 forKeyedSubscript:@"_pt"];
    }
    if (self->_localize)
    {
      uint64_t v26 = NSNumber;
      uint64_t peerDeviceClass = self->_peerDeviceClass;
      if ((int)peerDeviceClass <= 0)
      {
        if (GestaltGetDeviceClass_sOnce != -1)
        {
          uint64_t v60 = NSNumber;
          dispatch_once(&GestaltGetDeviceClass_sOnce, &__block_literal_global_13498);
          uint64_t v26 = v60;
        }
        uint64_t peerDeviceClass = GestaltGetDeviceClass_deviceClass;
      }
      uint64_t v28 = [v26 numberWithInt:peerDeviceClass];
      [(__CFString *)v22 setObject:v28 forKeyedSubscript:@"_pdc"];
    }
  }
  CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable(v22, 0, (int *)&v65);
  if (DataMutable)
  {
    CFMutableDataRef v37 = DataMutable;
    (*((void (**)(void))self->_sendMessageDataHandler + 2))();

    goto LABEL_25;
  }
  if (v65) {
    uint64_t v53 = v65;
  }
  else {
    uint64_t v53 = 4294960596;
  }
  unsigned int v65 = v53;
  v54 = self->_ucat;
  if (v54->var0 > 30) {
    goto LABEL_66;
  }
  if (v54->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
      goto LABEL_66;
    }
    v54 = self->_ucat;
    uint64_t v53 = v65;
  }
  v55 = NSPrintF((uint64_t)"%#m", v30, v31, v32, v33, v34, v35, v36, v53);
  LogPrintF((uint64_t)v54, (uint64_t)"-[CUPairingSession _receivedData:flags:]", 0x1Eu, (uint64_t)"### Encode message failed: %@", v56, v57, v58, v59, (uint64_t)v55);

LABEL_66:
LABEL_27:
  if (v64) {
    free(v64);
  }
LABEL_29:
  uint64_t v39 = (int)v65;
  if (v65)
  {
    v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28760];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    uint64_t v42 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v65, 0, 0));
    uint64_t v43 = (void *)v42;
    uint64_t v44 = @"?";
    if (v42) {
      uint64_t v44 = (__CFString *)v42;
    }
    v67[0] = v44;
    uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
    uint64_t v46 = [v40 errorWithDomain:v41 code:v39 userInfo:v45];
    [(CUPairingSession *)self _completed:v46];
  }
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__CUPairingSession_receivedData___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __33__CUPairingSession_receivedData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receivedData:*(void *)(a1 + 40) flags:0];
}

- (void)receivedMessageData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CUPairingSession_receivedMessageData___block_invoke;
  v7[3] = &unk_1E55BF170;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __40__CUPairingSession_receivedMessageData___block_invoke(uint64_t a1)
{
  HIDWORD(v29) = -6700;
  uint64_t v7 = OPACKDecodeData(*(const __CFData **)(a1 + 32), 8u, (_DWORD *)&v29 + 1);
  if (!v7)
  {
    uint64_t v24 = *(void **)(a1 + 40);
    uint64_t v25 = (void *)*MEMORY[0x1E4F28760];
    if (HIDWORD(v29)) {
      uint64_t v26 = HIDWORD(v29);
    }
    else {
      uint64_t v26 = 4294960596;
    }
    uint64_t v27 = "Decode message failed";
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = *(void **)(a1 + 40);
    uint64_t v25 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v27 = "Not a dictionary";
    uint64_t v26 = 4294960540;
LABEL_23:
    uint64_t v14 = NSErrorF_safe(v25, v26, (uint64_t)v27, v2, v3, v4, v5, v6, v29);
    [v24 _completed:v14];
    goto LABEL_17;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t v14 = CFDictionaryGetTypedValue((const __CFDictionary *)v7, @"_pd", TypeID, 0);
  if (v14)
  {
    CFTypeID v15 = CFStringGetTypeID();
    uint64_t v16 = CFDictionaryGetTypedValue((const __CFDictionary *)v7, @"_lc", v15, 0);
    if (v16) {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 144), v16);
    }
    CFTypeID v17 = CFStringGetTypeID();
    uint64_t v18 = CFDictionaryGetTypedValue((const __CFDictionary *)v7, @"_li", v17, 0);
    if (v18) {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 152), v18);
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, @"_pt");
    if (Value)
    {
      int v30 = 0;
      int v20 = CFGetInt64(Value, &v30);
      if (v20)
      {
        *(_DWORD *)(*(void *)(a1 + 40) + 44) = v20;
        uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
        if (v21) {
          PairingSessionSetProperty(v21, @"setupCodeType", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
        }
      }
    }
    CFStringRef v22 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v7, @"_pdc");
    if (v22)
    {
      int v31 = 0;
      int v23 = CFGetInt64(v22, &v31);
      if (v23 >= 1) {
        *(_DWORD *)(*(void *)(a1 + 40) + 40) = v23;
      }
    }
    [*(id *)(a1 + 40) _receivedData:v14 flags:0];
  }
  else
  {
    uint64_t v28 = *(void **)(a1 + 40);
    uint64_t v16 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No pairing data", v9, v10, v11, v12, v13, v29);
    [v28 _completed:v16];
  }

LABEL_17:
}

- (void)_completed:(id)a3
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v18)
  {
    p_completionHandler = &self->_completionHandler;
    if (!self->_completionHandler) {
      goto LABEL_19;
    }
    uint64_t ucat = self->_ucat;
    if (ucat->var0 > 50) {
      goto LABEL_18;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x32u)) {
        goto LABEL_18;
      }
      uint64_t ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUPairingSession _completed:]", 0x32u, (uint64_t)"### Pairing failed: %{error}\n", v4, v5, v6, v7, (uint64_t)v18);
LABEL_18:
    (*((void (**)(void))*p_completionHandler + 2))();
    id v16 = *p_completionHandler;
    id *p_completionHandler = 0;

    goto LABEL_19;
  }
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    uint64_t v11 = (NSDictionary *)*((void *)pairingSession + 34);
    if (v11) {
      CFRetain(*((CFTypeRef *)pairingSession + 34));
    }
    aclActual = self->_aclActual;
    self->_aclActual = v11;

    uint64_t v13 = (NSDictionary *)PairingSessionCopyPeerInfo(self->_pairingSession, 0);
    peerInfo = self->_peerInfo;
    self->_peerInfo = v13;
  }
  p_completionHandler = &self->_completionHandler;
  if (self->_completionHandler)
  {
    CFTypeID v15 = self->_ucat;
    if (v15->var0 <= 30)
    {
      if (v15->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v15, 0x1Eu)) {
          goto LABEL_18;
        }
        CFTypeID v15 = self->_ucat;
      }
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUPairingSession _completed:]", 0x1Eu, (uint64_t)"Pairing completed\n", v4, v5, v6, v7, v17);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUPairingSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUPairingSession_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(int **)(v9 + 24);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUPairingSession invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v28);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v9 + 24);
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v12 = *(const void **)(v9 + 8);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
    uint64_t v9 = *(void *)(a1 + 32);
  }
  [*(id *)(v9 + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_6602];
  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v15 = *MEMORY[0x1E4F28760];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v16 = NSString;
  if (MEMORY[0x1E4F5E2B0] && (v17 = CUErrorCodesTableGet(), (id v18 = *(const char **)(v17 + 8)) != 0))
  {
    if (*(_DWORD *)v17 != -6723)
    {
      uint64_t v19 = (const char **)(v17 + 24);
      id v18 = "";
      while (1)
      {
        int v20 = *v19;
        if (!*v19) {
          break;
        }
        int v21 = *((_DWORD *)v19 - 2);
        v19 += 2;
        if (v21 == -6723)
        {
          id v18 = v20;
          break;
        }
      }
    }
  }
  else
  {
    id v18 = "";
  }
  uint64_t v22 = [v16 stringWithUTF8String:v18];
  int v23 = (void *)v22;
  uint64_t v24 = @"?";
  if (v22) {
    uint64_t v24 = (__CFString *)v22;
  }
  v30[0] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v26 = [v14 errorWithDomain:v15 code:-6723 userInfo:v25];
  [v13 _completed:v26];

  return [*(id *)(a1 + 32) _cleanup];
}

uint64_t __30__CUPairingSession_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _cleanup];
}

- (void)_activate
{
  v64[1] = *MEMORY[0x1E4F143B8];
  memset(v62, 0, sizeof(v62));
  uint64_t ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_9;
      }
      uint64_t ucat = self->_ucat;
    }
    uint64_t sessionType = self->_sessionType;
    if (sessionType > 0xE) {
      uint64_t v9 = "?";
    }
    else {
      uint64_t v9 = off_1E55BF938[sessionType];
    }
    uint64_t v10 = CUPrintFlags(self->_flags, byte_18E418851, 1);
    [(NSString *)self->_fixedPIN length];
    LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUPairingSession _activate]", 0x1Eu, (uint64_t)"Activate: sessionType=%s, flags=%@, pinType=%s, fixedPIN=%s", v11, v12, v13, v14, (uint64_t)v9);
  }
LABEL_9:
  if (!self->_completionHandler)
  {
    uint64_t v44 = self->_ucat;
    if (v44->var0 <= 90)
    {
      if (v44->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v44, 0x5Au)) {
          goto LABEL_86;
        }
        uint64_t v44 = self->_ucat;
      }
      uint64_t v45 = "### No completionHandler\n";
      goto LABEL_76;
    }
LABEL_86:
    LODWORD(v46) = -6745;
    goto LABEL_87;
  }
  if (!self->_sendDataHandler && !self->_sendMessageDataHandler)
  {
    uint64_t v44 = self->_ucat;
    if (v44->var0 <= 90)
    {
      if (v44->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v44, 0x5Au)) {
          goto LABEL_86;
        }
        uint64_t v44 = self->_ucat;
      }
      uint64_t v45 = "### No sendDataHandler\n";
LABEL_76:
      LogPrintF((uint64_t)v44, (uint64_t)"-[CUPairingSession _activate]", 0x5Au, (uint64_t)v45, v2, v3, v4, v5, v59);
      goto LABEL_86;
    }
    goto LABEL_86;
  }
  memset(&v62[8], 0, 64);
  *(void *)char v62 = self;
  if (self->_promptForPINHandler) {
    *(void *)&v62[24] = _promptForPIN;
  }
  if ((self->_flags & 0x80) != 0)
  {
    *(void *)&v62[8] = _showPIN;
LABEL_21:
    *(void *)&v62[16] = _hidePIN;
    goto LABEL_22;
  }
  if (self->_showPINHandler || self->_showPINHandlerEx) {
    *(void *)&v62[8] = _showPIN;
  }
  if (self->_hidePINHandler) {
    goto LABEL_21;
  }
LABEL_22:
  p_pairingSession = (uint64_t *)&self->_pairingSession;
  int v16 = PairingSessionCreate((uint64_t *)&self->_pairingSession, (uint64_t)v62, self->_sessionType);
  if (v16)
  {
    LODWORD(v46) = v16;
    v47 = self->_ucat;
    if (v47->var0 <= 90)
    {
      if (v47->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v47, 0x5Au)) {
          goto LABEL_87;
        }
        v47 = self->_ucat;
      }
      uint64_t v48 = self->_sessionType;
      if (v48 > 0xE) {
        uint64_t v49 = "?";
      }
      else {
        uint64_t v49 = off_1E55BF938[v48];
      }
      LogPrintF((uint64_t)v47, (uint64_t)"-[CUPairingSession _activate]", 0x5Au, (uint64_t)"### Create pairing session type %s failed: %#m\n", v17, v18, v19, v20, (uint64_t)v49);
    }
  }
  else
  {
    int is_recovery = os_variant_is_recovery();
    pairingSession = self->_pairingSession;
    unsigned int flags = self->_flags;
    if (!is_recovery) {
      flags |= 4u;
    }
    *((_DWORD *)pairingSession + 25) = flags;
    *((void *)pairingSession + 2) = self->_ucat;
    if ([(NSDictionary *)self->_acl count]) {
      PairingSessionSetACL((uint64_t)self->_pairingSession, self->_acl);
    }
    if (![(NSString *)self->_fixedPIN length]
      || (uint64_t v24 = ReplaceString((void **)self->_pairingSession + 48, (size_t *)self->_pairingSession + 49, (char *)[(NSString *)self->_fixedPIN UTF8String], 0xFFFFFFFFFFFFFFFFLL), !v24))
    {
      additionalPeerInfo = self->_additionalPeerInfo;
      if (additionalPeerInfo) {
        PairingSessionSetAdditionalPeerInfo(*p_pairingSession, additionalPeerInfo);
      }
      additionalSelfInfo = self->_additionalSelfInfo;
      if (additionalSelfInfo) {
        PairingSessionSetAdditionalSelfInfo(*p_pairingSession, additionalSelfInfo);
      }
      int v31 = self->_allowedMACAddresses;
      if (v31) {
        PairingSessionSetProperty(*p_pairingSession, @"allowedMACAddresses", v31);
      }

      uint64_t v32 = self->_appInfoSelf;
      if (v32) {
        PairingSessionSetProperty(*p_pairingSession, @"appInfoSelf", v32);
      }

      uint64_t v33 = self->_groupInfoSelf;
      if (v33) {
        PairingSessionSetProperty(*p_pairingSession, @"groupInfoSelf", v33);
      }

      if (self->_pinType) {
        PairingSessionSetProperty(*p_pairingSession, @"setupCodeType", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
      }
      myAppleID = self->_myAppleID;
      if (myAppleID) {
        PairingSessionSetMyAppleID(*p_pairingSession, myAppleID);
      }
      myAppleIDInfoClient = self->_myAppleIDInfoClient;
      if (myAppleIDInfoClient) {
        PairingSessionSetMyAppleIDInfoClient(*p_pairingSession, myAppleIDInfoClient);
      }
      peerAppleID = self->_peerAppleID;
      if (peerAppleID) {
        PairingSessionSetPeerAppleID(*p_pairingSession, peerAppleID);
      }
      selfAppFlags = self->_selfAppFlags;
      if (selfAppFlags) {
        *(void *)(*p_pairingSession + 208) = selfAppFlags;
      }
      if (self->_signDataHandler)
      {
        uint64_t v38 = self->_pairingSession;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __29__CUPairingSession__activate__block_invoke;
        v61[3] = &unk_1E55BE770;
        v61[4] = self;
        PairingSessionSetSignBytesHandler_b((uint64_t)v38, v61);
      }
      if (self->_verifySignatureHandler)
      {
        uint64_t v39 = self->_pairingSession;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __29__CUPairingSession__activate__block_invoke_2;
        v60[3] = &unk_1E55BE770;
        v60[4] = self;
        PairingSessionSetVerifySignatureHandler_b((uint64_t)v39, v60);
      }
      v40 = _Block_copy(self->_copyIdentityHandler);
      if (v40) {
        PairingSessionSetCopyIdentityHandler_b(*p_pairingSession, v40);
      }

      uint64_t v41 = _Block_copy(self->_findPeerHandler);
      if (v41) {
        PairingSessionSetFindPeerHandler_b(*p_pairingSession, v41);
      }

      uint64_t v42 = _Block_copy(self->_savePeerHandler);
      if (v42) {
        PairingSessionSetSavePeerHandler_b(*p_pairingSession, v42);
      }

      unsigned int v43 = self->_sessionType;
      if (v43 <= 0xD && ((1 << v43) & 0x2A2A) != 0) {
        [(CUPairingSession *)self _receivedData:0 flags:1];
      }
      return;
    }
    uint64_t v46 = v24;
    v50 = self->_ucat;
    if (v50->var0 <= 90)
    {
      if (v50->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v50, 0x5Au)) {
          goto LABEL_87;
        }
        v50 = self->_ucat;
      }
      LogPrintF((uint64_t)v50, (uint64_t)"-[CUPairingSession _activate]", 0x5Au, (uint64_t)"### Set fixed PIN failed: %#m\n", v25, v26, v27, v28, v46);
    }
  }
LABEL_87:
  uint64_t v51 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v52 = *MEMORY[0x1E4F28760];
  uint64_t v53 = (int)v46;
  uint64_t v63 = *MEMORY[0x1E4F28568];
  uint64_t v54 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v46, 0, 0));
  v55 = (void *)v54;
  uint64_t v56 = @"?";
  if (v54) {
    uint64_t v56 = (__CFString *)v54;
  }
  v64[0] = v56;
  uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
  uint64_t v58 = [v51 errorWithDomain:v52 code:v53 userInfo:v57];
  [(CUPairingSession *)self _completed:v58];
}

uint64_t __29__CUPairingSession__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v9 = (void (**)(void *, void, void *, id *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 280));
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
    id v20 = 0;
    uint64_t v11 = v9[2](v9, a2, v10, &v20);
    id v12 = v20;
    uint64_t v13 = v12;
    if (v11)
    {
      if ([v11 length] == 64)
      {
        uint64_t v14 = (long long *)[v11 bytes];
        uint64_t v15 = 0;
        long long v16 = v14[3];
        long long v18 = *v14;
        long long v17 = v14[1];
        a5[2] = v14[2];
        a5[3] = v16;
        *a5 = v18;
        a5[1] = v17;
      }
      else
      {
        uint64_t v15 = 4294960553;
      }
    }
    else if (v12)
    {
      uint64_t v15 = NSErrorToOSStatusEx(v12, 0);
    }
    else
    {
      uint64_t v15 = 4294960596;
    }
  }
  else
  {
    uint64_t v15 = 4294960573;
  }

  return v15;
}

uint64_t __29__CUPairingSession__activate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (uint64_t (**)(void *, void, void *, void *, id *))_Block_copy(*(const void **)(*(void *)(a1 + 32)
                                                                                                 + 288));
  if (v9)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a5 length:64];
    id v17 = 0;
    char v12 = v9[2](v9, a2, v10, v11, &v17);
    id v13 = v17;
    uint64_t v14 = v13;
    if (v12)
    {
      uint64_t v15 = 0;
    }
    else if (v13)
    {
      uint64_t v15 = NSErrorToOSStatusEx(v13, 0);
    }
    else
    {
      uint64_t v15 = 4294960596;
    }
  }
  else
  {
    uint64_t v15 = 4294960573;
  }

  return v15;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUPairingSession_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__CUPairingSession_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (NSDictionary)groupInfoPeer
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    uint64_t v3 = (void *)PairingSessionCopyProperty((uint64_t)pairingSession, @"groupInfoPeer", 0);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (NSDictionary)appInfoPeer
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    uint64_t v3 = (void *)PairingSessionCopyProperty((uint64_t)pairingSession, @"appInfoPeer", 0);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (void)setSelfAppFlags:(unint64_t)a3
{
  self->_selfAppFlags = a3;
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    *((void *)pairingSession + 26) = a3;
  }
}

- (unint64_t)peerAppFlags
{
  pairingSession = self->_pairingSession;
  if (pairingSession) {
    return *((void *)pairingSession + 25);
  }
  else {
    return 0;
  }
}

- (CUPairedPeer)pairedPeer
{
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    uint64_t v3 = (void *)*((void *)pairingSession + 33);
    if (v3) {
      id v4 = v3;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (CUPairedPeer *)v3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_uint64_t ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CBD08;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id promptForPINHandler = self->_promptForPINHandler;
  self->_id promptForPINHandler = 0;

  id showPINHandler = self->_showPINHandler;
  self->_id showPINHandler = 0;

  id showPINHandlerEx = self->_showPINHandlerEx;
  self->_id showPINHandlerEx = 0;

  id hidePINHandler = self->_hidePINHandler;
  self->_id hidePINHandler = 0;

  id sendDataHandler = self->_sendDataHandler;
  self->_id sendDataHandler = 0;

  id sendMessageDataHandler = self->_sendMessageDataHandler;
  self->_id sendMessageDataHandler = 0;

  id signDataHandler = self->_signDataHandler;
  self->_id signDataHandler = 0;

  id verifySignatureHandler = self->_verifySignatureHandler;
  self->_id verifySignatureHandler = 0;

  id copyIdentityHandler = self->_copyIdentityHandler;
  self->_id copyIdentityHandler = 0;

  id findPeerHandler = self->_findPeerHandler;
  self->_id findPeerHandler = 0;

  id savePeerHandler = self->_savePeerHandler;
  self->_id savePeerHandler = 0;

  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    self->_pairingSession = 0;
  }
}

- (void)dealloc
{
  uint64_t ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_uint64_t ucat = 0;
  }
  [(CUPairingSession *)self _cleanup];
  v4.receiver = self;
  v4.super_class = (Class)CUPairingSession;
  [(CUPairingSession *)&v4 dealloc];
}

- (CUPairingSession)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUPairingSession;
  uint64_t v2 = [(CUPairingSession *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_uint64_t ucat = (LogCategory *)&gLogCategory_CUPairingSession;
  }
  return v2;
}

@end