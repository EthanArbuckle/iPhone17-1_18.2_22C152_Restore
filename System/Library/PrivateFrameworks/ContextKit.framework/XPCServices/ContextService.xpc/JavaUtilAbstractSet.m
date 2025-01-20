@interface JavaUtilAbstractSet
+ (const)__metadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeAllWithJavaUtilCollection:(id)a3;
- (JavaUtilAbstractSet)init;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation JavaUtilAbstractSet

- (JavaUtilAbstractSet)init
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    unsigned int v5 = [(id)JavaUtilSet_class_() isInstance:a3];
    if (v5)
    {
      v6 = (void *)JavaUtilSet_class_();
      if (a3 && ([v6 isInstance:a3] & 1) == 0) {
        JreThrowClassCastException();
      }
      unsigned int v7 = [(JavaUtilAbstractCollection *)self size];
      if (!a3) {
        JreThrowNullPointerException();
      }
      if (v7 == [a3 size]) {
        LOBYTE(v5) = [(JavaUtilAbstractCollection *)self containsAllWithJavaUtilCollection:a3];
      }
      else {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  id v2 = [(JavaUtilAbstractCollection *)self iterator];
  if (!v2) {
    JreThrowNullPointerException();
  }
  v3 = v2;
  if (![v2 hasNext]) {
    return 0;
  }
  int v4 = 0;
  do
  {
    id v5 = [v3 next];
    if (v5) {
      LODWORD(v5) = [v5 hash];
    }
    v4 += (int)v5;
  }
  while (([v3 hasNext] & 1) != 0);
  return v4;
}

- (BOOL)removeAllWithJavaUtilCollection:(id)a3
{
  int v5 = [(JavaUtilAbstractCollection *)self size];
  if (!a3) {
    goto LABEL_13;
  }
  if (v5 > (int)[a3 size])
  {
    id v6 = [a3 iterator];
    if (v6)
    {
      unsigned int v7 = v6;
      int v8 = 0;
      if ([v6 hasNext])
      {
        do
          v8 |= -[JavaUtilAbstractCollection removeWithId:](self, "removeWithId:", [v7 next]);
        while (([v7 hasNext] & 1) != 0);
      }
      return v8 & 1;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  id v9 = [(JavaUtilAbstractCollection *)self iterator];
  if (!v9) {
    goto LABEL_13;
  }
  v10 = v9;
  LOBYTE(v8) = 0;
  if ([v9 hasNext])
  {
    do
    {
      if (objc_msgSend(a3, "containsWithId:", objc_msgSend(v10, "next")))
      {
        [v10 remove];
        LOBYTE(v8) = 1;
      }
    }
    while (([v10 hasNext] & 1) != 0);
  }
  return v8 & 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100481CE0;
}

@end