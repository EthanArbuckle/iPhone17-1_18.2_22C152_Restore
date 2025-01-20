@interface JavaUtilLinkedHashMap
+ (const)__metadata;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)removeEldestEntryWithJavaUtilMap_Entry:(id)a3;
- (JavaUtilLinkedHashMap)init;
- (JavaUtilLinkedHashMap)initWithInt:(int)a3;
- (JavaUtilLinkedHashMap)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilLinkedHashMap)initWithInt:(int)a3 withFloat:(float)a4 withBoolean:(BOOL)a5;
- (JavaUtilLinkedHashMap)initWithJavaUtilMap:(id)a3;
- (id)constructorNewRetainedEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6;
- (id)eldest;
- (id)getWithId:(id)a3;
- (id)newEntryIterator;
- (id)newKeyIterator;
- (id)newValueIterator;
- (unint64_t)enumerateEntriesWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addNewEntryForNullKeyWithId:(id)a3;
- (void)addNewEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)clear;
- (void)dealloc;
- (void)init__;
- (void)makeTailWithJavaUtilLinkedHashMap_LinkedEntry:(id)a3;
- (void)postRemoveWithJavaUtilHashMap_HashMapEntry:(id)a3;
- (void)preModifyWithJavaUtilHashMap_HashMapEntry:(id)a3;
@end

@implementation JavaUtilLinkedHashMap

- (JavaUtilLinkedHashMap)init
{
  self->accessOrder_ = 0;
  return self;
}

- (JavaUtilLinkedHashMap)initWithInt:(int)a3
{
  self->accessOrder_ = 0;
  return self;
}

- (JavaUtilLinkedHashMap)initWithInt:(int)a3 withFloat:(float)a4
{
  self->accessOrder_ = 0;
  return self;
}

- (JavaUtilLinkedHashMap)initWithInt:(int)a3 withFloat:(float)a4 withBoolean:(BOOL)a5
{
  self->accessOrder_ = a5;
  return self;
}

- (JavaUtilLinkedHashMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)init__
{
  p_header = &self->header_;
  v3 = [JavaUtilLinkedHashMap_LinkedEntry alloc];
  JavaUtilLinkedHashMap_LinkedEntry_init((id *)&v3->super.super.isa);
  JreStrongAssignAndConsume((id *)p_header, v3);
}

- (id)eldest
{
  header = self->header_;
  if (!header) {
    JreThrowNullPointerException();
  }
  id result = objc_loadWeak((id *)&header->nxt_);
  if (result == self->header_) {
    return 0;
  }
  return result;
}

- (void)addNewEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v7 = *(void *)&a5;
  header = self->header_;
  Weak = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&header->nxt_);
  if (Weak != header)
  {
    v13 = Weak;
    if ([(JavaUtilLinkedHashMap *)self removeEldestEntryWithJavaUtilMap_Entry:Weak])
    {
      [(JavaUtilHashMap *)self removeWithId:v13->super.key_];
    }
  }
  v14 = (id *)objc_loadWeak((id *)&header->prv_);
  v15 = [[JavaUtilLinkedHashMap_LinkedEntry alloc] initWithId:a3 withId:a4 withInt:v7 withJavaUtilHashMap_HashMapEntry:0 withJavaUtilLinkedHashMap_LinkedEntry:header withJavaUtilLinkedHashMap_LinkedEntry:v14];
  v15->super.next_ = (JavaUtilHashMap_HashMapEntry *)(&self->super.table_->elementType_)[a6];
  id v16 = objc_storeWeak((id *)&header->prv_, v15);
  (&self->super.table_->elementType_)[a6] = (IOSClass *)objc_storeWeak(v14 + 5, v16);
}

- (void)addNewEntryForNullKeyWithId:(id)a3
{
  header = self->header_;
  Weak = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&header->nxt_);
  if (Weak != header)
  {
    uint64_t v7 = Weak;
    if ([(JavaUtilLinkedHashMap *)self removeEldestEntryWithJavaUtilMap_Entry:Weak])
    {
      [(JavaUtilHashMap *)self removeWithId:v7->super.key_];
    }
  }
  v8 = (id *)objc_loadWeak((id *)&header->prv_);
  id v9 = objc_storeWeak((id *)&header->prv_, [[JavaUtilLinkedHashMap_LinkedEntry alloc] initWithId:0 withId:a3 withInt:0 withJavaUtilHashMap_HashMapEntry:0 withJavaUtilLinkedHashMap_LinkedEntry:header withJavaUtilLinkedHashMap_LinkedEntry:v8]);
  id v10 = objc_storeWeak(v8 + 5, v9);
  JreStrongAssignAndConsume((id *)&self->super.entryForNullKey_, v10);
}

- (id)constructorNewRetainedEntryWithId:(id)a3 withId:(id)a4 withInt:(int)a5 withJavaUtilHashMap_HashMapEntry:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  header = self->header_;
  Weak = (id *)objc_loadWeak((id *)&header->prv_);
  v12 = [[JavaUtilLinkedHashMap_LinkedEntry alloc] initWithId:a3 withId:a4 withInt:v7 withJavaUtilHashMap_HashMapEntry:0 withJavaUtilLinkedHashMap_LinkedEntry:header withJavaUtilLinkedHashMap_LinkedEntry:Weak];
  v12->super.next_ = (JavaUtilHashMap_HashMapEntry *)a6;
  id v13 = objc_storeWeak((id *)&header->prv_, v12);
  return objc_storeWeak(Weak + 5, v13);
}

