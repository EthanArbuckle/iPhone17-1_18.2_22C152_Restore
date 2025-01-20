@interface JavaUtilArrayList
+ (const)__metadata;
+ (id)throwIndexOutOfBoundsExceptionWithInt:(int)a3 withInt:(int)a4;
+ (int)newCapacityWithInt:(int)a3;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (JavaUtilArrayList)init;
- (JavaUtilArrayList)initWithInt:(int)a3;
- (JavaUtilArrayList)initWithJavaUtilCollection:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getWithInt:(int)a3;
- (id)iterator;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)ensureCapacityWithInt:(int)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)removeRangeWithInt:(int)a3 withInt:(int)a4;
- (void)trimToSize;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilArrayList

- (JavaUtilArrayList)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilArrayList)init
{
  return self;
}

- (JavaUtilArrayList)initWithJavaUtilCollection:(id)a3
{
  return self;
}

- (BOOL)addWithId:(id)a3
{
  p_size = &self->size_;
  v4 = *(IOSObjectArray **)&self->size_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(&self->super.modCount_ + 1);
  if (v7 == v4->super.size_)
  {
    unsigned int v8 = v7 >> 1;
    if ((int)v7 < 6) {
      unsigned int v8 = 12;
    }
    v9 = +[IOSObjectArray arrayWithLength:(int)(v8 + v7) type:NSObject_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v4, 0, v9, 0, v7);
    JreStrongAssign((id *)p_size, v9);
    v4 = v9;
  }
  IOSObjectArray_Set((uint64_t)v4, v7, a3);
  *(&self->super.modCount_ + 1) = v7 + 1;
  ++self->super.modCount_;
  return 1;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v9 = *((unsigned int *)&self->super.modCount_ + 1);
  if (a3 < 0 || (int)v9 < a3) {
    JavaUtilArrayList_throwIndexOutOfBoundsExceptionWithInt_withInt_(*(uint64_t *)&a3, v9, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  p_size = &self->size_;
  v12 = *(IOSObjectArray **)&self->size_;
  if (!v12) {
    JreThrowNullPointerException();
  }
  if ((int)v9 >= v12->super.size_)
  {
    unsigned int v14 = v9 >> 1;
    if ((int)v9 < 6) {
      unsigned int v14 = 12;
    }
    v15 = +[IOSObjectArray arrayWithLength:(int)(v14 + v9) type:NSObject_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v12, 0, v15, 0, v8);
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v12, v8, v15, (v8 + 1), (v9 - v8));
    JreStrongAssign((id *)p_size, v15);
    v12 = v15;
  }
  else
  {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*(id *)&self->size_, *(uint64_t *)&a3, v12, (a3 + 1), (v9 - a3));
  }
  IOSObjectArray_Set((uint64_t)v12, v8, a4);
  *(&self->super.modCount_ + 1) = v9 + 1;
  ++self->super.modCount_;
}

