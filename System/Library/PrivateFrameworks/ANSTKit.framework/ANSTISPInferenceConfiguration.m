@interface ANSTISPInferenceConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfigurationForVersion:(unint64_t)a3 withError:(id *)a4;
+ (id)new;
+ (unint64_t)_version;
- (ANSTISPInferenceConfiguration)init;
- (ANSTISPInferenceConfiguration)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)useE5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForVersion:(unint64_t)a3 withError:(id *)a4;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setUseE5:(BOOL)a3;
@end

@implementation ANSTISPInferenceConfiguration

- (ANSTISPInferenceConfiguration)init
{
  result = (ANSTISPInferenceConfiguration *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (unint64_t)version
{
  v2 = objc_opt_class();
  return objc_msgSend__version(v2, v3, v4);
}

+ (unint64_t)_version
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF4A0], @"A concrete implementation of +_version is required.", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)initForVersion:(unint64_t)a3 withError:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)ANSTISPInferenceConfiguration;
  v6 = [(ANSTISPInferenceConfiguration *)&v15 init];
  if (v6 && (v7 = objc_opt_class(), objc_msgSend__version(v7, v8, v9) != a3))
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F07F80];
      v17[0] = @"Mismatched version.";
      v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v17, &v16, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, @"ANSTErrorDomain", 14, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = v6;
  }

  return a4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ANSTISPInferenceConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v31 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (uint64_t v8 = objc_msgSend_version(self, v6, v7), v8 == objc_msgSend_version(v5, v9, v10))
         && (int isObjectTrackingEnabled = objc_msgSend_isObjectTrackingEnabled(self, v11, v12),
             isObjectTrackingEnabled == objc_msgSend_isObjectTrackingEnabled(v5, v14, v15))
         && (int isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(self, v16, v17),
             isSegmentationEnabled == objc_msgSend_isSegmentationEnabled(v5, v19, v20))
         && (uint64_t v23 = objc_msgSend_resolution(self, v21, v22), v23 == objc_msgSend_resolution(v5, v24, v25)))
  {
    uint64_t v28 = objc_msgSend_frameRate(self, v26, v27);
    BOOL v31 = v28 == objc_msgSend_frameRate(v5, v29, v30);
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (unint64_t)hash
{
  uint64_t v4 = NSNumber;
  uint64_t v5 = objc_msgSend_version(self, a2, v2);
  uint64_t v7 = objc_msgSend_numberWithUnsignedInteger_(v4, v6, v5);
  uint64_t v10 = objc_msgSend_hash(v7, v8, v9);

  v11 = NSNumber;
  uint64_t isObjectTrackingEnabled = objc_msgSend_isObjectTrackingEnabled(self, v12, v13);
  uint64_t v16 = objc_msgSend_numberWithBool_(v11, v15, isObjectTrackingEnabled);
  uint64_t v19 = objc_msgSend_hash(v16, v17, v18) ^ v10;

  uint64_t v20 = NSNumber;
  uint64_t isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(self, v21, v22);
  uint64_t v25 = objc_msgSend_numberWithBool_(v20, v24, isSegmentationEnabled);
  uint64_t v28 = objc_msgSend_hash(v25, v26, v27);

  v29 = NSNumber;
  uint64_t v32 = objc_msgSend_resolution(self, v30, v31);
  v34 = objc_msgSend_numberWithInteger_(v29, v33, v32);
  uint64_t v37 = v19 ^ v28 ^ objc_msgSend_hash(v34, v35, v36);

  v38 = NSNumber;
  uint64_t v41 = objc_msgSend_frameRate(self, v39, v40);
  v43 = objc_msgSend_numberWithInteger_(v38, v42, v41);
  unint64_t v46 = v37 ^ objc_msgSend_hash(v43, v44, v45);

  return v46;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_appendFormat_(v3, v6, @"<%@ %p> {\n", v5, self);

  uint64_t v9 = objc_msgSend_version(self, v7, v8);
  v11 = ANSTISPInferenceVersionToNSString(v9, v10);
  objc_msgSend_appendFormat_(v3, v12, @"  version %@\n", v11);

  if (objc_msgSend_isObjectTrackingEnabled(self, v13, v14)) {
    objc_msgSend_appendFormat_(v3, v15, @"  isObjectTrackingEnabled %@\n", @"YES");
  }
  else {
    objc_msgSend_appendFormat_(v3, v15, @"  isObjectTrackingEnabled %@\n", @"NO");
  }
  if (objc_msgSend_isSegmentationEnabled(self, v16, v17)) {
    objc_msgSend_appendFormat_(v3, v18, @"  isSegmentationEnabled %@\n", @"YES");
  }
  else {
    objc_msgSend_appendFormat_(v3, v18, @"  isSegmentationEnabled %@\n", @"NO");
  }
  uint64_t v21 = objc_msgSend_resolution(self, v19, v20);
  uint64_t v23 = ANSTISPInferenceResolutionToNSString(v21, v22);
  objc_msgSend_appendFormat_(v3, v24, @"  resolution %@\n", v23);

  uint64_t v27 = objc_msgSend_frameRate(self, v25, v26);
  v29 = ANSTISPInferenceFrameRateToNSString(v27, v28);
  objc_msgSend_appendFormat_(v3, v30, @"  frameRate %@\n", v29);

  objc_msgSend_appendFormat_(v3, v31, @"  useE5 %d\n", self->_useE5);
  objc_msgSend_appendString_(v3, v32, @"}");
  v35 = objc_msgSend_copy(v3, v33, v34);

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_version(self, v8, v9);
  uint64_t v12 = objc_msgSend_initForVersion_withError_(v7, v11, v10, 0);
  objc_msgSend_setUseE5_(v12, v13, self->_useE5);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_version(self, v6, v7);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v4, v9, v8);
  v11 = NSStringFromSelector(sel_version);
  objc_msgSend_encodeObject_forKey_(v5, v12, (uint64_t)v10, v11);

  BOOL useE5 = self->_useE5;
  NSStringFromSelector(sel_useE5);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v14, useE5, v15);
}

