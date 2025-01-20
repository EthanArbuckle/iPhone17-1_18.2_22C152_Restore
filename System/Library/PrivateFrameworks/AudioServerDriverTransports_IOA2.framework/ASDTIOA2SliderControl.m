@interface ASDTIOA2SliderControl
+ (BOOL)automaticallyNotifiesObserversOfValue;
- (ASDTIOA2Device)ioa2Device;
- (ASDTIOA2SliderControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9;
- (BOOL)changeValue:(unsigned int)a3;
- (BOOL)marked;
- (BOOL)synchronizeWithRegistryDictionary:(id)a3;
- (NSArray)properties;
- (NSArray)propertySelectorInfo;
- (id).cxx_construct;
- (unsigned)userClientID;
- (void)dealloc;
- (void)doSetValue:(unsigned int)a3;
- (void)setIoa2Device:(id)a3;
- (void)setMarked:(BOOL)a3;
- (void)setProperties:(id)a3;
- (void)setUserClientID:(unsigned int)a3;
- (void)setValue:(unsigned int)a3;
@end

@implementation ASDTIOA2SliderControl

- (ASDTIOA2SliderControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 forElement:(unsigned int)a6 inScope:(unsigned int)a7 objectClassID:(unsigned int)a8 dictionary:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  BOOL v12 = a5;
  id v14 = a3;
  v15 = (NSDictionary *)a9;
  unsigned int v26 = 0;
  _ASDSliderRange v25 = 0;
  if (getValueAndRangeFromControlDict(v15, (const applesauce::CF::DictionaryRef *)&v26, &v25))
  {
    uint64_t v16 = v26;
    _ASDSliderRange v17 = v25;
    v18 = [v14 plugin];
    v24.receiver = self;
    v24.super_class = (Class)ASDTIOA2SliderControl;
    unsigned int v22 = a8;
    v19 = [(ASDSliderControl *)&v24 initWithValue:v16 andRange:v17 isSettable:v12 forElement:v11 inScope:v10 withPlugin:v18 andObjectClassID:v22];

    if (v19)
    {
      [(ASDTIOA2SliderControl *)v19 setIoa2Device:v14];
      v19->_userClientID = a4;
    }
    self = v19;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  [(ASDControl *)self asdtRemoveControlProperties];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2SliderControl;
  [(ASDTIOA2SliderControl *)&v3 dealloc];
}

- (NSArray)propertySelectorInfo
{
  v10[2] = *MEMORY[0x263EF8340];
  v8[0] = @"selector";
  v8[1] = @"dataType";
  v9[0] = &unk_26FCB20D0;
  v9[1] = &unk_26FCB20E8;
  v2 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[0] = v2;
  v6[0] = @"selector";
  v6[1] = @"dataType";
  v7[0] = &unk_26FCB2100;
  v7[1] = &unk_26FCB20E8;
  objc_super v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  v10[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return (NSArray *)v4;
}

- (BOOL)synchronizeWithRegistryDictionary:(id)a3
{
  v4 = (NSDictionary *)a3;
  if (v4)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
    v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"property selectors"];
    BOOL v6 = [(ASDControl *)self asdtAddControlProperties:v5];

    if (v6)
    {
      unsigned int v11 = 0;
      _ASDSliderRange v10 = 0;
      char ValueAndRangeFromControlDict = getValueAndRangeFromControlDict(v4, (const applesauce::CF::DictionaryRef *)&v11, &v10);
      if (ValueAndRangeFromControlDict)
      {
        [(ASDSliderControl *)self setRange:v10];
        [(ASDTIOA2SliderControl *)self pushValue:v11];
      }
    }
    else
    {
      char ValueAndRangeFromControlDict = 0;
    }
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->_lock);
  }
  else
  {
    v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "Error: Couldn't synchronize with registry", buf, 2u);
    }

    char ValueAndRangeFromControlDict = 0;
  }

  return ValueAndRangeFromControlDict;
}

- (BOOL)changeValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(ASDSliderControl *)self value] != a3) {
    [(ASDTIOA2SliderControl *)self setValue:v3];
  }
  return 1;
}

- (void)doSetValue:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->_lock);
  if ([(ASDSliderControl *)self value] != v3)
  {
    BOOL v6 = NSStringFromSelector(sel_value);
    [(ASDTIOA2SliderControl *)self willChangeValueForKey:v6];

    v15.receiver = self;
    v15.super_class = (Class)ASDTIOA2SliderControl;
    [(ASDSliderControl *)&v15 setValue:v3];
    [(ASDControl *)self asdtSendControlPropertyChangeNotificationAtIndex:0];
    v7 = NSStringFromSelector(sel_value);
    [(ASDTIOA2SliderControl *)self didChangeValueForKey:v7];

    v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
      _ASDSliderRange v10 = [WeakRetained deviceUID];
      if ([(ASDTIOA2SliderControl *)self objectClass] >> 29
        && [(ASDTIOA2SliderControl *)self objectClass] >> 24 <= 0x7E)
      {
        unsigned int v11 = [(ASDTIOA2SliderControl *)self objectClass] >> 24;
      }
      else
      {
        unsigned int v11 = 32;
      }
      if (([(ASDTIOA2SliderControl *)self objectClass] & 0xE00000) != 0
        && ([(ASDTIOA2SliderControl *)self objectClass] >> 16) <= 0x7Eu)
      {
        int v12 = ([(ASDTIOA2SliderControl *)self objectClass] >> 16);
      }
      else
      {
        int v12 = 32;
      }
      if (([(ASDTIOA2SliderControl *)self objectClass] & 0xE000) != 0
        && ((unsigned __int16)[(ASDTIOA2SliderControl *)self objectClass] >> 8) <= 0x7Eu)
      {
        int v13 = ((unsigned __int16)[(ASDTIOA2SliderControl *)self objectClass] >> 8);
      }
      else
      {
        int v13 = 32;
      }
      if (([(ASDTIOA2SliderControl *)self objectClass] & 0xE0) != 0
        && [(ASDTIOA2SliderControl *)self objectClass] <= 0x7Eu)
      {
        int v14 = [(ASDTIOA2SliderControl *)self objectClass];
      }
      else
      {
        int v14 = 32;
      }
      *(_DWORD *)buf = 138413570;
      _ASDSliderRange v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v14;
      __int16 v26 = 1024;
      int v27 = v3;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' changed to: %u", buf, 0x2Au);
    }
  }
  std::recursive_mutex::unlock((std::recursive_mutex *)p_lock);
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (void)setValue:(unsigned int)a3
{
  unsigned int v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  int v5 = [WeakRetained _setControlValue:&v6 forControl:self->_userClientID];

  if (v5) {
    [(ASDTIOA2SliderControl *)self doSetValue:v6];
  }
}

- (BOOL)marked
{
  return self->marked;
}

- (void)setMarked:(BOOL)a3
{
  self->marked = a3;
}

- (NSArray)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
}

- (ASDTIOA2Device)ioa2Device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioa2Device);
  return (ASDTIOA2Device *)WeakRetained;
}

- (void)setIoa2Device:(id)a3
{
}

- (unsigned)userClientID
{
  return self->_userClientID;
}

- (void)setUserClientID:(unsigned int)a3
{
  self->_userClientID = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioa2Device);
  objc_storeStrong((id *)&self->properties, 0);
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->_lock);
}

- (id).cxx_construct
{
  return self;
}

@end