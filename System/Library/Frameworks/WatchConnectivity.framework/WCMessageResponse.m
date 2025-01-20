@interface WCMessageResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (WCMessageResponse)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation WCMessageResponse

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WCMessageResponse;
  id v4 = a3;
  [(WCMessage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, @"error", v5.receiver, v5.super_class);
}

- (WCMessageResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WCMessageResponse;
  objc_super v5 = [(WCMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WCMessage *)self identifier];
  v7 = [(WCMessage *)self data];
  uint64_t v8 = [v7 length];
  objc_super v9 = [(WCMessageResponse *)self error];
  v10 = NSPrintF();
  v11 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, dataLength: %lu, error: %@>", v5, self, v6, v8, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WCMessageResponse;
  return [(WCMessage *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)WCMessageResponse;
  return [(WCMessage *)&v3 hash];
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end