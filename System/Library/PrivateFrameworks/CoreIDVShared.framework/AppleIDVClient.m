@interface AppleIDVClient
+ (id)prepareUnboundACLForBinding:(__SecAccessControl *)a3 withConstraints:(id)a4;
+ (unsigned)appleIDVAuthorizePresentment:(id)a3 withLAContextData:(id)a4 onSESlot:(int64_t)a5 andPayloadDigest:(id)a6;
+ (unsigned)appleIDVAuthorizePresentment:(id)a3 withLAContextData:(id)a4 onSESlot:(int64_t)a5 andPublicKey:(id)a6;
+ (unsigned)appleIDVCredentialAuthenticationTokenStatus;
+ (unsigned)appleIDVEstablishPrearmTrustWithCertificate:(id)a3 protectedPublicKey:(id *)a4;
+ (unsigned)appleIDVGenerateNonceOnWatch:(id *)a3;
+ (unsigned)appleIDVGeneratePhoneTokenWithNonce:(id)a3 withReferenceACLBlob:(id)a4 keyBlob:(id)a5 keyAttestation:(id)a6 casdCertificate:(id)a7 phoneToken:(id *)a8;
+ (unsigned)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:(id)a3 progenitorPublicKey:(id)a4 encryptedPrivateKey:(id *)a5 attestation:(id *)a6 publicKey:(id *)a7 keyBlob:(id *)a8;
+ (unsigned)appleIDVGetStatus:(int64_t *)a3 andSIDVVersion:(id *)a4 andAppleIDVVersion:(id *)a5;
+ (unsigned)appleIDVGetStatus:(int64_t *)a3 andVersion:(id *)a4;
+ (unsigned)appleIDVPersistACLBlob:(id)a3 intoBlob:(id *)a4 returnBioUUIDs:(id *)a5;
+ (unsigned)appleIDVPersistACLBlob:(id)a3 intoBlob:(id *)a4 returnBioUUIDs:(id *)a5 andRequireDoublePress:(unsigned __int8)a6;
+ (unsigned)appleIDVPersistModifiedACLBlob:(id)a3 withReferenceACLBlob:(id)a4 withLAContextData:(id)a5 intoBlob:(id *)a6 returnBioUUIDs:(id *)a7;
+ (unsigned)appleIDVPersistModifiedSESlot:(int64_t)a3 withReferenceBlob:(id)a4 withLAContextData:(id)a5 intoBlob:(id *)a6;
+ (unsigned)appleIDVPrearmCredentialWithAuthorizationToken:(id)a3 protectedPublicKey:(id)a4;
+ (unsigned)appleIDVRecoverPersistedACLBlob:(id)a3 intoBlob:(id *)a4;
+ (unsigned)appleIDVRevokeCredentialAuthorizationToken;
+ (unsigned)appleIDVUpdatePrearmTrustKeyForWatch:(id)a3 progenitorPublicKey:(id)a4 encryptedPrivateKey:(id *)a5 attestation:(id *)a6 publicKey:(id *)a7 keyBlob:(id *)a8;
+ (unsigned)getUUIDsFromACL:(id)a3 intoArray:(id *)a4;
+ (unsigned)prepareACL:(id *)a3 aclType:(unsigned int)a4 forAclUsage:(unsigned int)a5 forBioUUID:(id)a6;
+ (unsigned)prepareACLForPhoneDecryption:(id *)a3 withSubType:(unsigned int)a4 forBioUUID:(id)a5;
+ (unsigned)prepareACLForWatchDecryption:(id *)a3 withSubType:(unsigned int)a4 forAclUsage:(unsigned int)a5;
+ (unsigned)prepareUnboundACLForBioBinding:(id *)a3;
+ (unsigned)prepareUnboundACLForPasscodeBinding:(id *)a3;
+ (unsigned)prepareUnboundACLForWatch:(id *)a3 withAccessibilityEnabled:(BOOL)a4;
+ (unsigned)requireDoublePressOnACL:(id)a3 intoACL:(id *)a4;
+ (void)appleIDVCredentialAuthenticationTokenStatus;
+ (void)appleIDVRevokeCredentialAuthorizationToken;
@end

@implementation AppleIDVClient

+ (unsigned)requireDoublePressOnACL:(id)a3 intoACL:(id *)a4
{
  id v6 = a3;
  v15 = 0;
  if (a4)
  {
    *a4 = 0;
    uint64_t v7 = SecAccessControlCreateFromData();
    if (v7)
    {
      v8 = (const void *)v7;
      v9 = SecAccessControlGetConstraints();
      id v10 = [v9 mutableCopy];
      v11 = [v9 objectForKeyedSubscript:@"osgn"];
      v12 = (void *)[v11 mutableCopy];

      [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"cbtn"];
      if (v12) {
        [v10 setObject:v12 forKey:@"od"];
      }
      *a4 = [a1 prepareUnboundACLForBinding:v8 withConstraints:v10];
      CFRelease(v8);

      unsigned int v13 = 0;
    }
    else
    {
      v9 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient requireDoublePressOnACL:intoACL:]((uint64_t)v6, &v15);
      }
      unsigned int v13 = 13;
    }
  }
  else
  {
    unsigned int v13 = 5;
  }

  return v13;
}

+ (unsigned)getUUIDsFromACL:(id)a3 intoArray:(id *)a4
{
  id v5 = a3;
  v24 = 0;
  id v6 = objc_opt_new();
  if (a4)
  {
    uint64_t v7 = SecAccessControlCreateFromData();
    if (v7)
    {
      v8 = (const void *)v7;
      v9 = SecAccessControlGetConstraints();
      id v10 = [v9 objectForKey:@"osgn"];
      v11 = [v10 objectForKey:@"cbio"];

      if (v11)
      {
        v12 = [v9 objectForKeyedSubscript:@"osgn"];
        unsigned int v13 = [v12 objectForKeyedSubscript:@"cbio"];
        v14 = [v13 objectForKeyedSubscript:@"pbiou"];

        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = [v15 bytes];
          if ([v15 length])
          {
            unint64_t v17 = 0;
            do
            {
              v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v16 + v17];
              [v6 addObject:v18];

              v17 += 16;
            }
            while ([v15 length] > v17);
          }
          id v19 = v6;

          unsigned int v20 = 0;
          goto LABEL_15;
        }
        unsigned int v20 = 14;
      }
      else
      {
        unsigned int v20 = 0;
      }
      id v22 = v6;
LABEL_15:
      *a4 = v6;
      CFRelease(v8);

      goto LABEL_16;
    }
    v21 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[AppleIDVClient getUUIDsFromACL:intoArray:]((uint64_t)v5, &v24);
    }

    unsigned int v20 = 13;
  }
  else
  {
    unsigned int v20 = 5;
  }
  *a4 = v6;
LABEL_16:

  return v20;
}

+ (unsigned)prepareACL:(id *)a3 aclType:(unsigned int)a4 forAclUsage:(unsigned int)a5 forBioUUID:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = v9;
  switch(a5)
  {
    case 2u:
      if ((v7 - 2) >= 2)
      {
        if (v7 != 1 && (v7 || !v9)) {
          break;
        }
        v12 = a3;
        uint64_t v13 = v7;
        id v14 = v9;
LABEL_14:
        unsigned int v11 = +[AppleIDVClient prepareACLForPhoneDecryption:v12 withSubType:v13 forBioUUID:v14];
LABEL_23:
        unsigned int v15 = v11;
        goto LABEL_24;
      }
      uint64_t v16 = a3;
      uint64_t v17 = v7;
      uint64_t v18 = 2;
LABEL_18:
      unsigned int v11 = +[AppleIDVClient prepareACLForWatchDecryption:v16 withSubType:v17 forAclUsage:v18];
      goto LABEL_23;
    case 1u:
      if ((v7 - 2) >= 2)
      {
        if (v7 > 1) {
          break;
        }
        v12 = a3;
        uint64_t v13 = v7;
        id v14 = 0;
        goto LABEL_14;
      }
      uint64_t v16 = a3;
      uint64_t v17 = v7;
      uint64_t v18 = 1;
      goto LABEL_18;
    case 0u:
      switch((int)v7)
      {
        case 0:
          unsigned int v11 = +[AppleIDVClient prepareUnboundACLForBioBinding:a3];
          goto LABEL_23;
        case 1:
          unsigned int v11 = +[AppleIDVClient prepareUnboundACLForPasscodeBinding:a3];
          goto LABEL_23;
        case 2:
          id v19 = a3;
          uint64_t v20 = 0;
          break;
        case 3:
          id v19 = a3;
          uint64_t v20 = 1;
          break;
        default:
          goto LABEL_15;
      }
      unsigned int v11 = +[AppleIDVClient prepareUnboundACLForWatch:v19 withAccessibilityEnabled:v20];
      goto LABEL_23;
  }
