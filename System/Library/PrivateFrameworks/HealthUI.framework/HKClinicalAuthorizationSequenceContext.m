@interface HKClinicalAuthorizationSequenceContext
+ (HKClinicalAuthorizationSequenceContext)contextWithHealthStore:(id)a3 request:(id)a4 source:(id)a5;
- (HKClinicalAuthorizationFlowManager)authFlowManager;
- (HKClinicalAuthorizationSequenceContext)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4 authorizationController:(id)a5 readUsageDescription:(id)a6 source:(id)a7;
- (HKClinicalSourceAuthorizationController)authorizationController;
- (HKSource)source;
- (NSString)readUsageDescription;
- (id)createInitialViewControllerWithDelegate:(id)a3;
- (id)wrappedFlowManager;
@end

@implementation HKClinicalAuthorizationSequenceContext

+ (HKClinicalAuthorizationSequenceContext)contextWithHealthStore:(id)a3 request:(id)a4 source:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F2B0A0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithHealthStore:v11];
  v13 = [HKClinicalSourceAuthorizationController alloc];
  v14 = [v10 typesRequiringReadAuthorization];
  v15 = [(HKClinicalSourceAuthorizationController *)v13 initWithHealthStore:v11 healthRecordsStore:v12 source:v9 typesRequestedForReading:v14];

  id v16 = objc_alloc((Class)a1);
  v17 = [v10 readUsageDescription];

  v18 = (void *)[v16 initWithHealthStore:v11 healthRecordsStore:v12 authorizationController:v15 readUsageDescription:v17 source:v9];
  return (HKClinicalAuthorizationSequenceContext *)v18;
}

- (HKClinicalAuthorizationSequenceContext)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4 authorizationController:(id)a5 readUsageDescription:(id)a6 source:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKClinicalAuthorizationSequenceContext;
  v17 = [(HKClinicalAuthorizationSequenceContext *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_authorizationController, a5);
    uint64_t v19 = [v15 copy];
    readUsageDescription = v18->_readUsageDescription;
    v18->_readUsageDescription = (NSString *)v19;

    uint64_t v21 = [v16 copy];
    source = v18->_source;
    v18->_source = (HKSource *)v21;

    v23 = [[HKClinicalAuthorizationFlowManager alloc] initWithHealthStore:v12 healthRecordsStore:v13];
    authFlowManager = v18->_authFlowManager;
    v18->_authFlowManager = v23;

    objc_storeStrong(&v18->_wrappedFlowManager, v18->_authFlowManager);
  }

  return v18;
}

- (id)createInitialViewControllerWithDelegate:(id)a3
{
  return [(HKClinicalAuthorizationFlowManager *)self->_authFlowManager createInitialViewControllerWithContext:self delegate:a3];
}

- (HKClinicalSourceAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (id)wrappedFlowManager
{
  return self->_wrappedFlowManager;
}

- (NSString)readUsageDescription
{
  return self->_readUsageDescription;
}

- (HKSource)source
{
  return self->_source;
}

- (HKClinicalAuthorizationFlowManager)authFlowManager
{
  return self->_authFlowManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authFlowManager, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_readUsageDescription, 0);
  objc_storeStrong(&self->_wrappedFlowManager, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
}

@end