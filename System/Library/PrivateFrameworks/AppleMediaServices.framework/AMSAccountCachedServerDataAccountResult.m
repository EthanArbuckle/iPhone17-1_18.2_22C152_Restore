@interface AMSAccountCachedServerDataAccountResult
+ (BOOL)supportsSecureCoding;
- (AMSAccountCachedServerDataAccountResult)initWithCoder:(id)a3;
- (AMSAccountCachedServerDataFields)fields;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setFields:(id)a3;
@end

@implementation AMSAccountCachedServerDataAccountResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSAccountCachedServerDataAccountResult *)self fields];
  [v4 encodeObject:v5 forKey:@"kFields"];

  id v6 = [(AMSAccountCachedServerDataAccountResult *)self error];
  [v4 encodeObject:v6 forKey:@"kError"];
}

- (AMSAccountCachedServerDataAccountResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSAccountCachedServerDataAccountResult;
  v5 = [(AMSAccountCachedServerDataAccountResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFields"];
    fields = v5->_fields;
    v5->_fields = (AMSAccountCachedServerDataFields *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kError"];
    error = v5->_error;
    v5->_error = (NSError *)v8;
  }
  return v5;
}

- (AMSAccountCachedServerDataFields)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
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
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

@end