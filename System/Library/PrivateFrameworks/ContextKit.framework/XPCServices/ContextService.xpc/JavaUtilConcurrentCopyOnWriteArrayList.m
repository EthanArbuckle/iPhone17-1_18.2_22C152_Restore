@interface JavaUtilConcurrentCopyOnWriteArrayList
+ (BOOL)containsAllWithJavaUtilCollection:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (const)__metadata;
+ (int)indexOfWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int)lastIndexOfWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addIfAbsentWithId:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (JavaUtilConcurrentCopyOnWriteArrayList)init;
- (JavaUtilConcurrentCopyOnWriteArrayList)initWithJavaUtilCollection:(id)a3;
- (JavaUtilConcurrentCopyOnWriteArrayList)initWithNSObjectArray:(id)a3;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getArray;
- (id)getWithInt:(int)a3;
- (id)iterator;
- (id)listIterator;
- (id)listIteratorWithInt:(int)a3;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)subListWithInt:(int)a3 withInt:(int)a4;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)addAllAbsentWithJavaUtilCollection:(id)a3;
- (int)indexOfWithId:(id)a3;
- (int)indexOfWithId:(id)a3 withInt:(int)a4;
- (int)lastIndexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3 withInt:(int)a4;
- (int)removeOrRetainWithJavaUtilCollection:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5 withInt:(int)a6;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)__javaClone;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)removeRangeWithInt:(int)a3 withInt:(int)a4;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilConcurrentCopyOnWriteArrayList

- (JavaUtilConcurrentCopyOnWriteArrayList)init
{
  return self;
}

- (JavaUtilConcurrentCopyOnWriteArrayList)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (JavaUtilConcurrentCopyOnWriteArrayList)initWithNSObjectArray:(id)a3
{
  return self;
}

