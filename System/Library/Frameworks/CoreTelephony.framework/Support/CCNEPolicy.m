@interface CCNEPolicy
- (CCNEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5;
@end

@implementation CCNEPolicy

- (CCNEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CCNEPolicy;
  v10 = [(CCNEPolicy *)&v18 init];
  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = [v9 objectEnumerator];
    v13 = 0;
    while (1)
    {
      uint64_t v14 = [v12 nextObject];

      if (!v14) {
        break;
      }
      v13 = (void *)v14;
      [v11 addObject:*(void *)(v14 + 8)];
    }
    v15 = (NEPolicy *)[objc_alloc((Class)NEPolicy) initWithOrder:v6 result:v8[1] conditions:v11];
    policy = v10->policy;
    v10->policy = v15;
  }
  return v10;
}

- (void).cxx_destruct
{
}

@end