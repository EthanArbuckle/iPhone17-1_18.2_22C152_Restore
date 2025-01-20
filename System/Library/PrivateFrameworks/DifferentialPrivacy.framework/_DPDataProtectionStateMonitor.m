@interface _DPDataProtectionStateMonitor
+ (id)dataProtectionClassA;
+ (id)dataProtectionClassC;
+ (id)dataProtectionClassD;
- (BOOL)isDataAvailableFor:(id)a3;
- (NSUUID)handlerUUID;
- (_DPDataProtectionMaster)master;
- (_DPDataProtectionStateMonitor)init;
- (id)changeHandler;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
@end

@implementation _DPDataProtectionStateMonitor

+ (id)dataProtectionClassA
{
  return (id)*MEMORY[0x1E4F28340];
}

+ (id)dataProtectionClassC
{
  return (id)*MEMORY[0x1E4F28358];
}

+ (id)dataProtectionClassD
{
  return (id)*MEMORY[0x1E4F28378];
}

- (_DPDataProtectionStateMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DPDataProtectionStateMonitor;
  v2 = [(_DPDataProtectionStateMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[_DPDataProtectionMaster sharedInstance];
    master = v2->_master;
    v2->_master = (_DPDataProtectionMaster *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0;

    id changeHandler = v2->_changeHandler;
    v2->_id changeHandler = 0;
  }
  return v2;
}

- (void)dealloc
{
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = 0;

  master = self->_master;
  self->_master = 0;

  v5.receiver = self;
  v5.super_class = (Class)_DPDataProtectionStateMonitor;
  [(_DPDataProtectionStateMonitor *)&v5 dealloc];
}

- (void)setChangeHandler:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_handlerUUID)
  {
    -[_DPDataProtectionMaster deregisterStateChangeHandler:](self->_master, "deregisterStateChangeHandler:");
    id v4 = v9;
  }
  if (v4)
  {
    objc_super v5 = [(_DPDataProtectionMaster *)self->_master registerStateChangeHandler:v4];
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    id v4 = v9;
  }
  v7 = (void *)MEMORY[0x1E019FA60](v4);
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = v7;
}

- (id)changeHandler
{
  v2 = (void *)MEMORY[0x1E019FA60](self->_changeHandler, a2);
  return v2;
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return [(_DPDataProtectionMaster *)self->_master isDataAvailableFor:a3];
}

- (_DPDataProtectionMaster)master
{
  return self->_master;
}

- (NSUUID)handlerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_master, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end