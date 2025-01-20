@interface TKSecElemTokenSession
- (BOOL)isOperationAuthorized:(int64_t)a3 error:(id *)a4;
- (BOOL)tokenSession:(id)a3 deleteObject:(id)a4 error:(id *)a5;
- (BOOL)tokenSession:(id)a3 supportsOperation:(int64_t)a4 usingKey:(id)a5 algorithm:(id)a6;
- (NSString)applicationIdentifier;
- (TKSecElemTokenSession)initWithToken:(id)a3;
- (id)tokenSession:(id)a3 attestKey:(id)a4 usingKey:(id)a5 nonce:(id)a6 error:(id *)a7;
- (id)tokenSession:(id)a3 attributesOfObject:(id)a4 error:(id *)a5;
- (id)tokenSession:(id)a3 createObjectWithAttributes:(id)a4 error:(id *)a5;
- (id)tokenSession:(id)a3 decryptData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 parameters:(id)a7 error:(id *)a8;
- (id)tokenSession:(id)a3 performKeyExchangeWithPublicKey:(id)a4 usingKey:(id)a5 algorithm:(id)a6 parameters:(id)a7 error:(id *)a8;
- (id)tokenSession:(id)a3 signData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 error:(id *)a7;
- (void)setApplicationIdentifier:(id)a3;
- (void)tokenSession:(id)a3 updateObject:(id)a4 attributes:(id)a5 reply:(id)a6;
@end

@implementation TKSecElemTokenSession

- (TKSecElemTokenSession)initWithToken:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TKSecElemTokenSession;
  return [(TKSecElemTokenSession *)&v4 initWithToken:a3];
}

- (BOOL)isOperationAuthorized:(int64_t)a3 error:(id *)a4
{
  v7 = [(TKSecElemTokenSession *)self caller];
  v8 = [v7 valueForEntitlement:@"application-identifier"];
  [(TKSecElemTokenSession *)self setApplicationIdentifier:v8];

  v9 = [(TKSecElemTokenSession *)self applicationIdentifier];

  if (!v9)
  {
    if (!a4) {
      return 0;
    }
    v17 = TKErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Operation not allowed (missing application-identifier entitlement)";
    v18 = &v26;
    v19 = &v25;
LABEL_10:
    v20 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:1];
    *a4 = +[NSError errorWithDomain:v17 code:-8 userInfo:v20];

    return 0;
  }
  v10 = [(TKSecElemTokenSession *)self caller];
  v11 = [v10 valueForEntitlement:@"com.apple.seserviced.key"];
  unsigned __int8 v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
    if (!a4) {
      return 0;
    }
    v17 = TKErrorDomain;
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"Operation not allowed (missing com.apple.seserviced.key entitlement)";
    v18 = &v24;
    v19 = &v23;
    goto LABEL_10;
  }
  if (a3 != 1) {
    return 1;
  }
  v13 = [(TKSecElemTokenSession *)self caller];
  v14 = [v13 valueForEntitlement:@"com.apple.security.attestation.access"];
  unsigned __int8 v15 = [v14 BOOLValue];

  if (v15) {
    return 1;
  }
  if (a4)
  {
    v17 = TKErrorDomain;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Operation not allowed (missing com.apple.security.attestation.access entitlement)";
    v18 = &v22;
    v19 = &v21;
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)tokenSession:(id)a3 deleteObject:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = sub_10000269C(v9);
  if (a5 && v10)
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    v11 = +[NSString stringWithFormat:@"secelemtoken: kSecKeyAttestionKeyTypeSecureElement can not be deleted"];
    CFStringRef v24 = v11;
    unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a5 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v12];
  }
  else
  {
    if (![(TKSecElemTokenSession *)self isOperationAuthorized:0 error:a5])
    {
      BOOL v13 = 0;
      goto LABEL_15;
    }
    v14 = sub_100002704(v9, a5);
    v11 = v14;
    if (v14)
    {
      id v15 = [v14 objectForKeyedSubscript:@"keyData"];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      v16 = (void (*)(id, id *))off_10000CEE8;
      CFStringRef v22 = off_10000CEE8;
      if (!off_10000CEE8)
      {
        v17 = (void *)sub_100004E3C();
        v20[3] = (uint64_t)dlsym(v17, "SESKeyDelete");
        off_10000CEE8 = (_UNKNOWN *)v20[3];
        v16 = (void (*)(id, id *))v20[3];
      }
      _Block_object_dispose(&v19, 8);
      if (!v16) {
        sub_100005188();
      }
      v16(v15, a5);

      if (!a5 || !*a5)
      {
        BOOL v13 = 1;
        goto LABEL_5;
      }
    }
  }
  BOOL v13 = 0;
