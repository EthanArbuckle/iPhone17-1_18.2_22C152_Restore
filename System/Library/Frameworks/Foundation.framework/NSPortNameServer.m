@interface NSPortNameServer
+ (NSPortNameServer)systemDefaultPortNameServer;
+ (id)defaultPortNameServer;
- (BOOL)registerPort:(NSPort *)port name:(NSString *)name;
- (BOOL)removePortForName:(NSString *)name;
- (NSPort)portForName:(NSString *)name;
- (NSPort)portForName:(NSString *)name host:(NSString *)host;
@end

@implementation NSPortNameServer

+ (NSPortNameServer)systemDefaultPortNameServer
{
  result = (NSPortNameServer *)systemDefaultPortNameServer___NSDefaultNameServer;
  if (!systemDefaultPortNameServer___NSDefaultNameServer)
  {
    result = +[NSMachBootstrapServer sharedInstance];
    systemDefaultPortNameServer___NSDefaultNameServer = (uint64_t)result;
  }
  return result;
}

+ (id)defaultPortNameServer
{
  return +[NSPortNameServer systemDefaultPortNameServer];
}

- (NSPort)portForName:(NSString *)name
{
  v5 = NSClassFromString((NSString *)@"NSPortNameServer");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  v6 = NSClassFromString((NSString *)@"NSPortNameServer");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (BOOL)registerPort:(NSPort *)port name:(NSString *)name
{
  v6 = NSClassFromString((NSString *)@"NSPortNameServer");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (BOOL)removePortForName:(NSString *)name
{
  v5 = NSClassFromString((NSString *)@"NSPortNameServer");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end