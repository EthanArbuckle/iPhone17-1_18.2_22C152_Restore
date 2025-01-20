@interface PFStaticCloudKitContainerProvider
- (CKContainer)container;
- (PFStaticCloudKitContainerProvider)initWithContainer:(id)a3;
- (id)containerWithIdentifier:(id)a3;
- (void)dealloc;
@end

@implementation PFStaticCloudKitContainerProvider

- (PFStaticCloudKitContainerProvider)initWithContainer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFStaticCloudKitContainerProvider;
  v4 = [(PFStaticCloudKitContainerProvider *)&v6 init];
  if (v4) {
    v4->_container = (CKContainer *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFStaticCloudKitContainerProvider;
  [(PFStaticCloudKitContainerProvider *)&v3 dealloc];
}

- (id)containerWithIdentifier:(id)a3
{
  if (!-[NSString isEqualToString:](-[CKContainer containerIdentifier](self->_container, "containerIdentifier"), "isEqualToString:", a3))objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid for a container '%@'. This object was configured to only respond to container requests for '%@'", a3, -[CKContainer containerIdentifier](self->_container, "containerIdentifier")), 0 reason userInfo]); {
  v5 = self->_container;
  }

  return v5;
}

- (CKContainer)container
{
  return self->_container;
}

@end