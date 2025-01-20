@interface JavaNetPlainSocketImpl_PlainSocketInputStream
+ (const)__metadata;
- (JavaNetPlainSocketImpl_PlainSocketInputStream)initWithJavaNetPlainSocketImpl:(id)a3;
- (int)available;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
@end

@implementation JavaNetPlainSocketImpl_PlainSocketInputStream

- (JavaNetPlainSocketImpl_PlainSocketInputStream)initWithJavaNetPlainSocketImpl:(id)a3
{
  return self;
}

- (int)available
{
  socketImpl = self->socketImpl_;
  if (!socketImpl) {
    JreThrowNullPointerException();
  }
  return [(JavaNetPlainSocketImpl *)socketImpl available];
}

- (void)close
{
  socketImpl = self->socketImpl_;
  if (!socketImpl) {
    JreThrowNullPointerException();
  }
  [(JavaNetPlainSocketImpl *)socketImpl close];
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  socketImpl = self->socketImpl_;
  if (!socketImpl) {
    JreThrowNullPointerException();
  }
  return sub_10015249C((uint64_t)socketImpl, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetPlainSocketImpl_PlainSocketInputStream;
  [(JavaNetPlainSocketImpl_PlainSocketInputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F5458;
}

@end