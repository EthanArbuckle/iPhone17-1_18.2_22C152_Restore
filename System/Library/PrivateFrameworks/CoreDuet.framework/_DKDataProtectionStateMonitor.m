@interface _DKDataProtectionStateMonitor
- (BOOL)isDataAvailableFor:(id)a3;
- (_DKDataProtectionStateMonitor)init;
- (id)changeHandler;
- (void)dealloc;
- (void)setChangeHandler:(id)a3;
@end

@implementation _DKDataProtectionStateMonitor

- (void)dealloc
{
  [(_DKDataProtectionStateMonitor *)self setChangeHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)_DKDataProtectionStateMonitor;
  [(_DKDataProtectionStateMonitor *)&v3 dealloc];
}

- (void)setChangeHandler:(id)a3
{
  id v4 = a3;
  handlerUUID = self->_handlerUUID;
  id v8 = v4;
  if (handlerUUID)
  {
    -[_DKDataProtectionMonitor deregisterStateChangeHandler:]((uint64_t)self->_main, handlerUUID);
    id v4 = v8;
  }
  if (v4)
  {
    -[_DKDataProtectionMonitor registerStateChangeHandler:]((uint64_t)self->_main, v4);
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v7 = self->_handlerUUID;
    self->_handlerUUID = v6;

    id v4 = v8;
  }
}

- (_DKDataProtectionStateMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DKDataProtectionStateMonitor;
  v2 = [(_DKDataProtectionStateMonitor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[_DKDataProtectionMonitor sharedInstance]();
    main = v2->_main;
    v2->_main = (_DKDataProtectionMonitor *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0;

    id changeHandler = v2->_changeHandler;
    v2->_id changeHandler = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_main, 0);
}

- (BOOL)isDataAvailableFor:(id)a3
{
  return -[_DKDataProtectionMonitor isDataAvailableFor:]((uint64_t)self->_main, a3);
}

- (id)changeHandler
{
  v2 = (void *)MEMORY[0x192FB31A0](self->_changeHandler, a2);
  return v2;
}

@end