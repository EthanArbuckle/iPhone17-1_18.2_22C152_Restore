@interface CHRemoteRecognitionTextRequest
+ (BOOL)supportsSecureCoding;
+ (id)loadFromFile:(id)a3;
- (BOOL)enableGen2CharacterLMIfAvailable;
- (BOOL)enableGen2ModelIfAvailable;
- (BOOL)enableStrokeReordering;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRecognitionTextRequest:(id)a3;
- (BOOL)shouldRemoveUnnaturalGaps;
- (BOOL)shouldUseTextReplacements;
- (CHRemoteRecognitionTextRequest)initWithCoder:(id)a3;
- (CHRemoteRecognitionTextRequest)initWithLocales:(id)a3 recognitionMode:(int)a4 drawing:(id)a5 options:(id)a6 priority:(int64_t)a7;
- (NSArray)locales;
- (NSDictionary)activeCharacterSetPerLocale;
- (NSDictionary)parametersOverride;
- (NSSet)customLexiconEntries;
- (id)description;
- (id)recognizerConfigurationKeyWithLocale:(id)a3;
- (int)autoCapitalizationMode;
- (int)autoCorrectionMode;
- (int)baseWritingDirection;
- (int)contentType;
- (int)recognitionMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCharacterSetPerLocale:(id)a3;
- (void)setAutoCapitalizationMode:(int)a3;
- (void)setAutoCorrectionMode:(int)a3;
- (void)setBaseWritingDirection:(int)a3;
- (void)setContentType:(int)a3;
- (void)setCustomLexiconEntries:(id)a3;
- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3;
- (void)setEnableGen2ModelIfAvailable:(BOOL)a3;
- (void)setEnableStrokeReordering:(BOOL)a3;
- (void)setLocales:(id)a3;
- (void)setParametersOverride:(id)a3;
- (void)setRecognitionMode:(int)a3;
- (void)setShouldUseTextReplacements:(BOOL)a3;
@end

@implementation CHRemoteRecognitionTextRequest

- (CHRemoteRecognitionTextRequest)initWithLocales:(id)a3 recognitionMode:(int)a4 drawing:(id)a5 options:(id)a6 priority:(int64_t)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!objc_msgSend_count(v12, v15, v16, v17, v18, v19))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v20 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v20, OS_LOG_TYPE_FAULT, "CHRemoteRecognitionTextRequest must be initialized with at least one locale", buf, 2u);
    }
  }
  v47.receiver = self;
  v47.super_class = (Class)CHRemoteRecognitionTextRequest;
  v21 = [(CHRemoteRecognitionRequest *)&v47 initWithDrawing:v13 options:v14 priority:a7];
  objc_msgSend_setLocales_(v21, v22, (uint64_t)v12, v23, v24, v25);
  objc_msgSend_setRecognitionMode_(v21, v26, v10, v27, v28, v29);
  v35 = objc_msgSend_parametersOverride(CHRecognizerConfiguration, v30, v31, v32, v33, v34);
  v41 = objc_msgSend_copy(v35, v36, v37, v38, v39, v40);
  objc_msgSend_setParametersOverride_(v21, v42, (uint64_t)v41, v43, v44, v45);

  return v21;
}

