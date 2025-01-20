@interface ASDTIOA2LegacyBooleanControl
+ (BOOL)automaticallyNotifiesObserversOfValue;
- (ASDTIOA2LegacyBooleanControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (BOOL)changeValue:(BOOL)a3;
- (BOOL)marked;
- (BOOL)synchronizeWithRegistry;
- (id)setterBlock;
- (unsigned)userClientID;
- (void)doSetValue:(BOOL)a3;
- (void)pushValue:(unsigned int)a3;
- (void)setMarked:(BOOL)a3;
- (void)setSetterBlock:(id)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation ASDTIOA2LegacyBooleanControl

- (ASDTIOA2LegacyBooleanControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a9;
  v17 = [v16 objectForKeyedSubscript:@"value"];
  int v18 = [v17 unsignedIntValue];

  v19 = [v15 plugin];
  v23.receiver = self;
  v23.super_class = (Class)ASDTIOA2LegacyBooleanControl;
  v20 = [(ASDBooleanControl *)&v23 initWithValue:v18 != 0 isSettable:v12 forElement:v11 inScope:v10 withPlugin:v19 andObjectClassID:v9];

  if (v20)
  {
    v20->_userClientID = a4;
    objc_storeStrong((id *)&v20->_ioa2Device, a3);
  }

  return v20;
}

- (BOOL)synchronizeWithRegistry
{
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    [(ASDTIOA2LegacyDevice *)ioa2Device scopedLock];
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  v4 = [(ASDTIOA2LegacyDevice *)ioa2Device _controlDictionaryForControl:self->_userClientID];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v9);
      [(ASDTIOA2LegacyBooleanControl *)self pushValue:[v6 unsignedIntValue]];
    }
  }
  else
  {
    v6 = ASDTIOA2LogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", v8, 2u);
    }
  }

  if ((_BYTE)v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v5 != 0;
}

- (BOOL)changeValue:(BOOL)a3
{
  return 1;
}

- (void)doSetValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([(ASDBooleanControl *)self value] != a3)
  {
    v5 = [(ASDTIOA2LegacyBooleanControl *)self setterBlock];

    if (v5)
    {
      v6 = [(ASDTIOA2LegacyBooleanControl *)self setterBlock];
      v6[2](v6, v3);
    }
    v7 = NSStringFromSelector(sel_value);
    [(ASDTIOA2LegacyBooleanControl *)self willChangeValueForKey:v7];

    v15.receiver = self;
    v15.super_class = (Class)ASDTIOA2LegacyBooleanControl;
    [(ASDBooleanControl *)&v15 setValue:v3];
    v8 = NSStringFromSelector(sel_value);
    [(ASDTIOA2LegacyBooleanControl *)self didChangeValueForKey:v8];

    uint64_t v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(ASDAudioDevice *)self->_ioa2Device deviceUID];
      if ([(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 29
        && [(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 24 <= 0x7E)
      {
        unsigned int v11 = [(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 24;
      }
      else
      {
        unsigned int v11 = 32;
      }
      if (([(ASDTIOA2LegacyBooleanControl *)self objectClass] & 0xE00000) != 0
        && ([(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 16) <= 0x7Eu)
      {
        int v12 = ([(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 16);
      }
      else
      {
        int v12 = 32;
      }
      if (([(ASDTIOA2LegacyBooleanControl *)self objectClass] & 0xE000) != 0
        && ((unsigned __int16)[(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 8) <= 0x7Eu)
      {
        int v13 = ((unsigned __int16)[(ASDTIOA2LegacyBooleanControl *)self objectClass] >> 8);
      }
      else
      {
        int v13 = 32;
      }
      if (([(ASDTIOA2LegacyBooleanControl *)self objectClass] & 0xE0) != 0
        && [(ASDTIOA2LegacyBooleanControl *)self objectClass] <= 0x7Eu)
      {
        int v14 = [(ASDTIOA2LegacyBooleanControl *)self objectClass];
      }
      else
      {
        int v14 = 32;
      }
      *(_DWORD *)buf = 138413570;
      v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v14;
      __int16 v26 = 1024;
      BOOL v27 = v3;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (void)setValue:(BOOL)a3
{
  BOOL v8 = a3;
  ioa2Device = self->_ioa2Device;
  if (ioa2Device)
  {
    [(ASDTIOA2LegacyDevice *)ioa2Device scopedLock];
    ioa2Device = self->_ioa2Device;
  }
  else
  {
    v6 = 0;
    uint64_t v7 = 0;
  }
  BOOL v5 = [(ASDTIOA2LegacyDevice *)ioa2Device _setControlValue:&v8 forControl:self->_userClientID];
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v6);
  if (v5) {
    [(ASDTIOA2LegacyBooleanControl *)self doSetValue:v8];
  }
  if ((_BYTE)v7) {
    std::recursive_mutex::unlock(v6);
  }
}

- (void)pushValue:(unsigned int)a3
{
  [(ASDTIOA2LegacyBooleanControl *)self doSetValue:a3 != 0];
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (id)setterBlock
{
  return self->_setterBlock;
}

- (void)setSetterBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setterBlock, 0);

  objc_storeStrong((id *)&self->_ioa2Device, 0);
}

@end