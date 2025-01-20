@interface EDPUtilities
+ (id)createSignature:(id)a3 withCertChain:(id)a4 withTime:(id)a5 withRemoteHandler:(id)a6 withError:(id *)a7;
+ (id)getCertificateChain:(__SecIdentity *)a3 withError:(id *)a4;
+ (id)signDigest:(id)a3 algorithm:(unsigned int)a4 identity:(__SecIdentity *)a5 error:(id *)a6;
+ (id)validateSignature:(id)a3 requireTrust:(BOOL)a4 withError:(id *)a5;
@end

@implementation EDPUtilities

+ (id)getCertificateChain:(__SecIdentity *)a3 withError:(id *)a4
{
  SecTrustRef trust = 0;
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(a3, &certificateRef);
  SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
  if (BasicX509)
  {
    Mutable = CFArrayCreateMutable(0, 3, 0);
    CFArraySetValueAtIndex(Mutable, 0, certificateRef);
    OSStatus v7 = SecTrustCreateWithCertificates(Mutable, BasicX509, &trust);
    if (v7)
    {
      if (a4)
      {
        v8 = [MEMORY[0x263F087E8] errorWithDomain:@"Security" code:v7 userInfo:0];
        goto LABEL_13;
      }
    }
    else
    {
      CFErrorRef error = 0;
      if (SecTrustEvaluateWithError(trust, &error))
      {
        CFArrayRef v9 = SecTrustCopyCertificateChain(trust);
        if (!Mutable) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      if (a4)
      {
        v8 = error;
LABEL_13:
        CFArrayRef v9 = 0;
        *a4 = v8;
        if (!Mutable) {
          goto LABEL_17;
        }
LABEL_16:
        CFRelease(Mutable);
        goto LABEL_17;
      }
    }
    CFArrayRef v9 = 0;
    if (!Mutable) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"Security" code:-67672 userInfo:0];
    CFArrayRef v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFArrayRef v9 = 0;
  }
LABEL_17:
  if (trust) {
    CFRelease(trust);
  }
  if (BasicX509) {
    CFRelease(BasicX509);
  }
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  return v9;
}

+ (id)createSignature:(id)a3 withCertChain:(id)a4 withTime:(id)a5 withRemoteHandler:(id)a6 withError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(void, void *, uint64_t))a6;
  v15 = [v12 objectAtIndexedSubscript:0];

  id v48 = 0;
  v16 = (void *)[objc_alloc(MEMORY[0x263F556B0]) initWithCertificate:v15 signatureAlgorithm:0 error:&v48];
  id v17 = v48;
  id v18 = v17;
  if (!v16)
  {
    if (!a7)
    {
      v32 = 0;
      goto LABEL_39;
    }
    goto LABEL_14;
  }
  id v47 = v17;
  v19 = (void *)[objc_alloc(MEMORY[0x263F556A8]) initWithDataContent:v11 isDetached:0 signer:v16 additionalCertificates:v12 error:&v47];
  id v20 = v47;

  if (!v19)
  {
    if (!a7)
    {
      v32 = 0;
      id v18 = v20;
      goto LABEL_39;
    }
    id v17 = v20;
LABEL_14:
    id v18 = v17;
    v32 = 0;
    *a7 = v18;
    goto LABEL_39;
  }
  v42 = (void *)[objc_alloc(MEMORY[0x263F556A0]) initWithEmbeddedContent:v19];
  uint64_t v41 = [objc_alloc(MEMORY[0x263F556B8]) initWithSigningTime:v13];
  objc_msgSend(v16, "addProtectedAttribute:");
  id v46 = v20;
  uint64_t v21 = [v16 calculateSignerInfoDigest:&v46];
  id v18 = v46;

  v43 = (void *)v21;
  if (v21)
  {
    v22 = (void *)MEMORY[0x263F55698];
    v23 = [v16 signatureAlgorithm];
    id v45 = v18;
    v24 = [v22 digestAlgorithmWithSignatureAlgorithm:v23 error:&v45];
    id v40 = v45;

    if (v24)
    {
      v39 = v14;
      v25 = [v24 algorithm];
      v26 = [v25 OIDString];
      uint64_t v27 = mapDigestAlgorithm(v26);

      if (v27)
      {
        v28 = v39[2](v39, v43, v27);
        v29 = v28;
        v38 = v28;
        if (v28
          && ([v28 signature], v30 = objc_claimAutoreleasedReturnValue(), v30, v30))
        {
          v31 = [v29 signature];
          [v16 setSignature:v31];

          id v44 = v40;
          v32 = [v42 encodeMessageSecurityObject:&v44];
          id v18 = v44;

          if (v32)
          {
            id v33 = v32;
          }
          else if (a7 && v18)
          {
            *a7 = v18;
          }
        }
        else if (a7 {
               && ([v29 error], v35 = objc_claimAutoreleasedReturnValue(), v35, v35))
        }
        {
          id v18 = v40;
          v32 = 0;
          *a7 = v18;
        }
        else
        {
          v32 = 0;
          id v18 = v40;
        }
        v14 = v39;
        v36 = (void *)v41;

        goto LABEL_38;
      }
      v14 = v39;
      if (a7)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"Security" code:-67747 userInfo:0];
        v32 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
        id v18 = v40;
        v36 = (void *)v41;
        goto LABEL_38;
      }
