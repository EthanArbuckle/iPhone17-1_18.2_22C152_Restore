@interface __NSCFResumableUploadState
+ (BOOL)supportsSecureCoding;
+ (__NSCFResumableUploadState)rusWithResumeData:(uint64_t)a1;
+ (id)rusWithResumeData:(id)a3 originalRequest:(id)a4;
- (BOOL)isResumable;
- (NSURL)uploadFile;
- (__CFString)resumeURLFromResponse:(void *)a1;
- (__NSCFResumableUploadState)initWithCoder:(id)a3;
- (id)createResumeData:(void *)a1;
- (id)createResumeDataForTaskInfo;
- (id)createResumeDataForTaskInfo:(void *)a3 error:;
- (id)initWithResumeData:(void *)a3 originalRequest:;
- (uint64_t)processResponse:(uint64_t)a1;
- (uint64_t)uploadOffsetFromResponse:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)setUploadFile:(id)a3;
@end

@implementation __NSCFResumableUploadState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadFile, 0);
  objc_storeStrong((id *)&self->_draftVersion, 0);
  objc_storeStrong((id *)&self->_resumeURL, 0);
  objc_storeStrong((id *)&self->_uploadData, 0);

  objc_storeStrong((id *)&self->_originalRequest, 0);
}

- (id)createResumeDataForTaskInfo
{
  if (self && self->_bodyType && !objc_getProperty(self, a2, 40, 1))
  {
    v4 = -[__NSCFResumableUploadState createResumeDataForTaskInfo:error:]((uint64_t)self, 1, 0);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v3 = (id)CFNLog::logger;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "ResumableUploadState: cannot create resume data for task info with body data type", v6, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (id)createResumeDataForTaskInfo:(void *)a3 error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(id)a1 isResumable])
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setObject:objc_getProperty((id)a1, v7, 56, 1) forKeyedSubscript:@"draftVersion"];
    [v6 setObject:objc_getProperty((id)a1, v8, 48, 1) forKeyedSubscript:@"resumeURL"];
    if ((a2 & 1) == 0) {
      [v6 setObject:objc_getProperty((id)a1, v9, 32, 1) forKeyedSubscript:@"originalRequest"];
    }
    v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    [v6 setObject:v10 forKeyedSubscript:@"bodyType"];

    [v6 setObject:objc_getProperty((id)a1, v11, 40, 1) forKeyedSubscript:@"uploadData"];
    v12 = [(id)a1 uploadFile];
    [v6 setObject:v12 forKeyedSubscript:@"uploadFile"];

    if ((*(void *)(a1 + 64) & 0x8000000000000000) == 0)
    {
      v13 = objc_msgSend(NSNumber, "numberWithLongLong:");
      [v6 setObject:v13 forKeyedSubscript:@"streamLength"];
    }
    id v24 = 0;
    v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v24];
    id v15 = v24;
    v16 = (void *)[v14 mutableCopy];

    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = [v17 mutableBytes];
      for (unint64_t i = 0; i != 8; ++i)
      {
        if (i >= [v17 length]) {
          break;
        }
        *(unsigned char *)(v18 + i) ^= kResumeDataMagicBytes[i];
      }
      v20 = [MEMORY[0x1E4F1C9B8] dataWithData:v17];
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v21 = (id)CFNLog::logger;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_184085000, v21, OS_LOG_TYPE_ERROR, "ResumableUploadState: createResumeData archiver returned nil", buf, 2u);
      }

      if (!v15) {
        goto LABEL_27;
      }
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v22 = (id)CFNLog::logger;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v15;
        _os_log_error_impl(&dword_184085000, v22, OS_LOG_TYPE_ERROR, "ResumableUploadState: createResumeData archiver error: %@", buf, 0xCu);
      }

      if (a3)
      {
        v20 = 0;
        *a3 = v15;
      }
      else
      {
LABEL_27:
        v20 = 0;
      }
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v6 = (id)CFNLog::logger;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_184085000, v6, OS_LOG_TYPE_DEBUG, "ResumableUploadState: createResumeData returning nil because we are not resumable", buf, 2u);
    }
    v20 = 0;
  }

  return v20;
}

- (BOOL)isResumable
{
  if (self) {
    LOBYTE(self) = (self->_state - 1) <= 2 && self->_bodyType != -1 && self->_retryCounter < 4;
  }
  return (char)self;
}

- (void)setUploadFile:(id)a3
{
}

