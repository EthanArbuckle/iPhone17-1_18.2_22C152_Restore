@interface JavaUtilHashtable
+ (const)__metadata;
+ (int)capacityForInitSizeWithInt:(int)a3;
+ (void)initialize;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsMappingWithId:(id)a3 withId:(id)a4;
- (BOOL)containsValueWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeMappingWithId:(id)a3 withId:(id)a4;
- (IOSObjectArray)doubleCapacity;
- (JavaUtilHashtable)init;
- (JavaUtilHashtable)initWithInt:(int)a3;
- (JavaUtilHashtable)initWithInt:(int)a3 withFloat:(float)a4;
- (JavaUtilHashtable)initWithJavaUtilMap:(id)a3;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elements;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)keys;
- (id)makeTableWithInt:(int)a3;
- (id)putWithId:(id)a3 withId:(id)a4;
- (id)removeWithId:(id)a3;
- (id)values;
- (int)size;
- (unint64_t)hash;
- (void)clear;
- (void)constructorPutAllWithJavaUtilMap:(id)a3;
- (void)constructorPutWithId:(id)a3 withId:(id)a4;
- (void)dealloc;
- (void)ensureCapacityWithInt:(int)a3;
- (void)putAllWithJavaUtilMap:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilHashtable

- (JavaUtilHashtable)init
{
  return self;
}

- (JavaUtilHashtable)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilHashtable)initWithInt:(int)a3 withFloat:(float)a4
{
  return self;
}

- (JavaUtilHashtable)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (void)constructorPutAllWithJavaUtilMap:(id)a3
{
}

+ (int)capacityForInitSizeWithInt:(int)a3
{
  if ((atomic_load_explicit(JavaUtilHashtable__initialized, memory_order_acquire) & 1) == 0) {
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
  objc_sync_enter(self);
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilHashtable;
  id v3 = [(JavaUtilHashtable *)&v6 clone];
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
  sub_100201DD0((uint64_t)v3, table->super.size_);
  *((_DWORD *)v3 + 4) = 0;
  JreStrongAssign((id *)v3 + 4, 0);
  JreStrongAssign((id *)v3 + 5, 0);
  JreStrongAssign((id *)v3 + 6, 0);
  sub_100201AEC((uint64_t)v3, self);
  objc_sync_exit(self);
  return v3;
}

- (BOOL)isEmpty
{
  objc_sync_enter(self);
  BOOL v3 = self->size_ == 0;
  objc_sync_exit(self);
  return v3;
}

- (int)size
{
  objc_sync_enter(self);
  int size = self->size_;
  objc_sync_exit(self);
  return size;
}

- (id)getWithId:(id)a3
{
  objc_sync_enter(self);
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
  if (isa)
  {
    while (isa[1].super.isa != a3)
    {
      if (LODWORD(isa[3].super.isa) == v8)
      {
        if (!a3) {
          JreThrowNullPointerException();
        }
        if (objc_msgSend(a3, "isEqual:")) {
          break;
        }
      }
      isa = (IOSClass *)isa[4].super.isa;
      if (!isa) {
        goto LABEL_13;
      }
    }
    Class v13 = isa[2].super.isa;
  }
  else
  {
LABEL_13:
    Class v13 = 0;
  }
  objc_sync_exit(self);
  return v13;
}

- (BOOL)containsKeyWithId:(id)a3
{
  objc_sync_enter(self);
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
  if (isa)
  {
    while (isa[1].super.isa != a3)
    {
      if (LODWORD(isa[3].super.isa) == v8)
      {
        if (!a3) {
          JreThrowNullPointerException();
        }
        if (objc_msgSend(a3, "isEqual:")) {
          break;
        }
      }
      isa = (IOSClass *)isa[4].super.isa;
      if (!isa) {
        goto LABEL_13;
      }
    }
    BOOL v13 = 1;
  }
  else
  {
LABEL_13:
    BOOL v13 = 0;
  }
  objc_sync_exit(self);
  return v13;
}

- (BOOL)containsValueWithId:(id)a3
{
  objc_sync_enter(self);
  if (!a3)
  {
    v12 = new_JavaLangNullPointerException_initWithNSString_(@"value == null");
    objc_exception_throw(v12);
  }
  table = self->table_;
  if (!table) {
    JreThrowNullPointerException();
  }
  unint64_t size = table->super.size_;
  if ((int)size < 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL v8 = 1;
    while (1)
    {
      uint64_t v9 = table->super.size_;
      if (v7 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v7);
      }
      isa = (&table->elementType_)[v7];
      if (isa) {
        break;
      }
LABEL_9:
      BOOL v8 = ++v7 < size;
      if (v7 == size) {
        goto LABEL_13;
      }
    }
    while (([a3 isEqual:isa[2].super.isa] & 1) == 0)
    {
      isa = (IOSClass *)isa[4].super.isa;
      if (!isa) {
        goto LABEL_9;
      }
    }
  }
LABEL_13:
  objc_sync_exit(self);
  return v8;
}

