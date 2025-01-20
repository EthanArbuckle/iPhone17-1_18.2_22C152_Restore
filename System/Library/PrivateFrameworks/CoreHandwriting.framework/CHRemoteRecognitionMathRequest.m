@interface CHRemoteRecognitionMathRequest
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
+ (id)loadFromFile:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRecognitionMathRequest:(id)a3;
- (CHRemoteRecognitionMathRequest)initWithCoder:(id)a3;
- (NSArray)locales;
- (NSSet)declaredVariables;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclaredVariables:(id)a3;
- (void)setLocales:(id)a3;
@end

@implementation CHRemoteRecognitionMathRequest

- (CHRemoteRecognitionMathRequest)initWithCoder:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CHRemoteRecognitionMathRequest;
  v5 = [(CHRemoteRecognitionRequest *)&v37 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v39, 2, v8, v9);
    v15 = objc_msgSend_setWithArray_(v6, v11, (uint64_t)v10, v12, v13, v14);
    uint64_t v19 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, @"declaredVariables", v17, v18);
    declaredVariables = v5->_declaredVariables;
    v5->_declaredVariables = (NSSet *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v38, 2, v23, v24);
    v30 = objc_msgSend_setWithArray_(v21, v26, (uint64_t)v25, v27, v28, v29);
    uint64_t v34 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, @"locales", v32, v33);
    locales = v5->_locales;
    v5->_locales = (NSArray *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHRemoteRecognitionMathRequest;
  [(CHRemoteRecognitionRequest *)&v11 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_declaredVariables, @"declaredVariables", v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_locales, @"locales", v9, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  objc_super v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

- (void)setDeclaredVariables:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v15 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1C492D000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }
  }
  if (self->_declaredVariables != v4)
  {
    v16 = (NSSet *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    declaredVariables = self->_declaredVariables;
    self->_declaredVariables = v16;
  }
}

- (BOOL)isEqualToRemoteRecognitionMathRequest:(id)a3
{
  uint64_t v4 = (CHRemoteRecognitionMathRequest *)a3;
  if (self == v4)
  {
    char isEqualToSet = 1;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)CHRemoteRecognitionMathRequest;
    if ([(CHRemoteRecognitionRequest *)&v35 isEqualToRemoteRecognitionRequest:v4])
    {
      uint64_t v10 = objc_msgSend_declaredVariables(self, v5, v6, v7, v8, v9);
      v21 = objc_msgSend_declaredVariables(v4, v11, v12, v13, v14, v15);
      if (v10 == v21)
      {
        char isEqualToSet = 1;
      }
      else
      {
        v22 = objc_msgSend_declaredVariables(self, v16, v17, v18, v19, v20);
        uint64_t v28 = objc_msgSend_declaredVariables(v4, v23, v24, v25, v26, v27);
        char isEqualToSet = objc_msgSend_isEqualToSet_(v22, v29, (uint64_t)v28, v30, v31, v32);
      }
    }
    else
    {
      char isEqualToSet = 0;
    }
  }

  return isEqualToSet;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteRecognitionMathRequest = objc_msgSend_isEqualToRemoteRecognitionMathRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionMathRequest;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = objc_msgSend_declaredVariables(self, a2, v2, v3, v4, v5);
  uint64_t v10 = 0;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16, v9);
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v7);
        }
        v10 ^= objc_msgSend_hash(*(void **)(*((void *)&v21 + 1) + 8 * v18++), v11, v12, v13, v14, v15);
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v21, (uint64_t)v25, 16, v15);
    }
    while (v16);
  }

  v20.receiver = self;
  v20.super_class = (Class)CHRemoteRecognitionMathRequest;
  return [(CHRemoteRecognitionRequest *)&v20 hash] ^ v10;
}

- (id)description
{
  v36.receiver = self;
  v36.super_class = (Class)CHRemoteRecognitionMathRequest;
  uint64_t v3 = [(CHRemoteRecognitionRequest *)&v36 description];
  v35.receiver = self;
  v35.super_class = (Class)CHRemoteRecognitionMathRequest;
  uint64_t v4 = [(CHRemoteRecognitionRequest *)&v35 description];
  uint64_t v10 = objc_msgSend_length(v4, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_substringToIndex_(v3, v11, v10 - 1, v12, v13, v14);

  uint64_t v16 = NSString;
  long long v22 = objc_msgSend_declaredVariables(self, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);
  uint64_t v33 = objc_msgSend_stringWithFormat_(v16, v29, @"%@, declared variables count=%lu"), v30, v31, v32, v15, v28);

  return v33;
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)setLocales:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
}

@end