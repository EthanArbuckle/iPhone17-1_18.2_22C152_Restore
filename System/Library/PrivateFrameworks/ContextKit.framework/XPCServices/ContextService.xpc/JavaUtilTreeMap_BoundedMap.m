@interface JavaUtilTreeMap_BoundedMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isInBoundsWithId:(id)a3;
- (BOOL)isInBoundsWithId:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5;
- (JavaUtilTreeMap_BoundedMap)initWithJavaUtilTreeMap:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withJavaUtilTreeMap_BoundEnum:(id)a6 withId:(id)a7 withJavaUtilTreeMap_BoundEnum:(id)a8;
- (id)boundWithJavaUtilTreeMap_Node:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5;
- (id)ceilingEntryWithId:(id)a3;
- (id)ceilingKeyWithId:(id)a3;
- (id)comparator;
- (id)descendingKeySet;
- (id)descendingMap;
- (id)endpointWithBoolean:(BOOL)a3;
- (id)entrySet;
- (id)findBoundedWithId:(id)a3 withJavaUtilTreeMap_RelationEnum:(id)a4;
- (id)firstEntry;
- (id)firstKey;
- (id)floorEntryWithId:(id)a3;
- (id)floorKeyWithId:(id)a3;
- (id)getWithId:(id)a3;
- (id)headMapWithId:(id)a3;
- (id)headMapWithId:(id)a3 withBoolean:(BOOL)a4;
- (id)higherEntryWithId:(id)a3;
- (id)higherKeyWithId:(id)a3;
- (id)keySet;
- (id)lastEntry;
- (id)lastKey;
- (id)lowerEntryWithId:(id)a3;
- (id)lowerKeyWithId:(id)a3;
- (id)navigableKeySet;
- (id)outOfBoundsWithId:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5;
- (id)pollFirstEntry;
- (id)pollLastEntry;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)subMapWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6;
- (id)subMapWithId:(id)a3 withId:(id)a4;
- (id)subMapWithId:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withId:(id)a5 withJavaUtilTreeMap_BoundEnum:(id)a6;
- (id)tailMapWithId:(id)a3;
- (id)tailMapWithId:(id)a3 withBoolean:(BOOL)a4;
- (id)values;
- (id)writeReplace;
- (int)size;
- (void)dealloc;
@end

@implementation JavaUtilTreeMap_BoundedMap

- (JavaUtilTreeMap_BoundedMap)initWithJavaUtilTreeMap:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withJavaUtilTreeMap_BoundEnum:(id)a6 withId:(id)a7 withJavaUtilTreeMap_BoundEnum:(id)a8
{
  return self;
}

- (int)size
{
  id v2 = [(JavaUtilTreeMap_BoundedMap *)self entrySet];
  if (!v2) {
    JreThrowNullPointerException();
  }
  id v3 = [v2 iterator];
  return JavaUtilTreeMap_countWithJavaUtilIterator_(v3);
}

- (BOOL)isEmpty
{
  return sub_1001EB060((uint64_t)self, 1) == 0;
}

- (id)getWithId:(id)a3
{
  if (!sub_1001EB5F4(self, (uint64_t)a3, (uint64_t)self->fromBound_, (uint64_t)self->toBound_)) {
    return 0;
  }
  v5 = self->this$0_;
  return [(JavaUtilTreeMap *)v5 getWithId:a3];
}

- (BOOL)containsKeyWithId:(id)a3
{
  int v5 = sub_1001EB5F4(self, (uint64_t)a3, (uint64_t)self->fromBound_, (uint64_t)self->toBound_);
  if (v5)
  {
    v6 = self->this$0_;
    LOBYTE(v5) = [(JavaUtilTreeMap *)v6 containsKeyWithId:a3];
  }
  return v5;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  if ((sub_1001EB5F4(self, (uint64_t)a3, (uint64_t)self->fromBound_, (uint64_t)self->toBound_) & 1) == 0)
  {
    v9 = sub_1001EB49C((uint64_t)self, a3, self->fromBound_, self->toBound_);
    objc_exception_throw(v9);
  }
  v7 = self->this$0_;
  return [(JavaUtilTreeMap *)v7 putInternalWithId:a3 withId:a4];
}

