@interface JavaNetPlainSocketImpl_PlainSocketOutputStream
+ (const)__metadata;
- (JavaNetPlainSocketImpl_PlainSocketOutputStream)initWithJavaNetPlainSocketImpl:(id)a3;
- (void)close;
- (void)dealloc;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaNetPlainSocketImpl_PlainSocketOutputStream

- (JavaNetPlainSocketImpl_PlainSocketOutputStream)initWithJavaNetPlainSocketImpl:(id)a3
{
  return self;
}

- (void)close
{
  socketImpl = self->socketImpl_;
  if (!socketImpl) {
    JreThrowNullPointerException();
  }
  [(JavaNetPlainSocketImpl *)socketImpl close];
}

- (void)writeWithInt:(int)a3
{
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  socketImpl = self->socketImpl_;
  if (!socketImpl) {
    JreThrowNullPointerException();
  }
  sub_100152584((uint64_t)socketImpl, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetPlainSocketImpl_PlainSocketOutputStream;
  [(JavaNetPlainSocketImpl_PlainSocketOutputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F55C0;
}

@end