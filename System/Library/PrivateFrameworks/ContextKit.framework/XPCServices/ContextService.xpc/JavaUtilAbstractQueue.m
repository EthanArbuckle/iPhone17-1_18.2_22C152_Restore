@interface JavaUtilAbstractQueue
+ (const)__metadata;
- (BOOL)addAllWithJavaUtilCollection:(id)a3;
- (BOOL)addWithId:(id)a3;
- (JavaUtilAbstractQueue)init;
- (id)element;
- (id)remove;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)clear;
@end

@implementation JavaUtilAbstractQueue

- (JavaUtilAbstractQueue)init
{
  return self;
}

- (BOOL)addWithId:(id)a3
{
  if (![(JavaUtilAbstractQueue *)self offerWithId:a3])
  {
    v4 = new_JavaLangIllegalStateException_initWithNSString_(@"Queue full");
    objc_exception_throw(v4);
  }
  return 1;
}

- (id)remove
{
  id result = [(JavaUtilAbstractQueue *)self poll];
  if (!result)
  {
    v3 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (id)element
{
  id result = [(JavaUtilAbstractQueue *)self peek];
  if (!result)
  {
    v3 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (void)clear
{
  while ([(JavaUtilAbstractQueue *)self poll])
    ;
}

- (BOOL)addAllWithJavaUtilCollection:(id)a3
{
  if (!a3)
  {
    v11 = new_JavaLangNullPointerException_initWithNSString_(@"c == null");
    goto LABEL_15;
  }
  if (a3 == self)
  {
    v11 = new_JavaLangIllegalArgumentException_initWithNSString_(@"c == this");
LABEL_15:
    objc_exception_throw(v11);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        v7 |= [(JavaUtilAbstractQueue *)self addWithId:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7 & 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F5750;
}

@end