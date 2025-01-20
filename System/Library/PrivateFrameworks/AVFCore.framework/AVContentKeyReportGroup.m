@interface AVContentKeyReportGroup
- (AVContentKeyReportGroup)initWithKeySystem:(id)a3 keySession:(id)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 useContentKeyBoss:(BOOL)a6 groupID:(unint64_t)a7 storageDirectoryAtURL:(id)a8;
- (BOOL)_associateRequestWithGroupWithRequestID:(unint64_t)a3 error:(id *)a4;
- (BOOL)_destroyContentKeyGroupWithError:(id *)a3;
- (BOOL)_setAuthorizationToken:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)associateContentKeyRequest:(id)a3;
- (BOOL)hasProtector;
- (NSData)contentProtectionSessionIdentifier;
- (OpaqueFigCPECryptor)copyCryptorForCryptKeyAttributes:(id)a3;
- (OpaqueFigCPECryptor)copyCryptorForIdentifier:(id)a3 initializationData:(id)a4;
- (OpaqueFigCPECryptor)createCryptorIfNecessaryForIdentifier:(id)a3 initializationData:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 hlsMethod:(id)a6 error:(id *)a7;
- (OpaqueFigContentKeyBoss)_contentKeyBoss;
- (OpaqueFigContentKeySession)_figContentKeySession;
- (id)_contentKeySession;
- (id)_processContentKeyRequestWithIdentifier:(id)a3 contentIdentifier:(id)a4 keyIDFromInitializationData:(id)a5 initializationData:(id)a6 options:(id)a7;
- (id)_processContentKeyRequestWithKeyRequestFromPSSH:(id)a3 decryptFormatType:(id)a4 initializationData:(id)a5 options:(id)a6;
- (id)cryptorOptionsForIdentifier:(id)a3 initializationData:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 hlsMethod:(id)a6;
- (int)configureAppIdentifier:(id)a3;
- (int)externalProtectionStatusForCryptor:(OpaqueFigCPECryptor *)a3 withDisplays:(id)a4;
- (void)createProtectorSessionIdentifierIfNecessary;
- (void)dealloc;
- (void)expire;
- (void)failProcessingContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 error:(id)a5;
- (void)processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5;
@end

@implementation AVContentKeyReportGroup

- (void)dealloc
{
  figContentKeySession = self->_figContentKeySession;
  if (figContentKeySession) {
    CFRelease(figContentKeySession);
  }

  weakContentKeyBoss = self->_weakContentKeyBoss;
  if (weakContentKeyBoss) {
    CFRelease(weakContentKeyBoss);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVContentKeyReportGroup;
  [(AVContentKeyReportGroup *)&v5 dealloc];
}

- (AVContentKeyReportGroup)initWithKeySystem:(id)a3 keySession:(id)a4 contentKeyBoss:(OpaqueFigContentKeyBoss *)a5 useContentKeyBoss:(BOOL)a6 groupID:(unint64_t)a7 storageDirectoryAtURL:(id)a8
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)AVContentKeyReportGroup;
  v13 = [(AVContentKeyReportGroup *)&v19 init];
  if (v13)
  {
    v13->_contentKeySessionWeakReference = [[AVWeakReference alloc] initWithReferencedObject:a4];
    v13->_cryptorsList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avcontentkeyreportgroup", v14);
    v13->_keySystem = (NSString *)a3;
    v13->_weakContentKeyBoss = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v13->_useContentKeyBoss = a6;
    if (a8)
    {
      uint64_t v20 = *MEMORY[0x1E4F1FC00];
      v21[0] = a8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    }
    v13->_groupID = a7;
    int Session = FigContentKeySessionRemoteCreateSession();
    if (Session) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = dword_1E9356A90 == 0;
    }
    if (v16)
    {
      if (Session)
      {

        return 0;
      }
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v13;
}