LABEL_15:
  unsigned int v15 = 1;
LABEL_24:

  return v15;
}

+ (unsigned)prepareACLForPhoneDecryption:(id *)a3 withSubType:(unsigned int)a4 forBioUUID:(id)a5
{
  id v7 = a5;
  CFErrorRef error = 0;
  if (a4) {
    SecAccessControlCreateFlags v8 = 16;
  }
  else {
    SecAccessControlCreateFlags v8 = 2;
  }
  SecAccessControlRef v9 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B578], v8, &error);
  if (v9)
  {
    SecAccessControlRef v10 = v9;
    unsigned int v11 = SecAccessControlGetConstraints();
    if (!v11)
    {
      v12 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:]();
      }
      unsigned int v20 = 15;
      goto LABEL_27;
    }
    v12 = v11;
    if (v7)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:@"od"];
      id v14 = (void *)[v13 mutableCopy];

      if (!v14)
      {
        v26 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.4();
        }

        unsigned int v20 = 17;
        goto LABEL_27;
      }
      unsigned int v15 = [v12 objectForKeyedSubscript:@"od"];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"cbio"];

      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v25 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:].cold.5();
        }

        unsigned int v20 = 18;
        goto LABEL_27;
      }
      [v16 setObject:v7 forKey:@"pbiou"];
      [v14 setObject:v16 forKey:@"cbio"];
      id v17 = [v12 mutableCopy];
      [v17 setObject:v14 forKey:@"od"];
      uint64_t v18 = v17;

      v12 = v18;
    }
    else
    {
      uint64_t v16 = 0;
      id v14 = 0;
      uint64_t v18 = 0;
    }
    v21 = v12;
    id v22 = [v12 mutableCopy];

    v23 = [NSNumber numberWithBool:1];
    [v22 setObject:v23 forKey:@"ock"];

    v12 = v22;
    v24 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:]();
    }

    SecAccessControlSetConstraints();
    *a3 = (id)SecAccessControlCopyData();

    unsigned int v20 = 0;
LABEL_27:

    CFRelease(v10);
    goto LABEL_28;
  }
  id v19 = APPLEIDV_LOG_CLIENT();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    +[AppleIDVClient prepareACLForPhoneDecryption:withSubType:forBioUUID:]();
  }

  unsigned int v20 = 13;
LABEL_28:

  return v20;
}

+ (unsigned)prepareACLForWatchDecryption:(id *)a3 withSubType:(unsigned int)a4 forAclUsage:(unsigned int)a5
{
  uint64_t v8 = SecAccessControlCreate();
  if (v8)
  {
    SecAccessControlRef v9 = (const void *)v8;
    if (SecAccessControlSetProtection())
    {
      if (a4 == 2 && a5 == 1 || a4 == 3 && a5 == 1 || a4 == 2 && a5 == 2 || a4 == 3 && a5 == 2)
      {
        uint64_t v13 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:]();
        }

        SecAccessControlSetConstraints();
        unsigned int v11 = 0;
        *a3 = (id)SecAccessControlCopyData();
        goto LABEL_21;
      }
      v12 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:](a5, a4, v12);
      }
    }
    else
    {
      v12 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:].cold.4();
      }
    }

    unsigned int v11 = 13;
LABEL_21:
    CFRelease(v9);
    return v11;
  }
  SecAccessControlRef v10 = APPLEIDV_LOG_CLIENT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[AppleIDVClient prepareACLForWatchDecryption:withSubType:forAclUsage:]();
  }

  return 13;
}

+ (unsigned)prepareUnboundACLForBioBinding:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  id v5 = objc_opt_new();
  SecAccessControlRef v6 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B578], 2uLL, &error);
  if (v6)
  {
    SecAccessControlRef v7 = v6;
    uint64_t v8 = SecAccessControlGetConstraints();
    if (v8)
    {
      SecAccessControlRef v9 = (void *)v8;
      id v25 = 0;
      SecAccessControlRef v10 = [v5 evaluateAccessControl:v7 operation:0 options:0 error:&v25];
      unsigned int v11 = v25;

      if (v10)
      {
        v12 = SecAccessControlGetConstraints();

        uint64_t v13 = [v12 objectForKeyedSubscript:@"od"];
        id v14 = (void *)[v13 mutableCopy];

        if (v14)
        {
          unsigned int v15 = [v12 objectForKeyedSubscript:@"od"];
          uint64_t v16 = [v15 objectForKeyedSubscript:@"cbio"];

          if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            uint64_t v27 = -1;
            uint64_t v28 = -1;
            id v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v27 length:16];
            [v16 setObject:v17 forKey:@"pbiou"];

            [v14 setObject:v16 forKey:@"cbio"];
            uint64_t v18 = (void *)[v12 mutableCopy];
            [v18 setObject:v14 forKey:@"od"];
            SecAccessControlSetConstraints();
            *a3 = [a1 prepareUnboundACLForBinding:v7 withConstraints:v18];

            unsigned int v19 = 0;
          }
          else
          {
            id v22 = APPLEIDV_LOG_CLIENT();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.5();
            }

            unsigned int v19 = 18;
          }
        }
        else
        {
          v23 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            +[AppleIDVClient prepareUnboundACLForBioBinding:].cold.4();
          }

          unsigned int v19 = 17;
        }
      }
      else
      {
        v21 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          +[AppleIDVClient prepareUnboundACLForBioBinding:]();
        }

        unsigned int v19 = 16;
      }
    }
    else
    {
      unsigned int v11 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient prepareUnboundACLForBioBinding:]();
      }
      unsigned int v19 = 15;
    }

    CFRelease(v7);
  }
  else
  {
    unsigned int v20 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[AppleIDVClient prepareUnboundACLForBioBinding:]();
    }

    unsigned int v19 = 13;
  }

  return v19;
}

+ (unsigned)prepareUnboundACLForPasscodeBinding:(id *)a3
{
  CFErrorRef error = 0;
  id v5 = objc_opt_new();
  SecAccessControlRef v6 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E4F3B578], 0x10uLL, &error);
  if (v6)
  {
    SecAccessControlRef v7 = v6;
    uint64_t v8 = SecAccessControlGetConstraints();
    if (v8)
    {
      SecAccessControlRef v9 = (void *)v8;
      id v23 = 0;
      SecAccessControlRef v10 = [v5 evaluateAccessControl:v7 operation:0 options:0 error:&v23];
      unsigned int v11 = v23;

      if (v10)
      {
        v12 = SecAccessControlGetConstraints();

        uint64_t v13 = [v12 objectForKeyedSubscript:@"od"];
        id v14 = (void *)[v13 mutableCopy];

        if (v14)
        {
          unsigned int v15 = [v12 objectForKeyedSubscript:@"od"];
          uint64_t v16 = [v15 objectForKeyedSubscript:@"cup"];

          if (v16)
          {
            *a3 = [a1 prepareUnboundACLForBinding:v7 withConstraints:v12];

            unsigned int v17 = 0;
          }
          else
          {
            v21 = APPLEIDV_LOG_CLIENT();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.5();
            }

            unsigned int v17 = 19;
          }
        }
        else
        {
          unsigned int v20 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[AppleIDVClient prepareUnboundACLForPasscodeBinding:].cold.4();
          }

          unsigned int v17 = 17;
        }
      }
      else
      {
        unsigned int v19 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[AppleIDVClient prepareUnboundACLForPasscodeBinding:]();
        }

        unsigned int v17 = 16;
      }
    }
    else
    {
      unsigned int v11 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient prepareUnboundACLForPasscodeBinding:]();
      }
      unsigned int v17 = 15;
    }

    CFRelease(v7);
  }
  else
  {
    uint64_t v18 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[AppleIDVClient prepareUnboundACLForPasscodeBinding:]();
    }

    unsigned int v17 = 13;
  }

  return v17;
}

+ (id)prepareUnboundACLForBinding:(__SecAccessControl *)a3 withConstraints:(id)a4
{
  id v4 = a4;
  id v5 = (void *)[v4 mutableCopy];
  SecAccessControlRef v6 = [v4 objectForKeyedSubscript:@"od"];

  SecAccessControlRef v7 = (void *)[v6 mutableCopy];
  [v5 setObject:v7 forKey:@"osgn"];
  [v5 removeObjectForKey:@"od"];
  [v5 removeObjectForKey:@"oe"];
  [v5 removeObjectForKey:@"odel"];
  SecAccessControlSetConstraints();
  uint64_t v8 = (void *)SecAccessControlCopyData();

  return v8;
}

