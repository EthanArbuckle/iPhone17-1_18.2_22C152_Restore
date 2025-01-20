@interface CLSettingsManagerInternal
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (NSMutableDictionary)settingsDictionary;
- (NSMutableSet)clients;
- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5;
- (id)syncgetSettingsAndRegisterForUpdates:(id)a3;
- (void)beginService;
- (void)endService;
- (void)setClients:(id)a3;
- (void)setSettingsDictionary:(id)a3;
- (void)unregisterForUpdates:(id)a3;
- (void)updateClientsWithDictionary:(id)a3;
@end

@implementation CLSettingsManagerInternal

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < [a3 count]) {
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1EB30CEB8 != -1) {
    dispatch_once(&qword_1EB30CEB8, &unk_1EF7F4EE0);
  }
  return (id)qword_1EB30CEB0;
}

- (void)beginService
{
  -[CLSettingsManagerInternal setClients:](self, "setClients:", [MEMORY[0x1E4F1CA80] set]);
  [(CLSettingsManagerInternal *)self setSettingsDictionary:0];
}

- (void)endService
{
  [(CLSettingsManagerInternal *)self setSettingsDictionary:0];
  [(CLSettingsManagerInternal *)self setClients:0];
}

- (void)unregisterForUpdates:(id)a3
{
}

- (id)syncgetSettingsAndRegisterForUpdates:(id)a3
{
  [(NSMutableSet *)self->_clients addObject:a3];
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  settingsDictionary = self->_settingsDictionary;
  return (id)[v4 dictionaryWithDictionary:settingsDictionary];
}

- (void)updateClientsWithDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __assert_rtn("-[CLSettingsManagerInternal updateClientsWithDictionary:]", "CLSettingsManagerInternal.m", 52, "![dictionary isKindOfClass:[NSMutableDictionary class]]");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  clients = self->_clients;
  uint64_t v6 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(clients);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) didUpdateSettings:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)syncgetSetValue:(id)a3 forKey:(id)a4 withoutNotifying:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_settingsDictionary setValue:a3 forKey:a4];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_settingsDictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  clients = self->_clients;
  uint64_t v9 = [(NSMutableSet *)clients countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(clients);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8 * v12);
        if (v13 != a5) {
          [v13 didUpdateSettings:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)clients countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v7;
}

- (NSMutableSet)clients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClients:(id)a3
{
}

- (NSMutableDictionary)settingsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSettingsDictionary:(id)a3
{
}

@end