@interface CLEEDCryptoUtilities
+ (__SecCertificate)copyCertFromBase64String:(id)a3;
+ (__SecKey)copyPublicKeyFromPrivateKey:(__SecKey *)a3;
+ (__SecKey)createKeyFromExternalRepresentationData:(id)a3 keyClass:(id)a4;
+ (__SecKey)createKeyFromExternalRepresentationString:(id)a3 keyClass:(id)a4;
+ (__SecKey)createRandomP256PrivateKey;
+ (id)copyAdrPublicKeyData:(id)a3;
+ (id)createKeyExternalRepresentation:(__SecKey *)a3;
+ (id)getAESGCMDecryptedData:(id)a3 key:(id)a4 iv:(id)a5 authTag:(id)a6;
+ (id)getDerivedKeyWithLength:(int)a3 secretData:(id)a4 additionalInfo:(id)a5;
+ (id)getECIESDecryptedData:(id)a3 key:(__SecKey *)a4 sharedInfo:(id)a5;
+ (id)getECIESEncryptedData:(id)a3 key:(__SecKey *)a4 sharedInfo:(id)a5 prependKeyFingerprint:(BOOL)a6;
+ (id)getGMACWithAuthData:(id)a3 key:(id)a4 iv:(id)a5;
+ (id)getKeyExternalRepresentation:(__SecKey *)a3;
+ (id)getKeyFingerprint:(__SecKey *)a3;
+ (id)getKeyFingerprintWithKeyData:(id)a3;
+ (id)getRandomBytes:(int)a3;
+ (id)getSessionIDWithPhoneNumber:(id)a3 sessionStartTime:(int64_t)a4;
@end

@implementation CLEEDCryptoUtilities

+ (__SecKey)createRandomP256PrivateKey
{
  v31[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3B740];
  uint64_t v3 = *MEMORY[0x1E4F3B708];
  v30[0] = *MEMORY[0x1E4F3B718];
  v30[1] = v3;
  v31[0] = v2;
  v31[1] = &unk_1EE023890;
  CFErrorRef error = 0;
  result = SecKeyCreateRandomKey((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2], &error);
  if (error)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    v5 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [(__CFError *)error code];
      uint64_t v7 = objc_msgSend((id)-[__CFError domain](error, "domain"), "UTF8String");
      uint64_t v8 = objc_msgSend((id)-[__CFError localizedDescription](error, "localizedDescription"), "UTF8String");
      *(_DWORD *)buf = 136446978;
      v23 = "+[CLEEDCryptoUtilities createRandomP256PrivateKey]";
      __int16 v24 = 2048;
      uint64_t v25 = v6;
      __int16 v26 = 2080;
      uint64_t v27 = v7;
      __int16 v28 = 2080;
      uint64_t v29 = v8;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create random P-256 private key,error code,%ld,domain,%s,reason,%s\n", buf, 0x2Au);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
      }
      uint64_t v9 = [(__CFError *)error code];
      uint64_t v10 = objc_msgSend((id)-[__CFError domain](error, "domain"), "UTF8String");
      uint64_t v11 = objc_msgSend((id)-[__CFError localizedDescription](error, "localizedDescription"), "UTF8String");
      int v14 = 136446978;
      v15 = "+[CLEEDCryptoUtilities createRandomP256PrivateKey]";
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      uint64_t v19 = v10;
      __int16 v20 = 2080;
      uint64_t v21 = v11;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createRandomP256PrivateKey]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    return 0;
  }
  return result;
}

+ (id)getRandomBytes:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  size_t v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:a3];
  int v6 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v4, (void *)[v5 mutableBytes]);
  if (v6)
  {
    int v7 = v6;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v8 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v12 = "+[CLEEDCryptoUtilities getRandomBytes:]";
      __int16 v13 = 1024;
      int v14 = a3;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create %d random bytes with error code %d\n", buf, 0x18u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
      }
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getRandomBytes:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    return 0;
  }
  return v5;
}

+ (id)getSessionIDWithPhoneNumber:(id)a3 sessionStartTime:(int64_t)a4
{
  int64_t v7 = a4;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(a3, "length") + 8);
  objc_msgSend(v5, "appendData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
  [v5 appendBytes:&v7 length:8];
  return v5;
}

