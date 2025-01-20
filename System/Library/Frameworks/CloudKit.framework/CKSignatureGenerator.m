@interface CKSignatureGenerator
+ (BOOL)isValidSignature:(id)a3;
+ (BOOL)isValidV2Signature:(id)a3;
+ (id)signatureForStreamingAsset;
+ (id)signatureWithFileDescriptor:(int)a3 boundaryKey:(id)a4 error:(id *)a5;
+ (id)signatureWithFileDescriptor:(int)a3 error:(id *)a4;
- (BOOL)isValid;
- (CKSignatureGenerator)init;
- (CKSignatureGenerator)initWithBoundaryKey:(id)a3;
- (CKSignatureGenerator)initWithVerificationKey:(id)a3;
- (char)_newSignatureByFinishingGenerator;
- (id)dataByFinishingSignature;
- (void)dealloc;
- (void)generator;
- (void)setGenerator:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4;
- (void)updateWithData:(id)a3;
@end

@implementation CKSignatureGenerator

- (CKSignatureGenerator)init
{
  v20.receiver = self;
  v20.super_class = (Class)CKSignatureGenerator;
  v2 = [(CKSignatureGenerator *)&v20 init];
  v6 = v2;
  if (!v2) {
    return v6;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v7 = (uint64_t (*)(void))off_1E912FE10;
  v29 = off_1E912FE10;
  if (!off_1E912FE10)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = sub_18B1403A4;
    v24 = &unk_1E545FF40;
    v25 = &v26;
    v8 = sub_18B1403F4((uint64_t)v2, v3, v4, v5);
    v9 = dlsym(v8, "MMCSSignatureGeneratorCreate");
    *(void *)(v25[1] + 24) = v9;
    off_1E912FE10 = *(_UNKNOWN **)(v25[1] + 24);
    v7 = (uint64_t (*)(void))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v7)
  {
    v6->_generator = (void *)v7();
    v6->_valid = 1;
    return v6;
  }
  v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
  v17 = objc_msgSend_stringWithUTF8String_(NSString, v15, (uint64_t)"void *__MMCSSignatureGeneratorCreate(void)", v16);
  v18 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v14, v19, (uint64_t)v17, @"CKSignatureGenerator.m", 24, @"%s", v18);

  __break(1u);
  return result;
}

- (CKSignatureGenerator)initWithBoundaryKey:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKSignatureGenerator;
  uint64_t v5 = [(CKSignatureGenerator *)&v23 init];
  v9 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  v10 = (uint64_t (*)(id))off_1E912FE18;
  v32 = off_1E912FE18;
  if (!off_1E912FE18)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_18B1405BC;
    v27 = &unk_1E545FF40;
    uint64_t v28 = &v29;
    uint64_t v11 = sub_18B1403F4((uint64_t)v5, v6, v7, v8);
    uint64_t v12 = dlsym(v11, "MMCSSignatureGeneratorCreateWithBoundaryKey");
    *(void *)(v28[1] + 24) = v12;
    off_1E912FE18 = *(_UNKNOWN **)(v28[1] + 24);
    v10 = (uint64_t (*)(id))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (v10)
  {
    v9->_generator = (void *)v10(v4);
    v9->_valid = 1;
LABEL_6:

    return v9;
  }
  v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
  objc_super v20 = objc_msgSend_stringWithUTF8String_(NSString, v18, (uint64_t)"void *__MMCSSignatureGeneratorCreateWithBoundaryKey(CFDataRef)", v19);
  uint64_t v21 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v17, v22, (uint64_t)v20, @"CKSignatureGenerator.m", 28, @"%s", v21);

  __break(1u);
  return result;
}

