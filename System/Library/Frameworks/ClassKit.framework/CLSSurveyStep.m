@interface CLSSurveyStep
+ (BOOL)supportsSecureCoding;
- (BOOL)validateObject:(id *)a3;
- (CLSSurveyStep)initWithCoder:(id)a3;
- (int64_t)type;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CLSSurveyStep

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSSurveyStep)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSSurveyStep;
  v6 = [(CLSObject *)&v9 initWithCoder:v4];
  if (v6)
  {
    v6->_version = objc_msgSend_decodeIntegerForKey_(v4, v5, @"version");
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v7, @"type");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSSurveyStep;
  id v4 = a3;
  [(CLSObject *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_version, @"version", v7.receiver, v7.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_type, @"type");
}

- (int64_t)version
{
  objc_msgSend_lock(self, a2, v2);
  int64_t version = self->_version;
  objc_msgSend_unlock(self, v5, v6);
  return version;
}

- (void)setVersion:(int64_t)a3
{
  objc_msgSend_lock(self, a2, a3);
  if (self->_version != a3)
  {
    self->_int64_t version = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }

  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)type
{
  objc_msgSend_lock(self, a2, v2);
  int64_t type = self->_type;
  objc_msgSend_unlock(self, v5, v6);
  return type;
}

- (void)setType:(int64_t)a3
{
  objc_msgSend_lock(self, a2, a3);
  if (self->_type != a3)
  {
    self->_int64_t type = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }

  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLSSurveyStep;
  return [(CLSObject *)&v4 validateObject:a3];
}

@end