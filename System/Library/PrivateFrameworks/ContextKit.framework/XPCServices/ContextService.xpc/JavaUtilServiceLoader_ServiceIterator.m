@interface JavaUtilServiceLoader_ServiceIterator
+ (const)__metadata;
- (BOOL)hasNext;
- (JavaUtilServiceLoader_ServiceIterator)initWithJavaUtilServiceLoader:(id)a3 withJavaUtilServiceLoader:(id)a4;
- (id)next;
- (id)readClass;
- (void)checkValidJavaClassNameWithNSString:(id)a3;
- (void)dealloc;
- (void)remove;
@end

@implementation JavaUtilServiceLoader_ServiceIterator

- (JavaUtilServiceLoader_ServiceIterator)initWithJavaUtilServiceLoader:(id)a3 withJavaUtilServiceLoader:(id)a4
{
  return self;
}

- (BOOL)hasNext
{
  if (!self->isRead_) {
    -[JavaUtilServiceLoader_ServiceIterator readClass]_0((uint64_t)self);
  }
  queue = self->queue_;
  if (queue) {
    LOBYTE(queue) = ![(JavaUtilAbstractCollection *)queue isEmpty];
  }
  return (char)queue;
}

- (id)readClass
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v1 = *(void **)(a1 + 24);
  if (!v1) {
    JreThrowNullPointerException();
  }
  id result = [*(id *)(a1 + 24) countByEnumeratingWithState:&v15 objects:v19 count:16];
  id v4 = result;
  if (result)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v1);
        }
        if (!*(void *)(*((void *)&v15 + 1) + 8 * (void)v6)) {
          JreThrowNullPointerException();
        }
        v7 = new_JavaIoInputStreamReader_initWithJavaIoInputStream_withNSString_([*(id *)(*((void *)&v15 + 1) + 8 * (void)v6) openStream], @"UTF-8");
        v8 = new_JavaIoBufferedReader_initWithJavaIoReader_(v7);
        while (1)
        {
          id v9 = [(JavaIoBufferedReader *)v8 readLine];
          id v10 = v9;
          if (!v9) {
            break;
          }
          id v11 = [v9 indexOf:35];
          if (v11 != -1 && (id v10 = [v10 substring:0 endIndex:v11]) == 0
            || (id v12 = [v10 trim], (v13 = v12) == 0))
          {
            JreThrowNullPointerException();
          }
          if (([v12 isEmpty] & 1) == 0)
          {
            sub_10025CDAC(v13);
            v14 = *(void **)(a1 + 40);
            if (!v14) {
              JreThrowNullPointerException();
            }
            if (([v14 containsWithId:v13] & 1) == 0) {
              [*(id *)(a1 + 40) addWithId:v13];
            }
          }
        }
        *(unsigned char *)(a1 + 32) = 1;
        LibcoreIoIoUtils_closeQuietlyWithJavaLangAutoCloseable_(v8);
        v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id result = [v1 countByEnumeratingWithState:&v15 objects:v19 count:16];
      id v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)next
{
  if (![(JavaUtilServiceLoader_ServiceIterator *)self hasNext])
  {
    id v9 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v9);
  }
  queue = self->queue_;
  if (!queue) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaUtilLinkedList *)queue remove];
  service = self->service_;
  if (!service
    || (classLoader = self->classLoader_) == 0
    || (id v7 = [(JavaLangClassLoader *)classLoader loadClassWithNSString:v4]) == 0)
  {
    JreThrowNullPointerException();
  }
  return -[IOSClass cast:](service, "cast:", [v7 newInstance]);
}

- (void)remove
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)checkValidJavaClassNameWithNSString:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilServiceLoader_ServiceIterator;
  [(JavaUtilServiceLoader_ServiceIterator *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046AA10;
}

@end