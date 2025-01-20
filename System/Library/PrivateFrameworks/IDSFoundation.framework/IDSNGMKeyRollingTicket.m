@interface IDSNGMKeyRollingTicket
- (id)identityData;
- (id)prekeyData;
@end

@implementation IDSNGMKeyRollingTicket

- (id)identityData
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D758();
  }

  return 0;
}

- (id)prekeyData
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D7E4();
  }

  return 0;
}

@end