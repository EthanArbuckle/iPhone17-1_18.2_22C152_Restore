@interface JavaUtilHashtable_EntrySet
+ (const)__metadata;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilHashtable_EntrySet)initWithJavaUtilHashtable:(id)a3;
- (id)description;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilHashtable_EntrySet

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v3 = [JavaUtilHashtable_EntryIterator alloc];
  sub_100203E88((uint64_t)v3, (uint64_t)Weak);
  return v3;
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
    LOBYTE(v5) = sub_100202FFC(Weak, v8, (uint64_t)v9);
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
    LOBYTE(v5) = sub_100203128((uint64_t)Weak, v8, (uint64_t)v9);
  }
  return v5;
}

- (int)size
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak size];
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_EntrySet;
  LOBYTE(a3) = [(JavaUtilAbstractSet *)&v7 removeAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_EntrySet;
  LOBYTE(a3) = [(JavaUtilAbstractCollection *)&v7 retainAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_EntrySet;
  LOBYTE(a3) = [(JavaUtilAbstractCollection *)&v7 containsAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (BOOL)isEqual:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_EntrySet;
  LOBYTE(a3) = [(JavaUtilAbstractSet *)&v7 isEqual:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (unint64_t)hash
{
  return (int)[objc_loadWeak((id *)&self->this$0_) hash];
}

- (id)description
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_EntrySet;
  v4 = [(JavaUtilAbstractCollection *)&v6 description];
  objc_sync_exit(Weak);
  return v4;
}

- (id)toArray
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_EntrySet;
  id v4 = [(JavaUtilAbstractCollection *)&v6 toArray];
  objc_sync_exit(Weak);
  return v4;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilHashtable_EntrySet;
  id v6 = [(JavaUtilAbstractCollection *)&v8 toArrayWithNSObjectArray:a3];
  objc_sync_exit(Weak);
  return v6;
}

- (JavaUtilHashtable_EntrySet)initWithJavaUtilHashtable:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashtable_EntrySet;
  [(JavaUtilHashtable_EntrySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100442B78;
}

- (void).cxx_destruct
{
}

@end