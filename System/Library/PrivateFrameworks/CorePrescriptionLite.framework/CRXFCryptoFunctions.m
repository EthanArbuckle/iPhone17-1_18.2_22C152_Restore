@interface CRXFCryptoFunctions
+ (BOOL)cryptFromText:(id)a3 withPassword:(id)a4 toText:(id *)a5 encrypt:(BOOL)a6 error:(id *)a7;
+ (BOOL)decryptText:(id)a3 withPassword:(id)a4 toString:(id *)a5 error:(id *)a6;
+ (BOOL)encryptText:(id)a3 withPassword:(id)a4 toString:(id *)a5 error:(id *)a6;
@end

@implementation CRXFCryptoFunctions

+ (BOOL)cryptFromText:(id)a3 withPassword:(id)a4 toText:(id *)a5 encrypt:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  bytes[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v52 = a4;
  if (v8)
  {
    v12 = [v11 dataUsingEncoding:4];
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v11 options:0];
  }
  v13 = v12;
  if (!v12)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = MEMORY[0x263EFFA78];
    uint64_t v20 = 34;
    goto LABEL_11;
  }
  id v14 = v12;
  v15 = (uint64_t *)[v14 bytes];
  unint64_t v16 = [v14 length];
  size_t v17 = v16;
  if (!v8)
  {
    if (v16 <= 7)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = MEMORY[0x263EFFA78];
      uint64_t v20 = 53;
      goto LABEL_11;
    }
    uint64_t v22 = *v15++;
    bytes[0] = v22;
    size_t v17 = v16 - 8;
LABEL_13:
    __s = (char *)[v52 UTF8String];
    v23 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:16];
    v24 = [MEMORY[0x263EFF990] dataWithLength:16];
    v25 = v24;
    if (v8)
    {
      v46 = a5;
      v26 = v23;
      v27 = (const __SecRandom *)*MEMORY[0x263F17510];
      size_t v28 = [v24 length];
      v29 = (void *)[v25 mutableBytes];
      v30 = v27;
      v23 = v26;
      if (SecRandomCopyBytes(v30, v28, v29))
      {
        v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = MEMORY[0x263EFFA78];
        uint64_t v33 = 70;
LABEL_18:
        objc_msgSend(v31, "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", v33, v32);
        BOOL v21 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      if (v17 <= 0xF)
      {
        v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = MEMORY[0x263EFFA78];
        uint64_t v33 = 76;
        goto LABEL_18;
      }
      v46 = a5;
      v34 = (_OWORD *)[v24 mutableBytes];
      long long v35 = *(_OWORD *)v15;
      v15 += 2;
      _OWORD *v34 = v35;
      v17 -= 16;
    }
    size_t passwordLena = strlen(__s);
    v49 = v23;
    id v36 = v23;
    if (CCKeyDerivationPBKDF(2u, __s, passwordLena, (const uint8_t *)bytes, 8uLL, 1u, 0x2710u, (uint8_t *)[v36 mutableBytes], objc_msgSend(v36, "length")))
    {
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", 102, MEMORY[0x263EFFA78]);
      BOOL v21 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = v36;
      __sa = v25;
      id passwordLen = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v17 + 40];
      uint64_t v38 = [passwordLen mutableBytes];
      v39 = (char *)v38;
      if (v8)
      {
        *(void *)uint64_t v38 = bytes[0];
        v40 = __sa;
        *(_OWORD *)(v38 + 8) = *(_OWORD *)[__sa bytes];
        v39 += 24;
      }
      else
      {
        v40 = __sa;
      }
      size_t v53 = 0;
      id v41 = v37;
      if (CCCrypt(!v8, 0, 1u, (const void *)[v41 bytes], objc_msgSend(v41, "length"), (const void *)objc_msgSend(v40, "bytes"), v15, v17, v39, v17 + 16, &v53))
      {
        objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", 132, MEMORY[0x263EFFA78]);
        BOOL v21 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v49;
        v25 = __sa;
        v42 = passwordLen;
      }
      else
      {
        v23 = v49;
        if (v8)
        {
          v42 = passwordLen;
          [passwordLen setLength:v53 + 24];
          v43 = [passwordLen base64EncodedStringWithOptions:0];
        }
        else
        {
          v42 = passwordLen;
          [passwordLen setLength:v53];
          v43 = (void *)[[NSString alloc] initWithData:passwordLen encoding:4];
        }
        v25 = __sa;
        id v44 = v43;
        id *v46 = v44;
        BOOL v21 = v44 != 0;
      }
    }
    goto LABEL_32;
  }
  if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 8uLL, bytes)) {
    goto LABEL_13;
  }
  v18 = (void *)MEMORY[0x263F087E8];
  uint64_t v19 = MEMORY[0x263EFFA78];
  uint64_t v20 = 47;
LABEL_11:
  objc_msgSend(v18, "crxf_errorWithCode:file:line:userInfo:", 26, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCryptoFunctions.m", v20, v19);
  BOOL v21 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v21;
}

+ (BOOL)encryptText:(id)a3 withPassword:(id)a4 toString:(id *)a5 error:(id *)a6
{
  return [a1 cryptFromText:a3 withPassword:a4 toText:a5 encrypt:1 error:a6];
}

+ (BOOL)decryptText:(id)a3 withPassword:(id)a4 toString:(id *)a5 error:(id *)a6
{
  return [a1 cryptFromText:a3 withPassword:a4 toText:a5 encrypt:0 error:a6];
}

@end