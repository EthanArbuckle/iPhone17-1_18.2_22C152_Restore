@interface CTLazuliOperationError
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliOperationError:(id)a3;
- (CTLazuliOperationError)initWithCoder:(id)a3;
- (CTLazuliOperationError)initWithReflection:(const OperationError *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)value;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(int64_t)a3;
@end

@implementation CTLazuliOperationError

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  int64_t v4 = [(CTLazuliOperationError *)self value];
  int64_t v6 = [(CTLazuliOperationError *)self value];
  [v3 appendFormat:@", value = [%ld - %s]", v4, print_CTLazuliErrorType(&v6)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliOperationError:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CTLazuliOperationError *)self value];
  LOBYTE(v5) = v5 == [v4 value];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliOperationError *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliOperationError *)self isEqualToCTLazuliOperationError:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliOperationError allocWithZone:a3];
  [(CTLazuliOperationError *)v4 setValue:self->_value];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [NSNumber numberWithLong:self->_value];
  [v5 encodeObject:v4 forKey:@"kValueKey"];
}

- (CTLazuliOperationError)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliOperationError;
  id v5 = [(CTLazuliOperationError *)&v8 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kValueKey"];
    v5->_value = [v6 longValue];
  }
  return v5;
}

- (CTLazuliOperationError)initWithReflection:(const OperationError *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CTLazuliOperationError;
  id v4 = [(CTLazuliOperationError *)&v6 init];
  if (v4) {
    v4->_value = encode_CTLazuliErrorType((unsigned int *)a3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

@end