@interface CLSettingsManagerMock
- (CLSettingsManagerMock)init;
- (void)setSettings:(id)a3;
@end

@implementation CLSettingsManagerMock

- (CLSettingsManagerMock)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsManagerMock;
  return [(CLIntersiloService *)&v3 initWithInboundProtocol:&unk_1EF7FA080 outboundProtocol:&unk_1EF7F9850];
}

- (void)setSettings:(id)a3
{
  -[CLSettingsManagerInternal setSettingsDictionary:](self, "setSettingsDictionary:", (id)objc_msgSend(a3, "cl_deepMutableCopy"));
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", -[CLSettingsManagerInternal settingsDictionary](self, "settingsDictionary"));
  MEMORY[0x1F4181798](self, sel_updateClientsWithDictionary_);
}

@end