- (CHRemoteRecognitionTextRequest)initWithCoder:(id)a3
{
  v112[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)CHRemoteRecognitionTextRequest;
  v5 = [(CHRemoteRecognitionRequest *)&v108 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v112[0] = objc_opt_class();
    v112[1] = objc_opt_class();
    uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v112, 2, v8, v9);
    v15 = objc_msgSend_setWithArray_(v6, v11, (uint64_t)v10, v12, v13, v14);
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, @"locales", v17, v18);

    if (v19 && objc_msgSend_count(v19, v20, v21, v22, v23, v24))
    {
      objc_storeStrong((id *)&v5->_locales, v19);
      v5->_recognitionMode = objc_msgSend_decodeIntegerForKey_(v4, v25, @"recognitionMode", v26, v27, v28);
      v5->_contentType = objc_msgSend_decodeIntegerForKey_(v4, v29, @"contentType", v30, v31, v32);
      v5->_autoCapitalizationMode = objc_msgSend_decodeIntegerForKey_(v4, v33, @"autoCapitalizationMode", v34, v35, v36);
      v5->_autoCorrectionMode = objc_msgSend_decodeIntegerForKey_(v4, v37, @"autoCorrectionMode", v38, v39, v40);
      *(void *)&v5->_baseWritingDirection = objc_msgSend_decodeIntegerForKey_(v4, v41, @"baseWritingDirection", v42, v43, v44);
      uint64_t v45 = (void *)MEMORY[0x1E4F1CAD0];
      v111[0] = objc_opt_class();
      v111[1] = objc_opt_class();
      v111[2] = objc_opt_class();
      v49 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v46, (uint64_t)v111, 3, v47, v48);
      v54 = objc_msgSend_setWithArray_(v45, v50, (uint64_t)v49, v51, v52, v53);
      uint64_t v58 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, @"activeCharacterSetPerLocale", v56, v57);
      activeCharacterSetPerLocale = v5->_activeCharacterSetPerLocale;
      v5->_activeCharacterSetPerLocale = (NSDictionary *)v58;

      v5->_shouldUseTextReplacements = objc_msgSend_decodeBoolForKey_(v4, v60, @"shouldUseTextReplacements", v61, v62, v63);
      v5->_enableGen2ModelIfAvailable = objc_msgSend_decodeBoolForKey_(v4, v64, @"enableGen2ModelIfAvailable", v65, v66, v67);
      v5->_enableGen2CharacterLMIfAvailable = objc_msgSend_decodeBoolForKey_(v4, v68, @"enableGen2CharacterLMIfAvailable", v69, v70, v71);
      v5->_enableStrokeReordering = objc_msgSend_decodeBoolForKey_(v4, v72, @"enableStrokeReordering", v73, v74, v75);
      v76 = (void *)MEMORY[0x1E4F1CAD0];
      v110[0] = objc_opt_class();
      v110[1] = objc_opt_class();
      v110[2] = objc_opt_class();
      v80 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v77, (uint64_t)v110, 3, v78, v79);
      v85 = objc_msgSend_setWithArray_(v76, v81, (uint64_t)v80, v82, v83, v84);
      uint64_t v89 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v85, @"parameterOverride", v87, v88);
      parametersOverride = v5->_parametersOverride;
      v5->_parametersOverride = (NSDictionary *)v89;

      v91 = (void *)MEMORY[0x1E4F1CAD0];
      v109[0] = objc_opt_class();
      v109[1] = objc_opt_class();
      v95 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v92, (uint64_t)v109, 2, v93, v94);
      v100 = objc_msgSend_setWithArray_(v91, v96, (uint64_t)v95, v97, v98, v99);
      uint64_t v104 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v101, (uint64_t)v100, @"customLexiconEntries", v102, v103);
      customLexiconEntries = v5->_customLexiconEntries;
      v5->_customLexiconEntries = (NSSet *)v104;

      goto LABEL_11;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v19 = (id)qword_1EA3C9FB0;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __int16 v107 = 0;
    _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_ERROR, "CHRemoteRecognitionTextRequest decoding failed. Locale is required to be non-null.", (uint8_t *)&v107, 2u);
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CHRemoteRecognitionTextRequest;
  [(CHRemoteRecognitionRequest *)&v44 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_locales, @"locales", v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_recognitionMode, @"recognitionMode", v9, v10);
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_contentType, @"contentType", v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v14, self->_autoCapitalizationMode, @"autoCapitalizationMode", v15, v16);
  objc_msgSend_encodeInteger_forKey_(v4, v17, self->_autoCorrectionMode, @"autoCorrectionMode", v18, v19);
  objc_msgSend_encodeInteger_forKey_(v4, v20, *(void *)&self->_baseWritingDirection, @"baseWritingDirection", v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)self->_activeCharacterSetPerLocale, @"activeCharacterSetPerLocale", v24, v25);
  objc_msgSend_encodeBool_forKey_(v4, v26, self->_shouldUseTextReplacements, @"shouldUseTextReplacements", v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v29, self->_enableGen2ModelIfAvailable, @"enableGen2ModelIfAvailable", v30, v31);
  objc_msgSend_encodeBool_forKey_(v4, v32, self->_enableGen2CharacterLMIfAvailable, @"enableGen2CharacterLMIfAvailable", v33, v34);
  objc_msgSend_encodeBool_forKey_(v4, v35, self->_enableStrokeReordering, @"enableStrokeReordering", v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)self->_parametersOverride, @"parameterOverride", v39, v40);
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)self->_customLexiconEntries, @"customLexiconEntries", v42, v43);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

