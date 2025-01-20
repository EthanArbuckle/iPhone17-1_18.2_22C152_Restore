@interface JavaUtilTreeMap_KeySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilTreeMap_KeySet)initWithJavaUtilTreeMap:(id)a3;
- (id)ceilingWithId:(id)a3;
- (id)comparator;
- (id)descendingIterator;
- (id)descendingSet;
- (id)first;
- (id)floorWithId:(id)a3;
- (id)headSetWithId:(id)a3;
- (id)headSetWithId:(id)a3 withBoolean:(BOOL)a4;
- (id)higherWithId:(id)a3;
- (id)iterator;
- (id)last;
- (id)lowerWithId:(id)a3;
- (id)pollFirst;
- (id)pollLast;
- (id)subSetWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6;
- (id)subSetWithId:(id)a3 withId:(id)a4;
- (id)tailSetWithId:(id)a3;
- (id)tailSetWithId:(id)a3 withBoolean:(BOOL)a4;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__javaClone;
- (void)clear;
@end

@implementation JavaUtilTreeMap_KeySet

- (int)size
{
  return *((_DWORD *)objc_loadWeak((id *)&self->this$0_) + 10);
}

- (id)iterator
{
  v3 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 4);
  if (v3) {
    id v4 = [v3 first];
  }
  else {
    id v4 = 0;
  }
  v5 = [JavaUtilTreeMap_KeySet__1 alloc];
  sub_1001EA59C((uint64_t)v5, (uint64_t)self, v4);
  return v5;
}

- (id)descendingIterator
{
  v3 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 4);
  if (v3) {
    id v4 = [v3 last];
  }
  else {
    id v4 = 0;
  }
  v5 = [JavaUtilTreeMap_KeySet__2 alloc];
  sub_1001EA59C((uint64_t)v5, (uint64_t)self, v4);
  return v5;
}

- (BOOL)containsWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak containsKeyWithId:a3];
}

- (BOOL)removeWithId:(id)a3
{
  return [objc_loadWeak((id *)&self->this$0_) removeInternalByKeyWithId:a3] != 0;
}

- (void)clear
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  [Weak clear];
}

- (id)comparator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak comparator];
}

- (id)first
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak firstKey];
}

- (id)last
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak lastKey];
}

- (id)lowerWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak lowerKeyWithId:a3];
}

- (id)floorWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak floorKeyWithId:a3];
}

- (id)ceilingWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak ceilingKeyWithId:a3];
}

- (id)higherWithId:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak higherKeyWithId:a3];
}

- (id)pollFirst
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v3 = (void *)Weak[4];
  if (!v3) {
    return 0;
  }
  id v4 = [v3 first];
  objc_msgSend(Weak, "removeInternalWithJavaUtilTreeMap_Node:", v4);
  if (!v4) {
    return 0;
  }
  return [v4 getKey];
}

- (id)pollLast
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v3 = (void *)Weak[4];
  if (!v3) {
    return 0;
  }
  id v4 = [v3 last];
  objc_msgSend(Weak, "removeInternalWithJavaUtilTreeMap_Node:", v4);
  if (!v4) {
    return 0;
  }
  return [v4 getKey];
}

- (id)subSetWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6
{
  id v6 = [objc_loadWeak((id *)&self->this$0_) subMapWithId:a3 withBoolean:a4 withId:a5 withBoolean:a6];
  if (!v6) {
    JreThrowNullPointerException();
  }
  return [v6 navigableKeySet];
}

- (id)subSetWithId:(id)a3 withId:(id)a4
{
  id v4 = [objc_loadWeak((id *)&self->this$0_) subMapWithId:a3 withBoolean:1 withId:a4 withBoolean:0];
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 navigableKeySet];
}

- (id)headSetWithId:(id)a3 withBoolean:(BOOL)a4
{
  id v4 = [objc_loadWeak((id *)&self->this$0_) headMapWithId:a3 withBoolean:a4];
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 navigableKeySet];
}

- (id)headSetWithId:(id)a3
{
  id v3 = [objc_loadWeak((id *)&self->this$0_) headMapWithId:a3 withBoolean:0];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 navigableKeySet];
}

- (id)tailSetWithId:(id)a3 withBoolean:(BOOL)a4
{
  id v4 = [objc_loadWeak((id *)&self->this$0_) tailMapWithId:a3 withBoolean:a4];
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 navigableKeySet];
}

- (id)tailSetWithId:(id)a3
{
  id v3 = [objc_loadWeak((id *)&self->this$0_) tailMapWithId:a3 withBoolean:1];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 navigableKeySet];
}

- (id)descendingSet
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v3 = (void *)qword_100563F20;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v4 = (void *)qword_100563F20;
  v5 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v5, Weak, 0, 0, v3, 0, v4);
  id v6 = v5;
  return [(JavaUtilTreeMap_BoundedMap *)v6 navigableKeySet];
}

- (JavaUtilTreeMap_KeySet)initWithJavaUtilTreeMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_KeySet;
  [(JavaUtilTreeMap_KeySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  if (!a3->var0)
  {
    v10 = Weak;
    a3->var3[1] = (unint64_t)[Weak firstNode];
    a3->var3[2] = (unint64_t)[v10 lastNode];
  }
  id v11 = objc_loadWeak((id *)v8);
  return sub_1001E9AA8((uint64_t)v11, a3, (uint64_t)a4, a5, 1, 1);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100436BB0;
}

- (void).cxx_destruct
{
}

@end