+ (unsigned)appleIDVGetStatus:(int64_t *)a3 andVersion:(id *)a4
{
  if (a4)
  {
    id v11 = 0;
    id v12 = 0;
    unsigned int v5 = +[AppleIDVClient appleIDVGetStatus:a3 andSIDVVersion:&v12 andAppleIDVVersion:&v11];
    id v6 = v12;
    id v7 = v11;
    if (!v5)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v6, "length") + objc_msgSend(v7, "length") + 3);
      [v8 appendData:v6];
      SecAccessControlRef v9 = [@" - " dataUsingEncoding:4];
      [v8 appendData:v9];

      [v8 appendData:v7];
      *a4 = [MEMORY[0x1E4F1C9B8] dataWithData:v8];

      unsigned int v5 = 0;
    }
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
    unsigned int v5 = 5;
  }

  return v5;
}

+ (unsigned)appleIDVGetStatus:(int64_t *)a3 andSIDVVersion:(id *)a4 andAppleIDVVersion:(id *)a5
{
  uint64_t v8 = DIV_LOG_KEXT();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  SecAccessControlRef v10 = DIV_LOG_KEXT();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "appleIDV.getStatus", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v12 = 5;
  if (a3 && a4 && a5)
  {
    size_t v25 = 256;
    uint64_t v13 = (unsigned __int8 *)malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
    if (v13)
    {
      id v14 = v13;
      int v15 = GenericAppleIDVCall(0, 0, 0, v13, &v25);
      uint64_t v16 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[AppleIDVClient appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:]();
      }

      if (!v15)
      {
        if (v25 < 4 || (uint64_t v17 = *v14, v17 + 1 >= v25) || v17 + 2 >= v25)
        {
          int v15 = 5;
        }
        else
        {
          uint64_t v18 = v17 + 6;
          int v15 = 5;
          if (v17 + 6 < v25 && (unint64_t)v14[v17 + 1] - 4 + v18 <= v25)
          {
            *a3 = *(unsigned int *)&v14[v17 + 2];
            objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v14[v18]);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 + 1 length:v17];
            int v15 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      free(v14);
    }
    else
    {
      int v15 = 9;
    }
    unsigned int v19 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:]();
    }

    if (v15)
    {
      if (v15 == -536870208) {
        unsigned int v12 = 11;
      }
      else {
        unsigned int v12 = v15;
      }
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  unsigned int v20 = DIV_LOG_KEXT();
  v21 = v20;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)id v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v21, OS_SIGNPOST_INTERVAL_END, v9, "appleIDV.getStatus", "", v23, 2u);
  }

  return v12;
}

+ (unsigned)appleIDVAuthorizePresentment:(id)a3 withLAContextData:(id)a4 onSESlot:(int64_t)a5 andPayloadDigest:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  *(_OWORD *)v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned int v12 = DIV_LOG_KEXT();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = DIV_LOG_KEXT();
  int v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "appleIDV.authorizePresentment", "enableTelemetry=YES", v26, 2u);
  }

  if (v9)
  {
    id v16 = v9;
    *(void *)&long long v27 = [v16 bytes];
    uint64_t v17 = [v16 length];
    v30[0] = 0;
    v30[1] = 0;
    *((void *)&v27 + 1) = v17;
    uint64_t v18 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:]((uint64_t)v16, v18);
    }

    id v19 = v10;
    *((void *)&v28 + 1) = [v19 bytes];
    *(void *)&long long v29 = [v19 length];
    if ((unint64_t)v29 >> 31)
    {
      unsigned int v21 = 10;
    }
    else
    {
      *((void *)&v29 + 1) = a5;
      unsigned int v20 = buildMetadataBuffer(&v27, v11, 1);
      if (v20)
      {
        unsigned int v21 = v20;
      }
      else
      {
        unsigned int v21 = AuthorizePresentmentFromAppleIDV(&v27);
        id v22 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:]();
        }

        if (v21 == -536870208) {
          unsigned int v21 = 11;
        }
      }
    }
  }
  else
  {
    unsigned int v21 = 5;
  }
  id v23 = DIV_LOG_KEXT();
  v24 = v23;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v24, OS_SIGNPOST_INTERVAL_END, v13, "appleIDV.authorizePresentment", "", v26, 2u);
  }

  if (v30[0]) {
    free(v30[0]);
  }

  return v21;
}

+ (unsigned)appleIDVAuthorizePresentment:(id)a3 withLAContextData:(id)a4 onSESlot:(int64_t)a5 andPublicKey:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  *(_OWORD *)long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unsigned int v12 = DIV_LOG_KEXT();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = DIV_LOG_KEXT();
  int v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)long long v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "appleIDV.authorizePresentment", "enableTelemetry=YES", v27, 2u);
  }

  if (v9)
  {
    id v16 = v9;
    *(void *)&long long v28 = [v16 bytes];
    uint64_t v17 = [v16 length];
    v31[0] = 0;
    v31[1] = 0;
    *((void *)&v28 + 1) = v17;
    uint64_t v18 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:]((uint64_t)v16, v18);
    }

    id v19 = v10;
    *((void *)&v29 + 1) = [v19 bytes];
    *(void *)&long long v30 = [v19 length];
    if ((unint64_t)v30 >> 31)
    {
      unsigned int v23 = 10;
    }
    else
    {
      unsigned int v20 = buildMetadataBuffer(&v28, v11, 2);
      if (v20)
      {
        unsigned int v23 = v20;
      }
      else
      {
        *((void *)&v30 + 1) = a5;
        unsigned int v21 = AuthorizePresentmentFromAppleIDV(&v28);
        id v22 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          +[AppleIDVClient appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPublicKey:]();
        }

        if (v21)
        {
          if (v21 == -536870208) {
            unsigned int v23 = 11;
          }
          else {
            unsigned int v23 = v21;
          }
        }
        else
        {
          unsigned int v23 = 0;
        }
      }
    }
  }
  else
  {
    unsigned int v23 = 5;
  }
  v24 = DIV_LOG_KEXT();
  size_t v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)long long v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v25, OS_SIGNPOST_INTERVAL_END, v13, "appleIDV.authorizePresentment", "", v27, 2u);
  }

  if (v31[0]) {
    free(v31[0]);
  }

  return v23;
}

+ (unsigned)appleIDVPersistACLBlob:(id)a3 intoBlob:(id *)a4 returnBioUUIDs:(id *)a5
{
  return +[AppleIDVClient appleIDVPersistACLBlob:a3 intoBlob:a4 returnBioUUIDs:a5 andRequireDoublePress:0];
}

