@interface JavaUtilHashMap_Values
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (JavaUtilHashMap_Values)initWithJavaUtilHashMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilHashMap_Values

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak newValueIterator];
}

- (int)size
{
  return *((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 10);
}

- (BOOL)isEmpty
{
  return *((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 10) == 0;
}

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak containsValueWithId:a3];
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (JavaUtilHashMap_Values)initWithJavaUtilHashMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractCollection_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashMap_Values;
  [(JavaUtilHashMap_Values *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result = (unint64_t)[objc_loadWeak((id *)&self->this$0_) enumerateEntriesWithState:a3 objects:a4 count:a5];
  var1 = a3->var1;
  v8 = &var1[result];
  while (var1 < v8)
  {
    id *var1 = (id)*((void *)*var1 + 2);
    ++var1;
  }
  return result;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100433088;
}

- (void).cxx_destruct
{
}

@end