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

- (FPProviderDomain)domain
{
  return self->_domain;
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
    v5 = v3;
    v9.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v9, v5);

    if (IsLocalStorageDomainID(&v9))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v6 = v5;
      v8.fString.fRef = &stru_1F2ABD380;
      CFRetain(&stru_1F2ABD380);
      TString::SetStringRefAsImmutable(&v8, v6);

      BOOL v4 = !IsExternalDeviceDomainID(&v8);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v8.fString.fRef);
    }
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v9.fString.fRef);
  }

  return v4;
}

- (BOOL)isUsingFPFS
{
  domain = self->_domain;
  if (!domain) {
    return [(FIProviderDomain *)self isiCloudDriveProvider] || self->_rootURL != 0;
  }
  return [(FPProviderDomain *)domain isUsingFPFS];
}

- (NSString)identifier
{
  return self->_domainID;
}

- (FIProviderDomain)initWithDomain:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  int v7 = [v5 isUsingFPFS];
  if (v7)
  {
    v3 = [v5 storageURLs];
    TString v8 = [v3 firstObject];
  }
  else
  {
    TString v8 = 0;
  }
  TString v9 = [(FIProviderDomain *)self initWithDomainID:v6 cachePolicy:1 rootURL:v8 domain:v5];
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
      uint64_t v16 = [(id)FPProviderDomainClass() rootURLForProviderDomainID:v11 cachePolicy:1 error:0];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncError, 0);
  objc_storeStrong((id *)&self->_asyncFetchedDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  TDSMutex::~TDSMutex(&self->_lock);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

+ (id)providerDomainForItem:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  TString v8 = [(id)FPProviderDomainClass() providerDomainForItem:v7 cachePolicy:a4 error:a5];
  if (v8) {
    TString v9 = [[FIProviderDomain alloc] initWithDomain:v8];
  }
  else {
    TString v9 = 0;
  }

  return v9;
}

- (id).cxx_construct
{
  self->_cachedSyncsTrash = 0;
  TDSMutex::TDSMutex(&self->_lock, 0);
  return self;
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
    v6.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v6, v5);

    LOBYTE(v5) = IsICloudDriveDomainID(&v6);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
    return (char)v5;
  }
}

- (unint64_t)disconnectionState
{
  domain = self->_domain;
  if (domain) {
    return [(FPProviderDomain *)domain disconnectionState];
  }
  else {
    return 2;
  }
}

- (BOOL)asyncResultAvailable
{
  return self->_asyncResultAvailable;
}

+ (id)providerDomainForDomain:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[FIProviderDomain alloc] initWithDomain:v3];

  return v4;
}

+ (id)rootURLForProviderDomainID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  TString v8 = [(id)FPProviderDomainClass() rootURLForProviderDomainID:v7 cachePolicy:a4 error:a5];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (FIProviderDomain *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    TString v6 = objc_cast<FIProviderDomain,objc_object * {__strong}>(v4);
    id v7 = v6;
    if (v6)
    {
      TString v8 = [v6 domainID];
      char v9 = [v8 isEqual:self->_domainID];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_domainID hash];
}

- (BOOL)updateRootURLIfDetached
{
  if (!self->_domain)
  {
    id v3 = [(FIProviderDomain *)self rootURL];
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

- (BOOL)isMainiCloudDriveDomain
{
  domain = self->_domain;
  if (domain)
  {
    return [(FPProviderDomain *)domain isMainiCloudDriveDomain];
  }
  else
  {
    id v5 = self->_domainID;
    v6.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v6, v5);

    LOBYTE(v5) = IsMainICloudDriveDomainID(&v6);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
    return (char)v5;
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
    id v5 = self->_domainID;
    v6.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v6, v5);

    LOBYTE(v5) = IsDataSeparatedDomainID(&v6);
    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v6.fString.fRef);
    return (char)v5;
  }
}

