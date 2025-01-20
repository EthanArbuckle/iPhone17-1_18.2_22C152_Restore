@interface NSXPCConnection(XPC_Connection_PID_Access)
+ (uint64_t)getPIDFromCurrentConnection;
- (uint64_t)getProcessID;
@end

@implementation NSXPCConnection(XPC_Connection_PID_Access)

- (uint64_t)getProcessID
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  [a1 auditToken];
  return audit_token_to_pid(&v2);
}

+ (uint64_t)getPIDFromCurrentConnection
{
  v0 = [MEMORY[0x263F08D68] currentConnection];
  uint64_t v1 = [v0 getProcessID];

  return v1;
}

@end