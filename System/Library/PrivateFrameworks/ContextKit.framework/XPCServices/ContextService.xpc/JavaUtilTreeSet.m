@interface JavaUtilTreeSet
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilTreeSet)init;
- (JavaUtilTreeSet)initWithJavaUtilCollection:(id)a3;
- (JavaUtilTreeSet)initWithJavaUtilComparator:(id)a3;
- (JavaUtilTreeSet)initWithJavaUtilNavigableMap:(id)a3;
- (JavaUtilTreeSet)initWithJavaUtilSortedSet:(id)a3;
- (id)ceilingWithId:(id)a3;
- (id)clone;
- (id)comparator;
- (id)copyWithZone:(_NSZone *)a3;
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
- (void)clear;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilTreeSet

- (JavaUtilTreeSet)initWithJavaUtilNavigableMap:(id)a3
{
  return self;
}

- (JavaUtilTreeSet)init
{
  JavaUtilAbstractSet_init(self, a2);
  v3 = new_JavaUtilTreeMap_init();
  JreStrongAssignAndConsume((id *)&self->backingMap_, v3);
  return self;
}

- (JavaUtilTreeSet)initWithJavaUtilCollection:(id)a3
{
  JavaUtilAbstractSet_init(self, a2);
  v5 = new_JavaUtilTreeMap_init();
  JreStrongAssignAndConsume((id *)&self->backingMap_, v5);
  [(JavaUtilTreeSet *)self addAllWithJavaUtilCollection:a3];
  return self;
}

- (JavaUtilTreeSet)initWithJavaUtilComparator:(id)a3
{
  return self;
}

- (JavaUtilTreeSet)initWithJavaUtilSortedSet:(id)a3
{
  return self;
}

- (BOOL)addWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return [(JavaUtilNavigableMap *)backingMap putWithId:a3 withId:JavaLangBoolean_TRUE__] == 0;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JavaUtilTreeSet;
  return [(JavaUtilAbstractCollection *)&v4 addAllWithJavaUtilCollection:a3];
}

- (void)clear
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  [(JavaUtilNavigableMap *)backingMap clear];
}

- (id)clone
{
  v9.receiver = self;
  v9.super_class = (Class)JavaUtilTreeSet;
  v3 = [(JavaUtilTreeSet *)&v9 clone];
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_13:
  }
    JreThrowClassCastException();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v3)
    {
      v7 = new_JavaUtilTreeMap_initWithJavaUtilSortedMap_(self->backingMap_);
      JreStrongAssignAndConsume(v3 + 1, v7);
      return v3;
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  if (!v3) {
    goto LABEL_14;
  }
  backingMap = self->backingMap_;
  objc_opt_class();
  if (!backingMap) {
    goto LABEL_14;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  id v5 = [(JavaUtilNavigableMap *)backingMap clone];
  v6 = (void *)JavaUtilNavigableMap_class_();
  if (v5)
  {
    if (![v6 isInstance:v5]) {
      goto LABEL_13;
    }
  }
  JreStrongAssign(v3 + 1, v5);
  return v3;
}

- (id)comparator
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap comparator];
}

- (BOOL)containsWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap containsKeyWithId:a3];
}

- (BOOL)isEmpty
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap isEmpty];
}

- (id)iterator
{
  backingMap = self->backingMap_;
  if (!backingMap || (id v3 = [(JavaUtilNavigableMap *)backingMap keySet]) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 iterator];
}

- (id)descendingIterator
{
  id v2 = [(JavaUtilTreeSet *)self descendingSet];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 iterator];
}

- (BOOL)removeWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap removeWithId:a3] != 0;
}

- (int)size
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap size];
}

- (id)first
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap firstKey];
}

- (id)last
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap lastKey];
}

- (id)pollFirst
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilNavigableMap *)backingMap pollFirstEntry];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)pollLast
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilNavigableMap *)backingMap pollLastEntry];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)higherWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap higherKeyWithId:a3];
}

- (id)lowerWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap lowerKeyWithId:a3];
}

- (id)ceilingWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap ceilingKeyWithId:a3];
}

- (id)floorWithId:(id)a3
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilNavigableMap *)backingMap floorKeyWithId:a3];
}

- (id)descendingSet
{
  p_descendingSet = &self->descendingSet_;
  if (self->descendingSet_) {
    return self->descendingSet_;
  }
  backingMap = self->backingMap_;
  if (!backingMap) {
    JreThrowNullPointerException();
  }
  id v5 = new_JavaUtilTreeSet_initWithJavaUtilNavigableMap_([(JavaUtilNavigableMap *)backingMap descendingMap]);
  return JreStrongAssignAndConsume((id *)p_descendingSet, v5);
}

