@interface EFPriorityDesignator
+ (EFPriorityDesignator)currentDesignator;
+ (id)currentDesignatorIfExists;
+ (id)currentDesignatorStack;
+ (id)currentDesignatorStackIfExists;
+ (id)installNewDesignator;
+ (id)pushNewDesignator;
+ (void)destroyCurrentDesignator;
- (unint64_t)priority;
- (void)setPriority:(unint64_t)a3;
@end

@implementation EFPriorityDesignator

- (unint64_t)priority
{
  return self->_priority;
}

+ (id)currentDesignatorIfExists
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKeyedSubscript:@"EFThreadPriorityDesignator"];

  return v4;
}

+ (void)destroyCurrentDesignator
{
  v3 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v3 threadDictionary];

  [v7 removeObjectForKey:@"EFThreadPriorityDesignator"];
  v4 = [a1 currentDesignatorStackIfExists];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 lastObject];
    [v7 setObject:v6 forKeyedSubscript:@"EFThreadPriorityDesignator"];

    [v5 removeLastObject];
    if (![v5 count]) {
      [v7 setObject:0 forKeyedSubscript:@"EFThreadPriorityDesignatorStack"];
    }
  }
}

+ (id)currentDesignatorStackIfExists
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKeyedSubscript:@"EFThreadPriorityDesignatorStack"];

  return v4;
}

+ (EFPriorityDesignator)currentDesignator
{
  v3 = [a1 currentDesignatorIfExists];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 installNewDesignator];
  }
  v6 = v5;

  return (EFPriorityDesignator *)v6;
}

+ (id)installNewDesignator
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x1E4F29060] currentThread];
  v4 = [v3 threadDictionary];

  [v4 setObject:v2 forKeyedSubscript:@"EFThreadPriorityDesignator"];
  return v2;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

+ (id)currentDesignatorStack
{
  id v2 = [a1 currentDesignatorStackIfExists];
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F29060] currentThread];
    v4 = [v3 threadDictionary];

    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v4 setObject:v2 forKeyedSubscript:@"EFThreadPriorityDesignatorStack"];
  }
  return v2;
}

+ (id)pushNewDesignator
{
  v3 = [a1 currentDesignatorIfExists];
  if (v3)
  {
    v4 = [a1 currentDesignatorStack];
    [v4 addObject:v3];

    id v5 = [a1 installNewDesignator];
  }
  else
  {
    id v5 = [a1 currentDesignator];
  }
  return v5;
}

@end