LABEL_5:

LABEL_15:
  return v13;
}

- (id)tokenSession:(id)a3 createObjectWithAttributes:(id)a4 error:(id *)a5
{
  id v72 = a3;
  id v8 = a4;
  id v9 = 0;
  if (![(TKSecElemTokenSession *)self isOperationAuthorized:0 error:a5]) {
    goto LABEL_43;
  }
  v71 = a5;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_100003734;
  v86 = sub_100003744;
  id v87 = +[NSNull null];
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x3032000000;
  v80[3] = sub_100003734;
  v80[4] = sub_100003744;
  id v81 = +[NSNull null];
  v73 = +[NSMutableDictionary dictionary];
  v118[0] = kSecClass;
  v118[1] = kSecClassKey;
  v70 = +[NSArray arrayWithObjects:v118 count:2];
  v119[0] = v70;
  v117[0] = kSecAttrKeyClass;
  v117[1] = kSecAttrKeyClassPrivate;
  v69 = +[NSArray arrayWithObjects:v117 count:2];
  v119[1] = v69;
  v116[0] = kSecAttrKeyType;
  v68 = +[NSNull null];
  v116[1] = v68;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10000374C;
  v79[3] = &unk_100008320;
  v79[4] = v80;
  v67 = objc_retainBlock(v79);
  v116[2] = v67;
  v66 = +[NSArray arrayWithObjects:v116 count:3];
  v119[2] = v66;
  v115[0] = kSecAttrKeySizeInBits;
  v115[1] = &off_1000087D8;
  v115[2] = &stru_100008360;
  v65 = +[NSArray arrayWithObjects:v115 count:3];
  v119[3] = v65;
  v114[0] = kSecAttrEffectiveKeySize;
  v114[1] = &off_1000087D8;
  v114[2] = &stru_100008380;
  v64 = +[NSArray arrayWithObjects:v114 count:3];
  v119[4] = v64;
  CFStringRef v113 = kSecValueData;
  v63 = +[NSArray arrayWithObjects:&v113 count:1];
  v119[5] = v63;
  uint64_t v10 = v83[5];
  v112[0] = kSecAttrAccessControl;
  v112[1] = v10;
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000037FC;
  v78[3] = &unk_100008320;
  v78[4] = &v82;
  v58 = objc_retainBlock(v78);
  v112[2] = v58;
  v62 = +[NSArray arrayWithObjects:v112 count:3];
  v119[6] = v62;
  v111[0] = kSecAttrIsPrivate;
  v111[1] = &__kCFBooleanTrue;
  v61 = +[NSArray arrayWithObjects:v111 count:2];
  v119[7] = v61;
  v110[0] = kSecAttrIsModifiable;
  v110[1] = &__kCFBooleanFalse;
  v60 = +[NSArray arrayWithObjects:v110 count:2];
  v119[8] = v60;
  v109[0] = kSecAttrIsExtractable;
  v109[1] = &__kCFBooleanFalse;
  v59 = +[NSArray arrayWithObjects:v109 count:2];
  v119[9] = v59;
  v108[0] = kSecAttrWasNeverExtractable;
  v108[1] = &__kCFBooleanTrue;
  v11 = +[NSArray arrayWithObjects:v108 count:2];
  v119[10] = v11;
  v107[0] = kSecAttrCanEncrypt;
  v107[1] = &__kCFBooleanTrue;
  unsigned __int8 v12 = +[NSArray arrayWithObjects:v107 count:2];
  v119[11] = v12;
  v106[0] = kSecAttrCanDecrypt;
  v106[1] = &__kCFBooleanTrue;
  BOOL v13 = +[NSArray arrayWithObjects:v106 count:2];
  v119[12] = v13;
  v105[0] = kSecAttrCanDerive;
  v105[1] = &__kCFBooleanTrue;
  v14 = +[NSArray arrayWithObjects:v105 count:2];
  v119[13] = v14;
  v104[0] = kSecAttrCanSign;
  v104[1] = &__kCFBooleanTrue;
  id v15 = +[NSArray arrayWithObjects:v104 count:2];
  v119[14] = v15;
  v103[0] = kSecAttrCanVerify;
  v103[1] = &__kCFBooleanFalse;
  v16 = +[NSArray arrayWithObjects:v103 count:2];
  v119[15] = v16;
  v102[0] = kSecAttrCanWrap;
  v102[1] = &__kCFBooleanFalse;
  v17 = +[NSArray arrayWithObjects:v102 count:2];
  v119[16] = v17;
  v18 = +[NSArray arrayWithObjects:v119 count:17];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v74 objects:v101 count:16];
  if (!v20) {
    goto LABEL_23;
  }
  uint64_t v21 = *(void *)v75;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v75 != v21) {
        objc_enumerationMutation(v19);
      }
      NSErrorUserInfoKey v23 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      CFStringRef v24 = [v23 objectAtIndexedSubscript:0];
      if ((unint64_t)[v23 count] < 2)
      {
        NSErrorUserInfoKey v25 = 0;
      }
      else
      {
        NSErrorUserInfoKey v25 = [v23 objectAtIndexedSubscript:1];
      }
      CFStringRef v26 = [v8 objectForKeyedSubscript:v24];
      if (!v26)
      {
        if (v25)
        {
          v30 = +[NSNull null];
          unsigned __int8 v31 = [v25 isEqual:v30];

          if ((v31 & 1) == 0) {
            [v73 setObject:v25 forKeyedSubscript:v24];
          }
        }
        goto LABEL_21;
      }
      if ((unint64_t)[v23 count] < 3)
      {
        v28 = 0;
LABEL_18:
        unsigned __int8 v29 = [v25 isEqual:v26];
        goto LABEL_19;
      }
      v27 = [v23 objectAtIndex:2];
      v28 = objc_retainBlock(v27);

      if (!v28) {
        goto LABEL_18;
      }
      unsigned __int8 v29 = v28[2](v28, v26);