+ (int)newCapacityWithInt:(int)a3
{
  unsigned int v3 = a3 >> 1;
  if (a3 < 6) {
    unsigned int v3 = 12;
  }
  return v3 + a3;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  if (!a3) {
    goto LABEL_11;
  }
  uint64_t v4 = (unsigned int *)[a3 toArray];
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v5 = v4;
  uint64_t v6 = v4[2];
  if (!v6) {
    return v6 != 0;
  }
  uint64_t v7 = *(IOSObjectArray **)&self->size_;
  if (!v7) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v8 = *((unsigned int *)&self->super.modCount_ + 1);
  int v9 = v8 + v6;
  if ((int)v8 + (int)v6 > v7->super.size_)
  {
    unsigned int v10 = (v9 - 1) >> 1;
    if (v9 < 7) {
      unsigned int v10 = 12;
    }
    v11 = +[IOSObjectArray arrayWithLength:(int)(v10 + v9 - 1) type:NSObject_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v7, 0, v11, 0, v8);
    JreStrongAssign((id *)&self->size_, v11);
    uint64_t v7 = v11;
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v5, 0, v7, v8, v6);
  *(&self->super.modCount_ + 1) = v9;
  ++self->super.modCount_;
  return v6 != 0;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v9 = *((unsigned int *)&self->super.modCount_ + 1);
  if (a3 < 0 || (unsigned int v10 = v9 - a3, (int)v9 < a3)) {
    JavaUtilArrayList_throwIndexOutOfBoundsExceptionWithInt_withInt_(*(uint64_t *)&a3, v9, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  if (!a4) {
    goto LABEL_14;
  }
  v12 = (unsigned int *)[a4 toArray];
  if (!v12) {
    goto LABEL_14;
  }
  v13 = v12;
  uint64_t v14 = v12[2];
  if (!v14) {
    return v14 != 0;
  }
  v15 = *(IOSObjectArray **)&self->size_;
  if (!v15) {
LABEL_14:
  }
    JreThrowNullPointerException();
  int v16 = v14 + v9;
  if ((int)v14 + (int)v9 <= v15->super.size_)
  {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*(id *)&self->size_, v8, *(void **)&self->size_, (v14 + v8), (v9 - v8));
  }
  else
  {
    unsigned int v17 = (v16 - 1) >> 1;
    if (v16 < 7) {
      unsigned int v17 = 12;
    }
    v18 = +[IOSObjectArray arrayWithLength:(int)(v17 + v16 - 1) type:NSObject_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v15, 0, v18, 0, v8);
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v15, v8, v18, (v14 + v8), v10);
    JreStrongAssign((id *)&self->size_, v18);
    v15 = v18;
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v13, 0, v15, v8, v14);
  *(&self->super.modCount_ + 1) = v16;
  ++self->super.modCount_;
  return v14 != 0;
}

