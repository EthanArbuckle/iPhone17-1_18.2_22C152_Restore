@interface JavaUtilLinkedList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addFirstImplWithId:(id)a3;
- (BOOL)addLastImplWithId:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)offerFirstWithId:(id)a3;
- (BOOL)offerLastWithId:(id)a3;
- (BOOL)offerWithId:(id)a3;
- (BOOL)removeFirstOccurrenceImplWithId:(id)a3;
- (BOOL)removeFirstOccurrenceWithId:(id)a3;
- (BOOL)removeLastOccurrenceWithId:(id)a3;
- (BOOL)removeOneOccurrenceWithId:(id)a3 withJavaUtilIterator:(id)a4;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilLinkedList)init;
- (JavaUtilLinkedList)initWithJavaUtilCollection:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descendingIterator;
- (id)getLast;
- (id)getWithInt:(int)a3;
- (id)listIteratorWithInt:(int)a3;
- (id)peek;
- (id)peekFirst;
- (id)peekFirstImpl;
- (id)peekLast;
- (id)poll;
- (id)pollFirst;
- (id)pollLast;
- (id)removeLastImpl;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (int)size;
- (uint64_t)getFirstImpl;
- (uint64_t)removeFirstImpl;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addFirstWithId:(id)a3;
- (void)addLastWithId:(id)a3;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)pushWithId:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilLinkedList

- (JavaUtilLinkedList)init
{
  return self;
}

- (JavaUtilLinkedList)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  if (a3 < 0 || (int v6 = *(&self->super.super.modCount_ + 1), v6 < a3))
  {
    v13 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v13);
  }
  id Weak = *(id *)&self->size_;
  if (a3 < v6 >> 1)
  {
    int v9 = a3 + 1;
    while (Weak)
    {
      id Weak = (id)*((void *)Weak + 3);
      if (!--v9) {
        goto LABEL_7;
      }
    }
    goto LABEL_13;
  }
  while (v6 > a3)
  {
    if (!Weak) {
      goto LABEL_13;
    }
    id Weak = objc_loadWeak((id *)Weak + 2);
    --v6;
  }
LABEL_7:
  if (!Weak
    || (v10 = (id *)objc_loadWeak((id *)Weak + 2),
        v11 = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_(a4, v10, Weak), !v10))
  {
LABEL_13:
    JreThrowNullPointerException();
  }
  v12 = v11;
  JreStrongAssign(v10 + 3, v11);
  objc_storeWeak((id *)Weak + 2, v12);
  ++*(&self->super.super.modCount_ + 1);
  ++self->super.super.modCount_;
}

- (BOOL)addWithId:(id)a3
{
  return 1;
}

