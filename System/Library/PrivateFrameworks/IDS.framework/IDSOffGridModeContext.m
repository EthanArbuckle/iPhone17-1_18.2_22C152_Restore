@interface IDSOffGridModeContext
+ (BOOL)supportsSecureCoding;
- (IDSOffGridModeContext)init;
- (IDSOffGridModeContext)initWithCoder:(id)a3;
- (NSError)error;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation IDSOffGridModeContext

- (IDSOffGridModeContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSOffGridModeContext;
  v2 = [(IDSOffGridModeContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    error = v2->_error;
    v2->_error = 0;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IDSOffGridModeContext *)self error];
  v5 = [v3 stringWithFormat:@"<IDSOffGridModeContext %p>: error %@", self, v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (IDSOffGridModeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(IDSOffGridModeContext);
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  [(IDSOffGridModeContext *)v5 setError:v6];
  return v5;
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