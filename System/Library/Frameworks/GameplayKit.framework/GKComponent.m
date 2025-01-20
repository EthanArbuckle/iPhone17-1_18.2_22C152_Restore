@interface GKComponent
+ (BOOL)supportsSecureCoding;
- (BOOL)usesPerComponentUpdate;
- (GKComponent)init;
- (GKComponent)initWithCoder:(id)a3;
- (GKComponent)initWithName:(id)a3;
- (GKComponentSystem)componentSystem;
- (GKEntity)entity;
- (NSString)componentName;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentSystem:(id)a3;
- (void)setEntity:(id)a3;
- (void)setUsesPerComponentUpdate:(BOOL)a3;
@end

@implementation GKComponent

- (GKComponent)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKComponent;
  v2 = [(GKComponent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_entity = 0;
    v2->_usesPerComponentUpdateCount = 0;
    componentSystem = v2->_componentSystem;
    v2->_componentSystem = 0;

    componentName = v3->_componentName;
    v3->_componentName = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKComponent)initWithCoder:(id)a3
{
  v32[10] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(GKComponent *)self init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v32[3] = objc_opt_class();
    v32[4] = objc_opt_class();
    v32[5] = objc_opt_class();
    v32[6] = objc_opt_class();
    v32[7] = objc_opt_class();
    v32[8] = objc_opt_class();
    v32[9] = objc_opt_class();
    objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:10];
    [v6 addObjectsFromArray:v7];

    v8 = [v4 allowedClasses];
    [v6 unionSet:v8];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_componentName"];
    componentName = v5->_componentName;
    v5->_componentName = (NSString *)v9;

    v24 = v6;
    id obj = [v4 decodeObjectOfClasses:v6 forKey:@"_propertyNames"];
    if (obj)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v26 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v28 != v26) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v15 = [v4 decodeObjectForKey:v14];
            if (v15)
            {
              id v16 = v4;
              v17 = NSString;
              v18 = [v14 substringToIndex:1];
              v19 = [v18 capitalizedString];
              [v14 substringFromIndex:1];
              v21 = v20 = v5;
              v22 = [v17 stringWithFormat:@"set%@%@:", v19, v21];

              v5 = v20;
              NSSelectorFromString(v22);
              if (objc_opt_respondsToSelector()) {
                [(GKComponent *)v20 setValue:v15 forKey:v14];
              }
              else {
                NSLog(&cfstr_CannotSetIniti.isa, v20->_componentName, v14);
              }

              id v4 = v16;
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  componentName = self->_componentName;
  if (componentName) {
    [a3 encodeObject:componentName forKey:@"_componentName"];
  }
}

- (GKEntity)entity
{
  return self->_entity;
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x237DF7AF0](self, a2);

  return [(GKComponent *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentName, 0);

  objc_storeStrong((id *)&self->_componentSystem, 0);
}

- (GKComponent)initWithName:(id)a3
{
  id v5 = a3;
  id v6 = [(GKComponent *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_componentName, a3);
  }

  return v7;
}

- (void)setEntity:(id)a3
{
  self->_entity = (GKEntity *)a3;
}

- (BOOL)usesPerComponentUpdate
{
  return self->_usesPerComponentUpdateCount != 0;
}

- (void)setUsesPerComponentUpdate:(BOOL)a3
{
  int usesPerComponentUpdateCount = self->_usesPerComponentUpdateCount;
  if (a3) {
    int v4 = usesPerComponentUpdateCount + 1;
  }
  else {
    int v4 = usesPerComponentUpdateCount - 1;
  }
  self->_int usesPerComponentUpdateCount = v4;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  componentName = self->_componentName;
  if (componentName)
  {
    uint64_t v3 = componentName;
  }
  else
  {
    id v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setComponentSystem:(id)a3
{
}

- (GKComponentSystem)componentSystem
{
  return self->_componentSystem;
}

@end