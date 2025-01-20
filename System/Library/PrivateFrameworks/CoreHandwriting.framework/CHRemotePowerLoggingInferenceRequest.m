@interface CHRemotePowerLoggingInferenceRequest
+ (BOOL)supportsSecureCoding;
- (CHRemotePowerLoggingInferenceRequest)initWithCoder:(id)a3;
- (CHRemotePowerLoggingInferenceRequest)initWithModel:(unint64_t)a3 startTime:(double)a4 endTime:(double)a5 data:(id)a6;
- (NSDictionary)data;
- (double)end;
- (double)start;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setEnd:(double)a3;
- (void)setStart:(double)a3;
@end

@implementation CHRemotePowerLoggingInferenceRequest

- (CHRemotePowerLoggingInferenceRequest)initWithModel:(unint64_t)a3 startTime:(double)a4 endTime:(double)a5 data:(id)a6
{
  id v10 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CHRemotePowerLoggingInferenceRequest;
  v11 = [(CHRemotePowerLoggingRequest *)&v21 initWithModel:a3];
  v17 = v11;
  if (v11)
  {
    v11->_start = a4;
    v11->_end = a5;
    uint64_t v18 = objc_msgSend_copy(v10, v12, v13, v14, v15, v16);
    data = v17->_data;
    v17->_data = (NSDictionary *)v18;
  }
  return v17;
}

- (CHRemotePowerLoggingInferenceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CHRemotePowerLoggingInferenceRequest;
  v9 = [(CHRemotePowerLoggingRequest *)&v35 initWithCoder:v4];
  if (v9)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, @"start", v6, v7, v8);
    v9->_start = v10;
    objc_msgSend_decodeDoubleForKey_(v4, v11, @"end", v12, v13, v14);
    v9->_end = v15;
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v22 = objc_msgSend_setWithObject_(v16, v18, v17, v19, v20, v21);
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v29 = objc_msgSend_setWithObject_(v23, v25, v24, v26, v27, v28);
    uint64_t v32 = objc_msgSend_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(v4, v30, (uint64_t)v22, (uint64_t)v29, @"data", v31);
    data = v9->_data;
    v9->_data = (NSDictionary *)v32;
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CHRemotePowerLoggingInferenceRequest;
  [(CHRemotePowerLoggingRequest *)&v26 encodeWithCoder:v4];
  double v10 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, v8, v9, self->_start);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, @"start", v12, v13);

  uint64_t v19 = objc_msgSend_numberWithDouble_(NSNumber, v14, v15, v16, v17, v18, self->_end);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"end", v21, v22);

  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)self->_data, @"data", v24, v25);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end