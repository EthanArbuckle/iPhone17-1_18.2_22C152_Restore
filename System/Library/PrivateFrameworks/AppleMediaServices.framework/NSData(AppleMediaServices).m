@interface NSData(AppleMediaServices)
+ (__CFString)_labelForDataProtectionClass:()AppleMediaServices;
+ (id)_AESKeyForDataProtectionClass:()AppleMediaServices error:;
+ (id)_generateInitializationVectorDataWithError:()AppleMediaServices;
+ (id)ams_generateEncryptionKey;
+ (uint64_t)_accessibleAttributeForDataProtectionClass:()AppleMediaServices;
- (id)_compressGZIP;
- (id)_compressLZMA;
- (id)_decompressGZIP;
- (id)_decompressLZMA;
- (id)ams_SHA1;
- (id)ams_compressWithAlgorithm:()AppleMediaServices;
- (id)ams_decompressWithAlgorithm:()AppleMediaServices;
- (id)ams_decryptUsingDataProtectionClass:()AppleMediaServices initializationVectorData:tagData:error:;
- (id)ams_decryptUsingKey:()AppleMediaServices initializationVectorData:tagData:error:;
- (uint64_t)ams_compressedData;
- (uint64_t)ams_decompressedData;
- (uint64_t)ams_hexAddressDescription;
- (uint64_t)ams_nvramDescription;
- (void)ams_encryptDataUsingDataProtectionClass:()AppleMediaServices error:;
- (void)ams_encryptDataUsingKey:()AppleMediaServices error:;
@end

@implementation NSData(AppleMediaServices)

- (uint64_t)ams_decompressedData
{
  return objc_msgSend(a1, "ams_decompressWithAlgorithm:", 1);
}

- (id)ams_decompressWithAlgorithm:()AppleMediaServices
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    v3 = [a1 _decompressGZIP];
  }
  else
  {
    v3 = [a1 _decompressLZMA];
  }
  a2 = v3;
LABEL_6:
  return a2;
}

- (id)_decompressGZIP
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [a1 length];
  strm.next_in = (Bytef *)[a1 bytes];
  id v2 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v6;
      unsigned int v3 = inflate(&strm, 0);
      if (v3 > 1) {
        break;
      }
      unsigned int v4 = v3;
      if (strm.avail_out != 0x4000) {
        [v2 appendBytes:v6 length:0x4000 - strm.avail_out];
      }
      if (v4)
      {
        inflateEnd(&strm);
        goto LABEL_9;
      }
    }
    inflateEnd(&strm);

    id v2 = 0;
  }
LABEL_9:
  return v2;
}

- (uint64_t)ams_compressedData
{
  return objc_msgSend(a1, "ams_compressWithAlgorithm:", 1);
}

- (id)ams_compressWithAlgorithm:()AppleMediaServices
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    unsigned int v3 = [a1 _compressGZIP];
  }
  else
  {
    unsigned int v3 = [a1 _compressLZMA];
  }
  a2 = v3;
LABEL_6:
  return a2;
}