+ (unsigned)appleIDVPersistACLBlob:(id)a3 intoBlob:(id *)a4 returnBioUUIDs:(id *)a5 andRequireDoublePress:(unsigned __int8)a6
{
  int v6 = a6;
  id v9 = a3;
  uint64_t v51 = 0;
  id v10 = DIV_LOG_KEXT();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unsigned int v12 = DIV_LOG_KEXT();
  os_signpost_id_t v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "appleIDV.persistACLBlob", "enableTelemetry=YES", buf, 2u);
  }
  os_signpost_id_t spid = v11;

  id v15 = 0;
  unsigned int v16 = 5;
  id v17 = 0;
  if (v9 && a4)
  {
    id v17 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
    uint64_t v51 = [v17 length];
    unsigned int v18 = +[AppleIDVClient getUUIDsFromACL:v9 intoArray:a5];
    if (v18)
    {
      unsigned int v16 = v18;
      id v15 = 0;
      goto LABEL_40;
    }
    uint64_t v50 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    if (v6)
    {
      id v44 = 0;
      unsigned int v16 = +[AppleIDVClient requireDoublePressOnACL:v9 intoACL:&v44];
      id v15 = v44;
      if (v16) {
        goto LABEL_40;
      }
    }
    else
    {
      id v15 = v9;
    }
    id v15 = v15;
    *(void *)&long long v45 = [v15 bytes];
    *((void *)&v45 + 1) = [v15 length];
    unsigned int v19 = extractACLForSCRD(v45, *((uint64_t *)&v45 + 1), &v46, (void *)&v46 + 1);
    if (v19
      || (id v20 = v9,
          *(void *)&long long v47 = [v20 bytes],
          *((void *)&v47 + 1) = [v20 length],
          (unsigned int v19 = extractACLForSCRD(v47, *((uint64_t *)&v47 + 1), &v48, (void *)&v48 + 1)) != 0))
    {
      unsigned int v16 = v19;
      goto LABEL_40;
    }
    uint64_t v50 = 0;
    long long v49 = 0xFFuLL;
    id v17 = v17;
    uint64_t v21 = [v17 mutableBytes];
    *(void *)buf = 0;
    v42 = (void *)v21;
    unint64_t v43 = v14;
    if ((void)v45)
    {
      if (*((void *)&v45 + 1) > 0xFFFFFFFEuLL) {
        goto LABEL_47;
      }
      if ((void)v47)
      {
        if (*((void *)&v47 + 1) <= 0xFFFFFFFEuLL)
        {
          size_t v22 = 4096;
          unsigned int v23 = malloc_type_malloc(0x1000uLL, 0x319BD72CuLL);
          v24 = v23;
          if (v23)
          {
            size_t v22 = 4096;
            uint64_t v52 = 4096;
            int v25 = tlvEncodeWithCheck((uint64_t)v23, 32, (const void *)v45, DWORD2(v45), &v52, buf);
            if (v25)
            {
              int v31 = v25;
            }
            else
            {
              int v26 = tlvEncodeWithCheck((uint64_t)v24 + *(void *)buf, 33, &v46, 8u, &v52, buf);
              if (!v26)
              {
                int v26 = tlvEncodeWithCheck((uint64_t)v24 + *(void *)buf, 34, (char *)&v46 + 8, 8u, &v52, buf);
                if (!v26)
                {
                  int v26 = tlvEncodeWithCheck((uint64_t)v24 + *(void *)buf, 35, (const void *)v47, DWORD2(v47), &v52, buf);
                  if (!v26)
                  {
                    int v26 = tlvEncodeWithCheck((uint64_t)v24 + *(void *)buf, 36, &v48, 8u, &v52, buf);
                    if (!v26)
                    {
                      int v26 = tlvEncodeWithCheck((uint64_t)v24 + *(void *)buf, 37, (char *)&v48 + 8, 8u, &v52, buf);
                      if (!v26)
                      {
                        int v27 = tlvEncodeWithCheck((uint64_t)v24 + *(void *)buf, 31, &v49, 8u, &v52, buf);
                        long long v28 = a4;
                        if (v27)
                        {
                          int v31 = v27;
                          size_t v22 = 4096;
                        }
                        else
                        {
                          long long v29 = APPLEIDV_LOG_CLIENT();
                          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
                          size_t v22 = *(void *)buf;
                          if (v30) {
                            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:].cold.4();
                          }

                          int v31 = 0;
                        }
                        goto LABEL_28;
                      }
                    }
                  }
                }
              }
              int v31 = v26;
              size_t v22 = 4096;
            }
          }
          else
          {
            int v31 = 9;
          }
LABEL_51:
          long long v28 = a4;
LABEL_28:
          long long v32 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:]();
          }

          if (v31) {
            int v33 = 5;
          }
          else {
            int v33 = GenericAppleIDVCall(1u, v24, v22, v42, (size_t *)&v51);
          }
          unint64_t v14 = v43;
          if (v24) {
            free(v24);
          }
          v34 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:]();
          }

          v35 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            +[AppleIDVClient appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:]();
          }

          if (v33)
          {
            if (v33 == -536870208) {
              unsigned int v16 = 11;
            }
            else {
              unsigned int v16 = v33;
            }
          }
          else
          {
            v36 = (void *)MEMORY[0x1E4F1C9B8];
            id v17 = v17;
            uint64_t v37 = [v17 mutableBytes];
            [v36 dataWithBytes:v37 length:v51];
            unsigned int v16 = 0;
            *long long v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_40;
        }
LABEL_47:
        v24 = 0;
        size_t v22 = 0;
        int v31 = -75;
        goto LABEL_51;
      }
    }
    v24 = 0;
    size_t v22 = 0;
    int v31 = -6;
    goto LABEL_51;
  }
LABEL_40:
  v38 = DIV_LOG_KEXT();
  v39 = v38;
  if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v39, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.persistACLBlob", "", buf, 2u);
  }

  return v16;
}

+ (unsigned)appleIDVRecoverPersistedACLBlob:(id)a3 intoBlob:(id *)a4
{
  id v5 = a3;
  int v6 = DIV_LOG_KEXT();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = DIV_LOG_KEXT();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "appleIDV.recoverPersistedACL", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v10 = 5;
  if (v5 && a4)
  {
    os_signpost_id_t v11 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
    id v12 = v5;
    uint64_t v13 = [v12 bytes];
    unint64_t v14 = [v12 length];
    id v15 = v11;
    uint64_t v16 = [v15 mutableBytes];
    uint64_t v26 = v16;
    size_t v27 = 0x4000;
    if (v16)
    {
      unsigned int v10 = 5;
      if (v13)
      {
        if (v14 <= 0xFFFFFFFE)
        {
          id v17 = (void *)v16;
          unsigned int v18 = (char *)malloc_type_malloc(0x1000uLL, 0x433BA0B3uLL);
          if (v18)
          {
            unsigned int v19 = v18;
            char *v18 = 60;
            *(_WORD *)(v18 + 1) = v14;
            v18[3] = BYTE2(v14);
            v18[4] = BYTE3(v14);
            __memcpy_chk();
            unsigned int v10 = GenericAppleIDVCall(2u, v19, (v14 + 5), v17, &v27);
            free(v19);
          }
        }
      }
    }
    else
    {
      unsigned int v10 = 18;
    }
    id v20 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVRecoverPersistedACLBlob:intoBlob:]();
    }

    uint64_t v21 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVRecoverPersistedACLBlob:intoBlob:]();
    }

    size_t v22 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVRecoverPersistedACLBlob:intoBlob:]();
    }

    if (v10)
    {
      if (v10 == -536870208) {
        unsigned int v10 = 11;
      }
    }
    else
    {
      *a4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 length:v27];
    }
  }
  unsigned int v23 = DIV_LOG_KEXT();
  v24 = v23;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v24, OS_SIGNPOST_INTERVAL_END, v7, "appleIDV.recoverPersistedACL", "", buf, 2u);
  }

  return v10;
}

+ (unsigned)appleIDVPersistModifiedSESlot:(int64_t)a3 withReferenceBlob:(id)a4 withLAContextData:(id)a5 intoBlob:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  os_signpost_id_t v11 = DIV_LOG_KEXT();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = DIV_LOG_KEXT();
  unint64_t v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "appleIDV.persistModifiedSESlot", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v16 = 5;
  os_signpost_id_t spid = v12;
  if (v9 && v10 && a6)
  {
    v40 = a6;
    unint64_t v41 = v12 - 1;
    id v17 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
    id v18 = v9;
    unsigned int v19 = (const void *)[v18 bytes];
    v42[1] = v19;
    uint64_t v20 = [v18 length];
    v42[2] = v20;
    id v21 = v17;
    size_t v22 = (void *)[v21 mutableBytes];
    unint64_t v43 = v22;
    v44[0] = 0x4000;
    id v23 = v10;
    v24 = (const void *)[v23 bytes];
    v44[1] = (size_t)v24;
    unint64_t v25 = [v23 length];
    v44[2] = v25;
    v42[0] = a3;
    if (!v22)
    {
      unsigned int v16 = 18;
      unint64_t v15 = v41;
LABEL_25:
      v34 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        +[AppleIDVClient appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:]();
      }

      v35 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        +[AppleIDVClient appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:]();
      }

      if (v16)
      {
        if (v16 == -536870208) {
          unsigned int v16 = 11;
        }
      }
      else
      {
        id *v40 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v43 length:v44[0]];
      }

      goto LABEL_32;
    }
    *(void *)buf = 0;
    if (v19)
    {
      if (!v20)
      {
LABEL_37:
        long long v29 = 0;
        size_t v27 = 0;
        int v32 = -75;
        goto LABEL_18;
      }
      if (v24)
      {
        unsigned int v26 = v25;
        if (v25 <= 0xFFFFFFFE)
        {
          size_t v27 = 4096;
          long long v28 = malloc_type_malloc(0x1000uLL, 0x83722CF8uLL);
          long long v29 = v28;
          if (v28)
          {
            size_t v27 = 4096;
            uint64_t v45 = 4096;
            int v30 = tlvEncodeWithCheck((uint64_t)v28, 21, v24, v26, &v45, buf);
            if (v30)
            {
              int v32 = v30;
            }
            else
            {
              int v31 = tlvEncodeWithCheck((uint64_t)v29 + *(void *)buf, 70, v19, v20, &v45, buf);
              if (v31)
              {
                int v32 = v31;
                size_t v27 = 4096;
              }
              else
              {
                int v32 = tlvEncodeWithCheck((uint64_t)v29 + *(void *)buf, 31, v42, 8u, &v45, buf);
                if (v32) {
                  size_t v27 = 4096;
                }
                else {
                  size_t v27 = *(void *)buf;
                }
              }
            }
          }
          else
          {
            int v32 = 9;
          }
          goto LABEL_18;
        }
        goto LABEL_37;
      }
    }
    long long v29 = 0;
    size_t v27 = 0;
    int v32 = -6;
