@interface JavaUtilIdentityHashMap
+ (const)__metadata;
+ (void)initialize;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (JavaUtilIdentityHashMap)init;
- (JavaUtilIdentityHashMap)initWithInt:(int)a3;
- (JavaUtilIdentityHashMap)initWithJavaUtilMap:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entrySet;
- (id)getEntryWithId:(id)a3;
- (id)getEntryWithInt:(int)a3;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)massageValueWithId:(id)a3;
- (id)newElementArrayWithInt:(int)a3;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)rehash;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)computeElementArraySize;
- (int)findIndexWithId:(id)a3 withNSObjectArray:(id)a4;
- (int)getModuloHashWithId:(id)a3 withInt:(int)a4;
- (int)getThresholdWithInt:(int)a3;
- (int)size;
- (void)clear;
- (void)computeMaxSize;
- (void)dealloc;
- (void)putAllImplWithJavaUtilMap:(id)a3;
- (void)putAllWithJavaUtilMap:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilIdentityHashMap

- (JavaUtilIdentityHashMap)init
{
  return self;
}

- (JavaUtilIdentityHashMap)initWithInt:(int)a3
{
  return self;
}

- (int)getThresholdWithInt:(int)a3
{
  if (a3 <= 3) {
    return 3;
  }
  else {
    return a3;
  }
}

- (int)computeElementArraySize
{
  if (((10000 * self->threshold_ / 7500) & 0x40000000) != 0) {
    return -2 * (10000 * self->threshold_ / 7500);
  }
  else {
    return 2 * (10000 * self->threshold_ / 7500);
  }
}

- (id)newElementArrayWithInt:(int)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = NSObject_class_();
  return +[IOSObjectArray arrayWithLength:v3 type:v4];
}

- (JavaUtilIdentityHashMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (id)massageValueWithId:(id)a3
{
  if ((id)qword_100562730 == a3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)clear
{
  self->size_ = 0;
  elementData = self->elementData_;
  if (!elementData) {
LABEL_5:
  }
    JreThrowNullPointerException();
  uint64_t v4 = 0;
  while (v4 < elementData->super.size_)
  {
    IOSObjectArray_Set((uint64_t)elementData, v4++, 0);
    elementData = self->elementData_;
    if (!elementData) {
      goto LABEL_5;
    }
  }
  ++self->modCount_;
}

- (BOOL)containsKeyWithId:(id)a3
{
  if (a3) {
    uint64_t v4 = (IOSClass *)a3;
  }
  else {
    uint64_t v4 = (IOSClass *)qword_100562730;
  }
  uint64_t v5 = sub_10026E3E8((uint64_t)v4, (uint64_t)self->elementData_);
  elementData = self->elementData_;
  if (!elementData) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v5;
  uint64_t size = elementData->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  return (&elementData->elementType_)[(int)v7] == v4;
}

- (BOOL)containsValueWithId:(id)a3
{
  if (a3) {
    uint64_t v3 = (IOSClass *)a3;
  }
  else {
    uint64_t v3 = (IOSClass *)qword_100562730;
  }
  elementData = self->elementData_;
  if (!elementData) {
LABEL_13:
  }
    JreThrowNullPointerException();
  uint64_t v5 = 1;
  while (1)
  {
    int size = elementData->super.size_;
    if ((int)v5 >= size) {
      break;
    }
    if ((v5 & 0x80000000) != 0) {
      IOSArray_throwOutOfBoundsWithMsg(elementData->super.size_, v5);
    }
    if ((&elementData->elementType_)[(int)v5] == v3) {
      break;
    }
    uint64_t v5 = (v5 + 2);
    elementData = self->elementData_;
    if (!elementData) {
      goto LABEL_13;
    }
  }
  return (int)v5 < size;
}

- (id)getWithId:(id)a3
{
  if (a3) {
    uint64_t v4 = (IOSClass *)a3;
  }
  else {
    uint64_t v4 = (IOSClass *)qword_100562730;
  }
  uint64_t v5 = sub_10026E3E8((uint64_t)v4, (uint64_t)self->elementData_);
  elementData = self->elementData_;
  if (!elementData) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v5;
  uint64_t v8 = (int)v5;
  uint64_t size = elementData->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  if ((&elementData->elementType_)[v8] != v4) {
    return 0;
  }
  v11 = self->elementData_;
  uint64_t v12 = v11->super.size_;
  int v13 = v7 + 1;
  if ((int)v7 + 1 < 0 || v13 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v13);
  }
  if ((IOSClass *)qword_100562730 == (&v11->elementType_)[v13]) {
    return 0;
  }
  else {
    return (&v11->elementType_)[v13];
  }
}

- (id)getEntryWithId:(id)a3
{
  return sub_10026E6E4(self, (uint64_t)a3);
}

- (id)getEntryWithInt:(int)a3
{
  return sub_10026E7CC(self, *(uint64_t *)&a3);
}

- (int)findIndexWithId:(id)a3 withNSObjectArray:(id)a4
{
  return sub_10026E3E8((uint64_t)a3, (uint64_t)a4);
}

- (int)getModuloHashWithId:(id)a3 withInt:(int)a4
{
  int v5 = JavaUtilCollections_secondaryIdentityHashWithId_((uint64_t)a3);
  if (a4 >= 0) {
    int v6 = a4;
  }
  else {
    int v6 = a4 + 1;
  }
  return 2 * (v5 - (v5 & 0x7FFFFFFF) / (v6 >> 1) * (v6 >> 1));
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  uint64_t v6 = qword_100562730;
  if (a3) {
    uint64_t v7 = (IOSClass *)a3;
  }
  else {
    uint64_t v7 = (IOSClass *)qword_100562730;
  }
  uint64_t v8 = sub_10026E3E8((uint64_t)v7, (uint64_t)self->elementData_);
  elementData = self->elementData_;
  if (!elementData) {
    JreThrowNullPointerException();
  }
  uint64_t v10 = v8;
  uint64_t v11 = (int)v8;
  uint64_t size = elementData->super.size_;
  if ((v10 & 0x80000000) != 0 || (int)v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v10);
  }
  if ((&elementData->elementType_)[v11] == v7)
  {
    uint64_t v15 = (v10 + 1);
  }
  else
  {
    ++self->modCount_;
    int v13 = self->size_ + 1;
    self->size_ = v13;
    if (v13 > self->threshold_)
    {
      -[JavaUtilIdentityHashMap rehash]_0((uint64_t)self);
      int v14 = sub_10026E3E8((uint64_t)v7, (uint64_t)self->elementData_);
      uint64_t v11 = v14;
      LODWORD(v10) = v14;
    }
    IOSObjectArray_Set((uint64_t)self->elementData_, v11, v7);
    uint64_t v15 = (v10 + 1);
    IOSObjectArray_Set((uint64_t)self->elementData_, (int)v15, 0);
  }
  v16 = self->elementData_;
  if ((v15 & 0x80000000) != 0 || (int)v15 >= v16->super.size_) {
    IOSArray_throwOutOfBoundsWithMsg(v16->super.size_, v15);
  }
  if (a4) {
    id v17 = a4;
  }
  else {
    id v17 = (id)v6;
  }
  v18 = (&v16->elementType_)[(int)v15];
  IOSObjectArray_Set((uint64_t)self->elementData_, (int)v15, v17);
  if ((IOSClass *)qword_100562730 == v18) {
    return 0;
  }
  else {
    return v18;
  }
}

- (id)rehash
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    goto LABEL_18;
  }
  int v3 = 2 * *(_DWORD *)(v1 + 8);
  if (v3 <= 1) {
    int v3 = 1;
  }
  uint64_t v4 = +[IOSObjectArray arrayWithLength:v3 type:NSObject_class_()];
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(unsigned int *)(v5 + 8);
  if ((int)v6 >= 1)
  {
    int v7 = 0;
    do
    {
      int v8 = v7;
      if (v7 < 0) {
        IOSArray_throwOutOfBoundsWithMsg(v6, v7);
      }
      v9 = *(void **)(v5 + 24 + 8 * v7);
      if (v9)
      {
        int v10 = sub_10026E3E8(*(void *)(v5 + 24 + 8 * v7), (uint64_t)v4);
        if (!v4) {
          goto LABEL_18;
        }
        int v11 = v10;
        IOSObjectArray_Set((uint64_t)v4, v10, v9);
        uint64_t v12 = *(void *)(a1 + 24);
        int v13 = v8 + 1;
        uint64_t v14 = *(unsigned int *)(v12 + 8);
        if (v8 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v13);
        }
        IOSObjectArray_Set((uint64_t)v4, v11 + 1, *(void **)(v12 + 24 + 8 * (v8 + 1)));
      }
      int v7 = v8 + 2;
      uint64_t v5 = *(void *)(a1 + 24);
      uint64_t v6 = *(unsigned int *)(v5 + 8);
    }
    while (v8 + 2 < (int)v6);
  }
  id result = JreStrongAssign((id *)(a1 + 24), v4);
  uint64_t v16 = *(void *)(a1 + 24);
  if (!v16) {
LABEL_18:
  }
    JreThrowNullPointerException();
  *(_DWORD *)(a1 + 36) = 7500 * (*(_DWORD *)(v16 + 8) / 2) / 10000;
  return result;
}