- (CKSignatureGenerator)initWithVerificationKey:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKSignatureGenerator;
  uint64_t v5 = [(CKSignatureGenerator *)&v23 init];
  v9 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  v10 = (uint64_t (*)(id))off_1E912FE20;
  v32 = off_1E912FE20;
  if (!off_1E912FE20)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_18B14060C;
    v27 = &unk_1E545FF40;
    uint64_t v28 = &v29;
    uint64_t v11 = sub_18B1403F4((uint64_t)v5, v6, v7, v8);
    uint64_t v12 = dlsym(v11, "MMCSSignatureGeneratorCreateWithVerificationKey");
    *(void *)(v28[1] + 24) = v12;
    off_1E912FE20 = *(_UNKNOWN **)(v28[1] + 24);
    v10 = (uint64_t (*)(id))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (v10)
  {
    v9->_generator = (void *)v10(v4);
    v9->_valid = 1;
LABEL_6:

    return v9;
  }
  v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14, v15);
  objc_super v20 = objc_msgSend_stringWithUTF8String_(NSString, v18, (uint64_t)"void *__MMCSSignatureGeneratorCreateWithVerificationKey(CFDataRef)", v19);
  uint64_t v21 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v17, v22, (uint64_t)v20, @"CKSignatureGenerator.m", 33, @"%s", v21);

  __break(1u);
  return result;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend__newSignatureByFinishingGenerator(self, a2, v2, v3);
  if (v5) {
    free(v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)CKSignatureGenerator;
  [(CKSignatureGenerator *)&v6 dealloc];
}

- (char)_newSignatureByFinishingGenerator
{
  if (!objc_msgSend_isValid(self, a2, v2, v3)) {
    return 0;
  }
  objc_msgSend_setValid_(self, v5, 0, v6);
  uint64_t v10 = objc_msgSend_generator(self, v7, v8, v9);
  uint64_t v14 = v10;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v15 = (uint64_t (*)(uint64_t))off_1E912FE28;
  v30 = off_1E912FE28;
  if (!off_1E912FE28)
  {
    uint64_t v16 = sub_18B1403F4(v10, v11, v12, v13);
    v28[3] = (uint64_t)dlsym(v16, "MMCSSignatureGeneratorFinish");
    off_1E912FE28 = (_UNKNOWN *)v28[3];
    uint64_t v15 = (uint64_t (*)(uint64_t))v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v15)
  {
    result = (char *)v15(v14);
    self->_generator = 0;
  }
  else
  {
    uint64_t v21 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18, v19);
    uint64_t v24 = objc_msgSend_stringWithUTF8String_(NSString, v22, (uint64_t)"unsigned char *__MMCSSignatureGeneratorFinish(void *)", v23);
    uint64_t v25 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v26, (uint64_t)v24, @"CKSignatureGenerator.m", 40, @"%s", v25);

    __break(1u);
  }
  return result;
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if ((objc_msgSend_isValid(self, a2, (uint64_t)a3, a4) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, @"CKSignatureGenerator.m", 119, @"Attempted to update an invalidated signature generator");
  }
  uint64_t v11 = objc_msgSend_generator(self, v8, v9, v10);

  sub_18B13F710(v11, (const char *)a3, a4, v12);
}

- (void)updateWithData:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend_isValid(self, v6, v7, v8) & 1) == 0)
  {
    uint64_t v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10, v11);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, (uint64_t)self, @"CKSignatureGenerator.m", 124, @"Attempted to update an invalidated signature generator");
  }
  id v27 = v5;
  uint64_t v15 = objc_msgSend_generator(self, v12, v13, v14);
  uint64_t v19 = (const char *)objc_msgSend_bytes(v27, v16, v17, v18);
  uint64_t v23 = objc_msgSend_length(v27, v20, v21, v22);
  sub_18B13F710(v15, v19, v23, v24);
}

- (id)dataByFinishingSignature
{
  uint64_t v4 = objc_msgSend__newSignatureByFinishingGenerator(self, a2, v2, v3);
  id v5 = (void *)MEMORY[0x1E4F1C9B8];
  sub_18B13F9BC(v4, v6, v7, v8);

  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v5, v10, v4, v9, 1);
}

