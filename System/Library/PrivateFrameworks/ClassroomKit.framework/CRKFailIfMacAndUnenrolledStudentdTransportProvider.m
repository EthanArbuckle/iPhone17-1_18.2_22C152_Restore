@interface CRKFailIfMacAndUnenrolledStudentdTransportProvider
- (CRKFailIfMacAndUnenrolledStudentdTransportProvider)initWithTransportProvider:(id)a3;
- (CRKFailIfMacAndUnenrolledStudentdTransportProvider)initWithTransportProvider:(id)a3 featureDataStore:(id)a4;
- (CRKFeatureDataStoreProtocol)featureDataStore;
- (CRKTransportProviding)underlyingTransportProvider;
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKFailIfMacAndUnenrolledStudentdTransportProvider

- (CRKFailIfMacAndUnenrolledStudentdTransportProvider)initWithTransportProvider:(id)a3 featureDataStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFailIfMacAndUnenrolledStudentdTransportProvider;
  v9 = [(CRKFailIfMacAndUnenrolledStudentdTransportProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_underlyingTransportProvider, a3);
    objc_storeStrong((id *)&v10->_featureDataStore, a4);
  }

  return v10;
}

- (CRKFailIfMacAndUnenrolledStudentdTransportProvider)initWithTransportProvider:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v5 makeFeatureDataStore];

  id v7 = [(CRKFailIfMacAndUnenrolledStudentdTransportProvider *)self initWithTransportProvider:v4 featureDataStore:v6];
  return v7;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKFailIfMacAndUnenrolledStudentdTransportProvider *)self underlyingTransportProvider];
  [v5 fetchTransportWithCompletion:v4];
}

- (CRKTransportProviding)underlyingTransportProvider
{
  return self->_underlyingTransportProvider;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDataStore, 0);

  objc_storeStrong((id *)&self->_underlyingTransportProvider, 0);
}

@end