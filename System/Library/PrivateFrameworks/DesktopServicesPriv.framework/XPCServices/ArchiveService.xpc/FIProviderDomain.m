@interface FIProviderDomain
+ (id)providerDomainForDomain:(id)a3;
+ (id)providerDomainForID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (id)providerDomainForRootURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (id)providerDomainForURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5;
- (BOOL)asyncResultAvailable;
- (BOOL)expectFPItems;
- (BOOL)isDataSeparatedDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternalDeviceDomain;
- (BOOL)isFPv2;
- (BOOL)isLocalStorageDomain;
- (BOOL)isMainiCloudDriveDomain;
- (BOOL)isUsingFPFS;
- (BOOL)isiCloudDriveProvider;
- (BOOL)supportsEnumeration;
- (BOOL)supportsSyncingTrash;
- (BOOL)updateRootURLIfDetached;
- (FIProviderDomain)initWithDomain:(id)a3;
- (FIProviderDomain)initWithDomainID:(id)a3 cachePolicy:(unint64_t)a4 rootURL:(id)a5 domain:(id)a6;
- (FPProviderDomain)asyncFetchedDomain;
- (FPProviderDomain)domain;
- (NSError)asyncError;
- (NSString)domainID;
- (NSString)identifier;
- (NSURL)rootURL;
- (id).cxx_construct;
- (id)description;
- (id)urlForKnownFolder:(unint64_t)a3;
- (unint64_t)cachePolicy;
- (unint64_t)disconnectionState;
- (unint64_t)hash;
- (unint64_t)replicatedKnownFolders;
- (void)setAsyncError:(id)a3;
- (void)setAsyncFetchedDomain:(id)a3;
- (void)setAsyncResultAvailable:(BOOL)a3;
@end

@implementation FIProviderDomain

- (FIProviderDomain)initWithDomain:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  unsigned int v7 = [v5 isUsingFPFS];
  if (v7)
  {
    v3 = [v5 storageURLs];
    v8 = [v3 firstObject];
  }
  else
  {
    v8 = 0;
  }
  v9 = [(FIProviderDomain *)self initWithDomainID:v6 cachePolicy:1 rootURL:v8 domain:v5];
  if (v7)
  {
  }
  return v9;
}

- (FIProviderDomain)initWithDomainID:(id)a3 cachePolicy:(unint64_t)a4 rootURL:(id)a5 domain:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FIProviderDomain;
  v14 = [(FIProviderDomain *)&v20 init];
  if ([v11 length])
  {
    objc_storeStrong((id *)&v14->_domainID, a3);
    v14->_cachePolicy = a4;
    p_rootURL = (void **)&v14->_rootURL;
    objc_storeStrong((id *)&v14->_rootURL, a5);
    objc_storeStrong((id *)&v14->_domain, a6);
    if (!v14->_domain && !*p_rootURL && [(FIProviderDomain *)v14 isiCloudDriveProvider])
    {
      uint64_t v16 = [(objc_class *)FPProviderDomainClass() rootURLForProviderDomainID:v11 cachePolicy:1 error:0];
      v17 = *p_rootURL;
      *p_rootURL = (void *)v16;
    }
    v18 = v14;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FIProviderDomain *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    v6 = sub_10000B724(v4);
    unsigned int v7 = v6;
    if (v6)
    {
      v8 = [v6 domainID];
      unsigned __int8 v9 = [v8 isEqual:self->_domainID];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_domainID hash];
}

- (BOOL)isUsingFPFS
{
  domain = self->_domain;
  if (!domain) {
    return [(FIProviderDomain *)self isiCloudDriveProvider] || self->_rootURL != 0;
  }
  return [(FPProviderDomain *)domain isUsingFPFS];
}

- (BOOL)isFPv2
{
  v3 = [(FIProviderDomain *)self identifier];
  if ([(FIProviderDomain *)self isUsingFPFS])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v5 = v3;
    CFStringRef v9 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v9, v5);

    if (IsLocalStorageDomainID((CFTypeRef *)&v9))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v6 = v5;
      CFStringRef v8 = &stru_10002D5A8;
      CFRetain(&stru_10002D5A8);
      TString::SetStringRefAsImmutable((CFTypeRef *)&v8, v6);

      BOOL v4 = !IsExternalDeviceDomainID(&v8);
      sub_100007E94((const void **)&v8);
    }
    sub_100007E94((const void **)&v9);
  }

  return v4;
}

- (NSString)identifier
{
  return self->_domainID;
}