- (id)removeWithId:(id)a3
{
  if (!sub_1001EB5F4(self, (uint64_t)a3, (uint64_t)self->fromBound_, (uint64_t)self->toBound_)) {
    return 0;
  }
  int v5 = self->this$0_;
  return [(JavaUtilTreeMap *)v5 removeWithId:a3];
}

- (BOOL)isInBoundsWithId:(id)a3
{
  return sub_1001EB5F4(self, (uint64_t)a3, (uint64_t)self->fromBound_, (uint64_t)self->toBound_);
}

- (BOOL)isInBoundsWithId:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5
{
  return sub_1001EB5F4(self, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (id)boundWithJavaUtilTreeMap_Node:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5
{
  if (!a3) {
    return 0;
  }
  if (sub_1001EB5F4(self, (uint64_t)[a3 getKey], (uint64_t)a4, (uint64_t)a5)) {
    return a3;
  }
  return 0;
}

- (id)firstEntry
{
  id result = sub_1001EB060((uint64_t)self, 1);
  if (result)
  {
    id v3 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v3;
  }
  return result;
}

- (id)pollFirstEntry
{
  id result = sub_1001EB060((uint64_t)self, 1);
  if (result)
  {
    id v4 = result;
    [(JavaUtilTreeMap *)self->this$0_ removeInternalWithJavaUtilTreeMap_Node:result];
    int v5 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(v4);
    return v5;
  }
  return result;
}

- (id)firstKey
{
  id v2 = sub_1001EB060((uint64_t)self, 1);
  if (!v2)
  {
    id v4 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v4);
  }
  return [v2 getKey];
}

- (id)lastEntry
{
  id result = sub_1001EB060((uint64_t)self, 0);
  if (result)
  {
    id v3 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v3;
  }
  return result;
}

- (id)pollLastEntry
{
  id result = sub_1001EB060((uint64_t)self, 0);
  if (result)
  {
    id v4 = result;
    [(JavaUtilTreeMap *)self->this$0_ removeInternalWithJavaUtilTreeMap_Node:result];
    int v5 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(v4);
    return v5;
  }
  return result;
}

- (id)lastKey
{
  id v2 = sub_1001EB060((uint64_t)self, 0);
  if (!v2)
  {
    id v4 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v4);
  }
  return [v2 getKey];
}

- (id)endpointWithBoolean:(BOOL)a3
{
  return sub_1001EB060((uint64_t)self, a3);
}

- (id)findBoundedWithId:(id)a3 withJavaUtilTreeMap_RelationEnum:(id)a4
{
  return sub_1001EBA00((uint64_t)self, (uint64_t)a3, a4);
}

- (id)lowerEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)JavaUtilTreeMap_RelationEnum_values_[0]);
  if (result)
  {
    v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)lowerKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)JavaUtilTreeMap_RelationEnum_values_[0]);
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)floorEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)qword_100563EE8);
  if (result)
  {
    v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)floorKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)qword_100563EE8);
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)ceilingEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)qword_100563F00);
  if (result)
  {
    v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)ceilingKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)qword_100563F00);
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)higherEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)qword_100563F08);
  if (result)
  {
    v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)higherKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = sub_1001EBA00((uint64_t)self, (uint64_t)a3, (void *)qword_100563F08);
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)comparator
{
  id result = [(JavaUtilTreeMap *)self->this$0_ comparator];
  if (!self->ascending_)
  {
    return JavaUtilCollections_reverseOrderWithJavaUtilComparator_(result);
  }
  return result;
}

- (id)entrySet
{
  p_entrySet = &self->entrySet_;
  if (self->entrySet_) {
    return self->entrySet_;
  }
  id v4 = new_JavaUtilTreeMap_BoundedMap_BoundedEntrySet_initWithJavaUtilTreeMap_BoundedMap_(self);
  return JreStrongAssignAndConsume((id *)p_entrySet, v4);
}

- (id)keySet
{
  return [(JavaUtilTreeMap_BoundedMap *)self navigableKeySet];
}

- (id)navigableKeySet
{
  p_keySet_BoundedMap = &self->keySet_BoundedMap_;
  if (self->keySet_BoundedMap_) {
    return self->keySet_BoundedMap_;
  }
  id v4 = new_JavaUtilTreeMap_BoundedMap_BoundedKeySet_initWithJavaUtilTreeMap_BoundedMap_(self);
  return JreStrongAssignAndConsume((id *)p_keySet_BoundedMap, v4);
}