+ (__SecCertificate)copyCertFromBase64String:(id)a3
{
  CFDataRef v3 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:a3 options:0];
  CFDataRef v4 = v3;
  if (v3 && [(__CFData *)v3 length])
  {
    v5 = SecCertificateCreateWithData(0, v4);

    return v5;
  }
  else
  {

    return 0;
  }
}

+ (id)getECIESDecryptedData:(id)a3 key:(__SecKey *)a4 sharedInfo:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 && a5)
  {
    uint64_t v10 = *MEMORY[0x1E4F3BB50];
    id v11 = a5;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    DecryptedDataWithParameters = (void *)SecKeyCreateDecryptedDataWithParameters();
    id v6 = DecryptedDataWithParameters;
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int64_t v7 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v13 = "+[CLEEDCryptoUtilities getECIESDecryptedData:key:sharedInfo:]";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
      }
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getECIESDecryptedData:key:sharedInfo:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    return 0;
  }
  return DecryptedDataWithParameters;
}

+ (__SecKey)copyPublicKeyFromPrivateKey:(__SecKey *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    v5 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = "+[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:]";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil privateKey,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  result = SecKeyCopyPublicKey(a3);
  if (result) {
    return result;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
  }
  CFDataRef v4 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = "+[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:]";
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to copy public key from private key\n", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_18:
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
      return 0;
    }
LABEL_20:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    goto LABEL_18;
  }
  return 0;
}

+ (id)createKeyExternalRepresentation:(__SecKey *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    v12 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v23 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v14 = 136446210;
    __int16 v15 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
    id v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]", "CoreLocation: %s\n", v11);
    if (v11 == (char *)buf) {
      return 0;
    }
    goto LABEL_22;
  }
  CFErrorRef error = 0;
  id result = SecKeyCopyExternalRepresentation(a3, &error);
  if (!error) {
    return result;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
  }
  CFDataRef v4 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    int v5 = [(__CFError *)error code];
    uint64_t v6 = objc_msgSend((id)-[__CFError domain](error, "domain"), "UTF8String");
    uint64_t v7 = objc_msgSend((id)-[__CFError localizedDescription](error, "localizedDescription"), "UTF8String");
    *(_DWORD *)buf = 136446978;
    v23 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
    __int16 v24 = 1024;
    int v25 = v5;
    __int16 v26 = 2080;
    uint64_t v27 = v6;
    __int16 v28 = 2080;
    uint64_t v29 = v7;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to produce external representation for key,error code,%d,domain,%s,reason,%s\n", buf, 0x26u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v8 = [(__CFError *)error code];
    uint64_t v9 = objc_msgSend((id)-[__CFError domain](error, "domain"), "UTF8String");
    uint64_t v10 = objc_msgSend((id)-[__CFError localizedDescription](error, "localizedDescription"), "UTF8String");
    int v14 = 136446978;
    __int16 v15 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 2080;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    uint64_t v21 = v10;
    id v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
LABEL_22:
    }
      free(v11);
  }
  return 0;
}

+ (id)getKeyExternalRepresentation:(__SecKey *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v7 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v11 = "+[CLEEDCryptoUtilities getKeyExternalRepresentation:]";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_18;
    }
LABEL_20:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
LABEL_18:
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getKeyExternalRepresentation:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
    return 0;
  }
  id v3 = +[CLEEDCryptoUtilities createKeyExternalRepresentation:](CLEEDCryptoUtilities, "createKeyExternalRepresentation:");
  if (v3)
  {
    CFDataRef v4 = v3;
    int v5 = (void *)[v3 base64EncodedStringWithOptions:0];

    return v5;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
  }
  int v8 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "+[CLEEDCryptoUtilities getKeyExternalRepresentation:]";
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil extRep,early return", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  return 0;
}

