@interface MCDeviceCapabilities
+ (id)currentDevice;
- (BOOL)_mediaDiskIsEncrypted;
- (BOOL)hasSEP;
- (BOOL)supportsBlockLevelEncryption;
- (BOOL)supportsFileLevelEncryption;
- (BOOL)validateCapabilitiesRequiredByRestrictions:(id)a3 localizedIncompatibilityMessage:(id)a4 outError:(id *)a5;
- (MCDeviceCapabilities)init;
@end

@implementation MCDeviceCapabilities

- (BOOL)validateCapabilitiesRequiredByRestrictions:(id)a3 localizedIncompatibilityMessage:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[MCRestrictionManager BOOLSettingForFeature:@"requireBlockLevelEncryption" withUserSettingDictionary:v8] == 1&& !self->_supportsBlockLevelEncryption)
  {
    if (!a5) {
      goto LABEL_11;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = MCErrorArrayFromLocalizedDescription(v9);
    v12 = v10;
    uint64_t v13 = 26000;
LABEL_10:
    *a5 = [v12 MCErrorWithDomain:@"MCDeviceCapabilitiesErrorDomain" code:v13 descriptionArray:v11 errorType:@"MCFatalError"];

    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:@"requireFileLevelEncryption" withUserSettingDictionary:v8] == 1&& !self->_supportsFileLevelEncryption)
  {
    if (!a5) {
      goto LABEL_11;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    v11 = MCErrorArrayFromLocalizedDescription(v9);
    v12 = v14;
    uint64_t v13 = 26001;
    goto LABEL_10;
  }
  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

+ (id)currentDevice
{
  if (currentDevice_once != -1) {
    dispatch_once(&currentDevice_once, &__block_literal_global_27);
  }
  v2 = (void *)currentDevice_device;
  return v2;
}

uint64_t __37__MCDeviceCapabilities_currentDevice__block_invoke()
{
  currentDevice_device = objc_alloc_init(MCDeviceCapabilities);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_mediaDiskIsEncrypted
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef v3 = v2;
  v5 = v2 && (CFTypeID v4 = CFGetTypeID(v2), v4 == CFBooleanGetTypeID()) && CFBooleanGetValue(v3) != 0;
  v6 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_DEBUG, "block level encryption is %x", (uint8_t *)v8, 8u);
  }
  if (v3) {
    CFRelease(v3);
  }
  return v5;
}

- (MCDeviceCapabilities)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)MCDeviceCapabilities;
  CFBooleanRef v2 = [(MCDeviceCapabilities *)&v8 init];
  CFBooleanRef v3 = v2;
  if (v2)
  {
    if ([(MCDeviceCapabilities *)v2 _mediaDiskIsEncrypted]) {
      v3->_supportsBlockLevelEncryption = 1;
    }
    int v4 = MKBDeviceFormattedForContentProtection();
    if (v4 < 0)
    {
      BOOL v5 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v10 = v4;
        _os_log_impl(&dword_1A13F0000, v5, OS_LOG_TYPE_ERROR, "Unable to determine if device supports file level encryption.  Got %d from MKBDeviceSupportsContentProtection()", buf, 8u);
      }
    }
    v3->_supportsFileLevelEncryption = v4 == 1;
    v6 = (void *)MGCopyAnswer();
    v3->_hasSEP = v6 != 0;
  }
  return v3;
}

- (BOOL)supportsBlockLevelEncryption
{
  return self->_supportsBlockLevelEncryption;
}

- (BOOL)supportsFileLevelEncryption
{
  return self->_supportsFileLevelEncryption;
}

- (BOOL)hasSEP
{
  return self->_hasSEP;
}

@end