- (id)putWithId:(id)a3 withId:(id)a4
{
  objc_sync_enter(self);
  if (!a3)
  {
    CFStringRef v24 = @"key == null";
    goto LABEL_29;
  }
  if (!a4)
  {
    CFStringRef v24 = @"value == null";
LABEL_29:
    v25 = new_JavaLangNullPointerException_initWithNSString_((uint64_t)v24);
    objc_exception_throw(v25);
  }
  int v8 = JavaUtilCollections_secondaryHashWithId_(a3);
  table = self->table_;
  if (!table) {
    JreThrowNullPointerException();
  }
  int v10 = v8;
  uint64_t size = table->super.size_;
  int v12 = (size - 1) & v10;
  if (v12 < 0 != v7 || v12 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (size - 1) & v10);
  }
  v14 = (&table->elementType_)[v12];
  if (v14)
  {
    isa = (&table->elementType_)[v12];
    while (LODWORD(isa[3].super.isa) != v10 || ![a3 isEqual:isa[1].super.isa])
    {
      isa = (IOSClass *)isa[4].super.isa;
      if (!isa) {
        goto LABEL_14;
      }
    }
    Class v22 = isa[2].super.isa;
    JreStrongAssign((id *)&isa[2].super.isa, a4);
  }
  else
  {
LABEL_14:
    ++self->modCount_;
    int v16 = self->size_;
    self->size_ = v16 + 1;
    if (v16 > self->threshold_)
    {
      [(JavaUtilHashtable *)self rehash];
      v18 = -[JavaUtilHashtable doubleCapacity]_0((uint64_t)self);
      table = v18;
      if (!v18) {
        JreThrowNullPointerException();
      }
      uint64_t v19 = v18->super.size_;
      int v12 = (v19 - 1) & v10;
      if (v12 < 0 != v17 || v12 >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, (v19 - 1) & v10);
      }
      v14 = (&table->elementType_)[v12];
    }
    v21 = sub_1002025F8(a3, a4, v10, v14);
    IOSObjectArray_SetAndConsume((uint64_t)table, v12, v21);
    Class v22 = 0;
  }
  objc_sync_exit(self);
  return v22;
}

