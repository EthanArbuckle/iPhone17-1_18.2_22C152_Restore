@interface JavaUtilHashMap
+ (const)__metadata;
+ (int)capacityForInitSizeWithInt:(int)a3;
+ (void)initialize;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsMappingWithId:(id)a3 withId:(id)a4;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeMappingWithId:(id)a3 withId:(id)a4;
- (JavaUtilHashMap)init;
- (JavaUtilHashMap)initWithInt:(int)a3;
- (JavaUtilHashMap)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilHashMap)initWithJavaUtilMap:(id)a3;
- (id)clone;
- (id)constructorNewRetainedEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)makeTableWithInt:(int)a3;
- (id)newEntryIterator;
- (id)newKeyIterator;
- (id)newValueIterator;
- (id)putValueForNullKeyWithId:(id)a3;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (uint64_t)doubleCapacity;
- (unint64_t)enumerateEntriesWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addNewEntryForNullKeyWithId:(id)a3;
- (void)addNewEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)clear;
- (void)constructorPutAllWithJavaUtilMap:(id)a3;
- (void)constructorPutWithId:(id)a3 withId:(id)a4;
- (void)dealloc;
- (void)ensureCapacityWithInt:(int)a3;
- (void)putAllWithJavaUtilMap:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilHashMap

- (JavaUtilHashMap)init
{
  return self;
}

- (JavaUtilHashMap)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilHashMap)initWithInt:(int)a3 withFloat:(float)a4
{
  return self;
}

- (JavaUtilHashMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)constructorPutAllWithJavaUtilMap:(id)a3
{
}

+ (int)capacityForInitSizeWithInt:(int)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilHashMap__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if ((a3 + (a3 >> 1)) >= 0x40000000) {
    return 0x40000000;
  }
  else {
    return a3 + (a3 >> 1);
  }
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashMap;
  v3 = [(JavaUtilAbstractMap *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  table = self->table_;
  if (!table) {
LABEL_5:
  }
    JreThrowNullPointerException();
  sub_1001E0F54((uint64_t)v3, table->super.size_);
  JreStrongAssign(v3 + 4, 0);
  *((_DWORD *)v3 + 10) = 0;
  JreStrongAssign(v3 + 7, 0);
  JreStrongAssign(v3 + 8, 0);
  JreStrongAssign(v3 + 9, 0);
  [v3 init];
  sub_1001E0C24((uint64_t)v3, self);
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

- (id)getWithId:(id)a3
{
  if (a3)
  {
    int v6 = JavaUtilCollections_secondaryHashWithId_(a3);
    table = self->table_;
    if (!table) {
      JreThrowNullPointerException();
    }
    int v8 = v6;
    uint64_t size = table->super.size_;
    int v10 = (size - 1) & v8;
    if (v10 < 0 != v5 || v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v10);
    }
    entryForNullKey = (JavaUtilHashMap_HashMapEntry *)(&table->elementType_)[v10];
    if (entryForNullKey)
    {
      while (entryForNullKey->key_ != a3
           && (entryForNullKey->hash__ != v8 || (objc_msgSend(a3, "isEqual:") & 1) == 0))
      {
        entryForNullKey = entryForNullKey->next_;
        if (!entryForNullKey) {
          return 0;
        }
      }
      return entryForNullKey->value_;
    }
  }
  else
  {
    entryForNullKey = self->entryForNullKey_;
    if (entryForNullKey) {
      return entryForNullKey->value_;
    }
  }
  return 0;
}

- (BOOL)containsKeyWithId:(id)a3
{
  if (!a3) {
    return self->entryForNullKey_ != 0;
  }
  int v6 = JavaUtilCollections_secondaryHashWithId_(a3);
  table = self->table_;
  if (!table) {
    JreThrowNullPointerException();
  }
  int v8 = v6;
  uint64_t size = table->super.size_;
  int v10 = (size - 1) & v8;
  if (v10 < 0 != v5 || v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v10);
  }
  isa = (&table->elementType_)[v10];
  if (!isa) {
    return 0;
  }
  while (isa[1].super.isa != a3
       && (LODWORD(isa[3].super.isa) != v8 || (objc_msgSend(a3, "isEqual:") & 1) == 0))
  {
    isa = (IOSClass *)isa[4].super.isa;
    if (!isa) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)containsValueWithId:(id)a3
{
  table = self->table_;
  if (!table) {
    JreThrowNullPointerException();
  }
  uint64_t size = table->super.size_;
  if (!a3)
  {
    if ((int)size >= 1)
    {
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = table->super.size_;
        if (v10 >= v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v10);
        }
        isa = (&table->elementType_)[v10];
        if (isa) {
          break;
        }
LABEL_18:
        if (++v10 == size) {
          goto LABEL_26;
        }
      }
      while (isa[2].super.isa)
      {
        isa = (IOSClass *)isa[4].super.isa;
        if (!isa) {
          goto LABEL_18;
        }
      }
      return 1;
    }
LABEL_26:
    entryForNullKey = self->entryForNullKey_;
    if (entryForNullKey) {
      return entryForNullKey->value_ == 0;
    }
    return 0;
  }
  if ((int)size >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = table->super.size_;
      if (v7 >= v8) {
        IOSArray_throwOutOfBoundsWithMsg(v8, v7);
      }
      v9 = (&table->elementType_)[v7];
      if (v9) {
        break;
      }
LABEL_9:
      if (++v7 == size) {
        goto LABEL_22;
      }
    }
    while (([a3 isEqual:v9[2].super.isa] & 1) == 0)
    {
      v9 = (IOSClass *)v9[4].super.isa;
      if (!v9) {
        goto LABEL_9;
      }
    }
    return 1;
  }