- (ANSTISPInferenceConfiguration)initWithCoder:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_version);
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);

  if (!v8)
  {
    uint64_t v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F70];
    uint64_t v33 = *MEMORY[0x263F07F80];
    v34[0] = @"ISP inference configuration version was not encoded.";
    uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v34, &v33, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v20, v23, v21, 4865, v22);
    goto LABEL_8;
  }
  v30.receiver = self;
  v30.super_class = (Class)ANSTISPInferenceConfiguration;
  self = [(ANSTISPInferenceConfiguration *)&v30 init];
  if (self)
  {
    uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v10, v11);
    uint64_t v13 = objc_opt_class();
    if (v12 == objc_msgSend__version(v13, v14, v15))
    {
      uint64_t v17 = NSStringFromSelector(sel_useE5);
      self->_BOOL useE5 = objc_msgSend_decodeBoolForKey_(v4, v18, (uint64_t)v17);

      goto LABEL_5;
    }
    v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F07F70];
    uint64_t v31 = *MEMORY[0x263F07F80];
    uint64_t v32 = @"Mismatched version.";
    uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)&v32, &v31, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, v25, 4864, v22);
    uint64_t v27 = LABEL_8:;
    objc_msgSend_failWithError_(v4, v28, (uint64_t)v27);

    uint64_t v19 = 0;
    goto LABEL_9;
  }
LABEL_5:
  self = self;
  uint64_t v19 = self;
LABEL_9:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)useE5
{
  return self->_useE5;
}

- (void)setUseE5:(BOOL)a3
{
  self->_BOOL useE5 = a3;
}

+ (id)defaultConfigurationForVersion:(unint64_t)a3 withError:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  if (a3 == 0x10000)
  {
    uint64_t v5 = [_ANSTISPInferenceConfigurationV1 alloc];
    uint64_t v7 = objc_msgSend_initForVersion_withError_(v5, v6, 0x10000, a4);
  }
  else
  {
    if (a4)
    {
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Unrecognized version.";
      uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v13, &v12, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, @"ANSTErrorDomain", 14, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v7 = 0;
  }
  return v7;
}

@end