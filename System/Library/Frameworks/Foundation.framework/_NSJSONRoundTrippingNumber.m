@interface _NSJSONRoundTrippingNumber
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isSubclassOfClass:(Class)a3;
+ (BOOL)supportsSecureCoding;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
- (BOOL)_allowsDirectEncoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNumber:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isNSNumber__;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)superclass;
- (_NSJSONRoundTrippingNumber)initWithCoder:(id)a3;
- (_NSJSONRoundTrippingNumber)initWithNumber:(id)a3 representation:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)stringValue;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _NSJSONRoundTrippingNumber

- (_NSJSONRoundTrippingNumber)initWithNumber:(id)a3 representation:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_NSJSONRoundTrippingNumber;
  v6 = [(_NSJSONRoundTrippingNumber *)&v8 init];
  if (v6)
  {
    v6->_number = (NSNumber *)a3;
    v6->_representation = (NSString *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSJSONRoundTrippingNumber;
  [(_NSJSONRoundTrippingNumber *)&v3 dealloc];
}

- (id)stringValue
{
  v2 = (void *)[(NSString *)self->_representation copy];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      int v5 = [a3 isNSNumber];
      if (v5)
      {
        LOBYTE(v5) = [(_NSJSONRoundTrippingNumber *)self isEqualToNumber:a3];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isEqualToNumber:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || object_getClass(a3) != (Class)_NSJSONRoundTrippingNumber) {
    return 0;
  }
  representation = self->_representation;
  uint64_t v7 = *((void *)a3 + 2);

  return [(NSString *)representation isEqualToString:v7];
}

- (unint64_t)hash
{
  return [(NSString *)self->_representation hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (_NSJSONRoundTrippingNumber)initWithCoder:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"_NSJSONRoundTrippingNumber can only be decoded by NSXPCCoder." userInfo:0]);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.number"];
  if (!v5)
  {

    v14 = @"NSDebugDescription";
    v15[0] = @"Unable to decode underlying NSNumber instance for round-tripping number.";
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = (__CFString **)v15;
    v11 = &v14;
LABEL_9:
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.representation"];
  if (!v7)
  {

    v12 = @"NSDebugDescription";
    v13 = @"Unable to decode underlying string representation for round-tripping number.";
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = &v13;
    v11 = &v12;
    goto LABEL_9;
  }

  return [(_NSJSONRoundTrippingNumber *)self initWithNumber:v6 representation:v7];
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"_NSJSONRoundTrippingNumber can only be encoded by NSXPCCoder." userInfo:0]);
  }
  [a3 encodeObject:self->_number forKey:@"NS.number"];
  representation = self->_representation;

  [a3 encodeObject:representation forKey:@"NS.representation"];
}

- (Class)superclass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSNumber == (__objc2_class *)a3) {
    return 1;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____NSJSONRoundTrippingNumber;
  return objc_msgSendSuper2(&v4, sel_isSubclassOfClass_);
}

- (BOOL)isKindOfClass:(Class)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (NSNumber == (__objc2_class *)a3) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSJSONRoundTrippingNumber;
  return -[_NSJSONRoundTrippingNumber isKindOfClass:](&v4, sel_isKindOfClass_);
}

- (BOOL)isNSNumber__
{
  return 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return sel_initWithNumber_representation_ == a3
      || sel_dealloc == a3
      || sel_stringValue == a3
      || sel_initWithCoder_ == a3
      || sel_encodeWithCoder_ == a3
      || sel__allowsDirectEncoding == a3
      || sel_isEqual_ == a3
      || sel_isEqualToNumber_ == a3
      || sel_hash == a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v4 = objc_opt_class();

  return [v4 instancesRespondToSelector:a3];
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  return (id)+[NSNumber instanceMethodSignatureForSelector:a3];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[(NSNumber *)self->_number methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

@end