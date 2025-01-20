@interface JavaNetInetAddress_$1
+ (const)__metadata;
- (JavaNetInetAddress_$1)initWithJavaNetInetAddress:(id)a3 withJavaNetInetAddress:(id)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6 withJavaUtilConcurrentAtomicAtomicBoolean:(id)a7 withJavaUtilConcurrentCountDownLatch:(id)a8;
- (void)dealloc;
- (void)run;
@end

@implementation JavaNetInetAddress_$1

- (void)run
{
  if (sub_1001D6958((uint64_t)self->val$destinationAddress_, (JavaNetInet6Address *)self->val$sourceAddress_, self->val$timeout_))
  {
    v3 = self->val$isReachable_;
    if (v3)
    {
      [(JavaUtilConcurrentAtomicAtomicBoolean *)v3 setWithBoolean:1];
      while (1)
      {
        v4 = self->val$latch_;
        if (!v4) {
          break;
        }
        if ([(JavaUtilConcurrentCountDownLatch *)v4 getCount] < 1) {
          goto LABEL_8;
        }
        [(JavaUtilConcurrentCountDownLatch *)self->val$latch_ countDown];
      }
    }
    JreThrowNullPointerException();
  }
LABEL_8:
  v5 = self->val$latch_;
  if (!v5) {
    JreThrowNullPointerException();
  }
  [(JavaUtilConcurrentCountDownLatch *)v5 countDown];
}

- (JavaNetInetAddress_$1)initWithJavaNetInetAddress:(id)a3 withJavaNetInetAddress:(id)a4 withJavaNetInetAddress:(id)a5 withInt:(int)a6 withJavaUtilConcurrentAtomicAtomicBoolean:(id)a7 withJavaUtilConcurrentCountDownLatch:(id)a8
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetInetAddress__1;
  [(JavaLangThread *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042E038;
}

@end