+ (__SecKey)createKeyFromExternalRepresentationData:(id)a3 keyClass:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    __int16 v15 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v28 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v17 = 136446210;
    __int16 v18 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
    int v14 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]", "CoreLocation: %s\n", v14);
    if (v14 == (char *)buf) {
      return 0;
    }
    goto LABEL_23;
  }
  uint64_t v4 = *MEMORY[0x1E4F3B740];
  uint64_t v5 = *MEMORY[0x1E4F3B6D8];
  v25[0] = *MEMORY[0x1E4F3B718];
  v25[1] = v5;
  v26[0] = v4;
  v26[1] = a4;
  CFErrorRef error = 0;
  id result = SecKeyCreateWithData((CFDataRef)a3, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2], &error);
  if (!error) {
    return result;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
  }
  uint64_t v7 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    int v8 = [(__CFError *)error code];
    uint64_t v9 = objc_msgSend((id)-[__CFError domain](error, "domain"), "UTF8String");
    uint64_t v10 = objc_msgSend((id)-[__CFError localizedDescription](error, "localizedDescription"), "UTF8String");
    *(_DWORD *)buf = 136446978;
    __int16 v28 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
    __int16 v29 = 1024;
    int v30 = v8;
    __int16 v31 = 2080;
    uint64_t v32 = v9;
    __int16 v33 = 2080;
    uint64_t v34 = v10;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create key from external representation,error code,%d,domain,%s,reason,%s\n", buf, 0x26u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v11 = [(__CFError *)error code];
    uint64_t v12 = objc_msgSend((id)-[__CFError domain](error, "domain"), "UTF8String");
    uint64_t v13 = objc_msgSend((id)-[__CFError localizedDescription](error, "localizedDescription"), "UTF8String");
    int v17 = 136446978;
    __int16 v18 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
    __int16 v19 = 1024;
    int v20 = v11;
    __int16 v21 = 2080;
    uint64_t v22 = v12;
    __int16 v23 = 2080;
    uint64_t v24 = v13;
    int v14 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf) {
LABEL_23:
    }
      free(v14);
  }
  return 0;
}

+ (__SecKey)createKeyFromExternalRepresentationString:(id)a3 keyClass:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v8 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationString:keyClass:]";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:a3 options:0];
  uint64_t v6 = +[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:v5 keyClass:a4];

  if (!v6)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v7 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationString:keyClass:]";
      _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_19:
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationString:keyClass:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
      return 0;
    }
LABEL_21:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    goto LABEL_19;
  }
  return v6;
}

+ (id)copyAdrPublicKeyData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v9 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v20 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil adrCert,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v17 = 136446210;
    __int16 v18 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
LABEL_27:
    int v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
    return 0;
  }
  id v3 = +[CLEEDCryptoUtilities copyCertFromBase64String:](CLEEDCryptoUtilities, "copyCertFromBase64String:");
  if (!v3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v10 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v20 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil cert obtained from copyCertFromBase64String,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v17 = 136446210;
    __int16 v18 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
    goto LABEL_27;
  }
  uint64_t v4 = v3;
  uint64_t v5 = SecCertificateCopyKey(v3);
  if (!v5)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v12 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v20 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil publicKey obtained from SecCertificateCopyKey,early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
      }
      int v17 = 136446210;
      __int16 v18 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      int v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    CFRelease(v4);
    return 0;
  }
  uint64_t v6 = v5;
  CFErrorRef error = 0;
  CFDataRef v7 = SecKeyCopyExternalRepresentation(v5, &error);
  if (!v7)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v8 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v20 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil adrPublicKeyData obtained from SecKeyCopyExternalRepresentation,early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
      }
      int v17 = 136446210;
      __int16 v18 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      __int16 v15 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
  CFRelease(v4);
  CFRelease(v6);
  return v7;
}

+ (id)getKeyFingerprintWithKeyData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:32];
    CC_SHA256((const void *)[a3 bytes], objc_msgSend(a3, "length"), (unsigned __int8 *)objc_msgSend(v4, "mutableBytes"));
    return (id)objc_msgSend(v4, "subdataWithRange:", 0, 2);
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v6 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v9 = "+[CLEEDCryptoUtilities getKeyFingerprintWithKeyData:]";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil keyData,early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
      }
      CFDataRef v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getKeyFingerprintWithKeyData:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    return 0;
  }
}

+ (id)getKeyFingerprint:(__SecKey *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v5 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = "+[CLEEDCryptoUtilities getKeyFingerprint:]";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  id v3 = +[CLEEDCryptoUtilities createKeyExternalRepresentation:](CLEEDCryptoUtilities, "createKeyExternalRepresentation:");
  if (!v3)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v6 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v10 = "+[CLEEDCryptoUtilities getKeyFingerprint:]";
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil keyData,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_20:
      CFDataRef v7 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getKeyFingerprint:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
      return 0;
    }
LABEL_22:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    goto LABEL_20;
  }
  id v4 = v3;

  return (id)MEMORY[0x1F4181798](CLEEDCryptoUtilities, sel_getKeyFingerprintWithKeyData_);
}