- (id)clone
{
  v5.receiver = self;
  v5.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList;
  v2 = [(JavaUtilConcurrentCopyOnWriteArrayList *)&v5 clone];
  objc_opt_class();
  if (!v2) {
    goto LABEL_5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v3 = (void *)atomic_load(v2 + 1);
  if (!v3) {
LABEL_5:
  }
    JreThrowNullPointerException();
  JreVolatileStrongAssign((atomic_ullong *)v2 + 1, [v3 clone]);
  return v2;
}

- (int)size
{
  unint64_t v2 = atomic_load((unint64_t *)&self->elements_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return *(_DWORD *)(v2 + 8);
}

- (id)getWithInt:(int)a3
{
  unint64_t v3 = atomic_load((unint64_t *)&self->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = *(unsigned int *)(v3 + 8);
  if (a3 < 0 || (int)v4 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v4, *(uint64_t *)&a3);
  }
  return *(id *)(v3 + 24 + 8 * a3);
}

- (BOOL)containsWithId:(id)a3
{
  return [(JavaUtilConcurrentCopyOnWriteArrayList *)self indexOfWithId:a3] != -1;
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  uint64_t v3 = atomic_load((unint64_t *)&self->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  int v4 = *(_DWORD *)(v3 + 8);
  return JavaUtilConcurrentCopyOnWriteArrayList_containsAllWithJavaUtilCollection_withNSObjectArray_withInt_withInt_(a3, v3, 0, v4);
}

+ (BOOL)containsAllWithJavaUtilCollection:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return JavaUtilConcurrentCopyOnWriteArrayList_containsAllWithJavaUtilCollection_withNSObjectArray_withInt_withInt_(a3, (uint64_t)a4, *(uint64_t *)&a5, a6);
}

- (int)indexOfWithId:(id)a3 withInt:(int)a4
{
  uint64_t v4 = atomic_load((unint64_t *)&self->elements_);
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(void *)&a4;
  int v7 = *(_DWORD *)(v4 + 8);
  return JavaUtilConcurrentCopyOnWriteArrayList_indexOfWithId_withNSObjectArray_withInt_withInt_(a3, v4, v6, v7);
}

- (int)indexOfWithId:(id)a3
{
  uint64_t v3 = atomic_load((unint64_t *)&self->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  int v4 = *(_DWORD *)(v3 + 8);
  return JavaUtilConcurrentCopyOnWriteArrayList_indexOfWithId_withNSObjectArray_withInt_withInt_(a3, v3, 0, v4);
}

- (int)lastIndexOfWithId:(id)a3 withInt:(int)a4
{
  uint64_t v4 = atomic_load((unint64_t *)&self->elements_);
  return JavaUtilConcurrentCopyOnWriteArrayList_lastIndexOfWithId_withNSObjectArray_withInt_withInt_(a3, v4, 0, a4);
}

- (int)lastIndexOfWithId:(id)a3
{
  uint64_t v3 = atomic_load((unint64_t *)&self->elements_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  int v4 = *(_DWORD *)(v3 + 8);
  return JavaUtilConcurrentCopyOnWriteArrayList_lastIndexOfWithId_withNSObjectArray_withInt_withInt_(a3, v3, 0, v4);
}

- (BOOL)isEmpty
{
  unint64_t v2 = atomic_load((unint64_t *)&self->elements_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return *(_DWORD *)(v2 + 8) == 0;
}

- (id)iterator
{
  unint64_t v2 = (_DWORD *)atomic_load((unint64_t *)&self->elements_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  int v3 = v2[2];
  int v4 = [JavaUtilConcurrentCopyOnWriteArrayList_CowIterator alloc];
  v4->index_ = 0;
  JreStrongAssign((id *)&v4->snapshot_, v2);
  v4->from_ = 0;
  v4->to_ = v3;
  v4->index_ = 0;
  return v4;
}

- (id)listIteratorWithInt:(int)a3
{
  v9 = (_DWORD *)atomic_load((unint64_t *)&self->elements_);
  if (a3 < 0)
  {
    if (v9)
    {
LABEL_6:
      CFStringRef v13 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"index=");
      v14 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v13);
      objc_exception_throw(v14);
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  if (!v9) {
    goto LABEL_7;
  }
  int v10 = v9[2];
  if (v10 < a3) {
    goto LABEL_6;
  }
  v11 = [JavaUtilConcurrentCopyOnWriteArrayList_CowIterator alloc];
  v11->index_ = 0;
  JreStrongAssign((id *)&v11->snapshot_, v9);
  v11->from_ = 0;
  v11->to_ = v10;
  v11->index_ = 0;
  id result = v11;
  *((_DWORD *)result + 6) = a3;
  return result;
}

- (id)listIterator
{
  unint64_t v2 = (_DWORD *)atomic_load((unint64_t *)&self->elements_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  int v3 = v2[2];
  uint64_t v4 = [JavaUtilConcurrentCopyOnWriteArrayList_CowIterator alloc];
  v4->index_ = 0;
  JreStrongAssign((id *)&v4->snapshot_, v2);
  v4->from_ = 0;
  v4->to_ = v3;
  v4->index_ = 0;
  return v4;
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  int v10 = (_DWORD *)atomic_load((unint64_t *)&self->elements_);
  if (a3 < 0 || a3 > a4)
  {
    if (v10)
    {
LABEL_9:
      CFStringRef v14 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"from=");
      v15 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v14);
      objc_exception_throw(v15);
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  if (!v10) {
    goto LABEL_10;
  }
  if (v10[2] < a4) {
    goto LABEL_9;
  }
  v12 = [JavaUtilConcurrentCopyOnWriteArrayList_CowSubList alloc];
  JavaUtilConcurrentCopyOnWriteArrayList_CowSubList_initWithJavaUtilConcurrentCopyOnWriteArrayList_withNSObjectArray_withInt_withInt_((uint64_t)v12, self, v10, a3, a4);
  return v12;
}

- (id)toArray
{
  unint64_t v2 = (void *)atomic_load((unint64_t *)&self->elements_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 clone];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  int v3 = (_DWORD *)atomic_load((unint64_t *)&self->elements_);
  if (!v3 || (uint64_t v4 = a3) == 0) {
    JreThrowNullPointerException();
  }
  signed int v5 = v3[2];
  if (v5 <= *((_DWORD *)a3 + 2))
  {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v3, 0, a3, 0, v3[2]);
    uint64_t v6 = (int)v3[2];
    if ((int)v6 < v4[2]) {
      IOSObjectArray_Set((uint64_t)v4, v6, 0);
    }
  }
  else
  {
    uint64_t v4 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_withIOSClass_(v3, v5, [a3 getClass]);
    objc_opt_class();
    if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v7 = [(id)JavaUtilList_class_() isInstance:a3];
    if (!v7) {
      return v7;
    }
    unint64_t v8 = atomic_load((unint64_t *)&self->elements_);
    v9 = (void *)JavaUtilList_class_();
    if (a3)
    {
      if (([v9 isInstance:a3] & 1) == 0) {
LABEL_23:
      }
        JreThrowClassCastException();
      id v10 = [a3 iterator];
      if (v8)
      {
        v11 = v10;
        v12 = (uint64_t *)(v8 + 24);
        unint64_t v13 = v8 + 24 + 8 * *(int *)(v8 + 8);
        while ((unint64_t)v12 < v13)
        {
          if (!v11) {
            goto LABEL_22;
          }
          uint64_t v15 = *v12++;
          uint64_t v14 = v15;
          unsigned int v7 = [v11 hasNext];
          if (!v7) {
            return v7;
          }
          if ((LibcoreUtilObjects_equalWithId_withId_(v14, (uint64_t)[v11 next]) & 1) == 0)
          {
            LOBYTE(v7) = 0;
            return v7;
          }
        }
        if (v11)
        {
          LOBYTE(v7) = [v11 hasNext] ^ 1;
          return v7;
        }
      }
    }
LABEL_22:
    JreThrowNullPointerException();
  }
  if (self == a3)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  uint64_t v5 = atomic_load((unint64_t *)&self->elements_);
  objc_opt_class();
  if (!a3) {
    goto LABEL_22;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v6 = atomic_load((unint64_t *)a3 + 1);
  LOBYTE(v7) = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_(v5, v6);
  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = atomic_load((unint64_t *)&self->elements_);
  return (int)JavaUtilArrays_hashCodeWithNSObjectArray_(v2);
}

- (NSString)description
{
  uint64_t v2 = atomic_load((unint64_t *)&self->elements_);
  return (NSString *)JavaUtilArrays_toStringWithNSObjectArray_(v2);
}

- (BOOL)addWithId:(id)a3
{
  objc_sync_enter(self);
  p_elements = (unint64_t *)&self->elements_;
  unint64_t v6 = atomic_load((unint64_t *)&self->elements_);
  if (!v6) {
    JreThrowNullPointerException();
  }
  unsigned int v7 = +[IOSObjectArray arrayWithLength:*(_DWORD *)(v6 + 8) + 1 type:NSObject_class_()];
  unint64_t v8 = (void *)atomic_load(p_elements);
  unint64_t v9 = atomic_load(p_elements);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v8, 0, v7, 0, *(unsigned int *)(v9 + 8));
  unint64_t v10 = atomic_load(p_elements);
  IOSObjectArray_Set((uint64_t)v7, *(int *)(v10 + 8), a3);
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, v7);
  objc_sync_exit(self);
  return 1;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  p_elements = (unint64_t *)&self->elements_;
  unint64_t v8 = atomic_load((unint64_t *)&self->elements_);
  if (!v8) {
    JreThrowNullPointerException();
  }
  unint64_t v9 = +[IOSObjectArray arrayWithLength:*(_DWORD *)(v8 + 8) + 1 type:NSObject_class_()];
  unint64_t v10 = (void *)atomic_load(p_elements);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v10, 0, v9, 0, v5);
  IOSObjectArray_Set((uint64_t)v9, (int)v5, a4);
  v11 = (void *)atomic_load(p_elements);
  unint64_t v12 = atomic_load(p_elements);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v11, v5, v9, (v5 + 1), (*(_DWORD *)(v12 + 8) - v5));
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, v9);
  objc_sync_exit(self);
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  objc_sync_enter(self);
  unint64_t v5 = atomic_load((unint64_t *)&self->elements_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  BOOL v6 = [(JavaUtilConcurrentCopyOnWriteArrayList *)self addAllWithInt:*(unsigned int *)(v5 + 8) withJavaUtilCollection:a3];
  objc_sync_exit(self);
  return v6;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  if (!a4) {
    JreThrowNullPointerException();
  }
  unsigned int v7 = (unsigned int *)[a4 toArray];
  p_elements = (unint64_t *)&self->elements_;
  unint64_t v9 = atomic_load((unint64_t *)&self->elements_);
  if (!v9 || (unint64_t v10 = v7) == 0) {
    JreThrowNullPointerException();
  }
  v11 = +[IOSObjectArray arrayWithLength:(int)(v7[2] + *(_DWORD *)(v9 + 8)) type:NSObject_class_()];
  unint64_t v12 = (void *)atomic_load(p_elements);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v12, 0, v11, 0, v5);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v10, 0, v11, v5, v10[2]);
  unint64_t v13 = (void *)atomic_load(p_elements);
  uint64_t v14 = v10[2] + v5;
  unint64_t v15 = atomic_load(p_elements);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v13, v5, v11, v14, (*(_DWORD *)(v15 + 8) - v5));
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, v11);
  BOOL v16 = (int)v10[2] > 0;
  objc_sync_exit(self);
  return v16;
}