LABEL_22:
  v14 = self->entryForNullKey_;
  if (!v14) {
    return 0;
  }
  id value = v14->value_;
  return [a3 isEqual:value];
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  if (a3)
  {
    uint64_t v8 = JavaUtilCollections_secondaryHashWithId_(a3);
    table = self->table_;
    if (table)
    {
      uint64_t v10 = v8;
      uint64_t size = table->super.size_;
      uint64_t v12 = (size - 1) & v10;
      if ((int)((size - 1) & v10) < 0 != v7 || (int)v12 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, (size - 1) & v10);
      }
      isa = (&table->elementType_)[(int)v12];
      if (isa)
      {
        while (LODWORD(isa[3].super.isa) != v10
             || ([a3 isEqual:isa[1].super.isa] & 1) == 0)
        {
          isa = (IOSClass *)isa[4].super.isa;
          if (!isa) {
            goto LABEL_12;
          }
        }
        [(JavaUtilHashMap *)self preModifyWithJavaUtilHashMap_HashMapEntry:isa];
        Class v17 = isa[2].super.isa;
        JreStrongAssign((id *)&isa[2].super.isa, a4);
        return v17;
      }
LABEL_12:
      ++self->modCount_;
      int v15 = self->size_;
      self->size_ = v15 + 1;
      if (v15 <= self->threshold_)
      {
LABEL_15:
        [(JavaUtilHashMap *)self addNewEntryWithId:a3 withId:a4 withInt:v10 withInt:v12];
        return 0;
      }
      uint64_t v16 = -[JavaUtilHashMap doubleCapacity]_0((uint64_t)self);
      if (v16)
      {
        uint64_t v12 = (*(_DWORD *)(v16 + 8) - 1) & v10;
        goto LABEL_15;
      }
    }
    JreThrowNullPointerException();
  }
  return (id)sub_1001E1524((uint64_t)self, a4);
}

- (uint64_t)doubleCapacity
{
  uint64_t v1 = *(void *)(a1 + 24);
  uint64_t v2 = *(unsigned int *)(v1 + 8);
  if (v2 == 0x40000000) {
    return *(void *)(a1 + 24);
  }
  uint64_t v5 = sub_1001E0F54(a1, 2 * (int)v2);
  uint64_t v3 = v5;
  if (*(_DWORD *)(a1 + 40))
  {
    if ((int)v2 >= 1)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        uint64_t v7 = *(void *)(v1 + 24 + 8 * i);
        if (v7)
        {
          int v8 = *(_DWORD *)(v7 + 24) & v2;
          *(void *)(v5 + 24 + 8 * (int)(v8 | i)) = v7;
          uint64_t v9 = *(void *)(v7 + 32);
          if (v9)
          {
            uint64_t v10 = 0;
            do
            {
              uint64_t v11 = v9;
              int v12 = *(_DWORD *)(v9 + 24) & v2;
              if (v12 != v8)
              {
                if (v10) {
                  v13 = (void *)(v10 + 32);
                }
                else {
                  v13 = (void *)(v5 + 24 + 8 * (int)(v12 | i));
                }
                void *v13 = v11;
                int v8 = v12;
                uint64_t v10 = v7;
              }
              uint64_t v9 = *(void *)(v11 + 32);
              uint64_t v7 = v11;
            }
            while (v9);
            if (v10) {
              *(void *)(v10 + 32) = 0;
            }
          }
        }
      }
    }
    bzero((void *)(v1 + 24), 8 * *(int *)(v1 + 8));
  }
  return v3;
}

- (id)putValueForNullKeyWithId:(id)a3
{
  return (id)sub_1001E1524((uint64_t)self, a3);
}

- (void)constructorPutWithId:(id)a3 withId:(id)a4
{
}

