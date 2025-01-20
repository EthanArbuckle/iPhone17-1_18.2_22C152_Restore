@interface DMFSetMaximumResidentUsersRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetMaximumResidentUsersRequest)initWithCoder:(id)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(unint64_t)a3;
@end

@implementation DMFSetMaximumResidentUsersRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABCA0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetMaximumResidentUsersRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFSetMaximumResidentUsersRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"count"];
    v5->_count = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetMaximumResidentUsersRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFSetMaximumResidentUsersRequest count](self, "count", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"count"];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end