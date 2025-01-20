@interface _PFUbiquityMigrationContext
- (void)dealloc;
@end

@implementation _PFUbiquityMigrationContext

- (void)dealloc
{
  self->_transactionLog = 0;
  self->_sourceStoreSaveSnapshot = 0;

  self->_destinationStoreSaveSnapshot = 0;
  v3.receiver = self;
  v3.super_class = (Class)_PFUbiquityMigrationContext;
  [(_PFUbiquityMigrationContext *)&v3 dealloc];
}

@end