- (id)getWithId:(id)a3
{
  if (a3)
  {
    int v6 = JavaUtilCollections_secondaryHashWithId_(a3);
    table = self->super.table_;
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
           && (entryForNullKey->hash__ != v8 || !objc_msgSend(a3, "isEqual:")))
      {
        entryForNullKey = entryForNullKey->next_;
        if (!entryForNullKey) {
          return 0;
        }
      }
      goto LABEL_15;
    }
    return 0;
  }
  entryForNullKey = self->super.entryForNullKey_;
  if (!entryForNullKey) {
    return 0;
  }
LABEL_15:
  if (self->accessOrder_)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    sub_10017CA10((uint64_t)self, (id *)&entryForNullKey->super.isa);
  }
  return entryForNullKey->value_;
}

- (void)makeTailWithJavaUtilLinkedHashMap_LinkedEntry:(id)a3
{
}

- (void)preModifyWithJavaUtilHashMap_HashMapEntry:(id)a3
{
  if (self->accessOrder_)
  {
    objc_opt_class();
    if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    sub_10017CA10((uint64_t)self, (id *)a3);
  }
}

- (void)postRemoveWithJavaUtilHashMap_HashMapEntry:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    objc_loadWeak((id *)0x28);
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id Weak = objc_loadWeak((id *)a3 + 5);
  char v5 = (id *)objc_loadWeak((id *)a3 + 6);
  if (!v5
    || (objc_storeWeak(v5 + 5, Weak), v6 = objc_loadWeak((id *)a3 + 6), (uint64_t v7 = (id *)objc_loadWeak((id *)a3 + 5)) == 0))
  {
    JreThrowNullPointerException();
  }
  objc_storeWeak(v7 + 6, v6);
  id v8 = objc_storeWeak((id *)a3 + 6, 0);
  objc_storeWeak((id *)a3 + 5, v8);
}

- (BOOL)containsValueWithId:(id)a3
{
  header = self->header_;
  if (a3)
  {
    if (!header) {
      goto LABEL_17;
    }
    id Weak = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&header->nxt_);
    if (Weak != header)
    {
      id v6 = Weak;
      while (v6)
      {
        unsigned __int8 v7 = [a3 isEqual:v6->super.value_];
        if ((v7 & 1) == 0)
        {
          id v6 = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&v6->nxt_);
          if (v6 != header) {
            continue;
          }
        }
        return v7;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!header) {
      goto LABEL_17;
    }
    id v8 = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&header->nxt_);
    if (v8 != header)
    {
      while (v8)
      {
        id value = v8->super.value_;
        unsigned __int8 v7 = value == 0;
        if (value)
        {
          id v8 = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&v8->nxt_);
          if (v8 != header) {
            continue;
          }
        }
        return v7;
      }
LABEL_17:
      JreThrowNullPointerException();
    }
  }
  return 0;
}

- (void)clear
{
  v9.receiver = self;
  v9.super_class = (Class)JavaUtilLinkedHashMap;
  [(JavaUtilHashMap *)&v9 clear];
  header = self->header_;
  if (!header) {
    goto LABEL_7;
  }
  id Weak = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&header->nxt_);
  if (Weak != header)
  {
    char v5 = Weak;
    while (v5)
    {
      id v6 = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&v5->nxt_);
      id v7 = objc_storeWeak((id *)&v5->prv_, 0);
      objc_storeWeak((id *)&v5->nxt_, v7);
      char v5 = v6;
      if (v6 == header) {
        goto LABEL_6;
      }
    }
LABEL_7:
    JreThrowNullPointerException();
  }
LABEL_6:
  id v8 = objc_storeWeak((id *)&header->prv_, header);
  objc_storeWeak((id *)&header->nxt_, v8);
}

- (id)newKeyIterator
{
  v3 = [JavaUtilLinkedHashMap_KeyIterator alloc];
  sub_10017D640((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (id)newValueIterator
{
  v3 = [JavaUtilLinkedHashMap_ValueIterator alloc];
  sub_10017D640((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (id)newEntryIterator
{
  v3 = [JavaUtilLinkedHashMap_EntryIterator alloc];
  sub_10017D640((uint64_t)v3, (uint64_t)self);
  return v3;
}

- (BOOL)removeEldestEntryWithJavaUtilMap_Entry:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLinkedHashMap;
  [(JavaUtilHashMap *)&v3 dealloc];
}

- (unint64_t)enumerateEntriesWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
  {
    id Weak = (JavaUtilLinkedHashMap_LinkedEntry *)a3->var3[0];
  }
  else
  {
    a3->var0 = 1;
    a3->var2 = (unint64_t *)&self->super.modCount_;
    id Weak = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&self->header_->nxt_);
  }
  a3->var1 = a4;
  for (unint64_t i = 0;
        Weak != self->header_ && i < a5;
        id Weak = (JavaUtilLinkedHashMap_LinkedEntry *)objc_loadWeak((id *)&Weak->nxt_))
  {
    a4[i++] = Weak;
  }
  a3->var3[0] = (unint64_t)Weak;
  return i;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100406028;
}

@end