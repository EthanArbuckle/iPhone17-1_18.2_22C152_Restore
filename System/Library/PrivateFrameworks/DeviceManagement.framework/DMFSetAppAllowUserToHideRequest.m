@interface DMFSetAppAllowUserToHideRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppAllowUserToHideRequest)initWithCoder:(id)a3;
- (NSNumber)allowUserToHide;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowUserToHide:(id)a3;
@end

@implementation DMFSetAppAllowUserToHideRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB9E8;
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

- (DMFSetAppAllowUserToHideRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppAllowUserToHideRequest;
  v5 = [(DMFAppRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"allowUserToHide"];
    allowUserToHide = v5->_allowUserToHide;
    v5->_allowUserToHide = (NSNumber *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppAllowUserToHideRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFSetAppAllowUserToHideRequest *)self allowUserToHide];
  [v4 encodeObject:v5 forKey:@"allowUserToHide"];
}

- (NSNumber)allowUserToHide
{
  return self->_allowUserToHide;
}

- (void)setAllowUserToHide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end