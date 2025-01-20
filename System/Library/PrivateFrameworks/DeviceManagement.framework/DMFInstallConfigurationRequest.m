@interface DMFInstallConfigurationRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFInstallConfigurationRequest)initWithCoder:(id)a3;
- (NSDictionary)profile;
- (NSString)managingProfileIdentifier;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setManagingProfileIdentifier:(id)a3;
- (void)setProfile:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation DMFInstallConfigurationRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB8E0;
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

- (DMFInstallConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DMFInstallConfigurationRequest;
  v5 = [(CATTaskRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 unsignedIntegerValue];

    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"managingProfileIdentifier"];
    managingProfileIdentifier = v5->_managingProfileIdentifier;
    v5->_managingProfileIdentifier = (NSString *)v8;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v24, "setWithObjects:", v23, v22, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"profile"];
    profile = v5->_profile;
    v5->_profile = (NSDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFInstallConfigurationRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFInstallConfigurationRequest type](self, "type", v8.receiver, v8.super_class));
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(DMFInstallConfigurationRequest *)self managingProfileIdentifier];
  [v4 encodeObject:v6 forKey:@"managingProfileIdentifier"];

  v7 = [(DMFInstallConfigurationRequest *)self profile];
  [v4 encodeObject:v7 forKey:@"profile"];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)managingProfileIdentifier
{
  return self->_managingProfileIdentifier;
}

- (void)setManagingProfileIdentifier:(id)a3
{
}

- (NSDictionary)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_managingProfileIdentifier, 0);
}

@end