- (void)putAllWithJavaUtilMap:(id)a3
{
}

- (void)computeMaxSize
{
  elementData = self->elementData_;
  if (!elementData) {
    JreThrowNullPointerException();
  }
  self->threshold_ = 7500 * (elementData->super.size_ / 2) / 10000;
}

- (id)removeWithId:(id)a3
{
  if (a3) {
    uint64_t v4 = (IOSClass *)a3;
  }
  else {
    uint64_t v4 = (IOSClass *)qword_100562730;
  }
  uint64_t v5 = sub_10026E3E8((uint64_t)v4, (uint64_t)self->elementData_);
  elementData = self->elementData_;
  if (!elementData) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v5;
  uint64_t v8 = (int)v5;
  uint64_t size = elementData->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  if ((&elementData->elementType_)[v8] != v4) {
    return 0;
  }
  int v11 = self->elementData_;
  int v12 = v11->super.size_;
  int v13 = v7 + 1;
  if ((int)v7 + 1 < 0 || v13 >= v12) {
    IOSArray_throwOutOfBoundsWithMsg(v11->super.size_, v13);
  }
  uint64_t v14 = self->elementData_;
  v29 = (&v11->elementType_)[v13];
  if (v12 >= 0) {
    int v15 = v11->super.size_;
  }
  else {
    int v15 = v12 + 1;
  }
  int v16 = v15 >> 1;
  uint64_t v17 = v11->super.size_;
  int v18 = v7;
  while (1)
  {
    int v19 = v18 + 2;
    int v18 = (v18 + 2) % v12;
    if (v18 < 0 || v18 >= (int)v17) {
      IOSArray_throwOutOfBoundsWithMsg(v17, (v19 % v12));
    }
    p_elementType = &v14->elementType_;
    v21 = (&v14->elementType_)[v18];
    if (!v21) {
      break;
    }
    int v22 = JavaUtilCollections_secondaryIdentityHashWithId_((uint64_t)p_elementType[v18]);
    int v23 = 2 * (v22 - (v22 & 0x7FFFFFFF) / v16 * v16);
    if (v18 >= (int)v7)
    {
      if (v23 > (int)v7 && v23 <= v18) {
        goto LABEL_32;
      }
    }
    else if (v23 > (int)v7 || v23 <= v18)
    {
      goto LABEL_32;
    }
    IOSObjectArray_Set((uint64_t)self->elementData_, (int)v7, v21);
    v26 = self->elementData_;
    uint64_t v27 = v26->super.size_;
    int v28 = v18 + 1;
    if (v18 + 1 < 0 || v28 >= (int)v27) {
      IOSArray_throwOutOfBoundsWithMsg(v27, v28);
    }
    IOSObjectArray_Set((uint64_t)self->elementData_, (int)v7 + 1, v26->buffer_[v18]);
    LODWORD(v7) = v18;
LABEL_32:
    uint64_t v14 = self->elementData_;
    uint64_t v17 = v14->super.size_;
  }
  --self->size_;
  ++self->modCount_;
  IOSObjectArray_Set((uint64_t)self->elementData_, (int)v7, 0);
  IOSObjectArray_Set((uint64_t)self->elementData_, (int)v7 + 1, 0);
  if ((IOSClass *)qword_100562730 == v29) {
    return 0;
  }
  else {
    return v29;
  }
}

