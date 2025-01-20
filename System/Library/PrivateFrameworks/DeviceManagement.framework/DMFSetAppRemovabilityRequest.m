@interface DMFSetAppRemovabilityRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppRemovabilityRequest)initWithCoder:(id)a3;
- (NSNumber)removable;
- (void)encodeWithCoder:(id)a3;
- (void)setRemovable:(id)a3;
@end

@implementation DMFSetAppRemovabilityRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABBF8;
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

- (DMFSetAppRemovabilityRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppRemovabilityRequest;
  v5 = [(DMFAppRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"removable"];
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppRemovabilityRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFSetAppRemovabilityRequest *)self removable];
  [v4 encodeObject:v5 forKey:@"removable"];
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end