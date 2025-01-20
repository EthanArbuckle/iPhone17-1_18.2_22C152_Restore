@interface AMSDHomeKitHomeCloudShare
- (AMSDCloudDataShareToken)token;
- (AMSDHomeKitHomeCloudShare)initWithShareInvitation:(id)a3;
- (HMUserCloudShareInvitation)shareInvitation;
- (NSString)containerIdentifier;
- (NSString)hashedDescription;
- (NSURL)URL;
- (NSUUID)homeIdentifier;
- (void)setShareInvitation:(id)a3;
@end

@implementation AMSDHomeKitHomeCloudShare

- (AMSDHomeKitHomeCloudShare)initWithShareInvitation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDHomeKitHomeCloudShare;
  v6 = [(AMSDHomeKitHomeCloudShare *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareInvitation, a3);
  }

  return v7;
}

- (NSString)containerIdentifier
{
  v2 = [(AMSDHomeKitHomeCloudShare *)self shareInvitation];
  v3 = [v2 containerID];

  return (NSString *)v3;
}

- (NSUUID)homeIdentifier
{
  v2 = [(AMSDHomeKitHomeCloudShare *)self shareInvitation];
  v3 = [v2 home];
  v4 = [v3 uniqueIdentifier];

  return (NSUUID *)v4;
}

- (AMSDCloudDataShareToken)token
{
  v2 = [(AMSDHomeKitHomeCloudShare *)self shareInvitation];
  v3 = [v2 shareToken];

  return (AMSDCloudDataShareToken *)v3;
}

- (NSURL)URL
{
  v2 = [(AMSDHomeKitHomeCloudShare *)self shareInvitation];
  v3 = [v2 shareURL];

  return (NSURL *)v3;
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class();
  v4 = [(AMSDHomeKitHomeCloudShare *)self URL];
  id v5 = AMSHashIfNeeded();
  v6 = [(AMSDHomeKitHomeCloudShare *)self containerIdentifier];
  v7 = AMSHashIfNeeded();
  v8 = [(AMSDHomeKitHomeCloudShare *)self homeIdentifier];
  objc_super v9 = AMSHashIfNeeded();
  v10 = [(AMSDHomeKitHomeCloudShare *)self token];
  v11 = AMSHashIfNeeded();
  v12 = +[NSString stringWithFormat:@"<%@: %p URL = %@ | containerIdentifier = %@ | token = %@ | home = %@", v3, self, v5, v7, v9, v11];

  return (NSString *)v12;
}

- (HMUserCloudShareInvitation)shareInvitation
{
  return self->_shareInvitation;
}

- (void)setShareInvitation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end