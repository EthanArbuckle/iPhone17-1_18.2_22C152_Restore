@interface NSMachBootstrapServer
+ (id)sharedInstance;
- (BOOL)registerPort:(NSPort *)port name:(NSString *)name;
- (BOOL)removePortForName:(id)a3;
- (NSPort)portForName:(NSString *)name;
- (NSPort)portForName:(NSString *)name host:(NSString *)host;
- (NSPort)servicePortWithName:(NSString *)name;
- (id)portForName:(id)a3 options:(unint64_t)a4;
@end

@implementation NSMachBootstrapServer

+ (id)sharedInstance
{
  id result = (id)sharedInstance___NSMachBootstrapServerShared;
  if (!sharedInstance___NSMachBootstrapServerShared)
  {
    id result = (id)[objc_allocWithZone((Class)a1) init];
    sharedInstance___NSMachBootstrapServerShared = (uint64_t)result;
  }
  return result;
}

- (id)portForName:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)special_port = 0;
  if (task_get_special_port(*MEMORY[0x1E4F14960], 4, &special_port[1])) {
    return 0;
  }
  id result = [+[NSFileManager defaultManager] fileSystemRepresentationWithPath:a3];
  if (result)
  {
    if (!bootstrap_look_up2()) {
      return (id)[objc_allocWithZone(MEMORY[0x1E4F1CA30]) initWithMachPort:special_port[0] options:1];
    }
    return 0;
  }
  return result;
}

- (NSPort)portForName:(NSString *)name
{
  return (NSPort *)[(NSMachBootstrapServer *)self portForName:name options:0];
}

- (BOOL)registerPort:(NSPort *)port name:(NSString *)name
{
  kern_return_t v6;
  const char *v7;
  mach_port_t special_port;
  uint64_t v10;

  v10 = *MEMORY[0x1E4F143B8];
  special_port = 0;
  v6 = task_get_special_port(*MEMORY[0x1E4F14960], 4, &special_port);
  LOBYTE(v7) = 0;
  if (!v6)
  {
    self;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(NSString *)name UTF8String];
      if (v7)
      {
        [(NSPort *)port machPort];
        LOBYTE(v7) = bootstrap_register2() == 0;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return (char)v7;
}

- (NSPort)servicePortWithName:(NSString *)name
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(void *)special_port = 0;
  v4 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (!task_get_special_port(*MEMORY[0x1E4F14960], 4, &special_port[1]))
  {
    uint64_t v7 = [(NSString *)name UTF8String];
    if (v7)
    {
      if (!bootstrap_check_in(special_port[1], v7, special_port))
      {
        mach_port_insert_right(*v4, special_port[0], special_port[0], 0x14u);
        id v8 = objc_allocWithZone(MEMORY[0x1E4F1CA30]);
        return (NSPort *)(id)[v8 initWithMachPort:special_port[0]];
      }
      v5 = (NSPort *)[MEMORY[0x1E4F1CA30] port];
      [(NSPort *)v5 machPort];
      if (!bootstrap_register2()) {
        return v5;
      }
    }
  }
  return 0;
}

- (NSPort)portForName:(NSString *)name host:(NSString *)host
{
  if (host && ![&stru_1ECA5C228 isEqual:host]) {
    return 0;
  }

  return [(NSMachBootstrapServer *)self portForName:name];
}

- (BOOL)removePortForName:(id)a3
{
  return 0;
}

@end