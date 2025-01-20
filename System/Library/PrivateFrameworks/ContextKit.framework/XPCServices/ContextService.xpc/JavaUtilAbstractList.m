@interface JavaUtilAbstractList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (BOOL)addWithId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (JavaUtilAbstractList)init;
- (id)getWithInt:(int)a3;
- (id)iterator;
- (id)listIterator;
- (id)listIteratorWithInt:(int)a3;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (id)subListWithInt:(int)a3 withInt:(int)a4;
- (int)indexOfWithId:(id)a3;
- (int)lastIndexOfWithId:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addWithInt:(int)a3 withId:(id)a4;
- (void)clear;
- (void)removeRangeWithInt:(int)a3 withInt:(int)a4;
@end

@implementation JavaUtilAbstractList

- (JavaUtilAbstractList)init
{
  return self;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (BOOL)addWithId:(id)a3
{
  return 1;
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  if (!a4 || (uint64_t v5 = *(void *)&a3, (v7 = [a4 iterator]) == 0)) {
    JreThrowNullPointerException();
  }
  v8 = v7;
  if ([v7 hasNext])
  {
    do
    {
      -[JavaUtilAbstractList addWithInt:withId:](self, "addWithInt:withId:", v5, [v8 next]);
      uint64_t v5 = (v5 + 1);
    }
    while (([v8 hasNext] & 1) != 0);
  }
  return [a4 isEmpty] ^ 1;
}

- (void)clear
{
  uint64_t v3 = [(JavaUtilAbstractCollection *)self size];
  [(JavaUtilAbstractList *)self removeRangeWithInt:0 withInt:v3];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char v14 = 1;
  }
  else
  {
    if (![(id)JavaUtilList_class_() isInstance:a3]) {
      goto LABEL_15;
    }
    uint64_t v5 = (void *)JavaUtilList_class_();
    if (!a3) {
      goto LABEL_18;
    }
    if (([v5 isInstance:a3] & 1) == 0) {
      JreThrowClassCastException();
    }
    unsigned int v6 = [a3 size];
    if (v6 == [(JavaUtilAbstractCollection *)self size])
    {
      id v7 = [(JavaUtilAbstractList *)self iterator];
      id v8 = [a3 iterator];
      if (!v7) {
        goto LABEL_18;
      }
      v9 = v8;
      unsigned int v10 = [v7 hasNext];
      if (v10)
      {
        while (1)
        {
          id v11 = [v7 next];
          if (!v9) {
            break;
          }
          v12 = v11;
          id v13 = [v9 next];
          if (v12)
          {
            if (![v12 isEqual:v13]) {
              goto LABEL_14;
            }
          }
          else if (v13)
          {
            goto LABEL_14;
          }
          LOBYTE(v10) = [v7 hasNext];
          if ((v10 & 1) == 0) {
            goto LABEL_14;
          }
        }
LABEL_18:
        JreThrowNullPointerException();
      }
LABEL_14:
      char v14 = v10 ^ 1;
    }
    else
    {
LABEL_15:
      char v14 = 0;
    }
  }
  return v14 & 1;
}

- (id)getWithInt:(int)a3
{
  return 0;
}

- (unint64_t)hash
{
  id v2 = [(JavaUtilAbstractList *)self iterator];
  if (!v2) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = v2;
  if (![v2 hasNext]) {
    return 1;
  }
  int v4 = 1;
  do
  {
    id v5 = [v3 next];
    if (v5) {
      LODWORD(v5) = [v5 hash];
    }
    int v4 = v5 + 31 * v4;
  }
  while (([v3 hasNext] & 1) != 0);
  return v4;
}

- (int)indexOfWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractList *)self listIterator];
  id v5 = v4;
  if (a3)
  {
    if (v4)
    {
      while (([v5 hasNext] & 1) != 0)
      {
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v5, "next"))) {
          goto LABEL_9;
        }
      }
      return -1;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!v4) {
    goto LABEL_13;
  }
  while (([v5 hasNext] & 1) != 0)
  {
    if (![v5 next])
    {
LABEL_9:
      return [v5 previousIndex];
    }
  }
  return -1;
}

- (id)iterator
{
  uint64_t v3 = [JavaUtilAbstractList_SimpleListIterator alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->pos_ = -1;
  v3->lastPosition_ = -1;
  v3->expectedModCount_ = self->modCount_;
  return v3;
}

- (int)lastIndexOfWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractList *)self listIteratorWithInt:[(JavaUtilAbstractCollection *)self size]];
  id v5 = v4;
  if (a3)
  {
    if (v4)
    {
      while (([v5 hasPrevious] & 1) != 0)
      {
        if (objc_msgSend(a3, "isEqual:", objc_msgSend(v5, "previous"))) {
          goto LABEL_9;
        }
      }
      return -1;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!v4) {
    goto LABEL_13;
  }
  while (([v5 hasPrevious] & 1) != 0)
  {
    if (![v5 previous])
    {
LABEL_9:
      return [v5 nextIndex];
    }
  }
  return -1;
}

- (id)listIterator
{
  return [(JavaUtilAbstractList *)self listIteratorWithInt:0];
}

- (id)listIteratorWithInt:(int)a3
{
  id v5 = [JavaUtilAbstractList_FullListIterator alloc];
  sub_100271270((uint64_t)v5, self, a3);
  return v5;
}

- (id)removeWithInt:(int)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (void)removeRangeWithInt:(int)a3 withInt:(int)a4
{
  id v6 = -[JavaUtilAbstractList listIteratorWithInt:](self, "listIteratorWithInt:");
  BOOL v7 = __OFSUB__(a4, a3);
  int v8 = a4 - a3;
  if (!((v8 < 0) ^ v7 | (v8 == 0)))
  {
    v9 = v6;
    if (!v6) {
      JreThrowNullPointerException();
    }
    do
    {
      [v9 next];
      [v9 remove];
      --v8;
    }
    while (v8);
  }
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  id v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < 0 || [(JavaUtilAbstractCollection *)self size] < a4)
  {
    id v11 = new_JavaLangIndexOutOfBoundsException_init();
    goto LABEL_11;
  }
  if (a3 > a4)
  {
    id v11 = new_JavaLangIllegalArgumentException_init();
LABEL_11:
    objc_exception_throw(v11);
  }
  unsigned int v7 = [(id)JavaUtilRandomAccess_class_() isInstance:self];
  int v8 = off_1003F0F18;
  if (!v7) {
    int v8 = off_1003F0F10;
  }
  id v9 = objc_alloc(*v8);
  sub_1002715AC((uint64_t)v9, self, a3, a4);
  return v9;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100474A40;
}

@end