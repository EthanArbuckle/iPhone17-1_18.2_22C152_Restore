@interface NSUnit
+ (BOOL)supportsSecureCoding;
+ (NSUnit)new;
- (BOOL)isEqual:(id)a3;
- (NSString)symbol;
- (NSUnit)init;
- (NSUnit)initWithCoder:(id)a3;
- (NSUnit)initWithSymbol:(NSString *)symbol;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSUnit

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSUnit;
  return (id)objc_msgSend(-[NSUnit description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" %@", self->_symbol));
}

- (unint64_t)hash
{
  uint64_t v3 = [(objc_class *)[(NSUnit *)self _effectiveUnitClass] hash];
  return [(NSString *)[(NSUnit *)self symbol] hash] ^ v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSUnit;
  [(NSUnit *)&v3 dealloc];
}

- (NSUnit)initWithSymbol:(NSString *)symbol
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSUnit;
  uint64_t v4 = [(NSUnit *)&v6 init];
  if (v4) {
    v4->_symbol = (NSString *)[(NSString *)symbol copy];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (objc_class *)[a3 _effectiveUnitClass];
  if (v5 != [(NSUnit *)self _effectiveUnitClass]) {
    return 0;
  }
  uint64_t v7 = (void *)[a3 symbol];
  v8 = [(NSUnit *)self symbol];

  return [v7 isEqual:v8];
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUnit)init
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-init should never be called on NSUnit!" userInfo:0]);
}

+ (NSUnit)new
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"+new should never be called on NSUnit!" userInfo:0]);
}

- (NSUnit)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSUnit cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.symbol"];
  if (v5)
  {
    return [(NSUnit *)self initWithSymbol:v5];
  }
  else
  {

    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4865, 0));
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSUnit encoder does not allow non-keyed coding!" userInfo:0]);
  }
  symbol = self->_symbol;

  [a3 encodeObject:symbol forKey:@"NS.symbol"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end