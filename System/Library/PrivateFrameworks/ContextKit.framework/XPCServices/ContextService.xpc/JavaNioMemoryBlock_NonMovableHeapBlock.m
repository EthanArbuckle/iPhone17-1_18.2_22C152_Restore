@interface JavaNioMemoryBlock_NonMovableHeapBlock
+ (const)__metadata;
- (JavaNioMemoryBlock_NonMovableHeapBlock)initWithByteArray:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (id)array;
- (void)dealloc;
- (void)free;
@end

@implementation JavaNioMemoryBlock_NonMovableHeapBlock

- (JavaNioMemoryBlock_NonMovableHeapBlock)initWithByteArray:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  self->super.address_ = a4;
  self->super.size_ = a5;
  JreStrongAssign((id *)&self->array_, a3);
  return self;
}

- (id)array
{
  return self->array_;
}

- (void)free
{
  self->super.address_ = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioMemoryBlock_NonMovableHeapBlock;
  [(JavaNioMemoryBlock_NonMovableHeapBlock *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100423800;
}

@end