- (BOOL)addLastImplWithId:(id)a3
{
  return 1;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  if (a3 < 0 || (int v4 = a3, *(&self->super.super.modCount_ + 1) < a3))
  {
    v19 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v19);
  }
  int v6 = (JavaUtilArrayList *)a4;
  if (!a4) {
    goto LABEL_30;
  }
  unsigned int v7 = [a4 size];
  if (v7)
  {
    if (v6 == (JavaUtilArrayList *)self) {
      int v6 = new_JavaUtilArrayList_initWithJavaUtilCollection_(self);
    }
    id Weak = *(JavaUtilLinkedList_Link **)&self->size_;
    int v9 = *(&self->super.super.modCount_ + 1);
    if (v9 >= 0) {
      int v10 = *(&self->super.super.modCount_ + 1);
    }
    else {
      int v10 = v9 + 1;
    }
    if (v4 >= v10 >> 1)
    {
      if (v9 >= v4)
      {
        int v11 = v9 + 1;
        while (Weak)
        {
          id Weak = (JavaUtilLinkedList_Link *)objc_loadWeak((id *)&Weak->previous_);
          if (--v11 <= v4) {
            goto LABEL_19;
          }
        }
LABEL_30:
        JreThrowNullPointerException();
      }
    }
    else if (v4)
    {
      while (Weak)
      {
        id Weak = Weak->next_;
        if (!--v4) {
          goto LABEL_19;
        }
      }
      goto LABEL_30;
    }
LABEL_19:
    if (!Weak) {
      goto LABEL_30;
    }
    p_isa = (id *)&Weak->next_->super.isa;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = [(JavaUtilArrayList *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        v16 = 0;
        v17 = (id *)&Weak->super.isa;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v6);
          }
          id Weak = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_(*(void **)(*((void *)&v20 + 1) + 8 * (void)v16), v17, 0);
          JreStrongAssign(v17 + 3, Weak);
          v16 = (char *)v16 + 1;
          v17 = (id *)&Weak->super.isa;
        }
        while (v14 != v16);
        id v14 = [(JavaUtilArrayList *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
    JreStrongAssign((id *)&Weak->next_, p_isa);
    if (!p_isa) {
      goto LABEL_30;
    }
    objc_storeWeak(p_isa + 2, Weak);
    *(&self->super.super.modCount_ + 1) += v7;
    ++self->super.super.modCount_;
  }
  return v7 != 0;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  if (!a3) {
    goto LABEL_17;
  }
  v3 = (JavaUtilArrayList *)a3;
  unsigned int v5 = [a3 size];
  if (v5)
  {
    if (v3 == (JavaUtilArrayList *)self) {
      v3 = new_JavaUtilArrayList_initWithJavaUtilCollection_(v3);
    }
    uint64_t v6 = *(void *)&self->size_;
    if (v6)
    {
      id Weak = (id *)objc_loadWeak((id *)(v6 + 16));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = [(JavaUtilArrayList *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          int v11 = 0;
          v12 = Weak;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v3);
            }
            id v13 = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_(*(void **)(*((void *)&v15 + 1) + 8 * (void)v11), v12, 0);
            if (!v12) {
              goto LABEL_17;
            }
            id Weak = (id *)&v13->super.isa;
            JreStrongAssign(v12 + 3, v13);
            int v11 = (char *)v11 + 1;
            v12 = Weak;
          }
          while (v9 != v11);
          id v9 = [(JavaUtilArrayList *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
      if (Weak)
      {
        JreStrongAssign(Weak + 3, *(void **)&self->size_);
        objc_storeWeak((id *)(*(void *)&self->size_ + 16), Weak);
        *(&self->super.super.modCount_ + 1) += v5;
        ++self->super.super.modCount_;
        return v5 != 0;
      }
    }
LABEL_17:
    JreThrowNullPointerException();
  }
  return v5 != 0;
}

- (void)addFirstWithId:(id)a3
{
}

- (BOOL)addFirstImplWithId:(id)a3
{
  return 1;
}

- (void)addLastWithId:(id)a3
{
}

- (void)clear
{
  if (*(&self->super.super.modCount_ + 1) >= 1)
  {
    *(&self->super.super.modCount_ + 1) = 0;
    v3 = *(id **)&self->size_;
    if (!v3) {
      JreThrowNullPointerException();
    }
    JreStrongAssign(v3 + 3, v3);
    objc_storeWeak((id *)(*(void *)&self->size_ + 16), *(id *)&self->size_);
    ++self->super.super.modCount_;
  }
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilLinkedList;
  v3 = [(JavaUtilLinkedList *)&v7 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  *((_DWORD *)v3 + 3) = 0;
  int v4 = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_(0, 0, 0);
  unsigned int v5 = v3 + 2;
  JreStrongAssignAndConsume(v3 + 2, v4);
  objc_storeWeak((id *)*v5 + 2, *v5);
  JreStrongAssign((id *)*v5 + 3, *v5);
  [v3 addAllWithJavaUtilCollection:self];
  return v3;
}

- (BOOL)containsWithId:(id)a3
{
  uint64_t v3 = *(void *)&self->size_;
  if (!v3) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)(v3 + 24);
  if (a3)
  {
    if (v5 != v3)
    {
      while (v5)
      {
        BOOL result = [a3 isEqual:*(void *)(v5 + 8)];
        if (!result)
        {
          uint64_t v5 = *(void *)(v5 + 24);
          if (v5 != *(void *)&self->size_) {
            continue;
          }
        }
        return result;
      }
      goto LABEL_15;
    }
  }
  else if (v5 != v3)
  {
    while (v5)
    {
      uint64_t v8 = *(void *)(v5 + 8);
      BOOL result = v8 == 0;
      if (v8)
      {
        uint64_t v5 = *(void *)(v5 + 24);
        if (v5 != v3) {
          continue;
        }
      }
      return result;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)getWithInt:(int)a3
{
  if (a3 < 0 || (int v4 = *(&self->super.super.modCount_ + 1), v4 <= a3))
  {
    uint64_t v8 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v8);
  }
  id Weak = *(id *)&self->size_;
  if (a3 < v4 >> 1)
  {
    int v6 = a3 + 1;
    while (Weak)
    {
      id Weak = (id)*((void *)Weak + 3);
      if (!--v6) {
        goto LABEL_10;
      }
    }
    goto LABEL_12;
  }
  do
  {
    if (!Weak) {
      goto LABEL_12;
    }
    id Weak = objc_loadWeak((id *)Weak + 2);
    --v4;
  }
  while (v4 > a3);
LABEL_10:
  if (!Weak) {
LABEL_12:
  }
    JreThrowNullPointerException();
  return (id)*((void *)Weak + 1);
}

- (uint64_t)getFirstImpl
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    goto LABEL_5;
  }
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2 == v1)
  {
    int v4 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v4);
  }
  if (!v2) {
LABEL_5:
  }
    JreThrowNullPointerException();
  return *(void *)(v2 + 8);
}

