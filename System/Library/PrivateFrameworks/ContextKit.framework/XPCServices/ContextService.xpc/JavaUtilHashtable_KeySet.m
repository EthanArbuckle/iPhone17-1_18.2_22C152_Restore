@interface JavaUtilHashtable_KeySet
+ (const)__metadata;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilHashtable_KeySet)initWithJavaUtilHashtable:(id)a3;
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

@implementation JavaUtilHashtable_KeySet

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v3 = [JavaUtilHashtable_KeyIterator alloc];
  sub_100203E88((uint64_t)v3, (uint64_t)Weak);
  return v3;
}

- (int)size
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak size];
}

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak containsKeyWithId:a3];
}

- (BOOL)removeWithId:(id)a3
{
  v4 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  int v6 = *((_DWORD *)objc_loadWeak((id *)v4) + 4);
  [objc_loadWeak((id *)v4) removeWithId:a3];
  LOBYTE(v4) = *((_DWORD *)objc_loadWeak((id *)v4) + 4) != v6;
  objc_sync_exit(Weak);
  return (char)v4;
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
  v7.super_class = (Class)JavaUtilHashtable_KeySet;
  LOBYTE(a3) = [(JavaUtilAbstractSet *)&v7 removeAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_KeySet;
  LOBYTE(a3) = [(JavaUtilAbstractCollection *)&v7 retainAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_KeySet;
  LOBYTE(a3) = [(JavaUtilAbstractCollection *)&v7 containsAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (BOOL)isEqual:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_KeySet;
  LOBYTE(a3) = [(JavaUtilAbstractSet *)&v7 isEqual:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (unint64_t)hash
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_KeySet;
  unint64_t v4 = (int)[(JavaUtilAbstractSet *)&v6 hash];
  objc_sync_exit(Weak);
  return v4;
}

- (id)description
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_KeySet;
  unint64_t v4 = [(JavaUtilAbstractCollection *)&v6 description];
  objc_sync_exit(Weak);
  return v4;
}

- (id)toArray
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_KeySet;
  id v4 = [(JavaUtilAbstractCollection *)&v6 toArray];
  objc_sync_exit(Weak);
  return v4;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilHashtable_KeySet;
  id v6 = [(JavaUtilAbstractCollection *)&v8 toArrayWithNSObjectArray:a3];
  objc_sync_exit(Weak);
  return v6;
}

- (JavaUtilHashtable_KeySet)initWithJavaUtilHashtable:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashtable_KeySet;
  [(JavaUtilHashtable_KeySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004425D8;
}

- (void).cxx_destruct
{
}

@end