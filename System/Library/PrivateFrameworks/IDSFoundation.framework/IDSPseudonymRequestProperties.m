@interface IDSPseudonymRequestProperties
+ (BOOL)supportsSecureCoding;
+ (id)defaultProperties;
- (IDSPseudonymRequestProperties)initWithCoder:(id)a3;
- (double)requestTimeoutInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestTimeoutInterval:(double)a3;
@end

@implementation IDSPseudonymRequestProperties

+ (id)defaultProperties
{
  id v2 = objc_alloc_init((Class)a1);
  objc_msgSend_setRequestTimeoutInterval_(v2, v3, v4, 600.0);
  return v2;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p requestTimeoutInterval: %f>", self->_requestTimeoutInterval, v5, self, *(void *)&self->_requestTimeoutInterval);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 1) = *(void *)&self->_requestTimeoutInterval;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPseudonymRequestProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSPseudonymRequestProperties;
  v6 = [(IDSPseudonymRequestProperties *)&v10 init];
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, @"timeout", v7);
    v6->_requestTimeoutInterval = v8;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (double)requestTimeoutInterval
{
  return self->_requestTimeoutInterval;
}

- (void)setRequestTimeoutInterval:(double)a3
{
  self->_requestTimeoutInterval = a3;
}

@end