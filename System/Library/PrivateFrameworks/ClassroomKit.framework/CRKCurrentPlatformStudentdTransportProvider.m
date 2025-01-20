@interface CRKCurrentPlatformStudentdTransportProvider
- (CRKCurrentPlatformStudentdTransportProvider)init;
- (id)makeProviderForCurrentPlatform;
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKCurrentPlatformStudentdTransportProvider

- (CRKCurrentPlatformStudentdTransportProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRKCurrentPlatformStudentdTransportProvider;
  v2 = [(CRKCurrentPlatformStudentdTransportProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(CRKCurrentPlatformStudentdTransportProvider *)v2 makeProviderForCurrentPlatform];
    mBaseProvider = v3->mBaseProvider;
    v3->mBaseProvider = (CRKTransportProviding *)v4;
  }
  return v3;
}

- (id)makeProviderForCurrentPlatform
{
  v2 = objc_opt_new();

  return v2;
}

- (void)fetchTransportWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end