- (id)getLast
{
  uint64_t v2 = *(void *)&self->size_;
  if (!v2) {
    goto LABEL_5;
  }
  id Weak = objc_loadWeak((id *)(v2 + 16));
  if (Weak == *(id *)&self->size_)
  {
    int v6 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v6);
  }
  if (!Weak) {
LABEL_5:
  }
    JreThrowNullPointerException();
  return (id)*((void *)Weak + 1);
}

- (int)indexOfWithId:(id)a3
{
  uint64_t v3 = *(void *)&self->size_;
  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)(v3 + 24);
  if (a3)
  {
    if (v5 != v3)
    {
      int v7 = 0;
      while (v5)
      {
        if ([a3 isEqual:*(void *)(v5 + 8)]) {
          return v7;
        }
        uint64_t v5 = *(void *)(v5 + 24);
        ++v7;
        if (v5 == *(void *)&self->size_) {
          return -1;
        }
      }
      goto LABEL_16;
    }
  }
  else if (v5 != v3)
  {
    int v7 = 0;
    while (v5)
    {
      if (!*(void *)(v5 + 8)) {
        return v7;
      }
      uint64_t v5 = *(void *)(v5 + 24);
      ++v7;
      if (v5 == v3) {
        return -1;
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  return -1;
}

- (int)lastIndexOfWithId:(id)a3
{
  uint64_t v3 = *(void *)&self->size_;
  if (!v3) {
    goto LABEL_16;
  }
  int v6 = *(&self->super.super.modCount_ + 1);
  id Weak = objc_loadWeak((id *)(v3 + 16));
  id v8 = Weak;
  id v9 = *(id *)&self->size_;
  if (a3)
  {
    if (Weak != v9)
    {
      int v10 = v6 - 1;
      while (v8)
      {
        if ([a3 isEqual:*((void *)v8 + 1)]) {
          return v10;
        }
        id v8 = objc_loadWeak((id *)v8 + 2);
        --v10;
        if (v8 == *(id *)&self->size_) {
          return -1;
        }
      }
      goto LABEL_16;
    }
  }
  else if (Weak != v9)
  {
    int v10 = v6 - 1;
    while (v8)
    {
      if (!*((void *)v8 + 1)) {
        return v10;
      }
      id v8 = objc_loadWeak((id *)v8 + 2);
      --v10;
      if (v8 == *(id *)&self->size_) {
        return -1;
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  return -1;
}

- (id)listIteratorWithInt:(int)a3
{
  uint64_t v5 = [JavaUtilLinkedList_LinkIterator alloc];
  sub_1001B0CD4((uint64_t)v5, self, a3);
  return v5;
}

- (id)removeWithInt:(int)a3
{
  if (a3 < 0 || (int v5 = *(&self->super.super.modCount_ + 1), v5 <= a3))
  {
    v12 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v12);
  }
  id Weak = *(id *)&self->size_;
  if (a3 < v5 >> 1)
  {
    int v7 = a3 + 1;
    while (Weak)
    {
      id Weak = (id)*((void *)Weak + 3);
      if (!--v7) {
        goto LABEL_10;
      }
    }
    goto LABEL_14;
  }
  do
  {
    if (!Weak) {
      goto LABEL_14;
    }
    id Weak = objc_loadWeak((id *)Weak + 2);
    --v5;
  }
  while (v5 > a3);
LABEL_10:
  if (!Weak
    || (id v8 = (id *)objc_loadWeak((id *)Weak + 2)) == 0
    || (id v9 = v8, v10 = (id *)*((void *)Weak + 3), JreStrongAssign(v8 + 3, v10), !v10))
  {
LABEL_14:
    JreThrowNullPointerException();
  }
  objc_storeWeak(v10 + 2, v9);
  --*(&self->super.super.modCount_ + 1);
  ++self->super.super.modCount_;
  return (id)*((void *)Weak + 1);
}

- (BOOL)removeWithId:(id)a3
{
  return sub_1001B0118(self, a3);
}

- (uint64_t)removeFirstImpl
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)(v1 + 24);
  if (v3 == v1)
  {
    int v6 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v6);
  }
  if (!v3 || (int v4 = *(id **)(v3 + 24), JreStrongAssign((id *)(v1 + 24), v4), !v4)) {
LABEL_6:
  }
    JreThrowNullPointerException();
  objc_storeWeak(v4 + 2, *(id *)(a1 + 16));
  --*(_DWORD *)(a1 + 12);
  ++*(_DWORD *)(a1 + 8);
  return *(void *)(v3 + 8);
}

- (id)removeLastImpl
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    goto LABEL_6;
  }
  id Weak = (id *)objc_loadWeak((id *)(v1 + 16));
  if (Weak == *(id **)(a1 + 16))
  {
    int v7 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v7);
  }
  int v4 = Weak;
  if (!Weak || (int v5 = (id *)objc_loadWeak(Weak + 2), objc_storeWeak((id *)(*(void *)(a1 + 16) + 16), v5), !v5)) {
LABEL_6:
  }
    JreThrowNullPointerException();
  JreStrongAssign(v5 + 3, *(void **)(a1 + 16));
  --*(_DWORD *)(a1 + 12);
  ++*(_DWORD *)(a1 + 8);
  return v4[1];
}