- (IOSObjectArray)doubleCapacity
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (!v1) {
LABEL_27:
  }
    JreThrowNullPointerException();
  uint64_t v2 = *(unsigned int *)(v1 + 8);
  if (v2 != 0x40000000)
  {
    v4 = sub_100201DD0(a1, 2 * (int)v2);
    if (*(_DWORD *)(a1 + 16)) {
      BOOL v5 = (int)v2 < 1;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = *(int *)(v1 + 8);
        if (v7 >= v8) {
          IOSArray_throwOutOfBoundsWithMsg(v8, v7);
        }
        uint64_t v9 = *(_DWORD **)(v1 + 24 + 8 * v7);
        if (v9)
        {
          if (!v4) {
            goto LABEL_27;
          }
          uint64_t v10 = v9[6] & v2;
          IOSObjectArray_Set((uint64_t)v4, (int)(v10 | v7), v9);
          v11 = (_DWORD *)*((void *)v9 + 4);
          if (v11)
          {
            int v12 = 0;
            do
            {
              BOOL v13 = (id *)v9;
              uint64_t v9 = v11;
              uint64_t v14 = v11[6] & v2;
              if (v14 == v10)
              {
                uint64_t v14 = v10;
              }
              else
              {
                if (v12) {
                  JreStrongAssign(v12 + 4, v11);
                }
                else {
                  IOSObjectArray_Set((uint64_t)v4, (int)(v14 | v7), v11);
                }
                int v12 = v13;
              }
              v11 = (_DWORD *)*((void *)v9 + 4);
              uint64_t v10 = v14;
            }
            while (v11);
            if (v12) {
              JreStrongAssign(v12 + 4, 0);
            }
          }
        }
        ++v7;
      }
      while (v7 != v2);
    }
    return v4;
  }
  return (IOSObjectArray *)v1;
}

- (void)constructorPutWithId:(id)a3 withId:(id)a4
{
}

- (void)putAllWithJavaUtilMap:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  sub_100202954((uint64_t)self, (int)[a3 size]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(a3, "entrySet", 0);
  int v6 = v5;
  if (!v5) {
LABEL_12:
  }
    JreThrowNullPointerException();
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!v10) {
          goto LABEL_12;
        }
        -[JavaUtilHashtable putWithId:withId:](self, "putWithId:withId:", [*(id *)(*((void *)&v11 + 1) + 8 * i) getKey], objc_msgSend(v10, "getValue"));
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (void)ensureCapacityWithInt:(int)a3
{
}

- (id)makeTableWithInt:(int)a3
{
  return sub_100201DD0((uint64_t)self, a3);
}

- (id)removeWithId:(id)a3
{
  objc_sync_enter(self);
  int v6 = JavaUtilCollections_secondaryHashWithId_(a3);
  table = self->table_;
  if (!table) {
    JreThrowNullPointerException();
  }
  int v8 = v6;
  uint64_t size = table->super.size_;
  int v10 = (size - 1) & v8;
  uint64_t v11 = v10;
  if (v10 < 0 != v5 || v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v10);
  }
  isa = (&table->elementType_)[v10];
  if (isa)
  {
    long long v14 = 0;
    while (1)
    {
      v15 = isa;
      if (LODWORD(isa[3].super.isa) == v8)
      {
        if (!a3) {
          JreThrowNullPointerException();
        }
        if ([a3 isEqual:isa[1].super.isa]) {
          break;
        }
      }
      isa = (IOSClass *)v15[4].super.isa;
      long long v14 = v15;
      if (!isa) {
        goto LABEL_13;
      }
    }
    if (v14) {
      JreStrongAssign((id *)&v14[4].super.isa, v15[4].super.isa);
    }
    else {
      IOSObjectArray_Set((uint64_t)table, v11, v15[4].super.isa);
    }
    ++self->modCount_;
    --self->size_;
    Class v16 = v15[2].super.isa;
  }
  else
  {
LABEL_13:
    Class v16 = 0;
  }
  objc_sync_exit(self);
  return v16;
}

- (void)clear
{
  objc_sync_enter(self);
  if (self->size_)
  {
    JavaUtilArrays_fillWithNSObjectArray_withId_((int *)self->table_, 0);
    ++self->modCount_;
    self->size_ = 0;
  }
  objc_sync_exit(self);
}

- (id)keySet
{
  objc_sync_enter(self);
  keySet = self->keySet_;
  if (!keySet)
  {
    v4 = [JavaUtilHashtable_KeySet alloc];
    objc_storeWeak((id *)&v4->this$0_, self);
    JavaUtilAbstractSet_init(v4, v5);
    keySet = JreStrongAssignAndConsume((id *)&self->keySet_, v4);
  }
  objc_sync_exit(self);
  return keySet;
}

