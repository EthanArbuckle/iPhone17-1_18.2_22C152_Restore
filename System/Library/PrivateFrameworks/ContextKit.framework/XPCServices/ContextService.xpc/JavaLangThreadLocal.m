@interface JavaLangThreadLocal
+ (const)__metadata;
+ (void)initialize;
- (JavaLangThreadLocal)init;
- (id)get;
- (id)initialValue;
- (id)initializeValuesWithJavaLangThread:(id)a3;
- (id)valuesWithJavaLangThread:(id)a3;
- (void)dealloc;
- (void)remove;
- (void)setWithId:(id)a3;
@end

@implementation JavaLangThreadLocal

- (JavaLangThreadLocal)init
{
  return self;
}

- (id)get
{
  v3 = JavaLangThread_currentThread();
  v4 = [(JavaLangThreadLocal *)self valuesWithJavaLangThread:v3];
  if (!v4)
  {
    v5 = [(JavaLangThreadLocal *)self initializeValuesWithJavaLangThread:v3];
    if (v5) {
      goto LABEL_10;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  v5 = v4;
  uint64_t v6 = *((void *)v4 + 1);
  if (!v6) {
    goto LABEL_13;
  }
  unsigned int v7 = v4[4];
  int v8 = v7 & self->hash__;
  uint64_t v9 = *(unsigned int *)(v6 + 8);
  if (v8 < 0 || v8 >= (int)v9) {
    IOSArray_throwOutOfBoundsWithMsg(v9, v7 & self->hash__);
  }
  if (self->reference_ == *(JavaLangRefReference **)(v6 + 24 + 8 * v8))
  {
    uint64_t v10 = *(unsigned int *)(v6 + 8);
    int v11 = v8 + 1;
    if (v8 + 1 < 0 || v11 >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, v11);
    }
    return *(id *)(v6 + 24 + 8 * v11);
  }
LABEL_10:
  return [v5 getAfterMissWithJavaLangThreadLocal:self];
}

- (id)initialValue
{
  return 0;
}

- (void)setWithId:(id)a3
{
  v5 = JavaLangThread_currentThread();
  id v6 = [(JavaLangThreadLocal *)self valuesWithJavaLangThread:v5];
  if (!v6)
  {
    id v6 = [(JavaLangThreadLocal *)self initializeValuesWithJavaLangThread:v5];
    if (!v6) {
      JreThrowNullPointerException();
    }
  }
  [v6 putWithJavaLangThreadLocal:self withId:a3];
}

- (void)remove
{
  id v3 = [(JavaLangThreadLocal *)self valuesWithJavaLangThread:JavaLangThread_currentThread()];
  if (v3)
  {
    [v3 removeWithJavaLangThreadLocal:self];
  }
}

- (id)initializeValuesWithJavaLangThread:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v3 = (id *)((char *)a3 + 16);
  v4 = [JavaLangThreadLocal_Values alloc];
  JavaLangThreadLocal_Values_init((uint64_t)v4);
  return JreStrongAssignAndConsume(v3, v4);
}

- (id)valuesWithJavaLangThread:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return (id)*((void *)a3 + 2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangThreadLocal;
  [(JavaLangThreadLocal *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilConcurrentAtomicAtomicInteger_initWithInt_(0);
    JreStrongAssignAndConsume((id *)&qword_100560A18, v2);
    atomic_store(1u, (unsigned __int8 *)&JavaLangThreadLocal__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040E888;
}

@end