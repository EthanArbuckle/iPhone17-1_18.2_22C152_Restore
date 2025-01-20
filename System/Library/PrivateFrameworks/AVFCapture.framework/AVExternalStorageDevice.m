@interface AVExternalStorageDevice
+ (AVAuthorizationStatus)authorizationStatus;
+ (void)requestAccessWithCompletionHandler:(void *)handler;
- (AVExternalStorageDevice)initWithExternalStorageDeviceManager:(OpaqueFigExternalStorageDeviceManager *)a3 figExternalStorageDeviceUUID:(__CFString *)a4;
- (BOOL)isConnected;
- (BOOL)isNotRecommendedForCaptureUse;
- (NSArray)nextAvailableURLsWithPathExtensions:(NSArray *)extensionArray error:(NSError *)outError;
- (NSInteger)freeSize;
- (NSInteger)totalSize;
- (NSString)displayName;
- (NSUUID)uuid;
- (id)_uniqueIdentifier;
- (id)baseURL;
- (id)figExternalStorageDeviceUUID;
- (void)dealloc;
- (void)updateExternalStorageDeviceManager:(OpaqueFigExternalStorageDeviceManager *)a3 andFigExternalStorageDeviceUUID:(id)a4;
@end

@implementation AVExternalStorageDevice

- (AVExternalStorageDevice)initWithExternalStorageDeviceManager:(OpaqueFigExternalStorageDeviceManager *)a3 figExternalStorageDeviceUUID:(__CFString *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVExternalStorageDevice;
  v6 = [(AVExternalStorageDevice *)&v10 init];
  if (v6)
  {
    if (a3) {
      v7 = (OpaqueFigExternalStorageDeviceManager *)CFRetain(a3);
    }
    else {
      v7 = 0;
    }
    v6->_externalStorageDeviceManager = v7;
    if (a4) {
      v8 = (__CFString *)CFRetain(a4);
    }
    else {
      v8 = 0;
    }
    v6->_figExternalStorageDeviceUUID = v8;
    v6->_nextAvailableURLArray = 0;
    v6->_baseURL = 0;
  }
  return v6;
}

- (void)dealloc
{
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    CFRelease(externalStorageDeviceManager);
    self->_externalStorageDeviceManager = 0;
  }
  displayName = self->_displayName;
  if (displayName)
  {
    CFRelease(displayName);
    self->_displayName = 0;
  }
  nextAvailableURLArray = self->_nextAvailableURLArray;
  if (nextAvailableURLArray)
  {
    CFRelease(nextAvailableURLArray);
    self->_nextAvailableURLArray = 0;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    CFRelease(uniqueIdentifier);
    self->_uniqueIdentifier = 0;
  }
  baseURL = self->_baseURL;
  if (baseURL)
  {
    CFRelease(baseURL);
    self->_baseURL = 0;
  }
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  if (figExternalStorageDeviceUUID)
  {
    CFRelease(figExternalStorageDeviceUUID);
    self->_figExternalStorageDeviceUUID = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)AVExternalStorageDevice;
  [(AVExternalStorageDevice *)&v9 dealloc];
}

- (id)figExternalStorageDeviceUUID
{
  v2 = (void *)[(__CFString *)self->_figExternalStorageDeviceUUID copy];

  return v2;
}

- (NSString)displayName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_displayName = (id *)&self->_displayName;
  displayName = self->_displayName;
  if (displayName)
  {
    CFRelease(displayName);
    id *p_displayName = 0;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v8 = v7 ? v7 : 0;
    objc_super v9 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, id *))(v8 + 32);
    if (v9) {
      v9(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526D0], *MEMORY[0x1E4F1CF80], p_displayName);
    }
  }
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (NSString *)(id)objc_msgSend(*p_displayName, "copy", v12, v13);
}

- (NSInteger)freeSize
{
  cf[24] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager
    && ((figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID,
         (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v5 = 0)
      : (uint64_t v5 = v4),
        (v6 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, CFTypeRef *))(v5 + 32)) != 0))
  {
    int v7 = v6(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526D8], *MEMORY[0x1E4F1CF80], cf);
    CFTypeRef v8 = cf[0];
    if (!v7)
    {
      NSInteger SInt64 = FigCFNumberGetSInt64();
      CFTypeRef v8 = cf[0];
      if (!cf[0]) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    NSInteger SInt64 = -1;
    if (cf[0]) {
LABEL_8:
    }
      CFRelease(v8);
  }
  else
  {
    NSInteger SInt64 = -1;
  }