+ (id)throwIndexOutOfBoundsExceptionWithInt:(int)a3 withInt:(int)a4
{
  JavaUtilArrayList_throwIndexOutOfBoundsExceptionWithInt_withInt_(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

- (void)clear
{
  uint64_t v6 = *((unsigned int *)&self->super.modCount_ + 1);
  if (v6)
  {
    JavaUtilArrays_fillWithNSObjectArray_withInt_withInt_withId_(*(void *)&self->size_, 0, v6, 0, v2, v3, v4, v5);
    *(&self->super.modCount_ + 1) = 0;
    ++self->super.modCount_;
  }
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)JavaUtilArrayList;
  uint64_t v3 = [(JavaUtilArrayList *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_5;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v4 = *(void **)&self->size_;
  if (!v4) {
LABEL_5:
  }
    JreThrowNullPointerException();
  JreStrongAssign(v3 + 2, [v4 clone]);
  return v3;
}

- (void)ensureCapacityWithInt:(int)a3
{
  p_size = &self->size_;
  uint64_t v4 = *(_DWORD **)&self->size_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  if (v4[2] < a3)
  {
    objc_super v6 = +[IOSObjectArray arrayWithLength:a3 type:NSObject_class_()];
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v4, 0, v6, 0, *((unsigned int *)&self->super.modCount_ + 1));
    JreStrongAssign((id *)p_size, v6);
    ++self->super.modCount_;
  }
}

- (id)getWithInt:(int)a3
{
  uint64_t v8 = *((unsigned int *)&self->super.modCount_ + 1);
  if ((int)v8 <= a3) {
    JavaUtilArrayList_throwIndexOutOfBoundsExceptionWithInt_withInt_(*(uint64_t *)&a3, v8, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  uint64_t v9 = *(void *)&self->size_;
  if (!v9) {
    JreThrowNullPointerException();
  }
  uint64_t v10 = *(unsigned int *)(v9 + 8);
  if (a3 < 0 || (int)v10 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v10, *(uint64_t *)&a3);
  }
  return *(id *)(v9 + 24 + 8 * a3);
}

- (int)size
{
  return *(&self->super.modCount_ + 1);
}

- (BOOL)isEmpty
{
  return *(&self->super.modCount_ + 1) == 0;
}

- (BOOL)containsWithId:(id)a3
{
  uint64_t v3 = *(void *)&self->size_;
  uint64_t v4 = *((unsigned int *)&self->super.modCount_ + 1);
  if (a3)
  {
    if ((int)v4 >= 1)
    {
      if (v3)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v4 - 1;
        do
        {
          uint64_t v8 = *(int *)(v3 + 8);
          if (v6 >= v8) {
            IOSArray_throwOutOfBoundsWithMsg(v8, v6);
          }
          BOOL result = [a3 isEqual:*(void *)(v3 + 24 + 8 * v6)];
          if (result) {
            break;
          }
          BOOL v14 = v7 == v6++;
        }
        while (!v14);
        return result;
      }
LABEL_24:
      JreThrowNullPointerException();
    }
    return 0;
  }
  if ((int)v4 < 1) {
    return 0;
  }
  if (!v3) {
    goto LABEL_24;
  }
  uint64_t v10 = 0;
  int v11 = v4 - 1;
  do
  {
    uint64_t v12 = *(unsigned int *)(v3 + 8);
    if ((int)v10 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v10);
    }
    uint64_t v13 = *(void *)(v3 + 24 + 8 * v10);
    BOOL result = v13 == 0;
    if (v13) {
      BOOL v14 = v11 == v10;
    }
    else {
      BOOL v14 = 1;
    }
    ++v10;
  }
  while (!v14);
  return result;
}

- (int)indexOfWithId:(id)a3
{
  uint64_t v3 = *(void *)&self->size_;
  uint64_t v4 = *((unsigned int *)&self->super.modCount_ + 1);
  if (a3)
  {
    if ((int)v4 >= 1)
    {
      if (v3)
      {
        uint64_t v6 = 0;
        while (1)
        {
          uint64_t v7 = *(int *)(v3 + 8);
          if (v6 >= v7) {
            IOSArray_throwOutOfBoundsWithMsg(v7, v6);
          }
          if ([a3 isEqual:*(void *)(v3 + 24 + 8 * v6)]) {
            break;
          }
          if (v4 == ++v6) {
            goto LABEL_18;
          }
        }
        LODWORD(v8) = v6;
        return v8;
      }
LABEL_21:
      JreThrowNullPointerException();
    }
LABEL_18:
    LODWORD(v8) = -1;
    return v8;
  }
  if ((int)v4 < 1) {
    goto LABEL_18;
  }
  if (!v3) {
    goto LABEL_21;
  }
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = *(unsigned int *)(v3 + 8);
    if ((int)v8 >= (int)v9) {
      IOSArray_throwOutOfBoundsWithMsg(v9, v8);
    }
    if (!*(void *)(v3 + 24 + 8 * v8)) {
      return v8;
    }
    if (v4 == ++v8) {
      goto LABEL_18;
    }
  }
}

- (int)lastIndexOfWithId:(id)a3
{
  uint64_t v3 = *(void *)&self->size_;
  LODWORD(v4) = *(&self->super.modCount_ + 1);
  if (a3)
  {
    while (1)
    {
      uint64_t v4 = (v4 - 1);
      if ((int)v4 < 0) {
        break;
      }
      if (!v3) {
        goto LABEL_16;
      }
      uint64_t v6 = *(unsigned int *)(v3 + 8);
      if ((int)v4 >= (int)v6) {
        IOSArray_throwOutOfBoundsWithMsg(v6, v4);
      }
      if ([a3 isEqual:*(void *)(v3 + 24 + 8 * v4)]) {
        return v4;
      }
    }
  }
  else
  {
    while (1)
    {
      uint64_t v7 = (v4 - 1);
      if ((int)v4 - 1 < 0) {
        break;
      }
      if (!v3) {
LABEL_16:
      }
        JreThrowNullPointerException();
      LODWORD(v4) = v4 - 1;
      uint64_t v8 = *(unsigned int *)(v3 + 8);
      if ((int)v7 >= (int)v8) {
        IOSArray_throwOutOfBoundsWithMsg(v8, v7);
      }
      if (!*(void *)(v3 + 24 + 8 * v7)) {
        return v4;
      }
    }
  }
  LODWORD(v4) = -1;
  return v4;
}