- (id)entrySet
{
  v2 = new_JavaUtilIdentityHashMap_IdentityHashMapEntrySet_initWithJavaUtilIdentityHashMap_(self);
  return v2;
}

- (id)keySet
{
  p_keySet = &self->super.keySet_;
  keySet = self->super.keySet_;
  if (!keySet)
  {
    uint64_t v4 = new_JavaUtilIdentityHashMap_KeySet_initWithJavaUtilIdentityHashMap_(self);
    JreStrongAssignAndConsume((id *)p_keySet, v4);
    return *p_keySet;
  }
  return keySet;
}

- (id)values
{
  p_valuesCollection = &self->super.valuesCollection_;
  valuesCollection = self->super.valuesCollection_;
  if (!valuesCollection)
  {
    uint64_t v4 = new_JavaUtilIdentityHashMap_ValuesCollection_initWithJavaUtilIdentityHashMap_(self);
    JreStrongAssignAndConsume((id *)p_valuesCollection, v4);
    return *p_valuesCollection;
  }
  return valuesCollection;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    unsigned int v5 = [(id)JavaUtilMap_class_() isInstance:a3];
    if (v5)
    {
      uint64_t v6 = (void *)JavaUtilMap_class_();
      if (!a3)
      {
        [(JavaUtilIdentityHashMap *)self size];
        JreThrowNullPointerException();
      }
      if (([v6 isInstance:a3] & 1) == 0) {
        JreThrowClassCastException();
      }
      unsigned int v7 = [(JavaUtilIdentityHashMap *)self size];
      if (v7 == [a3 size])
      {
        id v8 = [(JavaUtilIdentityHashMap *)self entrySet];
        if (!v8) {
          JreThrowNullPointerException();
        }
        v9 = v8;
        id v10 = [a3 entrySet];
        LOBYTE(v5) = [v9 isEqual:v10];
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)clone
{
  v8.receiver = self;
  v8.super_class = (Class)JavaUtilIdentityHashMap;
  int v3 = [(JavaUtilAbstractMap *)&v8 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_6;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  elementData = self->elementData_;
  if (!elementData
    || (unsigned int v5 = +[IOSObjectArray arrayWithLength:elementData->super.size_ type:NSObject_class_()], JreStrongAssign(v3 + 3, v5), (v6 = self->elementData_) == 0))
  {
LABEL_6:
    JreThrowNullPointerException();
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v6, 0, v3[3], 0, v6->super.size_);
  return v3;
}

- (BOOL)isEmpty
{
  return self->size_ == 0;
}

- (int)size
{
  return self->size_;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  [a3 defaultWriteObject];
  [a3 writeIntWithInt:self->size_];
  id v5 = [(JavaUtilIdentityHashMap *)self entrySet];
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = [v5 iterator];
  if (!v6) {
    goto LABEL_10;
  }
  unsigned int v7 = v6;
  if ([v6 hasNext])
  {
    while (1)
    {
      objc_super v8 = [v7 next];
      objc_opt_class();
      if (!v8) {
        break;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      [a3 writeObjectWithId:v8[1]];
      [a3 writeObjectWithId:v8[2]];
      if (([v7 hasNext] & 1) == 0) {
        return;
      }
    }
LABEL_10:
    JreThrowNullPointerException();
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  int v5 = [a3 readInt];
  self->threshold_ = 21;
  id v6 = +[IOSObjectArray arrayWithLength:56 type:NSObject_class_()];
  JreStrongAssign((id *)&self->elementData_, v6);
  if (v5 - 1 >= 0)
  {
    int v7 = v5;
    do
    {
      -[JavaUtilIdentityHashMap putWithId:withId:](self, "putWithId:withId:", [a3 readObject], objc_msgSend(a3, "readObject"));
      --v7;
    }
    while (v7);
  }
  self->size_ = v5;
}

- (void)putAllImplWithJavaUtilMap:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ([a3 entrySet])
  {
    v5.receiver = self;
    v5.super_class = (Class)JavaUtilIdentityHashMap;
    [(JavaUtilAbstractMap *)&v5 putAllWithJavaUtilMap:a3];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIdentityHashMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilIdentityHashMap *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100562730, objc_alloc((Class)NSObject));
    atomic_store(1u, (unsigned __int8 *)&JavaUtilIdentityHashMap__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100473580;
}

@end