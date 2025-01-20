@interface JTAutoPurgeDictionary
- (BOOL)suspendPurging;
- (JTAutoPurgeDictionary)init;
- (JTAutoPurgeDictionaryDelegate)delegate;
- (id)copyOfDictionary;
- (id)description;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)highMemoryWarning;
- (void)removeAllObjects;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setSuspendPurging:(BOOL)a3;
@end

@implementation JTAutoPurgeDictionary

- (JTAutoPurgeDictionary)init
{
  v7.receiver = self;
  v7.super_class = (Class)JTAutoPurgeDictionary;
  v2 = [(JTAutoPurgeDictionary *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_highMemoryWarning name:*MEMORY[0x263F1D060] object:0];
  }
  return v2;
}

- (id)copyOfDictionary
{
  v3 = self->_dictionary;
  objc_sync_enter(v3);
  v4 = (void *)[(NSMutableDictionary *)self->_dictionary copy];
  objc_sync_exit(v3);

  return v4;
}

- (unint64_t)count
{
  v3 = self->_dictionary;
  objc_sync_enter(v3);
  unint64_t v4 = [(NSMutableDictionary *)self->_dictionary count];
  objc_sync_exit(v3);

  return v4;
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v5 = a3;
  unint64_t v4 = self->_dictionary;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_dictionary addEntriesFromDictionary:v5];
  objc_sync_exit(v4);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_super v7 = self->_dictionary;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)self->_dictionary setObject:v8 forKey:v6];
  objc_sync_exit(v7);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = self->_dictionary;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_dictionary objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)removeAllObjects
{
  obj = self->_dictionary;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_dictionary removeAllObjects];
  objc_sync_exit(obj);
}

- (id)description
{
  v3 = self->_dictionary;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_dictionary description];
  objc_sync_exit(v3);

  return v4;
}

- (void)highMemoryWarning
{
  if (![(JTAutoPurgeDictionary *)self suspendPurging])
  {
    [(JTAutoPurgeDictionary *)self removeAllObjects];
    v3 = [(JTAutoPurgeDictionary *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(JTAutoPurgeDictionary *)self delegate];
      [v5 didPurgeItems:self];
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  v4.receiver = self;
  v4.super_class = (Class)JTAutoPurgeDictionary;
  [(JTAutoPurgeDictionary *)&v4 dealloc];
}

- (BOOL)suspendPurging
{
  return self->_suspendPurging;
}

- (void)setSuspendPurging:(BOOL)a3
{
  self->_suspendPurging = a3;
}

- (JTAutoPurgeDictionaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JTAutoPurgeDictionaryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end