LABEL_18:
    int v33 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:]();
    }

    if (v32) {
      unsigned int v16 = 5;
    }
    else {
      unsigned int v16 = GenericAppleIDVCall(0xBu, v29, v27, v22, v44);
    }
    unint64_t v15 = v41;
    if (v29) {
      free(v29);
    }
    goto LABEL_25;
  }
LABEL_32:
  v36 = DIV_LOG_KEXT();
  uint64_t v37 = v36;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v37, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.persistModifiedSESlot", "", buf, 2u);
  }

  return v16;
}

+ (unsigned)appleIDVPersistModifiedACLBlob:(id)a3 withReferenceACLBlob:(id)a4 withLAContextData:(id)a5 intoBlob:(id *)a6 returnBioUUIDs:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = DIV_LOG_KEXT();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  unsigned int v16 = DIV_LOG_KEXT();
  id v17 = v16;
  unint64_t v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "appleIDV.persistModifiedACL", "enableTelemetry=YES", buf, 2u);
  }

  id v19 = 0;
  unsigned int v20 = 5;
  if (v11 && v12 && v13 && a6 && a7)
  {
    id v19 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
    unsigned int v21 = +[AppleIDVClient getUUIDsFromACL:v11 intoArray:a7];
    if (v21)
    {
      unsigned int v20 = v21;
      goto LABEL_34;
    }
    os_signpost_id_t v51 = v15;
    unint64_t v58 = 0;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    id v22 = v11;
    uint64_t v52 = [v22 bytes];
    unint64_t v53 = [v22 length];
    unsigned int v23 = extractACLForSCRD(v52, v53, &v54, (void *)&v54 + 1);
    if (v23)
    {
      unsigned int v20 = v23;
      goto LABEL_34;
    }
    unint64_t v50 = v15 - 1;
    id v24 = v12;
    *((void *)&v55 + 1) = [v24 bytes];
    *(void *)&long long v56 = [v24 length];
    id v19 = v19;
    *((void *)&v56 + 1) = [v19 mutableBytes];
    *(void *)&long long v57 = 0x4000;
    id v25 = v13;
    *((void *)&v57 + 1) = [v25 bytes];
    unint64_t v26 = [v25 length];
    unint64_t v58 = v26;
    size_t v27 = (void *)*((void *)&v56 + 1);
    int v28 = 18;
    if (!*((void *)&v56 + 1) || (unint64_t)v57 < 0x4000) {
      goto LABEL_27;
    }
    if (!*((void *)&v55 + 1)) {
      goto LABEL_38;
    }
    if ((unint64_t)v56 <= 0xFFFFFFFE)
    {
      if (!v52) {
        goto LABEL_38;
      }
      if (v53 <= 0xFFFFFFFE)
      {
        if (*((void *)&v57 + 1))
        {
          if (v26 <= 0xFFFFFFFE)
          {
            size_t v29 = 4096;
            int v30 = (char *)malloc_type_malloc(0x1000uLL, 0x2A400C96uLL);
            int v31 = v30;
            if (v30)
            {
              *int v30 = 20;
              *(_DWORD *)(v30 + 1) = v53;
              __memcpy_chk();
              uint64_t v32 = (v53 + 5);
              int v33 = &v31[v32];
              *(_DWORD *)int v33 = 2112;
              v33[4] = 0;
              uint64_t v34 = *((void *)&v54 + 1);
              *(void *)(v33 + 5) = v54;
              *(_DWORD *)(v33 + 13) = 2113;
              v33[17] = 0;
              *(void *)(v33 + 18) = v34;
              uint64_t v35 = v32 + 26;
              v36 = &v31[v32 + 26];
              uint64_t v37 = (const void *)*((void *)&v57 + 1);
              unsigned int v38 = v58;
              char *v36 = 21;
              *(_DWORD *)(v36 + 1) = v38;
              memcpy(v36 + 5, v37, v38);
              uint64_t v39 = v38 + 5 + v35;
              v40 = &v31[v39];
              unint64_t v41 = (const void *)*((void *)&v55 + 1);
              unsigned int v42 = v56;
              char *v40 = 70;
              *(_DWORD *)(v40 + 1) = v42;
              memcpy(&v31[v39 + 5], v41, v42);
              size_t v29 = v42 + 5 + v39;
              int v43 = 1;
            }
            else
            {
              int v43 = 0;
            }
            goto LABEL_21;
          }
          goto LABEL_39;
        }
LABEL_38:
        int v31 = 0;
        size_t v29 = 0;
        int v43 = 0;
LABEL_21:
        id v44 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          +[AppleIDVClient appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:]();
        }

        if (v43) {
          int v28 = GenericAppleIDVCall(4u, v31, v29, v27, (size_t *)&v57);
        }
        else {
          int v28 = 5;
        }
        os_signpost_id_t v15 = v51;
        if (v31) {
          free(v31);
        }
LABEL_27:
        uint64_t v45 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          +[AppleIDVClient appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:]();
        }

        long long v46 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
          +[AppleIDVClient appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:]();
        }

        if (v28)
        {
          if (v28 == -536870208) {
            unsigned int v20 = 11;
          }
          else {
            unsigned int v20 = v28;
          }
        }
        else
        {
          [MEMORY[0x1E4F1C9B8] dataWithBytes:*((void *)&v56 + 1) length:(void)v57];
          unsigned int v20 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        unint64_t v18 = v50;
        goto LABEL_34;
      }
    }
LABEL_39:
    int v31 = 0;
    size_t v29 = 0;
    int v43 = 0;
    goto LABEL_21;
  }
LABEL_34:
  long long v47 = DIV_LOG_KEXT();
  long long v48 = v47;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v48, OS_SIGNPOST_INTERVAL_END, v15, "appleIDV.persistModifiedACL", "", buf, 2u);
  }

  return v20;
}

+ (unsigned)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:(id)a3 progenitorPublicKey:(id)a4 encryptedPrivateKey:(id *)a5 attestation:(id *)a6 publicKey:(id *)a7 keyBlob:(id *)a8
{
  MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  id v9 = v8;
  id v11 = v10;
  id v13 = v12;
  os_signpost_id_t v15 = v14;
  id v17 = v16;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v19 = v18;
  id v55 = v17;
  long long v56 = 0u;
  unsigned int v20 = DIV_LOG_KEXT();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  id v22 = DIV_LOG_KEXT();
  unsigned int v23 = v22;
  unint64_t v24 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "appleIDV.generateTrustKey", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v25 = 5;
  os_signpost_id_t spid = v21;
  if (v19)
  {
    if (v15)
    {
      if (v13)
      {
        long long v54 = v9;
        if (v11)
        {
          id v26 = v19;
          size_t v27 = (const void *)[v26 bytes];
          unint64_t v28 = [v26 length];
          id v29 = v55;
          int v30 = (const void *)[v29 bytes];
          unsigned int v31 = [v29 length];
          *(void *)&long long v56 = buf;
          *((void *)&v56 + 1) = 4096;
          *(void *)unint64_t v58 = 0;
          if (v27 && v28 <= 0xFFFFFFFE && (unsigned int v32 = v31, (v33 = malloc_type_malloc(0x1000uLL, 0xDD85F511uLL)) != 0))
          {
            uint64_t v34 = v33;
            uint64_t v57 = 4096;
            if (tlvEncodeWithCheck((uint64_t)v33, 130, v27, v28, &v57, v58)
              || tlvEncodeWithCheck((uint64_t)v34 + *(void *)v58, 131, v30, v32, &v57, v58))
            {
              int v38 = 5;
            }
            else
            {
              uint64_t v35 = APPLEIDV_LOG_CLIENT();
              BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
              size_t v37 = *(void *)v58;
              if (v36) {
                +[AppleIDVClient appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:]();
              }

              int v38 = GenericAppleIDVCall(6u, v34, v37, buf, (size_t *)&v56 + 1);
            }
            free(v34);
          }
          else
          {
            int v38 = 5;
          }
          uint64_t v39 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            +[AppleIDVClient appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:]();
          }

          v40 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            +[AppleIDVClient appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:]();
          }

          if (v38)
          {
            if (v38 == -536870208) {
              unsigned int v25 = 11;
            }
            else {
              unsigned int v25 = v38;
            }
          }
          else
          {
            uint64_t v41 = *(unsigned int *)buf;
            uint64_t v42 = v60;
            uint64_t v43 = v61;
            unsigned int v44 = *(_DWORD *)buf + v60;
            BOOL v45 = __CFADD__(*(_DWORD *)buf, v60);
            BOOL v46 = __CFADD__(v61, v44);
            unsigned int v47 = v61 + v44;
            char v48 = v46;
            unsigned int v25 = 2;
            if (!v45 && (v48 & 1) == 0 && v47 <= 0xFF4)
            {
              objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v56);
              *long long v54 = (id)objc_claimAutoreleasedReturnValue();
              void *v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v62 length:v41];
              long long v49 = &v62[v41];
              *id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v49 length:v42];
              [MEMORY[0x1E4F1C9B8] dataWithBytes:&v49[v42] length:v43];
              unsigned int v25 = 0;
              void *v11 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
  unint64_t v50 = DIV_LOG_KEXT();
  os_signpost_id_t v51 = v50;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)unint64_t v58 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v51, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.generateTrustKey", "", v58, 2u);
  }

  return v25;
}

