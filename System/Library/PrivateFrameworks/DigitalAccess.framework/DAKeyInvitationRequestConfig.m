@interface DAKeyInvitationRequestConfig
+ (BOOL)supportsSecureCoding;
- (DAKeyInvitationRequestConfig)initWithCoder:(id)a3;
- (DAKeyInvitationRequestConfig)initWithSharingSessionIdentifier:(id)a3 ownerIdsIdentifier:(id)a4;
- (NSString)ownerIdsIdentifier;
- (NSUUID)sharingSessionIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAKeyInvitationRequestConfig

- (DAKeyInvitationRequestConfig)initWithSharingSessionIdentifier:(id)a3 ownerIdsIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DAKeyInvitationRequestConfig;
  v9 = [(DAKeyInvitationRequestConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sharingSessionIdentifier, a3);
    objc_storeStrong((id *)&v10->_ownerIdsIdentifier, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAKeyInvitationRequestConfig *)self sharingSessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sharingSessionIdentifier"];

  id v6 = [(DAKeyInvitationRequestConfig *)self ownerIdsIdentifier];
  [v4 encodeObject:v6 forKey:@"ownerIdsIdentifier"];
}

- (DAKeyInvitationRequestConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DAKeyInvitationRequestConfig;
  v5 = [(DAKeyInvitationRequestConfig *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerIdsIdentifier"];
    ownerIdsIdentifier = v5->_ownerIdsIdentifier;
    v5->_ownerIdsIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [NSString stringWithFormat:@"Sharing Session Id    : %@\n", self->_sharingSessionIdentifier];
  [v3 appendString:v4];

  v5 = [NSString stringWithFormat:@"Owner IDS Id          : %@\n", self->_ownerIdsIdentifier];
  [v3 appendString:v5];

  return v3;
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (NSString)ownerIdsIdentifier
{
  return self->_ownerIdsIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerIdsIdentifier, 0);

  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end