- (BOOL)isLocalStorageDomain
{
  v2 = self->_domainID;
  v4.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v4, v2);

  LOBYTE(v2) = IsLocalStorageDomainID(&v4);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v4.fString.fRef);
  return (char)v2;
}

- (BOOL)isExternalDeviceDomain
{
  v2 = self->_domainID;
  v4.fString.fRef = &stru_1F2ABD380;
  CFRetain(&stru_1F2ABD380);
  TString::SetStringRefAsImmutable(&v4, v2);

  LOBYTE(v2) = IsExternalDeviceDomainID(&v4);
  TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v4.fString.fRef);
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
        LOBYTE(v5) = self->_cachedSyncsTrash.var0.__null_state_ != 0;
        std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&p_lock);
      }
      else
      {
        std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&p_lock);
        TString v6 = [(NSURL *)self->_rootURL URLByAppendingPathComponent:@".Trash" isDirectory:1];
        id v9 = 0;
        int v5 = [v6 getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C628] error:0];
        id v7 = v9;
        TString v8 = v7;
        if (v5) {
          LOWORD(v5) = [v7 BOOLValue];
        }
        p_lock = &self->_lock;
        char v11 = 1;
        TDSMutex::lock(&self->_lock);
        self->_cachedSyncsTrash = (optional<BOOL>)(v5 | 0x100);
        std::unique_lock<TDSMutex>::~unique_lock[abi:ne180100]((uint64_t)&p_lock);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
    return v5;
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
  id v3 = self->_domain;
  if (!v3)
  {
    id v3 = [(FIProviderDomain *)self asyncFetchedDomain];
    if (!v3) {
      return 0;
    }
  }
  BOOL v4 = ([(FPProviderDomain *)v3 disconnectionState] & 0xFFFFFFFFFFFFFFFELL) != 6;

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
    id v3 = [NSString stringWithFormat:@"<%@ domain:%@>", objc_opt_class(), self->_domain];
  }
  else
  {
    if ([(FIProviderDomain *)self asyncResultAvailable])
    {
      BOOL v4 = [(FIProviderDomain *)self asyncFetchedDomain];
      int v5 = [v4 description];

      if (!v5)
      {
        TString v6 = [(FIProviderDomain *)self asyncError];
        int v5 = [v6 description];
      }
    }
    else
    {
      int v5 = 0;
    }
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    id v9 = self->_domainID;
    v13.fString.fRef = &stru_1F2ABD380;
    CFRetain(&stru_1F2ABD380);
    TString::SetStringRefAsImmutable(&v13, v9);

    v10 = SanitizedStr(&v13);
    char v11 = SanitizedURL(self->_rootURL);
    id v3 = [v7 stringWithFormat:@"<%@ domainID:%@ rootURL:%@ asyncState: %@>", v8, v10, v11, v5];

    TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v13.fString.fRef);
  }
  return v3;
}

+ (id)providerDomainForID:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  TString v6 = (FIProviderDomainFetcher *)a3;
  uint64_t v7 = FIProviderDomainFetcher::Singleton(v6);
  uint64_t v8 = FIProviderDomainFetcher::FetchDomainForID(v7, v6, a4, 0, 0);

  return v8;
}

+ (id)providerDomainForRootURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = (FIProviderDomainFetcher *)a3;
  uint64_t v8 = (std::mutex *)FIProviderDomainFetcher::Singleton(v7);
  id v9 = FIProviderDomainFetcher::FetchDomainForURL(v8, v7, 0, a4, (uint64_t)a5);

  return v9;
}

+ (id)providerDomainForURL:(id)a3 cachePolicy:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = (FIProviderDomainFetcher *)a3;
  uint64_t v8 = (std::mutex *)FIProviderDomainFetcher::Singleton(v7);
  id v9 = FIProviderDomainFetcher::FetchDomainForURL(v8, v7, 0, a4, (uint64_t)a5);

  return v9;
}

- (NSString)domainID
{
  return self->_domainID;
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

@end