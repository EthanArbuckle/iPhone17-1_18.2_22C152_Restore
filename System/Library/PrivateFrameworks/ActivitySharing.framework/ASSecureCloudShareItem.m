@interface ASSecureCloudShareItem
+ (ASSecureCloudShareItem)shareItemWithCodableShareItem:(id)a3;
+ (BOOL)supportsSecureCoding;
- (ASSecureCloudShareItem)initWithCoder:(id)a3;
- (ASSecureCloudShareItem)initWithZoneName:(id)a3 shareURL:(id)a4 invitationToken:(id)a5;
- (CKDeviceToDeviceShareInvitationToken)invitationToken;
- (NSString)zoneName;
- (NSURL)shareURL;
- (id)codableShareItem;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASSecureCloudShareItem

+ (ASSecureCloudShareItem)shareItemWithCodableShareItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 zoneName];
  id v5 = objc_alloc(NSURL);
  v6 = [v3 shareURL];
  v7 = (void *)[v5 initWithString:v6];

  v8 = (objc_class *)objc_opt_class();
  v9 = [v3 invitationToken];

  v10 = ASSecureUnarchiveClassWithDataAndStrictness(v8, v9, 1);

  v11 = 0;
  if (v4 && v7 && v10) {
    v11 = [[ASSecureCloudShareItem alloc] initWithZoneName:v4 shareURL:v7 invitationToken:v10];
  }

  return v11;
}

- (id)codableShareItem
{
  id v3 = objc_alloc_init(ASCodableSecureCloudShareItem);
  v4 = [(ASSecureCloudShareItem *)self zoneName];
  [(ASCodableSecureCloudShareItem *)v3 setZoneName:v4];

  id v5 = [(ASSecureCloudShareItem *)self shareURL];
  v6 = [v5 absoluteString];
  [(ASCodableSecureCloudShareItem *)v3 setShareURL:v6];

  v7 = (void *)MEMORY[0x263F08910];
  v8 = [(ASSecureCloudShareItem *)self invitationToken];
  id v14 = 0;
  v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
  id v10 = v14;

  if (!v9 || v10)
  {
    ASLoggingInitialize();
    v12 = ASLogDefault;
    if (os_log_type_enabled((os_log_t)ASLogDefault, OS_LOG_TYPE_ERROR)) {
      [(ASSecureCloudShareItem(InvitationCodingSupport) *)(uint64_t)v10 codableShareItem];
    }
    v11 = 0;
  }
  else
  {
    [(ASCodableSecureCloudShareItem *)v3 setInvitationToken:v9];
    v11 = v3;
  }

  return v11;
}

- (ASSecureCloudShareItem)initWithZoneName:(id)a3 shareURL:(id)a4 invitationToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASSecureCloudShareItem;
  v12 = [(ASSecureCloudShareItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shareURL, a4);
    objc_storeStrong((id *)&v13->_invitationToken, a5);
    objc_storeStrong((id *)&v13->_zoneName, a3);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  shareURL = self->_shareURL;
  id v5 = a3;
  [v5 encodeObject:shareURL forKey:@"shareURL"];
  [v5 encodeObject:self->_invitationToken forKey:@"invitationToken"];
  [v5 encodeObject:self->_zoneName forKey:@"zoneName"];
}

- (ASSecureCloudShareItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASSecureCloudShareItem;
  id v5 = [(ASSecureCloudShareItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationToken"];
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 2, self->_shareURL);
  objc_storeStrong(v4 + 3, self->_invitationToken);
  objc_storeStrong(v4 + 1, self->_zoneName);
  return v4;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return self->_invitationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);

  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end