- (id)removeWithInt:(int)a3
{
  uint64_t v8 = *(&self->super.modCount_ + 1);
  if ((int)v8 <= a3) {
    JavaUtilArrayList_throwIndexOutOfBoundsExceptionWithInt_withInt_(*(uint64_t *)&a3, v8, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  }
  uint64_t v10 = *(unsigned int **)&self->size_;
  if (!v10) {
    JreThrowNullPointerException();
  }
  uint64_t v11 = v10[2];
  if (a3 < 0 || (int)v11 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v11, *(uint64_t *)&a3);
  }
  uint64_t v12 = *(void **)&v10[2 * a3 + 6];
  uint64_t v13 = v8 - 1;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v10, (a3 + 1), v10, *(uint64_t *)&a3, (v13 - a3));
  IOSObjectArray_Set((uint64_t)v10, v13, 0);
  *(&self->super.modCount_ + 1) = v13;
  ++self->super.modCount_;
  return v12;
}

- (BOOL)removeWithId:(id)a3
{
  uint64_t v4 = *(void *)&self->size_;
  uint64_t v5 = *((unsigned int *)&self->super.modCount_ + 1);
  if (!a3)
  {
    if ((int)v5 >= 1)
    {
      if (v4)
      {
        uint64_t v9 = 0;
        uint64_t v10 = (v5 - 1);
        while (1)
        {
          uint64_t v11 = *(unsigned int *)(v4 + 8);
          if ((int)v9 >= (int)v11) {
            IOSArray_throwOutOfBoundsWithMsg(v11, v9);
          }
          if (!*(void *)(v4 + 24 + 8 * v9)) {
            break;
          }
          uint64_t v10 = (v10 - 1);
          ++v9;
          if (v10 == -1) {
            return 0;
          }
        }
        int v14 = v5 - 1;
        uint64_t v13 = (v9 + 1);
        int v16 = (void *)v4;
        unsigned int v17 = (void *)v4;
        uint64_t v18 = v9;
        uint64_t v15 = v10;
        goto LABEL_21;
      }
LABEL_22:
      JreThrowNullPointerException();
    }
    return 0;
  }
  if ((int)v5 < 1) {
    return 0;
  }
  if (!v4) {
    goto LABEL_22;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = *(int *)(v4 + 8);
    if (v7 >= v8) {
      IOSArray_throwOutOfBoundsWithMsg(v8, v7);
    }
    if ([a3 isEqual:*(void *)(v4 + 24 + 8 * v7)]) {
      break;
    }
    if (v5 == ++v7) {
      return 0;
    }
  }
  uint64_t v13 = (v7 + 1);
  int v14 = v5 - 1;
  uint64_t v15 = (v14 - v7);
  int v16 = (void *)v4;
  unsigned int v17 = (void *)v4;
  uint64_t v18 = v7;
LABEL_21:
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v16, v13, v17, v18, v15);
  IOSObjectArray_Set(v4, v14, 0);
  *(&self->super.modCount_ + 1) = v14;
  ++self->super.modCount_;
  return 1;
}

