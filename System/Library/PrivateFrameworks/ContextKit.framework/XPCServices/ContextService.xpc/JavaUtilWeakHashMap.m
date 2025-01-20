@interface JavaUtilWeakHashMap
+ (const)__metadata;
+ (id)newEntryArrayWithInt:(int)a3;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (JavaUtilWeakHashMap)init;
- (JavaUtilWeakHashMap)initWithInt:(int)a3;
- (JavaUtilWeakHashMap)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilWeakHashMap)initWithJavaUtilMap:(id)a3;
- (id)entrySet;
- (id)getEntryWithId:(id)a3;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)rehash;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (void)clear;
- (void)computeMaxSize;
- (void)dealloc;
- (void)poll;
- (void)putAllImplWithJavaUtilMap:(id)a3;
- (void)putAllWithJavaUtilMap:(id)a3;
- (void)removeEntryWithJavaUtilWeakHashMap_Entry:(id)a3;
@end

@implementation JavaUtilWeakHashMap

+ (id)newEntryArrayWithInt:(int)a3
{
  return sub_100162F60(a3);
}

- (JavaUtilWeakHashMap)init
{
  return self;
}

- (JavaUtilWeakHashMap)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilWeakHashMap)initWithInt:(int)a3 withFloat:(float)a4
{
  return self;
}

- (JavaUtilWeakHashMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)clear
{
  if (self->elementCount_ >= 1)
  {
    self->elementCount_ = 0;
    JavaUtilArrays_fillWithNSObjectArray_withId_((int *)self->elementData_, 0);
    atomic_fetch_add(&self->modCount_, 1u);
    do
    {
      referenceQueue = self->referenceQueue_;
      if (!referenceQueue) {
        JreThrowNullPointerException();
      }
    }
    while ([(JavaLangRefReferenceQueue *)referenceQueue poll]);
  }
}

- (void)computeMaxSize
{
  elementData = self->elementData_;
  if (!elementData) {
    JreThrowNullPointerException();
  }
  unint64_t v3 = (unsigned __int128)(self->loadFactor_ * (uint64_t)elementData->super.size_ * (__int128)0x346DC5D63886594BLL) >> 64;
  self->threshold_ = (v3 >> 11) + (v3 >> 63);
}

- (BOOL)containsKeyWithId:(id)a3
{
  return [(JavaUtilWeakHashMap *)self getEntryWithId:a3] != 0;
}