- (void)addNewEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  int v8 = [[JavaUtilHashMap_HashMapEntry alloc] initWithId:a3 withId:a4 withInt:*(void *)&a5 withJavaUtilHashMap_HashMapEntry:0];
  v8->next_ = (JavaUtilHashMap_HashMapEntry *)(&self->table_->elementType_)[a6];
  (&self->table_->elementType_)[a6] = (IOSClass *)v8;
}

- (void)addNewEntryForNullKeyWithId:(id)a3
{
  p_entryForNullKey = &self->entryForNullKey_;
  v4 = new_JavaUtilHashMap_HashMapEntry_initWithId_withId_withInt_withJavaUtilHashMap_HashMapEntry_(0, a3, 0, 0);
  JreStrongAssignAndConsume((id *)p_entryForNullKey, v4);
}

- (id)constructorNewRetainedEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6
{
  id result = [[JavaUtilHashMap_HashMapEntry alloc] initWithId:a3 withId:a4 withInt:*(void *)&a5 withJavaUtilHashMap_HashMapEntry:0];
  *((void *)result + 4) = a6;
  return result;
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  sub_1001E1A90((uint64_t)self, (int)[a3 size]);
  v5.receiver = self;
  v5.super_class = (Class)JavaUtilHashMap;
  [(JavaUtilAbstractMap *)&v5 putAllWithJavaUtilMap:a3];
}

- (void)ensureCapacityWithInt:(int)a3
{
}

- (id)makeTableWithInt:(int)a3
{
  return (id)sub_1001E0F54((uint64_t)self, a3);
}

- (id)removeWithId:(id)a3
{
  if (a3)
  {
    int v5 = JavaUtilCollections_secondaryHashWithId_(a3);
    table = self->table_;
    int v7 = (table->super.size_ - 1) & v5;
    next = (JavaUtilHashMap_HashMapEntry *)(&table->elementType_)[v7];
    if (next)
    {
      int v9 = v5;
      uint64_t v10 = 0;
      uint64_t v11 = v7;
      while (1)
      {
        entryForNullKey = next;
        if (next->hash__ == v9)
        {
          if ([a3 isEqual:next->key_]) {
            break;
          }
        }
        next = entryForNullKey->next_;
        uint64_t v10 = entryForNullKey;
        if (!next) {
          return 0;
        }
      }
      if (v10) {
        p_next = &v10->next_;
      }
      else {
        p_next = (JavaUtilHashMap_HashMapEntry **)&(&table->elementType_)[v11];
      }
      *p_next = entryForNullKey->next_;
      entryForNullKey->next_ = 0;
      uint64_t v16 = entryForNullKey;
      goto LABEL_15;
    }
    return 0;
  }
  p_entryForNullKey = &self->entryForNullKey_;
  entryForNullKey = self->entryForNullKey_;
  if (!entryForNullKey) {
    return 0;
  }
  JreStrongAssign((id *)p_entryForNullKey, 0);
LABEL_15:
  ++self->modCount_;
  --self->size_;
  [(JavaUtilHashMap *)self postRemoveWithJavaUtilHashMap_HashMapEntry:entryForNullKey];
  return entryForNullKey->value_;
}

- (void)clear
{
  if (self->size_)
  {
    JavaUtilArrays_fillWithNSObjectArray_withId_((int *)self->table_, 0);
    JreStrongAssign((id *)&self->entryForNullKey_, 0);
    ++self->modCount_;
    self->size_ = 0;
  }
}

- (id)keySet
{
  p_keySet_HashMap = &self->keySet_HashMap_;
  id result = self->keySet_HashMap_;
  if (!result)
  {
    int v5 = [JavaUtilHashMap_KeySet alloc];
    objc_storeWeak((id *)&v5->this$0_, self);
    JavaUtilAbstractSet_init(v5, v6);
    return JreStrongAssignAndConsume((id *)p_keySet_HashMap, v5);
  }
  return result;
}

- (id)values
{
  p_values = &self->values_;
  id result = self->values_;
  if (!result)
  {
    int v5 = [JavaUtilHashMap_Values alloc];
    objc_storeWeak((id *)&v5->this$0_, self);
    JavaUtilAbstractCollection_init(v5, v6);
    return JreStrongAssignAndConsume((id *)p_values, v5);
  }
  return result;
}

- (id)entrySet
{
  p_entrySet = &self->entrySet_;
  id result = self->entrySet_;
  if (!result)
  {
    int v5 = [JavaUtilHashMap_EntrySet alloc];
    objc_storeWeak((id *)&v5->this$0_, self);
    JavaUtilAbstractSet_init(v5, v6);
    return JreStrongAssignAndConsume((id *)p_entrySet, v5);
  }
  return result;
}

- (BOOL)containsMappingWithId:(id)a3 withId:(id)a4
{
  return sub_1001E1F90((uint64_t)self, a3, (uint64_t)a4);
}

- (BOOL)removeMappingWithId:(id)a3 withId:(id)a4
{
  return sub_1001E20A8((uint64_t)self, a3, (uint64_t)a4);
}

