@interface COTimerDismissRequest
+ (BOOL)supportsSecureCoding;
- (COTimerDismissRequest)initWithCoder:(id)a3;
- (COTimerDismissRequest)initWithTimerIdentifier:(id)a3;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COTimerDismissRequest

- (COTimerDismissRequest)initWithTimerIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COTimerDismissRequest;
  v5 = [(COMeshCommand *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (COTimerDismissRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COTimerDismissRequest;
  v5 = [(COMeshCommand *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COTimerDismissRequest;
  id v4 = a3;
  [(COMeshCommand *)&v6 encodeWithCoder:v4];
  v5 = [(COTimerDismissRequest *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end