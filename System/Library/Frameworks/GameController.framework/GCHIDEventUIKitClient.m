@interface GCHIDEventUIKitClient
@end

@implementation GCHIDEventUIKitClient

void __40___GCHIDEventUIKitClient_initWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  IOHIDEventGetSenderID();
  IOHIDEventGetTimeStamp();
  IOHIDEventGetType();
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained publishHIDEvent:a2];
}

@end