LABEL_10:
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return SInt64;
}

- (NSInteger)totalSize
{
  cf[24] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager
    && ((figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID,
         (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v5 = 0)
      : (uint64_t v5 = v4),
        (v6 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, CFTypeRef *))(v5 + 32)) != 0))
  {
    int v7 = v6(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526F0], *MEMORY[0x1E4F1CF80], cf);
    CFTypeRef v8 = cf[0];
    if (!v7)
    {
      NSInteger SInt64 = FigCFNumberGetSInt64();
      CFTypeRef v8 = cf[0];
      if (!cf[0]) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    NSInteger SInt64 = -1;
    if (cf[0]) {
LABEL_8:
    }
      CFRelease(v8);
  }
  else
  {
    NSInteger SInt64 = -1;
  }
LABEL_10:
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return SInt64;
}

- (BOOL)isConnected
{
  cf[22] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager
    && ((figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID,
         (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v5 = 0)
      : (uint64_t v5 = v4),
        (v6 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, CFTypeRef *))(v5 + 32)) != 0))
  {
    v6(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526E0], *MEMORY[0x1E4F1CF80], cf);
    BOOL v7 = cf[0] == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
    if (cf[0]) {
      CFRelease(cf[0]);
    }
  }
  else
  {
    BOOL v7 = *MEMORY[0x1E4F1CFD0] == 0;
  }
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v7;
}

- (id)_uniqueIdentifier
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_uniqueIdentifier = (id *)&self->_uniqueIdentifier;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    CFRelease(uniqueIdentifier);
    id *p_uniqueIdentifier = 0;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v8 = v7 ? v7 : 0;
    objc_super v9 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, id *))(v8 + 32);
    if (v9) {
      v9(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526F8], *MEMORY[0x1E4F1CF80], p_uniqueIdentifier);
    }
  }
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id)objc_msgSend(*p_uniqueIdentifier, "copy", v12, v13);
}

- (NSUUID)uuid
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", -[AVExternalStorageDevice _uniqueIdentifier](self, "_uniqueIdentifier"));

  return (NSUUID *)v2;
}

- (BOOL)isNotRecommendedForCaptureUse
{
  v17[1] = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  baseURL = self->_baseURL;
  uint64_t v4 = *MEMORY[0x1E4F1C950];
  v17[0] = *MEMORY[0x1E4F1C950];
  uint64_t v5 = (void *)-[__CFURL resourceValuesForKeys:error:](baseURL, "resourceValuesForKeys:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1], 0);
  if (!v5) {
    goto LABEL_14;
  }
  v6 = (OpaqueFigExternalStorageDeviceManager *)[v5 objectForKeyedSubscript:v4];
  externalStorageDeviceManager = v6;
  if (!v6) {
    goto LABEL_15;
  }
  if (![(OpaqueFigExternalStorageDeviceManager *)v6 caseInsensitiveCompare:@"msdos"]
    || ![(OpaqueFigExternalStorageDeviceManager *)externalStorageDeviceManager caseInsensitiveCompare:@"apfs"])
  {
    LOBYTE(externalStorageDeviceManager) = 1;
    goto LABEL_15;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (!externalStorageDeviceManager) {
    goto LABEL_15;
  }
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v10 = v9 ? v9 : 0;
  v11 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, CFTypeRef *))(v10 + 32);
  if (v11)
  {
    int v12 = v11(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526E8], *MEMORY[0x1E4F1CF80], &cf);
    CFTypeRef v13 = cf;
    if (!v12)
    {
      LOBYTE(externalStorageDeviceManager) = FigCFEqual() != 0;
      CFTypeRef v13 = cf;
      if (!cf) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    LOBYTE(externalStorageDeviceManager) = 0;
    if (cf) {
LABEL_13:
    }
      CFRelease(v13);
  }
  else
  {
LABEL_14:
    LOBYTE(externalStorageDeviceManager) = 0;
  }
LABEL_15:
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (char)externalStorageDeviceManager;
}

