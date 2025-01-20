@interface CATSessionMessageInvalidate
+ (BOOL)supportsSecureCoding;
- (CATSessionMessageInvalidate)initWithCoder:(id)a3;
- (CATSessionMessageInvalidate)initWithError:(id)a3;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation CATSessionMessageInvalidate

- (CATSessionMessageInvalidate)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATSessionMessageInvalidate;
  v6 = [(CATMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATSessionMessageInvalidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATSessionMessageInvalidate;
  id v5 = [(CATMessage *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CATSessionMessageInvalidate;
  id v4 = a3;
  [(CATMessage *)&v6 encodeWithCoder:v4];
  id v5 = [(CATSessionMessageInvalidate *)self error];
  [v4 encodeObject:v5 forKey:@"error"];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end