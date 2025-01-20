@interface GCKeyboardAndMouseManager
+ (GCKeyboardAndMouseManager)managerWithQueue:(id)a3;
- (BOOL)addDeviceWithServiceRef:(__IOHIDServiceClient *)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3;
- (GCKeyboardAndMouseManager)init;
- (GCKeyboardAndMouseManager)initWithQueue:(id)a3;
- (GCMouse)currentMouse;
- (id)coalescedKeyboard;
- (id)mice;
@end

@implementation GCKeyboardAndMouseManager

+ (GCKeyboardAndMouseManager)managerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = NSClassFromString(&cfstr_Gckeyboardandm.isa);
  if (!v4) {
    v4 = (objc_class *)objc_opt_class();
  }
  v5 = (void *)[[v4 alloc] initWithQueue:v3];

  return (GCKeyboardAndMouseManager *)v5;
}

- (GCKeyboardAndMouseManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GCKeyboardAndMouseManager;
  return [(GCKeyboardAndMouseManager *)&v4 init];
}

- (GCKeyboardAndMouseManager)init
{
  dispatch_queue_t v3 = dispatch_queue_create("GCKeyboardAndMouseManager", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  objc_super v4 = [(GCKeyboardAndMouseManager *)self initWithQueue:v3];

  return v4;
}

- (id)coalescedKeyboard
{
  return 0;
}

- (id)mice
{
  return &__NSArray0__struct;
}

- (GCMouse)currentMouse
{
  return 0;
}

- (BOOL)addDeviceWithServiceRef:(__IOHIDServiceClient *)a3
{
  return 0;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3
{
  return 0;
}

@end