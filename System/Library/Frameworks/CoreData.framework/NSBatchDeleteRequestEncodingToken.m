@interface NSBatchDeleteRequestEncodingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)secure;
- (NSBatchDeleteRequestEncodingToken)initWithCoder:(id)a3;
- (NSData)fetchData;
- (id)initForRequest:(id)a3;
- (int64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSBatchDeleteRequestEncodingToken

- (id)initForRequest:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSBatchDeleteRequestEncodingToken;
  v4 = [(NSBatchDeleteRequestEncodingToken *)&v6 init];
  if (v4)
  {
    v4->_fetchData = (NSData *)objc_msgSend((id)objc_msgSend(a3, "fetchRequest"), "encodeForXPC");
    v4->_resultType = [a3 resultType];
    v4->_secure = [a3 _secureOperation];
  }
  return v4;
}

- (void)dealloc
{
  self->_fetchData = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchDeleteRequestEncodingToken;
  [(NSBatchDeleteRequestEncodingToken *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSBatchDeleteRequestEncodingToken)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSBatchDeleteRequestEncodingToken;
  v4 = [(NSBatchDeleteRequestEncodingToken *)&v8 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_fetchData = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"fetch");
    v4->_resultType = [a3 decodeIntegerForKey:@"resultType"];
    v4->_secure = [a3 decodeBoolForKey:@"secure"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_fetchData forKey:@"fetch"];
  [a3 encodeInteger:self->_resultType forKey:@"resultType"];
  BOOL secure = self->_secure;

  [a3 encodeBool:secure forKey:@"secure"];
}

- (NSData)fetchData
{
  return self->_fetchData;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (BOOL)secure
{
  return self->_secure;
}

@end