- (id)ams_SHA1
{
  if ([a1 length])
  {
    id v2 = [MEMORY[0x1E4F1CA58] dataWithLength:20];
    id v3 = a1;
    unsigned int v4 = (const void *)[v3 bytes];
    LODWORD(v3) = [v3 length];
    id v5 = v2;
    CC_SHA1(v4, (CC_LONG)v3, (unsigned __int8 *)[v5 mutableBytes]);
    v6 = (void *)[v5 copy];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_compressGZIP
{
  id v2 = (void *)MEMORY[0x192FA47D0]();
  id v3 = a1;
  unsigned int v4 = (Bytef *)[v3 bytes];
  uint64_t v5 = [v3 length];
  v6 = 0;
  if (v4)
  {
    uint64_t v7 = v5;
    if (v5)
    {
      memset(&v12.avail_in, 0, 104);
      v12.avail_in = v5;
      v12.avail_out = v5;
      v12.next_in = v4;
      id v8 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v5];
      v12.next_out = (Bytef *)objc_msgSend(v8, "mutableBytes", v12.next_in, *(void *)&v12.avail_in);
      if (v8
        && !deflateInit2_(&v12, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (int v9 = deflate(&v12, 4), v10 = deflateEnd(&v12), v9 == 1)
        && !v10
        && v7 == v12.total_in)
      {
        [v8 setLength:v12.total_out];
        v6 = (void *)[v8 copy];
      }
      else
      {
        v6 = 0;
      }
    }
  }
  return v6;
}

- (id)ams_decryptUsingDataProtectionClass:()AppleMediaServices initializationVectorData:tagData:error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  z_stream v12 = [MEMORY[0x1E4F1C9B8] _AESKeyForDataProtectionClass:a3 error:a6];
  if (v12)
  {
    v13 = objc_msgSend(a1, "ams_decryptUsingKey:initializationVectorData:tagData:error:", v12, v10, v11, a6);
  }
  else
  {
    v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2048;
      uint64_t v20 = a3;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get the AES key. Data decryption will fail. dataProtectionClass = %lu", (uint8_t *)&v17, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)ams_decryptUsingKey:()AppleMediaServices initializationVectorData:tagData:error:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v9 = (void *)MEMORY[0x1E4F1CA58];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_msgSend(v9, "dataWithLength:", objc_msgSend(a1, "length"));
  id v14 = v12;
  [v14 bytes];
  [v14 length];

  id v15 = v11;
  [v15 bytes];
  [v15 length];

  id v16 = a1;
  [v16 bytes];
  uint64_t v17 = [v16 length];
  id v18 = v13;
  uint64_t v19 = [v18 mutableBytes];
  id v20 = v10;
  uint64_t v21 = [v20 bytes];
  uint64_t v22 = [v20 length];

  uint64_t v23 = CCCryptorGCMOneshotDecrypt();
  if (v23)
  {
    uint64_t v24 = v23;
    v25 = v18;
    v26 = +[AMSLogConfig sharedConfig];
    if (!v26)
    {
      v26 = +[AMSLogConfig sharedConfig];
    }
    v27 = [v26 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = objc_opt_class();
      __int16 v38 = 1024;
      int v39 = v24;
      _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Data decryption failed. status = %d", buf, 0x12u);
    }

    if (a6)
    {
      v28 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to decrypt data. status = %d", v24);
      v34 = @"AMSCryptoErrorCode";
      v29 = [MEMORY[0x1E4F28ED0] numberWithInt:v24];
      v35 = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      AMSCustomError(@"AMSErrorDomain", 4, @"Data Encryption", v28, v30, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v31 = 0;
  }
  else
  {
    id v31 = v18;
    v25 = v18;
  }

  return v31;
}

+ (id)_AESKeyForDataProtectionClass:()AppleMediaServices error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_159 != -1) {
    dispatch_once(&_MergedGlobals_159, &__block_literal_global_145);
  }
  uint64_t v7 = (id)qword_1EB38E128;
  if (+[AMSUnitTests isRunningUnitTests])
  {
    id v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Running unit tests. We won't go to the keychain for the AES key. dataProtectionClass = %lu", buf, 0x16u);
    }

    id v10 = +[AMSUnitTests encryptionKeyForDataProtectionClass:a3];
  }
  else
  {
    if (qword_1EB38E130 != -1) {
      dispatch_once(&qword_1EB38E130, &__block_literal_global_35_0);
    }
    id v11 = (id)qword_1EB38E138;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v43 = __Block_byref_object_copy__78;
    v44 = __Block_byref_object_dispose__78;
    id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    id v45 = [v11 objectForKeyedSubscript:v12];

    v13 = *(void **)(*(void *)&buf[8] + 40);
    if (v13)
    {
      id v10 = v13;
    }
    else
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], @"apple");
      id v15 = (const void *)[a1 _labelForDataProtectionClass:a3];
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5D0], v15);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B6D8], (const void *)*MEMORY[0x1E4F3B700]);
      id v16 = (const void *)[a1 _labelForDataProtectionClass:a3];
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B788], v16);
      uint64_t v17 = (const void *)*MEMORY[0x1E4F1CFD0];
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD08], (const void *)*MEMORY[0x1E4F1CFD0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B9A0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], v17);
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      int v35 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_37;
      block[3] = &unk_1E55A8850;
      block[4] = &v32;
      block[5] = buf;
      block[6] = Mutable;
      dispatch_sync(v7, block);
      if (*((_DWORD *)v33 + 6) == -25300)
      {
        id v18 = +[AMSLogConfig sharedConfig];
        if (!v18)
        {
          id v18 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v19 = [v18 OSLogObject];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = objc_opt_class();
          *(_DWORD *)v36 = 138543618;
          uint64_t v37 = v20;
          __int16 v38 = 2048;
          uint64_t v39 = a3;
          _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating an AMSDataProtectionClass encryption/decryption key. dataProtectionClass = %lu", v36, 0x16u);
        }

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __66__NSData_AppleMediaServices___AESKeyForDataProtectionClass_error___block_invoke_38;
        v30[3] = &unk_1E55A8878;
        v30[6] = Mutable;
        v30[7] = a1;
        v30[8] = a3;
        v30[4] = &v32;
        v30[5] = buf;
        dispatch_barrier_sync(v7, v30);
      }
      CFRelease(Mutable);
      if (*((_DWORD *)v33 + 6))
      {
        uint64_t v21 = +[AMSLogConfig sharedConfig];
        if (!v21)
        {
          uint64_t v21 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v22 = [v21 OSLogObject];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = objc_opt_class();
          int v24 = *((_DWORD *)v33 + 6);
          *(_DWORD *)v36 = 138543874;
          uint64_t v37 = v23;
          __int16 v38 = 2048;
          uint64_t v39 = a3;
          __int16 v40 = 1024;
          int v41 = v24;
          _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch an AMSDataProtectionClass encryption/decryption key. dataProtectionClass = %lu | error = %d", v36, 0x1Cu);
        }

        if (a4)
        {
          v25 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to fetch an AMSDataProtectionClass encryption/decryption key. error = %d", *((unsigned int *)v33 + 6));
          AMSError(0, @"Data Encryption", v25, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v10 = 0;
      }
      else
      {
        uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
        if (v26)
        {
          v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
          [v11 setObject:v26 forKeyedSubscript:v27];

          v28 = *(void **)(*(void *)&buf[8] + 40);
        }
        else
        {
          v28 = 0;
        }
        id v10 = v28;
      }
      _Block_object_dispose(&v32, 8);
    }
    _Block_object_dispose(buf, 8);
  }
  return v10;
}