- (unint64_t)disconnectionState
{
  domain = self->_domain;
  if (domain) {
    return (unint64_t)[(FPProviderDomain *)domain disconnectionState];
  }
  else {
    return 2;
  }
}

- (BOOL)isiCloudDriveProvider
{
  domain = self->_domain;
  if (domain)
  {
    return [(FPProviderDomain *)domain isiCloudDriveProvider];
  }
  else
  {
    id v5 = self->_domainID;
    CFStringRef v6 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v6, v5);

    LOBYTE(v5) = IsICloudDriveDomainID(&v6);
    sub_100007E94((const void **)&v6);
    return (char)v5;
  }
}

- (BOOL)updateRootURLIfDetached
{
  if (!self->_domain)
  {
    v3 = [(FIProviderDomain *)self rootURL];
    if (v3)
    {
      BOOL v4 = [(FIProviderDomain *)self urlForKnownFolder:1];
      if (IsEqual(v3, v4))
      {

LABEL_6:
        rootURL = self->_rootURL;
        self->_rootURL = 0;

        goto LABEL_7;
      }
      id v5 = [(FIProviderDomain *)self urlForKnownFolder:2];
      int v6 = IsEqual(v3, v5);

      if (v6) {
        goto LABEL_6;
      }
    }
LABEL_7:
  }
  return 0;
}

- (NSURL)rootURL
{
  v3 = self->_domain;
  if (!v3)
  {
    v3 = [(FIProviderDomain *)self asyncFetchedDomain];
  }
  if ([(FIProviderDomain *)self isUsingFPFS])
  {
    BOOL v4 = [(FPProviderDomain *)v3 storageURLs];
    id v5 = [v4 firstObject];
  }
  else
  {
    id v5 = self->_rootURL;
  }

  return v5;
}

- (BOOL)isMainiCloudDriveDomain
{
  domain = self->_domain;
  if (domain)
  {
    return [(FPProviderDomain *)domain isMainiCloudDriveDomain];
  }
  else
  {
    BOOL v4 = self->_domainID;
    CFStringRef v6 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v6, v4);

    LOBYTE(v4) = IsMainICloudDriveDomainID(&v6);
    sub_100007E94((const void **)&v6);
    return (char)v4;
  }
}

- (BOOL)isDataSeparatedDomain
{
  domain = self->_domain;
  if (domain)
  {
    return [(FPProviderDomain *)domain isDataSeparatedDomain];
  }
  else
  {
    BOOL v4 = self->_domainID;
    CFStringRef v6 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v6, v4);

    LOBYTE(v4) = IsDataSeparatedDomainID(&v6);
    sub_100007E94((const void **)&v6);
    return (char)v4;
  }
}

- (BOOL)isLocalStorageDomain
{
  v2 = self->_domainID;
  CFStringRef v4 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable((CFTypeRef *)&v4, v2);

  LOBYTE(v2) = IsLocalStorageDomainID((CFTypeRef *)&v4);
  sub_100007E94((const void **)&v4);
  return (char)v2;
}

- (BOOL)isExternalDeviceDomain
{
  v2 = self->_domainID;
  CFStringRef v4 = &stru_10002D5A8;
  CFRetain(&stru_10002D5A8);
  TString::SetStringRefAsImmutable((CFTypeRef *)&v4, v2);

  LOBYTE(v2) = IsExternalDeviceDomainID(&v4);
  sub_100007E94((const void **)&v4);
  return (char)v2;
}

