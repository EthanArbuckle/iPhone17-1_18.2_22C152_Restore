@interface HAP2AccessoryServerSecureTransportBaseDefaultEncryptedSession
- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
@end

@implementation HAP2AccessoryServerSecureTransportBaseDefaultEncryptedSession

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hapErrorWithCode:", 3, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hapErrorWithCode:", 3, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end