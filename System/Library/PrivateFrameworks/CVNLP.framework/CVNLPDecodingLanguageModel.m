@interface CVNLPDecodingLanguageModel
+ (id)_decodingLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6 type:(int)a7;
+ (id)decodingCVNLPLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5;
+ (id)decodingLMLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5;
+ (id)pathForLanguageModelForLocale:(id)a3 modelType:(int)a4 resourceType:(int)a5;
+ (unsigned)_normalizedLMTokenIDForWord:(id)a3 withTokenID:(unsigned int)TokenIDForString sourceLanguageModel:(id)a5 outScore:(double *)a6;
- (CVNLPDecodingLanguageModel)initWithCVNLPLanguageModel:(CVNLPLanguageModel *)a3 locale:(id)a4 decodingWeight:(id)a5;
- (CVNLPDecodingLanguageModel)initWithCVNLPLanguageModel:(CVNLPLanguageModel *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6;
- (CVNLPDecodingLanguageModel)initWithLMLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5;
- (CVNLPDecodingLanguageModel)initWithLMLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6;
- (CVNLPDecodingLanguageModel)initWithLanguageModel:(void *)a3;
- (CVNLPDecodingLanguageModel)initWithLanguageModel:(void *)a3 locale:(id)a4;
- (NSLocale)locale;
- (id)_initWithLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6 type:(int)a7;
- (int)lmSPIType;
- (int64_t)requiredContextLengthForStringLength:(int64_t)a3;
- (vector<unsigned)characterTokenIDsForString:(CVNLPDecodingLanguageModel *)self;
- (vector<unsigned)wordTokenIDsForString:(CVNLPDecodingLanguageModel *)self outTokenRanges:(SEL)a3;
- (void)dealloc;
- (void)languageModel;
@end

@implementation CVNLPDecodingLanguageModel

- (id)_initWithLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6 type:(int)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CVNLPDecodingLanguageModel;
  v16 = [(CVNLPInformationStream *)&v19 initWithDecodingWeight:v14 lowerBoundLogProbability:v15];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_locale, a4);
    v17->_lmSPIType = a7;
    if ((a7 - 1) < 2) {
      v17->_languageModel = (void *)CFRetain(a3);
    }
    v17->_tokenizer = (void *)LMStreamTokenizerCreate();
  }

  return v17;
}

- (CVNLPDecodingLanguageModel)initWithLMLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v13 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  id v15 = (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, v14, (uint64_t)a3, (uint64_t)v8, v9, v13, 1);

  return v15;
}

- (CVNLPDecodingLanguageModel)initWithLMLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6
{
  return (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 1);
}

- (CVNLPDecodingLanguageModel)initWithCVNLPLanguageModel:(CVNLPLanguageModel *)a3 locale:(id)a4 decodingWeight:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v13 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  id v15 = (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, v14, (uint64_t)a3, (uint64_t)v8, v9, v13, 2);

  return v15;
}

- (CVNLPDecodingLanguageModel)initWithCVNLPLanguageModel:(CVNLPLanguageModel *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6
{
  return (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 2);
}

- (CVNLPDecodingLanguageModel)initWithLanguageModel:(void *)a3 locale:(id)a4
{
  id v6 = a4;
  v10 = objc_msgSend_defaultDecodingWeight(CVNLPInformationStream, v7, v8, v9);
  id v14 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v11, v12, v13);
  v16 = (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, v15, (uint64_t)a3, (uint64_t)v6, v10, v14, 1);

  return v16;
}

- (CVNLPDecodingLanguageModel)initWithLanguageModel:(void *)a3
{
  return (CVNLPDecodingLanguageModel *)MEMORY[0x1F4181798](self, sel_initWithLanguageModel_locale_, a3, 0);
}

- (void)dealloc
{
  int lmSPIType = self->_lmSPIType;
  if (lmSPIType == 2)
  {
    CFRelease(self->_languageModel);
  }
  else if (lmSPIType == 1)
  {
    LMLanguageModelRelease();
  }
  if (self->_tokenizer) {
    LMStreamTokenizerRelease();
  }
  v4.receiver = self;
  v4.super_class = (Class)CVNLPDecodingLanguageModel;
  [(CVNLPDecodingLanguageModel *)&v4 dealloc];
}

- (int)lmSPIType
{
  return self->_lmSPIType;
}

