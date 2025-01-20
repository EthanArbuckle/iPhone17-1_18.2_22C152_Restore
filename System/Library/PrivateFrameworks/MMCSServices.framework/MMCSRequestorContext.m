@interface MMCSRequestorContext
- (MMCSController)controller;
- (MMCSRequestorContext)initWithController:(id)a3 transferID:(id)a4;
- (NSString)transferID;
- (void)_removeFromController;
- (void)dealloc;
@end

@implementation MMCSRequestorContext

- (MMCSRequestorContext)initWithController:(id)a3 transferID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MMCSRequestorContext;
  v6 = [(MMCSRequestorContext *)&v8 init];
  v6->_controller = (MMCSController *)a3;
  v6->_transferID = (NSString *)a4;
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MMCSRequestorContext;
  [(MMCSRequestorContext *)&v3 dealloc];
}

- (void)_removeFromController
{
  v6 = objc_msgSend_serialControllerQueue(MMCSController, a2, v2, v3, v4);
  dispatch_assert_queue_V2(v6);
  transferID = self->_transferID;
  if (transferID)
  {
    controller = self->_controller;
    if (controller)
    {
      MEMORY[0x270F9A6D0](controller, sel__removeRequestorContext_transferID_, self, transferID, v7);
    }
  }
}

- (MMCSController)controller
{
  return (MMCSController *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)transferID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end