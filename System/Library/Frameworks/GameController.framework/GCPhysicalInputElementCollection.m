@interface GCPhysicalInputElementCollection
+ (id)collection;
- (GCPhysicalInputElementCollection)init;
- (NSEnumerator)elementEnumerator;
- (NSUInteger)count;
- (id)elementAtIndex:(unint64_t)a3;
- (id)elementForAlias:(id)alias;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation GCPhysicalInputElementCollection

+ (id)collection
{
  self;
  if (collection_onceToken != -1) {
    dispatch_once(&collection_onceToken, &__block_literal_global);
  }
  v0 = (void *)collection_EmptyCollection;

  return v0;
}

void __46__GCPhysicalInputElementCollection_collection__block_invoke()
{
  v0 = [_GCPhysicalInputElementCollection0 alloc];
  v1 = (void *)collection_EmptyCollection;
  collection_EmptyCollection = (uint64_t)v0;
}

- (GCPhysicalInputElementCollection)init
{
  return 0;
}

- (NSUInteger)count
{
  Class = object_getClass(self);
  Name = class_getName(Class);
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** -[%s %s]: method sent to an instance (%p) of an abstract class.  Create a concrete instance!", Name, sel_getName(a2), self);
  id v6 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v6);
}

- (id)elementAtIndex:(unint64_t)a3
{
  Class = object_getClass(self);
  Name = class_getName(Class);
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** -[%s %s]: method sent to an instance (%p) of an abstract class.  Create a concrete instance!", Name, sel_getName(a2), self);
  id v7 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v7);
}

- (id)elementForAlias:(id)alias
{
  id v5 = alias;
  Class = object_getClass(self);
  Name = class_getName(Class);
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** -[%s %s]: method sent to an instance (%p) of an abstract class.  Create a concrete instance!", Name, sel_getName(a2), self);
  id v8 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
  objc_exception_throw(v8);
}

- (NSEnumerator)elementEnumerator
{
  v2 = -[_GCPhysicalInputElementEnumerator initWithCollection:]([_GCPhysicalInputElementEnumerator alloc], self);

  return (NSEnumerator *)v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (var0 == -1) {
    return 0;
  }
  if (var0)
  {
    NSUInteger v9 = a3->var3[0];
  }
  else
  {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
    NSUInteger v9 = [(GCPhysicalInputElementCollection *)self count];
    a3->var3[0] = v9;
    unint64_t var0 = a3->var0;
  }
  if (var0 >= v9)
  {
    unint64_t result = 0;
    unint64_t v11 = -1;
  }
  else
  {
    a3->var1 = a4;
    *a4 = -[GCPhysicalInputElementCollection elementAtIndex:](self, "elementAtIndex:");
    unint64_t v11 = a3->var0 + 1;
    unint64_t result = 1;
  }
  a3->unint64_t var0 = v11;
  return result;
}

@end