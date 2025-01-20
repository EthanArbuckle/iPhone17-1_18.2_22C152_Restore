@interface JavaUtilAbstractSequentialList
+ (const)__metadata;
- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4;
- (JavaUtilAbstractSequentialList)init;
- (id)getWithInt:(int)a3;
- (id)iterator;
- (id)listIteratorWithInt:(int)a3;
- (id)removeWithInt:(int)a3;
- (id)setWithInt:(int)a3 withId:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addWithInt:(int)a3 withId:(id)a4;
@end

@implementation JavaUtilAbstractSequentialList

- (JavaUtilAbstractSequentialList)init
{
  return self;
}

- (void)addWithInt:(int)a3 withId:(id)a4
{
  id v5 = [(JavaUtilAbstractSequentialList *)self listIteratorWithInt:*(void *)&a3];
  if (!v5) {
    JreThrowNullPointerException();
  }
  [v5 addWithId:a4];
}

- (BOOL)addAllWithInt:(int)a3 withJavaUtilCollection:(id)a4
{
  id v5 = [(JavaUtilAbstractSequentialList *)self listIteratorWithInt:*(void *)&a3];
  if (!a4
    || (v6 = v5, id v7 = [a4 iterator], !v6)
    || (v8 = v7, unsigned int v9 = [v6 nextIndex], !v8))
  {
    JreThrowNullPointerException();
  }
  unsigned int v10 = v9;
  if ([v8 hasNext])
  {
    do
      objc_msgSend(v6, "addWithId:", objc_msgSend(v8, "next"));
    while (([v8 hasNext] & 1) != 0);
  }
  return v10 != [v6 nextIndex];
}

- (id)getWithInt:(int)a3
{
  id v3 = [(JavaUtilAbstractSequentialList *)self listIteratorWithInt:*(void *)&a3];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 next];
}

- (id)iterator
{
  return [(JavaUtilAbstractSequentialList *)self listIteratorWithInt:0];
}

- (id)listIteratorWithInt:(int)a3
{
  return 0;
}

- (id)removeWithInt:(int)a3
{
  id v3 = [(JavaUtilAbstractSequentialList *)self listIteratorWithInt:*(void *)&a3];
  v4 = v3;
  if (!v3) {
    JreThrowNullPointerException();
  }
  id v5 = [v3 next];
  [v4 remove];
  return v5;
}

- (id)setWithInt:(int)a3 withId:(id)a4
{
  id v5 = [(JavaUtilAbstractSequentialList *)self listIteratorWithInt:*(void *)&a3];
  if (!v5) {
    JreThrowNullPointerException();
  }
  v6 = v5;
  if (([v5 hasNext] & 1) == 0)
  {
    unsigned int v9 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v9);
  }
  id v7 = [v6 next];
  [v6 setWithId:a4];
  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100466CD0;
}

@end