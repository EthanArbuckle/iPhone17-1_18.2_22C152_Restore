@interface COMTErrorResult
+ (BOOL)supportsSecureCoding;
- (COMTErrorResult)initWithCoder:(id)a3;
- (COMTErrorResult)initWithError:(id)a3 actionIdentifier:(id)a4;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTErrorResult

- (COMTErrorResult)initWithError:(id)a3 actionIdentifier:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTErrorResult;
  v8 = [(COMTResult *)&v11 initWithActionIdentifier:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_error, a3);
  }

  return v9;
}

- (COMTErrorResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTErrorResult;
  v5 = [(COMTResult *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ER"];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTErrorResult;
  id v4 = a3;
  [(COMTResult *)&v6 encodeWithCoder:v4];
  v5 = [(COMTErrorResult *)self error];
  [v4 encodeObject:v5 forKey:@"ER"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end