LABEL_31:
      v32 = 0;
      goto LABEL_32;
    }
    if (!a7)
    {
      v24 = 0;
      goto LABEL_31;
    }
    v34 = v40;
  }
  else
  {
    if (!a7)
    {
      v24 = 0;
      v32 = 0;
      goto LABEL_28;
    }
    v34 = v18;
  }
  id v18 = v34;
  v24 = 0;
  v32 = 0;
  *a7 = v18;
LABEL_28:
  v36 = (void *)v41;
LABEL_38:

LABEL_39:
  return v32;
}

+ (id)signDigest:(id)a3 algorithm:(unsigned int)a4 identity:(__SecIdentity *)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  CFDataRef v9 = (const __CFData *)a3;
  SecKeyRef privateKeyRef = 0;
  SecIdentityCopyPrivateKey(a5, &privateKeyRef);
  CFStringRef v10 = (const __CFString *)pickKeyAlgorithm(privateKeyRef, v8, a6);
  if (!v10)
  {
LABEL_6:
    CFDataRef Signature = 0;
    goto LABEL_7;
  }
  id v13 = 0;
  CFDataRef Signature = SecKeyCreateSignature(privateKeyRef, v10, v9, (CFErrorRef *)&v13);
  if (!Signature || v13)
  {
    if (a6)
    {
      CFDataRef Signature = 0;
      *a6 = v13;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }

  return Signature;
}

+ (id)validateSignature:(id)a3 requireTrust:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263F556C0]);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 1, 0);
  if (!Mutable)
  {
    if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"Security" code:-67672 userInfo:0];
      id v20 = 0;
      id v14 = 0;
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = 0;
      id v14 = 0;
      id v12 = 0;
    }
    goto LABEL_34;
  }
  CFStringRef v10 = Mutable;
  EDPSigning = (const void *)SecPolicyCreateEDPSigning();
  if (EDPSigning)
  {
    CFArrayAppendValue(v10, EDPSigning);
    [v8 setVerifySignatures:1];
    [v8 setVerifySigners:1];
    [v8 setSignerPolicies:v10];
    id v33 = 0;
    id v12 = [MEMORY[0x263F556A0] decodeMessageSecurityObject:v7 options:v8 error:&v33];
    id v13 = v33;
    id v14 = v13;
    if (v12) {
      int v15 = 1;
    }
    else {
      int v15 = v6;
    }
    unsigned int v31 = v15;
    if (v15)
    {
      if (v12) {
        goto LABEL_8;
      }
    }
    else
    {
      v22 = [v13 domain];
      if ([v22 isEqualToString:@"MSErrorTrustDomain"])
      {
        uint64_t v23 = [v14 code];

        if (v23 == -67808)
        {
          [v8 setVerifySigners:0];
          [v8 setSignerPolicies:0];

          id v32 = 0;
          id v12 = [MEMORY[0x263F556A0] decodeMessageSecurityObject:v7 options:v8 error:&v32];
          id v14 = v32;
          if (v12)
          {
LABEL_8:
            v16 = [v12 embeddedContent];
            id v17 = [v16 signers];
            v30 = [v17 firstObject];

            v28 = v16;
            if (v30)
            {
              id v18 = (__SecTrust *)[v30 createTrustObjectWithPolicies:0 error:0];
              v19 = v18;
              if (v18)
              {
                CFArrayRef v29 = SecTrustCopyCertificateChain(v18);
LABEL_29:
                id v20 = objc_opt_new();
                v24 = [(__CFArray *)v29 reverseObjectEnumerator];
                v25 = [v24 allObjects];
                [v20 setCertificateChain:v25];

                v26 = [v28 dataContent];
                [v20 setValidatedData:v26];

                [v20 setIsTrusted:v31];
                goto LABEL_30;
              }
            }
            else
            {
              v19 = 0;
            }
            CFArrayRef v29 = 0;
            goto LABEL_29;
          }
        }
      }
      else
      {
      }
    }
    if (a5)
    {
      id v21 = v14;
      id v14 = v21;
      v19 = 0;
      id v12 = 0;
      goto LABEL_23;
    }
    v19 = 0;
    id v12 = 0;
LABEL_26:
    id v20 = 0;
    goto LABEL_30;
  }
  if (!a5)
  {
    v19 = 0;
    id v12 = 0;
    id v14 = 0;
    goto LABEL_26;
  }
  id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"Security" code:-25241 userInfo:0];
  v19 = 0;
  id v12 = 0;
  id v14 = 0;
LABEL_23:
  id v20 = 0;
  *a5 = v21;
LABEL_30:
  CFRelease(v10);
  if (EDPSigning) {
    CFRelease(EDPSigning);
  }
  if (v19) {
    CFRelease(v19);
  }
LABEL_34:

  return v20;
}

@end