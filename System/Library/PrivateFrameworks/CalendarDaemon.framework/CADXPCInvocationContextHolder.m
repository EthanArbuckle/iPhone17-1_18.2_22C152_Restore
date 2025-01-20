@interface CADXPCInvocationContextHolder
- (id)proxy;
- (void)clear;
- (void)retainProxy:(id)a3 andArgumentsInInvocation:(id)a4;
@end

@implementation CADXPCInvocationContextHolder

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxy, 0);
  objc_storeStrong((id *)&self->_retainedArguments, 0);
}

- (void)clear
{
  retainedArguments = self->_retainedArguments;
  self->_retainedArguments = 0;

  id proxy = self->_proxy;
  self->_id proxy = 0;
}

- (void)retainProxy:(id)a3 andArgumentsInInvocation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong(&self->_proxy, a3);
  v9 = [v8 methodSignature];
  unint64_t v10 = [v9 numberOfArguments];
  v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10 - 2];
  retainedArguments = self->_retainedArguments;
  self->_retainedArguments = v11;

  if (v10 >= 3)
  {
    for (uint64_t i = 2; i != v10; ++i)
    {
      if (*(unsigned char *)[v9 getArgumentTypeAtIndex:i] == 64)
      {
        uint64_t v14 = 0;
        [v8 getArgument:&v14 atIndex:i];
        if (v14) {
          -[NSMutableArray addObject:](self->_retainedArguments, "addObject:");
        }
      }
    }
  }
}

- (id)proxy
{
  return self->_proxy;
}

@end