- (BOOL)shouldRemoveUnnaturalGaps
{
  return objc_msgSend_recognitionMode(self, a2, v2, v3, v4, v5) == 2;
}

- (id)recognizerConfigurationKeyWithLocale:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [CHRecognizerConfiguration alloc];
  uint64_t recognitionMode = self->_recognitionMode;
  uint64_t autoCapitalizationMode = self->_autoCapitalizationMode;
  uint64_t autoCorrectionMode = self->_autoCorrectionMode;
  uint64_t v9 = *(void *)&self->_baseWritingDirection;
  char v15 = objc_msgSend_enableCachingIfAvailable(self, v10, v11, v12, v13, v14);
  BYTE2(v25) = self->_enableGen2CharacterLMIfAvailable;
  BYTE1(v25) = self->_enableGen2ModelIfAvailable;
  LOBYTE(v25) = v15;
  uint64_t v17 = objc_msgSend_initWithMode_locale_contentType_autoCapitalizationMode_autoCorrectionMode_baseWritingDirection_enableCachingIfAvailable_enableGen2ModelIfAvailable_enableGen2CharacterLMIfAvailable_(v5, v16, recognitionMode, (uint64_t)v4, 0, autoCapitalizationMode, autoCorrectionMode, v9, v25);
  uint64_t v23 = objc_msgSend_configurationKey(v17, v18, v19, v20, v21, v22);

  return v23;
}

- (void)setLocales:(id)a3
{
  id v4 = (NSArray *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    char v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }
  }
  if (self->_locales != v4)
  {
    uint64_t v16 = (NSArray *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    locales = self->_locales;
    self->_locales = v16;
  }
}

- (void)setRecognitionMode:(int)a3
{
  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_recognitionMode == a3) {
      return;
    }
LABEL_9:
    self->_uint64_t recognitionMode = a3;
    return;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v8 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_recognitionMode != a3) {
    goto LABEL_9;
  }
}

- (void)setContentType:(int)a3
{
  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_contentType == a3) {
      return;
    }
LABEL_9:
    self->_contentType = a3;
    return;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v8 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_contentType != a3) {
    goto LABEL_9;
  }
}

- (void)setAutoCapitalizationMode:(int)a3
{
  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_autoCapitalizationMode == a3) {
      return;
    }
LABEL_9:
    self->_uint64_t autoCapitalizationMode = a3;
    return;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v8 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_autoCapitalizationMode != a3) {
    goto LABEL_9;
  }
}

- (void)setAutoCorrectionMode:(int)a3
{
  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_autoCorrectionMode == a3) {
      return;
    }
LABEL_9:
    self->_uint64_t autoCorrectionMode = a3;
    return;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v8 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_autoCorrectionMode != a3) {
    goto LABEL_9;
  }
}

- (void)setBaseWritingDirection:(int)a3
{
  uint64_t v6 = *(void *)&a3;
  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (*(void *)&self->_baseWritingDirection == v6) {
      return;
    }
LABEL_9:
    *(void *)&self->_baseWritingDirection = v6;
    return;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v8 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (*(void *)&self->_baseWritingDirection != v6) {
    goto LABEL_9;
  }
}

- (void)setActiveCharacterSetPerLocale:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    char v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }
  }
  if (self->_activeCharacterSetPerLocale != v4)
  {
    uint64_t v16 = (NSDictionary *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    activeCharacterSetPerLocale = self->_activeCharacterSetPerLocale;
    self->_activeCharacterSetPerLocale = v16;
  }
}

- (void)setShouldUseTextReplacements:(BOOL)a3
{
  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }
  }
  self->_shouldUseTextReplacements = a3;
}