+ (id)getDerivedKeyWithLength:(int)a3 secretData:(id)a4 additionalInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a4 || !a5)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v11 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v18 = "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]";
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  [a5 bytes];
  [a5 length];
  int AnsiX963 = CCKDFParametersCreateAnsiX963();
  if (AnsiX963)
  {
    int v9 = AnsiX963;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v10 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v18 = "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]";
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create ANSI X9.63 KDF params,result,%d\n", buf, 0x12u);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:a3];
  [a4 bytes];
  [a4 length];
  [v12 mutableBytes];
  [v12 length];
  int v14 = CCDeriveKey();
  CCKDFParametersDestroy();
  if (!v14) {
    return v12;
  }
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
  }
  __int16 v15 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]";
    __int16 v19 = 1024;
    int v20 = v14;
    _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to derive key,result,%d\n", buf, 0x12u);
  }
  if (sub_1906CB57C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_27:
      __int16 v16 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
      return 0;
    }
LABEL_29:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    goto LABEL_27;
  }
  return 0;
}

+ (id)getGMACWithAuthData:(id)a3 key:(id)a4 iv:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v12 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v16 = "+[CLEEDCryptoUtilities getGMACWithAuthData:key:iv:]";
      _os_log_impl(&dword_1906B8000, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  int v8 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:16];
  [a4 bytes];
  [a4 length];
  [a5 bytes];
  [a5 length];
  [a3 bytes];
  [a3 length];
  [v8 mutableBytes];
  [v8 length];
  int v9 = CCCryptorGCMOneshotEncrypt();
  if (v9)
  {
    int v10 = v9;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v11 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v16 = "+[CLEEDCryptoUtilities getGMACWithAuthData:key:iv:]";
      __int16 v17 = 1024;
      int v18 = v10;
      _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to compute GMAC,error,%d\n", buf, 0x12u);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_20:
      int v14 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getGMACWithAuthData:key:iv:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
      return 0;
    }
LABEL_22:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    goto LABEL_20;
  }
  return v8;
}

+ (id)getAESGCMDecryptedData:(id)a3 key:(id)a4 iv:(id)a5 authTag:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5 || !a6)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v14 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v18 = "+[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:]";
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  int v10 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", objc_msgSend(a3, "length"));
  [a4 bytes];
  [a4 length];
  [a5 bytes];
  [a5 length];
  [a3 bytes];
  [a3 length];
  [v10 mutableBytes];
  [a6 bytes];
  [a6 length];
  int v11 = CCCryptorGCMOneshotDecrypt();
  if (v11)
  {
    int v12 = v11;
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    uint64_t v13 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v18 = "+[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:]";
      __int16 v19 = 1024;
      int v20 = v12;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to decrypt data,error,%d\n", buf, 0x12u);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 == -1)
    {
LABEL_21:
      __int16 v16 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
      return 0;
    }
LABEL_23:
    dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    goto LABEL_21;
  }
  return v10;
}

+ (id)getECIESEncryptedData:(id)a3 key:(__SecKey *)a4 sharedInfo:(id)a5 prependKeyFingerprint:(BOOL)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    int v10 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v20 = "+[CLEEDCryptoUtilities getECIESEncryptedData:key:sharedInfo:prependKeyFingerprint:]";
      _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
LABEL_24:
    __int16 v16 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getECIESEncryptedData:key:sharedInfo:prependKeyFingerprint:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
    return 0;
  }
  BOOL v7 = a6;
  uint64_t v17 = *MEMORY[0x1E4F3BB50];
  id v18 = a5;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  EncryptedDataWithParameters = (void *)SecKeyCreateEncryptedDataWithParameters();
  id v9 = EncryptedDataWithParameters;
  if (v7)
  {
    id v12 = +[CLEEDCryptoUtilities getKeyFingerprint:a4];
    if (v12)
    {
      id v13 = v12;
      int v14 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(EncryptedDataWithParameters, "length") + 2);
      [v14 appendData:v13];
      [v14 appendData:EncryptedDataWithParameters];
      return v14;
    }
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    __int16 v15 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      int v20 = "+[CLEEDCryptoUtilities getECIESEncryptedData:key:sharedInfo:prependKeyFingerprint:]";
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil keyFingerprint,early return", buf, 0xCu);
    }
    if (!sub_1906CB57C(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE0059E0);
    }
    goto LABEL_24;
  }
  return EncryptedDataWithParameters;
}

@end