- (id)entrySet
{
  [(JavaUtilWeakHashMap *)self poll];
  unint64_t v3 = [JavaUtilWeakHashMap__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  JavaUtilAbstractSet_init(v3, v4);
  return v3;
}

- (id)keySet
{
  [(JavaUtilWeakHashMap *)self poll];
  id result = self->super.keySet_;
  if (!result)
  {
    uint64_t v4 = [JavaUtilWeakHashMap_KeySet alloc];
    objc_storeWeak((id *)&v4->this$0_, self);
    JavaUtilAbstractSet_init(v4, v5);
    JreStrongAssignAndConsume((id *)&self->super.keySet_, v4);
    return self->super.keySet_;
  }
  return result;
}

- (id)values
{
  [(JavaUtilWeakHashMap *)self poll];
  id result = self->super.valuesCollection_;
  if (!result)
  {
    uint64_t v4 = [JavaUtilWeakHashMap_ValuesCollection alloc];
    objc_storeWeak((id *)&v4->this$0_, self);
    JavaUtilAbstractCollection_init(v4, v5);
    JreStrongAssignAndConsume((id *)&self->super.valuesCollection_, v4);
    return self->super.valuesCollection_;
  }
  return result;
}

- (id)getWithId:(id)a3
{
  [(JavaUtilWeakHashMap *)self poll];
  if (!a3)
  {
    elementData = self->elementData_;
    if (elementData)
    {
      uint64_t size = elementData->super.size_;
      if ((int)size <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(size, 0);
      }
      elementType = elementData->elementType_;
      if (elementType)
      {
        while (!BYTE4(elementType[5].super.isa))
        {
          elementType = (IOSClass *)elementType[7].super.isa;
          if (!elementType) {
            return 0;
          }
        }
        return elementType[6].super.isa;
      }
      return 0;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  int v5 = JavaUtilCollections_secondaryHashWithId_(a3);
  v6 = self->elementData_;
  if (!v6) {
    goto LABEL_15;
  }
  int v7 = v5 & 0x7FFFFFFF;
  uint64_t v8 = v6->super.size_;
  if ((v8 & 0x80000000) != 0) {
    IOSArray_throwOutOfBoundsWithMsg(v8, (v7 % (int)v8));
  }
  elementType = (&v6->elementType_)[v7 % (int)v8];
  if (!elementType) {
    return 0;
  }
  while ((objc_msgSend(a3, "isEqual:", -[IOSClass get](elementType, "get")) & 1) == 0)
  {
    elementType = (IOSClass *)elementType[7].super.isa;
    if (!elementType) {
      return 0;
    }
  }
  return elementType[6].super.isa;
}

- (id)getEntryWithId:(id)a3
{
  [(JavaUtilWeakHashMap *)self poll];
  if (a3)
  {
    int v5 = JavaUtilCollections_secondaryHashWithId_(a3);
    elementData = self->elementData_;
    if (elementData)
    {
      int v7 = v5 & 0x7FFFFFFF;
      uint64_t size = elementData->super.size_;
      if ((size & 0x80000000) != 0) {
        IOSArray_throwOutOfBoundsWithMsg(size, (v7 % (int)size));
      }
      for (i = (&elementData->elementType_)[v7 % (int)size]; i; i = (IOSClass *)i[7].super.isa)
      {
        if (objc_msgSend(a3, "isEqual:", -[IOSClass get](i, "get"))) {
          break;
        }
      }
      return i;
    }
LABEL_14:
    JreThrowNullPointerException();
  }
  v10 = self->elementData_;
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10->super.size_;
  if ((int)v11 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v11, 0);
  }
  for (i = v10->elementType_; i; i = (IOSClass *)i[7].super.isa)
  {
    if (BYTE4(i[5].super.isa)) {
      break;
    }
  }
  return i;
}

- (BOOL)containsValueWithId:(id)a3
{
  [(JavaUtilWeakHashMap *)self poll];
  elementData = self->elementData_;
  if (a3)
  {
    if (elementData)
    {
      int v6 = elementData->super.size_ - 1;
      if (v6 >= 0)
      {
        while (1)
        {
          int v7 = self->elementData_;
          int v8 = v6;
          uint64_t size = v7->super.size_;
          if (v6 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v6);
          }
          isa = (&v7->elementType_)[v6];
          if (isa) {
            break;
          }
LABEL_10:
          int v6 = v8 - 1;
          if (v8 < 1) {
            return 0;
          }
        }
        while (![(IOSClass *)isa get] && !BYTE4(isa[5].super.isa)
             || ([a3 isEqual:isa[6].super.isa] & 1) == 0)
        {
          isa = (IOSClass *)isa[7].super.isa;
          if (!isa) {
            goto LABEL_10;
          }
        }
        return 1;
      }
      return 0;
    }
LABEL_26:
    JreThrowNullPointerException();
  }
  if (!elementData) {
    goto LABEL_26;
  }
  int v11 = elementData->super.size_ - 1;
  if (v11 >= 0)
  {
    while (1)
    {
      v12 = self->elementData_;
      int v13 = v11;
      uint64_t v14 = v12->super.size_;
      if (v11 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v11);
      }
      v15 = (&v12->elementType_)[v11];
      if (v15) {
        break;
      }
LABEL_21:
      BOOL result = 0;
      int v11 = v13 - 1;
      if (v13 < 1) {
        return result;
      }
    }
    while (![(IOSClass *)v15 get] && !BYTE4(v15[5].super.isa) || v15[6].super.isa)
    {
      v15 = (IOSClass *)v15[7].super.isa;
      if (!v15) {
        goto LABEL_21;
      }
    }
    return 1;
  }
  return 0;
}

- (BOOL)isEmpty
{
  return [(JavaUtilWeakHashMap *)self size] == 0;
}