- (int)addAllAbsentWithJavaUtilCollection:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = [a3 toArray];
  p_elements = (unint64_t *)&self->elements_;
  unint64_t v7 = atomic_load((unint64_t *)&self->elements_);
  if (!v7 || (unint64_t v8 = v5) == 0) {
    JreThrowNullPointerException();
  }
  unint64_t v9 = +[IOSObjectArray arrayWithLength:v5[2] + *(_DWORD *)(v7 + 8) type:NSObject_class_()];
  unint64_t v10 = (void *)atomic_load(p_elements);
  unint64_t v11 = atomic_load(p_elements);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v10, 0, v9, 0, *(unsigned int *)(v11 + 8));
  unint64_t v12 = (void **)(v8 + 6);
  uint64_t v13 = (int)v8[2];
  unint64_t v14 = (unint64_t)&v8[2 * v13 + 6];
  if ((unint64_t)(v8 + 6) >= v14)
  {
    int v15 = 0;
  }
  else
  {
    int v15 = 0;
    do
    {
      v17 = *v12++;
      BOOL v16 = v17;
      unint64_t v18 = atomic_load(p_elements);
      if (JavaUtilConcurrentCopyOnWriteArrayList_indexOfWithId_withNSObjectArray_withInt_withInt_(v17, (uint64_t)v9, 0, *(_DWORD *)(v18 + 8) + v15) == -1)
      {
        unint64_t v19 = atomic_load(p_elements);
        IOSObjectArray_Set((uint64_t)v9, *(_DWORD *)(v19 + 8) + v15++, v16);
      }
    }
    while ((unint64_t)v12 < v14);
    LODWORD(v13) = v8[2];
  }
  if (v15 < (int)v13)
  {
    unint64_t v20 = atomic_load(p_elements);
    unint64_t v9 = JavaUtilArrays_copyOfRangeWithNSObjectArray_withInt_withInt_(v9, 0, *(_DWORD *)(v20 + 8) + v15);
  }
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, v9);
  objc_sync_exit(self);
  return v15;
}