LABEL_19:
      if ((v29 & 1) == 0)
      {
        if (v71)
        {
          NSErrorUserInfoKey v99 = NSLocalizedDescriptionKey;
          v37 = +[NSString stringWithFormat:@"secelemtoken: %@ requires '%@' value when present", v24, v25];
          v100 = v37;
          v38 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
          id *v71 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v38];
        }
        id v9 = 0;
        id v39 = v19;
        goto LABEL_42;
      }
      [v73 setObject:v26 forKeyedSubscript:v24];

LABEL_21:
    }
    id v20 = [v19 countByEnumeratingWithState:&v74 objects:v101 count:16];
  }
  while (v20);
LABEL_23:

  v32 = (void *)v83[5];
  v33 = +[NSNull null];
  LODWORD(v32) = [v32 isEqual:v33];

  if (v32)
  {
    v34 = (id)kSecAttrAccessibleWhenUnlocked;
    v35 = SecAccessControlCreateWithFlags(0, v34, 0, 0);
    v36 = (void *)SecAccessControlCopyData();
    [v73 setObject:v36 forKeyedSubscript:kSecAttrAccessControl];
  }
  else
  {
    v35 = (const void *)SecAccessControlCreateFromData();
  }
  [v73 setObject:v83[5] forKeyedSubscript:kSecAttrAccessControl];
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  v40 = (void (*)(const void *, id *))off_10000CEF8;
  v96 = off_10000CEF8;
  if (!off_10000CEF8)
  {
    v88 = _NSConcreteStackBlock;
    uint64_t v89 = 3221225472;
    v90 = sub_100004FA8;
    v91 = &unk_1000083E8;
    v92 = &v93;
    v41 = (void *)sub_100004E3C();
    v42 = dlsym(v41, "SESKeyCreate");
    *(void *)(v92[1] + 24) = v42;
    off_10000CEF8 = *(_UNKNOWN **)(v92[1] + 24);
    v40 = (void (*)(const void *, id *))v94[3];
  }
  _Block_object_dispose(&v93, 8);
  if (!v40)
  {
    v54 = +[NSAssertionHandler currentHandler];
    v55 = +[NSString stringWithUTF8String:"NSData * _Nullable soft_SESKeyCreate(SecAccessControlRef _Nonnull, NSError * _Nullable __autoreleasing * _Nullable)"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"TKSecElemTokenSoftLinking.h", 25, @"%s", dlerror());

    goto LABEL_48;
  }
  v40(v35, v71);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  CFRelease(v35);
  if (v71 && *v71) {
    goto LABEL_41;
  }
  id v39 = v39;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  v43 = (void (*)(id, void))off_10000CF00;
  v96 = off_10000CF00;
  if (!off_10000CF00)
  {
    v88 = _NSConcreteStackBlock;
    uint64_t v89 = 3221225472;
    v90 = sub_100004FF8;
    v91 = &unk_1000083E8;
    v92 = &v93;
    v44 = (void *)sub_100004E3C();
    v45 = dlsym(v44, "SESKeyPublicKey");
    *(void *)(v92[1] + 24) = v45;
    off_10000CF00 = *(_UNKNOWN **)(v92[1] + 24);
    v43 = (void (*)(id, void))v94[3];
  }
  _Block_object_dispose(&v93, 8);
  if (!v43)
  {
    v56 = +[NSAssertionHandler currentHandler];
    v57 = +[NSString stringWithUTF8String:"NSData * _Nullable soft_SESKeyPublicKey(NSData * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)"];
    objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"TKSecElemTokenSoftLinking.h", 43, @"%s", dlerror());

