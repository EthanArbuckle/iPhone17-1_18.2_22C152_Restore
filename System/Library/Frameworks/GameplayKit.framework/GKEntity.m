@interface GKEntity
+ (BOOL)supportsSecureCoding;
+ (GKEntity)entity;
- (GKComponent)componentForClass:(Class)componentClass;
- (GKEntity)init;
- (GKEntity)initWithCoder:(id)a3;
- (NSArray)components;
- (id)componentForKey:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addComponent:(GKComponent *)component;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeComponent:(id)a3;
- (void)removeComponentForClass:(Class)componentClass;
- (void)updateWithDeltaTime:(NSTimeInterval)seconds;
@end

@implementation GKEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(NSMutableDictionary *)self->_components allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 componentSystem];
        v10 = v9;
        if (v9)
        {
          [v9 removeComponentWithEntity:self];
          [v8 setEntity:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)GKEntity;
  [(GKEntity *)&v11 dealloc];
}

+ (GKEntity)entity
{
  id v2 = objc_alloc_init((Class)a1);

  return (GKEntity *)v2;
}

- (GKEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKEntity;
  id v2 = [(GKEntity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    components = v2->_components;
    v2->_components = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (GKEntity)initWithCoder:(id)a3
{
  v23[12] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(GKEntity *)self init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v23[5] = objc_opt_class();
    v23[6] = objc_opt_class();
    v23[7] = objc_opt_class();
    v23[8] = objc_opt_class();
    v23[9] = objc_opt_class();
    v23[10] = objc_opt_class();
    v23[11] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:12];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    v9 = [v4 decodeObjectOfClasses:v6 forKey:@"_components"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          components = v5->_components;
          v16 = [v14 componentName];
          [(NSMutableDictionary *)components setObject:v14 forKey:v16];

          [v14 setEntity:v5];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  components = self->_components;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)components allValues];
  [v4 encodeObject:v5 forKey:@"_components"];
}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableDictionary *)self->_components objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 == v7)
        {
          v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v9 usesPerComponentUpdate]) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v4);
          v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v9 usesPerComponentUpdate]) {
            continue;
          }
        }
        [v9 updateWithDeltaTime:seconds];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (NSArray)components
{
  return (NSArray *)[(NSMutableDictionary *)self->_components allValues];
}

- (void)addComponent:(GKComponent *)component
{
  components = self->_components;
  uint64_t v6 = component;
  uint64_t v5 = [(GKComponent *)v6 componentName];
  [(NSMutableDictionary *)components setObject:v6 forKey:v5];

  [(GKComponent *)v6 setEntity:self];
  [(GKComponent *)v6 didAddToEntity];
}

- (void)removeComponentForClass:(Class)componentClass
{
  NSStringFromClass(componentClass);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = -[NSMutableDictionary objectForKey:](self->_components, "objectForKey:");
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 willRemoveFromEntity];
    [(NSMutableDictionary *)self->_components removeObjectForKey:v6];
    [v5 setEntity:0];
  }
}

- (GKComponent)componentForClass:(Class)componentClass
{
  components = self->_components;
  id v4 = NSStringFromClass(componentClass);
  uint64_t v5 = [(NSMutableDictionary *)components objectForKey:v4];

  return (GKComponent *)v5;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x237DF7AF0](self, a2);

  return [(GKEntity *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

- (void).cxx_destruct
{
}

- (void)removeComponent:(id)a3
{
  components = self->_components;
  id v5 = a3;
  id v4 = [v5 componentName];
  [(NSMutableDictionary *)components removeObjectForKey:v4];

  [v5 setEntity:0];
}

- (id)componentForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_components objectForKey:a3];
}

@end