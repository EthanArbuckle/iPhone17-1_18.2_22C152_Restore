@interface _ANSTISPInferenceConfigurationV1
+ (BOOL)supportsSecureCoding;
+ (unint64_t)_version;
- (BOOL)isObjectTrackingEnabled;
- (BOOL)isSegmentationEnabled;
- (_ANSTISPInferenceConfigurationV1)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForVersion:(unint64_t)a3 withError:(id *)a4;
- (int64_t)frameRate;
- (int64_t)resolution;
- (void)encodeWithCoder:(id)a3;
- (void)setFrameRate:(int64_t)a3;
- (void)setObjectTrackingEnabled:(BOOL)a3;
- (void)setResolution:(int64_t)a3;
- (void)setSegmentationEnabled:(BOOL)a3;
@end

@implementation _ANSTISPInferenceConfigurationV1

+ (unint64_t)_version
{
  return 0x10000;
}

- (id)initForVersion:(unint64_t)a3 withError:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  id result = [(ANSTISPInferenceConfiguration *)&v5 initForVersion:a3 withError:a4];
  if (result)
  {
    *((unsigned char *)result + 16) = 1;
    *((unsigned char *)result + 17) = 1;
    *((void *)result + 3) = 0;
    *((void *)result + 4) = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  id result = [(ANSTISPInferenceConfiguration *)&v5 copyWithZone:a3];
  if (result)
  {
    *((unsigned char *)result + 16) = self->_objectTrackingEnabled;
    *((unsigned char *)result + 17) = self->_segmentationEnabled;
    *((void *)result + 3) = self->_resolution;
    *((void *)result + 4) = self->_frameRate;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  id v4 = a3;
  [(ANSTISPInferenceConfiguration *)&v37 encodeWithCoder:v4];
  objc_super v5 = NSNumber;
  uint64_t isObjectTrackingEnabled = objc_msgSend_isObjectTrackingEnabled(self, v6, v7, v37.receiver, v37.super_class);
  v10 = objc_msgSend_numberWithBool_(v5, v9, isObjectTrackingEnabled);
  v11 = NSStringFromSelector(sel_isObjectTrackingEnabled);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v10, v11);

  v13 = NSNumber;
  uint64_t isSegmentationEnabled = objc_msgSend_isSegmentationEnabled(self, v14, v15);
  v18 = objc_msgSend_numberWithBool_(v13, v17, isSegmentationEnabled);
  v19 = NSStringFromSelector(sel_isSegmentationEnabled);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v18, v19);

  v21 = NSNumber;
  uint64_t v24 = objc_msgSend_resolution(self, v22, v23);
  v26 = objc_msgSend_numberWithInteger_(v21, v25, v24);
  v27 = NSStringFromSelector(sel_resolution);
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v26, v27);

  v29 = NSNumber;
  uint64_t v32 = objc_msgSend_frameRate(self, v30, v31);
  v34 = objc_msgSend_numberWithInteger_(v29, v33, v32);
  v35 = NSStringFromSelector(sel_frameRate);
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v34, v35);
}

- (_ANSTISPInferenceConfigurationV1)initWithCoder:(id)a3
{
  v62[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_ANSTISPInferenceConfigurationV1;
  objc_super v5 = [(ANSTISPInferenceConfiguration *)&v54 initWithCoder:v4];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(sel_isObjectTrackingEnabled);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);

  if (!v9)
  {
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F07F70];
    uint64_t v61 = *MEMORY[0x263F07F80];
    v62[0] = @"-isObjectTrackingEnabled was not encoded.";
    v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v62, &v61, 1);
    v35 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, v32, 4865, v33);
    objc_msgSend_failWithError_(v4, v36, (uint64_t)v35);

LABEL_14:
    v30 = 0;
    goto LABEL_15;
  }
  v5->_objectTrackingEnabled = objc_msgSend_BOOLValue(v9, v10, v11);
  uint64_t v12 = objc_opt_class();
  v13 = NSStringFromSelector(sel_isSegmentationEnabled);
  uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);

  if (!v15)
  {
    objc_super v37 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F07F70];
    uint64_t v59 = *MEMORY[0x263F07F80];
    v60 = @"-isSegmentationEnabled was not encoded.";
    v39 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)&v60, &v59, 1);
    v41 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, v38, 4865, v39);
    objc_msgSend_failWithError_(v4, v42, (uint64_t)v41);

LABEL_13:
    goto LABEL_14;
  }
  v5->_segmentationEnabled = objc_msgSend_BOOLValue(v15, v16, v17);
  uint64_t v18 = objc_opt_class();
  v19 = NSStringFromSelector(sel_resolution);
  v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v18, v19);

  if (!v21)
  {
    v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F07F70];
    uint64_t v57 = *MEMORY[0x263F07F80];
    v58 = @"-resolution was not encoded.";
    v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v22, (uint64_t)&v58, &v57, 1);
    v46 = objc_msgSend_errorWithDomain_code_userInfo_(v43, v45, v44, 4865, v27);
    objc_msgSend_failWithError_(v4, v47, (uint64_t)v46);
LABEL_12:

    goto LABEL_13;
  }
  v5->_resolution = objc_msgSend_integerValue(v21, v22, v23);
  uint64_t v24 = objc_opt_class();
  v25 = NSStringFromSelector(sel_frameRate);
  v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v24, v25);

  if (!v27)
  {
    v48 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F07F70];
    uint64_t v55 = *MEMORY[0x263F07F80];
    v56 = @"-frameRate was not encoded.";
    v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v56, &v55, 1);
    v51 = objc_msgSend_errorWithDomain_code_userInfo_(v48, v50, v49, 4865, v46);
    objc_msgSend_failWithError_(v4, v52, (uint64_t)v51);

    goto LABEL_12;
  }
  v5->_frameRate = objc_msgSend_integerValue(v27, v28, v29);

LABEL_7:
  v30 = v5;
LABEL_15:

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isObjectTrackingEnabled
{
  return self->_objectTrackingEnabled;
}

- (void)setObjectTrackingEnabled:(BOOL)a3
{
  self->_objectTrackingEnabled = a3;
}

- (BOOL)isSegmentationEnabled
{
  return self->_segmentationEnabled;
}

- (void)setSegmentationEnabled:(BOOL)a3
{
  self->_segmentationEnabled = a3;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (int64_t)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(int64_t)a3
{
  self->_frameRate = a3;
}

@end