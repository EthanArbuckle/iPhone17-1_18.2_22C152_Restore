@interface NSMemoryStoreEqualityPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation NSMemoryStoreEqualityPredicateOperator

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSMemoryStoreEqualityPredicateOperator;
  [(NSMemoryStoreEqualityPredicateOperator *)&v3 dealloc];
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a3 = (id)[a3 objectID];
    context = self->_context;
    if (context)
    {
      v8 = (id *)*((void *)context->_additionalPrivateIvars + 1);
      if (v8)
      {
        v9 = (void *)[*v8 objectForKey:a3];
        if (v9) {
          a3 = v9;
        }
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = (id)[a4 objectID];
    v10 = self->_context;
    if (v10)
    {
      v11 = (id *)*((void *)v10->_additionalPrivateIvars + 1);
      if (v11)
      {
        v12 = (void *)[*v11 objectForKey:a3];
        if (v12) {
          a3 = v12;
        }
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)NSMemoryStoreEqualityPredicateOperator;
  return [(NSEqualityPredicateOperator *)&v14 performPrimitiveOperationUsingObject:a3 andObject:a4];
}

- (void)setContext:(id)a3
{
  context = self->_context;
  if (context != a3)
  {

    self->_context = (NSManagedObjectContext *)a3;
  }
}

@end