- (BOOL)supportsSyncingTrash
{
  domain = self->_domain;
  if (domain)
  {
    return [(FPProviderDomain *)domain supportsSyncingTrash];
  }
  else
  {
    if (self->_rootURL)
    {
      p_lock = &self->_lock;
      char v11 = 1;
      TDSMutex::lock(&self->_lock);
      if (self->_cachedSyncsTrash.__engaged_)
      {
        LOBYTE(v4) = self->_cachedSyncsTrash.var0.__null_state_ != 0;
        sub_10000C678((uint64_t)&p_lock);
      }
      else
      {
        sub_10000C678((uint64_t)&p_lock);
        id v5 = [(NSURL *)self->_rootURL URLByAppendingPathComponent:@".Trash" isDirectory:1];
        id v9 = 0;
        unsigned int v4 = [v5 getResourceValue:&v9 forKey:NSURLIsDirectoryKey error:0];
        id v6 = v9;
        unsigned int v7 = v6;
        if (v4) {
          LOWORD(v4) = (unsigned __int16)[v6 BOOLValue];
        }
        p_lock = &self->_lock;
        char v11 = 1;
        TDSMutex::lock(&self->_lock);
        self->_cachedSyncsTrash = (optional<BOOL>)(v4 | 0x100);
        sub_10000C678((uint64_t)&p_lock);
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
    return v4;
  }
}

- (id)urlForKnownFolder:(unint64_t)a3
{
  return 0;
}

- (unint64_t)replicatedKnownFolders
{
  return 0;
}

- (BOOL)expectFPItems
{
  v3 = self->_domain;
  if (!v3)
  {
    v3 = [(FIProviderDomain *)self asyncFetchedDomain];
    if (!v3) {
      return 0;
    }
  }
  BOOL v4 = ((unint64_t)[(FPProviderDomain *)v3 disconnectionState] & 0xFFFFFFFFFFFFFFFELL) != 6;

  return v4;
}

- (BOOL)supportsEnumeration
{
  domain = self->_domain;
  if (domain) {
    return [(FPProviderDomain *)domain supportsEnumeration];
  }
  else {
    return 1;
  }
}

- (id)description
{
  if (self->_domain)
  {
    v3 = +[NSString stringWithFormat:@"<%@ domain:%@>", objc_opt_class(), self->_domain];
  }
  else
  {
    if ([(FIProviderDomain *)self asyncResultAvailable])
    {
      BOOL v4 = [(FIProviderDomain *)self asyncFetchedDomain];
      id v5 = [v4 description];

      if (!v5)
      {
        id v6 = [(FIProviderDomain *)self asyncError];
        id v5 = [v6 description];
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v7 = objc_opt_class();
    CFStringRef v8 = self->_domainID;
    CFStringRef v12 = &stru_10002D5A8;
    CFRetain(&stru_10002D5A8);
    TString::SetStringRefAsImmutable((CFTypeRef *)&v12, v8);

    id v9 = SanitizedStr(&v12);
    v10 = SanitizedURL(self->_rootURL);
    v3 = +[NSString stringWithFormat:@"<%@ domainID:%@ rootURL:%@ asyncState: %@>", v7, v9, v10, v5];

    sub_100007E94((const void **)&v12);
  }
  return v3;
}

+ (id)providerDomainForDomain:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[FIProviderDomain alloc] initWithDomain:v3];

  return v4;
}

+ (id)providerDomainForID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v6 = (FIProviderDomainFetcher *)a3;
  uint64_t v7 = FIProviderDomainFetcher::Singleton(v6);
  CFStringRef v8 = FIProviderDomainFetcher::FetchDomainForID(v7, v6, a4, 0, 0);

  return v8;
}

+ (id)providerDomainForRootURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = (FIProviderDomainFetcher *)a3;
  CFStringRef v8 = (std::mutex *)FIProviderDomainFetcher::Singleton(v7);
  id v9 = FIProviderDomainFetcher::FetchDomainForURL(v8, v7, 0, a4, (uint64_t)a5);

  return v9;
}

+ (id)providerDomainForURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = (FIProviderDomainFetcher *)a3;
  CFStringRef v8 = (std::mutex *)FIProviderDomainFetcher::Singleton(v7);
  id v9 = FIProviderDomainFetcher::FetchDomainForURL(v8, v7, 0, a4, (uint64_t)a5);

  return v9;
}

+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  CFStringRef v8 = [(objc_class *)FPProviderDomainClass() providerDomainForItem:v7 cachePolicy:a4 error:a5];
  if (v8) {
    id v9 = [[FIProviderDomain alloc] initWithDomain:v8];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  CFStringRef v8 = [(objc_class *)FPProviderDomainClass() rootURLForProviderDomainID:v7 cachePolicy:a4 error:a5];

  return v8;
}

- (NSString)domainID
{
  return self->_domainID;
}

- (FPProviderDomain)domain
{
  return self->_domain;
}

- (BOOL)asyncResultAvailable
{
  return self->_asyncResultAvailable;
}

- (void)setAsyncResultAvailable:(BOOL)a3
{
  self->_asyncResultAvailable = a3;
}

- (FPProviderDomain)asyncFetchedDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAsyncFetchedDomain:(id)a3
{
}

- (NSError)asyncError
{
  return (NSError *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAsyncError:(id)a3
{
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncError, 0);
  objc_storeStrong((id *)&self->_asyncFetchedDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  TDSMutex::~TDSMutex(&self->_lock);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

- (id).cxx_construct
{
  self->_cachedSyncsTrash = 0;
  TDSMutex::TDSMutex(&self->_lock, 0);
  return self;
}

@end