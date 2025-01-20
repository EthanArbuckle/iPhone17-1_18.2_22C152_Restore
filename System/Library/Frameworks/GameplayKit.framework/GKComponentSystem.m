@interface GKComponentSystem
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)componentClass;
- (GKComponentSystem)initWithComponentClass:(Class)cls;
- (NSArray)components;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addComponent:(id)component;
- (void)addComponentWithEntity:(GKEntity *)entity;
- (void)forwardInvocation:(id)a3;
- (void)removeComponent:(id)component;
- (void)removeComponentWithEntity:(GKEntity *)entity;
- (void)updateWithDeltaTime:(NSTimeInterval)seconds;
@end

@implementation GKComponentSystem

- (GKComponentSystem)initWithComponentClass:(Class)cls
{
  v7.receiver = self;
  v7.super_class = (Class)GKComponentSystem;
  v4 = [(GKComponentSystem *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_componentClass, cls);
  }
  return v5;
}

- (NSArray)components
{
  return (NSArray *)self->_components;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_components countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  return (id)[(NSMutableArray *)self->_components objectAtIndexedSubscript:idx];
}

- (void)addComponent:(id)component
{
  v16[1] = *MEMORY[0x263EF8340];
  id v13 = component;
  uint64_t v4 = objc_opt_class();
  Class componentClass = self->_componentClass;
  if ((Class)v4 != componentClass)
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    v15 = @"supportedClass";
    v16[0] = componentClass;
    v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [v9 exceptionWithName:v10 reason:@"component class is not supported by this system" userInfo:v11];

    objc_exception_throw(v12);
  }
  [v13 setUsesPerComponentUpdate:1];
  components = self->_components;
  if (!components)
  {
    objc_super v7 = (NSMutableArray *)objc_opt_new();
    v8 = self->_components;
    self->_components = v7;

    components = self->_components;
  }
  -[NSMutableArray addObject:](components, "addObject:", v13, v13);
  [v14 setComponentSystem:self];
}

- (void)addComponentWithEntity:(GKEntity *)entity
{
  uint64_t v4 = [(GKEntity *)entity componentForClass:self->_componentClass];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(GKComponentSystem *)self addComponent:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)removeComponentWithEntity:(GKEntity *)entity
{
  uint64_t v4 = [(GKEntity *)entity componentForClass:self->_componentClass];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(GKComponentSystem *)self removeComponent:v4];
    uint64_t v5 = v6;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)removeComponent:(id)component
{
  id v4 = component;
  if (-[NSMutableArray containsObject:](self->_components, "containsObject:"))
  {
    [(NSMutableArray *)self->_components removeObject:v4];
    [v4 setComponentSystem:0];
  }
}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_components;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "updateWithDeltaTime:", seconds, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(objc_class *)self->_componentClass instancesRespondToSelector:a3])
  {
    uint64_t v7 = (void (*)(void, SEL, id))[(objc_class *)self->_componentClass instanceMethodForSelector:a3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_components;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v7(*(void *)(*((void *)&v16 + 1) + 8 * i), a3, v6);
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    id v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GKComponentSystem;
    id v13 = [(GKComponentSystem *)&v15 performSelector:a3 withObject:v6];
  }

  return v13;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKComponentSystem;
  if (-[GKComponentSystem respondsToSelector:](&v6, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return [(objc_class *)self->_componentClass instancesRespondToSelector:a3];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if ([(NSMutableArray *)self->_components count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_components objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 methodSignatureForSelector:a3];

    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableArray *)self->_components count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = self->_components;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 invokeWithTarget:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKComponentSystem;
    [(GKComponentSystem *)&v10 forwardInvocation:v4];
  }
}

- (Class)componentClass
{
  return self->_componentClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentClass, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

@end