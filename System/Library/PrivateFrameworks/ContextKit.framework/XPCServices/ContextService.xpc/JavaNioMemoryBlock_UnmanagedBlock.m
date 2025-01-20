@interface JavaNioMemoryBlock_UnmanagedBlock
+ (const)__metadata;
- (JavaNioMemoryBlock_UnmanagedBlock)initWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)free;
@end

@implementation JavaNioMemoryBlock_UnmanagedBlock

- (JavaNioMemoryBlock_UnmanagedBlock)initWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  self->super.address_ = a3;
  self->super.size_ = a4;
  return self;
}

- (void)free
{
  self->super.address_ = 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004238D0;
}

@end