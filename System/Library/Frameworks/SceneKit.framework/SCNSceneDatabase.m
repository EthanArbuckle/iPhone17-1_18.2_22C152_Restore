@interface SCNSceneDatabase
+ (BOOL)supportsSecureCoding;
+ (id)lookUpKeyForObjectNamed:(id)a3 class:(Class)a4;
+ (id)sceneDatabase;
- (SCNSceneDatabase)init;
- (SCNSceneDatabase)initWithCoder:(id)a3;
- (void)addInstance:(id)a3 withName:(id)a4 class:(Class)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNSceneDatabase

+ (id)sceneDatabase
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (SCNSceneDatabase)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCNSceneDatabase;
  id v2 = [(SCNSceneDatabase *)&v4 init];
  if (v2) {
    v2->_db = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNSceneDatabase;
  [(SCNSceneDatabase *)&v3 dealloc];
}

+ (id)lookUpKeyForObjectNamed:(id)a3 class:(Class)a4
{
  v5 = [NSStringFromClass(a4) stringByAppendingString:@"."];

  return [(NSString *)v5 stringByAppendingString:a3];
}

- (void)addInstance:(id)a3 withName:(id)a4 class:(Class)a5
{
  uint64_t v7 = [(id)objc_opt_class() lookUpKeyForObjectNamed:a4 class:a5];
  db = self->_db;

  [(NSMutableDictionary *)db setValue:a3 forKey:v7];
}

- (SCNSceneDatabase)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNSceneDatabase;
  objc_super v4 = [(SCNSceneDatabase *)&v7 init];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 lookUpKey])
    {
      objc_msgSend(a3, "setLookUpFoundInstance:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", SCNUserInfoClasses(), objc_msgSend(a3, "lookUpKey")));
    }
    else
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SCNSceneDatabase initWithCoder:](v5);
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  db = self->_db;
  uint64_t v6 = [(NSMutableDictionary *)db countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(db);
        }
        objc_msgSend(a3, "encodeObject:forKey:", -[NSMutableDictionary valueForKey:](self->_db, "valueForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)), *(void *)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v7 = [(NSMutableDictionary *)db countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: SCNSceneDatabase is supposed to be unarchived with a SCNKeyedUnarchiver and a lookUpName set", v1, 2u);
}

@end