- (id)subSetWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    goto LABEL_11;
  }
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = [(JavaUtilNavigableMap *)backingMap comparator];
  if (v12)
  {
    int v13 = [v12 compareWithId:a3 withId:a5];
    goto LABEL_7;
  }
  v14 = (void *)JavaLangComparable_class_();
  if (!a3) {
LABEL_11:
  }
    JreThrowNullPointerException();
  if (([v14 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  int v13 = [a3 compareToWithId:a5];
LABEL_7:
  if (v13 > 0)
  {
    v17 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v17);
  }
  v15 = new_JavaUtilTreeSet_initWithJavaUtilNavigableMap_([(JavaUtilNavigableMap *)self->backingMap_ subMapWithId:a3 withBoolean:v10 withId:a5 withBoolean:v8]);
  return v15;
}

- (id)headSetWithId:(id)a3 withBoolean:(BOOL)a4
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    goto LABEL_10;
  }
  BOOL v6 = a4;
  id v8 = [(JavaUtilNavigableMap *)backingMap comparator];
  if (v8)
  {
    [v8 compareWithId:a3 withId:a3];
    goto LABEL_7;
  }
  objc_super v9 = (void *)JavaLangComparable_class_();
  if (!a3) {
LABEL_10:
  }
    JreThrowNullPointerException();
  if (([v9 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  [a3 compareToWithId:a3];
LABEL_7:
  BOOL v10 = new_JavaUtilTreeSet_initWithJavaUtilNavigableMap_([(JavaUtilNavigableMap *)self->backingMap_ headMapWithId:a3 withBoolean:v6]);
  return v10;
}

- (id)tailSetWithId:(id)a3 withBoolean:(BOOL)a4
{
  backingMap = self->backingMap_;
  if (!backingMap) {
    goto LABEL_10;
  }
  BOOL v6 = a4;
  id v8 = [(JavaUtilNavigableMap *)backingMap comparator];
  if (v8)
  {
    [v8 compareWithId:a3 withId:a3];
    goto LABEL_7;
  }
  objc_super v9 = (void *)JavaLangComparable_class_();
  if (!a3) {
LABEL_10:
  }
    JreThrowNullPointerException();
  if (([v9 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  [a3 compareToWithId:a3];
LABEL_7:
  BOOL v10 = new_JavaUtilTreeSet_initWithJavaUtilNavigableMap_([(JavaUtilNavigableMap *)self->backingMap_ tailMapWithId:a3 withBoolean:v6]);
  return v10;
}

- (id)subSetWithId:(id)a3 withId:(id)a4
{
  return [(JavaUtilTreeSet *)self subSetWithId:a3 withBoolean:1 withId:a4 withBoolean:0];
}

- (id)headSetWithId:(id)a3
{
  return [(JavaUtilTreeSet *)self headSetWithId:a3 withBoolean:0];
}

- (id)tailSetWithId:(id)a3
{
  return [(JavaUtilTreeSet *)self tailSetWithId:a3 withBoolean:1];
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_9;
  }
  [a3 defaultWriteObject];
  backingMap = self->backingMap_;
  if (!backingMap) {
    goto LABEL_9;
  }
  objc_msgSend(a3, "writeObjectWithId:", -[JavaUtilNavigableMap comparator](backingMap, "comparator"));
  id v6 = [(JavaUtilNavigableMap *)self->backingMap_ size];
  [a3 writeIntWithInt:v6];
  if ((int)v6 < 1) {
    return;
  }
  id v7 = [(JavaUtilNavigableMap *)self->backingMap_ keySet];
  if (!v7 || (id v8 = [v7 iterator]) == 0) {
LABEL_9:
  }
    JreThrowNullPointerException();
  objc_super v9 = v8;
  if ([v8 hasNext])
  {
    do
      objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(v9, "next"));
    while (([v9 hasNext] & 1) != 0);
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  id v5 = [a3 readObject];
  id v6 = (void *)JavaUtilComparator_class_();
  if (v5 && ([v6 isInstance:v5] & 1) == 0) {
    JreThrowClassCastException();
  }
  id v7 = new_JavaUtilTreeMap_initWithJavaUtilComparator_(v5);
  int v8 = [a3 readInt];
  if (v8 >= 1)
  {
    int v9 = v8;
    do
    {
      id v10 = [a3 readObject];
      if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      [(JavaUtilTreeMap *)v7 putWithId:v10 withId:JavaLangBoolean_TRUE__];
      --v9;
    }
    while (v9);
  }
  JreStrongAssign((id *)&self->backingMap_, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeSet;
  [(JavaUtilTreeSet *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v9 = (id)a3->var3[4];
  if (!v9)
  {
    id v9 = [(JavaUtilNavigableMap *)self->backingMap_ keySet];
    a3->var3[4] = (unint64_t)v9;
  }
  return (unint64_t)[v9 countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilTreeSet *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100403D30;
}

@end