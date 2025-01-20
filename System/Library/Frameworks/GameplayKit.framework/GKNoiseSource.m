@interface GKNoiseSource
- (double)valueAt:(GKNoiseSource *)self;
- (id)cloneModule;
- (id)inputModuleAtIndex:(int)a3;
- (int)requiredInputModuleCount;
- (void)setInputModule:(id)a3 atIndex:(int)a4;
@end

@implementation GKNoiseSource

- (int)requiredInputModuleCount
{
  return 0;
}

- (double)valueAt:(GKNoiseSource *)self
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
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  id v8 = [v5 stringWithFormat:@"Unexpected call on instance of class %@ to method %@", v6, v7];
  id v9 = [v4 exceptionWithName:*MEMORY[0x263EFF498] reason:v8 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v9);
}

- (void)setInputModule:(id)a3 atIndex:(int)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x263EFF940];
  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(a2);
  v10 = [v7 stringWithFormat:@"Unexpected call on instance of class %@ to method %@", v8, v9];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v11);
}

- (id)cloneModule
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  v7 = [v4 stringWithFormat:@"Derived class %@ must override %@", v5, v6];
  id v8 = [v3 exceptionWithName:*MEMORY[0x263EFF498] reason:v7 userInfo:MEMORY[0x263EFFA78]];

  objc_exception_throw(v8);
}

@end