- (void)removeRangeWithInt:(int)a3 withInt:(int)a4
{
  if (a3 != a4)
  {
    if (a3 < 0)
    {
      CFStringRef v17 = JreStrcat("$I", *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a3, v4, v5, v6, v7, @"Array index out of range: ");
      goto LABEL_12;
    }
    uint64_t v9 = *((unsigned int *)&self->super.modCount_ + 1);
    if ((int)v9 > a3)
    {
      uint64_t v4 = (v9 - a4);
      if ((int)v9 < a4)
      {
        CFStringRef v17 = JreStrcat("$I$I", *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a3, v4, v5, v6, v7, @"toIndex ");
        goto LABEL_12;
      }
      int v10 = a3 - a4;
      if (a3 <= a4)
      {
        uint64_t v11 = *(void **)&self->size_;
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v11, *(uint64_t *)&a4, v11, *(uint64_t *)&a3, v4);
        uint64_t v12 = (v9 + v10);
        JavaUtilArrays_fillWithNSObjectArray_withInt_withInt_withId_((uint64_t)v11, v12, v9, 0, v13, v14, v15, v16);
        *(&self->super.modCount_ + 1) = v12;
        ++self->super.modCount_;
        return;
      }
    }
    CFStringRef v17 = JreStrcat("$I$I", *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a3, v4, v5, v6, v7, @"fromIndex ");
LABEL_12:
    uint64_t v18 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  uint64_t v8 = *((unsigned int *)&self->super.modCount_ + 1);
  if ((int)v8 <= a3) {
    JavaUtilArrayList_throwIndexOutOfBoundsExceptionWithInt_withInt_(*(uint64_t *)&a3, v8, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  uint64_t v9 = *(void *)&self->size_;
  if (!v9) {
    JreThrowNullPointerException();
  }
  uint64_t v10 = *(unsigned int *)(v9 + 8);
  if (a3 < 0 || (int)v10 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v10, *(uint64_t *)&a3);
  }
  uint64_t v11 = *(void **)(v9 + 24 + 8 * a3);
  IOSObjectArray_Set(v9, a3, a4);
  return v11;
}

- (id)toArray
{
  uint64_t v3 = *((unsigned int *)&self->super.modCount_ + 1);
  uint64_t v4 = +[IOSObjectArray arrayWithLength:(int)v3 type:NSObject_class_()];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*(id *)&self->size_, 0, v4, 0, v3);
  return v4;
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v3 = a3;
  uint64_t v5 = *(&self->super.modCount_ + 1);
  if (*((_DWORD *)a3 + 2) < (int)v5)
  {
    uint64_t v3 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), v5);
    objc_opt_class();
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*(id *)&self->size_, 0, v3, 0, v5);
  if (!v3) {
LABEL_9:
  }
    JreThrowNullPointerException();
  if (v3[2] > (int)v5) {
    IOSObjectArray_Set((uint64_t)v3, v5, 0);
  }
  return v3;
}

- (void)trimToSize
{
  p_size = &self->size_;
  uint64_t v3 = *(void *)&self->size_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(&self->super.modCount_ + 1);
  if (v5 != *(_DWORD *)(v3 + 8))
  {
    if (v5)
    {
      uint64_t v6 = +[IOSObjectArray arrayWithLength:v5 type:NSObject_class_()];
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*(id *)p_size, 0, v6, 0, v5);
    }
    else
    {
      if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      uint64_t v6 = (IOSObjectArray *)LibcoreUtilEmptyArray_OBJECT_;
    }
    JreStrongAssign((id *)p_size, v6);
    ++self->super.modCount_;
  }
}