- (NSArray)nextAvailableURLsWithPathExtensions:(NSArray *)extensionArray error:(NSError *)outError
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v32 = 0;
  nextAvailableURLArray = self->_nextAvailableURLArray;
  if (nextAvailableURLArray)
  {
    CFRelease(nextAvailableURLArray);
    self->_nextAvailableURLArray = 0;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  self->_nextAvailableURLArray = Mutable;
  if (!Mutable)
  {
    uint64_t v27 = v4;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    goto LABEL_28;
  }
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (!externalStorageDeviceManager)
  {
LABEL_18:
    if (dword_1E9544D58)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return (NSArray *)(id)[(__CFArray *)self->_nextAvailableURLArray copy];
  }
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(uint64_t (**)(OpaqueFigExternalStorageDeviceManager *, void, __CFString *, NSArray *, id *))(v13 + 24);
  if (!v14)
  {
    int v15 = -12782;
LABEL_21:
    if (!outError) {
      return 0;
    }
    goto LABEL_22;
  }
  int v15 = v14(externalStorageDeviceManager, 0, figExternalStorageDeviceUUID, extensionArray, &v32);
  if (v15) {
    goto LABEL_21;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v32;
  uint64_t v17 = [v32 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v17) {
    goto LABEL_18;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v29;
LABEL_12:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v29 != v19) {
      objc_enumerationMutation(v16);
    }
    v21 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:*(void *)(*((void *)&v28 + 1) + 8 * v20) error:outError];
    if (!v21) {
      break;
    }
    CFArrayAppendValue(self->_nextAvailableURLArray, (const void *)[v21 url]);
    if (v18 == ++v20)
    {
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v18) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
  }
LABEL_28:
  int v15 = -19277;
  if (!outError) {
    return 0;
  }
LABEL_22:
  if (v15 == -19274) {
    int v23 = -11852;
  }
  else {
    int v23 = v15;
  }
  v24 = (NSError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], v23, 0, v26, v27);
  result = 0;
  *outError = v24;
  return result;
}

- (id)baseURL
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_baseURL = &self->_baseURL;
  if (!self->_baseURL)
  {
    externalStorageDeviceManager = self->_externalStorageDeviceManager;
    if (externalStorageDeviceManager)
    {
      figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
      uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
      uint64_t v7 = v6 ? v6 : 0;
      uint64_t v9 = *(void (**)(OpaqueFigExternalStorageDeviceManager *, __CFString *, void, void, __CFURL **))(v7 + 32);
      if (v9) {
        v9(externalStorageDeviceManager, figExternalStorageDeviceUUID, *MEMORY[0x1E4F526C8], *MEMORY[0x1E4F1CF80], p_baseURL);
      }
    }
  }
  if (dword_1E9544D58)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id)[(__CFURL *)*p_baseURL copy];
}

- (void)updateExternalStorageDeviceManager:(OpaqueFigExternalStorageDeviceManager *)a3 andFigExternalStorageDeviceUUID:(id)a4
{
  externalStorageDeviceManager = self->_externalStorageDeviceManager;
  if (externalStorageDeviceManager)
  {
    CFRelease(externalStorageDeviceManager);
    self->_externalStorageDeviceManager = 0;
  }
  if (a3) {
    uint64_t v8 = (OpaqueFigExternalStorageDeviceManager *)CFRetain(a3);
  }
  else {
    uint64_t v8 = 0;
  }
  self->_externalStorageDeviceManager = v8;
  figExternalStorageDeviceUUID = self->_figExternalStorageDeviceUUID;
  if (figExternalStorageDeviceUUID)
  {
    CFRelease(figExternalStorageDeviceUUID);
    self->_figExternalStorageDeviceUUID = 0;
  }
  if (a4) {
    uint64_t v10 = (__CFString *)CFRetain(a4);
  }
  else {
    uint64_t v10 = 0;
  }
  self->_figExternalStorageDeviceUUID = v10;
}

+ (AVAuthorizationStatus)authorizationStatus
{
  int v2 = [+[AVExternalStorageDeviceDiscoverySession sharedSession] _checkAuthorizationStatus];
  if (v2 == 2) {
    return 3;
  }
  else {
    return 2 * (v2 == 1);
  }
}

+ (void)requestAccessWithCompletionHandler:(void *)handler
{
  if (+[AVExternalStorageDeviceDiscoverySession isSupported])
  {
    uint64_t v4 = +[AVExternalStorageDeviceDiscoverySession sharedSession];
    [(AVExternalStorageDeviceDiscoverySession *)v4 _requestAuthorization:handler];
  }
  else
  {
    uint64_t v5 = (void (*)(void *, void))*((void *)handler + 2);
    v5(handler, 0);
  }
}

@end