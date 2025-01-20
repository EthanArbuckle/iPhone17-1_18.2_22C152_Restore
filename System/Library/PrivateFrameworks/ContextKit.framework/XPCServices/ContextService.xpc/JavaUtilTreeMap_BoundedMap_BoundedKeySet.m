@interface JavaUtilTreeMap_BoundedMap_BoundedKeySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilTreeMap_BoundedMap_BoundedKeySet)initWithJavaUtilTreeMap_BoundedMap:(id)a3;
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
@end

@implementation JavaUtilTreeMap_BoundedMap_BoundedKeySet

- (int)size
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak size];
}

- (BOOL)isEmpty
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak isEmpty];
}

- (id)iterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v4 = sub_1001EB060((uint64_t)Weak, 1);
  v5 = [JavaUtilTreeMap_BoundedMap_BoundedKeySet__1 alloc];
  sub_1001EDF94((uint64_t)v5, (id *)&self->super.super.super.isa, v4);
  return v5;
}

- (id)descendingIterator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  v4 = sub_1001EB060((uint64_t)Weak, 0);
  v5 = [JavaUtilTreeMap_BoundedMap_BoundedKeySet__2 alloc];
  sub_1001EE0F4((uint64_t)v5, (id *)&self->super.super.super.isa, v4);
  return v5;
}

- (BOOL)containsWithId:(id)a3
{
  v4 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  int v6 = sub_1001EB5F4(Weak, (uint64_t)a3, Weak[6], Weak[8]);
  if (v6) {
    LOBYTE(v6) = [*((id *)objc_loadWeak((id *)v4) + 3) findByObjectWithId:a3] != 0;
  }
  return v6;
}

- (BOOL)removeWithId:(id)a3
{
  v4 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  int v6 = sub_1001EB5F4(Weak, (uint64_t)a3, Weak[6], Weak[8]);
  if (v6) {
    LOBYTE(v6) = [*((id *)objc_loadWeak((id *)v4) + 3) removeInternalByKeyWithId:a3] != 0;
  }
  return v6;
}

- (id)first
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak firstKey];
}

- (id)pollFirst
{
  id result = [objc_loadWeak((id *)&self->this$0_) pollFirstEntry];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)last
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak lastKey];
}

- (id)pollLast
{
  id result = [objc_loadWeak((id *)&self->this$0_) pollLastEntry];
  if (result)
  {
    return [result getKey];
  }
  return result;
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

- (id)comparator
{
  id Weak = objc_loadWeak((id *)&self->this$0_);
  return [Weak comparator];
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
  id v4 = [objc_loadWeak((id *)&self->this$0_) subMapWithId:a3 withId:a4];
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
  id v3 = [objc_loadWeak((id *)&self->this$0_) headMapWithId:a3];
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
  id v3 = [objc_loadWeak((id *)&self->this$0_) tailMapWithId:a3];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 navigableKeySet];
}

- (id)descendingSet
{
  v2 = &self->this$0_;
  id v3 = (void *)*(objc_loadWeak((id *)&self->this$0_) + 3);
  char v4 = *((unsigned char *)objc_loadWeak((id *)v2) + 32) == 0;
  v5 = (void *)*(objc_loadWeak((id *)v2) + 5);
  id v6 = (void *)*(objc_loadWeak((id *)v2) + 6);
  v7 = (void *)*(objc_loadWeak((id *)v2) + 7);
  v8 = (void *)*(objc_loadWeak((id *)v2) + 8);
  v9 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v9, v3, v4, v5, v6, v7, v8);
  v10 = v9;
  return [(JavaUtilTreeMap_BoundedMap *)v10 navigableKeySet];
}

- (JavaUtilTreeMap_BoundedMap_BoundedKeySet)initWithJavaUtilTreeMap_BoundedMap:(id)a3
{
  objc_storeWeak((id *)&self->this$0_, a3);
  JavaUtilAbstractSet_init(self, v4);
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap_BoundedKeySet;
  [(JavaUtilTreeMap_BoundedMap_BoundedKeySet *)&v3 __javaClone];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = &self->this$0_;
  id Weak = objc_loadWeak((id *)&self->this$0_);
  if (!a3->var0)
  {
    v10 = Weak;
    a3->var3[1] = (unint64_t)[Weak endpointWithBoolean:1];
    a3->var3[2] = (unint64_t)[v10 endpointWithBoolean:0];
  }
  uint64_t v11 = *(objc_loadWeak((id *)v8) + 3);
  int v12 = *((unsigned __int8 *)objc_loadWeak((id *)v8) + 32);
  return sub_1001E9AA8(v11, a3, (uint64_t)a4, a5, 1, v12);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004386E8;
}

- (void).cxx_destruct
{
}

@end