@interface FMDCryptoUtil
+ (BOOL)generatePublicPrivateKeyPair:(id *)a3 privateKey:(id *)a4;
+ (__SecKey)dataToKey:(id)a3 isPublic:(BOOL)a4;
+ (id)decryptData:(id)a3 privateKeyData:(id)a4;
+ (id)keyToData:(__SecKey *)a3;
+ (id)publicKeyFromPrivateKey:(id)a3;
+ (void)testCrypto;
+ (void)testCrypto2:(id)a3 privateKey:(id)a4;
@end

@implementation FMDCryptoUtil

+ (BOOL)generatePublicPrivateKeyPair:(id *)a3 privateKey:(id *)a4
{
  v16[0] = kSecAttrKeyType;
  v16[1] = kSecAttrKeySizeInBits;
  v17[0] = kSecAttrKeyTypeEC;
  v17[1] = &off_1000398F8;
  CFDictionaryRef v6 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  CFErrorRef error = 0;
  v7 = SecKeyCreateRandomKey(v6, &error);
  if (error) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  BOOL v9 = !v8;
  if (v8)
  {
    v11 = sub_100003338();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v15 = error;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "### key gen completed with %@", buf, 0xCu);
    }
  }
  else
  {
    v10 = v7;
    *a3 = +[FMDCryptoUtil keyToData:SecKeyCopyPublicKey(v7)];
    *a4 = +[FMDCryptoUtil keyToData:v10];
  }

  return v9;
}

+ (id)decryptData:(id)a3 privateKeyData:(id)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  id v6 = a4;
  v7 = v6;
  CFDataRef v8 = 0;
  if (v5 && v6)
  {
    BOOL v9 = sub_100003338();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v7 fm_hexString];
      v10 = (__SecKey *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v10;
      __int16 v28 = 2112;
      CFDataRef v29 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### privateKey = %@ cipherText = %@", buf, 0x16u);
    }
    v11 = (__SecKey *)[(id)objc_opt_class() dataToKey:v7 isPublic:0];
    v12 = sub_100003338();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "### decoded privateKey = %@", buf, 0xCu);
    }

    CFErrorRef error = 0;
    CFDataRef v8 = SecKeyCreateDecryptedData(v11, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, v5, &error);
    if (v8)
    {
      v13 = sub_100003338();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (__SecKey *)[(__CFData *)v8 bytes];
        *(_DWORD *)buf = 136315138;
        v27 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "### decryption success with cipherText = %s", buf, 0xCu);
      }

      CFDataRef v15 = v8;
    }
    else
    {
      CFErrorRef v16 = error;
      v17 = sub_100003338();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10001FD00((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }

  return v8;
}

+ (void)testCrypto
{
  v35[0] = kSecAttrKeyType;
  v35[1] = kSecAttrKeySizeInBits;
  v36[0] = kSecAttrKeyTypeEC;
  v36[1] = &off_1000398F8;
  CFDictionaryRef v3 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  CFErrorRef error = 0;
  v4 = SecKeyCreateRandomKey(v3, &error);
  CFDataRef v5 = sub_100003338();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFErrorRef v32 = error;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "### key gen completed with %@", buf, 0xCu);
  }

  id v6 = SecKeyCopyPublicKey(v4);
  if (SecKeyIsAlgorithmSupported(v6, kSecKeyOperationTypeEncrypt, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM))
  {
    v7 = +[NSData dataWithBytes:"This is a secret!\n" length:19];
    id v8 = [v7 length];
    size_t v9 = SecKeyGetBlockSize(v6) - 130;
    v10 = sub_100003338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      size_t BlockSize = SecKeyGetBlockSize(v6);
      *(_DWORD *)buf = 134217984;
      CFErrorRef v32 = (CFErrorRef)(BlockSize - 130);
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "### max message size %lu", buf, 0xCu);
    }

    if ((unint64_t)v8 >= v9)
    {
      v12 = sub_100003338();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001FEC0(v7, v6);
      }
    }
    else
    {
      CFErrorRef v29 = 0;
      v12 = SecKeyCreateEncryptedData(v6, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v7, &v29);
      if (v12)
      {
        v13 = sub_100003338();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v12 bytes];
          *(_DWORD *)buf = 138412546;
          CFErrorRef v32 = (CFErrorRef)v12;
          __int16 v33 = 2080;
          id v34 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "### encryption success with cipherText = %@\n cipherString = %s", buf, 0x16u);
        }

        CFErrorRef v29 = 0;
        CFDataRef v15 = SecKeyCreateDecryptedData(v4, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v12, &v29);
        if (v15)
        {
          CFErrorRef v16 = sub_100003338();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (__CFError *)[(__CFData *)v15 bytes];
            *(_DWORD *)buf = 136315138;
            CFErrorRef v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "### decryption success with cipherText = %s", buf, 0xCu);
          }

          uint64_t v18 = objc_opt_class();
          CFErrorRef v19 = [a1 keyToData:v6];
          uint64_t v20 = [a1 keyToData:v4];
          [v18 testCrypto2:v19 privateKey:v20];
        }
        else
        {
          CFErrorRef v19 = v29;
          uint64_t v20 = sub_100003338();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10001FE1C(v19);
          }
        }
      }
      else
      {
        CFErrorRef v21 = v29;
        uint64_t v22 = sub_100003338();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10001FDB0((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
    }
  }
  else
  {
    v7 = sub_100003338();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10001FD6C(v7);
    }
  }
}

