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

+ (void)initialize
{
  if (qword_100042CC8 != -1) {
    dispatch_once(&qword_100042CC8, &stru_10003C820);
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

+ (_ANEDeviceController)controllerWithProgramHandle:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithProgramHandle:a3 priviledged:0];
  return (_ANEDeviceController *)v3;
}

+ (_ANEDeviceController)controllerWithPrivilegedVM:(BOOL)a3
{
  id v3 = [objc_alloc((Class)a1) initWithANEPrivilegedVM:a3];
  return (_ANEDeviceController *)v3;
}

+ (id)sharedPrivilegedConnection
{
  if (qword_100042CD0 != -1) {
    dispatch_once(&qword_100042CD0, &stru_10003C840);
  }
  v2 = (void *)qword_100042CD8;
  return v2;
}

- (_ANEDeviceController)initWithANEPrivilegedVM:(BOOL)a3
{
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
      sub_1000238CC();
    }

    os_unfair_lock_lock_with_options();
    v6 = (void *)qword_100042CE8;
    if (qword_100042CE8
      || (v6 = dlopen("/System/Library/PrivateFrameworks/ANEServices.framework/ANEServices", 4),
          (qword_100042CE8 = (uint64_t)v6) != 0))
    {
      if (!off_100042CF0) {
        off_100042CF0 = dlsym(v6, "H11ANECheckPrivilegedVMAccess");
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042CE0);
      if (off_100042CF0) {
        ((void (*)(void))off_100042CF0)();
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042CE0);
    }
  }
  return v4;
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

- (void)start
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100007AB0;
  v2[3] = &unk_10003C868;
  v2[4] = self;
  v2[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100042CC0, v2);
}

- (void)stop
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100008080;
  v2[3] = &unk_10003C868;
  v2[4] = self;
  v2[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100042CC0, v2);
}

- (int64_t)usecount
{
  return self->_usecount;
}

- (void)setUsecount:(int64_t)a3
{
  self->_usecount = a3;
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

- (ANEDeviceStruct)device
{
  return self->_device;
}

- (void)setDevice:(ANEDeviceStruct *)a3
{
  self->_device = a3;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

@end