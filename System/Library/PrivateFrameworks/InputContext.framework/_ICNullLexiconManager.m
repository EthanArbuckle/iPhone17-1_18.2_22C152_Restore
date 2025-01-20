@interface _ICNullLexiconManager
- (_ICNullLexiconManager)init;
- (id)addContactObserver:(id)a3;
- (id)addNamedEntitiesUpdateObserver:(id)a3;
- (id)loadLexicons;
- (id)loadLexicons:(id)a3;
- (id)loadLexiconsUsingFilter:(id)a3;
- (id)test_loadLexicons;
- (void)removeContactObserver:(id)a3;
@end

@implementation _ICNullLexiconManager

- (_ICNullLexiconManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ICNullLexiconManager;
  v2 = [(_ICNullLexiconManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    contactObservers = v2->_contactObservers;
    v2->_contactObservers = v3;
  }
  return v2;
}

- (id)addContactObserver:(id)a3
{
  v4 = (void *)[a3 copy];
  contactObservers = self->_contactObservers;
  objc_super v6 = (void *)MEMORY[0x237DDFA40]();
  [(NSMutableArray *)contactObservers addObject:v6];

  v7 = (void *)MEMORY[0x237DDFA40](v4);
  return v7;
}

- (void)removeContactObserver:(id)a3
{
  contactObservers = self->_contactObservers;
  id v4 = (id)MEMORY[0x237DDFA40](a3, a2);
  [(NSMutableArray *)contactObservers removeObject:v4];
}

- (id)addNamedEntitiesUpdateObserver:(id)a3
{
  v3 = (void *)[a3 copy];
  return v3;
}

- (id)loadLexicons:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)loadLexiconsUsingFilter:(id)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)loadLexicons
{
  return (id)MEMORY[0x263EFFA68];
}

- (void).cxx_destruct
{
}

- (id)test_loadLexicons
{
  return (id)MEMORY[0x263EFFA68];
}

@end