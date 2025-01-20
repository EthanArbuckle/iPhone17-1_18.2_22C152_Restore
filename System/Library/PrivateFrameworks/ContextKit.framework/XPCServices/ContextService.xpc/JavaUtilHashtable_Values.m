@interface JavaUtilHashtable_Values
+ (const)__metadata;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilHashtable_Values)initWithJavaUtilHashtable:(id)a3;
- (id)description;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilHashtable_Values

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v3 = [JavaUtilHashtable_ValueIterator alloc];
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
  return [Weak containsValueWithId:a3];
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilHashtable_Values;
  LOBYTE(a3) = [(JavaUtilAbstractCollection *)&v7 containsAllWithJavaUtilCollection:a3];
  objc_sync_exit(Weak);
  return (char)a3;
}

- (id)description
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_Values;
  v4 = [(JavaUtilAbstractCollection *)&v6 description];
  objc_sync_exit(Weak);
  return v4;
}

- (id)toArray
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable_Values;
  id v4 = [(JavaUtilAbstractCollection *)&v6 toArray];
  objc_sync_exit(Weak);
  return v4;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  objc_sync_enter(Weak);
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilHashtable_Values;
  id v6 = [(JavaUtilAbstractCollection *)&v8 toArrayWithNSObjectArray:a3];
  objc_sync_exit(Weak);
  return v6;
}

- (JavaUtilHashtable_Values)initWithJavaUtilHashtable:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractCollection_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashtable_Values;
  [(JavaUtilHashtable_Values *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100442830;
}

- (void).cxx_destruct
{
}

@end