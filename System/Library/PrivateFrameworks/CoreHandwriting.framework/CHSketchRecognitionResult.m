@interface CHSketchRecognitionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSketchRecognitionResult)initWithCoder:(id)a3;
- (CHSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5;
- (NSString)string;
- (double)rotation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSketchRecognitionResult

- (CHSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5
{
  v8 = (NSString *)a3;
  v20.receiver = self;
  v20.super_class = (Class)CHSketchRecognitionResult;
  v9 = [(CHRecognitionResult *)&v20 initWithScore:a4];
  v15 = v9;
  if (v9)
  {
    string = v9->_string;
    if (string != v8)
    {
      v9->_string = 0;
    }
    uint64_t v17 = objc_msgSend_copy(v8, v10, v11, v12, v13, v14);
    v18 = v15->_string;
    v15->_string = (NSString *)v17;

    v15->_rotation = a5;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSketchRecognitionResult *)a3;
  if (self == v4)
  {
    BOOL v49 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_msgSend_score(self, v6, v7, v8, v9, v10);
      double v12 = v11;
      objc_msgSend_score(v5, v13, v14, v15, v16, v17);
      if (v12 == v23
        && (objc_msgSend_string(self, v18, v19, v20, v21, v22),
            v24 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_string(v5, v25, v26, v27, v28, v29),
            v30 = objc_claimAutoreleasedReturnValue(),
            int isEqualToString = objc_msgSend_isEqualToString_(v24, v31, (uint64_t)v30, v32, v33, v34),
            v30,
            v24,
            isEqualToString))
      {
        objc_msgSend_rotation(self, v36, v37, v38, v39, v40);
        double v42 = v41;
        objc_msgSend_rotation(v5, v43, v44, v45, v46, v47);
        BOOL v49 = v42 == v48;
      }
      else
      {
        BOOL v49 = 0;
      }
    }
    else
    {
      BOOL v49 = 0;
    }
  }

  return v49;
}

- (CHSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_decodeDoubleForKey_(v4, v5, @"score", v6, v7, v8);
  v22.receiver = self;
  v22.super_class = (Class)CHSketchRecognitionResult;
  uint64_t v9 = -[CHRecognitionResult initWithScore:](&v22, sel_initWithScore_);
  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"string", v12, v13);
    string = v9->_string;
    v9->_string = (NSString *)v14;

    objc_msgSend_decodeFloatForKey_(v4, v16, @"rotation", v17, v18, v19);
    v9->_rotation = v20;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  objc_msgSend_score(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeDouble_forKey_(v21, v9, @"score", v10, v11, v12);
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)self->_string, @"string", v14, v15);
  double rotation = self->_rotation;
  *(float *)&double rotation = rotation;
  objc_msgSend_encodeFloat_forKey_(v21, v17, @"rotation", v18, v19, v20, rotation);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)rotation
{
  return self->_rotation;
}

- (void).cxx_destruct
{
}

@end