+ (id)signatureWithFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v28[0] = 0;
  if (a4) {
    uint64_t v6 = v28;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v7 = (uint64_t (*)(uint64_t, id *))off_1E912FE38;
  v33 = off_1E912FE38;
  if (!off_1E912FE38)
  {
    v28[1] = (id)MEMORY[0x1E4F143A8];
    v28[2] = (id)3221225472;
    v28[3] = sub_18B14074C;
    v28[4] = &unk_1E545FF40;
    uint64_t v29 = &v30;
    uint64_t v8 = sub_18B1403F4((uint64_t)a1, a2, *(uint64_t *)&a3, (uint64_t)a4);
    uint64_t v9 = dlsym(v8, "MMCSSignatureCreateFromFileDescriptor");
    *(void *)(v29[1] + 24) = v9;
    off_1E912FE38 = *(_UNKNOWN **)(v29[1] + 24);
    uint64_t v7 = (uint64_t (*)(uint64_t, id *))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v7)
  {
    uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11, v12);
    uint64_t v25 = objc_msgSend_stringWithUTF8String_(NSString, v23, (uint64_t)"unsigned char *__MMCSSignatureCreateFromFileDescriptor(int, CFErrorRef *)", v24);
    uint64_t v26 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v22, v27, (uint64_t)v25, @"CKSignatureGenerator.m", 43, @"%s", v26);

    __break(1u);
    return result;
  }
  uint64_t v16 = v7(v5, v6);
  if (v28[0])
  {
    if (!a4)
    {
      CFRelease(v28[0]);
      if (v16) {
        goto LABEL_11;
      }
LABEL_13:
      objc_super v20 = 0;
      goto LABEL_14;
    }
    *a4 = v28[0];
  }
  if (!v16) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v17 = (void *)MEMORY[0x1E4F1C9B8];
  sub_18B13F9BC(v16, v13, v14, v15);
  objc_super v20 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v17, v19, v16, v18, 1);
LABEL_14:

  return v20;
}

+ (id)signatureWithFileDescriptor:(int)a3 boundaryKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v11 = v7;
  v34[0] = 0;
  if (a5) {
    uint64_t v12 = v34;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v13 = (uint64_t (*)(void *, uint64_t, id *))off_1E912FE40;
  v39 = off_1E912FE40;
  if (!off_1E912FE40)
  {
    v34[1] = (id)MEMORY[0x1E4F143A8];
    v34[2] = (id)3221225472;
    v34[3] = sub_18B14079C;
    v34[4] = &unk_1E545FF40;
    v35 = &v36;
    uint64_t v14 = sub_18B1403F4((uint64_t)v7, v8, v9, v10);
    uint64_t v15 = dlsym(v14, "MMCSSignatureCreateWithBoundaryKeyFromFileDescriptor");
    *(void *)(v35[1] + 24) = v15;
    off_1E912FE40 = *(_UNKNOWN **)(v35[1] + 24);
    uint64_t v13 = (uint64_t (*)(void *, uint64_t, id *))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v13)
  {
    uint64_t v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17, v18);
    uint64_t v31 = objc_msgSend_stringWithUTF8String_(NSString, v29, (uint64_t)"unsigned char *__MMCSSignatureCreateWithBoundaryKeyFromFileDescriptor(CFDataRef, int, CFErrorRef *)", v30);
    uint64_t v32 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v28, v33, (uint64_t)v31, @"CKSignatureGenerator.m", 46, @"%s", v32);

    __break(1u);
    return result;
  }
  uint64_t v22 = v13(v11, v6, v12);
  if (v34[0])
  {
    if (!a5)
    {
      CFRelease(v34[0]);
      if (v22) {
        goto LABEL_11;
      }
LABEL_13:
      uint64_t v26 = 0;
      goto LABEL_14;
    }
    *a5 = v34[0];
  }
  if (!v22) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v23 = (void *)MEMORY[0x1E4F1C9B8];
  sub_18B13F9BC(v22, v19, v20, v21);
  uint64_t v26 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v23, v25, v22, v24, 1);