- (NSURL)uploadFile
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (__NSCFResumableUploadState)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)__NSCFResumableUploadState;
  v5 = [(__NSCFResumableUploadState *)&v16 init];
  if (v5)
  {
    v5->_state = [v4 decodeIntForKey:@"state"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"draftVersion"];
    objc_setProperty_atomic(v5, v7, v6, 56);

    SEL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalRequest"];
    objc_setProperty_atomic_copy(v5, v9, v8, 32);

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resumeURL"];
    objc_setProperty_atomic(v5, v11, v10, 48);

    v5->_bodyType = [v4 decodeIntForKey:@"bodyType"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadData"];
    objc_setProperty_atomic(v5, v13, v12, 40);

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadFile"];
    [(__NSCFResumableUploadState *)v5 setUploadFile:v14];

    v5->_offset = [v4 decodeInt64ForKey:@"offset"];
    v5->_streamLength = [v4 decodeInt64ForKey:@"streamLength"];
    v5->_userOverride = [v4 decodeBoolForKey:@"userOverride"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  if (self) {
    uint64_t state = self->_state;
  }
  else {
    uint64_t state = 0;
  }
  [v18 encodeInt:state forKey:@"state"];
  if (self) {
    id Property = objc_getProperty(self, v5, 56, 1);
  }
  else {
    id Property = 0;
  }
  [v18 encodeObject:Property forKey:@"draftVersion"];
  if (self) {
    id v8 = objc_getProperty(self, v7, 32, 1);
  }
  else {
    id v8 = 0;
  }
  [v18 encodeObject:v8 forKey:@"originalRequest"];
  if (self) {
    id v10 = objc_getProperty(self, v9, 48, 1);
  }
  else {
    id v10 = 0;
  }
  [v18 encodeObject:v10 forKey:@"resumeURL"];
  if (self) {
    uint64_t bodyType = self->_bodyType;
  }
  else {
    uint64_t bodyType = 0;
  }
  [v18 encodeInt:bodyType forKey:@"bodyType"];
  if (self) {
    id v13 = objc_getProperty(self, v12, 40, 1);
  }
  else {
    id v13 = 0;
  }
  [v18 encodeObject:v13 forKey:@"uploadData"];
  v14 = [(__NSCFResumableUploadState *)self uploadFile];
  [v18 encodeObject:v14 forKey:@"uploadFile"];

  if (self) {
    int64_t offset = self->_offset;
  }
  else {
    int64_t offset = 0;
  }
  [v18 encodeInt64:offset forKey:@"offset"];
  if (self) {
    int64_t streamLength = self->_streamLength;
  }
  else {
    int64_t streamLength = 0;
  }
  [v18 encodeInt64:streamLength forKey:@"streamLength"];
  if (self) {
    BOOL userOverride = self->_userOverride;
  }
  else {
    BOOL userOverride = 0;
  }
  [v18 encodeBool:userOverride forKey:@"userOverride"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)rusWithResumeData:(id)a3 originalRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[__NSCFResumableUploadState initWithResumeData:originalRequest:]([__NSCFResumableUploadState alloc], v5, v6);

  return v7;
}

- (id)initWithResumeData:(void *)a3 originalRequest:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_65;
  }
  if (!v5)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    id v26 = (id)CFNLog::logger;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v26, OS_LOG_TYPE_ERROR, "ResumableUploadState: cannot initWithResumeData with nil resume data", buf, 2u);
    }

    goto LABEL_65;
  }
  v54.receiver = a1;
  v54.super_class = (Class)__NSCFResumableUploadState;
  a1 = objc_msgSendSuper2(&v54, sel_init);
  if (!a1)
  {
LABEL_66:
    a1 = a1;
    id v44 = a1;
    goto LABEL_67;
  }
  id v7 = (id) [v5 mutableCopy];
  uint64_t v8 = [v7 mutableBytes];
  for (unint64_t i = 0; i != 8; ++i)
  {
    if (i >= [v7 length]) {
      break;
    }
    *(unsigned char *)(v8 + i) ^= kResumeDataMagicBytes[i];
  }
  id v10 = (void *)MEMORY[0x1E4F28DC0];
  if (resumeDataClasses(void)::onceToken != -1) {
    dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_1650);
  }
  id v11 = (id)resumeDataClasses(void)::resumeDataClasses;
  id v53 = 0;
  v12 = [v10 unarchivedObjectOfClasses:v11 fromData:v7 error:&v53];
  id v13 = v53;

  if (!v12)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v27 = (id)CFNLog::logger;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_184085000, v27, OS_LOG_TYPE_ERROR, "ResumableUploadState: initWithResumeData unarchiver returned nil", buf, 2u);
    }

    if (!v13)
    {
      int v34 = 1;
      goto LABEL_64;
    }
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_DWORD *)buf = 138412290;
    id v56 = v13;
    v29 = "ResumableUploadState: initWithResumeData unarchiver error: %@";
