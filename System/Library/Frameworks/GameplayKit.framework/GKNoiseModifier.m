@interface GKNoiseModifier
- (GKNoiseModifier)init;
- (GKNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (double)valueAt:(GKNoiseModifier *)self;
- (id)cloneModule;
- (id)inputModuleAtIndex:(int)a3;
- (int)requiredInputModuleCount;
- (void)setInputModule:(id)a3 atIndex:(int)a4;
@end

@implementation GKNoiseModifier

- (GKNoiseModifier)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Unexpected call on instance of class %@ to method %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

- (GKNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKNoiseModifier;
  v4 = [(GKNoiseModifier *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
    inputModules = v4->_inputModules;
    v4->_inputModules = (NSMutableArray *)v5;
  }
  return v4;
}

- (int)requiredInputModuleCount
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Derived class %@ must override %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

- (double)valueAt:(GKNoiseModifier *)self
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Derived class %@ must override %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

- (id)inputModuleAtIndex:(int)a3
{
  return (id)[(NSMutableArray *)self->_inputModules objectAtIndexedSubscript:a3];
}

- (void)setInputModule:(id)a3 atIndex:(int)a4
{
}

- (id)cloneModule
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Derived class %@ must override %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

- (void).cxx_destruct
{
}

@end