- (id)values
{
  p_valuesCollection_BoundedMap = &self->valuesCollection_BoundedMap_;
  if (self->valuesCollection_BoundedMap_) {
    return self->valuesCollection_BoundedMap_;
  }
  id v4 = new_JavaUtilTreeMap_BoundedMap_BoundedValuesCollection_initWithJavaUtilTreeMap_BoundedMap_(self);
  return JreStrongAssignAndConsume((id *)p_valuesCollection_BoundedMap, v4);
}

- (id)descendingMap
{
  id v2 = self->this$0_;
  char v3 = !self->ascending_;
  id from = self->from_;
  fromBound = self->fromBound_;
  id to = self->to_;
  toBound = self->toBound_;
  v8 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v8, v2, v3, from, fromBound, to, toBound);
  return v8;
}

- (id)descendingKeySet
{
  id v2 = self->this$0_;
  char v3 = !self->ascending_;
  id from = self->from_;
  fromBound = self->fromBound_;
  id to = self->to_;
  toBound = self->toBound_;
  v8 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v8, v2, v3, from, fromBound, to, toBound);
  v9 = v8;
  return [(JavaUtilTreeMap_BoundedMap *)v9 navigableKeySet];
}

- (id)subMapWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v11 = JavaUtilTreeMap_BoundEnum_values_[0];
  uint64_t v12 = qword_100563F18;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v8) {
    v13 = (void *)v11;
  }
  else {
    v13 = (void *)v12;
  }
  v14 = &qword_100563F18;
  if (v6) {
    v14 = JavaUtilTreeMap_BoundEnum_values_;
  }
  v15 = (void *)*v14;
  return sub_1001EC6DC((uint64_t)self, a3, v13, a5, v15);
}

- (id)subMapWithId:(id)a3 withId:(id)a4
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v7 = (void *)JavaUtilTreeMap_BoundEnum_values_[0];
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v8 = (void *)qword_100563F18;
  return sub_1001EC6DC((uint64_t)self, a3, v7, a4, v8);
}

- (id)headMapWithId:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = JavaUtilTreeMap_BoundEnum_values_[0];
  uint64_t v8 = qword_100563F18;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v4) {
    v9 = (void *)v7;
  }
  else {
    v9 = (void *)v8;
  }
  v10 = (void *)qword_100563F20;
  return sub_1001EC6DC((uint64_t)self, 0, v10, a3, v9);
}

- (id)headMapWithId:(id)a3
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  int v5 = (void *)qword_100563F20;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v6 = (void *)qword_100563F18;
  return sub_1001EC6DC((uint64_t)self, 0, v5, a3, v6);
}

- (id)tailMapWithId:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = JavaUtilTreeMap_BoundEnum_values_[0];
  uint64_t v8 = qword_100563F18;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v4) {
    v9 = (void *)v7;
  }
  else {
    v9 = (void *)v8;
  }
  v10 = (void *)qword_100563F20;
  return sub_1001EC6DC((uint64_t)self, a3, v9, 0, v10);
}

- (id)tailMapWithId:(id)a3
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  int v5 = (void *)JavaUtilTreeMap_BoundEnum_values_[0];
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v6 = (void *)qword_100563F20;
  return sub_1001EC6DC((uint64_t)self, a3, v5, 0, v6);
}

- (id)subMapWithId:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withId:(id)a5 withJavaUtilTreeMap_BoundEnum:(id)a6
{
  return sub_1001EC6DC((uint64_t)self, a3, a4, a5, a6);
}

- (id)outOfBoundsWithId:(id)a3 withJavaUtilTreeMap_BoundEnum:(id)a4 withJavaUtilTreeMap_BoundEnum:(id)a5
{
  return sub_1001EB49C((uint64_t)self, a3, a4, a5);
}

- (id)writeReplace
{
  id v2 = self->this$0_;
  id from = self->from_;
  fromBound = self->fromBound_;
  id to = self->to_;
  toBound = self->toBound_;
  if (self->ascending_) {
    uint64_t v7 = off_1003F0F40;
  }
  else {
    uint64_t v7 = &off_1003F0F48;
  }
  id v8 = objc_alloc(*v7);
  JavaUtilTreeMap_NavigableSubMap_initWithJavaUtilTreeMap_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v8, v2, from, (uint64_t)fromBound, to, (uint64_t)toBound);
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap_BoundedMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100437DD8;
}

@end