- (OpaqueFigContentKeyBoss)_contentKeyBoss
{
  result = (OpaqueFigContentKeyBoss *)self->_weakContentKeyBoss;
  if (result) {
    return (OpaqueFigContentKeyBoss *)MEMORY[0x1F40DCCA0](result, a2);
  }
  return result;
}

- (id)_contentKeySession
{
  return [(AVWeakReference *)self->_contentKeySessionWeakReference referencedObject];
}

- (id)cryptorOptionsForIdentifier:(id)a3 initializationData:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 hlsMethod:(id)a6
{
  unint64_t v21 = 0;
  uint64_t v22 = 0;
  id v19 = 0;
  uint64_t v20 = 0;
  v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  CFTypeRef cf = 0;
  if (a4)
  {
    avcks_decodeInitializationDataAndCopyInformation((uint64_t)a4, &v22, (uint64_t *)&v21, &v20, (uint64_t *)&v19, 0);
    if (v22) {
      [v11 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F1FC40]];
    }
    if ([v19 isEqual:@"mpts"])
    {
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
      [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F1FC18]];
    }
  }
  if (a3) {
    [v11 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F1FC10]];
  }
  if ([(NSString *)self->_keySystem isEqualToString:@"FairPlayStreaming"])
  {
    v13 = (void *)MEMORY[0x1E4F32720];
  }
  else
  {
    if (![(NSString *)self->_keySystem isEqualToString:@"ClearKeySystem"]) {
      goto LABEL_13;
    }
    v13 = (void *)MEMORY[0x1E4F32710];
  }
  [v11 setObject:*v13 forKeyedSubscript:*MEMORY[0x1E4F1FC38]];
