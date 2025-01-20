@interface DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest)initWithCoder:(id)a3;
- (NSNumber)associatedDomainsEnableDirectDownloads;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3;
@end

@implementation DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABBB0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest;
  v5 = [(DMFAppRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"associatedDomainsEnableDirectDownloads"];
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFSetAppAssociatedDomainsEnableDirectDownloadsRequest *)self associatedDomainsEnableDirectDownloads];
  [v4 encodeObject:v5 forKey:@"associatedDomainsEnableDirectDownloads"];
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
}

- (void).cxx_destruct
{
}

@end