@interface CHRemoteRecognitionRequest
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
+ (id)loadFromFile:(id)a3;
- (BOOL)enableCachingIfAvailable;
- (BOOL)hasBeenSubmitted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRecognitionRequest:(id)a3;
- (BOOL)shouldContributeToStyle;
- (CGSize)minimumDrawingSize;
- (CHDrawing)drawing;
- (CHRemoteRecognitionRequest)initWithCoder:(id)a3;
- (CHRemoteRecognitionRequest)initWithDrawing:(id)a3 options:(id)a4 priority:(int64_t)a5;
- (NSDictionary)options;
- (id)description;
- (id)writeToFileInFolder:(id)a3 basename:(id)a4;
- (int64_t)priority;
- (unint64_t)hash;
- (unint64_t)maxRecognitionResultCount;
- (void)encodeWithCoder:(id)a3;
- (void)setDrawing:(id)a3;
- (void)setEnableCachingIfAvailable:(BOOL)a3;
- (void)setHasBeenSubmitted:(BOOL)a3;
- (void)setMaxRecognitionResultCount:(unint64_t)a3;
- (void)setMinimumDrawingSize:(CGSize)a3;
- (void)setOptions:(id)a3;
- (void)setPriority:(int64_t)a3;
@end

@implementation CHRemoteRecognitionRequest

- (CHRemoteRecognitionRequest)initWithDrawing:(id)a3 options:(id)a4 priority:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CHRemoteRecognitionRequest;
  v11 = [(CHRemoteRecognitionRequest *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_drawing, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v12->_hasBeenSubmitted = 0;
    v12->_priority = a5;
    v17 = objc_msgSend_objectForKeyedSubscript_(v10, v13, @"CHRequestOptionContributeToStyle", v14, v15, v16);
    v12->_shouldContributeToStyle = objc_msgSend_BOOLValue(v17, v18, v19, v20, v21, v22);
  }
  return v12;
}

- (CHRemoteRecognitionRequest)initWithCoder:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"drawing", v7, v8);
  unint64_t v14 = objc_msgSend_decodeIntegerForKey_(v4, v10, @"priority", v11, v12, v13);
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  objc_super v24 = objc_msgSend_setWithObjects_(v15, v20, v16, v21, v22, v23, v17, v18, v19, 0);
  v28 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v25, (uint64_t)v24, @"options", v26, v27);

  if (v14 <= 2 && v9)
  {
    v66.receiver = self;
    v66.super_class = (Class)CHRemoteRecognitionRequest;
    v29 = [(CHRemoteRecognitionRequest *)&v66 init];
    objc_storeStrong((id *)&v29->_drawing, v9);
    objc_storeStrong((id *)&v29->_options, v28);
    v29->_priority = v14;
    objc_msgSend_decodeFloatForKey_(v4, v30, @"minimumDrawingWidth", v31, v32, v33);
    float v35 = v34;
    objc_msgSend_decodeFloatForKey_(v4, v36, @"minimumDrawingHeight", v37, v38, v39);
    v29->_minimumDrawingSize.width = v35;
    v29->_minimumDrawingSize.height = v40;
    uint64_t v41 = objc_opt_class();
    v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"maxRecognitionResultCount", v43, v44);
    v29->_maxRecognitionResultCount = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48, v49, v50);

    v29->_enableCachingIfAvailable = objc_msgSend_decodeBoolForKey_(v4, v51, @"enableCachingIfAvailable", v52, v53, v54);
    v29->_hasBeenSubmitted = objc_msgSend_decodeBoolForKey_(v4, v55, @"hasBeenSubmitted", v56, v57, v58);
    v29->_shouldContributeToStyle = objc_msgSend_decodeBoolForKey_(v4, v59, @"shouldContributeToStyle", v60, v61, v62);
  }
  else
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v63 = (id)qword_1EA3C9FB0;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = (id)objc_opt_class();
      id v64 = v68;
      _os_log_impl(&dword_1C492D000, v63, OS_LOG_TYPE_ERROR, "%@ decoding failed. Drawing is required to be non-null and priority has to be valid.", buf, 0xCu);
    }
    v29 = 0;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v40 = a3;
  objc_msgSend_encodeObject_forKey_(v40, v4, (uint64_t)self->_drawing, @"drawing", v5, v6);
  objc_msgSend_encodeObject_forKey_(v40, v7, (uint64_t)self->_options, @"options", v8, v9);
  CGFloat width = self->_minimumDrawingSize.width;
  *(float *)&CGFloat width = width;
  objc_msgSend_encodeFloat_forKey_(v40, v11, @"minimumDrawingWidth", v12, v13, v14, width);
  CGFloat height = self->_minimumDrawingSize.height;
  *(float *)&CGFloat height = height;
  objc_msgSend_encodeFloat_forKey_(v40, v16, @"minimumDrawingHeight", v17, v18, v19, height);
  objc_super v24 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, self->_maxRecognitionResultCount, v21, v22, v23);
  objc_msgSend_encodeObject_forKey_(v40, v25, (uint64_t)v24, @"maxRecognitionResultCount", v26, v27);

  objc_msgSend_encodeBool_forKey_(v40, v28, self->_enableCachingIfAvailable, @"enableCachingIfAvailable", v29, v30);
  objc_msgSend_encodeBool_forKey_(v40, v31, self->_hasBeenSubmitted, @"hasBeenSubmitted", v32, v33);
  objc_msgSend_encodeInteger_forKey_(v40, v34, self->_priority, @"priority", v35, v36);
  objc_msgSend_encodeBool_forKey_(v40, v37, self->_shouldContributeToStyle, @"shouldContributeToStyle", v38, v39);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  id v4 = CoreHandwriting::writeObjectToFileInFolder((CoreHandwriting *)self, (objc_object *)a3, (NSURL *)a4, (NSString *)a4);
  return v4;
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

