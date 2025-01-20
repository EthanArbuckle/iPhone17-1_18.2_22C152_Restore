@interface PFUbiquityBaselineOperation
- (PFUbiquityBaselineOperation)initWithPersistentStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5;
- (id)description;
- (void)dealloc;
@end

@implementation PFUbiquityBaselineOperation

- (PFUbiquityBaselineOperation)initWithPersistentStore:(id)a3 localPeerID:(id)a4 andUbiquityRootLocation:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PFUbiquityBaselineOperation;
  v6 = [(PFUbiquityImportOperation *)&v9 initWithPersistentStore:a3 localPeerID:a4 andUbiquityRootLocation:a5];
  if (v6)
  {
    v7 = (NSManagedObjectModel *)(id)objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
    v6->_model = v7;
    v6->_modelVersionHash = (NSString *)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v7);
  }
  return v6;
}

- (void)dealloc
{
  self->_modelVersionHash = 0;
  self->_model = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineOperation;
  [(PFUbiquityImportOperation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityBaselineOperation;
  id v4 = [(PFUbiquityImportOperation *)&v7 description];
  if (self) {
    modelVersionHash = self->_modelVersionHash;
  }
  else {
    modelVersionHash = 0;
  }
  return (id)[v3 stringWithFormat:@"%@\n\tmodelVersionHash: %@\n", v4, modelVersionHash];
}

@end