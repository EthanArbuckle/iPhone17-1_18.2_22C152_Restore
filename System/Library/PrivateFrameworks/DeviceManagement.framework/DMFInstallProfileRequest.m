@interface DMFInstallProfileRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFInstallProfileRequest)initWithCoder:(id)a3;
- (NSData)profileData;
- (NSString)managingProfileIdentifier;
- (NSString)personaID;
- (unint64_t)style;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setManagingProfileIdentifier:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation DMFInstallProfileRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB910;
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

- (DMFInstallProfileRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMFInstallProfileRequest;
  v5 = [(CATTaskRequest *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];
    v5->_style = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v7 unsignedIntegerValue];

    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"managingProfileIdentifier"];
    managingProfileIdentifier = v5->_managingProfileIdentifier;
    v5->_managingProfileIdentifier = (NSString *)v9;

    v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"profileData"];
    profileData = v5->_profileData;
    v5->_profileData = (NSData *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"personaID"];
    personaID = v5->_personaID;
    v5->_personaID = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DMFInstallProfileRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v10 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFInstallProfileRequest style](self, "style", v10.receiver, v10.super_class));
  [v4 encodeObject:v5 forKey:@"style"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFInstallProfileRequest type](self, "type"));
  [v4 encodeObject:v6 forKey:@"type"];

  v7 = [(DMFInstallProfileRequest *)self managingProfileIdentifier];
  [v4 encodeObject:v7 forKey:@"managingProfileIdentifier"];

  v8 = [(DMFInstallProfileRequest *)self profileData];
  [v4 encodeObject:v8 forKey:@"profileData"];

  uint64_t v9 = [(DMFInstallProfileRequest *)self personaID];
  [v4 encodeObject:v9 forKey:@"personaID"];
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
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

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_profileData, 0);

  objc_storeStrong((id *)&self->_managingProfileIdentifier, 0);
}

@end