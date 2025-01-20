@interface DMFFetchRestrictionsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)includeProfileRestrictions;
- (DMFFetchRestrictionsRequest)init;
- (DMFFetchRestrictionsRequest)initWithCoder:(id)a3;
- (unint64_t)profileFilterFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeProfileRestrictions:(BOOL)a3;
- (void)setProfileFilterFlags:(unint64_t)a3;
@end

@implementation DMFFetchRestrictionsRequest

- (DMFFetchRestrictionsRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFFetchRestrictionsRequest;
  result = [(CATTaskRequest *)&v3 init];
  if (result) {
    result->_profileFilterFlags = 0;
  }
  return result;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB850;
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

- (DMFFetchRestrictionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchRestrictionsRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeProfileRestrictions"];
    v5->_includeProfileRestrictions = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileFilterFlags"];
    v5->_profileFilterFlags = [v7 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFFetchRestrictionsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchRestrictionsRequest includeProfileRestrictions](self, "includeProfileRestrictions", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"includeProfileRestrictions"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchRestrictionsRequest profileFilterFlags](self, "profileFilterFlags"));
  [v4 encodeObject:v6 forKey:@"profileFilterFlags"];
}

- (BOOL)includeProfileRestrictions
{
  return self->_includeProfileRestrictions;
}

- (void)setIncludeProfileRestrictions:(BOOL)a3
{
  self->_includeProfileRestrictions = a3;
}

- (unint64_t)profileFilterFlags
{
  return self->_profileFilterFlags;
}

- (void)setProfileFilterFlags:(unint64_t)a3
{
  self->_profileFilterFlags = a3;
}

@end