@interface NSXPCConnection(XPC_Connection_Uniquifier)
- (void)uniquify;
@end

@implementation NSXPCConnection(XPC_Connection_Uniquifier)

- (void)uniquify
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  MEMORY[0x1C185A9D0](v3);
  v2 = [a1 _xpcConnection];
  xpc_connection_set_oneshot_instance();
}

@end