- (id)iterator
{
  uint64_t v3 = [JavaUtilArrayList_ArrayListIterator alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->remaining_ = *(&self->super.modCount_ + 1);
  v3->removalIndex_ = -1;
  v3->expectedModCount_ = self->super.modCount_;
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = *((unsigned int *)&self->super.modCount_ + 1);
  if ((int)v2 < 1) {
    return 1;
  }
  uint64_t v3 = *(void *)&self->size_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = 0;
  int v5 = 1;
  do
  {
    uint64_t v6 = *(int *)(v3 + 8);
    if (v4 >= v6) {
      IOSArray_throwOutOfBoundsWithMsg(v6, v4);
    }
    uint64_t v7 = *(void **)(v3 + 24 + 8 * v4);
    if (v7) {
      LODWORD(v7) = [v7 hash];
    }
    int v5 = v7 + 31 * v5;
    ++v4;
  }
  while (v2 != v4);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_31;
  }
  unsigned int v5 = [(id)JavaUtilList_class_() isInstance:a3];
  if (!v5) {
    return v5;
  }
  uint64_t v6 = (void *)JavaUtilList_class_();
  if (!a3) {
    goto LABEL_30;
  }
  if (([v6 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v7 = *((unsigned int *)&self->super.modCount_ + 1);
  if ([a3 size] != v7)
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
  uint64_t v8 = *(void *)&self->size_;
  if (![(id)JavaUtilRandomAccess_class_() isInstance:a3])
  {
    id v13 = [a3 iterator];
    if ((int)v7 < 1) {
      goto LABEL_31;
    }
    if (v8)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *(int *)(v8 + 8);
        if (v15 >= v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v15);
        }
        if (!v14) {
          break;
        }
        CFStringRef v17 = *(void **)(v8 + 24 + 8 * v15);
        id v18 = [v14 next];
        if (v17)
        {
          unsigned int v5 = [v17 isEqual:v18];
          if (!v5) {
            return v5;
          }
        }
        else if (v18)
        {
          goto LABEL_32;
        }
        ++v15;
        LOBYTE(v5) = 1;
        if (v7 == v15) {
          return v5;
        }
      }
    }
LABEL_30:
    JreThrowNullPointerException();
  }
  if ((int)v7 < 1)
  {
LABEL_31:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!v8) {
    goto LABEL_30;
  }
  for (uint64_t i = 0; i != v7; ++i)
  {
    uint64_t v10 = *(int *)(v8 + 8);
    if (i >= v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, i);
    }
    uint64_t v11 = *(void **)(v8 + 24 + 8 * i);
    id v12 = [a3 getWithInt:i];
    if (v11)
    {
      unsigned int v5 = [v11 isEqual:v12];
      if (!v5) {
        return v5;
      }
    }
    else if (v12)
    {
      goto LABEL_32;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3 || ([a3 defaultWriteObject], (uint64_t v5 = *(void *)&self->size_) == 0)) {
    JreThrowNullPointerException();
  }
  [a3 writeIntWithInt:*(unsigned int *)(v5 + 8)];
  if (*(&self->super.modCount_ + 1) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)&self->size_;
      uint64_t v8 = *(int *)(v7 + 8);
      if (v6 >= v8) {
        IOSArray_throwOutOfBoundsWithMsg(v8, v6);
      }
      [a3 writeObjectWithId:*(void *)(v7 + 24 + 8 * v6++)];
    }
    while (v6 < *(&self->super.modCount_ + 1));
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  signed int v5 = [a3 readInt];
  if (v5 < *(&self->super.modCount_ + 1))
  {
    CFStringRef v15 = JreStrcat("$I$I", v6, v7, v8, v9, v10, v11, v12, @"Capacity: ");
    uint64_t v16 = new_JavaIoInvalidObjectException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  if (v5)
  {
    id v13 = +[IOSObjectArray arrayWithLength:v5 type:NSObject_class_()];
  }
  else
  {
    if ((atomic_load_explicit(LibcoreUtilEmptyArray__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v13 = (IOSObjectArray *)LibcoreUtilEmptyArray_OBJECT_;
  }
  JreStrongAssign((id *)&self->size_, v13);
  if (*(&self->super.modCount_ + 1) >= 1)
  {
    uint64_t v14 = 0;
    do
      IOSObjectArray_Set(*(void *)&self->size_, v14++, [a3 readObject]);
    while (v14 < *(&self->super.modCount_ + 1));
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilArrayList;
  [(JavaUtilArrayList *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  a3->var2 = (unint64_t *)&self->super.modCount_;
  uint64_t v6 = (id *)(*(void *)&self->size_ + 24);
  a3->var0 = 1;
  a3->var1 = v6;
  return *(&self->super.modCount_ + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilArrayList *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100422CC0;
}

@end