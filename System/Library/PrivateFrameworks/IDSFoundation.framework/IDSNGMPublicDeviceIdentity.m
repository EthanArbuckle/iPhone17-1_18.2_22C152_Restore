@interface IDSNGMPublicDeviceIdentity
+ (BOOL)shouldMarkForStateReset:(id)a3;
+ (IDSNGMPublicDeviceIdentity)identityWithDataRepresentation:(id)a3 error:(id *)a4;
+ (IDSNGMPublicDeviceIdentity)identityWithIdentityData:(id)a3 prekeyData:(id)a4 error:(id *)a5;
- (BOOL)isIdenticalIdentityTo:(id)a3;
- (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 forType:(int64_t)a5 error:(id *)a6;
- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7;
- (id)dataRepresentationWithError:(id *)a3;
- (id)identityData;
- (id)prekeyData;
- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 encryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 errors:(id *)a15;
- (id)sealMessage:(id)a3 forceSizeOptimizations:(BOOL)a4 resetState:(BOOL)a5 encryptedAttributes:(id)a6 signedByFullIdentity:(id)a7 errors:(id *)a8;
- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5;
- (id)sealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 error:(id *)a6;
- (id)sealPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByFullIdentity:(id)a8 error:(id *)a9;
@end

@implementation IDSNGMPublicDeviceIdentity

+ (IDSNGMPublicDeviceIdentity)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  Class v6 = NSClassFromString(&cfstr_Ngmpublicdevic.isa);
  if (v6)
  {
    v10 = objc_msgSend_identityWithDataRepresentation_error_(v6, v7, (uint64_t)v5, v9, a4);
  }
  else
  {
    v11 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v7, v8, v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_19DB7D0EC();
    }

    v10 = 0;
  }

  return (IDSNGMPublicDeviceIdentity *)v10;
}

+ (IDSNGMPublicDeviceIdentity)identityWithIdentityData:(id)a3 prekeyData:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  Class v9 = NSClassFromString(&cfstr_Ngmpublicdevic.isa);
  if (v9)
  {
    v13 = objc_msgSend_identityWithIdentityData_prekeyData_error_(v9, v10, (uint64_t)v7, v12, v8, a5);
  }
  else
  {
    v14 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v10, v11, v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_19DB7D0EC();
    }

    v13 = 0;
  }

  return (IDSNGMPublicDeviceIdentity *)v13;
}

- (id)dataRepresentationWithError:(id *)a3
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D120();
  }

  return 0;
}

- (id)identityData
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D1AC();
  }

  return 0;
}

- (BOOL)isIdenticalIdentityTo:(id)a3
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D238();
  }

  return 0;
}

- (id)prekeyData
{
  v4 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, v2, v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D2C4();
  }

  return 0;
}

- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5
{
  Class v6 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v5, a4, a5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D350();
  }

  return 0;
}

- (id)sealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 error:(id *)a6
{
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v6, a4, a5, a6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D3DC();
  }

  return 0;
}

- (id)sealMessage:(id)a3 forceSizeOptimizations:(BOOL)a4 resetState:(BOOL)a5 encryptedAttributes:(id)a6 signedByFullIdentity:(id)a7 errors:(id *)a8
{
  Class v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v8, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D468();
  }

  return 0;
}

- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 encryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 errors:(id *)a15
{
  v16 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v15, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D4F4();
  }

  return 0;
}

- (id)sealPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByFullIdentity:(id)a8 error:(id *)a9
{
  v10 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v9, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D580();
  }

  return 0;
}

- (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 forType:(int64_t)a5 error:(id *)a6
{
  id v7 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v6, a4, a5, a6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D60C();
  }

  return 0;
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7
{
  double v8 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], a2, (uint64_t)a3, v7, a4, a5, a6, a7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    sub_19DB7D698();
  }

  return 0;
}

+ (BOOL)shouldMarkForStateReset:(id)a3
{
  id v3 = a3;
  Class v4 = NSClassFromString(&cfstr_Ngmpublicdevic.isa);
  if (v4)
  {
    char shouldMarkForStateReset = objc_msgSend_shouldMarkForStateReset_(v4, v5, (uint64_t)v3, v7);
  }
  else
  {
    double v9 = objc_msgSend_registration(MEMORY[0x1E4F6C3B8], v5, v6, v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_19DB7D0EC();
    }

    char shouldMarkForStateReset = 0;
  }

  return shouldMarkForStateReset;
}

@end