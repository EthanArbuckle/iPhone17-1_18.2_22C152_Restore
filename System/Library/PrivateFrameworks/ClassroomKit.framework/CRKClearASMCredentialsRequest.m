@interface CRKClearASMCredentialsRequest
+ (BOOL)supportsSecureCoding;
- (CRKClearASMCredentialsRequest)initWithCoder:(id)a3;
- (int64_t)role;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CRKClearASMCredentialsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKClearASMCredentialsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKClearASMCredentialsRequest role](self, "role", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"role"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKClearASMCredentialsRequest type](self, "type"));
  [v4 encodeObject:v6 forKey:@"type"];
}

- (CRKClearASMCredentialsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKClearASMCredentialsRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
    v5->_role = [v6 integerValue];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v7 integerValue];
  }
  return v5;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end