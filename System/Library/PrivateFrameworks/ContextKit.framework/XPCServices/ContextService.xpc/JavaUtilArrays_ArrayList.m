@interface JavaUtilArrays_ArrayList
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilArrays_ArrayList)initWithNSObjectArray:(id)a3;
- (id)getWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation JavaUtilArrays_ArrayList

- (JavaUtilArrays_ArrayList)initWithNSObjectArray:(id)a3
{
  return self;
}

- (BOOL)containsWithId:(id)a3
{
  a = self->a_;
  if (a3)
  {
    if (a)
    {
      p_elementType = &a->elementType_;
      unint64_t v6 = (unint64_t)&(&a->elementType_)[a->super.size_];
      do
      {
        BOOL v7 = (unint64_t)p_elementType < v6;
        if ((unint64_t)p_elementType >= v6) {
          break;
        }
        uint64_t v8 = (uint64_t)*p_elementType++;
      }
      while (([a3 isEqual:v8] & 1) == 0);
      return v7;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  if (!a) {
    goto LABEL_12;
  }
  v9 = &a->elementType_;
  unint64_t v10 = (unint64_t)&(&a->elementType_)[a->super.size_];
  do
  {
    BOOL v7 = (unint64_t)v9 < v10;
    if ((unint64_t)v9 >= v10) {
      break;
    }
  }
  while (*v9++);
  return v7;
}

- (id)getWithInt:(int)a3
{
  a = self->a_;
  if (!a) {
    JreThrowNullPointerException();
  }
  uint64_t size = a->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return (&a->elementType_)[a3];
}

- (int)indexOfWithId:(id)a3
{
  a = self->a_;
  if (a3)
  {
    if (a)
    {
      uint64_t v6 = 0;
      while (v6 < a->super.size_)
      {
        if ([a3 isEqual:(&a->elementType_)[v6]])
        {
          LODWORD(v8) = v6;
          return v8;
        }
        ++v6;
        a = self->a_;
        if (!a) {
          goto LABEL_7;
        }
      }
      goto LABEL_13;
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  if (!a) {
    goto LABEL_7;
  }
  int size = a->super.size_;
  if (size < 1)
  {
LABEL_13:
    LODWORD(v8) = -1;
    return v8;
  }
  uint64_t v8 = 0;
  uint64_t v9 = size & ~(size >> 31);
  p_elementType = &a->elementType_;
  while (p_elementType[v8])
  {
    if (v9 == ++v8) {
      goto LABEL_13;
    }
  }
  return v8;
}

- (int)lastIndexOfWithId:(id)a3
{
  a = self->a_;
  if (a3)
  {
    if (a)
    {
      LODWORD(v6) = a->super.size_;
      while (1)
      {
        uint64_t v6 = (v6 - 1);
        if ((int)v6 < 0) {
          break;
        }
        BOOL v7 = self->a_;
        uint64_t size = v7->super.size_;
        if ((int)v6 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v6);
        }
        if ([a3 isEqual:(&v7->elementType_)[v6]]) {
          return v6;
        }
      }
      goto LABEL_16;
    }
LABEL_18:
    JreThrowNullPointerException();
  }
  if (!a) {
    goto LABEL_18;
  }
  LODWORD(v6) = a->super.size_;
  while (1)
  {
    uint64_t v9 = (v6 - 1);
    if ((int)v6 - 1 < 0) {
      break;
    }
    LODWORD(v6) = v6 - 1;
    unint64_t v10 = self->a_;
    uint64_t v11 = v10->super.size_;
    if ((int)v9 >= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v9);
    }
    if (!(&v10->elementType_)[v9]) {
      return v6;
    }
  }
LABEL_16:
  LODWORD(v6) = -1;
  return v6;
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  a = self->a_;
  if (!a) {
    JreThrowNullPointerException();
  }
  if (a3 < 0 || (v5 = self->a_, a->super.size_ <= a3)) {
    IOSArray_throwOutOfBoundsWithMsg(a->super.size_, *(uint64_t *)&a3);
  }
  uint64_t v6 = (&a->elementType_)[a3];
  IOSObjectArray_Set((uint64_t)v5, a3, a4);
  return v6;
}

- (int)size
{
  a = self->a_;
  if (!a) {
    JreThrowNullPointerException();
  }
  return a->super.size_;
}

- (id)toArray
{
  a = self->a_;
  if (!a) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)a clone];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  uint64_t v5 = [(JavaUtilArrays_ArrayList *)self size];
  if (!a3) {
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  if ((int)v5 > *((_DWORD *)a3 + 2))
  {
    a3 = JavaLangReflectArray_newInstanceWithIOSClass_withInt_(objc_msgSend(objc_msgSend(a3, "getClass"), "getComponentType"), v5);
    objc_opt_class();
    if (a3)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
    }
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->a_, 0, a3, 0, v6);
  if (!a3) {
LABEL_9:
  }
    JreThrowNullPointerException();
  if ((int)v6 < *((_DWORD *)a3 + 2)) {
    IOSObjectArray_Set((uint64_t)a3, (int)v6, 0);
  }
  return a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilArrays_ArrayList;
  [(JavaUtilArrays_ArrayList *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  a3->var2 = (unint64_t *)&self->super.modCount_;
  p_elementType = &self->a_->elementType_;
  a3->var0 = 1;
  a3->var1 = (id *)p_elementType;
  return self->a_->super.size_;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040A068;
}

@end