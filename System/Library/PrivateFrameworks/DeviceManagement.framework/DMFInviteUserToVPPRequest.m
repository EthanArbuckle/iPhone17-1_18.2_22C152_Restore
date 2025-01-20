@interface DMFInviteUserToVPPRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFInviteUserToVPPRequest)initWithCoder:(id)a3;
- (NSString)originator;
- (NSURL)URL;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation DMFInviteUserToVPPRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB958;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 0;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInviteUserToVPPRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFInviteUserToVPPRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"originator"];
    originator = v5->_originator;
    v5->_originator = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFInviteUserToVPPRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFInviteUserToVPPRequest *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  v6 = [(DMFInviteUserToVPPRequest *)self originator];
  [v4 encodeObject:v6 forKey:@"originator"];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end