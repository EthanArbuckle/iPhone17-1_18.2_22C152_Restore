@interface BCCryptor
+ (void)encryptData:(id)a3 key:(id)a4 completion:(id)a5;
@end

@implementation BCCryptor

+ (void)encryptData:(id)a3 key:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:1];
    if (v10)
    {
      v11 = LogCategory_Daemon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_228C26000, v11, OS_LOG_TYPE_DEFAULT, "BCCryptor: encrypt data for key %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __40__BCCryptor_encryptData_key_completion___block_invoke;
      v31 = &unk_264852120;
      id v33 = v9;
      id v32 = v7;
      v12 = &v28;
      CFDataRef v13 = v10;
      self;
      uint64_t v14 = *MEMORY[0x263F16F80];
      uint64_t v15 = *MEMORY[0x263F16FA8];
      v41[0] = *MEMORY[0x263F16F68];
      v41[1] = v15;
      uint64_t v16 = *MEMORY[0x263F16FB0];
      *(void *)&long long buf = v14;
      *((void *)&buf + 1) = v16;
      objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &buf, v41, 2, v28, v29);
      CFDictionaryRef v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFErrorRef error = 0;
      SecKeyRef v18 = SecKeyCreateWithData(v13, v17, &error);

      v19 = LogCategory_Daemon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v40 = 138412290;
        *(void *)&v40[4] = error;
        _os_log_impl(&dword_228C26000, v19, OS_LOG_TYPE_DEFAULT, "BCCryptor: publicKeyFromData %@", v40, 0xCu);
      }

      if (v18)
      {
        v30((uint64_t)v12, v18, 0);
        CFRelease(v18);
      }
      else
      {
        id v25 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v39 = *MEMORY[0x263F08320];
        *(void *)v40 = @"Failed creating key";
        v26 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
        v27 = (void *)[v25 initWithDomain:@"com.apple.icloud.messages.business.cryptor" code:2 userInfo:v26];

        v30((uint64_t)v12, 0, v27);
      }

      v23 = v33;
    }
    else
    {
      id v22 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v35 = *MEMORY[0x263F08320];
      v36 = @"Key is not UTF8";
      v23 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v24 = (void *)[v22 initWithDomain:@"com.apple.icloud.messages.business.cryptor" code:1 userInfo:v23];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v24);
    }
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v37 = *MEMORY[0x263F08320];
    v38 = @"Empty string received for key";
    v21 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v10 = (void *)[v20 initWithDomain:@"com.apple.icloud.messages.business.cryptor" code:0 userInfo:v21];

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v10);
  }
}

void __40__BCCryptor_encryptData_key_completion___block_invoke(uint64_t a1, __SecKey *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = LogCategory_Daemon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFErrorRef v27 = a2;
    _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCCryptor: public key %@", buf, 0xCu);
  }

  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (a2 {
         && (CFStringRef v7 = (const __CFString *)*MEMORY[0x263F17308],
  }
             SecKeyIsAlgorithmSupported(a2, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x263F17308])))
  {
    CFErrorRef error = 0;
    CFDataRef v8 = SecKeyCreateEncryptedData(a2, v7, *(CFDataRef *)(a1 + 32), &error);
    id v9 = [(__CFData *)v8 base64EncodedStringWithOptions:0];
    v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v27 = error;
      _os_log_impl(&dword_228C26000, v10, OS_LOG_TYPE_DEFAULT, "BCCryptor: Encryption result %@", buf, 0xCu);
    }

    v11 = LogCategory_Daemon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(__CFData *)v8 description];
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v27 = v12;
      _os_log_impl(&dword_228C26000, v11, OS_LOG_TYPE_DEFAULT, "BCCryptor: Encrypted data %@", buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v9, 0);
    }
    else
    {
      id v18 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v22 = *MEMORY[0x263F08320];
      v23 = @"Unable to encrypt token";
      v19 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v20 = (void *)[v18 initWithDomain:@"com.apple.icloud.messages.business.cryptor" code:4 userInfo:v19];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v20);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v24 = *MEMORY[0x263F08320];
    id v25 = @"Public key invalid";
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    CFDictionaryRef v17 = (void *)[v15 initWithDomain:@"com.apple.icloud.messages.business.cryptor" code:3 userInfo:v16];
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v17);
  }
}

@end