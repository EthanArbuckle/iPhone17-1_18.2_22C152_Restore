@interface CHRecognitionSessionVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidSessionResultVersion;
- (BOOL)isValidSessionVersion;
- (CHRecognitionSessionVersion)initWithCoder:(id)a3;
- (CHRecognitionSessionVersion)initWithSessionVersion:(int64_t)a3 sessionResultVersion:(int64_t)a4;
- (int64_t)sessionResultVersion;
- (int64_t)sessionVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHRecognitionSessionVersion

- (CHRecognitionSessionVersion)initWithSessionVersion:(int64_t)a3 sessionResultVersion:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHRecognitionSessionVersion;
  result = [(CHRecognitionSessionVersion *)&v7 init];
  if (result)
  {
    result->_sessionVersion = a3;
    result->_sessionResultVersion = a4;
  }
  return result;
}

- (BOOL)isValidSessionVersion
{
  return self->_sessionVersion == 1;
}

- (BOOL)isValidSessionResultVersion
{
  return self->_sessionResultVersion == 5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend_encodeInteger_forKey_(v10, v4, self->_sessionVersion, @"sessionVersion", v5, v6);
  objc_msgSend_encodeInteger_forKey_(v10, v7, self->_sessionResultVersion, @"sessionResultVersion", v8, v9);
}

- (CHRecognitionSessionVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_decodeIntegerForKey_(v4, v5, @"sessionVersion", v6, v7, v8);
  uint64_t v14 = objc_msgSend_decodeIntegerForKey_(v4, v10, @"sessionResultVersion", v11, v12, v13);
  v18 = (CHRecognitionSessionVersion *)objc_msgSend_initWithSessionVersion_sessionResultVersion_(self, v15, v9, v14, v16, v17);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)sessionVersion
{
  return self->_sessionVersion;
}

- (int64_t)sessionResultVersion
{
  return self->_sessionResultVersion;
}

@end