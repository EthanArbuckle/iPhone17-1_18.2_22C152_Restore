@interface CLSettingsManager
- (CLSettingsManager)init;
- (id)notificationObserver;
- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5;
- (void)beginService;
- (void)endService;
- (void)refresh;
- (void)setNotificationObserver:(id)a3;
@end

@implementation CLSettingsManager

- (CLSettingsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsManager;
  return [(CLIntersiloService *)&v3 initWithInboundProtocol:&unk_1EF7FA010 outboundProtocol:&unk_1EF7F9850];
}

- (void)beginService
{
  v7.receiver = self;
  v7.super_class = (Class)CLSettingsManager;
  [(CLSettingsManagerInternal *)&v7 beginService];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  objc_msgSend(v3, "setUnderlyingQueue:", -[CLSilo queue](-[CLIntersiloService silo](self, "silo"), "queue"));
  v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F28AC8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A455AAB8;
  v6[3] = &unk_1E5B3EA60;
  v6[4] = self;
  -[CLSettingsManager setNotificationObserver:](self, "setNotificationObserver:", [v4 addObserverForName:v5 object:0 queue:v3 usingBlock:v6]);

  [(CLSettingsManager *)self refresh];
}

- (void)endService
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", -[CLSettingsManager notificationObserver](self, "notificationObserver"));
  v3.receiver = self;
  v3.super_class = (Class)CLSettingsManager;
  [(CLSettingsManagerInternal *)&v3 endService];
}

- (void)refresh
{
  -[CLSettingsManagerInternal setSettingsDictionary:](self, "setSettingsDictionary:", (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "dictionaryRepresentation"), "cl_deepMutableCopy"));
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", -[CLSettingsManagerInternal settingsDictionary](self, "settingsDictionary"));
  MEMORY[0x1F4181798](self, sel_updateClientsWithDictionary_);
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "setValue:forKey:", a3, a4);
  v10.receiver = self;
  v10.super_class = (Class)CLSettingsManager;
  return [(CLSettingsManagerInternal *)&v10 syncgetSetValue:a3 forKey:a4 withoutNotifying:a5];
}

- (id)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

@end