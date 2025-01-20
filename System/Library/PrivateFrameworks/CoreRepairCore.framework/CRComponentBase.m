@interface CRComponentBase
+ (id)sharedSingleton;
- (CRComponentBase)init;
- (NSString)identifierBase64;
- (id)sha256:(id)a3;
- (unsigned)CRCreateECDSADerData:(id)a3 responseDer:(id *)a4;
- (void)challengeComponentWith:(id)a3 withReply:(id)a4;
- (void)setIdentifierBase64:(id)a3;
@end

@implementation CRComponentBase

- (CRComponentBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRComponentBase;
  return [(CRComponentBase *)&v3 init];
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC1CA88;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC133F8 != -1) {
    dispatch_once(&qword_26AC133F8, block);
  }
  v2 = (void *)qword_26AC13430;
  return v2;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
}

- (unsigned)CRCreateECDSADerData:(id)a3 responseDer:(id *)a4
{
  CFDataRef v4 = (const __CFData *)a3;
  uint64_t v5 = DEREncoderCreate();
  if (!v5)
  {
    v30 = handleForCategory(0);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = 0;
LABEL_48:
      v11 = 0;
      v10 = 0;
      goto LABEL_58;
    }
    sub_21FC610C0();
LABEL_65:
    uint64_t v6 = 0;
    v11 = 0;
    v10 = 0;
    goto LABEL_58;
  }
  uint64_t v6 = DEREncoderCreate();
  if (!v6)
  {
    v30 = handleForCategory(0);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    sub_21FC610F4();
    goto LABEL_65;
  }
  BytePtr = CFDataGetBytePtr(v4);
  unsigned int Length = CFDataGetLength(v4);
  uint64_t v9 = Length >> 1;
  v10 = (char *)malloc_type_malloc((v9 + 1), 0x100004077774924uLL);
  v11 = (char *)malloc_type_malloc((v9 + 1), 0x100004077774924uLL);
  bzero(v11, (v9 + 1));
  bzero(v10, (v9 + 1));
  if (*(char *)BytePtr < 0)
  {
    CFDataRef v12 = v4;
    if (Length >= 2)
    {
      if (v9 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v9;
      }
      v18 = v10 + 1;
      v19 = BytePtr;
      do
      {
        char v20 = *v19++;
        *v18++ = v20;
        --v17;
      }
      while (v17);
    }
  }
  else
  {
    CFDataRef v12 = v4;
    if (Length >= 2)
    {
      if (v9 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v9;
      }
      v14 = BytePtr;
      v15 = v10;
      do
      {
        char v16 = *v14++;
        *v15++ = v16;
        --v13;
      }
      while (v13);
    }
  }
  if ((char)BytePtr[v9] < 0)
  {
    if (Length >= 2)
    {
      if (v9 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v9;
      }
      v26 = &BytePtr[v9];
      v27 = v11 + 1;
      do
      {
        char v28 = *v26++;
        *v27++ = v28;
        --v25;
      }
      while (v25);
    }
  }
  else if (Length >= 2)
  {
    if (v9 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v9;
    }
    v22 = &BytePtr[v9];
    v23 = v11;
    do
    {
      char v24 = *v22++;
      *v23++ = v24;
      --v21;
    }
    while (v21);
  }
  if (DEREncoderAddData())
  {
    v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C2B4();
    }
    CFDataRef v4 = v12;
  }
  else if (DEREncoderAddData())
  {
    v30 = handleForCategory(0);
    CFDataRef v4 = v12;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC5C2B4();
    }
  }
  else
  {
    CFDataRef v4 = v12;
    if (DEREncoderAddSequenceFromEncoder())
    {
      v30 = handleForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_21FC611C4();
      }
    }
    else
    {
      if (!DEREncoderCreateEncodedBuffer())
      {
        v31 = handleForCategory(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_21FC61128();
        }
        goto LABEL_60;
      }
      v30 = handleForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_21FC61190();
      }
    }
  }
LABEL_58:

  v31 = handleForCategory(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_21FC6103C(v31);
  }
LABEL_60:

  if (v5) {
    DEREncoderDestroy();
  }
  if (v6) {
    DEREncoderDestroy();
  }
  if (v10) {
    free(v10);
  }
  if (v11) {
    free(v11);
  }

  return 3;
}

- (id)sha256:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v7 = (const void *)objc_msgSend_bytes(v3, v4, v5, v6);
  CC_LONG v11 = objc_msgSend_length(v3, v8, v9, v10);

  CFDataRef v12 = CC_SHA256(v7, v11, md);
  if (v12)
  {
    CFDataRef v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v13, (uint64_t)md, 32);
  }
  return v12;
}

- (NSString)identifierBase64
{
  return self->identifierBase64;
}

- (void)setIdentifierBase64:(id)a3
{
}

- (void).cxx_destruct
{
}

@end