@interface CRKAlwaysFailingTransportProvider
- (CRKAlwaysFailingTransportProvider)initWithError:(id)a3;
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKAlwaysFailingTransportProvider

- (CRKAlwaysFailingTransportProvider)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKAlwaysFailingTransportProvider;
  v6 = [(CRKAlwaysFailingTransportProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mError, a3);
  }

  return v7;
}

- (void)fetchTransportWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end