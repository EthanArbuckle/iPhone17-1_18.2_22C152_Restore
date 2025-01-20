@interface _OSDataProtectionStateMonitor
+ (id)dataProtectionClassA;
+ (id)dataProtectionClassC;
+ (id)dataProtectionClassD;
- (BOOL)isDataAvailableFor:(id)a3;
- (BOOL)unnotifiedIsDataAvailableForClassC;
- (NSUUID)handlerUUID;
- (_OSDataProtectionManager)manager;
- (_OSDataProtectionStateMonitor)init;
- (id)changeHandler;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
@end

@implementation _OSDataProtectionStateMonitor

+ (id)dataProtectionClassA
{
  return (id)*MEMORY[0x263F08080];
}

+ (id)dataProtectionClassC
{
  return (id)*MEMORY[0x263F08098];
}

+ (id)dataProtectionClassD
{
  return (id)*MEMORY[0x263F080B0];
}

- (_OSDataProtectionStateMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_OSDataProtectionStateMonitor;
  v2 = [(_OSDataProtectionStateMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[_OSDataProtectionManager sharedInstance];
    manager = v2->_manager;
    v2->_manager = (_OSDataProtectionManager *)v3;

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

  manager = self->_manager;
  self->_manager = 0;

  v5.receiver = self;
  v5.super_class = (Class)_OSDataProtectionStateMonitor;
  [(_OSDataProtectionStateMonitor *)&v5 dealloc];
}

- (void)setChangeHandler:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_handlerUUID)
  {
    -[_OSDataProtectionManager deregisterStateChangeHandler:](self->_manager, "deregisterStateChangeHandler:");
    id v4 = v9;
  }
  if (v4)
  {
    objc_super v5 = [(_OSDataProtectionManager *)self->_manager registerStateChangeHandler:v4];
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    id v4 = v9;
  }
  v7 = (void *)MEMORY[0x230F77820](v4);
  id changeHandler = self->_changeHandler;
  self->_id changeHandler = v7;
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return [(_OSDataProtectionManager *)self->_manager isDataAvailableFor:a3];
}

- (BOOL)unnotifiedIsDataAvailableForClassC
{
  if ([(_OSDataProtectionManager *)self->_manager deviceHasBeenUnlockedSinceBoot]) {
    return 1;
  }
  else {
    return ![(_OSDataProtectionManager *)self->_manager deviceIsPasswordConfigured];
  }
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (_OSDataProtectionManager)manager
{
  return self->_manager;
}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end