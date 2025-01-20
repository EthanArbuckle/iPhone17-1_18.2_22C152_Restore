@interface AFInstanceContextHost
+ (id)effectiveMachServiceName:(id)a3;
- (AFInstanceContextHost)init;
- (BOOL)isCurrent;
- (BOOL)isDefault;
- (BOOL)supportsAudioPowerUpdate;
- (BOOL)supportsProxyGroupPlayer;
- (BOOL)supportsTelephony;
- (id)audioDeviceIdentifier;
- (id)createXPCConnectionForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5;
- (id)createXPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (id)createXPCListenerForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5;
- (id)createXPCListenerWithMachServiceName:(id)a3;
- (id)description;
- (id)info;
- (id)mediaRouteIdentifier;
- (id)preferencesSubdomain;
@end

@implementation AFInstanceContextHost

- (AFInstanceContextHost)init
{
  v6.receiver = self;
  v6.super_class = (Class)AFInstanceContextHost;
  v2 = [(AFInstanceContextHost *)&v6 init];
  if (v2)
  {
    v3 = [[AFInstanceInfo alloc] initWithInstanceUUID:0 applicationType:1 applicationUUID:0];
    info = v2->_info;
    v2->_info = v3;
  }
  return v2;
}

- (id)preferencesSubdomain
{
  return 0;
}

- (void).cxx_destruct
{
}

- (BOOL)supportsTelephony
{
  return 1;
}

- (BOOL)supportsProxyGroupPlayer
{
  return 0;
}

- (BOOL)supportsAudioPowerUpdate
{
  return 1;
}

- (id)audioDeviceIdentifier
{
  return 0;
}

- (id)mediaRouteIdentifier
{
  return 0;
}

- (BOOL)isCurrent
{
  v2 = +[AFInstanceContext currentContext];
  char v3 = [v2 isDefault];

  return v3;
}

- (BOOL)isDefault
{
  return 1;
}

- (id)info
{
  return self->_info;
}

- (id)createXPCListenerForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, (dispatch_queue_t)a4, a5 | 1);
  return mach_service;
}

- (id)createXPCConnectionForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, (dispatch_queue_t)a4, a5);
  return mach_service;
}

- (id)createXPCListenerWithMachServiceName:(id)a3
{
  char v3 = (objc_class *)MEMORY[0x1E4F29290];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithMachServiceName:v4];

  return v5;
}

- (id)createXPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F29268];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithMachServiceName:v6 options:a4];

  return v7;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)AFInstanceContextHost;
  id v4 = [(AFInstanceContextHost *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ (default)", v4];

  return v5;
}

+ (id)effectiveMachServiceName:(id)a3
{
  id v3 = a3;
  return v3;
}

@end