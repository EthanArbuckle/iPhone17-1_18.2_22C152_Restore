@interface COMeshResponse
+ (BOOL)supportsSecureCoding;
- (COMeshResponse)initWithCoder:(id)a3;
- (COMeshResponse)initWithError:(id)a3;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMeshResponse

- (COMeshResponse)initWithError:(id)a3
{
  id v5 = a3;
  v6 = [(COMeshCommand *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (COMeshResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  if ((objc_opt_isKindOfClass() & 1) != 0 || ([v4 containsValueForKey:@"error"] & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)COMeshResponse;
    v7 = [(COMeshCommand *)&v9 initWithCoder:v4];
    v6 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_error, v5);
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COMeshResponse;
  [(COMeshCommand *)&v6 encodeWithCoder:v4];
  id v5 = [(COMeshResponse *)self error];
  if (v5) {
    [v4 encodeObject:v5 forKey:@"error"];
  }
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