- (void)setEnableGen2ModelIfAvailable:(BOOL)a3
{
  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }
  }
  self->_enableGen2ModelIfAvailable = a3;
}

- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3
{
  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }
  }
  self->_enableGen2CharacterLMIfAvailable = a3;
}

- (void)setEnableStrokeReordering:(BOOL)a3
{
  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v8 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }
  }
  self->_enableStrokeReordering = a3;
}

- (void)setCustomLexiconEntries:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    char v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }
  }
  if (self->_customLexiconEntries != v4)
  {
    uint64_t v16 = (NSSet *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    customLexiconEntries = self->_customLexiconEntries;
    self->_customLexiconEntries = v16;
  }
}

- (BOOL)isEqualToRemoteRecognitionTextRequest:(id)a3
{
  uint64_t v4 = (CHRemoteRecognitionTextRequest *)a3;
  if (self == v4)
  {
    char isEqualToSet = 1;
  }
  else
  {
    v181.receiver = self;
    v181.super_class = (Class)CHRemoteRecognitionTextRequest;
    if (![(CHRemoteRecognitionRequest *)&v181 isEqualToRemoteRecognitionRequest:v4])goto LABEL_18; {
    int v10 = objc_msgSend_recognitionMode(self, v5, v6, v7, v8, v9);
    }
    if (v10 != objc_msgSend_recognitionMode(v4, v11, v12, v13, v14, v15)) {
      goto LABEL_18;
    }
    int v21 = objc_msgSend_contentType(self, v16, v17, v18, v19, v20);
    if (v21 != objc_msgSend_contentType(v4, v22, v23, v24, v25, v26)) {
      goto LABEL_18;
    }
    int v32 = objc_msgSend_autoCapitalizationMode(self, v27, v28, v29, v30, v31);
    if (v32 != objc_msgSend_autoCapitalizationMode(v4, v33, v34, v35, v36, v37)) {
      goto LABEL_18;
    }
    int v43 = objc_msgSend_autoCorrectionMode(self, v38, v39, v40, v41, v42);
    if (v43 != objc_msgSend_autoCorrectionMode(v4, v44, v45, v46, v47, v48)) {
      goto LABEL_18;
    }
    uint64_t v54 = objc_msgSend_baseWritingDirection(self, v49, v50, v51, v52, v53);
    if (v54 != objc_msgSend_baseWritingDirection(v4, v55, v56, v57, v58, v59)) {
      goto LABEL_18;
    }
    int shouldUseTextReplacements = objc_msgSend_shouldUseTextReplacements(self, v60, v61, v62, v63, v64);
    if (shouldUseTextReplacements != objc_msgSend_shouldUseTextReplacements(v4, v66, v67, v68, v69, v70)) {
      goto LABEL_18;
    }
    int v76 = objc_msgSend_enableGen2ModelIfAvailable(self, v71, v72, v73, v74, v75);
    if (v76 != objc_msgSend_enableGen2ModelIfAvailable(v4, v77, v78, v79, v80, v81)) {
      goto LABEL_18;
    }
    int v87 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v82, v83, v84, v85, v86);
    if (v87 != objc_msgSend_enableGen2CharacterLMIfAvailable(v4, v88, v89, v90, v91, v92)) {
      goto LABEL_18;
    }
    uint64_t v98 = objc_msgSend_locales(self, v93, v94, v95, v96, v97);
    v109 = objc_msgSend_locales(v4, v99, v100, v101, v102, v103);
    if (v98 == v109)
    {
    }
    else
    {
      v110 = objc_msgSend_locales(self, v104, v105, v106, v107, v108);
      v116 = objc_msgSend_locales(v4, v111, v112, v113, v114, v115);
      int isEqualToArray = objc_msgSend_isEqualToArray_(v110, v117, (uint64_t)v116, v118, v119, v120);

      if (!isEqualToArray)
      {
LABEL_18:
        char isEqualToSet = 0;
        goto LABEL_19;
      }
    }
    v128 = objc_msgSend_activeCharacterSetPerLocale(self, v122, v123, v124, v125, v126);
    v139 = objc_msgSend_activeCharacterSetPerLocale(v4, v129, v130, v131, v132, v133);
    if (v128 == v139)
    {
    }
    else
    {
      v140 = objc_msgSend_activeCharacterSetPerLocale(self, v134, v135, v136, v137, v138);
      v146 = objc_msgSend_activeCharacterSetPerLocale(v4, v141, v142, v143, v144, v145);
      int isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v140, v147, (uint64_t)v146, v148, v149, v150);

      if (!isEqualToDictionary) {
        goto LABEL_18;
      }
    }
    v158 = objc_msgSend_customLexiconEntries(self, v152, v153, v154, v155, v156);
    v169 = objc_msgSend_customLexiconEntries(v4, v159, v160, v161, v162, v163);
    if (v158 == v169)
    {
      char isEqualToSet = 1;
    }
    else
    {
      v170 = objc_msgSend_customLexiconEntries(self, v164, v165, v166, v167, v168);
      v176 = objc_msgSend_customLexiconEntries(v4, v171, v172, v173, v174, v175);
      char isEqualToSet = objc_msgSend_isEqualToSet_(v170, v177, (uint64_t)v176, v178, v179, v180);
    }
  }
