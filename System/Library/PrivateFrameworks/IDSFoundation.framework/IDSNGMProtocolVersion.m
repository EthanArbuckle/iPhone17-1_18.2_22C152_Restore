@interface IDSNGMProtocolVersion
+ (BOOL)isVersionSupported:(unsigned int)a3;
+ (unsigned)supportedVersion;
@end

@implementation IDSNGMProtocolVersion

+ (BOOL)isVersionSupported:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  Class v4 = NSClassFromString(&cfstr_Ngmprotocolver.isa);
  if (v4)
  {
    return objc_msgSend_isVersionSupported_(v4, v5, v3, v7);
  }
  else
  {
    v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_19DB7D724();
    }

    return 0;
  }
}

+ (unsigned)supportedVersion
{
  Class v2 = NSClassFromString(&cfstr_Ngmprotocolver.isa);
  if (v2)
  {
    return MEMORY[0x1F4181798](v2, sel_supportedVersion, v4, v5);
  }
  else
  {
    uint64_t v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v3, v4, v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_19DB7D724();
    }

    return 0;
  }
}

@end