@interface JavaNioBuffer
+ (const)__metadata;
- (BOOL)hasArray;
- (BOOL)hasRemaining;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (JavaNioBuffer)initWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (id)array;
- (id)clear;
- (id)description;
- (id)flip;
- (id)limitWithInt:(int)a3;
- (id)mark;
- (id)positionWithInt:(int)a3;
- (id)reset;
- (id)rewind;
- (int)arrayOffset;
- (int)capacity;
- (int)checkGetBoundsWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (int)checkPutBoundsWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (int)getElementSizeShift;
- (int)limit;
- (int)position;
- (int)remaining;
- (void)checkIndexWithInt:(int)a3;
- (void)checkIndexWithInt:(int)a3 withInt:(int)a4;
- (void)checkStartEndRemainingWithInt:(int)a3 withInt:(int)a4;
- (void)checkWritable;
- (void)positionImplWithInt:(int)a3;
@end

@implementation JavaNioBuffer

- (JavaNioBuffer)initWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  JavaNioBuffer_initWithInt_withInt_withLong_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a4, a5, a5, v5, v6, v7);
  return self;
}

- (id)array
{
  return 0;
}

- (int)arrayOffset
{
  return 0;
}

- (int)capacity
{
  return self->capacity_;
}

- (void)checkIndexWithInt:(int)a3
{
  if (a3 < 0 || self->limit_ <= a3)
  {
    CFStringRef v8 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"index=");
    v9 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
}

- (void)checkIndexWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < 0 || self->limit_ - a4 < a3)
  {
    CFStringRef v8 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"index=");
    v9 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
}

- (int)checkGetBoundsWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  if (a4 - a5 < a6 || a4 < a5 || (a6 | a5) < 0)
  {
    CFStringRef v9 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7, @"offset=");
    v10 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v9);
    goto LABEL_8;
  }
  if (a6 * a3 > self->limit_ - self->position_)
  {
    v10 = new_JavaNioBufferUnderflowException_init();
LABEL_8:
    objc_exception_throw(v10);
  }
  return a6 * a3;
}

- (int)checkPutBoundsWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  if (a4 - a5 < a6 || a4 < a5 || (a6 | a5) < 0)
  {
    CFStringRef v10 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, v6, v7, @"offset=");
    OnlyBufferException_init = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v10);
    goto LABEL_10;
  }
  int v8 = a6 * a3;
  if (a6 * a3 > self->limit_ - self->position_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
    goto LABEL_10;
  }
  if ([(JavaNioBuffer *)self isReadOnly])
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
LABEL_10:
    objc_exception_throw(OnlyBufferException_init);
  }
  return v8;
}

- (void)checkStartEndRemainingWithInt:(int)a3 withInt:(int)a4
{
  if (a3 < 0 || a4 < a3 || self->limit_ - self->position_ < a4)
  {
    CFStringRef v8 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"start=");
    CFStringRef v9 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v8);
    objc_exception_throw(v9);
  }
}

- (id)clear
{
  *((void *)self + 2) = 0xFFFFFFFFLL;
  *((_DWORD *)self + 3) = *((_DWORD *)self + 2);
  return self;
}

- (id)flip
{
  *((_DWORD *)self + 3) = *((_DWORD *)self + 5);
  *((void *)self + 2) = 0xFFFFFFFFLL;
  return self;
}

- (BOOL)hasArray
{
  return 0;
}

- (BOOL)hasRemaining
{
  return self->position_ < self->limit_;
}

- (BOOL)isDirect
{
  return 0;
}

- (BOOL)isReadOnly
{
  return 0;
}

- (void)checkWritable
{
  if ([(JavaNioBuffer *)self isReadOnly])
  {
    v2 = new_JavaLangIllegalArgumentException_initWithNSString_(@"Read-only buffer");
    objc_exception_throw(v2);
  }
}

- (int)limit
{
  return self->limit_;
}

- (id)limitWithInt:(int)a3
{
  if (a3 < 0 || *((_DWORD *)self + 2) < a3)
  {
    CFStringRef v10 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"Bad limit (capacity ");
    v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  *((_DWORD *)self + 3) = a3;
  if (*((_DWORD *)self + 5) > a3) {
    *((_DWORD *)self + 5) = a3;
  }
  int v8 = *((_DWORD *)self + 4);
  if (v8 != -1 && v8 > a3) {
    *((_DWORD *)self + 4) = -1;
  }
  return self;
}

- (id)mark
{
  *((_DWORD *)self + 4) = *((_DWORD *)self + 5);
  return self;
}

- (int)position
{
  return self->position_;
}

- (id)positionWithInt:(int)a3
{
  return self;
}

- (void)positionImplWithInt:(int)a3
{
  if (a3 < 0 || self->limit_ < a3)
  {
    CFStringRef v10 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"Bad position (limit ");
    v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  self->position_ = a3;
  int mark = self->mark_;
  if (mark != -1 && mark > a3) {
    self->mark_ = -1;
  }
}

- (int)remaining
{
  return self->limit_ - self->position_;
}

- (id)reset
{
  int v2 = *((_DWORD *)self + 4);
  if (v2 == -1)
  {
    uint64_t v3 = new_JavaNioInvalidMarkException_initWithNSString_(@"Mark not set");
    objc_exception_throw(v3);
  }
  *((_DWORD *)self + 5) = v2;
  return self;
}

- (id)rewind
{
  *((void *)self + 2) = 0xFFFFFFFFLL;
  return self;
}

- (id)description
{
  id v2 = objc_msgSend(-[JavaNioBuffer getClass](self, "getClass"), "getName");
  return (id)JreStrcat("$$I$I$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (int)getElementSizeShift
{
  return self->_elementSizeShift_;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004823E8;
}

@end