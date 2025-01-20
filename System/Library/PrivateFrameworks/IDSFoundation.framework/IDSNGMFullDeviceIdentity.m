@interface IDSNGMFullDeviceIdentity
+ (IDSNGMFullDeviceIdentity)identityWithAccess:(id)a3 usageIdentifier:(id)a4 error:(id *)a5;
+ (IDSNGMFullDeviceIdentity)identityWithDataRepresentation:(id)a3 error:(id *)a4;
- (BOOL)eraseFromKeyChain:(id *)a3;
- (BOOL)shouldRollEncryptionIdentity;
- (BOOL)updateWithRegisteredTicket:(id)a3 error:(id *)a4;
- (id)batchSign:(id)a3 forType:(int64_t)a4 error:(id *)a5;
- (id)dataRepresentationWithError:(id *)a3;
- (id)keyRollingTicketWithError:(id *)a3;
- (id)publicDeviceIdentityWithError:(id *)a3;
- (id)sign:(id)a3 forType:(int64_t)a4 error:(id *)a5;
- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5;
- (void)openPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByPublicIdentity:(id)a8 decryptionBlock:(id)a9;
- (void)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5;
- (void)unsealMessageAndAttributes:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 decryptionBlock:(id)a12;
- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 signedByPublicIdentity:(id)a5 decryptionBlock:(id)a6;
- (void)unsealMessageAndAttributes:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5;
@end

@implementation IDSNGMFullDeviceIdentity

+ (IDSNGMFullDeviceIdentity)identityWithAccess:(id)a3 usageIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  Class v9 = NSClassFromString(&cfstr_Ngmfulldevicei.isa);
  if (v9)
  {
    v13 = objc_msgSend_identityWithAccess_usageIdentifier_error_(v9, v10, (uint64_t)v7, v12, v8, a5);
  }
  else
  {
    v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_19DB7C910();
    }

    v13 = 0;
  }

  return (IDSNGMFullDeviceIdentity *)v13;
}

+ (IDSNGMFullDeviceIdentity)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  Class v6 = NSClassFromString(&cfstr_Ngmfulldevicei.isa);
  if (v6)
  {
    v10 = objc_msgSend_identityWithDataRepresentation_error_(v6, v7, (uint64_t)v5, v9, a4);
  }
  else
  {
    uint64_t v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_19DB7C910();
    }

    v10 = 0;
  }

  return (IDSNGMFullDeviceIdentity *)v10;
}

- (id)dataRepresentationWithError:(id *)a3
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7C944();
  }

  return 0;
}

- (id)publicDeviceIdentityWithError:(id *)a3
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7C9D0();
  }

  return 0;
}

- (BOOL)eraseFromKeyChain:(id *)a3
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CA5C();
  }

  return 0;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  Class v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v5, a4, a5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CAE8();
  }

  return 0;
}

- (void)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  Class v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v5, a4, a5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CB74();
  }
}

- (void)unsealMessageAndAttributes:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  Class v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v5, a4, a5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CC00();
  }
}

- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 signedByPublicIdentity:(id)a5 decryptionBlock:(id)a6
{
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v6, a4, a5, a6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CC8C();
  }
}

- (void)unsealMessageAndAttributes:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 decryptionBlock:(id)a12
{
  v13 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v12, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CD18();
  }
}

- (void)openPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByPublicIdentity:(id)a8 decryptionBlock:(id)a9
{
  v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v9, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CDA4();
  }
}

- (BOOL)shouldRollEncryptionIdentity
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CE30();
  }

  return 0;
}

- (id)keyRollingTicketWithError:(id *)a3
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CEBC();
  }

  return 0;
}

- (BOOL)updateWithRegisteredTicket:(id)a3 error:(id *)a4
{
  double v5 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v4, a4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CF48();
  }

  return 0;
}

- (id)sign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  double v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v5, a4, a5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_19DB7CFD4();
  }

  return 0;
}

- (id)batchSign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  double v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v5, a4, a5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D060();
  }

  return 0;
}

@end