LABEL_13:
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:1];
  [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F1FC08]];
  if ([a6 isEqual:@"ISO_23001_7"])
  {
    p_CFTypeRef cf = (CFTypeRef *)MEMORY[0x1E4F32728];
LABEL_15:
    [v11 setObject:*p_cf forKeyedSubscript:*MEMORY[0x1E4F1FC28]];
    goto LABEL_16;
  }
  char v17 = [a6 isEqual:@"SAMPLE-AES"];
  p_CFTypeRef cf = (CFTypeRef *)MEMORY[0x1E4F32730];
  if (!((unint64_t)a4 | (unint64_t)a5) || (v17 & 1) != 0) {
    goto LABEL_15;
  }
  if (!v22 && (unint64_t)a5 | v21)
  {
    if (v21) {
      [(id)v21 integerValue];
    }
    else {
      CMFormatDescriptionGetMediaSubType(a5);
    }
    p_CFTypeRef cf = &cf;
    if (!PKDCopyDecryptFormatTypeFromCodecType()) {
      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
  return v11;
}

- (void)failProcessingContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 error:(id)a5
{
  LOBYTE(v7) = 0;
  v6 = [[AVContentKeyRequest alloc] initWithContentKeySession:[(AVContentKeyReportGroup *)self _contentKeySession] reportGroup:self identifier:a3 contentIdentifier:0 keyIDFromInitializationData:0 initializationData:a4 preloadingRequestOptions:0 providesPersistableKey:v7];
  [(AVContentKeyRequest *)v6 _setError:a5];
}

- (id)_processContentKeyRequestWithIdentifier:(id)a3 contentIdentifier:(id)a4 keyIDFromInitializationData:(id)a5 initializationData:(id)a6 options:(id)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  if (!((unint64_t)a3 | (unint64_t)a6))
  {
    unint64_t v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"identifier or initializationData must be valid", (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v7, v22), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  if (self->_isExpired)
  {
    uint64_t v25 = *MEMORY[0x1E4F1D138];
    v26[0] = @"An expired content key session cannot process content key request";
    -[AVContentKeyReportGroup failProcessingContentKeyRequestWithIdentifier:initializationData:error:](self, "failProcessingContentKeyRequestWithIdentifier:initializationData:error:", a3, a6, AVLocalizedError(@"AVFoundationErrorDomain", -11862, (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1]));
    return 0;
  }
  else
  {
    v15 = [(AVContentKeyReportGroup *)self copyCryptorForIdentifier:a3 initializationData:a6];
    if (v15
      && ((uint64_t v16 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0 ? (v17 = 0) : (v17 = v16),
          (v18 = *(unsigned int (**)(OpaqueFigCPECryptor *, void, void, id *))(v17 + 48)) == 0
       || v18(v15, *MEMORY[0x1E4F1FDC8], *MEMORY[0x1E4F1CF80], &v24)
       || (int v19 = [v24 intValue], v24, v19 != 1)))
    {
      v11 = 0;
    }
    else
    {
      LOBYTE(v23) = 0;
      v11 = [[AVContentKeyRequest alloc] initWithContentKeySession:[(AVContentKeyReportGroup *)self _contentKeySession] reportGroup:self identifier:a3 contentIdentifier:a4 keyIDFromInitializationData:a5 initializationData:a6 preloadingRequestOptions:a7 providesPersistableKey:v23];
      if (!v15) {
        return v11;
      }
    }
    CFRelease(v15);
  }
  return v11;
}

- (id)_processContentKeyRequestWithKeyRequestFromPSSH:(id)a3 decryptFormatType:(id)a4 initializationData:(id)a5 options:(id)a6
{
  v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F33238]), @"ProtocolVersionsKey");
  if ([a4 isEqualToString:*MEMORY[0x1E4F32728]]) {
    uint64_t v12 = @"ISO_23001_7";
  }
  else {
    uint64_t v12 = @"SAMPLE-AES";
  }
  [v11 setObject:v12 forKeyedSubscript:@"HLSMethodKey"];
  uint64_t v13 = *MEMORY[0x1E4F33230];
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F33230]), "base64EncodedStringWithOptions:", 0);
  uint64_t v15 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F33228]];
  uint64_t v16 = [a3 objectForKeyedSubscript:v13];
  id v17 = +[AVContentKeyRequest _mergePreloadingRequestOptions:a6 withCreateKeyRequestOptions:v11];
  return [(AVContentKeyReportGroup *)self _processContentKeyRequestWithIdentifier:v14 contentIdentifier:v15 keyIDFromInitializationData:v16 initializationData:a5 options:v17];
}

- (void)processContentKeyRequestWithIdentifier:(id)a3 initializationData:(id)a4 options:(id)a5
{
  v31[42] = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  v31[0] = 0;
  uint64_t v29 = 0;
  v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v11 = [(AVContentKeyReportGroup *)self _contentKeySession];
  if (!v11)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    uint64_t v25 = @"AVContentKeySession is nil";
    goto LABEL_22;
  }
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    uint64_t v25 = @"identifier or initializationData must be valid";
LABEL_22:
    v26 = objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v25, v12, v13, v14, v15, v16, v27), 0);
    objc_exception_throw(v26);
  }
  id v17 = v11;
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_useContentKeyBoss)
  {
    [v17 _processContentKeyRequestWithIdentifier:a3 initializationData:a4 options:a5 groupID:self->_groupID];
    int v19 = 0;
    goto LABEL_7;
  }
  if (!a4) {
    goto LABEL_13;
  }
  avcks_decodeInitializationDataAndCopyInformation((uint64_t)a4, &v29, 0, 0, 0, v31);
  if (v31[0])
  {
    signed int v20 = FigPKDParsePSSHAndCopyContentKeyInfo();
    if (v20)
    {
      int v19 = 0;
LABEL_17:
      uint64_t v22 = AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v20, 0, 0, 1);
      if (v22) {
        [(AVContentKeyReportGroup *)self failProcessingContentKeyRequestWithIdentifier:a3 initializationData:a4 error:v22];
      }
      goto LABEL_7;
    }
  }
  if (v29)
  {
    signed int v28 = PKDCopyDefaultKeyIDFromSinfArray();
    int v19 = (void *)[v30 copy];
  }
  else
  {
LABEL_13:
    int v19 = 0;
    signed int v28 = 0;
  }
  id v21 = [(AVContentKeyReportGroup *)self _processContentKeyRequestWithIdentifier:a3 contentIdentifier:v19 keyIDFromInitializationData:v30 initializationData:a4 options:a5];
  if (v21) {
    [v10 addObject:v21];
  }
  objc_msgSend(v17, "issueContentKeyRequests:forInitializationData:", v10, a4, v27);
  signed int v20 = v28;
  if (v28) {
    goto LABEL_17;
  }