+ (void)testCrypto2:(id)a3 privateKey:(id)a4
{
  CFDataRef v5 = a3;
  id v6 = a4;
  v7 = (__SecKey *)[(id)objc_opt_class() dataToKey:v6 isPublic:0];
  id v8 = (__SecKey *)[(id)objc_opt_class() dataToKey:v5 isPublic:1];
  size_t v9 = sub_100003338();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v33 = v5;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### publicKeyData = %@ privateKeyData = %@", buf, 0x16u);
  }

  v10 = sub_100003338();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v5 bytes];
    id v12 = [v6 bytes];
    *(_DWORD *)buf = 136315394;
    __int16 v33 = v11;
    __int16 v34 = 2080;
    id v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "### string publicKeyData = %s privateKeyData = %s", buf, 0x16u);
  }

  if (SecKeyIsAlgorithmSupported(v8, kSecKeyOperationTypeEncrypt, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM))
  {
    v13 = +[NSData dataWithBytes:"This is a secret!\n" length:19];
    id v14 = [v13 length];
    size_t v15 = SecKeyGetBlockSize(v8) - 130;
    CFErrorRef v16 = sub_100003338();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      size_t BlockSize = SecKeyGetBlockSize(v8);
      *(_DWORD *)buf = 134217984;
      __int16 v33 = (BlockSize - 130);
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "### max message size %lu", buf, 0xCu);
    }

    if ((unint64_t)v14 >= v15)
    {
      uint64_t v18 = sub_100003338();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001FEC0(v13, v8);
      }
    }
    else
    {
      CFErrorRef error = 0;
      uint64_t v18 = SecKeyCreateEncryptedData(v8, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v13, &error);
      if (v18)
      {
        CFErrorRef v19 = sub_100003338();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v18 bytes];
          *(_DWORD *)buf = 138412546;
          __int16 v33 = v18;
          __int16 v34 = 2080;
          id v35 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "### encryption success with cipherText = %@\n cipherString = %s", buf, 0x16u);
        }

        CFErrorRef error = 0;
        CFDataRef v21 = SecKeyCreateDecryptedData(v7, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v18, &error);
        if (v21)
        {
          uint64_t v22 = sub_100003338();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [(__CFData *)v21 bytes];
            *(_DWORD *)buf = 136315138;
            __int16 v33 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "### decryption success with cipherText = %s", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v22 = error;
          v30 = sub_100003338();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10001FE1C(v22);
          }
        }
      }
      else
      {
        CFDataRef v21 = error;
        uint64_t v22 = sub_100003338();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10001FDB0((uint64_t)v21, v22, v24, v25, v26, v27, v28, v29);
        }
      }
    }
  }
  else
  {
    v13 = sub_100003338();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001FD6C(v13);
    }
  }
}

+ (id)keyToData:(__SecKey *)a3
{
  CFErrorRef error = 0;
  CFDataRef v3 = SecKeyCopyExternalRepresentation(a3, &error);
  if (!v3)
  {
    CFErrorRef v4 = error;
    CFDataRef v5 = sub_100003338();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "### error converting keys = %@", buf, 0xCu);
    }
  }

  return v3;
}

+ (__SecKey)dataToKey:(id)a3 isPublic:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  v15[0] = kSecAttrKeyType;
  v15[1] = kSecAttrKeyClass;
  CFErrorRef v4 = &kSecAttrKeyClassPublic;
  if (!a4) {
    CFErrorRef v4 = &kSecAttrKeyClassPrivate;
  }
  CFStringRef v5 = *v4;
  v16[0] = kSecAttrKeyTypeEC;
  v16[1] = v5;
  v15[2] = kSecAttrKeySizeInBits;
  void v16[2] = &off_1000398F8;
  CFDataRef v6 = (const __CFData *)a3;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  CFErrorRef error = 0;
  id v8 = SecKeyCreateWithData(v6, v7, &error);

  if (!v8)
  {
    CFErrorRef v9 = error;
    v10 = sub_100003338();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "### error generating keys = %@", buf, 0xCu);
    }
  }
  return v8;
}

+ (id)publicKeyFromPrivateKey:(id)a3
{
  id v3 = a3;
  CFErrorRef v4 = (__SecKey *)[(id)objc_opt_class() dataToKey:v3 isPublic:0];

  if (v4)
  {
    SecKeyRef v5 = SecKeyCopyPublicKey(v4);
    CFDataRef v6 = [(id)objc_opt_class() keyToData:v5];
  }
  else
  {
    CFDataRef v6 = 0;
  }

  return v6;
}

@end