- (id)values
{
  objc_sync_enter(self);
  values = self->values_;
  if (!values)
  {
    v4 = [JavaUtilHashtable_Values alloc];
    objc_storeWeak((id *)&v4->this$0_, self);
    JavaUtilAbstractCollection_init(v4, v5);
    values = JreStrongAssignAndConsume((id *)&self->values_, v4);
  }
  objc_sync_exit(self);
  return values;
}

- (id)entrySet
{
  objc_sync_enter(self);
  entrySet = self->entrySet_;
  if (!entrySet)
  {
    v4 = [JavaUtilHashtable_EntrySet alloc];
    objc_storeWeak((id *)&v4->this$0_, self);
    JavaUtilAbstractSet_init(v4, v5);
    entrySet = JreStrongAssignAndConsume((id *)&self->entrySet_, v4);
  }
  objc_sync_exit(self);
  return entrySet;
}

- (id)keys
{
  objc_sync_enter(self);
  BOOL v3 = [JavaUtilHashtable_KeyEnumeration alloc];
  sub_100203E88((uint64_t)v3, (uint64_t)self);
  v4 = v3;
  objc_sync_exit(self);
  return v4;
}

- (id)elements
{
  objc_sync_enter(self);
  BOOL v3 = [JavaUtilHashtable_ValueEnumeration alloc];
  sub_100203E88((uint64_t)v3, (uint64_t)self);
  v4 = v3;
  objc_sync_exit(self);
  return v4;
}

- (BOOL)containsMappingWithId:(id)a3 withId:(id)a4
{
  return sub_100202FFC(self, a3, (uint64_t)a4);
}

- (BOOL)removeMappingWithId:(id)a3 withId:(id)a4
{
  return sub_100203128((uint64_t)self, a3, (uint64_t)a4);
}