- (id)descendingIterator
{
  uint64_t v3 = [JavaUtilLinkedList_ReverseLinkIterator alloc];
  sub_1001B1384((uint64_t)v3, self);
  return v3;
}

- (BOOL)offerFirstWithId:(id)a3
{
  return 1;
}

- (BOOL)offerLastWithId:(id)a3
{
  return 1;
}

- (id)peekFirst
{
  uint64_t v2 = *(void *)&self->size_;
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 != v2)
  {
    if (v3) {
      return *(id *)(v3 + 8);
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)peekLast
{
  uint64_t v2 = *(void *)&self->size_;
  if (!v2) {
    goto LABEL_6;
  }
  id Weak = objc_loadWeak((id *)(v2 + 16));
  if (Weak != *(id *)&self->size_)
  {
    if (Weak) {
      return (id)*((void *)Weak + 1);
    }
LABEL_6:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)pollFirst
{
  if (*(&self->super.super.modCount_ + 1)) {
    return (id)-[JavaUtilLinkedList removeFirstImpl]_0((uint64_t)self);
  }
  else {
    return 0;
  }
}

- (id)pollLast
{
  if (*(&self->super.super.modCount_ + 1)) {
    return -[JavaUtilLinkedList removeLastImpl]_0((uint64_t)self);
  }
  else {
    return 0;
  }
}

- (void)pushWithId:(id)a3
{
}

- (BOOL)removeFirstOccurrenceWithId:(id)a3
{
  return sub_1001B0118(self, a3);
}

- (BOOL)removeLastOccurrenceWithId:(id)a3
{
  int v5 = [JavaUtilLinkedList_ReverseLinkIterator alloc];
  sub_1001B1384((uint64_t)v5, self);
  int v6 = v5;
  return sub_1001B04E0(a3, v6);
}

- (BOOL)removeFirstOccurrenceImplWithId:(id)a3
{
  return sub_1001B0118(self, a3);
}

- (BOOL)removeOneOccurrenceWithId:(id)a3 withJavaUtilIterator:(id)a4
{
  return sub_1001B04E0(a3, a4);
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  if (a3 < 0 || (int v5 = *(&self->super.super.modCount_ + 1), v5 <= a3))
  {
    int v11 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v11);
  }
  id Weak = *(id *)&self->size_;
  if (a3 < v5 >> 1)
  {
    int v8 = a3 + 1;
    while (Weak)
    {
      id Weak = (id)*((void *)Weak + 3);
      if (!--v8) {
        goto LABEL_10;
      }
    }
    goto LABEL_12;
  }
  do
  {
    if (!Weak) {
      goto LABEL_12;
    }
    id Weak = objc_loadWeak((id *)Weak + 2);
    --v5;
  }
  while (v5 > a3);
LABEL_10:
  if (!Weak) {
LABEL_12:
  }
    JreThrowNullPointerException();
  id v9 = (void *)*((void *)Weak + 1);
  JreStrongAssign((id *)Weak + 1, a4);
  return v9;
}

- (int)size
{
  return *(&self->super.super.modCount_ + 1);
}

- (BOOL)offerWithId:(id)a3
{
  return 1;
}

- (id)poll
{
  if (*(&self->super.super.modCount_ + 1)) {
    return [(JavaUtilLinkedList *)self removeFirst];
  }
  else {
    return 0;
  }
}

- (id)peek
{
  uint64_t v2 = *(void *)&self->size_;
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 != v2)
  {
    if (v3) {
      return *(id *)(v3 + 8);
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)peekFirstImpl
{
  uint64_t v2 = *(void *)&self->size_;
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 != v2)
  {
    if (v3) {
      return *(id *)(v3 + 8);
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 0;
}

- (id)toArray
{
  uint64_t v3 = +[IOSObjectArray arrayWithLength:*(&self->super.super.modCount_ + 1) type:NSObject_class_()];
  uint64_t v4 = *(void *)&self->size_;
  if (!v4) {
    goto LABEL_7;
  }
  int v5 = v3;
  uint64_t v6 = *(void *)(v4 + 24);
  if (v6 != v4)
  {
    int v7 = 0;
    while (v6)
    {
      uint64_t v8 = v7++;
      IOSObjectArray_Set((uint64_t)v5, v8, *(void **)(v6 + 8));
      uint64_t v6 = *(void *)(v6 + 24);
      if (v6 == *(void *)&self->size_) {
        return v5;
      }
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return v5;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  uint64_t v3 = a3;
  if (*(&self->super.super.modCount_ + 1) > *((_DWORD *)a3 + 2))
  {
    uint64_t v3 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), *(&self->super.super.modCount_ + 1));
    objc_opt_class();
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
  }
  uint64_t v5 = *(void *)&self->size_;
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6 != v5)
  {
    if (v3)
    {
      int v7 = 0;
      while (v6)
      {
        uint64_t v8 = v7++;
        IOSObjectArray_Set((uint64_t)v3, v8, *(void **)(v6 + 8));
        uint64_t v6 = *(void *)(v6 + 24);
        if (v6 == *(void *)&self->size_) {
          goto LABEL_11;
        }
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  int v7 = 0;
  if (!v3) {
    goto LABEL_15;
  }
LABEL_11:
  if (v7 < v3[2]) {
    IOSObjectArray_Set((uint64_t)v3, v7, 0);
  }
  return v3;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3
    || ([a3 defaultWriteObject],
        [a3 writeIntWithInt:*((unsigned int *)&self->super.super.modCount_ + 1)],
        (id v5 = [(JavaUtilAbstractSequentialList *)self iterator]) == 0))
  {
    JreThrowNullPointerException();
  }
  uint64_t v6 = v5;
  if ([v5 hasNext])
  {
    do
      objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(v6, "next"));
    while (([v6 hasNext] & 1) != 0);
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  *(&self->super.super.modCount_ + 1) = [a3 readInt];
  p_size = &self->size_;
  uint64_t v6 = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_(0, 0, 0);
  JreStrongAssignAndConsume((id *)&self->size_, v6);
  int v7 = *(JavaUtilLinkedList_Link **)&self->size_;
  int v8 = *(&self->super.super.modCount_ + 1);
  if (v8 - 1 < 0)
  {
    int v10 = *(void **)p_size;
  }
  else
  {
    do
    {
      id v9 = v7;
      int v7 = new_JavaUtilLinkedList_Link_initWithId_withJavaUtilLinkedList_Link_withJavaUtilLinkedList_Link_([a3 readObject], v7, 0);
      JreStrongAssign((id *)&v9->next_, v7);
      --v8;
    }
    while (v8);
    int v10 = *(void **)p_size;
  }
  JreStrongAssign((id *)&v7->next_, v10);
  int v11 = (id *)(*(void *)p_size + 16);
  objc_storeWeak(v11, v7);
}

- (void)dealloc
{
  [(JavaUtilLinkedList *)self clear];
  id v3 = JreStrongAssign((id *)(*(void *)&self->size_ + 24), 0);
  uint64_t v4 = *(void *)&self->size_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  objc_storeWeak((id *)(v4 + 16), v3);

  v5.receiver = self;
  v5.super_class = (Class)JavaUtilLinkedList;
  [(JavaUtilLinkedList *)&v5 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5 = a3->var3[0];
  if (!v5)
  {
    a3->var2 = (unint64_t *)&self->super.super.modCount_;
    unint64_t v5 = *(void *)(*(void *)&self->size_ + 24);
  }
  a3->var1 = a4;
  for (i = 0; v5 != *(void *)&self->size_ && i < a5; unint64_t v5 = *(void *)(v5 + 24))
    a4[i++] = *(id *)(v5 + 8);
  a3->var3[0] = v5;
  return i;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilLinkedList *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100419008;
}

@end