LABEL_40:
    v30 = v28;
    uint32_t v31 = 12;
    goto LABEL_41;
  }
  *((_DWORD *)a1 + 3) = 2;
  v14 = [v12 objectForKeyedSubscript:@"draftVersion"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil draft version";
    goto LABEL_35;
  }
  objc_super v16 = [v12 objectForKeyedSubscript:@"draftVersion"];
  objc_setProperty_atomic(a1, v17, v16, 56);

  if (supportedDraftVersions(void)::onceToken != -1) {
    dispatch_once(&supportedDraftVersions(void)::onceToken, &__block_literal_global_120);
  }
  id v18 = (id)supportedDraftVersions(void)::supportedDraftVersions;
  char v20 = objc_msgSend(v18, "containsObject:", objc_getProperty(a1, v19, 56, 1));

  if ((v20 & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    id Property = objc_getProperty(a1, v32, 56, 1);
    *(_DWORD *)buf = 138412290;
    id v56 = Property;
    v29 = "ResumableUploadState: cannot initWithResumeData with unsupported draft version: %@";
    goto LABEL_40;
  }
  v21 = [v12 objectForKeyedSubscript:@"resumeURL"];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v28 = (id)CFNLog::logger;
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_62;
    }
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil resume URL";
    goto LABEL_35;
  }
  v23 = [v12 objectForKeyedSubscript:@"resumeURL"];
  objc_setProperty_atomic(a1, v24, v23, 48);

  if (v6)
  {
    objc_setProperty_atomic_copy(a1, v25, v6, 32);
  }
  else
  {
    v35 = [v12 objectForKeyedSubscript:@"originalRequest"];
    objc_opt_class();
    char v36 = objc_opt_isKindOfClass();

    if ((v36 & 1) == 0)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v28 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_WORD *)buf = 0;
      v29 = "ResumableUploadState: cannot initWithResumeData with nil request";
      goto LABEL_35;
    }
    v37 = [v12 objectForKeyedSubscript:@"originalRequest"];
    objc_setProperty_atomic_copy(a1, v38, v37, 32);
  }
  v39 = [v12 objectForKeyedSubscript:@"bodyType"];
  objc_opt_class();
  char v40 = objc_opt_isKindOfClass();

  if (v40)
  {
    v28 = [v12 objectForKeyedSubscript:@"bodyType"];
    int v41 = [v28 intValue];
    *((_DWORD *)a1 + 4) = v41;
    switch(v41)
    {
      case -1:
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v42 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with unknown body type";
        goto LABEL_88;
      case 0:
        v50 = [v12 objectForKeyedSubscript:@"uploadData"];
        objc_opt_class();
        char v51 = objc_opt_isKindOfClass();

        if (v51)
        {
          v42 = [v12 objectForKeyedSubscript:@"uploadData"];
          objc_setProperty_atomic(a1, v52, v42, 40);
          goto LABEL_78;
        }
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v42 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with nil upload data";
        goto LABEL_88;
      case 1:
        v46 = [v12 objectForKeyedSubscript:@"uploadFile"];
        objc_opt_class();
        char v47 = objc_opt_isKindOfClass();

        if (v47)
        {
          v42 = [v12 objectForKeyedSubscript:@"uploadFile"];
          [a1 setUploadFile:v42];
LABEL_78:
          int v34 = 0;
        }
        else
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          v42 = (id)CFNLog::logger;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "ResumableUploadState: cannot initWithResumeData with nil upload file";
LABEL_88:
            _os_log_error_impl(&dword_184085000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
          }
LABEL_89:
          int v34 = 1;
        }
        goto LABEL_90;
      case 2:
        v48 = [v12 objectForKeyedSubscript:@"streamLength"];
        objc_opt_class();
        char v49 = objc_opt_isKindOfClass();

        if (v49)
        {
          v42 = [v12 objectForKeyedSubscript:@"streamLength"];
          int v34 = 0;
          *((void *)a1 + 8) = [v42 integerValue];
LABEL_90:
        }
        else
        {
          int v34 = 0;
        }
        break;
      default:
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v42 = (id)CFNLog::logger;
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_89;
        }
        *(_WORD *)buf = 0;
        v43 = "ResumableUploadState: cannot initWithResumeData with unrecognized body type";
        goto LABEL_88;
    }
    goto LABEL_63;
  }
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v28 = (id)CFNLog::logger;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v29 = "ResumableUploadState: cannot initWithResumeData with nil body type";
LABEL_35:
    v30 = v28;
    uint32_t v31 = 2;