+ (__CFString)_labelForDataProtectionClass:()AppleMediaServices
{
  if (a3) {
    return @"AMS Class C Encryption Key";
  }
  else {
    return @"None";
  }
}

- (uint64_t)ams_hexAddressDescription
{
  return [NSString string];
}

- (uint64_t)ams_nvramDescription
{
  return [NSString string];
}

- (id)_compressLZMA
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x192FA47D0]();
  id v10 = 0;
  id v3 = [a1 compressedDataUsingAlgorithm:2 error:&v10];
  id v4 = v10;
  if (v4)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error compressing LZMA data. %{public}@", buf, 0x20u);
    }
  }

  return v3;
}

- (id)_decompressLZMA
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x192FA47D0]();
  id v10 = 0;
  id v3 = [a1 decompressedDataUsingAlgorithm:2 error:&v10];
  id v4 = v10;
  if (v4)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      uint64_t v5 = +[AMSLogConfig sharedConfig];
    }
    v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      id v14 = v8;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error decompressing LZMA data. %{public}@", buf, 0x20u);
    }
  }

  return v3;
}

- (void)ams_encryptDataUsingDataProtectionClass:()AppleMediaServices error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_AESKeyForDataProtectionClass:error:");
  if (v8)
  {
    objc_msgSend(a1, "ams_encryptDataUsingKey:error:", v8, a3);
  }
  else
  {
    int v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      int v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2048;
      uint64_t v14 = a2;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get the AES key. Data encryption will fail. dataProtectionClass = %lu", (uint8_t *)&v11, 0x16u);
    }

    __copy_constructor_8_8_s0_s8_s16(a4);
  }
}