LABEL_48:
    __break(1u);
  }
  v46 = v43(v39, 0);

  [v73 setObject:v46 forKeyedSubscript:@"pubk"];
  v97[0] = @"keyData";
  v97[1] = @"keyAttributes";
  v98[0] = v39;
  id v47 = [v73 copy];
  v98[1] = v47;
  v48 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];
  v49 = +[NSKeyedArchiver archivedDataWithRootObject:v48 requiringSecureCoding:0 error:v71];
  uint64_t v50 = kSecAttrTokenOID;
  [v73 setObject:v49 forKeyedSubscript:kSecAttrTokenOID];

  if (!v71 || !*v71)
  {
    v51 = [v73 objectForKeyedSubscript:v50];
    BOOL v52 = v51 == 0;

    if (!v52)
    {
      id v9 = v73;
      goto LABEL_42;
    }
  }
LABEL_41:
  id v9 = 0;
LABEL_42:

  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v82, 8);

LABEL_43:

  return v9;
}

- (id)tokenSession:(id)a3 attributesOfObject:(id)a4 error:(id *)a5
{
  id v7 = a4;
  unsigned int v8 = [(TKSecElemTokenSession *)self isOperationAuthorized:0 error:a5];
  id v9 = 0;
  if (v8)
  {
    if (sub_10000269C(v7))
    {
      id v9 = &__NSDictionary0__struct;
    }
    else
    {
      uint64_t v10 = sub_100002704(v7, a5);
      id v9 = [v10 objectForKeyedSubscript:@"keyAttributes"];
    }
  }

  return v9;
}