LABEL_19:

  return isEqualToSet;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteRecognitionTextRequest = objc_msgSend_isEqualToRemoteRecognitionTextRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionTextRequest;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  objc_msgSend_locales(self, a2, v2, v3, v4, v5);
  while (1)
    uint64_t v15 = {;
    unint64_t v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);

    if (v7 >= v21) {
      break;
    }
    uint64_t v27 = objc_msgSend_locales(self, v22, v23, v24, v25, v26);
    int v32 = objc_msgSend_objectAtIndexedSubscript_(v27, v28, v7, v29, v30, v31);

    uint64_t v38 = objc_msgSend_activeCharacterSetPerLocale(self, v33, v34, v35, v36, v37);
    int v43 = objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)v32, v40, v41, v42);

    uint64_t v54 = objc_msgSend_hash(v32, v44, v45, v46, v47, v48);
    if (v43) {
      v8 ^= objc_msgSend_hash(v43, v49, v50, v51, v52, v53);
    }
    v9 ^= v54 << v7;

    ++v7;
    objc_msgSend_locales(self, v10, v11, v12, v13, v14);
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v55 = objc_msgSend_customLexiconEntries(self, v22, v23, v24, v25, v26);
  uint64_t v58 = 0;
  uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v81, (uint64_t)v85, 16, v57);
  if (v64)
  {
    uint64_t v65 = *(void *)v82;
    do
    {
      uint64_t v66 = 0;
      do
      {
        if (*(void *)v82 != v65) {
          objc_enumerationMutation(v55);
        }
        v58 ^= objc_msgSend_hash(*(void **)(*((void *)&v81 + 1) + 8 * v66++), v59, v60, v61, v62, v63);
      }
      while (v64 != v66);
      uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v59, (uint64_t)&v81, (uint64_t)v85, 16, v63);
    }
    while (v64);
  }

  v80.receiver = self;
  v80.super_class = (Class)CHRemoteRecognitionTextRequest;
  unint64_t v67 = [(CHRemoteRecognitionRequest *)&v80 hash];
  unsigned int v73 = objc_msgSend_recognitionMode(self, v68, v69, v70, v71, v72);
  return v58 ^ v67 ^ v73 ^ (unint64_t)objc_msgSend_contentType(self, v74, v75, v76, v77, v78) ^ v8 ^ v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v9 = objc_msgSend_recognitionMode(self, v4, v5, v6, v7, v8);
  uint64_t v124 = objc_msgSend_stringForRecognitionMode_(v3, v10, v9, v11, v12, v13);
  uint64_t v14 = objc_opt_class();
  uint64_t v20 = objc_msgSend_contentType(self, v15, v16, v17, v18, v19);
  uint64_t v123 = objc_msgSend_stringForRecognitionContentType_(v14, v21, v20, v22, v23, v24);
  uint64_t v25 = objc_opt_class();
  uint64_t v31 = objc_msgSend_autoCapitalizationMode(self, v26, v27, v28, v29, v30);
  v122 = objc_msgSend_stringForAutoCapitalizationMode_(v25, v32, v31, v33, v34, v35);
  uint64_t v36 = objc_opt_class();
  uint64_t v42 = objc_msgSend_autoCorrectionMode(self, v37, v38, v39, v40, v41);
  v121 = objc_msgSend_stringForAutoCorrectionMode_(v36, v43, v42, v44, v45, v46);
  uint64_t v47 = objc_opt_class();
  uint64_t v53 = objc_msgSend_baseWritingDirection(self, v48, v49, v50, v51, v52);
  uint64_t v120 = objc_msgSend_stringForBaseWritingDirection_(v47, v54, v53, v55, v56, v57);
  uint64_t v63 = objc_msgSend_locales(self, v58, v59, v60, v61, v62);
  unint64_t v67 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v63, v64, @", ", (uint64_t)&unk_1F2012B90, v65, v66);

  unsigned int v73 = objc_msgSend_activeCharacterSetPerLocale(self, v68, v69, v70, v71, v72);
  uint64_t v79 = objc_msgSend_allValues(v73, v74, v75, v76, v77, v78);
  uint64_t v119 = objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v79, v80, @", ", (uint64_t)&unk_1F2013630, v81, v82);

  v126.receiver = self;
  v126.super_class = (Class)CHRemoteRecognitionTextRequest;
  long long v83 = [(CHRemoteRecognitionRequest *)&v126 description];
  v125.receiver = self;
  v125.super_class = (Class)CHRemoteRecognitionTextRequest;
  long long v84 = [(CHRemoteRecognitionRequest *)&v125 description];
  uint64_t v90 = objc_msgSend_length(v84, v85, v86, v87, v88, v89);
  uint64_t v118 = objc_msgSend_substringToIndex_(v83, v91, v90 - 1, v92, v93, v94);

  uint64_t v95 = NSString;
  uint64_t v101 = objc_msgSend_customLexiconEntries(self, v96, v97, v98, v99, v100);
  uint64_t v107 = objc_msgSend_count(v101, v102, v103, v104, v105, v106);
  if (self->_shouldUseTextReplacements) {
    uint64_t v112 = @"Y";
  }
  else {
    uint64_t v112 = @"N";
  }
  if (self->_enableGen2ModelIfAvailable) {
    uint64_t v113 = @"Y";
  }
  else {
    uint64_t v113 = @"N";
  }
  if (self->_enableGen2CharacterLMIfAvailable) {
    uint64_t v114 = @"Y";
  }
  else {
    uint64_t v114 = @"N";
  }
  if (self->_enableStrokeReordering) {
    uint64_t v115 = @"Y";
  }
  else {
    uint64_t v115 = @"N";
  }
  v116 = objc_msgSend_stringWithFormat_(v95, v108, @"%@, locales=[%@], mode=%@, content type=%@, autocapitalization mode=%@, autocorrection mode=%@, baseWritingDirection=%@, active character sets=[%@], custom lexicon entries count=%lu, shouldUseTextReplacements=%@, enableGen2ModelIfAvailable=%@, enableGen2CharacterLMIfAvailable=%@, enableStrokeReordering=%@"), v109, v110, v111, v118, v67, v124, v123, v122, v121, v120, v119, v107, v112, v113, v114, v115);

  return v116;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSDictionary)activeCharacterSetPerLocale
{
  return self->_activeCharacterSetPerLocale;
}

- (int)recognitionMode
{
  return self->_recognitionMode;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (int)baseWritingDirection
{
  return *(void *)&self->_baseWritingDirection;
}

- (BOOL)shouldUseTextReplacements
{
  return self->_shouldUseTextReplacements;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (BOOL)enableStrokeReordering
{
  return self->_enableStrokeReordering;
}

- (NSDictionary)parametersOverride
{
  return self->_parametersOverride;
}

- (void)setParametersOverride:(id)a3
{
}

- (NSSet)customLexiconEntries
{
  return self->_customLexiconEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLexiconEntries, 0);
  objc_storeStrong((id *)&self->_parametersOverride, 0);
  objc_storeStrong((id *)&self->_activeCharacterSetPerLocale, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end