- (BOOL)isEqual:(id)a3
{
  objc_sync_enter(self);
  if ([(id)JavaUtilMap_class_() isInstance:a3])
  {
    id v5 = [(JavaUtilHashtable *)self entrySet];
    if (!v5 || (int v6 = (void *)JavaUtilMap_class_(), !a3)) {
      JreThrowNullPointerException();
    }
    if (([v6 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    unsigned __int8 v7 = objc_msgSend(v5, "isEqual:", objc_msgSend(a3, "entrySet"));
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  objc_sync_exit(self);
  return v7;
}

- (unint64_t)hash
{
  objc_sync_enter(self);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(JavaUtilHashtable *)self entrySet];
  v4 = v3;
  if (!v3) {
    JreThrowNullPointerException();
  }
  int v5 = 0;
  id v6 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v9) {
          JreThrowNullPointerException();
        }
        int v10 = (JavaUtilHashtable *)[*(id *)(*((void *)&v16 + 1) + 8 * i) getKey];
        uint64_t v11 = (JavaUtilHashtable *)[v9 getValue];
        long long v12 = v11;
        if (v10 != self && v11 != self)
        {
          if (v10) {
            LODWORD(v10) = [(JavaUtilHashtable *)v10 hash];
          }
          if (v12) {
            unsigned int v14 = [(JavaUtilHashtable *)v12 hash];
          }
          else {
            unsigned int v14 = 0;
          }
          v5 += v14 ^ v10;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  objc_sync_exit(self);
  return v5;
}

- (NSString)description
{
  objc_sync_enter(self);
  id v3 = new_JavaLangStringBuilder_initWithInt_(15 * self->size_);
  [(JavaLangStringBuilder *)v3 appendWithChar:123];
  id v4 = [(JavaUtilHashtable *)self entrySet];
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [v4 iterator];
  id v6 = v5;
  if (!v5) {
    JreThrowNullPointerException();
  }
  if ([v5 hasNext])
  {
    while (1)
    {
      id v7 = [v6 next];
      int v8 = v7;
      if (!v7) {
LABEL_16:
      }
        JreThrowNullPointerException();
      uint64_t v9 = (JavaUtilHashtable *)[v7 getKey];
      if (v9 == self)
      {
        CFStringRef v10 = @"(this Map)";
      }
      else
      {
        if (!v9) {
          goto LABEL_16;
        }
        CFStringRef v10 = [(JavaUtilHashtable *)v9 description];
      }
      [(JavaLangStringBuilder *)v3 appendWithNSString:v10];
      [(JavaLangStringBuilder *)v3 appendWithChar:61];
      uint64_t v11 = (JavaUtilHashtable *)[v8 getValue];
      if (v11 == self)
      {
        CFStringRef v12 = @"(this Map)";
      }
      else
      {
        if (!v11) {
          JreThrowNullPointerException();
        }
        CFStringRef v12 = [(JavaUtilHashtable *)v11 description];
      }
      [(JavaLangStringBuilder *)v3 appendWithNSString:v12];
      if (![v6 hasNext]) {
        break;
      }
      [(JavaLangStringBuilder *)v3 appendWithNSString:@", "];
    }
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:125];
  long long v13 = [(JavaLangStringBuilder *)v3 description];
  objc_sync_exit(self);
  return v13;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  objc_sync_enter(self);
  if (!a3 || (v5 = [a3 putFields], (id v6 = v5) == 0) || (table = self->table_) == 0) {
    JreThrowNullPointerException();
  }
  float v8 = (float)table->super.size_ * 0.75;
  unsigned int v9 = (int)v8;
  if (v8 < 0.0) {
    unsigned int v10 = 0x80000000;
  }
  else {
    unsigned int v10 = 0x7FFFFFFF;
  }
  if (v9 == 0x80000000) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  [v5 putWithNSString:@"threshold" withInt:v11];
  LODWORD(v12) = 0.75;
  [v6 putWithNSString:@"loadFactor" withFloat:v12];
  [a3 writeFields];
  [a3 writeIntWithInt:self->table_->super.size_];
  [a3 writeIntWithInt:self->size_];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [(JavaUtilHashtable *)self entrySet];
  unsigned int v14 = v13;
  if (!v13) {
LABEL_20:
  }
    JreThrowNullPointerException();
  id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (!v18) {
          goto LABEL_20;
        }
        objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "getKey"));
        objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(v18, "getValue"));
      }
      id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
  objc_sync_exit(self);
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
    uint64_t v16 = @"Capacity: ";
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
  sub_100201DD0((uint64_t)self, v13);
  unsigned int v14 = [a3 readInt];
  unsigned int v15 = v14;
  if ((v14 & 0x80000000) != 0)
  {
    uint64_t v16 = @"Size: ";
LABEL_14:
    CFStringRef v17 = JreStrcat("$I", v6, v7, v8, v9, v10, v11, v12, v16);
    long long v18 = new_JavaIoInvalidObjectException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
  if (v14)
  {
    do
    {
      sub_10020267C((uint64_t)self, [a3 readObject], objc_msgSend(a3, "readObject"));
      --v15;
    }
    while (v15);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilHashtable;
  [(JavaUtilHashtable *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilHashtable *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_100560E58 != -1) {
      dispatch_once(&qword_100560E58, &stru_100441BF8);
    }
    JreStrongAssignAndConsume((id *)&qword_100560E40, +[IOSObjectArray newArrayWithLength:2 type:qword_100560E50]);
    v3[0] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"threshold", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    v3[1] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"loadFactor", (JavaLangRefWeakReference *)+[IOSClass floatClass]);
    id v2 = +[IOSObjectArray newArrayWithObjects:v3 count:2 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560E48, v2);
    atomic_store(1u, (unsigned __int8 *)JavaUtilHashtable__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004418E8;
}

@end