- (void)poll
{
  referenceQueue = self->referenceQueue_;
  if (!referenceQueue) {
LABEL_5:
  }
    JreThrowNullPointerException();
  while (1)
  {
    id v4 = [(JavaLangRefReferenceQueue *)referenceQueue poll];
    objc_opt_class();
    if (!v4) {
      break;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    [(JavaUtilWeakHashMap *)self removeEntryWithJavaUtilWeakHashMap_Entry:v4];
    referenceQueue = self->referenceQueue_;
    if (!referenceQueue) {
      goto LABEL_5;
    }
  }
}

- (void)removeEntryWithJavaUtilWeakHashMap_Entry:(id)a3
{
  if (!a3 || (elementData = self->elementData_) == 0) {
    JreThrowNullPointerException();
  }
  int v5 = *((_DWORD *)a3 + 10) & 0x7FFFFFFF;
  uint64_t size = elementData->super.size_;
  uint64_t v7 = (v5 % (int)size);
  if ((size & 0x80000000) != 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v5 % (int)size));
  }
  int v8 = (&elementData->elementType_)[v7];
  if (v8)
  {
    if (v8 == a3)
    {
      v10 = 0;
LABEL_10:
      atomic_fetch_add(&self->modCount_, 1u);
      if (v10) {
        JreStrongAssign((id *)&v10[7].super.isa, *((void **)a3 + 7));
      }
      else {
        IOSObjectArray_Set((uint64_t)self->elementData_, v7, *((void **)a3 + 7));
      }
      --self->elementCount_;
    }
    else
    {
      while (1)
      {
        Class isa = v8[7].super.isa;
        if (!isa) {
          break;
        }
        v10 = v8;
        int v8 = (IOSClass *)v8[7].super.isa;
        if (isa == a3) {
          goto LABEL_10;
        }
      }
    }
  }
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  [(JavaUtilWeakHashMap *)self poll];
  if (a3)
  {
    int v7 = JavaUtilCollections_secondaryHashWithId_(a3);
    elementData = self->elementData_;
    if (!elementData) {
      goto LABEL_24;
    }
    int v9 = v7 & 0x7FFFFFFF;
    uint64_t size = elementData->super.size_;
    uint64_t v11 = (v9 % (int)size);
    if ((size & 0x80000000) != 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, (v9 % (int)size));
    }
    Class isa = (&elementData->elementType_)[v11];
    if (isa)
    {
      while ((objc_msgSend(a3, "isEqual:", -[IOSClass get](isa, "get")) & 1) == 0)
      {
        Class isa = (IOSClass *)isa[7].super.isa;
        if (!isa) {
          goto LABEL_14;
        }
      }
LABEL_18:
      Class v18 = isa[6].super.isa;
      JreStrongAssign((id *)&isa[6].super.isa, a4);
      return v18;
    }
  }
  else
  {
    int v13 = self->elementData_;
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v13->super.size_;
    if ((int)v14 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v14, 0);
    }
    Class isa = v13->elementType_;
    if (isa)
    {
      while (!BYTE4(isa[5].super.isa))
      {
        Class isa = (IOSClass *)isa[7].super.isa;
        if (!isa) {
          goto LABEL_13;
        }
      }
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v11 = 0;
  }
