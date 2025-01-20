@interface JavaUtilZipCheckedOutputStream
+ (const)__metadata;
- (JavaUtilZipCheckedOutputStream)initWithJavaIoOutputStream:(id)a3 withJavaUtilZipChecksum:(id)a4;
- (id)getChecksum;
- (void)dealloc;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaUtilZipCheckedOutputStream

- (JavaUtilZipCheckedOutputStream)initWithJavaIoOutputStream:(id)a3 withJavaUtilZipChecksum:(id)a4
{
  return self;
}

- (id)getChecksum
{
  return self->check_;
}

- (void)writeWithInt:(int)a3
{
  out = self->super.out_;
  if (!out
    || (uint64_t v5 = *(void *)&a3, -[JavaIoOutputStream writeWithInt:](out, "writeWithInt:"), (check = self->check_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipChecksum *)check updateWithInt:v5];
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  out = self->super.out_;
  if (!out
    || (uint64_t v7 = *(void *)&a5,
        uint64_t v8 = *(void *)&a4,
        -[JavaIoOutputStream writeWithByteArray:withInt:withInt:](out, "writeWithByteArray:withInt:withInt:"),
        (check = self->check_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipChecksum *)check updateWithByteArray:a3 withInt:v8 withInt:v7];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilZipCheckedOutputStream;
  [(JavaIoFilterOutputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041C3C8;
}

@end