- (BOOL)addIfAbsentWithId:(id)a3
{
  objc_sync_enter(self);
  unsigned __int8 v5 = [(JavaUtilConcurrentCopyOnWriteArrayList *)self containsWithId:a3];
  if ((v5 & 1) == 0) {
    [(JavaUtilConcurrentCopyOnWriteArrayList *)self addWithId:a3];
  }
  objc_sync_exit(self);
  return v5 ^ 1;
}

- (void)clear
{
  objc_sync_enter(self);
  if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, (void *)LibcoreUtilEmptyArray_OBJECT_);
  objc_sync_exit(self);
}

- (id)removeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  unint64_t v5 = atomic_load((unint64_t *)&self->elements_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(unsigned int *)(v5 + 8);
  if ((v3 & 0x80000000) != 0 || (int)v6 <= (int)v3) {
    IOSArray_throwOutOfBoundsWithMsg(v6, v3);
  }
  unint64_t v7 = *(void **)(v5 + 24 + 8 * (int)v3);
  sub_100296C1C((uint64_t)self, v3, (v3 + 1));
  objc_sync_exit(self);
  return v7;
}

- (BOOL)removeWithId:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = [(JavaUtilConcurrentCopyOnWriteArrayList *)self indexOfWithId:a3];
  if (v5 != -1) {
    [(JavaUtilConcurrentCopyOnWriteArrayList *)self removeWithInt:v5];
  }
  objc_sync_exit(self);
  return v5 != -1;
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  objc_sync_enter(self);
  unint64_t v5 = atomic_load((unint64_t *)&self->elements_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  BOOL v6 = sub_100296DEC((uint64_t)self, a3, 0, 0, *(unsigned int *)(v5 + 8)) != 0;
  objc_sync_exit(self);
  return v6;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  objc_sync_enter(self);
  unint64_t v5 = atomic_load((unint64_t *)&self->elements_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  BOOL v6 = sub_100296DEC((uint64_t)self, a3, 1, 0, *(unsigned int *)(v5 + 8)) != 0;
  objc_sync_exit(self);
  return v6;
}

- (int)removeOrRetainWithJavaUtilCollection:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_100296DEC((uint64_t)self, a3, a4, a5, *(uint64_t *)&a6);
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  objc_sync_enter(self);
  unint64_t v7 = (void *)atomic_load((unint64_t *)&self->elements_);
  if (!v7) {
    JreThrowNullPointerException();
  }
  unint64_t v8 = (unsigned int *)[v7 clone];
  unint64_t v9 = v8;
  if (!v8) {
    JreThrowNullPointerException();
  }
  uint64_t v10 = v8[2];
  if ((v5 & 0x80000000) != 0 || (int)v10 <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v5);
  }
  uint64_t v11 = (int)v5;
  unint64_t v12 = (void *)v9[(int)v5 + 3];
  IOSObjectArray_Set((uint64_t)v9, v11, a4);
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, v9);
  objc_sync_exit(self);
  return v12;
}

