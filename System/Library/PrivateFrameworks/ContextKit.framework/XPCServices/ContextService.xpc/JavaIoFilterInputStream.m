@interface JavaIoFilterInputStream
+ (const)__metadata;
- (BOOL)markSupported;
- (JavaIoFilterInputStream)initWithJavaIoInputStream:(id)a3;
- (int)available;
- (int)read;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)skipWithLong:(int64_t)a3;
- (void)__javaClone;
- (void)close;
- (void)dealloc;
- (void)markWithInt:(int)a3;
- (void)reset;
@end

@implementation JavaIoFilterInputStream

- (JavaIoFilterInputStream)initWithJavaIoInputStream:(id)a3
{
  return self;
}

- (int)available
{
  v2 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 available];
}

- (void)close
{
  v2 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  [v2 close];
}

- (void)markWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  v5 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  [v5 markWithInt:v3];
  objc_sync_exit(self);
}

- (BOOL)markSupported
{
  v2 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 markSupported];
}

- (int)read
{
  v2 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 read];
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v5) {
    JreThrowNullPointerException();
  }
  return [v5 readWithByteArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
}

- (void)reset
{
  objc_sync_enter(self);
  uint64_t v3 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  [v3 reset];
  objc_sync_exit(self);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  uint64_t v3 = (void *)atomic_load((unint64_t *)&self->in_);
  if (!v3) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v3 skipWithLong:a3];
}

- (void)dealloc
{
  JreReleaseVolatile(&self->in_);
  v3.receiver = self;
  v3.super_class = (Class)JavaIoFilterInputStream;
  [(JavaIoFilterInputStream *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoFilterInputStream;
  [(JavaIoFilterInputStream *)&v3 __javaClone];
  JreRetainVolatile(&self->in_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100421C30;
}

@end