@interface JavaUtilHashMap_EntrySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilHashMap_EntrySet)initWithJavaUtilHashMap:(id)a3;
- (id)iterator;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilHashMap_EntrySet

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak newEntryIterator];
}

- (BOOL)containsWithId:(id)a3
{
  unsigned int v5 = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaUtilMap_Entry_class_();
    if (!a3)
    {
      objc_loadWeak((id *)&self->this$0_);
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    id Weak = objc_loadWeak((id *)&self->this$0_);
    id v8 = [a3 getKey];
    id v9 = [a3 getValue];
    LOBYTE(v5) = sub_1001E1F90((uint64_t)Weak, v8, (uint64_t)v9);
  }
  return v5;
}

- (BOOL)removeWithId:(id)a3
{
  unsigned int v5 = [(id)JavaUtilMap_Entry_class_() isInstance:a3];
  if (v5)
  {
    v6 = (void *)JavaUtilMap_Entry_class_();
    if (!a3)
    {
      objc_loadWeak((id *)&self->this$0_);
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    id Weak = objc_loadWeak((id *)&self->this$0_);
    id v8 = [a3 getKey];
    id v9 = [a3 getValue];
    LOBYTE(v5) = sub_1001E20A8((uint64_t)Weak, v8, (uint64_t)v9);
  }
  return v5;
}

- (int)size
{
  return *((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 10);
}

- (BOOL)isEmpty
{
  return *((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 10) == 0;
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (JavaUtilHashMap_EntrySet)initWithJavaUtilHashMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashMap_EntrySet;
  [(JavaUtilHashMap_EntrySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return (unint64_t)[Weak enumerateEntriesWithState:a3 objects:a4 count:a5];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100433280;
}

- (void).cxx_destruct
{
}

@end