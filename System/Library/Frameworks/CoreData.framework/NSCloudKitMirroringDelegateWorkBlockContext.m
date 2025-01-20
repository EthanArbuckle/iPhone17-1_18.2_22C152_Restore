@interface NSCloudKitMirroringDelegateWorkBlockContext
- (NSCloudKitMirroringDelegateWorkBlockContext)initWithTransactionLabel:(id)a3 powerAssertionLabel:(id)a4;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegateWorkBlockContext

- (NSCloudKitMirroringDelegateWorkBlockContext)initWithTransactionLabel:(id)a3 powerAssertionLabel:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSCloudKitMirroringDelegateWorkBlockContext;
  v6 = [(NSCloudKitMirroringDelegateWorkBlockContext *)&v9 init];
  if (v6)
  {
    v6->_transactionLabel = (NSString *)a3;
    v7 = (NSString *)a4;
    v6->_powerAssertionLabel = v7;
    v6->_uiAppInstance = (id)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)v7, &v6->_powerAssertionID);
  }
  return v6;
}

- (void)dealloc
{
  +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, self->_powerAssertionID, self->_uiAppInstance);

  self->_uiAppInstance = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateWorkBlockContext;
  [(NSCloudKitMirroringDelegateWorkBlockContext *)&v3 dealloc];
}

@end