LABEL_14:

  return v26;
}

+ (BOOL)isValidSignature:(id)a3
{
  id v3 = a3;
  if (!objc_msgSend_length(v3, v4, v5, v6)
    || (uint64_t v10 = objc_msgSend_length(v3, v7, v8, v9),
        uint64_t v14 = objc_msgSend_bytes(v3, v11, v12, v13),
        sub_18B13F9BC(v14, v15, v16, v17),
        v10 != v21))
  {
    BOOL v32 = 0;
    goto LABEL_8;
  }
  uint64_t v22 = objc_msgSend_bytes(v3, v18, v19, v20);
  uint64_t v26 = v22;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  id v27 = (unsigned int (*)(uint64_t))off_1E912FE48;
  v43 = off_1E912FE48;
  if (!off_1E912FE48)
  {
    uint64_t v28 = sub_18B1403F4(v22, v23, v24, v25);
    v41[3] = (uint64_t)dlsym(v28, "MMCSSignatureIsValid");
    off_1E912FE48 = (_UNKNOWN *)v41[3];
    id v27 = (unsigned int (*)(uint64_t))v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (v27)
  {
    BOOL v32 = v27(v26) != 0;
LABEL_8:

    return v32;
  }
  v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v29, v30, v31);
  v37 = objc_msgSend_stringWithUTF8String_(NSString, v35, (uint64_t)"Boolean __MMCSSignatureIsValid(const unsigned char *)", v36);
  uint64_t v38 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v34, v39, (uint64_t)v37, @"CKSignatureGenerator.m", 52, @"%s", v38);

  __break(1u);
  return result;
}

+ (BOOL)isValidV2Signature:(id)a3
{
  id v3 = a3;
  if (!objc_msgSend_length(v3, v4, v5, v6)
    || (uint64_t v10 = objc_msgSend_length(v3, v7, v8, v9),
        uint64_t v14 = objc_msgSend_bytes(v3, v11, v12, v13),
        sub_18B13F9BC(v14, v15, v16, v17),
        v10 != v21))
  {
    BOOL v32 = 0;
    goto LABEL_8;
  }
  uint64_t v22 = objc_msgSend_bytes(v3, v18, v19, v20);
  uint64_t v26 = v22;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  id v27 = (unsigned int (*)(uint64_t))off_1E9129C00;
  v43 = off_1E9129C00;
  if (!off_1E9129C00)
  {
    uint64_t v28 = sub_18B1403F4(v22, v23, v24, v25);
    v41[3] = (uint64_t)dlsym(v28, "MMCSSignatureIsValidV2");
    off_1E9129C00 = (_UNKNOWN *)v41[3];
    id v27 = (unsigned int (*)(uint64_t))v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (v27)
  {
    BOOL v32 = v27(v26) != 0;
LABEL_8:

    return v32;
  }
  v34 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v29, v30, v31);
  v37 = objc_msgSend_stringWithUTF8String_(NSString, v35, (uint64_t)"Boolean __MMCSSignatureIsValidV2(const unsigned char *)", v36);
  uint64_t v38 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v34, v39, (uint64_t)v37, @"CKSignatureGenerator.m", 55, @"%s", v38);

  __break(1u);
  return result;
}

+ (id)signatureForStreamingAsset
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA58]);
  uint64_t v5 = objc_msgSend_initWithCapacity_(v2, v3, 21, v4);
  char v17 = 3;
  objc_msgSend_appendBytes_length_(v5, v6, (uint64_t)&v17, 1);
  for (uint64_t i = 0; i != 20; ++i)
    v18[i] = arc4random();
  uint64_t v9 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v8, (uint64_t)v18, 20);
  objc_msgSend_appendData_(v5, v10, (uint64_t)v9, v11);
  uint64_t v15 = objc_msgSend_copy(v5, v12, v13, v14);

  return v15;
}

- (void)generator
{
  return self->_generator;
}

- (void)setGenerator:(void *)a3
{
  self->_generator = a3;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end