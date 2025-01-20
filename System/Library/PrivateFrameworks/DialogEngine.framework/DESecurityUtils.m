@interface DESecurityUtils
+ (BOOL)verify:(id)a3 expected:(id)a4 publicKey:(id)a5;
+ (id)getKeyFromData:(id)a3;
+ (id)getRandomIV;
+ (id)getRandomKey;
+ (id)randomDataOfLength:(unint64_t)a3;
+ (id)sign:(id)a3 privateKey:(id)a4;
@end

@implementation DESecurityUtils

+ (BOOL)verify:(id)a3 expected:(id)a4 publicKey:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  CFDataRef v7 = (const __CFData *)a3;
  CFDataRef v8 = (const __CFData *)a4;
  CFDataRef v9 = (const __CFData *)a5;
  uint64_t v10 = *MEMORY[0x1E4F3B6F0];
  uint64_t v11 = *MEMORY[0x1E4F3B718];
  v21[0] = *MEMORY[0x1E4F3B6D8];
  v21[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F3B740];
  v22[0] = v10;
  v22[1] = v12;
  v21[2] = *MEMORY[0x1E4F3B708];
  v22[2] = &unk_1F212EF48;
  CFErrorRef error = 0;
  v13 = SecKeyCreateWithData(v9, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3], &error);
  CFErrorRef v14 = error;
  if (error)
  {
    +[DELog error:@"Failed to load public key: %@", error];

LABEL_3:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  if (!v13)
  {
    +[DELog error:@"Failed to load public key"];
    goto LABEL_3;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __45__DESecurityUtils_verify_expected_publicKey___block_invoke;
  v18[3] = &__block_descriptor_40_e5_v8__0l;
  v18[4] = v13;
  v20[0] = v18;
  v20[4] = 0;
  BOOL v15 = SecKeyVerifySignature(v13, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], v8, v7, &error) != 0;
  CFErrorRef v16 = error;
  if (error)
  {
    +[DELog error:@"Failed to verify signature: %@", error];

    BOOL v15 = 0;
  }
  siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v20);
LABEL_8:

  return v15;
}

void __45__DESecurityUtils_verify_expected_publicKey___block_invoke(uint64_t a1)
{
}

+ (id)sign:(id)a3 privateKey:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  CFDataRef v5 = (const __CFData *)a3;
  CFDataRef v6 = (const __CFData *)a4;
  uint64_t v7 = *MEMORY[0x1E4F3B6E8];
  uint64_t v8 = *MEMORY[0x1E4F3B718];
  v19[0] = *MEMORY[0x1E4F3B6D8];
  v19[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3B740];
  v20[0] = v7;
  v20[1] = v9;
  v19[2] = *MEMORY[0x1E4F3B708];
  v20[2] = &unk_1F212EF48;
  CFErrorRef error = 0;
  uint64_t v10 = SecKeyCreateWithData(v6, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3], &error);
  CFErrorRef v11 = error;
  if (error)
  {
    +[DELog error:@"Failed to load private key: %@", error];

LABEL_3:
    CFDataRef v12 = 0;
    goto LABEL_11;
  }
  if (!v10)
  {
    +[DELog error:@"Failed to load private key"];
    goto LABEL_3;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__DESecurityUtils_sign_privateKey___block_invoke;
  v16[3] = &__block_descriptor_40_e5_v8__0l;
  v16[4] = v10;
  CFErrorRef error = 0;
  v18[0] = v16;
  v18[4] = 0;
  CFDataRef v13 = SecKeyCreateSignature(v10, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], v5, &error);
  CFErrorRef v14 = error;
  if (error)
  {
    +[DELog error:@"Failed to sign: %@", error];
  }
  else
  {
    CFDataRef v12 = v13;
    if (v13) {
      goto LABEL_10;
    }
    +[DELog error:@"Failed to sign"];
  }
  CFDataRef v12 = 0;
LABEL_10:
  siri::dialogengine::Defer::~Defer((siri::dialogengine::Defer *)v18);
LABEL_11:

  return v12;
}

void __35__DESecurityUtils_sign_privateKey___block_invoke(uint64_t a1)
{
}

+ (id)randomDataOfLength:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  id v4 = objc_claimAutoreleasedReturnValue();
  CFDataRef v5 = (void *)[v4 mutableBytes];
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], a3, v5)) {
    CFDataRef v6 = 0;
  }
  else {
    CFDataRef v6 = v4;
  }
  id v7 = v6;

  return v7;
}

+ (id)getRandomIV
{
  return +[DESecurityUtils randomDataOfLength:16];
}

+ (id)getKeyFromData:(id)a3
{
  id v15 = a3;
  v3 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  id v4 = [MEMORY[0x1E4F1CA58] dataWithLength:8];
  id v5 = v15;
  CFDataRef v6 = (const char *)[v5 bytes];
  size_t v7 = [v5 length];
  id v8 = v4;
  uint64_t v9 = (const uint8_t *)[v8 bytes];
  size_t v10 = [v8 length];
  id v11 = v3;
  if (CCKeyDerivationPBKDF(2u, v6, v7, v9, v10, 3u, 0x3E8u, (uint8_t *)[v11 mutableBytes], objc_msgSend(v11, "length")))
  {
    CFDataRef v12 = 0;
  }
  else
  {
    CFDataRef v12 = v11;
  }
  id v13 = v12;

  return v13;
}

+ (id)getRandomKey
{
  CFErrorRef v14 = +[DESecurityUtils randomDataOfLength:32];
  v2 = +[DESecurityUtils randomDataOfLength:8];
  v3 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  id v4 = v14;
  id v5 = (const char *)[v4 bytes];
  size_t v6 = [v4 length];
  id v7 = v2;
  id v8 = (const uint8_t *)[v7 bytes];
  size_t v9 = [v7 length];
  id v10 = v3;
  if (CCKeyDerivationPBKDF(2u, v5, v6, v8, v9, 3u, 0x3E8u, (uint8_t *)[v10 mutableBytes], objc_msgSend(v10, "length")))
  {
    id v11 = 0;
  }
  else
  {
    id v11 = v10;
  }
  id v12 = v11;

  return v12;
}

@end