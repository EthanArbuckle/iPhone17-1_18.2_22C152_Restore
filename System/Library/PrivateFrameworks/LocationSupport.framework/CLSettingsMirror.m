@interface CLSettingsMirror
- (BOOL)valid;
- (CLIntersiloUniverse)universe;
- (CLSettingsManagerProtocol)manager;
- (id)initInUniverse:(id)a3;
- (id)settingsChangeHandler;
- (void)dealloc;
- (void)didUpdateSettings:(id)a3;
- (void)invalidate;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setInt:(int)a3 forKey:(id)a4;
- (void)setLong:(int64_t)a3 forKey:(id)a4;
- (void)setManager:(id)a3;
- (void)setSettingsChangeHandler:(id)a3;
- (void)setShort:(signed __int16)a3 forKey:(id)a4;
- (void)setUniverse:(id)a3;
- (void)setValid:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CLSettingsMirror

- (id)initInUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSettingsMirror;
  v4 = [(CLSettingsMirror *)&v7 init];
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
  {
    [(CLSettingsMirror *)v4 setValid:1];
    [p_isa setUniverse:a3];
    objc_msgSend(p_isa, "setManager:", objc_msgSend((id)objc_msgSend(p_isa[5], "vendor"), "proxyForService:", @"CLSettingsManager"));
    objc_msgSend(p_isa[4], "registerDelegate:inSilo:", p_isa, objc_msgSend(p_isa[5], "silo"));
    objc_msgSend(p_isa, "setDictionary:", objc_msgSend(p_isa[4], "syncgetSettingsAndRegisterForUpdates:", p_isa));
  }
  return p_isa;
}

- (void)invalidate
{
  [(CLSettingsManagerProtocol *)self->_manager unregisterForUpdates:self];
  [(CLSettingsMirror *)self setValid:0];
  [(CLSettingsMirror *)self setManager:0];
  [(CLSettingsMirror *)self setUniverse:0];
  MEMORY[0x1F4181798](self, sel_setSettingsChangeHandler_);
}

- (void)dealloc
{
  [(CLSettingsMirror *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsMirror;
  [(CLSettingsDictionary *)&v3 dealloc];
}

- (void)didUpdateSettings:(id)a3
{
  [(CLSettingsDictionary *)self setDictionary:a3];
  id settingsChangeHandler = self->_settingsChangeHandler;
  if (settingsChangeHandler)
  {
    v5 = (void (*)(void))*((void *)settingsChangeHandler + 2);
    v5();
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v5 = [(CLSettingsManagerProtocol *)[(CLSettingsMirror *)self manager] syncgetSetValue:a3 forKey:a4 withoutNotifying:self];
  if (v5)
  {
    [(CLSettingsDictionary *)self setDictionary:v5];
  }
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(CLSettingsMirror *)self setValue:v6 forKey:a4];
}

- (void)setShort:(signed __int16)a3 forKey:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithShort:a3];
  [(CLSettingsMirror *)self setValue:v6 forKey:a4];
}

- (void)setInt:(int)a3 forKey:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  [(CLSettingsMirror *)self setValue:v6 forKey:a4];
}

- (void)setLong:(int64_t)a3 forKey:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithLong:a3];
  [(CLSettingsMirror *)self setValue:v6 forKey:a4];
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithFloat:");
  [(CLSettingsMirror *)self setValue:v6 forKey:a4];
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(CLSettingsMirror *)self setValue:v6 forKey:a4];
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (id)settingsChangeHandler
{
  return self->_settingsChangeHandler;
}

- (void)setSettingsChangeHandler:(id)a3
{
}

- (CLSettingsManagerProtocol)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
}

@end