- (void)removeRangeWithInt:(int)a3 withInt:(int)a4
{
}

+ (int)lastIndexOfWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return JavaUtilConcurrentCopyOnWriteArrayList_lastIndexOfWithId_withNSObjectArray_withInt_withInt_(a3, (uint64_t)a4, a5, a6);
}

+ (int)indexOfWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return JavaUtilConcurrentCopyOnWriteArrayList_indexOfWithId_withNSObjectArray_withInt_withInt_(a3, (uint64_t)a4, *(uint64_t *)&a5, a6);
}

- (id)getArray
{
  return (id)atomic_load((unint64_t *)&self->elements_);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  unint64_t v3 = atomic_load((unint64_t *)&self->elements_);
  if (!a3 || ([a3 defaultWriteObject], !v3)) {
    JreThrowNullPointerException();
  }
  [a3 writeIntWithInt:*(unsigned int *)(v3 + 8)];
  uint64_t v5 = (uint64_t *)(v3 + 24);
  unint64_t v6 = v3 + 24 + 8 * *(int *)(v3 + 8);
  while ((unint64_t)v5 < v6)
  {
    uint64_t v7 = *v5++;
    [a3 writeObjectWithId:v7];
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  uint64_t v5 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)[a3 readInt], NSObject_class_());
  if (v5->super.size_ >= 1)
  {
    uint64_t v6 = 0;
    do
      IOSObjectArray_Set((uint64_t)v5, v6++, [a3 readObject]);
    while (v6 < v5->super.size_);
  }
  JreVolatileStrongAssign((atomic_ullong *)&self->elements_, v5);
  objc_sync_exit(self);
}

- (void)dealloc
{
  JreReleaseVolatile(&self->elements_);
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList;
  [(JavaUtilConcurrentCopyOnWriteArrayList *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList;
  [(JavaUtilConcurrentCopyOnWriteArrayList *)&v3 __javaClone];
  JreRetainVolatile(&self->elements_);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilConcurrentCopyOnWriteArrayList *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100486698;
}

@end