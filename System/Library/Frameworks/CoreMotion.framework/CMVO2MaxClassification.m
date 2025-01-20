@interface CMVO2MaxClassification
+ (int)CLHKBiologicalSexFromBiologicalSex:(int64_t)a3;
+ (int64_t)biologicalSexFromCLHKBiologicalSex:(int)a3;
- (CMVO2MaxClassification)init;
- (id).cxx_construct;
- (id)classificationDataFromStruct:(CLVO2MaxClassificationData *)a3;
- (void)queryAllClassificationsWithHandler:(id)a3;
- (void)queryClassificationForBiologicalSex:(int64_t)a3 age:(int64_t)a4 handler:(id)a5;
- (void)queryClassificationForBiologicalSex:(int64_t)a3 age:(int64_t)a4 vo2Max:(double)a5 handler:(id)a6;
@end

@implementation CMVO2MaxClassification

- (CMVO2MaxClassification)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMVO2MaxClassification;
  if ([(CMVO2MaxClassification *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)queryAllClassificationsWithHandler:(id)a3
{
  sub_1904F02E4((uint64_t *)self->fVO2MaxClassifier.__ptr_.__value_, &__p);
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v8 = objc_msgSend_initWithCapacity_(v5, v6, (v16 - (unsigned char *)__p) >> 5);
  v9 = __p;
  v10 = v16;
  while (v9 != v10)
  {
    long long v11 = v9[1];
    v14[0] = *v9;
    v14[1] = v11;
    uint64_t v12 = objc_msgSend_classificationDataFromStruct_(self, v7, (uint64_t)v14);
    objc_msgSend_addObject_(v8, v13, v12);
    v9 += 2;
  }
  (*((void (**)(id, void *, void))a3 + 2))(a3, v8, 0);

  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
}

- (void)queryClassificationForBiologicalSex:(int64_t)a3 age:(int64_t)a4 handler:(id)a5
{
  unsigned int v6 = a4;
  v30[1] = *MEMORY[0x1E4F143B8];
  if ((a4 - 20) >= 0xB5)
  {
    uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, a2, @"Age parameter is outside of supported range for VO2 Max classification");
    v20 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E4F28B50], v19, @"com.apple.coremotion");
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = objc_msgSend_localizedStringForKey_value_table_(v20, v21, v18, &stru_1EDFD5D50, 0);
    uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v30, &v29, 1);
    uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v24, @"CMErrorDomain", 107, v23);
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, v25);
  }
  else
  {
    int v8 = objc_msgSend_CLHKBiologicalSexFromBiologicalSex_(CMVO2MaxClassification, a2, a3);
    sub_1904F0940(self->fVO2MaxClassifier.__ptr_.__value_, v8, v6, (char **)&__p);
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_initWithCapacity_(v9, v10, (v28 - (unsigned char *)__p) >> 5);
    v13 = __p;
    v14 = v28;
    while (v13 != v14)
    {
      long long v15 = v13[1];
      v26[0] = *v13;
      v26[1] = v15;
      uint64_t v16 = objc_msgSend_classificationDataFromStruct_(self, v11, (uint64_t)v26);
      objc_msgSend_addObject_(v12, v17, v16);
      v13 += 2;
    }
    (*((void (**)(id, void *, void))a5 + 2))(a5, v12, 0);

    if (__p)
    {
      v28 = __p;
      operator delete(__p);
    }
  }
}

- (void)queryClassificationForBiologicalSex:(int64_t)a3 age:(int64_t)a4 vo2Max:(double)a5 handler:(id)a6
{
  unsigned int v7 = a4;
  v32[1] = *MEMORY[0x1E4F143B8];
  if ((a4 - 20) >= 0xB5)
  {
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, a2, @"Age parameter is outside of supported range for VO2 Max classification", a5);
    v22 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E4F28B50], v21, @"com.apple.coremotion");
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = objc_msgSend_localizedStringForKey_value_table_(v22, v23, v20, &stru_1EDFD5D50, 0);
    uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v32, &v31, 1);
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v26, @"CMErrorDomain", 107, v25);
    (*((void (**)(id, void, uint64_t))a6 + 2))(a6, 0, v27);
  }
  else
  {
    unsigned int v10 = objc_msgSend_CLHKBiologicalSexFromBiologicalSex_(CMVO2MaxClassification, a2, a3);
    sub_1904F0DF8(self->fVO2MaxClassifier.__ptr_.__value_, v10, v7, (uint64_t *)&__p, a5);
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v14 = objc_msgSend_initWithCapacity_(v11, v12, (v30 - (unsigned char *)__p) >> 5);
    long long v15 = __p;
    uint64_t v16 = v30;
    while (v15 != v16)
    {
      long long v17 = v15[1];
      v28[0] = *v15;
      v28[1] = v17;
      uint64_t v18 = objc_msgSend_classificationDataFromStruct_(self, v13, (uint64_t)v28);
      objc_msgSend_addObject_(v14, v19, v18);
      v15 += 2;
    }
    (*((void (**)(id, void *, void))a6 + 2))(a6, v14, 0);

    if (__p)
    {
      v30 = __p;
      operator delete(__p);
    }
  }
}

- (id)classificationDataFromStruct:(CLVO2MaxClassificationData *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_biologicalSexFromCLHKBiologicalSex_(CMVO2MaxClassification, a2, a3->var0);
  uint64_t var1 = a3->var1;
  uint64_t var2 = a3->var2;
  uint64_t var3 = a3->var3;
  if (var3 >= 4)
  {
    if (qword_1E929D928 != -1) {
      dispatch_once(&qword_1E929D928, &unk_1EDFD21E0);
    }
    int v8 = qword_1E929D930;
    if (os_log_type_enabled((os_log_t)qword_1E929D930, OS_LOG_TYPE_FAULT))
    {
      int v9 = a3->var3;
      *(_DWORD *)buf = 67174657;
      int v15 = v9;
      _os_log_impl(&dword_1902AF000, v8, OS_LOG_TYPE_FAULT, "[CMVO2MaxClassification] Unexpected classificationType: %{private}d", buf, 8u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D928 != -1) {
        dispatch_once(&qword_1E929D928, &unk_1EDFD21E0);
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMVO2MaxClassification classificationDataFromStruct:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    uint64_t var3 = 0;
  }
  if (var2 == 200) {
    uint64_t var2 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v10 = [CMVO2MaxClassificationData alloc];
  return (id)objc_msgSend_initWithBiologicalSex_ageLowerBound_ageUpperBound_classificationType_vo2MaxLowerBound_vo2MaxUpperBound_(v10, v11, v4, var1, var2, var3, a3->var4, a3->var5);
}

+ (int64_t)biologicalSexFromCLHKBiologicalSex:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 3) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

+ (int)CLHKBiologicalSexFromBiologicalSex:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end