LABEL_7:
}

- (BOOL)_associateRequestWithGroupWithRequestID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = [(AVContentKeyReportGroup *)self _contentKeyBoss];
  if (!v7)
  {
    signed int v13 = FigSignalErrorAt();
    if (!a4) {
      return v13 == 0;
    }
    goto LABEL_9;
  }
  v8 = v7;
  unint64_t groupID = self->_groupID;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t, unint64_t))(v11 + 80);
  if (v12) {
    signed int v13 = v12(v8, a3, groupID);
  }
  else {
    signed int v13 = -12782;
  }
  CFRelease(v8);
  if (a4)
  {
LABEL_9:
    if (v13) {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v13, 0);
    }
  }
  return v13 == 0;
}

- (BOOL)associateContentKeyRequest:(id)a3
{
  if (dword_1E9356A90)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_useContentKeyBoss) {
    return -[AVContentKeyReportGroup _associateRequestWithGroupWithRequestID:error:](self, "_associateRequestWithGroupWithRequestID:error:", [a3 _requestID], 0);
  }
  else {
    return [a3 setReportGroup:self];
  }
}

- (BOOL)_destroyContentKeyGroupWithError:(id *)a3
{
  objc_super v5 = [(AVContentKeyReportGroup *)self _contentKeyBoss];
  if (!v5)
  {
    signed int v11 = FigSignalErrorAt();
    if (!a3) {
      return v11 == 0;
    }
    goto LABEL_9;
  }
  v6 = v5;
  unint64_t groupID = self->_groupID;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(OpaqueFigContentKeyBoss *, unint64_t))(v9 + 72);
  if (v10) {
    signed int v11 = v10(v6, groupID);
  }
  else {
    signed int v11 = -12782;
  }
  CFRelease(v6);
  if (a3)
  {
LABEL_9:
    if (v11) {
      *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v11, 0);
    }
  }
  return v11 == 0;
}

- (void)expire
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1E9356A90)
  {
    int v7 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AVContentKeyReportGroup_expire__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __33__AVContentKeyReportGroup_expire__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 64))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 64) = 1;
    uint64_t v3 = *(void *)(result + 32);
    if (*(unsigned char *)(v3 + 80))
    {
      return [(id)v3 _destroyContentKeyGroupWithError:0];
    }
    else
    {
      uint64_t v4 = *(void *)(v3 + 16);
      if (v4)
      {
        uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v6 = v5 ? v5 : 0;
        int v7 = *(void (**)(uint64_t))(v6 + 24);
        if (v7) {
          v7(v4);
        }
      }
      uint64_t v8 = *(void **)(*(void *)(v2 + 32) + 32);
      return [v8 removeAllObjects];
    }
  }
  return result;
}

- (NSData)contentProtectionSessionIdentifier
{
  uint64_t v2 = (void *)[(NSData *)self->_protectorSessionIdentifier copy];
  return (NSData *)v2;
}

