@interface DYExtensionRegistry
+ (id)sharedExtensionRegistry;
- (DYExtensionRegistry)init;
- (id)extensionsForSlot:(id)a3;
- (void)dealloc;
- (void)registerExtension:(id)a3;
@end

@implementation DYExtensionRegistry

+ (id)sharedExtensionRegistry
{
  if (sharedExtensionRegistry_registry_once != -1) {
    dispatch_once(&sharedExtensionRegistry_registry_once, &__block_literal_global_2);
  }
  return (id)sharedExtensionRegistry_registry;
}

uint64_t __46__DYExtensionRegistry_sharedExtensionRegistry__block_invoke()
{
  uint64_t result = objc_opt_new();
  sharedExtensionRegistry_registry = result;
  return result;
}

- (DYExtensionRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)DYExtensionRegistry;
  v2 = [(DYExtensionRegistry *)&v4 init];
  if (v2)
  {
    v2->_slotsMap = (NSMutableDictionary *)objc_opt_new();
    v2->_identifiersMap = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYExtensionRegistry;
  [(DYExtensionRegistry *)&v3 dealloc];
}

- (void)registerExtension:(id)a3
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_identifiersMap, "objectForKey:", [a3 identifier]);
  if (v5)
  {
    v6 = v5;
    objc_msgSend((id)objc_msgSend(v5, "identifier"), "UTF8String");
    objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
    objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    DYLog();
  }
  else
  {
    v7 = (void *)-[NSMutableDictionary objectForKey:](self->_slotsMap, "objectForKey:", [a3 slot]);
    if (!v7)
    {
      v7 = objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](self->_slotsMap, "setObject:forKey:", v7, [a3 slot]);
    }
    [v7 addObject:a3];
    identifiersMap = self->_identifiersMap;
    uint64_t v9 = [a3 identifier];
    [(NSMutableDictionary *)identifiersMap setObject:a3 forKey:v9];
  }
}

- (id)extensionsForSlot:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_slotsMap objectForKey:a3];
}

@end