+ (id)_decodingLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6 type:(int)a7
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v16 = a6;
  if (a7 == 2)
  {
    v69[0] = @"CVNLPLocaleKey";
    uint64_t v24 = objc_msgSend_localeIdentifier(v11, v13, v14, v15);
    v27 = (void *)v24;
    if (a4 == 2) {
      uint64_t v28 = 2;
    }
    else {
      uint64_t v28 = 1;
    }
    v70[0] = v24;
    v69[1] = @"CVNLPTokenTypeKey";
    v29 = objc_msgSend_numberWithInt_(NSNumber, v25, v28, v26);
    v70[1] = v29;
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v30, (uint64_t)v70, (uint64_t)v69, 2);

    v32 = (const void *)CVNLPLanguageModelCreate(v31);
    if (v32)
    {
      v33 = [CVNLPDecodingLanguageModel alloc];
      v23 = objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(v33, v34, (uint64_t)v32, (uint64_t)v11, v12, v16, 2);
      CFRelease(v32);
    }
    else
    {
      v23 = 0;
    }

    goto LABEL_24;
  }
  if (a7 != 1)
  {
LABEL_7:
    v23 = 0;
    goto LABEL_24;
  }
  if (a4 != 1)
  {
    if (a4 == 2)
    {
      uint64_t v73 = *MEMORY[0x1E4F723C8];
      v17 = objc_msgSend_localeIdentifier(v11, v13, v14, v15);
      v74[0] = v17;
      objc_super v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v74, (uint64_t)&v73, 1);

      uint64_t v20 = LMLanguageModelCreate();
      if (v20)
      {
        v21 = [CVNLPDecodingLanguageModel alloc];
        v23 = objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(v21, v22, v20, (uint64_t)v11, v12, v16, 1);
        LMLanguageModelRelease();
      }
      else
      {
        v23 = 0;
      }

      goto LABEL_24;
    }
    goto LABEL_7;
  }
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = sub_1B4C46298;
  v67 = sub_1B4C462A8;
  id v68 = 0;
  LDEnumerateAssetDataItems();
  v38 = (void *)v64[5];
  if (v38)
  {
    v39 = objc_msgSend_path(v38, v35, v36, v37);
    v43 = objc_msgSend_lastPathComponent(v39, v40, v41, v42);
    v47 = objc_msgSend_stringByDeletingPathExtension(v43, v44, v45, v46);

    v51 = objc_msgSend_stringByDeletingLastPathComponent(v39, v48, v49, v50);
    v71[0] = *MEMORY[0x1E4F723C8];
    v55 = objc_msgSend_languageCode(v11, v52, v53, v54);
    v72[0] = v55;
    v72[1] = MEMORY[0x1E4F1CC28];
    uint64_t v56 = *MEMORY[0x1E4F72380];
    v71[1] = *MEMORY[0x1E4F72358];
    v71[2] = v56;
    v71[3] = *MEMORY[0x1E4F72370];
    v72[2] = v51;
    v72[3] = v47;
    v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v57, (uint64_t)v72, (uint64_t)v71, 4);

    uint64_t v59 = LMLanguageModelCreate();
    if (v59)
    {
      v60 = [CVNLPDecodingLanguageModel alloc];
      v23 = objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(v60, v61, v59, (uint64_t)v11, v12, v16, 1);
      LMLanguageModelRelease();
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }
  _Block_object_dispose(&v63, 8);

LABEL_24:
  return v23;
}

+ (id)decodingLMLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_class();
  uint64_t v13 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  uint64_t v15 = objc_msgSend__decodingLanguageModelForLocale_modelType_decodingWeight_lowerBoundLogProbability_type_(v9, v14, (uint64_t)v7, v6, v8, v13, 1);

  return v15;
}

+ (id)decodingCVNLPLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_opt_class();
  uint64_t v13 = objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  uint64_t v15 = objc_msgSend__decodingLanguageModelForLocale_modelType_decodingWeight_lowerBoundLogProbability_type_(v9, v14, (uint64_t)v7, v6, v8, v13, 2);

  return v15;
}