- (OpaqueFigCPECryptor)createCryptorIfNecessaryForIdentifier:(id)a3 initializationData:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 hlsMethod:(id)a6 error:(id *)a7
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v19 = 0;
  signed int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (![(NSString *)self->_keySystem isEqualToString:@"AuthorizationTokenSystem"])
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __152__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__createCryptorIfNecessaryForIdentifier_initializationData_formatDescription_hlsMethod_error___block_invoke;
    block[3] = &unk_1E57B7950;
    block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    block[7] = a6;
    block[8] = &v23;
    block[9] = &v19;
    block[10] = a5;
    dispatch_sync(serialQueue, block);
    signed int v14 = *((_DWORD *)v24 + 6);
    if (v14)
    {
      if (a7) {
        *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
      }
      uint64_t v15 = (const void *)v20[3];
      if (v15)
      {
        CFRelease(v15);
        v20[3] = 0;
      }
    }
  }
  uint64_t v16 = (OpaqueFigCPECryptor *)v20[3];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v16;
}

uint64_t __152__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__createCryptorIfNecessaryForIdentifier_initializationData_formatDescription_hlsMethod_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cryptorOptionsForIdentifier:*(void *)(a1 + 40) initializationData:*(void *)(a1 + 48) formatDescription:*(void *)(a1 + 80) hlsMethod:*(void *)(a1 + 56)];
  if (result)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v3)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t))(v7 + 16);
      if (v8) {
        uint64_t result = v8(v3, *MEMORY[0x1E4F1CF80], v4, 1, v5 + 24);
      }
      else {
        uint64_t result = 4294954514;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
      if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 32);
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        return [v9 addObject:v10];
      }
    }
    else
    {
      uint64_t result = FigSignalErrorAt();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
    }
  }
  return result;
}

- (OpaqueFigCPECryptor)copyCryptorForIdentifier:(id)a3 initializationData:(id)a4
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v13 = 0;
  signed int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if ([(NSString *)self->_keySystem isEqualToString:@"AuthorizationTokenSystem"])
  {
    uint64_t v8 = v14;
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__copyCryptorForIdentifier_initializationData___block_invoke;
    block[3] = &unk_1E57B7978;
    block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    block[7] = &v17;
    block[8] = &v13;
    dispatch_sync(serialQueue, block);
    uint64_t v8 = v14;
    if (*((_DWORD *)v18 + 6))
    {
      uint64_t v9 = (const void *)v14[3];
      if (v9)
      {
        CFRelease(v9);
        uint64_t v8 = v14;
        v14[3] = 0;
      }
    }
  }
  uint64_t v10 = (OpaqueFigCPECryptor *)v8[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __105__AVContentKeyReportGroup_AVContentKeyReportGroup_Internal__copyCryptorForIdentifier_initializationData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cryptorOptionsForIdentifier:*(void *)(a1 + 40) initializationData:*(void *)(a1 + 48) formatDescription:0 hlsMethod:0];
  if (result)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v3)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t, void, uint64_t))(v7 + 16);
      if (v8) {
        uint64_t result = v8(v3, *MEMORY[0x1E4F1CF80], v4, 0, v5 + 24);
      }
      else {
        uint64_t result = 4294954514;
      }
    }
    else
    {
      uint64_t result = FigSignalErrorAt();
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  }
  return result;
}

- (OpaqueFigContentKeySession)_figContentKeySession
{
  return self->_figContentKeySession;
}

