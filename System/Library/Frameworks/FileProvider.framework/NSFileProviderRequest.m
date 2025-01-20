@interface NSFileProviderRequest
+ (BOOL)supportsSecureCoding;
+ (NSUUID)_dmIdentifier;
+ (NSUUID)_dsIdentifier;
+ (NSUUID)_filesIdentifier;
+ (NSUUID)_finderIdentifier;
+ (NSUUID)_fpdIdentifier;
+ (id)requestFromTheSystem;
- (BOOL)isFileViewerRequest;
- (BOOL)isSpeculativeDownload;
- (BOOL)isSystemRequest;
- (NSFileProviderDomainVersion)domainVersion;
- (NSFileProviderRequest)init;
- (NSFileProviderRequest)initWithCoder:(id)a3;
- (NSFileProviderRequest)initWithIsSpeculativeDownload:(BOOL)a3;
- (NSURL)requestingExecutable;
- (NSUUID)requestingApplicationIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDomainVersion:(id)a3;
- (void)setRequestingApplicationIdentifier:(id)a3;
- (void)setRequestingExecutable:(id)a3;
@end

@implementation NSFileProviderRequest

+ (id)requestFromTheSystem
{
  v2 = objc_opt_new();

  return v2;
}

- (NSFileProviderRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)NSFileProviderRequest;
  v2 = [(NSFileProviderRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSFileProviderRequest _fpdIdentifier];
    requestingApplicationIdentifier = v2->_requestingApplicationIdentifier;
    v2->_requestingApplicationIdentifier = (NSUUID *)v3;
  }
  return v2;
}

+ (NSUUID)_fpdIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A7CE4FBB-64E6-4A9C-8EAA-0D8F07492B44"];

  return (NSUUID *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);

  objc_storeStrong((id *)&self->_requestingExecutable, 0);
}

- (NSFileProviderRequest)initWithIsSpeculativeDownload:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderRequest;
  result = [(NSFileProviderRequest *)&v5 init];
  if (result) {
    result->_speculativeDownload = a3;
  }
  return result;
}

- (NSFileProviderRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSFileProviderRequest;
  objc_super v5 = [(NSFileProviderRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requestingApplicationIdentifier"];
    requestingApplicationIdentifier = v5->_requestingApplicationIdentifier;
    v5->_requestingApplicationIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainVersion"];
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v8;

    v5->_speculativeDownload = [v4 decodeBoolForKey:@"_speculativeDownload"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requestingApplicationIdentifier = self->_requestingApplicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:requestingApplicationIdentifier forKey:@"_requestingApplicationIdentifier"];
  [v5 encodeObject:self->_domainVersion forKey:@"_domainVersion"];
  [v5 encodeBool:self->_speculativeDownload forKey:@"_speculativeDownload"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUUID)_finderIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2DAAE428-7239-4A8A-8C1F-30A787A5EBE1"];

  return (NSUUID *)v2;
}

+ (NSUUID)_dsIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AD8D660C-2BFE-47A3-BB78-0D8A1C98D143"];

  return (NSUUID *)v2;
}

+ (NSUUID)_filesIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"B847DC19-D25E-43A1-BBC8-2A18289DFB00"];

  return (NSUUID *)v2;
}

+ (NSUUID)_dmIdentifier
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"651152F6-CE30-4450-A618-522D30241F50"];

  return (NSUUID *)v2;
}

- (BOOL)isSystemRequest
{
  v2 = [(NSFileProviderRequest *)self requestingApplicationIdentifier];
  uint64_t v3 = [(id)objc_opt_class() _fpdIdentifier];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (BOOL)isFileViewerRequest
{
  uint64_t v3 = [(NSFileProviderRequest *)self requestingApplicationIdentifier];
  char v4 = [(id)objc_opt_class() _finderIdentifier];
  if ([v3 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(NSFileProviderRequest *)self requestingApplicationIdentifier];
    v7 = [(id)objc_opt_class() _dsIdentifier];
    if ([v6 isEqual:v7])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v8 = [(NSFileProviderRequest *)self requestingApplicationIdentifier];
      v9 = [(id)objc_opt_class() _dmIdentifier];
      if ([v8 isEqual:v9])
      {
        char v5 = 1;
      }
      else
      {
        v10 = [(NSFileProviderRequest *)self requestingApplicationIdentifier];
        objc_super v11 = [(id)objc_opt_class() _filesIdentifier];
        char v5 = [v10 isEqual:v11];
      }
    }
  }
  return v5;
}

- (id)description
{
  if ([(NSFileProviderRequest *)self isSystemRequest])
  {
    uint64_t v3 = "system";
  }
  else
  {
    BOOL v4 = [(NSFileProviderRequest *)self isFileViewerRequest];
    uint64_t v3 = "other";
    if (v4) {
      uint64_t v3 = "viewer";
    }
  }
  if (self->_speculativeDownload) {
    char v5 = "y";
  }
  else {
    char v5 = "n";
  }
  return (id)[NSString stringWithFormat:@"<NSFileProviderRequest from:%s version:%@ speculative:%s>", v3, self->_domainVersion, v5];
}

- (NSURL)requestingExecutable
{
  return self->_requestingExecutable;
}

- (void)setRequestingExecutable:(id)a3
{
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (void)setDomainVersion:(id)a3
{
}

- (BOOL)isSpeculativeDownload
{
  return self->_speculativeDownload;
}

- (NSUUID)requestingApplicationIdentifier
{
  return self->_requestingApplicationIdentifier;
}

- (void)setRequestingApplicationIdentifier:(id)a3
{
}

@end