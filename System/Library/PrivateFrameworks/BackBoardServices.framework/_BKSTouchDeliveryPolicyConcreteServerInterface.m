@interface _BKSTouchDeliveryPolicyConcreteServerInterface
- (_BKSTouchDeliveryPolicyConcreteServerInterface)init;
@end

@implementation _BKSTouchDeliveryPolicyConcreteServerInterface

- (void).cxx_destruct
{
}

- (_BKSTouchDeliveryPolicyConcreteServerInterface)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BKSTouchDeliveryPolicyConcreteServerInterface;
  v2 = [(_BKSTouchDeliveryPolicyConcreteServerInterface *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.backboard.TouchDeliveryPolicyServer" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED770078];
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

@end