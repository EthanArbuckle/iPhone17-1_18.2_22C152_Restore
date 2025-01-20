@interface ASDTIOA2BooleanControl
+ (BOOL)automaticallyNotifiesObserversOfValue;
- (ASDTIOA2BooleanControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (ASDTIOA2Device)ioa2Device;
- (BOOL)changeValue:(BOOL)a3;
- (BOOL)marked;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (NSArray)properties;
- (NSArray)propertySelectorInfo;
- (id).cxx_construct;
- (id)setterBlock;
- (unsigned)userClientID;
- (void)doSetValue:(BOOL)a3;
- (void)pushValue:(unsigned int)a3;
- (void)setIoa2Device:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setSetterBlock:(id)a3;
- (void)setUserClientID:(unsigned int)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation ASDTIOA2BooleanControl

- (ASDTIOA2BooleanControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
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
  v22.receiver = self;
  v22.super_class = (Class)ASDTIOA2BooleanControl;
  id v20 = [(ASDBooleanControl *)&v22 initWithValue:v18 != 0 isSettable:v12 forElement:v11 inScope:v10 withPlugin:v19 andObjectClassID:v9];

  if (v20)
  {
    *((_DWORD *)v20 + 43) = a4;
    objc_storeWeak((id *)v20 + 24, v15);
  }

  return (ASDTIOA2BooleanControl *)v20;
}

- (NSArray)propertySelectorInfo
{
  v7[1] = *MEMORY[0x263EF8340];
  v5[0] = @"selector";
  v5[1] = @"dataType";
  v6[0] = &unk_26FCB1FF8;
  v6[1] = &unk_26FCB2010;
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return (NSArray *)v3;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", v11, 2u);
    }

    goto LABEL_7;
  }
  v6 = [v4 objectForKeyedSubscript:@"property selectors"];
  BOOL v7 = [(ASDControl *)self asdtAddControlProperties:v6];

  if (!v7)
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  -[ASDTIOA2BooleanControl pushValue:](self, "pushValue:", [v5 unsignedIntValue]);
  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)changeValue:(BOOL)a3
{
  return 1;
}

- (void)doSetValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  v5 = (std::mutex *)((char *)self + 104);
  std::mutex::lock((std::mutex *)((char *)self + 104));
  if ([(ASDBooleanControl *)self value] != v3)
  {
    v6 = [(ASDTIOA2BooleanControl *)self setterBlock];

    if (v6)
    {
      BOOL v7 = [(ASDTIOA2BooleanControl *)self setterBlock];
      v7[2](v7, v3);
    }
    BOOL v8 = NSStringFromSelector(sel_value);
    [(ASDTIOA2BooleanControl *)self willChangeValueForKey:v8];

    v17.receiver = self;
    v17.super_class = (Class)ASDTIOA2BooleanControl;
    [(ASDBooleanControl *)&v17 setValue:v3];
    [(ASDControl *)self asdtSendControlPropertyChangeNotificationAtIndex:0];
    uint64_t v9 = NSStringFromSelector(sel_value);
    [(ASDTIOA2BooleanControl *)self didChangeValueForKey:v9];

    uint64_t v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)self + 24);
      BOOL v12 = [WeakRetained deviceUID];
      if ([(ASDTIOA2BooleanControl *)self objectClass] >> 29
        && [(ASDTIOA2BooleanControl *)self objectClass] >> 24 <= 0x7E)
      {
        unsigned int v13 = [(ASDTIOA2BooleanControl *)self objectClass] >> 24;
      }
      else
      {
        unsigned int v13 = 32;
      }
      if (([(ASDTIOA2BooleanControl *)self objectClass] & 0xE00000) != 0
        && ([(ASDTIOA2BooleanControl *)self objectClass] >> 16) <= 0x7Eu)
      {
        int v14 = ([(ASDTIOA2BooleanControl *)self objectClass] >> 16);
      }
      else
      {
        int v14 = 32;
      }
      if (([(ASDTIOA2BooleanControl *)self objectClass] & 0xE000) != 0
        && ((unsigned __int16)[(ASDTIOA2BooleanControl *)self objectClass] >> 8) <= 0x7Eu)
      {
        int v15 = ((unsigned __int16)[(ASDTIOA2BooleanControl *)self objectClass] >> 8);
      }
      else
      {
        int v15 = 32;
      }
      if (([(ASDTIOA2BooleanControl *)self objectClass] & 0xE0) != 0
        && [(ASDTIOA2BooleanControl *)self objectClass] <= 0x7Eu)
      {
        int v16 = [(ASDTIOA2BooleanControl *)self objectClass];
      }
      else
      {
        int v16 = 32;
      }
      *(_DWORD *)buf = 138413570;
      v19 = v12;
      __int16 v20 = 1024;
      unsigned int v21 = v13;
      __int16 v22 = 1024;
      int v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = v16;
      __int16 v28 = 1024;
      BOOL v29 = v3;
      _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
    }
  }
  std::mutex::unlock(v5);
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (void)setValue:(BOOL)a3
{
  BOOL v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)self + 24);
  int v5 = [WeakRetained _setControlValue:&v6 forControl:*((unsigned int *)self + 43)];

  if (v5) {
    [(ASDTIOA2BooleanControl *)self doSetValue:v6];
  }
}

- (void)pushValue:(unsigned int)a3
{
  [(ASDTIOA2BooleanControl *)self doSetValue:a3 != 0];
}

- (NSArray)properties
{
  return (NSArray *)*((void *)self + 22);
}

- (void)setProperties:(id)a3
{
}

- (BOOL)marked
{
  return *((unsigned char *)self + 168);
}

- (void)setMarked:(BOOL)a3
{
  *((unsigned char *)self + 168) = a3;
}

- (id)setterBlock
{
  return (id)*((void *)self + 23);
}

- (void)setSetterBlock:(id)a3
{
}

- (ASDTIOA2Device)ioa2Device
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 24);
  return (ASDTIOA2Device *)WeakRetained;
}

- (void)setIoa2Device:(id)a3
{
}

- (unsigned)userClientID
{
  return *((_DWORD *)self + 43);
}

- (void)setUserClientID:(unsigned int)a3
{
  *((_DWORD *)self + 43) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 24);
  objc_storeStrong((id *)self + 23, 0);
  objc_storeStrong((id *)self + 22, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 104));
}

- (id).cxx_construct
{
  *((void *)self + 13) = 850045863;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((void *)self + 20) = 0;
  return self;
}

@end