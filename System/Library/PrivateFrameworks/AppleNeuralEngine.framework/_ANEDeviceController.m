@interface _ANEDeviceController
+ (_ANEDeviceController)controllerWithPrivilegedVM:(BOOL)a3;
+ (_ANEDeviceController)controllerWithProgramHandle:(unint64_t)a3;
+ (_ANEDeviceController)new;
+ (id)sharedPrivilegedConnection;
+ (void)initialize;
- (ANEDeviceStruct)device;
- (BOOL)isPrivileged;
- (_ANEDeviceController)init;
- (_ANEDeviceController)initWithANEPrivilegedVM:(BOOL)a3;
- (_ANEDeviceController)initWithProgramHandle:(unint64_t)a3 priviledged:(BOOL)a4;
- (int64_t)usecount;
- (unint64_t)programHandle;
- (void)setDevice:(ANEDeviceStruct *)a3;
- (void)setUsecount:(int64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation _ANEDeviceController

- (ANEDeviceStruct)device
{
  return self->_device;
}

- (int64_t)usecount
{
  return self->_usecount;
}

- (void)setUsecount:(int64_t)a3
{
  self->_usecount = a3;
}

- (void)setDevice:(ANEDeviceStruct *)a3
{
  self->_device = a3;
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29___ANEDeviceController_start__block_invoke;
  v2[3] = &unk_1E6C1C4B0;
  v2[4] = self;
  v2[5] = a2;
  dispatch_sync((dispatch_queue_t)gANEControllerQueue, v2);
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

+ (_ANEDeviceController)controllerWithProgramHandle:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithProgramHandle:a3 priviledged:0];
  return (_ANEDeviceController *)v3;
}

- (_ANEDeviceController)initWithProgramHandle:(unint64_t)a3 priviledged:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_ANEDeviceController;
  result = [(_ANEDeviceController *)&v7 init];
  if (result)
  {
    result->_usecount = 0;
    result->_device = 0;
    result->_programHandle = a3;
    result->_isPrivileged = a4;
  }
  return result;
}

+ (id)sharedPrivilegedConnection
{
  if (+[_ANEDeviceController sharedPrivilegedConnection]::onceToken != -1) {
    dispatch_once(&+[_ANEDeviceController sharedPrivilegedConnection]::onceToken, &__block_literal_global_3_1);
  }
  v2 = (void *)+[_ANEDeviceController sharedPrivilegedConnection]::conn;
  return v2;
}

+ (void)initialize
{
  if (+[_ANEDeviceController initialize]::onceToken != -1) {
    dispatch_once(&+[_ANEDeviceController initialize]::onceToken, &__block_literal_global_5);
  }
}

+ (_ANEDeviceController)new
{
  return 0;
}

- (_ANEDeviceController)init
{
  return 0;
}

+ (_ANEDeviceController)controllerWithPrivilegedVM:(BOOL)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithANEPrivilegedVM:a3];
  return (_ANEDeviceController *)v3;
}

- (_ANEDeviceController)initWithANEPrivilegedVM:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_ANEDeviceController;
  v4 = [(_ANEDeviceController *)&v8 init];
  if (v4)
  {
    v5 = +[_ANELog common];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      -[_ANEDeviceController initWithANEPrivilegedVM:]();
    }

    os_unfair_lock_lock_with_options();
    v6 = (void *)dylib_handle;
    if (dylib_handle
      || (v6 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4),
          (dylib_handle = (uint64_t)v6) != 0))
    {
      if (!factory_function_checkPrivilegedVMAccess) {
        factory_function_checkPrivilegedVMAccess = dlsym(v6, "H11ANECheckPrivilegedVMAccess");
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
      if (factory_function_checkPrivilegedVMAccess) {
        ((void (*)(void))factory_function_checkPrivilegedVMAccess)();
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&_sync_lock);
    }
  }
  return v4;
}

- (void)stop
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28___ANEDeviceController_stop__block_invoke;
  v2[3] = &unk_1E6C1C4B0;
  v2[4] = self;
  v2[5] = a2;
  dispatch_sync((dispatch_queue_t)gANEControllerQueue, v2);
}

- (void)initWithANEPrivilegedVM:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_debug_impl(&dword_1DB8AB000, v3, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceController calling ANECheckPrivilegedVMAccess", v4, 0xCu);
}

@end