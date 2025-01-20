@interface CUEnvironment
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CUEnvironment

- (void).cxx_destruct
{
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  id v8 = v11;
  if (v11 && !v7->_objects)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objects = v7->_objects;
    v7->_objects = v9;

    id v8 = v11;
  }
  [(NSMutableDictionary *)v7->_objects setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_objects objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v11 = NSPrintF((uint64_t)"%@: %##@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  return v11;
}

@end