LABEL_41:
    _os_log_error_impl(&dword_184085000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
  }
LABEL_62:
  int v34 = 1;
LABEL_63:

LABEL_64:
  if (!v34) {
    goto LABEL_66;
  }
LABEL_65:
  id v44 = 0;
LABEL_67:

  return v44;
}

+ (__NSCFResumableUploadState)rusWithResumeData:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [__NSCFResumableUploadState alloc];
  id v4 = v2;
  if (v3) {
    v3 = (__NSCFResumableUploadState *)-[__NSCFResumableUploadState initWithResumeData:originalRequest:](v3, v4, 0);
  }

  return v3;
}

- (id)createResumeData:(void *)a1
{
  if (a1)
  {
    a1 = -[__NSCFResumableUploadState createResumeDataForTaskInfo:error:]((uint64_t)a1, 0, a2);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)uploadOffsetFromResponse:(uint64_t)a1
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    if (*(unsigned char *)(v1 + 40)) {
      v1 += 16;
    }
    else {
      uint64_t v1 = 0;
    }
  }
  HTTPHeaderKeyMixedValue::HTTPHeaderKeyMixedValue(&v6, 0x14D1B41Au);
  uint64_t v2 = (CFDictionaryRef *)HTTPMessage::headers((os_unfair_lock_s *)v1);
  v3 = (__CFString *)HTTPHeaderDict::copyStringValue(v2, (const __CFAllocator *)*MEMORY[0x1E4F1CF80], (const HTTPHeaderKeyMixedValue *)&v6);
  id v6 = &unk_1ECF9F718;
  if (cf) {
    CFRelease(cf);
  }
  uint64_t v4 = [(__CFString *)v3 longLongValue];

  return v4;
}

- (__CFString)resumeURLFromResponse:(void *)a1
{
  if (a2)
  {
    if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
      dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
    }
    if (*(unsigned char *)(a2 + 40)) {
      uint64_t v4 = (HTTPMessage *)(a2 + 16);
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  CFStringRef HeaderFieldValue = HTTPMessage::copyLastHeaderFieldValue(v4, 0x13011336u);
  if (!HeaderFieldValue || (CFStringRef v6 = HeaderFieldValue, !CFStringGetLength(HeaderFieldValue)))
  {
    uint64_t v8 = 0;
    goto LABEL_29;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v8 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, @"%#?:;/@=&[]",
                       0,
                       0x201u);
  CFRelease(v6);
  objc_msgSend(objc_getProperty(a1, v9, 32, 1), "URL");
  CFURLRef v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    CFURLRef v11 = CFURLCreateWithString(v7, v8, v10);
    v12 = [(__CFURL *)v11 absoluteURL];

    CFRelease(v8);
    if (!v12
      || ([(__CFString *)v12 scheme], (id v13 = objc_claimAutoreleasedReturnValue()) != 0)
      && ([(__CFString *)v12 scheme],
          v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 caseInsensitiveCompare:@"file"],
          v14,
          v13,
          !v15))
    {
LABEL_27:
      uint64_t v8 = 0;
      goto LABEL_28;
    }
    objc_super v16 = [(__CFString *)v12 scheme];
    if (v16)
    {
      SEL v17 = [(__CFString *)v12 scheme];
      if ([v17 caseInsensitiveCompare:@"http"]
        || ([(__CFURL *)v10 scheme], (id v18 = objc_claimAutoreleasedReturnValue()) == 0))
      {
      }
      else
      {
        SEL v19 = [(__CFURL *)v10 scheme];
        uint64_t v20 = [v19 caseInsensitiveCompare:@"https"];

        if (!v20)
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          v21 = (id)CFNLog::logger;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v23 = 0;
            _os_log_error_impl(&dword_184085000, v21, OS_LOG_TYPE_ERROR, "ResumableUploadState: not allowing HTTP resumeURL to downgrade from HTTPS", v23, 2u);
          }

          goto LABEL_27;
        }
      }
    }
    v12 = v12;
    uint64_t v8 = v12;
  }
  else
  {
    v12 = 0;
  }