- (void)ams_encryptDataUsingKey:()AppleMediaServices error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ([v7 length] == 32)
  {
    id v8 = [MEMORY[0x1E4F1C9B8] _generateInitializationVectorDataWithError:a3];
    if (v8)
    {
      v28 = a3;
      v30 = a4;
      int v9 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
      id v10 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(a1, "length"));
      id v11 = v7;
      [v11 bytes];
      [v11 length];
      v29 = v8;
      id v12 = v8;
      [v12 bytes];
      [v12 length];
      id v13 = a1;
      [v13 bytes];
      uint64_t v14 = [v13 length];
      id v15 = v10;
      uint64_t v16 = [v15 mutableBytes];
      id v17 = v9;
      uint64_t v26 = [v17 mutableBytes];
      uint64_t v27 = [v17 length];
      uint64_t v18 = CCCryptorGCMOneshotEncrypt();
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = +[AMSLogConfig sharedConfig];
        if (!v20)
        {
          uint64_t v20 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v21 = [v20 OSLogObject];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = objc_opt_class();
          __int16 v33 = 1024;
          LODWORD(v34) = v19;
          _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Data encryption failed. status = %d", buf, 0x12u);
        }

        if (v28)
        {
          uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to encrypt data. status = %d", v19);
          AMSError(3, @"Data Encryption", v22, 0);
          void *v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        __copy_constructor_8_8_s0_s8_s16(v30);
      }
      else
      {
        void *v30 = v15;
        v30[1] = v12;
        v30[2] = v17;
      }
      id v8 = v29;
    }
    else
    {
      __copy_constructor_8_8_s0_s8_s16(a4);
    }
  }
  else
  {
    uint64_t v23 = +[AMSLogConfig sharedConfig];
    if (!v23)
    {
      uint64_t v23 = +[AMSLogConfig sharedConfig];
    }
    int v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 2048;
      uint64_t v34 = [v7 length];
      __int16 v35 = 2048;
      uint64_t v36 = 32;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: The encryption key isn't valid. Data encryption will fail. length = %lu, requiredLength = %lu", buf, 0x20u);
    }

    if (a3)
    {
      v25 = [NSString stringWithFormat:@"The encryption key isn't valid. Data encryption will fail. length = %lu, requiredLength = %lu", objc_msgSend(v7, "length"), 32];
      AMSError(3, @"Data Encryption", v25, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    __copy_constructor_8_8_s0_s8_s16(a4);
  }
}

+ (id)ams_generateEncryptionKey
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  CCRNGStatus Bytes = CCRandomGenerateBytes((void *)[v0 mutableBytes], 0x20uLL);
  if (Bytes)
  {
    CCRNGStatus v2 = Bytes;
    id v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      id v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543618;
      uint64_t v8 = objc_opt_class();
      __int16 v9 = 1024;
      CCRNGStatus v10 = v2;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to generate an encryption/decryption key. status = %d", (uint8_t *)&v7, 0x12u);
    }

    id v5 = 0;
  }
  else
  {
    id v5 = v0;
  }

  return v5;
}

+ (uint64_t)_accessibleAttributeForDataProtectionClass:()AppleMediaServices
{
  if (a3 == 1) {
    return *MEMORY[0x1E4F3B570];
  }
  else {
    return 0;
  }
}

+ (id)_generateInitializationVectorDataWithError:()AppleMediaServices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA58] dataWithLength:16];
  uint64_t Bytes = CCRandomGenerateBytes((void *)[v4 mutableBytes], 0x10uLL);
  if (Bytes)
  {
    uint64_t v6 = Bytes;
    int v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      int v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to generate IV data. Data encryption will fail. status = %d", buf, 0x12u);
    }

    __int16 v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to generate IV data. status = %d", v6);
    if (a3)
    {
      AMSError(3, @"Data Encryption", v9, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

@end