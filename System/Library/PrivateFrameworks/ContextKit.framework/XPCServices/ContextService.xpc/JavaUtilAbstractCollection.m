@interface JavaUtilAbstractCollection
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (BOOL)containsAllWithJavaUtilCollection:(id)a3;
- (BOOL)containsWithId:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (BOOL)removeWithId:(id)a3;
- (BOOL)retainAllWithJavaUtilCollection:(id)a3;
- (NSString)description;
- (id)iterator;
- (id)toArray;
- (id)toArrayWithNSObjectArray:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
@end

@implementation JavaUtilAbstractCollection

- (BOOL)addWithId:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  if (!a3 || (id v4 = [a3 iterator]) == 0) {
    JreThrowNullPointerException();
  }
  v5 = v4;
  int v6 = 0;
  if ([v4 hasNext])
  {
    do
      v6 |= -[JavaUtilAbstractCollection addWithId:](self, "addWithId:", [v5 next]);
    while (([v5 hasNext] & 1) != 0);
  }
  return v6 & 1;
}

- (void)clear
{
  id v2 = [(JavaUtilAbstractCollection *)self iterator];
  if (!v2) {
    JreThrowNullPointerException();
  }
  v3 = v2;
  if ([v2 hasNext])
  {
    do
    {
      [v3 next];
      [v3 remove];
    }
    while (([v3 hasNext] & 1) != 0);
  }
}

- (BOOL)containsWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractCollection *)self iterator];
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      do
        unsigned __int8 v6 = [v5 hasNext];
      while ((v6 & 1) != 0 && (objc_msgSend(a3, "isEqual:", objc_msgSend(v5, "next")) & 1) == 0);
      return v6;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  if (!v4) {
    goto LABEL_10;
  }
  do
    unsigned __int8 v6 = [v5 hasNext];
  while ((v6 & 1) != 0 && [v5 next]);
  return v6;
}

- (BOOL)containsAllWithJavaUtilCollection:(id)a3
{
  if (!a3 || (id v4 = [a3 iterator]) == 0) {
    JreThrowNullPointerException();
  }
  v5 = v4;
  do
    unsigned __int8 v6 = [v5 hasNext];
  while ((v6 & 1) != 0
       && -[JavaUtilAbstractCollection containsWithId:](self, "containsWithId:", [v5 next]));
  return v6 ^ 1;
}

- (BOOL)isEmpty
{
  return [(JavaUtilAbstractCollection *)self size] == 0;
}

- (id)iterator
{
  return 0;
}

- (BOOL)removeWithId:(id)a3
{
  id v4 = [(JavaUtilAbstractCollection *)self iterator];
  v5 = v4;
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
      return 0;
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  if (!v4) {
    goto LABEL_11;
  }
  while (([v5 hasNext] & 1) != 0)
  {
    if (![v5 next])
    {
LABEL_9:
      [v5 remove];
      return 1;
    }
  }
  return 0;
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  id v4 = [(JavaUtilAbstractCollection *)self iterator];
  if (!v4) {
    goto LABEL_8;
  }
  v5 = v4;
  BOOL v6 = 0;
  if ([v4 hasNext])
  {
    while (a3)
    {
      if (objc_msgSend(a3, "containsWithId:", objc_msgSend(v5, "next")))
      {
        [v5 remove];
        BOOL v6 = 1;
      }
      if (([v5 hasNext] & 1) == 0) {
        return v6;
      }
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  return v6;
}

- (BOOL)retainAllWithJavaUtilCollection:(id)a3
{
  id v4 = [(JavaUtilAbstractCollection *)self iterator];
  if (!v4) {
    goto LABEL_8;
  }
  v5 = v4;
  BOOL v6 = 0;
  if ([v4 hasNext])
  {
    while (a3)
    {
      if ((objc_msgSend(a3, "containsWithId:", objc_msgSend(v5, "next")) & 1) == 0)
      {
        [v5 remove];
        BOOL v6 = 1;
      }
      if (([v5 hasNext] & 1) == 0) {
        return v6;
      }
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  return v6;
}

- (int)size
{
  return 0;
}

- (id)toArray
{
  v3 = +[IOSObjectArray arrayWithLength:[(JavaUtilAbstractCollection *)self size] type:NSObject_class_()];
  return [(JavaUtilAbstractCollection *)self toArrayWithNSObjectArray:v3];
}

- (id)toArrayWithNSObjectArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  v3 = (IOSObjectArray *)a3;
  signed int v5 = [(JavaUtilAbstractCollection *)self size];
  if (v3->super.size_ < v5) {
    v3 = +[IOSObjectArray arrayWithLength:v5 type:*(void *)&v3->isRetained_];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = [(JavaUtilAbstractCollection *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(self);
        }
        IOSObjectArray_Set((uint64_t)v3, v8 + (int)v10, *(void **)(*((void *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v7 != v10);
      unint64_t v7 = [(JavaUtilAbstractCollection *)self countByEnumeratingWithState:&v12 objects:v16 count:16];
      v8 += v10;
    }
    while (v7);
  }
  return v3;
}

- (NSString)description
{
  if ([(JavaUtilAbstractCollection *)self isEmpty]) {
    return (NSString *)@"[]";
  }
  id v4 = new_JavaLangStringBuilder_initWithInt_(16 * [(JavaUtilAbstractCollection *)self size]);
  [(JavaLangStringBuilder *)v4 appendWithChar:91];
  id v5 = [(JavaUtilAbstractCollection *)self iterator];
  if (!v5) {
    JreThrowNullPointerException();
  }
  unint64_t v6 = v5;
  if ([v5 hasNext])
  {
    do
    {
      unint64_t v7 = (JavaUtilAbstractCollection *)[v6 next];
      if (v7 == self) {
        [(JavaLangStringBuilder *)v4 appendWithNSString:@"(this Collection)"];
      }
      else {
        [(JavaLangStringBuilder *)v4 appendWithId:v7];
      }
      if ([v6 hasNext]) {
        [(JavaLangStringBuilder *)v4 appendWithNSString:@", "];
      }
    }
    while (([v6 hasNext] & 1) != 0);
  }
  [(JavaLangStringBuilder *)v4 appendWithChar:93];
  return [(JavaLangStringBuilder *)v4 description];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100487E40;
}

@end