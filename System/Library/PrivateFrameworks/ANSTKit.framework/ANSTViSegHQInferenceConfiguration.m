@interface ANSTViSegHQInferenceConfiguration
+ (ANSTViSegHQInferenceConfiguration)new;
+ (BOOL)supportsSecureCoding;
+ (id)availableInferenceResolutionForVersion:(unint64_t)a3;
- (ANSTViSegHQInferenceConfiguration)init;
- (ANSTViSegHQInferenceConfiguration)initWithCoder:(id)a3;
- (ANSTViSegHQInferenceConfiguration)initWithVersion:(unint64_t)a3 resolution:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)useE5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)resolution;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setUseE5:(BOOL)a3;
@end

@implementation ANSTViSegHQInferenceConfiguration

+ (id)availableInferenceResolutionForVersion:(unint64_t)a3
{
  if (a3 == 0x20000) {
    return &unk_26FB49A40;
  }
  v5 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_246D99D38(a3, v5);
  }

  return (id)MEMORY[0x263EFFA68];
}

- (ANSTViSegHQInferenceConfiguration)init
{
  result = (ANSTViSegHQInferenceConfiguration *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (ANSTViSegHQInferenceConfiguration)new
{
  result = (ANSTViSegHQInferenceConfiguration *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTViSegHQInferenceConfiguration)initWithVersion:(unint64_t)a3 resolution:(int64_t)a4
{
  v7 = objc_msgSend_availableInferenceResolutionForVersion_(ANSTViSegHQInferenceConfiguration, a2, a3);
  v9 = objc_msgSend_numberWithInteger_(NSNumber, v8, a4);
  char v11 = objc_msgSend_containsObject_(v7, v10, (uint64_t)v9);

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)ANSTViSegHQInferenceConfiguration;
    v12 = [(ANSTViSegHQInferenceConfiguration *)&v16 init];
    if (v12)
    {
      v12->_version = a3;
      v12->_resolution = a4;
      v12->_useE5 = 0;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v14 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_246D99DC4(v14);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ANSTViSegHQInferenceConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    uint64_t v9 = objc_msgSend_version(self, v7, v8);
    if (v9 == objc_msgSend_version(v6, v10, v11))
    {
      uint64_t v14 = objc_msgSend_resolution(self, v12, v13);
      BOOL v17 = v14 == objc_msgSend_resolution(v6, v15, v16);
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v4 = NSNumber;
  uint64_t v5 = objc_msgSend_version(self, a2, v2);
  v7 = objc_msgSend_numberWithUnsignedInteger_(v4, v6, v5);
  uint64_t v10 = objc_msgSend_hash(v7, v8, v9);

  uint64_t v11 = NSNumber;
  uint64_t v14 = objc_msgSend_resolution(self, v12, v13);
  uint64_t v16 = objc_msgSend_numberWithInteger_(v11, v15, v14);
  unint64_t v19 = objc_msgSend_hash(v16, v17, v18) ^ v10;

  return v19;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_appendFormat_(v3, v6, @"<%@ %p> {\n", v5, self);

  uint64_t v9 = objc_msgSend_version(self, v7, v8);
  uint64_t v11 = ANSTViSegHQInferenceVersionToNSString(v9, v10);
  objc_msgSend_appendFormat_(v3, v12, @"  version %@\n", v11);

  unint64_t v15 = objc_msgSend_resolution(self, v13, v14);
  BOOL v17 = ANSTViSegHQInferenceResolutionToNSString(v15, v16);
  objc_msgSend_appendFormat_(v3, v18, @"  resolution %@\n", v17);

  unsigned int v21 = objc_msgSend_useE5(self, v19, v20);
  objc_msgSend_appendFormat_(v3, v22, @"  useE5 %d\n", v21);
  objc_msgSend_appendString_(v3, v23, @"}");
  v26 = objc_msgSend_copy(v3, v24, v25);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [ANSTViSegHQInferenceConfiguration alloc];
  v6 = objc_msgSend_initWithVersion_resolution_(v4, v5, self->_version, self->_resolution);
  uint64_t v9 = objc_msgSend_useE5(self, v7, v8);
  objc_msgSend_setUseE5_(v6, v10, v9);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_version(self, v6, v7);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8);
  uint64_t v11 = NSStringFromSelector(sel_version);
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)v10, v11);

  uint64_t v13 = NSNumber;
  uint64_t v16 = objc_msgSend_resolution(self, v14, v15);
  uint64_t v18 = objc_msgSend_numberWithInteger_(v13, v17, v16);
  unint64_t v19 = NSStringFromSelector(sel_resolution);
  objc_msgSend_encodeObject_forKey_(v5, v20, (uint64_t)v18, v19);

  unsigned int v21 = NSNumber;
  uint64_t v24 = objc_msgSend_useE5(self, v22, v23);
  objc_msgSend_numberWithBool_(v21, v25, v24);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  v26 = NSStringFromSelector(sel_useE5);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)v28, v26);
}

- (ANSTViSegHQInferenceConfiguration)initWithCoder:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_version);
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);

  if (!v8)
  {
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F07F70];
    uint64_t v44 = *MEMORY[0x263F07F80];
    v45[0] = @"ViSegHQ inference configuration version was not encoded.";
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v45, &v44, 1);
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, v25, 4865, v14);
    objc_msgSend_failWithError_(v4, v27, (uint64_t)v20);
LABEL_8:
    uint64_t v23 = 0;
    goto LABEL_9;
  }
  self->_version = objc_msgSend_integerValue(v8, v9, v10);
  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_resolution);
  uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);

  if (!v14)
  {
    id v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F07F70];
    uint64_t v42 = *MEMORY[0x263F07F80];
    v43 = @"-resolution was not encoded.";
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v15, (uint64_t)&v43, &v42, 1);
    v31 = objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, v29, 4865, v20);
    objc_msgSend_failWithError_(v4, v32, (uint64_t)v31);

    goto LABEL_8;
  }
  self->_resolution = objc_msgSend_integerValue(v14, v15, v16);
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = NSStringFromSelector(sel_useE5);
  uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, v18);

  if (!v20)
  {
    v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F07F70];
    uint64_t v40 = *MEMORY[0x263F07F80];
    v41 = @"-useE5 was not encoded.";
    v35 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)&v41, &v40, 1);
    v37 = objc_msgSend_errorWithDomain_code_userInfo_(v33, v36, v34, 4865, v35);
    objc_msgSend_failWithError_(v4, v38, (uint64_t)v37);

    goto LABEL_8;
  }
  self->_useE5 = objc_msgSend_BOOLValue(v20, v21, v22);
  uint64_t v23 = self;
LABEL_9:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)version
{
  return self->_version;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (BOOL)useE5
{
  return self->_useE5;
}

- (void)setUseE5:(BOOL)a3
{
  self->_useE5 = a3;
}

@end