- (void)tokenSession:(id)a3 updateObject:(id)a4 attributes:(id)a5 reply:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, id, id, id))a6;
  id v20 = 0;
  LOBYTE(self) = [(TKSecElemTokenSession *)self isOperationAuthorized:0 error:&v20];
  id v12 = v20;
  BOOL v13 = v12;
  if (self)
  {
    id v19 = v12;
    v14 = sub_100002704(v9, &v19);
    id v15 = v19;

    if (v14)
    {
      id v16 = v9;
      id v17 = v10;
      id v18 = 0;
    }
    else
    {
      id v16 = 0;
      id v17 = 0;
      id v18 = v15;
    }
    v11[2](v11, v16, v17, v18);
  }
  else
  {
    v11[2](v11, 0, 0, v12);
    id v15 = v13;
  }
}

- (BOOL)tokenSession:(id)a3 supportsOperation:(int64_t)a4 usingKey:(id)a5 algorithm:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  if (!sub_10000269C(v8))
  {
    v11 = sub_100002704(v8, 0);
    if (v11)
    {
      switch(a4)
      {
        case 4:
          if (([v9 isAlgorithm:kSecKeyAlgorithmECDHKeyExchangeStandard] & 1) == 0)
          {
            id v12 = &kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA256;
            goto LABEL_14;
          }
          break;
        case 3:
          if (([v9 isAlgorithm:kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM] & 1) == 0)
          {
            CFStringRef v13 = @"kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESCBC";
LABEL_15:
            unsigned __int8 v10 = [v9 isAlgorithm:v13];
            goto LABEL_16;
          }
          break;
        case 2:
          id v12 = &kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
LABEL_14:
          CFStringRef v13 = *v12;
          goto LABEL_15;
        default:
          goto LABEL_8;
      }
      unsigned __int8 v10 = 1;
      goto LABEL_16;
    }
LABEL_8:
    unsigned __int8 v10 = 0;
LABEL_16:

    goto LABEL_17;
  }
  unsigned __int8 v10 = a4 == 1000;
LABEL_17:

  return v10;
}

- (id)tokenSession:(id)a3 signData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = 0;
  if ([(TKSecElemTokenSession *)self isOperationAuthorized:0 error:a7])
  {
    if (sub_10000269C(v14))
    {
      if (!a7)
      {
        id v16 = 0;
        goto LABEL_18;
      }
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      id v17 = +[NSString stringWithFormat:@"secelemtoken: kSecKeyAttestionKeyTypeSecureElement does not support signing"];
      v35 = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v18];
      id v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    id v17 = sub_100002704(v14, a7);
    if (v17)
    {
      if ([v15 isAlgorithm:kSecKeyAlgorithmECDSASignatureMessageX962SHA256])
      {
        id v19 = [v17 objectForKeyedSubscript:@"keyData"];
        v27 = [(TKSecElemTokenSession *)self LAContext];
        id v20 = [v27 externalizedContext];
        id v18 = v19;
        id v26 = v13;
        uint64_t v21 = (id)kSecKeyAlgorithmECDSASignatureMessageX962SHA256;
        id v22 = v20;
        uint64_t v28 = 0;
        unsigned __int8 v29 = &v28;
        uint64_t v30 = 0x2020000000;
        NSErrorUserInfoKey v23 = (void (*)(id, id, __CFString *, id, id *))off_10000CF08;
        unsigned __int8 v31 = off_10000CF08;
        if (!off_10000CF08)
        {
          CFStringRef v24 = (void *)sub_100004E3C();
          v29[3] = (uint64_t)dlsym(v24, "SESKeySignData");
          off_10000CF08 = (_UNKNOWN *)v29[3];
          NSErrorUserInfoKey v23 = (void (*)(id, id, __CFString *, id, id *))v29[3];
        }
        _Block_object_dispose(&v28, 8);
        if (!v23) {
          sub_100005200();
        }
        id v16 = v23(v18, v26, v21, v22, a7);

        goto LABEL_14;
      }
      if (a7)
      {
        NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
        id v18 = +[NSString stringWithFormat:@"secelemtoken: key does not support algorithm for signature"];
        id v33 = v18;
        v27 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v27];
        id v16 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
LABEL_17:

        goto LABEL_18;
      }
    }
    id v16 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v16;
}