+ (unsigned)appleIDVUpdatePrearmTrustKeyForWatch:(id)a3 progenitorPublicKey:(id)a4 encryptedPrivateKey:(id *)a5 attestation:(id *)a6 publicKey:(id *)a7 keyBlob:(id *)a8
{
  MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  id v9 = v8;
  id v11 = v10;
  id v13 = v12;
  os_signpost_id_t v15 = v14;
  id v17 = v16;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v19 = v18;
  id v54 = v17;
  long long v55 = 0u;
  unsigned int v20 = DIV_LOG_KEXT();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  id v22 = DIV_LOG_KEXT();
  unsigned int v23 = v22;
  unint64_t v24 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "appleIDV.updateTrustKey", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v25 = 5;
  os_signpost_id_t spid = v21;
  if (v19)
  {
    if (v15)
    {
      if (v13)
      {
        if (v11)
        {
          unint64_t v53 = v11;
          if (v9)
          {
            id v26 = v19;
            size_t v27 = (const void *)[v26 bytes];
            unint64_t v28 = [v26 length];
            id v29 = v54;
            int v30 = (const void *)[v29 bytes];
            unint64_t v31 = [v29 length];
            *(void *)&long long v55 = buf;
            *((void *)&v55 + 1) = 4096;
            *(void *)uint64_t v57 = 0;
            if (v27
              && v28 <= 0xFFFFFFFE
              && v30
              && (unsigned int v32 = v31, v31 <= 0xFFFFFFFE)
              && (int v33 = malloc_type_malloc(0x1000uLL, 0x56575402uLL)) != 0)
            {
              uint64_t v34 = v33;
              uint64_t v56 = 4096;
              if (tlvEncodeWithCheck((uint64_t)v33, 132, v27, v28, &v56, v57)
                || tlvEncodeWithCheck((uint64_t)v34 + *(void *)v57, 133, v30, v32, &v56, v57))
              {
                int v38 = 5;
              }
              else
              {
                uint64_t v35 = APPLEIDV_LOG_CLIENT();
                BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
                size_t v37 = *(void *)v57;
                if (v36) {
                  +[AppleIDVClient appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:]();
                }

                int v38 = GenericAppleIDVCall(0xCu, v34, v37, buf, (size_t *)&v55 + 1);
              }
              free(v34);
            }
            else
            {
              int v38 = 5;
            }
            uint64_t v39 = APPLEIDV_LOG_CLIENT();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
              +[AppleIDVClient appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:]();
            }

            v40 = APPLEIDV_LOG_CLIENT();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
              +[AppleIDVClient appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:]();
            }

            if (v38)
            {
              if (v38 == -536870208) {
                unsigned int v25 = 11;
              }
              else {
                unsigned int v25 = v38;
              }
            }
            else
            {
              uint64_t v42 = *(unsigned int *)buf;
              uint64_t v41 = v59;
              uint64_t v43 = v60;
              unsigned int v44 = *(_DWORD *)buf + v59;
              BOOL v45 = __CFADD__(*(_DWORD *)buf, v59);
              BOOL v46 = __CFADD__(v60, v44);
              unsigned int v47 = v60 + v44;
              char v48 = v46;
              unsigned int v25 = 2;
              if (!v45 && (v48 & 1) == 0 && v47 <= 0xFF4)
              {
                objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v55);
                void *v9 = (id)objc_claimAutoreleasedReturnValue();
                void *v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v61 length:v42];
                *id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v61[v42] length:v41];
                [MEMORY[0x1E4F1C9B8] dataWithBytes:&v61[v42 + v41] length:v43];
                unsigned int v25 = 0;
                *unint64_t v53 = (id)objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
      }
    }
  }
  long long v49 = DIV_LOG_KEXT();
  unint64_t v50 = v49;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)uint64_t v57 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v50, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.updateTrustKey", "", v57, 2u);
  }

  return v25;
}

+ (unsigned)appleIDVGeneratePhoneTokenWithNonce:(id)a3 withReferenceACLBlob:(id)a4 keyBlob:(id)a5 keyAttestation:(id)a6 casdCertificate:(id)a7 phoneToken:(id *)a8
{
  MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  id v9 = v8;
  id v11 = v10;
  id v13 = v12;
  os_signpost_id_t v15 = v14;
  id v17 = v16;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v19 = v18;
  id v20 = v17;
  id v21 = v15;
  id v22 = v13;
  id v23 = v11;
  long long v68 = 0u;
  unint64_t v24 = DIV_LOG_KEXT();
  os_signpost_id_t v25 = os_signpost_id_generate(v24);

  id v26 = DIV_LOG_KEXT();
  size_t v27 = v26;
  os_signpost_id_t spid = v25;
  unint64_t v28 = v25 - 1;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "appleIDV.generatePhoneToken", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v29 = 5;
  if (v19 && v20 && v21 && v9)
  {
    if ((v22 == 0) != (v23 == 0))
    {
      unsigned int v29 = 1;
    }
    else
    {
      unint64_t v59 = v25 - 1;
      unsigned int v60 = v9;
      unint64_t v58 = objc_opt_new();
      [v58 externalizedContext];
      *(void *)&long long v68 = buf;
      *((void *)&v68 + 1) = 4096;
      id v66 = objc_claimAutoreleasedReturnValue();
      v67 = (const void *)[v66 bytes];
      unint64_t v30 = [v66 length];
      id v64 = v20;
      id v31 = v20;
      unsigned int v32 = (const void *)[v31 bytes];
      unint64_t v33 = [v31 length];
      id v65 = v19;
      id v34 = v19;
      uint64_t v35 = (const void *)[v34 bytes];
      unint64_t v36 = [v34 length];
      id v63 = v21;
      id v37 = v21;
      int v38 = (const void *)[v37 bytes];
      unint64_t v39 = [v37 length];
      id v62 = v22;
      if (v22)
      {
        id v40 = v22;
        uint64_t v57 = (const void *)[v40 bytes];
        id v22 = (id)[v40 length];
      }
      else
      {
        uint64_t v57 = 0;
      }
      id v61 = v23;
      if (v23)
      {
        id v41 = v23;
        uint64_t v56 = (const void *)[v41 bytes];
        id v23 = (id)[v41 length];
      }
      else
      {
        uint64_t v56 = 0;
      }
      *(void *)v70 = 0;
      if (v35
        && (!v32 ? (BOOL v42 = v33 == 0) : (BOOL v42 = 1),
            v42
         && v67
         && v38
         && v33 <= 0xFFFFFFFE
         && v36 <= 0xFFFFFFFE
         && v30 <= 0xFFFFFFFE
         && v39 <= 0xFFFFFFFE
         && (unint64_t)v22 <= 0xFFFFFFFE
         && (unint64_t)v23 <= 0xFFFFFFFE
         && (uint64_t v43 = malloc_type_malloc(0x1000uLL, 0xCE483C7DuLL)) != 0))
      {
        unsigned int v44 = v43;
        uint64_t v69 = 4096;
        if (tlvEncodeWithCheck((uint64_t)v43, 100, v35, v36, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(void *)v70, 101, v32, v33, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(void *)v70, 102, v67, v30, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(void *)v70, 103, v38, v39, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(void *)v70, 105, v57, v22, &v69, v70)
          || tlvEncodeWithCheck((uint64_t)v44 + *(void *)v70, 106, v56, v23, &v69, v70))
        {
          int v47 = 5;
        }
        else
        {
          size_t v45 = *(void *)v70;
          BOOL v46 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            +[AppleIDVClient appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:](v46);
          }

          int v47 = GenericAppleIDVCall(5u, v44, v45, buf, (size_t *)&v68 + 1);
        }
        id v19 = v65;
        id v22 = v62;
        id v21 = v63;
        char v48 = v60;
        id v23 = v61;
        long long v49 = v58;
        unint64_t v28 = v59;
        free(v44);
        id v20 = v64;
      }
      else
      {
        int v47 = 5;
        id v20 = v64;
        id v19 = v65;
        id v22 = v62;
        id v21 = v63;
        char v48 = v60;
        id v23 = v61;
        long long v49 = v58;
        unint64_t v28 = v59;
      }
      unint64_t v50 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        +[AppleIDVClient appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:]();
      }

      os_signpost_id_t v51 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
        +[AppleIDVClient appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:]();
      }

      if (v47)
      {
        if (v47 == -536870208) {
          unsigned int v29 = 11;
        }
        else {
          unsigned int v29 = v47;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v68);
        unsigned int v29 = 0;
        *char v48 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  uint64_t v52 = DIV_LOG_KEXT();
  unint64_t v53 = v52;
  if (v28 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)v70 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v53, OS_SIGNPOST_INTERVAL_END, spid, "appleIDV.generatePhoneToken", "", v70, 2u);
  }

  return v29;
}