+ (id)pathForLanguageModelForLocale:(id)a3 modelType:(int)a4 resourceType:(int)a5
{
  id v7 = a3;
  uint64_t v11 = v7;
  memset(&v38, 0, sizeof(v38));
  uint64_t v37 = &unk_1F0D55498;
  if (a4 != 2 || a5 != 1)
  {
    if (a4 != 1 || a5 != 2) {
      goto LABEL_18;
    }
    id v16 = objc_msgSend_languageCode(v7, v8, v9, v10);
    sub_1B4C2FDF4(v16, v35);

    v28[0] = (void *)0x736C65646F4DLL;
    char v29 = 6;
    v30 = objc_alloc_init(BundleHelper);
    sub_1B4C46A0C((uint64_t)v28, (uint64_t)v35, v26);
    sub_1B4C31FFC((uint64_t)v33, (uint64_t)v26);
    std::string::operator=(&v38, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((v27 & 0x80000000) == 0) {
        goto LABEL_16;
      }
    }
    else if ((v27 & 0x80000000) == 0)
    {
      goto LABEL_16;
    }
    v17 = v26[0];
    goto LABEL_15;
  }
  uint64_t v12 = objc_msgSend_languageCode(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_stringByAppendingPathExtension_(v12, v13, @"lm", v14);
  sub_1B4C2FDF4(v15, v35);

  strcpy((char *)v28, "Models/word_lm");
  char v29 = 14;
  v30 = objc_alloc_init(BundleHelper);
  sub_1B4C46A0C((uint64_t)v28, (uint64_t)v35, v31);
  sub_1B4C31FFC((uint64_t)v33, (uint64_t)v31);
  std::string::operator=(&v38, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v32 < 0)
    {
LABEL_12:
      v17 = (void *)v31[0];
LABEL_15:
      operator delete(v17);
    }
  }
  else if (v32 < 0)
  {
    goto LABEL_12;
  }
LABEL_16:

  if ((v29 & 0x80000000) == 0)
  {
    if ((v36 & 0x80000000) == 0) {
      goto LABEL_18;
    }
LABEL_23:
    operator delete(v35[0]);
    std::string::size_type size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
    if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v38.__r_.__value_.__l.__size_;
    }
    if (!size) {
      goto LABEL_37;
    }
    goto LABEL_26;
  }
  operator delete(v28[0]);
  if (v36 < 0) {
    goto LABEL_23;
  }
LABEL_18:
  std::string::size_type v18 = HIBYTE(v38.__r_.__value_.__r.__words[2]);
  if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v18 = v38.__r_.__value_.__l.__size_;
  }
  if (!v18) {
    goto LABEL_37;
  }
LABEL_26:
  if (!sub_1B4BF9C48((uint64_t)&v37))
  {
LABEL_37:
    v23 = 0;
    goto LABEL_40;
  }
  if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v20 = &v38;
  }
  else {
    uint64_t v20 = (std::string *)v38.__r_.__value_.__r.__words[0];
  }
  if (!v20)
  {
    v23 = (__CFString *)0;
    if (!v23) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v21 = HIBYTE(v38.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v21 = v38.__r_.__value_.__l.__size_;
  }
  v22 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)v20, v21, 0x8000100u, 0);
  if (!v22)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v23 = v22;
  if (v23) {
LABEL_39:
  }
    CFRelease(v23);
LABEL_40:
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v38.__r_.__value_.__l.__data_);
  }

  return v23;
}

- (int64_t)requiredContextLengthForStringLength:(int64_t)a3
{
  int lmSPIType = self->_lmSPIType;
  if (lmSPIType == 2) {
    return a3;
  }
  if (lmSPIType == 1) {
    return 5;
  }
  return 0;
}

