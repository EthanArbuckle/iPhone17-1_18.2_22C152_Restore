@interface DMFFetchProfilesRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (DMFFetchProfilesRequest)init;
- (DMFFetchProfilesRequest)initWithCoder:(id)a3;
- (unint64_t)filterFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setFilterFlags:(unint64_t)a3;
@end

@implementation DMFFetchProfilesRequest

- (DMFFetchProfilesRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFFetchProfilesRequest;
  result = [(CATTaskRequest *)&v3 init];
  if (result) {
    result->_filterFlags = 0;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB820;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchProfilesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFFetchProfilesRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterFlags"];
    v5->_filterFlags = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchProfilesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchProfilesRequest filterFlags](self, "filterFlags", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"filterFlags"];
}

- (unint64_t)filterFlags
{
  return self->_filterFlags;
}

- (void)setFilterFlags:(unint64_t)a3
{
  self->_filterFlags = a3;
}

@end