- (id)newKeyIterator
{
  uint64_t v3 = [JavaUtilHashMap_KeyIterator alloc];
  sub_1001E2C8C((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (id)newValueIterator
{
  uint64_t v3 = [JavaUtilHashMap_ValueIterator alloc];
  sub_1001E2C8C((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (id)newEntryIterator
{
  uint64_t v3 = [JavaUtilHashMap_EntryIterator alloc];
  sub_1001E2C8C((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_14;
  }
  id v5 = [a3 putFields];
  if (!v5) {
    goto LABEL_14;
  }
  LODWORD(v6) = 0.75;
  [v5 putWithNSString:@"loadFactor" withFloat:v6];
  [a3 writeFields];
  table = self->table_;
  if (!table
    || ([a3 writeIntWithInt:table->super.size_],
        [a3 writeIntWithInt:self->size_],
        long long v17 = 0u,
        long long v18 = 0u,
        long long v15 = 0u,
        long long v16 = 0u,
        (id v8 = [(JavaUtilHashMap *)self entrySet]) == 0))
  {
LABEL_14:
    JreThrowNullPointerException();
  }
  int v9 = v8;
  id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (!v14) {
          goto LABEL_14;
        }
        objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13), "getKey"));
        objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(v14, "getValue"));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  unsigned int v5 = [a3 readInt];
  if ((v5 & 0x80000000) != 0)
  {
    long long v15 = @"Capacity: ";
    goto LABEL_14;
  }
  if (v5 >= 4)
  {
    int v13 = 0x40000000;
    if (v5 <= 0x40000000) {
      int v13 = JavaUtilCollections_roundUpToPowerOfTwoWithInt_(v5);
    }
  }
  else
  {
    int v13 = 4;
  }
  sub_1001E0F54((uint64_t)self, v13);
  unsigned int v14 = [a3 readInt];
  if ((v14 & 0x80000000) != 0)
  {
    long long v15 = @"Size: ";
LABEL_14:
    CFStringRef v16 = JreStrcat("$I", v6, v7, v8, v9, v10, v11, v12, v15);
    long long v17 = new_JavaIoInvalidObjectException_initWithNSString_((uint64_t)v16);
    objc_exception_throw(v17);
  }
  [(JavaUtilHashMap *)self init];
  for (; v14; --v14)
    sub_1001E170C((uint64_t)self, [a3 readObject], objc_msgSend(a3, "readObject"));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

- (unint64_t)enumerateEntriesWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
  {
    unint64_t v5 = a3->var3[0];
    isa = (IOSClass *)a3->var3[1];
    BOOL v7 = a3->var0 != 1;
  }
  else
  {
    BOOL v7 = 0;
    isa = 0;
    unint64_t v5 = 0;
    a3->var0 = 1;
    a3->var3[0] = 0;
    a3->var3[1] = 0;
    a3->var2 = (unint64_t *)&self->modCount_;
  }
  unint64_t entryForNullKey = 0;
  a3->var1 = a4;
  if (a5)
  {
    if (!v7)
    {
      a3->var0 = 2;
      unint64_t entryForNullKey = (unint64_t)self->entryForNullKey_;
      if (entryForNullKey)
      {
        *a4++ = (id)entryForNullKey;
        unint64_t entryForNullKey = 1;
      }
    }
  }
  if (entryForNullKey >= a5)
  {
LABEL_19:
    unint64_t size = v5;
  }
  else
  {
    while (isa)
    {
      isa = (IOSClass *)isa[4].super.isa;
      if (!isa) {
        break;
      }
LABEL_17:
      *a4++ = isa;
      if (++entryForNullKey == a5)
      {
        unint64_t entryForNullKey = a5;
        goto LABEL_19;
      }
    }
    table = self->table_;
    if (v5 <= table->super.size_) {
      unint64_t size = table->super.size_;
    }
    else {
      unint64_t size = v5;
    }
    while (size != v5)
    {
      unint64_t v11 = v5 + 1;
      isa = (&table->elementType_)[v5++];
      if (isa)
      {
        unint64_t v5 = v11;
        goto LABEL_17;
      }
    }
    isa = 0;
  }
  a3->var3[0] = size;
  a3->var3[1] = (unint64_t)isa;
  return entryForNullKey;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilHashMap *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_100560D38 != -1) {
      dispatch_once(&qword_100560D38, &stru_100432860);
    }
    JreStrongAssignAndConsume((id *)&qword_100560D20, +[IOSObjectArray newArrayWithLength:2 type:qword_100560D30]);
    id v3 = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"loadFactor", (JavaLangRefWeakReference *)+[IOSClass floatClass]);
    id v2 = +[IOSObjectArray newArrayWithObjects:&v3 count:1 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560D28, v2);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilHashMap__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100432550;
}

@end