- (void)setDrawing:(id)a3
{
  uint64_t v9 = (CHDrawing *)a3;
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v10 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v13, 2u);
    }
  }
  if (self->_drawing != v9)
  {
    uint64_t v11 = (CHDrawing *)objc_msgSend_copy(v9, v4, v5, v6, v7, v8);
    drawing = self->_drawing;
    self->_drawing = v11;
  }
}

- (void)setOptions:(id)a3
{
  uint64_t v9 = (NSDictionary *)a3;
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v10 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v13, 2u);
    }
  }
  if (self->_options != v9)
  {
    uint64_t v11 = (NSDictionary *)objc_msgSend_copy(v9, v4, v5, v6, v7, v8);
    options = self->_options;
    self->_options = v11;
  }
}

- (void)setMinimumDrawingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v6 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1C492D000, v6, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v8, 2u);
    }
  }
  if (self->_minimumDrawingSize.width != width || self->_minimumDrawingSize.height != height)
  {
    self->_minimumDrawingSize.double width = width;
    self->_minimumDrawingSize.double height = height;
  }
}

- (void)setMaxRecognitionResultCount:(unint64_t)a3
{
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v5 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v6, 2u);
    }
  }
  if (self->_maxRecognitionResultCount != a3) {
    self->_maxRecognitionResultCount = a3;
  }
}

- (void)setEnableCachingIfAvailable:(BOOL)a3
{
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v5 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v6, 2u);
    }
  }
  self->_enableCachingIfAvailable = a3;
}

- (void)setHasBeenSubmitted:(BOOL)a3
{
  if (self->_hasBeenSubmitted && !a3)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v5 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_FAULT, "hasBeenSubmitted state cannot be reverted after being set to YES", v6, 2u);
    }
  }
  self->_hasBeenSubmitted = a3;
}

- (void)setPriority:(int64_t)a3
{
  if (self->_hasBeenSubmitted)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v5 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionRequest cannot be mutated after being submitted", v6, 2u);
    }
  }
  if (self->_priority != a3) {
    self->_priority = a3;
  }
}

