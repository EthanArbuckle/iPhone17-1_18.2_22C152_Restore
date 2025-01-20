@interface DMFRemoveProfileRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFRemoveProfileRequest)initWithCoder:(id)a3;
- (NSString)profileIdentifier;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation DMFRemoveProfileRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABAF0;
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

- (DMFRemoveProfileRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFRemoveProfileRequest;
  v5 = [(CATTaskRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 unsignedIntegerValue];

    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"profileIdentifier"];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFRemoveProfileRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFRemoveProfileRequest type](self, "type", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(DMFRemoveProfileRequest *)self profileIdentifier];
  [v4 encodeObject:v6 forKey:@"profileIdentifier"];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end