- (vector<unsigned)characterTokenIDsForString:(CVNLPDecodingLanguageModel *)self
{
  id v6 = a4;
  uint64_t v10 = objc_msgSend_length(v6, v7, v8, v9);
  unint64_t v13 = objc_msgSend_requiredContextLengthForStringLength_(self, v11, v10, v12);
  unint64_t v17 = v13;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  v47 = 0;
  if (v13)
  {
    if (v13 >> 62) {
      sub_1B4BB3244();
    }
    std::string::size_type v18 = (char *)operator new(4 * v13);
    objc_super v19 = &v18[4 * v17];
    uint64_t v45 = v18;
    v47 = v19;
    memset_pattern16(v18, &unk_1B4C9AFF0, 4 * v17);
    uint64_t v46 = v19;
  }
  else
  {
    objc_super v19 = 0;
    std::string::size_type v18 = 0;
  }
  if (objc_msgSend_length(v6, v14, v15, v16))
  {
    uint64_t v23 = objc_msgSend_length(v6, v20, v21, v22) - 1;
    if (v23 >= 0)
    {
      if (v17)
      {
        do
        {
          uint64_t v24 = sub_1B4C48890(v6, v23, &v44);
          uint64_t v25 = v44;
          id v26 = v24;
          if (objc_msgSend_length(v26, v27, v28, v29) == 1)
          {
            uint64_t v33 = objc_msgSend_characterAtIndex_(v26, v30, 0, v32);
          }
          else if (objc_msgSend_length(v26, v30, v31, v32) == 2)
          {
            LODWORD(v33) = objc_msgSend_characterAtIndex_(v26, v34, 0, v35);
            int v38 = objc_msgSend_characterAtIndex_(v26, v36, 1, v37);
            if ((v38 & 0xFFF0) == 0xFE00) {
              uint64_t v33 = v33;
            }
            else {
              uint64_t v33 = (v38 + (v33 << 10) - 56613888);
            }
          }
          else
          {
            uint64_t v33 = 0xFFFFFFFFLL;
          }

          *(_DWORD *)&v18[4 * v17 - 4] = sub_1B4C454F8(v33);
          uint64_t v23 = v25 - 1;
          BOOL v39 = v17-- != 0;
        }
        while (((v25 - 1) & 0x8000000000000000) == 0 && v17 != 0 && v39);
      }
    }
  }
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  uint64_t v40 = v19 - v18;
  if (v19 != v18)
  {
    if (v40 < 0) {
      sub_1B4BB3244();
    }
    uint64_t v41 = (unsigned int *)operator new(v19 - v18);
    retstr->__begin_ = v41;
    uint64_t v42 = &v41[v40 >> 2];
    retstr->__end_cap_.__value_ = v42;
    memcpy(v41, v18, v19 - v18);
    retstr->__end_ = v42;
  }
  if (v18) {
    operator delete(v18);
  }

  return result;
}

- (vector<unsigned)wordTokenIDsForString:(CVNLPDecodingLanguageModel *)self outTokenRanges:(SEL)a3
{
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x4812000000;
  v48[3] = sub_1B4C47330;
  v48[4] = sub_1B4C47354;
  v48[5] = &unk_1B4C9FEA6;
  memset(&v48[6], 0, 24);
  id v33 = a4;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7);
  objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_stringByAppendingString_(v33, v8, @" ", v9);
  id v47 = 0;
  uint64_t v11 = sub_1B4C483E4(v10, &v47);
  id v12 = v47;

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x4012000000;
  uint64_t v37 = sub_1B4C4736C;
  int v38 = nullsub_17;
  BOOL v39 = &unk_1B4C9FEA6;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v40 = objc_msgSend_length(v11, v13, v14, v15);
  uint64_t v41 = 0;
  unint64_t v16 = v43[3];
  if (v16 < objc_msgSend_count(v12, v17, v18, v19))
  {
    uint64_t v22 = objc_msgSend_objectAtIndex_(v12, v20, v43[3], v21);
    uint64_t v26 = objc_msgSend_rangeValue(v22, v23, v24, v25);
    char v27 = v35;
    v35[6] = v26;
    v27[7] = v28;

    ++v43[3];
  }
  objc_msgSend_maximumLengthOfBytesUsingEncoding_(v11, v20, 4, v21);
  objc_msgSend_length(v11, v29, v30, v31);
  operator new[]();
}

+ (unsigned)_normalizedLMTokenIDForWord:(id)a3 withTokenID:(unsigned int)TokenIDForString sourceLanguageModel:(id)a5 outScore:(double *)a6
{
  id v8 = a3;
  objc_msgSend_languageModel(a5, v9, v10, v11);
  if (!TokenIDForString)
  {
    TokenIDForString = LMLanguageModelGetTokenIDForString();
    if (!TokenIDForString)
    {
      uint64_t v15 = objc_msgSend_lowercaseString(v8, v12, v13, v14);
      TokenIDForString = LMLanguageModelGetTokenIDForString();
    }
  }
  if (TokenIDForString == 28) {
    unsigned int v16 = 6;
  }
  else {
    unsigned int v16 = TokenIDForString;
  }
  if ((v16 & 0xFFFFFFFE) == 0x82) {
    unsigned int v17 = 3;
  }
  else {
    unsigned int v17 = v16;
  }

  return v17;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)languageModel
{
  return self->_languageModel;
}

- (void).cxx_destruct
{
}

@end