@interface _CPError
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)reason;
- (_CPError)initWithFacade:(id)a3;
- (double)code;
- (unint64_t)errorCode;
- (unint64_t)hash;
- (void)setCode:(double)a3;
- (void)setDomain:(id)a3;
- (void)setErrorCode:(unint64_t)a3;
- (void)setReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setErrorCode:(unint64_t)a3
{
  self->_errorCode = a3;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (void)setCode:(double)a3
{
  self->_code = a3;
}

- (double)code
{
  return self->_code;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  NSUInteger v4 = [(NSString *)self->_reason hash];
  double code = self->_code;
  NSUInteger v6 = v4 ^ v3;
  double v7 = -code;
  if (code >= 0.0) {
    double v7 = self->_code;
  }
  long double v8 = round(v7);
  return v6 ^ (2654435761u * self->_errorCode) ^ ((unint64_t)(fmod(v8, 1.84467441e19) * 2654435760.0)
                                                + vcvtd_n_u64_f64(v7 - v8, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_CPError *)self domain];
  NSUInteger v6 = [v4 domain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_CPError *)self domain];
  if (v7)
  {
    long double v8 = (void *)v7;
    v9 = [(_CPError *)self domain];
    v10 = [v4 domain];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_CPError *)self reason];
  NSUInteger v6 = [v4 reason];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_CPError *)self reason];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_CPError *)self reason];
    v15 = [v4 reason];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  double code = self->_code;
  [v4 code];
  if (code == v20)
  {
    unint64_t errorCode = self->_errorCode;
    BOOL v17 = errorCode == [v4 errorCode];
    goto LABEL_13;
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  a3;
  id v4 = [(_CPError *)self domain];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_CPError *)self reason];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  [(_CPError *)self code];
  if (v6 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_CPError *)self errorCode]) {
    PBDataWriterWriteUint64Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPErrorReadFrom(self, (uint64_t)a3);
}

- (_CPError)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPError *)self init];
  if (v5)
  {
    double v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKey:@"reason"];
    [(_CPError *)v5 setReason:v7];

    -[_CPError setCode:](v5, "setCode:", (double)(int)[v4 code]);
    long double v8 = [v4 domain];
    [(_CPError *)v5 setDomain:v8];

    v9 = v5;
  }

  return v5;
}

@end