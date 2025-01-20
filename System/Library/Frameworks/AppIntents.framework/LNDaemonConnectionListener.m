@interface LNDaemonConnectionListener
- (LNDaemonConnectionListener)initWithBundleIdentifier:(id)a3;
@end

@implementation LNDaemonConnectionListener

- (LNDaemonConnectionListener)initWithBundleIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08D88];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [NSString stringWithFormat:@"com.apple.private.appintents.delegate.%@", v5];

  v8 = (void *)[v6 initWithMachServiceName:v7];
  v11.receiver = self;
  v11.super_class = (Class)LNDaemonConnectionListener;
  v9 = [(LNConnectionListener *)&v11 initWithListener:v8];

  return v9;
}

@end