- (void)createProtectorSessionIdentifierIfNecessary
{
  if (!self->_useContentKeyBoss)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    int v12 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities__createProtectorSessionIdentifierIfNecessary__block_invoke;
    block[3] = &unk_1E57B3BB8;
    block[4] = self;
    void block[5] = &v9;
    block[6] = &v5;
    dispatch_sync(serialQueue, block);
    if (!*((_DWORD *)v10 + 6))
    {
      if (*((unsigned char *)v6 + 24)) {
        objc_msgSend(-[AVContentKeyReportGroup _contentKeySession](self, "_contentKeySession"), "_handleContentProtectionSessionIdentifierDidChange:", self);
      }
    }
    _Block_object_dispose(&v5, 8);
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities__createProtectorSessionIdentifierIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v2 = v1 + 24;
  if (!v3)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 16);
    if (v5)
    {
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v6) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      char v8 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v7 + 48);
      if (v8) {
        uint64_t result = v8(v5, *MEMORY[0x1E4F1FC78], *MEMORY[0x1E4F1CF80], v2);
      }
      else {
        uint64_t result = 4294954514;
      }
      *(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = result;
      if (!*(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(v4 + 48) + 8) + 24) = 1;
      }
    }
    else
    {
      uint64_t result = FigSignalErrorAt();
      *(_DWORD *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

- (int)configureAppIdentifier:(id)a3
{
  if (self->_useContentKeyBoss) {
    return 0;
  }
  figContentKeyint Session = self->_figContentKeySession;
  if (figContentKeySession)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    char v8 = *(uint64_t (**)(OpaqueFigContentKeySession *, uint64_t, id))(v7 + 56);
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F1FC60];
      return v8(figContentKeySession, v9, a3);
    }
    else
    {
      return -12782;
    }
  }
  else
  {
    return FigSignalErrorAt();
  }
}

- (BOOL)_setAuthorizationToken:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities___setAuthorizationToken_forIdentifier_error___block_invoke;
  v10[3] = &unk_1E57B79A0;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a3;
  v10[7] = &v11;
  dispatch_sync(serialQueue, v10);
  signed int v7 = *((_DWORD *)v12 + 6);
  if (a5 && v7)
  {
    *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    signed int v7 = *((_DWORD *)v12 + 6);
  }
  BOOL v8 = v7 == 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __111__AVContentKeyReportGroup_AVContentKeyReportGroupPrivateUtilities___setAuthorizationToken_forIdentifier_error___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 16);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    signed int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 72);
    if (v7) {
      uint64_t result = v7(v2, v3, v4);
    }
    else {
      uint64_t result = 4294954514;
    }
  }
  else
  {
    uint64_t result = FigSignalErrorAt();
  }
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)hasProtector
{
  uint64_t v10 = 0;
  figContentKeyint Session = self->_figContentKeySession;
  if (figContentKeySession)
  {
    uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(uint64_t (**)(OpaqueFigContentKeySession *, void, void, uint64_t *))(v4 + 48);
    if (v5)
    {
      int v6 = v5(figContentKeySession, *MEMORY[0x1E4F1FC70], *MEMORY[0x1E4F1CF80], &v10);
      uint64_t v7 = v10;
    }
    else
    {
      uint64_t v7 = 0;
      int v6 = -12782;
    }
  }
  else
  {
    int v6 = FigSignalErrorAt();
    uint64_t v7 = 0;
  }
  return !v6 && v7 == *MEMORY[0x1E4F1CFD0];
}

- (OpaqueFigCPECryptor)copyCryptorForCryptKeyAttributes:(id)a3
{
  uint64_t v9 = 0;
  figContentKeyint Session = self->_figContentKeySession;
  if (figContentKeySession)
  {
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(OpaqueFigContentKeySession *, void, id, void, OpaqueFigCPECryptor **))(v6 + 16);
    if (v7)
    {
      v7(figContentKeySession, *MEMORY[0x1E4F1CF80], a3, 0, &v9);
      return v9;
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  return 0;
}

- (int)externalProtectionStatusForCryptor:(OpaqueFigCPECryptor *)a3 withDisplays:(id)a4
{
  int v11 = 1;
  figContentKeyint Session = self->_figContentKeySession;
  if (figContentKeySession)
  {
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = *(void (**)(OpaqueFigContentKeySession *, OpaqueFigCPECryptor *, id, int *))(v8 + 88);
    if (v9)
    {
      v9(figContentKeySession, a3, a4, &v11);
      return v11;
    }
  }
  else
  {
    FigSignalErrorAt();
  }
  return 1;
}

@end