- (id)tokenSession:(id)a3 performKeyExchangeWithPublicKey:(id)a4 usingKey:(id)a5 algorithm:(id)a6 parameters:(id)a7 error:(id *)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (sub_10000269C(v13))
  {
    if (!a8)
    {
      uint64_t v21 = 0;
      goto LABEL_15;
    }
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    id v15 = +[NSString stringWithFormat:@"secelemtoken: kSecKeyAttestionKeyTypeSecureElement does not support keyExchange"];
    v27 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a8 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v16];
    goto LABEL_4;
  }
  id v15 = sub_100002704(v13, a8);
  if (!v15 || ![(TKSecElemTokenSession *)self isOperationAuthorized:0 error:a8]) {
    goto LABEL_13;
  }
  id v17 = (__CFString *)kSecKeyAlgorithmECDHKeyExchangeStandard;
  if (![v14 isAlgorithm:kSecKeyAlgorithmECDHKeyExchangeStandard])
  {
    id v17 = (__CFString *)kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA256;
    if (![v14 isAlgorithm:kSecKeyAlgorithmECDHKeyExchangeStandardX963SHA256])
    {
      if (!a8) {
        goto LABEL_13;
      }
      id v16 = +[NSString stringWithFormat:@"secelemtoken: %@ algorithm not supported by the key", v14, NSLocalizedDescriptionKey];
      NSErrorUserInfoKey v25 = v16;
      id v22 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a8 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v22];

LABEL_4:
LABEL_13:
      uint64_t v21 = 0;
      goto LABEL_14;
    }
  }
  id v18 = [v15 objectForKeyedSubscript:@"keyData"];
  id v19 = [(TKSecElemTokenSession *)self LAContext];
  id v20 = [v19 externalizedContext];
  uint64_t v21 = sub_100004164(v18, v12, v17, v20, (uint64_t)a8);

LABEL_14:
LABEL_15:

  return v21;
}

- (id)tokenSession:(id)a3 decryptData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 parameters:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (sub_10000269C(v16))
  {
    if (!a8)
    {
      uint64_t v21 = 0;
      goto LABEL_18;
    }
    NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
    id v19 = +[NSString stringWithFormat:@"secelemtoken: kSecKeyAttestionKeyTypeSecureElement does not support decryption"];
    v46 = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v20];
    uint64_t v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  id v19 = sub_100002704(v16, a8);
  if (!v19 || ![(TKSecElemTokenSession *)self isOperationAuthorized:0 error:a8]) {
    goto LABEL_16;
  }
  if ([v17 isAlgorithm:kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM])
  {
    v37 = [v19 objectForKeyedSubscript:@"keyData"];
    v35 = [v18 objectForKeyedSubscript:@"kSecKeyKeyExchangeParameterPublicKey"];
    NSErrorUserInfoKey v32 = [(TKSecElemTokenSession *)self LAContext];
    id v33 = [v32 externalizedContext];
    unsigned __int8 v29 = [v18 objectForKeyedSubscript:kSecKeyKeyExchangeParameterSharedInfo];
    uint64_t v28 = [v18 objectForKeyedSubscript:kSecKeyEncryptionParameterSymmetricAAD];
    id v22 = [v18 objectForKeyedSubscript:@"kSecKeyKeyExchangeParameterAuthenticationTag"];
    id v20 = v37;
    id v30 = v15;
    id v38 = v35;
    unsigned __int8 v31 = (id)kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM;
    id v27 = v33;
    id v34 = v29;
    id v36 = v28;
    id v23 = v22;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v24 = (void (*)(id, id, id, __CFString *, id, id, id, id, id *))off_10000CF18;
    v42 = off_10000CF18;
    if (!off_10000CF18)
    {
      NSErrorUserInfoKey v25 = (void *)sub_100004E3C();
      v40[3] = (uint64_t)dlsym(v25, "SESKeyDecryptData");
      off_10000CF18 = (_UNKNOWN *)v40[3];
      uint64_t v24 = (void (*)(id, id, id, __CFString *, id, id, id, id, id *))v40[3];
    }
    _Block_object_dispose(&v39, 8);
    if (!v24) {
      sub_1000052F0();
    }
    uint64_t v21 = v24(v20, v30, v38, v31, v27, v34, v36, v23, a8);

    goto LABEL_14;
  }
  if (!a8)
  {
LABEL_16:
    uint64_t v21 = 0;
    goto LABEL_17;
  }
  NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
  id v20 = +[NSString stringWithFormat:@"secelemtoken: key does not support algorithm for decryption"];
  id v44 = v20;
  id v38 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v38];
  uint64_t v21 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_15:
