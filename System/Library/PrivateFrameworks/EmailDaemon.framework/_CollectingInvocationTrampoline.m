@interface _CollectingInvocationTrampoline
- (BOOL)respondsToSelector:(SEL)a3;
- (_CollectingInvocationTrampoline)initWithCollection:(id)a3 allMustMatch:(BOOL)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation _CollectingInvocationTrampoline

- (_CollectingInvocationTrampoline)initWithCollection:(id)a3 allMustMatch:(BOOL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CollectingInvocationTrampoline;
  v8 = [(_CollectingInvocationTrampoline *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_collection, a3);
    v9->_allMustMatch = a4;
    memset(v13, 0, sizeof(v13));
    v10 = v9->_collection;
    if ([(NSFastEnumeration *)v10 countByEnumeratingWithState:v13 objects:v15 count:16])
    {
      objc_storeStrong(&v9->_first, *(id *)v13[0].super_class);
    }

    v11 = v9;
  }

  return v9;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = self;
  v7.receiver = self;
  v7.super_class = (Class)_CollectingInvocationTrampoline;
  if (!-[_CollectingInvocationTrampoline respondsToSelector:](&v7, "respondsToSelector:")) {
    v4 = (_CollectingInvocationTrampoline *)v4->_first;
  }
  v5 = [(_CollectingInvocationTrampoline *)v4 methodSignatureForSelector:a3];

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CollectingInvocationTrampoline;
  if (-[_CollectingInvocationTrampoline respondsToSelector:](&v5, "respondsToSelector:")) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  char allMustMatch = self->_allMustMatch;
  char v15 = allMustMatch;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_collection;
  id v7 = [(NSFastEnumeration *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        [v4 invokeWithTarget:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        char v10 = -86;
        [v4 getReturnValue:&v10];
        if (self->_allMustMatch) {
          allMustMatch &= v10;
        }
        else {
          allMustMatch |= v10;
        }
        char v15 = allMustMatch;
      }
      id v7 = [(NSFastEnumeration *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }

  [v4 setReturnValue:&v15];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);

  objc_storeStrong(&self->_first, 0);
}

@end