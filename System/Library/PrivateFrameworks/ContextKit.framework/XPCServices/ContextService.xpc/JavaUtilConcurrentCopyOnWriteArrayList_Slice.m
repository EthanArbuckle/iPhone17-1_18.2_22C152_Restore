@interface JavaUtilConcurrentCopyOnWriteArrayList_Slice
+ (const)__metadata;
- (JavaUtilConcurrentCopyOnWriteArrayList_Slice)initWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)checkConcurrentModificationWithNSObjectArray:(id)a3;
- (void)checkElementIndexWithInt:(int)a3;
- (void)checkPositionIndexWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaUtilConcurrentCopyOnWriteArrayList_Slice

- (JavaUtilConcurrentCopyOnWriteArrayList_Slice)initWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->from_ = a4;
  self->to_ = a5;
  return self;
}

- (void)checkElementIndexWithInt:(int)a3
{
  if (a3 < 0 || self->to_ - self->from_ <= a3)
  {
    CFStringRef v8 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"index=");
    v9 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
}

- (void)checkPositionIndexWithInt:(int)a3
{
  if (a3 < 0 || self->to_ - self->from_ < a3)
  {
    CFStringRef v8 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"index=");
    v9 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
}

- (void)checkConcurrentModificationWithNSObjectArray:(id)a3
{
  if (self->expectedElements_ != a3)
  {
    uint64_t v3 = new_JavaUtilConcurrentModificationException_init();
    objc_exception_throw(v3);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilConcurrentCopyOnWriteArrayList_Slice;
  [(JavaUtilConcurrentCopyOnWriteArrayList_Slice *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100486D70;
}

@end