LABEL_17:

LABEL_18:

  return v21;
}

- (id)tokenSession:(id)a3 attestKey:(id)a4 usingKey:(id)a5 nonce:(id)a6 error:(id *)a7
{
  id v36 = a3;
  id v12 = a4;
  id v13 = a5;
  id v37 = a6;
  if (!sub_10000269C(v12))
  {
    v35 = sub_100002704(v12, a7);
    if (!v35)
    {
      id v14 = 0;
LABEL_34:

      goto LABEL_35;
    }
    id v15 = [(TKSecElemTokenSession *)self parameters];
    id v34 = [v15 objectForKeyedSubscript:@"kSecKeyParameterSecElemTokenAttestationOIDs"];

    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a7)
        {
          id v32 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:0];
LABEL_28:
          id v14 = 0;
          *a7 = v32;
LABEL_33:

          goto LABEL_34;
        }
LABEL_32:
        id v14 = 0;
        goto LABEL_33;
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v16 = v34;
      id v17 = (char *)[v16 countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v39;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v16);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a7)
              {
                *a7 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:0];
              }

              goto LABEL_32;
            }
          }
          id v17 = (char *)[v16 countByEnumeratingWithState:&v38 objects:v51 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
    if (sub_10000269C(v13))
    {
      if ([(TKSecElemTokenSession *)self isOperationAuthorized:1 error:a7])
      {
        id v20 = [v35 objectForKeyedSubscript:@"keyData"];
        uint64_t v21 = [(TKSecElemTokenSession *)self applicationIdentifier];
        id v22 = [(TKSecElemTokenSession *)self parameters];
        id v23 = [v22 objectForKeyedSubscript:@"kSecKeyParameterSecElemTokenAttestationNonce"];
        id v24 = v20;
        id v25 = v21;
        id v26 = v23;
        id v27 = v34;
        uint64_t v47 = 0;
        v48 = &v47;
        uint64_t v49 = 0x2020000000;
        uint64_t v28 = (void (*)(id, id, id, id, id *))off_10000CF20;
        uint64_t v50 = off_10000CF20;
        if (!off_10000CF20)
        {
          v42 = _NSConcreteStackBlock;
          uint64_t v43 = 3221225472;
          id v44 = sub_100005138;
          NSErrorUserInfoKey v45 = &unk_1000083E8;
          v46 = &v47;
          unsigned __int8 v29 = (void *)sub_100004E3C();
          id v30 = dlsym(v29, "SESKeyCreateSEBAASCertificate");
          *(void *)(v46[1] + 24) = v30;
          off_10000CF20 = *(_UNKNOWN **)(v46[1] + 24);
          uint64_t v28 = (void (*)(id, id, id, id, id *))v48[3];
        }
        _Block_object_dispose(&v47, 8);
        if (!v28) {
          sub_100005368();
        }
        unsigned __int8 v31 = v25;
        id v14 = v28(v24, v25, v26, v27, a7);

        goto LABEL_33;
      }
      goto LABEL_32;
    }
    if (a7)
    {
      id v32 = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:0];
      goto LABEL_28;
    }
    goto LABEL_32;
  }
  if (a7)
  {
    +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:0];
    id v14 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
LABEL_35:

  return v14;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end