- (BOOL)isEqualToRemoteRecognitionRequest:(id)a3
{
  uint64_t v9 = (CHRemoteRecognitionRequest *)a3;
  if (self != v9)
  {
    objc_msgSend_minimumDrawingSize(self, v4, v5, v6, v7, v8);
    double v11 = v10;
    double v13 = v12;
    objc_msgSend_minimumDrawingSize(v9, v14, v15, v16, v17, v18);
    if (v11 != v25 || v13 != v24) {
      goto LABEL_20;
    }
    uint64_t v27 = objc_msgSend_maxRecognitionResultCount(self, v19, v20, v21, v22, v23);
    if (v27 != objc_msgSend_maxRecognitionResultCount(v9, v28, v29, v30, v31, v32)) {
      goto LABEL_20;
    }
    int v38 = objc_msgSend_enableCachingIfAvailable(self, v33, v34, v35, v36, v37);
    if (v38 != objc_msgSend_enableCachingIfAvailable(v9, v39, v40, v41, v42, v43)) {
      goto LABEL_20;
    }
    uint64_t v49 = objc_msgSend_drawing(self, v44, v45, v46, v47, v48);
    uint64_t v60 = objc_msgSend_drawing(v9, v50, v51, v52, v53, v54);
    if (v49 == v60)
    {
    }
    else
    {
      uint64_t v61 = objc_msgSend_drawing(self, v55, v56, v57, v58, v59);
      v67 = objc_msgSend_drawing(v9, v62, v63, v64, v65, v66);
      int isEqualToDrawing = objc_msgSend_isEqualToDrawing_(v61, v68, (uint64_t)v67, v69, v70, v71);

      if (!isEqualToDrawing) {
        goto LABEL_20;
      }
    }
    v79 = objc_msgSend_options(self, v73, v74, v75, v76, v77);
    v90 = objc_msgSend_options(v9, v80, v81, v82, v83, v84);
    if (v79 == v90)
    {
    }
    else
    {
      v91 = objc_msgSend_options(self, v85, v86, v87, v88, v89);
      v97 = objc_msgSend_options(v9, v92, v93, v94, v95, v96);
      int isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v91, v98, (uint64_t)v97, v99, v100, v101);

      if (!isEqualToDictionary) {
        goto LABEL_20;
      }
    }
    uint64_t v108 = objc_msgSend_priority(self, v103, v104, v105, v106, v107);
    if (v108 == objc_msgSend_priority(v9, v109, v110, v111, v112, v113))
    {
      int shouldContributeToStyle = objc_msgSend_shouldContributeToStyle(self, v114, v115, v116, v117, v118);
      int v78 = shouldContributeToStyle ^ objc_msgSend_shouldContributeToStyle(v9, v120, v121, v122, v123, v124) ^ 1;
      goto LABEL_21;
    }
LABEL_20:
    LOBYTE(v78) = 0;
    goto LABEL_21;
  }
  LOBYTE(v78) = 1;
LABEL_21:

  return v78;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteRecognitionRequest = objc_msgSend_isEqualToRemoteRecognitionRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionRequest;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  double width = self->_minimumDrawingSize.width;
  double height = self->_minimumDrawingSize.height;
  uint64_t v9 = objc_msgSend_options(self, a2, v2, v3, v4, v5);
  uint64_t v15 = objc_msgSend_hash(v9, v10, v11, v12, v13, v14);

  uint64_t v21 = objc_msgSend_drawing(self, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_hash(v21, v22, v23, v24, v25, v26);

  uint64_t v33 = objc_msgSend_maxRecognitionResultCount(self, v28, v29, v30, v31, v32);
  return v15 ^ v27 ^ v33 ^ objc_msgSend_shouldContributeToStyle(self, v34, v35, v36, v37, v38) ^ (unint64_t)(height + (double)(unint64_t)width);
}

- (id)description
{
  uint64_t v7 = NSString;
  uint64_t v8 = objc_msgSend_description(self->_options, a2, v2, v3, v4, v5);
  uint64_t v13 = (void *)v8;
  uint64_t v14 = @"Y";
  if (self->_enableCachingIfAvailable) {
    uint64_t v15 = @"Y";
  }
  else {
    uint64_t v15 = @"N";
  }
  if (self->_hasBeenSubmitted) {
    uint64_t v16 = @"Y";
  }
  else {
    uint64_t v16 = @"N";
  }
  if (!self->_shouldContributeToStyle) {
    uint64_t v14 = @"N";
  }
  uint64_t v17 = objc_msgSend_stringWithFormat_(v7, v9, @"Remote Recognition Request %p (option keys=%@, drawing=%p, enableCachingIfAvailable=%@, hasBeenSubmitted=%@, priority=%ld, shouldContributeToStyle=%@)", v10, v11, v12, self, v8, self->_drawing, v15, v16, self->_priority, v14);

  return v17;
}

- (CGSize)minimumDrawingSize
{
  double width = self->_minimumDrawingSize.width;
  double height = self->_minimumDrawingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)maxRecognitionResultCount
{
  return self->_maxRecognitionResultCount;
}

- (NSDictionary)options
{
  return self->_options;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (BOOL)enableCachingIfAvailable
{
  return self->_enableCachingIfAvailable;
}

- (BOOL)hasBeenSubmitted
{
  return self->_hasBeenSubmitted;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)shouldContributeToStyle
{
  return self->_shouldContributeToStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end