+ (unsigned)appleIDVEstablishPrearmTrustWithCertificate:(id)a3 protectedPublicKey:(id *)a4
{
  ((void (*)(id, SEL, id, id *))MEMORY[0x1F4188790])(a1, a2, a3, a4);
  id v5 = v4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = v6;
  long long v28 = 0u;
  uint64_t v8 = DIV_LOG_KEXT();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = DIV_LOG_KEXT();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "appleIDV.establishPrearmTrust", "enableTelemetry=YES", buf, 2u);
  }

  unsigned int v12 = 5;
  if (v7 && v5)
  {
    *(void *)&long long v28 = buf;
    *((void *)&v28 + 1) = 4096;
    id v13 = v7;
    unint64_t v14 = (const void *)objc_msgSend(v13, "bytes", 0, 0);
    unint64_t v15 = objc_msgSend(v13, "length", v14);
    *(void *)unint64_t v30 = 0;
    if (v14 && (unsigned int v16 = v15, v15 <= 0xFFFFFFFE) && (v17 = malloc_type_malloc(0x1000uLL, 0xF28AF4D6uLL)) != 0)
    {
      id v18 = v17;
      uint64_t v29 = 4096;
      if (tlvEncodeWithCheck((uint64_t)v17, 90, v14, v16, &v29, v30))
      {
        int v22 = 5;
      }
      else
      {
        id v19 = APPLEIDV_LOG_CLIENT();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        size_t v21 = *(void *)v30;
        if (v20) {
          +[AppleIDVClient appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:]();
        }

        int v22 = GenericAppleIDVCall(0xAu, v18, v21, buf, (size_t *)&v28 + 1);
      }
      free(v18);
    }
    else
    {
      int v22 = 5;
    }
    id v23 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:]();
    }

    unint64_t v24 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:]();
    }

    if (v22)
    {
      if (v22 == -536870208) {
        unsigned int v12 = 11;
      }
      else {
        unsigned int v12 = v22;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v28);
      unsigned int v12 = 0;
      *id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  os_signpost_id_t v25 = DIV_LOG_KEXT();
  id v26 = v25;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)unint64_t v30 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v26, OS_SIGNPOST_INTERVAL_END, v9, "appleIDV.establishPrearmTrust", "", v30, 2u);
  }

  return v12;
}

+ (unsigned)appleIDVGenerateNonceOnWatch:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  size_t v15 = 32;
  id v4 = DIV_LOG_KEXT();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = DIV_LOG_KEXT();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "appleIDV.establishPrearmTrust", "enableTelemetry=YES", buf, 2u);
  }

  if (a3)
  {
    unsigned int v8 = GenericAppleIDVCall(7u, 0, 0, buf, &v15);
    os_signpost_id_t v9 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVGenerateNonceOnWatch:]();
    }

    id v10 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVGenerateNonceOnWatch:]();
    }

    if (v8)
    {
      if (v8 == -536870208) {
        unsigned int v8 = 11;
      }
    }
    else
    {
      *a3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:v15];
    }
  }
  else
  {
    unsigned int v8 = 5;
  }
  id v11 = DIV_LOG_KEXT();
  unsigned int v12 = v11;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)unint64_t v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v12, OS_SIGNPOST_INTERVAL_END, v5, "appleIDV.establishPrearmTrust", "", v14, 2u);
  }

  return v8;
}

+ (unsigned)appleIDVPrearmCredentialWithAuthorizationToken:(id)a3 protectedPublicKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = DIV_LOG_KEXT();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v9 = DIV_LOG_KEXT();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "appleIDV.prearmCredential", "enableTelemetry=YES", buf, 2u);
  }

  if (v5)
  {
    id v11 = v5;
    unsigned int v12 = (const void *)[v11 bytes];
    unint64_t v13 = [v11 length];
    id v14 = v6;
    size_t v15 = (const void *)[v14 bytes];
    unint64_t v16 = [v14 length];
    size_t v30 = 0;
    *(void *)buf = 0;
    if (v12
      && v13 <= 0xFFFFFFFE
      && v15
      && (unsigned int v17 = v16, v16 <= 0xFFFFFFFE)
      && (id v18 = malloc_type_malloc(0x1000uLL, 0xCF638DD2uLL)) != 0)
    {
      id v19 = v18;
      uint64_t v31 = 4096;
      if (tlvEncodeWithCheck((uint64_t)v18, 80, v12, v13, &v31, buf)
        || tlvEncodeWithCheck((uint64_t)v19 + *(void *)buf, 81, v15, v17, &v31, buf))
      {
        int v23 = 5;
      }
      else
      {
        BOOL v20 = APPLEIDV_LOG_CLIENT();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
        size_t v22 = *(void *)buf;
        if (v21) {
          +[AppleIDVClient appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:]();
        }

        int v23 = GenericAppleIDVCall(8u, v19, v22, buf, &v30);
      }
      free(v19);
    }
    else
    {
      int v23 = 5;
    }
    unint64_t v24 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:]();
    }

    os_signpost_id_t v25 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      +[AppleIDVClient appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:]();
    }

    if (v23)
    {
      if (v23 == -536870208) {
        unsigned int v26 = 11;
      }
      else {
        unsigned int v26 = v23;
      }
    }
    else
    {
      unsigned int v26 = 0;
    }
  }
  else
  {
    unsigned int v26 = 5;
  }
  size_t v27 = DIV_LOG_KEXT();
  long long v28 = v27;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v28, OS_SIGNPOST_INTERVAL_END, v8, "appleIDV.prearmCredential", "", buf, 2u);
  }

  return v26;
}

+ (unsigned)appleIDVRevokeCredentialAuthorizationToken
{
  v2 = DIV_LOG_KEXT();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = DIV_LOG_KEXT();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "appleIDV.revokeCredential", "enableTelemetry=YES", buf, 2u);
  }

  size_t v15 = 0;
  int v6 = GenericAppleIDVCall(9u, 0, 0, &v16, &v15);
  id v7 = APPLEIDV_LOG_CLIENT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[AppleIDVClient appleIDVRevokeCredentialAuthorizationToken]();
  }

  if (v6 == -536870208) {
    int v8 = 11;
  }
  else {
    int v8 = v6;
  }
  if (v6) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  id v10 = DIV_LOG_KEXT();
  id v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)unint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7853000, v11, OS_SIGNPOST_INTERVAL_END, v3, "appleIDV.revokeCredential", "", v13, 2u);
  }

  return v9;
}

