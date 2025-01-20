@interface CTLazuliOperationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)didSucceed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliOperationResult:(id)a3;
- (CTLazuliOperationError)errorParameter;
- (CTLazuliOperationID)operation;
- (CTLazuliOperationResult)initWithCoder:(id)a3;
- (CTLazuliOperationResult)initWithReflection:(const void *)a3;
- (NSError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDidSucceed:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setErrorParameter:(id)a3;
- (void)setOperation:(id)a3;
@end

@implementation CTLazuliOperationResult

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  [v3 appendFormat:@", didSucceed = %d", -[CTLazuliOperationResult didSucceed](self, "didSucceed")];
  v4 = [(CTLazuliOperationResult *)self error];
  [v3 appendFormat:@", error = %@", v4];

  v5 = [(CTLazuliOperationResult *)self operation];
  [v3 appendFormat:@", operation = %@", v5];

  v6 = [(CTLazuliOperationResult *)self errorParameter];
  [v3 appendFormat:@", errorParameter = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliOperationResult:(id)a3
{
  id v6 = a3;
  int v7 = [(CTLazuliOperationResult *)self didSucceed];
  if (v7 != [v6 didSucceed])
  {
    char v8 = 0;
    goto LABEL_19;
  }
  v9 = [(CTLazuliOperationResult *)self error];
  if (v9 || ([v6 error], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliOperationResult *)self error];
    v4 = [v6 error];
    if (([v3 isEqual:v4] & 1) == 0)
    {

      char v8 = 0;
      goto LABEL_16;
    }
    int v19 = 1;
  }
  else
  {
    v18 = 0;
    int v19 = 0;
  }
  v10 = [(CTLazuliOperationResult *)self operation];
  v11 = [v6 operation];
  if ([v10 isEqualToCTLazuliOperationID:v11])
  {
    v12 = [(CTLazuliOperationResult *)self errorParameter];
    if (v12 || ([v6 errorParameter], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(CTLazuliOperationResult *)self errorParameter];
      v14 = [v6 errorParameter];
      char v8 = [v13 isEqualToCTLazuliOperationError:v14];

      if (v12)
      {

        goto LABEL_23;
      }
      v16 = (void *)v17;
    }
    else
    {
      v16 = 0;
      char v8 = 1;
    }

LABEL_23:
    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  char v8 = 0;
  if (v19)
  {
LABEL_15:
  }
LABEL_16:
  if (!v9) {

  }
LABEL_19:
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliOperationResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliOperationResult *)self isEqualToCTLazuliOperationResult:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliOperationResult allocWithZone:a3];
  [(CTLazuliOperationResult *)v4 setDidSucceed:self->_didSucceed];
  [(CTLazuliOperationResult *)v4 setError:self->_error];
  [(CTLazuliOperationResult *)v4 setOperation:self->_operation];
  [(CTLazuliOperationResult *)v4 setErrorParameter:self->_errorParameter];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_didSucceed forKey:@"kDidSucceedKey"];
  [v4 encodeObject:self->_error forKey:@"kErrorKey"];
  [v4 encodeObject:self->_operation forKey:@"kOperationKey"];
  [v4 encodeObject:self->_errorParameter forKey:@"kErrorParameterKey"];
}

- (CTLazuliOperationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliOperationResult;
  v5 = [(CTLazuliOperationResult *)&v12 init];
  if (v5)
  {
    v5->_didSucceed = [v4 decodeBoolForKey:@"kDidSucceedKey"];
    error = v5->_error;
    v5->_error = 0;

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOperationKey"];
    operation = v5->_operation;
    v5->_operation = (CTLazuliOperationID *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kErrorParameterKey"];
    errorParameter = v5->_errorParameter;
    v5->_errorParameter = (CTLazuliOperationError *)v9;
  }
  return v5;
}

- (CTLazuliOperationResult)initWithReflection:(const void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliOperationResult;
  id v4 = [(CTLazuliOperationResult *)&v13 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_didSucceed = *(unsigned char *)a3;
  error = v4->_error;
  v4->_error = 0;

  uint64_t v7 = [[CTLazuliOperationID alloc] initWithReflection:(char *)a3 + 16];
  operation = v5->_operation;
  v5->_operation = v7;

  if (!*((unsigned char *)a3 + 44))
  {
    errorParameter = v5->_errorParameter;
    v5->_errorParameter = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [CTLazuliOperationError alloc];
  if (*((unsigned char *)a3 + 44))
  {
    uint64_t v10 = [(CTLazuliOperationError *)v9 initWithReflection:(char *)a3 + 40];
    errorParameter = v5->_errorParameter;
    v5->_errorParameter = (CTLazuliOperationError *)v10;
LABEL_6:

    return v5;
  }
  result = (CTLazuliOperationResult *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (CTLazuliOperationID)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (CTLazuliOperationError)errorParameter
{
  return self->_errorParameter;
}

- (void)setErrorParameter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorParameter, 0);
  objc_storeStrong((id *)&self->_operation, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end