LABEL_14:
  atomic_fetch_add(&self->modCount_, 1u);
  int v15 = self->elementCount_ + 1;
  self->elementCount_ = v15;
  if (v15 > self->threshold_)
  {
    -[JavaUtilWeakHashMap rehash]_0((uint64_t)self);
    if (a3)
    {
      int v16 = JavaUtilCollections_secondaryHashWithId_(a3);
      v17 = self->elementData_;
      if (!v17) {
        goto LABEL_24;
      }
      uint64_t v11 = ((v16 & 0x7FFFFFFF) % v17->super.size_);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  referenceQueue = self->referenceQueue_;
  v20 = [JavaUtilWeakHashMap_Entry alloc];
  JavaUtilWeakHashMap_Entry_initWithId_withId_withJavaLangRefReferenceQueue_((uint64_t)v20, a3, a4, (uint64_t)referenceQueue);
  v21 = v20;
  v22 = self->elementData_;
  if (!v22) {
LABEL_24:
  }
    JreThrowNullPointerException();
  v23 = v21;
  p_next = (id *)&v21->next_;
  uint64_t v25 = v22->super.size_;
  if ((int)v11 >= (int)v25) {
    IOSArray_throwOutOfBoundsWithMsg(v25, v11);
  }
  JreStrongAssign(p_next, (&v22->elementType_)[v11]);
  IOSObjectArray_Set((uint64_t)self->elementData_, v11, v23);
  return 0;
}

- (id)rehash
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    goto LABEL_20;
  }
  uint64_t v2 = a1;
  unsigned int v3 = 2 * *(_DWORD *)(v1 + 8);
  if (v3 <= 1) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  int v5 = sub_100162F60(v4);
  uint64_t v6 = *(void *)(v2 + 32);
  if (*(int *)(v6 + 8) >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v15 = v2;
    do
    {
      uint64_t v8 = *(void *)(v6 + 24 + 8 * v7);
      if (v8)
      {
        uint64_t v16 = v7;
        do
        {
          if (*(unsigned char *)(v8 + 44))
          {
            uint64_t v9 = 0;
            if (!v5) {
              goto LABEL_20;
            }
          }
          else
          {
            uint64_t v9 = ((*(_DWORD *)(v8 + 40) & 0x7FFFFFFF) % v4);
            if (!v5) {
              goto LABEL_20;
            }
          }
          uint64_t v10 = *(void *)(v8 + 56);
          uint64_t size = v5->super.size_;
          if ((int)v9 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v9);
          }
          JreStrongAssign((id *)(v8 + 56), (&v5->elementType_)[v9]);
          IOSObjectArray_Set((uint64_t)v5, v9, (void *)v8);
          uint64_t v8 = v10;
        }
        while (v10);
        uint64_t v2 = v15;
        uint64_t v7 = v16;
      }
      ++v7;
      uint64_t v6 = *(void *)(v2 + 32);
    }
    while (v7 < *(int *)(v6 + 8));
  }
  id result = JreStrongAssign((id *)(v2 + 32), v5);
  uint64_t v13 = *(void *)(v2 + 32);
  if (!v13) {
LABEL_20:
  }
    JreThrowNullPointerException();
  unint64_t v14 = (unsigned __int128)(*(int *)(v2 + 56) * (uint64_t)*(int *)(v13 + 8) * (__int128)0x346DC5D63886594BLL) >> 64;
  *(_DWORD *)(v2 + 60) = (v14 >> 11) + (v14 >> 63);
  return result;
}

- (void)putAllWithJavaUtilMap:(id)a3
{
}

- (id)removeWithId:(id)a3
{
  [(JavaUtilWeakHashMap *)self poll];
  if (a3)
  {
    int v5 = JavaUtilCollections_secondaryHashWithId_(a3);
    elementData = self->elementData_;
    if (!elementData) {
      goto LABEL_24;
    }
    int v7 = v5 & 0x7FFFFFFF;
    uint64_t size = elementData->super.size_;
    uint64_t v9 = (v7 % (int)size);
    if ((size & 0x80000000) != 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, (v7 % (int)size));
    }
    Class isa = (&elementData->elementType_)[v9];
    if (isa)
    {
      if (objc_msgSend(a3, "isEqual:", -[IOSClass get](isa, "get")))
      {
        uint64_t v11 = 0;
        goto LABEL_18;
      }
      while (1)
      {
        uint64_t v11 = isa;
        Class isa = (IOSClass *)isa[7].super.isa;
        if (!isa) {
          break;
        }
        if (objc_msgSend(a3, "isEqual:", -[IOSClass get](isa, "get"))) {
          goto LABEL_18;
        }
      }
    }
    return 0;
  }
  v12 = self->elementData_;
  if (!v12) {
    goto LABEL_24;
  }
  uint64_t v13 = v12->super.size_;
  if ((int)v13 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v13, 0);
  }
  Class isa = v12->elementType_;
  if (!isa) {
    return 0;
  }
  if (BYTE4(isa[5].super.isa))
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    do
    {
      uint64_t v11 = isa;
      Class isa = (IOSClass *)isa[7].super.isa;
      if (!isa) {
        return 0;
      }
    }
    while (!BYTE4(isa[5].super.isa));
    uint64_t v9 = 0;
  }
LABEL_18:
  atomic_fetch_add(&self->modCount_, 1u);
  if (!v11)
  {
    uint64_t v15 = self->elementData_;
    if (v15)
    {
      IOSObjectArray_Set((uint64_t)v15, v9, isa[7].super.isa);
      goto LABEL_23;
    }
LABEL_24:
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&v11[7].super.isa, isa[7].super.isa);
LABEL_23:
  --self->elementCount_;
  return isa[6].super.isa;
}

- (int)size
{
  return self->elementCount_;
}

- (void)putAllImplWithJavaUtilMap:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ([a3 entrySet])
  {
    v5.receiver = self;
    v5.super_class = (Class)JavaUtilWeakHashMap;
    [(JavaUtilAbstractMap *)&v5 putAllWithJavaUtilMap:a3];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilWeakHashMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FD598;
}

@end