+ (unsigned)prepareUnboundACLForWatch:(id *)a3 withAccessibilityEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  int v6 = objc_opt_new();
  unint64_t v24 = @"osgn";
  v22[0] = @"cpo";
  v22[1] = @"pidvaccess";
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  if (v4) {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
  }
  v23[0] = @"IDVPolicy";
  v23[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v25[0] = v8;
  unsigned int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  if (a3)
  {
    SecAccessControlRef v10 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B578], 0x10uLL, &error);
    if (v10)
    {
      SecAccessControlRef v11 = v10;
      id v20 = 0;
      unsigned int v12 = [v6 evaluateAccessControl:v10 operation:0 options:0 error:&v20];
      id v13 = v20;

      if (v12)
      {
        SecAccessControlSetConstraints();
        id v14 = (void *)SecAccessControlCopyData();
        if (v14)
        {
          size_t v15 = v14;
          unsigned int v16 = 0;
          *a3 = v15;
        }
        else
        {
          id v18 = APPLEIDV_LOG_CLIENT();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:]();
          }

          size_t v15 = 0;
          unsigned int v16 = 13;
        }
      }
      else
      {
        unsigned int v17 = APPLEIDV_LOG_CLIENT();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:]();
        }

        size_t v15 = 0;
        unsigned int v16 = 16;
      }
      CFRelease(v11);
    }
    else
    {
      size_t v15 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient prepareUnboundACLForWatch:withAccessibilityEnabled:]();
      }
      unsigned int v16 = 13;
    }
  }
  else
  {
    unsigned int v16 = 5;
  }

  return v16;
}

+ (unsigned)appleIDVCredentialAuthenticationTokenStatus
{
  CFErrorRef error = 0;
  v2 = objc_opt_new();
  SecAccessControlRef v3 = SecAccessControlCreateWithFlags((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFTypeRef)*MEMORY[0x1E4F3B578], 0x40000000uLL, &error);
  if (v3)
  {
    SecAccessControlRef v4 = v3;
    SecAccessControlSetConstraints();
    id v10 = 0;
    id v5 = [v2 evaluateAccessControl:v4 operation:3 options:0 error:&v10];
    int v6 = v10;

    if (v5)
    {
      unsigned int v7 = 0;
    }
    else
    {
      int v8 = APPLEIDV_LOG_CLIENT();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[AppleIDVClient appleIDVCredentialAuthenticationTokenStatus]();
      }

      unsigned int v7 = 21;
    }
    CFRelease(v4);
  }
  else
  {
    int v6 = APPLEIDV_LOG_CLIENT();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[AppleIDVClient appleIDVCredentialAuthenticationTokenStatus]();
    }
    unsigned int v7 = 13;
  }

  return v7;
}

+ (void)requireDoublePressOnACL:(uint64_t)a1 intoACL:(void *)a2 .cold.1(uint64_t a1, void **a2)
{
  v2 = *a2;
  int v5 = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18(&dword_1D7853000, v3, v4, "%s:%d, failed to create ACL from input %@, error: (%@)", v5);
}

+ (void)getUUIDsFromACL:(uint64_t)a1 intoArray:(void *)a2 .cold.1(uint64_t a1, void **a2)
{
  v2 = *a2;
  int v5 = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_18(&dword_1D7853000, v3, v4, "%s:%d, failed to create ACL from input %@, error: %@", v5);
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, failed to get constraints", v2, v3, v4, v5, 2u);
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.3()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_1D7853000, v0, v1, "%s:%d, ACL is %@, constraints are %@", v2);
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, could not find 'od' constraint", v2, v3, v4, v5, 2u);
}

+ (void)prepareACLForPhoneDecryption:withSubType:forBioUUID:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, could not find 'cbio' attribute", v2, v3, v4, v5, 2u);
}

+ (void)prepareACLForWatchDecryption:withSubType:forAclUsage:.cold.1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);
}

+ (void)prepareACLForWatchDecryption:withSubType:forAclUsage:.cold.2()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17(&dword_1D7853000, v0, v1, "%s:%d, ACL is %@, constraints are %@", v2);
}

+ (void)prepareACLForWatchDecryption:(int)a1 withSubType:(int)a2 forAclUsage:(os_log_t)log .cold.3(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1D7853000, log, OS_LOG_TYPE_ERROR, "Unsupported use case %d / %d", (uint8_t *)v3, 0xEu);
}

+ (void)prepareACLForWatchDecryption:withSubType:forAclUsage:.cold.4()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);
}

+ (void)prepareUnboundACLForBioBinding:.cold.1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);
}

+ (void)prepareUnboundACLForBioBinding:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, failed to get constraints", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForBioBinding:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v0, v1, "%s:%d, failed to prepare ACL for item creation (%@)", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForBioBinding:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, could not find 'od' constraint", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForBioBinding:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, could not find 'cbio' attribute", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, failed to get constraints", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v0, v1, "%s:%d, failed to prepare ACL for item creation (%@)", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, could not find 'od' constraint", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForPasscodeBinding:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_8(&dword_1D7853000, v0, v1, "%s:%d, could not find 'cup' attribute", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVGetStatus:andSIDVVersion:andAppleIDVVersion:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPayloadDigest:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVAuthorizePresentment:(uint64_t)a1 withLAContextData:(NSObject *)a2 onSESlot:andPayloadDigest:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D7853000, a2, OS_LOG_TYPE_DEBUG, "ACL Blob produced : %@", (uint8_t *)&v2, 0xCu);
}

+ (void)appleIDVAuthorizePresentment:withLAContextData:onSESlot:andPublicKey:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_1D7853000, v0, v1, "[%d] err = %d", v2, v3, v4, v5, 0);
}

+ (void)appleIDVPersistACLBlob:intoBlob:returnBioUUIDs:andRequireDoublePress:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1D7853000, v0, v1, "[%s:%d] allocated %zu and used %zu", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVRecoverPersistedACLBlob:intoBlob:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVRecoverPersistedACLBlob:intoBlob:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "At %s:%d, res=%d", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVRecoverPersistedACLBlob:intoBlob:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1D7853000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
}

+ (void)appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPersistModifiedSESlot:withReferenceBlob:withLAContextData:intoBlob:.cold.3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_1D7853000, v0, v1, "[%d] err = %d", v2, v3, v4, v5, 0);
}

+ (void)appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1D7853000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
}

+ (void)appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPersistModifiedACLBlob:withReferenceACLBlob:withLAContextData:intoBlob:returnBioUUIDs:.cold.3()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_16(&dword_1D7853000, v0, v1, "[%d] err = %d", v2, v3, v4, v5, 0);
}

+ (void)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1D7853000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
}

+ (void)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVGeneratePrearmTrustKeyForWatchAndCopyPrivateKey:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1D7853000, v0, v1, "[%s:%d] allocated %zu and used %zu", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1D7853000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
}

+ (void)appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVUpdatePrearmTrustKeyForWatch:progenitorPublicKey:encryptedPrivateKey:attestation:publicKey:keyBlob:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1D7853000, v0, v1, "[%s:%d] allocated %zu and used %zu", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVGeneratePhoneTokenWithNonce:withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVGeneratePhoneTokenWithNonce:(os_log_t)log withReferenceACLBlob:keyBlob:keyAttestation:casdCertificate:phoneToken:.cold.3(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 634;
  _os_log_debug_impl(&dword_1D7853000, log, OS_LOG_TYPE_DEBUG, "[line %d] serialized", (uint8_t *)v1, 8u);
}

+ (void)appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVEstablishPrearmTrustWithCertificate:protectedPublicKey:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1D7853000, v0, v1, "[%s:%d] allocated %zu and used %zu", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVGenerateNonceOnWatch:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVGenerateNonceOnWatch:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1D7853000, v0, v1, "[line %d] kret = %d 0x%lx", v2, v3, v4, v5, v6);
}

+ (void)appleIDVPrearmCredentialWithAuthorizationToken:protectedPublicKey:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1D7853000, v0, v1, "[%s:%d] allocated %zu and used %zu", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVRevokeCredentialAuthorizationToken
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(&dword_1D7853000, v0, v1, "[line %d] kret = %d %x", v2, v3, v4, v5, 0);
}

+ (void)prepareUnboundACLForWatch:withAccessibilityEnabled:.cold.1()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v1, v2, "%s:%d, failed to create ACL (%@)", v3, v4, v5, v6, 2u);
}

+ (void)prepareUnboundACLForWatch:withAccessibilityEnabled:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v0, v1, "%s:%d, failed to prepare ACL for item creation (%@)", v2, v3, v4, v5, 2u);
}

+ (void)prepareUnboundACLForWatch:withAccessibilityEnabled:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v0, v1, "%s:%d, failed to copy acl data from acl %@", v2, v3, v4, v5, 2u);
}

+ (void)appleIDVCredentialAuthenticationTokenStatus
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1D7853000, v0, v1, "%s:%d, Failed to retrieve credential authentication token, this is a non-fatal error (%@)", v2, v3, v4, v5, 2u);
}

@end