LABEL_28:

LABEL_29:

  return v8;
}

- (uint64_t)processResponse:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 10))
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    CFAllocatorRef v7 = (id)CFNLog::logger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_debug_impl(&dword_184085000, v7, OS_LOG_TYPE_DEBUG, "ResumableUploadState: userOverride is true, not processing response", v28, 2u);
    }

    return 1;
  }
  CFIndex ResponseStatusCode = CFHTTPMessageGetResponseStatusCode(response);
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  id v5 = (id)CFNLog::logger;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v17 = *(_DWORD *)(a1 + 12) + 1;
    if (v17 > 5) {
      id v18 = @"unknown";
    }
    else {
      id v18 = off_1E5252EF8[v17];
    }
    *(_DWORD *)v28 = 138412546;
    *(void *)&v28[4] = v18;
    *(_WORD *)&v28[12] = 2048;
    *(void *)&v28[14] = ResponseStatusCode;
    _os_log_debug_impl(&dword_184085000, v5, OS_LOG_TYPE_DEBUG, "ResumableUploadState: processResponse with state: %@, statusCode: %ld", v28, 0x16u);
  }

  if ((unint64_t)(ResponseStatusCode - 400) <= 0xC7)
  {
    int v6 = -1;
    goto LABEL_8;
  }
  *(_WORD *)(a1 + 8) = 0;
  int v10 = *(_DWORD *)(a1 + 12);
  if (v10 == 3)
  {
    v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(response, (CFStringRef)&unk_1EC0A2A48);
    id v13 = v12;
    if (v12)
    {
      char v14 = [(__CFString *)v12 isEqualToString:@"?1"];
      if ((ResponseStatusCode & 0xFFFFFFFFFFFFFFFBLL) == 0xC8) {
        char v15 = v14;
      }
      else {
        char v15 = 1;
      }
      if (v15)
      {
        if ((unint64_t)(ResponseStatusCode - 200) >= 0x64) {
          int v16 = -1;
        }
        else {
          int v16 = 4;
        }
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v19 = -[__NSCFResumableUploadState uploadOffsetFromResponse:]((uint64_t)response);
        uint64_t v8 = 0;
        *(void *)(a1 + 24) = v19;
        int v16 = 1;
      }
    }
    else
    {
      uint64_t v8 = 1;
      int v16 = -1;
    }
    *(_DWORD *)(a1 + 12) = v16;
  }
  else
  {
    if (v10 == 1)
    {
      if ((unint64_t)(ResponseStatusCode - 200) > 0x63) {
        return 1;
      }
      int v6 = 4;
LABEL_8:
      *(_DWORD *)(a1 + 12) = v6;
      return 1;
    }
    if (v10 || ResponseStatusCode != 104) {
      return 1;
    }
    if (response)
    {
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1) {
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5973);
      }
      CFURLRef v11 = *((unsigned char *)response + 40) ? (os_unfair_lock_s *)((char *)response + 16) : 0;
    }
    else
    {
      CFURLRef v11 = 0;
    }
    HTTPHeaderKeyMixedValue::HTTPHeaderKeyMixedValue(v28, 0x14B39402u);
    uint64_t v20 = (CFDictionaryRef *)HTTPMessage::headers(v11);
    char v22 = (__CFString *)HTTPHeaderDict::copyStringValue(v20, (const __CFAllocator *)*MEMORY[0x1E4F1CF80], (const HTTPHeaderKeyMixedValue *)v28);
    *(void *)v28 = &unk_1ECF9F718;
    if (*(void *)&v28[8]) {
      CFRelease(*(CFTypeRef *)&v28[8]);
    }
    if (!v22) {
      return 1;
    }
    id Property = objc_getProperty((id)a1, v21, 56, 1);
    int v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", Property, *(void *)v28);

    if (!v24) {
      return 1;
    }
    v25 = -[__NSCFResumableUploadState resumeURLFromResponse:]((void *)a1, (uint64_t)response);
    objc_setProperty_atomic((id)a1, v26, v25, 48);

    uint64_t v8 = 1;
    if (objc_getProperty((id)a1, v27, 48, 1)) {
      *(_DWORD *)(a1 + 12) = 1;
    }
  }
  return v8;
}

@end